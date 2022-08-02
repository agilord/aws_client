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
          endpointUrl: endpointUrl,
        );

  /// Used to acknowledge an engagement to a contact channel during an incident.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [acceptCode] :
  /// The accept code is a 6-digit code used to acknowledge the page.
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
    ArgumentError.checkNotNull(acceptCode, 'acceptCode');
    ArgumentError.checkNotNull(acceptType, 'acceptType');
    ArgumentError.checkNotNull(pageId, 'pageId');
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
    ArgumentError.checkNotNull(activationCode, 'activationCode');
    ArgumentError.checkNotNull(contactChannelId, 'contactChannelId');
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
    ArgumentError.checkNotNull(alias, 'alias');
    ArgumentError.checkNotNull(plan, 'plan');
    ArgumentError.checkNotNull(type, 'type');
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
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(deliveryAddress, 'deliveryAddress');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(type, 'type');
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
    ArgumentError.checkNotNull(contactChannelId, 'contactChannelId');
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
  /// May throw [ValidationException].
  ///
  /// Parameter [contactId] :
  /// The Amazon Resource Name (ARN) of the contact that you're deleting.
  Future<void> deleteContact({
    required String contactId,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
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
    ArgumentError.checkNotNull(contactChannelId, 'contactChannelId');
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
    ArgumentError.checkNotNull(engagementId, 'engagementId');
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
    ArgumentError.checkNotNull(pageId, 'pageId');
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
    ArgumentError.checkNotNull(contactId, 'contactId');
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
    ArgumentError.checkNotNull(contactChannelId, 'contactChannelId');
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
    ArgumentError.checkNotNull(contactArn, 'contactArn');
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
    ArgumentError.checkNotNull(contactId, 'contactId');
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
    ArgumentError.checkNotNull(pageId, 'pageId');
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
    ArgumentError.checkNotNull(contactId, 'contactId');
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
    ArgumentError.checkNotNull(engagementId, 'engagementId');
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
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
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
    ArgumentError.checkNotNull(contactArn, 'contactArn');
    ArgumentError.checkNotNull(policy, 'policy');
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
    ArgumentError.checkNotNull(contactChannelId, 'contactChannelId');
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
    ArgumentError.checkNotNull(contactId, 'contactId');
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(sender, 'sender');
    ArgumentError.checkNotNull(subject, 'subject');
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
    ArgumentError.checkNotNull(engagementId, 'engagementId');
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
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
    ArgumentError.checkNotNull(contactId, 'contactId');
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
    ArgumentError.checkNotNull(contactChannelId, 'contactChannelId');
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
}

enum AcceptCodeValidation {
  ignore,
  enforce,
}

extension on AcceptCodeValidation {
  String toValue() {
    switch (this) {
      case AcceptCodeValidation.ignore:
        return 'IGNORE';
      case AcceptCodeValidation.enforce:
        return 'ENFORCE';
    }
  }
}

extension on String {
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

extension on AcceptType {
  String toValue() {
    switch (this) {
      case AcceptType.delivered:
        return 'DELIVERED';
      case AcceptType.read:
        return 'READ';
    }
  }
}

extension on String {
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

extension on ActivationStatus {
  String toValue() {
    switch (this) {
      case ActivationStatus.activated:
        return 'ACTIVATED';
      case ActivationStatus.notActivated:
        return 'NOT_ACTIVATED';
    }
  }
}

extension on String {
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

extension on ChannelType {
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

extension on String {
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
}

extension on ContactType {
  String toValue() {
    switch (this) {
      case ContactType.personal:
        return 'PERSONAL';
      case ContactType.escalation:
        return 'ESCALATION';
    }
  }
}

extension on String {
  ContactType toContactType() {
    switch (this) {
      case 'PERSONAL':
        return ContactType.personal;
      case 'ESCALATION':
        return ContactType.escalation;
    }
    throw Exception('$this is not known in enum ContactType');
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

/// The stages that an escalation plan or engagement plan engages contacts and
/// contact methods in.
class Plan {
  /// A list of stages that the escalation plan or engagement plan uses to engage
  /// contacts and contact methods.
  final List<Stage> stages;

  Plan({
    required this.stages,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      stages: (json['Stages'] as List)
          .whereNotNull()
          .map((e) => Stage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stages = this.stages;
    return {
      'Stages': stages,
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

extension on ReceiptType {
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

extension on String {
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

class SendActivationCodeResult {
  SendActivationCodeResult();

  factory SendActivationCodeResult.fromJson(Map<String, dynamic> _) {
    return SendActivationCodeResult();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  factory TimeRange.fromJson(Map<String, dynamic> json) {
    return TimeRange(
      endTime: timeStampFromJson(json['EndTime']),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

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
