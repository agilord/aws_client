// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// Welcome to the <i>End User Messaging SMS, version 2 API Reference</i>. This
/// guide provides information about End User Messaging SMS, version 2 API
/// resources, including supported HTTP methods, parameters, and schemas.
///
/// Amazon Pinpoint is an Amazon Web Services service that you can use to engage
/// with your recipients across multiple messaging channels. The End User
/// Messaging SMS, version 2 API provides programmatic access to options that
/// are unique to the SMS and voice channels. End User Messaging SMS, version 2
/// resources such as phone numbers, sender IDs, and opt-out lists can be used
/// by the Amazon Pinpoint API.
///
/// If you're new to End User Messaging SMS, it's also helpful to review the <a
/// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/what-is-service.html">
/// End User Messaging SMS User Guide</a>, where you'll find tutorials, code
/// samples, and procedures that demonstrate how to use End User Messaging SMS
/// features programmatically and how to integrate functionality into mobile
/// apps and other types of applications. The guide also provides key
/// information, such as End User Messaging SMS integration with other Amazon
/// Web Services services, and the quotas that apply to use of the service.
///
/// <b>Regional availability</b>
///
/// The <i>End User Messaging SMS version 2 API Reference</i> is available in
/// several Amazon Web Services Regions and it provides an endpoint for each of
/// these Regions. For a list of all the Regions and endpoints where the API is
/// currently available, see <a
/// href="https://docs.aws.amazon.com/hgeneral/latest/gr/rande.html#pinpoint_region">Amazon
/// Web Services Service Endpoints</a> and <a
/// href="https://docs.aws.amazon.com/general/latest/gr/pinpoint.html">Amazon
/// Pinpoint endpoints and quotas</a> in the Amazon Web Services General
/// Reference. To learn more about Amazon Web Services Regions, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/rande-manage.html">Managing
/// Amazon Web Services Regions</a> in the Amazon Web Services General
/// Reference.
///
/// In each Region, Amazon Web Services maintains multiple Availability Zones.
/// These Availability Zones are physically isolated from each other, but are
/// united by private, low-latency, high-throughput, and highly redundant
/// network connections. These Availability Zones enable us to provide very high
/// levels of availability and redundancy, while also minimizing latency. To
/// learn more about the number of Availability Zones that are available in each
/// Region, see <a
/// href="http://aws.amazon.com/about-aws/global-infrastructure/">Amazon Web
/// Services Global Infrastructure.</a>
class PinpointSmsVoiceV2 {
  final _s.JsonProtocol _protocol;
  PinpointSmsVoiceV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sms-voice',
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

