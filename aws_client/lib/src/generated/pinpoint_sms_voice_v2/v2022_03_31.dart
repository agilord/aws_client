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

/// Welcome to the <i>Amazon Pinpoint SMS and Voice, version 2 API
/// Reference</i>. This guide provides information about Amazon Pinpoint SMS and
/// Voice, version 2 API resources, including supported HTTP methods,
/// parameters, and schemas.
///
/// Amazon Pinpoint is an Amazon Web Services service that you can use to engage
/// with your recipients across multiple messaging channels. The Amazon Pinpoint
/// SMS and Voice, version 2 API provides programmatic access to options that
/// are unique to the SMS and voice channels. Amazon Pinpoint SMS and Voice,
/// version 2 resources such as phone numbers, sender IDs, and opt-out lists can
/// be used by the Amazon Pinpoint API.
///
/// If you're new to Amazon Pinpoint SMS, it's also helpful to review the <a
/// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/what-is-service.html">
/// Amazon Pinpoint SMS User Guide</a>. The <i>Amazon Pinpoint Developer
/// Guide</i> provides tutorials, code samples, and procedures that demonstrate
/// how to use Amazon Pinpoint SMS features programmatically and how to
/// integrate Amazon Pinpoint functionality into mobile apps and other types of
/// applications. The guide also provides key information, such as Amazon
/// Pinpoint integration with other Amazon Web Services services, and the quotas
/// that apply to use of the service.
///
/// <b>Regional availability</b>
///
/// The <i>Amazon Pinpoint SMS and Voice, version 2 API Reference</i> is
/// available in several Amazon Web Services Regions and it provides an endpoint
/// for each of these Regions. For a list of all the Regions and endpoints where
/// the API is currently available, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#pinpoint_region">Amazon
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
/// href="https://aws.amazon.com/about-aws/global-infrastructure/">Amazon Web
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

  /// Associates the specified origination identity with a pool.
  ///
  /// If the origination identity is a phone number and is already associated
  /// with another pool, an error is returned. A sender ID can be associated
  /// with multiple pools.
  ///
  /// If the origination identity configuration doesn't match the pool's
  /// configuration, an error is returned.
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

  /// Associate a protect configuration with a configuration set. This replaces
  /// the configuration sets current protect configuration. A configuration set
  /// can only be associated with one protect configuration at a time. A protect
  /// configuration can be associated with multiple configuration sets.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
        'MessageType': messageType.value,
        'OriginationIdentity': originationIdentity,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// Creates a new registration based on the <b>RegistrationType</b> field.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// to a file. The maximum file size is 1MiB and valid file extensions are
  /// PDF, JPEG and PNG. For example, many sender ID registrations require a
  /// signed “letter of authorization” (LOA) to be submitted.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attachmentBody] :
  /// The registration file to upload. The maximum file size is 1MiB and valid
  /// file extensions are PDF, JPEG and PNG.
  ///
  /// Parameter [attachmentUrl] :
  /// A URL to the required registration file. For example, you can provide the
  /// S3 object URL.
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The verified destination phone number, in E.164 format.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) to associate with the destination
  /// number.
  Future<CreateVerifiedDestinationNumberResult>
      createVerifiedDestinationNumber({
    required String destinationPhoneNumber,
    String? clientToken,
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
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateVerifiedDestinationNumberResult.fromJson(jsonResponse.body);
  }

  /// Removes the current account default protect configuration.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// Deletes an existing opt-out list. All opted out phone numbers in the
  /// opt-out list are deleted.
  ///
  /// If the specified opt-out list name doesn't exist or is in-use by an
  /// origination phone number or pool, an error is returned.
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
  /// list doesn't exist, an error is returned.
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
  /// error is returned.
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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

  /// Permanently delete an existing registration from your account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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

  /// Delete a verified destination phone number.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// If you specify a keyword that isn't valid, an error is returned.
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
  /// If you specify an opt-out list name that isn't valid, an error is
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
  /// If you specify an opted out number that isn't valid, an error is returned.
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
  /// If you specify a phone number ID that isn't valid, an error is returned.
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
  /// If you specify a pool ID that isn't valid, an error is returned.
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

  /// Retrieves the protect configurations that match any of filters. If a
  /// filter isn’t provided then all protect configurations are returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// Retrieves the specified registration attachments or all registration
  /// attachments associated with your Amazon Web Services account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// Retrieves the specified registration section definitions. You can use
  /// DescribeRegistrationSectionDefinitions to view the requirements for
  /// creating, filling out, and submitting each registration type.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// Retrieves the specified registrations.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// Retrieves the specified verified destiona numbers.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// An array of VerifiedDestinationNumberid to retreive.
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

  /// Disassociate a protect configuration from a configuration set.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// Retreive all of the origination identies that are associated with a
  /// registration.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// If you specify a keyword that isn't valid, an error is returned.
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
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// SenderId or SenderIdArn. You can use <a>DescribePhoneNumbers</a> get the
  /// values for PhoneNumberId and PhoneNumberArn while <a>DescribeSenderIds</a>
  /// can be used to get the values for SenderId and SenderIdArn.
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

  /// Creates an opted out destination phone number in the opt-out list.
  ///
  /// If the destination phone number isn't valid or if the specified opt-out
  /// list doesn't exist, an error is returned.
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

  /// Creates or updates a field value for a registration.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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

  /// Releases an existing origination phone number in your account. Once
  /// released, a phone number is no longer available for sending messages.
  ///
  /// If the origination phone number has deletion protection enabled or is
  /// associated with a pool, an error is returned.
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
  /// the OptOutListName or OptOutListArn.
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
  /// The origination identity of the message. This can be either the
  /// PhoneNumber, PhoneNumberId, PhoneNumberArn, SenderId, SenderIdArn, PoolId,
  /// or PoolArn.
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
  /// The media files have to be stored in a publicly available S3 bucket.
  /// Supported media file formats are listed in <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/mms-limitations-character.html">MMS
  /// file types, size and character limits</a>. For more information on
  /// creating an S3 bucket and managing objects, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-bucket-overview.html">Creating
  /// a bucket</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/upload-objects.html">Uploading
  /// objects</a> in the S3 user guide.
  ///
  /// Parameter [messageBody] :
  /// The text body of the message.
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier of the protect configuration to use.
  ///
  /// Parameter [timeToLive] :
  /// How long the text message is valid for. By default this is 72 hours.
  Future<SendMediaMessageResult> sendMediaMessage({
    required String destinationPhoneNumber,
    required String originationIdentity,
    String? configurationSetName,
    Map<String, String>? context,
    bool? dryRun,
    String? maxPrice,
    List<String>? mediaUrls,
    String? messageBody,
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
        if (protectConfigurationId != null)
          'ProtectConfigurationId': protectConfigurationId,
        if (timeToLive != null) 'TimeToLive': timeToLive,
      },
    );

    return SendMediaMessageResult.fromJson(jsonResponse.body);
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
  /// The type of message. Valid values are for messages that are critical or
  /// time-sensitive and PROMOTIONAL for messages that aren't critical or
  /// time-sensitive.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity of the message. This can be either the
  /// PhoneNumber, PhoneNumberId, PhoneNumberArn, SenderId, SenderIdArn, PoolId,
  /// or PoolArn.
  ///
  /// Parameter [protectConfigurationId] :
  /// The unique identifier for the protect configuration.
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

  /// Allows you to send a request that sends a voice message through Amazon
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [registrationId] :
  /// The unique identifier for the registration.
  Future<SubmitRegistrationVersionResult> submitRegistrationVersion({
    required String registrationId,
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
      },
    );

    return SubmitRegistrationVersionResult.fromJson(jsonResponse.body);
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

  /// Updates the configuration of an existing origination phone number. You can
  /// update the opt-out list, enable or disable two-way messaging, change the
  /// TwoWayChannelArn, enable or disable self-managed opt-outs, and enable or
  /// disable deletion protection.
  ///
  /// If the origination phone number is associated with a pool, an error is
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// Update a country rule set to <code>ALLOW</code> or <code>BLOCK</code>
  /// messages to be sent to the specified destination counties. You can update
  /// one or multiple countries at a time. The updates are only applied to the
  /// specified NumberCapability type.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [countryRuleSetUpdates] :
  /// A map of ProtectConfigurationCountryRuleSetInformation objects that
  /// contain the details for the requested NumberCapability. The Key is the
  /// two-letter ISO country code. For a list of supported ISO country codes,
  /// see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-sms-by-country.html">Supported
  /// countries and regions (SMS channel)</a> in the Amazon Pinpoint SMS user
  /// guide.
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

  /// Updates the configuration of an existing sender ID.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
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
      name: AccountAttributeName.fromString((json['Name'] as String)),
      value: json['Value'] as String,
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

enum AccountAttributeName {
  accountTier('ACCOUNT_TIER'),
  defaultProtectConfigurationId('DEFAULT_PROTECT_CONFIGURATION_ID'),
  ;

  final String value;

  const AccountAttributeName(this.value);

  static AccountAttributeName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum AccountAttributeName'));
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
      name: AccountLimitName.fromString((json['Name'] as String)),
      used: json['Used'] as int,
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

enum AccountLimitName {
  phoneNumbers('PHONE_NUMBERS'),
  pools('POOLS'),
  configurationSets('CONFIGURATION_SETS'),
  optOutLists('OPT_OUT_LISTS'),
  senderIds('SENDER_IDS'),
  registrations('REGISTRATIONS'),
  registrationAttachments('REGISTRATION_ATTACHMENTS'),
  verifiedDestinationNumbers('VERIFIED_DESTINATION_NUMBERS'),
  ;

  final String value;

  const AccountLimitName(this.value);

  static AccountLimitName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AccountLimitName'));
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
      configurationSetArn: json['ConfigurationSetArn'] as String,
      configurationSetName: json['ConfigurationSetName'] as String,
      protectConfigurationArn: json['ProtectConfigurationArn'] as String,
      protectConfigurationId: json['ProtectConfigurationId'] as String,
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

enum AttachmentStatus {
  uploadInProgress('UPLOAD_IN_PROGRESS'),
  uploadComplete('UPLOAD_COMPLETE'),
  uploadFailed('UPLOAD_FAILED'),
  deleted('DELETED'),
  ;

  final String value;

  const AttachmentStatus(this.value);

  static AttachmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AttachmentStatus'));
}

enum AttachmentUploadErrorReason {
  internalError('INTERNAL_ERROR'),
  ;

  final String value;

  const AttachmentUploadErrorReason(this.value);

  static AttachmentUploadErrorReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AttachmentUploadErrorReason'));
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

enum ConfigurationSetFilterName {
  eventDestinationName('event-destination-name'),
  matchingEventTypes('matching-event-types'),
  defaultMessageType('default-message-type'),
  defaultSenderId('default-sender-id'),
  protectConfigurationId('protect-configuration-id'),
  ;

  final String value;

  const ConfigurationSetFilterName(this.value);

  static ConfigurationSetFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ConfigurationSetFilterName'));
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

  /// The unique identifier for the protect configuration.
  final String? protectConfigurationId;

  ConfigurationSetInformation({
    required this.configurationSetArn,
    required this.configurationSetName,
    required this.createdTimestamp,
    required this.eventDestinations,
    this.defaultMessageType,
    this.defaultSenderId,
    this.protectConfigurationId,
  });

  factory ConfigurationSetInformation.fromJson(Map<String, dynamic> json) {
    return ConfigurationSetInformation(
      configurationSetArn: json['ConfigurationSetArn'] as String,
      configurationSetName: json['ConfigurationSetName'] as String,
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      eventDestinations: (json['EventDestinations'] as List)
          .nonNulls
          .map((e) => EventDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    final defaultMessageType = this.defaultMessageType;
    final defaultSenderId = this.defaultSenderId;
    final protectConfigurationId = this.protectConfigurationId;
    return {
      'ConfigurationSetArn': configurationSetArn,
      'ConfigurationSetName': configurationSetName,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'EventDestinations': eventDestinations,
      if (defaultMessageType != null)
        'DefaultMessageType': defaultMessageType.value,
      if (defaultSenderId != null) 'DefaultSenderId': defaultSenderId,
      if (protectConfigurationId != null)
        'ProtectConfigurationId': protectConfigurationId,
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
      accountDefault: json['AccountDefault'] as bool,
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      protectConfigurationArn: json['ProtectConfigurationArn'] as String,
      protectConfigurationId: json['ProtectConfigurationId'] as String,
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
      registrationArn: json['RegistrationArn'] as String,
      registrationId: json['RegistrationId'] as String,
      registrationType: json['RegistrationType'] as String,
      resourceArn: json['ResourceArn'] as String,
      resourceId: json['ResourceId'] as String,
      resourceType: json['ResourceType'] as String,
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
      attachmentStatus:
          AttachmentStatus.fromString((json['AttachmentStatus'] as String)),
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      registrationAttachmentArn: json['RegistrationAttachmentArn'] as String,
      registrationAttachmentId: json['RegistrationAttachmentId'] as String,
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
  /// <code>CREATED</code>: Your registration is created but not submitted.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted and is awaiting
  /// review.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>PROVISIONING</code>: Your registration has been approved and your
  /// origination identity is being created.
  /// </li>
  /// <li>
  /// <code>COMPLETE</code>: Your registration has been approved and and your
  /// origination identity has been created.
  /// </li>
  /// <li>
  /// <code>REQUIRES_UPDATES</code>: You must fix your registration and resubmit
  /// it.
  /// </li>
  /// <li>
  /// <code>CLOSED</code>: The phone number or sender ID has been deleted and you
  /// must also delete the registration for the number.
  /// </li>
  /// <li>
  /// <code>DELETED</code>: The registration has been deleted.
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
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      currentVersionNumber: json['CurrentVersionNumber'] as int,
      registrationArn: json['RegistrationArn'] as String,
      registrationId: json['RegistrationId'] as String,
      registrationStatus:
          RegistrationStatus.fromString((json['RegistrationStatus'] as String)),
      registrationType: json['RegistrationType'] as String,
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

class CreateRegistrationVersionResult {
  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The status of the registration.
  ///
  /// <ul>
  /// <li>
  /// <code>DRAFT</code>: The initial status of a registration version after it’s
  /// created.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>APPROVED</code>: Your registration has been approved.
  /// </li>
  /// <li>
  /// <code>DISCARDED</code>: You've abandon this version of their registration to
  /// start over with a new version.
  /// </li>
  /// <li>
  /// <code>DENIED</code>: You must fix your registration and resubmit it.
  /// </li>
  /// <li>
  /// <code>REVOKED</code>: Your previously approved registration has been
  /// revoked.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code>: Your previously approved registration version moves
  /// into this status when a more recently submitted version is approved.
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
      registrationArn: json['RegistrationArn'] as String,
      registrationId: json['RegistrationId'] as String,
      registrationVersionStatus: RegistrationVersionStatus.fromString(
          (json['RegistrationVersionStatus'] as String)),
      registrationVersionStatusHistory:
          RegistrationVersionStatusHistory.fromJson(
              json['RegistrationVersionStatusHistory'] as Map<String, dynamic>),
      versionNumber: json['VersionNumber'] as int,
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

  /// An array of tags (key and value pairs) to associate with the destination
  /// number.
  final List<Tag>? tags;

  CreateVerifiedDestinationNumberResult({
    required this.createdTimestamp,
    required this.destinationPhoneNumber,
    required this.status,
    required this.verifiedDestinationNumberArn,
    required this.verifiedDestinationNumberId,
    this.tags,
  });

  factory CreateVerifiedDestinationNumberResult.fromJson(
      Map<String, dynamic> json) {
    return CreateVerifiedDestinationNumberResult(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      destinationPhoneNumber: json['DestinationPhoneNumber'] as String,
      status: VerificationStatus.fromString((json['Status'] as String)),
      verifiedDestinationNumberArn:
          json['VerifiedDestinationNumberArn'] as String,
      verifiedDestinationNumberId:
          json['VerifiedDestinationNumberId'] as String,
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
    final tags = this.tags;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DestinationPhoneNumber': destinationPhoneNumber,
      'Status': status.value,
      'VerifiedDestinationNumberArn': verifiedDestinationNumberArn,
      'VerifiedDestinationNumberId': verifiedDestinationNumberId,
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
          json['DefaultProtectConfigurationArn'] as String,
      defaultProtectConfigurationId:
          json['DefaultProtectConfigurationId'] as String,
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
      accountDefault: json['AccountDefault'] as bool,
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      protectConfigurationArn: json['ProtectConfigurationArn'] as String,
      protectConfigurationId: json['ProtectConfigurationId'] as String,
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
      attachmentStatus:
          AttachmentStatus.fromString((json['AttachmentStatus'] as String)),
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      registrationAttachmentArn: json['RegistrationAttachmentArn'] as String,
      registrationAttachmentId: json['RegistrationAttachmentId'] as String,
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
      fieldPath: json['FieldPath'] as String,
      registrationArn: json['RegistrationArn'] as String,
      registrationId: json['RegistrationId'] as String,
      versionNumber: json['VersionNumber'] as int,
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
  /// <code>CREATED</code>: Your registration is created but not submitted.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted and is awaiting
  /// review.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>PROVISIONING</code>: Your registration has been approved and your
  /// origination identity is being created.
  /// </li>
  /// <li>
  /// <code>COMPLETE</code>: Your registration has been approved and and your
  /// origination identity has been created.
  /// </li>
  /// <li>
  /// <code>REQUIRES_UPDATES</code>: You must fix your registration and resubmit
  /// it.
  /// </li>
  /// <li>
  /// <code>CLOSED</code>: The phone number or sender ID has been deleted and you
  /// must also delete the registration for the number.
  /// </li>
  /// <li>
  /// <code>DELETED</code>: The registration has been deleted.
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
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      currentVersionNumber: json['CurrentVersionNumber'] as int,
      registrationArn: json['RegistrationArn'] as String,
      registrationId: json['RegistrationId'] as String,
      registrationStatus:
          RegistrationStatus.fromString((json['RegistrationStatus'] as String)),
      registrationType: json['RegistrationType'] as String,
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
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      destinationPhoneNumber: json['DestinationPhoneNumber'] as String,
      verifiedDestinationNumberArn:
          json['VerifiedDestinationNumberArn'] as String,
      verifiedDestinationNumberId:
          json['VerifiedDestinationNumberId'] as String,
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
      registrationAttachments: (json['RegistrationAttachments'] as List)
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
      registrationFieldDefinitions: (json['RegistrationFieldDefinitions']
              as List)
          .nonNulls
          .map((e) =>
              RegistrationFieldDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      registrationType: json['RegistrationType'] as String,
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
      registrationArn: json['RegistrationArn'] as String,
      registrationFieldValues: (json['RegistrationFieldValues'] as List)
          .nonNulls
          .map((e) => RegistrationFieldValueInformation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      registrationId: json['RegistrationId'] as String,
      versionNumber: json['VersionNumber'] as int,
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
      registrationSectionDefinitions: (json['RegistrationSectionDefinitions']
              as List)
          .nonNulls
          .map((e) =>
              RegistrationSectionDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      registrationType: json['RegistrationType'] as String,
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
      registrationTypeDefinitions: (json['RegistrationTypeDefinitions'] as List)
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
      registrationArn: json['RegistrationArn'] as String,
      registrationId: json['RegistrationId'] as String,
      registrationVersions: (json['RegistrationVersions'] as List)
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
      registrations: (json['Registrations'] as List)
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
      verifiedDestinationNumbers: (json['VerifiedDestinationNumbers'] as List)
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

enum DestinationCountryParameterKey {
  inTemplateId('IN_TEMPLATE_ID'),
  inEntityId('IN_ENTITY_ID'),
  ;

  final String value;

  const DestinationCountryParameterKey(this.value);

  static DestinationCountryParameterKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DestinationCountryParameterKey'));
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
      configurationSetArn: json['ConfigurationSetArn'] as String,
      configurationSetName: json['ConfigurationSetName'] as String,
      protectConfigurationArn: json['ProtectConfigurationArn'] as String,
      protectConfigurationId: json['ProtectConfigurationId'] as String,
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
  /// <code>DRAFT</code>: The initial status of a registration version after it’s
  /// created.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>APPROVED</code>: Your registration has been approved.
  /// </li>
  /// <li>
  /// <code>DISCARDED</code>: You've abandon this version of their registration to
  /// start over with a new version.
  /// </li>
  /// <li>
  /// <code>DENIED</code>: You must fix your registration and resubmit it.
  /// </li>
  /// <li>
  /// <code>REVOKED</code>: Your previously approved registration has been
  /// revoked.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code>: Your previously approved registration version moves
  /// into this status when a more recently submitted version is approved.
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
      registrationArn: json['RegistrationArn'] as String,
      registrationId: json['RegistrationId'] as String,
      registrationVersionStatus: RegistrationVersionStatus.fromString(
          (json['RegistrationVersionStatus'] as String)),
      registrationVersionStatusHistory:
          RegistrationVersionStatusHistory.fromJson(
              json['RegistrationVersionStatusHistory'] as Map<String, dynamic>),
      versionNumber: json['VersionNumber'] as int,
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

/// Contains information about an event destination.
///
/// Event destinations are associated with configuration sets, which enable you
/// to publish message sending events to CloudWatch, Kinesis Data Firehose, or
/// Amazon SNS.
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

enum EventType {
  all('ALL'),
  textAll('TEXT_ALL'),
  textSent('TEXT_SENT'),
  textPending('TEXT_PENDING'),
  textQueued('TEXT_QUEUED'),
  textSuccessful('TEXT_SUCCESSFUL'),
  textDelivered('TEXT_DELIVERED'),
  textInvalid('TEXT_INVALID'),
  textInvalidMessage('TEXT_INVALID_MESSAGE'),
  textUnreachable('TEXT_UNREACHABLE'),
  textCarrierUnreachable('TEXT_CARRIER_UNREACHABLE'),
  textBlocked('TEXT_BLOCKED'),
  textCarrierBlocked('TEXT_CARRIER_BLOCKED'),
  textSpam('TEXT_SPAM'),
  textUnknown('TEXT_UNKNOWN'),
  textTtlExpired('TEXT_TTL_EXPIRED'),
  voiceAll('VOICE_ALL'),
  voiceInitiated('VOICE_INITIATED'),
  voiceRinging('VOICE_RINGING'),
  voiceAnswered('VOICE_ANSWERED'),
  voiceCompleted('VOICE_COMPLETED'),
  voiceBusy('VOICE_BUSY'),
  voiceNoAnswer('VOICE_NO_ANSWER'),
  voiceFailed('VOICE_FAILED'),
  voiceTtlExpired('VOICE_TTL_EXPIRED'),
  mediaAll('MEDIA_ALL'),
  mediaPending('MEDIA_PENDING'),
  mediaQueued('MEDIA_QUEUED'),
  mediaSuccessful('MEDIA_SUCCESSFUL'),
  mediaDelivered('MEDIA_DELIVERED'),
  mediaInvalid('MEDIA_INVALID'),
  mediaInvalidMessage('MEDIA_INVALID_MESSAGE'),
  mediaUnreachable('MEDIA_UNREACHABLE'),
  mediaCarrierUnreachable('MEDIA_CARRIER_UNREACHABLE'),
  mediaBlocked('MEDIA_BLOCKED'),
  mediaCarrierBlocked('MEDIA_CARRIER_BLOCKED'),
  mediaSpam('MEDIA_SPAM'),
  mediaUnknown('MEDIA_UNKNOWN'),
  mediaTtlExpired('MEDIA_TTL_EXPIRED'),
  mediaFileInaccessible('MEDIA_FILE_INACCESSIBLE'),
  mediaFileTypeUnsupported('MEDIA_FILE_TYPE_UNSUPPORTED'),
  mediaFileSizeExceeded('MEDIA_FILE_SIZE_EXCEEDED'),
  ;

  final String value;

  const EventType(this.value);

  static EventType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum EventType'));
}

enum FieldRequirement {
  required('REQUIRED'),
  conditional('CONDITIONAL'),
  optional('OPTIONAL'),
  ;

  final String value;

  const FieldRequirement(this.value);

  static FieldRequirement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum FieldRequirement'));
}

enum FieldType {
  select('SELECT'),
  text('TEXT'),
  attachment('ATTACHMENT'),
  ;

  final String value;

  const FieldType(this.value);

  static FieldType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum FieldType'));
}

class GetProtectConfigurationCountryRuleSetResult {
  /// A map of ProtectConfigurationCountryRuleSetInformation objects that contain
  /// the details for the requested NumberCapability. The Key is the two-letter
  /// ISO country code. For a list of supported ISO country codes, see <a
  /// href="https://docs.aws.amazon.com/sms-voice/latest/userguide/phone-numbers-sms-by-country.html">Supported
  /// countries and regions (SMS channel)</a> in the Amazon Pinpoint SMS user
  /// guide.
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
      countryRuleSet: (json['CountryRuleSet'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(
              k,
              ProtectConfigurationCountryRuleSetInformation.fromJson(
                  e as Map<String, dynamic>))),
      numberCapability:
          NumberCapability.fromString((json['NumberCapability'] as String)),
      protectConfigurationArn: json['ProtectConfigurationArn'] as String,
      protectConfigurationId: json['ProtectConfigurationId'] as String,
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

enum KeywordAction {
  automaticResponse('AUTOMATIC_RESPONSE'),
  optOut('OPT_OUT'),
  optIn('OPT_IN'),
  ;

  final String value;

  const KeywordAction(this.value);

  static KeywordAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum KeywordAction'));
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

enum KeywordFilterName {
  keywordAction('keyword-action'),
  ;

  final String value;

  const KeywordFilterName(this.value);

  static KeywordFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum KeywordFilterName'));
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
      keywordAction:
          KeywordAction.fromString((json['KeywordAction'] as String)),
      keywordMessage: json['KeywordMessage'] as String,
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

/// Contains the delivery stream Amazon Resource Name (ARN), and the ARN of the
/// Identity and Access Management (IAM) role associated with a Kinesis Data
/// Firehose event destination.
///
/// Event destinations, such as Kinesis Data Firehose, are associated with
/// configuration sets, which enable you to publish message sending events.
class KinesisFirehoseDestination {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  final String deliveryStreamArn;

  /// The ARN of an Identity and Access Management role that is able to write
  /// event data to an Amazon Kinesis Data Firehose destination.
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

enum LanguageCode {
  deDe('DE_DE'),
  enGb('EN_GB'),
  enUs('EN_US'),
  es_419('ES_419'),
  esEs('ES_ES'),
  frCa('FR_CA'),
  frFr('FR_FR'),
  itIt('IT_IT'),
  jaJp('JA_JP'),
  koKr('KO_KR'),
  ptBr('PT_BR'),
  zhCn('ZH_CN'),
  zhTw('ZH_TW'),
  ;

  final String value;

  const LanguageCode(this.value);

  static LanguageCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LanguageCode'));
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
      registrationArn: json['RegistrationArn'] as String,
      registrationAssociations: (json['RegistrationAssociations'] as List)
          .nonNulls
          .map((e) => RegistrationAssociationMetadata.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      registrationId: json['RegistrationId'] as String,
      registrationType: json['RegistrationType'] as String,
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

enum MessageType {
  transactional('TRANSACTIONAL'),
  promotional('PROMOTIONAL'),
  ;

  final String value;

  const MessageType(this.value);

  static MessageType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum MessageType'));
}

enum NumberCapability {
  sms('SMS'),
  voice('VOICE'),
  mms('MMS'),
  ;

  final String value;

  const NumberCapability(this.value);

  static NumberCapability fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum NumberCapability'));
}

enum NumberStatus {
  pending('PENDING'),
  active('ACTIVE'),
  associating('ASSOCIATING'),
  disassociating('DISASSOCIATING'),
  deleted('DELETED'),
  ;

  final String value;

  const NumberStatus(this.value);

  static NumberStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum NumberStatus'));
}

enum NumberType {
  shortCode('SHORT_CODE'),
  longCode('LONG_CODE'),
  tollFree('TOLL_FREE'),
  tenDlc('TEN_DLC'),
  simulator('SIMULATOR'),
  ;

  final String value;

  const NumberType(this.value);

  static NumberType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum NumberType'));
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

enum OptedOutFilterName {
  endUserOptedOut('end-user-opted-out'),
  ;

  final String value;

  const OptedOutFilterName(this.value);

  static OptedOutFilterName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum OptedOutFilterName'));
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
      isoCountryCode: json['IsoCountryCode'] as String,
      numberCapabilities: (json['NumberCapabilities'] as List)
          .nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      originationIdentity: json['OriginationIdentity'] as String,
      originationIdentityArn: json['OriginationIdentityArn'] as String,
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

enum PhoneNumberFilterName {
  status('status'),
  isoCountryCode('iso-country-code'),
  messageType('message-type'),
  numberCapability('number-capability'),
  numberType('number-type'),
  twoWayEnabled('two-way-enabled'),
  selfManagedOptOutsEnabled('self-managed-opt-outs-enabled'),
  optOutListName('opt-out-list-name'),
  deletionProtectionEnabled('deletion-protection-enabled'),
  twoWayChannelArn('two-way-channel-arn'),
  ;

  final String value;

  const PhoneNumberFilterName(this.value);

  static PhoneNumberFilterName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum PhoneNumberFilterName'));
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
    this.phoneNumberId,
    this.poolId,
    this.registrationId,
    this.twoWayChannelArn,
    this.twoWayChannelRole,
  });

  factory PhoneNumberInformation.fromJson(Map<String, dynamic> json) {
    return PhoneNumberInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      isoCountryCode: json['IsoCountryCode'] as String,
      messageType: MessageType.fromString((json['MessageType'] as String)),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String,
      numberCapabilities: (json['NumberCapabilities'] as List)
          .nonNulls
          .map((e) => NumberCapability.fromString((e as String)))
          .toList(),
      numberType: NumberType.fromString((json['NumberType'] as String)),
      optOutListName: json['OptOutListName'] as String,
      phoneNumber: json['PhoneNumber'] as String,
      phoneNumberArn: json['PhoneNumberArn'] as String,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool,
      status: NumberStatus.fromString((json['Status'] as String)),
      twoWayEnabled: json['TwoWayEnabled'] as bool,
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
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (poolId != null) 'PoolId': poolId,
      if (registrationId != null) 'RegistrationId': registrationId,
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

enum PoolFilterName {
  status('status'),
  messageType('message-type'),
  twoWayEnabled('two-way-enabled'),
  selfManagedOptOutsEnabled('self-managed-opt-outs-enabled'),
  optOutListName('opt-out-list-name'),
  sharedRoutesEnabled('shared-routes-enabled'),
  deletionProtectionEnabled('deletion-protection-enabled'),
  twoWayChannelArn('two-way-channel-arn'),
  ;

  final String value;

  const PoolFilterName(this.value);

  static PoolFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PoolFilterName'));
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
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      messageType: MessageType.fromString((json['MessageType'] as String)),
      optOutListName: json['OptOutListName'] as String,
      poolArn: json['PoolArn'] as String,
      poolId: json['PoolId'] as String,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool,
      sharedRoutesEnabled: json['SharedRoutesEnabled'] as bool,
      status: PoolStatus.fromString((json['Status'] as String)),
      twoWayEnabled: json['TwoWayEnabled'] as bool,
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

enum PoolOriginationIdentitiesFilterName {
  isoCountryCode('iso-country-code'),
  numberCapability('number-capability'),
  ;

  final String value;

  const PoolOriginationIdentitiesFilterName(this.value);

  static PoolOriginationIdentitiesFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum PoolOriginationIdentitiesFilterName'));
}

enum PoolStatus {
  creating('CREATING'),
  active('ACTIVE'),
  deleting('DELETING'),
  ;

  final String value;

  const PoolStatus(this.value);

  static PoolStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum PoolStatus'));
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
          ProtectStatus.fromString((json['ProtectStatus'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final protectStatus = this.protectStatus;
    return {
      'ProtectStatus': protectStatus.value,
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

enum ProtectConfigurationFilterName {
  accountDefault('account-default'),
  deletionProtectionEnabled('deletion-protection-enabled'),
  ;

  final String value;

  const ProtectConfigurationFilterName(this.value);

  static ProtectConfigurationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ProtectConfigurationFilterName'));
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
      accountDefault: json['AccountDefault'] as bool,
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      protectConfigurationArn: json['ProtectConfigurationArn'] as String,
      protectConfigurationId: json['ProtectConfigurationId'] as String,
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

enum ProtectStatus {
  allow('ALLOW'),
  block('BLOCK'),
  ;

  final String value;

  const ProtectStatus(this.value);

  static ProtectStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ProtectStatus'));
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
      fieldPath: json['FieldPath'] as String,
      registrationArn: json['RegistrationArn'] as String,
      registrationId: json['RegistrationId'] as String,
      versionNumber: json['VersionNumber'] as int,
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

enum RegistrationAssociationBehavior {
  associateBeforeSubmit('ASSOCIATE_BEFORE_SUBMIT'),
  associateOnApproval('ASSOCIATE_ON_APPROVAL'),
  associateAfterComplete('ASSOCIATE_AFTER_COMPLETE'),
  ;

  final String value;

  const RegistrationAssociationBehavior(this.value);

  static RegistrationAssociationBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RegistrationAssociationBehavior'));
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

enum RegistrationAssociationFilterName {
  resourceType('resource-type'),
  isoCountryCode('iso-country-code'),
  ;

  final String value;

  const RegistrationAssociationFilterName(this.value);

  static RegistrationAssociationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RegistrationAssociationFilterName'));
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
      resourceArn: json['ResourceArn'] as String,
      resourceId: json['ResourceId'] as String,
      resourceType: json['ResourceType'] as String,
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

enum RegistrationAttachmentFilterName {
  attachmentStatus('attachment-status'),
  ;

  final String value;

  const RegistrationAttachmentFilterName(this.value);

  static RegistrationAttachmentFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RegistrationAttachmentFilterName'));
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

  RegistrationAttachmentsInformation({
    required this.attachmentStatus,
    required this.createdTimestamp,
    required this.registrationAttachmentArn,
    required this.registrationAttachmentId,
    this.attachmentUploadErrorReason,
  });

  factory RegistrationAttachmentsInformation.fromJson(
      Map<String, dynamic> json) {
    return RegistrationAttachmentsInformation(
      attachmentStatus:
          AttachmentStatus.fromString((json['AttachmentStatus'] as String)),
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      registrationAttachmentArn: json['RegistrationAttachmentArn'] as String,
      registrationAttachmentId: json['RegistrationAttachmentId'] as String,
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
      reason: json['Reason'] as String,
      shortDescription: json['ShortDescription'] as String,
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

enum RegistrationDisassociationBehavior {
  disassociateAllClosesRegistration('DISASSOCIATE_ALL_CLOSES_REGISTRATION'),
  disassociateAllAllowsDeleteRegistration(
      'DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION'),
  deleteRegistrationDisassociates('DELETE_REGISTRATION_DISASSOCIATES'),
  ;

  final String value;

  const RegistrationDisassociationBehavior(this.value);

  static RegistrationDisassociationBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RegistrationDisassociationBehavior'));
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
          json['DisplayHints'] as Map<String, dynamic>),
      fieldPath: json['FieldPath'] as String,
      fieldRequirement:
          FieldRequirement.fromString((json['FieldRequirement'] as String)),
      fieldType: FieldType.fromString((json['FieldType'] as String)),
      sectionPath: json['SectionPath'] as String,
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
      shortDescription: json['ShortDescription'] as String,
      title: json['Title'] as String,
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

/// Provides the values of the specified field.
class RegistrationFieldValueInformation {
  /// The path to the registration form field. You can use
  /// <a>DescribeRegistrationFieldDefinitions</a> for a list of <b>FieldPaths</b>.
  final String fieldPath;

  /// A description of why the registration was denied.
  final String? deniedReason;

  /// The unique identifier for the registration attachment.
  final String? registrationAttachmentId;

  /// An array of values for the form field.
  final List<String>? selectChoices;

  /// The text data for a free form field.
  final String? textValue;

  RegistrationFieldValueInformation({
    required this.fieldPath,
    this.deniedReason,
    this.registrationAttachmentId,
    this.selectChoices,
    this.textValue,
  });

  factory RegistrationFieldValueInformation.fromJson(
      Map<String, dynamic> json) {
    return RegistrationFieldValueInformation(
      fieldPath: json['FieldPath'] as String,
      deniedReason: json['DeniedReason'] as String?,
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
    final registrationAttachmentId = this.registrationAttachmentId;
    final selectChoices = this.selectChoices;
    final textValue = this.textValue;
    return {
      'FieldPath': fieldPath,
      if (deniedReason != null) 'DeniedReason': deniedReason,
      if (registrationAttachmentId != null)
        'RegistrationAttachmentId': registrationAttachmentId,
      if (selectChoices != null) 'SelectChoices': selectChoices,
      if (textValue != null) 'TextValue': textValue,
    };
  }
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

enum RegistrationFilterName {
  registrationType('registration-type'),
  registrationStatus('registration-status'),
  ;

  final String value;

  const RegistrationFilterName(this.value);

  static RegistrationFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RegistrationFilterName'));
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
  /// <code>CREATED</code>: Your registration is created but not submitted.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted and is awaiting
  /// review.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>PROVISIONING</code>: Your registration has been approved and your
  /// origination identity is being created.
  /// </li>
  /// <li>
  /// <code>COMPLETE</code>: Your registration has been approved and and your
  /// origination identity has been created.
  /// </li>
  /// <li>
  /// <code>REQUIRES_UPDATES</code>: You must fix your registration and resubmit
  /// it.
  /// </li>
  /// <li>
  /// <code>CLOSED</code>: The phone number or sender ID has been deleted and you
  /// must also delete the registration for the number.
  /// </li>
  /// <li>
  /// <code>DELETED</code>: The registration has been deleted.
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
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      currentVersionNumber: json['CurrentVersionNumber'] as int,
      registrationArn: json['RegistrationArn'] as String,
      registrationId: json['RegistrationId'] as String,
      registrationStatus:
          RegistrationStatus.fromString((json['RegistrationStatus'] as String)),
      registrationType: json['RegistrationType'] as String,
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
          json['DisplayHints'] as Map<String, dynamic>),
      sectionPath: json['SectionPath'] as String,
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
      shortDescription: json['ShortDescription'] as String,
      title: json['Title'] as String,
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

enum RegistrationStatus {
  created('CREATED'),
  submitted('SUBMITTED'),
  reviewing('REVIEWING'),
  provisioning('PROVISIONING'),
  complete('COMPLETE'),
  requiresUpdates('REQUIRES_UPDATES'),
  closed('CLOSED'),
  deleted('DELETED'),
  ;

  final String value;

  const RegistrationStatus(this.value);

  static RegistrationStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RegistrationStatus'));
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
          json['DisplayHints'] as Map<String, dynamic>),
      registrationType: json['RegistrationType'] as String,
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
      title: json['Title'] as String,
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

enum RegistrationTypeFilterName {
  supportedAssociationResourceType('supported-association-resource-type'),
  supportedAssociationIsoCountryCode('supported-association-iso-country-code'),
  ;

  final String value;

  const RegistrationTypeFilterName(this.value);

  static RegistrationTypeFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RegistrationTypeFilterName'));
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

enum RegistrationVersionFilterName {
  registrationVersionStatus('registration-version-status'),
  ;

  final String value;

  const RegistrationVersionFilterName(this.value);

  static RegistrationVersionFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RegistrationVersionFilterName'));
}

/// Provides information about the specified version of the registration.
class RegistrationVersionInformation {
  /// The status of the registration.
  ///
  /// <ul>
  /// <li>
  /// <code>DRAFT</code>: The initial status of a registration version after it’s
  /// created.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>APPROVED</code>: Your registration has been approved.
  /// </li>
  /// <li>
  /// <code>DISCARDED</code>: You've abandon this version of their registration to
  /// start over with a new version.
  /// </li>
  /// <li>
  /// <code>DENIED</code>: You must fix your registration and resubmit it.
  /// </li>
  /// <li>
  /// <code>REVOKED</code>: Your previously approved registration has been
  /// revoked.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code>: Your previously approved registration version moves
  /// into this status when a more recently submitted version is approved.
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

  RegistrationVersionInformation({
    required this.registrationVersionStatus,
    required this.registrationVersionStatusHistory,
    required this.versionNumber,
    this.deniedReasons,
  });

  factory RegistrationVersionInformation.fromJson(Map<String, dynamic> json) {
    return RegistrationVersionInformation(
      registrationVersionStatus: RegistrationVersionStatus.fromString(
          (json['RegistrationVersionStatus'] as String)),
      registrationVersionStatusHistory:
          RegistrationVersionStatusHistory.fromJson(
              json['RegistrationVersionStatusHistory'] as Map<String, dynamic>),
      versionNumber: json['VersionNumber'] as int,
      deniedReasons: (json['DeniedReasons'] as List?)
          ?.nonNulls
          .map((e) => RegistrationDeniedReasonInformation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final registrationVersionStatus = this.registrationVersionStatus;
    final registrationVersionStatusHistory =
        this.registrationVersionStatusHistory;
    final versionNumber = this.versionNumber;
    final deniedReasons = this.deniedReasons;
    return {
      'RegistrationVersionStatus': registrationVersionStatus.value,
      'RegistrationVersionStatusHistory': registrationVersionStatusHistory,
      'VersionNumber': versionNumber,
      if (deniedReasons != null) 'DeniedReasons': deniedReasons,
    };
  }
}

enum RegistrationVersionStatus {
  draft('DRAFT'),
  submitted('SUBMITTED'),
  reviewing('REVIEWING'),
  approved('APPROVED'),
  discarded('DISCARDED'),
  denied('DENIED'),
  revoked('REVOKED'),
  archived('ARCHIVED'),
  ;

  final String value;

  const RegistrationVersionStatus(this.value);

  static RegistrationVersionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RegistrationVersionStatus'));
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

  /// The time when the registration was in the denied state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? deniedTimestamp;

  /// The time when the registration was in the discarded state, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? discardedTimestamp;

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
    this.deniedTimestamp,
    this.discardedTimestamp,
    this.reviewingTimestamp,
    this.revokedTimestamp,
    this.submittedTimestamp,
  });

  factory RegistrationVersionStatusHistory.fromJson(Map<String, dynamic> json) {
    return RegistrationVersionStatusHistory(
      draftTimestamp:
          nonNullableTimeStampFromJson(json['DraftTimestamp'] as Object),
      approvedTimestamp: timeStampFromJson(json['ApprovedTimestamp']),
      archivedTimestamp: timeStampFromJson(json['ArchivedTimestamp']),
      deniedTimestamp: timeStampFromJson(json['DeniedTimestamp']),
      discardedTimestamp: timeStampFromJson(json['DiscardedTimestamp']),
      reviewingTimestamp: timeStampFromJson(json['ReviewingTimestamp']),
      revokedTimestamp: timeStampFromJson(json['RevokedTimestamp']),
      submittedTimestamp: timeStampFromJson(json['SubmittedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final draftTimestamp = this.draftTimestamp;
    final approvedTimestamp = this.approvedTimestamp;
    final archivedTimestamp = this.archivedTimestamp;
    final deniedTimestamp = this.deniedTimestamp;
    final discardedTimestamp = this.discardedTimestamp;
    final reviewingTimestamp = this.reviewingTimestamp;
    final revokedTimestamp = this.revokedTimestamp;
    final submittedTimestamp = this.submittedTimestamp;
    return {
      'DraftTimestamp': unixTimestampToJson(draftTimestamp),
      if (approvedTimestamp != null)
        'ApprovedTimestamp': unixTimestampToJson(approvedTimestamp),
      if (archivedTimestamp != null)
        'ArchivedTimestamp': unixTimestampToJson(archivedTimestamp),
      if (deniedTimestamp != null)
        'DeniedTimestamp': unixTimestampToJson(deniedTimestamp),
      if (discardedTimestamp != null)
        'DiscardedTimestamp': unixTimestampToJson(discardedTimestamp),
      if (reviewingTimestamp != null)
        'ReviewingTimestamp': unixTimestampToJson(reviewingTimestamp),
      if (revokedTimestamp != null)
        'RevokedTimestamp': unixTimestampToJson(revokedTimestamp),
      if (submittedTimestamp != null)
        'SubmittedTimestamp': unixTimestampToJson(submittedTimestamp),
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
      isoCountryCode: json['IsoCountryCode'] as String,
      messageTypes: (json['MessageTypes'] as List)
          .nonNulls
          .map((e) => MessageType.fromString((e as String)))
          .toList(),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String,
      registered: json['Registered'] as bool,
      senderId: json['SenderId'] as String,
      senderIdArn: json['SenderIdArn'] as String,
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

  /// An optional IAM Role Arn for a service to assume, to be able to post inbound
  /// SMS messages.
  final String? twoWayChannelRole;

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
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      isoCountryCode: json['IsoCountryCode'] as String,
      messageTypes: (json['MessageTypes'] as List)
          .nonNulls
          .map((e) => MessageType.fromString((e as String)))
          .toList(),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String,
      registered: json['Registered'] as bool,
      senderId: json['SenderId'] as String,
      senderIdArn: json['SenderIdArn'] as String,
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

enum RequestableNumberType {
  longCode('LONG_CODE'),
  tollFree('TOLL_FREE'),
  tenDlc('TEN_DLC'),
  simulator('SIMULATOR'),
  ;

  final String value;

  const RequestableNumberType(this.value);

  static RequestableNumberType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RequestableNumberType'));
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
      option: json['Option'] as String,
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
      maxChoices: json['MaxChoices'] as int,
      minChoices: json['MinChoices'] as int,
      options:
          (json['Options'] as List).nonNulls.map((e) => e as String).toList(),
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

class SendDestinationNumberVerificationCodeResult {
  /// The unique identifier for the message.
  final String messageId;

  SendDestinationNumberVerificationCodeResult({
    required this.messageId,
  });

  factory SendDestinationNumberVerificationCodeResult.fromJson(
      Map<String, dynamic> json) {
    return SendDestinationNumberVerificationCodeResult(
      messageId: json['MessageId'] as String,
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.value,
      'Values': values,
    };
  }
}

enum SenderIdFilterName {
  senderId('sender-id'),
  isoCountryCode('iso-country-code'),
  messageType('message-type'),
  deletionProtectionEnabled('deletion-protection-enabled'),
  registered('registered'),
  ;

  final String value;

  const SenderIdFilterName(this.value);

  static SenderIdFilterName fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SenderIdFilterName'));
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
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      isoCountryCode: json['IsoCountryCode'] as String,
      messageTypes: (json['MessageTypes'] as List)
          .nonNulls
          .map((e) => MessageType.fromString((e as String)))
          .toList(),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String,
      registered: json['Registered'] as bool,
      senderId: json['SenderId'] as String,
      senderIdArn: json['SenderIdArn'] as String,
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
          json['DefaultProtectConfigurationArn'] as String,
      defaultProtectConfigurationId:
          json['DefaultProtectConfigurationId'] as String,
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
      name: SpendLimitName.fromString((json['Name'] as String)),
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
      'Name': name.value,
      'Overridden': overridden,
    };
  }
}

enum SpendLimitName {
  textMessageMonthlySpendLimit('TEXT_MESSAGE_MONTHLY_SPEND_LIMIT'),
  voiceMessageMonthlySpendLimit('VOICE_MESSAGE_MONTHLY_SPEND_LIMIT'),
  mediaMessageMonthlySpendLimit('MEDIA_MESSAGE_MONTHLY_SPEND_LIMIT'),
  ;

  final String value;

  const SpendLimitName(this.value);

  static SpendLimitName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SpendLimitName'));
}

class SubmitRegistrationVersionResult {
  /// The Amazon Resource Name (ARN) for the registration.
  final String registrationArn;

  /// The unique identifier for the registration.
  final String registrationId;

  /// The status of the registration version.
  ///
  /// <ul>
  /// <li>
  /// <code>DRAFT</code>: The initial status of a registration version after it’s
  /// created.
  /// </li>
  /// <li>
  /// <code>SUBMITTED</code>: Your registration has been submitted.
  /// </li>
  /// <li>
  /// <code>REVIEWING</code>: Your registration has been accepted and is being
  /// reviewed.
  /// </li>
  /// <li>
  /// <code>APPROVED</code>: Your registration has been approved.
  /// </li>
  /// <li>
  /// <code>DISCARDED</code>: You've abandon this version of their registration to
  /// start over with a new version.
  /// </li>
  /// <li>
  /// <code>DENIED</code>: You must fix your registration and resubmit it.
  /// </li>
  /// <li>
  /// <code>REVOKED</code>: Your previously approved registration has been
  /// revoked.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code>: Your previously approved registration version moves
  /// into this status when a more recently submitted version is approved.
  /// </li>
  /// </ul>
  final RegistrationVersionStatus registrationVersionStatus;

  /// The <b>RegistrationVersionStatusHistory</b> object contains the time stamps
  /// for when the reservations status changes.
  final RegistrationVersionStatusHistory registrationVersionStatusHistory;

  /// The version number of the registration.
  final int versionNumber;

  SubmitRegistrationVersionResult({
    required this.registrationArn,
    required this.registrationId,
    required this.registrationVersionStatus,
    required this.registrationVersionStatusHistory,
    required this.versionNumber,
  });

  factory SubmitRegistrationVersionResult.fromJson(Map<String, dynamic> json) {
    return SubmitRegistrationVersionResult(
      registrationArn: json['RegistrationArn'] as String,
      registrationId: json['RegistrationId'] as String,
      registrationVersionStatus: RegistrationVersionStatus.fromString(
          (json['RegistrationVersionStatus'] as String)),
      registrationVersionStatusHistory:
          RegistrationVersionStatusHistory.fromJson(
              json['RegistrationVersionStatusHistory'] as Map<String, dynamic>),
      versionNumber: json['VersionNumber'] as int,
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
  /// <code>ASSOCIATE_ON_APPROVAL</code> This applies to all short code
  /// registrations. The short code will be automatically provisioned once the
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
          (json['AssociationBehavior'] as String)),
      disassociationBehavior: RegistrationDisassociationBehavior.fromString(
          (json['DisassociationBehavior'] as String)),
      resourceType: json['ResourceType'] as String,
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
      maxLength: json['MaxLength'] as int,
      minLength: json['MinLength'] as int,
      pattern: json['Pattern'] as String,
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
      countryRuleSet: (json['CountryRuleSet'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(
              k,
              ProtectConfigurationCountryRuleSetInformation.fromJson(
                  e as Map<String, dynamic>))),
      numberCapability:
          NumberCapability.fromString((json['NumberCapability'] as String)),
      protectConfigurationArn: json['ProtectConfigurationArn'] as String,
      protectConfigurationId: json['ProtectConfigurationId'] as String,
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
      accountDefault: json['AccountDefault'] as bool,
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      protectConfigurationArn: json['ProtectConfigurationArn'] as String,
      protectConfigurationId: json['ProtectConfigurationId'] as String,
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
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      isoCountryCode: json['IsoCountryCode'] as String,
      messageTypes: (json['MessageTypes'] as List)
          .nonNulls
          .map((e) => MessageType.fromString((e as String)))
          .toList(),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String,
      registered: json['Registered'] as bool,
      senderId: json['SenderId'] as String,
      senderIdArn: json['SenderIdArn'] as String,
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

enum VerificationChannel {
  text('TEXT'),
  voice('VOICE'),
  ;

  final String value;

  const VerificationChannel(this.value);

  static VerificationChannel fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum VerificationChannel'));
}

enum VerificationStatus {
  pending('PENDING'),
  verified('VERIFIED'),
  ;

  final String value;

  const VerificationStatus(this.value);

  static VerificationStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum VerificationStatus'));
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

enum VerifiedDestinationNumberFilterName {
  status('status'),
  ;

  final String value;

  const VerifiedDestinationNumberFilterName(this.value);

  static VerifiedDestinationNumberFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum VerifiedDestinationNumberFilterName'));
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

  VerifiedDestinationNumberInformation({
    required this.createdTimestamp,
    required this.destinationPhoneNumber,
    required this.status,
    required this.verifiedDestinationNumberArn,
    required this.verifiedDestinationNumberId,
  });

  factory VerifiedDestinationNumberInformation.fromJson(
      Map<String, dynamic> json) {
    return VerifiedDestinationNumberInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      destinationPhoneNumber: json['DestinationPhoneNumber'] as String,
      status: VerificationStatus.fromString((json['Status'] as String)),
      verifiedDestinationNumberArn:
          json['VerifiedDestinationNumberArn'] as String,
      verifiedDestinationNumberId:
          json['VerifiedDestinationNumberId'] as String,
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
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      destinationPhoneNumber: json['DestinationPhoneNumber'] as String,
      status: VerificationStatus.fromString((json['Status'] as String)),
      verifiedDestinationNumberArn:
          json['VerifiedDestinationNumberArn'] as String,
      verifiedDestinationNumberId:
          json['VerifiedDestinationNumberId'] as String,
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

enum VoiceId {
  amy('AMY'),
  astrid('ASTRID'),
  bianca('BIANCA'),
  brian('BRIAN'),
  camila('CAMILA'),
  carla('CARLA'),
  carmen('CARMEN'),
  celine('CELINE'),
  chantal('CHANTAL'),
  conchita('CONCHITA'),
  cristiano('CRISTIANO'),
  dora('DORA'),
  emma('EMMA'),
  enrique('ENRIQUE'),
  ewa('EWA'),
  filiz('FILIZ'),
  geraint('GERAINT'),
  giorgio('GIORGIO'),
  gwyneth('GWYNETH'),
  hans('HANS'),
  ines('INES'),
  ivy('IVY'),
  jacek('JACEK'),
  jan('JAN'),
  joanna('JOANNA'),
  joey('JOEY'),
  justin('JUSTIN'),
  karl('KARL'),
  kendra('KENDRA'),
  kimberly('KIMBERLY'),
  lea('LEA'),
  liv('LIV'),
  lotte('LOTTE'),
  lucia('LUCIA'),
  lupe('LUPE'),
  mads('MADS'),
  maja('MAJA'),
  marlene('MARLENE'),
  mathieu('MATHIEU'),
  matthew('MATTHEW'),
  maxim('MAXIM'),
  mia('MIA'),
  miguel('MIGUEL'),
  mizuki('MIZUKI'),
  naja('NAJA'),
  nicole('NICOLE'),
  penelope('PENELOPE'),
  raveena('RAVEENA'),
  ricardo('RICARDO'),
  ruben('RUBEN'),
  russell('RUSSELL'),
  salli('SALLI'),
  seoyeon('SEOYEON'),
  takumi('TAKUMI'),
  tatyana('TATYANA'),
  vicki('VICKI'),
  vitoria('VITORIA'),
  zeina('ZEINA'),
  zhiyu('ZHIYU'),
  ;

  final String value;

  const VoiceId(this.value);

  static VoiceId fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum VoiceId'));
}

enum VoiceMessageBodyTextType {
  text('TEXT'),
  ssml('SSML'),
  ;

  final String value;

  const VoiceMessageBodyTextType(this.value);

  static VoiceMessageBodyTextType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum VoiceMessageBodyTextType'));
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
