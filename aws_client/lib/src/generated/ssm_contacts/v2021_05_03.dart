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

/// Systems Manager Incident Manager is an incident management console designed
/// to help users mitigate and recover from incidents affecting their Amazon Web
/// Services-hosted applications. An incident is any unplanned interruption or
/// reduction in quality of services.
///
/// Incident Manager increases incident resolution by notifying responders of
/// impact, highlighting relevant troubleshooting data, and providing
/// collaboration tools to get services back up and running. To achieve the
/// primary goal of reducing the time-to-resolution of critical incidents,
/// Incident Manager automates response plans and enables responder team
/// escalation.
class SsmContacts {
  final _s.JsonProtocol _protocol;
  SsmContacts({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ssm-contacts',
            signingName: 'ssm-contacts',
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

  /// Used to acknowledge an engagement to a contact channel during an incident.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [acceptCode] :
  /// A 6-digit code used to acknowledge the page.
  ///
  /// Parameter [acceptType] :
  /// The type indicates if the page was <code>DELIVERED</code> or
  /// <code>READ</code>.
  ///
  /// Parameter [pageId] :
  /// The Amazon Resource Name (ARN) of the engagement to a contact channel.
  ///
  /// Parameter [acceptCodeValidation] :
  /// An optional field that Incident Manager uses to <code>ENFORCE</code>
  /// <code>AcceptCode</code> validation when acknowledging an page.
  /// Acknowledgement can occur by replying to a page, or when entering the
  /// AcceptCode in the console. Enforcing AcceptCode validation causes Incident
  /// Manager to verify that the code entered by the user matches the code sent
  /// by Incident Manager with the page.
  ///
  /// Incident Manager can also <code>IGNORE</code> <code>AcceptCode</code>
  /// validation. Ignoring <code>AcceptCode</code> validation causes Incident
  /// Manager to accept any value entered for the <code>AcceptCode</code>.
  ///
  /// Parameter [contactChannelId] :
  /// The ARN of the contact channel.
  ///
  /// Parameter [note] :
  /// Information provided by the user when the user acknowledges the page.
  Future<void> acceptPage({
    required String acceptCode,
    required AcceptType acceptType,
    required String pageId,
    AcceptCodeValidation? acceptCodeValidation,
    String? contactChannelId,
    String? note,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.AcceptPage'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AcceptCode': acceptCode,
        'AcceptType': acceptType.toValue(),
        'PageId': pageId,
        if (acceptCodeValidation != null)
          'AcceptCodeValidation': acceptCodeValidation.toValue(),
        if (contactChannelId != null) 'ContactChannelId': contactChannelId,
        if (note != null) 'Note': note,
      },
    );
  }

  /// Activates a contact's contact channel. Incident Manager can't engage a
  /// contact until the contact channel has been activated.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [activationCode] :
  /// The code sent to the contact channel when it was created in the contact.
  ///
  /// Parameter [contactChannelId] :
  /// The Amazon Resource Name (ARN) of the contact channel.
  Future<void> activateContactChannel({
    required String activationCode,
    required String contactChannelId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ActivateContactChannel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ActivationCode': activationCode,
        'ContactChannelId': contactChannelId,
      },
    );
  }

  /// Contacts are either the contacts that Incident Manager engages during an
  /// incident or the escalation plans that Incident Manager uses to engage
  /// contacts in phases during an incident.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [DataEncryptionException].
  ///
  /// Parameter [alias] :
  /// The short name to quickly identify a contact or escalation plan. The
  /// contact alias must be unique and identifiable.
  ///
  /// Parameter [plan] :
  /// A list of stages. A contact has an engagement plan with stages that
  /// contact specified contact channels. An escalation plan uses stages that
  /// contact specified contacts.
  ///
  /// Parameter [type] :
  /// To create an escalation plan use <code>ESCALATION</code>. To create a
  /// contact use <code>PERSONAL</code>.
  ///
  /// Parameter [displayName] :
  /// The full name of the contact or escalation plan.
  ///
  /// Parameter [idempotencyToken] :
  /// A token ensuring that the operation is called only once with the specified
  /// details.
  ///
  /// Parameter [tags] :
  /// Adds a tag to the target. You can only tag resources created in the first
  /// Region of your replication set.
  Future<CreateContactResult> createContact({
    required String alias,
    required Plan plan,
    required ContactType type,
    String? displayName,
    String? idempotencyToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.CreateContact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Alias': alias,
        'Plan': plan,
        'Type': type.toValue(),
        if (displayName != null) 'DisplayName': displayName,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateContactResult.fromJson(jsonResponse.body);
  }

  /// A contact channel is the method that Incident Manager uses to engage your
  /// contact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DataEncryptionException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactId] :
  /// The Amazon Resource Name (ARN) of the contact you are adding the contact
  /// channel to.
  ///
  /// Parameter [deliveryAddress] :
  /// The details that Incident Manager uses when trying to engage the contact
  /// channel. The format is dependent on the type of the contact channel. The
  /// following are the expected formats:
  ///
  /// <ul>
  /// <li>
  /// SMS - '+' followed by the country code and phone number
  /// </li>
  /// <li>
  /// VOICE - '+' followed by the country code and phone number
  /// </li>
  /// <li>
  /// EMAIL - any standard email format
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name of the contact channel.
  ///
  /// Parameter [type] :
  /// Incident Manager supports three types of contact channels:
  ///
  /// <ul>
  /// <li>
  /// <code>SMS</code>
  /// </li>
  /// <li>
  /// <code>VOICE</code>
  /// </li>
  /// <li>
  /// <code>EMAIL</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [deferActivation] :
  /// If you want to activate the channel at a later time, you can choose to
  /// defer activation. Incident Manager can't engage your contact channel until
  /// it has been activated.
  ///
  /// Parameter [idempotencyToken] :
  /// A token ensuring that the operation is called only once with the specified
  /// details.
  Future<CreateContactChannelResult> createContactChannel({
    required String contactId,
    required ContactChannelAddress deliveryAddress,
    required String name,
    required ChannelType type,
    bool? deferActivation,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.CreateContactChannel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactId': contactId,
        'DeliveryAddress': deliveryAddress,
        'Name': name,
        'Type': type.toValue(),
        if (deferActivation != null) 'DeferActivation': deferActivation,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      },
    );

    return CreateContactChannelResult.fromJson(jsonResponse.body);
  }

  /// Creates a rotation in an on-call schedule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactIds] :
  /// The Amazon Resource Names (ARNs) of the contacts to add to the rotation.
  ///
  /// The order that you list the contacts in is their shift order in the
  /// rotation schedule. To change the order of the contact's shifts, use the
  /// <a>UpdateRotation</a> operation.
  ///
  /// Parameter [name] :
  /// The name of the rotation.
  ///
  /// Parameter [recurrence] :
  /// Information about the rule that specifies when a shift's team members
  /// rotate.
  ///
  /// Parameter [timeZoneId] :
  /// The time zone to base the rotation’s activity on in Internet Assigned
  /// Numbers Authority (IANA) format. For example: "America/Los_Angeles",
  /// "UTC", or "Asia/Seoul". For more information, see the <a
  /// href="https://www.iana.org/time-zones">Time Zone Database</a> on the IANA
  /// website.
  /// <note>
  /// Designators for time zones that don’t support Daylight Savings Time rules,
  /// such as Pacific Standard Time (PST) and Pacific Daylight Time (PDT), are
  /// not supported.
  /// </note>
  ///
  /// Parameter [idempotencyToken] :
  /// A token that ensures that the operation is called only once with the
  /// specified details.
  ///
  /// Parameter [startTime] :
  /// The date and time that the rotation goes into effect.
  ///
  /// Parameter [tags] :
  /// Optional metadata to assign to the rotation. Tags enable you to categorize
  /// a resource in different ways, such as by purpose, owner, or environment.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/incident-manager/latest/userguide/tagging.html">Tagging
  /// Incident Manager resources</a> in the <i>Incident Manager User Guide</i>.
  Future<CreateRotationResult> createRotation({
    required List<String> contactIds,
    required String name,
    required RecurrenceSettings recurrence,
    required String timeZoneId,
    String? idempotencyToken,
    DateTime? startTime,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.CreateRotation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactIds': contactIds,
        'Name': name,
        'Recurrence': recurrence,
        'TimeZoneId': timeZoneId,
        if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRotationResult.fromJson(jsonResponse.body);
  }

  /// Creates an override for a rotation in an on-call schedule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The date and time when the override ends.
  ///
  /// Parameter [newContactIds] :
  /// The Amazon Resource Names (ARNs) of the contacts to replace those in the
  /// current on-call rotation with.
  ///
  /// If you want to include any current team members in the override shift, you
  /// must include their ARNs in the new contact ID list.
  ///
  /// Parameter [rotationId] :
  /// The Amazon Resource Name (ARN) of the rotation to create an override for.
  ///
  /// Parameter [startTime] :
  /// The date and time when the override goes into effect.
  ///
  /// Parameter [idempotencyToken] :
  /// A token that ensures that the operation is called only once with the
  /// specified details.
  Future<CreateRotationOverrideResult> createRotationOverride({
    required DateTime endTime,
    required List<String> newContactIds,
    required String rotationId,
    required DateTime startTime,
    String? idempotencyToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.CreateRotationOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': unixTimestampToJson(endTime),
        'NewContactIds': newContactIds,
        'RotationId': rotationId,
        'StartTime': unixTimestampToJson(startTime),
        if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
      },
    );

    return CreateRotationOverrideResult.fromJson(jsonResponse.body);
  }