  /// Associates the specified origination identity with a pool.
  ///
  /// If the origination identity is a phone number and is already associated
  /// with another pool, an error is returned. A sender ID can be associated
  /// with multiple pools.
  ///
  /// If the origination identity configuration doesn't match the pool's
  /// configuration, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use, such as PhoneNumberId, PhoneNumberArn,
  /// SenderId, or SenderIdArn. You can use <a>DescribePhoneNumbers</a> to find
  /// the values for PhoneNumberId and PhoneNumberArn, while
  /// <a>DescribeSenderIds</a> can be used to get the values for SenderId and
  /// SenderIdArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [poolId] :
  /// The pool to update with the new Identity. This value can be either the
  /// PoolId or PoolArn, and you can find these values using <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference_smsvoicev2/API_DescribePools.html">DescribePools</a>.
  /// <important>
  /// If you are using a shared End User Messaging SMS; resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [isoCountryCode] :
  /// The new two-character code, in ISO 3166-1 alpha-2 format, for the country
  /// or region of the origination identity. This field is optional and is not
  /// required for origination identity types that are not country-specific,
  /// such as RCS agents.
  Future<AssociateOriginationIdentityResult> associateOriginationIdentity({
    required String originationIdentity,
    required String poolId,
    String? clientToken,
    String? isoCountryCode,
  }) async {
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
        'OriginationIdentity': originationIdentity,
        'PoolId': poolId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      },
    );

    return AssociateOriginationIdentityResult.fromJson(jsonResponse.body);
  }

  /// Associate a protect configuration with a configuration set. This replaces
  /// the configuration sets current protect configuration. A configuration set
  /// can only be associated with one protect configuration at a time. A protect
  /// configuration can be associated with multiple configuration sets.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the ConfigurationSet.
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  Future<AssociateProtectConfigurationResult> associateProtectConfiguration({
    required String configurationSetName,
    required String protectConfigurationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.AssociateProtectConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
        'ProtectConfigurationId': protectConfigurationId,
      },
    );

    return AssociateProtectConfigurationResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a destination phone number, including whether
  /// the number type and whether it is valid, the carrier, and more.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [phoneNumber] :
  /// The phone number that you want to retrieve information about. You can
  /// provide the phone number in various formats including special characters
  /// such as parentheses, brackets, spaces, hyphens, periods, and commas. The
  /// service automatically converts the input to E164 format for processing.
  Future<CarrierLookupResult> carrierLookup({
    required String phoneNumber,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CarrierLookup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PhoneNumber': phoneNumber,
      },
    );

    return CarrierLookupResult.fromJson(jsonResponse.body);
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// event options are Amazon CloudWatch, Amazon Data Firehose, or Amazon SNS.
  /// For example, when a message is delivered successfully, you can send
  /// information about that event to an event destination, or send
  /// notifications to endpoints that are subscribed to an Amazon SNS topic.
  ///
  /// You can only create one event destination at a time. You must provide a
  /// value for a single event destination using either
  /// <code>CloudWatchLogsDestination</code>,
  /// <code>KinesisFirehoseDestination</code> or <code>SnsDestination</code>. If
  /// an event destination isn't provided then an exception is returned.
  ///
  /// Each configuration set can contain between 0 and 5 event destinations.
  /// Each event destination can contain a reference to a single destination,
  /// such as a CloudWatch or Firehose destination.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// used, then End User Messaging SMS logs every event type.
  /// <note>
  /// The <code>TEXT_SENT</code> event type is not supported.
  /// </note>
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [cloudWatchLogsDestination] :
  /// An object that contains information about an event destination for logging
  /// to Amazon CloudWatch Logs.
  ///
  /// Parameter [kinesisFirehoseDestination] :
  /// An object that contains information about an event destination for logging
  /// to Amazon Data Firehose.
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
        'MatchingEventTypes': matchingEventTypes.map((e) => e.value).toList(),
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

  /// Creates a new notify configuration for managed messaging. A notify
  /// configuration defines the settings for sending templated messages,
  /// including the display name, use case, enabled channels, and enabled
  /// countries.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [displayName] :
  /// The display name to associate with the notify configuration.
  ///
  /// Parameter [enabledChannels] :
  /// An array of channels to enable for the notify configuration. Supported
  /// values include <code>SMS</code> and <code>VOICE</code>.
  ///
  /// Parameter [useCase] :
  /// The use case for the notify configuration.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [defaultTemplateId] :
  /// The default template identifier to associate with the notify
  /// configuration. If specified, this template is used when sending messages
  /// without an explicit template identifier.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// By default this is set to false. When set to true the notify configuration
  /// can't be deleted. You can change this value using the
  /// <a>UpdateNotifyConfiguration</a> action.
  ///
  /// Parameter [enabledCountries] :
  /// An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format,
  /// that are enabled for the notify configuration.
  ///
  /// Parameter [poolId] :
  /// The identifier of the pool to associate with the notify configuration.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) associated with the notify
  /// configuration.
  Future<CreateNotifyConfigurationResult> createNotifyConfiguration({
    required String displayName,
    required List<NumberCapability> enabledChannels,
    required NotifyConfigurationUseCase useCase,
    String? clientToken,
    String? defaultTemplateId,
    bool? deletionProtectionEnabled,
    List<String>? enabledCountries,
    String? poolId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateNotifyConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DisplayName': displayName,
        'EnabledChannels': enabledChannels.map((e) => e.value).toList(),
        'UseCase': useCase.value,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (defaultTemplateId != null) 'DefaultTemplateId': defaultTemplateId,
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (enabledCountries != null) 'EnabledCountries': enabledCountries,
        if (poolId != null) 'PoolId': poolId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateNotifyConfigurationResult.fromJson(jsonResponse.body);
  }

  /// Creates a new opt-out list.
  ///
  /// If the opt-out list name already exists, an error is returned.
  ///
  /// An opt-out list is a list of phone numbers that are opted out, meaning you
  /// can't send SMS or voice messages to them. If end user replies with the
  /// keyword "STOP," an entry for the phone number is added to the opt-out
  /// list. In addition to STOP, your recipients can use any supported opt-out
  /// keyword, such as CANCEL or OPTOUT. For a list of supported opt-out
  /// keywords, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-manage.html#channels-sms-manage-optout">
  /// SMS opt out </a> in the End User Messaging SMS User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// with another pool, an error is returned. A sender ID can be associated
  /// with multiple pools.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [messageType] :
  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't
  /// critical or time-sensitive. After the pool is created the MessageType
  /// can't be changed.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// SenderId or SenderIdArn. You can use <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference_smsvoicev2/API_DescribePhoneNumbers.html">DescribePhoneNumbers</a>
  /// to find the values for PhoneNumberId and PhoneNumberArn, and use <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference_smsvoicev2/API_DescribeSenderIds.html">DescribeSenderIds</a>
  /// can be used to get the values for SenderId and SenderIdArn.
  ///
  /// After the pool is created you can add more origination identities to the
  /// pool by using <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference_smsvoicev2/API_AssociateOriginationIdentity.html">AssociateOriginationIdentity</a>.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// By default this is set to false. When set to true the pool can't be
  /// deleted. You can change this value using the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference_smsvoicev2/API_UpdatePool.html">UpdatePool</a>
  /// action.
  ///
  /// Parameter [isoCountryCode] :
  /// The new two-character code, in ISO 3166-1 alpha-2 format, for the country
  /// or region of the new pool. This field is optional and is not required for
  /// origination identity types that are not country-specific, such as RCS
  /// agents.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) associated with the pool.
  Future<CreatePoolResult> createPool({
    required MessageType messageType,
    required String originationIdentity,
    String? clientToken,
    bool? deletionProtectionEnabled,
    String? isoCountryCode,
    List<Tag>? tags,
  }) async {
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
        'MessageType': messageType.value,
        'OriginationIdentity': originationIdentity,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePoolResult.fromJson(jsonResponse.body);
  }

  /// Create a new protect configuration. By default all country rule sets for
  /// each capability are set to <code>ALLOW</code>. Update the country rule
  /// sets using <code>UpdateProtectConfigurationCountryRuleSet</code>. A
  /// protect configurations name is stored as a Tag with the key set to
  /// <code>Name</code> and value as the name of the protect configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  ///
  /// Parameter [tags] :
  /// An array of key and value pair tags that are associated with the resource.
  Future<CreateProtectConfigurationResult> createProtectConfiguration({
    String? clientToken,
    bool? deletionProtectionEnabled,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateProtectConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateProtectConfigurationResult.fromJson(jsonResponse.body);
  }

  /// Creates a new RCS agent for sending rich messages through the RCS channel.
  /// The RCS agent serves as an origination identity for sending RCS messages
  /// to your recipients.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// By default this is set to false. When set to true the RCS agent can't be
  /// deleted. You can change this value using the <a>UpdateRcsAgent</a> action.
  ///
  /// Parameter [optOutListName] :
  /// The OptOutList to associate with the RCS agent. Valid values are either
  /// OptOutListName or OptOutListArn.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) associated with the RCS agent.
  Future<CreateRcsAgentResult> createRcsAgent({
    String? clientToken,
    bool? deletionProtectionEnabled,
    String? optOutListName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateRcsAgent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (optOutListName != null) 'OptOutListName': optOutListName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRcsAgentResult.fromJson(jsonResponse.body);
  }

  /// Creates a new registration based on the <b>RegistrationType</b> field.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationType] :
  /// The type of registration form to create. The list of
  /// <b>RegistrationTypes</b> can be found using the
  /// <a>DescribeRegistrationTypeDefinitions</a> action.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) to associate with the registration.
  Future<CreateRegistrationResult> createRegistration({
    required String registrationType,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateRegistration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationType': registrationType,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRegistrationResult.fromJson(jsonResponse.body);
  }

  /// Associate the registration with an origination identity such as a phone
  /// number or sender ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  ///
  /// Parameter [resourceId] :
  /// The unique identifier for the origination identity. For example this could
  /// be a <b>PhoneNumberId</b> or <b>SenderId</b>.
  Future<CreateRegistrationAssociationResult> createRegistrationAssociation({
    required String registrationId,
    required String resourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateRegistrationAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationId': registrationId,
        'ResourceId': resourceId,
      },
    );

    return CreateRegistrationAssociationResult.fromJson(jsonResponse.body);
  }

  /// Create a new registration attachment to use for uploading a file or a URL
  /// to a file. The maximum file size is 500KB and valid file extensions are
  /// PDF, JPEG and PNG. For example, many sender ID registrations require a
  /// signed “letter of authorization” (LOA) to be submitted.
  ///
  /// Use either <code>AttachmentUrl</code> or <code>AttachmentBody</code> to
  /// upload your attachment. If both are specified then an exception is
  /// returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [attachmentBody] :
  /// The registration file to upload. The maximum file size is 500KB and valid
  /// file extensions are PDF, JPEG and PNG.
  ///
  /// Parameter [attachmentUrl] :
  /// Registration files have to be stored in an Amazon S3 bucket. The URI to
  /// use when sending is in the format <code>s3://BucketName/FileName</code>.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) to associate with the registration
  /// attachment.
  Future<CreateRegistrationAttachmentResult> createRegistrationAttachment({
    Uint8List? attachmentBody,
    String? attachmentUrl,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateRegistrationAttachment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (attachmentBody != null)
          'AttachmentBody': base64Encode(attachmentBody),
        if (attachmentUrl != null) 'AttachmentUrl': attachmentUrl,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRegistrationAttachmentResult.fromJson(jsonResponse.body);
  }

  /// Create a new version of the registration and increase the
  /// <b>VersionNumber</b>. The previous version of the registration becomes
  /// read-only.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  Future<CreateRegistrationVersionResult> createRegistrationVersion({
    required String registrationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateRegistrationVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationId': registrationId,
      },
    );

    return CreateRegistrationVersionResult.fromJson(jsonResponse.body);
  }

  /// You can only send messages to verified destination numbers when your
  /// account is in the sandbox. You can add up to 10 verified destination
  /// numbers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The verified destination phone number, in E.164 format.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [rcsAgentId] :
  /// The unique identifier of the RCS agent to associate with the verified
  /// destination number. You can use either the RcsAgentId or RcsAgentArn.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) to associate with the destination
  /// number.
  Future<CreateVerifiedDestinationNumberResult>
      createVerifiedDestinationNumber({
    required String destinationPhoneNumber,
    String? clientToken,
    String? rcsAgentId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateVerifiedDestinationNumber'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationPhoneNumber': destinationPhoneNumber,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (rcsAgentId != null) 'RcsAgentId': rcsAgentId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateVerifiedDestinationNumberResult.fromJson(jsonResponse.body);
  }

  /// Removes the current account default protect configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<DeleteAccountDefaultProtectConfigurationResult>
      deleteAccountDefaultProtectConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PinpointSMSVoiceV2.DeleteAccountDefaultProtectConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteAccountDefaultProtectConfigurationResult.fromJson(
        jsonResponse.body);
  }

  /// Deletes an existing configuration set.
  ///
  /// A configuration set is a set of rules that you apply to voice and SMS
  /// messages that you send. In a configuration set, you can specify a
  /// destination for specific types of events related to voice and SMS
  /// messages.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set or the configuration set ARN that you
  /// want to delete. The ConfigurationSetName and ConfigurationSetArn can be
  /// found using the <a>DescribeConfigurationSets</a> action.
  Future<DeleteConfigurationSetResult> deleteConfigurationSet({
    required String configurationSetName,
  }) async {
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set or the configuration set Amazon Resource
  /// Name (ARN) to delete the default message type from. The
  /// ConfigurationSetName and ConfigurationSetArn can be found using the
  /// <a>DescribeConfigurationSets</a> action.
  Future<DeleteDefaultMessageTypeResult> deleteDefaultMessageType({
    required String configurationSetName,
  }) async {
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set or the configuration set Amazon Resource
  /// Name (ARN) to delete the default sender ID from. The ConfigurationSetName
  /// and ConfigurationSetArn can be found using the
  /// <a>DescribeConfigurationSets</a> action.
  Future<DeleteDefaultSenderIdResult> deleteDefaultSenderId({
    required String configurationSetName,
  }) async {
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// keyword, End User Messaging SMS responds with a customizable message.
  ///
  /// Keywords "HELP" and "STOP" can't be deleted or modified.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyword] :
  /// The keyword to delete.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// PoolId or PoolArn. You can use <a>DescribePhoneNumbers</a> to find the
  /// values for PhoneNumberId and PhoneNumberArn and <a>DescribePools</a> to
  /// find the values of PoolId and PoolArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  Future<DeleteKeywordResult> deleteKeyword({
    required String keyword,
    required String originationIdentity,
  }) async {
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

  /// Deletes an account-level monthly spending limit override for sending
  /// multimedia messages (MMS). Deleting a spend limit override will set the
  /// <code>EnforcedLimit</code> to equal the <code>MaxLimit</code>, which is
  /// controlled by Amazon Web Services. For more information on spend limits
  /// (quotas) see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/quotas.html">Quotas
  /// for Server Migration Service</a> in the <i>Server Migration Service User
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<DeleteMediaMessageSpendLimitOverrideResult>
      deleteMediaMessageSpendLimitOverride() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteMediaMessageSpendLimitOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteMediaMessageSpendLimitOverrideResult.fromJson(
        jsonResponse.body);
  }

  /// Deletes an existing notify configuration.
  ///
  /// If deletion protection is enabled, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notifyConfigurationId] :
  /// The identifier of the notify configuration to delete. The
  /// NotifyConfigurationId can be found using the
  /// <a>DescribeNotifyConfigurations</a> operation.
  Future<DeleteNotifyConfigurationResult> deleteNotifyConfiguration({
    required String notifyConfigurationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteNotifyConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotifyConfigurationId': notifyConfigurationId,
      },
    );

    return DeleteNotifyConfigurationResult.fromJson(jsonResponse.body);
  }

  /// Deletes an account-level monthly spending limit override for sending
  /// notify messages. Deleting a spend limit override will set the
  /// <code>EnforcedLimit</code> to equal the <code>MaxLimit</code>, which is
  /// controlled by Amazon Web Services. For more information on spend limits
  /// (quotas) see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/quotas.html">Quotas
  /// </a> in the <i>End User Messaging SMS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<DeleteNotifyMessageSpendLimitOverrideResult>
      deleteNotifyMessageSpendLimitOverride() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteNotifyMessageSpendLimitOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteNotifyMessageSpendLimitOverrideResult.fromJson(
        jsonResponse.body);
  }

  /// Deletes an existing opted out destination phone number from the specified
  /// opt-out list.
  ///
  /// Each destination phone number can only be deleted once every 30 days.
  ///
  /// If the specified destination phone number doesn't exist or if the opt-out
  /// list doesn't exist, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [optOutListName] :
  /// The OptOutListName or OptOutListArn to remove the phone number from.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [optedOutNumber] :
  /// The phone number, in E.164 format, to remove from the OptOutList.
  Future<DeleteOptedOutNumberResult> deleteOptedOutNumber({
    required String optOutListName,
    required String optedOutNumber,
  }) async {
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

  /// Deletes an existing opt-out list. All opted out phone numbers in the
  /// opt-out list are deleted.
  ///
  /// If the specified opt-out list name doesn't exist or is in-use by an
  /// origination phone number or pool, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [optOutListName] :
  /// The OptOutListName or OptOutListArn of the OptOutList to delete. You can
  /// use <a>DescribeOptOutLists</a> to find the values for OptOutListName and
  /// OptOutListArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  Future<DeleteOptOutListResult> deleteOptOutList({
    required String optOutListName,
  }) async {
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

  /// Deletes an existing pool. Deleting a pool disassociates all origination
  /// identities from that pool.
  ///
  /// If the pool status isn't active or if deletion protection is enabled, an
  /// error is returned.
  ///
  /// A pool is a collection of phone numbers and SenderIds. A pool can include
  /// one or more phone numbers and SenderIds that are associated with your
  /// Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [poolId] :
  /// The PoolId or PoolArn of the pool to delete. You can use
  /// <a>DescribePools</a> to find the values for PoolId and PoolArn .
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  Future<DeletePoolResult> deletePool({
    required String poolId,
  }) async {
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

  /// Permanently delete the protect configuration. The protect configuration
  /// must have deletion protection disabled and must not be associated as the
  /// account default protect configuration or associated with a configuration
  /// set.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  Future<DeleteProtectConfigurationResult> deleteProtectConfiguration({
    required String protectConfigurationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteProtectConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProtectConfigurationId': protectConfigurationId,
      },
    );

    return DeleteProtectConfigurationResult.fromJson(jsonResponse.body);
  }

  /// Permanently delete the protect configuration rule set number override.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The destination phone number in E.164 format.
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  Future<DeleteProtectConfigurationRuleSetNumberOverrideResult>
      deleteProtectConfigurationRuleSetNumberOverride({
    required String destinationPhoneNumber,
    required String protectConfigurationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PinpointSMSVoiceV2.DeleteProtectConfigurationRuleSetNumberOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationPhoneNumber': destinationPhoneNumber,
        'ProtectConfigurationId': protectConfigurationId,
      },
    );

    return DeleteProtectConfigurationRuleSetNumberOverrideResult.fromJson(
        jsonResponse.body);
  }

  /// Deletes an existing RCS agent. If deletion protection is enabled, an error
  /// is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rcsAgentId] :
  /// The unique identifier of the RCS agent to delete. You can use either the
  /// RcsAgentId or RcsAgentArn.
  Future<DeleteRcsAgentResult> deleteRcsAgent({
    required String rcsAgentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteRcsAgent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RcsAgentId': rcsAgentId,
      },
    );

    return DeleteRcsAgentResult.fromJson(jsonResponse.body);
  }

  /// Permanently delete an existing registration from your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  Future<DeleteRegistrationResult> deleteRegistration({
    required String registrationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteRegistration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationId': registrationId,
      },
    );

    return DeleteRegistrationResult.fromJson(jsonResponse.body);
  }

  /// Permanently delete the specified registration attachment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationAttachmentId] :
  /// The unique identifier for the registration attachment.
  Future<DeleteRegistrationAttachmentResult> deleteRegistrationAttachment({
    required String registrationAttachmentId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteRegistrationAttachment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationAttachmentId': registrationAttachmentId,
      },
    );

    return DeleteRegistrationAttachmentResult.fromJson(jsonResponse.body);
  }

  /// Delete the value in a registration form field.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fieldPath] :
  /// The path to the registration form field. You can use
  /// <a>DescribeRegistrationFieldDefinitions</a> for a list of
  /// <b>FieldPaths</b>.
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  Future<DeleteRegistrationFieldValueResult> deleteRegistrationFieldValue({
    required String fieldPath,
    required String registrationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteRegistrationFieldValue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FieldPath': fieldPath,
        'RegistrationId': registrationId,
      },
    );

    return DeleteRegistrationFieldValueResult.fromJson(jsonResponse.body);
  }

  /// Deletes the resource-based policy document attached to the End User
  /// Messaging SMS resource. A shared resource can be a Pool, Opt-out list,
  /// Sender Id, or Phone number.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the End User Messaging SMS resource
  /// you're deleting the resource-based policy from.
  Future<DeleteResourcePolicyResult> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteResourcePolicy'
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

    return DeleteResourcePolicyResult.fromJson(jsonResponse.body);
  }

  /// Deletes an account-level monthly spending limit override for sending text
  /// messages. Deleting a spend limit override will set the
  /// <code>EnforcedLimit</code> to equal the <code>MaxLimit</code>, which is
  /// controlled by Amazon Web Services. For more information on spend limits
  /// (quotas) see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/quotas.html">Quotas
  /// </a> in the <i>End User Messaging SMS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Delete a verified destination phone number.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [verifiedDestinationNumberId] :
  /// The unique identifier for the verified destination phone number.
  Future<DeleteVerifiedDestinationNumberResult>
      deleteVerifiedDestinationNumber({
    required String verifiedDestinationNumberId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteVerifiedDestinationNumber'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VerifiedDestinationNumberId': verifiedDestinationNumberId,
      },
    );

    return DeleteVerifiedDestinationNumberResult.fromJson(jsonResponse.body);
  }

  /// Deletes an account level monthly spend limit override for sending voice
  /// messages. Deleting a spend limit override sets the
  /// <code>EnforcedLimit</code> equal to the <code>MaxLimit</code>, which is
  /// controlled by Amazon Web Services. For more information on spending limits
  /// (quotas) see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/quotas.html">Quotas
  /// </a> in the <i>End User Messaging SMS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// New accounts are placed into an SMS or voice sandbox. The sandbox protects
  /// both Amazon Web Services end recipients and SMS or voice recipients from
  /// fraud and abuse.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Describes the current End User Messaging SMS SMS Voice V2 resource quotas
  /// for your account. The description for a quota includes the quota name,
  /// current usage toward that quota, and the quota's maximum value.
  ///
  /// When you establish an Amazon Web Services account, the account has initial
  /// quotas on the maximum number of configuration sets, opt-out lists, phone
  /// numbers, and pools that you can create in a given Region. For more
  /// information see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/quotas.html">Quotas
  /// </a> in the <i>End User Messaging SMS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// keyword, End User Messaging SMS responds with a customizable message.
  ///
  /// If you specify a keyword that isn't valid, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// SenderId or SenderIdArn. You can use <a>DescribePhoneNumbers</a> to find
  /// the values for PhoneNumberId and PhoneNumberArn while
  /// <a>DescribeSenderIds</a> can be used to get the values for SenderId and
  /// SenderIdArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
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

  /// Describes the specified notify configurations or all notify configurations
  /// in your account.
  ///
  /// If you specify notify configuration IDs, the output includes information
  /// for only the specified notify configurations. If you specify filters, the
  /// output includes information for only those notify configurations that meet
  /// the filter criteria. If you don't specify notify configuration IDs or
  /// filters, the output includes information for all notify configurations.
  ///
  /// If you specify a notify configuration ID that isn't valid, an error is
  /// returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// An array of NotifyConfigurationFilter objects to filter the results on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [notifyConfigurationIds] :
  /// An array of notify configuration IDs to describe.
  Future<DescribeNotifyConfigurationsResult> describeNotifyConfigurations({
    List<NotifyConfigurationFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? notifyConfigurationIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeNotifyConfigurations'
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
        if (notifyConfigurationIds != null)
          'NotifyConfigurationIds': notifyConfigurationIds,
      },
    );

    return DescribeNotifyConfigurationsResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified notify templates or all notify templates in your
  /// account.
  ///
  /// If you specify template IDs, the output includes information for only the
  /// specified notify templates. If you specify filters, the output includes
  /// information for only those notify templates that meet the filter criteria.
  /// If you don't specify template IDs or filters, the output includes
  /// information for all notify templates.
  ///
  /// If you specify a template ID that isn't valid, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// An array of NotifyTemplateFilter objects to filter the results on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [templateIds] :
  /// An array of template IDs to describe.
  Future<DescribeNotifyTemplatesResult> describeNotifyTemplates({
    List<NotifyTemplateFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? templateIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeNotifyTemplates'
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
        if (templateIds != null) 'TemplateIds': templateIds,
      },
    );

    return DescribeNotifyTemplatesResult.fromJson(jsonResponse.body);
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
  /// If you specify an opted out number that isn't valid, an exception is
  /// returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [optOutListName] :
  /// The OptOutListName or OptOutListArn of the OptOutList. You can use
  /// <a>DescribeOptOutLists</a> to find the values for OptOutListName and
  /// OptOutListArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
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
  ///
  /// If you specify an opted out number that isn't valid, an exception is
  /// returned.
  Future<DescribeOptedOutNumbersResult> describeOptedOutNumbers({
    required String optOutListName,
    List<OptedOutFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? optedOutNumbers,
  }) async {
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

  /// Describes the specified opt-out list or all opt-out lists in your account.
  ///
  /// If you specify opt-out list names, the output includes information for
  /// only the specified opt-out lists. Opt-out lists include only those that
  /// meet the filter criteria. If you don't specify opt-out list names or
  /// filters, the output includes information for all opt-out lists.
  ///
  /// If you specify an opt-out list name that isn't valid, an error is
  /// returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [owner] :
  /// Use <code>SELF</code> to filter the list of Opt-Out List to ones your
  /// account owns or use <code>SHARED</code> to filter on Opt-Out List shared
  /// with your account. The <code>Owner</code> and <code>OptOutListNames</code>
  /// parameters can't be used at the same time.
  Future<DescribeOptOutListsResult> describeOptOutLists({
    int? maxResults,
    String? nextToken,
    List<String>? optOutListNames,
    Owner? owner,
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
        if (owner != null) 'Owner': owner.value,
      },
    );

    return DescribeOptOutListsResult.fromJson(jsonResponse.body);
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
  /// If you specify a phone number ID that isn't valid, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [owner] :
  /// Use <code>SELF</code> to filter the list of phone numbers to ones your
  /// account owns or use <code>SHARED</code> to filter on phone numbers shared
  /// with your account. The <code>Owner</code> and <code>PhoneNumberIds</code>
  /// parameters can't be used at the same time.
  ///
  /// Parameter [phoneNumberIds] :
  /// The unique identifier of phone numbers to find information about. This is
  /// an array of strings that can be either the PhoneNumberId or
  /// PhoneNumberArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  Future<DescribePhoneNumbersResult> describePhoneNumbers({
    List<PhoneNumberFilter>? filters,
    int? maxResults,
    String? nextToken,
    Owner? owner,
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
        if (owner != null) 'Owner': owner.value,
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
  /// If you specify a pool ID that isn't valid, an error is returned.
  ///
  /// A pool is a collection of phone numbers and SenderIds. A pool can include
  /// one or more phone numbers and SenderIds that are associated with your
  /// Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [owner] :
  /// Use <code>SELF</code> to filter the list of Pools to ones your account
  /// owns or use <code>SHARED</code> to filter on Pools shared with your
  /// account. The <code>Owner</code> and <code>PoolIds</code> parameters can't
  /// be used at the same time.
  ///
  /// Parameter [poolIds] :
  /// The unique identifier of pools to find. This is an array of strings that
  /// can be either the PoolId or PoolArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  Future<DescribePoolsResult> describePools({
    List<PoolFilter>? filters,
    int? maxResults,
    String? nextToken,
    Owner? owner,
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
        if (owner != null) 'Owner': owner.value,
        if (poolIds != null) 'PoolIds': poolIds,
      },
    );

    return DescribePoolsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the protect configurations that match any of filters. If a
  /// filter isn’t provided then all protect configurations are returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// An array of ProtectConfigurationFilter objects to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [protectConfigurationIds] :
  /// An array of protect configuration identifiers to search for.
  Future<DescribeProtectConfigurationsResult> describeProtectConfigurations({
    List<ProtectConfigurationFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? protectConfigurationIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeProtectConfigurations'
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
        if (protectConfigurationIds != null)
          'ProtectConfigurationIds': protectConfigurationIds,
      },
    );

    return DescribeProtectConfigurationsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the per-country launch status of an RCS agent, including
  /// carrier-level details for each country.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rcsAgentId] :
  /// The unique identifier of the RCS agent. You can use either the RcsAgentId
  /// or RcsAgentArn.
  ///
  /// Parameter [filters] :
  /// An array of CountryLaunchStatusFilter objects to filter the results.
  ///
  /// Parameter [isoCountryCodes] :
  /// An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format,
  /// to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  Future<DescribeRcsAgentCountryLaunchStatusResult>
      describeRcsAgentCountryLaunchStatus({
    required String rcsAgentId,
    List<CountryLaunchStatusFilter>? filters,
    List<String>? isoCountryCodes,
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
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeRcsAgentCountryLaunchStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RcsAgentId': rcsAgentId,
        if (filters != null) 'Filters': filters,
        if (isoCountryCodes != null) 'IsoCountryCodes': isoCountryCodes,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeRcsAgentCountryLaunchStatusResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the specified RCS agents or all RCS agents associated with your
  /// Amazon Web Services account.
  ///
  /// If you specify RCS agent IDs, the output includes information for only the
  /// specified RCS agents. If you specify filters, the output includes
  /// information for only those RCS agents that meet the filter criteria. If
  /// you don't specify RCS agent IDs or filters, the output includes
  /// information for all RCS agents.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// An array of RcsAgentFilter objects to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [owner] :
  /// Use <code>SELF</code> to filter the list of RCS agents to ones your
  /// account owns or use <code>SHARED</code> to filter on RCS agents shared
  /// with your account. The <code>Owner</code> and <code>RcsAgentIds</code>
  /// parameters can't be used at the same time.
  ///
  /// Parameter [rcsAgentIds] :
  /// An array of unique identifiers for the RCS agents. This is an array of
  /// strings that can be either the RcsAgentId or RcsAgentArn.
  Future<DescribeRcsAgentsResult> describeRcsAgents({
    List<RcsAgentFilter>? filters,
    int? maxResults,
    String? nextToken,
    Owner? owner,
    List<String>? rcsAgentIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeRcsAgents'
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
        if (owner != null) 'Owner': owner.value,
        if (rcsAgentIds != null) 'RcsAgentIds': rcsAgentIds,
      },
    );

    return DescribeRcsAgentsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified registration attachments or all registration
  /// attachments associated with your Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// An array of RegistrationAttachmentFilter objects to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [registrationAttachmentIds] :
  /// The unique identifier of registration attachments to find. This is an
  /// array of <b>RegistrationAttachmentId</b>.
  Future<DescribeRegistrationAttachmentsResult>
      describeRegistrationAttachments({
    List<RegistrationAttachmentFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? registrationAttachmentIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeRegistrationAttachments'
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
        if (registrationAttachmentIds != null)
          'RegistrationAttachmentIds': registrationAttachmentIds,
      },
    );

    return DescribeRegistrationAttachmentsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified registration type field definitions. You can use
  /// DescribeRegistrationFieldDefinitions to view the requirements for
  /// creating, filling out, and submitting each registration type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationType] :
  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  ///
  /// Parameter [fieldPaths] :
  /// An array of paths to the registration form field.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [sectionPath] :
  /// The path to the section of the registration.
  Future<DescribeRegistrationFieldDefinitionsResult>
      describeRegistrationFieldDefinitions({
    required String registrationType,
    List<String>? fieldPaths,
    int? maxResults,
    String? nextToken,
    String? sectionPath,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeRegistrationFieldDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationType': registrationType,
        if (fieldPaths != null) 'FieldPaths': fieldPaths,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sectionPath != null) 'SectionPath': sectionPath,
      },
    );

    return DescribeRegistrationFieldDefinitionsResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the specified registration field values.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  ///
  /// Parameter [fieldPaths] :
  /// An array of paths to the registration form field.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [sectionPath] :
  /// The path to the section of the registration.
  ///
  /// Parameter [versionNumber] :
  /// The version number of the registration.
  Future<DescribeRegistrationFieldValuesResult>
      describeRegistrationFieldValues({
    required String registrationId,
    List<String>? fieldPaths,
    int? maxResults,
    String? nextToken,
    String? sectionPath,
    int? versionNumber,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateNumRange(
      'versionNumber',
      versionNumber,
      1,
      100000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeRegistrationFieldValues'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationId': registrationId,
        if (fieldPaths != null) 'FieldPaths': fieldPaths,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sectionPath != null) 'SectionPath': sectionPath,
        if (versionNumber != null) 'VersionNumber': versionNumber,
      },
    );

    return DescribeRegistrationFieldValuesResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified registrations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// An array of RegistrationFilter objects to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [registrationIds] :
  /// An array of unique identifiers for each registration.
  Future<DescribeRegistrationsResult> describeRegistrations({
    List<RegistrationFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? registrationIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeRegistrations'
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
        if (registrationIds != null) 'RegistrationIds': registrationIds,
      },
    );

    return DescribeRegistrationsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified registration section definitions. You can use
  /// DescribeRegistrationSectionDefinitions to view the requirements for
  /// creating, filling out, and submitting each registration type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationType] :
  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [sectionPaths] :
  /// An array of paths for the registration form section.
  Future<DescribeRegistrationSectionDefinitionsResult>
      describeRegistrationSectionDefinitions({
    required String registrationType,
    int? maxResults,
    String? nextToken,
    List<String>? sectionPaths,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PinpointSMSVoiceV2.DescribeRegistrationSectionDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationType': registrationType,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (sectionPaths != null) 'SectionPaths': sectionPaths,
      },
    );

    return DescribeRegistrationSectionDefinitionsResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the specified registration type definitions. You can use
  /// DescribeRegistrationTypeDefinitions to view the requirements for creating,
  /// filling out, and submitting each registration type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// An array of RegistrationFilter objects to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [registrationTypes] :
  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  Future<DescribeRegistrationTypeDefinitionsResult>
      describeRegistrationTypeDefinitions({
    List<RegistrationTypeFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? registrationTypes,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeRegistrationTypeDefinitions'
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
        if (registrationTypes != null) 'RegistrationTypes': registrationTypes,
      },
    );

    return DescribeRegistrationTypeDefinitionsResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the specified registration version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  ///
  /// Parameter [filters] :
  /// An array of RegistrationVersionFilter objects to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [versionNumbers] :
  /// An array of registration version numbers.
  Future<DescribeRegistrationVersionsResult> describeRegistrationVersions({
    required String registrationId,
    List<RegistrationVersionFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<int>? versionNumbers,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeRegistrationVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationId': registrationId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (versionNumbers != null) 'VersionNumbers': versionNumbers,
      },
    );

    return DescribeRegistrationVersionsResult.fromJson(jsonResponse.body);
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
  /// f you specify a sender ID that isn't valid, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [owner] :
  /// Use <code>SELF</code> to filter the list of Sender Ids to ones your
  /// account owns or use <code>SHARED</code> to filter on Sender Ids shared
  /// with your account. The <code>Owner</code> and <code>SenderIds</code>
  /// parameters can't be used at the same time.
  ///
  /// Parameter [senderIds] :
  /// An array of SenderIdAndCountry objects to search for.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  Future<DescribeSenderIdsResult> describeSenderIds({
    List<SenderIdFilter>? filters,
    int? maxResults,
    String? nextToken,
    Owner? owner,
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
        if (owner != null) 'Owner': owner.value,
        if (senderIds != null) 'SenderIds': senderIds,
      },
    );

    return DescribeSenderIdsResult.fromJson(jsonResponse.body);
  }

  /// Describes the current monthly spend limits for sending voice and text
  /// messages.
  ///
  /// When you establish an Amazon Web Services account, the account has initial
  /// monthly spend limit in a given Region. For more information on increasing
  /// your monthly spend limit, see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/awssupport-spend-threshold.html">
  /// Requesting increases to your monthly SMS, MMS, or Voice spending quota
  /// </a> in the <i>End User Messaging SMS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Retrieves the specified verified destination numbers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationPhoneNumbers] :
  /// An array of verified destination phone number, in E.164 format.
  ///
  /// Parameter [filters] :
  /// An array of VerifiedDestinationNumberFilter objects to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [verifiedDestinationNumberIds] :
  /// An array of VerifiedDestinationNumberid to retrieve.
  Future<DescribeVerifiedDestinationNumbersResult>
      describeVerifiedDestinationNumbers({
    List<String>? destinationPhoneNumbers,
    List<VerifiedDestinationNumberFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? verifiedDestinationNumberIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeVerifiedDestinationNumbers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (destinationPhoneNumbers != null)
          'DestinationPhoneNumbers': destinationPhoneNumbers,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (verifiedDestinationNumberIds != null)
          'VerifiedDestinationNumberIds': verifiedDestinationNumberIds,
      },
    );

    return DescribeVerifiedDestinationNumbersResult.fromJson(jsonResponse.body);
  }

  /// Removes the specified origination identity from an existing pool.
  ///
  /// If the origination identity isn't associated with the specified pool, an
  /// error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// SenderId or SenderIdArn. You can use <a>DescribePhoneNumbers</a> find the
  /// values for PhoneNumberId and PhoneNumberArn, or use
  /// <a>DescribeSenderIds</a> to get the values for SenderId and SenderIdArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [poolId] :
  /// The unique identifier for the pool to disassociate with the origination
  /// identity. This value can be either the PoolId or PoolArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure the idempotency of
  /// the request. If you don't specify a client token, a randomly generated
  /// token is used for the request to ensure idempotency.
  ///
  /// Parameter [isoCountryCode] :
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region. This field is optional and is not required for origination
  /// identity types that are not country-specific, such as RCS agents.
  Future<DisassociateOriginationIdentityResult>
      disassociateOriginationIdentity({
    required String originationIdentity,
    required String poolId,
    String? clientToken,
    String? isoCountryCode,
  }) async {
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
        'OriginationIdentity': originationIdentity,
        'PoolId': poolId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      },
    );

    return DisassociateOriginationIdentityResult.fromJson(jsonResponse.body);
  }

  /// Disassociate a protect configuration from a configuration set.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the ConfigurationSet.
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  Future<DisassociateProtectConfigurationResult>
      disassociateProtectConfiguration({
    required String configurationSetName,
    required String protectConfigurationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DisassociateProtectConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
        'ProtectConfigurationId': protectConfigurationId,
      },
    );

    return DisassociateProtectConfigurationResult.fromJson(jsonResponse.body);
  }

  /// Discard the current version of the registration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  Future<DiscardRegistrationVersionResult> discardRegistrationVersion({
    required String registrationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DiscardRegistrationVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationId': registrationId,
      },
    );

    return DiscardRegistrationVersionResult.fromJson(jsonResponse.body);
  }

  /// Retrieve the CountryRuleSet for the specified NumberCapability from a
  /// protect configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [numberCapability] :
  /// The capability type to return the CountryRuleSet for. Valid values are
  /// <code>SMS</code>, <code>VOICE</code>, or <code>MMS</code>.
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  Future<GetProtectConfigurationCountryRuleSetResult>
      getProtectConfigurationCountryRuleSet({
    required NumberCapability numberCapability,
    required String protectConfigurationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.GetProtectConfigurationCountryRuleSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NumberCapability': numberCapability.value,
        'ProtectConfigurationId': protectConfigurationId,
      },
    );

    return GetProtectConfigurationCountryRuleSetResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the JSON text of the resource-based policy document attached to
  /// the End User Messaging SMS resource. A shared resource can be a Pool,
  /// Opt-out list, Sender Id, or Phone number.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the End User Messaging SMS resource
  /// attached to the resource-based policy.
  Future<GetResourcePolicyResult> getResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.GetResourcePolicy'
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

    return GetResourcePolicyResult.fromJson(jsonResponse.body);
  }

  /// Lists countries that support notify messaging. You can optionally filter
  /// by channel, use case, or tier.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channels] :
  /// An array of channels to filter the results by.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [tier] :
  /// The tier to filter the results by.
  ///
  /// Parameter [useCases] :
  /// An array of use cases to filter the results by.
  Future<ListNotifyCountriesResult> listNotifyCountries({
    List<NumberCapability>? channels,
    int? maxResults,
    String? nextToken,
    NotifyConfigurationTier? tier,
    List<NotifyConfigurationUseCase>? useCases,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.ListNotifyCountries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (channels != null) 'Channels': channels.map((e) => e.value).toList(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (tier != null) 'Tier': tier.value,
        if (useCases != null) 'UseCases': useCases.map((e) => e.value).toList(),
      },
    );

    return ListNotifyCountriesResult.fromJson(jsonResponse.body);
  }

  /// Lists all associated origination identities in your pool.
  ///
  /// If you specify filters, the output includes information for only those
  /// origination identities that meet the filter criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [poolId] :
  /// The unique identifier for the pool. This value can be either the PoolId or
  /// PoolArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
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

  /// Retrieve all of the protect configuration rule set number overrides that
  /// match the filters.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  ///
  /// Parameter [filters] :
  /// An array of ProtectConfigurationRuleSetNumberOverrideFilterItem objects to
  /// filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  Future<ListProtectConfigurationRuleSetNumberOverridesResult>
      listProtectConfigurationRuleSetNumberOverrides({
    required String protectConfigurationId,
    List<ProtectConfigurationRuleSetNumberOverrideFilterItem>? filters,
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
      'X-Amz-Target':
          'PinpointSMSVoiceV2.ListProtectConfigurationRuleSetNumberOverrides'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProtectConfigurationId': protectConfigurationId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListProtectConfigurationRuleSetNumberOverridesResult.fromJson(
        jsonResponse.body);
  }

  /// Retrieve all of the origination identities that are associated with a
  /// registration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  ///
  /// Parameter [filters] :
  /// An array of RegistrationAssociationFilter to apply to the results that are
  /// returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  Future<ListRegistrationAssociationsResult> listRegistrationAssociations({
    required String registrationId,
    List<RegistrationAssociationFilter>? filters,
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
      'X-Amz-Target': 'PinpointSMSVoiceV2.ListRegistrationAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationId': registrationId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListRegistrationAssociationsResult.fromJson(jsonResponse.body);
  }

  /// List all tags associated with a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to query for.
  Future<ListTagsForResourceResult> listTagsForResource({
    required String resourceArn,
  }) async {
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
  /// keyword, End User Messaging SMS responds with a customizable message.
  ///
  /// If you specify a keyword that isn't valid, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyword] :
  /// The new keyword to add.
  ///
  /// Parameter [keywordMessage] :
  /// The message associated with the keyword.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// SenderId or SenderIdArn. You can use <a>DescribePhoneNumbers</a> get the
  /// values for PhoneNumberId and PhoneNumberArn while <a>DescribeSenderIds</a>
  /// can be used to get the values for SenderId and SenderIdArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [keywordAction] :
  /// The action to perform for the new keyword when it is received.
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
  Future<PutKeywordResult> putKeyword({
    required String keyword,
    required String keywordMessage,
    required String originationIdentity,
    KeywordAction? keywordAction,
  }) async {
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
        if (keywordAction != null) 'KeywordAction': keywordAction.value,
      },
    );

    return PutKeywordResult.fromJson(jsonResponse.body);
  }

  /// Set the MessageFeedbackStatus as <code>RECEIVED</code> or
  /// <code>FAILED</code> for the passed in MessageId.
  ///
  /// If you use message feedback then you must update message feedback record.
  /// When you receive a signal that a user has received the message you must
  /// use <code>PutMessageFeedback</code> to set the message feedback record as
  /// <code>RECEIVED</code>; Otherwise, an hour after the message feedback
  /// record is set to <code>FAILED</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [messageFeedbackStatus] :
  /// Set the message feedback to be either <code>RECEIVED</code> or
  /// <code>FAILED</code>.
  ///
  /// Parameter [messageId] :
  /// The unique identifier for the message.
  Future<PutMessageFeedbackResult> putMessageFeedback({
    required MessageFeedbackStatus messageFeedbackStatus,
    required String messageId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.PutMessageFeedback'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MessageFeedbackStatus': messageFeedbackStatus.value,
        'MessageId': messageId,
      },
    );

    return PutMessageFeedbackResult.fromJson(jsonResponse.body);
  }

  /// Creates an opted out destination phone number in the opt-out list.
  ///
  /// If the destination phone number isn't valid or if the specified opt-out
  /// list doesn't exist, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [optOutListName] :
  /// The OptOutListName or OptOutListArn to add the phone number to.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [optedOutNumber] :
  /// The phone number to add to the OptOutList in E.164 format.
  Future<PutOptedOutNumberResult> putOptedOutNumber({
    required String optOutListName,
    required String optedOutNumber,
  }) async {
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

  /// Create or update a phone number rule override and associate it with a
  /// protect configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The action for the rule to either block or allow messages to the
  /// destination phone number.
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The destination phone number in E.164 format.
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [expirationTimestamp] :
  /// The time the rule will expire at. If <code>ExpirationTimestamp</code> is
  /// not set then the rule does not expire.
  Future<PutProtectConfigurationRuleSetNumberOverrideResult>
      putProtectConfigurationRuleSetNumberOverride({
    required ProtectConfigurationRuleOverrideAction action,
    required String destinationPhoneNumber,
    required String protectConfigurationId,
    String? clientToken,
    DateTime? expirationTimestamp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PinpointSMSVoiceV2.PutProtectConfigurationRuleSetNumberOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Action': action.value,
        'DestinationPhoneNumber': destinationPhoneNumber,
        'ProtectConfigurationId': protectConfigurationId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (expirationTimestamp != null)
          'ExpirationTimestamp': unixTimestampToJson(expirationTimestamp),
      },
    );

    return PutProtectConfigurationRuleSetNumberOverrideResult.fromJson(
        jsonResponse.body);
  }

  /// Creates or updates a field value for a registration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fieldPath] :
  /// The path to the registration form field. You can use
  /// <a>DescribeRegistrationFieldDefinitions</a> for a list of
  /// <b>FieldPaths</b>.
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  ///
  /// Parameter [registrationAttachmentId] :
  /// The unique identifier for the registration attachment.
  ///
  /// Parameter [selectChoices] :
  /// An array of values for the form field.
  ///
  /// Parameter [textValue] :
  /// The text data for a free form field.
  Future<PutRegistrationFieldValueResult> putRegistrationFieldValue({
    required String fieldPath,
    required String registrationId,
    String? registrationAttachmentId,
    List<String>? selectChoices,
    String? textValue,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.PutRegistrationFieldValue'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FieldPath': fieldPath,
        'RegistrationId': registrationId,
        if (registrationAttachmentId != null)
          'RegistrationAttachmentId': registrationAttachmentId,
        if (selectChoices != null) 'SelectChoices': selectChoices,
        if (textValue != null) 'TextValue': textValue,
      },
    );

    return PutRegistrationFieldValueResult.fromJson(jsonResponse.body);
  }

  /// Attaches a resource-based policy to a End User Messaging SMS
  /// resource(phone number, sender Id, phone poll, or opt-out list) that is
  /// used for sharing the resource. A shared resource can be a Pool, Opt-out
  /// list, Sender Id, or Phone number. For more information about
  /// resource-based policies, see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/shared-resources.html">Working
  /// with shared resources</a> in the <i>End User Messaging SMS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policy] :
  /// The JSON formatted resource-based policy to attach.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the End User Messaging SMS resource to
  /// attach the resource-based policy to.
  Future<PutResourcePolicyResult> putResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Policy': policy,
        'ResourceArn': resourceArn,
      },
    );

    return PutResourcePolicyResult.fromJson(jsonResponse.body);
  }

  /// Releases an existing origination phone number in your account. Once
  /// released, a phone number is no longer available for sending messages.
  ///
  /// If the origination phone number has deletion protection enabled or is
  /// associated with a pool, an error is returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [phoneNumberId] :
  /// The PhoneNumberId or PhoneNumberArn of the phone number to release. You
  /// can use <a>DescribePhoneNumbers</a> to get the values for PhoneNumberId
  /// and PhoneNumberArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  Future<ReleasePhoneNumberResult> releasePhoneNumber({
    required String phoneNumberId,
  }) async {
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

  /// Releases an existing sender ID in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [isoCountryCode] :
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  ///
  /// Parameter [senderId] :
  /// The sender ID to release.
  Future<ReleaseSenderIdResult> releaseSenderId({
    required String isoCountryCode,
    required String senderId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.ReleaseSenderId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IsoCountryCode': isoCountryCode,
        'SenderId': senderId,
      },
    );

    return ReleaseSenderIdResult.fromJson(jsonResponse.body);
  }

  /// Request an origination phone number for use in your account. For more
  /// information on phone number request see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-request.html">Request
  /// a phone number</a> in the <i>End User Messaging SMS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [isoCountryCode] :
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  ///
  /// Parameter [messageType] :
  /// The type of message. Valid values are <code>TRANSACTIONAL</code> for
  /// messages that are critical or time-sensitive and <code>PROMOTIONAL</code>
  /// for messages that aren't critical or time-sensitive.
  ///
  /// Parameter [numberCapabilities] :
  /// Indicates if the phone number will be used for text messages, voice
  /// messages, or both.
  ///
  /// Parameter [numberType] :
  /// The type of phone number to request.
  ///
  /// When you request a <code>SIMULATOR</code> phone number, you must set
  /// <b>MessageType</b> as <code>TRANSACTIONAL</code>.
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
  /// Parameter [internationalSendingEnabled] :
  /// By default this is set to false. When set to true the international
  /// sending of phone number is Enabled.
  ///
  /// Parameter [optOutListName] :
  /// The name of the OptOutList to associate with the phone number. You can use
  /// the OptOutListName or OptOutListArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [poolId] :
  /// The pool to associated with the phone number. You can use the PoolId or
  /// PoolArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [registrationId] :
  /// Use this field to attach your phone number for an external registration
  /// process.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) to associate with the requested
  /// phone number.
  Future<RequestPhoneNumberResult> requestPhoneNumber({
    required String isoCountryCode,
    required MessageType messageType,
    required List<NumberCapability> numberCapabilities,
    required RequestableNumberType numberType,
    String? clientToken,
    bool? deletionProtectionEnabled,
    bool? internationalSendingEnabled,
    String? optOutListName,
    String? poolId,
    String? registrationId,
    List<Tag>? tags,
  }) async {
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
        'MessageType': messageType.value,
        'NumberCapabilities': numberCapabilities.map((e) => e.value).toList(),
        'NumberType': numberType.value,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (internationalSendingEnabled != null)
          'InternationalSendingEnabled': internationalSendingEnabled,
        if (optOutListName != null) 'OptOutListName': optOutListName,
        if (poolId != null) 'PoolId': poolId,
        if (registrationId != null) 'RegistrationId': registrationId,
        if (tags != null) 'Tags': tags,
      },
    );

    return RequestPhoneNumberResult.fromJson(jsonResponse.body);
  }

  /// Request a new sender ID that doesn't require registration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [isoCountryCode] :
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  ///
  /// Parameter [senderId] :
  /// The sender ID string to request.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// By default this is set to false. When set to true the sender ID can't be
  /// deleted.
  ///
  /// Parameter [messageTypes] :
  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't
  /// critical or time-sensitive.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) to associate with the sender ID.
  Future<RequestSenderIdResult> requestSenderId({
    required String isoCountryCode,
    required String senderId,
    String? clientToken,
    bool? deletionProtectionEnabled,
    List<MessageType>? messageTypes,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.RequestSenderId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IsoCountryCode': isoCountryCode,
        'SenderId': senderId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (messageTypes != null)
          'MessageTypes': messageTypes.map((e) => e.value).toList(),
        if (tags != null) 'Tags': tags,
      },
    );

    return RequestSenderIdResult.fromJson(jsonResponse.body);
  }

  /// Before you can send test messages to a verified destination phone number
  /// you need to opt-in the verified destination phone number. Creates a new
  /// text message with a verification code and send it to a verified
  /// destination phone number. Once you have the verification code use
  /// <a>VerifyDestinationNumber</a> to opt-in the verified destination phone
  /// number to receive messages.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [verificationChannel] :
  /// Choose to send the verification code as an SMS or voice message.
  ///
  /// Parameter [verifiedDestinationNumberId] :
  /// The unique identifier for the verified destination phone number.
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
  /// Parameter [languageCode] :
  /// Choose the language to use for the message.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity of the message. This can be either the
  /// PhoneNumber, PhoneNumberId, PhoneNumberArn, SenderId, SenderIdArn, PoolId,
  /// or PoolArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  Future<SendDestinationNumberVerificationCodeResult>
      sendDestinationNumberVerificationCode({
    required VerificationChannel verificationChannel,
    required String verifiedDestinationNumberId,
    String? configurationSetName,
    Map<String, String>? context,
    Map<DestinationCountryParameterKey, String>? destinationCountryParameters,
    LanguageCode? languageCode,
    String? originationIdentity,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SendDestinationNumberVerificationCode'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VerificationChannel': verificationChannel.value,
        'VerifiedDestinationNumberId': verifiedDestinationNumberId,
        if (configurationSetName != null)
          'ConfigurationSetName': configurationSetName,
        if (context != null) 'Context': context,
        if (destinationCountryParameters != null)
          'DestinationCountryParameters':
              destinationCountryParameters.map((k, e) => MapEntry(k.value, e)),
        if (languageCode != null) 'LanguageCode': languageCode.value,
        if (originationIdentity != null)
          'OriginationIdentity': originationIdentity,
      },
    );

    return SendDestinationNumberVerificationCodeResult.fromJson(
        jsonResponse.body);
  }

  /// Creates a new multimedia message (MMS) and sends it to a recipient's phone
  /// number.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The destination phone number in E.164 format.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity of the message. This can be either the
  /// PhoneNumber, PhoneNumberId, PhoneNumberArn, SenderId, SenderIdArn, PoolId,
  /// or PoolArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
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
  /// Parameter [maxPrice] :
  /// The maximum amount that you want to spend, in US dollars, per each MMS
  /// message.
  ///
  /// Parameter [mediaUrls] :
  /// An array of URLs to each media file to send.
  ///
  /// The media files have to be stored in an S3 bucket. Supported media file
  /// formats are listed in <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/mms-limitations-character.html">MMS
  /// file types, size and character limits</a>. For more information on
  /// creating an S3 bucket and managing objects, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-bucket-overview.html">Creating
  /// a bucket</a>, <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/upload-objects.html">Uploading
  /// objects</a> in the <i>Amazon S3 User Guide</i>, and <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/send-mms-message.html#send-mms-message-bucket">Setting
  /// up an Amazon S3 bucket for MMS files</a> in the <i>Amazon Web Services End
  /// User Messaging SMS User Guide</i>.
  ///
  /// Parameter [messageBody] :
  /// The text body of the message.
  ///
  /// Parameter [messageFeedbackEnabled] :
  /// Set to true to enable message feedback for the message. When a user
  /// receives the message you need to update the message status using
  /// <a>PutMessageFeedback</a>.
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier of the protect configuration to use.
  ///
  /// Parameter [timeToLive] :
  /// How long the media message is valid for. By default this is 72 hours.
  Future<SendMediaMessageResult> sendMediaMessage({
    required String destinationPhoneNumber,
    required String originationIdentity,
    String? configurationSetName,
    Map<String, String>? context,
    bool? dryRun,
    String? maxPrice,
    List<String>? mediaUrls,
    String? messageBody,
    bool? messageFeedbackEnabled,
    String? protectConfigurationId,
    int? timeToLive,
  }) async {
    _s.validateNumRange(
      'timeToLive',
      timeToLive,
      5,
      259200,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SendMediaMessage'
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
        if (maxPrice != null) 'MaxPrice': maxPrice,
        if (mediaUrls != null) 'MediaUrls': mediaUrls,
        if (messageBody != null) 'MessageBody': messageBody,
        if (messageFeedbackEnabled != null)
          'MessageFeedbackEnabled': messageFeedbackEnabled,
        if (protectConfigurationId != null)
          'ProtectConfigurationId': protectConfigurationId,
        if (timeToLive != null) 'TimeToLive': timeToLive,
      },
    );

    return SendMediaMessageResult.fromJson(jsonResponse.body);
  }

  /// Sends a templated text message through a notify configuration to a
  /// recipient's phone number.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The destination phone number in E.164 format.
  ///
  /// Parameter [notifyConfigurationId] :
  /// The unique identifier of the notify configuration to use for sending the
  /// message. This can be either the NotifyConfigurationId or
  /// NotifyConfigurationArn.
  ///
  /// Parameter [templateVariables] :
  /// A map of template variable names and their values. All variable values are
  /// passed as strings regardless of the declared variable type. For example,
  /// pass <code>INTEGER</code> values as <code>"42"</code> and
  /// <code>BOOLEAN</code> values as <code>"true"</code> or
  /// <code>"false"</code>.
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
  /// Parameter [messageFeedbackEnabled] :
  /// Set to true to enable message feedback for the message. When a user
  /// receives the message you need to update the message status using
  /// <a>PutMessageFeedback</a>.
  ///
  /// Parameter [templateId] :
  /// The unique identifier of the template to use for the message.
  ///
  /// Parameter [timeToLive] :
  /// How long the text message is valid for, in seconds. By default this is 72
  /// hours.
  Future<SendNotifyTextMessageResult> sendNotifyTextMessage({
    required String destinationPhoneNumber,
    required String notifyConfigurationId,
    required Map<String, String> templateVariables,
    String? configurationSetName,
    Map<String, String>? context,
    bool? dryRun,
    bool? messageFeedbackEnabled,
    String? templateId,
    int? timeToLive,
  }) async {
    _s.validateNumRange(
      'timeToLive',
      timeToLive,
      5,
      259200,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SendNotifyTextMessage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationPhoneNumber': destinationPhoneNumber,
        'NotifyConfigurationId': notifyConfigurationId,
        'TemplateVariables': templateVariables,
        if (configurationSetName != null)
          'ConfigurationSetName': configurationSetName,
        if (context != null) 'Context': context,
        if (dryRun != null) 'DryRun': dryRun,
        if (messageFeedbackEnabled != null)
          'MessageFeedbackEnabled': messageFeedbackEnabled,
        if (templateId != null) 'TemplateId': templateId,
        if (timeToLive != null) 'TimeToLive': timeToLive,
      },
    );

    return SendNotifyTextMessageResult.fromJson(jsonResponse.body);
  }

  /// Sends a templated voice message through a notify configuration to a
  /// recipient's phone number.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The destination phone number in E.164 format.
  ///
  /// Parameter [notifyConfigurationId] :
  /// The unique identifier of the notify configuration to use for sending the
  /// message. This can be either the NotifyConfigurationId or
  /// NotifyConfigurationArn.
  ///
  /// Parameter [templateVariables] :
  /// A map of template variable names and their values. All variable values are
  /// passed as strings regardless of the declared variable type. For example,
  /// pass <code>INTEGER</code> values as <code>"42"</code> and
  /// <code>BOOLEAN</code> values as <code>"true"</code> or
  /// <code>"false"</code>.
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
  /// Parameter [messageFeedbackEnabled] :
  /// Set to true to enable message feedback for the message. When a user
  /// receives the message you need to update the message status using
  /// <a>PutMessageFeedback</a>.
  ///
  /// Parameter [templateId] :
  /// The unique identifier of the template to use for the message.
  ///
  /// Parameter [timeToLive] :
  /// How long the voice message is valid for, in seconds. By default this is 72
  /// hours.
  ///
  /// Parameter [voiceId] :
  /// The voice ID to use for the voice message.
  Future<SendNotifyVoiceMessageResult> sendNotifyVoiceMessage({
    required String destinationPhoneNumber,
    required String notifyConfigurationId,
    required Map<String, String> templateVariables,
    String? configurationSetName,
    Map<String, String>? context,
    bool? dryRun,
    bool? messageFeedbackEnabled,
    String? templateId,
    int? timeToLive,
    VoiceId? voiceId,
  }) async {
    _s.validateNumRange(
      'timeToLive',
      timeToLive,
      5,
      259200,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SendNotifyVoiceMessage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationPhoneNumber': destinationPhoneNumber,
        'NotifyConfigurationId': notifyConfigurationId,
        'TemplateVariables': templateVariables,
        if (configurationSetName != null)
          'ConfigurationSetName': configurationSetName,
        if (context != null) 'Context': context,
        if (dryRun != null) 'DryRun': dryRun,
        if (messageFeedbackEnabled != null)
          'MessageFeedbackEnabled': messageFeedbackEnabled,
        if (templateId != null) 'TemplateId': templateId,
        if (timeToLive != null) 'TimeToLive': timeToLive,
        if (voiceId != null) 'VoiceId': voiceId.value,
      },
    );

    return SendNotifyVoiceMessageResult.fromJson(jsonResponse.body);
  }

  /// Creates a new text message and sends it to a recipient's phone number.
  /// SendTextMessage only sends an SMS message to one recipient each time it is
  /// invoked.
  ///
  /// SMS throughput limits are measured in Message Parts per Second (MPS). Your
  /// MPS limit depends on the destination country of your messages, as well as
  /// the type of phone number (origination number) that you use to send the
  /// message. For more information about MPS, see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/sms-limitations-mps.html">Message
  /// Parts per Second (MPS) limits</a> in the <i>End User Messaging SMS User
  /// Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// <ul>
  /// <li>
  /// <code>IN_ENTITY_ID</code> The entity ID or Principal Entity (PE) ID that
  /// you received after completing the sender ID registration process.
  /// </li>
  /// <li>
  /// <code>IN_TEMPLATE_ID</code> The template ID that you received after
  /// completing the sender ID registration process.
  /// <important>
  /// Make sure that the Template ID that you specify matches your message
  /// template exactly. If your message doesn't match the template that you
  /// provided during the registration process, the mobile carriers might reject
  /// your message.
  /// </important> </li>
  /// </ul>
  ///
  /// Parameter [dryRun] :
  /// When set to true, the message is checked and validated, but isn't sent to
  /// the end recipient. You are not charged for using <code>DryRun</code>.
  ///
  /// The Message Parts per Second (MPS) limit when using <code>DryRun</code> is
  /// five. If your origination identity has a lower MPS limit then the lower
  /// MPS limit is used. For more information about MPS limits, see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/sms-limitations-mps.html">Message
  /// Parts per Second (MPS) limits</a> in the <i>End User Messaging SMS User
  /// Guide</i>..
  ///
  /// Parameter [keyword] :
  /// When you register a short code in the US, you must specify a program name.
  /// If you don’t have a US short code, omit this attribute.
  ///
  /// Parameter [maxPrice] :
  /// The maximum amount that you want to spend, in US dollars, per each text
  /// message. If the calculated amount to send the text message is greater than
  /// <code>MaxPrice</code>, the message is not sent and an error is returned.
  ///
  /// Parameter [messageBody] :
  /// The body of the text message.
  ///
  /// Parameter [messageFeedbackEnabled] :
  /// Set to true to enable message feedback for the message. When a user
  /// receives the message you need to update the message status using
  /// <a>PutMessageFeedback</a>.
  ///
  /// Parameter [messageType] :
  /// The type of message. Valid values are for messages that are critical or
  /// time-sensitive and PROMOTIONAL for messages that aren't critical or
  /// time-sensitive.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity of the message. This can be either the
  /// PhoneNumber, PhoneNumberId, PhoneNumberArn, SenderId, SenderIdArn, PoolId,
  /// or PoolArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  ///
  /// Parameter [timeToLive] :
  /// How long the text message is valid for, in seconds. By default this is 72
  /// hours. If the messages isn't handed off before the TTL expires we stop
  /// attempting to hand off the message and return <code>TTL_EXPIRED</code>
  /// event.
  Future<SendTextMessageResult> sendTextMessage({
    required String destinationPhoneNumber,
    String? configurationSetName,
    Map<String, String>? context,
    Map<DestinationCountryParameterKey, String>? destinationCountryParameters,
    bool? dryRun,
    String? keyword,
    String? maxPrice,
    String? messageBody,
    bool? messageFeedbackEnabled,
    MessageType? messageType,
    String? originationIdentity,
    String? protectConfigurationId,
    int? timeToLive,
  }) async {
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
          'DestinationCountryParameters':
              destinationCountryParameters.map((k, e) => MapEntry(k.value, e)),
        if (dryRun != null) 'DryRun': dryRun,
        if (keyword != null) 'Keyword': keyword,
        if (maxPrice != null) 'MaxPrice': maxPrice,
        if (messageBody != null) 'MessageBody': messageBody,
        if (messageFeedbackEnabled != null)
          'MessageFeedbackEnabled': messageFeedbackEnabled,
        if (messageType != null) 'MessageType': messageType.value,
        if (originationIdentity != null)
          'OriginationIdentity': originationIdentity,
        if (protectConfigurationId != null)
          'ProtectConfigurationId': protectConfigurationId,
        if (timeToLive != null) 'TimeToLive': timeToLive,
      },
    );

    return SendTextMessageResult.fromJson(jsonResponse.body);
  }

  /// Allows you to send a request that sends a voice message. This operation
  /// uses <a href="http://aws.amazon.com/polly/">Amazon Polly</a> to convert a
  /// text script into a voice message.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The destination phone number in E.164 format.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use for the voice call. This can be the
  /// PhoneNumber, PhoneNumberId, PhoneNumberArn, PoolId, or PoolArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
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
  /// Parameter [messageFeedbackEnabled] :
  /// Set to true to enable message feedback for the message. When a user
  /// receives the message you need to update the message status using
  /// <a>PutMessageFeedback</a>.
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
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
    bool? messageFeedbackEnabled,
    String? protectConfigurationId,
    int? timeToLive,
    VoiceId? voiceId,
  }) async {
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
          'MessageBodyTextType': messageBodyTextType.value,
        if (messageFeedbackEnabled != null)
          'MessageFeedbackEnabled': messageFeedbackEnabled,
        if (protectConfigurationId != null)
          'ProtectConfigurationId': protectConfigurationId,
        if (timeToLive != null) 'TimeToLive': timeToLive,
        if (voiceId != null) 'VoiceId': voiceId.value,
      },
    );

    return SendVoiceMessageResult.fromJson(jsonResponse.body);
  }

  /// Set a protect configuration as your account default. You can only have one
  /// account default protect configuration at a time. The current account
  /// default protect configuration is replaced with the provided protect
  /// configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  Future<SetAccountDefaultProtectConfigurationResult>
      setAccountDefaultProtectConfiguration({
    required String protectConfigurationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SetAccountDefaultProtectConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProtectConfigurationId': protectConfigurationId,
      },
    );

    return SetAccountDefaultProtectConfigurationResult.fromJson(
        jsonResponse.body);
  }

  /// Sets a configuration set's default for message feedback.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to use. This can be either the
  /// ConfigurationSetName or ConfigurationSetArn.
  ///
  /// Parameter [messageFeedbackEnabled] :
  /// Set to true to enable message feedback.
  Future<SetDefaultMessageFeedbackEnabledResult>
      setDefaultMessageFeedbackEnabled({
    required String configurationSetName,
    required bool messageFeedbackEnabled,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SetDefaultMessageFeedbackEnabled'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
        'MessageFeedbackEnabled': messageFeedbackEnabled,
      },
    );

    return SetDefaultMessageFeedbackEnabledResult.fromJson(jsonResponse.body);
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
        'MessageType': messageType.value,
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Sets an account level monthly spend limit override for sending MMS
  /// messages. The requested spend limit must be less than or equal to the
  /// <code>MaxLimit</code>, which is set by Amazon Web Services.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monthlyLimit] :
  /// The new monthly limit to enforce on text messages.
  Future<SetMediaMessageSpendLimitOverrideResult>
      setMediaMessageSpendLimitOverride({
    required int monthlyLimit,
  }) async {
    _s.validateNumRange(
      'monthlyLimit',
      monthlyLimit,
      0,
      1000000000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SetMediaMessageSpendLimitOverride'
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

    return SetMediaMessageSpendLimitOverrideResult.fromJson(jsonResponse.body);
  }

  /// Sets an account level monthly spend limit override for sending notify
  /// messages. The requested spend limit must be less than or equal to the
  /// <code>MaxLimit</code>, which is set by Amazon Web Services.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monthlyLimit] :
  /// The new monthly limit to enforce on notify messages.
  Future<SetNotifyMessageSpendLimitOverrideResult>
      setNotifyMessageSpendLimitOverride({
    required int monthlyLimit,
  }) async {
    _s.validateNumRange(
      'monthlyLimit',
      monthlyLimit,
      0,
      1000000000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SetNotifyMessageSpendLimitOverride'
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

    return SetNotifyMessageSpendLimitOverrideResult.fromJson(jsonResponse.body);
  }

  /// Sets an account level monthly spend limit override for sending text
  /// messages. The requested spend limit must be less than or equal to the
  /// <code>MaxLimit</code>, which is set by Amazon Web Services.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monthlyLimit] :
  /// The new monthly limit to enforce on text messages.
  Future<SetTextMessageSpendLimitOverrideResult>
      setTextMessageSpendLimitOverride({
    required int monthlyLimit,
  }) async {
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monthlyLimit] :
  /// The new monthly limit to enforce on voice messages.
  Future<SetVoiceMessageSpendLimitOverrideResult>
      setVoiceMessageSpendLimitOverride({
    required int monthlyLimit,
  }) async {
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

  /// Submit the specified registration for review and approval.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  ///
  /// Parameter [awsReview] :
  /// Set to true to request AWS review of the registration. When enabled, AWS
  /// will perform additional validation and review of the registration
  /// submission before processing.
  Future<SubmitRegistrationVersionResult> submitRegistrationVersion({
    required String registrationId,
    bool? awsReview,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SubmitRegistrationVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RegistrationId': registrationId,
        if (awsReview != null) 'AwsReview': awsReview,
      },
    );

    return SubmitRegistrationVersionResult.fromJson(jsonResponse.body);
  }

  /// Adds or overwrites only the specified tags for the specified resource.
  /// When you specify an existing tag key, the value is overwritten with the
  /// new value. Each tag consists of a key and an optional value. Tag keys must
  /// be unique per resource. For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-tags.html">Tags
  /// </a> in the <i>End User Messaging SMS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Removes the association of the specified tags from a resource. For more
  /// information on tags see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-tags.html">Tags
  /// </a> in the <i>End User Messaging SMS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// update the IAM role ARN for CloudWatch Logs and Firehose. You can also
  /// enable or disable the event destination.
  ///
  /// You may want to update an event destination to change its matching event
  /// types or updating the destination resource ARN. You can't change an event
  /// destination's type between CloudWatch Logs, Firehose, and Amazon SNS.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// to Firehose.
  ///
  /// Parameter [matchingEventTypes] :
  /// An array of event types that determine which events to log.
  /// <note>
  /// The <code>TEXT_SENT</code> event type is not supported.
  /// </note>
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
          'MatchingEventTypes': matchingEventTypes.map((e) => e.value).toList(),
        if (snsDestination != null) 'SnsDestination': snsDestination,
      },
    );

    return UpdateEventDestinationResult.fromJson(jsonResponse.body);
  }

  /// Updates an existing notify configuration. You can update the default
  /// template, pool association, enabled channels, enabled countries, and
  /// deletion protection settings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [notifyConfigurationId] :
  /// The identifier of the notify configuration to update. The
  /// NotifyConfigurationId can be found using the
  /// <a>DescribeNotifyConfigurations</a> operation.
  ///
  /// Parameter [defaultTemplateId] :
  /// The template ID to set as the default, or the special value
  /// UNSET_DEFAULT_TEMPLATE to clear the current default template.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// When set to true the notify configuration can't be deleted.
  ///
  /// Parameter [enabledChannels] :
  /// An array of channels to enable for the notify configuration. Supported
  /// values include <code>SMS</code> and <code>VOICE</code>.
  ///
  /// Parameter [enabledCountries] :
  /// An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format,
  /// that are enabled for the notify configuration.
  ///
  /// Parameter [poolId] :
  /// The pool ID or ARN to associate, or the special value
  /// UNSET_DEFAULT_POOL_FOR_NOTIFY to clear the current default pool.
  Future<UpdateNotifyConfigurationResult> updateNotifyConfiguration({
    required String notifyConfigurationId,
    String? defaultTemplateId,
    bool? deletionProtectionEnabled,
    List<NumberCapability>? enabledChannels,
    List<String>? enabledCountries,
    String? poolId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.UpdateNotifyConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotifyConfigurationId': notifyConfigurationId,
        if (defaultTemplateId != null) 'DefaultTemplateId': defaultTemplateId,
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (enabledChannels != null)
          'EnabledChannels': enabledChannels.map((e) => e.value).toList(),
        if (enabledCountries != null) 'EnabledCountries': enabledCountries,
        if (poolId != null) 'PoolId': poolId,
      },
    );

    return UpdateNotifyConfigurationResult.fromJson(jsonResponse.body);
  }

  /// Updates the configuration of an existing origination phone number. You can
  /// update the opt-out list, enable or disable two-way messaging, change the
  /// TwoWayChannelArn, enable or disable self-managed opt-outs, and enable or
  /// disable deletion protection.
  ///
  /// If the origination phone number is associated with a pool, an error is
  /// returned.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [phoneNumberId] :
  /// The unique identifier of the phone number. Valid values for this field can
  /// be either the PhoneNumberId or PhoneNumberArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// By default this is set to false. When set to true the phone number can't
  /// be deleted.
  ///
  /// Parameter [internationalSendingEnabled] :
  /// By default this is set to false. When set to true the international
  /// sending of phone number is Enabled.
  ///
  /// Parameter [optOutListName] :
  /// The OptOutList to add the phone number to. You can use either the opt out
  /// list name or the opt out list ARN.
  ///
  /// Parameter [selfManagedOptOutsEnabled] :
  /// By default this is set to false. When set to false and an end recipient
  /// sends a message that begins with HELP or STOP to one of your dedicated
  /// numbers, End User Messaging SMS automatically replies with a customizable
  /// message and adds the end recipient to the OptOutList. When set to true
  /// you're responsible for responding to HELP and STOP requests. You're also
  /// responsible for tracking and honoring opt-out requests.
  ///
  /// Parameter [twoWayChannelArn] :
  /// The Amazon Resource Name (ARN) of the two way channel.
  ///
  /// Parameter [twoWayChannelRole] :
  /// An optional IAM Role Arn for a service to assume, to be able to post
  /// inbound SMS messages.
  ///
  /// Parameter [twoWayEnabled] :
  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  Future<UpdatePhoneNumberResult> updatePhoneNumber({
    required String phoneNumberId,
    bool? deletionProtectionEnabled,
    bool? internationalSendingEnabled,
    String? optOutListName,
    bool? selfManagedOptOutsEnabled,
    String? twoWayChannelArn,
    String? twoWayChannelRole,
    bool? twoWayEnabled,
  }) async {
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
        if (internationalSendingEnabled != null)
          'InternationalSendingEnabled': internationalSendingEnabled,
        if (optOutListName != null) 'OptOutListName': optOutListName,
        if (selfManagedOptOutsEnabled != null)
          'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
        if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
        if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [poolId] :
  /// The unique identifier of the pool to update. Valid values are either the
  /// PoolId or PoolArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// When set to true the pool can't be deleted.
  ///
  /// Parameter [optOutListName] :
  /// The OptOutList to associate with the pool. Valid values are either
  /// OptOutListName or OptOutListArn.
  /// <important>
  /// If you are using a shared End User Messaging SMS resource then you must
  /// use the full Amazon Resource Name(ARN).
  /// </important>
  ///
  /// Parameter [selfManagedOptOutsEnabled] :
  /// By default this is set to false. When set to false and an end recipient
  /// sends a message that begins with HELP or STOP to one of your dedicated
  /// numbers, End User Messaging SMS automatically replies with a customizable
  /// message and adds the end recipient to the OptOutList. When set to true
  /// you're responsible for responding to HELP and STOP requests. You're also
  /// responsible for tracking and honoring opt-out requests.
  ///
  /// Parameter [sharedRoutesEnabled] :
  /// Indicates whether shared routes are enabled for the pool.
  ///
  /// Parameter [twoWayChannelArn] :
  /// The Amazon Resource Name (ARN) of the two way channel.
  ///
  /// Parameter [twoWayChannelRole] :
  /// An optional IAM Role Arn for a service to assume, to be able to post
  /// inbound SMS messages.
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
    String? twoWayChannelRole,
    bool? twoWayEnabled,
  }) async {
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
        if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
        if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
      },
    );

    return UpdatePoolResult.fromJson(jsonResponse.body);
  }

  /// Update the setting for an existing protect configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  Future<UpdateProtectConfigurationResult> updateProtectConfiguration({
    required String protectConfigurationId,
    bool? deletionProtectionEnabled,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.UpdateProtectConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProtectConfigurationId': protectConfigurationId,
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
      },
    );

    return UpdateProtectConfigurationResult.fromJson(jsonResponse.body);
  }

  /// Update a country rule set to <code>ALLOW</code>, <code>BLOCK</code>,
  /// <code>MONITOR</code>, or <code>FILTER</code> messages to be sent to the
  /// specified destination counties. You can update one or multiple countries
  /// at a time. The updates are only applied to the specified NumberCapability
  /// type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [countryRuleSetUpdates] :
  /// A map of ProtectConfigurationCountryRuleSetInformation objects that
  /// contain the details for the requested NumberCapability. The Key is the
  /// two-letter ISO country code. For a list of supported ISO country codes,
  /// see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-sms-by-country.html">Supported
  /// countries and regions (SMS channel)</a> in the End User Messaging SMS User
  /// Guide.
  ///
  /// For example, to set the United States as allowed and Canada as blocked,
  /// the <code>CountryRuleSetUpdates</code> would be formatted as:
  /// <code>"CountryRuleSetUpdates": { "US" : { "ProtectStatus": "ALLOW" } "CA"
  /// : { "ProtectStatus": "BLOCK" } }</code>
  ///
  /// Parameter [numberCapability] :
  /// The number capability to apply the CountryRuleSetUpdates updates to.
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
  Future<UpdateProtectConfigurationCountryRuleSetResult>
      updateProtectConfigurationCountryRuleSet({
    required Map<String, ProtectConfigurationCountryRuleSetInformation>
        countryRuleSetUpdates,
    required NumberCapability numberCapability,
    required String protectConfigurationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'PinpointSMSVoiceV2.UpdateProtectConfigurationCountryRuleSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CountryRuleSetUpdates': countryRuleSetUpdates,
        'NumberCapability': numberCapability.value,
        'ProtectConfigurationId': protectConfigurationId,
      },
    );

    return UpdateProtectConfigurationCountryRuleSetResult.fromJson(
        jsonResponse.body);
  }

  /// Updates the configuration of an existing RCS agent. You can update the
  /// opt-out list, deletion protection, two-way messaging settings, and
  /// self-managed opt-outs configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rcsAgentId] :
  /// The unique identifier of the RCS agent to update. You can use either the
  /// RcsAgentId or RcsAgentArn.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// By default this is set to false. When set to true the RCS agent can't be
  /// deleted.
  ///
  /// Parameter [optOutListName] :
  /// The OptOutList to associate with the RCS agent. Valid values are either
  /// OptOutListName or OptOutListArn.
  ///
  /// Parameter [selfManagedOptOutsEnabled] :
  /// By default this is set to false. When set to true you're responsible for
  /// responding to HELP and STOP requests. You're also responsible for tracking
  /// and honoring opt-out requests.
  ///
  /// Parameter [twoWayChannelArn] :
  /// The Amazon Resource Name (ARN) of the two way channel.
  ///
  /// Parameter [twoWayChannelRole] :
  /// An optional IAM Role Arn for a service to assume, to be able to post
  /// inbound SMS messages.
  ///
  /// Parameter [twoWayEnabled] :
  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  Future<UpdateRcsAgentResult> updateRcsAgent({
    required String rcsAgentId,
    bool? deletionProtectionEnabled,
    String? optOutListName,
    bool? selfManagedOptOutsEnabled,
    String? twoWayChannelArn,
    String? twoWayChannelRole,
    bool? twoWayEnabled,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.UpdateRcsAgent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RcsAgentId': rcsAgentId,
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (optOutListName != null) 'OptOutListName': optOutListName,
        if (selfManagedOptOutsEnabled != null)
          'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
        if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
        if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
        if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
      },
    );

    return UpdateRcsAgentResult.fromJson(jsonResponse.body);
  }

  /// Updates the configuration of an existing sender ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [isoCountryCode] :
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  ///
  /// Parameter [senderId] :
  /// The sender ID to update.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// By default this is set to false. When set to true the sender ID can't be
  /// deleted.
  Future<UpdateSenderIdResult> updateSenderId({
    required String isoCountryCode,
    required String senderId,
    bool? deletionProtectionEnabled,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.UpdateSenderId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IsoCountryCode': isoCountryCode,
        'SenderId': senderId,
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
      },
    );

    return UpdateSenderIdResult.fromJson(jsonResponse.body);
  }

  /// Use the verification code that was received by the verified destination
  /// phone number to opt-in the verified destination phone number to receive
  /// more messages.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [verificationCode] :
  /// The verification code that was received by the verified destination phone
  /// number.
  ///
  /// Parameter [verifiedDestinationNumberId] :
  /// The unique identifier for the verififed destination phone number.
  Future<VerifyDestinationNumberResult> verifyDestinationNumber({
    required String verificationCode,
    required String verifiedDestinationNumberId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.VerifyDestinationNumber'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VerificationCode': verificationCode,
        'VerifiedDestinationNumberId': verifiedDestinationNumberId,
      },
    );

    return VerifyDestinationNumberResult.fromJson(jsonResponse.body);
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

