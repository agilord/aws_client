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

/// The Amazon Chime SDK telephony APIs in this section enable developers to
/// create PSTN calling solutions that use Amazon Chime SDK Voice Connectors,
/// and Amazon Chime SDK SIP media applications. Developers can also order and
/// manage phone numbers, create and manage Voice Connectors and SIP media
/// applications, and run voice analytics.
class ChimeSdkVoice {
  final _s.RestJsonProtocol _protocol;
  ChimeSdkVoice({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'voice-chime',
            signingName: 'chime',
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

  /// Associates phone numbers with the specified Amazon Chime SDK Voice
  /// Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [forceAssociate] :
  /// If true, associates the provided phone numbers with the provided Amazon
  /// Chime SDK Voice Connector and removes any previously existing
  /// associations. If false, does not associate any phone numbers that have
  /// previously existing associations.
  Future<AssociatePhoneNumbersWithVoiceConnectorResponse>
      associatePhoneNumbersWithVoiceConnector({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorId,
    bool? forceAssociate,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
      if (forceAssociate != null) 'ForceAssociate': forceAssociate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}?operation=associate-phone-numbers',
      exceptionFnMap: _exceptionFns,
    );
    return AssociatePhoneNumbersWithVoiceConnectorResponse.fromJson(response);
  }

  /// Associates phone numbers with the specified Amazon Chime SDK Voice
  /// Connector group.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [voiceConnectorGroupId] :
  /// The Amazon Chime SDK Voice Connector group ID.
  ///
  /// Parameter [forceAssociate] :
  /// If true, associates the provided phone numbers with the provided Amazon
  /// Chime SDK Voice Connector Group and removes any previously existing
  /// associations. If false, does not associate any phone numbers that have
  /// previously existing associations.
  Future<AssociatePhoneNumbersWithVoiceConnectorGroupResponse>
      associatePhoneNumbersWithVoiceConnectorGroup({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorGroupId,
    bool? forceAssociate,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
      if (forceAssociate != null) 'ForceAssociate': forceAssociate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}?operation=associate-phone-numbers',
      exceptionFnMap: _exceptionFns,
    );
    return AssociatePhoneNumbersWithVoiceConnectorGroupResponse.fromJson(
        response);
  }