  /// To no longer receive Incident Manager engagements to a contact channel,
  /// you can deactivate the channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactChannelId] :
  /// The Amazon Resource Name (ARN) of the contact channel you're deactivating.
  Future<void> deactivateContactChannel({
    required String contactChannelId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.DeactivateContactChannel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactChannelId': contactChannelId,
      },
    );
  }

  /// To remove a contact from Incident Manager, you can delete the contact.
  /// Deleting a contact removes them from all escalation plans and related
  /// response plans. Deleting an escalation plan removes it from all related
  /// response plans. You will have to recreate the contact and its contact
  /// channels before you can use it again.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactId] :
  /// The Amazon Resource Name (ARN) of the contact that you're deleting.
  Future<void> deleteContact({
    required String contactId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.DeleteContact'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactId': contactId,
      },
    );
  }

  /// To no longer receive engagements on a contact channel, you can delete the
  /// channel from a contact. Deleting the contact channel removes it from the
  /// contact's engagement plan. If you delete the only contact channel for a
  /// contact, you won't be able to engage that contact during an incident.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactChannelId] :
  /// The Amazon Resource Name (ARN) of the contact channel.
  Future<void> deleteContactChannel({
    required String contactChannelId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.DeleteContactChannel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactChannelId': contactChannelId,
      },
    );
  }

  /// Deletes a rotation from the system. If a rotation belongs to more than one
  /// on-call schedule, this operation deletes it from all of them.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rotationId] :
  /// The Amazon Resource Name (ARN) of the on-call rotation to delete.
  Future<void> deleteRotation({
    required String rotationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.DeleteRotation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RotationId': rotationId,
      },
    );
  }

  /// Deletes an existing override for an on-call rotation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rotationId] :
  /// The Amazon Resource Name (ARN) of the rotation that was overridden.
  ///
  /// Parameter [rotationOverrideId] :
  /// The Amazon Resource Name (ARN) of the on-call rotation override to delete.
  Future<void> deleteRotationOverride({
    required String rotationId,
    required String rotationOverrideId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.DeleteRotationOverride'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RotationId': rotationId,
        'RotationOverrideId': rotationOverrideId,
      },
    );
  }

  /// Incident Manager uses engagements to engage contacts and escalation plans
  /// during an incident. Use this command to describe the engagement that
  /// occurred during an incident.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DataEncryptionException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [engagementId] :
  /// The Amazon Resource Name (ARN) of the engagement you want the details of.
  Future<DescribeEngagementResult> describeEngagement({
    required String engagementId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.DescribeEngagement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EngagementId': engagementId,
      },
    );

    return DescribeEngagementResult.fromJson(jsonResponse.body);
  }

  /// Lists details of the engagement to a contact channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DataEncryptionException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pageId] :
  /// The ID of the engagement to a contact channel.
  Future<DescribePageResult> describePage({
    required String pageId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.DescribePage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PageId': pageId,
      },
    );

    return DescribePageResult.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the specified contact or escalation plan.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [DataEncryptionException].
  ///
  /// Parameter [contactId] :
  /// The Amazon Resource Name (ARN) of the contact or escalation plan.
  Future<GetContactResult> getContact({
    required String contactId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.GetContact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactId': contactId,
      },
    );

    return GetContactResult.fromJson(jsonResponse.body);
  }

  /// List details about a specific contact channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DataEncryptionException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactChannelId] :
  /// The Amazon Resource Name (ARN) of the contact channel you want information
  /// about.
  Future<GetContactChannelResult> getContactChannel({
    required String contactChannelId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.GetContactChannel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactChannelId': contactChannelId,
      },
    );

    return GetContactChannelResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the resource policies attached to the specified contact or
  /// escalation plan.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactArn] :
  /// The Amazon Resource Name (ARN) of the contact or escalation plan.
  Future<GetContactPolicyResult> getContactPolicy({
    required String contactArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.GetContactPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactArn': contactArn,
      },
    );

    return GetContactPolicyResult.fromJson(jsonResponse.body);
  }

  /// Retrieves information about an on-call rotation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rotationId] :
  /// The Amazon Resource Name (ARN) of the on-call rotation to retrieve
  /// information about.
  Future<GetRotationResult> getRotation({
    required String rotationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.GetRotation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RotationId': rotationId,
      },
    );

    return GetRotationResult.fromJson(jsonResponse.body);
  }

  /// Retrieves information about an override to an on-call rotation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rotationId] :
  /// The Amazon Resource Name (ARN) of the overridden rotation to retrieve
  /// information about.
  ///
  /// Parameter [rotationOverrideId] :
  /// The Amazon Resource Name (ARN) of the on-call rotation override to
  /// retrieve information about.
  Future<GetRotationOverrideResult> getRotationOverride({
    required String rotationId,
    required String rotationOverrideId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.GetRotationOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RotationId': rotationId,
        'RotationOverrideId': rotationOverrideId,
      },
    );

    return GetRotationOverrideResult.fromJson(jsonResponse.body);
  }

  /// Lists all contact channels for the specified contact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DataEncryptionException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactId] :
  /// The Amazon Resource Name (ARN) of the contact.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of contact channels per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to continue to the next page of results.
  Future<ListContactChannelsResult> listContactChannels({
    required String contactId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListContactChannels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactId': contactId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListContactChannelsResult.fromJson(jsonResponse.body);
  }

  /// Lists all contacts and escalation plans in Incident Manager.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aliasPrefix] :
  /// Used to list only contacts who's aliases start with the specified prefix.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of contacts and escalation plans per page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to continue to the next page of results.
  ///
  /// Parameter [type] :
  /// The type of contact. A contact is type <code>PERSONAL</code> and an
  /// escalation plan is type <code>ESCALATION</code>.
  Future<ListContactsResult> listContacts({
    String? aliasPrefix,
    int? maxResults,
    String? nextToken,
    ContactType? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListContacts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (aliasPrefix != null) 'AliasPrefix': aliasPrefix,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (type != null) 'Type': type.toValue(),
      },
    );

    return ListContactsResult.fromJson(jsonResponse.body);
  }

  /// Lists all engagements that have happened in an incident.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [incidentId] :
  /// The Amazon Resource Name (ARN) of the incident you're listing engagements
  /// for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of engagements per page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to continue to the next page of results.
  ///
  /// Parameter [timeRangeValue] :
  /// The time range to lists engagements for an incident.
  Future<ListEngagementsResult> listEngagements({
    String? incidentId,
    int? maxResults,
    String? nextToken,
    TimeRange? timeRangeValue,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListEngagements'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (incidentId != null) 'IncidentId': incidentId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (timeRangeValue != null) 'TimeRangeValue': timeRangeValue,
      },
    );

    return ListEngagementsResult.fromJson(jsonResponse.body);
  }

  /// Lists all of the engagements to contact channels that have been
  /// acknowledged.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pageId] :
  /// The Amazon Resource Name (ARN) of the engagement to a specific contact
  /// channel.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of acknowledgements per page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to continue to the next page of results.
  Future<ListPageReceiptsResult> listPageReceipts({
    required String pageId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListPageReceipts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PageId': pageId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPageReceiptsResult.fromJson(jsonResponse.body);
  }

  /// Returns the resolution path of an engagement. For example, the escalation
  /// plan engaged in an incident might target an on-call schedule that includes
  /// several contacts in a rotation, but just one contact on-call when the
  /// incident starts. The resolution path indicates the hierarchy of
  /// <i>escalation plan &gt; on-call schedule &gt; contact</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [pageId] :
  /// The Amazon Resource Name (ARN) of the contact engaged for the incident.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<ListPageResolutionsResult> listPageResolutions({
    required String pageId,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListPageResolutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PageId': pageId,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPageResolutionsResult.fromJson(jsonResponse.body);
  }

  /// Lists the engagements to a contact's contact channels.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactId] :
  /// The Amazon Resource Name (ARN) of the contact you are retrieving
  /// engagements for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of engagements to contact channels to list per page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to continue to the next page of results.
  Future<ListPagesByContactResult> listPagesByContact({
    required String contactId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListPagesByContact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactId': contactId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPagesByContactResult.fromJson(jsonResponse.body);
  }

  /// Lists the engagements to contact channels that occurred by engaging a
  /// contact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [engagementId] :
  /// The Amazon Resource Name (ARN) of the engagement.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of engagements to contact channels to list per page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to continue to the next page of results.
  Future<ListPagesByEngagementResult> listPagesByEngagement({
    required String engagementId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListPagesByEngagement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EngagementId': engagementId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPagesByEngagementResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of shifts based on rotation configuration parameters.
  /// <note>
  /// The Incident Manager primarily uses this operation to populate the
  /// <b>Preview</b> calendar. It is not typically run by end users.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The date and time a rotation shift would end.
  ///
  /// Parameter [members] :
  /// The contacts that would be assigned to a rotation.
  ///
  /// Parameter [recurrence] :
  /// Information about how long a rotation would last before restarting at the
  /// beginning of the shift order.
  ///
  /// Parameter [timeZoneId] :
  /// The time zone the rotation’s activity would be based on, in Internet
  /// Assigned Numbers Authority (IANA) format. For example:
  /// "America/Los_Angeles", "UTC", or "Asia/Seoul".
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that can be specified in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. This token is used to get the next set of
  /// results.
  ///
  /// Parameter [overrides] :
  /// Information about changes that would be made in a rotation override.
  ///
  /// Parameter [rotationStartTime] :
  /// The date and time a rotation would begin. The first shift is calculated
  /// from this date and time.
  ///
  /// Parameter [startTime] :
  /// Used to filter the range of calculated shifts before sending the response
  /// back to the user.
  Future<ListPreviewRotationShiftsResult> listPreviewRotationShifts({
    required DateTime endTime,
    required List<String> members,
    required RecurrenceSettings recurrence,
    required String timeZoneId,
    int? maxResults,
    String? nextToken,
    List<PreviewOverride>? overrides,
    DateTime? rotationStartTime,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListPreviewRotationShifts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': unixTimestampToJson(endTime),
        'Members': members,
        'Recurrence': recurrence,
        'TimeZoneId': timeZoneId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (overrides != null) 'Overrides': overrides,
        if (rotationStartTime != null)
          'RotationStartTime': unixTimestampToJson(rotationStartTime),
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return ListPreviewRotationShiftsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of overrides currently specified for an on-call rotation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The date and time for the end of a time range for listing overrides.
  ///
  /// Parameter [rotationId] :
  /// The Amazon Resource Name (ARN) of the rotation to retrieve information
  /// about.
  ///
  /// Parameter [startTime] :
  /// The date and time for the beginning of a time range for listing overrides.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  Future<ListRotationOverridesResult> listRotationOverrides({
    required DateTime endTime,
    required String rotationId,
    required DateTime startTime,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListRotationOverrides'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': unixTimestampToJson(endTime),
        'RotationId': rotationId,
        'StartTime': unixTimestampToJson(startTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListRotationOverridesResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of shifts generated by an existing rotation in the system.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The date and time for the end of the time range to list shifts for.
  ///
  /// Parameter [rotationId] :
  /// The Amazon Resource Name (ARN) of the rotation to retrieve shift
  /// information about.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  ///
  /// Parameter [startTime] :
  /// The date and time for the beginning of the time range to list shifts for.
  Future<ListRotationShiftsResult> listRotationShifts({
    required DateTime endTime,
    required String rotationId,
    int? maxResults,
    String? nextToken,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListRotationShifts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': unixTimestampToJson(endTime),
        'RotationId': rotationId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      },
    );

    return ListRotationShiftsResult.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of on-call rotations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return for this call. The call also returns
  /// a token that you can specify in a subsequent call to get the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// A token to start the list. Use this token to get the next set of results.
  ///
  /// Parameter [rotationNamePrefix] :
  /// A filter to include rotations in list results based on their common
  /// prefix. For example, entering prod returns a list of all rotation names
  /// that begin with <code>prod</code>, such as <code>production</code> and
  /// <code>prod-1</code>.
  Future<ListRotationsResult> listRotations({
    int? maxResults,
    String? nextToken,
    String? rotationNamePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListRotations'
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
        if (rotationNamePrefix != null)
          'RotationNamePrefix': rotationNamePrefix,
      },
    );

    return ListRotationsResult.fromJson(jsonResponse.body);
  }

  /// Lists the tags of an escalation plan or contact.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the contact or escalation plan.
  Future<ListTagsForResourceResult> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResult.fromJson(jsonResponse.body);
  }

  /// Adds a resource policy to the specified contact or escalation plan. The
  /// resource policy is used to share the contact or escalation plan using
  /// Resource Access Manager (RAM). For more information about cross-account
  /// sharing, see <a
  /// href="https://docs.aws.amazon.com/incident-manager/latest/userguide/xa.html">Setting
  /// up cross-account functionality</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [contactArn] :
  /// The Amazon Resource Name (ARN) of the contact or escalation plan.
  ///
  /// Parameter [policy] :
  /// Details of the resource policy.
  Future<void> putContactPolicy({
    required String contactArn,
    required String policy,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.PutContactPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactArn': contactArn,
        'Policy': policy,
      },
    );
  }

  /// Sends an activation code to a contact channel. The contact can use this
  /// code to activate the contact channel in the console or with the
  /// <code>ActivateChannel</code> operation. Incident Manager can't engage a
  /// contact channel until it has been activated.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DataEncryptionException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactChannelId] :
  /// The Amazon Resource Name (ARN) of the contact channel.
  Future<void> sendActivationCode({
    required String contactChannelId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.SendActivationCode'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactChannelId': contactChannelId,
      },
    );
  }

  /// Starts an engagement to a contact or escalation plan. The engagement
  /// engages each contact specified in the incident.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DataEncryptionException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactId] :
  /// The Amazon Resource Name (ARN) of the contact being engaged.
  ///
  /// Parameter [content] :
  /// The secure content of the message that was sent to the contact. Use this
  /// field for engagements to <code>VOICE</code> or <code>EMAIL</code>.
  ///
  /// Parameter [sender] :
  /// The user that started the engagement.
  ///
  /// Parameter [subject] :
  /// The secure subject of the message that was sent to the contact. Use this
  /// field for engagements to <code>VOICE</code> or <code>EMAIL</code>.
  ///
  /// Parameter [idempotencyToken] :
  /// A token ensuring that the operation is called only once with the specified
  /// details.
  ///
  /// Parameter [incidentId] :
  /// The ARN of the incident that the engagement is part of.
  ///
  /// Parameter [publicContent] :
  /// The insecure content of the message that was sent to the contact. Use this
  /// field for engagements to <code>SMS</code>.
  ///
  /// Parameter [publicSubject] :
  /// The insecure subject of the message that was sent to the contact. Use this
  /// field for engagements to <code>SMS</code>.
  Future<StartEngagementResult> startEngagement({
    required String contactId,
    required String content,
    required String sender,
    required String subject,
    String? idempotencyToken,
    String? incidentId,
    String? publicContent,
    String? publicSubject,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.StartEngagement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactId': contactId,
        'Content': content,
        'Sender': sender,
        'Subject': subject,
        'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
        if (incidentId != null) 'IncidentId': incidentId,
        if (publicContent != null) 'PublicContent': publicContent,
        if (publicSubject != null) 'PublicSubject': publicSubject,
      },
    );

    return StartEngagementResult.fromJson(jsonResponse.body);
  }

  /// Stops an engagement before it finishes the final stage of the escalation
  /// plan or engagement plan. Further contacts aren't engaged.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [engagementId] :
  /// The Amazon Resource Name (ARN) of the engagement.
  ///
  /// Parameter [reason] :
  /// The reason that you're stopping the engagement.
  Future<void> stopEngagement({
    required String engagementId,
    String? reason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.StopEngagement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EngagementId': engagementId,
        if (reason != null) 'Reason': reason,
      },
    );
  }

  /// Tags a contact or escalation plan. You can tag only contacts and
  /// escalation plans in the first region of your replication set.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the contact or escalation plan.
  ///
  /// Parameter [tags] :
  /// A list of tags that you are adding to the contact or escalation plan.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Removes tags from the specified resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the contact or escalation plan.
  ///
  /// Parameter [tagKeys] :
  /// The key of the tag that you want to remove.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates the contact or escalation plan specified.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [DataEncryptionException].
  ///
  /// Parameter [contactId] :
  /// The Amazon Resource Name (ARN) of the contact or escalation plan you're
  /// updating.
  ///
  /// Parameter [displayName] :
  /// The full name of the contact or escalation plan.
  ///
  /// Parameter [plan] :
  /// A list of stages. A contact has an engagement plan with stages for
  /// specified contact channels. An escalation plan uses these stages to
  /// contact specified contacts.
  Future<void> updateContact({
    required String contactId,
    String? displayName,
    Plan? plan,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.UpdateContact'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactId': contactId,
        if (displayName != null) 'DisplayName': displayName,
        if (plan != null) 'Plan': plan,
      },
    );
  }

  /// Updates a contact's contact channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [DataEncryptionException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contactChannelId] :
  /// The Amazon Resource Name (ARN) of the contact channel you want to update.
  ///
  /// Parameter [deliveryAddress] :
  /// The details that Incident Manager uses when trying to engage the contact
  /// channel.
  ///
  /// Parameter [name] :
  /// The name of the contact channel.
  Future<void> updateContactChannel({
    required String contactChannelId,
    ContactChannelAddress? deliveryAddress,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.UpdateContactChannel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactChannelId': contactChannelId,
        if (deliveryAddress != null) 'DeliveryAddress': deliveryAddress,
        if (name != null) 'Name': name,
      },
    );
  }

  /// Updates the information specified for an on-call rotation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recurrence] :
  /// Information about how long the updated rotation lasts before restarting at
  /// the beginning of the shift order.
  ///
  /// Parameter [rotationId] :
  /// The Amazon Resource Name (ARN) of the rotation to update.
  ///
  /// Parameter [contactIds] :
  /// The Amazon Resource Names (ARNs) of the contacts to include in the updated
  /// rotation.
  ///
  /// The order in which you list the contacts is their shift order in the
  /// rotation schedule.
  ///
  /// Parameter [startTime] :
  /// The date and time the rotation goes into effect.
  ///
  /// Parameter [timeZoneId] :
  /// The time zone to base the updated rotation’s activity on, in Internet
  /// Assigned Numbers Authority (IANA) format. For example:
  /// "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see
  /// the <a href="https://www.iana.org/time-zones">Time Zone Database</a> on
  /// the IANA website.
  /// <note>
  /// Designators for time zones that don’t support Daylight Savings Time Rules,
  /// such as Pacific Standard Time (PST) and Pacific Daylight Time (PDT),
  /// aren't supported.
  /// </note>
  Future<void> updateRotation({
    required RecurrenceSettings recurrence,
    required String rotationId,
    List<String>? contactIds,
    DateTime? startTime,
    String? timeZoneId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SSMContacts.UpdateRotation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Recurrence': recurrence,
        'RotationId': rotationId,
        if (contactIds != null) 'ContactIds': contactIds,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
        if (timeZoneId != null) 'TimeZoneId': timeZoneId,
      },
    );
  }
}