class AssociateProtectConfigurationResult {
  /// The Amazon Resource Name (ARN) of the configuration set.
  final String configurationSetArn;

  /// The name of the ConfigurationSet.
  final String configurationSetName;

  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  AssociateProtectConfigurationResult({
    required this.configurationSetArn,
    required this.configurationSetName,
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
  });

  factory AssociateProtectConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return AssociateProtectConfigurationResult(
      configurationSetArn: (json['ConfigurationSetArn'] as String?) ?? '',
      configurationSetName: (json['ConfigurationSetName'] as String?) ?? '',
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    return {
      'ConfigurationSetArn': configurationSetArn,
      'ConfigurationSetName': configurationSetName,
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
    };
  }
}

class CarrierLookupResult {
  /// The phone number in E164 format, sanitized from the original input by
  /// removing any formatting characters.
  final String e164PhoneNumber;

  /// Describes the type of phone number. Valid values are: MOBILE, LANDLINE,
  /// OTHER, and INVALID. Avoid sending SMS or voice messages to INVALID phone
  /// numbers, as these numbers are unlikely to belong to actual recipients.
  final PhoneNumberType phoneNumberType;

  /// The carrier or service provider that the phone number is currently
  /// registered with. In some countries and regions, this value may be the
  /// carrier or service provider that the phone number was originally registered
  /// with.
  final String? carrier;

  /// The name of the country or region for the phone number.
  final String? country;

  /// The country or region numeric dialing code for the phone number.
  final String? dialingCountryCode;

  /// The two-character country or region code, in ISO 3166-1 alpha-2 format, for
  /// the phone number.
  final String? isoCountryCode;

  /// The phone number's mobile country code, for mobile phone number types
  final String? mcc;

  /// The phone number's mobile network code, for mobile phone number types.
  final String? mnc;

  CarrierLookupResult({
    required this.e164PhoneNumber,
    required this.phoneNumberType,
    this.carrier,
    this.country,
    this.dialingCountryCode,
    this.isoCountryCode,
    this.mcc,
    this.mnc,
  });