  /// Moves phone numbers into the <b>Deletion queue</b>. Phone numbers must be
  /// disassociated from any users or Amazon Chime SDK Voice Connectors before
  /// they can be deleted.
  ///
  /// Phone numbers remain in the <b>Deletion queue</b> for 7 days before they
  /// are deleted permanently.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberIds] :
  /// List of phone number IDs.
  Future<BatchDeletePhoneNumberResponse> batchDeletePhoneNumber({
    required List<String> phoneNumberIds,
  }) async {
    final $payload = <String, dynamic>{
      'PhoneNumberIds': phoneNumberIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-numbers?operation=batch-delete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeletePhoneNumberResponse.fromJson(response);
  }

  /// Updates phone number product types, calling names, or phone number names.
  /// You can update one attribute at a time for each
  /// <code>UpdatePhoneNumberRequestItem</code>. For example, you can update the
  /// product type, the calling name, or phone name.
  /// <note>
  /// You cannot have a duplicate <code>phoneNumberId</code> in a request.
  /// </note>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [updatePhoneNumberRequestItems] :
  /// Lists the phone numbers in the update request.
  Future<BatchUpdatePhoneNumberResponse> batchUpdatePhoneNumber({
    required List<UpdatePhoneNumberRequestItem> updatePhoneNumberRequestItems,
  }) async {
    final $payload = <String, dynamic>{
      'UpdatePhoneNumberRequestItems': updatePhoneNumberRequestItems,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-numbers?operation=batch-update',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdatePhoneNumberResponse.fromJson(response);
  }

  /// Creates an order for phone numbers to be provisioned. For numbers outside
  /// the U.S., you must use the Amazon Chime SDK SIP media application dial-in
  /// product type.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [productType] :
  /// The phone number product type.
  ///
  /// Parameter [name] :
  /// Specifies the name assigned to one or more phone numbers.
  Future<CreatePhoneNumberOrderResponse> createPhoneNumberOrder({
    required List<String> e164PhoneNumbers,
    required PhoneNumberProductType productType,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
      'ProductType': productType.toValue(),
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-number-orders',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePhoneNumberOrderResponse.fromJson(response);
  }

  /// Creates a proxy session for the specified Amazon Chime SDK Voice Connector
  /// for the specified participant phone numbers.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [capabilities] :
  /// The proxy session's capabilities.
  ///
  /// Parameter [participantPhoneNumbers] :
  /// The participant phone numbers.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [expiryMinutes] :
  /// The number of minutes allowed for the proxy session.
  ///
  /// Parameter [geoMatchLevel] :
  /// The preference for matching the country or area code of the proxy phone
  /// number with that of the first participant.
  ///
  /// Parameter [geoMatchParams] :
  /// The country and area code for the proxy phone number.
  ///
  /// Parameter [name] :
  /// The name of the proxy session.
  ///
  /// Parameter [numberSelectionBehavior] :
  /// The preference for proxy phone number reuse, or stickiness, between the
  /// same participants across sessions.
  Future<CreateProxySessionResponse> createProxySession({
    required List<Capability> capabilities,
    required List<String> participantPhoneNumbers,
    required String voiceConnectorId,
    int? expiryMinutes,
    GeoMatchLevel? geoMatchLevel,
    GeoMatchParams? geoMatchParams,
    String? name,
    NumberSelectionBehavior? numberSelectionBehavior,
  }) async {
    _s.validateNumRange(
      'expiryMinutes',
      expiryMinutes,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      'ParticipantPhoneNumbers': participantPhoneNumbers,
      if (expiryMinutes != null) 'ExpiryMinutes': expiryMinutes,
      if (geoMatchLevel != null) 'GeoMatchLevel': geoMatchLevel.toValue(),
      if (geoMatchParams != null) 'GeoMatchParams': geoMatchParams,
      if (name != null) 'Name': name,
      if (numberSelectionBehavior != null)
        'NumberSelectionBehavior': numberSelectionBehavior.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/proxy-sessions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProxySessionResponse.fromJson(response);
  }

  /// Creates a SIP media application. For more information about SIP media
  /// applications, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/ag/manage-sip-applications.html">Managing
  /// SIP media applications and rules</a> in the <i>Amazon Chime SDK
  /// Administrator Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [awsRegion] :
  /// The AWS Region assigned to the SIP media application.
  ///
  /// Parameter [endpoints] :
  /// List of endpoints (Lambda ARNs) specified for the SIP media application.
  ///
  /// Parameter [name] :
  /// The SIP media application's name.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the SIP media application.
  Future<CreateSipMediaApplicationResponse> createSipMediaApplication({
    required String awsRegion,
    required List<SipMediaApplicationEndpoint> endpoints,
    required String name,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'AwsRegion': awsRegion,
      'Endpoints': endpoints,
      'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sip-media-applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSipMediaApplicationResponse.fromJson(response);
  }

  /// Creates an outbound call to a phone number from the phone number specified
  /// in the request, and it invokes the endpoint of the specified
  /// <code>sipMediaApplicationId</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [fromPhoneNumber] :
  /// The phone number that a user calls from. This is a phone number in your
  /// Amazon Chime SDK phone number inventory.
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The ID of the SIP media application.
  ///
  /// Parameter [toPhoneNumber] :
  /// The phone number that the service should call.
  ///
  /// Parameter [argumentsMap] :
  /// Context passed to a CreateSipMediaApplication API call. For example, you
  /// could pass key-value pairs such as: <code>"FirstName": "John", "LastName":
  /// "Doe"</code>
  ///
  /// Parameter [sipHeaders] :
  /// The SIP headers added to an outbound call leg.
  Future<CreateSipMediaApplicationCallResponse> createSipMediaApplicationCall({
    required String fromPhoneNumber,
    required String sipMediaApplicationId,
    required String toPhoneNumber,
    Map<String, String>? argumentsMap,
    Map<String, String>? sipHeaders,
  }) async {
    final $payload = <String, dynamic>{
      'FromPhoneNumber': fromPhoneNumber,
      'ToPhoneNumber': toPhoneNumber,
      if (argumentsMap != null) 'ArgumentsMap': argumentsMap,
      if (sipHeaders != null) 'SipHeaders': sipHeaders,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}/calls',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSipMediaApplicationCallResponse.fromJson(response);
  }

  /// Creates a SIP rule, which can be used to run a SIP media application as a
  /// target for a specific trigger type. For more information about SIP rules,
  /// see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/ag/manage-sip-applications.html">Managing
  /// SIP media applications and rules</a> in the <i>Amazon Chime SDK
  /// Administrator Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the SIP rule.
  ///
  /// Parameter [triggerType] :
  /// The type of trigger assigned to the SIP rule in <code>TriggerValue</code>,
  /// currently <code>RequestUriHostname</code> or <code>ToPhoneNumber</code>.
  ///
  /// Parameter [triggerValue] :
  /// If <code>TriggerType</code> is <code>RequestUriHostname</code>, the value
  /// can be the outbound host name of a Voice Connector. If
  /// <code>TriggerType</code> is <code>ToPhoneNumber</code>, the value can be a
  /// customer-owned phone number in the E164 format. The
  /// <code>SipMediaApplication</code> specified in the <code>SipRule</code> is
  /// triggered if the request URI in an incoming SIP request matches the
  /// <code>RequestUriHostname</code>, or if the <code>To</code> header in the
  /// incoming SIP request matches the <code>ToPhoneNumber</code> value.
  ///
  /// Parameter [disabled] :
  /// Disables or enables a SIP rule. You must disable SIP rules before you can
  /// delete them.
  ///
  /// Parameter [targetApplications] :
  /// List of SIP media applications, with priority and AWS Region. Only one SIP
  /// application per AWS Region can be used.
  Future<CreateSipRuleResponse> createSipRule({
    required String name,
    required SipRuleTriggerType triggerType,
    required String triggerValue,
    bool? disabled,
    List<SipRuleTargetApplication>? targetApplications,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'TriggerType': triggerType.toValue(),
      'TriggerValue': triggerValue,
      if (disabled != null) 'Disabled': disabled,
      if (targetApplications != null) 'TargetApplications': targetApplications,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sip-rules',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSipRuleResponse.fromJson(response);
  }

  /// Creates an Amazon Chime SDK Voice Connector. For more information about
  /// Voice Connectors, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/ag/voice-connector-groups.html">Managing
  /// Amazon Chime SDK Voice Connector groups</a> in the <i>Amazon Chime SDK
  /// Administrator Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the Voice Connector.
  ///
  /// Parameter [requireEncryption] :
  /// Enables or disables encryption for the Voice Connector.
  ///
  /// Parameter [awsRegion] :
  /// The AWS Region in which the Amazon Chime SDK Voice Connector is created.
  /// Default value: <code>us-east-1</code> .
  ///
  /// Parameter [tags] :
  /// The tags assigned to the Voice Connector.
  Future<CreateVoiceConnectorResponse> createVoiceConnector({
    required String name,
    required bool requireEncryption,
    VoiceConnectorAwsRegion? awsRegion,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'RequireEncryption': requireEncryption,
      if (awsRegion != null) 'AwsRegion': awsRegion.toValue(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/voice-connectors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVoiceConnectorResponse.fromJson(response);
  }

  /// Creates an Amazon Chime SDK Voice Connector group under the
  /// administrator's AWS account. You can associate Amazon Chime SDK Voice
  /// Connectors with the Voice Connector group by including
  /// <code>VoiceConnectorItems</code> in the request.
  ///
  /// You can include Voice Connectors from different AWS Regions in your group.
  /// This creates a fault tolerant mechanism for fallback in case of
  /// availability events.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the Voice Connector group.
  ///
  /// Parameter [voiceConnectorItems] :
  /// Lists the Voice Connectors that inbound calls are routed to.
  Future<CreateVoiceConnectorGroupResponse> createVoiceConnectorGroup({
    required String name,
    List<VoiceConnectorItem>? voiceConnectorItems,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (voiceConnectorItems != null)
        'VoiceConnectorItems': voiceConnectorItems,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/voice-connector-groups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVoiceConnectorGroupResponse.fromJson(response);
  }

  /// Creates a voice profile, which consists of an enrolled user and their
  /// latest voice print.
  /// <important>
  /// Before creating any voice profiles, you must provide all notices and
  /// obtain all consents from the speaker as required under applicable privacy
  /// and biometrics laws, and as required under the <a
  /// href="https://aws.amazon.com/service-terms/">AWS service terms</a> for the
  /// Amazon Chime SDK.
  /// </important>
  /// For more information about voice profiles and voice analytics, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/pstn-voice-analytics.html">Using
  /// Amazon Chime SDK Voice Analytics</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [GoneException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [speakerSearchTaskId] :
  /// The ID of the speaker search task.
  Future<CreateVoiceProfileResponse> createVoiceProfile({
    required String speakerSearchTaskId,
  }) async {
    final $payload = <String, dynamic>{
      'SpeakerSearchTaskId': speakerSearchTaskId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/voice-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVoiceProfileResponse.fromJson(response);
  }

  /// Creates a voice profile domain, a collection of voice profiles, their
  /// voice prints, and encrypted enrollment audio.
  /// <important>
  /// Before creating any voice profiles, you must provide all notices and
  /// obtain all consents from the speaker as required under applicable privacy
  /// and biometrics laws, and as required under the <a
  /// href="https://aws.amazon.com/service-terms/">AWS service terms</a> for the
  /// Amazon Chime SDK.
  /// </important>
  /// For more information about voice profile domains, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/pstn-voice-analytics.html">Using
  /// Amazon Chime SDK Voice Analytics</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the voice profile domain.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// The server-side encryption configuration for the request.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. Use a different token for
  /// different domain creation requests.
  ///
  /// Parameter [description] :
  /// A description of the voice profile domain.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the domain.
  Future<CreateVoiceProfileDomainResponse> createVoiceProfileDomain({
    required String name,
    required ServerSideEncryptionConfiguration
        serverSideEncryptionConfiguration,
    String? clientRequestToken,
    String? description,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'ServerSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/voice-profile-domains',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVoiceProfileDomainResponse.fromJson(response);
  }

  /// Moves the specified phone number into the <b>Deletion queue</b>. A phone
  /// number must be disassociated from any users or Amazon Chime SDK Voice
  /// Connectors before it can be deleted.
  ///
  /// Deleted phone numbers remain in the <b>Deletion queue</b> queue for 7 days
  /// before they are deleted permanently.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberId] :
  /// The phone number ID.
  Future<void> deletePhoneNumber({
    required String phoneNumberId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified proxy session from the specified Amazon Chime SDK
  /// Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [proxySessionId] :
  /// The proxy session ID.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<void> deleteProxySession({
    required String proxySessionId,
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/proxy-sessions/${Uri.encodeComponent(proxySessionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a SIP media application.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  Future<void> deleteSipMediaApplication({
    required String sipMediaApplicationId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a SIP rule.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipRuleId] :
  /// The SIP rule ID.
  Future<void> deleteSipRule({
    required String sipRuleId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/sip-rules/${Uri.encodeComponent(sipRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Chime SDK Voice Connector. Any phone numbers associated
  /// with the Amazon Chime SDK Voice Connector must be disassociated from it
  /// before it can be deleted.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<void> deleteVoiceConnector({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the emergency calling details from the specified Amazon Chime SDK
  /// Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<void> deleteVoiceConnectorEmergencyCallingConfiguration({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/emergency-calling-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Chime SDK Voice Connector group. Any
  /// <code>VoiceConnectorItems</code> and phone numbers associated with the
  /// group must be removed before it can be deleted.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorGroupId] :
  /// The Voice Connector Group ID.
  Future<void> deleteVoiceConnectorGroup({
    required String voiceConnectorGroupId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the origination settings for the specified Amazon Chime SDK Voice
  /// Connector.
  /// <note>
  /// If emergency calling is configured for the Voice Connector, it must be
  /// deleted prior to deleting the origination settings.
  /// </note>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<void> deleteVoiceConnectorOrigination({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/origination',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the proxy configuration from the specified Amazon Chime SDK Voice
  /// Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<void> deleteVoiceConnectorProxy({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/programmable-numbers/proxy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Voice Connector's streaming configuration.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<void> deleteVoiceConnectorStreamingConfiguration({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/streaming-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the termination settings for the specified Amazon Chime SDK Voice
  /// Connector.
  /// <note>
  /// If emergency calling is configured for the Voice Connector, it must be
  /// deleted prior to deleting the termination settings.
  /// </note>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<void> deleteVoiceConnectorTermination({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified SIP credentials used by your equipment to
  /// authenticate during call termination.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [usernames] :
  /// The RFC2617 compliant username associated with the SIP credentials, in
  /// US-ASCII format.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<void> deleteVoiceConnectorTerminationCredentials({
    required List<String> usernames,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'Usernames': usernames,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination/credentials?operation=delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a voice profile, including its voice print and enrollment data.
  /// WARNING: This action is not reversible.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceProfileId] :
  /// The voice profile ID.
  Future<void> deleteVoiceProfile({
    required String voiceProfileId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/voice-profiles/${Uri.encodeComponent(voiceProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes all voice profiles in the domain. WARNING: This action is not
  /// reversible.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceProfileDomainId] :
  /// The voice profile domain ID.
  Future<void> deleteVoiceProfileDomain({
    required String voiceProfileDomainId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-profile-domains/${Uri.encodeComponent(voiceProfileDomainId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates the specified phone numbers from the specified Amazon Chime
  /// SDK Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<DisassociatePhoneNumbersFromVoiceConnectorResponse>
      disassociatePhoneNumbersFromVoiceConnector({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}?operation=disassociate-phone-numbers',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociatePhoneNumbersFromVoiceConnectorResponse.fromJson(
        response);
  }

  /// Disassociates the specified phone numbers from the specified Amazon Chime
  /// SDK Voice Connector group.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [e164PhoneNumbers] :
  /// The list of phone numbers, in E.164 format.
  ///
  /// Parameter [voiceConnectorGroupId] :
  /// The Voice Connector group ID.
  Future<DisassociatePhoneNumbersFromVoiceConnectorGroupResponse>
      disassociatePhoneNumbersFromVoiceConnectorGroup({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorGroupId,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}?operation=disassociate-phone-numbers',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociatePhoneNumbersFromVoiceConnectorGroupResponse.fromJson(
        response);
  }

  /// Retrieves the global settings for the Amazon Chime SDK Voice Connectors in
  /// an AWS account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  Future<GetGlobalSettingsResponse> getGlobalSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetGlobalSettingsResponse.fromJson(response);
  }

  /// Retrieves details for the specified phone number ID, such as associations,
  /// capabilities, and product type.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberId] :
  /// The phone number ID.
  Future<GetPhoneNumberResponse> getPhoneNumber({
    required String phoneNumberId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPhoneNumberResponse.fromJson(response);
  }

  /// Retrieves details for the specified phone number order, such as the order
  /// creation timestamp, phone numbers in E.164 format, product type, and order
  /// status.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberOrderId] :
  /// The ID of the phone number order .
  Future<GetPhoneNumberOrderResponse> getPhoneNumberOrder({
    required String phoneNumberOrderId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/phone-number-orders/${Uri.encodeComponent(phoneNumberOrderId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPhoneNumberOrderResponse.fromJson(response);
  }

  /// Retrieves the phone number settings for the administrator's AWS account,
  /// such as the default outbound calling name.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  Future<GetPhoneNumberSettingsResponse> getPhoneNumberSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/settings/phone-number',
      exceptionFnMap: _exceptionFns,
    );
    return GetPhoneNumberSettingsResponse.fromJson(response);
  }

  /// Retrieves the specified proxy session details for the specified Amazon
  /// Chime SDK Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [proxySessionId] :
  /// The proxy session ID.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<GetProxySessionResponse> getProxySession({
    required String proxySessionId,
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/proxy-sessions/${Uri.encodeComponent(proxySessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProxySessionResponse.fromJson(response);
  }

  /// Retrieves the information for a SIP media application, including name, AWS
  /// Region, and endpoints.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID .
  Future<GetSipMediaApplicationResponse> getSipMediaApplication({
    required String sipMediaApplicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSipMediaApplicationResponse.fromJson(response);
  }

  /// Gets the Alexa Skill configuration for the SIP media application.
  /// <important>
  /// Due to changes made by the Amazon Alexa service, this API is no longer
  /// available for use. For more information, refer to the <a
  /// href="https://developer.amazon.com/en-US/alexa/alexasmartproperties">Alexa
  /// Smart Properties</a> page.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  @Deprecated(
      'Due to changes made by the Amazon Alexa service, this API is no longer available for use. For more information, refer to the Alexa Smart Properties page(https://developer.amazon.com/en-US/alexa/alexasmartproperties).')
  Future<GetSipMediaApplicationAlexaSkillConfigurationResponse>
      getSipMediaApplicationAlexaSkillConfiguration({
    required String sipMediaApplicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}/alexa-skill-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetSipMediaApplicationAlexaSkillConfigurationResponse.fromJson(
        response);
  }

  /// Retrieves the logging configuration for the specified SIP media
  /// application.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  Future<GetSipMediaApplicationLoggingConfigurationResponse>
      getSipMediaApplicationLoggingConfiguration({
    required String sipMediaApplicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetSipMediaApplicationLoggingConfigurationResponse.fromJson(
        response);
  }

  /// Retrieves the details of a SIP rule, such as the rule ID, name, triggers,
  /// and target endpoints.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipRuleId] :
  /// The SIP rule ID.
  Future<GetSipRuleResponse> getSipRule({
    required String sipRuleId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sip-rules/${Uri.encodeComponent(sipRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSipRuleResponse.fromJson(response);
  }

  /// Retrieves the details of the specified speaker search task.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [speakerSearchTaskId] :
  /// The ID of the speaker search task.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<GetSpeakerSearchTaskResponse> getSpeakerSearchTask({
    required String speakerSearchTaskId,
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/speaker-search-tasks/${Uri.encodeComponent(speakerSearchTaskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSpeakerSearchTaskResponse.fromJson(response);
  }

  /// Retrieves details for the specified Amazon Chime SDK Voice Connector, such
  /// as timestamps,name, outbound host, and encryption requirements.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<GetVoiceConnectorResponse> getVoiceConnector({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorResponse.fromJson(response);
  }

  /// Retrieves the emergency calling configuration details for the specified
  /// Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<GetVoiceConnectorEmergencyCallingConfigurationResponse>
      getVoiceConnectorEmergencyCallingConfiguration({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/emergency-calling-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorEmergencyCallingConfigurationResponse.fromJson(
        response);
  }

  /// Retrieves details for the specified Amazon Chime SDK Voice Connector
  /// group, such as timestamps,name, and associated
  /// <code>VoiceConnectorItems</code>.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorGroupId] :
  /// The Voice Connector group ID.
  Future<GetVoiceConnectorGroupResponse> getVoiceConnectorGroup({
    required String voiceConnectorGroupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorGroupResponse.fromJson(response);
  }

  /// Retrieves the logging configuration settings for the specified Voice
  /// Connector. Shows whether SIP message logs are enabled for sending to
  /// Amazon CloudWatch Logs.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<GetVoiceConnectorLoggingConfigurationResponse>
      getVoiceConnectorLoggingConfiguration({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorLoggingConfigurationResponse.fromJson(response);
  }

  /// Retrieves the origination settings for the specified Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<GetVoiceConnectorOriginationResponse> getVoiceConnectorOrigination({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/origination',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorOriginationResponse.fromJson(response);
  }

  /// Retrieves the proxy configuration details for the specified Amazon Chime
  /// SDK Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<GetVoiceConnectorProxyResponse> getVoiceConnectorProxy({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/programmable-numbers/proxy',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorProxyResponse.fromJson(response);
  }

  /// Retrieves the streaming configuration details for the specified Amazon
  /// Chime SDK Voice Connector. Shows whether media streaming is enabled for
  /// sending to Amazon Kinesis. It also shows the retention period, in hours,
  /// for the Amazon Kinesis data.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<GetVoiceConnectorStreamingConfigurationResponse>
      getVoiceConnectorStreamingConfiguration({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/streaming-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorStreamingConfigurationResponse.fromJson(response);
  }

  /// Retrieves the termination setting details for the specified Voice
  /// Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<GetVoiceConnectorTerminationResponse> getVoiceConnectorTermination({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorTerminationResponse.fromJson(response);
  }

  /// Retrieves information about the last time a <code>SIP OPTIONS</code> ping
  /// was received from your SIP infrastructure for the specified Amazon Chime
  /// SDK Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<GetVoiceConnectorTerminationHealthResponse>
      getVoiceConnectorTerminationHealth({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination/health',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorTerminationHealthResponse.fromJson(response);
  }

  /// Retrieves the details of the specified voice profile.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceProfileId] :
  /// The voice profile ID.
  Future<GetVoiceProfileResponse> getVoiceProfile({
    required String voiceProfileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-profiles/${Uri.encodeComponent(voiceProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceProfileResponse.fromJson(response);
  }

  /// Retrieves the details of the specified voice profile domain.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceProfileDomainId] :
  /// The voice profile domain ID.
  Future<GetVoiceProfileDomainResponse> getVoiceProfileDomain({
    required String voiceProfileDomainId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-profile-domains/${Uri.encodeComponent(voiceProfileDomainId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceProfileDomainResponse.fromJson(response);
  }

  /// Retrieves the details of a voice tone analysis task.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [isCaller] :
  /// Specifies whether the voice being analyzed is the caller (originator) or
  /// the callee (responder).
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [voiceToneAnalysisTaskId] :
  /// The ID of the voice tone anlysis task.
  Future<GetVoiceToneAnalysisTaskResponse> getVoiceToneAnalysisTask({
    required bool isCaller,
    required String voiceConnectorId,
    required String voiceToneAnalysisTaskId,
  }) async {
    final $query = <String, List<String>>{
      'isCaller': [isCaller.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/voice-tone-analysis-tasks/${Uri.encodeComponent(voiceToneAnalysisTaskId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceToneAnalysisTaskResponse.fromJson(response);
  }

  /// Lists the available AWS Regions in which you can create an Amazon Chime
  /// SDK Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  Future<ListAvailableVoiceConnectorRegionsResponse>
      listAvailableVoiceConnectorRegions() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-connector-regions',
      exceptionFnMap: _exceptionFns,
    );
    return ListAvailableVoiceConnectorRegionsResponse.fromJson(response);
  }

  /// Lists the phone numbers for an administrator's Amazon Chime SDK account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token used to retrieve the next page of results.
  Future<ListPhoneNumberOrdersResponse> listPhoneNumberOrders({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-number-orders',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPhoneNumberOrdersResponse.fromJson(response);
  }

  /// Lists the phone numbers for the specified Amazon Chime SDK account, Amazon
  /// Chime SDK user, Amazon Chime SDK Voice Connector, or Amazon Chime SDK
  /// Voice Connector group.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [filterName] :
  /// The filter to limit the number of results.
  ///
  /// Parameter [filterValue] :
  /// The filter value.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token used to return the next page of results.
  ///
  /// Parameter [productType] :
  /// The phone number product types.
  ///
  /// Parameter [status] :
  /// The status of your organization's phone numbers.
  Future<ListPhoneNumbersResponse> listPhoneNumbers({
    PhoneNumberAssociationName? filterName,
    String? filterValue,
    int? maxResults,
    String? nextToken,
    PhoneNumberProductType? productType,
    String? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (filterName != null) 'filter-name': [filterName.toValue()],
      if (filterValue != null) 'filter-value': [filterValue],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (productType != null) 'product-type': [productType.toValue()],
      if (status != null) 'status': [status],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-numbers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPhoneNumbersResponse.fromJson(response);
  }

  /// Lists the proxy sessions for the specified Amazon Chime SDK Voice
  /// Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token used to retrieve the next page of results.
  ///
  /// Parameter [status] :
  /// The proxy session status.
  Future<ListProxySessionsResponse> listProxySessions({
    required String voiceConnectorId,
    int? maxResults,
    String? nextToken,
    ProxySessionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/proxy-sessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProxySessionsResponse.fromJson(response);
  }

  /// Lists the SIP media applications under the administrator's AWS account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// The token used to return the next page of results.
  Future<ListSipMediaApplicationsResponse> listSipMediaApplications({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sip-media-applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSipMediaApplicationsResponse.fromJson(response);
  }

  /// Lists the SIP rules under the administrator's AWS account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// The token used to return the next page of results.
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  Future<ListSipRulesResponse> listSipRules({
    int? maxResults,
    String? nextToken,
    String? sipMediaApplicationId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (sipMediaApplicationId != null)
        'sip-media-application': [sipMediaApplicationId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sip-rules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSipRulesResponse.fromJson(response);
  }

  /// Lists the countries that you can order phone numbers from.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [productType] :
  /// The phone number product type.
  Future<ListSupportedPhoneNumberCountriesResponse>
      listSupportedPhoneNumberCountries({
    required PhoneNumberProductType productType,
  }) async {
    final $query = <String, List<String>>{
      'product-type': [productType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-number-countries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSupportedPhoneNumberCountriesResponse.fromJson(response);
  }

  /// Returns a list of the tags in a given resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final $query = <String, List<String>>{
      'arn': [resourceARN],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists the Amazon Chime SDK Voice Connector groups in the administrator's
  /// AWS account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token used to return the next page of results.
  Future<ListVoiceConnectorGroupsResponse> listVoiceConnectorGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-connector-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVoiceConnectorGroupsResponse.fromJson(response);
  }

  /// Lists the SIP credentials for the specified Amazon Chime SDK Voice
  /// Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<ListVoiceConnectorTerminationCredentialsResponse>
      listVoiceConnectorTerminationCredentials({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination/credentials',
      exceptionFnMap: _exceptionFns,
    );
    return ListVoiceConnectorTerminationCredentialsResponse.fromJson(response);
  }

  /// Lists the Amazon Chime SDK Voice Connectors in the administrators AWS
  /// account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token used to return the next page of results.
  Future<ListVoiceConnectorsResponse> listVoiceConnectors({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-connectors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVoiceConnectorsResponse.fromJson(response);
  }

  /// Lists the specified voice profile domains in the administrator's AWS
  /// account.
  ///
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token used to return the next page of results.
  Future<ListVoiceProfileDomainsResponse> listVoiceProfileDomains({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-profile-domains',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVoiceProfileDomainsResponse.fromJson(response);
  }

  /// Lists the voice profiles in a voice profile domain.
  ///
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceProfileDomainId] :
  /// The ID of the voice profile domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results in the request.
  ///
  /// Parameter [nextToken] :
  /// The token used to retrieve the next page of results.
  Future<ListVoiceProfilesResponse> listVoiceProfiles({
    required String voiceProfileDomainId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'voice-profile-domain-id': [voiceProfileDomainId],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVoiceProfilesResponse.fromJson(response);
  }

  /// Updates the Alexa Skill configuration for the SIP media application.
  /// <important>
  /// Due to changes made by the Amazon Alexa service, this API is no longer
  /// available for use. For more information, refer to the <a
  /// href="https://developer.amazon.com/en-US/alexa/alexasmartproperties">Alexa
  /// Smart Properties</a> page.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  ///
  /// Parameter [sipMediaApplicationAlexaSkillConfiguration] :
  /// The Alexa Skill configuration.
  @Deprecated(
      'Due to changes made by the Amazon Alexa service, this API is no longer available for use. For more information, refer to the Alexa Smart Properties page(https://developer.amazon.com/en-US/alexa/alexasmartproperties).')
  Future<PutSipMediaApplicationAlexaSkillConfigurationResponse>
      putSipMediaApplicationAlexaSkillConfiguration({
    required String sipMediaApplicationId,
    SipMediaApplicationAlexaSkillConfiguration?
        sipMediaApplicationAlexaSkillConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (sipMediaApplicationAlexaSkillConfiguration != null)
        'SipMediaApplicationAlexaSkillConfiguration':
            sipMediaApplicationAlexaSkillConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}/alexa-skill-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutSipMediaApplicationAlexaSkillConfigurationResponse.fromJson(
        response);
  }

  /// Updates the logging configuration for the specified SIP media application.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  ///
  /// Parameter [sipMediaApplicationLoggingConfiguration] :
  /// The logging configuration for the specified SIP media application.
  Future<PutSipMediaApplicationLoggingConfigurationResponse>
      putSipMediaApplicationLoggingConfiguration({
    required String sipMediaApplicationId,
    SipMediaApplicationLoggingConfiguration?
        sipMediaApplicationLoggingConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (sipMediaApplicationLoggingConfiguration != null)
        'SipMediaApplicationLoggingConfiguration':
            sipMediaApplicationLoggingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutSipMediaApplicationLoggingConfigurationResponse.fromJson(
        response);
  }

  /// Updates a Voice Connector's emergency calling configuration.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [emergencyCallingConfiguration] :
  /// The configuration being updated.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<PutVoiceConnectorEmergencyCallingConfigurationResponse>
      putVoiceConnectorEmergencyCallingConfiguration({
    required EmergencyCallingConfiguration emergencyCallingConfiguration,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'EmergencyCallingConfiguration': emergencyCallingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/emergency-calling-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorEmergencyCallingConfigurationResponse.fromJson(
        response);
  }

  /// Updates a Voice Connector's logging configuration.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [loggingConfiguration] :
  /// The logging configuration being updated.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<PutVoiceConnectorLoggingConfigurationResponse>
      putVoiceConnectorLoggingConfiguration({
    required LoggingConfiguration loggingConfiguration,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'LoggingConfiguration': loggingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorLoggingConfigurationResponse.fromJson(response);
  }

  /// Updates a Voice Connector's origination settings.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [origination] :
  /// The origination settings being updated.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<PutVoiceConnectorOriginationResponse> putVoiceConnectorOrigination({
    required Origination origination,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'Origination': origination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/origination',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorOriginationResponse.fromJson(response);
  }

  /// Puts the specified proxy configuration to the specified Amazon Chime SDK
  /// Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [defaultSessionExpiryMinutes] :
  /// The default number of minutes allowed for proxy session.
  ///
  /// Parameter [phoneNumberPoolCountries] :
  /// The countries for proxy phone numbers to be selected from.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [disabled] :
  /// When true, stops proxy sessions from being created on the specified Amazon
  /// Chime SDK Voice Connector.
  ///
  /// Parameter [fallBackPhoneNumber] :
  /// The phone number to route calls to after a proxy session expires.
  Future<PutVoiceConnectorProxyResponse> putVoiceConnectorProxy({
    required int defaultSessionExpiryMinutes,
    required List<String> phoneNumberPoolCountries,
    required String voiceConnectorId,
    bool? disabled,
    String? fallBackPhoneNumber,
  }) async {
    final $payload = <String, dynamic>{
      'DefaultSessionExpiryMinutes': defaultSessionExpiryMinutes,
      'PhoneNumberPoolCountries': phoneNumberPoolCountries,
      if (disabled != null) 'Disabled': disabled,
      if (fallBackPhoneNumber != null)
        'FallBackPhoneNumber': fallBackPhoneNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/programmable-numbers/proxy',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorProxyResponse.fromJson(response);
  }

  /// Updates a Voice Connector's streaming configuration settings.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [streamingConfiguration] :
  /// The streaming settings being updated.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<PutVoiceConnectorStreamingConfigurationResponse>
      putVoiceConnectorStreamingConfiguration({
    required StreamingConfiguration streamingConfiguration,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'StreamingConfiguration': streamingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/streaming-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorStreamingConfigurationResponse.fromJson(response);
  }

  /// Updates a Voice Connector's termination settings.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [termination] :
  /// The termination settings to be updated.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<PutVoiceConnectorTerminationResponse> putVoiceConnectorTermination({
    required Termination termination,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'Termination': termination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorTerminationResponse.fromJson(response);
  }

  /// Updates a Voice Connector's termination credentials.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [credentials] :
  /// The termination credentials being updated.
  Future<void> putVoiceConnectorTerminationCredentials({
    required String voiceConnectorId,
    List<Credential>? credentials,
  }) async {
    final $payload = <String, dynamic>{
      if (credentials != null) 'Credentials': credentials,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination/credentials?operation=put',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Restores a deleted phone number.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberId] :
  /// The ID of the phone number being restored.
  Future<RestorePhoneNumberResponse> restorePhoneNumber({
    required String phoneNumberId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}?operation=restore',
      exceptionFnMap: _exceptionFns,
    );
    return RestorePhoneNumberResponse.fromJson(response);
  }

  /// Searches the provisioned phone numbers in an organization.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [areaCode] :
  /// Confines a search to just the phone numbers associated with the specified
  /// area code.
  ///
  /// Parameter [city] :
  /// Confines a search to just the phone numbers associated with the specified
  /// city.
  ///
  /// Parameter [country] :
  /// Confines a search to just the phone numbers associated with the specified
  /// country.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token used to return the next page of results.
  ///
  /// Parameter [phoneNumberType] :
  /// Confines a search to just the phone numbers associated with the specified
  /// phone number type, either <b>local</b> or <b>toll-free</b>.
  ///
  /// Parameter [state] :
  /// Confines a search to just the phone numbers associated with the specified
  /// state.
  ///
  /// Parameter [tollFreePrefix] :
  /// Confines a search to just the phone numbers associated with the specified
  /// toll-free prefix.
  Future<SearchAvailablePhoneNumbersResponse> searchAvailablePhoneNumbers({
    String? areaCode,
    String? city,
    String? country,
    int? maxResults,
    String? nextToken,
    PhoneNumberType? phoneNumberType,
    String? state,
    String? tollFreePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (areaCode != null) 'area-code': [areaCode],
      if (city != null) 'city': [city],
      if (country != null) 'country': [country],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (phoneNumberType != null)
        'phone-number-type': [phoneNumberType.toValue()],
      if (state != null) 'state': [state],
      if (tollFreePrefix != null) 'toll-free-prefix': [tollFreePrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/search?type=phone-numbers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchAvailablePhoneNumbersResponse.fromJson(response);
  }

  /// Starts a speaker search task.
  /// <important>
  /// Before starting any speaker search tasks, you must provide all notices and
  /// obtain all consents from the speaker as required under applicable privacy
  /// and biometrics laws, and as required under the <a
  /// href="https://aws.amazon.com/service-terms/">AWS service terms</a> for the
  /// Amazon Chime SDK.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [GoneException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [transactionId] :
  /// The transaction ID of the call being analyzed.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [voiceProfileDomainId] :
  /// The ID of the voice profile domain that will store the voice profile.
  ///
  /// Parameter [callLeg] :
  /// Specifies which call leg to stream for speaker search.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. Use a different token for
  /// different speaker search tasks.
  Future<StartSpeakerSearchTaskResponse> startSpeakerSearchTask({
    required String transactionId,
    required String voiceConnectorId,
    required String voiceProfileDomainId,
    CallLegType? callLeg,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'TransactionId': transactionId,
      'VoiceProfileDomainId': voiceProfileDomainId,
      if (callLeg != null) 'CallLeg': callLeg.toValue(),
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/speaker-search-tasks',
      exceptionFnMap: _exceptionFns,
    );
    return StartSpeakerSearchTaskResponse.fromJson(response);
  }

  /// Starts a voice tone analysis task. For more information about voice tone
  /// analysis, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/pstn-voice-analytics.html">Using
  /// Amazon Chime SDK voice analytics</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// <important>
  /// Before starting any voice tone analysis tasks, you must provide all
  /// notices and obtain all consents from the speaker as required under
  /// applicable privacy and biometrics laws, and as required under the <a
  /// href="https://aws.amazon.com/service-terms/">AWS service terms</a> for the
  /// Amazon Chime SDK.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [GoneException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [languageCode] :
  /// The language code.
  ///
  /// Parameter [transactionId] :
  /// The transaction ID.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. Use a different token for
  /// different voice tone analysis tasks.
  Future<StartVoiceToneAnalysisTaskResponse> startVoiceToneAnalysisTask({
    required LanguageCode languageCode,
    required String transactionId,
    required String voiceConnectorId,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'LanguageCode': languageCode.toValue(),
      'TransactionId': transactionId,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/voice-tone-analysis-tasks',
      exceptionFnMap: _exceptionFns,
    );
    return StartVoiceToneAnalysisTaskResponse.fromJson(response);
  }

  /// Stops a speaker search task.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [speakerSearchTaskId] :
  /// The speaker search task ID.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<void> stopSpeakerSearchTask({
    required String speakerSearchTaskId,
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/speaker-search-tasks/${Uri.encodeComponent(speakerSearchTaskId)}?operation=stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops a voice tone analysis task.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [voiceToneAnalysisTaskId] :
  /// The ID of the voice tone analysis task.
  Future<void> stopVoiceToneAnalysisTask({
    required String voiceConnectorId,
    required String voiceToneAnalysisTaskId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/voice-tone-analysis-tasks/${Uri.encodeComponent(voiceToneAnalysisTaskId)}?operation=stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds a tag to the specified resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource being tagged.
  ///
  /// Parameter [tags] :
  /// A list of the tags being added to the resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags?operation=tag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource having its tags removed.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags being removed from the resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags?operation=untag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates global settings for the Amazon Chime SDK Voice Connectors in an
  /// AWS account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnector] :
  /// The Voice Connector settings.
  Future<void> updateGlobalSettings({
    VoiceConnectorSettings? voiceConnector,
  }) async {
    final $payload = <String, dynamic>{
      if (voiceConnector != null) 'VoiceConnector': voiceConnector,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/settings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates phone number details, such as product type, calling name, or phone
  /// number name for the specified phone number ID. You can update one phone
  /// number detail at a time. For example, you can update either the product
  /// type, calling name, or phone number name in one action.
  ///
  /// For numbers outside the U.S., you must use the Amazon Chime SDK SIP Media
  /// Application Dial-In product type.
  ///
  /// Updates to outbound calling names can take 72 hours to complete. Pending
  /// updates to outbound calling names must be complete before you can request
  /// another update.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberId] :
  /// The phone number ID.
  ///
  /// Parameter [callingName] :
  /// The outbound calling name associated with the phone number.
  ///
  /// Parameter [name] :
  /// Specifies the updated name assigned to one or more phone numbers.
  ///
  /// Parameter [productType] :
  /// The product type.
  Future<UpdatePhoneNumberResponse> updatePhoneNumber({
    required String phoneNumberId,
    String? callingName,
    String? name,
    PhoneNumberProductType? productType,
  }) async {
    final $payload = <String, dynamic>{
      if (callingName != null) 'CallingName': callingName,
      if (name != null) 'Name': name,
      if (productType != null) 'ProductType': productType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePhoneNumberResponse.fromJson(response);
  }

  /// Updates the phone number settings for the administrator's AWS account,
  /// such as the default outbound calling name. You can update the default
  /// outbound calling name once every seven days. Outbound calling names can
  /// take up to 72 hours to update.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [callingName] :
  /// The default outbound calling name for the account.
  Future<void> updatePhoneNumberSettings({
    required String callingName,
  }) async {
    final $payload = <String, dynamic>{
      'CallingName': callingName,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/settings/phone-number',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified proxy session details, such as voice or SMS
  /// capabilities.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [capabilities] :
  /// The proxy session capabilities.
  ///
  /// Parameter [proxySessionId] :
  /// The proxy session ID.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [expiryMinutes] :
  /// The number of minutes allowed for the proxy session.
  Future<UpdateProxySessionResponse> updateProxySession({
    required List<Capability> capabilities,
    required String proxySessionId,
    required String voiceConnectorId,
    int? expiryMinutes,
  }) async {
    _s.validateNumRange(
      'expiryMinutes',
      expiryMinutes,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (expiryMinutes != null) 'ExpiryMinutes': expiryMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/proxy-sessions/${Uri.encodeComponent(proxySessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProxySessionResponse.fromJson(response);
  }

  /// Updates the details of the specified SIP media application.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  ///
  /// Parameter [endpoints] :
  /// The new set of endpoints for the specified SIP media application.
  ///
  /// Parameter [name] :
  /// The new name for the specified SIP media application.
  Future<UpdateSipMediaApplicationResponse> updateSipMediaApplication({
    required String sipMediaApplicationId,
    List<SipMediaApplicationEndpoint>? endpoints,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (endpoints != null) 'Endpoints': endpoints,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSipMediaApplicationResponse.fromJson(response);
  }

  /// Invokes the AWS Lambda function associated with the SIP media application
  /// and transaction ID in an update request. The Lambda function can then
  /// return a new set of actions.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [arguments] :
  /// Arguments made available to the Lambda function as part of the
  /// <code>CALL_UPDATE_REQUESTED</code> event. Can contain 0-20 key-value
  /// pairs.
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The ID of the SIP media application handling the call.
  ///
  /// Parameter [transactionId] :
  /// The ID of the call transaction.
  Future<UpdateSipMediaApplicationCallResponse> updateSipMediaApplicationCall({
    required Map<String, String> arguments,
    required String sipMediaApplicationId,
    required String transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'Arguments': arguments,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}/calls/${Uri.encodeComponent(transactionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSipMediaApplicationCallResponse.fromJson(response);
  }

  /// Updates the details of the specified SIP rule.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The new name for the specified SIP rule.
  ///
  /// Parameter [sipRuleId] :
  /// The SIP rule ID.
  ///
  /// Parameter [disabled] :
  /// The new value that indicates whether the rule is disabled.
  ///
  /// Parameter [targetApplications] :
  /// The new list of target applications.
  Future<UpdateSipRuleResponse> updateSipRule({
    required String name,
    required String sipRuleId,
    bool? disabled,
    List<SipRuleTargetApplication>? targetApplications,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (disabled != null) 'Disabled': disabled,
      if (targetApplications != null) 'TargetApplications': targetApplications,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/sip-rules/${Uri.encodeComponent(sipRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSipRuleResponse.fromJson(response);
  }

  /// Updates the details for the specified Amazon Chime SDK Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the Voice Connector.
  ///
  /// Parameter [requireEncryption] :
  /// When enabled, requires encryption for the Voice Connector.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Voice Connector ID.
  Future<UpdateVoiceConnectorResponse> updateVoiceConnector({
    required String name,
    required bool requireEncryption,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'RequireEncryption': requireEncryption,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVoiceConnectorResponse.fromJson(response);
  }

  /// Updates the settings for the specified Amazon Chime SDK Voice Connector
  /// group.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the Voice Connector group.
  ///
  /// Parameter [voiceConnectorGroupId] :
  /// The Voice Connector ID.
  ///
  /// Parameter [voiceConnectorItems] :
  /// The <code>VoiceConnectorItems</code> to associate with the Voice Connector
  /// group.
  Future<UpdateVoiceConnectorGroupResponse> updateVoiceConnectorGroup({
    required String name,
    required String voiceConnectorGroupId,
    required List<VoiceConnectorItem> voiceConnectorItems,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'VoiceConnectorItems': voiceConnectorItems,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVoiceConnectorGroupResponse.fromJson(response);
  }

  /// Updates the specified voice profile’s voice print and refreshes its
  /// expiration timestamp.
  /// <important>
  /// As a condition of using this feature, you acknowledge that the collection,
  /// use, storage, and retention of your caller’s biometric identifiers and
  /// biometric information (“biometric data”) in the form of a digital
  /// voiceprint requires the caller’s informed consent via a written release.
  /// Such consent is required under various state laws, including biometrics
  /// laws in Illinois, Texas, Washington and other state privacy laws.
  ///
  /// You must provide a written release to each caller through a process that
  /// clearly reflects each caller’s informed consent before using Amazon Chime
  /// SDK Voice Insights service, as required under the terms of your agreement
  /// with AWS governing your use of the service.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [GoneException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [speakerSearchTaskId] :
  /// The ID of the speaker search task.
  ///
  /// Parameter [voiceProfileId] :
  /// The profile ID.
  Future<UpdateVoiceProfileResponse> updateVoiceProfile({
    required String speakerSearchTaskId,
    required String voiceProfileId,
  }) async {
    final $payload = <String, dynamic>{
      'SpeakerSearchTaskId': speakerSearchTaskId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/voice-profiles/${Uri.encodeComponent(voiceProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVoiceProfileResponse.fromJson(response);
  }

  /// Updates the settings for the specified voice profile domain.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceProfileDomainId] :
  /// The domain ID.
  ///
  /// Parameter [description] :
  /// The description of the voice profile domain.
  ///
  /// Parameter [name] :
  /// The name of the voice profile domain.
  Future<UpdateVoiceProfileDomainResponse> updateVoiceProfileDomain({
    required String voiceProfileDomainId,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-profile-domains/${Uri.encodeComponent(voiceProfileDomainId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVoiceProfileDomainResponse.fromJson(response);
  }

  /// Validates an address to be used for 911 calls made with Amazon Chime SDK
  /// Voice Connectors. You can use validated addresses in a Presence
  /// Information Data Format Location Object file that you include in SIP
  /// requests. That helps ensure that addresses are routed to the appropriate
  /// Public Safety Answering Point.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [city] :
  /// The address city, such as <code>Portland</code>.
  ///
  /// Parameter [country] :
  /// The country in the address being validated.
  ///
  /// Parameter [postalCode] :
  /// The dress postal code, such <code>04352</code>.
  ///
  /// Parameter [state] :
  /// The address state, such as <code>ME</code>.
  ///
  /// Parameter [streetInfo] :
  /// The address street information, such as <code>8th Avenue</code>.
  ///
  /// Parameter [streetNumber] :
  /// The address street number, such as <code>200</code> or <code>2121</code>.
  Future<ValidateE911AddressResponse> validateE911Address({
    required String awsAccountId,
    required String city,
    required String country,
    required String postalCode,
    required String state,
    required String streetInfo,
    required String streetNumber,
  }) async {
    final $payload = <String, dynamic>{
      'AwsAccountId': awsAccountId,
      'City': city,
      'Country': country,
      'PostalCode': postalCode,
      'State': state,
      'StreetInfo': streetInfo,
      'StreetNumber': streetNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/emergency-calling/address',
      exceptionFnMap: _exceptionFns,
    );
    return ValidateE911AddressResponse.fromJson(response);
  }
}

/// A validated address.
class Address {
  /// The city of an address.
  final String? city;

  /// The country of an address.
  final String? country;

  /// An address suffix location, such as the <code>S. Unit A</code> in
  /// <code>Central Park S. Unit A</code>.
  final String? postDirectional;

  /// The postal code of an address.
  final String? postalCode;

  /// The zip + 4 or postal code + 4 of an address.
  final String? postalCodePlus4;

  /// An address prefix location, such as the <code>N</code> in <code>N. Third
  /// St.</code>
  final String? preDirectional;

  /// The state of an address.
  final String? state;

  /// The address street, such as <code>8th Avenue</code>.
  final String? streetName;

  /// The numeric portion of an address.
  final String? streetNumber;

  /// The address suffix, such as the <code>N</code> in <code>8th Avenue N</code>.
  final String? streetSuffix;

  Address({
    this.city,
    this.country,
    this.postDirectional,
    this.postalCode,
    this.postalCodePlus4,
    this.preDirectional,
    this.state,
    this.streetName,
    this.streetNumber,
    this.streetSuffix,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] as String?,
      country: json['country'] as String?,
      postDirectional: json['postDirectional'] as String?,
      postalCode: json['postalCode'] as String?,
      postalCodePlus4: json['postalCodePlus4'] as String?,
      preDirectional: json['preDirectional'] as String?,
      state: json['state'] as String?,
      streetName: json['streetName'] as String?,
      streetNumber: json['streetNumber'] as String?,
      streetSuffix: json['streetSuffix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final country = this.country;
    final postDirectional = this.postDirectional;
    final postalCode = this.postalCode;
    final postalCodePlus4 = this.postalCodePlus4;
    final preDirectional = this.preDirectional;
    final state = this.state;
    final streetName = this.streetName;
    final streetNumber = this.streetNumber;
    final streetSuffix = this.streetSuffix;
    return {
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (postDirectional != null) 'postDirectional': postDirectional,
      if (postalCode != null) 'postalCode': postalCode,
      if (postalCodePlus4 != null) 'postalCodePlus4': postalCodePlus4,
      if (preDirectional != null) 'preDirectional': preDirectional,
      if (state != null) 'state': state,
      if (streetName != null) 'streetName': streetName,
      if (streetNumber != null) 'streetNumber': streetNumber,
      if (streetSuffix != null) 'streetSuffix': streetSuffix,
    };
  }
}

enum AlexaSkillStatus {
  active,
  inactive,
}

extension AlexaSkillStatusValueExtension on AlexaSkillStatus {
  String toValue() {
    switch (this) {
      case AlexaSkillStatus.active:
        return 'ACTIVE';
      case AlexaSkillStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension AlexaSkillStatusFromString on String {
  AlexaSkillStatus toAlexaSkillStatus() {
    switch (this) {
      case 'ACTIVE':
        return AlexaSkillStatus.active;
      case 'INACTIVE':
        return AlexaSkillStatus.inactive;
    }
    throw Exception('$this is not known in enum AlexaSkillStatus');
  }
}

class AssociatePhoneNumbersWithVoiceConnectorGroupResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  AssociatePhoneNumbersWithVoiceConnectorGroupResponse({
    this.phoneNumberErrors,
  });

  factory AssociatePhoneNumbersWithVoiceConnectorGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociatePhoneNumbersWithVoiceConnectorGroupResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

class AssociatePhoneNumbersWithVoiceConnectorResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  AssociatePhoneNumbersWithVoiceConnectorResponse({
    this.phoneNumberErrors,
  });

  factory AssociatePhoneNumbersWithVoiceConnectorResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociatePhoneNumbersWithVoiceConnectorResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

class BatchDeletePhoneNumberResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  BatchDeletePhoneNumberResponse({
    this.phoneNumberErrors,
  });

  factory BatchDeletePhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeletePhoneNumberResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

class BatchUpdatePhoneNumberResponse {
  /// A list of failed phone numbers and their error messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  BatchUpdatePhoneNumberResponse({
    this.phoneNumberErrors,
  });

  factory BatchUpdatePhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdatePhoneNumberResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

/// The details of an Amazon Chime SDK Voice Connector call.
class CallDetails {
  /// Identifies a person as the caller or the callee.
  final bool? isCaller;

  /// The transaction ID of a Voice Connector call.
  final String? transactionId;

  /// The Voice Connector ID.
  final String? voiceConnectorId;

  CallDetails({
    this.isCaller,
    this.transactionId,
    this.voiceConnectorId,
  });

  factory CallDetails.fromJson(Map<String, dynamic> json) {
    return CallDetails(
      isCaller: json['IsCaller'] as bool?,
      transactionId: json['TransactionId'] as String?,
      voiceConnectorId: json['VoiceConnectorId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isCaller = this.isCaller;
    final transactionId = this.transactionId;
    final voiceConnectorId = this.voiceConnectorId;
    return {
      if (isCaller != null) 'IsCaller': isCaller,
      if (transactionId != null) 'TransactionId': transactionId,
      if (voiceConnectorId != null) 'VoiceConnectorId': voiceConnectorId,
    };
  }
}

enum CallLegType {
  caller,
  callee,
}

extension CallLegTypeValueExtension on CallLegType {
  String toValue() {
    switch (this) {
      case CallLegType.caller:
        return 'Caller';
      case CallLegType.callee:
        return 'Callee';
    }
  }
}

extension CallLegTypeFromString on String {
  CallLegType toCallLegType() {
    switch (this) {
      case 'Caller':
        return CallLegType.caller;
      case 'Callee':
        return CallLegType.callee;
    }
    throw Exception('$this is not known in enum CallLegType');
  }
}

enum CallingNameStatus {
  unassigned,
  updateInProgress,
  updateSucceeded,
  updateFailed,
}

extension CallingNameStatusValueExtension on CallingNameStatus {
  String toValue() {
    switch (this) {
      case CallingNameStatus.unassigned:
        return 'Unassigned';
      case CallingNameStatus.updateInProgress:
        return 'UpdateInProgress';
      case CallingNameStatus.updateSucceeded:
        return 'UpdateSucceeded';
      case CallingNameStatus.updateFailed:
        return 'UpdateFailed';
    }
  }
}

extension CallingNameStatusFromString on String {
  CallingNameStatus toCallingNameStatus() {
    switch (this) {
      case 'Unassigned':
        return CallingNameStatus.unassigned;
      case 'UpdateInProgress':
        return CallingNameStatus.updateInProgress;
      case 'UpdateSucceeded':
        return CallingNameStatus.updateSucceeded;
      case 'UpdateFailed':
        return CallingNameStatus.updateFailed;
    }
    throw Exception('$this is not known in enum CallingNameStatus');
  }
}

/// A suggested address.
class CandidateAddress {
  /// The city of the candidate address.
  final String? city;

  /// The country of the candidate address.
  final String? country;

  /// The postal code of the candidate address.
  final String? postalCode;

  /// The zip + 4 or postal code +4 of the candidate address.
  final String? postalCodePlus4;

  /// The state of the candidate address.
  final String? state;

  /// The street information of the candidate address.
  final String? streetInfo;

  /// The numeric portion of the candidate address.
  final String? streetNumber;

  CandidateAddress({
    this.city,
    this.country,
    this.postalCode,
    this.postalCodePlus4,
    this.state,
    this.streetInfo,
    this.streetNumber,
  });

  factory CandidateAddress.fromJson(Map<String, dynamic> json) {
    return CandidateAddress(
      city: json['city'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      postalCodePlus4: json['postalCodePlus4'] as String?,
      state: json['state'] as String?,
      streetInfo: json['streetInfo'] as String?,
      streetNumber: json['streetNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final country = this.country;
    final postalCode = this.postalCode;
    final postalCodePlus4 = this.postalCodePlus4;
    final state = this.state;
    final streetInfo = this.streetInfo;
    final streetNumber = this.streetNumber;
    return {
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (postalCode != null) 'postalCode': postalCode,
      if (postalCodePlus4 != null) 'postalCodePlus4': postalCodePlus4,
      if (state != null) 'state': state,
      if (streetInfo != null) 'streetInfo': streetInfo,
      if (streetNumber != null) 'streetNumber': streetNumber,
    };
  }
}

enum Capability {
  voice,
  sms,
}

extension CapabilityValueExtension on Capability {
  String toValue() {
    switch (this) {
      case Capability.voice:
        return 'Voice';
      case Capability.sms:
        return 'SMS';
    }
  }
}

extension CapabilityFromString on String {
  Capability toCapability() {
    switch (this) {
      case 'Voice':
        return Capability.voice;
      case 'SMS':
        return Capability.sms;
    }
    throw Exception('$this is not known in enum Capability');
  }
}

class CreatePhoneNumberOrderResponse {
  /// The phone number order details.
  final PhoneNumberOrder? phoneNumberOrder;

  CreatePhoneNumberOrderResponse({
    this.phoneNumberOrder,
  });

  factory CreatePhoneNumberOrderResponse.fromJson(Map<String, dynamic> json) {
    return CreatePhoneNumberOrderResponse(
      phoneNumberOrder: json['PhoneNumberOrder'] != null
          ? PhoneNumberOrder.fromJson(
              json['PhoneNumberOrder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberOrder = this.phoneNumberOrder;
    return {
      if (phoneNumberOrder != null) 'PhoneNumberOrder': phoneNumberOrder,
    };
  }
}

class CreateProxySessionResponse {
  /// The proxy session details.
  final ProxySession? proxySession;

  CreateProxySessionResponse({
    this.proxySession,
  });

  factory CreateProxySessionResponse.fromJson(Map<String, dynamic> json) {
    return CreateProxySessionResponse(
      proxySession: json['ProxySession'] != null
          ? ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxySession = this.proxySession;
    return {
      if (proxySession != null) 'ProxySession': proxySession,
    };
  }
}

class CreateSipMediaApplicationCallResponse {
  /// The actual call.
  final SipMediaApplicationCall? sipMediaApplicationCall;

  CreateSipMediaApplicationCallResponse({
    this.sipMediaApplicationCall,
  });

  factory CreateSipMediaApplicationCallResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSipMediaApplicationCallResponse(
      sipMediaApplicationCall: json['SipMediaApplicationCall'] != null
          ? SipMediaApplicationCall.fromJson(
              json['SipMediaApplicationCall'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplicationCall = this.sipMediaApplicationCall;
    return {
      if (sipMediaApplicationCall != null)
        'SipMediaApplicationCall': sipMediaApplicationCall,
    };
  }
}

class CreateSipMediaApplicationResponse {
  /// The SIP media application details.
  final SipMediaApplication? sipMediaApplication;

  CreateSipMediaApplicationResponse({
    this.sipMediaApplication,
  });

  factory CreateSipMediaApplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSipMediaApplicationResponse(
      sipMediaApplication: json['SipMediaApplication'] != null
          ? SipMediaApplication.fromJson(
              json['SipMediaApplication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplication = this.sipMediaApplication;
    return {
      if (sipMediaApplication != null)
        'SipMediaApplication': sipMediaApplication,
    };
  }
}

class CreateSipRuleResponse {
  /// The SIP rule information, including the rule ID, triggers, and target
  /// applications.
  final SipRule? sipRule;

  CreateSipRuleResponse({
    this.sipRule,
  });

  factory CreateSipRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateSipRuleResponse(
      sipRule: json['SipRule'] != null
          ? SipRule.fromJson(json['SipRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipRule = this.sipRule;
    return {
      if (sipRule != null) 'SipRule': sipRule,
    };
  }
}

class CreateVoiceConnectorGroupResponse {
  /// The details of the Voice Connector group.
  final VoiceConnectorGroup? voiceConnectorGroup;

  CreateVoiceConnectorGroupResponse({
    this.voiceConnectorGroup,
  });

  factory CreateVoiceConnectorGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateVoiceConnectorGroupResponse(
      voiceConnectorGroup: json['VoiceConnectorGroup'] != null
          ? VoiceConnectorGroup.fromJson(
              json['VoiceConnectorGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnectorGroup = this.voiceConnectorGroup;
    return {
      if (voiceConnectorGroup != null)
        'VoiceConnectorGroup': voiceConnectorGroup,
    };
  }
}

class CreateVoiceConnectorResponse {
  /// The details of the Voice Connector.
  final VoiceConnector? voiceConnector;

  CreateVoiceConnectorResponse({
    this.voiceConnector,
  });

  factory CreateVoiceConnectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateVoiceConnectorResponse(
      voiceConnector: json['VoiceConnector'] != null
          ? VoiceConnector.fromJson(
              json['VoiceConnector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnector = this.voiceConnector;
    return {
      if (voiceConnector != null) 'VoiceConnector': voiceConnector,
    };
  }
}

class CreateVoiceProfileDomainResponse {
  /// The requested voice profile domain.
  final VoiceProfileDomain? voiceProfileDomain;

  CreateVoiceProfileDomainResponse({
    this.voiceProfileDomain,
  });

  factory CreateVoiceProfileDomainResponse.fromJson(Map<String, dynamic> json) {
    return CreateVoiceProfileDomainResponse(
      voiceProfileDomain: json['VoiceProfileDomain'] != null
          ? VoiceProfileDomain.fromJson(
              json['VoiceProfileDomain'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceProfileDomain = this.voiceProfileDomain;
    return {
      if (voiceProfileDomain != null) 'VoiceProfileDomain': voiceProfileDomain,
    };
  }
}

class CreateVoiceProfileResponse {
  /// The requested voice profile.
  final VoiceProfile? voiceProfile;

  CreateVoiceProfileResponse({
    this.voiceProfile,
  });

  factory CreateVoiceProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateVoiceProfileResponse(
      voiceProfile: json['VoiceProfile'] != null
          ? VoiceProfile.fromJson(json['VoiceProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceProfile = this.voiceProfile;
    return {
      if (voiceProfile != null) 'VoiceProfile': voiceProfile,
    };
  }
}

/// The SIP credentials used to authenticate requests to an Amazon Chime SDK
/// Voice Connector.
class Credential {
  /// The RFC2617 compliant password associated with the SIP credentials, in
  /// US-ASCII format.
  final String? password;

  /// The RFC2617 compliant user name associated with the SIP credentials, in
  /// US-ASCII format.
  final String? username;

  Credential({
    this.password,
    this.username,
  });

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      if (password != null) 'Password': password,
      if (username != null) 'Username': username,
    };
  }
}

/// The Dialed Number Identification Service (DNIS) emergency calling
/// configuration details associated with an Amazon Chime SDK Voice Connector's
/// emergency calling configuration.
class DNISEmergencyCallingConfiguration {
  /// The country from which emergency calls are allowed, in ISO 3166-1 alpha-2
  /// format.
  final String callingCountry;

  /// The DNIS phone number that you route emergency calls to, in E.164 format.
  final String emergencyPhoneNumber;

  /// The DNIS phone number for routing test emergency calls to, in E.164 format.
  final String? testPhoneNumber;

  DNISEmergencyCallingConfiguration({
    required this.callingCountry,
    required this.emergencyPhoneNumber,
    this.testPhoneNumber,
  });

  factory DNISEmergencyCallingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DNISEmergencyCallingConfiguration(
      callingCountry: json['CallingCountry'] as String,
      emergencyPhoneNumber: json['EmergencyPhoneNumber'] as String,
      testPhoneNumber: json['TestPhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final callingCountry = this.callingCountry;
    final emergencyPhoneNumber = this.emergencyPhoneNumber;
    final testPhoneNumber = this.testPhoneNumber;
    return {
      'CallingCountry': callingCountry,
      'EmergencyPhoneNumber': emergencyPhoneNumber,
      if (testPhoneNumber != null) 'TestPhoneNumber': testPhoneNumber,
    };
  }
}

class DisassociatePhoneNumbersFromVoiceConnectorGroupResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  DisassociatePhoneNumbersFromVoiceConnectorGroupResponse({
    this.phoneNumberErrors,
  });

  factory DisassociatePhoneNumbersFromVoiceConnectorGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociatePhoneNumbersFromVoiceConnectorGroupResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

class DisassociatePhoneNumbersFromVoiceConnectorResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  DisassociatePhoneNumbersFromVoiceConnectorResponse({
    this.phoneNumberErrors,
  });

  factory DisassociatePhoneNumbersFromVoiceConnectorResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociatePhoneNumbersFromVoiceConnectorResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

/// The emergency calling configuration details associated with an Amazon Chime
/// SDK Voice Connector.
class EmergencyCallingConfiguration {
  /// The Dialed Number Identification Service (DNIS) emergency calling
  /// configuration details.
  final List<DNISEmergencyCallingConfiguration>? dnis;

  EmergencyCallingConfiguration({
    this.dnis,
  });

  factory EmergencyCallingConfiguration.fromJson(Map<String, dynamic> json) {
    return EmergencyCallingConfiguration(
      dnis: (json['DNIS'] as List?)
          ?.whereNotNull()
          .map((e) => DNISEmergencyCallingConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dnis = this.dnis;
    return {
      if (dnis != null) 'DNIS': dnis,
    };
  }
}

enum ErrorCode {
  badRequest,
  conflict,
  forbidden,
  notFound,
  preconditionFailed,
  resourceLimitExceeded,
  serviceFailure,
  accessDenied,
  serviceUnavailable,
  throttled,
  throttling,
  unauthorized,
  unprocessable,
  voiceConnectorGroupAssociationsExist,
  phoneNumberAssociationsExist,
  gone,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.badRequest:
        return 'BadRequest';
      case ErrorCode.conflict:
        return 'Conflict';
      case ErrorCode.forbidden:
        return 'Forbidden';
      case ErrorCode.notFound:
        return 'NotFound';
      case ErrorCode.preconditionFailed:
        return 'PreconditionFailed';
      case ErrorCode.resourceLimitExceeded:
        return 'ResourceLimitExceeded';
      case ErrorCode.serviceFailure:
        return 'ServiceFailure';
      case ErrorCode.accessDenied:
        return 'AccessDenied';
      case ErrorCode.serviceUnavailable:
        return 'ServiceUnavailable';
      case ErrorCode.throttled:
        return 'Throttled';
      case ErrorCode.throttling:
        return 'Throttling';
      case ErrorCode.unauthorized:
        return 'Unauthorized';
      case ErrorCode.unprocessable:
        return 'Unprocessable';
      case ErrorCode.voiceConnectorGroupAssociationsExist:
        return 'VoiceConnectorGroupAssociationsExist';
      case ErrorCode.phoneNumberAssociationsExist:
        return 'PhoneNumberAssociationsExist';
      case ErrorCode.gone:
        return 'Gone';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'BadRequest':
        return ErrorCode.badRequest;
      case 'Conflict':
        return ErrorCode.conflict;
      case 'Forbidden':
        return ErrorCode.forbidden;
      case 'NotFound':
        return ErrorCode.notFound;
      case 'PreconditionFailed':
        return ErrorCode.preconditionFailed;
      case 'ResourceLimitExceeded':
        return ErrorCode.resourceLimitExceeded;
      case 'ServiceFailure':
        return ErrorCode.serviceFailure;
      case 'AccessDenied':
        return ErrorCode.accessDenied;
      case 'ServiceUnavailable':
        return ErrorCode.serviceUnavailable;
      case 'Throttled':
        return ErrorCode.throttled;
      case 'Throttling':
        return ErrorCode.throttling;
      case 'Unauthorized':
        return ErrorCode.unauthorized;
      case 'Unprocessable':
        return ErrorCode.unprocessable;
      case 'VoiceConnectorGroupAssociationsExist':
        return ErrorCode.voiceConnectorGroupAssociationsExist;
      case 'PhoneNumberAssociationsExist':
        return ErrorCode.phoneNumberAssociationsExist;
      case 'Gone':
        return ErrorCode.gone;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

enum GeoMatchLevel {
  country,
  areaCode,
}

extension GeoMatchLevelValueExtension on GeoMatchLevel {
  String toValue() {
    switch (this) {
      case GeoMatchLevel.country:
        return 'Country';
      case GeoMatchLevel.areaCode:
        return 'AreaCode';
    }
  }
}

extension GeoMatchLevelFromString on String {
  GeoMatchLevel toGeoMatchLevel() {
    switch (this) {
      case 'Country':
        return GeoMatchLevel.country;
      case 'AreaCode':
        return GeoMatchLevel.areaCode;
    }
    throw Exception('$this is not known in enum GeoMatchLevel');
  }
}

/// The country and area code for a proxy phone number in a proxy phone session.
class GeoMatchParams {
  /// The area code.
  final String areaCode;

  /// The country.
  final String country;

  GeoMatchParams({
    required this.areaCode,
    required this.country,
  });

  factory GeoMatchParams.fromJson(Map<String, dynamic> json) {
    return GeoMatchParams(
      areaCode: json['AreaCode'] as String,
      country: json['Country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final areaCode = this.areaCode;
    final country = this.country;
    return {
      'AreaCode': areaCode,
      'Country': country,
    };
  }
}

class GetGlobalSettingsResponse {
  /// The Voice Connector settings.
  final VoiceConnectorSettings? voiceConnector;

  GetGlobalSettingsResponse({
    this.voiceConnector,
  });

  factory GetGlobalSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetGlobalSettingsResponse(
      voiceConnector: json['VoiceConnector'] != null
          ? VoiceConnectorSettings.fromJson(
              json['VoiceConnector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnector = this.voiceConnector;
    return {
      if (voiceConnector != null) 'VoiceConnector': voiceConnector,
    };
  }
}

class GetPhoneNumberOrderResponse {
  /// The phone number order details.
  final PhoneNumberOrder? phoneNumberOrder;

  GetPhoneNumberOrderResponse({
    this.phoneNumberOrder,
  });

  factory GetPhoneNumberOrderResponse.fromJson(Map<String, dynamic> json) {
    return GetPhoneNumberOrderResponse(
      phoneNumberOrder: json['PhoneNumberOrder'] != null
          ? PhoneNumberOrder.fromJson(
              json['PhoneNumberOrder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberOrder = this.phoneNumberOrder;
    return {
      if (phoneNumberOrder != null) 'PhoneNumberOrder': phoneNumberOrder,
    };
  }
}

class GetPhoneNumberResponse {
  /// The phone number details.
  final PhoneNumber? phoneNumber;

  GetPhoneNumberResponse({
    this.phoneNumber,
  });

  factory GetPhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return GetPhoneNumberResponse(
      phoneNumber: json['PhoneNumber'] != null
          ? PhoneNumber.fromJson(json['PhoneNumber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

class GetPhoneNumberSettingsResponse {
  /// The default outbound calling name for the account.
  final String? callingName;

  /// The updated outbound calling name timestamp, in ISO 8601 format.
  final DateTime? callingNameUpdatedTimestamp;

  GetPhoneNumberSettingsResponse({
    this.callingName,
    this.callingNameUpdatedTimestamp,
  });

  factory GetPhoneNumberSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetPhoneNumberSettingsResponse(
      callingName: json['CallingName'] as String?,
      callingNameUpdatedTimestamp:
          timeStampFromJson(json['CallingNameUpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final callingName = this.callingName;
    final callingNameUpdatedTimestamp = this.callingNameUpdatedTimestamp;
    return {
      if (callingName != null) 'CallingName': callingName,
      if (callingNameUpdatedTimestamp != null)
        'CallingNameUpdatedTimestamp':
            iso8601ToJson(callingNameUpdatedTimestamp),
    };
  }
}

class GetProxySessionResponse {
  /// The proxy session details.
  final ProxySession? proxySession;

  GetProxySessionResponse({
    this.proxySession,
  });

  factory GetProxySessionResponse.fromJson(Map<String, dynamic> json) {
    return GetProxySessionResponse(
      proxySession: json['ProxySession'] != null
          ? ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxySession = this.proxySession;
    return {
      if (proxySession != null) 'ProxySession': proxySession,
    };
  }
}

class GetSipMediaApplicationAlexaSkillConfigurationResponse {
  /// Returns the Alexa Skill configuration.
  final SipMediaApplicationAlexaSkillConfiguration?
      sipMediaApplicationAlexaSkillConfiguration;

  GetSipMediaApplicationAlexaSkillConfigurationResponse({
    this.sipMediaApplicationAlexaSkillConfiguration,
  });

  factory GetSipMediaApplicationAlexaSkillConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSipMediaApplicationAlexaSkillConfigurationResponse(
      sipMediaApplicationAlexaSkillConfiguration:
          json['SipMediaApplicationAlexaSkillConfiguration'] != null
              ? SipMediaApplicationAlexaSkillConfiguration.fromJson(
                  json['SipMediaApplicationAlexaSkillConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplicationAlexaSkillConfiguration =
        this.sipMediaApplicationAlexaSkillConfiguration;
    return {
      if (sipMediaApplicationAlexaSkillConfiguration != null)
        'SipMediaApplicationAlexaSkillConfiguration':
            sipMediaApplicationAlexaSkillConfiguration,
    };
  }
}

class GetSipMediaApplicationLoggingConfigurationResponse {
  /// The actual logging configuration.
  final SipMediaApplicationLoggingConfiguration?
      sipMediaApplicationLoggingConfiguration;

  GetSipMediaApplicationLoggingConfigurationResponse({
    this.sipMediaApplicationLoggingConfiguration,
  });

  factory GetSipMediaApplicationLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSipMediaApplicationLoggingConfigurationResponse(
      sipMediaApplicationLoggingConfiguration:
          json['SipMediaApplicationLoggingConfiguration'] != null
              ? SipMediaApplicationLoggingConfiguration.fromJson(
                  json['SipMediaApplicationLoggingConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplicationLoggingConfiguration =
        this.sipMediaApplicationLoggingConfiguration;
    return {
      if (sipMediaApplicationLoggingConfiguration != null)
        'SipMediaApplicationLoggingConfiguration':
            sipMediaApplicationLoggingConfiguration,
    };
  }
}

class GetSipMediaApplicationResponse {
  /// The details of the SIP media application.
  final SipMediaApplication? sipMediaApplication;

  GetSipMediaApplicationResponse({
    this.sipMediaApplication,
  });

  factory GetSipMediaApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetSipMediaApplicationResponse(
      sipMediaApplication: json['SipMediaApplication'] != null
          ? SipMediaApplication.fromJson(
              json['SipMediaApplication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplication = this.sipMediaApplication;
    return {
      if (sipMediaApplication != null)
        'SipMediaApplication': sipMediaApplication,
    };
  }
}

class GetSipRuleResponse {
  /// The SIP rule details.
  final SipRule? sipRule;

  GetSipRuleResponse({
    this.sipRule,
  });

  factory GetSipRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetSipRuleResponse(
      sipRule: json['SipRule'] != null
          ? SipRule.fromJson(json['SipRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipRule = this.sipRule;
    return {
      if (sipRule != null) 'SipRule': sipRule,
    };
  }
}

class GetSpeakerSearchTaskResponse {
  /// The details of the speaker search task.
  final SpeakerSearchTask? speakerSearchTask;

  GetSpeakerSearchTaskResponse({
    this.speakerSearchTask,
  });

  factory GetSpeakerSearchTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetSpeakerSearchTaskResponse(
      speakerSearchTask: json['SpeakerSearchTask'] != null
          ? SpeakerSearchTask.fromJson(
              json['SpeakerSearchTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final speakerSearchTask = this.speakerSearchTask;
    return {
      if (speakerSearchTask != null) 'SpeakerSearchTask': speakerSearchTask,
    };
  }
}

class GetVoiceConnectorEmergencyCallingConfigurationResponse {
  /// The details of the emergency calling configuration.
  final EmergencyCallingConfiguration? emergencyCallingConfiguration;

  GetVoiceConnectorEmergencyCallingConfigurationResponse({
    this.emergencyCallingConfiguration,
  });

  factory GetVoiceConnectorEmergencyCallingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorEmergencyCallingConfigurationResponse(
      emergencyCallingConfiguration:
          json['EmergencyCallingConfiguration'] != null
              ? EmergencyCallingConfiguration.fromJson(
                  json['EmergencyCallingConfiguration'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final emergencyCallingConfiguration = this.emergencyCallingConfiguration;
    return {
      if (emergencyCallingConfiguration != null)
        'EmergencyCallingConfiguration': emergencyCallingConfiguration,
    };
  }
}

class GetVoiceConnectorGroupResponse {
  /// The details of the Voice Connector group.
  final VoiceConnectorGroup? voiceConnectorGroup;

  GetVoiceConnectorGroupResponse({
    this.voiceConnectorGroup,
  });

  factory GetVoiceConnectorGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetVoiceConnectorGroupResponse(
      voiceConnectorGroup: json['VoiceConnectorGroup'] != null
          ? VoiceConnectorGroup.fromJson(
              json['VoiceConnectorGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnectorGroup = this.voiceConnectorGroup;
    return {
      if (voiceConnectorGroup != null)
        'VoiceConnectorGroup': voiceConnectorGroup,
    };
  }
}

class GetVoiceConnectorLoggingConfigurationResponse {
  /// The logging configuration details .
  final LoggingConfiguration? loggingConfiguration;

  GetVoiceConnectorLoggingConfigurationResponse({
    this.loggingConfiguration,
  });

  factory GetVoiceConnectorLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorLoggingConfigurationResponse(
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfiguration = this.loggingConfiguration;
    return {
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
    };
  }
}

class GetVoiceConnectorOriginationResponse {
  /// The origination setting details.
  final Origination? origination;

  GetVoiceConnectorOriginationResponse({
    this.origination,
  });

  factory GetVoiceConnectorOriginationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorOriginationResponse(
      origination: json['Origination'] != null
          ? Origination.fromJson(json['Origination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final origination = this.origination;
    return {
      if (origination != null) 'Origination': origination,
    };
  }
}

class GetVoiceConnectorProxyResponse {
  /// The proxy configuration details.
  final Proxy? proxy;

  GetVoiceConnectorProxyResponse({
    this.proxy,
  });

  factory GetVoiceConnectorProxyResponse.fromJson(Map<String, dynamic> json) {
    return GetVoiceConnectorProxyResponse(
      proxy: json['Proxy'] != null
          ? Proxy.fromJson(json['Proxy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxy = this.proxy;
    return {
      if (proxy != null) 'Proxy': proxy,
    };
  }
}

class GetVoiceConnectorResponse {
  /// The Voice Connector details.
  final VoiceConnector? voiceConnector;

  GetVoiceConnectorResponse({
    this.voiceConnector,
  });

  factory GetVoiceConnectorResponse.fromJson(Map<String, dynamic> json) {
    return GetVoiceConnectorResponse(
      voiceConnector: json['VoiceConnector'] != null
          ? VoiceConnector.fromJson(
              json['VoiceConnector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnector = this.voiceConnector;
    return {
      if (voiceConnector != null) 'VoiceConnector': voiceConnector,
    };
  }
}

class GetVoiceConnectorStreamingConfigurationResponse {
  /// The details of the streaming configuration.
  final StreamingConfiguration? streamingConfiguration;

  GetVoiceConnectorStreamingConfigurationResponse({
    this.streamingConfiguration,
  });

  factory GetVoiceConnectorStreamingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorStreamingConfigurationResponse(
      streamingConfiguration: json['StreamingConfiguration'] != null
          ? StreamingConfiguration.fromJson(
              json['StreamingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingConfiguration = this.streamingConfiguration;
    return {
      if (streamingConfiguration != null)
        'StreamingConfiguration': streamingConfiguration,
    };
  }
}

class GetVoiceConnectorTerminationHealthResponse {
  /// The termination health details.
  final TerminationHealth? terminationHealth;

  GetVoiceConnectorTerminationHealthResponse({
    this.terminationHealth,
  });

  factory GetVoiceConnectorTerminationHealthResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorTerminationHealthResponse(
      terminationHealth: json['TerminationHealth'] != null
          ? TerminationHealth.fromJson(
              json['TerminationHealth'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final terminationHealth = this.terminationHealth;
    return {
      if (terminationHealth != null) 'TerminationHealth': terminationHealth,
    };
  }
}

class GetVoiceConnectorTerminationResponse {
  /// The termination setting details.
  final Termination? termination;

  GetVoiceConnectorTerminationResponse({
    this.termination,
  });

  factory GetVoiceConnectorTerminationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorTerminationResponse(
      termination: json['Termination'] != null
          ? Termination.fromJson(json['Termination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final termination = this.termination;
    return {
      if (termination != null) 'Termination': termination,
    };
  }
}

class GetVoiceProfileDomainResponse {
  /// The details of the voice profile domain.
  final VoiceProfileDomain? voiceProfileDomain;

  GetVoiceProfileDomainResponse({
    this.voiceProfileDomain,
  });

  factory GetVoiceProfileDomainResponse.fromJson(Map<String, dynamic> json) {
    return GetVoiceProfileDomainResponse(
      voiceProfileDomain: json['VoiceProfileDomain'] != null
          ? VoiceProfileDomain.fromJson(
              json['VoiceProfileDomain'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceProfileDomain = this.voiceProfileDomain;
    return {
      if (voiceProfileDomain != null) 'VoiceProfileDomain': voiceProfileDomain,
    };
  }
}

class GetVoiceProfileResponse {
  /// The voice profile details.
  final VoiceProfile? voiceProfile;

  GetVoiceProfileResponse({
    this.voiceProfile,
  });

  factory GetVoiceProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetVoiceProfileResponse(
      voiceProfile: json['VoiceProfile'] != null
          ? VoiceProfile.fromJson(json['VoiceProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceProfile = this.voiceProfile;
    return {
      if (voiceProfile != null) 'VoiceProfile': voiceProfile,
    };
  }
}

class GetVoiceToneAnalysisTaskResponse {
  /// The details of the voice tone analysis task.
  final VoiceToneAnalysisTask? voiceToneAnalysisTask;

  GetVoiceToneAnalysisTaskResponse({
    this.voiceToneAnalysisTask,
  });

  factory GetVoiceToneAnalysisTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetVoiceToneAnalysisTaskResponse(
      voiceToneAnalysisTask: json['VoiceToneAnalysisTask'] != null
          ? VoiceToneAnalysisTask.fromJson(
              json['VoiceToneAnalysisTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceToneAnalysisTask = this.voiceToneAnalysisTask;
    return {
      if (voiceToneAnalysisTask != null)
        'VoiceToneAnalysisTask': voiceToneAnalysisTask,
    };
  }
}

enum LanguageCode {
  enUs,
}

extension LanguageCodeValueExtension on LanguageCode {
  String toValue() {
    switch (this) {
      case LanguageCode.enUs:
        return 'en-US';
    }
  }
}

extension LanguageCodeFromString on String {
  LanguageCode toLanguageCode() {
    switch (this) {
      case 'en-US':
        return LanguageCode.enUs;
    }
    throw Exception('$this is not known in enum LanguageCode');
  }
}

class ListAvailableVoiceConnectorRegionsResponse {
  /// The list of AWS Regions.
  final List<VoiceConnectorAwsRegion>? voiceConnectorRegions;

  ListAvailableVoiceConnectorRegionsResponse({
    this.voiceConnectorRegions,
  });

  factory ListAvailableVoiceConnectorRegionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableVoiceConnectorRegionsResponse(
      voiceConnectorRegions: (json['VoiceConnectorRegions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toVoiceConnectorAwsRegion())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnectorRegions = this.voiceConnectorRegions;
    return {
      if (voiceConnectorRegions != null)
        'VoiceConnectorRegions':
            voiceConnectorRegions.map((e) => e.toValue()).toList(),
    };
  }
}

class ListPhoneNumberOrdersResponse {
  /// The token used to retrieve the next page of results.
  final String? nextToken;

  /// The phone number order details.
  final List<PhoneNumberOrder>? phoneNumberOrders;

  ListPhoneNumberOrdersResponse({
    this.nextToken,
    this.phoneNumberOrders,
  });

  factory ListPhoneNumberOrdersResponse.fromJson(Map<String, dynamic> json) {
    return ListPhoneNumberOrdersResponse(
      nextToken: json['NextToken'] as String?,
      phoneNumberOrders: (json['PhoneNumberOrders'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final phoneNumberOrders = this.phoneNumberOrders;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (phoneNumberOrders != null) 'PhoneNumberOrders': phoneNumberOrders,
    };
  }
}

class ListPhoneNumbersResponse {
  /// The token used to return the next page of results.
  final String? nextToken;

  /// The phone number details.
  final List<PhoneNumber>? phoneNumbers;

  ListPhoneNumbersResponse({
    this.nextToken,
    this.phoneNumbers,
  });

  factory ListPhoneNumbersResponse.fromJson(Map<String, dynamic> json) {
    return ListPhoneNumbersResponse(
      nextToken: json['NextToken'] as String?,
      phoneNumbers: (json['PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
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

class ListProxySessionsResponse {
  /// The token used to retrieve the next page of results.
  final String? nextToken;

  /// The proxy sessions' details.
  final List<ProxySession>? proxySessions;

  ListProxySessionsResponse({
    this.nextToken,
    this.proxySessions,
  });

  factory ListProxySessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListProxySessionsResponse(
      nextToken: json['NextToken'] as String?,
      proxySessions: (json['ProxySessions'] as List?)
          ?.whereNotNull()
          .map((e) => ProxySession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final proxySessions = this.proxySessions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (proxySessions != null) 'ProxySessions': proxySessions,
    };
  }
}

class ListSipMediaApplicationsResponse {
  /// The token used to return the next page of results.
  final String? nextToken;

  /// The list of SIP media applications and application details.
  final List<SipMediaApplication>? sipMediaApplications;

  ListSipMediaApplicationsResponse({
    this.nextToken,
    this.sipMediaApplications,
  });

  factory ListSipMediaApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListSipMediaApplicationsResponse(
      nextToken: json['NextToken'] as String?,
      sipMediaApplications: (json['SipMediaApplications'] as List?)
          ?.whereNotNull()
          .map((e) => SipMediaApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sipMediaApplications = this.sipMediaApplications;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sipMediaApplications != null)
        'SipMediaApplications': sipMediaApplications,
    };
  }
}

class ListSipRulesResponse {
  /// The token used to return the next page of results.
  final String? nextToken;

  /// The list of SIP rules and details.
  final List<SipRule>? sipRules;

  ListSipRulesResponse({
    this.nextToken,
    this.sipRules,
  });

  factory ListSipRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListSipRulesResponse(
      nextToken: json['NextToken'] as String?,
      sipRules: (json['SipRules'] as List?)
          ?.whereNotNull()
          .map((e) => SipRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sipRules = this.sipRules;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sipRules != null) 'SipRules': sipRules,
    };
  }
}

class ListSupportedPhoneNumberCountriesResponse {
  /// The supported phone number countries.
  final List<PhoneNumberCountry>? phoneNumberCountries;

  ListSupportedPhoneNumberCountriesResponse({
    this.phoneNumberCountries,
  });

  factory ListSupportedPhoneNumberCountriesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSupportedPhoneNumberCountriesResponse(
      phoneNumberCountries: (json['PhoneNumberCountries'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberCountries = this.phoneNumberCountries;
    return {
      if (phoneNumberCountries != null)
        'PhoneNumberCountries': phoneNumberCountries,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags in the list.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListVoiceConnectorGroupsResponse {
  /// The token used to return the next page of results.
  final String? nextToken;

  /// The details of the Voice Connector groups.
  final List<VoiceConnectorGroup>? voiceConnectorGroups;

  ListVoiceConnectorGroupsResponse({
    this.nextToken,
    this.voiceConnectorGroups,
  });

  factory ListVoiceConnectorGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListVoiceConnectorGroupsResponse(
      nextToken: json['NextToken'] as String?,
      voiceConnectorGroups: (json['VoiceConnectorGroups'] as List?)
          ?.whereNotNull()
          .map((e) => VoiceConnectorGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final voiceConnectorGroups = this.voiceConnectorGroups;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (voiceConnectorGroups != null)
        'VoiceConnectorGroups': voiceConnectorGroups,
    };
  }
}

class ListVoiceConnectorTerminationCredentialsResponse {
  /// A list of user names.
  final List<String>? usernames;

  ListVoiceConnectorTerminationCredentialsResponse({
    this.usernames,
  });

  factory ListVoiceConnectorTerminationCredentialsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListVoiceConnectorTerminationCredentialsResponse(
      usernames: (json['Usernames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final usernames = this.usernames;
    return {
      if (usernames != null) 'Usernames': usernames,
    };
  }
}

class ListVoiceConnectorsResponse {
  /// The token used to return the next page of results.
  final String? nextToken;

  /// The details of the Voice Connectors.
  final List<VoiceConnector>? voiceConnectors;

  ListVoiceConnectorsResponse({
    this.nextToken,
    this.voiceConnectors,
  });

  factory ListVoiceConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListVoiceConnectorsResponse(
      nextToken: json['NextToken'] as String?,
      voiceConnectors: (json['VoiceConnectors'] as List?)
          ?.whereNotNull()
          .map((e) => VoiceConnector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final voiceConnectors = this.voiceConnectors;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (voiceConnectors != null) 'VoiceConnectors': voiceConnectors,
    };
  }
}

class ListVoiceProfileDomainsResponse {
  /// The token used to return the next page of results.
  final String? nextToken;

  /// The list of voice profile domains.
  final List<VoiceProfileDomainSummary>? voiceProfileDomains;

  ListVoiceProfileDomainsResponse({
    this.nextToken,
    this.voiceProfileDomains,
  });

  factory ListVoiceProfileDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ListVoiceProfileDomainsResponse(
      nextToken: json['NextToken'] as String?,
      voiceProfileDomains: (json['VoiceProfileDomains'] as List?)
          ?.whereNotNull()
          .map((e) =>
              VoiceProfileDomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final voiceProfileDomains = this.voiceProfileDomains;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (voiceProfileDomains != null)
        'VoiceProfileDomains': voiceProfileDomains,
    };
  }
}

class ListVoiceProfilesResponse {
  /// The token used to retrieve the next page of results.
  final String? nextToken;

  /// The list of voice profiles.
  final List<VoiceProfileSummary>? voiceProfiles;

  ListVoiceProfilesResponse({
    this.nextToken,
    this.voiceProfiles,
  });

  factory ListVoiceProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListVoiceProfilesResponse(
      nextToken: json['NextToken'] as String?,
      voiceProfiles: (json['VoiceProfiles'] as List?)
          ?.whereNotNull()
          .map((e) => VoiceProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final voiceProfiles = this.voiceProfiles;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (voiceProfiles != null) 'VoiceProfiles': voiceProfiles,
    };
  }
}

/// The logging configuration associated with an Amazon Chime SDK Voice
/// Connector. Specifies whether SIP message logs can be sent to Amazon
/// CloudWatch Logs.
class LoggingConfiguration {
  /// Enables or disables media metrics logging.
  final bool? enableMediaMetricLogs;

  /// Boolean that enables sending SIP message logs to Amazon CloudWatch.
  final bool? enableSIPLogs;

  LoggingConfiguration({
    this.enableMediaMetricLogs,
    this.enableSIPLogs,
  });

  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      enableMediaMetricLogs: json['EnableMediaMetricLogs'] as bool?,
      enableSIPLogs: json['EnableSIPLogs'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableMediaMetricLogs = this.enableMediaMetricLogs;
    final enableSIPLogs = this.enableSIPLogs;
    return {
      if (enableMediaMetricLogs != null)
        'EnableMediaMetricLogs': enableMediaMetricLogs,
      if (enableSIPLogs != null) 'EnableSIPLogs': enableSIPLogs,
    };
  }
}

/// The configuration for a call analytics task.
class MediaInsightsConfiguration {
  /// The configuration's ARN.
  final String? configurationArn;

  /// Denotes the configration as enabled or disabled.
  final bool? disabled;

  MediaInsightsConfiguration({
    this.configurationArn,
    this.disabled,
  });

  factory MediaInsightsConfiguration.fromJson(Map<String, dynamic> json) {
    return MediaInsightsConfiguration(
      configurationArn: json['ConfigurationArn'] as String?,
      disabled: json['Disabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationArn = this.configurationArn;
    final disabled = this.disabled;
    return {
      if (configurationArn != null) 'ConfigurationArn': configurationArn,
      if (disabled != null) 'Disabled': disabled,
    };
  }
}

enum NotificationTarget {
  eventBridge,
  sns,
  sqs,
}

extension NotificationTargetValueExtension on NotificationTarget {
  String toValue() {
    switch (this) {
      case NotificationTarget.eventBridge:
        return 'EventBridge';
      case NotificationTarget.sns:
        return 'SNS';
      case NotificationTarget.sqs:
        return 'SQS';
    }
  }
}

extension NotificationTargetFromString on String {
  NotificationTarget toNotificationTarget() {
    switch (this) {
      case 'EventBridge':
        return NotificationTarget.eventBridge;
      case 'SNS':
        return NotificationTarget.sns;
      case 'SQS':
        return NotificationTarget.sqs;
    }
    throw Exception('$this is not known in enum NotificationTarget');
  }
}

enum NumberSelectionBehavior {
  preferSticky,
  avoidSticky,
}

extension NumberSelectionBehaviorValueExtension on NumberSelectionBehavior {
  String toValue() {
    switch (this) {
      case NumberSelectionBehavior.preferSticky:
        return 'PreferSticky';
      case NumberSelectionBehavior.avoidSticky:
        return 'AvoidSticky';
    }
  }
}

extension NumberSelectionBehaviorFromString on String {
  NumberSelectionBehavior toNumberSelectionBehavior() {
    switch (this) {
      case 'PreferSticky':
        return NumberSelectionBehavior.preferSticky;
      case 'AvoidSticky':
        return NumberSelectionBehavior.avoidSticky;
    }
    throw Exception('$this is not known in enum NumberSelectionBehavior');
  }
}

/// A phone number for which an order has been placed.
class OrderedPhoneNumber {
  /// The phone number, in E.164 format.
  final String? e164PhoneNumber;

  /// The phone number status.
  final OrderedPhoneNumberStatus? status;

  OrderedPhoneNumber({
    this.e164PhoneNumber,
    this.status,
  });

  factory OrderedPhoneNumber.fromJson(Map<String, dynamic> json) {
    return OrderedPhoneNumber(
      e164PhoneNumber: json['E164PhoneNumber'] as String?,
      status: (json['Status'] as String?)?.toOrderedPhoneNumberStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final e164PhoneNumber = this.e164PhoneNumber;
    final status = this.status;
    return {
      if (e164PhoneNumber != null) 'E164PhoneNumber': e164PhoneNumber,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum OrderedPhoneNumberStatus {
  processing,
  acquired,
  failed,
}

extension OrderedPhoneNumberStatusValueExtension on OrderedPhoneNumberStatus {
  String toValue() {
    switch (this) {
      case OrderedPhoneNumberStatus.processing:
        return 'Processing';
      case OrderedPhoneNumberStatus.acquired:
        return 'Acquired';
      case OrderedPhoneNumberStatus.failed:
        return 'Failed';
    }
  }
}

extension OrderedPhoneNumberStatusFromString on String {
  OrderedPhoneNumberStatus toOrderedPhoneNumberStatus() {
    switch (this) {
      case 'Processing':
        return OrderedPhoneNumberStatus.processing;
      case 'Acquired':
        return OrderedPhoneNumberStatus.acquired;
      case 'Failed':
        return OrderedPhoneNumberStatus.failed;
    }
    throw Exception('$this is not known in enum OrderedPhoneNumberStatus');
  }
}

/// Origination settings enable your SIP hosts to receive inbound calls using
/// your Amazon Chime SDK Voice Connector.
/// <note>
/// The parameters listed below are not required, but you must use at least one.
/// </note>
class Origination {
  /// When origination settings are disabled, inbound calls are not enabled for
  /// your Amazon Chime SDK Voice Connector. This parameter is not required, but
  /// you must specify this parameter or <code>Routes</code>.
  final bool? disabled;

  /// The call distribution properties defined for your SIP hosts. Valid range:
  /// Minimum value of 1. Maximum value of 20. This parameter is not required, but
  /// you must specify this parameter or <code>Disabled</code>.
  final List<OriginationRoute>? routes;

  Origination({
    this.disabled,
    this.routes,
  });

  factory Origination.fromJson(Map<String, dynamic> json) {
    return Origination(
      disabled: json['Disabled'] as bool?,
      routes: (json['Routes'] as List?)
          ?.whereNotNull()
          .map((e) => OriginationRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final disabled = this.disabled;
    final routes = this.routes;
    return {
      if (disabled != null) 'Disabled': disabled,
      if (routes != null) 'Routes': routes,
    };
  }
}

/// Origination routes define call distribution properties for your SIP hosts to
/// receive inbound calls using an Amazon Chime SDK Voice Connector. Limit: Ten
/// origination routes for each Voice Connector.
/// <note>
/// The parameters listed below are not required, but you must use at least one.
/// </note>
class OriginationRoute {
  /// The FQDN or IP address to contact for origination traffic.
  final String? host;

  /// The designated origination route port. Defaults to 5060.
  final int? port;

  /// The priority associated with the host, with 1 being the highest priority.
  /// Higher priority hosts are attempted first.
  final int? priority;

  /// The protocol to use for the origination route. Encryption-enabled Amazon
  /// Chime SDK Voice Connectors use TCP protocol by default.
  final OriginationRouteProtocol? protocol;

  /// The weight assigned to an origination route. When hosts have equal priority,
  /// calls are distributed between them based on their relative weights.
  final int? weight;

  OriginationRoute({
    this.host,
    this.port,
    this.priority,
    this.protocol,
    this.weight,
  });

  factory OriginationRoute.fromJson(Map<String, dynamic> json) {
    return OriginationRoute(
      host: json['Host'] as String?,
      port: json['Port'] as int?,
      priority: json['Priority'] as int?,
      protocol: (json['Protocol'] as String?)?.toOriginationRouteProtocol(),
      weight: json['Weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final host = this.host;
    final port = this.port;
    final priority = this.priority;
    final protocol = this.protocol;
    final weight = this.weight;
    return {
      if (host != null) 'Host': host,
      if (port != null) 'Port': port,
      if (priority != null) 'Priority': priority,
      if (protocol != null) 'Protocol': protocol.toValue(),
      if (weight != null) 'Weight': weight,
    };
  }
}

enum OriginationRouteProtocol {
  tcp,
  udp,
}

extension OriginationRouteProtocolValueExtension on OriginationRouteProtocol {
  String toValue() {
    switch (this) {
      case OriginationRouteProtocol.tcp:
        return 'TCP';
      case OriginationRouteProtocol.udp:
        return 'UDP';
    }
  }
}

extension OriginationRouteProtocolFromString on String {
  OriginationRouteProtocol toOriginationRouteProtocol() {
    switch (this) {
      case 'TCP':
        return OriginationRouteProtocol.tcp;
      case 'UDP':
        return OriginationRouteProtocol.udp;
    }
    throw Exception('$this is not known in enum OriginationRouteProtocol');
  }
}

/// The phone number and proxy phone number for a participant in an Amazon Chime
/// SDK Voice Connector proxy session.
class Participant {
  /// The participant's phone number.
  final String? phoneNumber;

  /// The participant's proxy phone number.
  final String? proxyPhoneNumber;

  Participant({
    this.phoneNumber,
    this.proxyPhoneNumber,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      phoneNumber: json['PhoneNumber'] as String?,
      proxyPhoneNumber: json['ProxyPhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    final proxyPhoneNumber = this.proxyPhoneNumber;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (proxyPhoneNumber != null) 'ProxyPhoneNumber': proxyPhoneNumber,
    };
  }
}

/// A phone number used to call an Amazon Chime SDK Voice Connector.
class PhoneNumber {
  /// The phone number's associations.
  final List<PhoneNumberAssociation>? associations;

  /// The outbound calling name associated with the phone number.
  final String? callingName;

  /// The outbound calling name status.
  final CallingNameStatus? callingNameStatus;

  /// The phone number's capabilities.
  final PhoneNumberCapabilities? capabilities;

  /// The phone number's country. Format: ISO 3166-1 alpha-2.
  final String? country;

  /// The phone number creation timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The deleted phone number timestamp, in ISO 8601 format.
  final DateTime? deletionTimestamp;

  /// The phone number, in E.164 format.
  final String? e164PhoneNumber;

  /// The name of the phone number.
  final String? name;

  /// The phone number's order ID.
  final String? orderId;

  /// The phone number's ID.
  final String? phoneNumberId;

  /// The phone number's product type.
  final PhoneNumberProductType? productType;

  /// The phone number's status.
  final PhoneNumberStatus? status;

  /// The phone number's type.
  final PhoneNumberType? type;

  /// The updated phone number timestamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  PhoneNumber({
    this.associations,
    this.callingName,
    this.callingNameStatus,
    this.capabilities,
    this.country,
    this.createdTimestamp,
    this.deletionTimestamp,
    this.e164PhoneNumber,
    this.name,
    this.orderId,
    this.phoneNumberId,
    this.productType,
    this.status,
    this.type,
    this.updatedTimestamp,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> json) {
    return PhoneNumber(
      associations: (json['Associations'] as List?)
          ?.whereNotNull()
          .map(
              (e) => PhoneNumberAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      callingName: json['CallingName'] as String?,
      callingNameStatus:
          (json['CallingNameStatus'] as String?)?.toCallingNameStatus(),
      capabilities: json['Capabilities'] != null
          ? PhoneNumberCapabilities.fromJson(
              json['Capabilities'] as Map<String, dynamic>)
          : null,
      country: json['Country'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionTimestamp: timeStampFromJson(json['DeletionTimestamp']),
      e164PhoneNumber: json['E164PhoneNumber'] as String?,
      name: json['Name'] as String?,
      orderId: json['OrderId'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      productType: (json['ProductType'] as String?)?.toPhoneNumberProductType(),
      status: (json['Status'] as String?)?.toPhoneNumberStatus(),
      type: (json['Type'] as String?)?.toPhoneNumberType(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    final callingName = this.callingName;
    final callingNameStatus = this.callingNameStatus;
    final capabilities = this.capabilities;
    final country = this.country;
    final createdTimestamp = this.createdTimestamp;
    final deletionTimestamp = this.deletionTimestamp;
    final e164PhoneNumber = this.e164PhoneNumber;
    final name = this.name;
    final orderId = this.orderId;
    final phoneNumberId = this.phoneNumberId;
    final productType = this.productType;
    final status = this.status;
    final type = this.type;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (associations != null) 'Associations': associations,
      if (callingName != null) 'CallingName': callingName,
      if (callingNameStatus != null)
        'CallingNameStatus': callingNameStatus.toValue(),
      if (capabilities != null) 'Capabilities': capabilities,
      if (country != null) 'Country': country,
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (deletionTimestamp != null)
        'DeletionTimestamp': iso8601ToJson(deletionTimestamp),
      if (e164PhoneNumber != null) 'E164PhoneNumber': e164PhoneNumber,
      if (name != null) 'Name': name,
      if (orderId != null) 'OrderId': orderId,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (productType != null) 'ProductType': productType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// The phone number associations, such as an Amazon Chime SDK account ID, user
/// ID, Voice Connector ID, or Voice Connector group ID.
class PhoneNumberAssociation {
  /// The timestamp of the phone number association, in ISO 8601 format.
  final DateTime? associatedTimestamp;

  /// Defines the association with an Amazon Chime SDK account ID, user ID, Voice
  /// Connector ID, or Voice Connector group ID.
  final PhoneNumberAssociationName? name;

  /// Contains the ID for the entity specified in Name.
  final String? value;

  PhoneNumberAssociation({
    this.associatedTimestamp,
    this.name,
    this.value,
  });

  factory PhoneNumberAssociation.fromJson(Map<String, dynamic> json) {
    return PhoneNumberAssociation(
      associatedTimestamp: timeStampFromJson(json['AssociatedTimestamp']),
      name: (json['Name'] as String?)?.toPhoneNumberAssociationName(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedTimestamp = this.associatedTimestamp;
    final name = this.name;
    final value = this.value;
    return {
      if (associatedTimestamp != null)
        'AssociatedTimestamp': iso8601ToJson(associatedTimestamp),
      if (name != null) 'Name': name.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum PhoneNumberAssociationName {
  voiceConnectorId,
  voiceConnectorGroupId,
  sipRuleId,
}

extension PhoneNumberAssociationNameValueExtension
    on PhoneNumberAssociationName {
  String toValue() {
    switch (this) {
      case PhoneNumberAssociationName.voiceConnectorId:
        return 'VoiceConnectorId';
      case PhoneNumberAssociationName.voiceConnectorGroupId:
        return 'VoiceConnectorGroupId';
      case PhoneNumberAssociationName.sipRuleId:
        return 'SipRuleId';
    }
  }
}

extension PhoneNumberAssociationNameFromString on String {
  PhoneNumberAssociationName toPhoneNumberAssociationName() {
    switch (this) {
      case 'VoiceConnectorId':
        return PhoneNumberAssociationName.voiceConnectorId;
      case 'VoiceConnectorGroupId':
        return PhoneNumberAssociationName.voiceConnectorGroupId;
      case 'SipRuleId':
        return PhoneNumberAssociationName.sipRuleId;
    }
    throw Exception('$this is not known in enum PhoneNumberAssociationName');
  }
}

/// The phone number capabilities for Amazon Chime SDK phone numbers, such as
/// enabled inbound and outbound calling, and text messaging.
class PhoneNumberCapabilities {
  /// Allows or denies inbound calling for the specified phone number.
  final bool? inboundCall;

  /// Allows or denies inbound MMS messaging for the specified phone number.
  final bool? inboundMMS;

  /// Allows or denies inbound SMS messaging for the specified phone number.
  final bool? inboundSMS;

  /// Allows or denies outbound calling for the specified phone number.
  final bool? outboundCall;

  /// Allows or denies inbound MMS messaging for the specified phone number.
  final bool? outboundMMS;

  /// Allows or denies outbound SMS messaging for the specified phone number.
  final bool? outboundSMS;

  PhoneNumberCapabilities({
    this.inboundCall,
    this.inboundMMS,
    this.inboundSMS,
    this.outboundCall,
    this.outboundMMS,
    this.outboundSMS,
  });

  factory PhoneNumberCapabilities.fromJson(Map<String, dynamic> json) {
    return PhoneNumberCapabilities(
      inboundCall: json['InboundCall'] as bool?,
      inboundMMS: json['InboundMMS'] as bool?,
      inboundSMS: json['InboundSMS'] as bool?,
      outboundCall: json['OutboundCall'] as bool?,
      outboundMMS: json['OutboundMMS'] as bool?,
      outboundSMS: json['OutboundSMS'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final inboundCall = this.inboundCall;
    final inboundMMS = this.inboundMMS;
    final inboundSMS = this.inboundSMS;
    final outboundCall = this.outboundCall;
    final outboundMMS = this.outboundMMS;
    final outboundSMS = this.outboundSMS;
    return {
      if (inboundCall != null) 'InboundCall': inboundCall,
      if (inboundMMS != null) 'InboundMMS': inboundMMS,
      if (inboundSMS != null) 'InboundSMS': inboundSMS,
      if (outboundCall != null) 'OutboundCall': outboundCall,
      if (outboundMMS != null) 'OutboundMMS': outboundMMS,
      if (outboundSMS != null) 'OutboundSMS': outboundSMS,
    };
  }
}

/// The phone number's country.
class PhoneNumberCountry {
  /// The phone number country code. Format: ISO 3166-1 alpha-2.
  final String? countryCode;

  /// The supported phone number types.
  final List<PhoneNumberType>? supportedPhoneNumberTypes;

  PhoneNumberCountry({
    this.countryCode,
    this.supportedPhoneNumberTypes,
  });

  factory PhoneNumberCountry.fromJson(Map<String, dynamic> json) {
    return PhoneNumberCountry(
      countryCode: json['CountryCode'] as String?,
      supportedPhoneNumberTypes: (json['SupportedPhoneNumberTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPhoneNumberType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final countryCode = this.countryCode;
    final supportedPhoneNumberTypes = this.supportedPhoneNumberTypes;
    return {
      if (countryCode != null) 'CountryCode': countryCode,
      if (supportedPhoneNumberTypes != null)
        'SupportedPhoneNumberTypes':
            supportedPhoneNumberTypes.map((e) => e.toValue()).toList(),
    };
  }
}

/// If a phone number action fails for one or more of the phone numbers in a
/// request, a list of the failed phone numbers is returned, along with error
/// codes and error messages.
class PhoneNumberError {
  /// The error code.
  final ErrorCode? errorCode;

  /// The error message.
  final String? errorMessage;

  /// The phone number ID for which the action failed.
  final String? phoneNumberId;

  PhoneNumberError({
    this.errorCode,
    this.errorMessage,
    this.phoneNumberId,
  });

  factory PhoneNumberError.fromJson(Map<String, dynamic> json) {
    return PhoneNumberError(
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final phoneNumberId = this.phoneNumberId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
    };
  }
}

/// The details of an Amazon Chime SDK phone number order.
class PhoneNumberOrder {
  /// The phone number order creation time stamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The type of phone number being ordered, local or toll-free.
  final PhoneNumberOrderType? orderType;

  /// The ordered phone number details, such as the phone number in E.164 format
  /// and the phone number status.
  final List<OrderedPhoneNumber>? orderedPhoneNumbers;

  /// The ID of the phone order.
  final String? phoneNumberOrderId;

  /// The phone number order product type.
  final PhoneNumberProductType? productType;

  /// The status of the phone number order.
  final PhoneNumberOrderStatus? status;

  /// The updated phone number order time stamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  PhoneNumberOrder({
    this.createdTimestamp,
    this.orderType,
    this.orderedPhoneNumbers,
    this.phoneNumberOrderId,
    this.productType,
    this.status,
    this.updatedTimestamp,
  });

  factory PhoneNumberOrder.fromJson(Map<String, dynamic> json) {
    return PhoneNumberOrder(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      orderType: (json['OrderType'] as String?)?.toPhoneNumberOrderType(),
      orderedPhoneNumbers: (json['OrderedPhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => OrderedPhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneNumberOrderId: json['PhoneNumberOrderId'] as String?,
      productType: (json['ProductType'] as String?)?.toPhoneNumberProductType(),
      status: (json['Status'] as String?)?.toPhoneNumberOrderStatus(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final orderType = this.orderType;
    final orderedPhoneNumbers = this.orderedPhoneNumbers;
    final phoneNumberOrderId = this.phoneNumberOrderId;
    final productType = this.productType;
    final status = this.status;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (orderType != null) 'OrderType': orderType.toValue(),
      if (orderedPhoneNumbers != null)
        'OrderedPhoneNumbers': orderedPhoneNumbers,
      if (phoneNumberOrderId != null) 'PhoneNumberOrderId': phoneNumberOrderId,
      if (productType != null) 'ProductType': productType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

enum PhoneNumberOrderStatus {
  processing,
  successful,
  failed,
  partial,
  pendingDocuments,
  submitted,
  foc,
  changeRequested,
  exception,
  cancelRequested,
  cancelled,
}

extension PhoneNumberOrderStatusValueExtension on PhoneNumberOrderStatus {
  String toValue() {
    switch (this) {
      case PhoneNumberOrderStatus.processing:
        return 'Processing';
      case PhoneNumberOrderStatus.successful:
        return 'Successful';
      case PhoneNumberOrderStatus.failed:
        return 'Failed';
      case PhoneNumberOrderStatus.partial:
        return 'Partial';
      case PhoneNumberOrderStatus.pendingDocuments:
        return 'PendingDocuments';
      case PhoneNumberOrderStatus.submitted:
        return 'Submitted';
      case PhoneNumberOrderStatus.foc:
        return 'FOC';
      case PhoneNumberOrderStatus.changeRequested:
        return 'ChangeRequested';
      case PhoneNumberOrderStatus.exception:
        return 'Exception';
      case PhoneNumberOrderStatus.cancelRequested:
        return 'CancelRequested';
      case PhoneNumberOrderStatus.cancelled:
        return 'Cancelled';
    }
  }
}

extension PhoneNumberOrderStatusFromString on String {
  PhoneNumberOrderStatus toPhoneNumberOrderStatus() {
    switch (this) {
      case 'Processing':
        return PhoneNumberOrderStatus.processing;
      case 'Successful':
        return PhoneNumberOrderStatus.successful;
      case 'Failed':
        return PhoneNumberOrderStatus.failed;
      case 'Partial':
        return PhoneNumberOrderStatus.partial;
      case 'PendingDocuments':
        return PhoneNumberOrderStatus.pendingDocuments;
      case 'Submitted':
        return PhoneNumberOrderStatus.submitted;
      case 'FOC':
        return PhoneNumberOrderStatus.foc;
      case 'ChangeRequested':
        return PhoneNumberOrderStatus.changeRequested;
      case 'Exception':
        return PhoneNumberOrderStatus.exception;
      case 'CancelRequested':
        return PhoneNumberOrderStatus.cancelRequested;
      case 'Cancelled':
        return PhoneNumberOrderStatus.cancelled;
    }
    throw Exception('$this is not known in enum PhoneNumberOrderStatus');
  }
}

enum PhoneNumberOrderType {
  $new,
  porting,
}

extension PhoneNumberOrderTypeValueExtension on PhoneNumberOrderType {
  String toValue() {
    switch (this) {
      case PhoneNumberOrderType.$new:
        return 'New';
      case PhoneNumberOrderType.porting:
        return 'Porting';
    }
  }
}

extension PhoneNumberOrderTypeFromString on String {
  PhoneNumberOrderType toPhoneNumberOrderType() {
    switch (this) {
      case 'New':
        return PhoneNumberOrderType.$new;
      case 'Porting':
        return PhoneNumberOrderType.porting;
    }
    throw Exception('$this is not known in enum PhoneNumberOrderType');
  }
}

enum PhoneNumberProductType {
  voiceConnector,
  sipMediaApplicationDialIn,
}

extension PhoneNumberProductTypeValueExtension on PhoneNumberProductType {
  String toValue() {
    switch (this) {
      case PhoneNumberProductType.voiceConnector:
        return 'VoiceConnector';
      case PhoneNumberProductType.sipMediaApplicationDialIn:
        return 'SipMediaApplicationDialIn';
    }
  }
}

extension PhoneNumberProductTypeFromString on String {
  PhoneNumberProductType toPhoneNumberProductType() {
    switch (this) {
      case 'VoiceConnector':
        return PhoneNumberProductType.voiceConnector;
      case 'SipMediaApplicationDialIn':
        return PhoneNumberProductType.sipMediaApplicationDialIn;
    }
    throw Exception('$this is not known in enum PhoneNumberProductType');
  }
}

enum PhoneNumberStatus {
  cancelled,
  portinCancelRequested,
  portinInProgress,
  acquireInProgress,
  acquireFailed,
  unassigned,
  assigned,
  releaseInProgress,
  deleteInProgress,
  releaseFailed,
  deleteFailed,
}

extension PhoneNumberStatusValueExtension on PhoneNumberStatus {
  String toValue() {
    switch (this) {
      case PhoneNumberStatus.cancelled:
        return 'Cancelled';
      case PhoneNumberStatus.portinCancelRequested:
        return 'PortinCancelRequested';
      case PhoneNumberStatus.portinInProgress:
        return 'PortinInProgress';
      case PhoneNumberStatus.acquireInProgress:
        return 'AcquireInProgress';
      case PhoneNumberStatus.acquireFailed:
        return 'AcquireFailed';
      case PhoneNumberStatus.unassigned:
        return 'Unassigned';
      case PhoneNumberStatus.assigned:
        return 'Assigned';
      case PhoneNumberStatus.releaseInProgress:
        return 'ReleaseInProgress';
      case PhoneNumberStatus.deleteInProgress:
        return 'DeleteInProgress';
      case PhoneNumberStatus.releaseFailed:
        return 'ReleaseFailed';
      case PhoneNumberStatus.deleteFailed:
        return 'DeleteFailed';
    }
  }
}

extension PhoneNumberStatusFromString on String {
  PhoneNumberStatus toPhoneNumberStatus() {
    switch (this) {
      case 'Cancelled':
        return PhoneNumberStatus.cancelled;
      case 'PortinCancelRequested':
        return PhoneNumberStatus.portinCancelRequested;
      case 'PortinInProgress':
        return PhoneNumberStatus.portinInProgress;
      case 'AcquireInProgress':
        return PhoneNumberStatus.acquireInProgress;
      case 'AcquireFailed':
        return PhoneNumberStatus.acquireFailed;
      case 'Unassigned':
        return PhoneNumberStatus.unassigned;
      case 'Assigned':
        return PhoneNumberStatus.assigned;
      case 'ReleaseInProgress':
        return PhoneNumberStatus.releaseInProgress;
      case 'DeleteInProgress':
        return PhoneNumberStatus.deleteInProgress;
      case 'ReleaseFailed':
        return PhoneNumberStatus.releaseFailed;
      case 'DeleteFailed':
        return PhoneNumberStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum PhoneNumberStatus');
  }
}

enum PhoneNumberType {
  local,
  tollFree,
}

extension PhoneNumberTypeValueExtension on PhoneNumberType {
  String toValue() {
    switch (this) {
      case PhoneNumberType.local:
        return 'Local';
      case PhoneNumberType.tollFree:
        return 'TollFree';
    }
  }
}

extension PhoneNumberTypeFromString on String {
  PhoneNumberType toPhoneNumberType() {
    switch (this) {
      case 'Local':
        return PhoneNumberType.local;
      case 'TollFree':
        return PhoneNumberType.tollFree;
    }
    throw Exception('$this is not known in enum PhoneNumberType');
  }
}

/// The proxy configuration for an Amazon Chime SDK Voice Connector.
class Proxy {
  /// The default number of minutes allowed for proxy sessions.
  final int? defaultSessionExpiryMinutes;

  /// When true, stops proxy sessions from being created on the specified Amazon
  /// Chime SDK Voice Connector.
  final bool? disabled;

  /// The phone number to route calls to after a proxy session expires.
  final String? fallBackPhoneNumber;

  /// The countries for proxy phone numbers to be selected from.
  final List<String>? phoneNumberCountries;

  Proxy({
    this.defaultSessionExpiryMinutes,
    this.disabled,
    this.fallBackPhoneNumber,
    this.phoneNumberCountries,
  });

  factory Proxy.fromJson(Map<String, dynamic> json) {
    return Proxy(
      defaultSessionExpiryMinutes: json['DefaultSessionExpiryMinutes'] as int?,
      disabled: json['Disabled'] as bool?,
      fallBackPhoneNumber: json['FallBackPhoneNumber'] as String?,
      phoneNumberCountries: (json['PhoneNumberCountries'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultSessionExpiryMinutes = this.defaultSessionExpiryMinutes;
    final disabled = this.disabled;
    final fallBackPhoneNumber = this.fallBackPhoneNumber;
    final phoneNumberCountries = this.phoneNumberCountries;
    return {
      if (defaultSessionExpiryMinutes != null)
        'DefaultSessionExpiryMinutes': defaultSessionExpiryMinutes,
      if (disabled != null) 'Disabled': disabled,
      if (fallBackPhoneNumber != null)
        'FallBackPhoneNumber': fallBackPhoneNumber,
      if (phoneNumberCountries != null)
        'PhoneNumberCountries': phoneNumberCountries,
    };
  }
}

/// The proxy session for an Amazon Chime SDK Voice Connector.
class ProxySession {
  /// The proxy session capabilities.
  final List<Capability>? capabilities;

  /// The created time stamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The ended time stamp, in ISO 8601 format.
  final DateTime? endedTimestamp;

  /// The number of minutes allowed for the proxy session.
  final int? expiryMinutes;

  /// The preference for matching the country or area code of the proxy phone
  /// number with that of the first participant.
  final GeoMatchLevel? geoMatchLevel;

  /// The country and area code for the proxy phone number.
  final GeoMatchParams? geoMatchParams;

  /// The proxy session name.
  final String? name;

  /// The preference for proxy phone number reuse, or stickiness, between the same
  /// participants across sessions.
  final NumberSelectionBehavior? numberSelectionBehavior;

  /// The proxy session participants.
  final List<Participant>? participants;

  /// The proxy session ID.
  final String? proxySessionId;

  /// The proxy session status.
  final ProxySessionStatus? status;

  /// The updated time stamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  /// The Voice Connector ID.
  final String? voiceConnectorId;

  ProxySession({
    this.capabilities,
    this.createdTimestamp,
    this.endedTimestamp,
    this.expiryMinutes,
    this.geoMatchLevel,
    this.geoMatchParams,
    this.name,
    this.numberSelectionBehavior,
    this.participants,
    this.proxySessionId,
    this.status,
    this.updatedTimestamp,
    this.voiceConnectorId,
  });

  factory ProxySession.fromJson(Map<String, dynamic> json) {
    return ProxySession(
      capabilities: (json['Capabilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toCapability())
          .toList(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      endedTimestamp: timeStampFromJson(json['EndedTimestamp']),
      expiryMinutes: json['ExpiryMinutes'] as int?,
      geoMatchLevel: (json['GeoMatchLevel'] as String?)?.toGeoMatchLevel(),
      geoMatchParams: json['GeoMatchParams'] != null
          ? GeoMatchParams.fromJson(
              json['GeoMatchParams'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      numberSelectionBehavior: (json['NumberSelectionBehavior'] as String?)
          ?.toNumberSelectionBehavior(),
      participants: (json['Participants'] as List?)
          ?.whereNotNull()
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      proxySessionId: json['ProxySessionId'] as String?,
      status: (json['Status'] as String?)?.toProxySessionStatus(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceConnectorId: json['VoiceConnectorId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final createdTimestamp = this.createdTimestamp;
    final endedTimestamp = this.endedTimestamp;
    final expiryMinutes = this.expiryMinutes;
    final geoMatchLevel = this.geoMatchLevel;
    final geoMatchParams = this.geoMatchParams;
    final name = this.name;
    final numberSelectionBehavior = this.numberSelectionBehavior;
    final participants = this.participants;
    final proxySessionId = this.proxySessionId;
    final status = this.status;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceConnectorId = this.voiceConnectorId;
    return {
      if (capabilities != null)
        'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (endedTimestamp != null)
        'EndedTimestamp': iso8601ToJson(endedTimestamp),
      if (expiryMinutes != null) 'ExpiryMinutes': expiryMinutes,
      if (geoMatchLevel != null) 'GeoMatchLevel': geoMatchLevel.toValue(),
      if (geoMatchParams != null) 'GeoMatchParams': geoMatchParams,
      if (name != null) 'Name': name,
      if (numberSelectionBehavior != null)
        'NumberSelectionBehavior': numberSelectionBehavior.toValue(),
      if (participants != null) 'Participants': participants,
      if (proxySessionId != null) 'ProxySessionId': proxySessionId,
      if (status != null) 'Status': status.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceConnectorId != null) 'VoiceConnectorId': voiceConnectorId,
    };
  }
}

enum ProxySessionStatus {
  open,
  inProgress,
  closed,
}

extension ProxySessionStatusValueExtension on ProxySessionStatus {
  String toValue() {
    switch (this) {
      case ProxySessionStatus.open:
        return 'Open';
      case ProxySessionStatus.inProgress:
        return 'InProgress';
      case ProxySessionStatus.closed:
        return 'Closed';
    }
  }
}

extension ProxySessionStatusFromString on String {
  ProxySessionStatus toProxySessionStatus() {
    switch (this) {
      case 'Open':
        return ProxySessionStatus.open;
      case 'InProgress':
        return ProxySessionStatus.inProgress;
      case 'Closed':
        return ProxySessionStatus.closed;
    }
    throw Exception('$this is not known in enum ProxySessionStatus');
  }
}

class PutSipMediaApplicationAlexaSkillConfigurationResponse {
  /// Returns the Alexa Skill configuration.
  final SipMediaApplicationAlexaSkillConfiguration?
      sipMediaApplicationAlexaSkillConfiguration;

  PutSipMediaApplicationAlexaSkillConfigurationResponse({
    this.sipMediaApplicationAlexaSkillConfiguration,
  });

  factory PutSipMediaApplicationAlexaSkillConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutSipMediaApplicationAlexaSkillConfigurationResponse(
      sipMediaApplicationAlexaSkillConfiguration:
          json['SipMediaApplicationAlexaSkillConfiguration'] != null
              ? SipMediaApplicationAlexaSkillConfiguration.fromJson(
                  json['SipMediaApplicationAlexaSkillConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplicationAlexaSkillConfiguration =
        this.sipMediaApplicationAlexaSkillConfiguration;
    return {
      if (sipMediaApplicationAlexaSkillConfiguration != null)
        'SipMediaApplicationAlexaSkillConfiguration':
            sipMediaApplicationAlexaSkillConfiguration,
    };
  }
}

class PutSipMediaApplicationLoggingConfigurationResponse {
  /// The updated logging configuration for the specified SIP media application.
  final SipMediaApplicationLoggingConfiguration?
      sipMediaApplicationLoggingConfiguration;

  PutSipMediaApplicationLoggingConfigurationResponse({
    this.sipMediaApplicationLoggingConfiguration,
  });

  factory PutSipMediaApplicationLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutSipMediaApplicationLoggingConfigurationResponse(
      sipMediaApplicationLoggingConfiguration:
          json['SipMediaApplicationLoggingConfiguration'] != null
              ? SipMediaApplicationLoggingConfiguration.fromJson(
                  json['SipMediaApplicationLoggingConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplicationLoggingConfiguration =
        this.sipMediaApplicationLoggingConfiguration;
    return {
      if (sipMediaApplicationLoggingConfiguration != null)
        'SipMediaApplicationLoggingConfiguration':
            sipMediaApplicationLoggingConfiguration,
    };
  }
}

class PutVoiceConnectorEmergencyCallingConfigurationResponse {
  /// The updated configuration.
  final EmergencyCallingConfiguration? emergencyCallingConfiguration;

  PutVoiceConnectorEmergencyCallingConfigurationResponse({
    this.emergencyCallingConfiguration,
  });

  factory PutVoiceConnectorEmergencyCallingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutVoiceConnectorEmergencyCallingConfigurationResponse(
      emergencyCallingConfiguration:
          json['EmergencyCallingConfiguration'] != null
              ? EmergencyCallingConfiguration.fromJson(
                  json['EmergencyCallingConfiguration'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final emergencyCallingConfiguration = this.emergencyCallingConfiguration;
    return {
      if (emergencyCallingConfiguration != null)
        'EmergencyCallingConfiguration': emergencyCallingConfiguration,
    };
  }
}

class PutVoiceConnectorLoggingConfigurationResponse {
  /// The updated logging configuration.
  final LoggingConfiguration? loggingConfiguration;

  PutVoiceConnectorLoggingConfigurationResponse({
    this.loggingConfiguration,
  });

  factory PutVoiceConnectorLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutVoiceConnectorLoggingConfigurationResponse(
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfiguration = this.loggingConfiguration;
    return {
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
    };
  }
}

class PutVoiceConnectorOriginationResponse {
  /// The updated origination settings.
  final Origination? origination;

  PutVoiceConnectorOriginationResponse({
    this.origination,
  });

  factory PutVoiceConnectorOriginationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutVoiceConnectorOriginationResponse(
      origination: json['Origination'] != null
          ? Origination.fromJson(json['Origination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final origination = this.origination;
    return {
      if (origination != null) 'Origination': origination,
    };
  }
}

class PutVoiceConnectorProxyResponse {
  /// The proxy configuration details.
  final Proxy? proxy;

  PutVoiceConnectorProxyResponse({
    this.proxy,
  });

  factory PutVoiceConnectorProxyResponse.fromJson(Map<String, dynamic> json) {
    return PutVoiceConnectorProxyResponse(
      proxy: json['Proxy'] != null
          ? Proxy.fromJson(json['Proxy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxy = this.proxy;
    return {
      if (proxy != null) 'Proxy': proxy,
    };
  }
}

class PutVoiceConnectorStreamingConfigurationResponse {
  /// The updated streaming settings.
  final StreamingConfiguration? streamingConfiguration;

  PutVoiceConnectorStreamingConfigurationResponse({
    this.streamingConfiguration,
  });

  factory PutVoiceConnectorStreamingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutVoiceConnectorStreamingConfigurationResponse(
      streamingConfiguration: json['StreamingConfiguration'] != null
          ? StreamingConfiguration.fromJson(
              json['StreamingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingConfiguration = this.streamingConfiguration;
    return {
      if (streamingConfiguration != null)
        'StreamingConfiguration': streamingConfiguration,
    };
  }
}

class PutVoiceConnectorTerminationResponse {
  /// The updated termination settings.
  final Termination? termination;

  PutVoiceConnectorTerminationResponse({
    this.termination,
  });

  factory PutVoiceConnectorTerminationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutVoiceConnectorTerminationResponse(
      termination: json['Termination'] != null
          ? Termination.fromJson(json['Termination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final termination = this.termination;
    return {
      if (termination != null) 'Termination': termination,
    };
  }
}

class RestorePhoneNumberResponse {
  /// The restored phone number.
  final PhoneNumber? phoneNumber;

  RestorePhoneNumberResponse({
    this.phoneNumber,
  });

  factory RestorePhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return RestorePhoneNumberResponse(
      phoneNumber: json['PhoneNumber'] != null
          ? PhoneNumber.fromJson(json['PhoneNumber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

class SearchAvailablePhoneNumbersResponse {
  /// Confines a search to just the phone numbers in the E.164 format.
  final List<String>? e164PhoneNumbers;

  /// The token used to return the next page of results.
  final String? nextToken;

  SearchAvailablePhoneNumbersResponse({
    this.e164PhoneNumbers,
    this.nextToken,
  });

  factory SearchAvailablePhoneNumbersResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchAvailablePhoneNumbersResponse(
      e164PhoneNumbers: (json['E164PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final e164PhoneNumbers = this.e164PhoneNumbers;
    final nextToken = this.nextToken;
    return {
      if (e164PhoneNumbers != null) 'E164PhoneNumbers': e164PhoneNumbers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A structure that contains the configuration settings for server-side
/// encryption.
/// <note>
/// We only support symmetric keys. Do not use asymmetric or HMAC keys, or KMS
/// aliases.
/// </note>
class ServerSideEncryptionConfiguration {
  /// The ARN of the KMS key used to encrypt the enrollment data in a voice
  /// profile domain. Asymmetric customer managed keys are not supported.
  final String kmsKeyArn;

  ServerSideEncryptionConfiguration({
    required this.kmsKeyArn,
  });

  factory ServerSideEncryptionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServerSideEncryptionConfiguration(
      kmsKeyArn: json['KmsKeyArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'KmsKeyArn': kmsKeyArn,
    };
  }
}

/// The details of the SIP media application, including name and endpoints. An
/// AWS account can have multiple SIP media applications.
class SipMediaApplication {
  /// The AWS Region in which the SIP media application is created.
  final String? awsRegion;

  /// The SIP media application creation timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// List of endpoints for a SIP media application. Currently, only one endpoint
  /// per SIP media application is permitted.
  final List<SipMediaApplicationEndpoint>? endpoints;

  /// The SIP media application's name.
  final String? name;

  /// The ARN of the SIP media application.
  final String? sipMediaApplicationArn;

  /// A SIP media application's ID.
  final String? sipMediaApplicationId;

  /// The time at which the SIP media application was updated.
  final DateTime? updatedTimestamp;

  SipMediaApplication({
    this.awsRegion,
    this.createdTimestamp,
    this.endpoints,
    this.name,
    this.sipMediaApplicationArn,
    this.sipMediaApplicationId,
    this.updatedTimestamp,
  });

  factory SipMediaApplication.fromJson(Map<String, dynamic> json) {
    return SipMediaApplication(
      awsRegion: json['AwsRegion'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      endpoints: (json['Endpoints'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SipMediaApplicationEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      sipMediaApplicationArn: json['SipMediaApplicationArn'] as String?,
      sipMediaApplicationId: json['SipMediaApplicationId'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final createdTimestamp = this.createdTimestamp;
    final endpoints = this.endpoints;
    final name = this.name;
    final sipMediaApplicationArn = this.sipMediaApplicationArn;
    final sipMediaApplicationId = this.sipMediaApplicationId;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (endpoints != null) 'Endpoints': endpoints,
      if (name != null) 'Name': name,
      if (sipMediaApplicationArn != null)
        'SipMediaApplicationArn': sipMediaApplicationArn,
      if (sipMediaApplicationId != null)
        'SipMediaApplicationId': sipMediaApplicationId,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// The Alexa Skill configuration of a SIP media application.
/// <important>
/// Due to changes made by the Amazon Alexa service, this data type is no longer
/// available for use. For more information, refer to the <a
/// href="https://developer.amazon.com/en-US/alexa/alexasmartproperties">Alexa
/// Smart Properties</a> page.
/// </important>
class SipMediaApplicationAlexaSkillConfiguration {
  /// The ID of the Alexa Skill configuration.
  final List<String> alexaSkillIds;

  /// The status of the Alexa Skill configuration.
  final AlexaSkillStatus alexaSkillStatus;

  SipMediaApplicationAlexaSkillConfiguration({
    required this.alexaSkillIds,
    required this.alexaSkillStatus,
  });

  factory SipMediaApplicationAlexaSkillConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SipMediaApplicationAlexaSkillConfiguration(
      alexaSkillIds: (json['AlexaSkillIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      alexaSkillStatus:
          (json['AlexaSkillStatus'] as String).toAlexaSkillStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final alexaSkillIds = this.alexaSkillIds;
    final alexaSkillStatus = this.alexaSkillStatus;
    return {
      'AlexaSkillIds': alexaSkillIds,
      'AlexaSkillStatus': alexaSkillStatus.toValue(),
    };
  }
}

/// A <code>Call</code> instance for a SIP media application.
class SipMediaApplicationCall {
  /// The call's transaction ID.
  final String? transactionId;

  SipMediaApplicationCall({
    this.transactionId,
  });

  factory SipMediaApplicationCall.fromJson(Map<String, dynamic> json) {
    return SipMediaApplicationCall(
      transactionId: json['TransactionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transactionId = this.transactionId;
    return {
      if (transactionId != null) 'TransactionId': transactionId,
    };
  }
}

/// The endpoint assigned to a SIP media application.
class SipMediaApplicationEndpoint {
  /// Valid Amazon Resource Name (ARN) of the Lambda function, version, or alias.
  /// The function must be created in the same AWS Region as the SIP media
  /// application.
  final String? lambdaArn;

  SipMediaApplicationEndpoint({
    this.lambdaArn,
  });

  factory SipMediaApplicationEndpoint.fromJson(Map<String, dynamic> json) {
    return SipMediaApplicationEndpoint(
      lambdaArn: json['LambdaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    return {
      if (lambdaArn != null) 'LambdaArn': lambdaArn,
    };
  }
}

/// The logging configuration of a SIP media application.
class SipMediaApplicationLoggingConfiguration {
  /// Enables message logging for the specified SIP media application.
  final bool? enableSipMediaApplicationMessageLogs;

  SipMediaApplicationLoggingConfiguration({
    this.enableSipMediaApplicationMessageLogs,
  });

  factory SipMediaApplicationLoggingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SipMediaApplicationLoggingConfiguration(
      enableSipMediaApplicationMessageLogs:
          json['EnableSipMediaApplicationMessageLogs'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableSipMediaApplicationMessageLogs =
        this.enableSipMediaApplicationMessageLogs;
    return {
      if (enableSipMediaApplicationMessageLogs != null)
        'EnableSipMediaApplicationMessageLogs':
            enableSipMediaApplicationMessageLogs,
    };
  }
}

/// The details of a SIP rule, including name, triggers, and target
/// applications. An AWS account can have multiple SIP rules.
class SipRule {
  /// The time at which the SIP rule was created, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// Indicates whether the SIP rule is enabled or disabled. You must disable a
  /// rule before you can delete it.
  final bool? disabled;

  /// A SIP rule's name.
  final String? name;

  /// A SIP rule's ID.
  final String? sipRuleId;

  /// The target SIP media application and other details, such as priority and AWS
  /// Region, to be specified in the SIP rule. Only one SIP rule per AWS Region
  /// can be provided.
  final List<SipRuleTargetApplication>? targetApplications;

  /// The type of trigger set for a SIP rule, either a phone number or a URI
  /// request host name.
  final SipRuleTriggerType? triggerType;

  /// The value set for a SIP rule's trigger type. Either a phone number or a URI
  /// hostname.
  final String? triggerValue;

  /// The time at which the SIP rule was updated, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  SipRule({
    this.createdTimestamp,
    this.disabled,
    this.name,
    this.sipRuleId,
    this.targetApplications,
    this.triggerType,
    this.triggerValue,
    this.updatedTimestamp,
  });

  factory SipRule.fromJson(Map<String, dynamic> json) {
    return SipRule(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      disabled: json['Disabled'] as bool?,
      name: json['Name'] as String?,
      sipRuleId: json['SipRuleId'] as String?,
      targetApplications: (json['TargetApplications'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SipRuleTargetApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      triggerType: (json['TriggerType'] as String?)?.toSipRuleTriggerType(),
      triggerValue: json['TriggerValue'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final disabled = this.disabled;
    final name = this.name;
    final sipRuleId = this.sipRuleId;
    final targetApplications = this.targetApplications;
    final triggerType = this.triggerType;
    final triggerValue = this.triggerValue;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (disabled != null) 'Disabled': disabled,
      if (name != null) 'Name': name,
      if (sipRuleId != null) 'SipRuleId': sipRuleId,
      if (targetApplications != null) 'TargetApplications': targetApplications,
      if (triggerType != null) 'TriggerType': triggerType.toValue(),
      if (triggerValue != null) 'TriggerValue': triggerValue,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// A target SIP media application and other details, such as priority and AWS
/// Region, to be specified in the SIP rule. Only one SIP rule per AWS Region
/// can be provided.
class SipRuleTargetApplication {
  /// The AWS Region of a rule's target SIP media application.
  final String? awsRegion;

  /// The priority setting of a rule's target SIP media application.
  final int? priority;

  /// The ID of a rule's target SIP media application.
  final String? sipMediaApplicationId;

  SipRuleTargetApplication({
    this.awsRegion,
    this.priority,
    this.sipMediaApplicationId,
  });

  factory SipRuleTargetApplication.fromJson(Map<String, dynamic> json) {
    return SipRuleTargetApplication(
      awsRegion: json['AwsRegion'] as String?,
      priority: json['Priority'] as int?,
      sipMediaApplicationId: json['SipMediaApplicationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final priority = this.priority;
    final sipMediaApplicationId = this.sipMediaApplicationId;
    return {
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (priority != null) 'Priority': priority,
      if (sipMediaApplicationId != null)
        'SipMediaApplicationId': sipMediaApplicationId,
    };
  }
}

enum SipRuleTriggerType {
  toPhoneNumber,
  requestUriHostname,
}

extension SipRuleTriggerTypeValueExtension on SipRuleTriggerType {
  String toValue() {
    switch (this) {
      case SipRuleTriggerType.toPhoneNumber:
        return 'ToPhoneNumber';
      case SipRuleTriggerType.requestUriHostname:
        return 'RequestUriHostname';
    }
  }
}

extension SipRuleTriggerTypeFromString on String {
  SipRuleTriggerType toSipRuleTriggerType() {
    switch (this) {
      case 'ToPhoneNumber':
        return SipRuleTriggerType.toPhoneNumber;
      case 'RequestUriHostname':
        return SipRuleTriggerType.requestUriHostname;
    }
    throw Exception('$this is not known in enum SipRuleTriggerType');
  }
}

/// The details of a speaker search task.
class SpeakerSearchDetails {
  /// The result value in the speaker search details.
  final List<SpeakerSearchResult>? results;

  /// The status of a voice print generation operation,
  /// <code>VoiceprintGenerationSuccess</code> or
  /// <code>VoiceprintGenerationFailure</code>..
  final String? voiceprintGenerationStatus;

  SpeakerSearchDetails({
    this.results,
    this.voiceprintGenerationStatus,
  });

  factory SpeakerSearchDetails.fromJson(Map<String, dynamic> json) {
    return SpeakerSearchDetails(
      results: (json['Results'] as List?)
          ?.whereNotNull()
          .map((e) => SpeakerSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      voiceprintGenerationStatus: json['VoiceprintGenerationStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final voiceprintGenerationStatus = this.voiceprintGenerationStatus;
    return {
      if (results != null) 'Results': results,
      if (voiceprintGenerationStatus != null)
        'VoiceprintGenerationStatus': voiceprintGenerationStatus,
    };
  }
}

/// The result of a speaker search analysis.
class SpeakerSearchResult {
  /// The confidence score in the speaker search analysis.
  final double? confidenceScore;

  /// The voice profile ID.
  final String? voiceProfileId;

  SpeakerSearchResult({
    this.confidenceScore,
    this.voiceProfileId,
  });

  factory SpeakerSearchResult.fromJson(Map<String, dynamic> json) {
    return SpeakerSearchResult(
      confidenceScore: json['ConfidenceScore'] as double?,
      voiceProfileId: json['VoiceProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidenceScore = this.confidenceScore;
    final voiceProfileId = this.voiceProfileId;
    return {
      if (confidenceScore != null) 'ConfidenceScore': confidenceScore,
      if (voiceProfileId != null) 'VoiceProfileId': voiceProfileId,
    };
  }
}

/// A representation of an asynchronous request to perform speaker search
/// analysis on a Voice Connector call.
class SpeakerSearchTask {
  /// The call details of a speaker search task.
  final CallDetails? callDetails;

  /// The time at which a speaker search task was created.
  final DateTime? createdTimestamp;

  /// The details of a speaker search task.
  final SpeakerSearchDetails? speakerSearchDetails;

  /// The speaker search task ID.
  final String? speakerSearchTaskId;

  /// The status of the speaker search task, <code>IN_QUEUE</code>,
  /// <code>IN_PROGRESS</code>, <code>PARTIAL_SUCCESS</code>,
  /// <code>SUCCEEDED</code>, <code>FAILED</code>, or <code>STOPPED</code>.
  final String? speakerSearchTaskStatus;

  /// The time at which the speaker search task began.
  final DateTime? startedTimestamp;

  /// A detailed message about the status of a speaker search.
  final String? statusMessage;

  /// The time at which a speaker search task was updated.
  final DateTime? updatedTimestamp;

  SpeakerSearchTask({
    this.callDetails,
    this.createdTimestamp,
    this.speakerSearchDetails,
    this.speakerSearchTaskId,
    this.speakerSearchTaskStatus,
    this.startedTimestamp,
    this.statusMessage,
    this.updatedTimestamp,
  });

  factory SpeakerSearchTask.fromJson(Map<String, dynamic> json) {
    return SpeakerSearchTask(
      callDetails: json['CallDetails'] != null
          ? CallDetails.fromJson(json['CallDetails'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      speakerSearchDetails: json['SpeakerSearchDetails'] != null
          ? SpeakerSearchDetails.fromJson(
              json['SpeakerSearchDetails'] as Map<String, dynamic>)
          : null,
      speakerSearchTaskId: json['SpeakerSearchTaskId'] as String?,
      speakerSearchTaskStatus: json['SpeakerSearchTaskStatus'] as String?,
      startedTimestamp: timeStampFromJson(json['StartedTimestamp']),
      statusMessage: json['StatusMessage'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final callDetails = this.callDetails;
    final createdTimestamp = this.createdTimestamp;
    final speakerSearchDetails = this.speakerSearchDetails;
    final speakerSearchTaskId = this.speakerSearchTaskId;
    final speakerSearchTaskStatus = this.speakerSearchTaskStatus;
    final startedTimestamp = this.startedTimestamp;
    final statusMessage = this.statusMessage;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (callDetails != null) 'CallDetails': callDetails,
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (speakerSearchDetails != null)
        'SpeakerSearchDetails': speakerSearchDetails,
      if (speakerSearchTaskId != null)
        'SpeakerSearchTaskId': speakerSearchTaskId,
      if (speakerSearchTaskStatus != null)
        'SpeakerSearchTaskStatus': speakerSearchTaskStatus,
      if (startedTimestamp != null)
        'StartedTimestamp': iso8601ToJson(startedTimestamp),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

class StartSpeakerSearchTaskResponse {
  /// The details of the speaker search task.
  final SpeakerSearchTask? speakerSearchTask;

  StartSpeakerSearchTaskResponse({
    this.speakerSearchTask,
  });

  factory StartSpeakerSearchTaskResponse.fromJson(Map<String, dynamic> json) {
    return StartSpeakerSearchTaskResponse(
      speakerSearchTask: json['SpeakerSearchTask'] != null
          ? SpeakerSearchTask.fromJson(
              json['SpeakerSearchTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final speakerSearchTask = this.speakerSearchTask;
    return {
      if (speakerSearchTask != null) 'SpeakerSearchTask': speakerSearchTask,
    };
  }
}

class StartVoiceToneAnalysisTaskResponse {
  /// The details of the voice tone analysis task.
  final VoiceToneAnalysisTask? voiceToneAnalysisTask;

  StartVoiceToneAnalysisTaskResponse({
    this.voiceToneAnalysisTask,
  });

  factory StartVoiceToneAnalysisTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return StartVoiceToneAnalysisTaskResponse(
      voiceToneAnalysisTask: json['VoiceToneAnalysisTask'] != null
          ? VoiceToneAnalysisTask.fromJson(
              json['VoiceToneAnalysisTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceToneAnalysisTask = this.voiceToneAnalysisTask;
    return {
      if (voiceToneAnalysisTask != null)
        'VoiceToneAnalysisTask': voiceToneAnalysisTask,
    };
  }
}

/// The streaming configuration associated with an Amazon Chime SDK Voice
/// Connector. Specifies whether media streaming is enabled for sending to
/// Amazon Kinesis, and shows the retention period for the Amazon Kinesis data,
/// in hours.
class StreamingConfiguration {
  /// The amount of time, in hours, to the Kinesis data.
  final int dataRetentionInHours;

  /// When true, streaming to Kinesis is off.
  final bool disabled;

  /// The call analytics configuration.
  final MediaInsightsConfiguration? mediaInsightsConfiguration;

  /// The streaming notification targets.
  final List<StreamingNotificationTarget>? streamingNotificationTargets;

  StreamingConfiguration({
    required this.dataRetentionInHours,
    required this.disabled,
    this.mediaInsightsConfiguration,
    this.streamingNotificationTargets,
  });

  factory StreamingConfiguration.fromJson(Map<String, dynamic> json) {
    return StreamingConfiguration(
      dataRetentionInHours: json['DataRetentionInHours'] as int,
      disabled: json['Disabled'] as bool,
      mediaInsightsConfiguration: json['MediaInsightsConfiguration'] != null
          ? MediaInsightsConfiguration.fromJson(
              json['MediaInsightsConfiguration'] as Map<String, dynamic>)
          : null,
      streamingNotificationTargets: (json['StreamingNotificationTargets']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              StreamingNotificationTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataRetentionInHours = this.dataRetentionInHours;
    final disabled = this.disabled;
    final mediaInsightsConfiguration = this.mediaInsightsConfiguration;
    final streamingNotificationTargets = this.streamingNotificationTargets;
    return {
      'DataRetentionInHours': dataRetentionInHours,
      'Disabled': disabled,
      if (mediaInsightsConfiguration != null)
        'MediaInsightsConfiguration': mediaInsightsConfiguration,
      if (streamingNotificationTargets != null)
        'StreamingNotificationTargets': streamingNotificationTargets,
    };
  }
}

/// The target recipient for a streaming configuration notification.
class StreamingNotificationTarget {
  /// The streaming notification target.
  final NotificationTarget? notificationTarget;

  StreamingNotificationTarget({
    this.notificationTarget,
  });

  factory StreamingNotificationTarget.fromJson(Map<String, dynamic> json) {
    return StreamingNotificationTarget(
      notificationTarget:
          (json['NotificationTarget'] as String?)?.toNotificationTarget(),
    );
  }

  Map<String, dynamic> toJson() {
    final notificationTarget = this.notificationTarget;
    return {
      if (notificationTarget != null)
        'NotificationTarget': notificationTarget.toValue(),
    };
  }
}

/// Describes a tag applied to a resource.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
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

/// Termination settings enable SIP hosts to make outbound calls using an Amazon
/// Chime SDK Voice Connector.
class Termination {
  /// The countries to which calls are allowed, in ISO 3166-1 alpha-2 format.
  /// Required.
  final List<String>? callingRegions;

  /// The IP addresses allowed to make calls, in CIDR format.
  final List<String>? cidrAllowedList;

  /// The limit on calls per second. Max value based on account service quota.
  /// Default value of 1.
  final int? cpsLimit;

  /// The default outbound calling number.
  final String? defaultPhoneNumber;

  /// When termination is disabled, outbound calls cannot be made.
  final bool? disabled;

  Termination({
    this.callingRegions,
    this.cidrAllowedList,
    this.cpsLimit,
    this.defaultPhoneNumber,
    this.disabled,
  });

  factory Termination.fromJson(Map<String, dynamic> json) {
    return Termination(
      callingRegions: (json['CallingRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cidrAllowedList: (json['CidrAllowedList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cpsLimit: json['CpsLimit'] as int?,
      defaultPhoneNumber: json['DefaultPhoneNumber'] as String?,
      disabled: json['Disabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final callingRegions = this.callingRegions;
    final cidrAllowedList = this.cidrAllowedList;
    final cpsLimit = this.cpsLimit;
    final defaultPhoneNumber = this.defaultPhoneNumber;
    final disabled = this.disabled;
    return {
      if (callingRegions != null) 'CallingRegions': callingRegions,
      if (cidrAllowedList != null) 'CidrAllowedList': cidrAllowedList,
      if (cpsLimit != null) 'CpsLimit': cpsLimit,
      if (defaultPhoneNumber != null) 'DefaultPhoneNumber': defaultPhoneNumber,
      if (disabled != null) 'Disabled': disabled,
    };
  }
}

/// The termination health details, including the source IP address and
/// timestamp of the last successful <code>SIP OPTIONS</code> message from your
/// SIP infrastructure.
class TerminationHealth {
  /// The source IP address.
  final String? source;

  /// The timestamp, in ISO 8601 format.
  final DateTime? timestamp;

  TerminationHealth({
    this.source,
    this.timestamp,
  });

  factory TerminationHealth.fromJson(Map<String, dynamic> json) {
    return TerminationHealth(
      source: json['Source'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final timestamp = this.timestamp;
    return {
      if (source != null) 'Source': source,
      if (timestamp != null) 'Timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// The phone number ID, product type, or calling name fields to update, used
/// with the <a>BatchUpdatePhoneNumber</a> and <a>UpdatePhoneNumber</a> actions.
class UpdatePhoneNumberRequestItem {
  /// The phone number ID to update.
  final String phoneNumberId;

  /// The outbound calling name to update.
  final String? callingName;

  /// The name of the phone number.
  final String? name;

  /// The product type to update.
  final PhoneNumberProductType? productType;

  UpdatePhoneNumberRequestItem({
    required this.phoneNumberId,
    this.callingName,
    this.name,
    this.productType,
  });

  Map<String, dynamic> toJson() {
    final phoneNumberId = this.phoneNumberId;
    final callingName = this.callingName;
    final name = this.name;
    final productType = this.productType;
    return {
      'PhoneNumberId': phoneNumberId,
      if (callingName != null) 'CallingName': callingName,
      if (name != null) 'Name': name,
      if (productType != null) 'ProductType': productType.toValue(),
    };
  }
}

class UpdatePhoneNumberResponse {
  /// The updated phone number details.
  final PhoneNumber? phoneNumber;

  UpdatePhoneNumberResponse({
    this.phoneNumber,
  });

  factory UpdatePhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePhoneNumberResponse(
      phoneNumber: json['PhoneNumber'] != null
          ? PhoneNumber.fromJson(json['PhoneNumber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

class UpdateProxySessionResponse {
  /// The updated proxy session details.
  final ProxySession? proxySession;

  UpdateProxySessionResponse({
    this.proxySession,
  });

  factory UpdateProxySessionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProxySessionResponse(
      proxySession: json['ProxySession'] != null
          ? ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxySession = this.proxySession;
    return {
      if (proxySession != null) 'ProxySession': proxySession,
    };
  }
}

class UpdateSipMediaApplicationCallResponse {
  /// A <code>Call</code> instance for a SIP media application.
  final SipMediaApplicationCall? sipMediaApplicationCall;

  UpdateSipMediaApplicationCallResponse({
    this.sipMediaApplicationCall,
  });

  factory UpdateSipMediaApplicationCallResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSipMediaApplicationCallResponse(
      sipMediaApplicationCall: json['SipMediaApplicationCall'] != null
          ? SipMediaApplicationCall.fromJson(
              json['SipMediaApplicationCall'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplicationCall = this.sipMediaApplicationCall;
    return {
      if (sipMediaApplicationCall != null)
        'SipMediaApplicationCall': sipMediaApplicationCall,
    };
  }
}

class UpdateSipMediaApplicationResponse {
  /// The updated SIP media application’s details.
  final SipMediaApplication? sipMediaApplication;

  UpdateSipMediaApplicationResponse({
    this.sipMediaApplication,
  });

  factory UpdateSipMediaApplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSipMediaApplicationResponse(
      sipMediaApplication: json['SipMediaApplication'] != null
          ? SipMediaApplication.fromJson(
              json['SipMediaApplication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplication = this.sipMediaApplication;
    return {
      if (sipMediaApplication != null)
        'SipMediaApplication': sipMediaApplication,
    };
  }
}

class UpdateSipRuleResponse {
  /// The updated SIP rule details.
  final SipRule? sipRule;

  UpdateSipRuleResponse({
    this.sipRule,
  });

  factory UpdateSipRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSipRuleResponse(
      sipRule: json['SipRule'] != null
          ? SipRule.fromJson(json['SipRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipRule = this.sipRule;
    return {
      if (sipRule != null) 'SipRule': sipRule,
    };
  }
}

class UpdateVoiceConnectorGroupResponse {
  /// The updated Voice Connector group.
  final VoiceConnectorGroup? voiceConnectorGroup;

  UpdateVoiceConnectorGroupResponse({
    this.voiceConnectorGroup,
  });

  factory UpdateVoiceConnectorGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateVoiceConnectorGroupResponse(
      voiceConnectorGroup: json['VoiceConnectorGroup'] != null
          ? VoiceConnectorGroup.fromJson(
              json['VoiceConnectorGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnectorGroup = this.voiceConnectorGroup;
    return {
      if (voiceConnectorGroup != null)
        'VoiceConnectorGroup': voiceConnectorGroup,
    };
  }
}

class UpdateVoiceConnectorResponse {
  /// The updated Voice Connector details.
  final VoiceConnector? voiceConnector;

  UpdateVoiceConnectorResponse({
    this.voiceConnector,
  });

  factory UpdateVoiceConnectorResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVoiceConnectorResponse(
      voiceConnector: json['VoiceConnector'] != null
          ? VoiceConnector.fromJson(
              json['VoiceConnector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnector = this.voiceConnector;
    return {
      if (voiceConnector != null) 'VoiceConnector': voiceConnector,
    };
  }
}

class UpdateVoiceProfileDomainResponse {
  /// The updated details of the voice profile domain.
  final VoiceProfileDomain? voiceProfileDomain;

  UpdateVoiceProfileDomainResponse({
    this.voiceProfileDomain,
  });

  factory UpdateVoiceProfileDomainResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVoiceProfileDomainResponse(
      voiceProfileDomain: json['VoiceProfileDomain'] != null
          ? VoiceProfileDomain.fromJson(
              json['VoiceProfileDomain'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceProfileDomain = this.voiceProfileDomain;
    return {
      if (voiceProfileDomain != null) 'VoiceProfileDomain': voiceProfileDomain,
    };
  }
}

class UpdateVoiceProfileResponse {
  /// The updated voice profile settings.
  final VoiceProfile? voiceProfile;

  UpdateVoiceProfileResponse({
    this.voiceProfile,
  });

  factory UpdateVoiceProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVoiceProfileResponse(
      voiceProfile: json['VoiceProfile'] != null
          ? VoiceProfile.fromJson(json['VoiceProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceProfile = this.voiceProfile;
    return {
      if (voiceProfile != null) 'VoiceProfile': voiceProfile,
    };
  }
}

class ValidateE911AddressResponse {
  /// The validated address.
  final Address? address;

  /// The ID that represents the address.
  final String? addressExternalId;

  /// The list of address suggestions..
  final List<CandidateAddress>? candidateAddressList;

  /// Number indicating the result of address validation. <code>0</code> means the
  /// address was perfect as-is and successfully validated. <code>1</code> means
  /// the address was corrected. <code>2</code> means the address sent was not
  /// close enough and was not validated.
  final int? validationResult;

  ValidateE911AddressResponse({
    this.address,
    this.addressExternalId,
    this.candidateAddressList,
    this.validationResult,
  });

  factory ValidateE911AddressResponse.fromJson(Map<String, dynamic> json) {
    return ValidateE911AddressResponse(
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      addressExternalId: json['AddressExternalId'] as String?,
      candidateAddressList: (json['CandidateAddressList'] as List?)
          ?.whereNotNull()
          .map((e) => CandidateAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      validationResult: json['ValidationResult'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final addressExternalId = this.addressExternalId;
    final candidateAddressList = this.candidateAddressList;
    final validationResult = this.validationResult;
    return {
      if (address != null) 'Address': address,
      if (addressExternalId != null) 'AddressExternalId': addressExternalId,
      if (candidateAddressList != null)
        'CandidateAddressList': candidateAddressList,
      if (validationResult != null) 'ValidationResult': validationResult,
    };
  }
}

/// The Amazon Chime SDK Voice Connector configuration, including outbound host
/// name and encryption settings.
class VoiceConnector {
  /// The AWS Region in which the Voice Connector is created. Default: us-east-1.
  final VoiceConnectorAwsRegion? awsRegion;

  /// The Voice Connector's creation timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The Voice Connector's name.
  final String? name;

  /// The outbound host name for the Voice Connector.
  final String? outboundHostName;

  /// Enables or disables encryption for the Voice Connector.
  final bool? requireEncryption;

  /// The Voice Connector's updated timestamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  /// The ARN of the Voice Connector.
  final String? voiceConnectorArn;

  /// The Voice Connector's ID.
  final String? voiceConnectorId;

  VoiceConnector({
    this.awsRegion,
    this.createdTimestamp,
    this.name,
    this.outboundHostName,
    this.requireEncryption,
    this.updatedTimestamp,
    this.voiceConnectorArn,
    this.voiceConnectorId,
  });

  factory VoiceConnector.fromJson(Map<String, dynamic> json) {
    return VoiceConnector(
      awsRegion: (json['AwsRegion'] as String?)?.toVoiceConnectorAwsRegion(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      name: json['Name'] as String?,
      outboundHostName: json['OutboundHostName'] as String?,
      requireEncryption: json['RequireEncryption'] as bool?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceConnectorArn: json['VoiceConnectorArn'] as String?,
      voiceConnectorId: json['VoiceConnectorId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final createdTimestamp = this.createdTimestamp;
    final name = this.name;
    final outboundHostName = this.outboundHostName;
    final requireEncryption = this.requireEncryption;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceConnectorArn = this.voiceConnectorArn;
    final voiceConnectorId = this.voiceConnectorId;
    return {
      if (awsRegion != null) 'AwsRegion': awsRegion.toValue(),
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (name != null) 'Name': name,
      if (outboundHostName != null) 'OutboundHostName': outboundHostName,
      if (requireEncryption != null) 'RequireEncryption': requireEncryption,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceConnectorArn != null) 'VoiceConnectorArn': voiceConnectorArn,
      if (voiceConnectorId != null) 'VoiceConnectorId': voiceConnectorId,
    };
  }
}

enum VoiceConnectorAwsRegion {
  usEast_1,
  usWest_2,
  caCentral_1,
  euCentral_1,
  euWest_1,
  euWest_2,
  apNortheast_2,
  apNortheast_1,
  apSoutheast_1,
  apSoutheast_2,
}

extension VoiceConnectorAwsRegionValueExtension on VoiceConnectorAwsRegion {
  String toValue() {
    switch (this) {
      case VoiceConnectorAwsRegion.usEast_1:
        return 'us-east-1';
      case VoiceConnectorAwsRegion.usWest_2:
        return 'us-west-2';
      case VoiceConnectorAwsRegion.caCentral_1:
        return 'ca-central-1';
      case VoiceConnectorAwsRegion.euCentral_1:
        return 'eu-central-1';
      case VoiceConnectorAwsRegion.euWest_1:
        return 'eu-west-1';
      case VoiceConnectorAwsRegion.euWest_2:
        return 'eu-west-2';
      case VoiceConnectorAwsRegion.apNortheast_2:
        return 'ap-northeast-2';
      case VoiceConnectorAwsRegion.apNortheast_1:
        return 'ap-northeast-1';
      case VoiceConnectorAwsRegion.apSoutheast_1:
        return 'ap-southeast-1';
      case VoiceConnectorAwsRegion.apSoutheast_2:
        return 'ap-southeast-2';
    }
  }
}

extension VoiceConnectorAwsRegionFromString on String {
  VoiceConnectorAwsRegion toVoiceConnectorAwsRegion() {
    switch (this) {
      case 'us-east-1':
        return VoiceConnectorAwsRegion.usEast_1;
      case 'us-west-2':
        return VoiceConnectorAwsRegion.usWest_2;
      case 'ca-central-1':
        return VoiceConnectorAwsRegion.caCentral_1;
      case 'eu-central-1':
        return VoiceConnectorAwsRegion.euCentral_1;
      case 'eu-west-1':
        return VoiceConnectorAwsRegion.euWest_1;
      case 'eu-west-2':
        return VoiceConnectorAwsRegion.euWest_2;
      case 'ap-northeast-2':
        return VoiceConnectorAwsRegion.apNortheast_2;
      case 'ap-northeast-1':
        return VoiceConnectorAwsRegion.apNortheast_1;
      case 'ap-southeast-1':
        return VoiceConnectorAwsRegion.apSoutheast_1;
      case 'ap-southeast-2':
        return VoiceConnectorAwsRegion.apSoutheast_2;
    }
    throw Exception('$this is not known in enum VoiceConnectorAwsRegion');
  }
}

/// The Amazon Chime SDK Voice Connector group configuration, including
/// associated Voice Connectors. You can include Voice Connectors from different
/// AWS Regions in a group. This creates a fault tolerant mechanism for fallback
/// in case of availability events.
class VoiceConnectorGroup {
  /// The Voice Connector group's creation time stamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The name of a Voice Connector group.
  final String? name;

  /// The Voice Connector group's creation time stamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  /// The ARN of the Voice Connector group.
  final String? voiceConnectorGroupArn;

  /// The ID of a Voice Connector group.
  final String? voiceConnectorGroupId;

  /// The Voice Connectors to which you route inbound calls.
  final List<VoiceConnectorItem>? voiceConnectorItems;

  VoiceConnectorGroup({
    this.createdTimestamp,
    this.name,
    this.updatedTimestamp,
    this.voiceConnectorGroupArn,
    this.voiceConnectorGroupId,
    this.voiceConnectorItems,
  });

  factory VoiceConnectorGroup.fromJson(Map<String, dynamic> json) {
    return VoiceConnectorGroup(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      name: json['Name'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceConnectorGroupArn: json['VoiceConnectorGroupArn'] as String?,
      voiceConnectorGroupId: json['VoiceConnectorGroupId'] as String?,
      voiceConnectorItems: (json['VoiceConnectorItems'] as List?)
          ?.whereNotNull()
          .map((e) => VoiceConnectorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final name = this.name;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceConnectorGroupArn = this.voiceConnectorGroupArn;
    final voiceConnectorGroupId = this.voiceConnectorGroupId;
    final voiceConnectorItems = this.voiceConnectorItems;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (name != null) 'Name': name,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceConnectorGroupArn != null)
        'VoiceConnectorGroupArn': voiceConnectorGroupArn,
      if (voiceConnectorGroupId != null)
        'VoiceConnectorGroupId': voiceConnectorGroupId,
      if (voiceConnectorItems != null)
        'VoiceConnectorItems': voiceConnectorItems,
    };
  }
}

/// For Amazon Chime SDK Voice Connector groups, the Amazon Chime SDK Voice
/// Connectors to which you route inbound calls. Includes priority configuration
/// settings. Limit: 3 VoiceConnectorItems per Voice Connector group.
class VoiceConnectorItem {
  /// The priority setting of a Voice Connector item. Calls are routed to hosts in
  /// priority order, with 1 as the highest priority. When hosts have equal
  /// priority, the system distributes calls among them based on their relative
  /// weight.
  final int priority;

  /// The Voice Connector ID.
  final String voiceConnectorId;

  VoiceConnectorItem({
    required this.priority,
    required this.voiceConnectorId,
  });

  factory VoiceConnectorItem.fromJson(Map<String, dynamic> json) {
    return VoiceConnectorItem(
      priority: json['Priority'] as int,
      voiceConnectorId: json['VoiceConnectorId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final voiceConnectorId = this.voiceConnectorId;
    return {
      'Priority': priority,
      'VoiceConnectorId': voiceConnectorId,
    };
  }
}

/// The Amazon Chime SDK Voice Connector settings. Includes any Amazon S3
/// buckets designated for storing call detail records.
class VoiceConnectorSettings {
  /// The S3 bucket that stores the Voice Connector's call detail records.
  final String? cdrBucket;

  VoiceConnectorSettings({
    this.cdrBucket,
  });

  factory VoiceConnectorSettings.fromJson(Map<String, dynamic> json) {
    return VoiceConnectorSettings(
      cdrBucket: json['CdrBucket'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cdrBucket = this.cdrBucket;
    return {
      if (cdrBucket != null) 'CdrBucket': cdrBucket,
    };
  }
}

/// The combination of a voice print and caller ID.
class VoiceProfile {
  /// The time at which the voice profile was created and enrolled.
  final DateTime? createdTimestamp;

  /// The time at which a voice profile expires unless you re-enroll the caller
  /// via the <code>UpdateVoiceProfile</code> API.
  final DateTime? expirationTimestamp;

  /// The time at which the voice profile was last updated.
  final DateTime? updatedTimestamp;

  /// The ARN of the voice profile.
  final String? voiceProfileArn;

  /// The ID of the domain that contains the voice profile.
  final String? voiceProfileDomainId;

  /// The ID of the voice profile.
  final String? voiceProfileId;

  VoiceProfile({
    this.createdTimestamp,
    this.expirationTimestamp,
    this.updatedTimestamp,
    this.voiceProfileArn,
    this.voiceProfileDomainId,
    this.voiceProfileId,
  });

  factory VoiceProfile.fromJson(Map<String, dynamic> json) {
    return VoiceProfile(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      expirationTimestamp: timeStampFromJson(json['ExpirationTimestamp']),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceProfileArn: json['VoiceProfileArn'] as String?,
      voiceProfileDomainId: json['VoiceProfileDomainId'] as String?,
      voiceProfileId: json['VoiceProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final expirationTimestamp = this.expirationTimestamp;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceProfileArn = this.voiceProfileArn;
    final voiceProfileDomainId = this.voiceProfileDomainId;
    final voiceProfileId = this.voiceProfileId;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (expirationTimestamp != null)
        'ExpirationTimestamp': iso8601ToJson(expirationTimestamp),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceProfileArn != null) 'VoiceProfileArn': voiceProfileArn,
      if (voiceProfileDomainId != null)
        'VoiceProfileDomainId': voiceProfileDomainId,
      if (voiceProfileId != null) 'VoiceProfileId': voiceProfileId,
    };
  }
}

/// A collection of voice profiles.
class VoiceProfileDomain {
  /// The time at which the voice profile domain was created.
  final DateTime? createdTimestamp;

  /// The description of the voice profile domain.
  final String? description;

  /// The name of the voice profile domain.
  final String? name;

  /// A structure that contains the configuration settings for server-side
  /// encryption.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// The time at which the voice profile was last updated.
  final DateTime? updatedTimestamp;

  /// The voice profile domain's Amazon Resource Number (ARN).
  final String? voiceProfileDomainArn;

  /// The ID of the voice profile domain.
  final String? voiceProfileDomainId;

  VoiceProfileDomain({
    this.createdTimestamp,
    this.description,
    this.name,
    this.serverSideEncryptionConfiguration,
    this.updatedTimestamp,
    this.voiceProfileDomainArn,
    this.voiceProfileDomainId,
  });

  factory VoiceProfileDomain.fromJson(Map<String, dynamic> json) {
    return VoiceProfileDomain(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      serverSideEncryptionConfiguration:
          json['ServerSideEncryptionConfiguration'] != null
              ? ServerSideEncryptionConfiguration.fromJson(
                  json['ServerSideEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceProfileDomainArn: json['VoiceProfileDomainArn'] as String?,
      voiceProfileDomainId: json['VoiceProfileDomainId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final description = this.description;
    final name = this.name;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceProfileDomainArn = this.voiceProfileDomainArn;
    final voiceProfileDomainId = this.voiceProfileDomainId;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (serverSideEncryptionConfiguration != null)
        'ServerSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceProfileDomainArn != null)
        'VoiceProfileDomainArn': voiceProfileDomainArn,
      if (voiceProfileDomainId != null)
        'VoiceProfileDomainId': voiceProfileDomainId,
    };
  }
}

/// A high-level overview of a voice profile domain.
class VoiceProfileDomainSummary {
  /// The time at which the voice profile domain summary was created.
  final DateTime? createdTimestamp;

  /// Describes the voice profile domain summary.
  final String? description;

  /// The name of the voice profile domain summary.
  final String? name;

  /// The time at which the voice profile domain summary was last updated.
  final DateTime? updatedTimestamp;

  /// The ARN of a voice profile in a voice profile domain summary.
  final String? voiceProfileDomainArn;

  /// The ID of the voice profile domain summary.
  final String? voiceProfileDomainId;

  VoiceProfileDomainSummary({
    this.createdTimestamp,
    this.description,
    this.name,
    this.updatedTimestamp,
    this.voiceProfileDomainArn,
    this.voiceProfileDomainId,
  });

  factory VoiceProfileDomainSummary.fromJson(Map<String, dynamic> json) {
    return VoiceProfileDomainSummary(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceProfileDomainArn: json['VoiceProfileDomainArn'] as String?,
      voiceProfileDomainId: json['VoiceProfileDomainId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final description = this.description;
    final name = this.name;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceProfileDomainArn = this.voiceProfileDomainArn;
    final voiceProfileDomainId = this.voiceProfileDomainId;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceProfileDomainArn != null)
        'VoiceProfileDomainArn': voiceProfileDomainArn,
      if (voiceProfileDomainId != null)
        'VoiceProfileDomainId': voiceProfileDomainId,
    };
  }
}

/// A high-level summary of a voice profile.
class VoiceProfileSummary {
  /// The time at which a voice profile summary was created.
  final DateTime? createdTimestamp;

  /// Extends the life of the voice profile. You can use
  /// <code>UpdateVoiceProfile</code> to refresh an existing voice profile's voice
  /// print and extend the life of the summary.
  final DateTime? expirationTimestamp;

  /// The time at which a voice profile summary was last updated.
  final DateTime? updatedTimestamp;

  /// The ARN of the voice profile in a voice profile summary.
  final String? voiceProfileArn;

  /// The ID of the voice profile domain in a voice profile summary.
  final String? voiceProfileDomainId;

  /// The ID of the voice profile in a voice profile summary.
  final String? voiceProfileId;

  VoiceProfileSummary({
    this.createdTimestamp,
    this.expirationTimestamp,
    this.updatedTimestamp,
    this.voiceProfileArn,
    this.voiceProfileDomainId,
    this.voiceProfileId,
  });

  factory VoiceProfileSummary.fromJson(Map<String, dynamic> json) {
    return VoiceProfileSummary(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      expirationTimestamp: timeStampFromJson(json['ExpirationTimestamp']),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceProfileArn: json['VoiceProfileArn'] as String?,
      voiceProfileDomainId: json['VoiceProfileDomainId'] as String?,
      voiceProfileId: json['VoiceProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final expirationTimestamp = this.expirationTimestamp;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceProfileArn = this.voiceProfileArn;
    final voiceProfileDomainId = this.voiceProfileDomainId;
    final voiceProfileId = this.voiceProfileId;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (expirationTimestamp != null)
        'ExpirationTimestamp': iso8601ToJson(expirationTimestamp),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceProfileArn != null) 'VoiceProfileArn': voiceProfileArn,
      if (voiceProfileDomainId != null)
        'VoiceProfileDomainId': voiceProfileDomainId,
      if (voiceProfileId != null) 'VoiceProfileId': voiceProfileId,
    };
  }
}

/// A representation of an asynchronous request to perform voice tone analysis
/// on a Voice Connector call.
class VoiceToneAnalysisTask {
  /// The call details of a voice tone analysis task.
  final CallDetails? callDetails;

  /// The time at which a voice tone analysis task was created.
  final DateTime? createdTimestamp;

  /// The time at which a voice tone analysis task started.
  final DateTime? startedTimestamp;

  /// The status of a voice tone analysis task.
  final String? statusMessage;

  /// The time at which a voice tone analysis task was updated.
  final DateTime? updatedTimestamp;

  /// The ID of the voice tone analysis task.
  final String? voiceToneAnalysisTaskId;

  /// The status of a voice tone analysis task, <code>IN_QUEUE</code>,
  /// <code>IN_PROGRESS</code>, <code>PARTIAL_SUCCESS</code>,
  /// <code>SUCCEEDED</code>, <code>FAILED</code>, or <code>STOPPED</code>.
  final String? voiceToneAnalysisTaskStatus;

  VoiceToneAnalysisTask({
    this.callDetails,
    this.createdTimestamp,
    this.startedTimestamp,
    this.statusMessage,
    this.updatedTimestamp,
    this.voiceToneAnalysisTaskId,
    this.voiceToneAnalysisTaskStatus,
  });

  factory VoiceToneAnalysisTask.fromJson(Map<String, dynamic> json) {
    return VoiceToneAnalysisTask(
      callDetails: json['CallDetails'] != null
          ? CallDetails.fromJson(json['CallDetails'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      startedTimestamp: timeStampFromJson(json['StartedTimestamp']),
      statusMessage: json['StatusMessage'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceToneAnalysisTaskId: json['VoiceToneAnalysisTaskId'] as String?,
      voiceToneAnalysisTaskStatus:
          json['VoiceToneAnalysisTaskStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final callDetails = this.callDetails;
    final createdTimestamp = this.createdTimestamp;
    final startedTimestamp = this.startedTimestamp;
    final statusMessage = this.statusMessage;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceToneAnalysisTaskId = this.voiceToneAnalysisTaskId;
    final voiceToneAnalysisTaskStatus = this.voiceToneAnalysisTaskStatus;
    return {
      if (callDetails != null) 'CallDetails': callDetails,
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (startedTimestamp != null)
        'StartedTimestamp': iso8601ToJson(startedTimestamp),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceToneAnalysisTaskId != null)
        'VoiceToneAnalysisTaskId': voiceToneAnalysisTaskId,
      if (voiceToneAnalysisTaskStatus != null)
        'VoiceToneAnalysisTaskStatus': voiceToneAnalysisTaskStatus,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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

class GoneException extends _s.GenericAwsException {
  GoneException({String? type, String? message})
      : super(type: type, code: 'GoneException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ServiceFailureException extends _s.GenericAwsException {
  ServiceFailureException({String? type, String? message})
      : super(type: type, code: 'ServiceFailureException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottledClientException extends _s.GenericAwsException {
  ThrottledClientException({String? type, String? message})
      : super(type: type, code: 'ThrottledClientException', message: message);
}

class UnauthorizedClientException extends _s.GenericAwsException {
  UnauthorizedClientException({String? type, String? message})
      : super(
            type: type, code: 'UnauthorizedClientException', message: message);
}

class UnprocessableEntityException extends _s.GenericAwsException {
  UnprocessableEntityException({String? type, String? message})
      : super(
            type: type, code: 'UnprocessableEntityException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'GoneException': (type, message) =>
      GoneException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ServiceFailureException': (type, message) =>
      ServiceFailureException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottledClientException': (type, message) =>
      ThrottledClientException(type: type, message: message),
  'UnauthorizedClientException': (type, message) =>
      UnauthorizedClientException(type: type, message: message),
  'UnprocessableEntityException': (type, message) =>
      UnprocessableEntityException(type: type, message: message),
};