enum AcceptCodeValidation {
  ignore,
  enforce,
}

extension AcceptCodeValidationValueExtension on AcceptCodeValidation {
  String toValue() {
    switch (this) {
      case AcceptCodeValidation.ignore:
        return 'IGNORE';
      case AcceptCodeValidation.enforce:
        return 'ENFORCE';
    }
  }
}

extension AcceptCodeValidationFromString on String {
  AcceptCodeValidation toAcceptCodeValidation() {
    switch (this) {
      case 'IGNORE':
        return AcceptCodeValidation.ignore;
      case 'ENFORCE':
        return AcceptCodeValidation.enforce;
    }
    throw Exception('$this is not known in enum AcceptCodeValidation');
  }
}

class AcceptPageResult {
  AcceptPageResult();

  factory AcceptPageResult.fromJson(Map<String, dynamic> _) {
    return AcceptPageResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum AcceptType {
  delivered,
  read,
}

extension AcceptTypeValueExtension on AcceptType {
  String toValue() {
    switch (this) {
      case AcceptType.delivered:
        return 'DELIVERED';
      case AcceptType.read:
        return 'READ';
    }
  }
}

extension AcceptTypeFromString on String {
  AcceptType toAcceptType() {
    switch (this) {
      case 'DELIVERED':
        return AcceptType.delivered;
      case 'READ':
        return AcceptType.read;
    }
    throw Exception('$this is not known in enum AcceptType');
  }
}

class ActivateContactChannelResult {
  ActivateContactChannelResult();

  factory ActivateContactChannelResult.fromJson(Map<String, dynamic> _) {
    return ActivateContactChannelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum ActivationStatus {
  activated,
  notActivated,
}

extension ActivationStatusValueExtension on ActivationStatus {
  String toValue() {
    switch (this) {
      case ActivationStatus.activated:
        return 'ACTIVATED';
      case ActivationStatus.notActivated:
        return 'NOT_ACTIVATED';
    }
  }
}

extension ActivationStatusFromString on String {
  ActivationStatus toActivationStatus() {
    switch (this) {
      case 'ACTIVATED':
        return ActivationStatus.activated;
      case 'NOT_ACTIVATED':
        return ActivationStatus.notActivated;
    }
    throw Exception('$this is not known in enum ActivationStatus');
  }
}

/// Information about the contact channel that Incident Manager uses to engage
/// the contact.
class ChannelTargetInfo {
  /// The Amazon Resource Name (ARN) of the contact channel.
  final String contactChannelId;

  /// The number of minutes to wait to retry sending engagement in the case the
  /// engagement initially fails.
  final int? retryIntervalInMinutes;

  ChannelTargetInfo({
    required this.contactChannelId,
    this.retryIntervalInMinutes,
  });

  factory ChannelTargetInfo.fromJson(Map<String, dynamic> json) {
    return ChannelTargetInfo(
      contactChannelId: json['ContactChannelId'] as String,
      retryIntervalInMinutes: json['RetryIntervalInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactChannelId = this.contactChannelId;
    final retryIntervalInMinutes = this.retryIntervalInMinutes;
    return {
      'ContactChannelId': contactChannelId,
      if (retryIntervalInMinutes != null)
        'RetryIntervalInMinutes': retryIntervalInMinutes,
    };
  }
}

enum ChannelType {
  sms,
  voice,
  email,
}

extension ChannelTypeValueExtension on ChannelType {
  String toValue() {
    switch (this) {
      case ChannelType.sms:
        return 'SMS';
      case ChannelType.voice:
        return 'VOICE';
      case ChannelType.email:
        return 'EMAIL';
    }
  }
}

extension ChannelTypeFromString on String {
  ChannelType toChannelType() {
    switch (this) {
      case 'SMS':
        return ChannelType.sms;
      case 'VOICE':
        return ChannelType.voice;
      case 'EMAIL':
        return ChannelType.email;
    }
    throw Exception('$this is not known in enum ChannelType');
  }
}

/// A personal contact or escalation plan that Incident Manager engages during
/// an incident.
class Contact {
  /// The unique and identifiable alias of the contact or escalation plan.
  final String alias;

  /// The Amazon Resource Name (ARN) of the contact or escalation plan.
  final String contactArn;

  /// Refers to the type of contact. A single contact is type
  /// <code>PERSONAL</code> and an escalation plan is type
  /// <code>ESCALATION</code>.
  final ContactType type;

  /// The full name of the contact or escalation plan.
  final String? displayName;

  Contact({
    required this.alias,
    required this.contactArn,
    required this.type,
    this.displayName,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      alias: json['Alias'] as String,
      contactArn: json['ContactArn'] as String,
      type: (json['Type'] as String).toContactType(),
      displayName: json['DisplayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final contactArn = this.contactArn;
    final type = this.type;
    final displayName = this.displayName;
    return {
      'Alias': alias,
      'ContactArn': contactArn,
      'Type': type.toValue(),
      if (displayName != null) 'DisplayName': displayName,
    };
  }
}

/// The method that Incident Manager uses to engage a contact.
class ContactChannel {
  /// A Boolean value describing if the contact channel has been activated or not.
  /// If the contact channel isn't activated, Incident Manager can't engage the
  /// contact through it.
  final ActivationStatus activationStatus;

  /// The ARN of the contact that contains the contact channel.
  final String contactArn;

  /// The Amazon Resource Name (ARN) of the contact channel.
  final String contactChannelArn;

  /// The details that Incident Manager uses when trying to engage the contact
  /// channel.
  final ContactChannelAddress deliveryAddress;

  /// The name of the contact channel.
  final String name;

  /// The type of the contact channel. Incident Manager supports three contact
  /// methods:
  ///
  /// <ul>
  /// <li>
  /// SMS
  /// </li>
  /// <li>
  /// VOICE
  /// </li>
  /// <li>
  /// EMAIL
  /// </li>
  /// </ul>
  final ChannelType? type;

  ContactChannel({
    required this.activationStatus,
    required this.contactArn,
    required this.contactChannelArn,
    required this.deliveryAddress,
    required this.name,
    this.type,
  });

  factory ContactChannel.fromJson(Map<String, dynamic> json) {
    return ContactChannel(
      activationStatus:
          (json['ActivationStatus'] as String).toActivationStatus(),
      contactArn: json['ContactArn'] as String,
      contactChannelArn: json['ContactChannelArn'] as String,
      deliveryAddress: ContactChannelAddress.fromJson(
          json['DeliveryAddress'] as Map<String, dynamic>),
      name: json['Name'] as String,
      type: (json['Type'] as String?)?.toChannelType(),
    );
  }

  Map<String, dynamic> toJson() {
    final activationStatus = this.activationStatus;
    final contactArn = this.contactArn;
    final contactChannelArn = this.contactChannelArn;
    final deliveryAddress = this.deliveryAddress;
    final name = this.name;
    final type = this.type;
    return {
      'ActivationStatus': activationStatus.toValue(),
      'ContactArn': contactArn,
      'ContactChannelArn': contactChannelArn,
      'DeliveryAddress': deliveryAddress,
      'Name': name,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// The details that Incident Manager uses when trying to engage the contact
/// channel.
class ContactChannelAddress {
  /// The format is dependent on the type of the contact channel. The following
  /// are the expected formats:
  ///
  /// <ul>
  /// <li>
  /// SMS - '+' followed by the country code and phone number
  /// </li>
  /// <li>
  /// VOICE - '+' followed by the country code and phone number
  /// </li>
  /// <li>
  /// EMAIL - any standard email format
  /// </li>
  /// </ul>
  final String? simpleAddress;

  ContactChannelAddress({
    this.simpleAddress,
  });

  factory ContactChannelAddress.fromJson(Map<String, dynamic> json) {
    return ContactChannelAddress(
      simpleAddress: json['SimpleAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final simpleAddress = this.simpleAddress;
    return {
      if (simpleAddress != null) 'SimpleAddress': simpleAddress,
    };
  }
}

/// The contact that Incident Manager is engaging during an incident.
class ContactTargetInfo {
  /// A Boolean value determining if the contact's acknowledgement stops the
  /// progress of stages in the plan.
  final bool isEssential;

  /// The Amazon Resource Name (ARN) of the contact.
  final String? contactId;

  ContactTargetInfo({
    required this.isEssential,
    this.contactId,
  });

  factory ContactTargetInfo.fromJson(Map<String, dynamic> json) {
    return ContactTargetInfo(
      isEssential: json['IsEssential'] as bool,
      contactId: json['ContactId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isEssential = this.isEssential;
    final contactId = this.contactId;
    return {
      'IsEssential': isEssential,
      if (contactId != null) 'ContactId': contactId,
    };
  }
}

enum ContactType {
  personal,
  escalation,
  oncallSchedule,
}

extension ContactTypeValueExtension on ContactType {
  String toValue() {
    switch (this) {
      case ContactType.personal:
        return 'PERSONAL';
      case ContactType.escalation:
        return 'ESCALATION';
      case ContactType.oncallSchedule:
        return 'ONCALL_SCHEDULE';
    }
  }
}

extension ContactTypeFromString on String {
  ContactType toContactType() {
    switch (this) {
      case 'PERSONAL':
        return ContactType.personal;
      case 'ESCALATION':
        return ContactType.escalation;
      case 'ONCALL_SCHEDULE':
        return ContactType.oncallSchedule;
    }
    throw Exception('$this is not known in enum ContactType');
  }
}

/// Information about when an on-call shift begins and ends.
class CoverageTime {
  /// Information about when the on-call rotation shift ends.
  final HandOffTime? end;

  /// Information about when the on-call rotation shift begins.
  final HandOffTime? start;

  CoverageTime({
    this.end,
    this.start,
  });

  factory CoverageTime.fromJson(Map<String, dynamic> json) {
    return CoverageTime(
      end: json['End'] != null
          ? HandOffTime.fromJson(json['End'] as Map<String, dynamic>)
          : null,
      start: json['Start'] != null
          ? HandOffTime.fromJson(json['Start'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      if (end != null) 'End': end,
      if (start != null) 'Start': start,
    };
  }
}

class CreateContactChannelResult {
  /// The Amazon Resource Name (ARN) of the contact channel.
  final String contactChannelArn;

  CreateContactChannelResult({
    required this.contactChannelArn,
  });

  factory CreateContactChannelResult.fromJson(Map<String, dynamic> json) {
    return CreateContactChannelResult(
      contactChannelArn: json['ContactChannelArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final contactChannelArn = this.contactChannelArn;
    return {
      'ContactChannelArn': contactChannelArn,
    };
  }
}

class CreateContactResult {
  /// The Amazon Resource Name (ARN) of the created contact or escalation plan.
  final String contactArn;

  CreateContactResult({
    required this.contactArn,
  });

  factory CreateContactResult.fromJson(Map<String, dynamic> json) {
    return CreateContactResult(
      contactArn: json['ContactArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final contactArn = this.contactArn;
    return {
      'ContactArn': contactArn,
    };
  }
}

class CreateRotationOverrideResult {
  /// The Amazon Resource Name (ARN) of the created rotation override.
  final String rotationOverrideId;

  CreateRotationOverrideResult({
    required this.rotationOverrideId,
  });

  factory CreateRotationOverrideResult.fromJson(Map<String, dynamic> json) {
    return CreateRotationOverrideResult(
      rotationOverrideId: json['RotationOverrideId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final rotationOverrideId = this.rotationOverrideId;
    return {
      'RotationOverrideId': rotationOverrideId,
    };
  }
}

class CreateRotationResult {
  /// The Amazon Resource Name (ARN) of the created rotation.
  final String rotationArn;

  CreateRotationResult({
    required this.rotationArn,
  });

  factory CreateRotationResult.fromJson(Map<String, dynamic> json) {
    return CreateRotationResult(
      rotationArn: json['RotationArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final rotationArn = this.rotationArn;
    return {
      'RotationArn': rotationArn,
    };
  }
}

enum DayOfWeek {
  mon,
  tue,
  wed,
  thu,
  fri,
  sat,
  sun,
}

extension DayOfWeekValueExtension on DayOfWeek {
  String toValue() {
    switch (this) {
      case DayOfWeek.mon:
        return 'MON';
      case DayOfWeek.tue:
        return 'TUE';
      case DayOfWeek.wed:
        return 'WED';
      case DayOfWeek.thu:
        return 'THU';
      case DayOfWeek.fri:
        return 'FRI';
      case DayOfWeek.sat:
        return 'SAT';
      case DayOfWeek.sun:
        return 'SUN';
    }
  }
}

extension DayOfWeekFromString on String {
  DayOfWeek toDayOfWeek() {
    switch (this) {
      case 'MON':
        return DayOfWeek.mon;
      case 'TUE':
        return DayOfWeek.tue;
      case 'WED':
        return DayOfWeek.wed;
      case 'THU':
        return DayOfWeek.thu;
      case 'FRI':
        return DayOfWeek.fri;
      case 'SAT':
        return DayOfWeek.sat;
      case 'SUN':
        return DayOfWeek.sun;
    }
    throw Exception('$this is not known in enum DayOfWeek');
  }
}

class DeactivateContactChannelResult {
  DeactivateContactChannelResult();

  factory DeactivateContactChannelResult.fromJson(Map<String, dynamic> _) {
    return DeactivateContactChannelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteContactChannelResult {
  DeleteContactChannelResult();

  factory DeleteContactChannelResult.fromJson(Map<String, dynamic> _) {
    return DeleteContactChannelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteContactResult {
  DeleteContactResult();

  factory DeleteContactResult.fromJson(Map<String, dynamic> _) {
    return DeleteContactResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRotationOverrideResult {
  DeleteRotationOverrideResult();

  factory DeleteRotationOverrideResult.fromJson(Map<String, dynamic> _) {
    return DeleteRotationOverrideResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRotationResult {
  DeleteRotationResult();

  factory DeleteRotationResult.fromJson(Map<String, dynamic> _) {
    return DeleteRotationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeEngagementResult {
  /// The ARN of the escalation plan or contacts involved in the engagement.
  final String contactArn;

  /// The secure content of the message that was sent to the contact. Use this
  /// field for engagements to <code>VOICE</code> and <code>EMAIL</code>.
  final String content;

  /// The ARN of the engagement.
  final String engagementArn;

  /// The user that started the engagement.
  final String sender;

  /// The secure subject of the message that was sent to the contact. Use this
  /// field for engagements to <code>VOICE</code> and <code>EMAIL</code>.
  final String subject;

  /// The ARN of the incident in which the engagement occurred.
  final String? incidentId;

  /// The insecure content of the message that was sent to the contact. Use this
  /// field for engagements to <code>SMS</code>.
  final String? publicContent;

  /// The insecure subject of the message that was sent to the contact. Use this
  /// field for engagements to <code>SMS</code>.
  final String? publicSubject;

  /// The time that the engagement started.
  final DateTime? startTime;

  /// The time that the engagement ended.
  final DateTime? stopTime;

  DescribeEngagementResult({
    required this.contactArn,
    required this.content,
    required this.engagementArn,
    required this.sender,
    required this.subject,
    this.incidentId,
    this.publicContent,
    this.publicSubject,
    this.startTime,
    this.stopTime,
  });

  factory DescribeEngagementResult.fromJson(Map<String, dynamic> json) {
    return DescribeEngagementResult(
      contactArn: json['ContactArn'] as String,
      content: json['Content'] as String,
      engagementArn: json['EngagementArn'] as String,
      sender: json['Sender'] as String,
      subject: json['Subject'] as String,
      incidentId: json['IncidentId'] as String?,
      publicContent: json['PublicContent'] as String?,
      publicSubject: json['PublicSubject'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      stopTime: timeStampFromJson(json['StopTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final contactArn = this.contactArn;
    final content = this.content;
    final engagementArn = this.engagementArn;
    final sender = this.sender;
    final subject = this.subject;
    final incidentId = this.incidentId;
    final publicContent = this.publicContent;
    final publicSubject = this.publicSubject;
    final startTime = this.startTime;
    final stopTime = this.stopTime;
    return {
      'ContactArn': contactArn,
      'Content': content,
      'EngagementArn': engagementArn,
      'Sender': sender,
      'Subject': subject,
      if (incidentId != null) 'IncidentId': incidentId,
      if (publicContent != null) 'PublicContent': publicContent,
      if (publicSubject != null) 'PublicSubject': publicSubject,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (stopTime != null) 'StopTime': unixTimestampToJson(stopTime),
    };
  }
}

class DescribePageResult {
  /// The ARN of the contact that was engaged.
  final String contactArn;

  /// The secure content of the message that was sent to the contact. Use this
  /// field for engagements to <code>VOICE</code> and <code>EMAIL</code>.
  final String content;

  /// The ARN of the engagement that engaged the contact channel.
  final String engagementArn;

  /// The Amazon Resource Name (ARN) of the engagement to a contact channel.
  final String pageArn;

  /// The user that started the engagement.
  final String sender;

  /// The secure subject of the message that was sent to the contact. Use this
  /// field for engagements to <code>VOICE</code> and <code>EMAIL</code>.
  final String subject;

  /// The time that the contact channel received the engagement.
  final DateTime? deliveryTime;

  /// The ARN of the incident that engaged the contact channel.
  final String? incidentId;

  /// The insecure content of the message that was sent to the contact. Use this
  /// field for engagements to <code>SMS</code>.
  final String? publicContent;

  /// The insecure subject of the message that was sent to the contact. Use this
  /// field for engagements to <code>SMS</code>.
  final String? publicSubject;

  /// The time that the contact channel acknowledged the engagement.
  final DateTime? readTime;

  /// The time the engagement was sent to the contact channel.
  final DateTime? sentTime;

  DescribePageResult({
    required this.contactArn,
    required this.content,
    required this.engagementArn,
    required this.pageArn,
    required this.sender,
    required this.subject,
    this.deliveryTime,
    this.incidentId,
    this.publicContent,
    this.publicSubject,
    this.readTime,
    this.sentTime,
  });

  factory DescribePageResult.fromJson(Map<String, dynamic> json) {
    return DescribePageResult(
      contactArn: json['ContactArn'] as String,
      content: json['Content'] as String,
      engagementArn: json['EngagementArn'] as String,
      pageArn: json['PageArn'] as String,
      sender: json['Sender'] as String,
      subject: json['Subject'] as String,
      deliveryTime: timeStampFromJson(json['DeliveryTime']),
      incidentId: json['IncidentId'] as String?,
      publicContent: json['PublicContent'] as String?,
      publicSubject: json['PublicSubject'] as String?,
      readTime: timeStampFromJson(json['ReadTime']),
      sentTime: timeStampFromJson(json['SentTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final contactArn = this.contactArn;
    final content = this.content;
    final engagementArn = this.engagementArn;
    final pageArn = this.pageArn;
    final sender = this.sender;
    final subject = this.subject;
    final deliveryTime = this.deliveryTime;
    final incidentId = this.incidentId;
    final publicContent = this.publicContent;
    final publicSubject = this.publicSubject;
    final readTime = this.readTime;
    final sentTime = this.sentTime;
    return {
      'ContactArn': contactArn,
      'Content': content,
      'EngagementArn': engagementArn,
      'PageArn': pageArn,
      'Sender': sender,
      'Subject': subject,
      if (deliveryTime != null)
        'DeliveryTime': unixTimestampToJson(deliveryTime),
      if (incidentId != null) 'IncidentId': incidentId,
      if (publicContent != null) 'PublicContent': publicContent,
      if (publicSubject != null) 'PublicSubject': publicSubject,
      if (readTime != null) 'ReadTime': unixTimestampToJson(readTime),
      if (sentTime != null) 'SentTime': unixTimestampToJson(sentTime),
    };
  }
}

/// Incident Manager reaching out to a contact or escalation plan to engage
/// contact during an incident.
class Engagement {
  /// The ARN of the escalation plan or contact that Incident Manager is engaging.
  final String contactArn;

  /// The Amazon Resource Name (ARN) of the engagement.
  final String engagementArn;

  /// The user that started the engagement.
  final String sender;

  /// The ARN of the incident that's engaging the contact.
  final String? incidentId;

  /// The time that the engagement began.
  final DateTime? startTime;

  /// The time that the engagement ended.
  final DateTime? stopTime;

  Engagement({
    required this.contactArn,
    required this.engagementArn,
    required this.sender,
    this.incidentId,
    this.startTime,
    this.stopTime,
  });

  factory Engagement.fromJson(Map<String, dynamic> json) {
    return Engagement(
      contactArn: json['ContactArn'] as String,
      engagementArn: json['EngagementArn'] as String,
      sender: json['Sender'] as String,
      incidentId: json['IncidentId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      stopTime: timeStampFromJson(json['StopTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final contactArn = this.contactArn;
    final engagementArn = this.engagementArn;
    final sender = this.sender;
    final incidentId = this.incidentId;
    final startTime = this.startTime;
    final stopTime = this.stopTime;
    return {
      'ContactArn': contactArn,
      'EngagementArn': engagementArn,
      'Sender': sender,
      if (incidentId != null) 'IncidentId': incidentId,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (stopTime != null) 'StopTime': unixTimestampToJson(stopTime),
    };
  }
}

class GetContactChannelResult {
  /// The ARN of the contact that the channel belongs to.
  final String contactArn;

  /// The ARN of the contact channel.
  final String contactChannelArn;

  /// The details that Incident Manager uses when trying to engage the contact
  /// channel.
  final ContactChannelAddress deliveryAddress;

  /// The name of the contact channel
  final String name;

  /// The type of contact channel. The type is <code>SMS</code>,
  /// <code>VOICE</code>, or <code>EMAIL</code>.
  final ChannelType type;

  /// A Boolean value indicating if the contact channel has been activated or not.
  final ActivationStatus? activationStatus;

  GetContactChannelResult({
    required this.contactArn,
    required this.contactChannelArn,
    required this.deliveryAddress,
    required this.name,
    required this.type,
    this.activationStatus,
  });

  factory GetContactChannelResult.fromJson(Map<String, dynamic> json) {
    return GetContactChannelResult(
      contactArn: json['ContactArn'] as String,
      contactChannelArn: json['ContactChannelArn'] as String,
      deliveryAddress: ContactChannelAddress.fromJson(
          json['DeliveryAddress'] as Map<String, dynamic>),
      name: json['Name'] as String,
      type: (json['Type'] as String).toChannelType(),
      activationStatus:
          (json['ActivationStatus'] as String?)?.toActivationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final contactArn = this.contactArn;
    final contactChannelArn = this.contactChannelArn;
    final deliveryAddress = this.deliveryAddress;
    final name = this.name;
    final type = this.type;
    final activationStatus = this.activationStatus;
    return {
      'ContactArn': contactArn,
      'ContactChannelArn': contactChannelArn,
      'DeliveryAddress': deliveryAddress,
      'Name': name,
      'Type': type.toValue(),
      if (activationStatus != null)
        'ActivationStatus': activationStatus.toValue(),
    };
  }
}

class GetContactPolicyResult {
  /// The ARN of the contact or escalation plan.
  final String? contactArn;

  /// Details about the resource policy attached to the contact or escalation
  /// plan.
  final String? policy;

  GetContactPolicyResult({
    this.contactArn,
    this.policy,
  });

  factory GetContactPolicyResult.fromJson(Map<String, dynamic> json) {
    return GetContactPolicyResult(
      contactArn: json['ContactArn'] as String?,
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactArn = this.contactArn;
    final policy = this.policy;
    return {
      if (contactArn != null) 'ContactArn': contactArn,
      if (policy != null) 'Policy': policy,
    };
  }
}

class GetContactResult {
  /// The alias of the contact or escalation plan. The alias is unique and
  /// identifiable.
  final String alias;

  /// The ARN of the contact or escalation plan.
  final String contactArn;

  /// Details about the specific timing or stages and targets of the escalation
  /// plan or engagement plan.
  final Plan plan;

  /// The type of contact, either <code>PERSONAL</code> or
  /// <code>ESCALATION</code>.
  final ContactType type;

  /// The full name of the contact or escalation plan.
  final String? displayName;

  GetContactResult({
    required this.alias,
    required this.contactArn,
    required this.plan,
    required this.type,
    this.displayName,
  });

  factory GetContactResult.fromJson(Map<String, dynamic> json) {
    return GetContactResult(
      alias: json['Alias'] as String,
      contactArn: json['ContactArn'] as String,
      plan: Plan.fromJson(json['Plan'] as Map<String, dynamic>),
      type: (json['Type'] as String).toContactType(),
      displayName: json['DisplayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final contactArn = this.contactArn;
    final plan = this.plan;
    final type = this.type;
    final displayName = this.displayName;
    return {
      'Alias': alias,
      'ContactArn': contactArn,
      'Plan': plan,
      'Type': type.toValue(),
      if (displayName != null) 'DisplayName': displayName,
    };
  }
}

class GetRotationOverrideResult {
  /// The date and time when the override was created.
  final DateTime? createTime;

  /// The date and time when the override ends.
  final DateTime? endTime;

  /// The Amazon Resource Names (ARNs) of the contacts assigned to the override of
  /// the on-call rotation.
  final List<String>? newContactIds;

  /// The Amazon Resource Name (ARN) of the on-call rotation that was overridden.
  final String? rotationArn;

  /// The Amazon Resource Name (ARN) of the override to an on-call rotation.
  final String? rotationOverrideId;

  /// The date and time when the override goes into effect.
  final DateTime? startTime;

  GetRotationOverrideResult({
    this.createTime,
    this.endTime,
    this.newContactIds,
    this.rotationArn,
    this.rotationOverrideId,
    this.startTime,
  });

  factory GetRotationOverrideResult.fromJson(Map<String, dynamic> json) {
    return GetRotationOverrideResult(
      createTime: timeStampFromJson(json['CreateTime']),
      endTime: timeStampFromJson(json['EndTime']),
      newContactIds: (json['NewContactIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      rotationArn: json['RotationArn'] as String?,
      rotationOverrideId: json['RotationOverrideId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final endTime = this.endTime;
    final newContactIds = this.newContactIds;
    final rotationArn = this.rotationArn;
    final rotationOverrideId = this.rotationOverrideId;
    final startTime = this.startTime;
    return {
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (newContactIds != null) 'NewContactIds': newContactIds,
      if (rotationArn != null) 'RotationArn': rotationArn,
      if (rotationOverrideId != null) 'RotationOverrideId': rotationOverrideId,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

class GetRotationResult {
  /// The Amazon Resource Names (ARNs) of the contacts assigned to the on-call
  /// rotation team.
  final List<String> contactIds;

  /// The name of the on-call rotation.
  final String name;

  /// Specifies how long a rotation lasts before restarting at the beginning of
  /// the shift order.
  final RecurrenceSettings recurrence;

  /// The Amazon Resource Name (ARN) of the on-call rotation.
  final String rotationArn;

  /// The specified start time for the on-call rotation.
  final DateTime startTime;

  /// The time zone that the rotation’s activity is based on, in Internet Assigned
  /// Numbers Authority (IANA) format.
  final String timeZoneId;

  GetRotationResult({
    required this.contactIds,
    required this.name,
    required this.recurrence,
    required this.rotationArn,
    required this.startTime,
    required this.timeZoneId,
  });

  factory GetRotationResult.fromJson(Map<String, dynamic> json) {
    return GetRotationResult(
      contactIds: (json['ContactIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String,
      recurrence: RecurrenceSettings.fromJson(
          json['Recurrence'] as Map<String, dynamic>),
      rotationArn: json['RotationArn'] as String,
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
      timeZoneId: json['TimeZoneId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final contactIds = this.contactIds;
    final name = this.name;
    final recurrence = this.recurrence;
    final rotationArn = this.rotationArn;
    final startTime = this.startTime;
    final timeZoneId = this.timeZoneId;
    return {
      'ContactIds': contactIds,
      'Name': name,
      'Recurrence': recurrence,
      'RotationArn': rotationArn,
      'StartTime': unixTimestampToJson(startTime),
      'TimeZoneId': timeZoneId,
    };
  }
}

/// Details about when an on-call rotation shift begins or ends.
class HandOffTime {
  /// The hour when an on-call rotation shift begins or ends.
  final int hourOfDay;

  /// The minute when an on-call rotation shift begins or ends.
  final int minuteOfHour;

  HandOffTime({
    required this.hourOfDay,
    required this.minuteOfHour,
  });

  factory HandOffTime.fromJson(Map<String, dynamic> json) {
    return HandOffTime(
      hourOfDay: json['HourOfDay'] as int,
      minuteOfHour: json['MinuteOfHour'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final hourOfDay = this.hourOfDay;
    final minuteOfHour = this.minuteOfHour;
    return {
      'HourOfDay': hourOfDay,
      'MinuteOfHour': minuteOfHour,
    };
  }
}

class ListContactChannelsResult {
  /// A list of contact channels related to the specified contact.
  final List<ContactChannel> contactChannels;

  /// The pagination token to continue to the next page of results.
  final String? nextToken;

  ListContactChannelsResult({
    required this.contactChannels,
    this.nextToken,
  });

  factory ListContactChannelsResult.fromJson(Map<String, dynamic> json) {
    return ListContactChannelsResult(
      contactChannels: (json['ContactChannels'] as List)
          .whereNotNull()
          .map((e) => ContactChannel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactChannels = this.contactChannels;
    final nextToken = this.nextToken;
    return {
      'ContactChannels': contactChannels,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListContactsResult {
  /// A list of the contacts and escalation plans in your Incident Manager
  /// account.
  final List<Contact>? contacts;

  /// The pagination token to continue to the next page of results.
  final String? nextToken;

  ListContactsResult({
    this.contacts,
    this.nextToken,
  });

  factory ListContactsResult.fromJson(Map<String, dynamic> json) {
    return ListContactsResult(
      contacts: (json['Contacts'] as List?)
          ?.whereNotNull()
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contacts = this.contacts;
    final nextToken = this.nextToken;
    return {
      if (contacts != null) 'Contacts': contacts,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEngagementsResult {
  /// A list of each engagement that occurred during the specified time range of
  /// an incident.
  final List<Engagement> engagements;

  /// The pagination token to continue to the next page of results.
  final String? nextToken;

  ListEngagementsResult({
    required this.engagements,
    this.nextToken,
  });

  factory ListEngagementsResult.fromJson(Map<String, dynamic> json) {
    return ListEngagementsResult(
      engagements: (json['Engagements'] as List)
          .whereNotNull()
          .map((e) => Engagement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engagements = this.engagements;
    final nextToken = this.nextToken;
    return {
      'Engagements': engagements,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPageReceiptsResult {
  /// The pagination token to continue to the next page of results.
  final String? nextToken;

  /// A list of each acknowledgement.
  final List<Receipt>? receipts;

  ListPageReceiptsResult({
    this.nextToken,
    this.receipts,
  });

  factory ListPageReceiptsResult.fromJson(Map<String, dynamic> json) {
    return ListPageReceiptsResult(
      nextToken: json['NextToken'] as String?,
      receipts: (json['Receipts'] as List?)
          ?.whereNotNull()
          .map((e) => Receipt.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final receipts = this.receipts;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (receipts != null) 'Receipts': receipts,
    };
  }
}

class ListPageResolutionsResult {
  /// Information about the resolution for an engagement.
  final List<ResolutionContact> pageResolutions;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  ListPageResolutionsResult({
    required this.pageResolutions,
    this.nextToken,
  });

  factory ListPageResolutionsResult.fromJson(Map<String, dynamic> json) {
    return ListPageResolutionsResult(
      pageResolutions: (json['PageResolutions'] as List)
          .whereNotNull()
          .map((e) => ResolutionContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pageResolutions = this.pageResolutions;
    final nextToken = this.nextToken;
    return {
      'PageResolutions': pageResolutions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPagesByContactResult {
  /// The list of engagements to a contact's contact channel.
  final List<Page> pages;

  /// The pagination token to continue to the next page of results.
  final String? nextToken;

  ListPagesByContactResult({
    required this.pages,
    this.nextToken,
  });

  factory ListPagesByContactResult.fromJson(Map<String, dynamic> json) {
    return ListPagesByContactResult(
      pages: (json['Pages'] as List)
          .whereNotNull()
          .map((e) => Page.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pages = this.pages;
    final nextToken = this.nextToken;
    return {
      'Pages': pages,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPagesByEngagementResult {
  /// The list of engagements to contact channels.
  final List<Page> pages;

  /// The pagination token to continue to the next page of results.
  final String? nextToken;

  ListPagesByEngagementResult({
    required this.pages,
    this.nextToken,
  });

  factory ListPagesByEngagementResult.fromJson(Map<String, dynamic> json) {
    return ListPagesByEngagementResult(
      pages: (json['Pages'] as List)
          .whereNotNull()
          .map((e) => Page.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pages = this.pages;
    final nextToken = this.nextToken;
    return {
      'Pages': pages,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPreviewRotationShiftsResult {
  /// The token for the next set of items to return. This token is used to get the
  /// next set of results.
  final String? nextToken;

  /// Details about a rotation shift, including times, types, and contacts.
  final List<RotationShift>? rotationShifts;

  ListPreviewRotationShiftsResult({
    this.nextToken,
    this.rotationShifts,
  });

  factory ListPreviewRotationShiftsResult.fromJson(Map<String, dynamic> json) {
    return ListPreviewRotationShiftsResult(
      nextToken: json['NextToken'] as String?,
      rotationShifts: (json['RotationShifts'] as List?)
          ?.whereNotNull()
          .map((e) => RotationShift.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final rotationShifts = this.rotationShifts;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (rotationShifts != null) 'RotationShifts': rotationShifts,
    };
  }
}

class ListRotationOverridesResult {
  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  /// A list of rotation overrides in the specified time range.
  final List<RotationOverride>? rotationOverrides;

  ListRotationOverridesResult({
    this.nextToken,
    this.rotationOverrides,
  });

  factory ListRotationOverridesResult.fromJson(Map<String, dynamic> json) {
    return ListRotationOverridesResult(
      nextToken: json['NextToken'] as String?,
      rotationOverrides: (json['RotationOverrides'] as List?)
          ?.whereNotNull()
          .map((e) => RotationOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final rotationOverrides = this.rotationOverrides;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (rotationOverrides != null) 'RotationOverrides': rotationOverrides,
    };
  }
}

class ListRotationShiftsResult {
  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  /// Information about shifts that meet the filter criteria.
  final List<RotationShift>? rotationShifts;

  ListRotationShiftsResult({
    this.nextToken,
    this.rotationShifts,
  });

  factory ListRotationShiftsResult.fromJson(Map<String, dynamic> json) {
    return ListRotationShiftsResult(
      nextToken: json['NextToken'] as String?,
      rotationShifts: (json['RotationShifts'] as List?)
          ?.whereNotNull()
          .map((e) => RotationShift.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final rotationShifts = this.rotationShifts;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (rotationShifts != null) 'RotationShifts': rotationShifts,
    };
  }
}

class ListRotationsResult {
  /// Information about rotations that meet the filter criteria.
  final List<Rotation> rotations;

  /// The token for the next set of items to return. Use this token to get the
  /// next set of results.
  final String? nextToken;

  ListRotationsResult({
    required this.rotations,
    this.nextToken,
  });

  factory ListRotationsResult.fromJson(Map<String, dynamic> json) {
    return ListRotationsResult(
      rotations: (json['Rotations'] as List)
          .whereNotNull()
          .map((e) => Rotation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rotations = this.rotations;
    final nextToken = this.nextToken;
    return {
      'Rotations': rotations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResult {
  /// The tags related to the contact or escalation plan.
  final List<Tag>? tags;

  ListTagsForResourceResult({
    this.tags,
  });

  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
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

/// Information about on-call rotations that recur monthly.
class MonthlySetting {
  /// The day of the month when monthly recurring on-call rotations begin.
  final int dayOfMonth;

  /// The time of day when a monthly recurring on-call shift rotation begins.
  final HandOffTime handOffTime;

  MonthlySetting({
    required this.dayOfMonth,
    required this.handOffTime,
  });

  factory MonthlySetting.fromJson(Map<String, dynamic> json) {
    return MonthlySetting(
      dayOfMonth: json['DayOfMonth'] as int,
      handOffTime:
          HandOffTime.fromJson(json['HandOffTime'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final dayOfMonth = this.dayOfMonth;
    final handOffTime = this.handOffTime;
    return {
      'DayOfMonth': dayOfMonth,
      'HandOffTime': handOffTime,
    };
  }
}

/// Incident Manager engaging a contact's contact channel.
class Page {
  /// The ARN of the contact that Incident Manager is engaging.
  final String contactArn;

  /// The ARN of the engagement that this page is part of.
  final String engagementArn;

  /// The Amazon Resource Name (ARN) of the page to the contact channel.
  final String pageArn;

  /// The user that started the engagement.
  final String sender;

  /// The time the message was delivered to the contact channel.
  final DateTime? deliveryTime;

  /// The ARN of the incident that's engaging the contact channel.
  final String? incidentId;

  /// The time that the contact channel acknowledged engagement.
  final DateTime? readTime;

  /// The time that Incident Manager engaged the contact channel.
  final DateTime? sentTime;

  Page({
    required this.contactArn,
    required this.engagementArn,
    required this.pageArn,
    required this.sender,
    this.deliveryTime,
    this.incidentId,
    this.readTime,
    this.sentTime,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      contactArn: json['ContactArn'] as String,
      engagementArn: json['EngagementArn'] as String,
      pageArn: json['PageArn'] as String,
      sender: json['Sender'] as String,
      deliveryTime: timeStampFromJson(json['DeliveryTime']),
      incidentId: json['IncidentId'] as String?,
      readTime: timeStampFromJson(json['ReadTime']),
      sentTime: timeStampFromJson(json['SentTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final contactArn = this.contactArn;
    final engagementArn = this.engagementArn;
    final pageArn = this.pageArn;
    final sender = this.sender;
    final deliveryTime = this.deliveryTime;
    final incidentId = this.incidentId;
    final readTime = this.readTime;
    final sentTime = this.sentTime;
    return {
      'ContactArn': contactArn,
      'EngagementArn': engagementArn,
      'PageArn': pageArn,
      'Sender': sender,
      if (deliveryTime != null)
        'DeliveryTime': unixTimestampToJson(deliveryTime),
      if (incidentId != null) 'IncidentId': incidentId,
      if (readTime != null) 'ReadTime': unixTimestampToJson(readTime),
      if (sentTime != null) 'SentTime': unixTimestampToJson(sentTime),
    };
  }
}

/// Information about the stages and on-call rotation teams associated with an
/// escalation plan or engagement plan.
class Plan {
  /// The Amazon Resource Names (ARNs) of the on-call rotations associated with
  /// the plan.
  final List<String>? rotationIds;

  /// A list of stages that the escalation plan or engagement plan uses to engage
  /// contacts and contact methods.
  final List<Stage>? stages;

  Plan({
    this.rotationIds,
    this.stages,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      rotationIds: (json['RotationIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      stages: (json['Stages'] as List?)
          ?.whereNotNull()
          .map((e) => Stage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rotationIds = this.rotationIds;
    final stages = this.stages;
    return {
      if (rotationIds != null) 'RotationIds': rotationIds,
      if (stages != null) 'Stages': stages,
    };
  }
}

/// Information about contacts and times that an on-call override replaces.
class PreviewOverride {
  /// Information about the time a rotation override would end.
  final DateTime? endTime;

  /// Information about contacts to add to an on-call rotation override.
  final List<String>? newMembers;

  /// Information about the time a rotation override would begin.
  final DateTime? startTime;

  PreviewOverride({
    this.endTime,
    this.newMembers,
    this.startTime,
  });

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final newMembers = this.newMembers;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (newMembers != null) 'NewMembers': newMembers,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

class PutContactPolicyResult {
  PutContactPolicyResult();

  factory PutContactPolicyResult.fromJson(Map<String, dynamic> _) {
    return PutContactPolicyResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Records events during an engagement.
class Receipt {
  /// The time receipt was <code>SENT</code>, <code>DELIVERED</code>, or
  /// <code>READ</code>.
  final DateTime receiptTime;

  /// The type follows the engagement cycle, <code>SENT</code>,
  /// <code>DELIVERED</code>, and <code>READ</code>.
  final ReceiptType receiptType;

  /// The Amazon Resource Name (ARN) of the contact channel Incident Manager
  /// engaged.
  final String? contactChannelArn;

  /// Information provided during the page acknowledgement.
  final String? receiptInfo;

  Receipt({
    required this.receiptTime,
    required this.receiptType,
    this.contactChannelArn,
    this.receiptInfo,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) {
    return Receipt(
      receiptTime: nonNullableTimeStampFromJson(json['ReceiptTime'] as Object),
      receiptType: (json['ReceiptType'] as String).toReceiptType(),
      contactChannelArn: json['ContactChannelArn'] as String?,
      receiptInfo: json['ReceiptInfo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final receiptTime = this.receiptTime;
    final receiptType = this.receiptType;
    final contactChannelArn = this.contactChannelArn;
    final receiptInfo = this.receiptInfo;
    return {
      'ReceiptTime': unixTimestampToJson(receiptTime),
      'ReceiptType': receiptType.toValue(),
      if (contactChannelArn != null) 'ContactChannelArn': contactChannelArn,
      if (receiptInfo != null) 'ReceiptInfo': receiptInfo,
    };
  }
}

enum ReceiptType {
  delivered,
  error,
  read,
  sent,
  stop,
}

extension ReceiptTypeValueExtension on ReceiptType {
  String toValue() {
    switch (this) {
      case ReceiptType.delivered:
        return 'DELIVERED';
      case ReceiptType.error:
        return 'ERROR';
      case ReceiptType.read:
        return 'READ';
      case ReceiptType.sent:
        return 'SENT';
      case ReceiptType.stop:
        return 'STOP';
    }
  }
}

extension ReceiptTypeFromString on String {
  ReceiptType toReceiptType() {
    switch (this) {
      case 'DELIVERED':
        return ReceiptType.delivered;
      case 'ERROR':
        return ReceiptType.error;
      case 'READ':
        return ReceiptType.read;
      case 'SENT':
        return ReceiptType.sent;
      case 'STOP':
        return ReceiptType.stop;
    }
    throw Exception('$this is not known in enum ReceiptType');
  }
}

/// Information about when an on-call rotation is in effect and how long the
/// rotation period lasts.
class RecurrenceSettings {
  /// The number of contacts, or shift team members designated to be on call
  /// concurrently during a shift. For example, in an on-call schedule containing
  /// ten contacts, a value of <code>2</code> designates that two of them are on
  /// call at any given time.
  final int numberOfOnCalls;

  /// The number of days, weeks, or months a single rotation lasts.
  final int recurrenceMultiplier;

  /// Information about on-call rotations that recur daily.
  final List<HandOffTime>? dailySettings;

  /// Information about on-call rotations that recur monthly.
  final List<MonthlySetting>? monthlySettings;

  /// Information about the days of the week included in on-call rotation
  /// coverage.
  final Map<DayOfWeek, List<CoverageTime>>? shiftCoverages;

  /// Information about on-call rotations that recur weekly.
  final List<WeeklySetting>? weeklySettings;

  RecurrenceSettings({
    required this.numberOfOnCalls,
    required this.recurrenceMultiplier,
    this.dailySettings,
    this.monthlySettings,
    this.shiftCoverages,
    this.weeklySettings,
  });

  factory RecurrenceSettings.fromJson(Map<String, dynamic> json) {
    return RecurrenceSettings(
      numberOfOnCalls: json['NumberOfOnCalls'] as int,
      recurrenceMultiplier: json['RecurrenceMultiplier'] as int,
      dailySettings: (json['DailySettings'] as List?)
          ?.whereNotNull()
          .map((e) => HandOffTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      monthlySettings: (json['MonthlySettings'] as List?)
          ?.whereNotNull()
          .map((e) => MonthlySetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      shiftCoverages: (json['ShiftCoverages'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k.toDayOfWeek(),
              (e as List)
                  .whereNotNull()
                  .map((e) => CoverageTime.fromJson(e as Map<String, dynamic>))
                  .toList())),
      weeklySettings: (json['WeeklySettings'] as List?)
          ?.whereNotNull()
          .map((e) => WeeklySetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfOnCalls = this.numberOfOnCalls;
    final recurrenceMultiplier = this.recurrenceMultiplier;
    final dailySettings = this.dailySettings;
    final monthlySettings = this.monthlySettings;
    final shiftCoverages = this.shiftCoverages;
    final weeklySettings = this.weeklySettings;
    return {
      'NumberOfOnCalls': numberOfOnCalls,
      'RecurrenceMultiplier': recurrenceMultiplier,
      if (dailySettings != null) 'DailySettings': dailySettings,
      if (monthlySettings != null) 'MonthlySettings': monthlySettings,
      if (shiftCoverages != null)
        'ShiftCoverages':
            shiftCoverages.map((k, e) => MapEntry(k.toValue(), e)),
      if (weeklySettings != null) 'WeeklySettings': weeklySettings,
    };
  }
}

/// Information about the engagement resolution steps. The resolution starts
/// from the first contact, which can be an escalation plan, then resolves to an
/// on-call rotation, and finally to a personal contact.
///
/// The <code>ResolutionContact</code> structure describes the information for
/// each node or step in that process. It contains information about different
/// contact types, such as the escalation, rotation, and personal contacts.
class ResolutionContact {
  /// The Amazon Resource Name (ARN) of a contact in the engagement resolution
  /// process.
  final String contactArn;

  /// The type of contact for a resolution step.
  final ContactType type;

  /// The stage in the escalation plan that resolves to this contact.
  final int? stageIndex;

  ResolutionContact({
    required this.contactArn,
    required this.type,
    this.stageIndex,
  });

  factory ResolutionContact.fromJson(Map<String, dynamic> json) {
    return ResolutionContact(
      contactArn: json['ContactArn'] as String,
      type: (json['Type'] as String).toContactType(),
      stageIndex: json['StageIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactArn = this.contactArn;
    final type = this.type;
    final stageIndex = this.stageIndex;
    return {
      'ContactArn': contactArn,
      'Type': type.toValue(),
      if (stageIndex != null) 'StageIndex': stageIndex,
    };
  }
}

/// Information about a rotation in an on-call schedule.
class Rotation {
  /// The name of the rotation.
  final String name;

  /// The Amazon Resource Name (ARN) of the rotation.
  final String rotationArn;

  /// The Amazon Resource Names (ARNs) of the contacts assigned to the rotation
  /// team.
  final List<String>? contactIds;

  /// Information about when an on-call rotation is in effect and how long the
  /// rotation period lasts.
  final RecurrenceSettings? recurrence;

  /// The date and time the rotation becomes active.
  final DateTime? startTime;

  /// The time zone the rotation’s activity is based on, in Internet Assigned
  /// Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC",
  /// or "Asia/Seoul".
  final String? timeZoneId;

  Rotation({
    required this.name,
    required this.rotationArn,
    this.contactIds,
    this.recurrence,
    this.startTime,
    this.timeZoneId,
  });

  factory Rotation.fromJson(Map<String, dynamic> json) {
    return Rotation(
      name: json['Name'] as String,
      rotationArn: json['RotationArn'] as String,
      contactIds: (json['ContactIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      recurrence: json['Recurrence'] != null
          ? RecurrenceSettings.fromJson(
              json['Recurrence'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      timeZoneId: json['TimeZoneId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final rotationArn = this.rotationArn;
    final contactIds = this.contactIds;
    final recurrence = this.recurrence;
    final startTime = this.startTime;
    final timeZoneId = this.timeZoneId;
    return {
      'Name': name,
      'RotationArn': rotationArn,
      if (contactIds != null) 'ContactIds': contactIds,
      if (recurrence != null) 'Recurrence': recurrence,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (timeZoneId != null) 'TimeZoneId': timeZoneId,
    };
  }
}

/// Information about an override specified for an on-call rotation.
class RotationOverride {
  /// The time a rotation override was created.
  final DateTime createTime;

  /// The time a rotation override ends.
  final DateTime endTime;

  /// The Amazon Resource Names (ARNs) of the contacts assigned to the override of
  /// the on-call rotation.
  final List<String> newContactIds;

  /// The Amazon Resource Name (ARN) of the override to an on-call rotation.
  final String rotationOverrideId;

  /// The time a rotation override begins.
  final DateTime startTime;

  RotationOverride({
    required this.createTime,
    required this.endTime,
    required this.newContactIds,
    required this.rotationOverrideId,
    required this.startTime,
  });

  factory RotationOverride.fromJson(Map<String, dynamic> json) {
    return RotationOverride(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      newContactIds: (json['NewContactIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      rotationOverrideId: json['RotationOverrideId'] as String,
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final endTime = this.endTime;
    final newContactIds = this.newContactIds;
    final rotationOverrideId = this.rotationOverrideId;
    final startTime = this.startTime;
    return {
      'CreateTime': unixTimestampToJson(createTime),
      'EndTime': unixTimestampToJson(endTime),
      'NewContactIds': newContactIds,
      'RotationOverrideId': rotationOverrideId,
      'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// Information about a shift that belongs to an on-call rotation.
class RotationShift {
  /// The time a shift rotation ends.
  final DateTime endTime;

  /// The time a shift rotation begins.
  final DateTime startTime;

  /// The Amazon Resource Names (ARNs) of the contacts who are part of the shift
  /// rotation.
  final List<String>? contactIds;

  /// Additional information about an on-call rotation shift.
  final ShiftDetails? shiftDetails;

  /// The type of shift rotation.
  final ShiftType? type;

  RotationShift({
    required this.endTime,
    required this.startTime,
    this.contactIds,
    this.shiftDetails,
    this.type,
  });

  factory RotationShift.fromJson(Map<String, dynamic> json) {
    return RotationShift(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
      contactIds: (json['ContactIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      shiftDetails: json['ShiftDetails'] != null
          ? ShiftDetails.fromJson(json['ShiftDetails'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toShiftType(),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    final contactIds = this.contactIds;
    final shiftDetails = this.shiftDetails;
    final type = this.type;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
      if (contactIds != null) 'ContactIds': contactIds,
      if (shiftDetails != null) 'ShiftDetails': shiftDetails,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class SendActivationCodeResult {
  SendActivationCodeResult();

  factory SendActivationCodeResult.fromJson(Map<String, dynamic> _) {
    return SendActivationCodeResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about overrides to an on-call rotation shift.
class ShiftDetails {
  /// The Amazon Resources Names (ARNs) of the contacts who were replaced in a
  /// shift when an override was created. If the override is deleted, these
  /// contacts are restored to the shift.
  final List<String> overriddenContactIds;

  ShiftDetails({
    required this.overriddenContactIds,
  });

  factory ShiftDetails.fromJson(Map<String, dynamic> json) {
    return ShiftDetails(
      overriddenContactIds: (json['OverriddenContactIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final overriddenContactIds = this.overriddenContactIds;
    return {
      'OverriddenContactIds': overriddenContactIds,
    };
  }
}

enum ShiftType {
  regular,
  overridden,
}

extension ShiftTypeValueExtension on ShiftType {
  String toValue() {
    switch (this) {
      case ShiftType.regular:
        return 'REGULAR';
      case ShiftType.overridden:
        return 'OVERRIDDEN';
    }
  }
}

extension ShiftTypeFromString on String {
  ShiftType toShiftType() {
    switch (this) {
      case 'REGULAR':
        return ShiftType.regular;
      case 'OVERRIDDEN':
        return ShiftType.overridden;
    }
    throw Exception('$this is not known in enum ShiftType');
  }
}

/// A set amount of time that an escalation plan or engagement plan engages the
/// specified contacts or contact methods.
class Stage {
  /// The time to wait until beginning the next stage. The duration can only be
  /// set to 0 if a target is specified.
  final int durationInMinutes;

  /// The contacts or contact methods that the escalation plan or engagement plan
  /// is engaging.
  final List<Target> targets;

  Stage({
    required this.durationInMinutes,
    required this.targets,
  });

  factory Stage.fromJson(Map<String, dynamic> json) {
    return Stage(
      durationInMinutes: json['DurationInMinutes'] as int,
      targets: (json['Targets'] as List)
          .whereNotNull()
          .map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final durationInMinutes = this.durationInMinutes;
    final targets = this.targets;
    return {
      'DurationInMinutes': durationInMinutes,
      'Targets': targets,
    };
  }
}

class StartEngagementResult {
  /// The ARN of the engagement.
  final String engagementArn;

  StartEngagementResult({
    required this.engagementArn,
  });

  factory StartEngagementResult.fromJson(Map<String, dynamic> json) {
    return StartEngagementResult(
      engagementArn: json['EngagementArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final engagementArn = this.engagementArn;
    return {
      'EngagementArn': engagementArn,
    };
  }
}

class StopEngagementResult {
  StopEngagementResult();

  factory StopEngagementResult.fromJson(Map<String, dynamic> _) {
    return StopEngagementResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A container of a key-value name pair.
class Tag {
  /// Name of the object key.
  final String? key;

  /// Value of the tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
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

/// The contact or contact channel that's being engaged.
class Target {
  /// Information about the contact channel Incident Manager is engaging.
  final ChannelTargetInfo? channelTargetInfo;

  /// Information about the contact that Incident Manager is engaging.
  final ContactTargetInfo? contactTargetInfo;

  Target({
    this.channelTargetInfo,
    this.contactTargetInfo,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      channelTargetInfo: json['ChannelTargetInfo'] != null
          ? ChannelTargetInfo.fromJson(
              json['ChannelTargetInfo'] as Map<String, dynamic>)
          : null,
      contactTargetInfo: json['ContactTargetInfo'] != null
          ? ContactTargetInfo.fromJson(
              json['ContactTargetInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelTargetInfo = this.channelTargetInfo;
    final contactTargetInfo = this.contactTargetInfo;
    return {
      if (channelTargetInfo != null) 'ChannelTargetInfo': channelTargetInfo,
      if (contactTargetInfo != null) 'ContactTargetInfo': contactTargetInfo,
    };
  }
}

/// A range of between two set times
class TimeRange {
  /// The end of the time range.
  final DateTime? endTime;

  /// The start of the time range.
  final DateTime? startTime;

  TimeRange({
    this.endTime,
    this.startTime,
  });

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
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

class UpdateContactChannelResult {
  UpdateContactChannelResult();

  factory UpdateContactChannelResult.fromJson(Map<String, dynamic> _) {
    return UpdateContactChannelResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateContactResult {
  UpdateContactResult();

  factory UpdateContactResult.fromJson(Map<String, dynamic> _) {
    return UpdateContactResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateRotationResult {
  UpdateRotationResult();

  factory UpdateRotationResult.fromJson(Map<String, dynamic> _) {
    return UpdateRotationResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about rotations that recur weekly.
class WeeklySetting {
  /// The day of the week when weekly recurring on-call shift rotations begins.
  final DayOfWeek dayOfWeek;

  /// The time of day when a weekly recurring on-call shift rotation begins.
  final HandOffTime handOffTime;

  WeeklySetting({
    required this.dayOfWeek,
    required this.handOffTime,
  });

  factory WeeklySetting.fromJson(Map<String, dynamic> json) {
    return WeeklySetting(
      dayOfWeek: (json['DayOfWeek'] as String).toDayOfWeek(),
      handOffTime:
          HandOffTime.fromJson(json['HandOffTime'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final dayOfWeek = this.dayOfWeek;
    final handOffTime = this.handOffTime;
    return {
      'DayOfWeek': dayOfWeek.toValue(),
      'HandOffTime': handOffTime,
    };
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

class DataEncryptionException extends _s.GenericAwsException {
  DataEncryptionException({String? type, String? message})
      : super(type: type, code: 'DataEncryptionException', message: message);
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
  'DataEncryptionException': (type, message) =>
      DataEncryptionException(type: type, message: message),
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