  factory CarrierLookupResult.fromJson(Map<String, dynamic> json) {
    return CarrierLookupResult(
      e164PhoneNumber: (json['E164PhoneNumber'] as String?) ?? '',
      phoneNumberType: PhoneNumberType.fromString(
          (json['PhoneNumberType'] as String?) ?? ''),
      carrier: json['Carrier'] as String?,
      country: json['Country'] as String?,
      dialingCountryCode: json['DialingCountryCode'] as String?,
      isoCountryCode: json['IsoCountryCode'] as String?,
      mcc: json['MCC'] as String?,
      mnc: json['MNC'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final e164PhoneNumber = this.e164PhoneNumber;
    final phoneNumberType = this.phoneNumberType;
    final carrier = this.carrier;
    final country = this.country;
    final dialingCountryCode = this.dialingCountryCode;
    final isoCountryCode = this.isoCountryCode;
    final mcc = this.mcc;
    final mnc = this.mnc;
    return {
      'E164PhoneNumber': e164PhoneNumber,
      'PhoneNumberType': phoneNumberType.value,
      if (carrier != null) 'Carrier': carrier,
      if (country != null) 'Country': country,
      if (dialingCountryCode != null) 'DialingCountryCode': dialingCountryCode,
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (mcc != null) 'MCC': mcc,
      if (mnc != null) 'MNC': mnc,
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
          ?.nonNulls
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

class CreateNotifyConfigurationResult {
  /// The time when the notify configuration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  final bool deletionProtectionEnabled;

  /// The display name associated with the notify configuration.
  final String displayName;

  /// An array of channels enabled for the notify configuration. Supported values
  /// include <code>SMS</code> and <code>VOICE</code>.
  final List<NumberCapability> enabledChannels;

  /// The Amazon Resource Name (ARN) for the notify configuration.
  final String notifyConfigurationArn;

  /// The unique identifier for the notify configuration.
  final String notifyConfigurationId;

  /// The current status of the notify configuration.
  final NotifyConfigurationStatus status;

  /// The tier of the notify configuration.
  final NotifyConfigurationTier tier;

  /// The tier upgrade status of the notify configuration.
  final TierUpgradeStatus tierUpgradeStatus;

  /// The use case for the notify configuration.
  final NotifyConfigurationUseCase useCase;

  /// The default template identifier associated with the notify configuration.
  final String? defaultTemplateId;

  /// An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format,
  /// that are enabled for the notify configuration.
  final List<String>? enabledCountries;

  /// The identifier of the pool associated with the notify configuration.
  final String? poolId;

  /// The reason the notify configuration was rejected, if applicable.
  final String? rejectionReason;

  /// An array of tags (key and value pairs) associated with the notify
  /// configuration.
  final List<Tag>? tags;

  CreateNotifyConfigurationResult({
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.displayName,
    required this.enabledChannels,
    required this.notifyConfigurationArn,
    required this.notifyConfigurationId,
    required this.status,
    required this.tier,
    required this.tierUpgradeStatus,
    required this.useCase,
    this.defaultTemplateId,
    this.enabledCountries,
    this.poolId,
    this.rejectionReason,
    this.tags,
  });

  factory CreateNotifyConfigurationResult.fromJson(Map<String, dynamic> json) {
    return CreateNotifyConfigurationResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      displayName: (json['DisplayName'] as String?) ?? '',
      enabledChannels: ((json['EnabledChannels'] as List?) ?? const [])
          .nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      notifyConfigurationArn: (json['NotifyConfigurationArn'] as String?) ?? '',
      notifyConfigurationId: (json['NotifyConfigurationId'] as String?) ?? '',
      status: NotifyConfigurationStatus.fromString(
          (json['Status'] as String?) ?? ''),
      tier: NotifyConfigurationTier.fromString((json['Tier'] as String?) ?? ''),
      tierUpgradeStatus: TierUpgradeStatus.fromString(
          (json['TierUpgradeStatus'] as String?) ?? ''),
      useCase: NotifyConfigurationUseCase.fromString(
          (json['UseCase'] as String?) ?? ''),
      defaultTemplateId: json['DefaultTemplateId'] as String?,
      enabledCountries: (json['EnabledCountries'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      poolId: json['PoolId'] as String?,
      rejectionReason: json['RejectionReason'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final displayName = this.displayName;
    final enabledChannels = this.enabledChannels;
    final notifyConfigurationArn = this.notifyConfigurationArn;
    final notifyConfigurationId = this.notifyConfigurationId;
    final status = this.status;
    final tier = this.tier;
    final tierUpgradeStatus = this.tierUpgradeStatus;
    final useCase = this.useCase;
    final defaultTemplateId = this.defaultTemplateId;
    final enabledCountries = this.enabledCountries;
    final poolId = this.poolId;
    final rejectionReason = this.rejectionReason;
    final tags = this.tags;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'DisplayName': displayName,
      'EnabledChannels': enabledChannels.map((e) => e.value).toList(),
      'NotifyConfigurationArn': notifyConfigurationArn,
      'NotifyConfigurationId': notifyConfigurationId,
      'Status': status.value,
      'Tier': tier.value,
      'TierUpgradeStatus': tierUpgradeStatus.value,
      'UseCase': useCase.value,
      if (defaultTemplateId != null) 'DefaultTemplateId': defaultTemplateId,
      if (enabledCountries != null) 'EnabledCountries': enabledCountries,
      if (poolId != null) 'PoolId': poolId,
      if (rejectionReason != null) 'RejectionReason': rejectionReason,
      if (tags != null) 'Tags': tags,
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
          ?.nonNulls
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

  /// By default this is set to false. When set to false, and an end recipient
  /// sends a message that begins with HELP or STOP to one of your dedicated
  /// numbers, End User Messaging SMS automatically replies with a customizable
  /// message and adds the end recipient to the OptOutList. When set to true
  /// you're responsible for responding to HELP and STOP requests. You're also
  /// responsible for tracking and honoring opt-out requests.
  final bool? selfManagedOptOutsEnabled;

  /// Indicates whether shared routes are enabled for the pool. Set to false and
  /// only origination identities in this pool are used to send messages.
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

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

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
    this.twoWayChannelRole,
    this.twoWayEnabled,
  });

  factory CreatePoolResult.fromJson(Map<String, dynamic> json) {
    return CreatePoolResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool?,
      messageType:
          (json['MessageType'] as String?)?.let(MessageType.fromString),
      optOutListName: json['OptOutListName'] as String?,
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      sharedRoutesEnabled: json['SharedRoutesEnabled'] as bool?,
      status: (json['Status'] as String?)?.let(PoolStatus.fromString),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
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
    final twoWayChannelRole = this.twoWayChannelRole;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (deletionProtectionEnabled != null)
        'DeletionProtectionEnabled': deletionProtectionEnabled,
      if (messageType != null) 'MessageType': messageType.value,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (sharedRoutesEnabled != null)
        'SharedRoutesEnabled': sharedRoutesEnabled,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

class CreateProtectConfigurationResult {
  /// This is true if the protect configuration is set as your account default
  /// protect configuration.
  final bool accountDefault;

  /// The time when the protect configuration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  final bool deletionProtectionEnabled;

  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  /// An array of key and value pair tags that are associated with the resource.
  final List<Tag>? tags;

  CreateProtectConfigurationResult({
    required this.accountDefault,
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
    this.tags,
  });

  factory CreateProtectConfigurationResult.fromJson(Map<String, dynamic> json) {
    return CreateProtectConfigurationResult(
      accountDefault: (json['AccountDefault'] as bool?) ?? false,
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountDefault = this.accountDefault;
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    final tags = this.tags;
    return {
      'AccountDefault': accountDefault,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateRcsAgentResult {
  /// The time when the RCS agent was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  final bool deletionProtectionEnabled;

  /// The Amazon Resource Name (ARN) of the newly created RCS agent.
  final String rcsAgentArn;

  /// The unique identifier for the RCS agent.
  final String rcsAgentId;

  /// By default this is set to false. When set to true you're responsible for
  /// responding to HELP and STOP requests. You're also responsible for tracking
  /// and honoring opt-out requests.
  final bool selfManagedOptOutsEnabled;

  /// The current status of the RCS agent.
  final RcsAgentStatus status;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool twoWayEnabled;

  /// The name of the OptOutList associated with the RCS agent.
  final String? optOutListName;

  /// An array of tags (key and value pairs) associated with the RCS agent.
  final List<Tag>? tags;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

  CreateRcsAgentResult({
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.rcsAgentArn,
    required this.rcsAgentId,
    required this.selfManagedOptOutsEnabled,
    required this.status,
    required this.twoWayEnabled,
    this.optOutListName,
    this.tags,
    this.twoWayChannelArn,
    this.twoWayChannelRole,
  });

  factory CreateRcsAgentResult.fromJson(Map<String, dynamic> json) {
    return CreateRcsAgentResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      rcsAgentArn: (json['RcsAgentArn'] as String?) ?? '',
      rcsAgentId: (json['RcsAgentId'] as String?) ?? '',
      selfManagedOptOutsEnabled:
          (json['SelfManagedOptOutsEnabled'] as bool?) ?? false,
      status: RcsAgentStatus.fromString((json['Status'] as String?) ?? ''),
      twoWayEnabled: (json['TwoWayEnabled'] as bool?) ?? false,
      optOutListName: json['OptOutListName'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final rcsAgentArn = this.rcsAgentArn;
    final rcsAgentId = this.rcsAgentId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final twoWayEnabled = this.twoWayEnabled;
    final optOutListName = this.optOutListName;
    final tags = this.tags;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayChannelRole = this.twoWayChannelRole;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'RcsAgentArn': rcsAgentArn,
      'RcsAgentId': rcsAgentId,
      'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      'Status': status.value,
      'TwoWayEnabled': twoWayEnabled,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (tags != null) 'Tags': tags,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
    };
  }
}

class CreateRegistrationResult {
  /// The time when the registration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The current version number of the registration.
  final int currentVersionNumber;

  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The status of the registration.
  ///
  /// <ul>
  /// <li>
  /// <code>CLOSED</code>: The phone number or sender ID has been deleted and you
  /// must also delete the registration for the number.
  /// </li>
  /// <li>
  /// <code>CREATED</code>: Your registration is created but not submitted.
  /// </li>
  /// <li>
  /// <code>COMPLETE</code>: Your registration has been approved and your
  /// origination identity has been created.
  /// </li>
  /// <li>
  /// <code>DELETED</code>: The registration has been deleted.
  /// </li>
  /// <li>
  /// <code>PROVISIONING</code>: Your registration has been approved and your
  /// origination identity is being created.
  /// </li>
  /// <li>
  /// <code>REQUIRES_AUTHENTICATION</code>: You need to complete email
  /// authentication.
  /// </li>
  /// <li>
  /// <code>REQUIRES_UPDATES</code>: You must fix your registration and resubmit
  /// it.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted and is awaiting
  /// review.
  /// </li>
  /// </ul>
  final RegistrationStatus registrationStatus;

  /// The type of registration form to create. The list of
  /// <b>RegistrationTypes</b> can be found using the
  /// <a>DescribeRegistrationTypeDefinitions</a> action.
  final String registrationType;

  /// Metadata about a given registration which is specific to that registration
  /// type.
  final Map<String, String>? additionalAttributes;

  /// An array of tags (key and value pairs) to associate with the registration.
  final List<Tag>? tags;

  CreateRegistrationResult({
    required this.createdTimestamp,
    required this.currentVersionNumber,
    required this.registrationArn,
    required this.registrationId,
    required this.registrationStatus,
    required this.registrationType,
    this.additionalAttributes,
    this.tags,
  });

  factory CreateRegistrationResult.fromJson(Map<String, dynamic> json) {
    return CreateRegistrationResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      currentVersionNumber: (json['CurrentVersionNumber'] as int?) ?? 0,
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      registrationStatus: RegistrationStatus.fromString(
          (json['RegistrationStatus'] as String?) ?? ''),
      registrationType: (json['RegistrationType'] as String?) ?? '',
      additionalAttributes:
          (json['AdditionalAttributes'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final currentVersionNumber = this.currentVersionNumber;
    final registrationArn = this.registrationArn;
    final registrationId = this.registrationId;
    final registrationStatus = this.registrationStatus;
    final registrationType = this.registrationType;
    final additionalAttributes = this.additionalAttributes;
    final tags = this.tags;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'CurrentVersionNumber': currentVersionNumber,
      'RegistrationArn': registrationArn,
      'RegistrationId': registrationId,
      'RegistrationStatus': registrationStatus.value,
      'RegistrationType': registrationType,
      if (additionalAttributes != null)
        'AdditionalAttributes': additionalAttributes,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateRegistrationAssociationResult {
  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  final String registrationType;

  /// The Amazon Resource Name (ARN) of the origination identity that is
  /// associated with the registration.
  final String resourceArn;

  /// The unique identifier for the origination identity. For example this could
  /// be a <b>PhoneNumberId</b> or <b>SenderId</b>.
  final String resourceId;

  /// The registration type or origination identity type.
  final String resourceType;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  /// The phone number associated with the registration in E.164 format.
  final String? phoneNumber;

  CreateRegistrationAssociationResult({
    required this.registrationArn,
    required this.registrationId,
    required this.registrationType,
    required this.resourceArn,
    required this.resourceId,
    required this.resourceType,
    this.isoCountryCode,
    this.phoneNumber,
  });

  factory CreateRegistrationAssociationResult.fromJson(
      Map<String, dynamic> json) {
    return CreateRegistrationAssociationResult(
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      registrationType: (json['RegistrationType'] as String?) ?? '',
      resourceArn: (json['ResourceArn'] as String?) ?? '',
      resourceId: (json['ResourceId'] as String?) ?? '',
      resourceType: (json['ResourceType'] as String?) ?? '',
      isoCountryCode: json['IsoCountryCode'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationArn = this.registrationArn;
    final registrationId = this.registrationId;
    final registrationType = this.registrationType;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final isoCountryCode = this.isoCountryCode;
    final phoneNumber = this.phoneNumber;
    return {
      'RegistrationArn': registrationArn,
      'RegistrationId': registrationId,
      'RegistrationType': registrationType,
      'ResourceArn': resourceArn,
      'ResourceId': resourceId,
      'ResourceType': resourceType,
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

class CreateRegistrationAttachmentResult {
  /// The status of the registration attachment.
  ///
  /// <ul>
  /// <li>
  /// <code>UPLOAD_IN_PROGRESS</code> The attachment is being uploaded.
  /// </li>
  /// <li>
  /// <code>UPLOAD_COMPLETE</code> The attachment has been uploaded.
  /// </li>
  /// <li>
  /// <code>UPLOAD_FAILED</code> The attachment failed to uploaded.
  /// </li>
  /// <li>
  /// <code>DELETED</code> The attachment has been deleted..
  /// </li>
  /// </ul>
  final AttachmentStatus attachmentStatus;

  /// The time when the registration attachment was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The Amazon Resource Name (ARN) for the registration attachment.
  final String registrationAttachmentArn;

  /// The unique identifier for the registration attachment.
  final String registrationAttachmentId;

  /// An array of tags (key and value pairs) to associate with the registration
  /// attachment.
  final List<Tag>? tags;

  CreateRegistrationAttachmentResult({
    required this.attachmentStatus,
    required this.createdTimestamp,
    required this.registrationAttachmentArn,
    required this.registrationAttachmentId,
    this.tags,
  });

  factory CreateRegistrationAttachmentResult.fromJson(
      Map<String, dynamic> json) {
    return CreateRegistrationAttachmentResult(
      attachmentStatus: AttachmentStatus.fromString(
          (json['AttachmentStatus'] as String?) ?? ''),
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      registrationAttachmentArn:
          (json['RegistrationAttachmentArn'] as String?) ?? '',
      registrationAttachmentId:
          (json['RegistrationAttachmentId'] as String?) ?? '',
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentStatus = this.attachmentStatus;
    final createdTimestamp = this.createdTimestamp;
    final registrationAttachmentArn = this.registrationAttachmentArn;
    final registrationAttachmentId = this.registrationAttachmentId;
    final tags = this.tags;
    return {
      'AttachmentStatus': attachmentStatus.value,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'RegistrationAttachmentArn': registrationAttachmentArn,
      'RegistrationAttachmentId': registrationAttachmentId,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateRegistrationVersionResult {
  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The status of the registration.
  ///
  /// <ul>
  /// <li>
  /// <code>APPROVED</code>: Your registration has been approved.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code>: Your previously approved registration version moves
  /// into this status when a more recently submitted version is approved.
  /// </li>
  /// <li>
  /// <code>DENIED</code>: You must fix your registration and resubmit it.
  /// </li>
  /// <li>
  /// <code>DISCARDED</code>: You've abandon this version of their registration to
  /// start over with a new version.
  /// </li>
  /// <li>
  /// <code>DRAFT</code>: The initial status of a registration version after it’s
  /// created.
  /// </li>
  /// <li>
  /// <code>REQUIRES_AUTHENTICATION</code>: You need to complete email
  /// authentication.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>REVOKED</code>: Your previously approved registration has been
  /// revoked.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted.
  /// </li>
  /// </ul>
  final RegistrationVersionStatus registrationVersionStatus;

  /// A <b>RegistrationVersionStatusHistory</b> object that contains timestamps
  /// for the registration.
  final RegistrationVersionStatusHistory registrationVersionStatusHistory;

  /// The new version number of the registration.
  final int versionNumber;

  CreateRegistrationVersionResult({
    required this.registrationArn,
    required this.registrationId,
    required this.registrationVersionStatus,
    required this.registrationVersionStatusHistory,
    required this.versionNumber,
  });

  factory CreateRegistrationVersionResult.fromJson(Map<String, dynamic> json) {
    return CreateRegistrationVersionResult(
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      registrationVersionStatus: RegistrationVersionStatus.fromString(
          (json['RegistrationVersionStatus'] as String?) ?? ''),
      registrationVersionStatusHistory:
          RegistrationVersionStatusHistory.fromJson(
              (json['RegistrationVersionStatusHistory']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      versionNumber: (json['VersionNumber'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationArn = this.registrationArn;
    final registrationId = this.registrationId;
    final registrationVersionStatus = this.registrationVersionStatus;
    final registrationVersionStatusHistory =
        this.registrationVersionStatusHistory;
    final versionNumber = this.versionNumber;
    return {
      'RegistrationArn': registrationArn,
      'RegistrationId': registrationId,
      'RegistrationVersionStatus': registrationVersionStatus.value,
      'RegistrationVersionStatusHistory': registrationVersionStatusHistory,
      'VersionNumber': versionNumber,
    };
  }
}

class CreateVerifiedDestinationNumberResult {
  /// The time when the verified phone number was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The verified destination phone number, in E.164 format.
  final String destinationPhoneNumber;

  /// The status of the verified destination phone number.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The phone number hasn't been verified yet.
  /// </li>
  /// <li>
  /// <code>VERIFIED</code>: The phone number is verified and can receive
  /// messages.
  /// </li>
  /// </ul>
  final VerificationStatus status;

  /// The Amazon Resource Name (ARN) for the verified destination phone number.
  final String verifiedDestinationNumberArn;

  /// The unique identifier for the verified destination phone number.
  final String verifiedDestinationNumberId;

  /// The unique identifier of the RCS agent associated with the verified
  /// destination number.
  final String? rcsAgentId;

  /// An array of tags (key and value pairs) to associate with the destination
  /// number.
  final List<Tag>? tags;

  CreateVerifiedDestinationNumberResult({
    required this.createdTimestamp,
    required this.destinationPhoneNumber,
    required this.status,
    required this.verifiedDestinationNumberArn,
    required this.verifiedDestinationNumberId,
    this.rcsAgentId,
    this.tags,
  });

  factory CreateVerifiedDestinationNumberResult.fromJson(
      Map<String, dynamic> json) {
    return CreateVerifiedDestinationNumberResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      destinationPhoneNumber: (json['DestinationPhoneNumber'] as String?) ?? '',
      status: VerificationStatus.fromString((json['Status'] as String?) ?? ''),
      verifiedDestinationNumberArn:
          (json['VerifiedDestinationNumberArn'] as String?) ?? '',
      verifiedDestinationNumberId:
          (json['VerifiedDestinationNumberId'] as String?) ?? '',
      rcsAgentId: json['RcsAgentId'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final destinationPhoneNumber = this.destinationPhoneNumber;
    final status = this.status;
    final verifiedDestinationNumberArn = this.verifiedDestinationNumberArn;
    final verifiedDestinationNumberId = this.verifiedDestinationNumberId;
    final rcsAgentId = this.rcsAgentId;
    final tags = this.tags;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DestinationPhoneNumber': destinationPhoneNumber,
      'Status': status.value,
      'VerifiedDestinationNumberArn': verifiedDestinationNumberArn,
      'VerifiedDestinationNumberId': verifiedDestinationNumberId,
      if (rcsAgentId != null) 'RcsAgentId': rcsAgentId,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DeleteAccountDefaultProtectConfigurationResult {
  /// The Amazon Resource Name (ARN) of the account default protect configuration.
  final String defaultProtectConfigurationArn;

  /// The unique identifier of the account default protect configuration.
  final String defaultProtectConfigurationId;

  DeleteAccountDefaultProtectConfigurationResult({
    required this.defaultProtectConfigurationArn,
    required this.defaultProtectConfigurationId,
  });

  factory DeleteAccountDefaultProtectConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteAccountDefaultProtectConfigurationResult(
      defaultProtectConfigurationArn:
          (json['DefaultProtectConfigurationArn'] as String?) ?? '',
      defaultProtectConfigurationId:
          (json['DefaultProtectConfigurationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final defaultProtectConfigurationArn = this.defaultProtectConfigurationArn;
    final defaultProtectConfigurationId = this.defaultProtectConfigurationId;
    return {
      'DefaultProtectConfigurationArn': defaultProtectConfigurationArn,
      'DefaultProtectConfigurationId': defaultProtectConfigurationId,
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

  /// True if the configuration set has message feedback enabled. By default this
  /// is set to false.
  final bool? defaultMessageFeedbackEnabled;

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
    this.defaultMessageFeedbackEnabled,
    this.defaultMessageType,
    this.defaultSenderId,
    this.eventDestinations,
  });

  factory DeleteConfigurationSetResult.fromJson(Map<String, dynamic> json) {
    return DeleteConfigurationSetResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      defaultMessageFeedbackEnabled:
          json['DefaultMessageFeedbackEnabled'] as bool?,
      defaultMessageType:
          (json['DefaultMessageType'] as String?)?.let(MessageType.fromString),
      defaultSenderId: json['DefaultSenderId'] as String?,
      eventDestinations: (json['EventDestinations'] as List?)
          ?.nonNulls
          .map((e) => EventDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final createdTimestamp = this.createdTimestamp;
    final defaultMessageFeedbackEnabled = this.defaultMessageFeedbackEnabled;
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
      if (defaultMessageFeedbackEnabled != null)
        'DefaultMessageFeedbackEnabled': defaultMessageFeedbackEnabled,
      if (defaultMessageType != null)
        'DefaultMessageType': defaultMessageType.value,
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
      messageType:
          (json['MessageType'] as String?)?.let(MessageType.fromString),
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
      if (messageType != null) 'MessageType': messageType.value,
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
      keywordAction:
          (json['KeywordAction'] as String?)?.let(KeywordAction.fromString),
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
      if (keywordAction != null) 'KeywordAction': keywordAction.value,
      if (keywordMessage != null) 'KeywordMessage': keywordMessage,
      if (originationIdentity != null)
        'OriginationIdentity': originationIdentity,
      if (originationIdentityArn != null)
        'OriginationIdentityArn': originationIdentityArn,
    };
  }
}

class DeleteMediaMessageSpendLimitOverrideResult {
  /// The current monthly limit, in US dollars.
  final int? monthlyLimit;

  DeleteMediaMessageSpendLimitOverrideResult({
    this.monthlyLimit,
  });

  factory DeleteMediaMessageSpendLimitOverrideResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteMediaMessageSpendLimitOverrideResult(
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

class DeleteNotifyConfigurationResult {
  /// The time when the notify configuration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  final bool deletionProtectionEnabled;

  /// The display name associated with the notify configuration.
  final String displayName;

  /// An array of channels enabled for the notify configuration. Supported values
  /// include <code>SMS</code> and <code>VOICE</code>.
  final List<NumberCapability> enabledChannels;

  /// The Amazon Resource Name (ARN) for the notify configuration.
  final String notifyConfigurationArn;

  /// The unique identifier for the notify configuration.
  final String notifyConfigurationId;

  /// The current status of the notify configuration.
  final NotifyConfigurationStatus status;

  /// The tier of the notify configuration.
  final NotifyConfigurationTier tier;

  /// The tier upgrade status of the notify configuration.
  final TierUpgradeStatus tierUpgradeStatus;

  /// The use case for the notify configuration.
  final NotifyConfigurationUseCase useCase;

  /// The default template identifier associated with the notify configuration.
  final String? defaultTemplateId;

  /// An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format,
  /// that are enabled for the notify configuration.
  final List<String>? enabledCountries;

  /// The identifier of the pool associated with the notify configuration.
  final String? poolId;

  /// The reason the notify configuration was rejected, if applicable.
  final String? rejectionReason;

  DeleteNotifyConfigurationResult({
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.displayName,
    required this.enabledChannels,
    required this.notifyConfigurationArn,
    required this.notifyConfigurationId,
    required this.status,
    required this.tier,
    required this.tierUpgradeStatus,
    required this.useCase,
    this.defaultTemplateId,
    this.enabledCountries,
    this.poolId,
    this.rejectionReason,
  });

  factory DeleteNotifyConfigurationResult.fromJson(Map<String, dynamic> json) {
    return DeleteNotifyConfigurationResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      displayName: (json['DisplayName'] as String?) ?? '',
      enabledChannels: ((json['EnabledChannels'] as List?) ?? const [])
          .nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      notifyConfigurationArn: (json['NotifyConfigurationArn'] as String?) ?? '',
      notifyConfigurationId: (json['NotifyConfigurationId'] as String?) ?? '',
      status: NotifyConfigurationStatus.fromString(
          (json['Status'] as String?) ?? ''),
      tier: NotifyConfigurationTier.fromString((json['Tier'] as String?) ?? ''),
      tierUpgradeStatus: TierUpgradeStatus.fromString(
          (json['TierUpgradeStatus'] as String?) ?? ''),
      useCase: NotifyConfigurationUseCase.fromString(
          (json['UseCase'] as String?) ?? ''),
      defaultTemplateId: json['DefaultTemplateId'] as String?,
      enabledCountries: (json['EnabledCountries'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      poolId: json['PoolId'] as String?,
      rejectionReason: json['RejectionReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final displayName = this.displayName;
    final enabledChannels = this.enabledChannels;
    final notifyConfigurationArn = this.notifyConfigurationArn;
    final notifyConfigurationId = this.notifyConfigurationId;
    final status = this.status;
    final tier = this.tier;
    final tierUpgradeStatus = this.tierUpgradeStatus;
    final useCase = this.useCase;
    final defaultTemplateId = this.defaultTemplateId;
    final enabledCountries = this.enabledCountries;
    final poolId = this.poolId;
    final rejectionReason = this.rejectionReason;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'DisplayName': displayName,
      'EnabledChannels': enabledChannels.map((e) => e.value).toList(),
      'NotifyConfigurationArn': notifyConfigurationArn,
      'NotifyConfigurationId': notifyConfigurationId,
      'Status': status.value,
      'Tier': tier.value,
      'TierUpgradeStatus': tierUpgradeStatus.value,
      'UseCase': useCase.value,
      if (defaultTemplateId != null) 'DefaultTemplateId': defaultTemplateId,
      if (enabledCountries != null) 'EnabledCountries': enabledCountries,
      if (poolId != null) 'PoolId': poolId,
      if (rejectionReason != null) 'RejectionReason': rejectionReason,
    };
  }
}

class DeleteNotifyMessageSpendLimitOverrideResult {
  /// The current monthly limit, in US dollars.
  final int? monthlyLimit;

  DeleteNotifyMessageSpendLimitOverrideResult({
    this.monthlyLimit,
  });

  factory DeleteNotifyMessageSpendLimitOverrideResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteNotifyMessageSpendLimitOverrideResult(
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

  /// By default this is set to false. When set to false and an end recipient
  /// sends a message that begins with HELP or STOP to one of your dedicated
  /// numbers, End User Messaging SMS automatically replies with a customizable
  /// message and adds the end recipient to the OptOutList. When set to true
  /// you're responsible for responding to HELP and STOP requests. You're also
  /// responsible for tracking and honoring opt-out requests.
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

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

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
    this.twoWayChannelRole,
    this.twoWayEnabled,
  });

  factory DeletePoolResult.fromJson(Map<String, dynamic> json) {
    return DeletePoolResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      messageType:
          (json['MessageType'] as String?)?.let(MessageType.fromString),
      optOutListName: json['OptOutListName'] as String?,
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      sharedRoutesEnabled: json['SharedRoutesEnabled'] as bool?,
      status: (json['Status'] as String?)?.let(PoolStatus.fromString),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
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
    final twoWayChannelRole = this.twoWayChannelRole;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (messageType != null) 'MessageType': messageType.value,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (sharedRoutesEnabled != null)
        'SharedRoutesEnabled': sharedRoutesEnabled,
      if (status != null) 'Status': status.value,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

class DeleteProtectConfigurationResult {
  /// This is true if the protect configuration is set as your account default
  /// protect configuration.
  final bool accountDefault;

  /// The time when the protect configuration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The status of deletion protection for the protect configuration. When set to
  /// true deletion protection is enabled. By default this is set to false.
  final bool deletionProtectionEnabled;

  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  DeleteProtectConfigurationResult({
    required this.accountDefault,
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
  });

  factory DeleteProtectConfigurationResult.fromJson(Map<String, dynamic> json) {
    return DeleteProtectConfigurationResult(
      accountDefault: (json['AccountDefault'] as bool?) ?? false,
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountDefault = this.accountDefault;
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    return {
      'AccountDefault': accountDefault,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
    };
  }
}

class DeleteProtectConfigurationRuleSetNumberOverrideResult {
  /// The action associated with the rule.
  final ProtectConfigurationRuleOverrideAction action;

  /// The time when the rule was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The destination phone number in E.164 format.
  final String destinationPhoneNumber;

  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  /// The time when the resource-based policy was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? expirationTimestamp;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  DeleteProtectConfigurationRuleSetNumberOverrideResult({
    required this.action,
    required this.createdTimestamp,
    required this.destinationPhoneNumber,
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
    this.expirationTimestamp,
    this.isoCountryCode,
  });

  factory DeleteProtectConfigurationRuleSetNumberOverrideResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteProtectConfigurationRuleSetNumberOverrideResult(
      action: ProtectConfigurationRuleOverrideAction.fromString(
          (json['Action'] as String?) ?? ''),
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      destinationPhoneNumber: (json['DestinationPhoneNumber'] as String?) ?? '',
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
      expirationTimestamp: timeStampFromJson(json['ExpirationTimestamp']),
      isoCountryCode: json['IsoCountryCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdTimestamp = this.createdTimestamp;
    final destinationPhoneNumber = this.destinationPhoneNumber;
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    final expirationTimestamp = this.expirationTimestamp;
    final isoCountryCode = this.isoCountryCode;
    return {
      'Action': action.value,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DestinationPhoneNumber': destinationPhoneNumber,
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
      if (expirationTimestamp != null)
        'ExpirationTimestamp': unixTimestampToJson(expirationTimestamp),
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
    };
  }
}

class DeleteRcsAgentResult {
  /// The time when the RCS agent was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  final bool deletionProtectionEnabled;

  /// The Amazon Resource Name (ARN) of the deleted RCS agent.
  final String rcsAgentArn;

  /// The unique identifier for the deleted RCS agent.
  final String rcsAgentId;

  /// By default this is set to false. When set to true you're responsible for
  /// responding to HELP and STOP requests. You're also responsible for tracking
  /// and honoring opt-out requests.
  final bool selfManagedOptOutsEnabled;

  /// The current status of the RCS agent.
  final RcsAgentStatus status;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool twoWayEnabled;

  /// The name of the OptOutList that was associated with the deleted RCS agent.
  final String? optOutListName;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

  DeleteRcsAgentResult({
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.rcsAgentArn,
    required this.rcsAgentId,
    required this.selfManagedOptOutsEnabled,
    required this.status,
    required this.twoWayEnabled,
    this.optOutListName,
    this.twoWayChannelArn,
    this.twoWayChannelRole,
  });

  factory DeleteRcsAgentResult.fromJson(Map<String, dynamic> json) {
    return DeleteRcsAgentResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      rcsAgentArn: (json['RcsAgentArn'] as String?) ?? '',
      rcsAgentId: (json['RcsAgentId'] as String?) ?? '',
      selfManagedOptOutsEnabled:
          (json['SelfManagedOptOutsEnabled'] as bool?) ?? false,
      status: RcsAgentStatus.fromString((json['Status'] as String?) ?? ''),
      twoWayEnabled: (json['TwoWayEnabled'] as bool?) ?? false,
      optOutListName: json['OptOutListName'] as String?,
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final rcsAgentArn = this.rcsAgentArn;
    final rcsAgentId = this.rcsAgentId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final twoWayEnabled = this.twoWayEnabled;
    final optOutListName = this.optOutListName;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayChannelRole = this.twoWayChannelRole;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'RcsAgentArn': rcsAgentArn,
      'RcsAgentId': rcsAgentId,
      'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      'Status': status.value,
      'TwoWayEnabled': twoWayEnabled,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
    };
  }
}

class DeleteRegistrationResult {
  /// The time when the registration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The current version number of the registration.
  final int currentVersionNumber;

  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The status of the registration.
  ///
  /// <ul>
  /// <li>
  /// <code>CLOSED</code>: The phone number or sender ID has been deleted and you
  /// must also delete the registration for the number.
  /// </li>
  /// <li>
  /// <code>CREATED</code>: Your registration is created but not submitted.
  /// </li>
  /// <li>
  /// <code>COMPLETE</code>: Your registration has been approved and your
  /// origination identity has been created.
  /// </li>
  /// <li>
  /// <code>DELETED</code>: The registration has been deleted.
  /// </li>
  /// <li>
  /// <code>PROVISIONING</code>: Your registration has been approved and your
  /// origination identity is being created.
  /// </li>
  /// <li>
  /// <code>REQUIRES_AUTHENTICATION</code>: You need to complete email
  /// authentication.
  /// </li>
  /// <li>
  /// <code>REQUIRES_UPDATES</code>: You must fix your registration and resubmit
  /// it.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted and is awaiting
  /// review.
  /// </li>
  /// </ul>
  final RegistrationStatus registrationStatus;

  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  final String registrationType;

  /// Metadata about a given registration which is specific to that registration
  /// type.
  final Map<String, String>? additionalAttributes;

  /// The version number of the registration that was approved.
  final int? approvedVersionNumber;

  /// The latest version number of the registration that was denied.
  final int? latestDeniedVersionNumber;

  DeleteRegistrationResult({
    required this.createdTimestamp,
    required this.currentVersionNumber,
    required this.registrationArn,
    required this.registrationId,
    required this.registrationStatus,
    required this.registrationType,
    this.additionalAttributes,
    this.approvedVersionNumber,
    this.latestDeniedVersionNumber,
  });

  factory DeleteRegistrationResult.fromJson(Map<String, dynamic> json) {
    return DeleteRegistrationResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      currentVersionNumber: (json['CurrentVersionNumber'] as int?) ?? 0,
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      registrationStatus: RegistrationStatus.fromString(
          (json['RegistrationStatus'] as String?) ?? ''),
      registrationType: (json['RegistrationType'] as String?) ?? '',
      additionalAttributes:
          (json['AdditionalAttributes'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      approvedVersionNumber: json['ApprovedVersionNumber'] as int?,
      latestDeniedVersionNumber: json['LatestDeniedVersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final currentVersionNumber = this.currentVersionNumber;
    final registrationArn = this.registrationArn;
    final registrationId = this.registrationId;
    final registrationStatus = this.registrationStatus;
    final registrationType = this.registrationType;
    final additionalAttributes = this.additionalAttributes;
    final approvedVersionNumber = this.approvedVersionNumber;
    final latestDeniedVersionNumber = this.latestDeniedVersionNumber;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'CurrentVersionNumber': currentVersionNumber,
      'RegistrationArn': registrationArn,
      'RegistrationId': registrationId,
      'RegistrationStatus': registrationStatus.value,
      'RegistrationType': registrationType,
      if (additionalAttributes != null)
        'AdditionalAttributes': additionalAttributes,
      if (approvedVersionNumber != null)
        'ApprovedVersionNumber': approvedVersionNumber,
      if (latestDeniedVersionNumber != null)
        'LatestDeniedVersionNumber': latestDeniedVersionNumber,
    };
  }
}

class DeleteRegistrationAttachmentResult {
  /// The status of the registration attachment.
  ///
  /// <ul>
  /// <li>
  /// <code>UPLOAD_IN_PROGRESS</code> The attachment is being uploaded.
  /// </li>
  /// <li>
  /// <code>UPLOAD_COMPLETE</code> The attachment has been uploaded.
  /// </li>
  /// <li>
  /// <code>UPLOAD_FAILED</code> The attachment failed to uploaded.
  /// </li>
  /// <li>
  /// <code>DELETED</code> The attachment has been deleted..
  /// </li>
  /// </ul>
  final AttachmentStatus attachmentStatus;

  /// The time when the registration attachment was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The Amazon Resource Name (ARN) for the registration attachment.
  final String registrationAttachmentArn;

  /// The unique identifier for the registration attachment.
  final String registrationAttachmentId;

  /// The error message if the upload failed.
  final AttachmentUploadErrorReason? attachmentUploadErrorReason;

  DeleteRegistrationAttachmentResult({
    required this.attachmentStatus,
    required this.createdTimestamp,
    required this.registrationAttachmentArn,
    required this.registrationAttachmentId,
    this.attachmentUploadErrorReason,
  });

  factory DeleteRegistrationAttachmentResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteRegistrationAttachmentResult(
      attachmentStatus: AttachmentStatus.fromString(
          (json['AttachmentStatus'] as String?) ?? ''),
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      registrationAttachmentArn:
          (json['RegistrationAttachmentArn'] as String?) ?? '',
      registrationAttachmentId:
          (json['RegistrationAttachmentId'] as String?) ?? '',
      attachmentUploadErrorReason:
          (json['AttachmentUploadErrorReason'] as String?)
              ?.let(AttachmentUploadErrorReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentStatus = this.attachmentStatus;
    final createdTimestamp = this.createdTimestamp;
    final registrationAttachmentArn = this.registrationAttachmentArn;
    final registrationAttachmentId = this.registrationAttachmentId;
    final attachmentUploadErrorReason = this.attachmentUploadErrorReason;
    return {
      'AttachmentStatus': attachmentStatus.value,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'RegistrationAttachmentArn': registrationAttachmentArn,
      'RegistrationAttachmentId': registrationAttachmentId,
      if (attachmentUploadErrorReason != null)
        'AttachmentUploadErrorReason': attachmentUploadErrorReason.value,
    };
  }
}

class DeleteRegistrationFieldValueResult {
  /// The path to the registration form field.
  final String fieldPath;

  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The version number of the registration.
  final int versionNumber;

  /// The unique identifier for the registration attachment.
  final String? registrationAttachmentId;

  /// An array of values for the form field.
  final List<String>? selectChoices;

  /// The text data for a free form field.
  final String? textValue;

  DeleteRegistrationFieldValueResult({
    required this.fieldPath,
    required this.registrationArn,
    required this.registrationId,
    required this.versionNumber,
    this.registrationAttachmentId,
    this.selectChoices,
    this.textValue,
  });

  factory DeleteRegistrationFieldValueResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteRegistrationFieldValueResult(
      fieldPath: (json['FieldPath'] as String?) ?? '',
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      versionNumber: (json['VersionNumber'] as int?) ?? 0,
      registrationAttachmentId: json['RegistrationAttachmentId'] as String?,
      selectChoices: (json['SelectChoices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      textValue: json['TextValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldPath = this.fieldPath;
    final registrationArn = this.registrationArn;
    final registrationId = this.registrationId;
    final versionNumber = this.versionNumber;
    final registrationAttachmentId = this.registrationAttachmentId;
    final selectChoices = this.selectChoices;
    final textValue = this.textValue;
    return {
      'FieldPath': fieldPath,
      'RegistrationArn': registrationArn,
      'RegistrationId': registrationId,
      'VersionNumber': versionNumber,
      if (registrationAttachmentId != null)
        'RegistrationAttachmentId': registrationAttachmentId,
      if (selectChoices != null) 'SelectChoices': selectChoices,
      if (textValue != null) 'TextValue': textValue,
    };
  }
}

class DeleteResourcePolicyResult {
  /// The time when the resource-based policy was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// The JSON formatted resource-based policy that was deleted.
  final String? policy;

  /// The Amazon Resource Name (ARN) of the End User Messaging SMS resource that
  /// the resource-based policy was deleted from.
  final String? resourceArn;

  DeleteResourcePolicyResult({
    this.createdTimestamp,
    this.policy,
    this.resourceArn,
  });

  factory DeleteResourcePolicyResult.fromJson(Map<String, dynamic> json) {
    return DeleteResourcePolicyResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      policy: json['Policy'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final policy = this.policy;
    final resourceArn = this.resourceArn;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (policy != null) 'Policy': policy,
      if (resourceArn != null) 'ResourceArn': resourceArn,
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

class DeleteVerifiedDestinationNumberResult {
  /// The time when the destination phone number was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The verified destination phone number, in E.164 format.
  final String destinationPhoneNumber;

  /// The Amazon Resource Name (ARN) for the verified destination phone number.
  final String verifiedDestinationNumberArn;

  /// The unique identifier for the verified destination phone number.
  final String verifiedDestinationNumberId;

  DeleteVerifiedDestinationNumberResult({
    required this.createdTimestamp,
    required this.destinationPhoneNumber,
    required this.verifiedDestinationNumberArn,
    required this.verifiedDestinationNumberId,
  });

  factory DeleteVerifiedDestinationNumberResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteVerifiedDestinationNumberResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      destinationPhoneNumber: (json['DestinationPhoneNumber'] as String?) ?? '',
      verifiedDestinationNumberArn:
          (json['VerifiedDestinationNumberArn'] as String?) ?? '',
      verifiedDestinationNumberId:
          (json['VerifiedDestinationNumberId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final destinationPhoneNumber = this.destinationPhoneNumber;
    final verifiedDestinationNumberArn = this.verifiedDestinationNumberArn;
    final verifiedDestinationNumberId = this.verifiedDestinationNumberId;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DestinationPhoneNumber': destinationPhoneNumber,
      'VerifiedDestinationNumberArn': verifiedDestinationNumberArn,
      'VerifiedDestinationNumberId': verifiedDestinationNumberId,
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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

class DescribeNotifyConfigurationsResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// An array of NotifyConfigurationInformation objects that contain the results.
  final List<NotifyConfigurationInformation>? notifyConfigurations;

  DescribeNotifyConfigurationsResult({
    this.nextToken,
    this.notifyConfigurations,
  });

  factory DescribeNotifyConfigurationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeNotifyConfigurationsResult(
      nextToken: json['NextToken'] as String?,
      notifyConfigurations: (json['NotifyConfigurations'] as List?)
          ?.nonNulls
          .map((e) => NotifyConfigurationInformation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notifyConfigurations = this.notifyConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (notifyConfigurations != null)
        'NotifyConfigurations': notifyConfigurations,
    };
  }
}

class DescribeNotifyTemplatesResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// An array of NotifyTemplateInformation objects that contain the results.
  final List<NotifyTemplateInformation>? notifyTemplates;

  DescribeNotifyTemplatesResult({
    this.nextToken,
    this.notifyTemplates,
  });

  factory DescribeNotifyTemplatesResult.fromJson(Map<String, dynamic> json) {
    return DescribeNotifyTemplatesResult(
      nextToken: json['NextToken'] as String?,
      notifyTemplates: (json['NotifyTemplates'] as List?)
          ?.nonNulls
          .map((e) =>
              NotifyTemplateInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notifyTemplates = this.notifyTemplates;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (notifyTemplates != null) 'NotifyTemplates': notifyTemplates,
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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

class DescribeProtectConfigurationsResult {
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  /// An array of ProtectConfigurationInformation objects that contain the details
  /// for the request.
  final List<ProtectConfigurationInformation>? protectConfigurations;

  DescribeProtectConfigurationsResult({
    this.nextToken,
    this.protectConfigurations,
  });

  factory DescribeProtectConfigurationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeProtectConfigurationsResult(
      nextToken: json['NextToken'] as String?,
      protectConfigurations: (json['ProtectConfigurations'] as List?)
          ?.nonNulls
          .map((e) => ProtectConfigurationInformation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final protectConfigurations = this.protectConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (protectConfigurations != null)
        'ProtectConfigurations': protectConfigurations,
    };
  }
}

class DescribeRcsAgentCountryLaunchStatusResult {
  /// The Amazon Resource Name (ARN) of the RCS agent.
  final String rcsAgentArn;

  /// The unique identifier for the RCS agent.
  final String rcsAgentId;

  /// An array of CountryLaunchStatusInformation objects that contain the
  /// per-country launch status details.
  final List<CountryLaunchStatusInformation>? countryLaunchStatus;

  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  DescribeRcsAgentCountryLaunchStatusResult({
    required this.rcsAgentArn,
    required this.rcsAgentId,
    this.countryLaunchStatus,
    this.nextToken,
  });

  factory DescribeRcsAgentCountryLaunchStatusResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeRcsAgentCountryLaunchStatusResult(
      rcsAgentArn: (json['RcsAgentArn'] as String?) ?? '',
      rcsAgentId: (json['RcsAgentId'] as String?) ?? '',
      countryLaunchStatus: (json['CountryLaunchStatus'] as List?)
          ?.nonNulls
          .map((e) => CountryLaunchStatusInformation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rcsAgentArn = this.rcsAgentArn;
    final rcsAgentId = this.rcsAgentId;
    final countryLaunchStatus = this.countryLaunchStatus;
    final nextToken = this.nextToken;
    return {
      'RcsAgentArn': rcsAgentArn,
      'RcsAgentId': rcsAgentId,
      if (countryLaunchStatus != null)
        'CountryLaunchStatus': countryLaunchStatus,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeRcsAgentsResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// An array of RcsAgentInformation objects that contain the details for the
  /// requested RCS agents.
  final List<RcsAgentInformation>? rcsAgents;

  DescribeRcsAgentsResult({
    this.nextToken,
    this.rcsAgents,
  });

  factory DescribeRcsAgentsResult.fromJson(Map<String, dynamic> json) {
    return DescribeRcsAgentsResult(
      nextToken: json['NextToken'] as String?,
      rcsAgents: (json['RcsAgents'] as List?)
          ?.nonNulls
          .map((e) => RcsAgentInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final rcsAgents = this.rcsAgents;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (rcsAgents != null) 'RcsAgents': rcsAgents,
    };
  }
}

class DescribeRegistrationAttachmentsResult {
  /// An array of <b>RegistrationAttachments</b> objects that contain the details
  /// for the requested registration attachments.
  final List<RegistrationAttachmentsInformation> registrationAttachments;

  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  DescribeRegistrationAttachmentsResult({
    required this.registrationAttachments,
    this.nextToken,
  });

  factory DescribeRegistrationAttachmentsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeRegistrationAttachmentsResult(
      registrationAttachments:
          ((json['RegistrationAttachments'] as List?) ?? const [])
              .nonNulls
              .map((e) => RegistrationAttachmentsInformation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationAttachments = this.registrationAttachments;
    final nextToken = this.nextToken;
    return {
      'RegistrationAttachments': registrationAttachments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeRegistrationFieldDefinitionsResult {
  /// An array of RegistrationFieldDefinitions objects that contain the details
  /// for the requested fields.
  final List<RegistrationFieldDefinition> registrationFieldDefinitions;

  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  final String registrationType;

  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  DescribeRegistrationFieldDefinitionsResult({
    required this.registrationFieldDefinitions,
    required this.registrationType,
    this.nextToken,
  });

  factory DescribeRegistrationFieldDefinitionsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeRegistrationFieldDefinitionsResult(
      registrationFieldDefinitions: ((json['RegistrationFieldDefinitions']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              RegistrationFieldDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      registrationType: (json['RegistrationType'] as String?) ?? '',
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationFieldDefinitions = this.registrationFieldDefinitions;
    final registrationType = this.registrationType;
    final nextToken = this.nextToken;
    return {
      'RegistrationFieldDefinitions': registrationFieldDefinitions,
      'RegistrationType': registrationType,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeRegistrationFieldValuesResult {
  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// An array of RegistrationFieldValues objects that contain the values for the
  /// requested registration.
  final List<RegistrationFieldValueInformation> registrationFieldValues;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The current version of the registration.
  final int versionNumber;

  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  DescribeRegistrationFieldValuesResult({
    required this.registrationArn,
    required this.registrationFieldValues,
    required this.registrationId,
    required this.versionNumber,
    this.nextToken,
  });

  factory DescribeRegistrationFieldValuesResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeRegistrationFieldValuesResult(
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationFieldValues:
          ((json['RegistrationFieldValues'] as List?) ?? const [])
              .nonNulls
              .map((e) => RegistrationFieldValueInformation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      registrationId: (json['RegistrationId'] as String?) ?? '',
      versionNumber: (json['VersionNumber'] as int?) ?? 0,
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationArn = this.registrationArn;
    final registrationFieldValues = this.registrationFieldValues;
    final registrationId = this.registrationId;
    final versionNumber = this.versionNumber;
    final nextToken = this.nextToken;
    return {
      'RegistrationArn': registrationArn,
      'RegistrationFieldValues': registrationFieldValues,
      'RegistrationId': registrationId,
      'VersionNumber': versionNumber,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeRegistrationsResult {
  /// An array of RegistrationInformation objects.
  final List<RegistrationInformation> registrations;

  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  DescribeRegistrationsResult({
    required this.registrations,
    this.nextToken,
  });

  factory DescribeRegistrationsResult.fromJson(Map<String, dynamic> json) {
    return DescribeRegistrationsResult(
      registrations: ((json['Registrations'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RegistrationInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrations = this.registrations;
    final nextToken = this.nextToken;
    return {
      'Registrations': registrations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeRegistrationSectionDefinitionsResult {
  /// An array of RegistrationSectionDefinition objects.
  final List<RegistrationSectionDefinition> registrationSectionDefinitions;

  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  final String registrationType;

  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  DescribeRegistrationSectionDefinitionsResult({
    required this.registrationSectionDefinitions,
    required this.registrationType,
    this.nextToken,
  });

  factory DescribeRegistrationSectionDefinitionsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeRegistrationSectionDefinitionsResult(
      registrationSectionDefinitions: ((json['RegistrationSectionDefinitions']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              RegistrationSectionDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      registrationType: (json['RegistrationType'] as String?) ?? '',
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationSectionDefinitions = this.registrationSectionDefinitions;
    final registrationType = this.registrationType;
    final nextToken = this.nextToken;
    return {
      'RegistrationSectionDefinitions': registrationSectionDefinitions,
      'RegistrationType': registrationType,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeRegistrationTypeDefinitionsResult {
  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  final List<RegistrationTypeDefinition> registrationTypeDefinitions;

  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  DescribeRegistrationTypeDefinitionsResult({
    required this.registrationTypeDefinitions,
    this.nextToken,
  });

  factory DescribeRegistrationTypeDefinitionsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeRegistrationTypeDefinitionsResult(
      registrationTypeDefinitions: ((json['RegistrationTypeDefinitions']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              RegistrationTypeDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationTypeDefinitions = this.registrationTypeDefinitions;
    final nextToken = this.nextToken;
    return {
      'RegistrationTypeDefinitions': registrationTypeDefinitions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeRegistrationVersionsResult {
  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// An array of RegistrationVersions objects.
  final List<RegistrationVersionInformation> registrationVersions;

  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  DescribeRegistrationVersionsResult({
    required this.registrationArn,
    required this.registrationId,
    required this.registrationVersions,
    this.nextToken,
  });

  factory DescribeRegistrationVersionsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeRegistrationVersionsResult(
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      registrationVersions:
          ((json['RegistrationVersions'] as List?) ?? const [])
              .nonNulls
              .map((e) => RegistrationVersionInformation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationArn = this.registrationArn;
    final registrationId = this.registrationId;
    final registrationVersions = this.registrationVersions;
    final nextToken = this.nextToken;
    return {
      'RegistrationArn': registrationArn,
      'RegistrationId': registrationId,
      'RegistrationVersions': registrationVersions,
      if (nextToken != null) 'NextToken': nextToken,
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
          ?.nonNulls
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
          ?.nonNulls
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

class DescribeVerifiedDestinationNumbersResult {
  /// An array of VerifiedDestinationNumberInformation objects
  final List<VerifiedDestinationNumberInformation> verifiedDestinationNumbers;

  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  DescribeVerifiedDestinationNumbersResult({
    required this.verifiedDestinationNumbers,
    this.nextToken,
  });

  factory DescribeVerifiedDestinationNumbersResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeVerifiedDestinationNumbersResult(
      verifiedDestinationNumbers:
          ((json['VerifiedDestinationNumbers'] as List?) ?? const [])
              .nonNulls
              .map((e) => VerifiedDestinationNumberInformation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final verifiedDestinationNumbers = this.verifiedDestinationNumbers;
    final nextToken = this.nextToken;
    return {
      'VerifiedDestinationNumbers': verifiedDestinationNumbers,
      if (nextToken != null) 'NextToken': nextToken,
    };
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

class DisassociateProtectConfigurationResult {
  /// The Amazon Resource Name (ARN) of the configuration set.
  final String configurationSetArn;

  /// The name of the ConfigurationSet.
  final String configurationSetName;

  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  DisassociateProtectConfigurationResult({
    required this.configurationSetArn,
    required this.configurationSetName,
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
  });

  factory DisassociateProtectConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return DisassociateProtectConfigurationResult(
      configurationSetArn: (json['ConfigurationSetArn'] as String?) ?? '',
      configurationSetName: (json['ConfigurationSetName'] as String?) ?? '',
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    return {
      'ConfigurationSetArn': configurationSetArn,
      'ConfigurationSetName': configurationSetName,
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
    };
  }
}

class DiscardRegistrationVersionResult {
  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The status of the registration version.
  ///
  /// <ul>
  /// <li>
  /// <code>APPROVED</code>: Your registration has been approved.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code>: Your previously approved registration version moves
  /// into this status when a more recently submitted version is approved.
  /// </li>
  /// <li>
  /// <code>DENIED</code>: You must fix your registration and resubmit it.
  /// </li>
  /// <li>
  /// <code>DISCARDED</code>: You've abandon this version of their registration to
  /// start over with a new version.
  /// </li>
  /// <li>
  /// <code>DRAFT</code>: The initial status of a registration version after it’s
  /// created.
  /// </li>
  /// <li>
  /// <code>REQUIRES_AUTHENTICATION</code>: You need to complete email
  /// authentication.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>REVOKED</code>: Your previously approved registration has been
  /// revoked.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted.
  /// </li>
  /// </ul>
  final RegistrationVersionStatus registrationVersionStatus;

  /// The <b>RegistrationVersionStatusHistory</b> object contains the time stamps
  /// for when the reservations status changes.
  final RegistrationVersionStatusHistory registrationVersionStatusHistory;

  /// The version number of the registration.
  final int versionNumber;

  DiscardRegistrationVersionResult({
    required this.registrationArn,
    required this.registrationId,
    required this.registrationVersionStatus,
    required this.registrationVersionStatusHistory,
    required this.versionNumber,
  });

  factory DiscardRegistrationVersionResult.fromJson(Map<String, dynamic> json) {
    return DiscardRegistrationVersionResult(
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      registrationVersionStatus: RegistrationVersionStatus.fromString(
          (json['RegistrationVersionStatus'] as String?) ?? ''),
      registrationVersionStatusHistory:
          RegistrationVersionStatusHistory.fromJson(
              (json['RegistrationVersionStatusHistory']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      versionNumber: (json['VersionNumber'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationArn = this.registrationArn;
    final registrationId = this.registrationId;
    final registrationVersionStatus = this.registrationVersionStatus;
    final registrationVersionStatusHistory =
        this.registrationVersionStatusHistory;
    final versionNumber = this.versionNumber;
    return {
      'RegistrationArn': registrationArn,
      'RegistrationId': registrationId,
      'RegistrationVersionStatus': registrationVersionStatus.value,
      'RegistrationVersionStatusHistory': registrationVersionStatusHistory,
      'VersionNumber': versionNumber,
    };
  }
}

class GetProtectConfigurationCountryRuleSetResult {
  /// A map of ProtectConfigurationCountryRuleSetInformation objects that contain
  /// the details for the requested NumberCapability. The Key is the two-letter
  /// ISO country code. For a list of supported ISO country codes, see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-sms-by-country.html">Supported
  /// countries and regions (SMS channel)</a> in the End User Messaging SMS User
  /// Guide.
  final Map<String, ProtectConfigurationCountryRuleSetInformation>
      countryRuleSet;

  /// The capability type associated with the returned
  /// ProtectConfigurationCountryRuleSetInformation objects.
  final NumberCapability numberCapability;

  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  GetProtectConfigurationCountryRuleSetResult({
    required this.countryRuleSet,
    required this.numberCapability,
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
  });

  factory GetProtectConfigurationCountryRuleSetResult.fromJson(
      Map<String, dynamic> json) {
    return GetProtectConfigurationCountryRuleSetResult(
      countryRuleSet: ((json['CountryRuleSet'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k,
              ProtectConfigurationCountryRuleSetInformation.fromJson(
                  e as Map<String, dynamic>))),
      numberCapability: NumberCapability.fromString(
          (json['NumberCapability'] as String?) ?? ''),
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final countryRuleSet = this.countryRuleSet;
    final numberCapability = this.numberCapability;
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    return {
      'CountryRuleSet': countryRuleSet,
      'NumberCapability': numberCapability.value,
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
    };
  }
}

class GetResourcePolicyResult {
  /// The time when the resource-based policy was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// The JSON formatted string that contains the resource-based policy attached
  /// to the End User Messaging SMS resource.
  final String? policy;

  /// The Amazon Resource Name (ARN) of the End User Messaging SMS resource
  /// attached to the resource-based policy.
  final String? resourceArn;

  GetResourcePolicyResult({
    this.createdTimestamp,
    this.policy,
    this.resourceArn,
  });

  factory GetResourcePolicyResult.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      policy: json['Policy'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final policy = this.policy;
    final resourceArn = this.resourceArn;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (policy != null) 'Policy': policy,
      if (resourceArn != null) 'ResourceArn': resourceArn,
    };
  }
}

class ListNotifyCountriesResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// An array of NotifyCountryInformation objects that contain the results.
  final List<NotifyCountryInformation>? notifyCountries;

  ListNotifyCountriesResult({
    this.nextToken,
    this.notifyCountries,
  });

  factory ListNotifyCountriesResult.fromJson(Map<String, dynamic> json) {
    return ListNotifyCountriesResult(
      nextToken: json['NextToken'] as String?,
      notifyCountries: (json['NotifyCountries'] as List?)
          ?.nonNulls
          .map((e) =>
              NotifyCountryInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notifyCountries = this.notifyCountries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (notifyCountries != null) 'NotifyCountries': notifyCountries,
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
          ?.nonNulls
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

class ListProtectConfigurationRuleSetNumberOverridesResult {
  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  /// An array of RuleSetNumberOverrides objects.
  final List<ProtectConfigurationRuleSetNumberOverride>? ruleSetNumberOverrides;

  ListProtectConfigurationRuleSetNumberOverridesResult({
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
    this.nextToken,
    this.ruleSetNumberOverrides,
  });

  factory ListProtectConfigurationRuleSetNumberOverridesResult.fromJson(
      Map<String, dynamic> json) {
    return ListProtectConfigurationRuleSetNumberOverridesResult(
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
      nextToken: json['NextToken'] as String?,
      ruleSetNumberOverrides: (json['RuleSetNumberOverrides'] as List?)
          ?.nonNulls
          .map((e) => ProtectConfigurationRuleSetNumberOverride.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    final nextToken = this.nextToken;
    final ruleSetNumberOverrides = this.ruleSetNumberOverrides;
    return {
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
      if (nextToken != null) 'NextToken': nextToken,
      if (ruleSetNumberOverrides != null)
        'RuleSetNumberOverrides': ruleSetNumberOverrides,
    };
  }
}

class ListRegistrationAssociationsResult {
  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// An array of RegistrationAssociationMetadata objects.
  final List<RegistrationAssociationMetadata> registrationAssociations;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  final String registrationType;

  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  final String? nextToken;

  ListRegistrationAssociationsResult({
    required this.registrationArn,
    required this.registrationAssociations,
    required this.registrationId,
    required this.registrationType,
    this.nextToken,
  });

  factory ListRegistrationAssociationsResult.fromJson(
      Map<String, dynamic> json) {
    return ListRegistrationAssociationsResult(
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationAssociations:
          ((json['RegistrationAssociations'] as List?) ?? const [])
              .nonNulls
              .map((e) => RegistrationAssociationMetadata.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      registrationId: (json['RegistrationId'] as String?) ?? '',
      registrationType: (json['RegistrationType'] as String?) ?? '',
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationArn = this.registrationArn;
    final registrationAssociations = this.registrationAssociations;
    final registrationId = this.registrationId;
    final registrationType = this.registrationType;
    final nextToken = this.nextToken;
    return {
      'RegistrationArn': registrationArn,
      'RegistrationAssociations': registrationAssociations,
      'RegistrationId': registrationId,
      'RegistrationType': registrationType,
      if (nextToken != null) 'NextToken': nextToken,
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
          ?.nonNulls
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
      keywordAction:
          (json['KeywordAction'] as String?)?.let(KeywordAction.fromString),
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
      if (keywordAction != null) 'KeywordAction': keywordAction.value,
      if (keywordMessage != null) 'KeywordMessage': keywordMessage,
      if (originationIdentity != null)
        'OriginationIdentity': originationIdentity,
      if (originationIdentityArn != null)
        'OriginationIdentityArn': originationIdentityArn,
    };
  }
}

class PutMessageFeedbackResult {
  /// The current status of the message.
  final MessageFeedbackStatus messageFeedbackStatus;

  /// The unique identifier for the message.
  final String messageId;

  PutMessageFeedbackResult({
    required this.messageFeedbackStatus,
    required this.messageId,
  });

  factory PutMessageFeedbackResult.fromJson(Map<String, dynamic> json) {
    return PutMessageFeedbackResult(
      messageFeedbackStatus: MessageFeedbackStatus.fromString(
          (json['MessageFeedbackStatus'] as String?) ?? ''),
      messageId: (json['MessageId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final messageFeedbackStatus = this.messageFeedbackStatus;
    final messageId = this.messageId;
    return {
      'MessageFeedbackStatus': messageFeedbackStatus.value,
      'MessageId': messageId,
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

class PutProtectConfigurationRuleSetNumberOverrideResult {
  /// The action for the rule to take.
  final ProtectConfigurationRuleOverrideAction action;

  /// The time when the rule was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The destination phone number in E.164 format.
  final String destinationPhoneNumber;

  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  /// The time the rule will expire at.
  final DateTime? expirationTimestamp;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  PutProtectConfigurationRuleSetNumberOverrideResult({
    required this.action,
    required this.createdTimestamp,
    required this.destinationPhoneNumber,
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
    this.expirationTimestamp,
    this.isoCountryCode,
  });

  factory PutProtectConfigurationRuleSetNumberOverrideResult.fromJson(
      Map<String, dynamic> json) {
    return PutProtectConfigurationRuleSetNumberOverrideResult(
      action: ProtectConfigurationRuleOverrideAction.fromString(
          (json['Action'] as String?) ?? ''),
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      destinationPhoneNumber: (json['DestinationPhoneNumber'] as String?) ?? '',
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
      expirationTimestamp: timeStampFromJson(json['ExpirationTimestamp']),
      isoCountryCode: json['IsoCountryCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdTimestamp = this.createdTimestamp;
    final destinationPhoneNumber = this.destinationPhoneNumber;
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    final expirationTimestamp = this.expirationTimestamp;
    final isoCountryCode = this.isoCountryCode;
    return {
      'Action': action.value,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DestinationPhoneNumber': destinationPhoneNumber,
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
      if (expirationTimestamp != null)
        'ExpirationTimestamp': unixTimestampToJson(expirationTimestamp),
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
    };
  }
}

class PutRegistrationFieldValueResult {
  /// The path to the registration form field. You can use
  /// <a>DescribeRegistrationFieldDefinitions</a> for a list of <b>FieldPaths</b>.
  final String fieldPath;

  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The version number of the registration.
  final int versionNumber;

  /// The unique identifier for the registration attachment.
  final String? registrationAttachmentId;

  /// An array of values for the form field.
  final List<String>? selectChoices;

  /// The text data for a free form field.
  final String? textValue;

  PutRegistrationFieldValueResult({
    required this.fieldPath,
    required this.registrationArn,
    required this.registrationId,
    required this.versionNumber,
    this.registrationAttachmentId,
    this.selectChoices,
    this.textValue,
  });

  factory PutRegistrationFieldValueResult.fromJson(Map<String, dynamic> json) {
    return PutRegistrationFieldValueResult(
      fieldPath: (json['FieldPath'] as String?) ?? '',
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      versionNumber: (json['VersionNumber'] as int?) ?? 0,
      registrationAttachmentId: json['RegistrationAttachmentId'] as String?,
      selectChoices: (json['SelectChoices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      textValue: json['TextValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldPath = this.fieldPath;
    final registrationArn = this.registrationArn;
    final registrationId = this.registrationId;
    final versionNumber = this.versionNumber;
    final registrationAttachmentId = this.registrationAttachmentId;
    final selectChoices = this.selectChoices;
    final textValue = this.textValue;
    return {
      'FieldPath': fieldPath,
      'RegistrationArn': registrationArn,
      'RegistrationId': registrationId,
      'VersionNumber': versionNumber,
      if (registrationAttachmentId != null)
        'RegistrationAttachmentId': registrationAttachmentId,
      if (selectChoices != null) 'SelectChoices': selectChoices,
      if (textValue != null) 'TextValue': textValue,
    };
  }
}

class PutResourcePolicyResult {
  /// The time when the resource-based policy was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// The JSON formatted Resource Policy.
  final String? policy;

  /// The Amazon Resource Name (ARN) of the End User Messaging SMS resource
  /// attached to the resource-based policy.
  final String? resourceArn;

  PutResourcePolicyResult({
    this.createdTimestamp,
    this.policy,
    this.resourceArn,
  });

  factory PutResourcePolicyResult.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      policy: json['Policy'] as String?,
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final policy = this.policy;
    final resourceArn = this.resourceArn;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (policy != null) 'Policy': policy,
      if (resourceArn != null) 'ResourceArn': resourceArn,
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

  /// The unique identifier for the registration.
  final String? registrationId;

  /// By default this is set to false. When set to false and an end recipient
  /// sends a message that begins with HELP or STOP to one of your dedicated
  /// numbers, End User Messaging SMS automatically replies with a customizable
  /// message and adds the end recipient to the OptOutList. When set to true
  /// you're responsible for responding to HELP and STOP requests. You're also
  /// responsible for tracking and honoring opt-out requests.
  final bool? selfManagedOptOutsEnabled;

  /// The current status of the request.
  final NumberStatus? status;

  /// The Amazon Resource Name (ARN) of the TwoWayChannel.
  final String? twoWayChannelArn;

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

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
    this.registrationId,
    this.selfManagedOptOutsEnabled,
    this.status,
    this.twoWayChannelArn,
    this.twoWayChannelRole,
    this.twoWayEnabled,
  });

  factory ReleasePhoneNumberResult.fromJson(Map<String, dynamic> json) {
    return ReleasePhoneNumberResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      isoCountryCode: json['IsoCountryCode'] as String?,
      messageType:
          (json['MessageType'] as String?)?.let(MessageType.fromString),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String?,
      numberCapabilities: (json['NumberCapabilities'] as List?)
          ?.nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      numberType: (json['NumberType'] as String?)?.let(NumberType.fromString),
      optOutListName: json['OptOutListName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumberArn: json['PhoneNumberArn'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      registrationId: json['RegistrationId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      status: (json['Status'] as String?)?.let(NumberStatus.fromString),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
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
    final registrationId = this.registrationId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayChannelRole = this.twoWayChannelRole;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (messageType != null) 'MessageType': messageType.value,
      if (monthlyLeasingPrice != null)
        'MonthlyLeasingPrice': monthlyLeasingPrice,
      if (numberCapabilities != null)
        'NumberCapabilities': numberCapabilities.map((e) => e.value).toList(),
      if (numberType != null) 'NumberType': numberType.value,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumberArn != null) 'PhoneNumberArn': phoneNumberArn,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (registrationId != null) 'RegistrationId': registrationId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (status != null) 'Status': status.value,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

class ReleaseSenderIdResult {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String isoCountryCode;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final List<MessageType> messageTypes;

  /// The monthly price, in US dollars, to lease the sender ID.
  final String monthlyLeasingPrice;

  /// True if the sender ID is registered.
  final bool registered;

  /// The sender ID that was released.
  final String senderId;

  /// The Amazon Resource Name (ARN) associated with the SenderId.
  final String senderIdArn;

  /// The unique identifier for the registration.
  final String? registrationId;

  ReleaseSenderIdResult({
    required this.isoCountryCode,
    required this.messageTypes,
    required this.monthlyLeasingPrice,
    required this.registered,
    required this.senderId,
    required this.senderIdArn,
    this.registrationId,
  });

  factory ReleaseSenderIdResult.fromJson(Map<String, dynamic> json) {
    return ReleaseSenderIdResult(
      isoCountryCode: (json['IsoCountryCode'] as String?) ?? '',
      messageTypes: ((json['MessageTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => MessageType.fromString((e as String)))
          .toList(),
      monthlyLeasingPrice: (json['MonthlyLeasingPrice'] as String?) ?? '',
      registered: (json['Registered'] as bool?) ?? false,
      senderId: (json['SenderId'] as String?) ?? '',
      senderIdArn: (json['SenderIdArn'] as String?) ?? '',
      registrationId: json['RegistrationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isoCountryCode = this.isoCountryCode;
    final messageTypes = this.messageTypes;
    final monthlyLeasingPrice = this.monthlyLeasingPrice;
    final registered = this.registered;
    final senderId = this.senderId;
    final senderIdArn = this.senderIdArn;
    final registrationId = this.registrationId;
    return {
      'IsoCountryCode': isoCountryCode,
      'MessageTypes': messageTypes.map((e) => e.value).toList(),
      'MonthlyLeasingPrice': monthlyLeasingPrice,
      'Registered': registered,
      'SenderId': senderId,
      'SenderIdArn': senderIdArn,
      if (registrationId != null) 'RegistrationId': registrationId,
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

  /// By default this is set to false. When set to true the international sending
  /// of phone number is Enabled.
  final bool? internationalSendingEnabled;

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

  /// The unique identifier for the registration.
  final String? registrationId;

  /// By default this is set to false. When set to false and an end recipient
  /// sends a message that begins with HELP or STOP to one of your dedicated
  /// numbers, End User Messaging SMS automatically replies with a customizable
  /// message and adds the end recipient to the OptOutList. When set to true
  /// you're responsible for responding to HELP and STOP requests. You're also
  /// responsible for tracking and honoring opt-out requests.
  final bool? selfManagedOptOutsEnabled;

  /// The current status of the request.
  final NumberStatus? status;

  /// An array of key and value pair tags that are associated with the phone
  /// number.
  final List<Tag>? tags;

  /// The ARN used to identify the two way channel.
  final String? twoWayChannelArn;

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool? twoWayEnabled;

  RequestPhoneNumberResult({
    this.createdTimestamp,
    this.deletionProtectionEnabled,
    this.internationalSendingEnabled,
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
    this.registrationId,
    this.selfManagedOptOutsEnabled,
    this.status,
    this.tags,
    this.twoWayChannelArn,
    this.twoWayChannelRole,
    this.twoWayEnabled,
  });

  factory RequestPhoneNumberResult.fromJson(Map<String, dynamic> json) {
    return RequestPhoneNumberResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool?,
      internationalSendingEnabled: json['InternationalSendingEnabled'] as bool?,
      isoCountryCode: json['IsoCountryCode'] as String?,
      messageType:
          (json['MessageType'] as String?)?.let(MessageType.fromString),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String?,
      numberCapabilities: (json['NumberCapabilities'] as List?)
          ?.nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      numberType: (json['NumberType'] as String?)
          ?.let(RequestableNumberType.fromString),
      optOutListName: json['OptOutListName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumberArn: json['PhoneNumberArn'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      poolId: json['PoolId'] as String?,
      registrationId: json['RegistrationId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      status: (json['Status'] as String?)?.let(NumberStatus.fromString),
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
      twoWayEnabled: json['TwoWayEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final internationalSendingEnabled = this.internationalSendingEnabled;
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
    final registrationId = this.registrationId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final tags = this.tags;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayChannelRole = this.twoWayChannelRole;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (deletionProtectionEnabled != null)
        'DeletionProtectionEnabled': deletionProtectionEnabled,
      if (internationalSendingEnabled != null)
        'InternationalSendingEnabled': internationalSendingEnabled,
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (messageType != null) 'MessageType': messageType.value,
      if (monthlyLeasingPrice != null)
        'MonthlyLeasingPrice': monthlyLeasingPrice,
      if (numberCapabilities != null)
        'NumberCapabilities': numberCapabilities.map((e) => e.value).toList(),
      if (numberType != null) 'NumberType': numberType.value,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumberArn != null) 'PhoneNumberArn': phoneNumberArn,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (poolId != null) 'PoolId': poolId,
      if (registrationId != null) 'RegistrationId': registrationId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

class RequestSenderIdResult {
  /// By default this is set to false. When set to true the sender ID can't be
  /// deleted.
  final bool deletionProtectionEnabled;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String isoCountryCode;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final List<MessageType> messageTypes;

  /// The monthly price, in US dollars, to lease the sender ID.
  final String monthlyLeasingPrice;

  /// True if the sender ID is registered.
  final bool registered;

  /// The sender ID that was requested.
  final String senderId;

  /// The Amazon Resource Name (ARN) associated with the SenderId.
  final String senderIdArn;

  /// An array of tags (key and value pairs) to associate with the sender ID.
  final List<Tag>? tags;

  RequestSenderIdResult({
    required this.deletionProtectionEnabled,
    required this.isoCountryCode,
    required this.messageTypes,
    required this.monthlyLeasingPrice,
    required this.registered,
    required this.senderId,
    required this.senderIdArn,
    this.tags,
  });

  factory RequestSenderIdResult.fromJson(Map<String, dynamic> json) {
    return RequestSenderIdResult(
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      isoCountryCode: (json['IsoCountryCode'] as String?) ?? '',
      messageTypes: ((json['MessageTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => MessageType.fromString((e as String)))
          .toList(),
      monthlyLeasingPrice: (json['MonthlyLeasingPrice'] as String?) ?? '',
      registered: (json['Registered'] as bool?) ?? false,
      senderId: (json['SenderId'] as String?) ?? '',
      senderIdArn: (json['SenderIdArn'] as String?) ?? '',
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final isoCountryCode = this.isoCountryCode;
    final messageTypes = this.messageTypes;
    final monthlyLeasingPrice = this.monthlyLeasingPrice;
    final registered = this.registered;
    final senderId = this.senderId;
    final senderIdArn = this.senderIdArn;
    final tags = this.tags;
    return {
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'IsoCountryCode': isoCountryCode,
      'MessageTypes': messageTypes.map((e) => e.value).toList(),
      'MonthlyLeasingPrice': monthlyLeasingPrice,
      'Registered': registered,
      'SenderId': senderId,
      'SenderIdArn': senderIdArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class SendDestinationNumberVerificationCodeResult {
  /// The unique identifier for the message.
  final String messageId;

  SendDestinationNumberVerificationCodeResult({
    required this.messageId,
  });

  factory SendDestinationNumberVerificationCodeResult.fromJson(
      Map<String, dynamic> json) {
    return SendDestinationNumberVerificationCodeResult(
      messageId: (json['MessageId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      'MessageId': messageId,
    };
  }
}

class SendMediaMessageResult {
  /// The unique identifier for the message.
  final String? messageId;

  SendMediaMessageResult({
    this.messageId,
  });

  factory SendMediaMessageResult.fromJson(Map<String, dynamic> json) {
    return SendMediaMessageResult(
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

class SendNotifyTextMessageResult {
  /// The unique identifier for the message.
  final String? messageId;

  /// The message body after template variable substitution has been applied.
  final String? resolvedMessageBody;

  /// The unique identifier of the template used for the message.
  final String? templateId;

  SendNotifyTextMessageResult({
    this.messageId,
    this.resolvedMessageBody,
    this.templateId,
  });

  factory SendNotifyTextMessageResult.fromJson(Map<String, dynamic> json) {
    return SendNotifyTextMessageResult(
      messageId: json['MessageId'] as String?,
      resolvedMessageBody: json['ResolvedMessageBody'] as String?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    final resolvedMessageBody = this.resolvedMessageBody;
    final templateId = this.templateId;
    return {
      if (messageId != null) 'MessageId': messageId,
      if (resolvedMessageBody != null)
        'ResolvedMessageBody': resolvedMessageBody,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

class SendNotifyVoiceMessageResult {
  /// The unique identifier for the message.
  final String? messageId;

  /// The message body after template variable substitution has been applied.
  final String? resolvedMessageBody;

  /// The unique identifier of the template used for the message.
  final String? templateId;

  SendNotifyVoiceMessageResult({
    this.messageId,
    this.resolvedMessageBody,
    this.templateId,
  });

  factory SendNotifyVoiceMessageResult.fromJson(Map<String, dynamic> json) {
    return SendNotifyVoiceMessageResult(
      messageId: json['MessageId'] as String?,
      resolvedMessageBody: json['ResolvedMessageBody'] as String?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    final resolvedMessageBody = this.resolvedMessageBody;
    final templateId = this.templateId;
    return {
      if (messageId != null) 'MessageId': messageId,
      if (resolvedMessageBody != null)
        'ResolvedMessageBody': resolvedMessageBody,
      if (templateId != null) 'TemplateId': templateId,
    };
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

class SetAccountDefaultProtectConfigurationResult {
  /// The Amazon Resource Name (ARN) of the account default protect configuration.
  final String defaultProtectConfigurationArn;

  /// The unique identifier of the account default protect configuration.
  final String defaultProtectConfigurationId;

  SetAccountDefaultProtectConfigurationResult({
    required this.defaultProtectConfigurationArn,
    required this.defaultProtectConfigurationId,
  });

  factory SetAccountDefaultProtectConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return SetAccountDefaultProtectConfigurationResult(
      defaultProtectConfigurationArn:
          (json['DefaultProtectConfigurationArn'] as String?) ?? '',
      defaultProtectConfigurationId:
          (json['DefaultProtectConfigurationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final defaultProtectConfigurationArn = this.defaultProtectConfigurationArn;
    final defaultProtectConfigurationId = this.defaultProtectConfigurationId;
    return {
      'DefaultProtectConfigurationArn': defaultProtectConfigurationArn,
      'DefaultProtectConfigurationId': defaultProtectConfigurationId,
    };
  }
}

class SetDefaultMessageFeedbackEnabledResult {
  /// The arn of the configuration set.
  final String? configurationSetArn;

  /// The name of the configuration.
  final String? configurationSetName;

  /// True if message feedback is enabled.
  final bool? messageFeedbackEnabled;

  SetDefaultMessageFeedbackEnabledResult({
    this.configurationSetArn,
    this.configurationSetName,
    this.messageFeedbackEnabled,
  });

  factory SetDefaultMessageFeedbackEnabledResult.fromJson(
      Map<String, dynamic> json) {
    return SetDefaultMessageFeedbackEnabledResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      messageFeedbackEnabled: json['MessageFeedbackEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final messageFeedbackEnabled = this.messageFeedbackEnabled;
    return {
      if (configurationSetArn != null)
        'ConfigurationSetArn': configurationSetArn,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (messageFeedbackEnabled != null)
        'MessageFeedbackEnabled': messageFeedbackEnabled,
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
      messageType:
          (json['MessageType'] as String?)?.let(MessageType.fromString),
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
      if (messageType != null) 'MessageType': messageType.value,
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

class SetMediaMessageSpendLimitOverrideResult {
  /// The current monthly limit to enforce on sending text messages.
  final int? monthlyLimit;

  SetMediaMessageSpendLimitOverrideResult({
    this.monthlyLimit,
  });

  factory SetMediaMessageSpendLimitOverrideResult.fromJson(
      Map<String, dynamic> json) {
    return SetMediaMessageSpendLimitOverrideResult(
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

class SetNotifyMessageSpendLimitOverrideResult {
  /// The current monthly limit, in US dollars.
  final int? monthlyLimit;

  SetNotifyMessageSpendLimitOverrideResult({
    this.monthlyLimit,
  });

  factory SetNotifyMessageSpendLimitOverrideResult.fromJson(
      Map<String, dynamic> json) {
    return SetNotifyMessageSpendLimitOverrideResult(
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

class SubmitRegistrationVersionResult {
  /// Indicates whether AWS review was requested for this registration submission.
  final bool awsReview;

  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The status of the registration version.
  ///
  /// <ul>
  /// <li>
  /// <code>APPROVED</code>: Your registration has been approved.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code>: Your previously approved registration version moves
  /// into this status when a more recently submitted version is approved.
  /// </li>
  /// <li>
  /// <code>DENIED</code>: You must fix your registration and resubmit it.
  /// </li>
  /// <li>
  /// <code>DISCARDED</code>: You've abandon this version of their registration to
  /// start over with a new version.
  /// </li>
  /// <li>
  /// <code>DRAFT</code>: The initial status of a registration version after it’s
  /// created.
  /// </li>
  /// <li>
  /// <code>REQUIRES_AUTHENTICATION</code>: You need to complete email
  /// authentication.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>REVOKED</code>: Your previously approved registration has been
  /// revoked.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted.
  /// </li>
  /// </ul>
  final RegistrationVersionStatus registrationVersionStatus;

  /// The <b>RegistrationVersionStatusHistory</b> object contains the time stamps
  /// for when the reservations status changes.
  final RegistrationVersionStatusHistory registrationVersionStatusHistory;

  /// The version number of the registration.
  final int versionNumber;

  SubmitRegistrationVersionResult({
    required this.awsReview,
    required this.registrationArn,
    required this.registrationId,
    required this.registrationVersionStatus,
    required this.registrationVersionStatusHistory,
    required this.versionNumber,
  });

  factory SubmitRegistrationVersionResult.fromJson(Map<String, dynamic> json) {
    return SubmitRegistrationVersionResult(
      awsReview: (json['AwsReview'] as bool?) ?? false,
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      registrationVersionStatus: RegistrationVersionStatus.fromString(
          (json['RegistrationVersionStatus'] as String?) ?? ''),
      registrationVersionStatusHistory:
          RegistrationVersionStatusHistory.fromJson(
              (json['RegistrationVersionStatusHistory']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      versionNumber: (json['VersionNumber'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final awsReview = this.awsReview;
    final registrationArn = this.registrationArn;
    final registrationId = this.registrationId;
    final registrationVersionStatus = this.registrationVersionStatus;
    final registrationVersionStatusHistory =
        this.registrationVersionStatusHistory;
    final versionNumber = this.versionNumber;
    return {
      'AwsReview': awsReview,
      'RegistrationArn': registrationArn,
      'RegistrationId': registrationId,
      'RegistrationVersionStatus': registrationVersionStatus.value,
      'RegistrationVersionStatusHistory': registrationVersionStatusHistory,
      'VersionNumber': versionNumber,
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

class UpdateNotifyConfigurationResult {
  /// The time when the notify configuration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  final bool deletionProtectionEnabled;

  /// The display name associated with the notify configuration.
  final String displayName;

  /// An array of channels enabled for the notify configuration. Supported values
  /// include <code>SMS</code> and <code>VOICE</code>.
  final List<NumberCapability> enabledChannels;

  /// The Amazon Resource Name (ARN) for the notify configuration.
  final String notifyConfigurationArn;

  /// The unique identifier for the notify configuration.
  final String notifyConfigurationId;

  /// The current status of the notify configuration.
  final NotifyConfigurationStatus status;

  /// The tier of the notify configuration.
  final NotifyConfigurationTier tier;

  /// The tier upgrade status of the notify configuration.
  final TierUpgradeStatus tierUpgradeStatus;

  /// The use case for the notify configuration.
  final NotifyConfigurationUseCase useCase;

  /// The default template identifier associated with the notify configuration.
  final String? defaultTemplateId;

  /// An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format,
  /// that are enabled for the notify configuration.
  final List<String>? enabledCountries;

  /// The identifier of the pool associated with the notify configuration.
  final String? poolId;

  /// The reason the notify configuration was rejected, if applicable.
  final String? rejectionReason;

  UpdateNotifyConfigurationResult({
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.displayName,
    required this.enabledChannels,
    required this.notifyConfigurationArn,
    required this.notifyConfigurationId,
    required this.status,
    required this.tier,
    required this.tierUpgradeStatus,
    required this.useCase,
    this.defaultTemplateId,
    this.enabledCountries,
    this.poolId,
    this.rejectionReason,
  });

  factory UpdateNotifyConfigurationResult.fromJson(Map<String, dynamic> json) {
    return UpdateNotifyConfigurationResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      displayName: (json['DisplayName'] as String?) ?? '',
      enabledChannels: ((json['EnabledChannels'] as List?) ?? const [])
          .nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      notifyConfigurationArn: (json['NotifyConfigurationArn'] as String?) ?? '',
      notifyConfigurationId: (json['NotifyConfigurationId'] as String?) ?? '',
      status: NotifyConfigurationStatus.fromString(
          (json['Status'] as String?) ?? ''),
      tier: NotifyConfigurationTier.fromString((json['Tier'] as String?) ?? ''),
      tierUpgradeStatus: TierUpgradeStatus.fromString(
          (json['TierUpgradeStatus'] as String?) ?? ''),
      useCase: NotifyConfigurationUseCase.fromString(
          (json['UseCase'] as String?) ?? ''),
      defaultTemplateId: json['DefaultTemplateId'] as String?,
      enabledCountries: (json['EnabledCountries'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      poolId: json['PoolId'] as String?,
      rejectionReason: json['RejectionReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final displayName = this.displayName;
    final enabledChannels = this.enabledChannels;
    final notifyConfigurationArn = this.notifyConfigurationArn;
    final notifyConfigurationId = this.notifyConfigurationId;
    final status = this.status;
    final tier = this.tier;
    final tierUpgradeStatus = this.tierUpgradeStatus;
    final useCase = this.useCase;
    final defaultTemplateId = this.defaultTemplateId;
    final enabledCountries = this.enabledCountries;
    final poolId = this.poolId;
    final rejectionReason = this.rejectionReason;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'DisplayName': displayName,
      'EnabledChannels': enabledChannels.map((e) => e.value).toList(),
      'NotifyConfigurationArn': notifyConfigurationArn,
      'NotifyConfigurationId': notifyConfigurationId,
      'Status': status.value,
      'Tier': tier.value,
      'TierUpgradeStatus': tierUpgradeStatus.value,
      'UseCase': useCase.value,
      if (defaultTemplateId != null) 'DefaultTemplateId': defaultTemplateId,
      if (enabledCountries != null) 'EnabledCountries': enabledCountries,
      if (poolId != null) 'PoolId': poolId,
      if (rejectionReason != null) 'RejectionReason': rejectionReason,
    };
  }
}

class UpdatePhoneNumberResult {
  /// The time when the phone number was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// When set to true the phone number can't be deleted.
  final bool? deletionProtectionEnabled;

  /// When set to true the international sending of phone number is Enabled.
  final bool? internationalSendingEnabled;

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

  /// The unique identifier for the registration.
  final String? registrationId;

  /// This is true if self managed opt-out are enabled.
  final bool? selfManagedOptOutsEnabled;

  /// The current status of the request.
  final NumberStatus? status;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool? twoWayEnabled;

  UpdatePhoneNumberResult({
    this.createdTimestamp,
    this.deletionProtectionEnabled,
    this.internationalSendingEnabled,
    this.isoCountryCode,
    this.messageType,
    this.monthlyLeasingPrice,
    this.numberCapabilities,
    this.numberType,
    this.optOutListName,
    this.phoneNumber,
    this.phoneNumberArn,
    this.phoneNumberId,
    this.registrationId,
    this.selfManagedOptOutsEnabled,
    this.status,
    this.twoWayChannelArn,
    this.twoWayChannelRole,
    this.twoWayEnabled,
  });

  factory UpdatePhoneNumberResult.fromJson(Map<String, dynamic> json) {
    return UpdatePhoneNumberResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool?,
      internationalSendingEnabled: json['InternationalSendingEnabled'] as bool?,
      isoCountryCode: json['IsoCountryCode'] as String?,
      messageType:
          (json['MessageType'] as String?)?.let(MessageType.fromString),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String?,
      numberCapabilities: (json['NumberCapabilities'] as List?)
          ?.nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      numberType: (json['NumberType'] as String?)?.let(NumberType.fromString),
      optOutListName: json['OptOutListName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumberArn: json['PhoneNumberArn'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      registrationId: json['RegistrationId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      status: (json['Status'] as String?)?.let(NumberStatus.fromString),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
      twoWayEnabled: json['TwoWayEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final internationalSendingEnabled = this.internationalSendingEnabled;
    final isoCountryCode = this.isoCountryCode;
    final messageType = this.messageType;
    final monthlyLeasingPrice = this.monthlyLeasingPrice;
    final numberCapabilities = this.numberCapabilities;
    final numberType = this.numberType;
    final optOutListName = this.optOutListName;
    final phoneNumber = this.phoneNumber;
    final phoneNumberArn = this.phoneNumberArn;
    final phoneNumberId = this.phoneNumberId;
    final registrationId = this.registrationId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayChannelRole = this.twoWayChannelRole;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (deletionProtectionEnabled != null)
        'DeletionProtectionEnabled': deletionProtectionEnabled,
      if (internationalSendingEnabled != null)
        'InternationalSendingEnabled': internationalSendingEnabled,
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (messageType != null) 'MessageType': messageType.value,
      if (monthlyLeasingPrice != null)
        'MonthlyLeasingPrice': monthlyLeasingPrice,
      if (numberCapabilities != null)
        'NumberCapabilities': numberCapabilities.map((e) => e.value).toList(),
      if (numberType != null) 'NumberType': numberType.value,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumberArn != null) 'PhoneNumberArn': phoneNumberArn,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (registrationId != null) 'RegistrationId': registrationId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (status != null) 'Status': status.value,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
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

  /// When set to false and an end recipient sends a message that begins with HELP
  /// or STOP to one of your dedicated numbers, End User Messaging SMS
  /// automatically replies with a customizable message and adds the end recipient
  /// to the OptOutList. When set to true you're responsible for responding to
  /// HELP and STOP requests. You're also responsible for tracking and honoring
  /// opt-out requests.
  final bool? selfManagedOptOutsEnabled;

  /// Indicates whether shared routes are enabled for the pool.
  final bool? sharedRoutesEnabled;

  /// The current status of the pool update request.
  final PoolStatus? status;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

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
    this.twoWayChannelRole,
    this.twoWayEnabled,
  });

  factory UpdatePoolResult.fromJson(Map<String, dynamic> json) {
    return UpdatePoolResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool?,
      messageType:
          (json['MessageType'] as String?)?.let(MessageType.fromString),
      optOutListName: json['OptOutListName'] as String?,
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      sharedRoutesEnabled: json['SharedRoutesEnabled'] as bool?,
      status: (json['Status'] as String?)?.let(PoolStatus.fromString),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
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
    final twoWayChannelRole = this.twoWayChannelRole;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (deletionProtectionEnabled != null)
        'DeletionProtectionEnabled': deletionProtectionEnabled,
      if (messageType != null) 'MessageType': messageType.value,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (sharedRoutesEnabled != null)
        'SharedRoutesEnabled': sharedRoutesEnabled,
      if (status != null) 'Status': status.value,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

class UpdateProtectConfigurationResult {
  /// This is true if the protect configuration is set as your account default
  /// protect configuration.
  final bool accountDefault;

  /// The time when the protect configuration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The status of deletion protection for the protect configuration. When set to
  /// true deletion protection is enabled. By default this is set to false.
  final bool deletionProtectionEnabled;

  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  UpdateProtectConfigurationResult({
    required this.accountDefault,
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
  });

  factory UpdateProtectConfigurationResult.fromJson(Map<String, dynamic> json) {
    return UpdateProtectConfigurationResult(
      accountDefault: (json['AccountDefault'] as bool?) ?? false,
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountDefault = this.accountDefault;
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    return {
      'AccountDefault': accountDefault,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
    };
  }
}

class UpdateProtectConfigurationCountryRuleSetResult {
  /// An array of ProtectConfigurationCountryRuleSetInformation containing the
  /// rules for the NumberCapability.
  final Map<String, ProtectConfigurationCountryRuleSetInformation>
      countryRuleSet;

  /// The number capability that was updated
  final NumberCapability numberCapability;

  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  UpdateProtectConfigurationCountryRuleSetResult({
    required this.countryRuleSet,
    required this.numberCapability,
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
  });

  factory UpdateProtectConfigurationCountryRuleSetResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateProtectConfigurationCountryRuleSetResult(
      countryRuleSet: ((json['CountryRuleSet'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k,
              ProtectConfigurationCountryRuleSetInformation.fromJson(
                  e as Map<String, dynamic>))),
      numberCapability: NumberCapability.fromString(
          (json['NumberCapability'] as String?) ?? ''),
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final countryRuleSet = this.countryRuleSet;
    final numberCapability = this.numberCapability;
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    return {
      'CountryRuleSet': countryRuleSet,
      'NumberCapability': numberCapability.value,
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
    };
  }
}

class UpdateRcsAgentResult {
  /// The time when the RCS agent was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  final bool deletionProtectionEnabled;

  /// The Amazon Resource Name (ARN) of the updated RCS agent.
  final String rcsAgentArn;

  /// The unique identifier for the RCS agent.
  final String rcsAgentId;

  /// By default this is set to false. When set to true you're responsible for
  /// responding to HELP and STOP requests. You're also responsible for tracking
  /// and honoring opt-out requests.
  final bool selfManagedOptOutsEnabled;

  /// The current status of the RCS agent.
  final RcsAgentStatus status;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool twoWayEnabled;

  /// The name of the OptOutList associated with the RCS agent.
  final String? optOutListName;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

  UpdateRcsAgentResult({
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.rcsAgentArn,
    required this.rcsAgentId,
    required this.selfManagedOptOutsEnabled,
    required this.status,
    required this.twoWayEnabled,
    this.optOutListName,
    this.twoWayChannelArn,
    this.twoWayChannelRole,
  });

  factory UpdateRcsAgentResult.fromJson(Map<String, dynamic> json) {
    return UpdateRcsAgentResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      rcsAgentArn: (json['RcsAgentArn'] as String?) ?? '',
      rcsAgentId: (json['RcsAgentId'] as String?) ?? '',
      selfManagedOptOutsEnabled:
          (json['SelfManagedOptOutsEnabled'] as bool?) ?? false,
      status: RcsAgentStatus.fromString((json['Status'] as String?) ?? ''),
      twoWayEnabled: (json['TwoWayEnabled'] as bool?) ?? false,
      optOutListName: json['OptOutListName'] as String?,
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final rcsAgentArn = this.rcsAgentArn;
    final rcsAgentId = this.rcsAgentId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final twoWayEnabled = this.twoWayEnabled;
    final optOutListName = this.optOutListName;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayChannelRole = this.twoWayChannelRole;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'RcsAgentArn': rcsAgentArn,
      'RcsAgentId': rcsAgentId,
      'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      'Status': status.value,
      'TwoWayEnabled': twoWayEnabled,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
    };
  }
}

class UpdateSenderIdResult {
  /// By default this is set to false. When set to true the sender ID can't be
  /// deleted.
  final bool deletionProtectionEnabled;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String isoCountryCode;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final List<MessageType> messageTypes;

  /// The monthly price, in US dollars, to lease the sender ID.
  final String monthlyLeasingPrice;

  /// True if the sender ID is registered..
  final bool registered;

  /// The sender ID that was updated.
  final String senderId;

  /// The Amazon Resource Name (ARN) associated with the SenderId.
  final String senderIdArn;

  /// The unique identifier for the registration.
  final String? registrationId;

  UpdateSenderIdResult({
    required this.deletionProtectionEnabled,
    required this.isoCountryCode,
    required this.messageTypes,
    required this.monthlyLeasingPrice,
    required this.registered,
    required this.senderId,
    required this.senderIdArn,
    this.registrationId,
  });

  factory UpdateSenderIdResult.fromJson(Map<String, dynamic> json) {
    return UpdateSenderIdResult(
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      isoCountryCode: (json['IsoCountryCode'] as String?) ?? '',
      messageTypes: ((json['MessageTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => MessageType.fromString((e as String)))
          .toList(),
      monthlyLeasingPrice: (json['MonthlyLeasingPrice'] as String?) ?? '',
      registered: (json['Registered'] as bool?) ?? false,
      senderId: (json['SenderId'] as String?) ?? '',
      senderIdArn: (json['SenderIdArn'] as String?) ?? '',
      registrationId: json['RegistrationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final isoCountryCode = this.isoCountryCode;
    final messageTypes = this.messageTypes;
    final monthlyLeasingPrice = this.monthlyLeasingPrice;
    final registered = this.registered;
    final senderId = this.senderId;
    final senderIdArn = this.senderIdArn;
    final registrationId = this.registrationId;
    return {
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'IsoCountryCode': isoCountryCode,
      'MessageTypes': messageTypes.map((e) => e.value).toList(),
      'MonthlyLeasingPrice': monthlyLeasingPrice,
      'Registered': registered,
      'SenderId': senderId,
      'SenderIdArn': senderIdArn,
      if (registrationId != null) 'RegistrationId': registrationId,
    };
  }
}

class VerifyDestinationNumberResult {
  /// The time when the destination phone number was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The phone number in E.164 format.
  final String destinationPhoneNumber;

  /// The status for being able to send messages to the phone number.
  final VerificationStatus status;

  /// The Amazon Resource Name (ARN) for the verified destination phone number.
  final String verifiedDestinationNumberArn;

  /// The unique identifier for the verified destination phone number.
  final String verifiedDestinationNumberId;

  VerifyDestinationNumberResult({
    required this.createdTimestamp,
    required this.destinationPhoneNumber,
    required this.status,
    required this.verifiedDestinationNumberArn,
    required this.verifiedDestinationNumberId,
  });

  factory VerifyDestinationNumberResult.fromJson(Map<String, dynamic> json) {
    return VerifyDestinationNumberResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      destinationPhoneNumber: (json['DestinationPhoneNumber'] as String?) ?? '',
      status: VerificationStatus.fromString((json['Status'] as String?) ?? ''),
      verifiedDestinationNumberArn:
          (json['VerifiedDestinationNumberArn'] as String?) ?? '',
      verifiedDestinationNumberId:
          (json['VerifiedDestinationNumberId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final destinationPhoneNumber = this.destinationPhoneNumber;
    final status = this.status;
    final verifiedDestinationNumberArn = this.verifiedDestinationNumberArn;
    final verifiedDestinationNumberId = this.verifiedDestinationNumberId;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DestinationPhoneNumber': destinationPhoneNumber,
      'Status': status.value,
      'VerifiedDestinationNumberArn': verifiedDestinationNumberArn,
      'VerifiedDestinationNumberId': verifiedDestinationNumberId,
    };
  }
}

class VerificationStatus {
  static const pending = VerificationStatus._('PENDING');
  static const verified = VerificationStatus._('VERIFIED');
  static const unsupported = VerificationStatus._('UNSUPPORTED');

  final String value;

  const VerificationStatus._(this.value);

  static const values = [pending, verified, unsupported];

  static VerificationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VerificationStatus._(value));

  @override
  bool operator ==(other) =>
      other is VerificationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class MessageType {
  static const transactional = MessageType._('TRANSACTIONAL');
  static const promotional = MessageType._('PROMOTIONAL');

  final String value;

  const MessageType._(this.value);

  static const values = [transactional, promotional];

  static MessageType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MessageType._(value));

  @override
  bool operator ==(other) => other is MessageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The current status of the RCS agent.
///
/// <ul>
/// <li>
/// <code>CREATED</code>: The RCS agent has been created.
/// </li>
/// <li>
/// <code>PENDING</code>: The RCS agent is pending review.
/// </li>
/// <li>
/// <code>TESTING</code>: The RCS agent is in testing.
/// </li>
/// <li>
/// <code>PARTIAL</code>: The RCS agent is partially active.
/// </li>
/// <li>
/// <code>ACTIVE</code>: The RCS agent is active and available for use.
/// </li>
/// <li>
/// <code>DELETED</code>: The RCS agent has been deleted.
/// </li>
/// </ul>
class RcsAgentStatus {
  static const created = RcsAgentStatus._('CREATED');
  static const pending = RcsAgentStatus._('PENDING');
  static const testing = RcsAgentStatus._('TESTING');
  static const partial = RcsAgentStatus._('PARTIAL');
  static const active = RcsAgentStatus._('ACTIVE');
  static const deleted = RcsAgentStatus._('DELETED');

  final String value;

  const RcsAgentStatus._(this.value);

  static const values = [created, pending, testing, partial, active, deleted];

  static RcsAgentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RcsAgentStatus._(value));

  @override
  bool operator ==(other) => other is RcsAgentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class NumberCapability {
  static const sms = NumberCapability._('SMS');
  static const voice = NumberCapability._('VOICE');
  static const mms = NumberCapability._('MMS');
  static const rcs = NumberCapability._('RCS');

  final String value;

  const NumberCapability._(this.value);

  static const values = [sms, voice, mms, rcs];

  static NumberCapability fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NumberCapability._(value));

  @override
  bool operator ==(other) => other is NumberCapability && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The types of statuses that can be used.
class ProtectConfigurationCountryRuleSetInformation {
  /// The types of protection that can be used.
  final ProtectStatus protectStatus;

  ProtectConfigurationCountryRuleSetInformation({
    required this.protectStatus,
  });

  factory ProtectConfigurationCountryRuleSetInformation.fromJson(
      Map<String, dynamic> json) {
    return ProtectConfigurationCountryRuleSetInformation(
      protectStatus:
          ProtectStatus.fromString((json['ProtectStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final protectStatus = this.protectStatus;
    return {
      'ProtectStatus': protectStatus.value,
    };
  }
}

class ProtectStatus {
  static const allow = ProtectStatus._('ALLOW');
  static const block = ProtectStatus._('BLOCK');
  static const monitor = ProtectStatus._('MONITOR');
  static const filter = ProtectStatus._('FILTER');

  final String value;

  const ProtectStatus._(this.value);

  static const values = [allow, block, monitor, filter];

  static ProtectStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProtectStatus._(value));

  @override
  bool operator ==(other) => other is ProtectStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PoolStatus {
  static const creating = PoolStatus._('CREATING');
  static const active = PoolStatus._('ACTIVE');
  static const deleting = PoolStatus._('DELETING');

  final String value;

  const PoolStatus._(this.value);

  static const values = [creating, active, deleting];

  static PoolStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PoolStatus._(value));

  @override
  bool operator ==(other) => other is PoolStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class NumberStatus {
  static const pending = NumberStatus._('PENDING');
  static const active = NumberStatus._('ACTIVE');
  static const associating = NumberStatus._('ASSOCIATING');
  static const disassociating = NumberStatus._('DISASSOCIATING');
  static const deleted = NumberStatus._('DELETED');

  final String value;

  const NumberStatus._(this.value);

  static const values = [pending, active, associating, disassociating, deleted];

  static NumberStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => NumberStatus._(value));

  @override
  bool operator ==(other) => other is NumberStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class NumberType {
  static const shortCode = NumberType._('SHORT_CODE');
  static const longCode = NumberType._('LONG_CODE');
  static const tollFree = NumberType._('TOLL_FREE');
  static const tenDlc = NumberType._('TEN_DLC');
  static const simulator = NumberType._('SIMULATOR');

  final String value;

  const NumberType._(this.value);

  static const values = [shortCode, longCode, tollFree, tenDlc, simulator];

  static NumberType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => NumberType._(value));

  @override
  bool operator ==(other) => other is NumberType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The use case for a notify configuration.
///
/// <ul>
/// <li>
/// <code>CODE_VERIFICATION</code> - Code verification use case.
/// </li>
/// </ul>
class NotifyConfigurationUseCase {
  static const codeVerification =
      NotifyConfigurationUseCase._('CODE_VERIFICATION');

  final String value;

  const NotifyConfigurationUseCase._(this.value);

  static const values = [codeVerification];

  static NotifyConfigurationUseCase fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotifyConfigurationUseCase._(value));

  @override
  bool operator ==(other) =>
      other is NotifyConfigurationUseCase && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The tier of a notify configuration.
///
/// <ul>
/// <li>
/// <code>BASIC</code> - Basic tier.
/// </li>
/// <li>
/// <code>ADVANCED</code> - Advanced tier.
/// </li>
/// </ul>
class NotifyConfigurationTier {
  static const basic = NotifyConfigurationTier._('BASIC');
  static const advanced = NotifyConfigurationTier._('ADVANCED');

  final String value;

  const NotifyConfigurationTier._(this.value);

  static const values = [basic, advanced];

  static NotifyConfigurationTier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotifyConfigurationTier._(value));

  @override
  bool operator ==(other) =>
      other is NotifyConfigurationTier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The tier upgrade status of a notify configuration.
///
/// <ul>
/// <li>
/// <code>BASIC</code> - Currently at basic tier.
/// </li>
/// <li>
/// <code>PENDING_UPGRADE</code> - Upgrade to advanced tier is pending.
/// </li>
/// <li>
/// <code>ADVANCED</code> - Currently at advanced tier.
/// </li>
/// <li>
/// <code>REJECTED</code> - Tier upgrade was rejected.
/// </li>
/// </ul>
class TierUpgradeStatus {
  static const basic = TierUpgradeStatus._('BASIC');
  static const pendingUpgrade = TierUpgradeStatus._('PENDING_UPGRADE');
  static const advanced = TierUpgradeStatus._('ADVANCED');
  static const rejected = TierUpgradeStatus._('REJECTED');

  final String value;

  const TierUpgradeStatus._(this.value);

  static const values = [basic, pendingUpgrade, advanced, rejected];

  static TierUpgradeStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TierUpgradeStatus._(value));

  @override
  bool operator ==(other) => other is TierUpgradeStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The status of a notify configuration.
///
/// <ul>
/// <li>
/// <code>PENDING</code> - The notify configuration is pending review.
/// </li>
/// <li>
/// <code>ACTIVE</code> - The notify configuration is active and can be used.
/// </li>
/// <li>
/// <code>REJECTED</code> - The notify configuration was rejected.
/// </li>
/// <li>
/// <code>REQUIRES_VERIFICATION</code> - The notify configuration requires
/// verification.
/// </li>
/// </ul>
class NotifyConfigurationStatus {
  static const pending = NotifyConfigurationStatus._('PENDING');
  static const active = NotifyConfigurationStatus._('ACTIVE');
  static const rejected = NotifyConfigurationStatus._('REJECTED');
  static const requiresVerification =
      NotifyConfigurationStatus._('REQUIRES_VERIFICATION');

  final String value;

  const NotifyConfigurationStatus._(this.value);

  static const values = [pending, active, rejected, requiresVerification];

  static NotifyConfigurationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotifyConfigurationStatus._(value));

  @override
  bool operator ==(other) =>
      other is NotifyConfigurationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about an event destination.
///
/// Event destinations are associated with configuration sets, which enable you
/// to publish message sending events to CloudWatch, Firehose, or Amazon SNS.
class EventDestination {
  /// When set to true events will be logged.
  final bool enabled;

  /// The name of the EventDestination.
  final String eventDestinationName;

  /// An array of event types that determine which events to log.
  /// <note>
  /// The <code>TEXT_SENT</code> event type is not supported.
  /// </note>
  final List<EventType> matchingEventTypes;

  /// An object that contains information about an event destination that sends
  /// logging events to Amazon CloudWatch logs.
  final CloudWatchLogsDestination? cloudWatchLogsDestination;

  /// An object that contains information about an event destination for logging
  /// to Amazon Data Firehose.
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
      enabled: (json['Enabled'] as bool?) ?? false,
      eventDestinationName: (json['EventDestinationName'] as String?) ?? '',
      matchingEventTypes: ((json['MatchingEventTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => EventType.fromString((e as String)))
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
      'MatchingEventTypes': matchingEventTypes.map((e) => e.value).toList(),
      if (cloudWatchLogsDestination != null)
        'CloudWatchLogsDestination': cloudWatchLogsDestination,
      if (kinesisFirehoseDestination != null)
        'KinesisFirehoseDestination': kinesisFirehoseDestination,
      if (snsDestination != null) 'SnsDestination': snsDestination,
    };
  }
}

/// Contains the destination configuration to use when publishing message
/// sending events.
class CloudWatchLogsDestination {
  /// The Amazon Resource Name (ARN) of an Identity and Access Management role
  /// that is able to write event data to an Amazon CloudWatch destination.
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
      iamRoleArn: (json['IamRoleArn'] as String?) ?? '',
      logGroupArn: (json['LogGroupArn'] as String?) ?? '',
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

/// Contains the delivery stream Amazon Resource Name (ARN), and the ARN of the
/// Identity and Access Management (IAM) role associated with a Firehose event
/// destination.
///
/// Event destinations, such as Firehose, are associated with configuration
/// sets, which enable you to publish message sending events.
class KinesisFirehoseDestination {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  final String deliveryStreamArn;

  /// The ARN of an Identity and Access Management role that is able to write
  /// event data to an Amazon Data Firehose destination.
  final String iamRoleArn;

  KinesisFirehoseDestination({
    required this.deliveryStreamArn,
    required this.iamRoleArn,
  });

  factory KinesisFirehoseDestination.fromJson(Map<String, dynamic> json) {
    return KinesisFirehoseDestination(
      deliveryStreamArn: (json['DeliveryStreamArn'] as String?) ?? '',
      iamRoleArn: (json['IamRoleArn'] as String?) ?? '',
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
      topicArn: (json['TopicArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    return {
      'TopicArn': topicArn,
    };
  }
}

class EventType {
  static const all = EventType._('ALL');
  static const textAll = EventType._('TEXT_ALL');
  static const textSent = EventType._('TEXT_SENT');
  static const textPending = EventType._('TEXT_PENDING');
  static const textQueued = EventType._('TEXT_QUEUED');
  static const textSuccessful = EventType._('TEXT_SUCCESSFUL');
  static const textDelivered = EventType._('TEXT_DELIVERED');
  static const textInvalid = EventType._('TEXT_INVALID');
  static const textInvalidMessage = EventType._('TEXT_INVALID_MESSAGE');
  static const textUnreachable = EventType._('TEXT_UNREACHABLE');
  static const textCarrierUnreachable = EventType._('TEXT_CARRIER_UNREACHABLE');
  static const textBlocked = EventType._('TEXT_BLOCKED');
  static const textCarrierBlocked = EventType._('TEXT_CARRIER_BLOCKED');
  static const textSpam = EventType._('TEXT_SPAM');
  static const textUnknown = EventType._('TEXT_UNKNOWN');
  static const textTtlExpired = EventType._('TEXT_TTL_EXPIRED');
  static const textProtectBlocked = EventType._('TEXT_PROTECT_BLOCKED');
  static const voiceAll = EventType._('VOICE_ALL');
  static const voiceInitiated = EventType._('VOICE_INITIATED');
  static const voiceRinging = EventType._('VOICE_RINGING');
  static const voiceAnswered = EventType._('VOICE_ANSWERED');
  static const voiceCompleted = EventType._('VOICE_COMPLETED');
  static const voiceBusy = EventType._('VOICE_BUSY');
  static const voiceNoAnswer = EventType._('VOICE_NO_ANSWER');
  static const voiceFailed = EventType._('VOICE_FAILED');
  static const voiceTtlExpired = EventType._('VOICE_TTL_EXPIRED');
  static const mediaAll = EventType._('MEDIA_ALL');
  static const mediaPending = EventType._('MEDIA_PENDING');
  static const mediaQueued = EventType._('MEDIA_QUEUED');
  static const mediaSuccessful = EventType._('MEDIA_SUCCESSFUL');
  static const mediaDelivered = EventType._('MEDIA_DELIVERED');
  static const mediaInvalid = EventType._('MEDIA_INVALID');
  static const mediaInvalidMessage = EventType._('MEDIA_INVALID_MESSAGE');
  static const mediaUnreachable = EventType._('MEDIA_UNREACHABLE');
  static const mediaCarrierUnreachable =
      EventType._('MEDIA_CARRIER_UNREACHABLE');
  static const mediaBlocked = EventType._('MEDIA_BLOCKED');
  static const mediaCarrierBlocked = EventType._('MEDIA_CARRIER_BLOCKED');
  static const mediaSpam = EventType._('MEDIA_SPAM');
  static const mediaUnknown = EventType._('MEDIA_UNKNOWN');
  static const mediaTtlExpired = EventType._('MEDIA_TTL_EXPIRED');
  static const mediaFileInaccessible = EventType._('MEDIA_FILE_INACCESSIBLE');
  static const mediaFileTypeUnsupported =
      EventType._('MEDIA_FILE_TYPE_UNSUPPORTED');
  static const mediaFileSizeExceeded = EventType._('MEDIA_FILE_SIZE_EXCEEDED');

  final String value;

  const EventType._(this.value);

  static const values = [
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
    textProtectBlocked,
    voiceAll,
    voiceInitiated,
    voiceRinging,
    voiceAnswered,
    voiceCompleted,
    voiceBusy,
    voiceNoAnswer,
    voiceFailed,
    voiceTtlExpired,
    mediaAll,
    mediaPending,
    mediaQueued,
    mediaSuccessful,
    mediaDelivered,
    mediaInvalid,
    mediaInvalidMessage,
    mediaUnreachable,
    mediaCarrierUnreachable,
    mediaBlocked,
    mediaCarrierBlocked,
    mediaSpam,
    mediaUnknown,
    mediaTtlExpired,
    mediaFileInaccessible,
    mediaFileTypeUnsupported,
    mediaFileSizeExceeded
  ];

  static EventType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventType._(value));

  @override
  bool operator ==(other) => other is EventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
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

class RegistrationVersionStatus {
  static const draft = RegistrationVersionStatus._('DRAFT');
  static const submitted = RegistrationVersionStatus._('SUBMITTED');
  static const awsReviewing = RegistrationVersionStatus._('AWS_REVIEWING');
  static const reviewing = RegistrationVersionStatus._('REVIEWING');
  static const requiresAuthentication =
      RegistrationVersionStatus._('REQUIRES_AUTHENTICATION');
  static const approved = RegistrationVersionStatus._('APPROVED');
  static const discarded = RegistrationVersionStatus._('DISCARDED');
  static const denied = RegistrationVersionStatus._('DENIED');
  static const revoked = RegistrationVersionStatus._('REVOKED');
  static const archived = RegistrationVersionStatus._('ARCHIVED');
  static const requiresOfflineReview =
      RegistrationVersionStatus._('REQUIRES_OFFLINE_REVIEW');

  final String value;

  const RegistrationVersionStatus._(this.value);

  static const values = [
    draft,
    submitted,
    awsReviewing,
    reviewing,
    requiresAuthentication,
    approved,
    discarded,
    denied,
    revoked,
    archived,
    requiresOfflineReview
  ];

  static RegistrationVersionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationVersionStatus._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationVersionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The <b>RegistrationVersionStatusHistory</b> object contains the time stamps
/// for when the reservations status changes.
class RegistrationVersionStatusHistory {
  /// The time when the registration was in the draft state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime draftTimestamp;

  /// The time when the registration was in the approved state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? approvedTimestamp;

  /// The time when the registration was in the archived state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? archivedTimestamp;

  /// The time when the registration was in the AWS reviewing state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? awsReviewingTimestamp;

  /// The time when the registration was in the denied state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? deniedTimestamp;

  /// The time when the registration was in the discarded state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? discardedTimestamp;

  /// The time when the registration was in the requires authentication state, in
  /// <a href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? requiresAuthenticationTimestamp;

  /// The time when the registration was in the reviewing state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? reviewingTimestamp;

  /// The time when the registration was in the revoked state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? revokedTimestamp;

  /// The time when the registration was in the submitted state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? submittedTimestamp;

  RegistrationVersionStatusHistory({
    required this.draftTimestamp,
    this.approvedTimestamp,
    this.archivedTimestamp,
    this.awsReviewingTimestamp,
    this.deniedTimestamp,
    this.discardedTimestamp,
    this.requiresAuthenticationTimestamp,
    this.reviewingTimestamp,
    this.revokedTimestamp,
    this.submittedTimestamp,
  });

  factory RegistrationVersionStatusHistory.fromJson(Map<String, dynamic> json) {
    return RegistrationVersionStatusHistory(
      draftTimestamp: nonNullableTimeStampFromJson(json['DraftTimestamp'] ?? 0),
      approvedTimestamp: timeStampFromJson(json['ApprovedTimestamp']),
      archivedTimestamp: timeStampFromJson(json['ArchivedTimestamp']),
      awsReviewingTimestamp: timeStampFromJson(json['AwsReviewingTimestamp']),
      deniedTimestamp: timeStampFromJson(json['DeniedTimestamp']),
      discardedTimestamp: timeStampFromJson(json['DiscardedTimestamp']),
      requiresAuthenticationTimestamp:
          timeStampFromJson(json['RequiresAuthenticationTimestamp']),
      reviewingTimestamp: timeStampFromJson(json['ReviewingTimestamp']),
      revokedTimestamp: timeStampFromJson(json['RevokedTimestamp']),
      submittedTimestamp: timeStampFromJson(json['SubmittedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final draftTimestamp = this.draftTimestamp;
    final approvedTimestamp = this.approvedTimestamp;
    final archivedTimestamp = this.archivedTimestamp;
    final awsReviewingTimestamp = this.awsReviewingTimestamp;
    final deniedTimestamp = this.deniedTimestamp;
    final discardedTimestamp = this.discardedTimestamp;
    final requiresAuthenticationTimestamp =
        this.requiresAuthenticationTimestamp;
    final reviewingTimestamp = this.reviewingTimestamp;
    final revokedTimestamp = this.revokedTimestamp;
    final submittedTimestamp = this.submittedTimestamp;
    return {
      'DraftTimestamp': unixTimestampToJson(draftTimestamp),
      if (approvedTimestamp != null)
        'ApprovedTimestamp': unixTimestampToJson(approvedTimestamp),
      if (archivedTimestamp != null)
        'ArchivedTimestamp': unixTimestampToJson(archivedTimestamp),
      if (awsReviewingTimestamp != null)
        'AwsReviewingTimestamp': unixTimestampToJson(awsReviewingTimestamp),
      if (deniedTimestamp != null)
        'DeniedTimestamp': unixTimestampToJson(deniedTimestamp),
      if (discardedTimestamp != null)
        'DiscardedTimestamp': unixTimestampToJson(discardedTimestamp),
      if (requiresAuthenticationTimestamp != null)
        'RequiresAuthenticationTimestamp':
            unixTimestampToJson(requiresAuthenticationTimestamp),
      if (reviewingTimestamp != null)
        'ReviewingTimestamp': unixTimestampToJson(reviewingTimestamp),
      if (revokedTimestamp != null)
        'RevokedTimestamp': unixTimestampToJson(revokedTimestamp),
      if (submittedTimestamp != null)
        'SubmittedTimestamp': unixTimestampToJson(submittedTimestamp),
    };
  }
}

class VoiceMessageBodyTextType {
  static const text = VoiceMessageBodyTextType._('TEXT');
  static const ssml = VoiceMessageBodyTextType._('SSML');

  final String value;

  const VoiceMessageBodyTextType._(this.value);

  static const values = [text, ssml];

  static VoiceMessageBodyTextType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VoiceMessageBodyTextType._(value));

  @override
  bool operator ==(other) =>
      other is VoiceMessageBodyTextType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class VoiceId {
  static const amy = VoiceId._('AMY');
  static const astrid = VoiceId._('ASTRID');
  static const bianca = VoiceId._('BIANCA');
  static const brian = VoiceId._('BRIAN');
  static const camila = VoiceId._('CAMILA');
  static const carla = VoiceId._('CARLA');
  static const carmen = VoiceId._('CARMEN');
  static const celine = VoiceId._('CELINE');
  static const chantal = VoiceId._('CHANTAL');
  static const conchita = VoiceId._('CONCHITA');
  static const cristiano = VoiceId._('CRISTIANO');
  static const dora = VoiceId._('DORA');
  static const emma = VoiceId._('EMMA');
  static const enrique = VoiceId._('ENRIQUE');
  static const ewa = VoiceId._('EWA');
  static const filiz = VoiceId._('FILIZ');
  static const geraint = VoiceId._('GERAINT');
  static const giorgio = VoiceId._('GIORGIO');
  static const gwyneth = VoiceId._('GWYNETH');
  static const hans = VoiceId._('HANS');
  static const ines = VoiceId._('INES');
  static const ivy = VoiceId._('IVY');
  static const jacek = VoiceId._('JACEK');
  static const jan = VoiceId._('JAN');
  static const joanna = VoiceId._('JOANNA');
  static const joey = VoiceId._('JOEY');
  static const justin = VoiceId._('JUSTIN');
  static const karl = VoiceId._('KARL');
  static const kendra = VoiceId._('KENDRA');
  static const kimberly = VoiceId._('KIMBERLY');
  static const lea = VoiceId._('LEA');
  static const liv = VoiceId._('LIV');
  static const lotte = VoiceId._('LOTTE');
  static const lucia = VoiceId._('LUCIA');
  static const lupe = VoiceId._('LUPE');
  static const mads = VoiceId._('MADS');
  static const maja = VoiceId._('MAJA');
  static const marlene = VoiceId._('MARLENE');
  static const mathieu = VoiceId._('MATHIEU');
  static const matthew = VoiceId._('MATTHEW');
  static const maxim = VoiceId._('MAXIM');
  static const mia = VoiceId._('MIA');
  static const miguel = VoiceId._('MIGUEL');
  static const mizuki = VoiceId._('MIZUKI');
  static const naja = VoiceId._('NAJA');
  static const nicole = VoiceId._('NICOLE');
  static const penelope = VoiceId._('PENELOPE');
  static const raveena = VoiceId._('RAVEENA');
  static const ricardo = VoiceId._('RICARDO');
  static const ruben = VoiceId._('RUBEN');
  static const russell = VoiceId._('RUSSELL');
  static const salli = VoiceId._('SALLI');
  static const seoyeon = VoiceId._('SEOYEON');
  static const takumi = VoiceId._('TAKUMI');
  static const tatyana = VoiceId._('TATYANA');
  static const vicki = VoiceId._('VICKI');
  static const vitoria = VoiceId._('VITORIA');
  static const zeina = VoiceId._('ZEINA');
  static const zhiyu = VoiceId._('ZHIYU');

  final String value;

  const VoiceId._(this.value);

  static const values = [
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
    zhiyu
  ];

  static VoiceId fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VoiceId._(value));

  @override
  bool operator ==(other) => other is VoiceId && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DestinationCountryParameterKey {
  static const inTemplateId =
      DestinationCountryParameterKey._('IN_TEMPLATE_ID');
  static const inEntityId = DestinationCountryParameterKey._('IN_ENTITY_ID');

  final String value;

  const DestinationCountryParameterKey._(this.value);

  static const values = [inTemplateId, inEntityId];

  static DestinationCountryParameterKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DestinationCountryParameterKey._(value));

  @override
  bool operator ==(other) =>
      other is DestinationCountryParameterKey && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class VerificationChannel {
  static const text = VerificationChannel._('TEXT');
  static const voice = VerificationChannel._('VOICE');

  final String value;

  const VerificationChannel._(this.value);

  static const values = [text, voice];

  static VerificationChannel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VerificationChannel._(value));

  @override
  bool operator ==(other) =>
      other is VerificationChannel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class LanguageCode {
  static const deDe = LanguageCode._('DE_DE');
  static const enGb = LanguageCode._('EN_GB');
  static const enUs = LanguageCode._('EN_US');
  static const es_419 = LanguageCode._('ES_419');
  static const esEs = LanguageCode._('ES_ES');
  static const frCa = LanguageCode._('FR_CA');
  static const frFr = LanguageCode._('FR_FR');
  static const itIt = LanguageCode._('IT_IT');
  static const jaJp = LanguageCode._('JA_JP');
  static const koKr = LanguageCode._('KO_KR');
  static const ptBr = LanguageCode._('PT_BR');
  static const zhCn = LanguageCode._('ZH_CN');
  static const zhTw = LanguageCode._('ZH_TW');

  final String value;

  const LanguageCode._(this.value);

  static const values = [
    deDe,
    enGb,
    enUs,
    es_419,
    esEs,
    frCa,
    frFr,
    itIt,
    jaJp,
    koKr,
    ptBr,
    zhCn,
    zhTw
  ];

  static LanguageCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LanguageCode._(value));

  @override
  bool operator ==(other) => other is LanguageCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class RequestableNumberType {
  static const longCode = RequestableNumberType._('LONG_CODE');
  static const tollFree = RequestableNumberType._('TOLL_FREE');
  static const tenDlc = RequestableNumberType._('TEN_DLC');
  static const simulator = RequestableNumberType._('SIMULATOR');

  final String value;

  const RequestableNumberType._(this.value);

  static const values = [longCode, tollFree, tenDlc, simulator];

  static RequestableNumberType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RequestableNumberType._(value));

  @override
  bool operator ==(other) =>
      other is RequestableNumberType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ProtectConfigurationRuleOverrideAction {
  static const allow = ProtectConfigurationRuleOverrideAction._('ALLOW');
  static const block = ProtectConfigurationRuleOverrideAction._('BLOCK');

  final String value;

  const ProtectConfigurationRuleOverrideAction._(this.value);

  static const values = [allow, block];

  static ProtectConfigurationRuleOverrideAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProtectConfigurationRuleOverrideAction._(value));

  @override
  bool operator ==(other) =>
      other is ProtectConfigurationRuleOverrideAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class MessageFeedbackStatus {
  static const received = MessageFeedbackStatus._('RECEIVED');
  static const failed = MessageFeedbackStatus._('FAILED');

  final String value;

  const MessageFeedbackStatus._(this.value);

  static const values = [received, failed];

  static MessageFeedbackStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MessageFeedbackStatus._(value));

  @override
  bool operator ==(other) =>
      other is MessageFeedbackStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class KeywordAction {
  static const automaticResponse = KeywordAction._('AUTOMATIC_RESPONSE');
  static const optOut = KeywordAction._('OPT_OUT');
  static const optIn = KeywordAction._('OPT_IN');

  final String value;

  const KeywordAction._(this.value);

  static const values = [automaticResponse, optOut, optIn];

  static KeywordAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KeywordAction._(value));

  @override
  bool operator ==(other) => other is KeywordAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Metadata for the origination identity that is associated with the
/// registration.
class RegistrationAssociationMetadata {
  /// The Amazon Resource Name (ARN) of the origination identity that is
  /// associated with the registration.
  final String resourceArn;

  /// The unique identifier for the origination identity. For example this could
  /// be a <b>PhoneNumberId</b> or <b>SenderId</b>.
  final String resourceId;

  /// The origination identity type.
  final String resourceType;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  /// The phone number associated with the registration in E.164 format.
  final String? phoneNumber;

  RegistrationAssociationMetadata({
    required this.resourceArn,
    required this.resourceId,
    required this.resourceType,
    this.isoCountryCode,
    this.phoneNumber,
  });

  factory RegistrationAssociationMetadata.fromJson(Map<String, dynamic> json) {
    return RegistrationAssociationMetadata(
      resourceArn: (json['ResourceArn'] as String?) ?? '',
      resourceId: (json['ResourceId'] as String?) ?? '',
      resourceType: (json['ResourceType'] as String?) ?? '',
      isoCountryCode: json['IsoCountryCode'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final isoCountryCode = this.isoCountryCode;
    final phoneNumber = this.phoneNumber;
    return {
      'ResourceArn': resourceArn,
      'ResourceId': resourceId,
      'ResourceType': resourceType,
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

/// The filter definition for filtering registrations that meets a specified
/// criteria.
class RegistrationAssociationFilter {
  /// The name of the attribute to filter on.
  final RegistrationAssociationFilterName name;

  /// An array of values to filter for.
  final List<String> values;

  RegistrationAssociationFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class RegistrationAssociationFilterName {
  static const resourceType =
      RegistrationAssociationFilterName._('resource-type');
  static const isoCountryCode =
      RegistrationAssociationFilterName._('iso-country-code');

  final String value;

  const RegistrationAssociationFilterName._(this.value);

  static const values = [resourceType, isoCountryCode];

  static RegistrationAssociationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationAssociationFilterName._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationAssociationFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides details on phone number rule overrides for a protect configuration.
class ProtectConfigurationRuleSetNumberOverride {
  /// The action for the rule to perform of either blocking or allowing messages
  /// to the destination phone number.
  final ProtectConfigurationRuleOverrideAction action;

  /// The time when the rule was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The destination phone number in E.164 format.
  final String destinationPhoneNumber;

  /// The time the rule will expire at. If <code>ExpirationTimestamp</code> is not
  /// set then the rule will not expire.
  final DateTime? expirationTimestamp;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  ProtectConfigurationRuleSetNumberOverride({
    required this.action,
    required this.createdTimestamp,
    required this.destinationPhoneNumber,
    this.expirationTimestamp,
    this.isoCountryCode,
  });

  factory ProtectConfigurationRuleSetNumberOverride.fromJson(
      Map<String, dynamic> json) {
    return ProtectConfigurationRuleSetNumberOverride(
      action: ProtectConfigurationRuleOverrideAction.fromString(
          (json['Action'] as String?) ?? ''),
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      destinationPhoneNumber: (json['DestinationPhoneNumber'] as String?) ?? '',
      expirationTimestamp: timeStampFromJson(json['ExpirationTimestamp']),
      isoCountryCode: json['IsoCountryCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdTimestamp = this.createdTimestamp;
    final destinationPhoneNumber = this.destinationPhoneNumber;
    final expirationTimestamp = this.expirationTimestamp;
    final isoCountryCode = this.isoCountryCode;
    return {
      'Action': action.value,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DestinationPhoneNumber': destinationPhoneNumber,
      if (expirationTimestamp != null)
        'ExpirationTimestamp': unixTimestampToJson(expirationTimestamp),
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
    };
  }
}

/// The information for a protect configuration rule set number override that
/// meets a specified criteria.
class ProtectConfigurationRuleSetNumberOverrideFilterItem {
  /// The name of the attribute to filter on.
  final ProtectConfigurationRuleSetNumberOverrideFilterName name;

  /// An array values to filter for.
  final List<String> values;

  ProtectConfigurationRuleSetNumberOverrideFilterItem({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class ProtectConfigurationRuleSetNumberOverrideFilterName {
  static const isoCountryCode =
      ProtectConfigurationRuleSetNumberOverrideFilterName._('iso-country-code');
  static const destinationPhoneNumberBeginsWith =
      ProtectConfigurationRuleSetNumberOverrideFilterName._(
          'destination-phone-number-begins-with');
  static const action =
      ProtectConfigurationRuleSetNumberOverrideFilterName._('action');
  static const expiresBefore =
      ProtectConfigurationRuleSetNumberOverrideFilterName._('expires-before');
  static const expiresAfter =
      ProtectConfigurationRuleSetNumberOverrideFilterName._('expires-after');
  static const createdBefore =
      ProtectConfigurationRuleSetNumberOverrideFilterName._('created-before');
  static const createdAfter =
      ProtectConfigurationRuleSetNumberOverrideFilterName._('created-after');

  final String value;

  const ProtectConfigurationRuleSetNumberOverrideFilterName._(this.value);

  static const values = [
    isoCountryCode,
    destinationPhoneNumberBeginsWith,
    action,
    expiresBefore,
    expiresAfter,
    createdBefore,
    createdAfter
  ];

  static ProtectConfigurationRuleSetNumberOverrideFilterName fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              ProtectConfigurationRuleSetNumberOverrideFilterName._(value));

  @override
  bool operator ==(other) =>
      other is ProtectConfigurationRuleSetNumberOverrideFilterName &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The metadata for an origination identity associated with a pool.
class OriginationIdentityMetadata {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region. This field is optional and may not be present for origination
  /// identity types that are not country-specific, such as RCS agents.
  final String isoCountryCode;

  /// Describes if the origination identity can be used for text messages, voice
  /// calls or both.
  final List<NumberCapability> numberCapabilities;

  /// The unique identifier of the origination identity.
  final String originationIdentity;

  /// The Amazon Resource Name (ARN) associated with the origination identity.
  final String originationIdentityArn;

  /// The phone number in E.164 format.
  final String? phoneNumber;

  OriginationIdentityMetadata({
    required this.isoCountryCode,
    required this.numberCapabilities,
    required this.originationIdentity,
    required this.originationIdentityArn,
    this.phoneNumber,
  });

  factory OriginationIdentityMetadata.fromJson(Map<String, dynamic> json) {
    return OriginationIdentityMetadata(
      isoCountryCode: (json['IsoCountryCode'] as String?) ?? '',
      numberCapabilities: ((json['NumberCapabilities'] as List?) ?? const [])
          .nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      originationIdentity: (json['OriginationIdentity'] as String?) ?? '',
      originationIdentityArn: (json['OriginationIdentityArn'] as String?) ?? '',
      phoneNumber: json['PhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isoCountryCode = this.isoCountryCode;
    final numberCapabilities = this.numberCapabilities;
    final originationIdentity = this.originationIdentity;
    final originationIdentityArn = this.originationIdentityArn;
    final phoneNumber = this.phoneNumber;
    return {
      'IsoCountryCode': isoCountryCode,
      'NumberCapabilities': numberCapabilities.map((e) => e.value).toList(),
      'OriginationIdentity': originationIdentity,
      'OriginationIdentityArn': originationIdentityArn,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class PoolOriginationIdentitiesFilterName {
  static const isoCountryCode =
      PoolOriginationIdentitiesFilterName._('iso-country-code');
  static const numberCapability =
      PoolOriginationIdentitiesFilterName._('number-capability');

  final String value;

  const PoolOriginationIdentitiesFilterName._(this.value);

  static const values = [isoCountryCode, numberCapability];

  static PoolOriginationIdentitiesFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PoolOriginationIdentitiesFilterName._(value));

  @override
  bool operator ==(other) =>
      other is PoolOriginationIdentitiesFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The information for a country that supports notify messaging.
class NotifyCountryInformation {
  /// The name of the country.
  final String countryName;

  /// Whether a customer-owned identity is required to send notify messages to
  /// this country.
  final bool customerOwnedIdentityRequired;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String isoCountryCode;

  /// An array of supported channels for the country. Supported values include
  /// <code>SMS</code> and <code>VOICE</code>.
  final List<NumberCapability> supportedChannels;

  /// An array of supported tiers for the country.
  final List<NotifyConfigurationTier> supportedTiers;

  /// An array of supported use cases for the country.
  final List<NotifyConfigurationUseCase> supportedUseCases;

  NotifyCountryInformation({
    required this.countryName,
    required this.customerOwnedIdentityRequired,
    required this.isoCountryCode,
    required this.supportedChannels,
    required this.supportedTiers,
    required this.supportedUseCases,
  });

  factory NotifyCountryInformation.fromJson(Map<String, dynamic> json) {
    return NotifyCountryInformation(
      countryName: (json['CountryName'] as String?) ?? '',
      customerOwnedIdentityRequired:
          (json['CustomerOwnedIdentityRequired'] as bool?) ?? false,
      isoCountryCode: (json['IsoCountryCode'] as String?) ?? '',
      supportedChannels: ((json['SupportedChannels'] as List?) ?? const [])
          .nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      supportedTiers: ((json['SupportedTiers'] as List?) ?? const [])
          .nonNulls
          .map((e) => NotifyConfigurationTier.fromString((e as String)))
          .toList(),
      supportedUseCases: ((json['SupportedUseCases'] as List?) ?? const [])
          .nonNulls
          .map((e) => NotifyConfigurationUseCase.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final countryName = this.countryName;
    final customerOwnedIdentityRequired = this.customerOwnedIdentityRequired;
    final isoCountryCode = this.isoCountryCode;
    final supportedChannels = this.supportedChannels;
    final supportedTiers = this.supportedTiers;
    final supportedUseCases = this.supportedUseCases;
    return {
      'CountryName': countryName,
      'CustomerOwnedIdentityRequired': customerOwnedIdentityRequired,
      'IsoCountryCode': isoCountryCode,
      'SupportedChannels': supportedChannels.map((e) => e.value).toList(),
      'SupportedTiers': supportedTiers.map((e) => e.value).toList(),
      'SupportedUseCases': supportedUseCases.map((e) => e.value).toList(),
    };
  }
}

/// Provides information about the requested verified destintion phone number.
class VerifiedDestinationNumberInformation {
  /// The time when the destination phone number was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The verified destination phone number, in E.164 format.
  final String destinationPhoneNumber;

  /// The status of the verified destination phone number.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The phone number hasn't been verified yet.
  /// </li>
  /// <li>
  /// <code>VERIFIED</code>: The phone number is verified and can receive
  /// messages.
  /// </li>
  /// </ul>
  final VerificationStatus status;

  /// The Amazon Resource Name (ARN) for the verified destination phone number.
  final String verifiedDestinationNumberArn;

  /// The unique identifier for the verified destination phone number.
  final String verifiedDestinationNumberId;

  /// The unique identifier of the RCS agent associated with the verified
  /// destination number.
  final String? rcsAgentId;

  VerifiedDestinationNumberInformation({
    required this.createdTimestamp,
    required this.destinationPhoneNumber,
    required this.status,
    required this.verifiedDestinationNumberArn,
    required this.verifiedDestinationNumberId,
    this.rcsAgentId,
  });

  factory VerifiedDestinationNumberInformation.fromJson(
      Map<String, dynamic> json) {
    return VerifiedDestinationNumberInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      destinationPhoneNumber: (json['DestinationPhoneNumber'] as String?) ?? '',
      status: VerificationStatus.fromString((json['Status'] as String?) ?? ''),
      verifiedDestinationNumberArn:
          (json['VerifiedDestinationNumberArn'] as String?) ?? '',
      verifiedDestinationNumberId:
          (json['VerifiedDestinationNumberId'] as String?) ?? '',
      rcsAgentId: json['RcsAgentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final destinationPhoneNumber = this.destinationPhoneNumber;
    final status = this.status;
    final verifiedDestinationNumberArn = this.verifiedDestinationNumberArn;
    final verifiedDestinationNumberId = this.verifiedDestinationNumberId;
    final rcsAgentId = this.rcsAgentId;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DestinationPhoneNumber': destinationPhoneNumber,
      'Status': status.value,
      'VerifiedDestinationNumberArn': verifiedDestinationNumberArn,
      'VerifiedDestinationNumberId': verifiedDestinationNumberId,
      if (rcsAgentId != null) 'RcsAgentId': rcsAgentId,
    };
  }
}

/// The filter definition for filtering verified destination phone numbers that
/// meets a specified criteria.
class VerifiedDestinationNumberFilter {
  /// The name of the attribute to filter on.
  final VerifiedDestinationNumberFilterName name;

  /// An array of values to filter on.
  final List<String> values;

  VerifiedDestinationNumberFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

/// The filter name for filtering verified destination numbers. The available
/// filter names are:
///
/// <ul>
/// <li>
/// <code>status</code>: Filter by verification status.
/// </li>
/// <li>
/// <code>rcs-agent-id</code>: Filter by the RCS agent identifier.
/// </li>
/// </ul>
class VerifiedDestinationNumberFilterName {
  static const status = VerifiedDestinationNumberFilterName._('status');
  static const rcsAgentId =
      VerifiedDestinationNumberFilterName._('rcs-agent-id');

  final String value;

  const VerifiedDestinationNumberFilterName._(this.value);

  static const values = [status, rcsAgentId];

  static VerifiedDestinationNumberFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VerifiedDestinationNumberFilterName._(value));

  @override
  bool operator ==(other) =>
      other is VerifiedDestinationNumberFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes the current monthly spend limits for sending voice and text
/// messages. For more information on increasing your monthly spend limit, see
/// <a
/// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/awssupport-spend-threshold.html">
/// Requesting a spending quota increase </a> in the <i>End User Messaging SMS
/// User Guide</i>.
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
      enforcedLimit: (json['EnforcedLimit'] as int?) ?? 0,
      maxLimit: (json['MaxLimit'] as int?) ?? 0,
      name: SpendLimitName.fromString((json['Name'] as String?) ?? ''),
      overridden: (json['Overridden'] as bool?) ?? false,
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
      'Name': name.value,
      'Overridden': overridden,
    };
  }
}

class SpendLimitName {
  static const textMessageMonthlySpendLimit =
      SpendLimitName._('TEXT_MESSAGE_MONTHLY_SPEND_LIMIT');
  static const voiceMessageMonthlySpendLimit =
      SpendLimitName._('VOICE_MESSAGE_MONTHLY_SPEND_LIMIT');
  static const mediaMessageMonthlySpendLimit =
      SpendLimitName._('MEDIA_MESSAGE_MONTHLY_SPEND_LIMIT');
  static const notifyMessageMonthlySpendLimit =
      SpendLimitName._('NOTIFY_MESSAGE_MONTHLY_SPEND_LIMIT');

  final String value;

  const SpendLimitName._(this.value);

  static const values = [
    textMessageMonthlySpendLimit,
    voiceMessageMonthlySpendLimit,
    mediaMessageMonthlySpendLimit,
    notifyMessageMonthlySpendLimit
  ];

  static SpendLimitName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SpendLimitName._(value));

  @override
  bool operator ==(other) => other is SpendLimitName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The information for all SenderIds in an Amazon Web Services account.
class SenderIdInformation {
  /// By default this is set to false. When set to true the sender ID can't be
  /// deleted.
  final bool deletionProtectionEnabled;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String isoCountryCode;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final List<MessageType> messageTypes;

  /// The monthly leasing price, in US dollars.
  final String monthlyLeasingPrice;

  /// True if the sender ID is registered.
  final bool registered;

  /// The alphanumeric sender ID in a specific country that you'd like to
  /// describe.
  final String senderId;

  /// The Amazon Resource Name (ARN) associated with the SenderId.
  final String senderIdArn;

  /// The unique identifier for the registration.
  final String? registrationId;

  SenderIdInformation({
    required this.deletionProtectionEnabled,
    required this.isoCountryCode,
    required this.messageTypes,
    required this.monthlyLeasingPrice,
    required this.registered,
    required this.senderId,
    required this.senderIdArn,
    this.registrationId,
  });

  factory SenderIdInformation.fromJson(Map<String, dynamic> json) {
    return SenderIdInformation(
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      isoCountryCode: (json['IsoCountryCode'] as String?) ?? '',
      messageTypes: ((json['MessageTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => MessageType.fromString((e as String)))
          .toList(),
      monthlyLeasingPrice: (json['MonthlyLeasingPrice'] as String?) ?? '',
      registered: (json['Registered'] as bool?) ?? false,
      senderId: (json['SenderId'] as String?) ?? '',
      senderIdArn: (json['SenderIdArn'] as String?) ?? '',
      registrationId: json['RegistrationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final isoCountryCode = this.isoCountryCode;
    final messageTypes = this.messageTypes;
    final monthlyLeasingPrice = this.monthlyLeasingPrice;
    final registered = this.registered;
    final senderId = this.senderId;
    final senderIdArn = this.senderIdArn;
    final registrationId = this.registrationId;
    return {
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'IsoCountryCode': isoCountryCode,
      'MessageTypes': messageTypes.map((e) => e.value).toList(),
      'MonthlyLeasingPrice': monthlyLeasingPrice,
      'Registered': registered,
      'SenderId': senderId,
      'SenderIdArn': senderIdArn,
      if (registrationId != null) 'RegistrationId': registrationId,
    };
  }
}

class Owner {
  static const self = Owner._('SELF');
  static const shared = Owner._('SHARED');

  final String value;

  const Owner._(this.value);

  static const values = [self, shared];

  static Owner fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Owner._(value));

  @override
  bool operator ==(other) => other is Owner && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class SenderIdFilterName {
  static const senderId = SenderIdFilterName._('sender-id');
  static const isoCountryCode = SenderIdFilterName._('iso-country-code');
  static const messageType = SenderIdFilterName._('message-type');
  static const deletionProtectionEnabled =
      SenderIdFilterName._('deletion-protection-enabled');
  static const registered = SenderIdFilterName._('registered');

  final String value;

  const SenderIdFilterName._(this.value);

  static const values = [
    senderId,
    isoCountryCode,
    messageType,
    deletionProtectionEnabled,
    registered
  ];

  static SenderIdFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SenderIdFilterName._(value));

  @override
  bool operator ==(other) =>
      other is SenderIdFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The alphanumeric sender ID in a specific country that you want to describe.
/// For more information on sender IDs see <a
/// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/sender-id-request.html">Requesting
/// sender IDs </a> in the <i>End User Messaging SMS User Guide</i>.
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

  Map<String, dynamic> toJson() {
    final isoCountryCode = this.isoCountryCode;
    final senderId = this.senderId;
    return {
      'IsoCountryCode': isoCountryCode,
      'SenderId': senderId,
    };
  }
}

/// Provides information about the specified version of the registration.
class RegistrationVersionInformation {
  /// The status of the registration.
  ///
  /// <ul>
  /// <li>
  /// <code>APPROVED</code>: Your registration has been approved.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code>: Your previously approved registration version moves
  /// into this status when a more recently submitted version is approved.
  /// </li>
  /// <li>
  /// <code>DENIED</code>: You must fix your registration and resubmit it.
  /// </li>
  /// <li>
  /// <code>DISCARDED</code>: You've abandon this version of their registration to
  /// start over with a new version.
  /// </li>
  /// <li>
  /// <code>DRAFT</code>: The initial status of a registration version after it’s
  /// created.
  /// </li>
  /// <li>
  /// <code>REQUIRES_AUTHENTICATION</code>: You need to complete email
  /// authentication.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>REVOKED</code>: Your previously approved registration has been
  /// revoked.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted.
  /// </li>
  /// </ul>
  final RegistrationVersionStatus registrationVersionStatus;

  /// The <b>RegistrationVersionStatusHistory</b> object contains the time stamps
  /// for when the reservations status changes.
  final RegistrationVersionStatusHistory registrationVersionStatusHistory;

  /// The version number of the registration.
  final int versionNumber;

  /// An array of RegistrationDeniedReasonInformation objects.
  final List<RegistrationDeniedReasonInformation>? deniedReasons;

  /// Generative AI feedback information provided during the registration review
  /// process. This includes comments, suggestions, or additional requirements.
  final String? feedback;

  RegistrationVersionInformation({
    required this.registrationVersionStatus,
    required this.registrationVersionStatusHistory,
    required this.versionNumber,
    this.deniedReasons,
    this.feedback,
  });

  factory RegistrationVersionInformation.fromJson(Map<String, dynamic> json) {
    return RegistrationVersionInformation(
      registrationVersionStatus: RegistrationVersionStatus.fromString(
          (json['RegistrationVersionStatus'] as String?) ?? ''),
      registrationVersionStatusHistory:
          RegistrationVersionStatusHistory.fromJson(
              (json['RegistrationVersionStatusHistory']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      versionNumber: (json['VersionNumber'] as int?) ?? 0,
      deniedReasons: (json['DeniedReasons'] as List?)
          ?.nonNulls
          .map((e) => RegistrationDeniedReasonInformation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      feedback: json['Feedback'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationVersionStatus = this.registrationVersionStatus;
    final registrationVersionStatusHistory =
        this.registrationVersionStatusHistory;
    final versionNumber = this.versionNumber;
    final deniedReasons = this.deniedReasons;
    final feedback = this.feedback;
    return {
      'RegistrationVersionStatus': registrationVersionStatus.value,
      'RegistrationVersionStatusHistory': registrationVersionStatusHistory,
      'VersionNumber': versionNumber,
      if (deniedReasons != null) 'DeniedReasons': deniedReasons,
      if (feedback != null) 'Feedback': feedback,
    };
  }
}

/// Provides the reason a registration was rejected.
class RegistrationDeniedReasonInformation {
  /// The reason a registration was rejected.
  final String reason;

  /// A short description of the rejection reason.
  final String shortDescription;

  /// The link to the document.
  final String? documentationLink;

  /// The title of the document.
  final String? documentationTitle;

  /// A long description of the rejection reason.
  final String? longDescription;

  RegistrationDeniedReasonInformation({
    required this.reason,
    required this.shortDescription,
    this.documentationLink,
    this.documentationTitle,
    this.longDescription,
  });

  factory RegistrationDeniedReasonInformation.fromJson(
      Map<String, dynamic> json) {
    return RegistrationDeniedReasonInformation(
      reason: (json['Reason'] as String?) ?? '',
      shortDescription: (json['ShortDescription'] as String?) ?? '',
      documentationLink: json['DocumentationLink'] as String?,
      documentationTitle: json['DocumentationTitle'] as String?,
      longDescription: json['LongDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final shortDescription = this.shortDescription;
    final documentationLink = this.documentationLink;
    final documentationTitle = this.documentationTitle;
    final longDescription = this.longDescription;
    return {
      'Reason': reason,
      'ShortDescription': shortDescription,
      if (documentationLink != null) 'DocumentationLink': documentationLink,
      if (documentationTitle != null) 'DocumentationTitle': documentationTitle,
      if (longDescription != null) 'LongDescription': longDescription,
    };
  }
}

/// The filter definition for filtering registration versions that meets a
/// specified criteria.
class RegistrationVersionFilter {
  /// The name of the attribute to filter on.
  final RegistrationVersionFilterName name;

  /// An array of values to filter on.
  final List<String> values;

  RegistrationVersionFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class RegistrationVersionFilterName {
  static const registrationVersionStatus =
      RegistrationVersionFilterName._('registration-version-status');

  final String value;

  const RegistrationVersionFilterName._(this.value);

  static const values = [registrationVersionStatus];

  static RegistrationVersionFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationVersionFilterName._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationVersionFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information on the supported registration type.
class RegistrationTypeDefinition {
  /// Provides help information on the registration.
  final RegistrationTypeDisplayHints displayHints;

  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  final String registrationType;

  /// The supported association behavior for the registration type.
  final List<SupportedAssociation>? supportedAssociations;

  RegistrationTypeDefinition({
    required this.displayHints,
    required this.registrationType,
    this.supportedAssociations,
  });

  factory RegistrationTypeDefinition.fromJson(Map<String, dynamic> json) {
    return RegistrationTypeDefinition(
      displayHints: RegistrationTypeDisplayHints.fromJson(
          (json['DisplayHints'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      registrationType: (json['RegistrationType'] as String?) ?? '',
      supportedAssociations: (json['SupportedAssociations'] as List?)
          ?.nonNulls
          .map((e) => SupportedAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final displayHints = this.displayHints;
    final registrationType = this.registrationType;
    final supportedAssociations = this.supportedAssociations;
    return {
      'DisplayHints': displayHints,
      'RegistrationType': registrationType,
      if (supportedAssociations != null)
        'SupportedAssociations': supportedAssociations,
    };
  }
}

/// Provides help information on the registration type.
class RegistrationTypeDisplayHints {
  /// The title of the display hint.
  final String title;

  /// The link to the document the display hint is associated with.
  final String? documentationLink;

  /// The title of the document the display hint is associated with.
  final String? documentationTitle;

  /// A full description of the display hint.
  final String? longDescription;

  /// A short description of the display hint.
  final String? shortDescription;

  RegistrationTypeDisplayHints({
    required this.title,
    this.documentationLink,
    this.documentationTitle,
    this.longDescription,
    this.shortDescription,
  });

  factory RegistrationTypeDisplayHints.fromJson(Map<String, dynamic> json) {
    return RegistrationTypeDisplayHints(
      title: (json['Title'] as String?) ?? '',
      documentationLink: json['DocumentationLink'] as String?,
      documentationTitle: json['DocumentationTitle'] as String?,
      longDescription: json['LongDescription'] as String?,
      shortDescription: json['ShortDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final title = this.title;
    final documentationLink = this.documentationLink;
    final documentationTitle = this.documentationTitle;
    final longDescription = this.longDescription;
    final shortDescription = this.shortDescription;
    return {
      'Title': title,
      if (documentationLink != null) 'DocumentationLink': documentationLink,
      if (documentationTitle != null) 'DocumentationTitle': documentationTitle,
      if (longDescription != null) 'LongDescription': longDescription,
      if (shortDescription != null) 'ShortDescription': shortDescription,
    };
  }
}

/// The processing rules for when a registration can be associated with an
/// origination identity and disassociated from an origination identity.
class SupportedAssociation {
  /// The association behavior.
  ///
  /// <ul>
  /// <li>
  /// <code>ASSOCIATE_BEFORE_SUBMIT</code> The origination identity has to be
  /// supplied when creating a registration.
  /// </li>
  /// <li>
  /// <code>ASSOCIATE_ON_APPROVAL</code> This applies to all sender ID
  /// registrations. The sender ID will be automatically provisioned once the
  /// registration is approved.
  /// </li>
  /// <li>
  /// <code>ASSOCIATE_AFTER_COMPLETE</code> This applies to phone number
  /// registrations when you must complete a registration first, then associate
  /// one or more phone numbers later. For example 10DLC campaigns and long codes.
  /// </li>
  /// </ul>
  final RegistrationAssociationBehavior associationBehavior;

  /// The disassociation behavior.
  ///
  /// <ul>
  /// <li>
  /// <code>DISASSOCIATE_ALL_CLOSES_REGISTRATION</code> All origination identities
  /// must be disassociated from the registration before the registration can be
  /// closed.
  /// </li>
  /// <li>
  /// <code>DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION</code> All origination
  /// identities must be disassociated from the registration before the
  /// registration can be deleted.
  /// </li>
  /// <li>
  /// <code>DELETE_REGISTRATION_DISASSOCIATES</code> The registration can be
  /// deleted and all origination identities will be disasscoiated.
  /// </li>
  /// </ul>
  final RegistrationDisassociationBehavior disassociationBehavior;

  /// Defines the behavior of when an origination identity and registration can be
  /// associated with each other.
  final String resourceType;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  SupportedAssociation({
    required this.associationBehavior,
    required this.disassociationBehavior,
    required this.resourceType,
    this.isoCountryCode,
  });

  factory SupportedAssociation.fromJson(Map<String, dynamic> json) {
    return SupportedAssociation(
      associationBehavior: RegistrationAssociationBehavior.fromString(
          (json['AssociationBehavior'] as String?) ?? ''),
      disassociationBehavior: RegistrationDisassociationBehavior.fromString(
          (json['DisassociationBehavior'] as String?) ?? ''),
      resourceType: (json['ResourceType'] as String?) ?? '',
      isoCountryCode: json['IsoCountryCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associationBehavior = this.associationBehavior;
    final disassociationBehavior = this.disassociationBehavior;
    final resourceType = this.resourceType;
    final isoCountryCode = this.isoCountryCode;
    return {
      'AssociationBehavior': associationBehavior.value,
      'DisassociationBehavior': disassociationBehavior.value,
      'ResourceType': resourceType,
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
    };
  }
}

class RegistrationAssociationBehavior {
  static const associateBeforeSubmit =
      RegistrationAssociationBehavior._('ASSOCIATE_BEFORE_SUBMIT');
  static const associateOnApproval =
      RegistrationAssociationBehavior._('ASSOCIATE_ON_APPROVAL');
  static const associateAfterComplete =
      RegistrationAssociationBehavior._('ASSOCIATE_AFTER_COMPLETE');

  final String value;

  const RegistrationAssociationBehavior._(this.value);

  static const values = [
    associateBeforeSubmit,
    associateOnApproval,
    associateAfterComplete
  ];

  static RegistrationAssociationBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationAssociationBehavior._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationAssociationBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class RegistrationDisassociationBehavior {
  static const disassociateAllClosesRegistration =
      RegistrationDisassociationBehavior._(
          'DISASSOCIATE_ALL_CLOSES_REGISTRATION');
  static const disassociateAllAllowsDeleteRegistration =
      RegistrationDisassociationBehavior._(
          'DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION');
  static const deleteRegistrationDisassociates =
      RegistrationDisassociationBehavior._('DELETE_REGISTRATION_DISASSOCIATES');

  final String value;

  const RegistrationDisassociationBehavior._(this.value);

  static const values = [
    disassociateAllClosesRegistration,
    disassociateAllAllowsDeleteRegistration,
    deleteRegistrationDisassociates
  ];

  static RegistrationDisassociationBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationDisassociationBehavior._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationDisassociationBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The filter definition for filtering registration types that meets a
/// specified criteria.
class RegistrationTypeFilter {
  /// The name of the attribute to filter on.
  final RegistrationTypeFilterName name;

  /// An array of values to filter on.
  final List<String> values;

  RegistrationTypeFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class RegistrationTypeFilterName {
  static const supportedAssociationResourceType =
      RegistrationTypeFilterName._('supported-association-resource-type');
  static const supportedAssociationIsoCountryCode =
      RegistrationTypeFilterName._('supported-association-iso-country-code');

  final String value;

  const RegistrationTypeFilterName._(this.value);

  static const values = [
    supportedAssociationResourceType,
    supportedAssociationIsoCountryCode
  ];

  static RegistrationTypeFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationTypeFilterName._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationTypeFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information on the specified section definition.
class RegistrationSectionDefinition {
  /// The path to the section of the registration.
  final RegistrationSectionDisplayHints displayHints;

  /// The path to the section of the registration.
  final String sectionPath;

  RegistrationSectionDefinition({
    required this.displayHints,
    required this.sectionPath,
  });

  factory RegistrationSectionDefinition.fromJson(Map<String, dynamic> json) {
    return RegistrationSectionDefinition(
      displayHints: RegistrationSectionDisplayHints.fromJson(
          (json['DisplayHints'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sectionPath: (json['SectionPath'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final displayHints = this.displayHints;
    final sectionPath = this.sectionPath;
    return {
      'DisplayHints': displayHints,
      'SectionPath': sectionPath,
    };
  }
}

/// Provides help information on the registration section.
class RegistrationSectionDisplayHints {
  /// A short description of the display hint.
  final String shortDescription;

  /// The title of the display hint.
  final String title;

  /// The link to the document the display hint is associated with.
  final String? documentationLink;

  /// The title of the document the display hint is associated with.
  final String? documentationTitle;

  /// A full description of the display hint.
  final String? longDescription;

  RegistrationSectionDisplayHints({
    required this.shortDescription,
    required this.title,
    this.documentationLink,
    this.documentationTitle,
    this.longDescription,
  });

  factory RegistrationSectionDisplayHints.fromJson(Map<String, dynamic> json) {
    return RegistrationSectionDisplayHints(
      shortDescription: (json['ShortDescription'] as String?) ?? '',
      title: (json['Title'] as String?) ?? '',
      documentationLink: json['DocumentationLink'] as String?,
      documentationTitle: json['DocumentationTitle'] as String?,
      longDescription: json['LongDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shortDescription = this.shortDescription;
    final title = this.title;
    final documentationLink = this.documentationLink;
    final documentationTitle = this.documentationTitle;
    final longDescription = this.longDescription;
    return {
      'ShortDescription': shortDescription,
      'Title': title,
      if (documentationLink != null) 'DocumentationLink': documentationLink,
      if (documentationTitle != null) 'DocumentationTitle': documentationTitle,
      if (longDescription != null) 'LongDescription': longDescription,
    };
  }
}

/// Provides information about the requested registration.
class RegistrationInformation {
  /// The time when the registration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The current version number of the registration.
  final int currentVersionNumber;

  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The status of the registration.
  ///
  /// <ul>
  /// <li>
  /// <code>CLOSED</code>: The phone number or sender ID has been deleted and you
  /// must also delete the registration for the number.
  /// </li>
  /// <li>
  /// <code>CREATED</code>: Your registration is created but not submitted.
  /// </li>
  /// <li>
  /// <code>COMPLETE</code>: Your registration has been approved and your
  /// origination identity has been created.
  /// </li>
  /// <li>
  /// <code>DELETED</code>: The registration has been deleted.
  /// </li>
  /// <li>
  /// <code>PROVISIONING</code>: Your registration has been approved and your
  /// origination identity is being created.
  /// </li>
  /// <li>
  /// <code>REQUIRES_AUTHENTICATION</code>: You need to complete email
  /// authentication.
  /// </li>
  /// <li>
  /// <code>REQUIRES_UPDATES</code>: You must fix your registration and resubmit
  /// it.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted and is awaiting
  /// review.
  /// </li>
  /// </ul>
  final RegistrationStatus registrationStatus;

  /// The type of registration form. The list of <b>RegistrationTypes</b> can be
  /// found using the <a>DescribeRegistrationTypeDefinitions</a> action.
  final String registrationType;

  /// Metadata about a given registration which is specific to that registration
  /// type.
  final Map<String, String>? additionalAttributes;

  /// The version number of the registration that was approved.
  final int? approvedVersionNumber;

  /// The latest version number of the registration that was denied.
  final int? latestDeniedVersionNumber;

  RegistrationInformation({
    required this.createdTimestamp,
    required this.currentVersionNumber,
    required this.registrationArn,
    required this.registrationId,
    required this.registrationStatus,
    required this.registrationType,
    this.additionalAttributes,
    this.approvedVersionNumber,
    this.latestDeniedVersionNumber,
  });

  factory RegistrationInformation.fromJson(Map<String, dynamic> json) {
    return RegistrationInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      currentVersionNumber: (json['CurrentVersionNumber'] as int?) ?? 0,
      registrationArn: (json['RegistrationArn'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      registrationStatus: RegistrationStatus.fromString(
          (json['RegistrationStatus'] as String?) ?? ''),
      registrationType: (json['RegistrationType'] as String?) ?? '',
      additionalAttributes:
          (json['AdditionalAttributes'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      approvedVersionNumber: json['ApprovedVersionNumber'] as int?,
      latestDeniedVersionNumber: json['LatestDeniedVersionNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final currentVersionNumber = this.currentVersionNumber;
    final registrationArn = this.registrationArn;
    final registrationId = this.registrationId;
    final registrationStatus = this.registrationStatus;
    final registrationType = this.registrationType;
    final additionalAttributes = this.additionalAttributes;
    final approvedVersionNumber = this.approvedVersionNumber;
    final latestDeniedVersionNumber = this.latestDeniedVersionNumber;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'CurrentVersionNumber': currentVersionNumber,
      'RegistrationArn': registrationArn,
      'RegistrationId': registrationId,
      'RegistrationStatus': registrationStatus.value,
      'RegistrationType': registrationType,
      if (additionalAttributes != null)
        'AdditionalAttributes': additionalAttributes,
      if (approvedVersionNumber != null)
        'ApprovedVersionNumber': approvedVersionNumber,
      if (latestDeniedVersionNumber != null)
        'LatestDeniedVersionNumber': latestDeniedVersionNumber,
    };
  }
}

class RegistrationStatus {
  static const created = RegistrationStatus._('CREATED');
  static const submitted = RegistrationStatus._('SUBMITTED');
  static const awsReviewing = RegistrationStatus._('AWS_REVIEWING');
  static const reviewing = RegistrationStatus._('REVIEWING');
  static const requiresAuthentication =
      RegistrationStatus._('REQUIRES_AUTHENTICATION');
  static const provisioning = RegistrationStatus._('PROVISIONING');
  static const complete = RegistrationStatus._('COMPLETE');
  static const requiresUpdates = RegistrationStatus._('REQUIRES_UPDATES');
  static const closed = RegistrationStatus._('CLOSED');
  static const deleted = RegistrationStatus._('DELETED');

  final String value;

  const RegistrationStatus._(this.value);

  static const values = [
    created,
    submitted,
    awsReviewing,
    reviewing,
    requiresAuthentication,
    provisioning,
    complete,
    requiresUpdates,
    closed,
    deleted
  ];

  static RegistrationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationStatus._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The filter definition for filtering registrations that meets a specified
/// criteria.
class RegistrationFilter {
  /// The name of the attribute to filter on.
  final RegistrationFilterName name;

  /// An array of values to filter on.
  final List<String> values;

  RegistrationFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class RegistrationFilterName {
  static const registrationType = RegistrationFilterName._('registration-type');
  static const registrationStatus =
      RegistrationFilterName._('registration-status');

  final String value;

  const RegistrationFilterName._(this.value);

  static const values = [registrationType, registrationStatus];

  static RegistrationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationFilterName._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides the values of the specified field.
class RegistrationFieldValueInformation {
  /// The path to the registration form field. You can use
  /// <a>DescribeRegistrationFieldDefinitions</a> for a list of <b>FieldPaths</b>.
  final String fieldPath;

  /// A description of why the registration was denied.
  final String? deniedReason;

  /// Generative AI feedback information provided for this specific field during
  /// the registration review process. This may include validation errors,
  /// suggestions for improvement, or additional requirements.
  final String? feedback;

  /// The unique identifier for the registration attachment.
  final String? registrationAttachmentId;

  /// An array of values for the form field.
  final List<String>? selectChoices;

  /// The text data for a free form field.
  final String? textValue;

  RegistrationFieldValueInformation({
    required this.fieldPath,
    this.deniedReason,
    this.feedback,
    this.registrationAttachmentId,
    this.selectChoices,
    this.textValue,
  });

  factory RegistrationFieldValueInformation.fromJson(
      Map<String, dynamic> json) {
    return RegistrationFieldValueInformation(
      fieldPath: (json['FieldPath'] as String?) ?? '',
      deniedReason: json['DeniedReason'] as String?,
      feedback: json['Feedback'] as String?,
      registrationAttachmentId: json['RegistrationAttachmentId'] as String?,
      selectChoices: (json['SelectChoices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      textValue: json['TextValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fieldPath = this.fieldPath;
    final deniedReason = this.deniedReason;
    final feedback = this.feedback;
    final registrationAttachmentId = this.registrationAttachmentId;
    final selectChoices = this.selectChoices;
    final textValue = this.textValue;
    return {
      'FieldPath': fieldPath,
      if (deniedReason != null) 'DeniedReason': deniedReason,
      if (feedback != null) 'Feedback': feedback,
      if (registrationAttachmentId != null)
        'RegistrationAttachmentId': registrationAttachmentId,
      if (selectChoices != null) 'SelectChoices': selectChoices,
      if (textValue != null) 'TextValue': textValue,
    };
  }
}

/// Provides a description of the specified field.
class RegistrationFieldDefinition {
  /// An array of RegistrationFieldDisplayHints objects for the field.
  final RegistrationFieldDisplayHints displayHints;

  /// The path to the registration form field. You can use
  /// <a>DescribeRegistrationFieldDefinitions</a> for a list of <b>FieldPaths</b>.
  final String fieldPath;

  /// Specifies if the field for the registration form is required, conditional or
  /// optional.
  final FieldRequirement fieldRequirement;

  /// The type of field.
  final FieldType fieldType;

  /// The section path of the field.
  final String sectionPath;

  /// The validation rules for a select field.
  final SelectValidation? selectValidation;

  /// The validation rules for a text field.
  final TextValidation? textValidation;

  RegistrationFieldDefinition({
    required this.displayHints,
    required this.fieldPath,
    required this.fieldRequirement,
    required this.fieldType,
    required this.sectionPath,
    this.selectValidation,
    this.textValidation,
  });

  factory RegistrationFieldDefinition.fromJson(Map<String, dynamic> json) {
    return RegistrationFieldDefinition(
      displayHints: RegistrationFieldDisplayHints.fromJson(
          (json['DisplayHints'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      fieldPath: (json['FieldPath'] as String?) ?? '',
      fieldRequirement: FieldRequirement.fromString(
          (json['FieldRequirement'] as String?) ?? ''),
      fieldType: FieldType.fromString((json['FieldType'] as String?) ?? ''),
      sectionPath: (json['SectionPath'] as String?) ?? '',
      selectValidation: json['SelectValidation'] != null
          ? SelectValidation.fromJson(
              json['SelectValidation'] as Map<String, dynamic>)
          : null,
      textValidation: json['TextValidation'] != null
          ? TextValidation.fromJson(
              json['TextValidation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final displayHints = this.displayHints;
    final fieldPath = this.fieldPath;
    final fieldRequirement = this.fieldRequirement;
    final fieldType = this.fieldType;
    final sectionPath = this.sectionPath;
    final selectValidation = this.selectValidation;
    final textValidation = this.textValidation;
    return {
      'DisplayHints': displayHints,
      'FieldPath': fieldPath,
      'FieldRequirement': fieldRequirement.value,
      'FieldType': fieldType.value,
      'SectionPath': sectionPath,
      if (selectValidation != null) 'SelectValidation': selectValidation,
      if (textValidation != null) 'TextValidation': textValidation,
    };
  }
}

class FieldType {
  static const select = FieldType._('SELECT');
  static const text = FieldType._('TEXT');
  static const attachment = FieldType._('ATTACHMENT');

  final String value;

  const FieldType._(this.value);

  static const values = [select, text, attachment];

  static FieldType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FieldType._(value));

  @override
  bool operator ==(other) => other is FieldType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class FieldRequirement {
  static const required = FieldRequirement._('REQUIRED');
  static const conditional = FieldRequirement._('CONDITIONAL');
  static const optional = FieldRequirement._('OPTIONAL');

  final String value;

  const FieldRequirement._(this.value);

  static const values = [required, conditional, optional];

  static FieldRequirement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FieldRequirement._(value));

  @override
  bool operator ==(other) => other is FieldRequirement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Validation rules for a select field.
class SelectValidation {
  /// The maximum number of choices for the select.
  final int maxChoices;

  /// The minimum number of choices for the select.
  final int minChoices;

  /// An array of strings for the possible selection options.
  final List<String> options;

  SelectValidation({
    required this.maxChoices,
    required this.minChoices,
    required this.options,
  });

  factory SelectValidation.fromJson(Map<String, dynamic> json) {
    return SelectValidation(
      maxChoices: (json['MaxChoices'] as int?) ?? 0,
      minChoices: (json['MinChoices'] as int?) ?? 0,
      options: ((json['Options'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxChoices = this.maxChoices;
    final minChoices = this.minChoices;
    final options = this.options;
    return {
      'MaxChoices': maxChoices,
      'MinChoices': minChoices,
      'Options': options,
    };
  }
}

/// Validation rules for a text field.
class TextValidation {
  /// The maximum number of characters for the text field.
  final int maxLength;

  /// The minimum number of characters for the text field.
  final int minLength;

  /// The regular expression used to validate the text field.
  final String pattern;

  TextValidation({
    required this.maxLength,
    required this.minLength,
    required this.pattern,
  });

  factory TextValidation.fromJson(Map<String, dynamic> json) {
    return TextValidation(
      maxLength: (json['MaxLength'] as int?) ?? 0,
      minLength: (json['MinLength'] as int?) ?? 0,
      pattern: (json['Pattern'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final maxLength = this.maxLength;
    final minLength = this.minLength;
    final pattern = this.pattern;
    return {
      'MaxLength': maxLength,
      'MinLength': minLength,
      'Pattern': pattern,
    };
  }
}

/// Provides help information on the registration field.
class RegistrationFieldDisplayHints {
  /// A short description of the display hint.
  final String shortDescription;

  /// The title of the display hint.
  final String title;

  /// The link to the document the display hint is associated with.
  final String? documentationLink;

  /// The title of the document the display hint is associated with.
  final String? documentationTitle;

  /// Example text of what the value of a field should contain.
  final String? exampleTextValue;

  /// A full description of the display hint.
  final String? longDescription;

  /// An array of SelectOptionDescription objects.
  final List<SelectOptionDescription>? selectOptionDescriptions;

  /// The validation rules for the text field.
  final String? textValidationDescription;

  RegistrationFieldDisplayHints({
    required this.shortDescription,
    required this.title,
    this.documentationLink,
    this.documentationTitle,
    this.exampleTextValue,
    this.longDescription,
    this.selectOptionDescriptions,
    this.textValidationDescription,
  });

  factory RegistrationFieldDisplayHints.fromJson(Map<String, dynamic> json) {
    return RegistrationFieldDisplayHints(
      shortDescription: (json['ShortDescription'] as String?) ?? '',
      title: (json['Title'] as String?) ?? '',
      documentationLink: json['DocumentationLink'] as String?,
      documentationTitle: json['DocumentationTitle'] as String?,
      exampleTextValue: json['ExampleTextValue'] as String?,
      longDescription: json['LongDescription'] as String?,
      selectOptionDescriptions: (json['SelectOptionDescriptions'] as List?)
          ?.nonNulls
          .map((e) =>
              SelectOptionDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      textValidationDescription: json['TextValidationDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shortDescription = this.shortDescription;
    final title = this.title;
    final documentationLink = this.documentationLink;
    final documentationTitle = this.documentationTitle;
    final exampleTextValue = this.exampleTextValue;
    final longDescription = this.longDescription;
    final selectOptionDescriptions = this.selectOptionDescriptions;
    final textValidationDescription = this.textValidationDescription;
    return {
      'ShortDescription': shortDescription,
      'Title': title,
      if (documentationLink != null) 'DocumentationLink': documentationLink,
      if (documentationTitle != null) 'DocumentationTitle': documentationTitle,
      if (exampleTextValue != null) 'ExampleTextValue': exampleTextValue,
      if (longDescription != null) 'LongDescription': longDescription,
      if (selectOptionDescriptions != null)
        'SelectOptionDescriptions': selectOptionDescriptions,
      if (textValidationDescription != null)
        'TextValidationDescription': textValidationDescription,
    };
  }
}

/// A description of each select option.
class SelectOptionDescription {
  /// The value of the option.
  final String option;

  /// A description of the option meaning.
  final String? description;

  /// The title of the select option.
  final String? title;

  SelectOptionDescription({
    required this.option,
    this.description,
    this.title,
  });

  factory SelectOptionDescription.fromJson(Map<String, dynamic> json) {
    return SelectOptionDescription(
      option: (json['Option'] as String?) ?? '',
      description: json['Description'] as String?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final option = this.option;
    final description = this.description;
    final title = this.title;
    return {
      'Option': option,
      if (description != null) 'Description': description,
      if (title != null) 'Title': title,
    };
  }
}

/// Provides information on the specified registration attachments.
class RegistrationAttachmentsInformation {
  /// The status of the registration attachment.
  ///
  /// <ul>
  /// <li>
  /// <code>UPLOAD_IN_PROGRESS</code> The attachment is being uploaded.
  /// </li>
  /// <li>
  /// <code>UPLOAD_COMPLETE</code> The attachment has been uploaded.
  /// </li>
  /// <li>
  /// <code>UPLOAD_FAILED</code> The attachment failed to uploaded.
  /// </li>
  /// <li>
  /// <code>DELETED</code> The attachment has been deleted..
  /// </li>
  /// </ul>
  final AttachmentStatus attachmentStatus;

  /// The time when the registration attachment was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The Amazon Resource Name (ARN) for the registration attachment.
  final String registrationAttachmentArn;

  /// The unique identifier for the registration attachment.
  final String registrationAttachmentId;

  /// A description of why the upload didn't successfully complete.
  final AttachmentUploadErrorReason? attachmentUploadErrorReason;

  /// The URL to the document that's associated with the registration attachment.
  final String? attachmentUrl;

  RegistrationAttachmentsInformation({
    required this.attachmentStatus,
    required this.createdTimestamp,
    required this.registrationAttachmentArn,
    required this.registrationAttachmentId,
    this.attachmentUploadErrorReason,
    this.attachmentUrl,
  });

  factory RegistrationAttachmentsInformation.fromJson(
      Map<String, dynamic> json) {
    return RegistrationAttachmentsInformation(
      attachmentStatus: AttachmentStatus.fromString(
          (json['AttachmentStatus'] as String?) ?? ''),
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      registrationAttachmentArn:
          (json['RegistrationAttachmentArn'] as String?) ?? '',
      registrationAttachmentId:
          (json['RegistrationAttachmentId'] as String?) ?? '',
      attachmentUploadErrorReason:
          (json['AttachmentUploadErrorReason'] as String?)
              ?.let(AttachmentUploadErrorReason.fromString),
      attachmentUrl: json['AttachmentUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentStatus = this.attachmentStatus;
    final createdTimestamp = this.createdTimestamp;
    final registrationAttachmentArn = this.registrationAttachmentArn;
    final registrationAttachmentId = this.registrationAttachmentId;
    final attachmentUploadErrorReason = this.attachmentUploadErrorReason;
    final attachmentUrl = this.attachmentUrl;
    return {
      'AttachmentStatus': attachmentStatus.value,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'RegistrationAttachmentArn': registrationAttachmentArn,
      'RegistrationAttachmentId': registrationAttachmentId,
      if (attachmentUploadErrorReason != null)
        'AttachmentUploadErrorReason': attachmentUploadErrorReason.value,
      if (attachmentUrl != null) 'AttachmentUrl': attachmentUrl,
    };
  }
}

class AttachmentStatus {
  static const uploadInProgress = AttachmentStatus._('UPLOAD_IN_PROGRESS');
  static const uploadComplete = AttachmentStatus._('UPLOAD_COMPLETE');
  static const uploadFailed = AttachmentStatus._('UPLOAD_FAILED');
  static const deleted = AttachmentStatus._('DELETED');

  final String value;

  const AttachmentStatus._(this.value);

  static const values = [
    uploadInProgress,
    uploadComplete,
    uploadFailed,
    deleted
  ];

  static AttachmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttachmentStatus._(value));

  @override
  bool operator ==(other) => other is AttachmentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AttachmentUploadErrorReason {
  static const internalError = AttachmentUploadErrorReason._('INTERNAL_ERROR');

  final String value;

  const AttachmentUploadErrorReason._(this.value);

  static const values = [internalError];

  static AttachmentUploadErrorReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttachmentUploadErrorReason._(value));

  @override
  bool operator ==(other) =>
      other is AttachmentUploadErrorReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The filter definition for filtering registration attachments that meets a
/// specified criteria.
class RegistrationAttachmentFilter {
  /// The name of the attribute to filter on.
  final RegistrationAttachmentFilterName name;

  /// An array of values to filter on.
  final List<String> values;

  RegistrationAttachmentFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class RegistrationAttachmentFilterName {
  static const attachmentStatus =
      RegistrationAttachmentFilterName._('attachment-status');

  final String value;

  const RegistrationAttachmentFilterName._(this.value);

  static const values = [attachmentStatus];

  static RegistrationAttachmentFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationAttachmentFilterName._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationAttachmentFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The information for an RCS agent in an Amazon Web Services account.
class RcsAgentInformation {
  /// The time when the RCS agent was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true the RCS agent can't be deleted.
  final bool deletionProtectionEnabled;

  /// The Amazon Resource Name (ARN) of the RCS agent.
  final String rcsAgentArn;

  /// The unique identifier for the RCS agent.
  final String rcsAgentId;

  /// When set to true you're responsible for responding to HELP and STOP
  /// requests. You're also responsible for tracking and honoring opt-out
  /// requests.
  final bool selfManagedOptOutsEnabled;

  /// The current status of the RCS agent.
  final RcsAgentStatus status;

  /// When set to true you can receive incoming text messages from your end
  /// recipients using the TwoWayChannelArn.
  final bool twoWayEnabled;

  /// The name of the OptOutList associated with the RCS agent.
  final String? optOutListName;

  /// The unique identifier of the pool associated with the RCS agent.
  final String? poolId;

  /// The testing agent information associated with the RCS agent.
  final TestingAgentInformation? testingAgent;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

  RcsAgentInformation({
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.rcsAgentArn,
    required this.rcsAgentId,
    required this.selfManagedOptOutsEnabled,
    required this.status,
    required this.twoWayEnabled,
    this.optOutListName,
    this.poolId,
    this.testingAgent,
    this.twoWayChannelArn,
    this.twoWayChannelRole,
  });

  factory RcsAgentInformation.fromJson(Map<String, dynamic> json) {
    return RcsAgentInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      rcsAgentArn: (json['RcsAgentArn'] as String?) ?? '',
      rcsAgentId: (json['RcsAgentId'] as String?) ?? '',
      selfManagedOptOutsEnabled:
          (json['SelfManagedOptOutsEnabled'] as bool?) ?? false,
      status: RcsAgentStatus.fromString((json['Status'] as String?) ?? ''),
      twoWayEnabled: (json['TwoWayEnabled'] as bool?) ?? false,
      optOutListName: json['OptOutListName'] as String?,
      poolId: json['PoolId'] as String?,
      testingAgent: json['TestingAgent'] != null
          ? TestingAgentInformation.fromJson(
              json['TestingAgent'] as Map<String, dynamic>)
          : null,
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final rcsAgentArn = this.rcsAgentArn;
    final rcsAgentId = this.rcsAgentId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final twoWayEnabled = this.twoWayEnabled;
    final optOutListName = this.optOutListName;
    final poolId = this.poolId;
    final testingAgent = this.testingAgent;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayChannelRole = this.twoWayChannelRole;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'RcsAgentArn': rcsAgentArn,
      'RcsAgentId': rcsAgentId,
      'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      'Status': status.value,
      'TwoWayEnabled': twoWayEnabled,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (poolId != null) 'PoolId': poolId,
      if (testingAgent != null) 'TestingAgent': testingAgent,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
    };
  }
}

/// Contains details about the testing agent associated with an RCS agent.
class TestingAgentInformation {
  /// The unique identifier of the registration associated with the testing agent.
  final String registrationId;

  /// The current status of the testing agent.
  final TestingAgentStatus status;

  /// The unique identifier for the testing agent.
  final String? testingAgentId;

  TestingAgentInformation({
    required this.registrationId,
    required this.status,
    this.testingAgentId,
  });

  factory TestingAgentInformation.fromJson(Map<String, dynamic> json) {
    return TestingAgentInformation(
      registrationId: (json['RegistrationId'] as String?) ?? '',
      status: TestingAgentStatus.fromString((json['Status'] as String?) ?? ''),
      testingAgentId: json['TestingAgentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registrationId = this.registrationId;
    final status = this.status;
    final testingAgentId = this.testingAgentId;
    return {
      'RegistrationId': registrationId,
      'Status': status.value,
      if (testingAgentId != null) 'TestingAgentId': testingAgentId,
    };
  }
}

/// The current status of the testing agent.
///
/// <ul>
/// <li>
/// <code>CREATED</code>: The testing agent has been created.
/// </li>
/// <li>
/// <code>PENDING</code>: The testing agent is pending activation.
/// </li>
/// <li>
/// <code>ACTIVE</code>: The testing agent is active and available for use.
/// </li>
/// </ul>
class TestingAgentStatus {
  static const created = TestingAgentStatus._('CREATED');
  static const pending = TestingAgentStatus._('PENDING');
  static const active = TestingAgentStatus._('ACTIVE');

  final String value;

  const TestingAgentStatus._(this.value);

  static const values = [created, pending, active];

  static TestingAgentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TestingAgentStatus._(value));

  @override
  bool operator ==(other) =>
      other is TestingAgentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The information for an RCS agent that meets a specified criteria.
class RcsAgentFilter {
  /// The name of the attribute to filter on.
  final RcsAgentFilterName name;

  /// An array values to filter for.
  final List<String> values;

  RcsAgentFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

/// The filter name for filtering RCS agents. The available filter names are:
///
/// <ul>
/// <li>
/// <code>deletion-protection-enabled</code>: Filter by deletion protection
/// status.
/// </li>
/// <li>
/// <code>opt-out-list-name</code>: Filter by the opt-out list name.
/// </li>
/// <li>
/// <code>self-managed-opt-outs-enabled</code>: Filter by self-managed opt-outs
/// status.
/// </li>
/// <li>
/// <code>status</code>: Filter by RCS agent status.
/// </li>
/// <li>
/// <code>two-way-channel-arn</code>: Filter by the two-way channel ARN.
/// </li>
/// <li>
/// <code>two-way-enabled</code>: Filter by two-way enabled status.
/// </li>
/// </ul>
class RcsAgentFilterName {
  static const status = RcsAgentFilterName._('status');
  static const twoWayEnabled = RcsAgentFilterName._('two-way-enabled');
  static const selfManagedOptOutsEnabled =
      RcsAgentFilterName._('self-managed-opt-outs-enabled');
  static const optOutListName = RcsAgentFilterName._('opt-out-list-name');
  static const deletionProtectionEnabled =
      RcsAgentFilterName._('deletion-protection-enabled');
  static const twoWayChannelArn = RcsAgentFilterName._('two-way-channel-arn');

  final String value;

  const RcsAgentFilterName._(this.value);

  static const values = [
    status,
    twoWayEnabled,
    selfManagedOptOutsEnabled,
    optOutListName,
    deletionProtectionEnabled,
    twoWayChannelArn
  ];

  static RcsAgentFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RcsAgentFilterName._(value));

  @override
  bool operator ==(other) =>
      other is RcsAgentFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains per-country launch status details for an RCS agent.
class CountryLaunchStatusInformation {
  /// An array of CarrierStatusInformation objects containing carrier-level launch
  /// status details.
  final List<CarrierStatusInformation> carrierStatus;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String isoCountryCode;

  /// The unique identifier of the registration associated with this country
  /// launch.
  final String registrationId;

  /// The launch status for this country.
  final CountryLaunchStatus status;

  /// The RCS platform identifier for this country.
  final String? rcsPlatformId;

  CountryLaunchStatusInformation({
    required this.carrierStatus,
    required this.isoCountryCode,
    required this.registrationId,
    required this.status,
    this.rcsPlatformId,
  });

  factory CountryLaunchStatusInformation.fromJson(Map<String, dynamic> json) {
    return CountryLaunchStatusInformation(
      carrierStatus: ((json['CarrierStatus'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              CarrierStatusInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      isoCountryCode: (json['IsoCountryCode'] as String?) ?? '',
      registrationId: (json['RegistrationId'] as String?) ?? '',
      status: CountryLaunchStatus.fromString((json['Status'] as String?) ?? ''),
      rcsPlatformId: json['RcsPlatformId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final carrierStatus = this.carrierStatus;
    final isoCountryCode = this.isoCountryCode;
    final registrationId = this.registrationId;
    final status = this.status;
    final rcsPlatformId = this.rcsPlatformId;
    return {
      'CarrierStatus': carrierStatus,
      'IsoCountryCode': isoCountryCode,
      'RegistrationId': registrationId,
      'Status': status.value,
      if (rcsPlatformId != null) 'RcsPlatformId': rcsPlatformId,
    };
  }
}

/// The per-country launch status of an RCS agent.
///
/// <ul>
/// <li>
/// <code>CREATED</code>: The country launch has been created.
/// </li>
/// <li>
/// <code>PENDING</code>: The country launch is pending.
/// </li>
/// <li>
/// <code>PARTIAL</code>: The country launch is partially active.
/// </li>
/// <li>
/// <code>ACTIVE</code>: The country launch is active.
/// </li>
/// <li>
/// <code>REJECTED</code>: The country launch was rejected.
/// </li>
/// </ul>
class CountryLaunchStatus {
  static const created = CountryLaunchStatus._('CREATED');
  static const pending = CountryLaunchStatus._('PENDING');
  static const partial = CountryLaunchStatus._('PARTIAL');
  static const active = CountryLaunchStatus._('ACTIVE');
  static const rejected = CountryLaunchStatus._('REJECTED');

  final String value;

  const CountryLaunchStatus._(this.value);

  static const values = [created, pending, partial, active, rejected];

  static CountryLaunchStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CountryLaunchStatus._(value));

  @override
  bool operator ==(other) =>
      other is CountryLaunchStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains carrier-level launch status details for an RCS agent within a
/// country.
class CarrierStatusInformation {
  /// The name of the carrier.
  final String carrierName;

  /// The launch status for this carrier.
  final CarrierStatus status;

  CarrierStatusInformation({
    required this.carrierName,
    required this.status,
  });

  factory CarrierStatusInformation.fromJson(Map<String, dynamic> json) {
    return CarrierStatusInformation(
      carrierName: (json['CarrierName'] as String?) ?? '',
      status: CarrierStatus.fromString((json['Status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final carrierName = this.carrierName;
    final status = this.status;
    return {
      'CarrierName': carrierName,
      'Status': status.value,
    };
  }
}

/// The carrier-level launch status.
///
/// <ul>
/// <li>
/// <code>PENDING</code>: The carrier launch is pending.
/// </li>
/// <li>
/// <code>ACTIVE</code>: The carrier launch is active.
/// </li>
/// <li>
/// <code>REJECTED</code>: The carrier launch was rejected.
/// </li>
/// </ul>
class CarrierStatus {
  static const pending = CarrierStatus._('PENDING');
  static const active = CarrierStatus._('ACTIVE');
  static const rejected = CarrierStatus._('REJECTED');

  final String value;

  const CarrierStatus._(this.value);

  static const values = [pending, active, rejected];

  static CarrierStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CarrierStatus._(value));

  @override
  bool operator ==(other) => other is CarrierStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The information for a country launch status that meets a specified criteria.
class CountryLaunchStatusFilter {
  /// The name of the attribute to filter on.
  final CountryLaunchStatusFilterName name;

  /// An array values to filter for.
  final List<String> values;

  CountryLaunchStatusFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

/// The filter name for filtering country launch statuses. The available filter
/// names are:
///
/// <ul>
/// <li>
/// <code>country-launch-status</code>: Filter by country launch status.
/// </li>
/// </ul>
class CountryLaunchStatusFilterName {
  static const countryLaunchStatus =
      CountryLaunchStatusFilterName._('country-launch-status');

  final String value;

  const CountryLaunchStatusFilterName._(this.value);

  static const values = [countryLaunchStatus];

  static CountryLaunchStatusFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CountryLaunchStatusFilterName._(value));

  @override
  bool operator ==(other) =>
      other is CountryLaunchStatusFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information on the specified protect configuration.
class ProtectConfigurationInformation {
  /// This is true if the protect configuration is set as your account default
  /// protect configuration.
  final bool accountDefault;

  /// The time when the protect configuration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The status of deletion protection for the protect configuration. When set to
  /// true deletion protection is enabled. By default this is set to false.
  final bool deletionProtectionEnabled;

  /// The Amazon Resource Name (ARN) of the protect configuration.
  final String protectConfigurationArn;

  /// The unique identifier for the protect configuration.
  final String protectConfigurationId;

  ProtectConfigurationInformation({
    required this.accountDefault,
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.protectConfigurationArn,
    required this.protectConfigurationId,
  });

  factory ProtectConfigurationInformation.fromJson(Map<String, dynamic> json) {
    return ProtectConfigurationInformation(
      accountDefault: (json['AccountDefault'] as bool?) ?? false,
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      protectConfigurationArn:
          (json['ProtectConfigurationArn'] as String?) ?? '',
      protectConfigurationId: (json['ProtectConfigurationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountDefault = this.accountDefault;
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final protectConfigurationArn = this.protectConfigurationArn;
    final protectConfigurationId = this.protectConfigurationId;
    return {
      'AccountDefault': accountDefault,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'ProtectConfigurationArn': protectConfigurationArn,
      'ProtectConfigurationId': protectConfigurationId,
    };
  }
}

/// The filter definition for filtering protect configurations that meet a
/// specified criteria.
class ProtectConfigurationFilter {
  /// The name of the attribute to filter on.
  final ProtectConfigurationFilterName name;

  /// An array of values to filter for.
  final List<String> values;

  ProtectConfigurationFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class ProtectConfigurationFilterName {
  static const accountDefault =
      ProtectConfigurationFilterName._('account-default');
  static const deletionProtectionEnabled =
      ProtectConfigurationFilterName._('deletion-protection-enabled');

  final String value;

  const ProtectConfigurationFilterName._(this.value);

  static const values = [accountDefault, deletionProtectionEnabled];

  static ProtectConfigurationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProtectConfigurationFilterName._(value));

  @override
  bool operator ==(other) =>
      other is ProtectConfigurationFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
  /// STOP to one of your dedicated numbers, End User Messaging SMS automatically
  /// replies with a customizable message and adds the end recipient to the
  /// OptOutList. When set to true you're responsible for responding to HELP and
  /// STOP requests. You're also responsible for tracking and honoring opt-out
  /// requests. For more information see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/settings-sms-managing.html#settings-account-sms-self-managed-opt-out">Self-managed
  /// opt-outs</a>
  final bool selfManagedOptOutsEnabled;

  /// Allows you to enable shared routes on your pool.
  ///
  /// By default, this is set to <code>False</code>. If you set this value to
  /// <code>True</code>, your messages are sent using phone numbers or sender IDs
  /// (depending on the country) that are shared with other users. In some
  /// countries, such as the United States, senders aren't allowed to use shared
  /// routes and must use a dedicated phone number or short code.
  final bool sharedRoutesEnabled;

  /// The current status of the pool.
  final PoolStatus status;

  /// When set to true you can receive incoming text messages from your end
  /// recipients using the TwoWayChannelArn.
  final bool twoWayEnabled;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

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
    this.twoWayChannelRole,
  });

  factory PoolInformation.fromJson(Map<String, dynamic> json) {
    return PoolInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      messageType:
          MessageType.fromString((json['MessageType'] as String?) ?? ''),
      optOutListName: (json['OptOutListName'] as String?) ?? '',
      poolArn: (json['PoolArn'] as String?) ?? '',
      poolId: (json['PoolId'] as String?) ?? '',
      selfManagedOptOutsEnabled:
          (json['SelfManagedOptOutsEnabled'] as bool?) ?? false,
      sharedRoutesEnabled: (json['SharedRoutesEnabled'] as bool?) ?? false,
      status: PoolStatus.fromString((json['Status'] as String?) ?? ''),
      twoWayEnabled: (json['TwoWayEnabled'] as bool?) ?? false,
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
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
    final twoWayChannelRole = this.twoWayChannelRole;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'MessageType': messageType.value,
      'OptOutListName': optOutListName,
      'PoolArn': poolArn,
      'PoolId': poolId,
      'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      'SharedRoutesEnabled': sharedRoutesEnabled,
      'Status': status.value,
      'TwoWayEnabled': twoWayEnabled,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class PoolFilterName {
  static const status = PoolFilterName._('status');
  static const messageType = PoolFilterName._('message-type');
  static const twoWayEnabled = PoolFilterName._('two-way-enabled');
  static const selfManagedOptOutsEnabled =
      PoolFilterName._('self-managed-opt-outs-enabled');
  static const optOutListName = PoolFilterName._('opt-out-list-name');
  static const sharedRoutesEnabled = PoolFilterName._('shared-routes-enabled');
  static const deletionProtectionEnabled =
      PoolFilterName._('deletion-protection-enabled');
  static const twoWayChannelArn = PoolFilterName._('two-way-channel-arn');

  final String value;

  const PoolFilterName._(this.value);

  static const values = [
    status,
    messageType,
    twoWayEnabled,
    selfManagedOptOutsEnabled,
    optOutListName,
    sharedRoutesEnabled,
    deletionProtectionEnabled,
    twoWayChannelArn
  ];

  static PoolFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PoolFilterName._(value));

  @override
  bool operator ==(other) => other is PoolFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The information for a phone number, in E.164 format, in an Amazon Web
/// Services account.
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

  /// When set to false and an end recipient sends a message that begins with HELP
  /// or STOP to one of your dedicated numbers, End User Messaging SMS
  /// automatically replies with a customizable message and adds the end recipient
  /// to the OptOutList. When set to true you're responsible for responding to
  /// HELP and STOP requests. You're also responsible for tracking and honoring
  /// opt-out request. For more information see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/settings-sms-managing.html#settings-account-sms-self-managed-opt-out">Self-managed
  /// opt-outs</a>
  final bool selfManagedOptOutsEnabled;

  /// The current status of the phone number.
  final NumberStatus status;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients using the TwoWayChannelArn.
  final bool twoWayEnabled;

  /// When set to true the international sending of phone number is Enabled.
  final bool? internationalSendingEnabled;

  /// The unique identifier for the phone number.
  final String? phoneNumberId;

  /// The unique identifier of the pool associated with the phone number.
  final String? poolId;

  /// The unique identifier for the registration.
  final String? registrationId;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

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
    this.internationalSendingEnabled,
    this.phoneNumberId,
    this.poolId,
    this.registrationId,
    this.twoWayChannelArn,
    this.twoWayChannelRole,
  });

  factory PhoneNumberInformation.fromJson(Map<String, dynamic> json) {
    return PhoneNumberInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      isoCountryCode: (json['IsoCountryCode'] as String?) ?? '',
      messageType:
          MessageType.fromString((json['MessageType'] as String?) ?? ''),
      monthlyLeasingPrice: (json['MonthlyLeasingPrice'] as String?) ?? '',
      numberCapabilities: ((json['NumberCapabilities'] as List?) ?? const [])
          .nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      numberType: NumberType.fromString((json['NumberType'] as String?) ?? ''),
      optOutListName: (json['OptOutListName'] as String?) ?? '',
      phoneNumber: (json['PhoneNumber'] as String?) ?? '',
      phoneNumberArn: (json['PhoneNumberArn'] as String?) ?? '',
      selfManagedOptOutsEnabled:
          (json['SelfManagedOptOutsEnabled'] as bool?) ?? false,
      status: NumberStatus.fromString((json['Status'] as String?) ?? ''),
      twoWayEnabled: (json['TwoWayEnabled'] as bool?) ?? false,
      internationalSendingEnabled: json['InternationalSendingEnabled'] as bool?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      poolId: json['PoolId'] as String?,
      registrationId: json['RegistrationId'] as String?,
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayChannelRole: json['TwoWayChannelRole'] as String?,
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
    final internationalSendingEnabled = this.internationalSendingEnabled;
    final phoneNumberId = this.phoneNumberId;
    final poolId = this.poolId;
    final registrationId = this.registrationId;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayChannelRole = this.twoWayChannelRole;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'IsoCountryCode': isoCountryCode,
      'MessageType': messageType.value,
      'MonthlyLeasingPrice': monthlyLeasingPrice,
      'NumberCapabilities': numberCapabilities.map((e) => e.value).toList(),
      'NumberType': numberType.value,
      'OptOutListName': optOutListName,
      'PhoneNumber': phoneNumber,
      'PhoneNumberArn': phoneNumberArn,
      'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      'Status': status.value,
      'TwoWayEnabled': twoWayEnabled,
      if (internationalSendingEnabled != null)
        'InternationalSendingEnabled': internationalSendingEnabled,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (poolId != null) 'PoolId': poolId,
      if (registrationId != null) 'RegistrationId': registrationId,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayChannelRole != null) 'TwoWayChannelRole': twoWayChannelRole,
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class PhoneNumberFilterName {
  static const status = PhoneNumberFilterName._('status');
  static const isoCountryCode = PhoneNumberFilterName._('iso-country-code');
  static const messageType = PhoneNumberFilterName._('message-type');
  static const numberCapability = PhoneNumberFilterName._('number-capability');
  static const numberType = PhoneNumberFilterName._('number-type');
  static const twoWayEnabled = PhoneNumberFilterName._('two-way-enabled');
  static const selfManagedOptOutsEnabled =
      PhoneNumberFilterName._('self-managed-opt-outs-enabled');
  static const optOutListName = PhoneNumberFilterName._('opt-out-list-name');
  static const deletionProtectionEnabled =
      PhoneNumberFilterName._('deletion-protection-enabled');
  static const twoWayChannelArn =
      PhoneNumberFilterName._('two-way-channel-arn');

  final String value;

  const PhoneNumberFilterName._(this.value);

  static const values = [
    status,
    isoCountryCode,
    messageType,
    numberCapability,
    numberType,
    twoWayEnabled,
    selfManagedOptOutsEnabled,
    optOutListName,
    deletionProtectionEnabled,
    twoWayChannelArn
  ];

  static PhoneNumberFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PhoneNumberFilterName._(value));

  @override
  bool operator ==(other) =>
      other is PhoneNumberFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      optOutListArn: (json['OptOutListArn'] as String?) ?? '',
      optOutListName: (json['OptOutListName'] as String?) ?? '',
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
      endUserOptedOut: (json['EndUserOptedOut'] as bool?) ?? false,
      optedOutNumber: (json['OptedOutNumber'] as String?) ?? '',
      optedOutTimestamp:
          nonNullableTimeStampFromJson(json['OptedOutTimestamp'] ?? 0),
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class OptedOutFilterName {
  static const endUserOptedOut = OptedOutFilterName._('end-user-opted-out');

  final String value;

  const OptedOutFilterName._(this.value);

  static const values = [endUserOptedOut];

  static OptedOutFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OptedOutFilterName._(value));

  @override
  bool operator ==(other) =>
      other is OptedOutFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The information for a system-managed notify template in an Amazon Web
/// Services account.
class NotifyTemplateInformation {
  /// The channels for the template. Supported values are <code>SMS</code> and
  /// <code>VOICE</code>.
  final List<NumberCapability> channels;

  /// The time when the notify template was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The unique identifier for the template.
  final String templateId;

  /// The type of the template.
  final NotifyTemplateType templateType;

  /// The version of the template.
  final int version;

  /// The content of the template.
  final String? content;

  /// The language code for the template.
  final String? languageCode;

  /// The current status of the template.
  final NotifyTemplateStatus? status;

  /// An array of supported country codes for the template.
  final List<String>? supportedCountries;

  /// An array of supported voice IDs for voice templates.
  final List<VoiceId>? supportedVoiceIds;

  /// The tier access level for the template.
  final List<NotifyConfigurationTier>? tierAccess;

  /// An array of template variable metadata for the template.
  final Map<String, TemplateVariableMetadata>? variables;

  NotifyTemplateInformation({
    required this.channels,
    required this.createdTimestamp,
    required this.templateId,
    required this.templateType,
    required this.version,
    this.content,
    this.languageCode,
    this.status,
    this.supportedCountries,
    this.supportedVoiceIds,
    this.tierAccess,
    this.variables,
  });

  factory NotifyTemplateInformation.fromJson(Map<String, dynamic> json) {
    return NotifyTemplateInformation(
      channels: ((json['Channels'] as List?) ?? const [])
          .nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      templateId: (json['TemplateId'] as String?) ?? '',
      templateType: NotifyTemplateType.fromString(
          (json['TemplateType'] as String?) ?? ''),
      version: (json['Version'] as int?) ?? 0,
      content: json['Content'] as String?,
      languageCode: json['LanguageCode'] as String?,
      status: (json['Status'] as String?)?.let(NotifyTemplateStatus.fromString),
      supportedCountries: (json['SupportedCountries'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      supportedVoiceIds: (json['SupportedVoiceIds'] as List?)
          ?.nonNulls
          .map((e) => VoiceId.fromString((e as String)))
          .toList(),
      tierAccess: (json['TierAccess'] as List?)
          ?.nonNulls
          .map((e) => NotifyConfigurationTier.fromString((e as String)))
          .toList(),
      variables: (json['Variables'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, TemplateVariableMetadata.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final createdTimestamp = this.createdTimestamp;
    final templateId = this.templateId;
    final templateType = this.templateType;
    final version = this.version;
    final content = this.content;
    final languageCode = this.languageCode;
    final status = this.status;
    final supportedCountries = this.supportedCountries;
    final supportedVoiceIds = this.supportedVoiceIds;
    final tierAccess = this.tierAccess;
    final variables = this.variables;
    return {
      'Channels': channels.map((e) => e.value).toList(),
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'TemplateId': templateId,
      'TemplateType': templateType.value,
      'Version': version,
      if (content != null) 'Content': content,
      if (languageCode != null) 'LanguageCode': languageCode,
      if (status != null) 'Status': status.value,
      if (supportedCountries != null) 'SupportedCountries': supportedCountries,
      if (supportedVoiceIds != null)
        'SupportedVoiceIds': supportedVoiceIds.map((e) => e.value).toList(),
      if (tierAccess != null)
        'TierAccess': tierAccess.map((e) => e.value).toList(),
      if (variables != null) 'Variables': variables,
    };
  }
}

/// The type of a notify template.
///
/// <ul>
/// <li>
/// <code>OTP_VERIFICATION</code> - OTP verification template type.
/// </li>
/// </ul>
class NotifyTemplateType {
  static const otpVerification = NotifyTemplateType._('OTP_VERIFICATION');

  final String value;

  const NotifyTemplateType._(this.value);

  static const values = [otpVerification];

  static NotifyTemplateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotifyTemplateType._(value));

  @override
  bool operator ==(other) =>
      other is NotifyTemplateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The status of a notify template.
///
/// <ul>
/// <li>
/// <code>ACTIVE</code> - The template is active and available for use.
/// </li>
/// <li>
/// <code>INACTIVE</code> - The template is inactive.
/// </li>
/// </ul>
class NotifyTemplateStatus {
  static const active = NotifyTemplateStatus._('ACTIVE');
  static const inactive = NotifyTemplateStatus._('INACTIVE');

  final String value;

  const NotifyTemplateStatus._(this.value);

  static const values = [active, inactive];

  static NotifyTemplateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotifyTemplateStatus._(value));

  @override
  bool operator ==(other) =>
      other is NotifyTemplateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains metadata about a template variable.
class TemplateVariableMetadata {
  /// Whether the variable is required.
  final bool required;

  /// The type of the variable.
  final TemplateVariableType type;

  /// The default value for the variable.
  final String? defaultValue;

  /// A description of the variable.
  final String? description;

  /// The maximum length for string variables.
  final int? maxLength;

  /// The maximum value for numeric variables.
  final int? maxValue;

  /// The minimum value for numeric variables.
  final int? minValue;

  /// The regex pattern the variable value must match.
  final String? pattern;

  /// A sample value for the variable.
  final String? sample;

  /// The source of the variable, either <code>CUSTOMER</code> or
  /// <code>SYSTEM</code>.
  final TemplateVariableSource? source;

  TemplateVariableMetadata({
    required this.required,
    required this.type,
    this.defaultValue,
    this.description,
    this.maxLength,
    this.maxValue,
    this.minValue,
    this.pattern,
    this.sample,
    this.source,
  });

  factory TemplateVariableMetadata.fromJson(Map<String, dynamic> json) {
    return TemplateVariableMetadata(
      required: (json['Required'] as bool?) ?? false,
      type: TemplateVariableType.fromString((json['Type'] as String?) ?? ''),
      defaultValue: json['DefaultValue'] as String?,
      description: json['Description'] as String?,
      maxLength: json['MaxLength'] as int?,
      maxValue: json['MaxValue'] as int?,
      minValue: json['MinValue'] as int?,
      pattern: json['Pattern'] as String?,
      sample: json['Sample'] as String?,
      source:
          (json['Source'] as String?)?.let(TemplateVariableSource.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final required = this.required;
    final type = this.type;
    final defaultValue = this.defaultValue;
    final description = this.description;
    final maxLength = this.maxLength;
    final maxValue = this.maxValue;
    final minValue = this.minValue;
    final pattern = this.pattern;
    final sample = this.sample;
    final source = this.source;
    return {
      'Required': required,
      'Type': type.value,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (description != null) 'Description': description,
      if (maxLength != null) 'MaxLength': maxLength,
      if (maxValue != null) 'MaxValue': maxValue,
      if (minValue != null) 'MinValue': minValue,
      if (pattern != null) 'Pattern': pattern,
      if (sample != null) 'Sample': sample,
      if (source != null) 'Source': source.value,
    };
  }
}

/// The type of a template variable.
///
/// <ul>
/// <li>
/// <code>STRING</code> - String variable type.
/// </li>
/// <li>
/// <code>INTEGER</code> - Integer variable type.
/// </li>
/// <li>
/// <code>BOOLEAN</code> - Boolean variable type.
/// </li>
/// </ul>
class TemplateVariableType {
  static const string = TemplateVariableType._('STRING');
  static const integer = TemplateVariableType._('INTEGER');
  static const boolean = TemplateVariableType._('BOOLEAN');

  final String value;

  const TemplateVariableType._(this.value);

  static const values = [string, integer, boolean];

  static TemplateVariableType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TemplateVariableType._(value));

  @override
  bool operator ==(other) =>
      other is TemplateVariableType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The source of a template variable value.
///
/// <ul>
/// <li>
/// <code>CUSTOMER</code> - The variable value is provided by the customer.
/// </li>
/// <li>
/// <code>SYSTEM</code> - The variable value is provided by the system.
/// </li>
/// </ul>
class TemplateVariableSource {
  static const customer = TemplateVariableSource._('CUSTOMER');
  static const system = TemplateVariableSource._('SYSTEM');

  final String value;

  const TemplateVariableSource._(this.value);

  static const values = [customer, system];

  static TemplateVariableSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TemplateVariableSource._(value));

  @override
  bool operator ==(other) =>
      other is TemplateVariableSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The information for notify templates that meet a specified criteria.
class NotifyTemplateFilter {
  /// The name of the attribute to filter on.
  final NotifyTemplateFilterName name;

  /// An array values to filter for.
  final List<String> values;

  NotifyTemplateFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

/// The filter name for filtering notify templates. The available filter names
/// are:
///
/// <ul>
/// <li>
/// <code>channels</code>: Filter by channels.
/// </li>
/// <li>
/// <code>language-code</code>: Filter by language code.
/// </li>
/// <li>
/// <code>supported-countries</code>: Filter by supported countries.
/// </li>
/// <li>
/// <code>supported-voice-ids</code>: Filter by supported voice IDs.
/// </li>
/// <li>
/// <code>template-type</code>: Filter by template type.
/// </li>
/// <li>
/// <code>tier-access</code>: Filter by tier access.
/// </li>
/// </ul>
class NotifyTemplateFilterName {
  static const templateType = NotifyTemplateFilterName._('template-type');
  static const channels = NotifyTemplateFilterName._('channels');
  static const tierAccess = NotifyTemplateFilterName._('tier-access');
  static const supportedCountries =
      NotifyTemplateFilterName._('supported-countries');
  static const languageCode = NotifyTemplateFilterName._('language-code');
  static const supportedVoiceIds =
      NotifyTemplateFilterName._('supported-voice-ids');

  final String value;

  const NotifyTemplateFilterName._(this.value);

  static const values = [
    templateType,
    channels,
    tierAccess,
    supportedCountries,
    languageCode,
    supportedVoiceIds
  ];

  static NotifyTemplateFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotifyTemplateFilterName._(value));

  @override
  bool operator ==(other) =>
      other is NotifyTemplateFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The information for a notify configuration in an Amazon Web Services
/// account.
class NotifyConfigurationInformation {
  /// The time when the notify configuration was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  final bool deletionProtectionEnabled;

  /// The display name associated with the notify configuration.
  final String displayName;

  /// An array of channels enabled for the notify configuration. Supported values
  /// include <code>SMS</code> and <code>VOICE</code>.
  final List<NumberCapability> enabledChannels;

  /// The Amazon Resource Name (ARN) for the notify configuration.
  final String notifyConfigurationArn;

  /// The unique identifier for the notify configuration.
  final String notifyConfigurationId;

  /// The current status of the notify configuration.
  final NotifyConfigurationStatus status;

  /// The tier of the notify configuration.
  final NotifyConfigurationTier tier;

  /// The tier upgrade status of the notify configuration.
  final TierUpgradeStatus tierUpgradeStatus;

  /// The use case for the notify configuration.
  final NotifyConfigurationUseCase useCase;

  /// The default template identifier associated with the notify configuration.
  final String? defaultTemplateId;

  /// An array of two-character ISO country codes, in ISO 3166-1 alpha-2 format,
  /// that are enabled for the notify configuration.
  final List<String>? enabledCountries;

  /// The identifier of the pool associated with the notify configuration.
  final String? poolId;

  /// The reason the notify configuration was rejected, if applicable.
  final String? rejectionReason;

  NotifyConfigurationInformation({
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.displayName,
    required this.enabledChannels,
    required this.notifyConfigurationArn,
    required this.notifyConfigurationId,
    required this.status,
    required this.tier,
    required this.tierUpgradeStatus,
    required this.useCase,
    this.defaultTemplateId,
    this.enabledCountries,
    this.poolId,
    this.rejectionReason,
  });

  factory NotifyConfigurationInformation.fromJson(Map<String, dynamic> json) {
    return NotifyConfigurationInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      deletionProtectionEnabled:
          (json['DeletionProtectionEnabled'] as bool?) ?? false,
      displayName: (json['DisplayName'] as String?) ?? '',
      enabledChannels: ((json['EnabledChannels'] as List?) ?? const [])
          .nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      notifyConfigurationArn: (json['NotifyConfigurationArn'] as String?) ?? '',
      notifyConfigurationId: (json['NotifyConfigurationId'] as String?) ?? '',
      status: NotifyConfigurationStatus.fromString(
          (json['Status'] as String?) ?? ''),
      tier: NotifyConfigurationTier.fromString((json['Tier'] as String?) ?? ''),
      tierUpgradeStatus: TierUpgradeStatus.fromString(
          (json['TierUpgradeStatus'] as String?) ?? ''),
      useCase: NotifyConfigurationUseCase.fromString(
          (json['UseCase'] as String?) ?? ''),
      defaultTemplateId: json['DefaultTemplateId'] as String?,
      enabledCountries: (json['EnabledCountries'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      poolId: json['PoolId'] as String?,
      rejectionReason: json['RejectionReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final displayName = this.displayName;
    final enabledChannels = this.enabledChannels;
    final notifyConfigurationArn = this.notifyConfigurationArn;
    final notifyConfigurationId = this.notifyConfigurationId;
    final status = this.status;
    final tier = this.tier;
    final tierUpgradeStatus = this.tierUpgradeStatus;
    final useCase = this.useCase;
    final defaultTemplateId = this.defaultTemplateId;
    final enabledCountries = this.enabledCountries;
    final poolId = this.poolId;
    final rejectionReason = this.rejectionReason;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'DisplayName': displayName,
      'EnabledChannels': enabledChannels.map((e) => e.value).toList(),
      'NotifyConfigurationArn': notifyConfigurationArn,
      'NotifyConfigurationId': notifyConfigurationId,
      'Status': status.value,
      'Tier': tier.value,
      'TierUpgradeStatus': tierUpgradeStatus.value,
      'UseCase': useCase.value,
      if (defaultTemplateId != null) 'DefaultTemplateId': defaultTemplateId,
      if (enabledCountries != null) 'EnabledCountries': enabledCountries,
      if (poolId != null) 'PoolId': poolId,
      if (rejectionReason != null) 'RejectionReason': rejectionReason,
    };
  }
}

/// The information for notify configurations that meet a specified criteria.
class NotifyConfigurationFilter {
  /// The name of the attribute to filter on.
  final NotifyConfigurationFilterName name;

  /// An array values to filter for.
  final List<String> values;

  NotifyConfigurationFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

/// The filter name for filtering notify configurations. The available filter
/// names are:
///
/// <ul>
/// <li>
/// <code>default-pool</code>: Filter by the default pool.
/// </li>
/// <li>
/// <code>default-template</code>: Filter by the default template.
/// </li>
/// <li>
/// <code>deletion-protection-enabled</code>: Filter by deletion protection
/// status.
/// </li>
/// <li>
/// <code>display-name</code>: Filter by display name.
/// </li>
/// <li>
/// <code>enabled-channels</code>: Filter by enabled channels.
/// </li>
/// <li>
/// <code>enabled-countries</code>: Filter by enabled countries.
/// </li>
/// <li>
/// <code>status</code>: Filter by status.
/// </li>
/// <li>
/// <code>tier-upgrade-status</code>: Filter by tier upgrade status.
/// </li>
/// <li>
/// <code>use-case</code>: Filter by use case.
/// </li>
/// </ul>
class NotifyConfigurationFilterName {
  static const displayName = NotifyConfigurationFilterName._('display-name');
  static const enabledCountries =
      NotifyConfigurationFilterName._('enabled-countries');
  static const enabledChannels =
      NotifyConfigurationFilterName._('enabled-channels');
  static const defaultTemplate =
      NotifyConfigurationFilterName._('default-template');
  static const defaultPool = NotifyConfigurationFilterName._('default-pool');
  static const useCase = NotifyConfigurationFilterName._('use-case');
  static const status = NotifyConfigurationFilterName._('status');
  static const deletionProtectionEnabled =
      NotifyConfigurationFilterName._('deletion-protection-enabled');
  static const tierUpgradeStatus =
      NotifyConfigurationFilterName._('tier-upgrade-status');

  final String value;

  const NotifyConfigurationFilterName._(this.value);

  static const values = [
    displayName,
    enabledCountries,
    enabledChannels,
    defaultTemplate,
    defaultPool,
    useCase,
    status,
    deletionProtectionEnabled,
    tierUpgradeStatus
  ];

  static NotifyConfigurationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NotifyConfigurationFilterName._(value));

  @override
  bool operator ==(other) =>
      other is NotifyConfigurationFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      keyword: (json['Keyword'] as String?) ?? '',
      keywordAction:
          KeywordAction.fromString((json['KeywordAction'] as String?) ?? ''),
      keywordMessage: (json['KeywordMessage'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyword = this.keyword;
    final keywordAction = this.keywordAction;
    final keywordMessage = this.keywordMessage;
    return {
      'Keyword': keyword,
      'KeywordAction': keywordAction.value,
      'KeywordMessage': keywordMessage,
    };
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class KeywordFilterName {
  static const keywordAction = KeywordFilterName._('keyword-action');

  final String value;

  const KeywordFilterName._(this.value);

  static const values = [keywordAction];

  static KeywordFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => KeywordFilterName._(value));

  @override
  bool operator ==(other) => other is KeywordFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

  /// True if message feedback is enabled.
  final bool? defaultMessageFeedbackEnabled;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final MessageType? defaultMessageType;

  /// The default sender ID used by the ConfigurationSet.
  final String? defaultSenderId;

  /// The unique identifier for the protect configuration.
  final String? protectConfigurationId;

  ConfigurationSetInformation({
    required this.configurationSetArn,
    required this.configurationSetName,
    required this.createdTimestamp,
    required this.eventDestinations,
    this.defaultMessageFeedbackEnabled,
    this.defaultMessageType,
    this.defaultSenderId,
    this.protectConfigurationId,
  });

  factory ConfigurationSetInformation.fromJson(Map<String, dynamic> json) {
    return ConfigurationSetInformation(
      configurationSetArn: (json['ConfigurationSetArn'] as String?) ?? '',
      configurationSetName: (json['ConfigurationSetName'] as String?) ?? '',
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] ?? 0),
      eventDestinations: ((json['EventDestinations'] as List?) ?? const [])
          .nonNulls
          .map((e) => EventDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultMessageFeedbackEnabled:
          json['DefaultMessageFeedbackEnabled'] as bool?,
      defaultMessageType:
          (json['DefaultMessageType'] as String?)?.let(MessageType.fromString),
      defaultSenderId: json['DefaultSenderId'] as String?,
      protectConfigurationId: json['ProtectConfigurationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final createdTimestamp = this.createdTimestamp;
    final eventDestinations = this.eventDestinations;
    final defaultMessageFeedbackEnabled = this.defaultMessageFeedbackEnabled;
    final defaultMessageType = this.defaultMessageType;
    final defaultSenderId = this.defaultSenderId;
    final protectConfigurationId = this.protectConfigurationId;
    return {
      'ConfigurationSetArn': configurationSetArn,
      'ConfigurationSetName': configurationSetName,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'EventDestinations': eventDestinations,
      if (defaultMessageFeedbackEnabled != null)
        'DefaultMessageFeedbackEnabled': defaultMessageFeedbackEnabled,
      if (defaultMessageType != null)
        'DefaultMessageType': defaultMessageType.value,
      if (defaultSenderId != null) 'DefaultSenderId': defaultSenderId,
      if (protectConfigurationId != null)
        'ProtectConfigurationId': protectConfigurationId,
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

class ConfigurationSetFilterName {
  static const eventDestinationName =
      ConfigurationSetFilterName._('event-destination-name');
  static const matchingEventTypes =
      ConfigurationSetFilterName._('matching-event-types');
  static const defaultMessageType =
      ConfigurationSetFilterName._('default-message-type');
  static const defaultSenderId =
      ConfigurationSetFilterName._('default-sender-id');
  static const defaultMessageFeedbackEnabled =
      ConfigurationSetFilterName._('default-message-feedback-enabled');
  static const protectConfigurationId =
      ConfigurationSetFilterName._('protect-configuration-id');

  final String value;

  const ConfigurationSetFilterName._(this.value);

  static const values = [
    eventDestinationName,
    matchingEventTypes,
    defaultMessageType,
    defaultSenderId,
    defaultMessageFeedbackEnabled,
    protectConfigurationId
  ];

  static ConfigurationSetFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationSetFilterName._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationSetFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      max: (json['Max'] as int?) ?? 0,
      name: AccountLimitName.fromString((json['Name'] as String?) ?? ''),
      used: (json['Used'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final max = this.max;
    final name = this.name;
    final used = this.used;
    return {
      'Max': max,
      'Name': name.value,
      'Used': used,
    };
  }
}

class AccountLimitName {
  static const phoneNumbers = AccountLimitName._('PHONE_NUMBERS');
  static const pools = AccountLimitName._('POOLS');
  static const configurationSets = AccountLimitName._('CONFIGURATION_SETS');
  static const optOutLists = AccountLimitName._('OPT_OUT_LISTS');
  static const senderIds = AccountLimitName._('SENDER_IDS');
  static const registrations = AccountLimitName._('REGISTRATIONS');
  static const registrationAttachments =
      AccountLimitName._('REGISTRATION_ATTACHMENTS');
  static const verifiedDestinationNumbers =
      AccountLimitName._('VERIFIED_DESTINATION_NUMBERS');

  final String value;

  const AccountLimitName._(this.value);

  static const values = [
    phoneNumbers,
    pools,
    configurationSets,
    optOutLists,
    senderIds,
    registrations,
    registrationAttachments,
    verifiedDestinationNumbers
  ];

  static AccountLimitName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccountLimitName._(value));

  @override
  bool operator ==(other) => other is AccountLimitName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      name: AccountAttributeName.fromString((json['Name'] as String?) ?? ''),
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name.value,
      'Value': value,
    };
  }
}

class AccountAttributeName {
  static const accountTier = AccountAttributeName._('ACCOUNT_TIER');
  static const defaultProtectConfigurationId =
      AccountAttributeName._('DEFAULT_PROTECT_CONFIGURATION_ID');

  final String value;

  const AccountAttributeName._(this.value);

  static const values = [accountTier, defaultProtectConfigurationId];

  static AccountAttributeName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccountAttributeName._(value));

  @override
  bool operator ==(other) =>
      other is AccountAttributeName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PhoneNumberType {
  static const mobile = PhoneNumberType._('MOBILE');
  static const landline = PhoneNumberType._('LANDLINE');
  static const other = PhoneNumberType._('OTHER');
  static const invalid = PhoneNumberType._('INVALID');

  final String value;

  const PhoneNumberType._(this.value);

  static const values = [mobile, landline, other, invalid];

  static PhoneNumberType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PhoneNumberType._(value));

  @override
  bool operator ==(other) => other is PhoneNumberType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
