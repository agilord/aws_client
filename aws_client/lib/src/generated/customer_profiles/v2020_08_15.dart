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

/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Operations_Amazon_Connect_Customer_Profiles.html">Customer
/// Profiles actions</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Types_Amazon_Connect_Customer_Profiles.html">Customer
/// Profiles data types</a>
/// </li>
/// </ul>
/// Connect Customer Customer Profiles is a unified customer profile for your
/// contact center that has pre-built connectors powered by AppFlow that make it
/// easy to combine customer information from third party applications, such as
/// Salesforce (CRM), ServiceNow (ITSM), and your enterprise resource planning
/// (ERP), with contact history from your Connect Customer contact center.
class CustomerProfiles {
  final _s.RestJsonProtocol _protocol;
  CustomerProfiles({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'profile',
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

  /// Associates a new key value with a specific profile, such as a Contact
  /// Record ContactId.
  ///
  /// A profile object can have a single unique key and any number of additional
  /// keys that can be used to identify the profile that it belongs to.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [keyName] :
  /// A searchable identifier of a customer profile. The predefined keys you can
  /// use include: _account, _profileId, _assetId, _caseId, _orderId, _fullName,
  /// _phone, _email, _ctrContactId, _marketoLeadId, _salesforceAccountId,
  /// _salesforceContactId, _salesforceAssetId, _zendeskUserId,
  /// _zendeskExternalId, _zendeskTicketId, _serviceNowSystemId,
  /// _serviceNowIncidentId, _segmentUserId, _shopifyCustomerId,
  /// _shopifyOrderId.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of a customer profile.
  ///
  /// Parameter [values] :
  /// A list of key values.
  Future<AddProfileKeyResponse> addProfileKey({
    required String domainName,
    required String keyName,
    required String profileId,
    required List<String> values,
  }) async {
    final $payload = <String, dynamic>{
      'KeyName': keyName,
      'ProfileId': profileId,
      'Values': values,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/profiles/keys',
      exceptionFnMap: _exceptionFns,
    );
    return AddProfileKeyResponse.fromJson(response);
  }

  /// Fetch the possible attribute values given the attribute name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatedAttributeName] :
  /// The unique name of the calculated attribute.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [profileIds] :
  /// List of unique identifiers for customer profiles to retrieve.
  ///
  /// Parameter [conditionOverrides] :
  /// Overrides the condition block within the original calculated attribute
  /// definition.
  Future<BatchGetCalculatedAttributeForProfileResponse>
      batchGetCalculatedAttributeForProfile({
    required String calculatedAttributeName,
    required String domainName,
    required List<String> profileIds,
    ConditionOverrides? conditionOverrides,
  }) async {
    final $payload = <String, dynamic>{
      'ProfileIds': profileIds,
      if (conditionOverrides != null) 'ConditionOverrides': conditionOverrides,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/calculated-attributes/${Uri.encodeComponent(calculatedAttributeName)}/batch-get-for-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetCalculatedAttributeForProfileResponse.fromJson(response);
  }

  /// Get a batch of profiles.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [profileIds] :
  /// List of unique identifiers for customer profiles to retrieve.
  Future<BatchGetProfileResponse> batchGetProfile({
    required String domainName,
    required List<String> profileIds,
  }) async {
    final $payload = <String, dynamic>{
      'ProfileIds': profileIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/batch-get-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetProfileResponse.fromJson(response);
  }

  /// Adds multiple profile objects to a domain of a given ObjectType in a
  /// single API call.
  ///
  /// When adding a specific profile object, like a Contact Record, an inferred
  /// profile can get created if it is not mapped to an existing profile. The
  /// resulting profile will only have a phone number populated in the standard
  /// ProfileObject. Any additional Contact Records with the same phone number
  /// will be mapped to the same inferred profile.
  ///
  /// When a ProfileObject is created and if a ProfileObjectType already exists
  /// for the ProfileObject, it will provide data to a standard profile
  /// depending on the ProfileObjectType definition.
  ///
  /// BatchPutProfileObject needs an ObjectType, which can be created using
  /// PutProfileObjectType.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [items] :
  /// A list of items to add to the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The name of the profile object type.
  Future<BatchPutProfileObjectResponse> batchPutProfileObject({
    required String domainName,
    required List<BatchPutProfileObjectRequestItem> items,
    required String objectTypeName,
  }) async {
    final $payload = <String, dynamic>{
      'Items': items,
      'ObjectTypeName': objectTypeName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profiles/objects/batch-put-profile-object',
      exceptionFnMap: _exceptionFns,
    );
    return BatchPutProfileObjectResponse.fromJson(response);
  }

  /// Creates a new calculated attribute definition. After creation, new object
  /// data ingested into Customer Profiles will be included in the calculated
  /// attribute, which can be retrieved for a profile using the <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetCalculatedAttributeForProfile.html">GetCalculatedAttributeForProfile</a>
  /// API. Defining a calculated attribute makes it available for all profiles
  /// within a domain. Each calculated attribute can only reference one
  /// <code>ObjectType</code> and at most, two fields from that
  /// <code>ObjectType</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [attributeDetails] :
  /// Mathematical expression and a list of attribute items specified in that
  /// expression.
  ///
  /// Parameter [calculatedAttributeName] :
  /// The unique name of the calculated attribute.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [statistic] :
  /// The aggregation operation to perform for the calculated attribute.
  ///
  /// Parameter [conditions] :
  /// The conditions including range, object count, and threshold for the
  /// calculated attribute.
  ///
  /// Parameter [description] :
  /// The description of the calculated attribute.
  ///
  /// Parameter [displayName] :
  /// The display name of the calculated attribute.
  ///
  /// Parameter [filter] :
  /// Defines how to filter incoming objects to include part of the Calculated
  /// Attribute.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  ///
  /// Parameter [useHistoricalData] :
  /// Whether historical data ingested before the Calculated Attribute was
  /// created should be included in calculations.
  Future<CreateCalculatedAttributeDefinitionResponse>
      createCalculatedAttributeDefinition({
    required AttributeDetails attributeDetails,
    required String calculatedAttributeName,
    required String domainName,
    required Statistic statistic,
    Conditions? conditions,
    String? description,
    String? displayName,
    Filter? filter,
    Map<String, String>? tags,
    bool? useHistoricalData,
  }) async {
    final $payload = <String, dynamic>{
      'AttributeDetails': attributeDetails,
      'Statistic': statistic.value,
      if (conditions != null) 'Conditions': conditions,
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (filter != null) 'Filter': filter,
      if (tags != null) 'Tags': tags,
      if (useHistoricalData != null) 'UseHistoricalData': useHistoricalData,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/calculated-attributes/${Uri.encodeComponent(calculatedAttributeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCalculatedAttributeDefinitionResponse.fromJson(response);
  }

  /// Creates a domain, which is a container for all customer data, such as
  /// customer profile attributes, object types, profile keys, and encryption
  /// keys. You can create multiple domains, and each domain can have multiple
  /// third-party integrations.
  ///
  /// Each Connect Customer instance can be associated with only one domain.
  /// Multiple Connect Customer instances can be associated with one domain.
  ///
  /// Use this API or <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_UpdateDomain.html">UpdateDomain</a>
  /// to enable <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">identity
  /// resolution</a>: set <code>Matching</code> to true.
  ///
  /// To prevent cross-service impersonation when you call this API, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/cross-service-confused-deputy-prevention.html">Cross-service
  /// confused deputy prevention</a> for sample policies that you should apply.
  /// <note>
  /// It is not possible to associate a Customer Profiles domain with an Amazon
  /// Connect Instance directly from the API. If you would like to create a
  /// domain and associate a Customer Profiles domain, use the Amazon Connect
  /// admin website. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/enable-customer-profiles.html#enable-customer-profiles-step1">Enable
  /// Customer Profiles</a>.
  ///
  /// Each Amazon Connect instance can be associated with only one domain.
  /// Multiple Amazon Connect instances can be associated with one domain.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [defaultExpirationDays] :
  /// The default number of days until the data within the domain expires.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [dataStore] :
  /// Set to true to enabled data store for this domain.
  ///
  /// Parameter [deadLetterQueueUrl] :
  /// The URL of the SQS dead letter queue, which is used for reporting errors
  /// associated with ingesting data from third party applications. You must set
  /// up a policy on the DeadLetterQueue for the SendMessage operation to enable
  /// Amazon Connect Customer Profiles to send messages to the DeadLetterQueue.
  ///
  /// Parameter [defaultEncryptionKey] :
  /// The default encryption key, which is an AWS managed key, is used when no
  /// specific type of encryption key is specified. It is used to encrypt all
  /// data before it is placed in permanent or semi-permanent storage.
  ///
  /// Parameter [matching] :
  /// The process of matching duplicate profiles. If <code>Matching</code> =
  /// <code>true</code>, Amazon Connect Customer Profiles starts a weekly batch
  /// process called Identity Resolution Job. If you do not specify a date and
  /// time for Identity Resolution Job to run, by default it runs every Saturday
  /// at 12AM UTC to detect duplicate profiles in your domains.
  ///
  /// After the Identity Resolution Job completes, use the <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">GetMatches</a>
  /// API to return and review the results. Or, if you have configured
  /// <code>ExportingConfig</code> in the <code>MatchingRequest</code>, you can
  /// download the results from S3.
  ///
  /// Parameter [ruleBasedMatching] :
  /// The process of matching duplicate profiles using the Rule-Based matching.
  /// If <code>RuleBasedMatching</code> = true, Connect Customer Customer
  /// Profiles will start to match and merge your profiles according to your
  /// configuration in the <code>RuleBasedMatchingRequest</code>. You can use
  /// the <code>ListRuleBasedMatches</code> and <code>GetSimilarProfiles</code>
  /// API to return and review the results. Also, if you have configured
  /// <code>ExportingConfig</code> in the <code>RuleBasedMatchingRequest</code>,
  /// you can download the results from S3.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateDomainResponse> createDomain({
    required int defaultExpirationDays,
    required String domainName,
    DataStoreRequest? dataStore,
    String? deadLetterQueueUrl,
    String? defaultEncryptionKey,
    MatchingRequest? matching,
    RuleBasedMatchingRequest? ruleBasedMatching,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'defaultExpirationDays',
      defaultExpirationDays,
      1,
      1098,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'DefaultExpirationDays': defaultExpirationDays,
      if (dataStore != null) 'DataStore': dataStore,
      if (deadLetterQueueUrl != null) 'DeadLetterQueueUrl': deadLetterQueueUrl,
      if (defaultEncryptionKey != null)
        'DefaultEncryptionKey': defaultEncryptionKey,
      if (matching != null) 'Matching': matching,
      if (ruleBasedMatching != null) 'RuleBasedMatching': ruleBasedMatching,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainResponse.fromJson(response);
  }

  /// Creates the layout to view data for a specific domain. This API can only
  /// be invoked from the Amazon Connect admin website.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [description] :
  /// The description of the layout
  ///
  /// Parameter [displayName] :
  /// The display name of the layout
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [layout] :
  /// A customizable layout that can be used to view data under a Customer
  /// Profiles domain.
  ///
  /// Parameter [layoutDefinitionName] :
  /// The unique name of the layout.
  ///
  /// Parameter [layoutType] :
  /// The type of layout that can be used to view data under a Customer Profiles
  /// domain.
  ///
  /// Parameter [isDefault] :
  /// If set to true for a layout, this layout will be used by default to view
  /// data. If set to false, then the layout will not be used by default, but it
  /// can be used to view data by explicitly selecting it in the console.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateDomainLayoutResponse> createDomainLayout({
    required String description,
    required String displayName,
    required String domainName,
    required String layout,
    required String layoutDefinitionName,
    required LayoutType layoutType,
    bool? isDefault,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Description': description,
      'DisplayName': displayName,
      'Layout': layout,
      'LayoutType': layoutType.value,
      if (isDefault != null) 'IsDefault': isDefault,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/layouts/${Uri.encodeComponent(layoutDefinitionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainLayoutResponse.fromJson(response);
  }

  /// Creates an event stream, which is a subscription to real-time events, such
  /// as when profiles are created and updated through Connect Customer Customer
  /// Profiles.
  ///
  /// Each event stream can be associated with only one Kinesis Data Stream
  /// destination in the same region and Amazon Web Services account as the
  /// customer profiles domain
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [eventStreamName] :
  /// The name of the event stream.
  ///
  /// Parameter [uri] :
  /// The StreamARN of the destination to deliver profile events to. For
  /// example, arn:aws:kinesis:region:account-id:stream/stream-name
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateEventStreamResponse> createEventStream({
    required String domainName,
    required String eventStreamName,
    required String uri,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Uri': uri,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/event-streams/${Uri.encodeComponent(eventStreamName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEventStreamResponse.fromJson(response);
  }

  /// Creates an event trigger, which specifies the rules when to perform action
  /// based on customer's ingested data.
  ///
  /// Each event stream can be associated with only one integration in the same
  /// region and AWS account as the event stream.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [eventTriggerConditions] :
  /// A list of conditions that determine when an event should trigger the
  /// destination.
  ///
  /// Parameter [eventTriggerName] :
  /// The unique name of the event trigger.
  ///
  /// Parameter [objectTypeName] :
  /// The unique name of the object type.
  ///
  /// Parameter [description] :
  /// The description of the event trigger.
  ///
  /// Parameter [eventTriggerLimits] :
  /// Defines limits controlling whether an event triggers the destination,
  /// based on ingestion latency and the number of invocations per profile over
  /// specific time periods.
  ///
  /// Parameter [segmentFilter] :
  /// The destination is triggered only for profiles that meet the criteria of a
  /// segment definition.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs to apply to this resource.
  Future<CreateEventTriggerResponse> createEventTrigger({
    required String domainName,
    required List<EventTriggerCondition> eventTriggerConditions,
    required String eventTriggerName,
    required String objectTypeName,
    String? description,
    EventTriggerLimits? eventTriggerLimits,
    String? segmentFilter,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'EventTriggerConditions': eventTriggerConditions,
      'ObjectTypeName': objectTypeName,
      if (description != null) 'Description': description,
      if (eventTriggerLimits != null) 'EventTriggerLimits': eventTriggerLimits,
      if (segmentFilter != null) 'SegmentFilter': segmentFilter,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/event-triggers/${Uri.encodeComponent(eventTriggerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEventTriggerResponse.fromJson(response);
  }

  /// Creates an integration workflow. An integration workflow is an async
  /// process which ingests historic data and sets up an integration for ongoing
  /// updates. The supported Amazon AppFlow sources are Salesforce, ServiceNow,
  /// and Marketo.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [integrationConfig] :
  /// Configuration data for integration workflow.
  ///
  /// Parameter [objectTypeName] :
  /// The name of the profile object type.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role. Customer Profiles assumes
  /// this role to create resources on your behalf as part of workflow
  /// execution.
  ///
  /// Parameter [workflowType] :
  /// The type of workflow. The only supported value is APPFLOW_INTEGRATION.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateIntegrationWorkflowResponse> createIntegrationWorkflow({
    required String domainName,
    required IntegrationConfig integrationConfig,
    required String objectTypeName,
    required String roleArn,
    required WorkflowType workflowType,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'IntegrationConfig': integrationConfig,
      'ObjectTypeName': objectTypeName,
      'RoleArn': roleArn,
      'WorkflowType': workflowType.value,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/workflows/integrations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIntegrationWorkflowResponse.fromJson(response);
  }

  /// Creates a standard profile.
  ///
  /// A standard profile represents the following attributes for a customer
  /// profile in a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [accountNumber] :
  /// An account number that you have assigned to the customer.
  ///
  /// Parameter [additionalInformation] :
  /// Any additional information relevant to the customer’s profile.
  ///
  /// Parameter [address] :
  /// A generic address associated with the customer that is not mailing,
  /// shipping, or billing.
  ///
  /// Parameter [attributes] :
  /// A key value pair of attributes of a customer profile.
  ///
  /// Parameter [billingAddress] :
  /// The customer’s billing address.
  ///
  /// Parameter [birthDate] :
  /// The customer’s birth date.
  ///
  /// Parameter [businessEmailAddress] :
  /// The customer’s business email address.
  ///
  /// Parameter [businessName] :
  /// The name of the customer’s business.
  ///
  /// Parameter [businessPhoneNumber] :
  /// The customer’s business phone number.
  ///
  /// Parameter [emailAddress] :
  /// The customer’s email address, which has not been specified as a personal
  /// or business address.
  ///
  /// Parameter [engagementPreferences] :
  /// Object that defines the preferred methods of engagement, per channel.
  ///
  /// Parameter [firstName] :
  /// The customer’s first name.
  ///
  /// Parameter [gender] :
  /// The gender with which the customer identifies.
  ///
  /// Parameter [genderString] :
  /// An alternative to <code>Gender</code> which accepts any string as input.
  ///
  /// Parameter [homePhoneNumber] :
  /// The customer’s home phone number.
  ///
  /// Parameter [lastName] :
  /// The customer’s last name.
  ///
  /// Parameter [mailingAddress] :
  /// The customer’s mailing address.
  ///
  /// Parameter [middleName] :
  /// The customer’s middle name.
  ///
  /// Parameter [mobilePhoneNumber] :
  /// The customer’s mobile phone number.
  ///
  /// Parameter [partyType] :
  /// The type of profile used to describe the customer.
  ///
  /// Parameter [partyTypeString] :
  /// An alternative to <code>PartyType</code> which accepts any string as
  /// input.
  ///
  /// Parameter [personalEmailAddress] :
  /// The customer’s personal email address.
  ///
  /// Parameter [phoneNumber] :
  /// The customer’s phone number, which has not been specified as a mobile,
  /// home, or business number.
  ///
  /// Parameter [profileType] :
  /// The type of the profile.
  ///
  /// Parameter [shippingAddress] :
  /// The customer’s shipping address.
  Future<CreateProfileResponse> createProfile({
    required String domainName,
    String? accountNumber,
    String? additionalInformation,
    Address? address,
    Map<String, String>? attributes,
    Address? billingAddress,
    String? birthDate,
    String? businessEmailAddress,
    String? businessName,
    String? businessPhoneNumber,
    String? emailAddress,
    EngagementPreferences? engagementPreferences,
    String? firstName,
    Gender? gender,
    String? genderString,
    String? homePhoneNumber,
    String? lastName,
    Address? mailingAddress,
    String? middleName,
    String? mobilePhoneNumber,
    PartyType? partyType,
    String? partyTypeString,
    String? personalEmailAddress,
    String? phoneNumber,
    ProfileType? profileType,
    Address? shippingAddress,
  }) async {
    final $payload = <String, dynamic>{
      if (accountNumber != null) 'AccountNumber': accountNumber,
      if (additionalInformation != null)
        'AdditionalInformation': additionalInformation,
      if (address != null) 'Address': address,
      if (attributes != null) 'Attributes': attributes,
      if (billingAddress != null) 'BillingAddress': billingAddress,
      if (birthDate != null) 'BirthDate': birthDate,
      if (businessEmailAddress != null)
        'BusinessEmailAddress': businessEmailAddress,
      if (businessName != null) 'BusinessName': businessName,
      if (businessPhoneNumber != null)
        'BusinessPhoneNumber': businessPhoneNumber,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (engagementPreferences != null)
        'EngagementPreferences': engagementPreferences,
      if (firstName != null) 'FirstName': firstName,
      if (gender != null) 'Gender': gender.value,
      if (genderString != null) 'GenderString': genderString,
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'PartyType': partyType.value,
      if (partyTypeString != null) 'PartyTypeString': partyTypeString,
      if (personalEmailAddress != null)
        'PersonalEmailAddress': personalEmailAddress,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (profileType != null) 'ProfileType': profileType.value,
      if (shippingAddress != null) 'ShippingAddress': shippingAddress,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/profiles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProfileResponse.fromJson(response);
  }

  /// Creates a recommender
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderName] :
  /// The name of the recommender.
  ///
  /// Parameter [recommenderRecipeName] :
  /// The name of the recommeder recipe.
  ///
  /// Parameter [description] :
  /// The description of the domain object type.
  ///
  /// Parameter [recommenderConfig] :
  /// The recommender configuration.
  ///
  /// Parameter [recommenderSchemaName] :
  /// The name of the recommender schema to use for this recommender. If not
  /// specified, the default schema is used.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateRecommenderResponse> createRecommender({
    required String domainName,
    required String recommenderName,
    required RecommenderRecipeName recommenderRecipeName,
    String? description,
    RecommenderConfig? recommenderConfig,
    String? recommenderSchemaName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'RecommenderRecipeName': recommenderRecipeName.value,
      if (description != null) 'Description': description,
      if (recommenderConfig != null) 'RecommenderConfig': recommenderConfig,
      if (recommenderSchemaName != null)
        'RecommenderSchemaName': recommenderSchemaName,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommenders/${Uri.encodeComponent(recommenderName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRecommenderResponse.fromJson(response);
  }

  /// Creates a recommender filter. A recommender filter specifies which items
  /// to include or exclude from recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderFilterExpression] :
  /// The filter expression that defines which items to include or exclude from
  /// recommendations.
  ///
  /// Parameter [recommenderFilterName] :
  /// The name of the recommender filter. The name must be unique within the
  /// domain.
  ///
  /// Parameter [description] :
  /// A description of the recommender filter.
  ///
  /// Parameter [recommenderSchemaName] :
  /// The name of the recommender schema to use for this recommender filter. If
  /// not specified, the default schema is used.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateRecommenderFilterResponse> createRecommenderFilter({
    required String domainName,
    required String recommenderFilterExpression,
    required String recommenderFilterName,
    String? description,
    String? recommenderSchemaName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'RecommenderFilterExpression': recommenderFilterExpression,
      if (description != null) 'Description': description,
      if (recommenderSchemaName != null)
        'RecommenderSchemaName': recommenderSchemaName,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommender-filters/${Uri.encodeComponent(recommenderFilterName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRecommenderFilterResponse.fromJson(response);
  }

  /// Creates a recommender schema. A recommender schema defines the set of data
  /// columns available for training recommenders and filters under a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [fields] :
  /// A map of dataset type to column definitions that specifies which data
  /// columns to include in the schema. The <code>_webAnalytics</code> and
  /// <code>_catalogItem</code> keys are supported.
  ///
  /// Parameter [recommenderSchemaName] :
  /// The name of the recommender schema. The name must be unique within the
  /// domain.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateRecommenderSchemaResponse> createRecommenderSchema({
    required String domainName,
    required Map<String, List<RecommenderSchemaField>> fields,
    required String recommenderSchemaName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Fields': fields,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommender-schemas/${Uri.encodeComponent(recommenderSchemaName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRecommenderSchemaResponse.fromJson(response);
  }

  /// Creates a segment definition associated to the given domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [displayName] :
  /// The display name of the segment definition.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [segmentDefinitionName] :
  /// The unique name of the segment definition.
  ///
  /// Parameter [description] :
  /// The description of the segment definition.
  ///
  /// Parameter [segmentGroups] :
  /// Specifies the base segments and dimensions for a segment definition along
  /// with their respective relationship.
  ///
  /// Parameter [segmentSort] :
  /// The segment sort.
  ///
  /// Parameter [segmentSqlQuery] :
  /// The segment SQL query.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateSegmentDefinitionResponse> createSegmentDefinition({
    required String displayName,
    required String domainName,
    required String segmentDefinitionName,
    String? description,
    SegmentGroup? segmentGroups,
    SegmentSort? segmentSort,
    String? segmentSqlQuery,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DisplayName': displayName,
      if (description != null) 'Description': description,
      if (segmentGroups != null) 'SegmentGroups': segmentGroups,
      if (segmentSort != null) 'SegmentSort': segmentSort,
      if (segmentSqlQuery != null) 'SegmentSqlQuery': segmentSqlQuery,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/segment-definitions/${Uri.encodeComponent(segmentDefinitionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSegmentDefinitionResponse.fromJson(response);
  }

  /// Creates a segment estimate query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [segmentQuery] :
  /// The segment query for calculating a segment estimate.
  ///
  /// Parameter [segmentSqlQuery] :
  /// The segment SQL query.
  Future<CreateSegmentEstimateResponse> createSegmentEstimate({
    required String domainName,
    SegmentGroupStructure? segmentQuery,
    String? segmentSqlQuery,
  }) async {
    final $payload = <String, dynamic>{
      if (segmentQuery != null) 'SegmentQuery': segmentQuery,
      if (segmentSqlQuery != null) 'SegmentSqlQuery': segmentSqlQuery,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/segment-estimates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSegmentEstimateResponse.fromJson(response);
  }

  /// Triggers a job to export a segment to a specified destination.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dataFormat] :
  /// The format in which the segment will be exported.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [segmentDefinitionName] :
  /// The name of the segment definition used in this snapshot request.
  ///
  /// Parameter [destinationUri] :
  /// The destination to which the segment will be exported. This field must be
  /// provided if the request is not submitted from the Connect Customer Admin
  /// Website.
  ///
  /// Parameter [encryptionKey] :
  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the exported
  /// segment.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that allows Customer
  /// Profiles service principal to assume the role for conducting KMS and S3
  /// operations.
  Future<CreateSegmentSnapshotResponse> createSegmentSnapshot({
    required DataFormat dataFormat,
    required String domainName,
    required String segmentDefinitionName,
    String? destinationUri,
    String? encryptionKey,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'DataFormat': dataFormat.value,
      if (destinationUri != null) 'DestinationUri': destinationUri,
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (roleArn != null) 'RoleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/segments/${Uri.encodeComponent(segmentDefinitionName)}/snapshots',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSegmentSnapshotResponse.fromJson(response);
  }

  /// Creates an Upload job to ingest data for segment imports. The metadata is
  /// created for the job with the provided field mapping and unique key.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [displayName] :
  /// The unique name of the upload job. Could be a file name to identify the
  /// upload job.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain. Domain should be exists for the upload job
  /// to be created.
  ///
  /// Parameter [fields] :
  /// The mapping between CSV Columns and Profile Object attributes. A map of
  /// the name and ObjectType field.
  ///
  /// Parameter [uniqueKey] :
  /// The unique key columns for de-duping the profiles used to map data to the
  /// profile.
  ///
  /// Parameter [dataExpiry] :
  /// The expiry duration for the profiles ingested with the job. If not
  /// provided, the system default of 2 weeks is used.
  Future<CreateUploadJobResponse> createUploadJob({
    required String displayName,
    required String domainName,
    required Map<String, ObjectTypeField> fields,
    required String uniqueKey,
    int? dataExpiry,
  }) async {
    _s.validateNumRange(
      'dataExpiry',
      dataExpiry,
      1,
      1098,
    );
    final $payload = <String, dynamic>{
      'DisplayName': displayName,
      'Fields': fields,
      'UniqueKey': uniqueKey,
      if (dataExpiry != null) 'DataExpiry': dataExpiry,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/upload-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUploadJobResponse.fromJson(response);
  }

  /// Deletes an existing calculated attribute definition. Note that deleting a
  /// default calculated attribute is possible, however once deleted, you will
  /// be unable to undo that action and will need to recreate it on your own
  /// using the CreateCalculatedAttributeDefinition API if you want it back.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatedAttributeName] :
  /// The unique name of the calculated attribute.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  Future<void> deleteCalculatedAttributeDefinition({
    required String calculatedAttributeName,
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/calculated-attributes/${Uri.encodeComponent(calculatedAttributeName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specific domain and all of its customer data, such as customer
  /// profile attributes and their related objects.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  Future<DeleteDomainResponse> deleteDomain({
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainResponse.fromJson(response);
  }

  /// Deletes the layout used to view data for a specific domain. This API can
  /// only be invoked from the Amazon Connect admin website.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [layoutDefinitionName] :
  /// The unique name of the layout.
  Future<DeleteDomainLayoutResponse> deleteDomainLayout({
    required String domainName,
    required String layoutDefinitionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/layouts/${Uri.encodeComponent(layoutDefinitionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainLayoutResponse.fromJson(response);
  }

  /// Delete a DomainObjectType for the given Domain and ObjectType name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The unique name of the domain object type.
  Future<void> deleteDomainObjectType({
    required String domainName,
    required String objectTypeName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/domain-object-types/${Uri.encodeComponent(objectTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disables and deletes the specified event stream.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [eventStreamName] :
  /// The name of the event stream
  Future<void> deleteEventStream({
    required String domainName,
    required String eventStreamName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/event-streams/${Uri.encodeComponent(eventStreamName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disable and deletes the Event Trigger.
  /// <note>
  /// You cannot delete an Event Trigger with an active Integration associated.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [eventTriggerName] :
  /// The unique name of the event trigger.
  Future<DeleteEventTriggerResponse> deleteEventTrigger({
    required String domainName,
    required String eventTriggerName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/event-triggers/${Uri.encodeComponent(eventTriggerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteEventTriggerResponse.fromJson(response);
  }

  /// Removes an integration from a specific domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [uri] :
  /// The URI of the S3 bucket or any other type of data source.
  Future<DeleteIntegrationResponse> deleteIntegration({
    required String domainName,
    required String uri,
  }) async {
    final $payload = <String, dynamic>{
      'Uri': uri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/integrations/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteIntegrationResponse.fromJson(response);
  }

  /// Deletes the standard customer profile and all data pertaining to the
  /// profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of a customer profile.
  Future<DeleteProfileResponse> deleteProfile({
    required String domainName,
    required String profileId,
  }) async {
    final $payload = <String, dynamic>{
      'ProfileId': profileId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/profiles/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProfileResponse.fromJson(response);
  }

  /// Removes a searchable key from a customer profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [keyName] :
  /// A searchable identifier of a customer profile.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of a customer profile.
  ///
  /// Parameter [values] :
  /// A list of key values.
  Future<DeleteProfileKeyResponse> deleteProfileKey({
    required String domainName,
    required String keyName,
    required String profileId,
    required List<String> values,
  }) async {
    final $payload = <String, dynamic>{
      'KeyName': keyName,
      'ProfileId': profileId,
      'Values': values,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profiles/keys/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProfileKeyResponse.fromJson(response);
  }

  /// Removes an object associated with a profile of a given ProfileObjectType.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The name of the profile object type.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of a customer profile.
  ///
  /// Parameter [profileObjectUniqueKey] :
  /// The unique identifier of the profile object generated by the service.
  Future<DeleteProfileObjectResponse> deleteProfileObject({
    required String domainName,
    required String objectTypeName,
    required String profileId,
    required String profileObjectUniqueKey,
  }) async {
    final $payload = <String, dynamic>{
      'ObjectTypeName': objectTypeName,
      'ProfileId': profileId,
      'ProfileObjectUniqueKey': profileObjectUniqueKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profiles/objects/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProfileObjectResponse.fromJson(response);
  }

  /// Removes a ProfileObjectType from a specific domain as well as removes all
  /// the ProfileObjects of that type. It also disables integrations from this
  /// specific ProfileObjectType. In addition, it scrubs all of the fields of
  /// the standard profile that were populated from this ProfileObjectType.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The name of the profile object type.
  Future<DeleteProfileObjectTypeResponse> deleteProfileObjectType({
    required String domainName,
    required String objectTypeName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/object-types/${Uri.encodeComponent(objectTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProfileObjectTypeResponse.fromJson(response);
  }

  /// Deletes a recommender.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderName] :
  /// The recommender name.
  Future<void> deleteRecommender({
    required String domainName,
    required String recommenderName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommenders/${Uri.encodeComponent(recommenderName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a recommender filter from a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderFilterName] :
  /// The name of the recommender filter to delete.
  Future<DeleteRecommenderFilterResponse> deleteRecommenderFilter({
    required String domainName,
    required String recommenderFilterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommender-filters/${Uri.encodeComponent(recommenderFilterName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRecommenderFilterResponse.fromJson(response);
  }

  /// Deletes a recommender schema from a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderSchemaName] :
  /// The name of the recommender schema to delete.
  Future<void> deleteRecommenderSchema({
    required String domainName,
    required String recommenderSchemaName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommender-schemas/${Uri.encodeComponent(recommenderSchemaName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a segment definition from the domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [segmentDefinitionName] :
  /// The unique name of the segment definition.
  Future<DeleteSegmentDefinitionResponse> deleteSegmentDefinition({
    required String domainName,
    required String segmentDefinitionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/segment-definitions/${Uri.encodeComponent(segmentDefinitionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSegmentDefinitionResponse.fromJson(response);
  }

  /// Deletes the specified workflow and all its corresponding resources. This
  /// is an async process.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [workflowId] :
  /// Unique identifier for the workflow.
  Future<void> deleteWorkflow({
    required String domainName,
    required String workflowId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/workflows/${Uri.encodeComponent(workflowId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The process of detecting profile object type mapping by using given
  /// objects.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [objects] :
  /// A string that is serialized from a JSON object.
  Future<DetectProfileObjectTypeResponse> detectProfileObjectType({
    required String domainName,
    required List<String> objects,
  }) async {
    final $payload = <String, dynamic>{
      'Objects': objects,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/detect/object-types',
      exceptionFnMap: _exceptionFns,
    );
    return DetectProfileObjectTypeResponse.fromJson(response);
  }

  /// Tests the auto-merging settings of your Identity Resolution Job without
  /// merging your data. It randomly selects a sample of matching groups from
  /// the existing matching results, and applies the automerging settings that
  /// you provided. You can then view the number of profiles in the sample, the
  /// number of matches, and the number of profiles identified to be merged.
  /// This enables you to evaluate the accuracy of the attributes in your
  /// matching list.
  ///
  /// You can't view which profiles are matched and would be merged.
  /// <important>
  /// We strongly recommend you use this API to do a dry run of the automerging
  /// process before running the Identity Resolution Job. Include <b>at
  /// least</b> two matching attributes. If your matching list includes too few
  /// attributes (such as only <code>FirstName</code> or only
  /// <code>LastName</code>), there may be a large number of matches. This
  /// increases the chances of erroneous merges.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [conflictResolution] :
  /// How the auto-merging process should resolve conflicts between different
  /// profiles.
  ///
  /// Parameter [consolidation] :
  /// A list of matching attributes that represent matching criteria.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [minAllowedConfidenceScoreForMerging] :
  /// Minimum confidence score required for profiles within a matching group to
  /// be merged during the auto-merge process.
  Future<GetAutoMergingPreviewResponse> getAutoMergingPreview({
    required ConflictResolution conflictResolution,
    required Consolidation consolidation,
    required String domainName,
    double? minAllowedConfidenceScoreForMerging,
  }) async {
    _s.validateNumRange(
      'minAllowedConfidenceScoreForMerging',
      minAllowedConfidenceScoreForMerging,
      0.0,
      1.0,
    );
    final $payload = <String, dynamic>{
      'ConflictResolution': conflictResolution,
      'Consolidation': consolidation,
      if (minAllowedConfidenceScoreForMerging != null)
        'MinAllowedConfidenceScoreForMerging':
            minAllowedConfidenceScoreForMerging,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/identity-resolution-jobs/auto-merging-preview',
      exceptionFnMap: _exceptionFns,
    );
    return GetAutoMergingPreviewResponse.fromJson(response);
  }

  /// Provides more information on a calculated attribute definition for
  /// Customer Profiles.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatedAttributeName] :
  /// The unique name of the calculated attribute.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  Future<GetCalculatedAttributeDefinitionResponse>
      getCalculatedAttributeDefinition({
    required String calculatedAttributeName,
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/calculated-attributes/${Uri.encodeComponent(calculatedAttributeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCalculatedAttributeDefinitionResponse.fromJson(response);
  }

  /// Retrieve a calculated attribute for a customer profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatedAttributeName] :
  /// The unique name of the calculated attribute.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of a customer profile.
  Future<GetCalculatedAttributeForProfileResponse>
      getCalculatedAttributeForProfile({
    required String calculatedAttributeName,
    required String domainName,
    required String profileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profile/${Uri.encodeComponent(profileId)}/calculated-attributes/${Uri.encodeComponent(calculatedAttributeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCalculatedAttributeForProfileResponse.fromJson(response);
  }

  /// Returns information about a specific domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  Future<GetDomainResponse> getDomain({
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainResponse.fromJson(response);
  }

  /// Gets the layout to view data for a specific domain. This API can only be
  /// invoked from the Amazon Connect admin website.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [layoutDefinitionName] :
  /// The unique name of the layout.
  Future<GetDomainLayoutResponse> getDomainLayout({
    required String domainName,
    required String layoutDefinitionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/layouts/${Uri.encodeComponent(layoutDefinitionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainLayoutResponse.fromJson(response);
  }

  /// Return a DomainObjectType for the input Domain and ObjectType names.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The unique name of the domain object type.
  Future<GetDomainObjectTypeResponse> getDomainObjectType({
    required String domainName,
    required String objectTypeName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/domain-object-types/${Uri.encodeComponent(objectTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainObjectTypeResponse.fromJson(response);
  }

  /// Returns information about the specified event stream in a specific domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [eventStreamName] :
  /// The name of the event stream provided during create operations.
  Future<GetEventStreamResponse> getEventStream({
    required String domainName,
    required String eventStreamName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/event-streams/${Uri.encodeComponent(eventStreamName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventStreamResponse.fromJson(response);
  }

  /// Get a specific Event Trigger from the domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [eventTriggerName] :
  /// The unique name of the event trigger.
  Future<GetEventTriggerResponse> getEventTrigger({
    required String domainName,
    required String eventTriggerName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/event-triggers/${Uri.encodeComponent(eventTriggerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventTriggerResponse.fromJson(response);
  }

  /// Returns information about an Identity Resolution Job in a specific domain.
  ///
  /// Identity Resolution Jobs are set up using the Amazon Connect admin
  /// console. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/use-identity-resolution.html">Use
  /// Identity Resolution to consolidate similar profiles</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [jobId] :
  /// The unique identifier of the Identity Resolution Job.
  Future<GetIdentityResolutionJobResponse> getIdentityResolutionJob({
    required String domainName,
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/identity-resolution-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIdentityResolutionJobResponse.fromJson(response);
  }

  /// Returns an integration for a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [uri] :
  /// The URI of the S3 bucket or any other type of data source.
  Future<GetIntegrationResponse> getIntegration({
    required String domainName,
    required String uri,
  }) async {
    final $payload = <String, dynamic>{
      'Uri': uri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/integrations',
      exceptionFnMap: _exceptionFns,
    );
    return GetIntegrationResponse.fromJson(response);
  }

  /// Before calling this API, use <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_CreateDomain.html">CreateDomain</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_UpdateDomain.html">UpdateDomain</a>
  /// to enable identity resolution: set <code>Matching</code> to true.
  ///
  /// GetMatches returns potentially matching profiles, based on the results of
  /// the latest run of a machine learning process.
  /// <important>
  /// The process of matching duplicate profiles. If <code>Matching</code> =
  /// <code>true</code>, Amazon Connect Customer Profiles starts a weekly batch
  /// process called Identity Resolution Job. If you do not specify a date and
  /// time for Identity Resolution Job to run, by default it runs every Saturday
  /// at 12AM UTC to detect duplicate profiles in your domains.
  ///
  /// After the Identity Resolution Job completes, use the <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">GetMatches</a>
  /// API to return and review the results. Or, if you have configured
  /// <code>ExportingConfig</code> in the <code>MatchingRequest</code>, you can
  /// download the results from S3.
  /// </important>
  /// Amazon Connect uses the following profile attributes to identify matches:
  ///
  /// <ul>
  /// <li>
  /// PhoneNumber
  /// </li>
  /// <li>
  /// HomePhoneNumber
  /// </li>
  /// <li>
  /// BusinessPhoneNumber
  /// </li>
  /// <li>
  /// MobilePhoneNumber
  /// </li>
  /// <li>
  /// EmailAddress
  /// </li>
  /// <li>
  /// PersonalEmailAddress
  /// </li>
  /// <li>
  /// BusinessEmailAddress
  /// </li>
  /// <li>
  /// FullName
  /// </li>
  /// </ul>
  /// For example, two or more profiles—with spelling mistakes such as <b>John
  /// Doe</b> and <b>Jhn Doe</b>, or different casing email addresses such as
  /// <b>JOHN_DOE@ANYCOMPANY.COM</b> and <b>johndoe@anycompany.com</b>, or
  /// different phone number formats such as <b>555-010-0000</b> and
  /// <b>+1-555-010-0000</b>—can be detected as belonging to the same customer
  /// <b>John Doe</b> and merged into a unified profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<GetMatchesResponse> getMatches({
    required String domainName,
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
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/matches',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetMatchesResponse.fromJson(response);
  }

  /// The GetObjectTypeAttributeValues API delivers statistical insights about
  /// attributes within a specific object type, but is exclusively available for
  /// domains with data store enabled. This API performs daily calculations to
  /// provide statistical information about your attribute values, helping you
  /// understand patterns and trends in your data. The statistical calculations
  /// are performed once per day, providing a consistent snapshot of your
  /// attribute data characteristics.
  /// <note>
  /// You'll receive null values in two scenarios:
  ///
  /// During the first period after enabling data vault (unless a calculation
  /// cycle occurs, which happens once daily).
  ///
  /// For attributes that don't contain numeric values.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [attributeName] :
  /// The attribute name.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The unique name of the domain object type.
  Future<GetObjectTypeAttributeStatisticsResponse>
      getObjectTypeAttributeStatistics({
    required String attributeName,
    required String domainName,
    required String objectTypeName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/object-types/${Uri.encodeComponent(objectTypeName)}/attributes/${Uri.encodeComponent(attributeName)}/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetObjectTypeAttributeStatisticsResponse.fromJson(response);
  }

  /// Returns a history record for a specific profile, for a specific domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain for which to return a profile history
  /// record.
  ///
  /// Parameter [id] :
  /// The unique identifier of the profile history record to return.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile for which to return a history record.
  Future<GetProfileHistoryRecordResponse> getProfileHistoryRecord({
    required String domainName,
    required String id,
    required String profileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profiles/${Uri.encodeComponent(profileId)}/history-records/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProfileHistoryRecordResponse.fromJson(response);
  }

  /// Returns the object types for a specific domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The name of the profile object type.
  Future<GetProfileObjectTypeResponse> getProfileObjectType({
    required String domainName,
    required String objectTypeName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/object-types/${Uri.encodeComponent(objectTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProfileObjectTypeResponse.fromJson(response);
  }

  /// Returns the template information for a specific object type.
  ///
  /// A template is a predefined ProfileObjectType, such as “Salesforce-Account”
  /// or “Salesforce-Contact.” When a user sends a ProfileObject, using the
  /// PutProfileObject API, with an ObjectTypeName that matches one of the
  /// TemplateIds, it uses the mappings from the template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [templateId] :
  /// A unique identifier for the object template.
  Future<GetProfileObjectTypeTemplateResponse> getProfileObjectTypeTemplate({
    required String templateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/templates/${Uri.encodeComponent(templateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProfileObjectTypeTemplateResponse.fromJson(response);
  }

  /// Fetches the recommendations for a profile in the input Customer Profiles
  /// domain. Fetches all the profile recommendations
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile for which to retrieve
  /// recommendations.
  ///
  /// Parameter [recommenderName] :
  /// The unique name of the recommender.
  ///
  /// Parameter [candidateIds] :
  /// A list of item IDs to rank for the user. Use this when you want to re-rank
  /// a specific set of items rather than getting recommendations from the full
  /// item catalog. Required for personalized-ranking use cases.
  ///
  /// Parameter [context] :
  /// The contextual metadata used to provide dynamic runtime information to
  /// tailor recommendations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommendations to return. The default value is 10.
  ///
  /// Parameter [metadataConfig] :
  /// Configuration for including item metadata in the recommendation response.
  /// Use this to specify which metadata columns to return alongside recommended
  /// items.
  ///
  /// Parameter [recommenderFilters] :
  /// A list of filters to apply to the returned recommendations. Filters define
  /// criteria for including or excluding items from the recommendation results.
  ///
  /// Parameter [recommenderPromotionalFilters] :
  /// A list of promotional filters to apply to the recommendations. Promotional
  /// filters allow you to promote specific items within a configurable subset
  /// of recommendation results.
  Future<GetProfileRecommendationsResponse> getProfileRecommendations({
    required String domainName,
    required String profileId,
    required String recommenderName,
    List<String>? candidateIds,
    Map<String, String>? context,
    int? maxResults,
    MetadataConfig? metadataConfig,
    List<RecommenderFilter>? recommenderFilters,
    List<RecommenderPromotionalFilter>? recommenderPromotionalFilters,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'RecommenderName': recommenderName,
      if (candidateIds != null) 'CandidateIds': candidateIds,
      if (context != null) 'Context': context,
      if (maxResults != null) 'MaxResults': maxResults,
      if (metadataConfig != null) 'MetadataConfig': metadataConfig,
      if (recommenderFilters != null) 'RecommenderFilters': recommenderFilters,
      if (recommenderPromotionalFilters != null)
        'RecommenderPromotionalFilters': recommenderPromotionalFilters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profiles/${Uri.encodeComponent(profileId)}/recommendations',
      exceptionFnMap: _exceptionFns,
    );
    return GetProfileRecommendationsResponse.fromJson(response);
  }

  /// Retrieves a recommender.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderName] :
  /// The name of the recommender.
  ///
  /// Parameter [trainingMetricsCount] :
  /// The number of training metrics to retrieve for the recommender.
  Future<GetRecommenderResponse> getRecommender({
    required String domainName,
    required String recommenderName,
    int? trainingMetricsCount,
  }) async {
    _s.validateNumRange(
      'trainingMetricsCount',
      trainingMetricsCount,
      0,
      5,
    );
    final $query = <String, List<String>>{
      if (trainingMetricsCount != null)
        'training-metrics-count': [trainingMetricsCount.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommenders/${Uri.encodeComponent(recommenderName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommenderResponse.fromJson(response);
  }

  /// Retrieves information about a specific recommender filter in a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderFilterName] :
  /// The name of the recommender filter to retrieve.
  Future<GetRecommenderFilterResponse> getRecommenderFilter({
    required String domainName,
    required String recommenderFilterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommender-filters/${Uri.encodeComponent(recommenderFilterName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommenderFilterResponse.fromJson(response);
  }

  /// Retrieves information about a specific recommender schema in a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderSchemaName] :
  /// The name of the recommender schema to retrieve.
  Future<GetRecommenderSchemaResponse> getRecommenderSchema({
    required String domainName,
    required String recommenderSchemaName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommender-schemas/${Uri.encodeComponent(recommenderSchemaName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommenderSchemaResponse.fromJson(response);
  }

  /// Gets a segment definition from the domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [segmentDefinitionName] :
  /// The unique name of the segment definition.
  Future<GetSegmentDefinitionResponse> getSegmentDefinition({
    required String domainName,
    required String segmentDefinitionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/segment-definitions/${Uri.encodeComponent(segmentDefinitionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSegmentDefinitionResponse.fromJson(response);
  }

  /// Gets the result of a segment estimate query.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [estimateId] :
  /// The query Id passed by a previous <code>CreateSegmentEstimate</code>
  /// operation.
  Future<GetSegmentEstimateResponse> getSegmentEstimate({
    required String domainName,
    required String estimateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/segment-estimates/${Uri.encodeComponent(estimateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSegmentEstimateResponse.fromJson(response);
  }

  /// Determines if the given profiles are within a segment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [profileIds] :
  /// The list of profile IDs to query for.
  ///
  /// Parameter [segmentDefinitionName] :
  /// The Id of the wanted segment. Needs to be a valid, and existing segment
  /// Id.
  Future<GetSegmentMembershipResponse> getSegmentMembership({
    required String domainName,
    required List<String> profileIds,
    required String segmentDefinitionName,
  }) async {
    final $payload = <String, dynamic>{
      'ProfileIds': profileIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/segments/${Uri.encodeComponent(segmentDefinitionName)}/membership',
      exceptionFnMap: _exceptionFns,
    );
    return GetSegmentMembershipResponse.fromJson(response);
  }

  /// Retrieve the latest status of a segment snapshot.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique identifier of the domain.
  ///
  /// Parameter [segmentDefinitionName] :
  /// The unique name of the segment definition.
  ///
  /// Parameter [snapshotId] :
  /// The unique identifier of the segment snapshot.
  Future<GetSegmentSnapshotResponse> getSegmentSnapshot({
    required String domainName,
    required String segmentDefinitionName,
    required String snapshotId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/segments/${Uri.encodeComponent(segmentDefinitionName)}/snapshots/${Uri.encodeComponent(snapshotId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSegmentSnapshotResponse.fromJson(response);
  }

  /// Returns a set of profiles that belong to the same matching group using the
  /// <code>matchId</code> or <code>profileId</code>. You can also specify the
  /// type of matching that you want for finding similar profiles using either
  /// <code>RULE_BASED_MATCHING</code> or <code>ML_BASED_MATCHING</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [matchType] :
  /// Specify the type of matching to get similar profiles for.
  ///
  /// Parameter [searchKey] :
  /// The string indicating the search key to be used.
  ///
  /// Parameter [searchValue] :
  /// The string based on <code>SearchKey</code> to be searched for similar
  /// profiles.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous <code>GetSimilarProfiles</code> API
  /// call.
  Future<GetSimilarProfilesResponse> getSimilarProfiles({
    required String domainName,
    required MatchType matchType,
    required String searchKey,
    required String searchValue,
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
    final $payload = <String, dynamic>{
      'MatchType': matchType.value,
      'SearchKey': searchKey,
      'SearchValue': searchValue,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/matches',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSimilarProfilesResponse.fromJson(response);
  }

  /// This API retrieves the details of a specific upload job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain containing the upload job.
  ///
  /// Parameter [jobId] :
  /// The unique identifier of the upload job to retrieve.
  Future<GetUploadJobResponse> getUploadJob({
    required String domainName,
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/upload-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetUploadJobResponse.fromJson(response);
  }

  /// This API retrieves the pre-signed URL and client token for uploading the
  /// file associated with the upload job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain containing the upload job.
  ///
  /// Parameter [jobId] :
  /// The unique identifier of the upload job to retrieve the upload path for.
  /// This is generated from the CreateUploadJob API.
  Future<GetUploadJobPathResponse> getUploadJobPath({
    required String domainName,
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/upload-jobs/${Uri.encodeComponent(jobId)}/path',
      exceptionFnMap: _exceptionFns,
    );
    return GetUploadJobPathResponse.fromJson(response);
  }

  /// Get details of specified workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [workflowId] :
  /// Unique identifier for the workflow.
  Future<GetWorkflowResponse> getWorkflow({
    required String domainName,
    required String workflowId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/workflows/${Uri.encodeComponent(workflowId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowResponse.fromJson(response);
  }

  /// Get granular list of steps in workflow.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [workflowId] :
  /// Unique identifier for the workflow.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<GetWorkflowStepsResponse> getWorkflowSteps({
    required String domainName,
    required String workflowId,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/workflows/${Uri.encodeComponent(workflowId)}/steps',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowStepsResponse.fromJson(response);
  }

  /// Lists all of the integrations associated to a specific URI in the AWS
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [uri] :
  /// The URI of the S3 bucket or any other type of data source.
  ///
  /// Parameter [includeHidden] :
  /// Boolean to indicate if hidden integration should be returned. Defaults to
  /// <code>False</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous ListAccountIntegrations API call.
  Future<ListAccountIntegrationsResponse> listAccountIntegrations({
    required String uri,
    bool? includeHidden,
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
      if (includeHidden != null) 'include-hidden': [includeHidden.toString()],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final $payload = <String, dynamic>{
      'Uri': uri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/integrations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccountIntegrationsResponse.fromJson(response);
  }

  /// Lists calculated attribute definitions for Customer Profiles
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of calculated attribute definitions returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous call to
  /// ListCalculatedAttributeDefinitions.
  Future<ListCalculatedAttributeDefinitionsResponse>
      listCalculatedAttributeDefinitions({
    required String domainName,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/calculated-attributes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCalculatedAttributeDefinitionsResponse.fromJson(response);
  }

  /// Retrieve a list of calculated attributes for a customer profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of a customer profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of calculated attributes returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous call to
  /// ListCalculatedAttributesForProfile.
  Future<ListCalculatedAttributesForProfileResponse>
      listCalculatedAttributesForProfile({
    required String domainName,
    required String profileId,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profile/${Uri.encodeComponent(profileId)}/calculated-attributes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCalculatedAttributesForProfileResponse.fromJson(response);
  }

  /// Lists the existing layouts that can be used to view data for a specific
  /// domain. This API can only be invoked from the Amazon Connect admin
  /// website.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListDomainLayoutsResponse> listDomainLayouts({
    required String domainName,
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
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/layouts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainLayoutsResponse.fromJson(response);
  }

  /// List all DomainObjectType(s) in a Customer Profiles domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of domain object types returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous call to ListDomainObjectTypes.
  Future<ListDomainObjectTypesResponse> listDomainObjectTypes({
    required String domainName,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/domain-object-types',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainObjectTypesResponse.fromJson(response);
  }

  /// Returns a list of all the domains for an AWS account that have been
  /// created.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous ListDomain API call.
  Future<ListDomainsResponse> listDomains({
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
      requestUri: '/domains',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsResponse.fromJson(response);
  }

  /// Returns a list of all the event streams in a specific domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEventStreamsResponse> listEventStreams({
    required String domainName,
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
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/event-streams',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventStreamsResponse.fromJson(response);
  }

  /// List all Event Triggers under a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use with ListEventTriggers.
  Future<ListEventTriggersResponse> listEventTriggers({
    required String domainName,
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
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/event-triggers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventTriggersResponse.fromJson(response);
  }

  /// Lists all of the Identity Resolution Jobs in your domain. The response
  /// sorts the list by <code>JobStartTime</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListIdentityResolutionJobsResponse> listIdentityResolutionJobs({
    required String domainName,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/identity-resolution-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIdentityResolutionJobsResponse.fromJson(response);
  }

  /// Lists all of the integrations in your domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [includeHidden] :
  /// Boolean to indicate if hidden integration should be returned. Defaults to
  /// <code>False</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous ListIntegrations API call.
  Future<ListIntegrationsResponse> listIntegrations({
    required String domainName,
    bool? includeHidden,
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
      if (includeHidden != null) 'include-hidden': [includeHidden.toString()],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/integrations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIntegrationsResponse.fromJson(response);
  }

  /// Fetch the possible attribute values given the attribute name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique identifier of the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The name of the profile object type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous call.
  Future<ListObjectTypeAttributesResponse> listObjectTypeAttributes({
    required String domainName,
    required String objectTypeName,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/object-types/${Uri.encodeComponent(objectTypeName)}/attributes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectTypeAttributesResponse.fromJson(response);
  }

  /// The ListObjectTypeAttributeValues API provides access to the most recent
  /// distinct values for any specified attribute, making it valuable for
  /// real-time data validation and consistency checks within your object types.
  /// This API works across domain, supporting both custom and standard object
  /// types. The API accepts the object type name, attribute name, and domain
  /// name as input parameters and returns values up to the storage limit of
  /// approximately 350KB.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [attributeName] :
  /// The attribute name.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The unique name of the domain object type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page. Valid Range: Minimum
  /// value of 1. Maximum value of 100. If not provided default as 100.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous call.
  Future<ListObjectTypeAttributeValuesResponse> listObjectTypeAttributeValues({
    required String attributeName,
    required String domainName,
    required String objectTypeName,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/object-types/${Uri.encodeComponent(objectTypeName)}/attributes/${Uri.encodeComponent(attributeName)}/values',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListObjectTypeAttributeValuesResponse.fromJson(response);
  }

  /// Fetch the possible attribute values given the attribute name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [attributeName] :
  /// The attribute name.
  ///
  /// Parameter [domainName] :
  /// The unique identifier of the domain.
  Future<ProfileAttributeValuesResponse> listProfileAttributeValues({
    required String attributeName,
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profile-attributes/${Uri.encodeComponent(attributeName)}/values',
      exceptionFnMap: _exceptionFns,
    );
    return ProfileAttributeValuesResponse.fromJson(response);
  }

  /// Returns a list of history records for a specific profile, for a specific
  /// domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain for which to return profile history records.
  ///
  /// Parameter [profileId] :
  /// The identifier of the profile to be taken.
  ///
  /// Parameter [actionType] :
  /// Applies a filter to include profile history records only with the
  /// specified <code>ActionType</code> value in the response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [objectTypeName] :
  /// Applies a filter to include profile history records only with the
  /// specified <code>ObjectTypeName</code> value in the response.
  ///
  /// Parameter [performedBy] :
  /// Applies a filter to include profile history records only with the
  /// specified <code>PerformedBy</code> value in the response. The
  /// <code>PerformedBy</code> value can be the Amazon Resource Name (ARN) of
  /// the person or service principal who performed the action.
  Future<ListProfileHistoryRecordsResponse> listProfileHistoryRecords({
    required String domainName,
    required String profileId,
    ActionType? actionType,
    int? maxResults,
    String? nextToken,
    String? objectTypeName,
    String? performedBy,
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
    final $payload = <String, dynamic>{
      'ProfileId': profileId,
      if (actionType != null) 'ActionType': actionType.value,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (performedBy != null) 'PerformedBy': performedBy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profiles/history-records',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfileHistoryRecordsResponse.fromJson(response);
  }

  /// Returns a list of objects associated with a profile of a given
  /// ProfileObjectType.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The name of the profile object type.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of a customer profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous call to ListProfileObjects.
  ///
  /// Parameter [objectFilter] :
  /// Applies a filter to the response to include profile objects with the
  /// specified index values.
  Future<ListProfileObjectsResponse> listProfileObjects({
    required String domainName,
    required String objectTypeName,
    required String profileId,
    int? maxResults,
    String? nextToken,
    ObjectFilter? objectFilter,
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
    final $payload = <String, dynamic>{
      'ObjectTypeName': objectTypeName,
      'ProfileId': profileId,
      if (objectFilter != null) 'ObjectFilter': objectFilter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profiles/objects',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfileObjectsResponse.fromJson(response);
  }

  /// Lists all of the templates available within the service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListProfileObjectTypesResponse> listProfileObjectTypes({
    required String domainName,
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
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/object-types',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfileObjectTypesResponse.fromJson(response);
  }

  /// Lists all of the template information for object types.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous ListObjectTypeTemplates API call.
  Future<ListProfileObjectTypeTemplatesResponse>
      listProfileObjectTypeTemplates({
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
      requestUri: '/templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfileObjectTypeTemplatesResponse.fromJson(response);
  }

  /// Returns a list of recommender filters in the specified domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommender filters to return in the response. The
  /// default value is 100.
  ///
  /// Parameter [nextToken] :
  /// A token received from a previous ListRecommenderFilters call to retrieve
  /// the next page of results.
  Future<ListRecommenderFiltersResponse> listRecommenderFilters({
    required String domainName,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommender-filters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommenderFiltersResponse.fromJson(response);
  }

  /// Returns a list of available recommender recipes that can be used to create
  /// recommenders.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommender recipes to return in the response. The
  /// default value is 100.
  ///
  /// Parameter [nextToken] :
  /// A token received from a previous ListRecommenderRecipes call to retrieve
  /// the next page of results.
  Future<ListRecommenderRecipesResponse> listRecommenderRecipes({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      10,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/recommender-recipes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommenderRecipesResponse.fromJson(response);
  }

  /// Returns a list of recommenders in the specified domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommenders to return in the response. The default
  /// value is 100.
  ///
  /// Parameter [nextToken] :
  /// A token received from a previous ListRecommenders call to retrieve the
  /// next page of results.
  Future<ListRecommendersResponse> listRecommenders({
    required String domainName,
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
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/recommenders',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendersResponse.fromJson(response);
  }

  /// Returns a list of recommender schemas in the specified domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommender schemas to return in the response. The
  /// default value is 100.
  ///
  /// Parameter [nextToken] :
  /// A token received from a previous ListRecommenderSchemas call to retrieve
  /// the next page of results.
  Future<ListRecommenderSchemasResponse> listRecommenderSchemas({
    required String domainName,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommender-schemas',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommenderSchemasResponse.fromJson(response);
  }

  /// Returns a set of <code>MatchIds</code> that belong to the given domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of <code>MatchIds</code> returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous <code>ListRuleBasedMatches</code>
  /// API call.
  Future<ListRuleBasedMatchesResponse> listRuleBasedMatches({
    required String domainName,
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
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profiles/ruleBasedMatches',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRuleBasedMatchesResponse.fromJson(response);
  }

  /// Lists all segment definitions under a domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique identifier of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous call.
  Future<ListSegmentDefinitionsResponse> listSegmentDefinitions({
    required String domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/segment-definitions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSegmentDefinitionsResponse.fromJson(response);
  }

  /// Displays the tags associated with an Amazon Connect Customer Profiles
  /// resource. In Connect Customer Profiles, domains, profile object types, and
  /// integrations can be tagged.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource for which you want to view tags.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// This API retrieves a list of upload jobs for the specified domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain to list upload jobs for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of upload jobs to return per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous call to retrieve the next page of
  /// results.
  Future<ListUploadJobsResponse> listUploadJobs({
    required String domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/upload-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUploadJobsResponse.fromJson(response);
  }

  /// Query to list all workflows.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [queryEndDate] :
  /// Retrieve workflows ended after timestamp.
  ///
  /// Parameter [queryStartDate] :
  /// Retrieve workflows started after timestamp.
  ///
  /// Parameter [status] :
  /// Status of workflow execution.
  ///
  /// Parameter [workflowType] :
  /// The type of workflow. The only supported value is APPFLOW_INTEGRATION.
  Future<ListWorkflowsResponse> listWorkflows({
    required String domainName,
    int? maxResults,
    String? nextToken,
    DateTime? queryEndDate,
    DateTime? queryStartDate,
    Status? status,
    WorkflowType? workflowType,
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
    final $payload = <String, dynamic>{
      if (queryEndDate != null)
        'QueryEndDate': unixTimestampToJson(queryEndDate),
      if (queryStartDate != null)
        'QueryStartDate': unixTimestampToJson(queryStartDate),
      if (status != null) 'Status': status.value,
      if (workflowType != null) 'WorkflowType': workflowType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/workflows',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowsResponse.fromJson(response);
  }

  /// Runs an AWS Lambda job that does the following:
  /// <ol>
  /// <li>
  /// All the profileKeys in the <code>ProfileToBeMerged</code> will be moved to
  /// the main profile.
  /// </li>
  /// <li>
  /// All the objects in the <code>ProfileToBeMerged</code> will be moved to the
  /// main profile.
  /// </li>
  /// <li>
  /// All the <code>ProfileToBeMerged</code> will be deleted at the end.
  /// </li>
  /// <li>
  /// All the profileKeys in the <code>ProfileIdsToBeMerged</code> will be moved
  /// to the main profile.
  /// </li>
  /// <li>
  /// Standard fields are merged as follows:
  /// <ol>
  /// <li>
  /// Fields are always "union"-ed if there are no conflicts in standard fields
  /// or attributeKeys.
  /// </li>
  /// <li>
  /// When there are conflicting fields:
  /// <ol>
  /// <li>
  /// If no <code>SourceProfileIds</code> entry is specified, the main Profile
  /// value is always taken.
  /// </li>
  /// <li>
  /// If a <code>SourceProfileIds</code> entry is specified, the specified
  /// profileId is always taken, even if it is a NULL value.
  /// </li> </ol> </li> </ol> </li> </ol>
  /// You can use MergeProfiles together with <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">GetMatches</a>,
  /// which returns potentially matching profiles, or use it with the results of
  /// another matching system. After profiles have been merged, they cannot be
  /// separated (unmerged).
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [mainProfileId] :
  /// The identifier of the profile to be taken.
  ///
  /// Parameter [profileIdsToBeMerged] :
  /// The identifier of the profile to be merged into MainProfileId.
  ///
  /// Parameter [fieldSourceProfileIds] :
  /// The identifiers of the fields in the profile that has the information you
  /// want to apply to the merge. For example, say you want to merge
  /// EmailAddress from Profile1 into MainProfile. This would be the identifier
  /// of the EmailAddress field in Profile1.
  Future<MergeProfilesResponse> mergeProfiles({
    required String domainName,
    required String mainProfileId,
    required List<String> profileIdsToBeMerged,
    FieldSourceProfileIds? fieldSourceProfileIds,
  }) async {
    final $payload = <String, dynamic>{
      'MainProfileId': mainProfileId,
      'ProfileIdsToBeMerged': profileIdsToBeMerged,
      if (fieldSourceProfileIds != null)
        'FieldSourceProfileIds': fieldSourceProfileIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profiles/objects/merge',
      exceptionFnMap: _exceptionFns,
    );
    return MergeProfilesResponse.fromJson(response);
  }

  /// Create/Update a DomainObjectType in a Customer Profiles domain. To create
  /// a new DomainObjectType, Data Store needs to be enabled on the Domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [fields] :
  /// A map of field names to their corresponding domain object type field
  /// definitions.
  ///
  /// Parameter [objectTypeName] :
  /// The unique name of the domain object type.
  ///
  /// Parameter [description] :
  /// The description of the domain object type.
  ///
  /// Parameter [encryptionKey] :
  /// The customer provided KMS key used to encrypt this type of domain object.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<PutDomainObjectTypeResponse> putDomainObjectType({
    required String domainName,
    required Map<String, DomainObjectTypeField> fields,
    required String objectTypeName,
    String? description,
    String? encryptionKey,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Fields': fields,
      if (description != null) 'Description': description,
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/domain-object-types/${Uri.encodeComponent(objectTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutDomainObjectTypeResponse.fromJson(response);
  }

  /// Adds an integration between the service and a third-party service, which
  /// includes Amazon AppFlow and Amazon Connect.
  ///
  /// An integration can belong to only one domain.
  ///
  /// To add or remove tags on an existing Integration, see <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_TagResource.html">
  /// TagResource </a>/<a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_UntagResource.html">
  /// UntagResource</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [eventTriggerNames] :
  /// A list of unique names for active event triggers associated with the
  /// integration.
  ///
  /// Parameter [flowDefinition] :
  /// The configuration that controls how Customer Profiles retrieves data from
  /// the source.
  ///
  /// Parameter [objectTypeName] :
  /// The name of the profile object type.
  ///
  /// Parameter [objectTypeNames] :
  /// A map in which each key is an event type from an external application such
  /// as Segment or Shopify, and each value is an <code>ObjectTypeName</code>
  /// (template) used to ingest the event. It supports the following event
  /// types: <code>SegmentIdentify</code>, <code>ShopifyCreateCustomers</code>,
  /// <code>ShopifyUpdateCustomers</code>,
  /// <code>ShopifyCreateDraftOrders</code>,
  /// <code>ShopifyUpdateDraftOrders</code>, <code>ShopifyCreateOrders</code>,
  /// and <code>ShopifyUpdatedOrders</code>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role. The Integration uses this
  /// role to make Customer Profiles requests on your behalf.
  ///
  /// Parameter [scope] :
  /// Specifies whether the integration applies to profile level data
  /// (associated with profiles) or domain level data (not associated with any
  /// specific profile). The default value is PROFILE.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  ///
  /// Parameter [uri] :
  /// The URI of the S3 bucket or any other type of data source.
  Future<PutIntegrationResponse> putIntegration({
    required String domainName,
    List<String>? eventTriggerNames,
    FlowDefinition? flowDefinition,
    String? objectTypeName,
    Map<String, String>? objectTypeNames,
    String? roleArn,
    Scope? scope,
    Map<String, String>? tags,
    String? uri,
  }) async {
    final $payload = <String, dynamic>{
      if (eventTriggerNames != null) 'EventTriggerNames': eventTriggerNames,
      if (flowDefinition != null) 'FlowDefinition': flowDefinition,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (objectTypeNames != null) 'ObjectTypeNames': objectTypeNames,
      if (roleArn != null) 'RoleArn': roleArn,
      if (scope != null) 'Scope': scope.value,
      if (tags != null) 'Tags': tags,
      if (uri != null) 'Uri': uri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/integrations',
      exceptionFnMap: _exceptionFns,
    );
    return PutIntegrationResponse.fromJson(response);
  }

  /// Adds additional objects to customer profiles of a given ObjectType.
  ///
  /// When adding a specific profile object, like a Contact Record, an inferred
  /// profile can get created if it is not mapped to an existing profile. The
  /// resulting profile will only have a phone number populated in the standard
  /// ProfileObject. Any additional Contact Records with the same phone number
  /// will be mapped to the same inferred profile.
  ///
  /// When a ProfileObject is created and if a ProfileObjectType already exists
  /// for the ProfileObject, it will provide data to a standard profile
  /// depending on the ProfileObjectType definition.
  ///
  /// PutProfileObject needs an ObjectType, which can be created using
  /// PutProfileObjectType.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [object] :
  /// A string that is serialized from a JSON object.
  ///
  /// Parameter [objectTypeName] :
  /// The name of the profile object type.
  Future<PutProfileObjectResponse> putProfileObject({
    required String domainName,
    required String object,
    required String objectTypeName,
  }) async {
    final $payload = <String, dynamic>{
      'Object': object,
      'ObjectTypeName': objectTypeName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/profiles/objects',
      exceptionFnMap: _exceptionFns,
    );
    return PutProfileObjectResponse.fromJson(response);
  }

  /// Defines a ProfileObjectType.
  ///
  /// To add or remove tags on an existing ObjectType, see <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_TagResource.html">
  /// TagResource</a>/<a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_UntagResource.html">UntagResource</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [description] :
  /// Description of the profile object type.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [objectTypeName] :
  /// The name of the profile object type.
  ///
  /// Parameter [allowProfileCreation] :
  /// Indicates whether a profile should be created when data is received if one
  /// doesn’t exist for an object of this type. The default is
  /// <code>FALSE</code>. If the AllowProfileCreation flag is set to
  /// <code>FALSE</code>, then the service tries to fetch a standard profile and
  /// associate this object with the profile. If it is set to <code>TRUE</code>,
  /// and if no match is found, then the service creates a new standard profile.
  ///
  /// Parameter [encryptionKey] :
  /// The customer-provided key to encrypt the profile object that will be
  /// created in this profile object type.
  ///
  /// Parameter [expirationDays] :
  /// The number of days until the data in the object expires.
  ///
  /// Parameter [fields] :
  /// A map of the name and ObjectType field.
  ///
  /// Parameter [keys] :
  /// A list of unique keys that can be used to map data to the profile.
  ///
  /// Parameter [maxProfileObjectCount] :
  /// The amount of profile object max count assigned to the object type
  ///
  /// Parameter [sourceLastUpdatedTimestampFormat] :
  /// The format of your <code>sourceLastUpdatedTimestamp</code> that was
  /// previously set up.
  ///
  /// Parameter [sourcePriority] :
  /// An integer that determines the priority of this object type when data from
  /// multiple sources is ingested. Lower values take priority. Object types
  /// without a specified source priority default to the lowest priority.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  ///
  /// Parameter [templateId] :
  /// A unique identifier for the object template. For some attributes in the
  /// request, the service will use the default value from the object template
  /// when TemplateId is present. If these attributes are present in the
  /// request, the service may return a <code>BadRequestException</code>. These
  /// attributes include: AllowProfileCreation,
  /// SourceLastUpdatedTimestampFormat, Fields, and Keys. For example, if
  /// AllowProfileCreation is set to true when TemplateId is set, the service
  /// may return a <code>BadRequestException</code>.
  Future<PutProfileObjectTypeResponse> putProfileObjectType({
    required String description,
    required String domainName,
    required String objectTypeName,
    bool? allowProfileCreation,
    String? encryptionKey,
    int? expirationDays,
    Map<String, ObjectTypeField>? fields,
    Map<String, List<ObjectTypeKey>>? keys,
    int? maxProfileObjectCount,
    String? sourceLastUpdatedTimestampFormat,
    int? sourcePriority,
    Map<String, String>? tags,
    String? templateId,
  }) async {
    _s.validateNumRange(
      'expirationDays',
      expirationDays,
      1,
      1098,
    );
    _s.validateNumRange(
      'maxProfileObjectCount',
      maxProfileObjectCount,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'sourcePriority',
      sourcePriority,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Description': description,
      if (allowProfileCreation != null)
        'AllowProfileCreation': allowProfileCreation,
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (expirationDays != null) 'ExpirationDays': expirationDays,
      if (fields != null) 'Fields': fields,
      if (keys != null) 'Keys': keys,
      if (maxProfileObjectCount != null)
        'MaxProfileObjectCount': maxProfileObjectCount,
      if (sourceLastUpdatedTimestampFormat != null)
        'SourceLastUpdatedTimestampFormat': sourceLastUpdatedTimestampFormat,
      if (sourcePriority != null) 'SourcePriority': sourcePriority,
      if (tags != null) 'Tags': tags,
      if (templateId != null) 'TemplateId': templateId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/object-types/${Uri.encodeComponent(objectTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutProfileObjectTypeResponse.fromJson(response);
  }

  /// Searches for profiles within a specific domain using one or more
  /// predefined search keys (e.g., _fullName, _phone, _email, _account, etc.)
  /// and/or custom-defined search keys. A search key is a data type pair that
  /// consists of a <code>KeyName</code> and <code>Values</code> list.
  ///
  /// This operation supports searching for profiles with a minimum of 1
  /// key-value(s) pair and up to 5 key-value(s) pairs using either
  /// <code>AND</code> or <code>OR</code> logic.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [keyName] :
  /// A searchable identifier of a customer profile. The predefined keys you can
  /// use to search include: _account, _profileId, _assetId, _caseId, _orderId,
  /// _fullName, _phone, _email, _ctrContactId, _marketoLeadId,
  /// _salesforceAccountId, _salesforceContactId, _salesforceAssetId,
  /// _zendeskUserId, _zendeskExternalId, _zendeskTicketId, _serviceNowSystemId,
  /// _serviceNowIncidentId, _segmentUserId, _shopifyCustomerId,
  /// _shopifyOrderId.
  ///
  /// Parameter [values] :
  /// A list of key values.
  ///
  /// Parameter [additionalSearchKeys] :
  /// A list of <code>AdditionalSearchKey</code> objects that are each
  /// searchable identifiers of a profile. Each <code>AdditionalSearchKey</code>
  /// object contains a <code>KeyName</code> and a list of <code>Values</code>
  /// associated with that specific key (i.e., a key-value(s) pair). These
  /// additional search keys will be used in conjunction with the
  /// <code>LogicalOperator</code> and the required <code>KeyName</code> and
  /// <code>Values</code> parameters to search for profiles that satisfy the
  /// search criteria.
  ///
  /// Parameter [logicalOperator] :
  /// Relationship between all specified search keys that will be used to search
  /// for profiles. This includes the required <code>KeyName</code> and
  /// <code>Values</code> parameters as well as any key-value(s) pairs specified
  /// in the <code>AdditionalSearchKeys</code> list.
  ///
  /// This parameter influences which profiles will be returned in the response
  /// in the following manner:
  ///
  /// <ul>
  /// <li>
  /// <code>AND</code> - The response only includes profiles that match all of
  /// the search keys.
  /// </li>
  /// <li>
  /// <code>OR</code> - The response includes profiles that match at least one
  /// of the search keys.
  /// </li>
  /// </ul>
  /// The <code>OR</code> relationship is the default behavior if this parameter
  /// is not included in the request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// The default is 20 if this parameter is not included in the request.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous SearchProfiles API call.
  Future<SearchProfilesResponse> searchProfiles({
    required String domainName,
    required String keyName,
    required List<String> values,
    List<AdditionalSearchKey>? additionalSearchKeys,
    LogicalOperator? logicalOperator,
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
    final $payload = <String, dynamic>{
      'KeyName': keyName,
      'Values': values,
      if (additionalSearchKeys != null)
        'AdditionalSearchKeys': additionalSearchKeys,
      if (logicalOperator != null) 'LogicalOperator': logicalOperator.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/profiles/search',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchProfilesResponse.fromJson(response);
  }

  /// Starts a recommender that was previously stopped. Starting a recommender
  /// resumes its ability to generate recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderName] :
  /// The name of the recommender to start.
  Future<void> startRecommender({
    required String domainName,
    required String recommenderName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommenders/${Uri.encodeComponent(recommenderName)}/start',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API starts the processing of an upload job to ingest profile data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain containing the upload job to start.
  ///
  /// Parameter [jobId] :
  /// The unique identifier of the upload job to start.
  Future<void> startUploadJob({
    required String domainName,
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/upload-jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops a recommender, suspending its ability to generate recommendations.
  /// The recommender can be restarted later using StartRecommender.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderName] :
  /// The name of the recommender to stop.
  Future<void> stopRecommender({
    required String domainName,
    required String recommenderName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommenders/${Uri.encodeComponent(recommenderName)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This API stops the processing of an upload job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain containing the upload job to stop.
  ///
  /// Parameter [jobId] :
  /// The unique identifier of the upload job to stop.
  Future<void> stopUploadJob({
    required String domainName,
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/upload-jobs/${Uri.encodeComponent(jobId)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns one or more tags (key-value pairs) to the specified Amazon Connect
  /// Customer Profiles resource. Tags can help you organize and categorize your
  /// resources. You can also use them to scope user permissions by granting a
  /// user permission to access or change only resources with certain tag
  /// values. In Connect Customer Profiles, domains, profile object types, and
  /// integrations can be tagged.
  ///
  /// Tags don't have any semantic meaning to AWS and are interpreted strictly
  /// as strings of characters.
  ///
  /// You can use the TagResource action with a resource that already has tags.
  /// If you specify a new tag key, this tag is appended to the list of tags
  /// associated with the resource. If you specify a tag key that is already
  /// associated with the resource, the new tag value that you specify replaces
  /// the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that you're adding tags to.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified Amazon Connect Customer
  /// Profiles resource. In Connect Customer Profiles, domains, profile object
  /// types, and integrations can be tagged.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource from which you are removing tags.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing calculated attribute definition. When updating the
  /// Conditions, note that increasing the date range of a calculated attribute
  /// will not trigger inclusion of historical data greater than the current
  /// date range.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [calculatedAttributeName] :
  /// The unique name of the calculated attribute.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [conditions] :
  /// The conditions including range, object count, and threshold for the
  /// calculated attribute.
  ///
  /// Parameter [description] :
  /// The description of the calculated attribute.
  ///
  /// Parameter [displayName] :
  /// The display name of the calculated attribute.
  Future<UpdateCalculatedAttributeDefinitionResponse>
      updateCalculatedAttributeDefinition({
    required String calculatedAttributeName,
    required String domainName,
    Conditions? conditions,
    String? description,
    String? displayName,
  }) async {
    final $payload = <String, dynamic>{
      if (conditions != null) 'Conditions': conditions,
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/calculated-attributes/${Uri.encodeComponent(calculatedAttributeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCalculatedAttributeDefinitionResponse.fromJson(response);
  }

  /// Updates the properties of a domain, including creating or selecting a dead
  /// letter queue or an encryption key.
  ///
  /// After a domain is created, the name can’t be changed.
  ///
  /// Use this API or <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_CreateDomain.html">CreateDomain</a>
  /// to enable <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">identity
  /// resolution</a>: set <code>Matching</code> to true.
  ///
  /// To prevent cross-service impersonation when you call this API, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/cross-service-confused-deputy-prevention.html">Cross-service
  /// confused deputy prevention</a> for sample policies that you should apply.
  ///
  /// To add or remove tags on an existing Domain, see <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_TagResource.html">TagResource</a>/<a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_UntagResource.html">UntagResource</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [dataStore] :
  /// Set to true to enabled data store for this domain.
  ///
  /// Parameter [deadLetterQueueUrl] :
  /// The URL of the SQS dead letter queue, which is used for reporting errors
  /// associated with ingesting data from third party applications. If specified
  /// as an empty string, it will clear any existing value. You must set up a
  /// policy on the DeadLetterQueue for the SendMessage operation to enable
  /// Amazon Connect Customer Profiles to send messages to the DeadLetterQueue.
  ///
  /// Parameter [defaultEncryptionKey] :
  /// The default encryption key, which is an AWS managed key, is used when no
  /// specific type of encryption key is specified. It is used to encrypt all
  /// data before it is placed in permanent or semi-permanent storage. If
  /// specified as an empty string, it will clear any existing value.
  ///
  /// Parameter [defaultExpirationDays] :
  /// The default number of days until the data within the domain expires.
  ///
  /// Parameter [matching] :
  /// The process of matching duplicate profiles. If <code>Matching</code> =
  /// <code>true</code>, Amazon Connect Customer Profiles starts a weekly batch
  /// process called Identity Resolution Job. If you do not specify a date and
  /// time for Identity Resolution Job to run, by default it runs every Saturday
  /// at 12AM UTC to detect duplicate profiles in your domains.
  ///
  /// After the Identity Resolution Job completes, use the <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">GetMatches</a>
  /// API to return and review the results. Or, if you have configured
  /// <code>ExportingConfig</code> in the <code>MatchingRequest</code>, you can
  /// download the results from S3.
  ///
  /// Parameter [ruleBasedMatching] :
  /// The process of matching duplicate profiles using the rule-Based matching.
  /// If <code>RuleBasedMatching</code> = true, Connect Customer Customer
  /// Profiles will start to match and merge your profiles according to your
  /// configuration in the <code>RuleBasedMatchingRequest</code>. You can use
  /// the <code>ListRuleBasedMatches</code> and <code>GetSimilarProfiles</code>
  /// API to return and review the results. Also, if you have configured
  /// <code>ExportingConfig</code> in the <code>RuleBasedMatchingRequest</code>,
  /// you can download the results from S3.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<UpdateDomainResponse> updateDomain({
    required String domainName,
    DataStoreRequest? dataStore,
    String? deadLetterQueueUrl,
    String? defaultEncryptionKey,
    int? defaultExpirationDays,
    MatchingRequest? matching,
    RuleBasedMatchingRequest? ruleBasedMatching,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'defaultExpirationDays',
      defaultExpirationDays,
      1,
      1098,
    );
    final $payload = <String, dynamic>{
      if (dataStore != null) 'DataStore': dataStore,
      if (deadLetterQueueUrl != null) 'DeadLetterQueueUrl': deadLetterQueueUrl,
      if (defaultEncryptionKey != null)
        'DefaultEncryptionKey': defaultEncryptionKey,
      if (defaultExpirationDays != null)
        'DefaultExpirationDays': defaultExpirationDays,
      if (matching != null) 'Matching': matching,
      if (ruleBasedMatching != null) 'RuleBasedMatching': ruleBasedMatching,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDomainResponse.fromJson(response);
  }

  /// Updates the layout used to view data for a specific domain. This API can
  /// only be invoked from the Amazon Connect admin website.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [layoutDefinitionName] :
  /// The unique name of the layout.
  ///
  /// Parameter [description] :
  /// The description of the layout
  ///
  /// Parameter [displayName] :
  /// The display name of the layout
  ///
  /// Parameter [isDefault] :
  /// If set to true for a layout, this layout will be used by default to view
  /// data. If set to false, then the layout will not be used by default, but it
  /// can be used to view data by explicitly selecting it in the console.
  ///
  /// Parameter [layout] :
  /// A customizable layout that can be used to view data under a Customer
  /// Profiles domain.
  ///
  /// Parameter [layoutType] :
  /// The type of layout that can be used to view data under a Customer Profiles
  /// domain.
  Future<UpdateDomainLayoutResponse> updateDomainLayout({
    required String domainName,
    required String layoutDefinitionName,
    String? description,
    String? displayName,
    bool? isDefault,
    String? layout,
    LayoutType? layoutType,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (isDefault != null) 'IsDefault': isDefault,
      if (layout != null) 'Layout': layout,
      if (layoutType != null) 'LayoutType': layoutType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/layouts/${Uri.encodeComponent(layoutDefinitionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDomainLayoutResponse.fromJson(response);
  }

  /// Update the properties of an Event Trigger.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [eventTriggerName] :
  /// The unique name of the event trigger.
  ///
  /// Parameter [description] :
  /// The description of the event trigger.
  ///
  /// Parameter [eventTriggerConditions] :
  /// A list of conditions that determine when an event should trigger the
  /// destination.
  ///
  /// Parameter [eventTriggerLimits] :
  /// Defines limits controlling whether an event triggers the destination,
  /// based on ingestion latency and the number of invocations per profile over
  /// specific time periods.
  ///
  /// Parameter [objectTypeName] :
  /// The unique name of the object type.
  ///
  /// Parameter [segmentFilter] :
  /// The destination is triggered only for profiles that meet the criteria of a
  /// segment definition.
  Future<UpdateEventTriggerResponse> updateEventTrigger({
    required String domainName,
    required String eventTriggerName,
    String? description,
    List<EventTriggerCondition>? eventTriggerConditions,
    EventTriggerLimits? eventTriggerLimits,
    String? objectTypeName,
    String? segmentFilter,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (eventTriggerConditions != null)
        'EventTriggerConditions': eventTriggerConditions,
      if (eventTriggerLimits != null) 'EventTriggerLimits': eventTriggerLimits,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (segmentFilter != null) 'SegmentFilter': segmentFilter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/event-triggers/${Uri.encodeComponent(eventTriggerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEventTriggerResponse.fromJson(response);
  }

  /// Updates the properties of a profile. The ProfileId is required for
  /// updating a customer profile.
  ///
  /// When calling the UpdateProfile API, specifying an empty string value means
  /// that any existing value will be removed. Not specifying a string value
  /// means that any value already there will be kept.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of a customer profile.
  ///
  /// Parameter [accountNumber] :
  /// An account number that you have assigned to the customer.
  ///
  /// Parameter [additionalInformation] :
  /// Any additional information relevant to the customer’s profile.
  ///
  /// Parameter [address] :
  /// A generic address associated with the customer that is not mailing,
  /// shipping, or billing.
  ///
  /// Parameter [attributes] :
  /// A key value pair of attributes of a customer profile.
  ///
  /// Parameter [billingAddress] :
  /// The customer’s billing address.
  ///
  /// Parameter [birthDate] :
  /// The customer’s birth date.
  ///
  /// Parameter [businessEmailAddress] :
  /// The customer’s business email address.
  ///
  /// Parameter [businessName] :
  /// The name of the customer’s business.
  ///
  /// Parameter [businessPhoneNumber] :
  /// The customer’s business phone number.
  ///
  /// Parameter [emailAddress] :
  /// The customer’s email address, which has not been specified as a personal
  /// or business address.
  ///
  /// Parameter [engagementPreferences] :
  /// Object that defines users preferred methods of engagement.
  ///
  /// Parameter [firstName] :
  /// The customer’s first name.
  ///
  /// Parameter [gender] :
  /// The gender with which the customer identifies.
  ///
  /// Parameter [genderString] :
  /// An alternative to <code>Gender</code> which accepts any string as input.
  ///
  /// Parameter [homePhoneNumber] :
  /// The customer’s home phone number.
  ///
  /// Parameter [lastName] :
  /// The customer’s last name.
  ///
  /// Parameter [mailingAddress] :
  /// The customer’s mailing address.
  ///
  /// Parameter [middleName] :
  /// The customer’s middle name.
  ///
  /// Parameter [mobilePhoneNumber] :
  /// The customer’s mobile phone number.
  ///
  /// Parameter [partyType] :
  /// The type of profile used to describe the customer.
  ///
  /// Parameter [partyTypeString] :
  /// An alternative to <code>PartyType</code> which accepts any string as
  /// input.
  ///
  /// Parameter [personalEmailAddress] :
  /// The customer’s personal email address.
  ///
  /// Parameter [phoneNumber] :
  /// The customer’s phone number, which has not been specified as a mobile,
  /// home, or business number.
  ///
  /// Parameter [profileType] :
  /// Determines the type of the profile.
  ///
  /// Parameter [shippingAddress] :
  /// The customer’s shipping address.
  Future<UpdateProfileResponse> updateProfile({
    required String domainName,
    required String profileId,
    String? accountNumber,
    String? additionalInformation,
    UpdateAddress? address,
    Map<String, String>? attributes,
    UpdateAddress? billingAddress,
    String? birthDate,
    String? businessEmailAddress,
    String? businessName,
    String? businessPhoneNumber,
    String? emailAddress,
    EngagementPreferences? engagementPreferences,
    String? firstName,
    Gender? gender,
    String? genderString,
    String? homePhoneNumber,
    String? lastName,
    UpdateAddress? mailingAddress,
    String? middleName,
    String? mobilePhoneNumber,
    PartyType? partyType,
    String? partyTypeString,
    String? personalEmailAddress,
    String? phoneNumber,
    ProfileType? profileType,
    UpdateAddress? shippingAddress,
  }) async {
    final $payload = <String, dynamic>{
      'ProfileId': profileId,
      if (accountNumber != null) 'AccountNumber': accountNumber,
      if (additionalInformation != null)
        'AdditionalInformation': additionalInformation,
      if (address != null) 'Address': address,
      if (attributes != null) 'Attributes': attributes,
      if (billingAddress != null) 'BillingAddress': billingAddress,
      if (birthDate != null) 'BirthDate': birthDate,
      if (businessEmailAddress != null)
        'BusinessEmailAddress': businessEmailAddress,
      if (businessName != null) 'BusinessName': businessName,
      if (businessPhoneNumber != null)
        'BusinessPhoneNumber': businessPhoneNumber,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (engagementPreferences != null)
        'EngagementPreferences': engagementPreferences,
      if (firstName != null) 'FirstName': firstName,
      if (gender != null) 'Gender': gender.value,
      if (genderString != null) 'GenderString': genderString,
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'PartyType': partyType.value,
      if (partyTypeString != null) 'PartyTypeString': partyTypeString,
      if (personalEmailAddress != null)
        'PersonalEmailAddress': personalEmailAddress,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (profileType != null) 'ProfileType': profileType.value,
      if (shippingAddress != null) 'ShippingAddress': shippingAddress,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/profiles',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProfileResponse.fromJson(response);
  }

  /// Updates the properties of an existing recommender, allowing you to modify
  /// its configuration and description.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [recommenderName] :
  /// The name of the recommender to update.
  ///
  /// Parameter [description] :
  /// The new description to assign to the recommender.
  ///
  /// Parameter [recommenderConfig] :
  /// The new configuration settings to apply to the recommender, including
  /// updated parameters and settings that define its behavior.
  Future<UpdateRecommenderResponse> updateRecommender({
    required String domainName,
    required String recommenderName,
    String? description,
    RecommenderConfig? recommenderConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (recommenderConfig != null) 'RecommenderConfig': recommenderConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/recommenders/${Uri.encodeComponent(recommenderName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRecommenderResponse.fromJson(response);
  }
}

class AddProfileKeyResponse {
  /// A searchable identifier of a customer profile.
  final String? keyName;

  /// A list of key values.
  final List<String>? values;

  AddProfileKeyResponse({
    this.keyName,
    this.values,
  });

  factory AddProfileKeyResponse.fromJson(Map<String, dynamic> json) {
    return AddProfileKeyResponse(
      keyName: json['KeyName'] as String?,
      values:
          (json['Values'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyName = this.keyName;
    final values = this.values;
    return {
      if (keyName != null) 'KeyName': keyName,
      if (values != null) 'Values': values,
    };
  }
}

class BatchGetCalculatedAttributeForProfileResponse {
  /// List of calculated attribute values retrieved.
  final List<CalculatedAttributeValue>? calculatedAttributeValues;

  /// Overrides the condition block within the original calculated attribute
  /// definition.
  final ConditionOverrides? conditionOverrides;

  /// List of errors for calculated attribute values that could not be retrieved.
  final List<BatchGetCalculatedAttributeForProfileError>? errors;

  BatchGetCalculatedAttributeForProfileResponse({
    this.calculatedAttributeValues,
    this.conditionOverrides,
    this.errors,
  });

  factory BatchGetCalculatedAttributeForProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetCalculatedAttributeForProfileResponse(
      calculatedAttributeValues: (json['CalculatedAttributeValues'] as List?)
          ?.nonNulls
          .map((e) =>
              CalculatedAttributeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditionOverrides: json['ConditionOverrides'] != null
          ? ConditionOverrides.fromJson(
              json['ConditionOverrides'] as Map<String, dynamic>)
          : null,
      errors: (json['Errors'] as List?)
          ?.nonNulls
          .map((e) => BatchGetCalculatedAttributeForProfileError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatedAttributeValues = this.calculatedAttributeValues;
    final conditionOverrides = this.conditionOverrides;
    final errors = this.errors;
    return {
      if (calculatedAttributeValues != null)
        'CalculatedAttributeValues': calculatedAttributeValues,
      if (conditionOverrides != null) 'ConditionOverrides': conditionOverrides,
      if (errors != null) 'Errors': errors,
    };
  }
}

class BatchGetProfileResponse {
  /// For information about the errors that are common to all actions, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final List<BatchGetProfileError>? errors;

  /// Array of Profile Objects.
  final List<Profile>? profiles;

  BatchGetProfileResponse({
    this.errors,
    this.profiles,
  });

  factory BatchGetProfileResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetProfileResponse(
      errors: (json['Errors'] as List?)
          ?.nonNulls
          .map((e) => BatchGetProfileError.fromJson(e as Map<String, dynamic>))
          .toList(),
      profiles: (json['Profiles'] as List?)
          ?.nonNulls
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final profiles = this.profiles;
    return {
      if (errors != null) 'Errors': errors,
      if (profiles != null) 'Profiles': profiles,
    };
  }
}

class BatchPutProfileObjectResponse {
  /// A list of items that failed to be added to the domain.
  final List<BatchPutProfileObjectErrorItem>? failed;

  /// A list of items that were successfully added to the domain.
  final List<BatchPutProfileObjectResponseItem>? successful;

  BatchPutProfileObjectResponse({
    this.failed,
    this.successful,
  });

  factory BatchPutProfileObjectResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutProfileObjectResponse(
      failed: (json['Failed'] as List?)
          ?.nonNulls
          .map((e) => BatchPutProfileObjectErrorItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successful: (json['Successful'] as List?)
          ?.nonNulls
          .map((e) => BatchPutProfileObjectResponseItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final successful = this.successful;
    return {
      if (failed != null) 'Failed': failed,
      if (successful != null) 'Successful': successful,
    };
  }
}

class CreateCalculatedAttributeDefinitionResponse {
  /// Mathematical expression and a list of attribute items specified in that
  /// expression.
  final AttributeDetails? attributeDetails;

  /// The unique name of the calculated attribute.
  final String? calculatedAttributeName;

  /// The conditions including range, object count, and threshold for the
  /// calculated attribute.
  final Conditions? conditions;

  /// The timestamp of when the calculated attribute definition was created.
  final DateTime? createdAt;

  /// The description of the calculated attribute.
  final String? description;

  /// The display name of the calculated attribute.
  final String? displayName;

  /// The filter that was used as part of the request.
  final Filter? filter;

  /// The timestamp of when the calculated attribute definition was most recently
  /// edited.
  final DateTime? lastUpdatedAt;

  /// Information indicating if the Calculated Attribute is ready for use by
  /// confirming all historical data has been processed and reflected.
  final Readiness? readiness;

  /// The aggregation operation to perform for the calculated attribute.
  final Statistic? statistic;

  /// Status of the Calculated Attribute creation (whether all historical data has
  /// been indexed.)
  final ReadinessStatus? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Whether historical data ingested before the Calculated Attribute was created
  /// should be included in calculations.
  final bool? useHistoricalData;

  CreateCalculatedAttributeDefinitionResponse({
    this.attributeDetails,
    this.calculatedAttributeName,
    this.conditions,
    this.createdAt,
    this.description,
    this.displayName,
    this.filter,
    this.lastUpdatedAt,
    this.readiness,
    this.statistic,
    this.status,
    this.tags,
    this.useHistoricalData,
  });

  factory CreateCalculatedAttributeDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCalculatedAttributeDefinitionResponse(
      attributeDetails: json['AttributeDetails'] != null
          ? AttributeDetails.fromJson(
              json['AttributeDetails'] as Map<String, dynamic>)
          : null,
      calculatedAttributeName: json['CalculatedAttributeName'] as String?,
      conditions: json['Conditions'] != null
          ? Conditions.fromJson(json['Conditions'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      filter: json['Filter'] != null
          ? Filter.fromJson(json['Filter'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      readiness: json['Readiness'] != null
          ? Readiness.fromJson(json['Readiness'] as Map<String, dynamic>)
          : null,
      statistic: (json['Statistic'] as String?)?.let(Statistic.fromString),
      status: (json['Status'] as String?)?.let(ReadinessStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useHistoricalData: json['UseHistoricalData'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeDetails = this.attributeDetails;
    final calculatedAttributeName = this.calculatedAttributeName;
    final conditions = this.conditions;
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final filter = this.filter;
    final lastUpdatedAt = this.lastUpdatedAt;
    final readiness = this.readiness;
    final statistic = this.statistic;
    final status = this.status;
    final tags = this.tags;
    final useHistoricalData = this.useHistoricalData;
    return {
      if (attributeDetails != null) 'AttributeDetails': attributeDetails,
      if (calculatedAttributeName != null)
        'CalculatedAttributeName': calculatedAttributeName,
      if (conditions != null) 'Conditions': conditions,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (filter != null) 'Filter': filter,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (readiness != null) 'Readiness': readiness,
      if (statistic != null) 'Statistic': statistic.value,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
      if (useHistoricalData != null) 'UseHistoricalData': useHistoricalData,
    };
  }
}

class CreateDomainResponse {
  /// The timestamp of when the domain was created.
  final DateTime createdAt;

  /// The default number of days until the data within the domain expires.
  final int defaultExpirationDays;

  /// The unique name of the domain.
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  final DateTime lastUpdatedAt;

  /// The data store.
  final DataStoreResponse? dataStore;

  /// The URL of the SQS dead letter queue, which is used for reporting errors
  /// associated with ingesting data from third party applications.
  final String? deadLetterQueueUrl;

  /// The default encryption key, which is an AWS managed key, is used when no
  /// specific type of encryption key is specified. It is used to encrypt all data
  /// before it is placed in permanent or semi-permanent storage.
  final String? defaultEncryptionKey;

  /// The process of matching duplicate profiles. If <code>Matching</code> =
  /// <code>true</code>, Amazon Connect Customer Profiles starts a weekly batch
  /// process called Identity Resolution Job. If you do not specify a date and
  /// time for Identity Resolution Job to run, by default it runs every Saturday
  /// at 12AM UTC to detect duplicate profiles in your domains.
  ///
  /// After the Identity Resolution Job completes, use the <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">GetMatches</a>
  /// API to return and review the results. Or, if you have configured
  /// <code>ExportingConfig</code> in the <code>MatchingRequest</code>, you can
  /// download the results from S3.
  final MatchingResponse? matching;

  /// The process of matching duplicate profiles using the Rule-Based matching. If
  /// <code>RuleBasedMatching</code> = true, Connect Customer Customer Profiles
  /// will start to match and merge your profiles according to your configuration
  /// in the <code>RuleBasedMatchingRequest</code>. You can use the
  /// <code>ListRuleBasedMatches</code> and <code>GetSimilarProfiles</code> API to
  /// return and review the results. Also, if you have configured
  /// <code>ExportingConfig</code> in the <code>RuleBasedMatchingRequest</code>,
  /// you can download the results from S3.
  final RuleBasedMatchingResponse? ruleBasedMatching;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  CreateDomainResponse({
    required this.createdAt,
    required this.defaultExpirationDays,
    required this.domainName,
    required this.lastUpdatedAt,
    this.dataStore,
    this.deadLetterQueueUrl,
    this.defaultEncryptionKey,
    this.matching,
    this.ruleBasedMatching,
    this.tags,
  });

  factory CreateDomainResponse.fromJson(Map<String, dynamic> json) {
    return CreateDomainResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      defaultExpirationDays: (json['DefaultExpirationDays'] as int?) ?? 0,
      domainName: (json['DomainName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      dataStore: json['DataStore'] != null
          ? DataStoreResponse.fromJson(
              json['DataStore'] as Map<String, dynamic>)
          : null,
      deadLetterQueueUrl: json['DeadLetterQueueUrl'] as String?,
      defaultEncryptionKey: json['DefaultEncryptionKey'] as String?,
      matching: json['Matching'] != null
          ? MatchingResponse.fromJson(json['Matching'] as Map<String, dynamic>)
          : null,
      ruleBasedMatching: json['RuleBasedMatching'] != null
          ? RuleBasedMatchingResponse.fromJson(
              json['RuleBasedMatching'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final defaultExpirationDays = this.defaultExpirationDays;
    final domainName = this.domainName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final dataStore = this.dataStore;
    final deadLetterQueueUrl = this.deadLetterQueueUrl;
    final defaultEncryptionKey = this.defaultEncryptionKey;
    final matching = this.matching;
    final ruleBasedMatching = this.ruleBasedMatching;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DefaultExpirationDays': defaultExpirationDays,
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (dataStore != null) 'DataStore': dataStore,
      if (deadLetterQueueUrl != null) 'DeadLetterQueueUrl': deadLetterQueueUrl,
      if (defaultEncryptionKey != null)
        'DefaultEncryptionKey': defaultEncryptionKey,
      if (matching != null) 'Matching': matching,
      if (ruleBasedMatching != null) 'RuleBasedMatching': ruleBasedMatching,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateDomainLayoutResponse {
  /// The timestamp of when the layout was created.
  final DateTime createdAt;

  /// The description of the layout
  final String description;

  /// The display name of the layout
  final String displayName;

  /// A customizable layout that can be used to view data under Customer Profiles
  /// domain.
  final String layout;

  /// The unique name of the layout.
  final String layoutDefinitionName;

  /// The type of layout that can be used to view data under customer profiles
  /// domain.
  final LayoutType layoutType;

  /// The version used to create layout.
  final String version;

  /// If set to true for a layout, this layout will be used by default to view
  /// data. If set to false, then the layout will not be used by default, but it
  /// can be used to view data by explicitly selecting it in the console.
  final bool? isDefault;

  /// The timestamp of when the layout was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  CreateDomainLayoutResponse({
    required this.createdAt,
    required this.description,
    required this.displayName,
    required this.layout,
    required this.layoutDefinitionName,
    required this.layoutType,
    required this.version,
    this.isDefault,
    this.lastUpdatedAt,
    this.tags,
  });

  factory CreateDomainLayoutResponse.fromJson(Map<String, dynamic> json) {
    return CreateDomainLayoutResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      displayName: (json['DisplayName'] as String?) ?? '',
      layout: (json['Layout'] as String?) ?? '',
      layoutDefinitionName: (json['LayoutDefinitionName'] as String?) ?? '',
      layoutType: LayoutType.fromString((json['LayoutType'] as String?) ?? ''),
      version: (json['Version'] as String?) ?? '',
      isDefault: json['IsDefault'] as bool?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final layout = this.layout;
    final layoutDefinitionName = this.layoutDefinitionName;
    final layoutType = this.layoutType;
    final version = this.version;
    final isDefault = this.isDefault;
    final lastUpdatedAt = this.lastUpdatedAt;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'Description': description,
      'DisplayName': displayName,
      'Layout': layout,
      'LayoutDefinitionName': layoutDefinitionName,
      'LayoutType': layoutType.value,
      'Version': version,
      if (isDefault != null) 'IsDefault': isDefault,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateEventStreamResponse {
  /// A unique identifier for the event stream.
  final String eventStreamArn;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  CreateEventStreamResponse({
    required this.eventStreamArn,
    this.tags,
  });

  factory CreateEventStreamResponse.fromJson(Map<String, dynamic> json) {
    return CreateEventStreamResponse(
      eventStreamArn: (json['EventStreamArn'] as String?) ?? '',
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final eventStreamArn = this.eventStreamArn;
    final tags = this.tags;
    return {
      'EventStreamArn': eventStreamArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateEventTriggerResponse {
  /// The timestamp of when the event trigger was created.
  final DateTime? createdAt;

  /// The description of the event trigger.
  final String? description;

  /// A list of conditions that determine when an event should trigger the
  /// destination.
  final List<EventTriggerCondition>? eventTriggerConditions;

  /// Defines limits controlling whether an event triggers the destination, based
  /// on ingestion latency and the number of invocations per profile over specific
  /// time periods.
  final EventTriggerLimits? eventTriggerLimits;

  /// The unique name of the event trigger.
  final String? eventTriggerName;

  /// The timestamp of when the event trigger was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The unique name of the object type.
  final String? objectTypeName;

  /// The destination is triggered only for profiles that meet the criteria of a
  /// segment definition.
  final String? segmentFilter;

  /// An array of key-value pairs to apply to this resource.
  final Map<String, String>? tags;

  CreateEventTriggerResponse({
    this.createdAt,
    this.description,
    this.eventTriggerConditions,
    this.eventTriggerLimits,
    this.eventTriggerName,
    this.lastUpdatedAt,
    this.objectTypeName,
    this.segmentFilter,
    this.tags,
  });

  factory CreateEventTriggerResponse.fromJson(Map<String, dynamic> json) {
    return CreateEventTriggerResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      eventTriggerConditions: (json['EventTriggerConditions'] as List?)
          ?.nonNulls
          .map((e) => EventTriggerCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventTriggerLimits: json['EventTriggerLimits'] != null
          ? EventTriggerLimits.fromJson(
              json['EventTriggerLimits'] as Map<String, dynamic>)
          : null,
      eventTriggerName: json['EventTriggerName'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      objectTypeName: json['ObjectTypeName'] as String?,
      segmentFilter: json['SegmentFilter'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final eventTriggerConditions = this.eventTriggerConditions;
    final eventTriggerLimits = this.eventTriggerLimits;
    final eventTriggerName = this.eventTriggerName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final objectTypeName = this.objectTypeName;
    final segmentFilter = this.segmentFilter;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (eventTriggerConditions != null)
        'EventTriggerConditions': eventTriggerConditions,
      if (eventTriggerLimits != null) 'EventTriggerLimits': eventTriggerLimits,
      if (eventTriggerName != null) 'EventTriggerName': eventTriggerName,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (segmentFilter != null) 'SegmentFilter': segmentFilter,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateIntegrationWorkflowResponse {
  /// A message indicating create request was received.
  final String message;

  /// Unique identifier for the workflow.
  final String workflowId;

  CreateIntegrationWorkflowResponse({
    required this.message,
    required this.workflowId,
  });

  factory CreateIntegrationWorkflowResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateIntegrationWorkflowResponse(
      message: (json['Message'] as String?) ?? '',
      workflowId: (json['WorkflowId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final workflowId = this.workflowId;
    return {
      'Message': message,
      'WorkflowId': workflowId,
    };
  }
}

class CreateProfileResponse {
  /// The unique identifier of a customer profile.
  final String profileId;

  CreateProfileResponse({
    required this.profileId,
  });

  factory CreateProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateProfileResponse(
      profileId: (json['ProfileId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final profileId = this.profileId;
    return {
      'ProfileId': profileId,
    };
  }
}

class CreateRecommenderResponse {
  /// The ARN of the recommender
  final String recommenderArn;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  CreateRecommenderResponse({
    required this.recommenderArn,
    this.tags,
  });

  factory CreateRecommenderResponse.fromJson(Map<String, dynamic> json) {
    return CreateRecommenderResponse(
      recommenderArn: (json['RecommenderArn'] as String?) ?? '',
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final recommenderArn = this.recommenderArn;
    final tags = this.tags;
    return {
      'RecommenderArn': recommenderArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateRecommenderFilterResponse {
  /// The Amazon Resource Name (ARN) of the recommender filter.
  final String recommenderFilterArn;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  CreateRecommenderFilterResponse({
    required this.recommenderFilterArn,
    this.tags,
  });

  factory CreateRecommenderFilterResponse.fromJson(Map<String, dynamic> json) {
    return CreateRecommenderFilterResponse(
      recommenderFilterArn: (json['RecommenderFilterArn'] as String?) ?? '',
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final recommenderFilterArn = this.recommenderFilterArn;
    final tags = this.tags;
    return {
      'RecommenderFilterArn': recommenderFilterArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateRecommenderSchemaResponse {
  /// The timestamp of when the recommender schema was created.
  final DateTime createdAt;

  /// A map of dataset type to column definitions included in the schema.
  final Map<String, List<RecommenderSchemaField>> fields;

  /// The Amazon Resource Name (ARN) of the recommender schema.
  final String recommenderSchemaArn;

  /// The name of the recommender schema.
  final String recommenderSchemaName;

  /// The status of the recommender schema.
  final RecommenderSchemaStatus status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  CreateRecommenderSchemaResponse({
    required this.createdAt,
    required this.fields,
    required this.recommenderSchemaArn,
    required this.recommenderSchemaName,
    required this.status,
    this.tags,
  });

  factory CreateRecommenderSchemaResponse.fromJson(Map<String, dynamic> json) {
    return CreateRecommenderSchemaResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      fields: ((json['Fields'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) => RecommenderSchemaField.fromJson(
                      e as Map<String, dynamic>))
                  .toList())),
      recommenderSchemaArn: (json['RecommenderSchemaArn'] as String?) ?? '',
      recommenderSchemaName: (json['RecommenderSchemaName'] as String?) ?? '',
      status:
          RecommenderSchemaStatus.fromString((json['Status'] as String?) ?? ''),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final fields = this.fields;
    final recommenderSchemaArn = this.recommenderSchemaArn;
    final recommenderSchemaName = this.recommenderSchemaName;
    final status = this.status;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'Fields': fields,
      'RecommenderSchemaArn': recommenderSchemaArn,
      'RecommenderSchemaName': recommenderSchemaName,
      'Status': status.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateSegmentDefinitionResponse {
  /// The name of the segment definition.
  final String segmentDefinitionName;

  /// The timestamp of when the segment definition was created.
  final DateTime? createdAt;

  /// The description of the segment definition.
  final String? description;

  /// The display name of the segment definition.
  final String? displayName;

  /// The arn of the segment definition.
  final String? segmentDefinitionArn;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  CreateSegmentDefinitionResponse({
    required this.segmentDefinitionName,
    this.createdAt,
    this.description,
    this.displayName,
    this.segmentDefinitionArn,
    this.tags,
  });

  factory CreateSegmentDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return CreateSegmentDefinitionResponse(
      segmentDefinitionName: (json['SegmentDefinitionName'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      segmentDefinitionArn: json['SegmentDefinitionArn'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final segmentDefinitionName = this.segmentDefinitionName;
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final segmentDefinitionArn = this.segmentDefinitionArn;
    final tags = this.tags;
    return {
      'SegmentDefinitionName': segmentDefinitionName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (segmentDefinitionArn != null)
        'SegmentDefinitionArn': segmentDefinitionArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateSegmentEstimateResponse {
  /// The unique name of the domain.
  final String? domainName;

  /// A unique identifier for the resource. The value can be passed to
  /// <code>GetSegmentEstimate</code> to retrieve the result of segment estimate
  /// status.
  final String? estimateId;

  /// The status code for the response.
  final int? statusCode;

  CreateSegmentEstimateResponse({
    this.domainName,
    this.estimateId,
    this.statusCode,
  });

  factory CreateSegmentEstimateResponse.fromJson(Map<String, dynamic> json) {
    return CreateSegmentEstimateResponse(
      domainName: json['DomainName'] as String?,
      estimateId: json['EstimateId'] as String?,
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final estimateId = this.estimateId;
    final statusCode = this.statusCode;
    return {
      if (domainName != null) 'DomainName': domainName,
      if (estimateId != null) 'EstimateId': estimateId,
    };
  }
}

class CreateSegmentSnapshotResponse {
  /// The unique identifier of the segment snapshot.
  final String snapshotId;

  CreateSegmentSnapshotResponse({
    required this.snapshotId,
  });

  factory CreateSegmentSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return CreateSegmentSnapshotResponse(
      snapshotId: (json['SnapshotId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotId = this.snapshotId;
    return {
      'SnapshotId': snapshotId,
    };
  }
}

class CreateUploadJobResponse {
  /// The unique identifier for the created upload job.
  final String jobId;

  CreateUploadJobResponse({
    required this.jobId,
  });

  factory CreateUploadJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateUploadJobResponse(
      jobId: (json['JobId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'JobId': jobId,
    };
  }
}

class DeleteCalculatedAttributeDefinitionResponse {
  DeleteCalculatedAttributeDefinitionResponse();

  factory DeleteCalculatedAttributeDefinitionResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteCalculatedAttributeDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDomainResponse {
  /// A message that indicates the delete request is done.
  final String message;

  DeleteDomainResponse({
    required this.message,
  });

  factory DeleteDomainResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDomainResponse(
      message: (json['Message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'Message': message,
    };
  }
}

class DeleteDomainLayoutResponse {
  /// A message that indicates the delete request is done.
  final String message;

  DeleteDomainLayoutResponse({
    required this.message,
  });

  factory DeleteDomainLayoutResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDomainLayoutResponse(
      message: (json['Message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'Message': message,
    };
  }
}

class DeleteDomainObjectTypeResponse {
  DeleteDomainObjectTypeResponse();

  factory DeleteDomainObjectTypeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDomainObjectTypeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEventStreamResponse {
  DeleteEventStreamResponse();

  factory DeleteEventStreamResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEventStreamResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEventTriggerResponse {
  /// A message that indicates the delete request is done.
  final String message;

  DeleteEventTriggerResponse({
    required this.message,
  });

  factory DeleteEventTriggerResponse.fromJson(Map<String, dynamic> json) {
    return DeleteEventTriggerResponse(
      message: (json['Message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'Message': message,
    };
  }
}

class DeleteIntegrationResponse {
  /// A message that indicates the delete request is done.
  final String message;

  DeleteIntegrationResponse({
    required this.message,
  });

  factory DeleteIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteIntegrationResponse(
      message: (json['Message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'Message': message,
    };
  }
}

class DeleteProfileResponse {
  /// A message that indicates the delete request is done.
  final String? message;

  DeleteProfileResponse({
    this.message,
  });

  factory DeleteProfileResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProfileResponse(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class DeleteProfileKeyResponse {
  /// A message that indicates the delete request is done.
  final String? message;

  DeleteProfileKeyResponse({
    this.message,
  });

  factory DeleteProfileKeyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProfileKeyResponse(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class DeleteProfileObjectResponse {
  /// A message that indicates the delete request is done.
  final String? message;

  DeleteProfileObjectResponse({
    this.message,
  });

  factory DeleteProfileObjectResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProfileObjectResponse(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class DeleteProfileObjectTypeResponse {
  /// A message that indicates the delete request is done.
  final String message;

  DeleteProfileObjectTypeResponse({
    required this.message,
  });

  factory DeleteProfileObjectTypeResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProfileObjectTypeResponse(
      message: (json['Message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'Message': message,
    };
  }
}

class DeleteRecommenderResponse {
  DeleteRecommenderResponse();

  factory DeleteRecommenderResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRecommenderResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRecommenderFilterResponse {
  /// A message that indicates the delete request is done.
  final String message;

  DeleteRecommenderFilterResponse({
    required this.message,
  });

  factory DeleteRecommenderFilterResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRecommenderFilterResponse(
      message: (json['Message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'Message': message,
    };
  }
}

class DeleteRecommenderSchemaResponse {
  DeleteRecommenderSchemaResponse();

  factory DeleteRecommenderSchemaResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRecommenderSchemaResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSegmentDefinitionResponse {
  /// A message that indicates the delete request is done.
  final String? message;

  DeleteSegmentDefinitionResponse({
    this.message,
  });

  factory DeleteSegmentDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSegmentDefinitionResponse(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class DeleteWorkflowResponse {
  DeleteWorkflowResponse();

  factory DeleteWorkflowResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkflowResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DetectProfileObjectTypeResponse {
  /// Detected <code>ProfileObjectType</code> mappings from given objects. A
  /// maximum of one mapping is supported.
  final List<DetectedProfileObjectType>? detectedProfileObjectTypes;

  DetectProfileObjectTypeResponse({
    this.detectedProfileObjectTypes,
  });

  factory DetectProfileObjectTypeResponse.fromJson(Map<String, dynamic> json) {
    return DetectProfileObjectTypeResponse(
      detectedProfileObjectTypes: (json['DetectedProfileObjectTypes'] as List?)
          ?.nonNulls
          .map((e) =>
              DetectedProfileObjectType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final detectedProfileObjectTypes = this.detectedProfileObjectTypes;
    return {
      if (detectedProfileObjectTypes != null)
        'DetectedProfileObjectTypes': detectedProfileObjectTypes,
    };
  }
}

class GetAutoMergingPreviewResponse {
  /// The unique name of the domain.
  final String domainName;

  /// The number of match groups in the domain that have been reviewed in this
  /// preview dry run.
  final int? numberOfMatchesInSample;

  /// The number of profiles found in this preview dry run.
  final int? numberOfProfilesInSample;

  /// The number of profiles that would be merged if this wasn't a preview dry
  /// run.
  final int? numberOfProfilesWillBeMerged;

  GetAutoMergingPreviewResponse({
    required this.domainName,
    this.numberOfMatchesInSample,
    this.numberOfProfilesInSample,
    this.numberOfProfilesWillBeMerged,
  });

  factory GetAutoMergingPreviewResponse.fromJson(Map<String, dynamic> json) {
    return GetAutoMergingPreviewResponse(
      domainName: (json['DomainName'] as String?) ?? '',
      numberOfMatchesInSample: json['NumberOfMatchesInSample'] as int?,
      numberOfProfilesInSample: json['NumberOfProfilesInSample'] as int?,
      numberOfProfilesWillBeMerged:
          json['NumberOfProfilesWillBeMerged'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final numberOfMatchesInSample = this.numberOfMatchesInSample;
    final numberOfProfilesInSample = this.numberOfProfilesInSample;
    final numberOfProfilesWillBeMerged = this.numberOfProfilesWillBeMerged;
    return {
      'DomainName': domainName,
      if (numberOfMatchesInSample != null)
        'NumberOfMatchesInSample': numberOfMatchesInSample,
      if (numberOfProfilesInSample != null)
        'NumberOfProfilesInSample': numberOfProfilesInSample,
      if (numberOfProfilesWillBeMerged != null)
        'NumberOfProfilesWillBeMerged': numberOfProfilesWillBeMerged,
    };
  }
}

class GetCalculatedAttributeDefinitionResponse {
  /// Mathematical expression and a list of attribute items specified in that
  /// expression.
  final AttributeDetails? attributeDetails;

  /// The unique name of the calculated attribute.
  final String? calculatedAttributeName;

  /// The conditions including range, object count, and threshold for the
  /// calculated attribute.
  final Conditions? conditions;

  /// The timestamp of when the calculated attribute definition was created.
  final DateTime? createdAt;

  /// The description of the calculated attribute.
  final String? description;

  /// The display name of the calculated attribute.
  final String? displayName;

  /// The filter assigned to this calculated attribute definition.
  final Filter? filter;

  /// The timestamp of when the calculated attribute definition was most recently
  /// edited.
  final DateTime? lastUpdatedAt;

  /// Information indicating if the Calculated Attribute is ready for use by
  /// confirming all historical data has been processed and reflected.
  final Readiness? readiness;

  /// The aggregation operation to perform for the calculated attribute.
  final Statistic? statistic;

  /// Status of the Calculated Attribute creation (whether all historical data has
  /// been indexed).
  final ReadinessStatus? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Whether historical data ingested before the Calculated Attribute was created
  /// should be included in calculations.
  final bool? useHistoricalData;

  GetCalculatedAttributeDefinitionResponse({
    this.attributeDetails,
    this.calculatedAttributeName,
    this.conditions,
    this.createdAt,
    this.description,
    this.displayName,
    this.filter,
    this.lastUpdatedAt,
    this.readiness,
    this.statistic,
    this.status,
    this.tags,
    this.useHistoricalData,
  });

  factory GetCalculatedAttributeDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCalculatedAttributeDefinitionResponse(
      attributeDetails: json['AttributeDetails'] != null
          ? AttributeDetails.fromJson(
              json['AttributeDetails'] as Map<String, dynamic>)
          : null,
      calculatedAttributeName: json['CalculatedAttributeName'] as String?,
      conditions: json['Conditions'] != null
          ? Conditions.fromJson(json['Conditions'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      filter: json['Filter'] != null
          ? Filter.fromJson(json['Filter'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      readiness: json['Readiness'] != null
          ? Readiness.fromJson(json['Readiness'] as Map<String, dynamic>)
          : null,
      statistic: (json['Statistic'] as String?)?.let(Statistic.fromString),
      status: (json['Status'] as String?)?.let(ReadinessStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useHistoricalData: json['UseHistoricalData'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeDetails = this.attributeDetails;
    final calculatedAttributeName = this.calculatedAttributeName;
    final conditions = this.conditions;
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final filter = this.filter;
    final lastUpdatedAt = this.lastUpdatedAt;
    final readiness = this.readiness;
    final statistic = this.statistic;
    final status = this.status;
    final tags = this.tags;
    final useHistoricalData = this.useHistoricalData;
    return {
      if (attributeDetails != null) 'AttributeDetails': attributeDetails,
      if (calculatedAttributeName != null)
        'CalculatedAttributeName': calculatedAttributeName,
      if (conditions != null) 'Conditions': conditions,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (filter != null) 'Filter': filter,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (readiness != null) 'Readiness': readiness,
      if (statistic != null) 'Statistic': statistic.value,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
      if (useHistoricalData != null) 'UseHistoricalData': useHistoricalData,
    };
  }
}

class GetCalculatedAttributeForProfileResponse {
  /// The unique name of the calculated attribute.
  final String? calculatedAttributeName;

  /// The display name of the calculated attribute.
  final String? displayName;

  /// Indicates whether the calculated attribute’s value is based on partial data.
  /// If data is partial, it is set to true.
  final String? isDataPartial;

  /// The timestamp of the newest object included in the calculated attribute
  /// calculation.
  final DateTime? lastObjectTimestamp;

  /// The value of the calculated attribute.
  final String? value;

  GetCalculatedAttributeForProfileResponse({
    this.calculatedAttributeName,
    this.displayName,
    this.isDataPartial,
    this.lastObjectTimestamp,
    this.value,
  });

  factory GetCalculatedAttributeForProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCalculatedAttributeForProfileResponse(
      calculatedAttributeName: json['CalculatedAttributeName'] as String?,
      displayName: json['DisplayName'] as String?,
      isDataPartial: json['IsDataPartial'] as String?,
      lastObjectTimestamp: timeStampFromJson(json['LastObjectTimestamp']),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final calculatedAttributeName = this.calculatedAttributeName;
    final displayName = this.displayName;
    final isDataPartial = this.isDataPartial;
    final lastObjectTimestamp = this.lastObjectTimestamp;
    final value = this.value;
    return {
      if (calculatedAttributeName != null)
        'CalculatedAttributeName': calculatedAttributeName,
      if (displayName != null) 'DisplayName': displayName,
      if (isDataPartial != null) 'IsDataPartial': isDataPartial,
      if (lastObjectTimestamp != null)
        'LastObjectTimestamp': unixTimestampToJson(lastObjectTimestamp),
      if (value != null) 'Value': value,
    };
  }
}

class GetDomainResponse {
  /// The timestamp of when the domain was created.
  final DateTime createdAt;

  /// The unique name of the domain.
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  final DateTime lastUpdatedAt;

  /// True if data store is enabled for this domain.
  final DataStoreResponse? dataStore;

  /// The URL of the SQS dead letter queue, which is used for reporting errors
  /// associated with ingesting data from third party applications.
  final String? deadLetterQueueUrl;

  /// The default encryption key, which is an AWS managed key, is used when no
  /// specific type of encryption key is specified. It is used to encrypt all data
  /// before it is placed in permanent or semi-permanent storage.
  final String? defaultEncryptionKey;

  /// The default number of days until the data within the domain expires.
  final int? defaultExpirationDays;

  /// The process of matching duplicate profiles. If <code>Matching</code> =
  /// <code>true</code>, Amazon Connect Customer Profiles starts a weekly batch
  /// process called Identity Resolution Job. If you do not specify a date and
  /// time for Identity Resolution Job to run, by default it runs every Saturday
  /// at 12AM UTC to detect duplicate profiles in your domains.
  ///
  /// After the Identity Resolution Job completes, use the <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">GetMatches</a>
  /// API to return and review the results. Or, if you have configured
  /// <code>ExportingConfig</code> in the <code>MatchingRequest</code>, you can
  /// download the results from S3.
  final MatchingResponse? matching;

  /// The process of matching duplicate profiles using the Rule-Based matching. If
  /// <code>RuleBasedMatching</code> = true, Connect Customer Customer Profiles
  /// will start to match and merge your profiles according to your configuration
  /// in the <code>RuleBasedMatchingRequest</code>. You can use the
  /// <code>ListRuleBasedMatches</code> and <code>GetSimilarProfiles</code> API to
  /// return and review the results. Also, if you have configured
  /// <code>ExportingConfig</code> in the <code>RuleBasedMatchingRequest</code>,
  /// you can download the results from S3.
  final RuleBasedMatchingResponse? ruleBasedMatching;

  /// Usage-specific statistics about the domain.
  final DomainStats? stats;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetDomainResponse({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    this.dataStore,
    this.deadLetterQueueUrl,
    this.defaultEncryptionKey,
    this.defaultExpirationDays,
    this.matching,
    this.ruleBasedMatching,
    this.stats,
    this.tags,
  });

  factory GetDomainResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      domainName: (json['DomainName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      dataStore: json['DataStore'] != null
          ? DataStoreResponse.fromJson(
              json['DataStore'] as Map<String, dynamic>)
          : null,
      deadLetterQueueUrl: json['DeadLetterQueueUrl'] as String?,
      defaultEncryptionKey: json['DefaultEncryptionKey'] as String?,
      defaultExpirationDays: json['DefaultExpirationDays'] as int?,
      matching: json['Matching'] != null
          ? MatchingResponse.fromJson(json['Matching'] as Map<String, dynamic>)
          : null,
      ruleBasedMatching: json['RuleBasedMatching'] != null
          ? RuleBasedMatchingResponse.fromJson(
              json['RuleBasedMatching'] as Map<String, dynamic>)
          : null,
      stats: json['Stats'] != null
          ? DomainStats.fromJson(json['Stats'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final dataStore = this.dataStore;
    final deadLetterQueueUrl = this.deadLetterQueueUrl;
    final defaultEncryptionKey = this.defaultEncryptionKey;
    final defaultExpirationDays = this.defaultExpirationDays;
    final matching = this.matching;
    final ruleBasedMatching = this.ruleBasedMatching;
    final stats = this.stats;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (dataStore != null) 'DataStore': dataStore,
      if (deadLetterQueueUrl != null) 'DeadLetterQueueUrl': deadLetterQueueUrl,
      if (defaultEncryptionKey != null)
        'DefaultEncryptionKey': defaultEncryptionKey,
      if (defaultExpirationDays != null)
        'DefaultExpirationDays': defaultExpirationDays,
      if (matching != null) 'Matching': matching,
      if (ruleBasedMatching != null) 'RuleBasedMatching': ruleBasedMatching,
      if (stats != null) 'Stats': stats,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetDomainLayoutResponse {
  /// The timestamp of when the layout was created.
  final DateTime createdAt;

  /// The description of the layout
  final String description;

  /// The display name of the layout
  final String displayName;

  /// The timestamp of when the layout was most recently updated.
  final DateTime lastUpdatedAt;

  /// A customizable layout that can be used to view data under a Customer
  /// Profiles domain.
  final String layout;

  /// The unique name of the layout.
  final String layoutDefinitionName;

  /// The type of layout that can be used to view data under a Customer Profiles
  /// domain.
  final LayoutType layoutType;

  /// The version used to create layout.
  final String version;

  /// If set to true for a layout, this layout will be used by default to view
  /// data. If set to false, then the layout will not be used by default, but it
  /// can be used to view data by explicitly selecting it in the console.
  final bool? isDefault;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetDomainLayoutResponse({
    required this.createdAt,
    required this.description,
    required this.displayName,
    required this.lastUpdatedAt,
    required this.layout,
    required this.layoutDefinitionName,
    required this.layoutType,
    required this.version,
    this.isDefault,
    this.tags,
  });

  factory GetDomainLayoutResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainLayoutResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      displayName: (json['DisplayName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      layout: (json['Layout'] as String?) ?? '',
      layoutDefinitionName: (json['LayoutDefinitionName'] as String?) ?? '',
      layoutType: LayoutType.fromString((json['LayoutType'] as String?) ?? ''),
      version: (json['Version'] as String?) ?? '',
      isDefault: json['IsDefault'] as bool?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final layout = this.layout;
    final layoutDefinitionName = this.layoutDefinitionName;
    final layoutType = this.layoutType;
    final version = this.version;
    final isDefault = this.isDefault;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'Description': description,
      'DisplayName': displayName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'Layout': layout,
      'LayoutDefinitionName': layoutDefinitionName,
      'LayoutType': layoutType.value,
      'Version': version,
      if (isDefault != null) 'IsDefault': isDefault,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetDomainObjectTypeResponse {
  /// The unique name of the domain object type.
  final String objectTypeName;

  /// The timestamp of when the domain object type was created.
  final DateTime? createdAt;

  /// The description of the domain object type.
  final String? description;

  /// The customer provided KMS key used to encrypt this type of domain object.
  final String? encryptionKey;

  /// A map of field names to their corresponding domain object type field
  /// definitions.
  final Map<String, DomainObjectTypeField>? fields;

  /// The timestamp of when the domain object type was most recently edited.
  final DateTime? lastUpdatedAt;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetDomainObjectTypeResponse({
    required this.objectTypeName,
    this.createdAt,
    this.description,
    this.encryptionKey,
    this.fields,
    this.lastUpdatedAt,
    this.tags,
  });

  factory GetDomainObjectTypeResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainObjectTypeResponse(
      objectTypeName: (json['ObjectTypeName'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      encryptionKey: json['EncryptionKey'] as String?,
      fields: (json['Fields'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k, DomainObjectTypeField.fromJson(e as Map<String, dynamic>))),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final objectTypeName = this.objectTypeName;
    final createdAt = this.createdAt;
    final description = this.description;
    final encryptionKey = this.encryptionKey;
    final fields = this.fields;
    final lastUpdatedAt = this.lastUpdatedAt;
    final tags = this.tags;
    return {
      'ObjectTypeName': objectTypeName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (fields != null) 'Fields': fields,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetEventStreamResponse {
  /// The timestamp of when the export was created.
  final DateTime createdAt;

  /// Details regarding the Kinesis stream.
  final EventStreamDestinationDetails destinationDetails;

  /// The unique name of the domain.
  final String domainName;

  /// A unique identifier for the event stream.
  final String eventStreamArn;

  /// The operational state of destination stream for export.
  final EventStreamState state;

  /// The timestamp when the <code>State</code> changed to <code>STOPPED</code>.
  final DateTime? stoppedSince;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetEventStreamResponse({
    required this.createdAt,
    required this.destinationDetails,
    required this.domainName,
    required this.eventStreamArn,
    required this.state,
    this.stoppedSince,
    this.tags,
  });

  factory GetEventStreamResponse.fromJson(Map<String, dynamic> json) {
    return GetEventStreamResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      destinationDetails: EventStreamDestinationDetails.fromJson(
          (json['DestinationDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      domainName: (json['DomainName'] as String?) ?? '',
      eventStreamArn: (json['EventStreamArn'] as String?) ?? '',
      state: EventStreamState.fromString((json['State'] as String?) ?? ''),
      stoppedSince: timeStampFromJson(json['StoppedSince']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final destinationDetails = this.destinationDetails;
    final domainName = this.domainName;
    final eventStreamArn = this.eventStreamArn;
    final state = this.state;
    final stoppedSince = this.stoppedSince;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DestinationDetails': destinationDetails,
      'DomainName': domainName,
      'EventStreamArn': eventStreamArn,
      'State': state.value,
      if (stoppedSince != null)
        'StoppedSince': unixTimestampToJson(stoppedSince),
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetEventTriggerResponse {
  /// The timestamp of when the event trigger was created.
  final DateTime? createdAt;

  /// The description of the event trigger.
  final String? description;

  /// A list of conditions that determine when an event should trigger the
  /// destination.
  final List<EventTriggerCondition>? eventTriggerConditions;

  /// Defines limits controlling whether an event triggers the destination, based
  /// on ingestion latency and the number of invocations per profile over specific
  /// time periods.
  final EventTriggerLimits? eventTriggerLimits;

  /// The unique name of the event trigger.
  final String? eventTriggerName;

  /// The timestamp of when the event trigger was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The unique name of the object type.
  final String? objectTypeName;

  /// The destination is triggered only for profiles that meet the criteria of a
  /// segment definition.
  final String? segmentFilter;

  /// An array of key-value pairs to apply to this resource.
  final Map<String, String>? tags;

  GetEventTriggerResponse({
    this.createdAt,
    this.description,
    this.eventTriggerConditions,
    this.eventTriggerLimits,
    this.eventTriggerName,
    this.lastUpdatedAt,
    this.objectTypeName,
    this.segmentFilter,
    this.tags,
  });

  factory GetEventTriggerResponse.fromJson(Map<String, dynamic> json) {
    return GetEventTriggerResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      eventTriggerConditions: (json['EventTriggerConditions'] as List?)
          ?.nonNulls
          .map((e) => EventTriggerCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventTriggerLimits: json['EventTriggerLimits'] != null
          ? EventTriggerLimits.fromJson(
              json['EventTriggerLimits'] as Map<String, dynamic>)
          : null,
      eventTriggerName: json['EventTriggerName'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      objectTypeName: json['ObjectTypeName'] as String?,
      segmentFilter: json['SegmentFilter'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final eventTriggerConditions = this.eventTriggerConditions;
    final eventTriggerLimits = this.eventTriggerLimits;
    final eventTriggerName = this.eventTriggerName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final objectTypeName = this.objectTypeName;
    final segmentFilter = this.segmentFilter;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (eventTriggerConditions != null)
        'EventTriggerConditions': eventTriggerConditions,
      if (eventTriggerLimits != null) 'EventTriggerLimits': eventTriggerLimits,
      if (eventTriggerName != null) 'EventTriggerName': eventTriggerName,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (segmentFilter != null) 'SegmentFilter': segmentFilter,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetIdentityResolutionJobResponse {
  /// Configuration settings for how to perform the auto-merging of profiles.
  final AutoMerging? autoMerging;

  /// The unique name of the domain.
  final String? domainName;

  /// The S3 location where the Identity Resolution Job writes result files.
  final ExportingLocation? exportingLocation;

  /// The timestamp of when the Identity Resolution Job was completed.
  final DateTime? jobEndTime;

  /// The timestamp of when the Identity Resolution Job will expire.
  final DateTime? jobExpirationTime;

  /// The unique identifier of the Identity Resolution Job.
  final String? jobId;

  /// The timestamp of when the Identity Resolution Job was started or will be
  /// started.
  final DateTime? jobStartTime;

  /// Statistics about the Identity Resolution Job.
  final JobStats? jobStats;

  /// The timestamp of when the Identity Resolution Job was most recently edited.
  final DateTime? lastUpdatedAt;

  /// The error messages that are generated when the Identity Resolution Job runs.
  final String? message;

  /// The status of the Identity Resolution Job.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The Identity Resolution Job is scheduled but has not
  /// started yet. If you turn off the Identity Resolution feature in your domain,
  /// jobs in the <code>PENDING</code> state are deleted.
  /// </li>
  /// <li>
  /// <code>PREPROCESSING</code>: The Identity Resolution Job is loading your
  /// data.
  /// </li>
  /// <li>
  /// <code>FIND_MATCHING</code>: The Identity Resolution Job is using the machine
  /// learning model to identify profiles that belong to the same matching group.
  /// </li>
  /// <li>
  /// <code>MERGING</code>: The Identity Resolution Job is merging duplicate
  /// profiles.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code>: The Identity Resolution Job completed successfully.
  /// </li>
  /// <li>
  /// <code>PARTIAL_SUCCESS</code>: There's a system error and not all of the data
  /// is merged. The Identity Resolution Job writes a message indicating the
  /// source of the problem.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The Identity Resolution Job did not merge any data. It
  /// writes a message indicating the source of the problem.
  /// </li>
  /// </ul>
  final IdentityResolutionJobStatus? status;

  GetIdentityResolutionJobResponse({
    this.autoMerging,
    this.domainName,
    this.exportingLocation,
    this.jobEndTime,
    this.jobExpirationTime,
    this.jobId,
    this.jobStartTime,
    this.jobStats,
    this.lastUpdatedAt,
    this.message,
    this.status,
  });

  factory GetIdentityResolutionJobResponse.fromJson(Map<String, dynamic> json) {
    return GetIdentityResolutionJobResponse(
      autoMerging: json['AutoMerging'] != null
          ? AutoMerging.fromJson(json['AutoMerging'] as Map<String, dynamic>)
          : null,
      domainName: json['DomainName'] as String?,
      exportingLocation: json['ExportingLocation'] != null
          ? ExportingLocation.fromJson(
              json['ExportingLocation'] as Map<String, dynamic>)
          : null,
      jobEndTime: timeStampFromJson(json['JobEndTime']),
      jobExpirationTime: timeStampFromJson(json['JobExpirationTime']),
      jobId: json['JobId'] as String?,
      jobStartTime: timeStampFromJson(json['JobStartTime']),
      jobStats: json['JobStats'] != null
          ? JobStats.fromJson(json['JobStats'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      message: json['Message'] as String?,
      status: (json['Status'] as String?)
          ?.let(IdentityResolutionJobStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final autoMerging = this.autoMerging;
    final domainName = this.domainName;
    final exportingLocation = this.exportingLocation;
    final jobEndTime = this.jobEndTime;
    final jobExpirationTime = this.jobExpirationTime;
    final jobId = this.jobId;
    final jobStartTime = this.jobStartTime;
    final jobStats = this.jobStats;
    final lastUpdatedAt = this.lastUpdatedAt;
    final message = this.message;
    final status = this.status;
    return {
      if (autoMerging != null) 'AutoMerging': autoMerging,
      if (domainName != null) 'DomainName': domainName,
      if (exportingLocation != null) 'ExportingLocation': exportingLocation,
      if (jobEndTime != null) 'JobEndTime': unixTimestampToJson(jobEndTime),
      if (jobExpirationTime != null)
        'JobExpirationTime': unixTimestampToJson(jobExpirationTime),
      if (jobId != null) 'JobId': jobId,
      if (jobStartTime != null)
        'JobStartTime': unixTimestampToJson(jobStartTime),
      if (jobStats != null) 'JobStats': jobStats,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (message != null) 'Message': message,
      if (status != null) 'Status': status.value,
    };
  }
}

class GetIntegrationResponse {
  /// The timestamp of when the domain was created.
  final DateTime createdAt;

  /// The unique name of the domain.
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  final DateTime lastUpdatedAt;

  /// The URI of the S3 bucket or any other type of data source.
  final String uri;

  /// A list of unique names for active event triggers associated with the
  /// integration. This list would be empty if no Event Trigger is associated with
  /// the integration.
  final List<String>? eventTriggerNames;

  /// Boolean that shows if the Flow that's associated with the Integration is
  /// created in Amazon Appflow, or with ObjectTypeName equals _unstructured via
  /// API/CLI in flowDefinition.
  final bool? isUnstructured;

  /// The name of the profile object type.
  final String? objectTypeName;

  /// A map in which each key is an event type from an external application such
  /// as Segment or Shopify, and each value is an <code>ObjectTypeName</code>
  /// (template) used to ingest the event. It supports the following event types:
  /// <code>SegmentIdentify</code>, <code>ShopifyCreateCustomers</code>,
  /// <code>ShopifyUpdateCustomers</code>, <code>ShopifyCreateDraftOrders</code>,
  /// <code>ShopifyUpdateDraftOrders</code>, <code>ShopifyCreateOrders</code>, and
  /// <code>ShopifyUpdatedOrders</code>.
  final Map<String, String>? objectTypeNames;

  /// The Amazon Resource Name (ARN) of the IAM role. The Integration uses this
  /// role to make Customer Profiles requests on your behalf.
  final String? roleArn;

  /// Specifies whether the integration applies to profile level data (associated
  /// with profiles) or domain level data (not associated with any specific
  /// profile). The default value is PROFILE.
  final Scope? scope;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Unique identifier for the workflow.
  final String? workflowId;

  GetIntegrationResponse({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    required this.uri,
    this.eventTriggerNames,
    this.isUnstructured,
    this.objectTypeName,
    this.objectTypeNames,
    this.roleArn,
    this.scope,
    this.tags,
    this.workflowId,
  });

  factory GetIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return GetIntegrationResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      domainName: (json['DomainName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      uri: (json['Uri'] as String?) ?? '',
      eventTriggerNames: (json['EventTriggerNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      isUnstructured: json['IsUnstructured'] as bool?,
      objectTypeName: json['ObjectTypeName'] as String?,
      objectTypeNames: (json['ObjectTypeNames'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      roleArn: json['RoleArn'] as String?,
      scope: (json['Scope'] as String?)?.let(Scope.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      workflowId: json['WorkflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final uri = this.uri;
    final eventTriggerNames = this.eventTriggerNames;
    final isUnstructured = this.isUnstructured;
    final objectTypeName = this.objectTypeName;
    final objectTypeNames = this.objectTypeNames;
    final roleArn = this.roleArn;
    final scope = this.scope;
    final tags = this.tags;
    final workflowId = this.workflowId;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'Uri': uri,
      if (eventTriggerNames != null) 'EventTriggerNames': eventTriggerNames,
      if (isUnstructured != null) 'IsUnstructured': isUnstructured,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (objectTypeNames != null) 'ObjectTypeNames': objectTypeNames,
      if (roleArn != null) 'RoleArn': roleArn,
      if (scope != null) 'Scope': scope.value,
      if (tags != null) 'Tags': tags,
      if (workflowId != null) 'WorkflowId': workflowId,
    };
  }
}

class GetMatchesResponse {
  /// The timestamp this version of Match Result generated.
  final DateTime? matchGenerationDate;

  /// The list of matched profiles for this instance.
  final List<MatchItem>? matches;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The number of potential matches found.
  final int? potentialMatches;

  GetMatchesResponse({
    this.matchGenerationDate,
    this.matches,
    this.nextToken,
    this.potentialMatches,
  });

  factory GetMatchesResponse.fromJson(Map<String, dynamic> json) {
    return GetMatchesResponse(
      matchGenerationDate: timeStampFromJson(json['MatchGenerationDate']),
      matches: (json['Matches'] as List?)
          ?.nonNulls
          .map((e) => MatchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      potentialMatches: json['PotentialMatches'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final matchGenerationDate = this.matchGenerationDate;
    final matches = this.matches;
    final nextToken = this.nextToken;
    final potentialMatches = this.potentialMatches;
    return {
      if (matchGenerationDate != null)
        'MatchGenerationDate': unixTimestampToJson(matchGenerationDate),
      if (matches != null) 'Matches': matches,
      if (nextToken != null) 'NextToken': nextToken,
      if (potentialMatches != null) 'PotentialMatches': potentialMatches,
    };
  }
}

class GetObjectTypeAttributeStatisticsResponse {
  /// Time when this statistics was calculated.
  final DateTime calculatedAt;

  /// The statistics.
  final GetObjectTypeAttributeStatisticsStats statistics;

  GetObjectTypeAttributeStatisticsResponse({
    required this.calculatedAt,
    required this.statistics,
  });

  factory GetObjectTypeAttributeStatisticsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetObjectTypeAttributeStatisticsResponse(
      calculatedAt: nonNullableTimeStampFromJson(json['CalculatedAt'] ?? 0),
      statistics: GetObjectTypeAttributeStatisticsStats.fromJson(
          (json['Statistics'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatedAt = this.calculatedAt;
    final statistics = this.statistics;
    return {
      'CalculatedAt': unixTimestampToJson(calculatedAt),
      'Statistics': statistics,
    };
  }
}

class GetProfileHistoryRecordResponse {
  /// The action type of the profile history record.
  final ActionType actionType;

  /// The timestamp of when the profile history record was created.
  final DateTime createdAt;

  /// The unique identifier of the profile history record.
  final String id;

  /// The name of the profile object type.
  final String objectTypeName;

  /// A string containing the customer profile, profile object, or profile key
  /// content.
  final String? content;

  /// The timestamp of when the profile history record was last updated.
  final DateTime? lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the person or service principal who
  /// performed the action.
  final String? performedBy;

  /// The unique identifier of the profile object generated by the service.
  final String? profileObjectUniqueKey;

  GetProfileHistoryRecordResponse({
    required this.actionType,
    required this.createdAt,
    required this.id,
    required this.objectTypeName,
    this.content,
    this.lastUpdatedAt,
    this.performedBy,
    this.profileObjectUniqueKey,
  });

  factory GetProfileHistoryRecordResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileHistoryRecordResponse(
      actionType: ActionType.fromString((json['ActionType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      objectTypeName: (json['ObjectTypeName'] as String?) ?? '',
      content: json['Content'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      performedBy: json['PerformedBy'] as String?,
      profileObjectUniqueKey: json['ProfileObjectUniqueKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final createdAt = this.createdAt;
    final id = this.id;
    final objectTypeName = this.objectTypeName;
    final content = this.content;
    final lastUpdatedAt = this.lastUpdatedAt;
    final performedBy = this.performedBy;
    final profileObjectUniqueKey = this.profileObjectUniqueKey;
    return {
      'ActionType': actionType.value,
      'CreatedAt': unixTimestampToJson(createdAt),
      'Id': id,
      'ObjectTypeName': objectTypeName,
      if (content != null) 'Content': content,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (performedBy != null) 'PerformedBy': performedBy,
      if (profileObjectUniqueKey != null)
        'ProfileObjectUniqueKey': profileObjectUniqueKey,
    };
  }
}

class GetProfileObjectTypeResponse {
  /// The description of the profile object type.
  final String description;

  /// The name of the profile object type.
  final String objectTypeName;

  /// Indicates whether a profile should be created when data is received if one
  /// doesn’t exist for an object of this type. The default is <code>FALSE</code>.
  /// If the AllowProfileCreation flag is set to <code>FALSE</code>, then the
  /// service tries to fetch a standard profile and associate this object with the
  /// profile. If it is set to <code>TRUE</code>, and if no match is found, then
  /// the service creates a new standard profile.
  final bool? allowProfileCreation;

  /// The timestamp of when the domain was created.
  final DateTime? createdAt;

  /// The customer-provided key to encrypt the profile object that will be created
  /// in this profile object type.
  final String? encryptionKey;

  /// The number of days until the data in the object expires.
  final int? expirationDays;

  /// A map of the name and ObjectType field.
  final Map<String, ObjectTypeField>? fields;

  /// A list of unique keys that can be used to map data to the profile.
  final Map<String, List<ObjectTypeKey>>? keys;

  /// The timestamp of when the domain was most recently edited.
  final DateTime? lastUpdatedAt;

  /// The amount of provisioned profile object max count available.
  final int? maxAvailableProfileObjectCount;

  /// The amount of profile object max count assigned to the object type.
  final int? maxProfileObjectCount;

  /// The format of your <code>sourceLastUpdatedTimestamp</code> that was
  /// previously set up.
  final String? sourceLastUpdatedTimestampFormat;

  /// An integer that determines the priority of this object type when data from
  /// multiple sources is ingested. Lower values take priority. Object types
  /// without a specified source priority default to the lowest priority.
  final int? sourcePriority;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// A unique identifier for the object template.
  final String? templateId;

  GetProfileObjectTypeResponse({
    required this.description,
    required this.objectTypeName,
    this.allowProfileCreation,
    this.createdAt,
    this.encryptionKey,
    this.expirationDays,
    this.fields,
    this.keys,
    this.lastUpdatedAt,
    this.maxAvailableProfileObjectCount,
    this.maxProfileObjectCount,
    this.sourceLastUpdatedTimestampFormat,
    this.sourcePriority,
    this.tags,
    this.templateId,
  });

  factory GetProfileObjectTypeResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileObjectTypeResponse(
      description: (json['Description'] as String?) ?? '',
      objectTypeName: (json['ObjectTypeName'] as String?) ?? '',
      allowProfileCreation: json['AllowProfileCreation'] as bool?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      encryptionKey: json['EncryptionKey'] as String?,
      expirationDays: json['ExpirationDays'] as int?,
      fields: (json['Fields'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ObjectTypeField.fromJson(e as Map<String, dynamic>))),
      keys: (json['Keys'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k,
          (e as List)
              .nonNulls
              .map((e) => ObjectTypeKey.fromJson(e as Map<String, dynamic>))
              .toList())),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      maxAvailableProfileObjectCount:
          json['MaxAvailableProfileObjectCount'] as int?,
      maxProfileObjectCount: json['MaxProfileObjectCount'] as int?,
      sourceLastUpdatedTimestampFormat:
          json['SourceLastUpdatedTimestampFormat'] as String?,
      sourcePriority: json['SourcePriority'] as int?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final objectTypeName = this.objectTypeName;
    final allowProfileCreation = this.allowProfileCreation;
    final createdAt = this.createdAt;
    final encryptionKey = this.encryptionKey;
    final expirationDays = this.expirationDays;
    final fields = this.fields;
    final keys = this.keys;
    final lastUpdatedAt = this.lastUpdatedAt;
    final maxAvailableProfileObjectCount = this.maxAvailableProfileObjectCount;
    final maxProfileObjectCount = this.maxProfileObjectCount;
    final sourceLastUpdatedTimestampFormat =
        this.sourceLastUpdatedTimestampFormat;
    final sourcePriority = this.sourcePriority;
    final tags = this.tags;
    final templateId = this.templateId;
    return {
      'Description': description,
      'ObjectTypeName': objectTypeName,
      if (allowProfileCreation != null)
        'AllowProfileCreation': allowProfileCreation,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (expirationDays != null) 'ExpirationDays': expirationDays,
      if (fields != null) 'Fields': fields,
      if (keys != null) 'Keys': keys,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (maxAvailableProfileObjectCount != null)
        'MaxAvailableProfileObjectCount': maxAvailableProfileObjectCount,
      if (maxProfileObjectCount != null)
        'MaxProfileObjectCount': maxProfileObjectCount,
      if (sourceLastUpdatedTimestampFormat != null)
        'SourceLastUpdatedTimestampFormat': sourceLastUpdatedTimestampFormat,
      if (sourcePriority != null) 'SourcePriority': sourcePriority,
      if (tags != null) 'Tags': tags,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

class GetProfileObjectTypeTemplateResponse {
  /// Indicates whether a profile should be created when data is received if one
  /// doesn’t exist for an object of this type. The default is <code>FALSE</code>.
  /// If the AllowProfileCreation flag is set to <code>FALSE</code>, then the
  /// service tries to fetch a standard profile and associate this object with the
  /// profile. If it is set to <code>TRUE</code>, and if no match is found, then
  /// the service creates a new standard profile.
  final bool? allowProfileCreation;

  /// A map of the name and ObjectType field.
  final Map<String, ObjectTypeField>? fields;

  /// A list of unique keys that can be used to map data to the profile.
  final Map<String, List<ObjectTypeKey>>? keys;

  /// The format of your <code>sourceLastUpdatedTimestamp</code> that was
  /// previously set up.
  final String? sourceLastUpdatedTimestampFormat;

  /// The name of the source of the object template.
  final String? sourceName;

  /// The source of the object template.
  final String? sourceObject;

  /// A unique identifier for the object template.
  final String? templateId;

  GetProfileObjectTypeTemplateResponse({
    this.allowProfileCreation,
    this.fields,
    this.keys,
    this.sourceLastUpdatedTimestampFormat,
    this.sourceName,
    this.sourceObject,
    this.templateId,
  });

  factory GetProfileObjectTypeTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return GetProfileObjectTypeTemplateResponse(
      allowProfileCreation: json['AllowProfileCreation'] as bool?,
      fields: (json['Fields'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ObjectTypeField.fromJson(e as Map<String, dynamic>))),
      keys: (json['Keys'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k,
          (e as List)
              .nonNulls
              .map((e) => ObjectTypeKey.fromJson(e as Map<String, dynamic>))
              .toList())),
      sourceLastUpdatedTimestampFormat:
          json['SourceLastUpdatedTimestampFormat'] as String?,
      sourceName: json['SourceName'] as String?,
      sourceObject: json['SourceObject'] as String?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowProfileCreation = this.allowProfileCreation;
    final fields = this.fields;
    final keys = this.keys;
    final sourceLastUpdatedTimestampFormat =
        this.sourceLastUpdatedTimestampFormat;
    final sourceName = this.sourceName;
    final sourceObject = this.sourceObject;
    final templateId = this.templateId;
    return {
      if (allowProfileCreation != null)
        'AllowProfileCreation': allowProfileCreation,
      if (fields != null) 'Fields': fields,
      if (keys != null) 'Keys': keys,
      if (sourceLastUpdatedTimestampFormat != null)
        'SourceLastUpdatedTimestampFormat': sourceLastUpdatedTimestampFormat,
      if (sourceName != null) 'SourceName': sourceName,
      if (sourceObject != null) 'SourceObject': sourceObject,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

class GetProfileRecommendationsResponse {
  /// List of recommendations generated by the recommender.
  final List<Recommendation>? recommendations;

  GetProfileRecommendationsResponse({
    this.recommendations,
  });

  factory GetProfileRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetProfileRecommendationsResponse(
      recommendations: (json['Recommendations'] as List?)
          ?.nonNulls
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final recommendations = this.recommendations;
    return {
      if (recommendations != null) 'Recommendations': recommendations,
    };
  }
}

class GetRecommenderResponse {
  /// The name of the recommender.
  final String recommenderName;

  /// The name of the recipe used by the recommender to generate recommendations.
  final RecommenderRecipeName recommenderRecipeName;

  /// The timestamp of when the recommender was created.
  final DateTime? createdAt;

  /// A detailed description of the recommender providing information about its
  /// purpose and functionality.
  final String? description;

  /// If the recommender fails, provides the reason for the failure.
  final String? failureReason;

  /// The timestamp of when the recommender was edited.
  final DateTime? lastUpdatedAt;

  /// Information about the most recent update performed on the recommender,
  /// including status and timestamp.
  final RecommenderUpdate? latestRecommenderUpdate;

  /// The configuration settings for the recommender, including parameters and
  /// settings that define its behavior.
  final RecommenderConfig? recommenderConfig;

  /// The name of the recommender schema associated with this recommender.
  final String? recommenderSchemaName;

  /// The current status of the recommender, indicating whether it is active,
  /// creating, updating, or in another state.
  final RecommenderStatus? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// A set of metrics that provide information about the recommender's training
  /// performance and accuracy.
  final List<TrainingMetrics>? trainingMetrics;

  GetRecommenderResponse({
    required this.recommenderName,
    required this.recommenderRecipeName,
    this.createdAt,
    this.description,
    this.failureReason,
    this.lastUpdatedAt,
    this.latestRecommenderUpdate,
    this.recommenderConfig,
    this.recommenderSchemaName,
    this.status,
    this.tags,
    this.trainingMetrics,
  });

  factory GetRecommenderResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommenderResponse(
      recommenderName: (json['RecommenderName'] as String?) ?? '',
      recommenderRecipeName: RecommenderRecipeName.fromString(
          (json['RecommenderRecipeName'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      failureReason: json['FailureReason'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      latestRecommenderUpdate: json['LatestRecommenderUpdate'] != null
          ? RecommenderUpdate.fromJson(
              json['LatestRecommenderUpdate'] as Map<String, dynamic>)
          : null,
      recommenderConfig: json['RecommenderConfig'] != null
          ? RecommenderConfig.fromJson(
              json['RecommenderConfig'] as Map<String, dynamic>)
          : null,
      recommenderSchemaName: json['RecommenderSchemaName'] as String?,
      status: (json['Status'] as String?)?.let(RecommenderStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      trainingMetrics: (json['TrainingMetrics'] as List?)
          ?.nonNulls
          .map((e) => TrainingMetrics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final recommenderName = this.recommenderName;
    final recommenderRecipeName = this.recommenderRecipeName;
    final createdAt = this.createdAt;
    final description = this.description;
    final failureReason = this.failureReason;
    final lastUpdatedAt = this.lastUpdatedAt;
    final latestRecommenderUpdate = this.latestRecommenderUpdate;
    final recommenderConfig = this.recommenderConfig;
    final recommenderSchemaName = this.recommenderSchemaName;
    final status = this.status;
    final tags = this.tags;
    final trainingMetrics = this.trainingMetrics;
    return {
      'RecommenderName': recommenderName,
      'RecommenderRecipeName': recommenderRecipeName.value,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (failureReason != null) 'FailureReason': failureReason,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (latestRecommenderUpdate != null)
        'LatestRecommenderUpdate': latestRecommenderUpdate,
      if (recommenderConfig != null) 'RecommenderConfig': recommenderConfig,
      if (recommenderSchemaName != null)
        'RecommenderSchemaName': recommenderSchemaName,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
      if (trainingMetrics != null) 'TrainingMetrics': trainingMetrics,
    };
  }
}

class GetRecommenderFilterResponse {
  /// The timestamp of when the recommender filter was created.
  final DateTime createdAt;

  /// The filter expression that defines which items to include or exclude from
  /// recommendations.
  final String recommenderFilterExpression;

  /// The name of the recommender filter.
  final String recommenderFilterName;

  /// The status of the recommender filter.
  final RecommenderFilterStatus status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String> tags;

  /// The description of the recommender filter.
  final String? description;

  /// If the recommender filter failed, provides the reason for the failure.
  final String? failureReason;

  /// The name of the recommender schema associated with this recommender filter.
  final String? recommenderSchemaName;

  GetRecommenderFilterResponse({
    required this.createdAt,
    required this.recommenderFilterExpression,
    required this.recommenderFilterName,
    required this.status,
    required this.tags,
    this.description,
    this.failureReason,
    this.recommenderSchemaName,
  });

  factory GetRecommenderFilterResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommenderFilterResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      recommenderFilterExpression:
          (json['RecommenderFilterExpression'] as String?) ?? '',
      recommenderFilterName: (json['RecommenderFilterName'] as String?) ?? '',
      status:
          RecommenderFilterStatus.fromString((json['Status'] as String?) ?? ''),
      tags:
          ((json['Tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      description: json['Description'] as String?,
      failureReason: json['FailureReason'] as String?,
      recommenderSchemaName: json['RecommenderSchemaName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final recommenderFilterExpression = this.recommenderFilterExpression;
    final recommenderFilterName = this.recommenderFilterName;
    final status = this.status;
    final tags = this.tags;
    final description = this.description;
    final failureReason = this.failureReason;
    final recommenderSchemaName = this.recommenderSchemaName;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'RecommenderFilterExpression': recommenderFilterExpression,
      'RecommenderFilterName': recommenderFilterName,
      'Status': status.value,
      'Tags': tags,
      if (description != null) 'Description': description,
      if (failureReason != null) 'FailureReason': failureReason,
      if (recommenderSchemaName != null)
        'RecommenderSchemaName': recommenderSchemaName,
    };
  }
}

class GetRecommenderSchemaResponse {
  /// The timestamp of when the recommender schema was created.
  final DateTime createdAt;

  /// A map of dataset type to column definitions included in the schema.
  final Map<String, List<RecommenderSchemaField>> fields;

  /// The name of the recommender schema.
  final String recommenderSchemaName;

  /// The status of the recommender schema.
  final RecommenderSchemaStatus status;

  GetRecommenderSchemaResponse({
    required this.createdAt,
    required this.fields,
    required this.recommenderSchemaName,
    required this.status,
  });

  factory GetRecommenderSchemaResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommenderSchemaResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      fields: ((json['Fields'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) => RecommenderSchemaField.fromJson(
                      e as Map<String, dynamic>))
                  .toList())),
      recommenderSchemaName: (json['RecommenderSchemaName'] as String?) ?? '',
      status:
          RecommenderSchemaStatus.fromString((json['Status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final fields = this.fields;
    final recommenderSchemaName = this.recommenderSchemaName;
    final status = this.status;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'Fields': fields,
      'RecommenderSchemaName': recommenderSchemaName,
      'Status': status.value,
    };
  }
}

class GetSegmentDefinitionResponse {
  /// The arn of the segment definition.
  final String segmentDefinitionArn;

  /// The timestamp of when the segment definition was created.
  final DateTime? createdAt;

  /// The description of the segment definition.
  final String? description;

  /// The display name of the segment definition.
  final String? displayName;

  /// The name of the segment definition.
  final String? segmentDefinitionName;

  /// The segment criteria associated with this definition.
  final SegmentGroup? segmentGroups;

  /// The segment sort.
  final SegmentSort? segmentSort;

  /// The segment SQL query.
  final String? segmentSqlQuery;

  /// The segment type.
  ///
  /// Classic : Segments created using traditional SegmentGroup structure
  ///
  /// Enhanced : Segments created using SQL queries
  final SegmentType? segmentType;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetSegmentDefinitionResponse({
    required this.segmentDefinitionArn,
    this.createdAt,
    this.description,
    this.displayName,
    this.segmentDefinitionName,
    this.segmentGroups,
    this.segmentSort,
    this.segmentSqlQuery,
    this.segmentType,
    this.tags,
  });

  factory GetSegmentDefinitionResponse.fromJson(Map<String, dynamic> json) {
    return GetSegmentDefinitionResponse(
      segmentDefinitionArn: (json['SegmentDefinitionArn'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      segmentDefinitionName: json['SegmentDefinitionName'] as String?,
      segmentGroups: json['SegmentGroups'] != null
          ? SegmentGroup.fromJson(json['SegmentGroups'] as Map<String, dynamic>)
          : null,
      segmentSort: json['SegmentSort'] != null
          ? SegmentSort.fromJson(json['SegmentSort'] as Map<String, dynamic>)
          : null,
      segmentSqlQuery: json['SegmentSqlQuery'] as String?,
      segmentType:
          (json['SegmentType'] as String?)?.let(SegmentType.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final segmentDefinitionArn = this.segmentDefinitionArn;
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final segmentDefinitionName = this.segmentDefinitionName;
    final segmentGroups = this.segmentGroups;
    final segmentSort = this.segmentSort;
    final segmentSqlQuery = this.segmentSqlQuery;
    final segmentType = this.segmentType;
    final tags = this.tags;
    return {
      'SegmentDefinitionArn': segmentDefinitionArn,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (segmentDefinitionName != null)
        'SegmentDefinitionName': segmentDefinitionName,
      if (segmentGroups != null) 'SegmentGroups': segmentGroups,
      if (segmentSort != null) 'SegmentSort': segmentSort,
      if (segmentSqlQuery != null) 'SegmentSqlQuery': segmentSqlQuery,
      if (segmentType != null) 'SegmentType': segmentType.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetSegmentEstimateResponse {
  /// The unique name of the domain.
  final String? domainName;

  /// The estimated number of profiles contained in the segment.
  final String? estimate;

  /// The <code>QueryId</code> which is the same as the value passed in
  /// <code>QueryId</code>.
  final String? estimateId;

  /// The error message if there is any error.
  final String? message;

  /// The current status of the query.
  final EstimateStatus? status;

  /// The status code of the segment estimate.
  final int? statusCode;

  GetSegmentEstimateResponse({
    this.domainName,
    this.estimate,
    this.estimateId,
    this.message,
    this.status,
    this.statusCode,
  });

  factory GetSegmentEstimateResponse.fromJson(Map<String, dynamic> json) {
    return GetSegmentEstimateResponse(
      domainName: json['DomainName'] as String?,
      estimate: json['Estimate'] as String?,
      estimateId: json['EstimateId'] as String?,
      message: json['Message'] as String?,
      status: (json['Status'] as String?)?.let(EstimateStatus.fromString),
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final estimate = this.estimate;
    final estimateId = this.estimateId;
    final message = this.message;
    final status = this.status;
    final statusCode = this.statusCode;
    return {
      if (domainName != null) 'DomainName': domainName,
      if (estimate != null) 'Estimate': estimate,
      if (estimateId != null) 'EstimateId': estimateId,
      if (message != null) 'Message': message,
      if (status != null) 'Status': status.value,
    };
  }
}

class GetSegmentMembershipResponse {
  /// An array of maps where each contains a response per profile failed for the
  /// request.
  final List<ProfileQueryFailures>? failures;

  /// The timestamp indicating when the segment membership was last computed or
  /// updated.
  final DateTime? lastComputedAt;

  /// An array of maps where each contains a response per profile requested.
  final List<ProfileQueryResult>? profiles;

  /// The unique name of the segment definition.
  final String? segmentDefinitionName;

  GetSegmentMembershipResponse({
    this.failures,
    this.lastComputedAt,
    this.profiles,
    this.segmentDefinitionName,
  });

  factory GetSegmentMembershipResponse.fromJson(Map<String, dynamic> json) {
    return GetSegmentMembershipResponse(
      failures: (json['Failures'] as List?)
          ?.nonNulls
          .map((e) => ProfileQueryFailures.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastComputedAt: timeStampFromJson(json['LastComputedAt']),
      profiles: (json['Profiles'] as List?)
          ?.nonNulls
          .map((e) => ProfileQueryResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      segmentDefinitionName: json['SegmentDefinitionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final lastComputedAt = this.lastComputedAt;
    final profiles = this.profiles;
    final segmentDefinitionName = this.segmentDefinitionName;
    return {
      if (failures != null) 'Failures': failures,
      if (lastComputedAt != null)
        'LastComputedAt': unixTimestampToJson(lastComputedAt),
      if (profiles != null) 'Profiles': profiles,
      if (segmentDefinitionName != null)
        'SegmentDefinitionName': segmentDefinitionName,
    };
  }
}

class GetSegmentSnapshotResponse {
  /// The format in which the segment will be exported.
  final DataFormat dataFormat;

  /// The unique identifier of the segment snapshot.
  final String snapshotId;

  /// The status of the asynchronous job for exporting the segment snapshot.
  final SegmentSnapshotStatus status;

  /// The destination to which the segment will be exported. This field must be
  /// provided if the request is not submitted from the Connect Customer Admin
  /// Website.
  final String? destinationUri;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the exported
  /// segment.
  final String? encryptionKey;

  /// The Amazon Resource Name (ARN) of the IAM role that allows Customer Profiles
  /// service principal to assume the role for conducting KMS and S3 operations.
  final String? roleArn;

  /// The status message of the asynchronous job for exporting the segment
  /// snapshot.
  final String? statusMessage;

  GetSegmentSnapshotResponse({
    required this.dataFormat,
    required this.snapshotId,
    required this.status,
    this.destinationUri,
    this.encryptionKey,
    this.roleArn,
    this.statusMessage,
  });

  factory GetSegmentSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return GetSegmentSnapshotResponse(
      dataFormat: DataFormat.fromString((json['DataFormat'] as String?) ?? ''),
      snapshotId: (json['SnapshotId'] as String?) ?? '',
      status:
          SegmentSnapshotStatus.fromString((json['Status'] as String?) ?? ''),
      destinationUri: json['DestinationUri'] as String?,
      encryptionKey: json['EncryptionKey'] as String?,
      roleArn: json['RoleArn'] as String?,
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataFormat = this.dataFormat;
    final snapshotId = this.snapshotId;
    final status = this.status;
    final destinationUri = this.destinationUri;
    final encryptionKey = this.encryptionKey;
    final roleArn = this.roleArn;
    final statusMessage = this.statusMessage;
    return {
      'DataFormat': dataFormat.value,
      'SnapshotId': snapshotId,
      'Status': status.value,
      if (destinationUri != null) 'DestinationUri': destinationUri,
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (roleArn != null) 'RoleArn': roleArn,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class GetSimilarProfilesResponse {
  /// It only has value when the <code>MatchType</code> is
  /// <code>ML_BASED_MATCHING</code>.A number between 0 and 1, where a higher
  /// score means higher similarity. Examining match confidence scores lets you
  /// distinguish between groups of similar records in which the system is highly
  /// confident (which you may decide to merge), groups of similar records about
  /// which the system is uncertain (which you may decide to have reviewed by a
  /// human), and groups of similar records that the system deems to be unlikely
  /// (which you may decide to reject). Given confidence scores vary as per the
  /// data input, it should not be used as an absolute measure of matching
  /// quality.
  final double? confidenceScore;

  /// The string <code>matchId</code> that the similar profiles belong to.
  final String? matchId;

  /// Specify the type of matching to get similar profiles for.
  final MatchType? matchType;

  /// The pagination token from the previous <code>GetSimilarProfiles</code> API
  /// call.
  final String? nextToken;

  /// Set of <code>profileId</code>s that belong to the same matching group.
  final List<String>? profileIds;

  /// The integer rule level that the profiles matched on.
  final int? ruleLevel;

  GetSimilarProfilesResponse({
    this.confidenceScore,
    this.matchId,
    this.matchType,
    this.nextToken,
    this.profileIds,
    this.ruleLevel,
  });

  factory GetSimilarProfilesResponse.fromJson(Map<String, dynamic> json) {
    return GetSimilarProfilesResponse(
      confidenceScore: json['ConfidenceScore'] as double?,
      matchId: json['MatchId'] as String?,
      matchType: (json['MatchType'] as String?)?.let(MatchType.fromString),
      nextToken: json['NextToken'] as String?,
      profileIds: (json['ProfileIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ruleLevel: json['RuleLevel'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidenceScore = this.confidenceScore;
    final matchId = this.matchId;
    final matchType = this.matchType;
    final nextToken = this.nextToken;
    final profileIds = this.profileIds;
    final ruleLevel = this.ruleLevel;
    return {
      if (confidenceScore != null) 'ConfidenceScore': confidenceScore,
      if (matchId != null) 'MatchId': matchId,
      if (matchType != null) 'MatchType': matchType.value,
      if (nextToken != null) 'NextToken': nextToken,
      if (profileIds != null) 'ProfileIds': profileIds,
      if (ruleLevel != null) 'RuleLevel': ruleLevel,
    };
  }
}

class GetUploadJobResponse {
  /// The timestamp when the upload job was completed.
  final DateTime? completedAt;

  /// The timestamp when the upload job was created.
  final DateTime? createdAt;

  /// The expiry duration for the profiles ingested with the upload job.
  final int? dataExpiry;

  /// The unique name of the upload job. Could be a file name to identify the
  /// upload job.
  final String? displayName;

  /// The mapping between CSV Columns and Profile Object attributes for the upload
  /// job.
  final Map<String, ObjectTypeField>? fields;

  /// The unique identifier of the upload job.
  final String? jobId;

  /// The summary of results for the upload job, including the number of updated,
  /// created, and failed records.
  final ResultsSummary? resultsSummary;

  /// The status describing the status for the upload job. The following are Valid
  /// Values:
  ///
  /// <ul>
  /// <li>
  /// <b>CREATED</b>: The upload job has been created, but has not started
  /// processing yet.
  /// </li>
  /// <li>
  /// <b>IN_PROGRESS</b>: The upload job is currently in progress, ingesting and
  /// processing the profile data.
  /// </li>
  /// <li>
  /// <b>PARTIALLY_SUCCEEDED</b>: The upload job has successfully completed the
  /// ingestion and processing of all profile data.
  /// </li>
  /// <li>
  /// <b>SUCCEEDED</b>: The upload job has successfully completed the ingestion
  /// and processing of all profile data.
  /// </li>
  /// <li>
  /// <b>FAILED</b>: The upload job has failed to complete.
  /// </li>
  /// <li>
  /// <b>STOPPED</b>: The upload job has been manually stopped or terminated
  /// before completion.
  /// </li>
  /// </ul>
  final UploadJobStatus? status;

  /// The reason for the current status of the upload job. Possible reasons:
  ///
  /// <ul>
  /// <li>
  /// <b>VALIDATION_FAILURE</b>: The upload job has encountered an error or issue
  /// and was unable to complete the profile data ingestion.
  /// </li>
  /// <li>
  /// <b>INTERNAL_FAILURE</b>: Failure caused from service side
  /// </li>
  /// </ul>
  final StatusReason? statusReason;

  /// The unique key columns used for de-duping the keys in the upload job.
  final String? uniqueKey;

  GetUploadJobResponse({
    this.completedAt,
    this.createdAt,
    this.dataExpiry,
    this.displayName,
    this.fields,
    this.jobId,
    this.resultsSummary,
    this.status,
    this.statusReason,
    this.uniqueKey,
  });

  factory GetUploadJobResponse.fromJson(Map<String, dynamic> json) {
    return GetUploadJobResponse(
      completedAt: timeStampFromJson(json['CompletedAt']),
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataExpiry: json['DataExpiry'] as int?,
      displayName: json['DisplayName'] as String?,
      fields: (json['Fields'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ObjectTypeField.fromJson(e as Map<String, dynamic>))),
      jobId: json['JobId'] as String?,
      resultsSummary: json['ResultsSummary'] != null
          ? ResultsSummary.fromJson(
              json['ResultsSummary'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(UploadJobStatus.fromString),
      statusReason:
          (json['StatusReason'] as String?)?.let(StatusReason.fromString),
      uniqueKey: json['UniqueKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completedAt = this.completedAt;
    final createdAt = this.createdAt;
    final dataExpiry = this.dataExpiry;
    final displayName = this.displayName;
    final fields = this.fields;
    final jobId = this.jobId;
    final resultsSummary = this.resultsSummary;
    final status = this.status;
    final statusReason = this.statusReason;
    final uniqueKey = this.uniqueKey;
    return {
      if (completedAt != null) 'CompletedAt': unixTimestampToJson(completedAt),
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dataExpiry != null) 'DataExpiry': dataExpiry,
      if (displayName != null) 'DisplayName': displayName,
      if (fields != null) 'Fields': fields,
      if (jobId != null) 'JobId': jobId,
      if (resultsSummary != null) 'ResultsSummary': resultsSummary,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
      if (uniqueKey != null) 'UniqueKey': uniqueKey,
    };
  }
}

class GetUploadJobPathResponse {
  /// The pre-signed S3 URL for uploading the CSV file associated with the upload
  /// job.
  final String url;

  /// The plaintext data key used to encrypt the upload file.
  ///
  /// To persist to the pre-signed url, use the client token and MD5 client token
  /// as header. The required headers are as follows:
  ///
  /// <ul>
  /// <li>
  /// x-amz-server-side-encryption-customer-key: Client Token
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-customer-key-MD5: MD5 Client Token
  /// </li>
  /// <li>
  /// x-amz-server-side-encryption-customer-algorithm: AES256
  /// </li>
  /// </ul>
  final String? clientToken;

  /// The expiry timestamp for the pre-signed URL, after which the URL will no
  /// longer be valid.
  final DateTime? validUntil;

  GetUploadJobPathResponse({
    required this.url,
    this.clientToken,
    this.validUntil,
  });

  factory GetUploadJobPathResponse.fromJson(Map<String, dynamic> json) {
    return GetUploadJobPathResponse(
      url: (json['Url'] as String?) ?? '',
      clientToken: json['ClientToken'] as String?,
      validUntil: timeStampFromJson(json['ValidUntil']),
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    final clientToken = this.clientToken;
    final validUntil = this.validUntil;
    return {
      'Url': url,
      if (clientToken != null) 'ClientToken': clientToken,
      if (validUntil != null) 'ValidUntil': unixTimestampToJson(validUntil),
    };
  }
}

class GetWorkflowResponse {
  /// Attributes provided for workflow execution.
  final WorkflowAttributes? attributes;

  /// Workflow error messages during execution (if any).
  final String? errorDescription;

  /// The timestamp that represents when workflow execution last updated.
  final DateTime? lastUpdatedAt;

  /// Workflow specific execution metrics.
  final WorkflowMetrics? metrics;

  /// The timestamp that represents when workflow execution started.
  final DateTime? startDate;

  /// Status of workflow execution.
  final Status? status;

  /// Unique identifier for the workflow.
  final String? workflowId;

  /// The type of workflow. The only supported value is APPFLOW_INTEGRATION.
  final WorkflowType? workflowType;

  GetWorkflowResponse({
    this.attributes,
    this.errorDescription,
    this.lastUpdatedAt,
    this.metrics,
    this.startDate,
    this.status,
    this.workflowId,
    this.workflowType,
  });

  factory GetWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowResponse(
      attributes: json['Attributes'] != null
          ? WorkflowAttributes.fromJson(
              json['Attributes'] as Map<String, dynamic>)
          : null,
      errorDescription: json['ErrorDescription'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      metrics: json['Metrics'] != null
          ? WorkflowMetrics.fromJson(json['Metrics'] as Map<String, dynamic>)
          : null,
      startDate: timeStampFromJson(json['StartDate']),
      status: (json['Status'] as String?)?.let(Status.fromString),
      workflowId: json['WorkflowId'] as String?,
      workflowType:
          (json['WorkflowType'] as String?)?.let(WorkflowType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final errorDescription = this.errorDescription;
    final lastUpdatedAt = this.lastUpdatedAt;
    final metrics = this.metrics;
    final startDate = this.startDate;
    final status = this.status;
    final workflowId = this.workflowId;
    final workflowType = this.workflowType;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (errorDescription != null) 'ErrorDescription': errorDescription,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (metrics != null) 'Metrics': metrics,
      if (startDate != null) 'StartDate': unixTimestampToJson(startDate),
      if (status != null) 'Status': status.value,
      if (workflowId != null) 'WorkflowId': workflowId,
      if (workflowType != null) 'WorkflowType': workflowType.value,
    };
  }
}

class GetWorkflowStepsResponse {
  /// List containing workflow step details.
  final List<WorkflowStepItem>? items;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// Unique identifier for the workflow.
  final String? workflowId;

  /// The type of workflow. The only supported value is APPFLOW_INTEGRATION.
  final WorkflowType? workflowType;

  GetWorkflowStepsResponse({
    this.items,
    this.nextToken,
    this.workflowId,
    this.workflowType,
  });

  factory GetWorkflowStepsResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowStepsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => WorkflowStepItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      workflowId: json['WorkflowId'] as String?,
      workflowType:
          (json['WorkflowType'] as String?)?.let(WorkflowType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    final workflowId = this.workflowId;
    final workflowType = this.workflowType;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
      if (workflowId != null) 'WorkflowId': workflowId,
      if (workflowType != null) 'WorkflowType': workflowType.value,
    };
  }
}

class ListAccountIntegrationsResponse {
  /// The list of ListAccountIntegration instances.
  final List<ListIntegrationItem>? items;

  /// The pagination token from the previous ListAccountIntegrations API call.
  final String? nextToken;

  ListAccountIntegrationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListAccountIntegrationsResponse.fromJson(Map<String, dynamic> json) {
    return ListAccountIntegrationsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ListIntegrationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCalculatedAttributeDefinitionsResponse {
  /// The list of calculated attribute definitions.
  final List<ListCalculatedAttributeDefinitionItem>? items;

  /// The pagination token from the previous call to
  /// ListCalculatedAttributeDefinitions.
  final String? nextToken;

  ListCalculatedAttributeDefinitionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListCalculatedAttributeDefinitionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCalculatedAttributeDefinitionsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ListCalculatedAttributeDefinitionItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCalculatedAttributesForProfileResponse {
  /// The list of calculated attributes.
  final List<ListCalculatedAttributeForProfileItem>? items;

  /// The pagination token from the previous call to
  /// ListCalculatedAttributesForProfile.
  final String? nextToken;

  ListCalculatedAttributesForProfileResponse({
    this.items,
    this.nextToken,
  });

  factory ListCalculatedAttributesForProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCalculatedAttributesForProfileResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ListCalculatedAttributeForProfileItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDomainLayoutsResponse {
  /// Contains summary information about an EventStream.
  final List<LayoutItem>? items;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListDomainLayoutsResponse({
    this.items,
    this.nextToken,
  });

  factory ListDomainLayoutsResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainLayoutsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => LayoutItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDomainObjectTypesResponse {
  /// The list of domain object types.
  final List<DomainObjectTypesListItem>? items;

  /// The pagination token from the previous call to ListDomainObjectTypes.
  final String? nextToken;

  ListDomainObjectTypesResponse({
    this.items,
    this.nextToken,
  });

  factory ListDomainObjectTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainObjectTypesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              DomainObjectTypesListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDomainsResponse {
  /// The list of ListDomains instances.
  final List<ListDomainItem>? items;

  /// The pagination token from the previous ListDomains API call.
  final String? nextToken;

  ListDomainsResponse({
    this.items,
    this.nextToken,
  });

  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) {
    return ListDomainsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ListDomainItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEventStreamsResponse {
  /// Contains summary information about an EventStream.
  final List<EventStreamSummary>? items;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEventStreamsResponse({
    this.items,
    this.nextToken,
  });

  factory ListEventStreamsResponse.fromJson(Map<String, dynamic> json) {
    return ListEventStreamsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => EventStreamSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEventTriggersResponse {
  /// The list of Event Triggers.
  final List<EventTriggerSummaryItem>? items;

  /// The pagination token from the previous call to ListEventTriggers.
  final String? nextToken;

  ListEventTriggersResponse({
    this.items,
    this.nextToken,
  });

  factory ListEventTriggersResponse.fromJson(Map<String, dynamic> json) {
    return ListEventTriggersResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              EventTriggerSummaryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIdentityResolutionJobsResponse {
  /// A list of Identity Resolution Jobs.
  final List<IdentityResolutionJob>? identityResolutionJobsList;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListIdentityResolutionJobsResponse({
    this.identityResolutionJobsList,
    this.nextToken,
  });

  factory ListIdentityResolutionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListIdentityResolutionJobsResponse(
      identityResolutionJobsList: (json['IdentityResolutionJobsList'] as List?)
          ?.nonNulls
          .map((e) => IdentityResolutionJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityResolutionJobsList = this.identityResolutionJobsList;
    final nextToken = this.nextToken;
    return {
      if (identityResolutionJobsList != null)
        'IdentityResolutionJobsList': identityResolutionJobsList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIntegrationsResponse {
  /// The list of ListIntegrations instances.
  final List<ListIntegrationItem>? items;

  /// The pagination token from the previous ListIntegrations API call.
  final String? nextToken;

  ListIntegrationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListIntegrationsResponse.fromJson(Map<String, dynamic> json) {
    return ListIntegrationsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ListIntegrationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListObjectTypeAttributesResponse {
  /// The items returned as part of the response.
  final List<ListObjectTypeAttributeItem>? items;

  /// The pagination token from the previous call.
  final String? nextToken;

  ListObjectTypeAttributesResponse({
    this.items,
    this.nextToken,
  });

  factory ListObjectTypeAttributesResponse.fromJson(Map<String, dynamic> json) {
    return ListObjectTypeAttributesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              ListObjectTypeAttributeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListObjectTypeAttributeValuesResponse {
  /// A list of unique attribute values sorted on the basis of LastUpdatedAt.
  final List<ListObjectTypeAttributeValuesItem>? items;

  /// The pagination token from the previous call to call
  /// ListObjectTypeAttributeValues.
  final String? nextToken;

  ListObjectTypeAttributeValuesResponse({
    this.items,
    this.nextToken,
  });

  factory ListObjectTypeAttributeValuesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListObjectTypeAttributeValuesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ListObjectTypeAttributeValuesItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ProfileAttributeValuesResponse {
  /// The attribute name.
  final String? attributeName;

  /// The name of the domain.
  final String? domainName;

  /// The items returned as part of the response.
  final List<AttributeValueItem>? items;

  /// The status code for the response.
  final int? statusCode;

  ProfileAttributeValuesResponse({
    this.attributeName,
    this.domainName,
    this.items,
    this.statusCode,
  });

  factory ProfileAttributeValuesResponse.fromJson(Map<String, dynamic> json) {
    return ProfileAttributeValuesResponse(
      attributeName: json['AttributeName'] as String?,
      domainName: json['DomainName'] as String?,
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => AttributeValueItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final domainName = this.domainName;
    final items = this.items;
    final statusCode = this.statusCode;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (domainName != null) 'DomainName': domainName,
      if (items != null) 'Items': items,
    };
  }
}

class ListProfileHistoryRecordsResponse {
  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  /// The list of profile history records.
  final List<ProfileHistoryRecord>? profileHistoryRecords;

  ListProfileHistoryRecordsResponse({
    this.nextToken,
    this.profileHistoryRecords,
  });

  factory ListProfileHistoryRecordsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProfileHistoryRecordsResponse(
      nextToken: json['NextToken'] as String?,
      profileHistoryRecords: (json['ProfileHistoryRecords'] as List?)
          ?.nonNulls
          .map((e) => ProfileHistoryRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final profileHistoryRecords = this.profileHistoryRecords;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (profileHistoryRecords != null)
        'ProfileHistoryRecords': profileHistoryRecords,
    };
  }
}

class ListProfileObjectsResponse {
  /// The list of ListProfileObject instances.
  final List<ListProfileObjectsItem>? items;

  /// The pagination token from the previous call to ListProfileObjects.
  final String? nextToken;

  ListProfileObjectsResponse({
    this.items,
    this.nextToken,
  });

  factory ListProfileObjectsResponse.fromJson(Map<String, dynamic> json) {
    return ListProfileObjectsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map(
              (e) => ListProfileObjectsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListProfileObjectTypesResponse {
  /// The list of ListProfileObjectTypes instances.
  final List<ListProfileObjectTypeItem>? items;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListProfileObjectTypesResponse({
    this.items,
    this.nextToken,
  });

  factory ListProfileObjectTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListProfileObjectTypesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              ListProfileObjectTypeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListProfileObjectTypeTemplatesResponse {
  /// The list of ListProfileObjectType template instances.
  final List<ListProfileObjectTypeTemplateItem>? items;

  /// The pagination token from the previous ListObjectTypeTemplates API call.
  final String? nextToken;

  ListProfileObjectTypeTemplatesResponse({
    this.items,
    this.nextToken,
  });

  factory ListProfileObjectTypeTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProfileObjectTypeTemplatesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ListProfileObjectTypeTemplateItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRecommenderFiltersResponse {
  /// A token to retrieve the next page of results. Null if there are no more
  /// results to retrieve.
  final String? nextToken;

  /// A list of recommender filters and their properties in the specified domain.
  final List<RecommenderFilterSummary>? recommenderFilters;

  ListRecommenderFiltersResponse({
    this.nextToken,
    this.recommenderFilters,
  });

  factory ListRecommenderFiltersResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommenderFiltersResponse(
      nextToken: json['NextToken'] as String?,
      recommenderFilters: (json['RecommenderFilters'] as List?)
          ?.nonNulls
          .map((e) =>
              RecommenderFilterSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommenderFilters = this.recommenderFilters;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recommenderFilters != null) 'RecommenderFilters': recommenderFilters,
    };
  }
}

class ListRecommenderRecipesResponse {
  /// A token to retrieve the next page of results. Null if there are no more
  /// results to retrieve.
  final String? nextToken;

  /// A list of available recommender recipes and their properties.
  final List<RecommenderRecipe>? recommenderRecipes;

  ListRecommenderRecipesResponse({
    this.nextToken,
    this.recommenderRecipes,
  });

  factory ListRecommenderRecipesResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommenderRecipesResponse(
      nextToken: json['NextToken'] as String?,
      recommenderRecipes: (json['RecommenderRecipes'] as List?)
          ?.nonNulls
          .map((e) => RecommenderRecipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommenderRecipes = this.recommenderRecipes;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recommenderRecipes != null) 'RecommenderRecipes': recommenderRecipes,
    };
  }
}

class ListRecommendersResponse {
  /// A token to retrieve the next page of results. Null if there are no more
  /// results to retrieve.
  final String? nextToken;

  /// A list of recommenders and their properties in the specified domain.
  final List<RecommenderSummary>? recommenders;

  ListRecommendersResponse({
    this.nextToken,
    this.recommenders,
  });

  factory ListRecommendersResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendersResponse(
      nextToken: json['NextToken'] as String?,
      recommenders: (json['Recommenders'] as List?)
          ?.nonNulls
          .map((e) => RecommenderSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommenders = this.recommenders;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recommenders != null) 'Recommenders': recommenders,
    };
  }
}

class ListRecommenderSchemasResponse {
  /// A token to retrieve the next page of results. Null if there are no more
  /// results to retrieve.
  final String? nextToken;

  /// A list of recommender schemas and their properties in the specified domain.
  final List<RecommenderSchemaSummary>? recommenderSchemas;

  ListRecommenderSchemasResponse({
    this.nextToken,
    this.recommenderSchemas,
  });

  factory ListRecommenderSchemasResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommenderSchemasResponse(
      nextToken: json['NextToken'] as String?,
      recommenderSchemas: (json['RecommenderSchemas'] as List?)
          ?.nonNulls
          .map((e) =>
              RecommenderSchemaSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommenderSchemas = this.recommenderSchemas;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recommenderSchemas != null) 'RecommenderSchemas': recommenderSchemas,
    };
  }
}

class ListRuleBasedMatchesResponse {
  /// The list of <code>MatchIds</code> for the given domain.
  final List<String>? matchIds;

  /// The pagination token from the previous <code>ListRuleBasedMatches</code> API
  /// call.
  final String? nextToken;

  ListRuleBasedMatchesResponse({
    this.matchIds,
    this.nextToken,
  });

  factory ListRuleBasedMatchesResponse.fromJson(Map<String, dynamic> json) {
    return ListRuleBasedMatchesResponse(
      matchIds: (json['MatchIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final matchIds = this.matchIds;
    final nextToken = this.nextToken;
    return {
      if (matchIds != null) 'MatchIds': matchIds,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSegmentDefinitionsResponse {
  /// List of segment definitions.
  final List<SegmentDefinitionItem>? items;

  /// The pagination token from the previous call.
  final String? nextToken;

  ListSegmentDefinitionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListSegmentDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSegmentDefinitionsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => SegmentDefinitionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags used to organize, track, or control access for this resource.
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

class ListUploadJobsResponse {
  /// The list of upload jobs for the specified domain.
  final List<UploadJobItem>? items;

  /// The pagination token to use to retrieve the next page of results.
  final String? nextToken;

  ListUploadJobsResponse({
    this.items,
    this.nextToken,
  });

  factory ListUploadJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListUploadJobsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => UploadJobItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListWorkflowsResponse {
  /// List containing workflow details.
  final List<ListWorkflowsItem>? items;

  /// If there are additional results, this is the token for the next set of
  /// results.
  final String? nextToken;

  ListWorkflowsResponse({
    this.items,
    this.nextToken,
  });

  factory ListWorkflowsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ListWorkflowsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class MergeProfilesResponse {
  /// A message that indicates the merge request is complete.
  final String? message;

  MergeProfilesResponse({
    this.message,
  });

  factory MergeProfilesResponse.fromJson(Map<String, dynamic> json) {
    return MergeProfilesResponse(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class PutDomainObjectTypeResponse {
  /// The timestamp of when the domain object type was created.
  final DateTime? createdAt;

  /// The description of the domain object type.
  final String? description;

  /// The customer provided KMS key used to encrypt this type of domain object.
  final String? encryptionKey;

  /// A map of field names to their corresponding domain object type field
  /// definitions.
  final Map<String, DomainObjectTypeField>? fields;

  /// The timestamp of when the domain object type was most recently edited.
  final DateTime? lastUpdatedAt;

  /// The unique name of the domain object type.
  final String? objectTypeName;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  PutDomainObjectTypeResponse({
    this.createdAt,
    this.description,
    this.encryptionKey,
    this.fields,
    this.lastUpdatedAt,
    this.objectTypeName,
    this.tags,
  });

  factory PutDomainObjectTypeResponse.fromJson(Map<String, dynamic> json) {
    return PutDomainObjectTypeResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      encryptionKey: json['EncryptionKey'] as String?,
      fields: (json['Fields'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k, DomainObjectTypeField.fromJson(e as Map<String, dynamic>))),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      objectTypeName: json['ObjectTypeName'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final encryptionKey = this.encryptionKey;
    final fields = this.fields;
    final lastUpdatedAt = this.lastUpdatedAt;
    final objectTypeName = this.objectTypeName;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (fields != null) 'Fields': fields,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (tags != null) 'Tags': tags,
    };
  }
}

class PutIntegrationResponse {
  /// The timestamp of when the domain was created.
  final DateTime createdAt;

  /// The unique name of the domain.
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  final DateTime lastUpdatedAt;

  /// The URI of the S3 bucket or any other type of data source.
  final String uri;

  /// A list of unique names for active event triggers associated with the
  /// integration. This list would be empty if no Event Trigger is associated with
  /// the integration.
  final List<String>? eventTriggerNames;

  /// Boolean that shows if the Flow that's associated with the Integration is
  /// created in Amazon Appflow, or with ObjectTypeName equals _unstructured via
  /// API/CLI in flowDefinition.
  final bool? isUnstructured;

  /// The name of the profile object type.
  final String? objectTypeName;

  /// A map in which each key is an event type from an external application such
  /// as Segment or Shopify, and each value is an <code>ObjectTypeName</code>
  /// (template) used to ingest the event. It supports the following event types:
  /// <code>SegmentIdentify</code>, <code>ShopifyCreateCustomers</code>,
  /// <code>ShopifyUpdateCustomers</code>, <code>ShopifyCreateDraftOrders</code>,
  /// <code>ShopifyUpdateDraftOrders</code>, <code>ShopifyCreateOrders</code>, and
  /// <code>ShopifyUpdatedOrders</code>.
  final Map<String, String>? objectTypeNames;

  /// The Amazon Resource Name (ARN) of the IAM role. The Integration uses this
  /// role to make Customer Profiles requests on your behalf.
  final String? roleArn;

  /// Specifies whether the integration applies to profile level data (associated
  /// with profiles) or domain level data (not associated with any specific
  /// profile). The default value is PROFILE.
  final Scope? scope;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Unique identifier for the workflow.
  final String? workflowId;

  PutIntegrationResponse({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    required this.uri,
    this.eventTriggerNames,
    this.isUnstructured,
    this.objectTypeName,
    this.objectTypeNames,
    this.roleArn,
    this.scope,
    this.tags,
    this.workflowId,
  });

  factory PutIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return PutIntegrationResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      domainName: (json['DomainName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      uri: (json['Uri'] as String?) ?? '',
      eventTriggerNames: (json['EventTriggerNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      isUnstructured: json['IsUnstructured'] as bool?,
      objectTypeName: json['ObjectTypeName'] as String?,
      objectTypeNames: (json['ObjectTypeNames'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      roleArn: json['RoleArn'] as String?,
      scope: (json['Scope'] as String?)?.let(Scope.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      workflowId: json['WorkflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final uri = this.uri;
    final eventTriggerNames = this.eventTriggerNames;
    final isUnstructured = this.isUnstructured;
    final objectTypeName = this.objectTypeName;
    final objectTypeNames = this.objectTypeNames;
    final roleArn = this.roleArn;
    final scope = this.scope;
    final tags = this.tags;
    final workflowId = this.workflowId;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'Uri': uri,
      if (eventTriggerNames != null) 'EventTriggerNames': eventTriggerNames,
      if (isUnstructured != null) 'IsUnstructured': isUnstructured,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (objectTypeNames != null) 'ObjectTypeNames': objectTypeNames,
      if (roleArn != null) 'RoleArn': roleArn,
      if (scope != null) 'Scope': scope.value,
      if (tags != null) 'Tags': tags,
      if (workflowId != null) 'WorkflowId': workflowId,
    };
  }
}

class PutProfileObjectResponse {
  /// The unique identifier of the profile object generated by the service.
  final String? profileObjectUniqueKey;

  PutProfileObjectResponse({
    this.profileObjectUniqueKey,
  });

  factory PutProfileObjectResponse.fromJson(Map<String, dynamic> json) {
    return PutProfileObjectResponse(
      profileObjectUniqueKey: json['ProfileObjectUniqueKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final profileObjectUniqueKey = this.profileObjectUniqueKey;
    return {
      if (profileObjectUniqueKey != null)
        'ProfileObjectUniqueKey': profileObjectUniqueKey,
    };
  }
}

class PutProfileObjectTypeResponse {
  /// Description of the profile object type.
  final String description;

  /// The name of the profile object type.
  final String objectTypeName;

  /// Indicates whether a profile should be created when data is received if one
  /// doesn’t exist for an object of this type. The default is <code>FALSE</code>.
  /// If the AllowProfileCreation flag is set to <code>FALSE</code>, then the
  /// service tries to fetch a standard profile and associate this object with the
  /// profile. If it is set to <code>TRUE</code>, and if no match is found, then
  /// the service creates a new standard profile.
  final bool? allowProfileCreation;

  /// The timestamp of when the domain was created.
  final DateTime? createdAt;

  /// The customer-provided key to encrypt the profile object that will be created
  /// in this profile object type.
  final String? encryptionKey;

  /// The number of days until the data in the object expires.
  final int? expirationDays;

  /// A map of the name and ObjectType field.
  final Map<String, ObjectTypeField>? fields;

  /// A list of unique keys that can be used to map data to the profile.
  final Map<String, List<ObjectTypeKey>>? keys;

  /// The timestamp of when the domain was most recently edited.
  final DateTime? lastUpdatedAt;

  /// The amount of provisioned profile object max count available.
  final int? maxAvailableProfileObjectCount;

  /// The amount of profile object max count assigned to the object type.
  final int? maxProfileObjectCount;

  /// The format of your <code>sourceLastUpdatedTimestamp</code> that was
  /// previously set up in fields that were parsed using <a
  /// href="https://docs.oracle.com/javase/10/docs/api/java/text/SimpleDateFormat.html">SimpleDateFormat</a>.
  /// If you have <code>sourceLastUpdatedTimestamp</code> in your field, you must
  /// set up <code>sourceLastUpdatedTimestampFormat</code>.
  final String? sourceLastUpdatedTimestampFormat;

  /// An integer that determines the priority of this object type when data from
  /// multiple sources is ingested. Lower values take priority. Object types
  /// without a specified source priority default to the lowest priority.
  final int? sourcePriority;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// A unique identifier for the object template.
  final String? templateId;

  PutProfileObjectTypeResponse({
    required this.description,
    required this.objectTypeName,
    this.allowProfileCreation,
    this.createdAt,
    this.encryptionKey,
    this.expirationDays,
    this.fields,
    this.keys,
    this.lastUpdatedAt,
    this.maxAvailableProfileObjectCount,
    this.maxProfileObjectCount,
    this.sourceLastUpdatedTimestampFormat,
    this.sourcePriority,
    this.tags,
    this.templateId,
  });

  factory PutProfileObjectTypeResponse.fromJson(Map<String, dynamic> json) {
    return PutProfileObjectTypeResponse(
      description: (json['Description'] as String?) ?? '',
      objectTypeName: (json['ObjectTypeName'] as String?) ?? '',
      allowProfileCreation: json['AllowProfileCreation'] as bool?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      encryptionKey: json['EncryptionKey'] as String?,
      expirationDays: json['ExpirationDays'] as int?,
      fields: (json['Fields'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ObjectTypeField.fromJson(e as Map<String, dynamic>))),
      keys: (json['Keys'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k,
          (e as List)
              .nonNulls
              .map((e) => ObjectTypeKey.fromJson(e as Map<String, dynamic>))
              .toList())),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      maxAvailableProfileObjectCount:
          json['MaxAvailableProfileObjectCount'] as int?,
      maxProfileObjectCount: json['MaxProfileObjectCount'] as int?,
      sourceLastUpdatedTimestampFormat:
          json['SourceLastUpdatedTimestampFormat'] as String?,
      sourcePriority: json['SourcePriority'] as int?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final objectTypeName = this.objectTypeName;
    final allowProfileCreation = this.allowProfileCreation;
    final createdAt = this.createdAt;
    final encryptionKey = this.encryptionKey;
    final expirationDays = this.expirationDays;
    final fields = this.fields;
    final keys = this.keys;
    final lastUpdatedAt = this.lastUpdatedAt;
    final maxAvailableProfileObjectCount = this.maxAvailableProfileObjectCount;
    final maxProfileObjectCount = this.maxProfileObjectCount;
    final sourceLastUpdatedTimestampFormat =
        this.sourceLastUpdatedTimestampFormat;
    final sourcePriority = this.sourcePriority;
    final tags = this.tags;
    final templateId = this.templateId;
    return {
      'Description': description,
      'ObjectTypeName': objectTypeName,
      if (allowProfileCreation != null)
        'AllowProfileCreation': allowProfileCreation,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (expirationDays != null) 'ExpirationDays': expirationDays,
      if (fields != null) 'Fields': fields,
      if (keys != null) 'Keys': keys,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (maxAvailableProfileObjectCount != null)
        'MaxAvailableProfileObjectCount': maxAvailableProfileObjectCount,
      if (maxProfileObjectCount != null)
        'MaxProfileObjectCount': maxProfileObjectCount,
      if (sourceLastUpdatedTimestampFormat != null)
        'SourceLastUpdatedTimestampFormat': sourceLastUpdatedTimestampFormat,
      if (sourcePriority != null) 'SourcePriority': sourcePriority,
      if (tags != null) 'Tags': tags,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

class SearchProfilesResponse {
  /// The list of Profiles matching the search criteria.
  final List<Profile>? items;

  /// The pagination token from the previous SearchProfiles API call.
  final String? nextToken;

  SearchProfilesResponse({
    this.items,
    this.nextToken,
  });

  factory SearchProfilesResponse.fromJson(Map<String, dynamic> json) {
    return SearchProfilesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class StartRecommenderResponse {
  StartRecommenderResponse();

  factory StartRecommenderResponse.fromJson(Map<String, dynamic> _) {
    return StartRecommenderResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartUploadJobResponse {
  StartUploadJobResponse();

  factory StartUploadJobResponse.fromJson(Map<String, dynamic> _) {
    return StartUploadJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopRecommenderResponse {
  StopRecommenderResponse();

  factory StopRecommenderResponse.fromJson(Map<String, dynamic> _) {
    return StopRecommenderResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopUploadJobResponse {
  StopUploadJobResponse();

  factory StopUploadJobResponse.fromJson(Map<String, dynamic> _) {
    return StopUploadJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateCalculatedAttributeDefinitionResponse {
  /// The mathematical expression and a list of attribute items specified in that
  /// expression.
  final AttributeDetails? attributeDetails;

  /// The unique name of the calculated attribute.
  final String? calculatedAttributeName;

  /// The conditions including range, object count, and threshold for the
  /// calculated attribute.
  final Conditions? conditions;

  /// The timestamp of when the calculated attribute definition was created.
  final DateTime? createdAt;

  /// The description of the calculated attribute.
  final String? description;

  /// The display name of the calculated attribute.
  final String? displayName;

  /// The timestamp of when the calculated attribute definition was most recently
  /// edited.
  final DateTime? lastUpdatedAt;

  /// Information indicating if the Calculated Attribute is ready for use by
  /// confirming all historical data has been processed and reflected.
  final Readiness? readiness;

  /// The aggregation operation to perform for the calculated attribute.
  final Statistic? statistic;

  /// Status of the Calculated Attribute creation (whether all historical data has
  /// been indexed.)
  final ReadinessStatus? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Whether historical data ingested before the Calculated Attribute was created
  /// should be included in calculations.
  final bool? useHistoricalData;

  UpdateCalculatedAttributeDefinitionResponse({
    this.attributeDetails,
    this.calculatedAttributeName,
    this.conditions,
    this.createdAt,
    this.description,
    this.displayName,
    this.lastUpdatedAt,
    this.readiness,
    this.statistic,
    this.status,
    this.tags,
    this.useHistoricalData,
  });

  factory UpdateCalculatedAttributeDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCalculatedAttributeDefinitionResponse(
      attributeDetails: json['AttributeDetails'] != null
          ? AttributeDetails.fromJson(
              json['AttributeDetails'] as Map<String, dynamic>)
          : null,
      calculatedAttributeName: json['CalculatedAttributeName'] as String?,
      conditions: json['Conditions'] != null
          ? Conditions.fromJson(json['Conditions'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      readiness: json['Readiness'] != null
          ? Readiness.fromJson(json['Readiness'] as Map<String, dynamic>)
          : null,
      statistic: (json['Statistic'] as String?)?.let(Statistic.fromString),
      status: (json['Status'] as String?)?.let(ReadinessStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useHistoricalData: json['UseHistoricalData'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeDetails = this.attributeDetails;
    final calculatedAttributeName = this.calculatedAttributeName;
    final conditions = this.conditions;
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final readiness = this.readiness;
    final statistic = this.statistic;
    final status = this.status;
    final tags = this.tags;
    final useHistoricalData = this.useHistoricalData;
    return {
      if (attributeDetails != null) 'AttributeDetails': attributeDetails,
      if (calculatedAttributeName != null)
        'CalculatedAttributeName': calculatedAttributeName,
      if (conditions != null) 'Conditions': conditions,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (readiness != null) 'Readiness': readiness,
      if (statistic != null) 'Statistic': statistic.value,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
      if (useHistoricalData != null) 'UseHistoricalData': useHistoricalData,
    };
  }
}

class UpdateDomainResponse {
  /// The timestamp of when the domain was created.
  final DateTime createdAt;

  /// The unique name of the domain.
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  final DateTime lastUpdatedAt;

  /// The data store.
  final DataStoreResponse? dataStore;

  /// The URL of the SQS dead letter queue, which is used for reporting errors
  /// associated with ingesting data from third party applications.
  final String? deadLetterQueueUrl;

  /// The default encryption key, which is an AWS managed key, is used when no
  /// specific type of encryption key is specified. It is used to encrypt all data
  /// before it is placed in permanent or semi-permanent storage.
  final String? defaultEncryptionKey;

  /// The default number of days until the data within the domain expires.
  final int? defaultExpirationDays;

  /// The process of matching duplicate profiles. If <code>Matching</code> =
  /// <code>true</code>, Amazon Connect Customer Profiles starts a weekly batch
  /// process called Identity Resolution Job. If you do not specify a date and
  /// time for Identity Resolution Job to run, by default it runs every Saturday
  /// at 12AM UTC to detect duplicate profiles in your domains.
  ///
  /// After the Identity Resolution Job completes, use the <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetMatches.html">GetMatches</a>
  /// API to return and review the results. Or, if you have configured
  /// <code>ExportingConfig</code> in the <code>MatchingRequest</code>, you can
  /// download the results from S3.
  final MatchingResponse? matching;

  /// The process of matching duplicate profiles using the rule-Based matching. If
  /// <code>RuleBasedMatching</code> = true, Connect Customer Customer Profiles
  /// will start to match and merge your profiles according to your configuration
  /// in the <code>RuleBasedMatchingRequest</code>. You can use the
  /// <code>ListRuleBasedMatches</code> and <code>GetSimilarProfiles</code> API to
  /// return and review the results. Also, if you have configured
  /// <code>ExportingConfig</code> in the <code>RuleBasedMatchingRequest</code>,
  /// you can download the results from S3.
  final RuleBasedMatchingResponse? ruleBasedMatching;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  UpdateDomainResponse({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    this.dataStore,
    this.deadLetterQueueUrl,
    this.defaultEncryptionKey,
    this.defaultExpirationDays,
    this.matching,
    this.ruleBasedMatching,
    this.tags,
  });

  factory UpdateDomainResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      domainName: (json['DomainName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      dataStore: json['DataStore'] != null
          ? DataStoreResponse.fromJson(
              json['DataStore'] as Map<String, dynamic>)
          : null,
      deadLetterQueueUrl: json['DeadLetterQueueUrl'] as String?,
      defaultEncryptionKey: json['DefaultEncryptionKey'] as String?,
      defaultExpirationDays: json['DefaultExpirationDays'] as int?,
      matching: json['Matching'] != null
          ? MatchingResponse.fromJson(json['Matching'] as Map<String, dynamic>)
          : null,
      ruleBasedMatching: json['RuleBasedMatching'] != null
          ? RuleBasedMatchingResponse.fromJson(
              json['RuleBasedMatching'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final dataStore = this.dataStore;
    final deadLetterQueueUrl = this.deadLetterQueueUrl;
    final defaultEncryptionKey = this.defaultEncryptionKey;
    final defaultExpirationDays = this.defaultExpirationDays;
    final matching = this.matching;
    final ruleBasedMatching = this.ruleBasedMatching;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (dataStore != null) 'DataStore': dataStore,
      if (deadLetterQueueUrl != null) 'DeadLetterQueueUrl': deadLetterQueueUrl,
      if (defaultEncryptionKey != null)
        'DefaultEncryptionKey': defaultEncryptionKey,
      if (defaultExpirationDays != null)
        'DefaultExpirationDays': defaultExpirationDays,
      if (matching != null) 'Matching': matching,
      if (ruleBasedMatching != null) 'RuleBasedMatching': ruleBasedMatching,
      if (tags != null) 'Tags': tags,
    };
  }
}

class UpdateDomainLayoutResponse {
  /// The timestamp of when the layout was created.
  final DateTime? createdAt;

  /// The description of the layout
  final String? description;

  /// The display name of the layout
  final String? displayName;

  /// If set to true for a layout, this layout will be used by default to view
  /// data. If set to false, then the layout will not be used by default, but it
  /// can be used to view data by explicitly selecting it in the console.
  final bool? isDefault;

  /// The timestamp of when the layout was most recently updated.
  final DateTime? lastUpdatedAt;

  /// A customizable layout that can be used to view data under a Customer
  /// Profiles domain.
  final String? layout;

  /// The unique name of the layout.
  final String? layoutDefinitionName;

  /// The type of layout that can be used to view data under a Customer Profiles
  /// domain.
  final LayoutType? layoutType;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// The version used to create layout.
  final String? version;

  UpdateDomainLayoutResponse({
    this.createdAt,
    this.description,
    this.displayName,
    this.isDefault,
    this.lastUpdatedAt,
    this.layout,
    this.layoutDefinitionName,
    this.layoutType,
    this.tags,
    this.version,
  });

  factory UpdateDomainLayoutResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainLayoutResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      isDefault: json['IsDefault'] as bool?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      layout: json['Layout'] as String?,
      layoutDefinitionName: json['LayoutDefinitionName'] as String?,
      layoutType: (json['LayoutType'] as String?)?.let(LayoutType.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final isDefault = this.isDefault;
    final lastUpdatedAt = this.lastUpdatedAt;
    final layout = this.layout;
    final layoutDefinitionName = this.layoutDefinitionName;
    final layoutType = this.layoutType;
    final tags = this.tags;
    final version = this.version;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (isDefault != null) 'IsDefault': isDefault,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (layout != null) 'Layout': layout,
      if (layoutDefinitionName != null)
        'LayoutDefinitionName': layoutDefinitionName,
      if (layoutType != null) 'LayoutType': layoutType.value,
      if (tags != null) 'Tags': tags,
      if (version != null) 'Version': version,
    };
  }
}

class UpdateEventTriggerResponse {
  /// The timestamp of when the event trigger was created.
  final DateTime? createdAt;

  /// The description of the event trigger.
  final String? description;

  /// A list of conditions that determine when an event should trigger the
  /// destination.
  final List<EventTriggerCondition>? eventTriggerConditions;

  /// Defines limits controlling whether an event triggers the destination, based
  /// on ingestion latency and the number of invocations per profile over specific
  /// time periods.
  final EventTriggerLimits? eventTriggerLimits;

  /// The unique name of the event trigger.
  final String? eventTriggerName;

  /// The timestamp of when the event trigger was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The unique name of the object type.
  final String? objectTypeName;

  /// The destination is triggered only for profiles that meet the criteria of a
  /// segment definition.
  final String? segmentFilter;

  /// An array of key-value pairs to apply to this resource.
  final Map<String, String>? tags;

  UpdateEventTriggerResponse({
    this.createdAt,
    this.description,
    this.eventTriggerConditions,
    this.eventTriggerLimits,
    this.eventTriggerName,
    this.lastUpdatedAt,
    this.objectTypeName,
    this.segmentFilter,
    this.tags,
  });

  factory UpdateEventTriggerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEventTriggerResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      eventTriggerConditions: (json['EventTriggerConditions'] as List?)
          ?.nonNulls
          .map((e) => EventTriggerCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventTriggerLimits: json['EventTriggerLimits'] != null
          ? EventTriggerLimits.fromJson(
              json['EventTriggerLimits'] as Map<String, dynamic>)
          : null,
      eventTriggerName: json['EventTriggerName'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      objectTypeName: json['ObjectTypeName'] as String?,
      segmentFilter: json['SegmentFilter'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final eventTriggerConditions = this.eventTriggerConditions;
    final eventTriggerLimits = this.eventTriggerLimits;
    final eventTriggerName = this.eventTriggerName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final objectTypeName = this.objectTypeName;
    final segmentFilter = this.segmentFilter;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (eventTriggerConditions != null)
        'EventTriggerConditions': eventTriggerConditions,
      if (eventTriggerLimits != null) 'EventTriggerLimits': eventTriggerLimits,
      if (eventTriggerName != null) 'EventTriggerName': eventTriggerName,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (segmentFilter != null) 'SegmentFilter': segmentFilter,
      if (tags != null) 'Tags': tags,
    };
  }
}

class UpdateProfileResponse {
  /// The unique identifier of a customer profile.
  final String profileId;

  UpdateProfileResponse({
    required this.profileId,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      profileId: (json['ProfileId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final profileId = this.profileId;
    return {
      'ProfileId': profileId,
    };
  }
}

class UpdateRecommenderResponse {
  /// The name of the recommender that was updated.
  final String recommenderName;

  UpdateRecommenderResponse({
    required this.recommenderName,
  });

  factory UpdateRecommenderResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRecommenderResponse(
      recommenderName: (json['RecommenderName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final recommenderName = this.recommenderName;
    return {
      'RecommenderName': recommenderName,
    };
  }
}

/// Configuration settings that define the behavior and parameters of a
/// recommender.
class RecommenderConfig {
  /// Configuration settings for how the recommender processes and uses events.
  final EventsConfig? eventsConfig;

  /// A map of dataset type to a list of column names to exclude from training.
  /// The <code>_webAnalytics</code> and <code>_catalogItem</code> keys are
  /// supported. The column names must be valid columns defined in the recommender
  /// schema. All columns in the schema except the listed columns will be used for
  /// training. The following columns are mandatory and cannot be excluded:
  /// <code>Item.Id</code>, <code>EventTimestamp</code>, and
  /// <code>EventType</code> for <code>_webAnalytics</code>; <code>Id</code> for
  /// <code>_catalogItem</code>. Mutually exclusive with IncludedColumns — both
  /// cannot be specified in the same request.
  final Map<String, List<String>>? excludedColumns;

  /// A map of dataset type to a list of column names to train on. The
  /// <code>_webAnalytics</code> and <code>_catalogItem</code> keys are supported.
  /// The column names must be a subset of the columns defined in the recommender
  /// schema. If not specified, all columns in the schema are used for training.
  /// The following columns are always included in training and do not need to be
  /// specified: <code>Item.Id</code>, <code>EventTimestamp</code>, and
  /// <code>EventType</code> for <code>_webAnalytics</code>; <code>Id</code> for
  /// <code>_catalogItem</code>. Mutually exclusive with ExcludedColumns — both
  /// cannot be specified in the same request.
  final Map<String, List<String>>? includedColumns;

  /// Configuration settings for how the recommender handles inference requests.
  final InferenceConfig? inferenceConfig;

  /// How often the recommender should retrain its model with new data. If set to
  /// 0, automatic retraining will not be enabled.
  final int? trainingFrequency;

  RecommenderConfig({
    this.eventsConfig,
    this.excludedColumns,
    this.includedColumns,
    this.inferenceConfig,
    this.trainingFrequency,
  });

  factory RecommenderConfig.fromJson(Map<String, dynamic> json) {
    return RecommenderConfig(
      eventsConfig: json['EventsConfig'] != null
          ? EventsConfig.fromJson(json['EventsConfig'] as Map<String, dynamic>)
          : null,
      excludedColumns: (json['ExcludedColumns'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List).nonNulls.map((e) => e as String).toList())),
      includedColumns: (json['IncludedColumns'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List).nonNulls.map((e) => e as String).toList())),
      inferenceConfig: json['InferenceConfig'] != null
          ? InferenceConfig.fromJson(
              json['InferenceConfig'] as Map<String, dynamic>)
          : null,
      trainingFrequency: json['TrainingFrequency'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventsConfig = this.eventsConfig;
    final excludedColumns = this.excludedColumns;
    final includedColumns = this.includedColumns;
    final inferenceConfig = this.inferenceConfig;
    final trainingFrequency = this.trainingFrequency;
    return {
      if (eventsConfig != null) 'EventsConfig': eventsConfig,
      if (excludedColumns != null) 'ExcludedColumns': excludedColumns,
      if (includedColumns != null) 'IncludedColumns': includedColumns,
      if (inferenceConfig != null) 'InferenceConfig': inferenceConfig,
      if (trainingFrequency != null) 'TrainingFrequency': trainingFrequency,
    };
  }
}

/// Configuration settings that define how events are processed and tracked.
class EventsConfig {
  /// A list of event parameters configurations that specify how different event
  /// types should be handled.
  final List<EventParameters> eventParametersList;

  EventsConfig({
    required this.eventParametersList,
  });

  factory EventsConfig.fromJson(Map<String, dynamic> json) {
    return EventsConfig(
      eventParametersList: ((json['EventParametersList'] as List?) ?? const [])
          .nonNulls
          .map((e) => EventParameters.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventParametersList = this.eventParametersList;
    return {
      'EventParametersList': eventParametersList,
    };
  }
}

/// Configuration settings for inference behavior of the recommender.
class InferenceConfig {
  /// The minimum provisioned transactions per second (TPS) that the recommender
  /// supports. The default value is 1. A high MinProvisionedTPS will increase
  /// your cost.
  final int? minProvisionedTPS;

  InferenceConfig({
    this.minProvisionedTPS,
  });

  factory InferenceConfig.fromJson(Map<String, dynamic> json) {
    return InferenceConfig(
      minProvisionedTPS: json['MinProvisionedTPS'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final minProvisionedTPS = this.minProvisionedTPS;
    return {
      if (minProvisionedTPS != null) 'MinProvisionedTPS': minProvisionedTPS,
    };
  }
}

/// Configuration parameters for events in the personalization system.
class EventParameters {
  /// The type of event being tracked (e.g., 'click', 'purchase', 'view').
  final String eventType;

  /// The minimum value threshold that an event must meet to be considered valid.
  final double? eventValueThreshold;

  /// The weight of the event type. A higher weight means higher importance of the
  /// event type for the created solution.
  final double? eventWeight;

  EventParameters({
    required this.eventType,
    this.eventValueThreshold,
    this.eventWeight,
  });

  factory EventParameters.fromJson(Map<String, dynamic> json) {
    return EventParameters(
      eventType: (json['EventType'] as String?) ?? '',
      eventValueThreshold: json['EventValueThreshold'] as double?,
      eventWeight: json['EventWeight'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final eventValueThreshold = this.eventValueThreshold;
    final eventWeight = this.eventWeight;
    return {
      'EventType': eventType,
      if (eventValueThreshold != null)
        'EventValueThreshold': eventValueThreshold,
      if (eventWeight != null) 'EventWeight': eventWeight,
    };
  }
}

class PartyType {
  static const individual = PartyType._('INDIVIDUAL');
  static const business = PartyType._('BUSINESS');
  static const other = PartyType._('OTHER');

  final String value;

  const PartyType._(this.value);

  static const values = [individual, business, other];

  static PartyType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PartyType._(value));

  @override
  bool operator ==(other) => other is PartyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Gender {
  static const male = Gender._('MALE');
  static const female = Gender._('FEMALE');
  static const unspecified = Gender._('UNSPECIFIED');

  final String value;

  const Gender._(this.value);

  static const values = [male, female, unspecified];

  static Gender fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Gender._(value));

  @override
  bool operator ==(other) => other is Gender && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Updates associated with the address properties of a customer profile.
class UpdateAddress {
  /// The first line of a customer address.
  final String? address1;

  /// The second line of a customer address.
  final String? address2;

  /// The third line of a customer address.
  final String? address3;

  /// The fourth line of a customer address.
  final String? address4;

  /// The city in which a customer lives.
  final String? city;

  /// The country in which a customer lives.
  final String? country;

  /// The county in which a customer lives.
  final String? county;

  /// The postal code of a customer address.
  final String? postalCode;

  /// The province in which a customer lives.
  final String? province;

  /// The state in which a customer lives.
  final String? state;

  UpdateAddress({
    this.address1,
    this.address2,
    this.address3,
    this.address4,
    this.city,
    this.country,
    this.county,
    this.postalCode,
    this.province,
    this.state,
  });

  Map<String, dynamic> toJson() {
    final address1 = this.address1;
    final address2 = this.address2;
    final address3 = this.address3;
    final address4 = this.address4;
    final city = this.city;
    final country = this.country;
    final county = this.county;
    final postalCode = this.postalCode;
    final province = this.province;
    final state = this.state;
    return {
      if (address1 != null) 'Address1': address1,
      if (address2 != null) 'Address2': address2,
      if (address3 != null) 'Address3': address3,
      if (address4 != null) 'Address4': address4,
      if (city != null) 'City': city,
      if (country != null) 'Country': country,
      if (county != null) 'County': county,
      if (postalCode != null) 'PostalCode': postalCode,
      if (province != null) 'Province': province,
      if (state != null) 'State': state,
    };
  }
}

class ProfileType {
  static const accountProfile = ProfileType._('ACCOUNT_PROFILE');
  static const profile = ProfileType._('PROFILE');

  final String value;

  const ProfileType._(this.value);

  static const values = [accountProfile, profile];

  static ProfileType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ProfileType._(value));

  @override
  bool operator ==(other) => other is ProfileType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object that defines users preferred methods of engagement.
class EngagementPreferences {
  /// A list of email-related contact preferences
  final List<ContactPreference>? email;

  /// A list of phone-related contact preferences
  final List<ContactPreference>? phone;

  EngagementPreferences({
    this.email,
    this.phone,
  });

  factory EngagementPreferences.fromJson(Map<String, dynamic> json) {
    return EngagementPreferences(
      email: (json['Email'] as List?)
          ?.nonNulls
          .map((e) => ContactPreference.fromJson(e as Map<String, dynamic>))
          .toList(),
      phone: (json['Phone'] as List?)
          ?.nonNulls
          .map((e) => ContactPreference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final phone = this.phone;
    return {
      if (email != null) 'Email': email,
      if (phone != null) 'Phone': phone,
    };
  }
}

/// Object that defines users contact preference.
class ContactPreference {
  /// The contact type used for engagement. For example: HomePhoneNumber,
  /// PersonalEmailAddress.
  final ContactType? contactType;

  /// A searchable, unique identifier of a customer profile.
  final String? keyName;

  /// The key value used to look up profile based off the keyName.
  final String? keyValue;

  /// The unique identifier of a customer profile.
  final String? profileId;

  ContactPreference({
    this.contactType,
    this.keyName,
    this.keyValue,
    this.profileId,
  });

  factory ContactPreference.fromJson(Map<String, dynamic> json) {
    return ContactPreference(
      contactType:
          (json['ContactType'] as String?)?.let(ContactType.fromString),
      keyName: json['KeyName'] as String?,
      keyValue: json['KeyValue'] as String?,
      profileId: json['ProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contactType = this.contactType;
    final keyName = this.keyName;
    final keyValue = this.keyValue;
    final profileId = this.profileId;
    return {
      if (contactType != null) 'ContactType': contactType.value,
      if (keyName != null) 'KeyName': keyName,
      if (keyValue != null) 'KeyValue': keyValue,
      if (profileId != null) 'ProfileId': profileId,
    };
  }
}

class ContactType {
  static const phoneNumber = ContactType._('PhoneNumber');
  static const mobilePhoneNumber = ContactType._('MobilePhoneNumber');
  static const homePhoneNumber = ContactType._('HomePhoneNumber');
  static const businessPhoneNumber = ContactType._('BusinessPhoneNumber');
  static const emailAddress = ContactType._('EmailAddress');
  static const personalEmailAddress = ContactType._('PersonalEmailAddress');
  static const businessEmailAddress = ContactType._('BusinessEmailAddress');

  final String value;

  const ContactType._(this.value);

  static const values = [
    phoneNumber,
    mobilePhoneNumber,
    homePhoneNumber,
    businessPhoneNumber,
    emailAddress,
    personalEmailAddress,
    businessEmailAddress
  ];

  static ContactType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ContactType._(value));

  @override
  bool operator ==(other) => other is ContactType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines limits controlling whether an event triggers the destination, based
/// on ingestion latency and the number of invocations per profile over specific
/// time periods.
class EventTriggerLimits {
  /// In milliseconds. Specifies that an event will only trigger the destination
  /// if it is processed within a certain latency period.
  final int? eventExpiration;

  /// A list of time periods during which the limits apply.
  final List<Period>? periods;

  EventTriggerLimits({
    this.eventExpiration,
    this.periods,
  });

  factory EventTriggerLimits.fromJson(Map<String, dynamic> json) {
    return EventTriggerLimits(
      eventExpiration: json['EventExpiration'] as int?,
      periods: (json['Periods'] as List?)
          ?.nonNulls
          .map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventExpiration = this.eventExpiration;
    final periods = this.periods;
    return {
      if (eventExpiration != null) 'EventExpiration': eventExpiration,
      if (periods != null) 'Periods': periods,
    };
  }
}

/// Defines a limit and the time period during which it is enforced.
class Period {
  /// The unit of time.
  final PeriodUnit unit;

  /// The amount of time of the specified unit.
  final int value;

  /// The maximum allowed number of destination invocations per profile.
  final int? maxInvocationsPerProfile;

  /// If set to true, there is no limit on the number of destination invocations
  /// per profile. The default is false.
  final bool? unlimited;

  Period({
    required this.unit,
    required this.value,
    this.maxInvocationsPerProfile,
    this.unlimited,
  });

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      unit: PeriodUnit.fromString((json['Unit'] as String?) ?? ''),
      value: (json['Value'] as int?) ?? 0,
      maxInvocationsPerProfile: json['MaxInvocationsPerProfile'] as int?,
      unlimited: json['Unlimited'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    final maxInvocationsPerProfile = this.maxInvocationsPerProfile;
    final unlimited = this.unlimited;
    return {
      'Unit': unit.value,
      'Value': value,
      if (maxInvocationsPerProfile != null)
        'MaxInvocationsPerProfile': maxInvocationsPerProfile,
      if (unlimited != null) 'Unlimited': unlimited,
    };
  }
}

class PeriodUnit {
  static const minutes = PeriodUnit._('MINUTES');
  static const hours = PeriodUnit._('HOURS');
  static const days = PeriodUnit._('DAYS');
  static const weeks = PeriodUnit._('WEEKS');
  static const months = PeriodUnit._('MONTHS');

  final String value;

  const PeriodUnit._(this.value);

  static const values = [minutes, hours, days, weeks, months];

  static PeriodUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PeriodUnit._(value));

  @override
  bool operator ==(other) => other is PeriodUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the circumstances under which the event should trigger the
/// destination.
class EventTriggerCondition {
  /// A list of dimensions to be evaluated for the event.
  final List<EventTriggerDimension> eventTriggerDimensions;

  /// The operator used to combine multiple dimensions.
  final EventTriggerLogicalOperator logicalOperator;

  EventTriggerCondition({
    required this.eventTriggerDimensions,
    required this.logicalOperator,
  });

  factory EventTriggerCondition.fromJson(Map<String, dynamic> json) {
    return EventTriggerCondition(
      eventTriggerDimensions: ((json['EventTriggerDimensions'] as List?) ??
              const [])
          .nonNulls
          .map((e) => EventTriggerDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      logicalOperator: EventTriggerLogicalOperator.fromString(
          (json['LogicalOperator'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final eventTriggerDimensions = this.eventTriggerDimensions;
    final logicalOperator = this.logicalOperator;
    return {
      'EventTriggerDimensions': eventTriggerDimensions,
      'LogicalOperator': logicalOperator.value,
    };
  }
}

class EventTriggerLogicalOperator {
  static const any = EventTriggerLogicalOperator._('ANY');
  static const all = EventTriggerLogicalOperator._('ALL');
  static const none = EventTriggerLogicalOperator._('NONE');

  final String value;

  const EventTriggerLogicalOperator._(this.value);

  static const values = [any, all, none];

  static EventTriggerLogicalOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventTriggerLogicalOperator._(value));

  @override
  bool operator ==(other) =>
      other is EventTriggerLogicalOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A specific event dimension to be assessed.
class EventTriggerDimension {
  /// A list of object attributes to be evaluated.
  final List<ObjectAttribute> objectAttributes;

  EventTriggerDimension({
    required this.objectAttributes,
  });

  factory EventTriggerDimension.fromJson(Map<String, dynamic> json) {
    return EventTriggerDimension(
      objectAttributes: ((json['ObjectAttributes'] as List?) ?? const [])
          .nonNulls
          .map((e) => ObjectAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final objectAttributes = this.objectAttributes;
    return {
      'ObjectAttributes': objectAttributes,
    };
  }
}

/// The criteria that a specific object attribute must meet to trigger the
/// destination.
class ObjectAttribute {
  /// The operator used to compare an attribute against a list of values.
  final ComparisonOperator comparisonOperator;

  /// A list of attribute values used for comparison.
  final List<String> values;

  /// A field defined within an object type.
  final String? fieldName;

  /// An attribute contained within a source object.
  final String? source;

  ObjectAttribute({
    required this.comparisonOperator,
    required this.values,
    this.fieldName,
    this.source,
  });

  factory ObjectAttribute.fromJson(Map<String, dynamic> json) {
    return ObjectAttribute(
      comparisonOperator: ComparisonOperator.fromString(
          (json['ComparisonOperator'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      fieldName: json['FieldName'] as String?,
      source: json['Source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final values = this.values;
    final fieldName = this.fieldName;
    final source = this.source;
    return {
      'ComparisonOperator': comparisonOperator.value,
      'Values': values,
      if (fieldName != null) 'FieldName': fieldName,
      if (source != null) 'Source': source,
    };
  }
}

class ComparisonOperator {
  static const inclusive = ComparisonOperator._('INCLUSIVE');
  static const exclusive = ComparisonOperator._('EXCLUSIVE');
  static const contains = ComparisonOperator._('CONTAINS');
  static const beginsWith = ComparisonOperator._('BEGINS_WITH');
  static const endsWith = ComparisonOperator._('ENDS_WITH');
  static const greaterThan = ComparisonOperator._('GREATER_THAN');
  static const lessThan = ComparisonOperator._('LESS_THAN');
  static const greaterThanOrEqual =
      ComparisonOperator._('GREATER_THAN_OR_EQUAL');
  static const lessThanOrEqual = ComparisonOperator._('LESS_THAN_OR_EQUAL');
  static const equal = ComparisonOperator._('EQUAL');
  static const before = ComparisonOperator._('BEFORE');
  static const after = ComparisonOperator._('AFTER');
  static const on = ComparisonOperator._('ON');
  static const between = ComparisonOperator._('BETWEEN');
  static const notBetween = ComparisonOperator._('NOT_BETWEEN');

  final String value;

  const ComparisonOperator._(this.value);

  static const values = [
    inclusive,
    exclusive,
    contains,
    beginsWith,
    endsWith,
    greaterThan,
    lessThan,
    greaterThanOrEqual,
    lessThanOrEqual,
    equal,
    before,
    after,
    on,
    between,
    notBetween
  ];

  static ComparisonOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComparisonOperator._(value));

  @override
  bool operator ==(other) =>
      other is ComparisonOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class LayoutType {
  static const profileExplorer = LayoutType._('PROFILE_EXPLORER');

  final String value;

  const LayoutType._(this.value);

  static const values = [profileExplorer];

  static LayoutType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LayoutType._(value));

  @override
  bool operator ==(other) => other is LayoutType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The flag that enables the matching process of duplicate profiles.
class MatchingResponse {
  /// Configuration information about the auto-merging process.
  final AutoMerging? autoMerging;

  /// The flag that enables the matching process of duplicate profiles.
  final bool? enabled;

  /// Configuration information for exporting Identity Resolution results, for
  /// example, to an S3 bucket.
  final ExportingConfig? exportingConfig;

  /// The day and time when do you want to start the Identity Resolution Job every
  /// week.
  final JobSchedule? jobSchedule;

  MatchingResponse({
    this.autoMerging,
    this.enabled,
    this.exportingConfig,
    this.jobSchedule,
  });

  factory MatchingResponse.fromJson(Map<String, dynamic> json) {
    return MatchingResponse(
      autoMerging: json['AutoMerging'] != null
          ? AutoMerging.fromJson(json['AutoMerging'] as Map<String, dynamic>)
          : null,
      enabled: json['Enabled'] as bool?,
      exportingConfig: json['ExportingConfig'] != null
          ? ExportingConfig.fromJson(
              json['ExportingConfig'] as Map<String, dynamic>)
          : null,
      jobSchedule: json['JobSchedule'] != null
          ? JobSchedule.fromJson(json['JobSchedule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoMerging = this.autoMerging;
    final enabled = this.enabled;
    final exportingConfig = this.exportingConfig;
    final jobSchedule = this.jobSchedule;
    return {
      if (autoMerging != null) 'AutoMerging': autoMerging,
      if (enabled != null) 'Enabled': enabled,
      if (exportingConfig != null) 'ExportingConfig': exportingConfig,
      if (jobSchedule != null) 'JobSchedule': jobSchedule,
    };
  }
}

/// The response of the Rule-based matching request.
class RuleBasedMatchingResponse {
  /// Configures information about the <code>AttributeTypesSelector</code> where
  /// the rule-based identity resolution uses to match profiles.
  final AttributeTypesSelector? attributeTypesSelector;
  final ConflictResolution? conflictResolution;

  /// The flag that enables the rule-based matching process of duplicate profiles.
  final bool? enabled;
  final ExportingConfig? exportingConfig;

  /// Configures how the rule-based matching process should match profiles. You
  /// can have up to 15 <code>MatchingRule</code> in the
  /// <code>MatchingRules</code>.
  final List<MatchingRule>? matchingRules;

  /// Indicates the maximum allowed rule level.
  final int? maxAllowedRuleLevelForMatching;

  /// <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_MatchingRule.html">MatchingRule</a>
  final int? maxAllowedRuleLevelForMerging;

  /// PENDING
  ///
  /// <ul>
  /// <li>
  /// The first status after configuration a rule-based matching rule. If it is an
  /// existing domain, the rule-based Identity Resolution waits one hour before
  /// creating the matching rule. If it is a new domain, the system will skip the
  /// <code>PENDING</code> stage.
  /// </li>
  /// </ul>
  /// IN_PROGRESS
  ///
  /// <ul>
  /// <li>
  /// The system is creating the rule-based matching rule. Under this status, the
  /// system is evaluating the existing data and you can no longer change the
  /// Rule-based matching configuration.
  /// </li>
  /// </ul>
  /// ACTIVE
  ///
  /// <ul>
  /// <li>
  /// The rule is ready to use. You can change the rule a day after the status is
  /// in <code>ACTIVE</code>.
  /// </li>
  /// </ul>
  final RuleBasedMatchingStatus? status;

  RuleBasedMatchingResponse({
    this.attributeTypesSelector,
    this.conflictResolution,
    this.enabled,
    this.exportingConfig,
    this.matchingRules,
    this.maxAllowedRuleLevelForMatching,
    this.maxAllowedRuleLevelForMerging,
    this.status,
  });

  factory RuleBasedMatchingResponse.fromJson(Map<String, dynamic> json) {
    return RuleBasedMatchingResponse(
      attributeTypesSelector: json['AttributeTypesSelector'] != null
          ? AttributeTypesSelector.fromJson(
              json['AttributeTypesSelector'] as Map<String, dynamic>)
          : null,
      conflictResolution: json['ConflictResolution'] != null
          ? ConflictResolution.fromJson(
              json['ConflictResolution'] as Map<String, dynamic>)
          : null,
      enabled: json['Enabled'] as bool?,
      exportingConfig: json['ExportingConfig'] != null
          ? ExportingConfig.fromJson(
              json['ExportingConfig'] as Map<String, dynamic>)
          : null,
      matchingRules: (json['MatchingRules'] as List?)
          ?.nonNulls
          .map((e) => MatchingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxAllowedRuleLevelForMatching:
          json['MaxAllowedRuleLevelForMatching'] as int?,
      maxAllowedRuleLevelForMerging:
          json['MaxAllowedRuleLevelForMerging'] as int?,
      status:
          (json['Status'] as String?)?.let(RuleBasedMatchingStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeTypesSelector = this.attributeTypesSelector;
    final conflictResolution = this.conflictResolution;
    final enabled = this.enabled;
    final exportingConfig = this.exportingConfig;
    final matchingRules = this.matchingRules;
    final maxAllowedRuleLevelForMatching = this.maxAllowedRuleLevelForMatching;
    final maxAllowedRuleLevelForMerging = this.maxAllowedRuleLevelForMerging;
    final status = this.status;
    return {
      if (attributeTypesSelector != null)
        'AttributeTypesSelector': attributeTypesSelector,
      if (conflictResolution != null) 'ConflictResolution': conflictResolution,
      if (enabled != null) 'Enabled': enabled,
      if (exportingConfig != null) 'ExportingConfig': exportingConfig,
      if (matchingRules != null) 'MatchingRules': matchingRules,
      if (maxAllowedRuleLevelForMatching != null)
        'MaxAllowedRuleLevelForMatching': maxAllowedRuleLevelForMatching,
      if (maxAllowedRuleLevelForMerging != null)
        'MaxAllowedRuleLevelForMerging': maxAllowedRuleLevelForMerging,
      if (status != null) 'Status': status.value,
    };
  }
}

/// The data store response.
class DataStoreResponse {
  /// True if data store is enabled for this domain
  final bool? enabled;
  final Readiness? readiness;

  DataStoreResponse({
    this.enabled,
    this.readiness,
  });

  factory DataStoreResponse.fromJson(Map<String, dynamic> json) {
    return DataStoreResponse(
      enabled: json['Enabled'] as bool?,
      readiness: json['Readiness'] != null
          ? Readiness.fromJson(json['Readiness'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final readiness = this.readiness;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (readiness != null) 'Readiness': readiness,
    };
  }
}

/// Information indicating if the Calculated Attribute is ready for use by
/// confirming all historical data has been processed and reflected.
class Readiness {
  /// Any customer messaging.
  final String? message;

  /// Approximately how far the Calculated Attribute creation is from completion.
  final int? progressPercentage;

  Readiness({
    this.message,
    this.progressPercentage,
  });

  factory Readiness.fromJson(Map<String, dynamic> json) {
    return Readiness(
      message: json['Message'] as String?,
      progressPercentage: json['ProgressPercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final progressPercentage = this.progressPercentage;
    return {
      if (message != null) 'Message': message,
      if (progressPercentage != null) 'ProgressPercentage': progressPercentage,
    };
  }
}

class RuleBasedMatchingStatus {
  static const pending = RuleBasedMatchingStatus._('PENDING');
  static const inProgress = RuleBasedMatchingStatus._('IN_PROGRESS');
  static const active = RuleBasedMatchingStatus._('ACTIVE');

  final String value;

  const RuleBasedMatchingStatus._(this.value);

  static const values = [pending, inProgress, active];

  static RuleBasedMatchingStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleBasedMatchingStatus._(value));

  @override
  bool operator ==(other) =>
      other is RuleBasedMatchingStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration information about the <code>AttributeTypesSelector
/// </code>where the rule-based identity resolution uses to match profiles. You
/// can choose how profiles are compared across attribute types and which
/// attribute to use for matching from each type. There are three attribute
/// types you can configure:
///
/// <ul>
/// <li>
/// Email type
///
/// <ul>
/// <li>
/// You can choose from <code>Email</code>, <code>BusinessEmail</code>, and
/// <code>PersonalEmail</code>
/// </li>
/// </ul> </li>
/// <li>
/// Phone number type
///
/// <ul>
/// <li>
/// You can choose from <code>Phone</code>, <code>HomePhone</code>, and
/// <code>MobilePhone</code>
/// </li>
/// </ul> </li>
/// <li>
/// Address type
///
/// <ul>
/// <li>
/// You can choose from <code>Address</code>, <code>BusinessAddress</code>,
/// <code>MaillingAddress</code>, and <code>ShippingAddress</code>
/// </li>
/// </ul> </li>
/// </ul>
/// You can either choose <code>ONE_TO_ONE</code> or <code>MANY_TO_MANY</code>
/// as the <code>AttributeMatchingModel</code>. When choosing
/// <code>MANY_TO_MANY</code>, the system can match attribute across the
/// sub-types of an attribute type. For example, if the value of the
/// <code>Email</code> field of Profile A and the value of
/// <code>BusinessEmail</code> field of Profile B matches, the two profiles are
/// matched on the Email type. When choosing <code>ONE_TO_ONE</code> the system
/// can only match if the sub-types are exact matches. For example, only when
/// the value of the <code>Email</code> field of Profile A and the value of the
/// <code>Email</code> field of Profile B matches, the two profiles are matched
/// on the Email type.
class AttributeTypesSelector {
  /// Configures the <code>AttributeMatchingModel</code>, you can either choose
  /// <code>ONE_TO_ONE</code> or <code>MANY_TO_MANY</code>.
  final AttributeMatchingModel attributeMatchingModel;

  /// The <code>Address</code> type. You can choose from <code>Address</code>,
  /// <code>BusinessAddress</code>, <code>MaillingAddress</code>, and
  /// <code>ShippingAddress</code>.
  ///
  /// You only can use the Address type in the <code>MatchingRule</code>. For
  /// example, if you want to match profile based on
  /// <code>BusinessAddress.City</code> or <code>MaillingAddress.City</code>, you
  /// need to choose the <code>BusinessAddress</code> and the
  /// <code>MaillingAddress</code> to represent the Address type and specify the
  /// <code>Address.City</code> on the matching rule.
  final List<String>? address;

  /// The <code>Email</code> type. You can choose from <code>EmailAddress</code>,
  /// <code>BusinessEmailAddress</code> and <code>PersonalEmailAddress</code>.
  ///
  /// You only can use the <code>EmailAddress</code> type in the
  /// <code>MatchingRule</code>. For example, if you want to match profile based
  /// on <code>PersonalEmailAddress</code> or <code>BusinessEmailAddress</code>,
  /// you need to choose the <code>PersonalEmailAddress</code> and the
  /// <code>BusinessEmailAddress</code> to represent the <code>EmailAddress</code>
  /// type and only specify the <code>EmailAddress</code> on the matching rule.
  final List<String>? emailAddress;

  /// The <code>PhoneNumber</code> type. You can choose from
  /// <code>PhoneNumber</code>, <code>HomePhoneNumber</code>, and
  /// <code>MobilePhoneNumber</code>.
  ///
  /// You only can use the <code>PhoneNumber</code> type in the
  /// <code>MatchingRule</code>. For example, if you want to match a profile based
  /// on <code>Phone</code> or <code>HomePhone</code>, you need to choose the
  /// <code>Phone</code> and the <code>HomePhone</code> to represent the
  /// <code>PhoneNumber</code> type and only specify the <code>PhoneNumber</code>
  /// on the matching rule.
  final List<String>? phoneNumber;

  AttributeTypesSelector({
    required this.attributeMatchingModel,
    this.address,
    this.emailAddress,
    this.phoneNumber,
  });

  factory AttributeTypesSelector.fromJson(Map<String, dynamic> json) {
    return AttributeTypesSelector(
      attributeMatchingModel: AttributeMatchingModel.fromString(
          (json['AttributeMatchingModel'] as String?) ?? ''),
      address:
          (json['Address'] as List?)?.nonNulls.map((e) => e as String).toList(),
      emailAddress: (json['EmailAddress'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      phoneNumber: (json['PhoneNumber'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeMatchingModel = this.attributeMatchingModel;
    final address = this.address;
    final emailAddress = this.emailAddress;
    final phoneNumber = this.phoneNumber;
    return {
      'AttributeMatchingModel': attributeMatchingModel.value,
      if (address != null) 'Address': address,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

/// How the auto-merging process should resolve conflicts between different
/// profiles.
class ConflictResolution {
  /// How the auto-merging process should resolve conflicts between different
  /// profiles.
  ///
  /// <ul>
  /// <li>
  /// <code>RECENCY</code>: Uses the data that was most recently updated.
  /// </li>
  /// <li>
  /// <code>SOURCE</code>: Uses the data from a specific source. For example, if a
  /// company has been aquired or two departments have merged, data from the
  /// specified source is used. If two duplicate profiles are from the same
  /// source, then <code>RECENCY</code> is used again.
  /// </li>
  /// </ul>
  final ConflictResolvingModel conflictResolvingModel;

  /// The <code>ObjectType</code> name that is used to resolve profile merging
  /// conflicts when choosing <code>SOURCE</code> as the
  /// <code>ConflictResolvingModel</code>.
  final String? sourceName;

  ConflictResolution({
    required this.conflictResolvingModel,
    this.sourceName,
  });

  factory ConflictResolution.fromJson(Map<String, dynamic> json) {
    return ConflictResolution(
      conflictResolvingModel: ConflictResolvingModel.fromString(
          (json['ConflictResolvingModel'] as String?) ?? ''),
      sourceName: json['SourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conflictResolvingModel = this.conflictResolvingModel;
    final sourceName = this.sourceName;
    return {
      'ConflictResolvingModel': conflictResolvingModel.value,
      if (sourceName != null) 'SourceName': sourceName,
    };
  }
}

/// Configuration information about the S3 bucket where Identity Resolution Jobs
/// writes result files.
/// <note>
/// You need to give Customer Profiles service principal write permission to
/// your S3 bucket. Otherwise, you'll get an exception in the API response. For
/// an example policy, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/cross-service-confused-deputy-prevention.html#customer-profiles-cross-service">Amazon
/// Connect Customer Profiles cross-service confused deputy prevention</a>.
/// </note>
class ExportingConfig {
  /// The S3 location where Identity Resolution Jobs write result files.
  final S3ExportingConfig? s3Exporting;

  ExportingConfig({
    this.s3Exporting,
  });

  factory ExportingConfig.fromJson(Map<String, dynamic> json) {
    return ExportingConfig(
      s3Exporting: json['S3Exporting'] != null
          ? S3ExportingConfig.fromJson(
              json['S3Exporting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Exporting = this.s3Exporting;
    return {
      if (s3Exporting != null) 'S3Exporting': s3Exporting,
    };
  }
}

/// Configuration information about the S3 bucket where Identity Resolution Jobs
/// write result files.
class S3ExportingConfig {
  /// The name of the S3 bucket where Identity Resolution Jobs write result files.
  final String s3BucketName;

  /// The S3 key name of the location where Identity Resolution Jobs write result
  /// files.
  final String? s3KeyName;

  S3ExportingConfig({
    required this.s3BucketName,
    this.s3KeyName,
  });

  factory S3ExportingConfig.fromJson(Map<String, dynamic> json) {
    return S3ExportingConfig(
      s3BucketName: (json['S3BucketName'] as String?) ?? '',
      s3KeyName: json['S3KeyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final s3KeyName = this.s3KeyName;
    return {
      'S3BucketName': s3BucketName,
      if (s3KeyName != null) 'S3KeyName': s3KeyName,
    };
  }
}

class ConflictResolvingModel {
  static const recency = ConflictResolvingModel._('RECENCY');
  static const source = ConflictResolvingModel._('SOURCE');

  final String value;

  const ConflictResolvingModel._(this.value);

  static const values = [recency, source];

  static ConflictResolvingModel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConflictResolvingModel._(value));

  @override
  bool operator ==(other) =>
      other is ConflictResolvingModel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AttributeMatchingModel {
  static const oneToOne = AttributeMatchingModel._('ONE_TO_ONE');
  static const manyToMany = AttributeMatchingModel._('MANY_TO_MANY');

  final String value;

  const AttributeMatchingModel._(this.value);

  static const values = [oneToOne, manyToMany];

  static AttributeMatchingModel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttributeMatchingModel._(value));

  @override
  bool operator ==(other) =>
      other is AttributeMatchingModel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies how does the rule-based matching process should match profiles.
/// You can choose from the following attributes to build the matching Rule:
///
/// <ul>
/// <li>
/// AccountNumber
/// </li>
/// <li>
/// Address.Address
/// </li>
/// <li>
/// Address.City
/// </li>
/// <li>
/// Address.Country
/// </li>
/// <li>
/// Address.County
/// </li>
/// <li>
/// Address.PostalCode
/// </li>
/// <li>
/// Address.State
/// </li>
/// <li>
/// Address.Province
/// </li>
/// <li>
/// BirthDate
/// </li>
/// <li>
/// BusinessName
/// </li>
/// <li>
/// EmailAddress
/// </li>
/// <li>
/// FirstName
/// </li>
/// <li>
/// Gender
/// </li>
/// <li>
/// LastName
/// </li>
/// <li>
/// MiddleName
/// </li>
/// <li>
/// PhoneNumber
/// </li>
/// <li>
/// Any customized profile attributes that start with the
/// <code>Attributes</code>
/// </li>
/// </ul>
class MatchingRule {
  /// A single rule level of the <code>MatchRules</code>. Configures how the
  /// rule-based matching process should match profiles.
  final List<String> rule;

  MatchingRule({
    required this.rule,
  });

  factory MatchingRule.fromJson(Map<String, dynamic> json) {
    return MatchingRule(
      rule: ((json['Rule'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    return {
      'Rule': rule,
    };
  }
}

/// The day and time when do you want to start the Identity Resolution Job every
/// week.
class JobSchedule {
  /// The day when the Identity Resolution Job should run every week.
  final JobScheduleDayOfTheWeek dayOfTheWeek;

  /// The time when the Identity Resolution Job should run every week.
  final String time;

  JobSchedule({
    required this.dayOfTheWeek,
    required this.time,
  });

  factory JobSchedule.fromJson(Map<String, dynamic> json) {
    return JobSchedule(
      dayOfTheWeek: JobScheduleDayOfTheWeek.fromString(
          (json['DayOfTheWeek'] as String?) ?? ''),
      time: (json['Time'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dayOfTheWeek = this.dayOfTheWeek;
    final time = this.time;
    return {
      'DayOfTheWeek': dayOfTheWeek.value,
      'Time': time,
    };
  }
}

/// Configuration settings for how to perform the auto-merging of profiles.
class AutoMerging {
  /// The flag that enables the auto-merging of duplicate profiles.
  final bool enabled;

  /// How the auto-merging process should resolve conflicts between different
  /// profiles. For example, if Profile A and Profile B have the same
  /// <code>FirstName</code> and <code>LastName</code> (and that is the matching
  /// criteria), which <code>EmailAddress</code> should be used?
  final ConflictResolution? conflictResolution;

  /// A list of matching attributes that represent matching criteria. If two
  /// profiles meet at least one of the requirements in the matching attributes
  /// list, they will be merged.
  final Consolidation? consolidation;

  /// A number between 0 and 1 that represents the minimum confidence score
  /// required for profiles within a matching group to be merged during the
  /// auto-merge process. A higher score means higher similarity required to merge
  /// profiles.
  final double? minAllowedConfidenceScoreForMerging;

  AutoMerging({
    required this.enabled,
    this.conflictResolution,
    this.consolidation,
    this.minAllowedConfidenceScoreForMerging,
  });

  factory AutoMerging.fromJson(Map<String, dynamic> json) {
    return AutoMerging(
      enabled: (json['Enabled'] as bool?) ?? false,
      conflictResolution: json['ConflictResolution'] != null
          ? ConflictResolution.fromJson(
              json['ConflictResolution'] as Map<String, dynamic>)
          : null,
      consolidation: json['Consolidation'] != null
          ? Consolidation.fromJson(
              json['Consolidation'] as Map<String, dynamic>)
          : null,
      minAllowedConfidenceScoreForMerging:
          json['MinAllowedConfidenceScoreForMerging'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final conflictResolution = this.conflictResolution;
    final consolidation = this.consolidation;
    final minAllowedConfidenceScoreForMerging =
        this.minAllowedConfidenceScoreForMerging;
    return {
      'Enabled': enabled,
      if (conflictResolution != null) 'ConflictResolution': conflictResolution,
      if (consolidation != null) 'Consolidation': consolidation,
      if (minAllowedConfidenceScoreForMerging != null)
        'MinAllowedConfidenceScoreForMerging':
            minAllowedConfidenceScoreForMerging,
    };
  }
}

/// The matching criteria to be used during the auto-merging process.
class Consolidation {
  /// A list of matching criteria.
  final List<List<String>> matchingAttributesList;

  Consolidation({
    required this.matchingAttributesList,
  });

  factory Consolidation.fromJson(Map<String, dynamic> json) {
    return Consolidation(
      matchingAttributesList:
          ((json['MatchingAttributesList'] as List?) ?? const [])
              .nonNulls
              .map((e) => (e as List).nonNulls.map((e) => e as String).toList())
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final matchingAttributesList = this.matchingAttributesList;
    return {
      'MatchingAttributesList': matchingAttributesList,
    };
  }
}

class JobScheduleDayOfTheWeek {
  static const sunday = JobScheduleDayOfTheWeek._('SUNDAY');
  static const monday = JobScheduleDayOfTheWeek._('MONDAY');
  static const tuesday = JobScheduleDayOfTheWeek._('TUESDAY');
  static const wednesday = JobScheduleDayOfTheWeek._('WEDNESDAY');
  static const thursday = JobScheduleDayOfTheWeek._('THURSDAY');
  static const friday = JobScheduleDayOfTheWeek._('FRIDAY');
  static const saturday = JobScheduleDayOfTheWeek._('SATURDAY');

  final String value;

  const JobScheduleDayOfTheWeek._(this.value);

  static const values = [
    sunday,
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday
  ];

  static JobScheduleDayOfTheWeek fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobScheduleDayOfTheWeek._(value));

  @override
  bool operator ==(other) =>
      other is JobScheduleDayOfTheWeek && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The flag that enables the matching process of duplicate profiles.
class MatchingRequest {
  /// The flag that enables the matching process of duplicate profiles.
  final bool enabled;

  /// Configuration information about the auto-merging process.
  final AutoMerging? autoMerging;

  /// Configuration information for exporting Identity Resolution results, for
  /// example, to an S3 bucket.
  final ExportingConfig? exportingConfig;

  /// The day and time when do you want to start the Identity Resolution Job every
  /// week.
  final JobSchedule? jobSchedule;

  MatchingRequest({
    required this.enabled,
    this.autoMerging,
    this.exportingConfig,
    this.jobSchedule,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final autoMerging = this.autoMerging;
    final exportingConfig = this.exportingConfig;
    final jobSchedule = this.jobSchedule;
    return {
      'Enabled': enabled,
      if (autoMerging != null) 'AutoMerging': autoMerging,
      if (exportingConfig != null) 'ExportingConfig': exportingConfig,
      if (jobSchedule != null) 'JobSchedule': jobSchedule,
    };
  }
}

/// The request to enable the rule-based matching.
class RuleBasedMatchingRequest {
  /// The flag that enables the rule-based matching process of duplicate profiles.
  final bool enabled;

  /// Configures information about the <code>AttributeTypesSelector</code> where
  /// the rule-based identity resolution uses to match profiles.
  final AttributeTypesSelector? attributeTypesSelector;
  final ConflictResolution? conflictResolution;
  final ExportingConfig? exportingConfig;

  /// Configures how the rule-based matching process should match profiles. You
  /// can have up to 15 <code>MatchingRule</code> in the
  /// <code>MatchingRules</code>.
  final List<MatchingRule>? matchingRules;

  /// Indicates the maximum allowed rule level.
  final int? maxAllowedRuleLevelForMatching;

  /// <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_MatchingRule.html">MatchingRule</a>
  final int? maxAllowedRuleLevelForMerging;

  RuleBasedMatchingRequest({
    required this.enabled,
    this.attributeTypesSelector,
    this.conflictResolution,
    this.exportingConfig,
    this.matchingRules,
    this.maxAllowedRuleLevelForMatching,
    this.maxAllowedRuleLevelForMerging,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final attributeTypesSelector = this.attributeTypesSelector;
    final conflictResolution = this.conflictResolution;
    final exportingConfig = this.exportingConfig;
    final matchingRules = this.matchingRules;
    final maxAllowedRuleLevelForMatching = this.maxAllowedRuleLevelForMatching;
    final maxAllowedRuleLevelForMerging = this.maxAllowedRuleLevelForMerging;
    return {
      'Enabled': enabled,
      if (attributeTypesSelector != null)
        'AttributeTypesSelector': attributeTypesSelector,
      if (conflictResolution != null) 'ConflictResolution': conflictResolution,
      if (exportingConfig != null) 'ExportingConfig': exportingConfig,
      if (matchingRules != null) 'MatchingRules': matchingRules,
      if (maxAllowedRuleLevelForMatching != null)
        'MaxAllowedRuleLevelForMatching': maxAllowedRuleLevelForMatching,
      if (maxAllowedRuleLevelForMerging != null)
        'MaxAllowedRuleLevelForMerging': maxAllowedRuleLevelForMerging,
    };
  }
}

/// The data store request.
class DataStoreRequest {
  /// Enabled: Set to true to enabled data store for this domain.
  final bool? enabled;

  DataStoreRequest({
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

class Statistic {
  static const firstOccurrence = Statistic._('FIRST_OCCURRENCE');
  static const lastOccurrence = Statistic._('LAST_OCCURRENCE');
  static const count = Statistic._('COUNT');
  static const sum = Statistic._('SUM');
  static const minimum = Statistic._('MINIMUM');
  static const maximum = Statistic._('MAXIMUM');
  static const average = Statistic._('AVERAGE');
  static const maxOccurrence = Statistic._('MAX_OCCURRENCE');

  final String value;

  const Statistic._(this.value);

  static const values = [
    firstOccurrence,
    lastOccurrence,
    count,
    sum,
    minimum,
    maximum,
    average,
    maxOccurrence
  ];

  static Statistic fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Statistic._(value));

  @override
  bool operator ==(other) => other is Statistic && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The conditions including range, object count, and threshold for the
/// calculated attribute.
class Conditions {
  /// The number of profile objects used for the calculated attribute.
  final int? objectCount;

  /// The relative time period over which data is included in the aggregation.
  final Range? range;

  /// The threshold for the calculated attribute.
  final Threshold? threshold;

  Conditions({
    this.objectCount,
    this.range,
    this.threshold,
  });

  factory Conditions.fromJson(Map<String, dynamic> json) {
    return Conditions(
      objectCount: json['ObjectCount'] as int?,
      range: json['Range'] != null
          ? Range.fromJson(json['Range'] as Map<String, dynamic>)
          : null,
      threshold: json['Threshold'] != null
          ? Threshold.fromJson(json['Threshold'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final objectCount = this.objectCount;
    final range = this.range;
    final threshold = this.threshold;
    return {
      if (objectCount != null) 'ObjectCount': objectCount,
      if (range != null) 'Range': range,
      if (threshold != null) 'Threshold': threshold,
    };
  }
}

/// Mathematical expression and a list of attribute items specified in that
/// expression.
class AttributeDetails {
  /// A list of attribute items specified in the mathematical expression.
  final List<AttributeItem> attributes;

  /// Mathematical expression that is performed on attribute items provided in the
  /// attribute list. Each element in the expression should follow the structure
  /// of \"{ObjectTypeName.AttributeName}\".
  final String expression;

  AttributeDetails({
    required this.attributes,
    required this.expression,
  });

  factory AttributeDetails.fromJson(Map<String, dynamic> json) {
    return AttributeDetails(
      attributes: ((json['Attributes'] as List?) ?? const [])
          .nonNulls
          .map((e) => AttributeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      expression: (json['Expression'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final expression = this.expression;
    return {
      'Attributes': attributes,
      'Expression': expression,
    };
  }
}

class ReadinessStatus {
  static const preparing = ReadinessStatus._('PREPARING');
  static const inProgress = ReadinessStatus._('IN_PROGRESS');
  static const completed = ReadinessStatus._('COMPLETED');
  static const failed = ReadinessStatus._('FAILED');

  final String value;

  const ReadinessStatus._(this.value);

  static const values = [preparing, inProgress, completed, failed];

  static ReadinessStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReadinessStatus._(value));

  @override
  bool operator ==(other) => other is ReadinessStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a single attribute item specified in the mathematical
/// expression.
class AttributeItem {
  /// The name of an attribute defined in a profile object type.
  final String name;

  AttributeItem({
    required this.name,
  });

  factory AttributeItem.fromJson(Map<String, dynamic> json) {
    return AttributeItem(
      name: (json['Name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

/// The relative time period over which data is included in the aggregation.
class Range {
  /// The format the timestamp field in your JSON object is specified. This value
  /// should be one of EPOCHMILLI (for Unix epoch timestamps with
  /// second/millisecond level precision) or ISO_8601 (following ISO_8601 format
  /// with second/millisecond level precision, with an optional offset of Z or in
  /// the format HH:MM or HHMM.). E.g. if your object type is MyType and source
  /// JSON is {"generatedAt": {"timestamp": "2001-07-04T12:08:56.235-0700"}}, then
  /// TimestampFormat should be "ISO_8601".
  final String? timestampFormat;

  /// An expression specifying the field in your JSON object from which the date
  /// should be parsed. The expression should follow the structure of
  /// \"{ObjectTypeName.<Location of timestamp field in JSON pointer format>}\".
  /// E.g. if your object type is MyType and source JSON is {"generatedAt":
  /// {"timestamp": "1737587945945"}}, then TimestampSource should be
  /// "{MyType.generatedAt.timestamp}".
  final String? timestampSource;

  /// The unit of time.
  final Unit? unit;

  /// The amount of time of the specified unit.
  final int? value;

  /// A structure letting customers specify a relative time window over which over
  /// which data is included in the Calculated Attribute. Use positive numbers to
  /// indicate that the endpoint is in the past, and negative numbers to indicate
  /// it is in the future. ValueRange overrides Value.
  final ValueRange? valueRange;

  Range({
    this.timestampFormat,
    this.timestampSource,
    this.unit,
    this.value,
    this.valueRange,
  });

  factory Range.fromJson(Map<String, dynamic> json) {
    return Range(
      timestampFormat: json['TimestampFormat'] as String?,
      timestampSource: json['TimestampSource'] as String?,
      unit: (json['Unit'] as String?)?.let(Unit.fromString),
      value: json['Value'] as int?,
      valueRange: json['ValueRange'] != null
          ? ValueRange.fromJson(json['ValueRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final timestampFormat = this.timestampFormat;
    final timestampSource = this.timestampSource;
    final unit = this.unit;
    final value = this.value;
    final valueRange = this.valueRange;
    return {
      if (timestampFormat != null) 'TimestampFormat': timestampFormat,
      if (timestampSource != null) 'TimestampSource': timestampSource,
      if (unit != null) 'Unit': unit.value,
      if (value != null) 'Value': value,
      if (valueRange != null) 'ValueRange': valueRange,
    };
  }
}

/// The threshold for the calculated attribute.
class Threshold {
  /// The operator of the threshold.
  final Operator operator;

  /// The value of the threshold.
  final String value;

  Threshold({
    required this.operator,
    required this.value,
  });

  factory Threshold.fromJson(Map<String, dynamic> json) {
    return Threshold(
      operator: Operator.fromString((json['Operator'] as String?) ?? ''),
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final operator = this.operator;
    final value = this.value;
    return {
      'Operator': operator.value,
      'Value': value,
    };
  }
}

class Operator {
  static const equalTo = Operator._('EQUAL_TO');
  static const greaterThan = Operator._('GREATER_THAN');
  static const lessThan = Operator._('LESS_THAN');
  static const notEqualTo = Operator._('NOT_EQUAL_TO');

  final String value;

  const Operator._(this.value);

  static const values = [equalTo, greaterThan, lessThan, notEqualTo];

  static Operator fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Operator._(value));

  @override
  bool operator ==(other) => other is Operator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Unit {
  static const days = Unit._('DAYS');

  final String value;

  const Unit._(this.value);

  static const values = [days];

  static Unit fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Unit._(value));

  @override
  bool operator ==(other) => other is Unit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure letting customers specify a relative time window over which over
/// which data is included in the Calculated Attribute. Use positive numbers to
/// indicate that the endpoint is in the past, and negative numbers to indicate
/// it is in the future. ValueRange overrides Value.
class ValueRange {
  /// The end time of when to include objects. Use positive numbers to indicate
  /// that the starting point is in the past, and negative numbers to indicate it
  /// is in the future.
  final int end;

  /// The start time of when to include objects. Use positive numbers to indicate
  /// that the starting point is in the past, and negative numbers to indicate it
  /// is in the future.
  final int start;

  ValueRange({
    required this.end,
    required this.start,
  });

  factory ValueRange.fromJson(Map<String, dynamic> json) {
    return ValueRange(
      end: (json['End'] as int?) ?? 0,
      start: (json['Start'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      'End': end,
      'Start': start,
    };
  }
}

/// The standard profile of a customer.
class Profile {
  /// An account number that you have assigned to the customer.
  final String? accountNumber;

  /// Any additional information relevant to the customer’s profile.
  final String? additionalInformation;

  /// A generic address associated with the customer that is not mailing,
  /// shipping, or billing.
  final Address? address;

  /// A key value pair of attributes of a customer profile.
  final Map<String, String>? attributes;

  /// The customer’s billing address.
  final Address? billingAddress;

  /// The customer’s birth date.
  final String? birthDate;

  /// The customer’s business email address.
  final String? businessEmailAddress;

  /// The name of the customer’s business.
  final String? businessName;

  /// The customer’s home phone number.
  final String? businessPhoneNumber;

  /// The customer’s email address, which has not been specified as a personal or
  /// business address.
  final String? emailAddress;

  /// The customer or account’s engagement preferences.
  final EngagementPreferences? engagementPreferences;

  /// The customer’s first name.
  final String? firstName;

  /// A list of items used to find a profile returned in a <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_SearchProfiles.html">SearchProfiles</a>
  /// response. An item is a key-value(s) pair that matches an attribute in the
  /// profile.
  ///
  /// If the optional <code>AdditionalSearchKeys</code> parameter was included in
  /// the <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_SearchProfiles.html">SearchProfiles</a>
  /// request, the <code>FoundByItems</code> list should be interpreted based on
  /// the <code>LogicalOperator</code> used in the request:
  ///
  /// <ul>
  /// <li>
  /// <code>AND</code> - The profile included in the response matched all of the
  /// search keys specified in the request. The <code>FoundByItems</code> will
  /// include all of the key-value(s) pairs that were specified in the request (as
  /// this is a requirement of <code>AND</code> search logic).
  /// </li>
  /// <li>
  /// <code>OR</code> - The profile included in the response matched at least one
  /// of the search keys specified in the request. The <code>FoundByItems</code>
  /// will include each of the key-value(s) pairs that the profile was found by.
  /// </li>
  /// </ul>
  /// The <code>OR</code> relationship is the default behavior if the
  /// <code>LogicalOperator</code> parameter is not included in the <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_SearchProfiles.html">SearchProfiles</a>
  /// request.
  final List<FoundByKeyValue>? foundByItems;

  /// The gender with which the customer identifies.
  final Gender? gender;

  /// An alternative to Gender which accepts any string as input.
  final String? genderString;

  /// The customer’s home phone number.
  final String? homePhoneNumber;

  /// The customer’s last name.
  final String? lastName;

  /// The customer’s mailing address.
  final Address? mailingAddress;

  /// The customer’s middle name.
  final String? middleName;

  /// The customer’s mobile phone number.
  final String? mobilePhoneNumber;

  /// The type of profile used to describe the customer.
  final PartyType? partyType;

  /// An alternative to PartyType which accepts any string as input.
  final String? partyTypeString;

  /// The customer’s personal email address.
  final String? personalEmailAddress;

  /// The customer's phone number, which has not been specified as a mobile, home,
  /// or business number.
  final String? phoneNumber;

  /// The unique identifier of a customer profile.
  final String? profileId;

  /// The type of the profile.
  final ProfileType? profileType;

  /// The customer’s shipping address.
  final Address? shippingAddress;

  Profile({
    this.accountNumber,
    this.additionalInformation,
    this.address,
    this.attributes,
    this.billingAddress,
    this.birthDate,
    this.businessEmailAddress,
    this.businessName,
    this.businessPhoneNumber,
    this.emailAddress,
    this.engagementPreferences,
    this.firstName,
    this.foundByItems,
    this.gender,
    this.genderString,
    this.homePhoneNumber,
    this.lastName,
    this.mailingAddress,
    this.middleName,
    this.mobilePhoneNumber,
    this.partyType,
    this.partyTypeString,
    this.personalEmailAddress,
    this.phoneNumber,
    this.profileId,
    this.profileType,
    this.shippingAddress,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      accountNumber: json['AccountNumber'] as String?,
      additionalInformation: json['AdditionalInformation'] as String?,
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      billingAddress: json['BillingAddress'] != null
          ? Address.fromJson(json['BillingAddress'] as Map<String, dynamic>)
          : null,
      birthDate: json['BirthDate'] as String?,
      businessEmailAddress: json['BusinessEmailAddress'] as String?,
      businessName: json['BusinessName'] as String?,
      businessPhoneNumber: json['BusinessPhoneNumber'] as String?,
      emailAddress: json['EmailAddress'] as String?,
      engagementPreferences: json['EngagementPreferences'] != null
          ? EngagementPreferences.fromJson(
              json['EngagementPreferences'] as Map<String, dynamic>)
          : null,
      firstName: json['FirstName'] as String?,
      foundByItems: (json['FoundByItems'] as List?)
          ?.nonNulls
          .map((e) => FoundByKeyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      gender: (json['Gender'] as String?)?.let(Gender.fromString),
      genderString: json['GenderString'] as String?,
      homePhoneNumber: json['HomePhoneNumber'] as String?,
      lastName: json['LastName'] as String?,
      mailingAddress: json['MailingAddress'] != null
          ? Address.fromJson(json['MailingAddress'] as Map<String, dynamic>)
          : null,
      middleName: json['MiddleName'] as String?,
      mobilePhoneNumber: json['MobilePhoneNumber'] as String?,
      partyType: (json['PartyType'] as String?)?.let(PartyType.fromString),
      partyTypeString: json['PartyTypeString'] as String?,
      personalEmailAddress: json['PersonalEmailAddress'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      profileId: json['ProfileId'] as String?,
      profileType:
          (json['ProfileType'] as String?)?.let(ProfileType.fromString),
      shippingAddress: json['ShippingAddress'] != null
          ? Address.fromJson(json['ShippingAddress'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountNumber = this.accountNumber;
    final additionalInformation = this.additionalInformation;
    final address = this.address;
    final attributes = this.attributes;
    final billingAddress = this.billingAddress;
    final birthDate = this.birthDate;
    final businessEmailAddress = this.businessEmailAddress;
    final businessName = this.businessName;
    final businessPhoneNumber = this.businessPhoneNumber;
    final emailAddress = this.emailAddress;
    final engagementPreferences = this.engagementPreferences;
    final firstName = this.firstName;
    final foundByItems = this.foundByItems;
    final gender = this.gender;
    final genderString = this.genderString;
    final homePhoneNumber = this.homePhoneNumber;
    final lastName = this.lastName;
    final mailingAddress = this.mailingAddress;
    final middleName = this.middleName;
    final mobilePhoneNumber = this.mobilePhoneNumber;
    final partyType = this.partyType;
    final partyTypeString = this.partyTypeString;
    final personalEmailAddress = this.personalEmailAddress;
    final phoneNumber = this.phoneNumber;
    final profileId = this.profileId;
    final profileType = this.profileType;
    final shippingAddress = this.shippingAddress;
    return {
      if (accountNumber != null) 'AccountNumber': accountNumber,
      if (additionalInformation != null)
        'AdditionalInformation': additionalInformation,
      if (address != null) 'Address': address,
      if (attributes != null) 'Attributes': attributes,
      if (billingAddress != null) 'BillingAddress': billingAddress,
      if (birthDate != null) 'BirthDate': birthDate,
      if (businessEmailAddress != null)
        'BusinessEmailAddress': businessEmailAddress,
      if (businessName != null) 'BusinessName': businessName,
      if (businessPhoneNumber != null)
        'BusinessPhoneNumber': businessPhoneNumber,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (engagementPreferences != null)
        'EngagementPreferences': engagementPreferences,
      if (firstName != null) 'FirstName': firstName,
      if (foundByItems != null) 'FoundByItems': foundByItems,
      if (gender != null) 'Gender': gender.value,
      if (genderString != null) 'GenderString': genderString,
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'PartyType': partyType.value,
      if (partyTypeString != null) 'PartyTypeString': partyTypeString,
      if (personalEmailAddress != null)
        'PersonalEmailAddress': personalEmailAddress,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (profileId != null) 'ProfileId': profileId,
      if (profileType != null) 'ProfileType': profileType.value,
      if (shippingAddress != null) 'ShippingAddress': shippingAddress,
    };
  }
}

/// A generic address associated with the customer that is not mailing,
/// shipping, or billing.
class Address {
  /// The first line of a customer address.
  final String? address1;

  /// The second line of a customer address.
  final String? address2;

  /// The third line of a customer address.
  final String? address3;

  /// The fourth line of a customer address.
  final String? address4;

  /// The city in which a customer lives.
  final String? city;

  /// The country in which a customer lives.
  final String? country;

  /// The county in which a customer lives.
  final String? county;

  /// The postal code of a customer address.
  final String? postalCode;

  /// The province in which a customer lives.
  final String? province;

  /// The state in which a customer lives.
  final String? state;

  Address({
    this.address1,
    this.address2,
    this.address3,
    this.address4,
    this.city,
    this.country,
    this.county,
    this.postalCode,
    this.province,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address1: json['Address1'] as String?,
      address2: json['Address2'] as String?,
      address3: json['Address3'] as String?,
      address4: json['Address4'] as String?,
      city: json['City'] as String?,
      country: json['Country'] as String?,
      county: json['County'] as String?,
      postalCode: json['PostalCode'] as String?,
      province: json['Province'] as String?,
      state: json['State'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final address1 = this.address1;
    final address2 = this.address2;
    final address3 = this.address3;
    final address4 = this.address4;
    final city = this.city;
    final country = this.country;
    final county = this.county;
    final postalCode = this.postalCode;
    final province = this.province;
    final state = this.state;
    return {
      if (address1 != null) 'Address1': address1,
      if (address2 != null) 'Address2': address2,
      if (address3 != null) 'Address3': address3,
      if (address4 != null) 'Address4': address4,
      if (city != null) 'City': city,
      if (country != null) 'Country': country,
      if (county != null) 'County': county,
      if (postalCode != null) 'PostalCode': postalCode,
      if (province != null) 'Province': province,
      if (state != null) 'State': state,
    };
  }
}

/// A data type pair that consists of a <code>KeyName</code> and
/// <code>Values</code> list that were used to find a profile returned in
/// response to a <a
/// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_SearchProfiles.html">SearchProfiles</a>
/// request.
class FoundByKeyValue {
  /// A searchable identifier of a customer profile.
  final String? keyName;

  /// A list of key values.
  final List<String>? values;

  FoundByKeyValue({
    this.keyName,
    this.values,
  });

  factory FoundByKeyValue.fromJson(Map<String, dynamic> json) {
    return FoundByKeyValue(
      keyName: json['KeyName'] as String?,
      values:
          (json['Values'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyName = this.keyName;
    final values = this.values;
    return {
      if (keyName != null) 'KeyName': keyName,
      if (values != null) 'Values': values,
    };
  }
}

class LogicalOperator {
  static const and = LogicalOperator._('AND');
  static const or = LogicalOperator._('OR');

  final String value;

  const LogicalOperator._(this.value);

  static const values = [and, or];

  static LogicalOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LogicalOperator._(value));

  @override
  bool operator ==(other) => other is LogicalOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A data type pair that consists of a <code>KeyName</code> and
/// <code>Values</code> list that is used in conjunction with the <a
/// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_SearchProfiles.html#customerprofiles-SearchProfiles-request-KeyName">KeyName</a>
/// and <a
/// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_SearchProfiles.html#customerprofiles-SearchProfiles-request-Values">Values</a>
/// parameters to search for profiles using the <a
/// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_SearchProfiles.html">SearchProfiles</a>
/// API.
class AdditionalSearchKey {
  /// A searchable identifier of a customer profile.
  final String keyName;

  /// A list of key values.
  final List<String> values;

  AdditionalSearchKey({
    required this.keyName,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final keyName = this.keyName;
    final values = this.values;
    return {
      'KeyName': keyName,
      'Values': values,
    };
  }
}

/// An object that defines the Key element of a ProfileObject. A Key is a
/// special element that can be used to search for a customer profile.
class ObjectTypeKey {
  /// The reference for the key name of the fields map.
  final List<String>? fieldNames;

  /// The types of keys that a ProfileObject can have. Each ProfileObject can have
  /// only 1 UNIQUE key but multiple PROFILE keys. PROFILE, ASSET, CASE, or ORDER
  /// means that this key can be used to tie an object to a PROFILE, ASSET, CASE,
  /// or ORDER respectively. UNIQUE means that it can be used to uniquely identify
  /// an object. If a key a is marked as SECONDARY, it will be used to search for
  /// profiles after all other PROFILE keys have been searched. A LOOKUP_ONLY key
  /// is only used to match a profile but is not persisted to be used for
  /// searching of the profile. A NEW_ONLY key is only used if the profile does
  /// not already exist before the object is ingested, otherwise it is only used
  /// for matching objects to profiles.
  final List<StandardIdentifier>? standardIdentifiers;

  ObjectTypeKey({
    this.fieldNames,
    this.standardIdentifiers,
  });

  factory ObjectTypeKey.fromJson(Map<String, dynamic> json) {
    return ObjectTypeKey(
      fieldNames: (json['FieldNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      standardIdentifiers: (json['StandardIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => StandardIdentifier.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldNames = this.fieldNames;
    final standardIdentifiers = this.standardIdentifiers;
    return {
      if (fieldNames != null) 'FieldNames': fieldNames,
      if (standardIdentifiers != null)
        'StandardIdentifiers': standardIdentifiers.map((e) => e.value).toList(),
    };
  }
}

class StandardIdentifier {
  static const profile = StandardIdentifier._('PROFILE');
  static const asset = StandardIdentifier._('ASSET');
  static const $case = StandardIdentifier._('CASE');
  static const device = StandardIdentifier._('DEVICE');
  static const webAnalytics = StandardIdentifier._('WEB_ANALYTICS');
  static const order = StandardIdentifier._('ORDER');
  static const communicationRecord =
      StandardIdentifier._('COMMUNICATION_RECORD');
  static const airPreference = StandardIdentifier._('AIR_PREFERENCE');
  static const hotelPreference = StandardIdentifier._('HOTEL_PREFERENCE');
  static const airBooking = StandardIdentifier._('AIR_BOOKING');
  static const airSegment = StandardIdentifier._('AIR_SEGMENT');
  static const hotelReservation = StandardIdentifier._('HOTEL_RESERVATION');
  static const hotelStayRevenue = StandardIdentifier._('HOTEL_STAY_REVENUE');
  static const loyalty = StandardIdentifier._('LOYALTY');
  static const loyaltyTransaction = StandardIdentifier._('LOYALTY_TRANSACTION');
  static const loyaltyPromotion = StandardIdentifier._('LOYALTY_PROMOTION');
  static const unique = StandardIdentifier._('UNIQUE');
  static const secondary = StandardIdentifier._('SECONDARY');
  static const lookupOnly = StandardIdentifier._('LOOKUP_ONLY');
  static const newOnly = StandardIdentifier._('NEW_ONLY');

  final String value;

  const StandardIdentifier._(this.value);

  static const values = [
    profile,
    asset,
    $case,
    device,
    webAnalytics,
    order,
    communicationRecord,
    airPreference,
    hotelPreference,
    airBooking,
    airSegment,
    hotelReservation,
    hotelStayRevenue,
    loyalty,
    loyaltyTransaction,
    loyaltyPromotion,
    unique,
    secondary,
    lookupOnly,
    newOnly
  ];

  static StandardIdentifier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StandardIdentifier._(value));

  @override
  bool operator ==(other) =>
      other is StandardIdentifier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a field in a ProfileObjectType.
class ObjectTypeField {
  /// The content type of the field. Used for determining equality when searching.
  final FieldContentType? contentType;

  /// A field of a ProfileObject. For example: _source.FirstName, where “_source”
  /// is a ProfileObjectType of a Zendesk user and “FirstName” is a field in that
  /// ObjectType.
  final String? source;

  /// The location of the data in the standard ProfileObject model. For example:
  /// _profile.Address.PostalCode. Do not include sensitive or personally
  /// identifiable information (PII) in the target field name.
  final String? target;

  ObjectTypeField({
    this.contentType,
    this.source,
    this.target,
  });

  factory ObjectTypeField.fromJson(Map<String, dynamic> json) {
    return ObjectTypeField(
      contentType:
          (json['ContentType'] as String?)?.let(FieldContentType.fromString),
      source: json['Source'] as String?,
      target: json['Target'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final source = this.source;
    final target = this.target;
    return {
      if (contentType != null) 'ContentType': contentType.value,
      if (source != null) 'Source': source,
      if (target != null) 'Target': target,
    };
  }
}

class FieldContentType {
  static const string = FieldContentType._('STRING');
  static const number = FieldContentType._('NUMBER');
  static const phoneNumber = FieldContentType._('PHONE_NUMBER');
  static const emailAddress = FieldContentType._('EMAIL_ADDRESS');
  static const name = FieldContentType._('NAME');

  final String value;

  const FieldContentType._(this.value);

  static const values = [string, number, phoneNumber, emailAddress, name];

  static FieldContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FieldContentType._(value));

  @override
  bool operator ==(other) => other is FieldContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Scope {
  static const profile = Scope._('PROFILE');
  static const domain = Scope._('DOMAIN');

  final String value;

  const Scope._(this.value);

  static const values = [profile, domain];

  static Scope fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Scope._(value));

  @override
  bool operator ==(other) => other is Scope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configurations that control how Customer Profiles retrieves data from
/// the source, Amazon AppFlow. Customer Profiles uses this information to
/// create an AppFlow flow on behalf of customers.
class FlowDefinition {
  /// The specified name of the flow. Use underscores (_) or hyphens (-) only.
  /// Spaces are not allowed.
  final String flowName;

  /// The Amazon Resource Name of the AWS Key Management Service (KMS) key you
  /// provide for encryption.
  final String kmsArn;

  /// The configuration that controls how Customer Profiles retrieves data from
  /// the source.
  final SourceFlowConfig sourceFlowConfig;

  /// A list of tasks that Customer Profiles performs while transferring the data
  /// in the flow run.
  final List<Task> tasks;

  /// The trigger settings that determine how and when the flow runs.
  final TriggerConfig triggerConfig;

  /// A description of the flow you want to create.
  final String? description;

  FlowDefinition({
    required this.flowName,
    required this.kmsArn,
    required this.sourceFlowConfig,
    required this.tasks,
    required this.triggerConfig,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final flowName = this.flowName;
    final kmsArn = this.kmsArn;
    final sourceFlowConfig = this.sourceFlowConfig;
    final tasks = this.tasks;
    final triggerConfig = this.triggerConfig;
    final description = this.description;
    return {
      'FlowName': flowName,
      'KmsArn': kmsArn,
      'SourceFlowConfig': sourceFlowConfig,
      'Tasks': tasks,
      'TriggerConfig': triggerConfig,
      if (description != null) 'Description': description,
    };
  }
}

/// Contains information about the configuration of the source connector used in
/// the flow.
class SourceFlowConfig {
  /// The type of connector, such as Salesforce, Marketo, and so on.
  final SourceConnectorType connectorType;

  /// Specifies the information that is required to query a particular source
  /// connector.
  final SourceConnectorProperties sourceConnectorProperties;

  /// The name of the AppFlow connector profile. This name must be unique for each
  /// connector profile in the AWS account.
  final String? connectorProfileName;

  /// Defines the configuration for a scheduled incremental data pull. If a valid
  /// configuration is provided, the fields specified in the configuration are
  /// used when querying for the incremental data pull.
  final IncrementalPullConfig? incrementalPullConfig;

  SourceFlowConfig({
    required this.connectorType,
    required this.sourceConnectorProperties,
    this.connectorProfileName,
    this.incrementalPullConfig,
  });

  Map<String, dynamic> toJson() {
    final connectorType = this.connectorType;
    final sourceConnectorProperties = this.sourceConnectorProperties;
    final connectorProfileName = this.connectorProfileName;
    final incrementalPullConfig = this.incrementalPullConfig;
    return {
      'ConnectorType': connectorType.value,
      'SourceConnectorProperties': sourceConnectorProperties,
      if (connectorProfileName != null)
        'ConnectorProfileName': connectorProfileName,
      if (incrementalPullConfig != null)
        'IncrementalPullConfig': incrementalPullConfig,
    };
  }
}

/// The trigger settings that determine how and when Amazon AppFlow runs the
/// specified flow.
class TriggerConfig {
  /// Specifies the type of flow trigger. It can be OnDemand, Scheduled, or Event.
  final TriggerType triggerType;

  /// Specifies the configuration details of a schedule-triggered flow that you
  /// define. Currently, these settings only apply to the Scheduled trigger type.
  final TriggerProperties? triggerProperties;

  TriggerConfig({
    required this.triggerType,
    this.triggerProperties,
  });

  Map<String, dynamic> toJson() {
    final triggerType = this.triggerType;
    final triggerProperties = this.triggerProperties;
    return {
      'TriggerType': triggerType.value,
      if (triggerProperties != null) 'TriggerProperties': triggerProperties,
    };
  }
}

class TriggerType {
  static const scheduled = TriggerType._('Scheduled');
  static const event = TriggerType._('Event');
  static const onDemand = TriggerType._('OnDemand');

  final String value;

  const TriggerType._(this.value);

  static const values = [scheduled, event, onDemand];

  static TriggerType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TriggerType._(value));

  @override
  bool operator ==(other) => other is TriggerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the configuration details that control the trigger for a flow.
/// Currently, these settings only apply to the Scheduled trigger type.
class TriggerProperties {
  /// Specifies the configuration details of a schedule-triggered flow that you
  /// define.
  final ScheduledTriggerProperties? scheduled;

  TriggerProperties({
    this.scheduled,
  });

  Map<String, dynamic> toJson() {
    final scheduled = this.scheduled;
    return {
      if (scheduled != null) 'Scheduled': scheduled,
    };
  }
}

/// Specifies the configuration details of a scheduled-trigger flow that you
/// define. Currently, these settings only apply to the scheduled-trigger type.
class ScheduledTriggerProperties {
  /// The scheduling expression that determines the rate at which the schedule
  /// will run, for example rate (5 minutes).
  final String scheduleExpression;

  /// Specifies whether a scheduled flow has an incremental data transfer or a
  /// complete data transfer for each flow run.
  final DataPullMode? dataPullMode;

  /// Specifies the date range for the records to import from the connector in the
  /// first flow run.
  final DateTime? firstExecutionFrom;

  /// Specifies the scheduled end time for a scheduled-trigger flow.
  final DateTime? scheduleEndTime;

  /// Specifies the optional offset that is added to the time interval for a
  /// schedule-triggered flow.
  final int? scheduleOffset;

  /// Specifies the scheduled start time for a scheduled-trigger flow.
  final DateTime? scheduleStartTime;

  /// Specifies the time zone used when referring to the date and time of a
  /// scheduled-triggered flow, such as America/New_York.
  final String? timezone;

  ScheduledTriggerProperties({
    required this.scheduleExpression,
    this.dataPullMode,
    this.firstExecutionFrom,
    this.scheduleEndTime,
    this.scheduleOffset,
    this.scheduleStartTime,
    this.timezone,
  });

  Map<String, dynamic> toJson() {
    final scheduleExpression = this.scheduleExpression;
    final dataPullMode = this.dataPullMode;
    final firstExecutionFrom = this.firstExecutionFrom;
    final scheduleEndTime = this.scheduleEndTime;
    final scheduleOffset = this.scheduleOffset;
    final scheduleStartTime = this.scheduleStartTime;
    final timezone = this.timezone;
    return {
      'ScheduleExpression': scheduleExpression,
      if (dataPullMode != null) 'DataPullMode': dataPullMode.value,
      if (firstExecutionFrom != null)
        'FirstExecutionFrom': unixTimestampToJson(firstExecutionFrom),
      if (scheduleEndTime != null)
        'ScheduleEndTime': unixTimestampToJson(scheduleEndTime),
      if (scheduleOffset != null) 'ScheduleOffset': scheduleOffset,
      if (scheduleStartTime != null)
        'ScheduleStartTime': unixTimestampToJson(scheduleStartTime),
      if (timezone != null) 'Timezone': timezone,
    };
  }
}

class DataPullMode {
  static const incremental = DataPullMode._('Incremental');
  static const complete = DataPullMode._('Complete');

  final String value;

  const DataPullMode._(this.value);

  static const values = [incremental, complete];

  static DataPullMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DataPullMode._(value));

  @override
  bool operator ==(other) => other is DataPullMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A class for modeling different type of tasks. Task implementation varies
/// based on the TaskType.
class Task {
  /// The source fields to which a particular task is applied.
  final List<String> sourceFields;

  /// Specifies the particular task implementation that Amazon AppFlow performs.
  final TaskType taskType;

  /// The operation to be performed on the provided source fields.
  final ConnectorOperator? connectorOperator;

  /// A field in a destination connector, or a field value against which Amazon
  /// AppFlow validates a source field.
  final String? destinationField;

  /// A map used to store task-related information. The service looks for
  /// particular information based on the TaskType.
  final Map<OperatorPropertiesKeys, String>? taskProperties;

  Task({
    required this.sourceFields,
    required this.taskType,
    this.connectorOperator,
    this.destinationField,
    this.taskProperties,
  });

  Map<String, dynamic> toJson() {
    final sourceFields = this.sourceFields;
    final taskType = this.taskType;
    final connectorOperator = this.connectorOperator;
    final destinationField = this.destinationField;
    final taskProperties = this.taskProperties;
    return {
      'SourceFields': sourceFields,
      'TaskType': taskType.value,
      if (connectorOperator != null) 'ConnectorOperator': connectorOperator,
      if (destinationField != null) 'DestinationField': destinationField,
      if (taskProperties != null)
        'TaskProperties': taskProperties.map((k, e) => MapEntry(k.value, e)),
    };
  }
}

/// The operation to be performed on the provided source fields.
class ConnectorOperator {
  /// The operation to be performed on the provided Marketo source fields.
  final MarketoConnectorOperator? marketo;

  /// The operation to be performed on the provided Amazon S3 source fields.
  final S3ConnectorOperator? s3;

  /// The operation to be performed on the provided Salesforce source fields.
  final SalesforceConnectorOperator? salesforce;

  /// The operation to be performed on the provided ServiceNow source fields.
  final ServiceNowConnectorOperator? serviceNow;

  /// The operation to be performed on the provided Zendesk source fields.
  final ZendeskConnectorOperator? zendesk;

  ConnectorOperator({
    this.marketo,
    this.s3,
    this.salesforce,
    this.serviceNow,
    this.zendesk,
  });

  Map<String, dynamic> toJson() {
    final marketo = this.marketo;
    final s3 = this.s3;
    final salesforce = this.salesforce;
    final serviceNow = this.serviceNow;
    final zendesk = this.zendesk;
    return {
      if (marketo != null) 'Marketo': marketo.value,
      if (s3 != null) 'S3': s3.value,
      if (salesforce != null) 'Salesforce': salesforce.value,
      if (serviceNow != null) 'ServiceNow': serviceNow.value,
      if (zendesk != null) 'Zendesk': zendesk.value,
    };
  }
}

class TaskType {
  static const arithmetic = TaskType._('Arithmetic');
  static const filter = TaskType._('Filter');
  static const map = TaskType._('Map');
  static const mask = TaskType._('Mask');
  static const merge = TaskType._('Merge');
  static const truncate = TaskType._('Truncate');
  static const validate = TaskType._('Validate');

  final String value;

  const TaskType._(this.value);

  static const values = [
    arithmetic,
    filter,
    map,
    mask,
    merge,
    truncate,
    validate
  ];

  static TaskType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaskType._(value));

  @override
  bool operator ==(other) => other is TaskType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class OperatorPropertiesKeys {
  static const $value = OperatorPropertiesKeys._('VALUE');
  static const $values = OperatorPropertiesKeys._('VALUES');
  static const dataType = OperatorPropertiesKeys._('DATA_TYPE');
  static const upperBound = OperatorPropertiesKeys._('UPPER_BOUND');
  static const lowerBound = OperatorPropertiesKeys._('LOWER_BOUND');
  static const sourceDataType = OperatorPropertiesKeys._('SOURCE_DATA_TYPE');
  static const destinationDataType =
      OperatorPropertiesKeys._('DESTINATION_DATA_TYPE');
  static const validationAction = OperatorPropertiesKeys._('VALIDATION_ACTION');
  static const maskValue = OperatorPropertiesKeys._('MASK_VALUE');
  static const maskLength = OperatorPropertiesKeys._('MASK_LENGTH');
  static const truncateLength = OperatorPropertiesKeys._('TRUNCATE_LENGTH');
  static const mathOperationFieldsOrder =
      OperatorPropertiesKeys._('MATH_OPERATION_FIELDS_ORDER');
  static const concatFormat = OperatorPropertiesKeys._('CONCAT_FORMAT');
  static const subfieldCategoryMap =
      OperatorPropertiesKeys._('SUBFIELD_CATEGORY_MAP');

  final String value;

  const OperatorPropertiesKeys._(this.value);

  static const values = [
    $value,
    $values,
    dataType,
    upperBound,
    lowerBound,
    sourceDataType,
    destinationDataType,
    validationAction,
    maskValue,
    maskLength,
    truncateLength,
    mathOperationFieldsOrder,
    concatFormat,
    subfieldCategoryMap
  ];

  static OperatorPropertiesKeys fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OperatorPropertiesKeys._(value));

  @override
  bool operator ==(other) =>
      other is OperatorPropertiesKeys && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class MarketoConnectorOperator {
  static const projection = MarketoConnectorOperator._('PROJECTION');
  static const lessThan = MarketoConnectorOperator._('LESS_THAN');
  static const greaterThan = MarketoConnectorOperator._('GREATER_THAN');
  static const between = MarketoConnectorOperator._('BETWEEN');
  static const addition = MarketoConnectorOperator._('ADDITION');
  static const multiplication = MarketoConnectorOperator._('MULTIPLICATION');
  static const division = MarketoConnectorOperator._('DIVISION');
  static const subtraction = MarketoConnectorOperator._('SUBTRACTION');
  static const maskAll = MarketoConnectorOperator._('MASK_ALL');
  static const maskFirstN = MarketoConnectorOperator._('MASK_FIRST_N');
  static const maskLastN = MarketoConnectorOperator._('MASK_LAST_N');
  static const validateNonNull =
      MarketoConnectorOperator._('VALIDATE_NON_NULL');
  static const validateNonZero =
      MarketoConnectorOperator._('VALIDATE_NON_ZERO');
  static const validateNonNegative =
      MarketoConnectorOperator._('VALIDATE_NON_NEGATIVE');
  static const validateNumeric = MarketoConnectorOperator._('VALIDATE_NUMERIC');
  static const noOp = MarketoConnectorOperator._('NO_OP');

  final String value;

  const MarketoConnectorOperator._(this.value);

  static const values = [
    projection,
    lessThan,
    greaterThan,
    between,
    addition,
    multiplication,
    division,
    subtraction,
    maskAll,
    maskFirstN,
    maskLastN,
    validateNonNull,
    validateNonZero,
    validateNonNegative,
    validateNumeric,
    noOp
  ];

  static MarketoConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MarketoConnectorOperator._(value));

  @override
  bool operator ==(other) =>
      other is MarketoConnectorOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class S3ConnectorOperator {
  static const projection = S3ConnectorOperator._('PROJECTION');
  static const lessThan = S3ConnectorOperator._('LESS_THAN');
  static const greaterThan = S3ConnectorOperator._('GREATER_THAN');
  static const between = S3ConnectorOperator._('BETWEEN');
  static const lessThanOrEqualTo =
      S3ConnectorOperator._('LESS_THAN_OR_EQUAL_TO');
  static const greaterThanOrEqualTo =
      S3ConnectorOperator._('GREATER_THAN_OR_EQUAL_TO');
  static const equalTo = S3ConnectorOperator._('EQUAL_TO');
  static const notEqualTo = S3ConnectorOperator._('NOT_EQUAL_TO');
  static const addition = S3ConnectorOperator._('ADDITION');
  static const multiplication = S3ConnectorOperator._('MULTIPLICATION');
  static const division = S3ConnectorOperator._('DIVISION');
  static const subtraction = S3ConnectorOperator._('SUBTRACTION');
  static const maskAll = S3ConnectorOperator._('MASK_ALL');
  static const maskFirstN = S3ConnectorOperator._('MASK_FIRST_N');
  static const maskLastN = S3ConnectorOperator._('MASK_LAST_N');
  static const validateNonNull = S3ConnectorOperator._('VALIDATE_NON_NULL');
  static const validateNonZero = S3ConnectorOperator._('VALIDATE_NON_ZERO');
  static const validateNonNegative =
      S3ConnectorOperator._('VALIDATE_NON_NEGATIVE');
  static const validateNumeric = S3ConnectorOperator._('VALIDATE_NUMERIC');
  static const noOp = S3ConnectorOperator._('NO_OP');

  final String value;

  const S3ConnectorOperator._(this.value);

  static const values = [
    projection,
    lessThan,
    greaterThan,
    between,
    lessThanOrEqualTo,
    greaterThanOrEqualTo,
    equalTo,
    notEqualTo,
    addition,
    multiplication,
    division,
    subtraction,
    maskAll,
    maskFirstN,
    maskLastN,
    validateNonNull,
    validateNonZero,
    validateNonNegative,
    validateNumeric,
    noOp
  ];

  static S3ConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => S3ConnectorOperator._(value));

  @override
  bool operator ==(other) =>
      other is S3ConnectorOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SalesforceConnectorOperator {
  static const projection = SalesforceConnectorOperator._('PROJECTION');
  static const lessThan = SalesforceConnectorOperator._('LESS_THAN');
  static const contains = SalesforceConnectorOperator._('CONTAINS');
  static const greaterThan = SalesforceConnectorOperator._('GREATER_THAN');
  static const between = SalesforceConnectorOperator._('BETWEEN');
  static const lessThanOrEqualTo =
      SalesforceConnectorOperator._('LESS_THAN_OR_EQUAL_TO');
  static const greaterThanOrEqualTo =
      SalesforceConnectorOperator._('GREATER_THAN_OR_EQUAL_TO');
  static const equalTo = SalesforceConnectorOperator._('EQUAL_TO');
  static const notEqualTo = SalesforceConnectorOperator._('NOT_EQUAL_TO');
  static const addition = SalesforceConnectorOperator._('ADDITION');
  static const multiplication = SalesforceConnectorOperator._('MULTIPLICATION');
  static const division = SalesforceConnectorOperator._('DIVISION');
  static const subtraction = SalesforceConnectorOperator._('SUBTRACTION');
  static const maskAll = SalesforceConnectorOperator._('MASK_ALL');
  static const maskFirstN = SalesforceConnectorOperator._('MASK_FIRST_N');
  static const maskLastN = SalesforceConnectorOperator._('MASK_LAST_N');
  static const validateNonNull =
      SalesforceConnectorOperator._('VALIDATE_NON_NULL');
  static const validateNonZero =
      SalesforceConnectorOperator._('VALIDATE_NON_ZERO');
  static const validateNonNegative =
      SalesforceConnectorOperator._('VALIDATE_NON_NEGATIVE');
  static const validateNumeric =
      SalesforceConnectorOperator._('VALIDATE_NUMERIC');
  static const noOp = SalesforceConnectorOperator._('NO_OP');

  final String value;

  const SalesforceConnectorOperator._(this.value);

  static const values = [
    projection,
    lessThan,
    contains,
    greaterThan,
    between,
    lessThanOrEqualTo,
    greaterThanOrEqualTo,
    equalTo,
    notEqualTo,
    addition,
    multiplication,
    division,
    subtraction,
    maskAll,
    maskFirstN,
    maskLastN,
    validateNonNull,
    validateNonZero,
    validateNonNegative,
    validateNumeric,
    noOp
  ];

  static SalesforceConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SalesforceConnectorOperator._(value));

  @override
  bool operator ==(other) =>
      other is SalesforceConnectorOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ServiceNowConnectorOperator {
  static const projection = ServiceNowConnectorOperator._('PROJECTION');
  static const contains = ServiceNowConnectorOperator._('CONTAINS');
  static const lessThan = ServiceNowConnectorOperator._('LESS_THAN');
  static const greaterThan = ServiceNowConnectorOperator._('GREATER_THAN');
  static const between = ServiceNowConnectorOperator._('BETWEEN');
  static const lessThanOrEqualTo =
      ServiceNowConnectorOperator._('LESS_THAN_OR_EQUAL_TO');
  static const greaterThanOrEqualTo =
      ServiceNowConnectorOperator._('GREATER_THAN_OR_EQUAL_TO');
  static const equalTo = ServiceNowConnectorOperator._('EQUAL_TO');
  static const notEqualTo = ServiceNowConnectorOperator._('NOT_EQUAL_TO');
  static const addition = ServiceNowConnectorOperator._('ADDITION');
  static const multiplication = ServiceNowConnectorOperator._('MULTIPLICATION');
  static const division = ServiceNowConnectorOperator._('DIVISION');
  static const subtraction = ServiceNowConnectorOperator._('SUBTRACTION');
  static const maskAll = ServiceNowConnectorOperator._('MASK_ALL');
  static const maskFirstN = ServiceNowConnectorOperator._('MASK_FIRST_N');
  static const maskLastN = ServiceNowConnectorOperator._('MASK_LAST_N');
  static const validateNonNull =
      ServiceNowConnectorOperator._('VALIDATE_NON_NULL');
  static const validateNonZero =
      ServiceNowConnectorOperator._('VALIDATE_NON_ZERO');
  static const validateNonNegative =
      ServiceNowConnectorOperator._('VALIDATE_NON_NEGATIVE');
  static const validateNumeric =
      ServiceNowConnectorOperator._('VALIDATE_NUMERIC');
  static const noOp = ServiceNowConnectorOperator._('NO_OP');

  final String value;

  const ServiceNowConnectorOperator._(this.value);

  static const values = [
    projection,
    contains,
    lessThan,
    greaterThan,
    between,
    lessThanOrEqualTo,
    greaterThanOrEqualTo,
    equalTo,
    notEqualTo,
    addition,
    multiplication,
    division,
    subtraction,
    maskAll,
    maskFirstN,
    maskLastN,
    validateNonNull,
    validateNonZero,
    validateNonNegative,
    validateNumeric,
    noOp
  ];

  static ServiceNowConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceNowConnectorOperator._(value));

  @override
  bool operator ==(other) =>
      other is ServiceNowConnectorOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ZendeskConnectorOperator {
  static const projection = ZendeskConnectorOperator._('PROJECTION');
  static const greaterThan = ZendeskConnectorOperator._('GREATER_THAN');
  static const addition = ZendeskConnectorOperator._('ADDITION');
  static const multiplication = ZendeskConnectorOperator._('MULTIPLICATION');
  static const division = ZendeskConnectorOperator._('DIVISION');
  static const subtraction = ZendeskConnectorOperator._('SUBTRACTION');
  static const maskAll = ZendeskConnectorOperator._('MASK_ALL');
  static const maskFirstN = ZendeskConnectorOperator._('MASK_FIRST_N');
  static const maskLastN = ZendeskConnectorOperator._('MASK_LAST_N');
  static const validateNonNull =
      ZendeskConnectorOperator._('VALIDATE_NON_NULL');
  static const validateNonZero =
      ZendeskConnectorOperator._('VALIDATE_NON_ZERO');
  static const validateNonNegative =
      ZendeskConnectorOperator._('VALIDATE_NON_NEGATIVE');
  static const validateNumeric = ZendeskConnectorOperator._('VALIDATE_NUMERIC');
  static const noOp = ZendeskConnectorOperator._('NO_OP');

  final String value;

  const ZendeskConnectorOperator._(this.value);

  static const values = [
    projection,
    greaterThan,
    addition,
    multiplication,
    division,
    subtraction,
    maskAll,
    maskFirstN,
    maskLastN,
    validateNonNull,
    validateNonZero,
    validateNonNegative,
    validateNumeric,
    noOp
  ];

  static ZendeskConnectorOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ZendeskConnectorOperator._(value));

  @override
  bool operator ==(other) =>
      other is ZendeskConnectorOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SourceConnectorType {
  static const salesforce = SourceConnectorType._('Salesforce');
  static const marketo = SourceConnectorType._('Marketo');
  static const zendesk = SourceConnectorType._('Zendesk');
  static const servicenow = SourceConnectorType._('Servicenow');
  static const s3 = SourceConnectorType._('S3');

  final String value;

  const SourceConnectorType._(this.value);

  static const values = [salesforce, marketo, zendesk, servicenow, s3];

  static SourceConnectorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SourceConnectorType._(value));

  @override
  bool operator ==(other) =>
      other is SourceConnectorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the configuration used when importing incremental records from the
/// source.
class IncrementalPullConfig {
  /// A field that specifies the date time or timestamp field as the criteria to
  /// use when importing incremental records from the source.
  final String? datetimeTypeFieldName;

  IncrementalPullConfig({
    this.datetimeTypeFieldName,
  });

  Map<String, dynamic> toJson() {
    final datetimeTypeFieldName = this.datetimeTypeFieldName;
    return {
      if (datetimeTypeFieldName != null)
        'DatetimeTypeFieldName': datetimeTypeFieldName,
    };
  }
}

/// Specifies the information that is required to query a particular Amazon
/// AppFlow connector. Customer Profiles supports Salesforce, Zendesk, Marketo,
/// ServiceNow and Amazon S3.
class SourceConnectorProperties {
  /// The properties that are applied when Marketo is being used as a source.
  final MarketoSourceProperties? marketo;

  /// The properties that are applied when Amazon S3 is being used as the flow
  /// source.
  final S3SourceProperties? s3;

  /// The properties that are applied when Salesforce is being used as a source.
  final SalesforceSourceProperties? salesforce;

  /// The properties that are applied when ServiceNow is being used as a source.
  final ServiceNowSourceProperties? serviceNow;

  /// The properties that are applied when using Zendesk as a flow source.
  final ZendeskSourceProperties? zendesk;

  SourceConnectorProperties({
    this.marketo,
    this.s3,
    this.salesforce,
    this.serviceNow,
    this.zendesk,
  });

  Map<String, dynamic> toJson() {
    final marketo = this.marketo;
    final s3 = this.s3;
    final salesforce = this.salesforce;
    final serviceNow = this.serviceNow;
    final zendesk = this.zendesk;
    return {
      if (marketo != null) 'Marketo': marketo,
      if (s3 != null) 'S3': s3,
      if (salesforce != null) 'Salesforce': salesforce,
      if (serviceNow != null) 'ServiceNow': serviceNow,
      if (zendesk != null) 'Zendesk': zendesk,
    };
  }
}

/// The properties that are applied when Marketo is being used as a source.
class MarketoSourceProperties {
  /// The object specified in the Marketo flow source.
  final String object;

  MarketoSourceProperties({
    required this.object,
  });

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'Object': object,
    };
  }
}

/// The properties that are applied when Amazon S3 is being used as the flow
/// source.
class S3SourceProperties {
  /// The Amazon S3 bucket name where the source files are stored.
  final String bucketName;

  /// The object key for the Amazon S3 bucket in which the source files are
  /// stored.
  final String? bucketPrefix;

  S3SourceProperties({
    required this.bucketName,
    this.bucketPrefix,
  });

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final bucketPrefix = this.bucketPrefix;
    return {
      'BucketName': bucketName,
      if (bucketPrefix != null) 'BucketPrefix': bucketPrefix,
    };
  }
}

/// The properties that are applied when Salesforce is being used as a source.
class SalesforceSourceProperties {
  /// The object specified in the Salesforce flow source.
  final String object;

  /// The flag that enables dynamic fetching of new (recently added) fields in the
  /// Salesforce objects while running a flow.
  final bool? enableDynamicFieldUpdate;

  /// Indicates whether Amazon AppFlow includes deleted files in the flow run.
  final bool? includeDeletedRecords;

  SalesforceSourceProperties({
    required this.object,
    this.enableDynamicFieldUpdate,
    this.includeDeletedRecords,
  });

  Map<String, dynamic> toJson() {
    final object = this.object;
    final enableDynamicFieldUpdate = this.enableDynamicFieldUpdate;
    final includeDeletedRecords = this.includeDeletedRecords;
    return {
      'Object': object,
      if (enableDynamicFieldUpdate != null)
        'EnableDynamicFieldUpdate': enableDynamicFieldUpdate,
      if (includeDeletedRecords != null)
        'IncludeDeletedRecords': includeDeletedRecords,
    };
  }
}

/// The properties that are applied when ServiceNow is being used as a source.
class ServiceNowSourceProperties {
  /// The object specified in the ServiceNow flow source.
  final String object;

  ServiceNowSourceProperties({
    required this.object,
  });

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'Object': object,
    };
  }
}

/// The properties that are applied when using Zendesk as a flow source.
class ZendeskSourceProperties {
  /// The object specified in the Zendesk flow source.
  final String object;

  ZendeskSourceProperties({
    required this.object,
  });

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'Object': object,
    };
  }
}

/// The standard domain object type.
class DomainObjectTypeField {
  /// The expression that defines how to extract the field value from the source
  /// object.>
  final String source;

  /// The expression that defines where the field value should be placed in the
  /// standard domain object.
  final String target;

  /// The content type of the field.
  final ContentType? contentType;

  /// The semantic meaning of the field.
  final FeatureType? featureType;

  DomainObjectTypeField({
    required this.source,
    required this.target,
    this.contentType,
    this.featureType,
  });

  factory DomainObjectTypeField.fromJson(Map<String, dynamic> json) {
    return DomainObjectTypeField(
      source: (json['Source'] as String?) ?? '',
      target: (json['Target'] as String?) ?? '',
      contentType:
          (json['ContentType'] as String?)?.let(ContentType.fromString),
      featureType:
          (json['FeatureType'] as String?)?.let(FeatureType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final target = this.target;
    final contentType = this.contentType;
    final featureType = this.featureType;
    return {
      'Source': source,
      'Target': target,
      if (contentType != null) 'ContentType': contentType.value,
      if (featureType != null) 'FeatureType': featureType.value,
    };
  }
}

class ContentType {
  static const string = ContentType._('STRING');
  static const number = ContentType._('NUMBER');

  final String value;

  const ContentType._(this.value);

  static const values = [string, number];

  static ContentType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ContentType._(value));

  @override
  bool operator ==(other) => other is ContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class FeatureType {
  static const textual = FeatureType._('TEXTUAL');
  static const categorical = FeatureType._('CATEGORICAL');

  final String value;

  const FeatureType._(this.value);

  static const values = [textual, categorical];

  static FeatureType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FeatureType._(value));

  @override
  bool operator ==(other) => other is FeatureType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A duplicate customer profile that is to be merged into a main profile.
class FieldSourceProfileIds {
  /// A unique identifier for the account number field to be merged.
  final String? accountNumber;

  /// A unique identifier for the additional information field to be merged.
  final String? additionalInformation;

  /// A unique identifier for the party type field to be merged.
  final String? address;

  /// A unique identifier for the attributes field to be merged.
  final Map<String, String>? attributes;

  /// A unique identifier for the billing type field to be merged.
  final String? billingAddress;

  /// A unique identifier for the birthdate field to be merged.
  final String? birthDate;

  /// A unique identifier for the party type field to be merged.
  final String? businessEmailAddress;

  /// A unique identifier for the business name field to be merged.
  final String? businessName;

  /// A unique identifier for the business phone number field to be merged.
  final String? businessPhoneNumber;

  /// A unique identifier for the email address field to be merged.
  final String? emailAddress;

  /// A unique identifier for the engagement preferences field to be merged.
  final String? engagementPreferences;

  /// A unique identifier for the first name field to be merged.
  final String? firstName;

  /// A unique identifier for the gender field to be merged.
  final String? gender;

  /// A unique identifier for the home phone number field to be merged.
  final String? homePhoneNumber;

  /// A unique identifier for the last name field to be merged.
  final String? lastName;

  /// A unique identifier for the mailing address field to be merged.
  final String? mailingAddress;

  /// A unique identifier for the middle name field to be merged.
  final String? middleName;

  /// A unique identifier for the mobile phone number field to be merged.
  final String? mobilePhoneNumber;

  /// A unique identifier for the party type field to be merged.
  final String? partyType;

  /// A unique identifier for the personal email address field to be merged.
  final String? personalEmailAddress;

  /// A unique identifier for the phone number field to be merged.
  final String? phoneNumber;

  /// A unique identifier for the profile type field to be merged.
  final String? profileType;

  /// A unique identifier for the shipping address field to be merged.
  final String? shippingAddress;

  FieldSourceProfileIds({
    this.accountNumber,
    this.additionalInformation,
    this.address,
    this.attributes,
    this.billingAddress,
    this.birthDate,
    this.businessEmailAddress,
    this.businessName,
    this.businessPhoneNumber,
    this.emailAddress,
    this.engagementPreferences,
    this.firstName,
    this.gender,
    this.homePhoneNumber,
    this.lastName,
    this.mailingAddress,
    this.middleName,
    this.mobilePhoneNumber,
    this.partyType,
    this.personalEmailAddress,
    this.phoneNumber,
    this.profileType,
    this.shippingAddress,
  });

  Map<String, dynamic> toJson() {
    final accountNumber = this.accountNumber;
    final additionalInformation = this.additionalInformation;
    final address = this.address;
    final attributes = this.attributes;
    final billingAddress = this.billingAddress;
    final birthDate = this.birthDate;
    final businessEmailAddress = this.businessEmailAddress;
    final businessName = this.businessName;
    final businessPhoneNumber = this.businessPhoneNumber;
    final emailAddress = this.emailAddress;
    final engagementPreferences = this.engagementPreferences;
    final firstName = this.firstName;
    final gender = this.gender;
    final homePhoneNumber = this.homePhoneNumber;
    final lastName = this.lastName;
    final mailingAddress = this.mailingAddress;
    final middleName = this.middleName;
    final mobilePhoneNumber = this.mobilePhoneNumber;
    final partyType = this.partyType;
    final personalEmailAddress = this.personalEmailAddress;
    final phoneNumber = this.phoneNumber;
    final profileType = this.profileType;
    final shippingAddress = this.shippingAddress;
    return {
      if (accountNumber != null) 'AccountNumber': accountNumber,
      if (additionalInformation != null)
        'AdditionalInformation': additionalInformation,
      if (address != null) 'Address': address,
      if (attributes != null) 'Attributes': attributes,
      if (billingAddress != null) 'BillingAddress': billingAddress,
      if (birthDate != null) 'BirthDate': birthDate,
      if (businessEmailAddress != null)
        'BusinessEmailAddress': businessEmailAddress,
      if (businessName != null) 'BusinessName': businessName,
      if (businessPhoneNumber != null)
        'BusinessPhoneNumber': businessPhoneNumber,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (engagementPreferences != null)
        'EngagementPreferences': engagementPreferences,
      if (firstName != null) 'FirstName': firstName,
      if (gender != null) 'Gender': gender,
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'PartyType': partyType,
      if (personalEmailAddress != null)
        'PersonalEmailAddress': personalEmailAddress,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (profileType != null) 'ProfileType': profileType,
      if (shippingAddress != null) 'ShippingAddress': shippingAddress,
    };
  }
}

/// A workflow in list of workflows.
class ListWorkflowsItem {
  /// Creation timestamp for workflow.
  final DateTime createdAt;

  /// Last updated timestamp for workflow.
  final DateTime lastUpdatedAt;

  /// Status of workflow execution.
  final Status status;

  /// Description for workflow execution status.
  final String statusDescription;

  /// Unique identifier for the workflow.
  final String workflowId;

  /// The type of workflow. The only supported value is APPFLOW_INTEGRATION.
  final WorkflowType workflowType;

  ListWorkflowsItem({
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.status,
    required this.statusDescription,
    required this.workflowId,
    required this.workflowType,
  });

  factory ListWorkflowsItem.fromJson(Map<String, dynamic> json) {
    return ListWorkflowsItem(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      status: Status.fromString((json['Status'] as String?) ?? ''),
      statusDescription: (json['StatusDescription'] as String?) ?? '',
      workflowId: (json['WorkflowId'] as String?) ?? '',
      workflowType:
          WorkflowType.fromString((json['WorkflowType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final status = this.status;
    final statusDescription = this.statusDescription;
    final workflowId = this.workflowId;
    final workflowType = this.workflowType;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'Status': status.value,
      'StatusDescription': statusDescription,
      'WorkflowId': workflowId,
      'WorkflowType': workflowType.value,
    };
  }
}

class WorkflowType {
  static const appflowIntegration = WorkflowType._('APPFLOW_INTEGRATION');

  final String value;

  const WorkflowType._(this.value);

  static const values = [appflowIntegration];

  static WorkflowType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => WorkflowType._(value));

  @override
  bool operator ==(other) => other is WorkflowType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Status {
  static const notStarted = Status._('NOT_STARTED');
  static const inProgress = Status._('IN_PROGRESS');
  static const complete = Status._('COMPLETE');
  static const failed = Status._('FAILED');
  static const split = Status._('SPLIT');
  static const retry = Status._('RETRY');
  static const cancelled = Status._('CANCELLED');

  final String value;

  const Status._(this.value);

  static const values = [
    notStarted,
    inProgress,
    complete,
    failed,
    split,
    retry,
    cancelled
  ];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary information for an individual upload job.
class UploadJobItem {
  /// The timestamp when the upload job was completed.
  final DateTime? completedAt;

  /// The timestamp when the upload job was created.
  final DateTime? createdAt;

  /// The expiry duration for the profiles ingested with the upload job.
  final int? dataExpiry;

  /// The name of the upload job.
  final String? displayName;

  /// The unique identifier of the upload job.
  final String? jobId;

  /// The current status of the upload job.
  final UploadJobStatus? status;

  /// The reason for the current status of the upload job.
  final StatusReason? statusReason;

  UploadJobItem({
    this.completedAt,
    this.createdAt,
    this.dataExpiry,
    this.displayName,
    this.jobId,
    this.status,
    this.statusReason,
  });

  factory UploadJobItem.fromJson(Map<String, dynamic> json) {
    return UploadJobItem(
      completedAt: timeStampFromJson(json['CompletedAt']),
      createdAt: timeStampFromJson(json['CreatedAt']),
      dataExpiry: json['DataExpiry'] as int?,
      displayName: json['DisplayName'] as String?,
      jobId: json['JobId'] as String?,
      status: (json['Status'] as String?)?.let(UploadJobStatus.fromString),
      statusReason:
          (json['StatusReason'] as String?)?.let(StatusReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final completedAt = this.completedAt;
    final createdAt = this.createdAt;
    final dataExpiry = this.dataExpiry;
    final displayName = this.displayName;
    final jobId = this.jobId;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (completedAt != null) 'CompletedAt': unixTimestampToJson(completedAt),
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dataExpiry != null) 'DataExpiry': dataExpiry,
      if (displayName != null) 'DisplayName': displayName,
      if (jobId != null) 'JobId': jobId,
      if (status != null) 'Status': status.value,
      if (statusReason != null) 'StatusReason': statusReason.value,
    };
  }
}

class UploadJobStatus {
  static const created = UploadJobStatus._('CREATED');
  static const inProgress = UploadJobStatus._('IN_PROGRESS');
  static const partiallySucceeded = UploadJobStatus._('PARTIALLY_SUCCEEDED');
  static const succeeded = UploadJobStatus._('SUCCEEDED');
  static const failed = UploadJobStatus._('FAILED');
  static const stopped = UploadJobStatus._('STOPPED');

  final String value;

  const UploadJobStatus._(this.value);

  static const values = [
    created,
    inProgress,
    partiallySucceeded,
    succeeded,
    failed,
    stopped
  ];

  static UploadJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UploadJobStatus._(value));

  @override
  bool operator ==(other) => other is UploadJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class StatusReason {
  static const validationFailure = StatusReason._('VALIDATION_FAILURE');
  static const internalFailure = StatusReason._('INTERNAL_FAILURE');

  final String value;

  const StatusReason._(this.value);

  static const values = [validationFailure, internalFailure];

  static StatusReason fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StatusReason._(value));

  @override
  bool operator ==(other) => other is StatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object holding the segment definition fields.
class SegmentDefinitionItem {
  /// When the segment definition was created.
  final DateTime? createdAt;

  /// The description of the segment definition.
  final String? description;

  /// Display name of the segment definition.
  final String? displayName;

  /// The arn of the segment definition.
  final String? segmentDefinitionArn;

  /// Name of the segment definition.
  final String? segmentDefinitionName;

  /// The segment type.
  ///
  /// Classic : Segments created using traditional SegmentGroup structure
  ///
  /// Enhanced : Segments created using SQL queries
  final SegmentType? segmentType;

  /// The tags belonging to the segment definition.
  final Map<String, String>? tags;

  SegmentDefinitionItem({
    this.createdAt,
    this.description,
    this.displayName,
    this.segmentDefinitionArn,
    this.segmentDefinitionName,
    this.segmentType,
    this.tags,
  });

  factory SegmentDefinitionItem.fromJson(Map<String, dynamic> json) {
    return SegmentDefinitionItem(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      segmentDefinitionArn: json['SegmentDefinitionArn'] as String?,
      segmentDefinitionName: json['SegmentDefinitionName'] as String?,
      segmentType:
          (json['SegmentType'] as String?)?.let(SegmentType.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final segmentDefinitionArn = this.segmentDefinitionArn;
    final segmentDefinitionName = this.segmentDefinitionName;
    final segmentType = this.segmentType;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (segmentDefinitionArn != null)
        'SegmentDefinitionArn': segmentDefinitionArn,
      if (segmentDefinitionName != null)
        'SegmentDefinitionName': segmentDefinitionName,
      if (segmentType != null) 'SegmentType': segmentType.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

class SegmentType {
  static const classic = SegmentType._('CLASSIC');
  static const enhanced = SegmentType._('ENHANCED');

  final String value;

  const SegmentType._(this.value);

  static const values = [classic, enhanced];

  static SegmentType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SegmentType._(value));

  @override
  bool operator ==(other) => other is SegmentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a summary of a recommender schema's configuration and current
/// state.
class RecommenderSchemaSummary {
  /// The timestamp when the recommender schema was created.
  final DateTime createdAt;

  /// A map of dataset type to column definitions included in the schema.
  final Map<String, List<RecommenderSchemaField>> fields;

  /// The name of the recommender schema.
  final String recommenderSchemaName;

  /// The current operational status of the recommender schema.
  final RecommenderSchemaStatus status;

  RecommenderSchemaSummary({
    required this.createdAt,
    required this.fields,
    required this.recommenderSchemaName,
    required this.status,
  });

  factory RecommenderSchemaSummary.fromJson(Map<String, dynamic> json) {
    return RecommenderSchemaSummary(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      fields: ((json['Fields'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) => RecommenderSchemaField.fromJson(
                      e as Map<String, dynamic>))
                  .toList())),
      recommenderSchemaName: (json['RecommenderSchemaName'] as String?) ?? '',
      status:
          RecommenderSchemaStatus.fromString((json['Status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final fields = this.fields;
    final recommenderSchemaName = this.recommenderSchemaName;
    final status = this.status;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'Fields': fields,
      'RecommenderSchemaName': recommenderSchemaName,
      'Status': status.value,
    };
  }
}

class RecommenderSchemaStatus {
  static const active = RecommenderSchemaStatus._('ACTIVE');
  static const deleting = RecommenderSchemaStatus._('DELETING');

  final String value;

  const RecommenderSchemaStatus._(this.value);

  static const values = [active, deleting];

  static RecommenderSchemaStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommenderSchemaStatus._(value));

  @override
  bool operator ==(other) =>
      other is RecommenderSchemaStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines a column in a recommender schema, including the target field name
/// and optional feature and content type settings for training.
class RecommenderSchemaField {
  /// The name of the target field in the dataset, such as
  /// <code>Location.City</code> or <code>Attributes.MealTime</code>.
  final String targetFieldName;

  /// The data type of the column value. Valid values are <code>String</code> and
  /// <code>Number</code>. The default value is <code>String</code>.
  final ContentType? contentType;

  /// How the column is treated for model training. Valid values are
  /// <code>CATEGORICAL</code> and <code>TEXTUAL</code>.
  final FeatureType? featureType;

  RecommenderSchemaField({
    required this.targetFieldName,
    this.contentType,
    this.featureType,
  });

  factory RecommenderSchemaField.fromJson(Map<String, dynamic> json) {
    return RecommenderSchemaField(
      targetFieldName: (json['TargetFieldName'] as String?) ?? '',
      contentType:
          (json['ContentType'] as String?)?.let(ContentType.fromString),
      featureType:
          (json['FeatureType'] as String?)?.let(FeatureType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final targetFieldName = this.targetFieldName;
    final contentType = this.contentType;
    final featureType = this.featureType;
    return {
      'TargetFieldName': targetFieldName,
      if (contentType != null) 'ContentType': contentType.value,
      if (featureType != null) 'FeatureType': featureType.value,
    };
  }
}

/// Provides a summary of a recommender's configuration and current state.
class RecommenderSummary {
  /// The timestamp when the recommender was created.
  final DateTime? createdAt;

  /// A description of the recommender's purpose and characteristics.
  final String? description;

  /// If the recommender is in a failed state, provides the reason for the
  /// failure.
  final String? failureReason;

  /// The timestamp of when the recommender was edited.
  final DateTime? lastUpdatedAt;

  /// Information about the most recent update performed on the recommender,
  /// including its status and timing.
  final RecommenderUpdate? latestRecommenderUpdate;

  /// The name of the recipe used by this recommender.
  final RecommenderRecipeName? recipeName;

  /// The configuration settings applied to this recommender.
  final RecommenderConfig? recommenderConfig;

  /// The name of the recommender.
  final String? recommenderName;

  /// The name of the recommender schema associated with this recommender.
  final String? recommenderSchemaName;

  /// The current operational status of the recommender.
  final RecommenderStatus? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  RecommenderSummary({
    this.createdAt,
    this.description,
    this.failureReason,
    this.lastUpdatedAt,
    this.latestRecommenderUpdate,
    this.recipeName,
    this.recommenderConfig,
    this.recommenderName,
    this.recommenderSchemaName,
    this.status,
    this.tags,
  });

  factory RecommenderSummary.fromJson(Map<String, dynamic> json) {
    return RecommenderSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      failureReason: json['FailureReason'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      latestRecommenderUpdate: json['LatestRecommenderUpdate'] != null
          ? RecommenderUpdate.fromJson(
              json['LatestRecommenderUpdate'] as Map<String, dynamic>)
          : null,
      recipeName: (json['RecipeName'] as String?)
          ?.let(RecommenderRecipeName.fromString),
      recommenderConfig: json['RecommenderConfig'] != null
          ? RecommenderConfig.fromJson(
              json['RecommenderConfig'] as Map<String, dynamic>)
          : null,
      recommenderName: json['RecommenderName'] as String?,
      recommenderSchemaName: json['RecommenderSchemaName'] as String?,
      status: (json['Status'] as String?)?.let(RecommenderStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final failureReason = this.failureReason;
    final lastUpdatedAt = this.lastUpdatedAt;
    final latestRecommenderUpdate = this.latestRecommenderUpdate;
    final recipeName = this.recipeName;
    final recommenderConfig = this.recommenderConfig;
    final recommenderName = this.recommenderName;
    final recommenderSchemaName = this.recommenderSchemaName;
    final status = this.status;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (failureReason != null) 'FailureReason': failureReason,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (latestRecommenderUpdate != null)
        'LatestRecommenderUpdate': latestRecommenderUpdate,
      if (recipeName != null) 'RecipeName': recipeName.value,
      if (recommenderConfig != null) 'RecommenderConfig': recommenderConfig,
      if (recommenderName != null) 'RecommenderName': recommenderName,
      if (recommenderSchemaName != null)
        'RecommenderSchemaName': recommenderSchemaName,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

class RecommenderRecipeName {
  static const recommendedForYou =
      RecommenderRecipeName._('recommended-for-you');
  static const similarItems = RecommenderRecipeName._('similar-items');
  static const frequentlyPairedItems =
      RecommenderRecipeName._('frequently-paired-items');
  static const popularItems = RecommenderRecipeName._('popular-items');
  static const trendingNow = RecommenderRecipeName._('trending-now');
  static const personalizedRanking =
      RecommenderRecipeName._('personalized-ranking');

  final String value;

  const RecommenderRecipeName._(this.value);

  static const values = [
    recommendedForYou,
    similarItems,
    frequentlyPairedItems,
    popularItems,
    trendingNow,
    personalizedRanking
  ];

  static RecommenderRecipeName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommenderRecipeName._(value));

  @override
  bool operator ==(other) =>
      other is RecommenderRecipeName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class RecommenderStatus {
  static const pending = RecommenderStatus._('PENDING');
  static const inProgress = RecommenderStatus._('IN_PROGRESS');
  static const active = RecommenderStatus._('ACTIVE');
  static const failed = RecommenderStatus._('FAILED');
  static const stopping = RecommenderStatus._('STOPPING');
  static const inactive = RecommenderStatus._('INACTIVE');
  static const starting = RecommenderStatus._('STARTING');
  static const deleting = RecommenderStatus._('DELETING');

  final String value;

  const RecommenderStatus._(this.value);

  static const values = [
    pending,
    inProgress,
    active,
    failed,
    stopping,
    inactive,
    starting,
    deleting
  ];

  static RecommenderStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommenderStatus._(value));

  @override
  bool operator ==(other) => other is RecommenderStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about an update operation performed on a recommender.
class RecommenderUpdate {
  /// The timestamp when this recommender update was initiated.
  final DateTime? createdAt;

  /// If the update operation failed, provides the reason for the failure.
  final String? failureReason;

  /// The timestamp of when the recommender was edited.
  final DateTime? lastUpdatedAt;

  /// The updated configuration settings applied to the recommender during this
  /// update.
  final RecommenderConfig? recommenderConfig;

  /// The current status of the recommender update operation.
  final RecommenderStatus? status;

  RecommenderUpdate({
    this.createdAt,
    this.failureReason,
    this.lastUpdatedAt,
    this.recommenderConfig,
    this.status,
  });

  factory RecommenderUpdate.fromJson(Map<String, dynamic> json) {
    return RecommenderUpdate(
      createdAt: timeStampFromJson(json['CreatedAt']),
      failureReason: json['FailureReason'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      recommenderConfig: json['RecommenderConfig'] != null
          ? RecommenderConfig.fromJson(
              json['RecommenderConfig'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(RecommenderStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final failureReason = this.failureReason;
    final lastUpdatedAt = this.lastUpdatedAt;
    final recommenderConfig = this.recommenderConfig;
    final status = this.status;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (failureReason != null) 'FailureReason': failureReason,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (recommenderConfig != null) 'RecommenderConfig': recommenderConfig,
      if (status != null) 'Status': status.value,
    };
  }
}

/// Defines the algorithm and approach used to generate recommendations.
class RecommenderRecipe {
  /// A description of the recommender recipe's purpose and functionality.
  final String? description;

  /// The name of the recommender recipe.
  final RecommenderRecipeName? name;

  RecommenderRecipe({
    this.description,
    this.name,
  });

  factory RecommenderRecipe.fromJson(Map<String, dynamic> json) {
    return RecommenderRecipe(
      description: json['description'] as String?,
      name: (json['name'] as String?)?.let(RecommenderRecipeName.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    return {
      if (description != null) 'description': description,
      if (name != null) 'name': name.value,
    };
  }
}

/// Provides a summary of a recommender filter's configuration and current
/// state.
class RecommenderFilterSummary {
  /// The timestamp when the recommender filter was created.
  final DateTime? createdAt;

  /// A description of the recommender filter's purpose and characteristics.
  final String? description;

  /// If the recommender filter is in a failed state, provides the reason for the
  /// failure.
  final String? failureReason;

  /// The filter expression that defines which items to include or exclude from
  /// recommendations.
  final String? recommenderFilterExpression;

  /// The name of the recommender filter.
  final String? recommenderFilterName;

  /// The name of the recommender schema associated with this recommender filter.
  final String? recommenderSchemaName;

  /// The current operational status of the recommender filter.
  final RecommenderFilterStatus? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  RecommenderFilterSummary({
    this.createdAt,
    this.description,
    this.failureReason,
    this.recommenderFilterExpression,
    this.recommenderFilterName,
    this.recommenderSchemaName,
    this.status,
    this.tags,
  });

  factory RecommenderFilterSummary.fromJson(Map<String, dynamic> json) {
    return RecommenderFilterSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      failureReason: json['FailureReason'] as String?,
      recommenderFilterExpression:
          json['RecommenderFilterExpression'] as String?,
      recommenderFilterName: json['RecommenderFilterName'] as String?,
      recommenderSchemaName: json['RecommenderSchemaName'] as String?,
      status:
          (json['Status'] as String?)?.let(RecommenderFilterStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final failureReason = this.failureReason;
    final recommenderFilterExpression = this.recommenderFilterExpression;
    final recommenderFilterName = this.recommenderFilterName;
    final recommenderSchemaName = this.recommenderSchemaName;
    final status = this.status;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (failureReason != null) 'FailureReason': failureReason,
      if (recommenderFilterExpression != null)
        'RecommenderFilterExpression': recommenderFilterExpression,
      if (recommenderFilterName != null)
        'RecommenderFilterName': recommenderFilterName,
      if (recommenderSchemaName != null)
        'RecommenderSchemaName': recommenderSchemaName,
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

class RecommenderFilterStatus {
  static const active = RecommenderFilterStatus._('ACTIVE');
  static const pending = RecommenderFilterStatus._('PENDING');
  static const inProgress = RecommenderFilterStatus._('IN_PROGRESS');
  static const failed = RecommenderFilterStatus._('FAILED');
  static const deleting = RecommenderFilterStatus._('DELETING');

  final String value;

  const RecommenderFilterStatus._(this.value);

  static const values = [active, pending, inProgress, failed, deleting];

  static RecommenderFilterStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommenderFilterStatus._(value));

  @override
  bool operator ==(other) =>
      other is RecommenderFilterStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A ProfileObjectTypeTemplate in a list of ProfileObjectTypeTemplates.
class ListProfileObjectTypeTemplateItem {
  /// The name of the source of the object template.
  final String? sourceName;

  /// The source of the object template.
  final String? sourceObject;

  /// A unique identifier for the object template.
  final String? templateId;

  ListProfileObjectTypeTemplateItem({
    this.sourceName,
    this.sourceObject,
    this.templateId,
  });

  factory ListProfileObjectTypeTemplateItem.fromJson(
      Map<String, dynamic> json) {
    return ListProfileObjectTypeTemplateItem(
      sourceName: json['SourceName'] as String?,
      sourceObject: json['SourceObject'] as String?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceName = this.sourceName;
    final sourceObject = this.sourceObject;
    final templateId = this.templateId;
    return {
      if (sourceName != null) 'SourceName': sourceName,
      if (sourceObject != null) 'SourceObject': sourceObject,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

/// A ProfileObjectType instance.
class ListProfileObjectTypeItem {
  /// Description of the profile object type.
  final String description;

  /// The name of the profile object type.
  final String objectTypeName;

  /// The timestamp of when the domain was created.
  final DateTime? createdAt;

  /// The timestamp of when the profile object type was most recently edited.
  final DateTime? lastUpdatedAt;

  /// The amount of provisioned profile object max count available.
  final int? maxAvailableProfileObjectCount;

  /// The amount of profile object max count assigned to the object type.
  final int? maxProfileObjectCount;

  /// An integer that determines the priority of this object type when data from
  /// multiple sources is ingested. Lower values take priority. Object types
  /// without a specified source priority default to the lowest priority.
  final int? sourcePriority;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ListProfileObjectTypeItem({
    required this.description,
    required this.objectTypeName,
    this.createdAt,
    this.lastUpdatedAt,
    this.maxAvailableProfileObjectCount,
    this.maxProfileObjectCount,
    this.sourcePriority,
    this.tags,
  });

  factory ListProfileObjectTypeItem.fromJson(Map<String, dynamic> json) {
    return ListProfileObjectTypeItem(
      description: (json['Description'] as String?) ?? '',
      objectTypeName: (json['ObjectTypeName'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      maxAvailableProfileObjectCount:
          json['MaxAvailableProfileObjectCount'] as int?,
      maxProfileObjectCount: json['MaxProfileObjectCount'] as int?,
      sourcePriority: json['SourcePriority'] as int?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final objectTypeName = this.objectTypeName;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final maxAvailableProfileObjectCount = this.maxAvailableProfileObjectCount;
    final maxProfileObjectCount = this.maxProfileObjectCount;
    final sourcePriority = this.sourcePriority;
    final tags = this.tags;
    return {
      'Description': description,
      'ObjectTypeName': objectTypeName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (maxAvailableProfileObjectCount != null)
        'MaxAvailableProfileObjectCount': maxAvailableProfileObjectCount,
      if (maxProfileObjectCount != null)
        'MaxProfileObjectCount': maxProfileObjectCount,
      if (sourcePriority != null) 'SourcePriority': sourcePriority,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A ProfileObject in a list of ProfileObjects.
class ListProfileObjectsItem {
  /// A JSON representation of a ProfileObject that belongs to a profile.
  final String? object;

  /// Specifies the kind of object being added to a profile, such as
  /// "Salesforce-Account."
  final String? objectTypeName;

  /// The unique identifier of the ProfileObject generated by the service.
  final String? profileObjectUniqueKey;

  ListProfileObjectsItem({
    this.object,
    this.objectTypeName,
    this.profileObjectUniqueKey,
  });

  factory ListProfileObjectsItem.fromJson(Map<String, dynamic> json) {
    return ListProfileObjectsItem(
      object: json['Object'] as String?,
      objectTypeName: json['ObjectTypeName'] as String?,
      profileObjectUniqueKey: json['ProfileObjectUniqueKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    final objectTypeName = this.objectTypeName;
    final profileObjectUniqueKey = this.profileObjectUniqueKey;
    return {
      if (object != null) 'Object': object,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (profileObjectUniqueKey != null)
        'ProfileObjectUniqueKey': profileObjectUniqueKey,
    };
  }
}

/// The filter applied to <code>ListProfileObjects</code> response to include
/// profile objects with the specified index values.
class ObjectFilter {
  /// A searchable identifier of a profile object. The predefined keys you can use
  /// to search for <code>_asset</code> include: <code>_assetId</code>,
  /// <code>_assetName</code>, and <code>_serialNumber</code>. The predefined keys
  /// you can use to search for <code>_case</code> include: <code>_caseId</code>.
  /// The predefined keys you can use to search for <code>_order</code> include:
  /// <code>_orderId</code>.
  final String keyName;

  /// A list of key values.
  final List<String> values;

  ObjectFilter({
    required this.keyName,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final keyName = this.keyName;
    final values = this.values;
    return {
      'KeyName': keyName,
      'Values': values,
    };
  }
}

/// Contains profile history record metadata.
class ProfileHistoryRecord {
  /// The action type of the profile history record.
  final ActionType actionType;

  /// The timestamp of when the profile history record was created.
  final DateTime createdAt;

  /// The unique identifier of the profile history record.
  final String id;

  /// The name of the profile object type.
  final String objectTypeName;

  /// The timestamp of when the profile history record was last updated.
  final DateTime? lastUpdatedAt;

  /// The Amazon Resource Name (ARN) of the person or service principal who
  /// performed the action.
  final String? performedBy;

  /// The unique identifier of the profile object generated by the service.
  final String? profileObjectUniqueKey;

  ProfileHistoryRecord({
    required this.actionType,
    required this.createdAt,
    required this.id,
    required this.objectTypeName,
    this.lastUpdatedAt,
    this.performedBy,
    this.profileObjectUniqueKey,
  });

  factory ProfileHistoryRecord.fromJson(Map<String, dynamic> json) {
    return ProfileHistoryRecord(
      actionType: ActionType.fromString((json['ActionType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      id: (json['Id'] as String?) ?? '',
      objectTypeName: (json['ObjectTypeName'] as String?) ?? '',
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      performedBy: json['PerformedBy'] as String?,
      profileObjectUniqueKey: json['ProfileObjectUniqueKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final createdAt = this.createdAt;
    final id = this.id;
    final objectTypeName = this.objectTypeName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final performedBy = this.performedBy;
    final profileObjectUniqueKey = this.profileObjectUniqueKey;
    return {
      'ActionType': actionType.value,
      'CreatedAt': unixTimestampToJson(createdAt),
      'Id': id,
      'ObjectTypeName': objectTypeName,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (performedBy != null) 'PerformedBy': performedBy,
      if (profileObjectUniqueKey != null)
        'ProfileObjectUniqueKey': profileObjectUniqueKey,
    };
  }
}

class ActionType {
  static const addedProfileKey = ActionType._('ADDED_PROFILE_KEY');
  static const deletedProfileKey = ActionType._('DELETED_PROFILE_KEY');
  static const created = ActionType._('CREATED');
  static const updated = ActionType._('UPDATED');
  static const ingested = ActionType._('INGESTED');
  static const deletedByCustomer = ActionType._('DELETED_BY_CUSTOMER');
  static const expired = ActionType._('EXPIRED');
  static const merged = ActionType._('MERGED');
  static const deletedByMerge = ActionType._('DELETED_BY_MERGE');

  final String value;

  const ActionType._(this.value);

  static const values = [
    addedProfileKey,
    deletedProfileKey,
    created,
    updated,
    ingested,
    deletedByCustomer,
    expired,
    merged,
    deletedByMerge
  ];

  static ActionType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ActionType._(value));

  @override
  bool operator ==(other) => other is ActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// List containing the values for the given attribute.
class AttributeValueItem {
  /// An individual value belonging to the given attribute.
  final String? value;

  AttributeValueItem({
    this.value,
  });

  factory AttributeValueItem.fromJson(Map<String, dynamic> json) {
    return AttributeValueItem(
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'Value': value,
    };
  }
}

/// Represents an item in the list of object type attribute values with its
/// associated metadata.
class ListObjectTypeAttributeValuesItem {
  /// The timestamp of when the object type attribute value was most recently
  /// updated.
  final DateTime lastUpdatedAt;

  /// The actual value of the object type attribute.
  final String value;

  ListObjectTypeAttributeValuesItem({
    required this.lastUpdatedAt,
    required this.value,
  });

  factory ListObjectTypeAttributeValuesItem.fromJson(
      Map<String, dynamic> json) {
    return ListObjectTypeAttributeValuesItem(
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedAt = this.lastUpdatedAt;
    final value = this.value;
    return {
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'Value': value,
    };
  }
}

/// Item that contains the attribute and when it was last updated.
class ListObjectTypeAttributeItem {
  /// Name of the attribute.
  final String attributeName;

  /// When the attribute was last updated.
  final DateTime lastUpdatedAt;

  ListObjectTypeAttributeItem({
    required this.attributeName,
    required this.lastUpdatedAt,
  });

  factory ListObjectTypeAttributeItem.fromJson(Map<String, dynamic> json) {
    return ListObjectTypeAttributeItem(
      attributeName: (json['AttributeName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final lastUpdatedAt = this.lastUpdatedAt;
    return {
      'AttributeName': attributeName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
    };
  }
}

/// An integration in list of integrations.
class ListIntegrationItem {
  /// The timestamp of when the domain was created.
  final DateTime createdAt;

  /// The unique name of the domain.
  final String domainName;

  /// The timestamp of when the integration was most recently edited.
  final DateTime lastUpdatedAt;

  /// The URI of the S3 bucket or any other type of data source.
  final String uri;

  /// A list of unique names for active event triggers associated with the
  /// integration.
  final List<String>? eventTriggerNames;

  /// Boolean that shows if the Flow that's associated with the Integration is
  /// created in Amazon Appflow, or with ObjectTypeName equals _unstructured via
  /// API/CLI in flowDefinition.
  final bool? isUnstructured;

  /// The name of the profile object type.
  final String? objectTypeName;

  /// A map in which each key is an event type from an external application such
  /// as Segment or Shopify, and each value is an <code>ObjectTypeName</code>
  /// (template) used to ingest the event. It supports the following event types:
  /// <code>SegmentIdentify</code>, <code>ShopifyCreateCustomers</code>,
  /// <code>ShopifyUpdateCustomers</code>, <code>ShopifyCreateDraftOrders</code>,
  /// <code>ShopifyUpdateDraftOrders</code>, <code>ShopifyCreateOrders</code>, and
  /// <code>ShopifyUpdatedOrders</code>.
  final Map<String, String>? objectTypeNames;

  /// The Amazon Resource Name (ARN) of the IAM role. The Integration uses this
  /// role to make Customer Profiles requests on your behalf.
  final String? roleArn;

  /// The scope or boundary of the integration item's applicability.
  final Scope? scope;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Unique identifier for the workflow.
  final String? workflowId;

  ListIntegrationItem({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    required this.uri,
    this.eventTriggerNames,
    this.isUnstructured,
    this.objectTypeName,
    this.objectTypeNames,
    this.roleArn,
    this.scope,
    this.tags,
    this.workflowId,
  });

  factory ListIntegrationItem.fromJson(Map<String, dynamic> json) {
    return ListIntegrationItem(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      domainName: (json['DomainName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      uri: (json['Uri'] as String?) ?? '',
      eventTriggerNames: (json['EventTriggerNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      isUnstructured: json['IsUnstructured'] as bool?,
      objectTypeName: json['ObjectTypeName'] as String?,
      objectTypeNames: (json['ObjectTypeNames'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      roleArn: json['RoleArn'] as String?,
      scope: (json['Scope'] as String?)?.let(Scope.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      workflowId: json['WorkflowId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final uri = this.uri;
    final eventTriggerNames = this.eventTriggerNames;
    final isUnstructured = this.isUnstructured;
    final objectTypeName = this.objectTypeName;
    final objectTypeNames = this.objectTypeNames;
    final roleArn = this.roleArn;
    final scope = this.scope;
    final tags = this.tags;
    final workflowId = this.workflowId;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'Uri': uri,
      if (eventTriggerNames != null) 'EventTriggerNames': eventTriggerNames,
      if (isUnstructured != null) 'IsUnstructured': isUnstructured,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (objectTypeNames != null) 'ObjectTypeNames': objectTypeNames,
      if (roleArn != null) 'RoleArn': roleArn,
      if (scope != null) 'Scope': scope.value,
      if (tags != null) 'Tags': tags,
      if (workflowId != null) 'WorkflowId': workflowId,
    };
  }
}

/// Information about the Identity Resolution Job.
class IdentityResolutionJob {
  /// The unique name of the domain.
  final String? domainName;

  /// The S3 location where the Identity Resolution Job writes result files.
  final ExportingLocation? exportingLocation;

  /// The timestamp of when the job was completed.
  final DateTime? jobEndTime;

  /// The unique identifier of the Identity Resolution Job.
  final String? jobId;

  /// The timestamp of when the job was started or will be started.
  final DateTime? jobStartTime;

  /// Statistics about an Identity Resolution Job.
  final JobStats? jobStats;

  /// The error messages that are generated when the Identity Resolution Job runs.
  final String? message;

  /// The status of the Identity Resolution Job.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The Identity Resolution Job is scheduled but has not
  /// started yet. If you turn off the Identity Resolution feature in your domain,
  /// jobs in the <code>PENDING</code> state are deleted.
  /// </li>
  /// <li>
  /// <code>PREPROCESSING</code>: The Identity Resolution Job is loading your
  /// data.
  /// </li>
  /// <li>
  /// <code>FIND_MATCHING</code>: The Identity Resolution Job is using the machine
  /// learning model to identify profiles that belong to the same matching group.
  /// </li>
  /// <li>
  /// <code>MERGING</code>: The Identity Resolution Job is merging duplicate
  /// profiles.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code>: The Identity Resolution Job completed successfully.
  /// </li>
  /// <li>
  /// <code>PARTIAL_SUCCESS</code>: There's a system error and not all of the data
  /// is merged. The Identity Resolution Job writes a message indicating the
  /// source of the problem.
  /// </li>
  /// <li>
  /// <code>FAILED</code>: The Identity Resolution Job did not merge any data. It
  /// writes a message indicating the source of the problem.
  /// </li>
  /// </ul>
  final IdentityResolutionJobStatus? status;

  IdentityResolutionJob({
    this.domainName,
    this.exportingLocation,
    this.jobEndTime,
    this.jobId,
    this.jobStartTime,
    this.jobStats,
    this.message,
    this.status,
  });

  factory IdentityResolutionJob.fromJson(Map<String, dynamic> json) {
    return IdentityResolutionJob(
      domainName: json['DomainName'] as String?,
      exportingLocation: json['ExportingLocation'] != null
          ? ExportingLocation.fromJson(
              json['ExportingLocation'] as Map<String, dynamic>)
          : null,
      jobEndTime: timeStampFromJson(json['JobEndTime']),
      jobId: json['JobId'] as String?,
      jobStartTime: timeStampFromJson(json['JobStartTime']),
      jobStats: json['JobStats'] != null
          ? JobStats.fromJson(json['JobStats'] as Map<String, dynamic>)
          : null,
      message: json['Message'] as String?,
      status: (json['Status'] as String?)
          ?.let(IdentityResolutionJobStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final exportingLocation = this.exportingLocation;
    final jobEndTime = this.jobEndTime;
    final jobId = this.jobId;
    final jobStartTime = this.jobStartTime;
    final jobStats = this.jobStats;
    final message = this.message;
    final status = this.status;
    return {
      if (domainName != null) 'DomainName': domainName,
      if (exportingLocation != null) 'ExportingLocation': exportingLocation,
      if (jobEndTime != null) 'JobEndTime': unixTimestampToJson(jobEndTime),
      if (jobId != null) 'JobId': jobId,
      if (jobStartTime != null)
        'JobStartTime': unixTimestampToJson(jobStartTime),
      if (jobStats != null) 'JobStats': jobStats,
      if (message != null) 'Message': message,
      if (status != null) 'Status': status.value,
    };
  }
}

class IdentityResolutionJobStatus {
  static const pending = IdentityResolutionJobStatus._('PENDING');
  static const preprocessing = IdentityResolutionJobStatus._('PREPROCESSING');
  static const findMatching = IdentityResolutionJobStatus._('FIND_MATCHING');
  static const merging = IdentityResolutionJobStatus._('MERGING');
  static const completed = IdentityResolutionJobStatus._('COMPLETED');
  static const partialSuccess =
      IdentityResolutionJobStatus._('PARTIAL_SUCCESS');
  static const failed = IdentityResolutionJobStatus._('FAILED');

  final String value;

  const IdentityResolutionJobStatus._(this.value);

  static const values = [
    pending,
    preprocessing,
    findMatching,
    merging,
    completed,
    partialSuccess,
    failed
  ];

  static IdentityResolutionJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IdentityResolutionJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is IdentityResolutionJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Statistics about the Identity Resolution Job.
class JobStats {
  /// The number of matches found.
  final int? numberOfMatchesFound;

  /// The number of merges completed.
  final int? numberOfMergesDone;

  /// The number of profiles reviewed.
  final int? numberOfProfilesReviewed;

  JobStats({
    this.numberOfMatchesFound,
    this.numberOfMergesDone,
    this.numberOfProfilesReviewed,
  });

  factory JobStats.fromJson(Map<String, dynamic> json) {
    return JobStats(
      numberOfMatchesFound: json['NumberOfMatchesFound'] as int?,
      numberOfMergesDone: json['NumberOfMergesDone'] as int?,
      numberOfProfilesReviewed: json['NumberOfProfilesReviewed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfMatchesFound = this.numberOfMatchesFound;
    final numberOfMergesDone = this.numberOfMergesDone;
    final numberOfProfilesReviewed = this.numberOfProfilesReviewed;
    return {
      if (numberOfMatchesFound != null)
        'NumberOfMatchesFound': numberOfMatchesFound,
      if (numberOfMergesDone != null) 'NumberOfMergesDone': numberOfMergesDone,
      if (numberOfProfilesReviewed != null)
        'NumberOfProfilesReviewed': numberOfProfilesReviewed,
    };
  }
}

/// The S3 location where Identity Resolution Jobs write result files.
class ExportingLocation {
  /// Information about the S3 location where Identity Resolution Jobs write
  /// result files.
  final S3ExportingLocation? s3Exporting;

  ExportingLocation({
    this.s3Exporting,
  });

  factory ExportingLocation.fromJson(Map<String, dynamic> json) {
    return ExportingLocation(
      s3Exporting: json['S3Exporting'] != null
          ? S3ExportingLocation.fromJson(
              json['S3Exporting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Exporting = this.s3Exporting;
    return {
      if (s3Exporting != null) 'S3Exporting': s3Exporting,
    };
  }
}

/// The S3 location where Identity Resolution Jobs write result files.
class S3ExportingLocation {
  /// The name of the S3 bucket name where Identity Resolution Jobs write result
  /// files.
  final String? s3BucketName;

  /// The S3 key name of the location where Identity Resolution Jobs write result
  /// files.
  final String? s3KeyName;

  S3ExportingLocation({
    this.s3BucketName,
    this.s3KeyName,
  });

  factory S3ExportingLocation.fromJson(Map<String, dynamic> json) {
    return S3ExportingLocation(
      s3BucketName: json['S3BucketName'] as String?,
      s3KeyName: json['S3KeyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final s3KeyName = this.s3KeyName;
    return {
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3KeyName != null) 'S3KeyName': s3KeyName,
    };
  }
}

/// The summary of the event trigger.
class EventTriggerSummaryItem {
  /// The timestamp of when the event trigger was created.
  final DateTime? createdAt;

  /// The description of the event trigger.
  final String? description;

  /// The unique name of the event trigger.
  final String? eventTriggerName;

  /// The timestamp of when the event trigger was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The unique name of the object type.
  final String? objectTypeName;

  /// An array of key-value pairs to apply to this resource.
  final Map<String, String>? tags;

  EventTriggerSummaryItem({
    this.createdAt,
    this.description,
    this.eventTriggerName,
    this.lastUpdatedAt,
    this.objectTypeName,
    this.tags,
  });

  factory EventTriggerSummaryItem.fromJson(Map<String, dynamic> json) {
    return EventTriggerSummaryItem(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      eventTriggerName: json['EventTriggerName'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      objectTypeName: json['ObjectTypeName'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final eventTriggerName = this.eventTriggerName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final objectTypeName = this.objectTypeName;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (eventTriggerName != null) 'EventTriggerName': eventTriggerName,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// An instance of EventStream in a list of EventStreams.
class EventStreamSummary {
  /// The unique name of the domain.
  final String domainName;

  /// A unique identifier for the event stream.
  final String eventStreamArn;

  /// The name of the event stream.
  final String eventStreamName;

  /// The operational state of destination stream for export.
  final EventStreamState state;

  /// Summary information about the Kinesis data stream.
  final DestinationSummary? destinationSummary;

  /// The timestamp when the <code>State</code> changed to <code>STOPPED</code>.
  final DateTime? stoppedSince;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  EventStreamSummary({
    required this.domainName,
    required this.eventStreamArn,
    required this.eventStreamName,
    required this.state,
    this.destinationSummary,
    this.stoppedSince,
    this.tags,
  });

  factory EventStreamSummary.fromJson(Map<String, dynamic> json) {
    return EventStreamSummary(
      domainName: (json['DomainName'] as String?) ?? '',
      eventStreamArn: (json['EventStreamArn'] as String?) ?? '',
      eventStreamName: (json['EventStreamName'] as String?) ?? '',
      state: EventStreamState.fromString((json['State'] as String?) ?? ''),
      destinationSummary: json['DestinationSummary'] != null
          ? DestinationSummary.fromJson(
              json['DestinationSummary'] as Map<String, dynamic>)
          : null,
      stoppedSince: timeStampFromJson(json['StoppedSince']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final eventStreamArn = this.eventStreamArn;
    final eventStreamName = this.eventStreamName;
    final state = this.state;
    final destinationSummary = this.destinationSummary;
    final stoppedSince = this.stoppedSince;
    final tags = this.tags;
    return {
      'DomainName': domainName,
      'EventStreamArn': eventStreamArn,
      'EventStreamName': eventStreamName,
      'State': state.value,
      if (destinationSummary != null) 'DestinationSummary': destinationSummary,
      if (stoppedSince != null)
        'StoppedSince': unixTimestampToJson(stoppedSince),
      if (tags != null) 'Tags': tags,
    };
  }
}

class EventStreamState {
  static const running = EventStreamState._('RUNNING');
  static const stopped = EventStreamState._('STOPPED');

  final String value;

  const EventStreamState._(this.value);

  static const values = [running, stopped];

  static EventStreamState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventStreamState._(value));

  @override
  bool operator ==(other) => other is EventStreamState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about the Kinesis data stream
class DestinationSummary {
  /// The status of enabling the Kinesis stream as a destination for export.
  final EventStreamDestinationStatus status;

  /// The StreamARN of the destination to deliver profile events to. For example,
  /// arn:aws:kinesis:region:account-id:stream/stream-name.
  final String uri;

  /// The timestamp when the status last changed to <code>UNHEALHY</code>.
  final DateTime? unhealthySince;

  DestinationSummary({
    required this.status,
    required this.uri,
    this.unhealthySince,
  });

  factory DestinationSummary.fromJson(Map<String, dynamic> json) {
    return DestinationSummary(
      status: EventStreamDestinationStatus.fromString(
          (json['Status'] as String?) ?? ''),
      uri: (json['Uri'] as String?) ?? '',
      unhealthySince: timeStampFromJson(json['UnhealthySince']),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final uri = this.uri;
    final unhealthySince = this.unhealthySince;
    return {
      'Status': status.value,
      'Uri': uri,
      if (unhealthySince != null)
        'UnhealthySince': unixTimestampToJson(unhealthySince),
    };
  }
}

class EventStreamDestinationStatus {
  static const healthy = EventStreamDestinationStatus._('HEALTHY');
  static const unhealthy = EventStreamDestinationStatus._('UNHEALTHY');

  final String value;

  const EventStreamDestinationStatus._(this.value);

  static const values = [healthy, unhealthy];

  static EventStreamDestinationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventStreamDestinationStatus._(value));

  @override
  bool operator ==(other) =>
      other is EventStreamDestinationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object in a list that represents a domain.
class ListDomainItem {
  /// The timestamp of when the domain was created.
  final DateTime createdAt;

  /// The unique name of the domain.
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  final DateTime lastUpdatedAt;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ListDomainItem({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    this.tags,
  });

  factory ListDomainItem.fromJson(Map<String, dynamic> json) {
    return ListDomainItem(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      domainName: (json['DomainName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Represents an item in the list of domain object types, containing basic
/// information about a specific object type within a domain.
class DomainObjectTypesListItem {
  /// The name that identifies the object type within the domain.
  final String objectTypeName;

  /// The timestamp of when the domain object type was created.
  final DateTime? createdAt;

  /// A description explaining the purpose and characteristics of this object
  /// type.
  final String? description;

  /// The timestamp of when the domain object type was most recently edited.
  final DateTime? lastUpdatedAt;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  DomainObjectTypesListItem({
    required this.objectTypeName,
    this.createdAt,
    this.description,
    this.lastUpdatedAt,
    this.tags,
  });

  factory DomainObjectTypesListItem.fromJson(Map<String, dynamic> json) {
    return DomainObjectTypesListItem(
      objectTypeName: (json['ObjectTypeName'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final objectTypeName = this.objectTypeName;
    final createdAt = this.createdAt;
    final description = this.description;
    final lastUpdatedAt = this.lastUpdatedAt;
    final tags = this.tags;
    return {
      'ObjectTypeName': objectTypeName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The layout object that contains LayoutDefinitionName, Description,
/// DisplayName, IsDefault, LayoutType, Tags, CreatedAt, LastUpdatedAt
class LayoutItem {
  /// The timestamp of when the layout was created.
  final DateTime createdAt;

  /// The description of the layout
  final String description;

  /// The display name of the layout
  final String displayName;

  /// The timestamp of when the layout was most recently updated.
  final DateTime lastUpdatedAt;

  /// The unique name of the layout.
  final String layoutDefinitionName;

  /// The type of layout that can be used to view data under customer profiles
  /// domain.
  final LayoutType layoutType;

  /// If set to true for a layout, this layout will be used by default to view
  /// data. If set to false, then layout will not be used by default but it can be
  /// used to view data by explicit selection on UI.
  final bool? isDefault;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  LayoutItem({
    required this.createdAt,
    required this.description,
    required this.displayName,
    required this.lastUpdatedAt,
    required this.layoutDefinitionName,
    required this.layoutType,
    this.isDefault,
    this.tags,
  });

  factory LayoutItem.fromJson(Map<String, dynamic> json) {
    return LayoutItem(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      description: (json['Description'] as String?) ?? '',
      displayName: (json['DisplayName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      layoutDefinitionName: (json['LayoutDefinitionName'] as String?) ?? '',
      layoutType: LayoutType.fromString((json['LayoutType'] as String?) ?? ''),
      isDefault: json['IsDefault'] as bool?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final layoutDefinitionName = this.layoutDefinitionName;
    final layoutType = this.layoutType;
    final isDefault = this.isDefault;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'Description': description,
      'DisplayName': displayName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'LayoutDefinitionName': layoutDefinitionName,
      'LayoutType': layoutType.value,
      if (isDefault != null) 'IsDefault': isDefault,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The details of a single calculated attribute for a profile.
class ListCalculatedAttributeForProfileItem {
  /// The unique name of the calculated attribute.
  final String? calculatedAttributeName;

  /// The display name of the calculated attribute.
  final String? displayName;

  /// Indicates whether the calculated attribute’s value is based on partial data.
  /// If data is partial, it is set to true.
  final String? isDataPartial;

  /// The timestamp of the newest object included in the calculated attribute
  /// calculation.
  final DateTime? lastObjectTimestamp;

  /// The value of the calculated attribute.
  final String? value;

  ListCalculatedAttributeForProfileItem({
    this.calculatedAttributeName,
    this.displayName,
    this.isDataPartial,
    this.lastObjectTimestamp,
    this.value,
  });

  factory ListCalculatedAttributeForProfileItem.fromJson(
      Map<String, dynamic> json) {
    return ListCalculatedAttributeForProfileItem(
      calculatedAttributeName: json['CalculatedAttributeName'] as String?,
      displayName: json['DisplayName'] as String?,
      isDataPartial: json['IsDataPartial'] as String?,
      lastObjectTimestamp: timeStampFromJson(json['LastObjectTimestamp']),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final calculatedAttributeName = this.calculatedAttributeName;
    final displayName = this.displayName;
    final isDataPartial = this.isDataPartial;
    final lastObjectTimestamp = this.lastObjectTimestamp;
    final value = this.value;
    return {
      if (calculatedAttributeName != null)
        'CalculatedAttributeName': calculatedAttributeName,
      if (displayName != null) 'DisplayName': displayName,
      if (isDataPartial != null) 'IsDataPartial': isDataPartial,
      if (lastObjectTimestamp != null)
        'LastObjectTimestamp': unixTimestampToJson(lastObjectTimestamp),
      if (value != null) 'Value': value,
    };
  }
}

/// The details of a single calculated attribute definition.
class ListCalculatedAttributeDefinitionItem {
  /// The unique name of the calculated attribute.
  final String? calculatedAttributeName;

  /// The threshold for the calculated attribute.
  final DateTime? createdAt;

  /// The threshold for the calculated attribute.
  final String? description;

  /// The display name of the calculated attribute.
  final String? displayName;

  /// The timestamp of when the calculated attribute definition was most recently
  /// edited.
  final DateTime? lastUpdatedAt;

  /// Status of the Calculated Attribute creation (whether all historical data has
  /// been indexed.)
  final ReadinessStatus? status;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Whether historical data ingested before the Calculated Attribute was created
  /// should be included in calculations.
  final bool? useHistoricalData;

  ListCalculatedAttributeDefinitionItem({
    this.calculatedAttributeName,
    this.createdAt,
    this.description,
    this.displayName,
    this.lastUpdatedAt,
    this.status,
    this.tags,
    this.useHistoricalData,
  });

  factory ListCalculatedAttributeDefinitionItem.fromJson(
      Map<String, dynamic> json) {
    return ListCalculatedAttributeDefinitionItem(
      calculatedAttributeName: json['CalculatedAttributeName'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      status: (json['Status'] as String?)?.let(ReadinessStatus.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useHistoricalData: json['UseHistoricalData'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final calculatedAttributeName = this.calculatedAttributeName;
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final status = this.status;
    final tags = this.tags;
    final useHistoricalData = this.useHistoricalData;
    return {
      if (calculatedAttributeName != null)
        'CalculatedAttributeName': calculatedAttributeName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (status != null) 'Status': status.value,
      if (tags != null) 'Tags': tags,
      if (useHistoricalData != null) 'UseHistoricalData': useHistoricalData,
    };
  }
}

/// List containing steps in workflow.
class WorkflowStepItem {
  /// Workflow step information specific to <code>APPFLOW_INTEGRATION</code>
  /// workflow.
  final AppflowIntegrationWorkflowStep? appflowIntegration;

  WorkflowStepItem({
    this.appflowIntegration,
  });

  factory WorkflowStepItem.fromJson(Map<String, dynamic> json) {
    return WorkflowStepItem(
      appflowIntegration: json['AppflowIntegration'] != null
          ? AppflowIntegrationWorkflowStep.fromJson(
              json['AppflowIntegration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appflowIntegration = this.appflowIntegration;
    return {
      if (appflowIntegration != null) 'AppflowIntegration': appflowIntegration,
    };
  }
}

/// Workflow step details for <code>APPFLOW_INTEGRATION</code> workflow.
class AppflowIntegrationWorkflowStep {
  /// End datetime of records pulled in batch during execution of workflow step
  /// for <code>APPFLOW_INTEGRATION</code> workflow.
  final String batchRecordsEndTime;

  /// Start datetime of records pulled in batch during execution of workflow step
  /// for <code>APPFLOW_INTEGRATION</code> workflow.
  final String batchRecordsStartTime;

  /// Creation timestamp of workflow step for <code>APPFLOW_INTEGRATION</code>
  /// workflow.
  final DateTime createdAt;

  /// Message indicating execution of workflow step for
  /// <code>APPFLOW_INTEGRATION</code> workflow.
  final String executionMessage;

  /// Name of the flow created during execution of workflow step.
  /// <code>APPFLOW_INTEGRATION</code> workflow type creates an appflow flow
  /// during workflow step execution on the customers behalf.
  final String flowName;

  /// Last updated timestamp for workflow step for
  /// <code>APPFLOW_INTEGRATION</code> workflow.
  final DateTime lastUpdatedAt;

  /// Total number of records processed during execution of workflow step for
  /// <code>APPFLOW_INTEGRATION</code> workflow.
  final int recordsProcessed;

  /// Workflow step status for <code>APPFLOW_INTEGRATION</code> workflow.
  final Status status;

  AppflowIntegrationWorkflowStep({
    required this.batchRecordsEndTime,
    required this.batchRecordsStartTime,
    required this.createdAt,
    required this.executionMessage,
    required this.flowName,
    required this.lastUpdatedAt,
    required this.recordsProcessed,
    required this.status,
  });

  factory AppflowIntegrationWorkflowStep.fromJson(Map<String, dynamic> json) {
    return AppflowIntegrationWorkflowStep(
      batchRecordsEndTime: (json['BatchRecordsEndTime'] as String?) ?? '',
      batchRecordsStartTime: (json['BatchRecordsStartTime'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      executionMessage: (json['ExecutionMessage'] as String?) ?? '',
      flowName: (json['FlowName'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      recordsProcessed: (json['RecordsProcessed'] as int?) ?? 0,
      status: Status.fromString((json['Status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final batchRecordsEndTime = this.batchRecordsEndTime;
    final batchRecordsStartTime = this.batchRecordsStartTime;
    final createdAt = this.createdAt;
    final executionMessage = this.executionMessage;
    final flowName = this.flowName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final recordsProcessed = this.recordsProcessed;
    final status = this.status;
    return {
      'BatchRecordsEndTime': batchRecordsEndTime,
      'BatchRecordsStartTime': batchRecordsStartTime,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ExecutionMessage': executionMessage,
      'FlowName': flowName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'RecordsProcessed': recordsProcessed,
      'Status': status.value,
    };
  }
}

/// Structure to hold workflow attributes.
class WorkflowAttributes {
  /// Workflow attributes specific to <code>APPFLOW_INTEGRATION</code> workflow.
  final AppflowIntegrationWorkflowAttributes? appflowIntegration;

  WorkflowAttributes({
    this.appflowIntegration,
  });

  factory WorkflowAttributes.fromJson(Map<String, dynamic> json) {
    return WorkflowAttributes(
      appflowIntegration: json['AppflowIntegration'] != null
          ? AppflowIntegrationWorkflowAttributes.fromJson(
              json['AppflowIntegration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appflowIntegration = this.appflowIntegration;
    return {
      if (appflowIntegration != null) 'AppflowIntegration': appflowIntegration,
    };
  }
}

/// Generic object containing workflow execution metrics.
class WorkflowMetrics {
  /// Workflow execution metrics for <code>APPFLOW_INTEGRATION</code> workflow.
  final AppflowIntegrationWorkflowMetrics? appflowIntegration;

  WorkflowMetrics({
    this.appflowIntegration,
  });

  factory WorkflowMetrics.fromJson(Map<String, dynamic> json) {
    return WorkflowMetrics(
      appflowIntegration: json['AppflowIntegration'] != null
          ? AppflowIntegrationWorkflowMetrics.fromJson(
              json['AppflowIntegration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appflowIntegration = this.appflowIntegration;
    return {
      if (appflowIntegration != null) 'AppflowIntegration': appflowIntegration,
    };
  }
}

/// Workflow specific execution metrics for <code>APPFLOW_INTEGRATION</code>
/// workflow.
class AppflowIntegrationWorkflowMetrics {
  /// Number of records processed in <code>APPFLOW_INTEGRATION</code> workflow.
  final int recordsProcessed;

  /// Total steps completed in <code>APPFLOW_INTEGRATION</code> workflow.
  final int stepsCompleted;

  /// Total steps in <code>APPFLOW_INTEGRATION</code> workflow.
  final int totalSteps;

  AppflowIntegrationWorkflowMetrics({
    required this.recordsProcessed,
    required this.stepsCompleted,
    required this.totalSteps,
  });

  factory AppflowIntegrationWorkflowMetrics.fromJson(
      Map<String, dynamic> json) {
    return AppflowIntegrationWorkflowMetrics(
      recordsProcessed: (json['RecordsProcessed'] as int?) ?? 0,
      stepsCompleted: (json['StepsCompleted'] as int?) ?? 0,
      totalSteps: (json['TotalSteps'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final recordsProcessed = this.recordsProcessed;
    final stepsCompleted = this.stepsCompleted;
    final totalSteps = this.totalSteps;
    return {
      'RecordsProcessed': recordsProcessed,
      'StepsCompleted': stepsCompleted,
      'TotalSteps': totalSteps,
    };
  }
}

/// Structure holding all <code>APPFLOW_INTEGRATION</code> specific workflow
/// attributes.
class AppflowIntegrationWorkflowAttributes {
  /// The name of the AppFlow connector profile used for ingestion.
  final String connectorProfileName;

  /// Specifies the source connector type, such as Salesforce, ServiceNow, and
  /// Marketo. Indicates source of ingestion.
  final SourceConnectorType sourceConnectorType;

  /// The Amazon Resource Name (ARN) of the IAM role. Customer Profiles assumes
  /// this role to create resources on your behalf as part of workflow execution.
  final String? roleArn;

  AppflowIntegrationWorkflowAttributes({
    required this.connectorProfileName,
    required this.sourceConnectorType,
    this.roleArn,
  });

  factory AppflowIntegrationWorkflowAttributes.fromJson(
      Map<String, dynamic> json) {
    return AppflowIntegrationWorkflowAttributes(
      connectorProfileName: (json['ConnectorProfileName'] as String?) ?? '',
      sourceConnectorType: SourceConnectorType.fromString(
          (json['SourceConnectorType'] as String?) ?? ''),
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorProfileName = this.connectorProfileName;
    final sourceConnectorType = this.sourceConnectorType;
    final roleArn = this.roleArn;
    return {
      'ConnectorProfileName': connectorProfileName,
      'SourceConnectorType': sourceConnectorType.value,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

/// The summary of results for an upload job, including the number of updated,
/// created, and failed records.
class ResultsSummary {
  /// The number of records that were newly created during the upload job.
  final int? createdRecords;

  /// The number of records that failed to be processed during the upload job.
  final int? failedRecords;

  /// The number of records that were updated during the upload job.
  final int? updatedRecords;

  ResultsSummary({
    this.createdRecords,
    this.failedRecords,
    this.updatedRecords,
  });

  factory ResultsSummary.fromJson(Map<String, dynamic> json) {
    return ResultsSummary(
      createdRecords: json['CreatedRecords'] as int?,
      failedRecords: json['FailedRecords'] as int?,
      updatedRecords: json['UpdatedRecords'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdRecords = this.createdRecords;
    final failedRecords = this.failedRecords;
    final updatedRecords = this.updatedRecords;
    return {
      if (createdRecords != null) 'CreatedRecords': createdRecords,
      if (failedRecords != null) 'FailedRecords': failedRecords,
      if (updatedRecords != null) 'UpdatedRecords': updatedRecords,
    };
  }
}

class MatchType {
  static const ruleBasedMatching = MatchType._('RULE_BASED_MATCHING');
  static const mlBasedMatching = MatchType._('ML_BASED_MATCHING');

  final String value;

  const MatchType._(this.value);

  static const values = [ruleBasedMatching, mlBasedMatching];

  static MatchType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MatchType._(value));

  @override
  bool operator ==(other) => other is MatchType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SegmentSnapshotStatus {
  static const completed = SegmentSnapshotStatus._('COMPLETED');
  static const inProgress = SegmentSnapshotStatus._('IN_PROGRESS');
  static const failed = SegmentSnapshotStatus._('FAILED');

  final String value;

  const SegmentSnapshotStatus._(this.value);

  static const values = [completed, inProgress, failed];

  static SegmentSnapshotStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SegmentSnapshotStatus._(value));

  @override
  bool operator ==(other) =>
      other is SegmentSnapshotStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DataFormat {
  static const csv = DataFormat._('CSV');
  static const jsonl = DataFormat._('JSONL');
  static const orc = DataFormat._('ORC');

  final String value;

  const DataFormat._(this.value);

  static const values = [csv, jsonl, orc];

  static DataFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DataFormat._(value));

  @override
  bool operator ==(other) => other is DataFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object that holds failures for membership.
class ProfileQueryFailures {
  /// A message describing the failure.
  final String message;

  /// The profile id the failure belongs to.
  final String profileId;

  /// The status describing the failure.
  final int? status;

  ProfileQueryFailures({
    required this.message,
    required this.profileId,
    this.status,
  });

  factory ProfileQueryFailures.fromJson(Map<String, dynamic> json) {
    return ProfileQueryFailures(
      message: (json['Message'] as String?) ?? '',
      profileId: (json['ProfileId'] as String?) ?? '',
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final profileId = this.profileId;
    final status = this.status;
    return {
      'Message': message,
      'ProfileId': profileId,
      if (status != null) 'Status': status,
    };
  }
}

/// Object that holds the results for membership.
class ProfileQueryResult {
  /// The profile id the result belongs to.
  final String profileId;

  /// Describes whether the profile was absent or present in the segment.
  final QueryResult queryResult;
  final Profile? profile;

  ProfileQueryResult({
    required this.profileId,
    required this.queryResult,
    this.profile,
  });

  factory ProfileQueryResult.fromJson(Map<String, dynamic> json) {
    return ProfileQueryResult(
      profileId: (json['ProfileId'] as String?) ?? '',
      queryResult:
          QueryResult.fromString((json['QueryResult'] as String?) ?? ''),
      profile: json['Profile'] != null
          ? Profile.fromJson(json['Profile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profileId = this.profileId;
    final queryResult = this.queryResult;
    final profile = this.profile;
    return {
      'ProfileId': profileId,
      'QueryResult': queryResult.value,
      if (profile != null) 'Profile': profile,
    };
  }
}

class QueryResult {
  static const present = QueryResult._('PRESENT');
  static const absent = QueryResult._('ABSENT');

  final String value;

  const QueryResult._(this.value);

  static const values = [present, absent];

  static QueryResult fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => QueryResult._(value));

  @override
  bool operator ==(other) => other is QueryResult && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class EstimateStatus {
  static const running = EstimateStatus._('RUNNING');
  static const succeeded = EstimateStatus._('SUCCEEDED');
  static const failed = EstimateStatus._('FAILED');

  final String value;

  const EstimateStatus._(this.value);

  static const values = [running, succeeded, failed];

  static EstimateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EstimateStatus._(value));

  @override
  bool operator ==(other) => other is EstimateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains all groups of the segment definition.
class SegmentGroup {
  /// Holds the list of groups within the segment definition.
  final List<Group>? groups;

  /// Defines whether to include or exclude the profiles that fit the segment
  /// criteria.
  final IncludeOptions? include;

  SegmentGroup({
    this.groups,
    this.include,
  });

  factory SegmentGroup.fromJson(Map<String, dynamic> json) {
    return SegmentGroup(
      groups: (json['Groups'] as List?)
          ?.nonNulls
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      include: (json['Include'] as String?)?.let(IncludeOptions.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final include = this.include;
    return {
      if (groups != null) 'Groups': groups,
      if (include != null) 'Include': include.value,
    };
  }
}

/// Defines how segments should be sorted and ordered in the results.
class SegmentSort {
  /// A list of attributes used to sort the segments and their ordering
  /// preferences.
  final List<SortAttribute> attributes;

  SegmentSort({
    required this.attributes,
  });

  factory SegmentSort.fromJson(Map<String, dynamic> json) {
    return SegmentSort(
      attributes: ((json['Attributes'] as List?) ?? const [])
          .nonNulls
          .map((e) => SortAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      'Attributes': attributes,
    };
  }
}

/// Defines the characteristics and rules for sorting by a specific attribute.
class SortAttribute {
  /// The name of the attribute to sort by.
  final String name;

  /// The sort order for the attribute (ascending or descending).
  final SegmentSortOrder order;

  /// The data type of the sort attribute (e.g., string, number, date).
  final SegmentSortDataType? dataType;

  /// The type of attribute (e.g., profile, calculated).
  final SortAttributeType? type;

  SortAttribute({
    required this.name,
    required this.order,
    this.dataType,
    this.type,
  });

  factory SortAttribute.fromJson(Map<String, dynamic> json) {
    return SortAttribute(
      name: (json['Name'] as String?) ?? '',
      order: SegmentSortOrder.fromString((json['Order'] as String?) ?? ''),
      dataType:
          (json['DataType'] as String?)?.let(SegmentSortDataType.fromString),
      type: (json['Type'] as String?)?.let(SortAttributeType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final order = this.order;
    final dataType = this.dataType;
    final type = this.type;
    return {
      'Name': name,
      'Order': order.value,
      if (dataType != null) 'DataType': dataType.value,
      if (type != null) 'Type': type.value,
    };
  }
}

class SegmentSortDataType {
  static const string = SegmentSortDataType._('STRING');
  static const number = SegmentSortDataType._('NUMBER');
  static const date = SegmentSortDataType._('DATE');

  final String value;

  const SegmentSortDataType._(this.value);

  static const values = [string, number, date];

  static SegmentSortDataType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SegmentSortDataType._(value));

  @override
  bool operator ==(other) =>
      other is SegmentSortDataType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SegmentSortOrder {
  static const asc = SegmentSortOrder._('ASC');
  static const desc = SegmentSortOrder._('DESC');

  final String value;

  const SegmentSortOrder._(this.value);

  static const values = [asc, desc];

  static SegmentSortOrder fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SegmentSortOrder._(value));

  @override
  bool operator ==(other) => other is SegmentSortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class SortAttributeType {
  static const profile = SortAttributeType._('PROFILE');
  static const calculated = SortAttributeType._('CALCULATED');

  final String value;

  const SortAttributeType._(this.value);

  static const values = [profile, calculated];

  static SortAttributeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SortAttributeType._(value));

  @override
  bool operator ==(other) => other is SortAttributeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IncludeOptions {
  static const all = IncludeOptions._('ALL');
  static const any = IncludeOptions._('ANY');
  static const none = IncludeOptions._('NONE');

  final String value;

  const IncludeOptions._(this.value);

  static const values = [all, any, none];

  static IncludeOptions fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IncludeOptions._(value));

  @override
  bool operator ==(other) => other is IncludeOptions && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains dimensions that determine what to segment on.
class Group {
  /// Defines the attributes to segment on.
  final List<Dimension>? dimensions;

  /// Defines the starting source of data.
  final List<SourceSegment>? sourceSegments;

  /// Defines how to interact with the source data.
  final IncludeOptions? sourceType;

  /// Defines how to interact with the profiles found in the current filtering.
  final IncludeOptions? type;

  Group({
    this.dimensions,
    this.sourceSegments,
    this.sourceType,
    this.type,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      dimensions: (json['Dimensions'] as List?)
          ?.nonNulls
          .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceSegments: (json['SourceSegments'] as List?)
          ?.nonNulls
          .map((e) => SourceSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceType:
          (json['SourceType'] as String?)?.let(IncludeOptions.fromString),
      type: (json['Type'] as String?)?.let(IncludeOptions.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final sourceSegments = this.sourceSegments;
    final sourceType = this.sourceType;
    final type = this.type;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (sourceSegments != null) 'SourceSegments': sourceSegments,
      if (sourceType != null) 'SourceType': sourceType.value,
      if (type != null) 'Type': type.value,
    };
  }
}

/// The source segments to build off of.
class SourceSegment {
  /// The unique name of the segment definition.
  final String? segmentDefinitionName;

  SourceSegment({
    this.segmentDefinitionName,
  });

  factory SourceSegment.fromJson(Map<String, dynamic> json) {
    return SourceSegment(
      segmentDefinitionName: json['SegmentDefinitionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final segmentDefinitionName = this.segmentDefinitionName;
    return {
      if (segmentDefinitionName != null)
        'SegmentDefinitionName': segmentDefinitionName,
    };
  }
}

/// Object that holds what profile and calculated attributes to segment on.
class Dimension {
  /// Object that holds the calculated attributes to segment on.
  final Map<String, CalculatedAttributeDimension>? calculatedAttributes;

  /// Object that holds the profile attributes to segment on.
  final ProfileAttributes? profileAttributes;

  Dimension({
    this.calculatedAttributes,
    this.profileAttributes,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      calculatedAttributes:
          (json['CalculatedAttributes'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k,
                  CalculatedAttributeDimension.fromJson(
                      e as Map<String, dynamic>))),
      profileAttributes: json['ProfileAttributes'] != null
          ? ProfileAttributes.fromJson(
              json['ProfileAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final calculatedAttributes = this.calculatedAttributes;
    final profileAttributes = this.profileAttributes;
    return {
      if (calculatedAttributes != null)
        'CalculatedAttributes': calculatedAttributes,
      if (profileAttributes != null) 'ProfileAttributes': profileAttributes,
    };
  }
}

/// The object used to segment on attributes within the customer profile.
class ProfileAttributes {
  /// A field to describe values to segment on within account number.
  final ProfileDimension? accountNumber;

  /// A field to describe values to segment on within additional information.
  final ExtraLengthValueProfileDimension? additionalInformation;

  /// A field to describe values to segment on within address.
  final AddressDimension? address;

  /// A field to describe values to segment on within attributes.
  final Map<String, AttributeDimension>? attributes;

  /// A field to describe values to segment on within billing address.
  final AddressDimension? billingAddress;

  /// A field to describe values to segment on within birthDate.
  final DateDimension? birthDate;

  /// A field to describe values to segment on within business email address.
  final ProfileDimension? businessEmailAddress;

  /// A field to describe values to segment on within business name.
  final ProfileDimension? businessName;

  /// A field to describe values to segment on within business phone number.
  final ProfileDimension? businessPhoneNumber;

  /// A field to describe values to segment on within email address.
  final ProfileDimension? emailAddress;

  /// A field to describe values to segment on within first name.
  final ProfileDimension? firstName;

  /// A field to describe values to segment on within genderString.
  final ProfileDimension? genderString;

  /// A field to describe values to segment on within home phone number.
  final ProfileDimension? homePhoneNumber;

  /// A field to describe values to segment on within last name.
  final ProfileDimension? lastName;

  /// A field to describe values to segment on within mailing address.
  final AddressDimension? mailingAddress;

  /// A field to describe values to segment on within middle name.
  final ProfileDimension? middleName;

  /// A field to describe values to segment on within mobile phone number.
  final ProfileDimension? mobilePhoneNumber;

  /// A field to describe values to segment on within partyTypeString.
  final ProfileDimension? partyTypeString;

  /// A field to describe values to segment on within personal email address.
  final ProfileDimension? personalEmailAddress;

  /// A field to describe values to segment on within phone number.
  final ProfileDimension? phoneNumber;

  /// A field to describe values to segment on within profile type.
  final ProfileTypeDimension? profileType;

  /// A field to describe values to segment on within shipping address.
  final AddressDimension? shippingAddress;

  ProfileAttributes({
    this.accountNumber,
    this.additionalInformation,
    this.address,
    this.attributes,
    this.billingAddress,
    this.birthDate,
    this.businessEmailAddress,
    this.businessName,
    this.businessPhoneNumber,
    this.emailAddress,
    this.firstName,
    this.genderString,
    this.homePhoneNumber,
    this.lastName,
    this.mailingAddress,
    this.middleName,
    this.mobilePhoneNumber,
    this.partyTypeString,
    this.personalEmailAddress,
    this.phoneNumber,
    this.profileType,
    this.shippingAddress,
  });

  factory ProfileAttributes.fromJson(Map<String, dynamic> json) {
    return ProfileAttributes(
      accountNumber: json['AccountNumber'] != null
          ? ProfileDimension.fromJson(
              json['AccountNumber'] as Map<String, dynamic>)
          : null,
      additionalInformation: json['AdditionalInformation'] != null
          ? ExtraLengthValueProfileDimension.fromJson(
              json['AdditionalInformation'] as Map<String, dynamic>)
          : null,
      address: json['Address'] != null
          ? AddressDimension.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      attributes: (json['Attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeDimension.fromJson(e as Map<String, dynamic>))),
      billingAddress: json['BillingAddress'] != null
          ? AddressDimension.fromJson(
              json['BillingAddress'] as Map<String, dynamic>)
          : null,
      birthDate: json['BirthDate'] != null
          ? DateDimension.fromJson(json['BirthDate'] as Map<String, dynamic>)
          : null,
      businessEmailAddress: json['BusinessEmailAddress'] != null
          ? ProfileDimension.fromJson(
              json['BusinessEmailAddress'] as Map<String, dynamic>)
          : null,
      businessName: json['BusinessName'] != null
          ? ProfileDimension.fromJson(
              json['BusinessName'] as Map<String, dynamic>)
          : null,
      businessPhoneNumber: json['BusinessPhoneNumber'] != null
          ? ProfileDimension.fromJson(
              json['BusinessPhoneNumber'] as Map<String, dynamic>)
          : null,
      emailAddress: json['EmailAddress'] != null
          ? ProfileDimension.fromJson(
              json['EmailAddress'] as Map<String, dynamic>)
          : null,
      firstName: json['FirstName'] != null
          ? ProfileDimension.fromJson(json['FirstName'] as Map<String, dynamic>)
          : null,
      genderString: json['GenderString'] != null
          ? ProfileDimension.fromJson(
              json['GenderString'] as Map<String, dynamic>)
          : null,
      homePhoneNumber: json['HomePhoneNumber'] != null
          ? ProfileDimension.fromJson(
              json['HomePhoneNumber'] as Map<String, dynamic>)
          : null,
      lastName: json['LastName'] != null
          ? ProfileDimension.fromJson(json['LastName'] as Map<String, dynamic>)
          : null,
      mailingAddress: json['MailingAddress'] != null
          ? AddressDimension.fromJson(
              json['MailingAddress'] as Map<String, dynamic>)
          : null,
      middleName: json['MiddleName'] != null
          ? ProfileDimension.fromJson(
              json['MiddleName'] as Map<String, dynamic>)
          : null,
      mobilePhoneNumber: json['MobilePhoneNumber'] != null
          ? ProfileDimension.fromJson(
              json['MobilePhoneNumber'] as Map<String, dynamic>)
          : null,
      partyTypeString: json['PartyTypeString'] != null
          ? ProfileDimension.fromJson(
              json['PartyTypeString'] as Map<String, dynamic>)
          : null,
      personalEmailAddress: json['PersonalEmailAddress'] != null
          ? ProfileDimension.fromJson(
              json['PersonalEmailAddress'] as Map<String, dynamic>)
          : null,
      phoneNumber: json['PhoneNumber'] != null
          ? ProfileDimension.fromJson(
              json['PhoneNumber'] as Map<String, dynamic>)
          : null,
      profileType: json['ProfileType'] != null
          ? ProfileTypeDimension.fromJson(
              json['ProfileType'] as Map<String, dynamic>)
          : null,
      shippingAddress: json['ShippingAddress'] != null
          ? AddressDimension.fromJson(
              json['ShippingAddress'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountNumber = this.accountNumber;
    final additionalInformation = this.additionalInformation;
    final address = this.address;
    final attributes = this.attributes;
    final billingAddress = this.billingAddress;
    final birthDate = this.birthDate;
    final businessEmailAddress = this.businessEmailAddress;
    final businessName = this.businessName;
    final businessPhoneNumber = this.businessPhoneNumber;
    final emailAddress = this.emailAddress;
    final firstName = this.firstName;
    final genderString = this.genderString;
    final homePhoneNumber = this.homePhoneNumber;
    final lastName = this.lastName;
    final mailingAddress = this.mailingAddress;
    final middleName = this.middleName;
    final mobilePhoneNumber = this.mobilePhoneNumber;
    final partyTypeString = this.partyTypeString;
    final personalEmailAddress = this.personalEmailAddress;
    final phoneNumber = this.phoneNumber;
    final profileType = this.profileType;
    final shippingAddress = this.shippingAddress;
    return {
      if (accountNumber != null) 'AccountNumber': accountNumber,
      if (additionalInformation != null)
        'AdditionalInformation': additionalInformation,
      if (address != null) 'Address': address,
      if (attributes != null) 'Attributes': attributes,
      if (billingAddress != null) 'BillingAddress': billingAddress,
      if (birthDate != null) 'BirthDate': birthDate,
      if (businessEmailAddress != null)
        'BusinessEmailAddress': businessEmailAddress,
      if (businessName != null) 'BusinessName': businessName,
      if (businessPhoneNumber != null)
        'BusinessPhoneNumber': businessPhoneNumber,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (firstName != null) 'FirstName': firstName,
      if (genderString != null) 'GenderString': genderString,
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyTypeString != null) 'PartyTypeString': partyTypeString,
      if (personalEmailAddress != null)
        'PersonalEmailAddress': personalEmailAddress,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (profileType != null) 'ProfileType': profileType,
      if (shippingAddress != null) 'ShippingAddress': shippingAddress,
    };
  }
}

/// Object that segments on Customer Profile's Calculated Attributes.
class CalculatedAttributeDimension {
  /// The action to segment with.
  final AttributeDimensionType dimensionType;

  /// The values to apply the DimensionType with.
  final List<String> values;

  /// Applies the given condition over the initial Calculated Attribute's
  /// definition.
  final ConditionOverrides? conditionOverrides;

  CalculatedAttributeDimension({
    required this.dimensionType,
    required this.values,
    this.conditionOverrides,
  });

  factory CalculatedAttributeDimension.fromJson(Map<String, dynamic> json) {
    return CalculatedAttributeDimension(
      dimensionType: AttributeDimensionType.fromString(
          (json['DimensionType'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      conditionOverrides: json['ConditionOverrides'] != null
          ? ConditionOverrides.fromJson(
              json['ConditionOverrides'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionType = this.dimensionType;
    final values = this.values;
    final conditionOverrides = this.conditionOverrides;
    return {
      'DimensionType': dimensionType.value,
      'Values': values,
      if (conditionOverrides != null) 'ConditionOverrides': conditionOverrides,
    };
  }
}

class AttributeDimensionType {
  static const inclusive = AttributeDimensionType._('INCLUSIVE');
  static const exclusive = AttributeDimensionType._('EXCLUSIVE');
  static const contains = AttributeDimensionType._('CONTAINS');
  static const beginsWith = AttributeDimensionType._('BEGINS_WITH');
  static const endsWith = AttributeDimensionType._('ENDS_WITH');
  static const before = AttributeDimensionType._('BEFORE');
  static const after = AttributeDimensionType._('AFTER');
  static const between = AttributeDimensionType._('BETWEEN');
  static const notBetween = AttributeDimensionType._('NOT_BETWEEN');
  static const on = AttributeDimensionType._('ON');
  static const greaterThan = AttributeDimensionType._('GREATER_THAN');
  static const lessThan = AttributeDimensionType._('LESS_THAN');
  static const greaterThanOrEqual =
      AttributeDimensionType._('GREATER_THAN_OR_EQUAL');
  static const lessThanOrEqual = AttributeDimensionType._('LESS_THAN_OR_EQUAL');
  static const equal = AttributeDimensionType._('EQUAL');

  final String value;

  const AttributeDimensionType._(this.value);

  static const values = [
    inclusive,
    exclusive,
    contains,
    beginsWith,
    endsWith,
    before,
    after,
    between,
    notBetween,
    on,
    greaterThan,
    lessThan,
    greaterThanOrEqual,
    lessThanOrEqual,
    equal
  ];

  static AttributeDimensionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttributeDimensionType._(value));

  @override
  bool operator ==(other) =>
      other is AttributeDimensionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object to override the original condition block of a calculated
/// attribute.
class ConditionOverrides {
  /// The relative time period over which data is included in the aggregation for
  /// this override.
  final RangeOverride? range;

  ConditionOverrides({
    this.range,
  });

  factory ConditionOverrides.fromJson(Map<String, dynamic> json) {
    return ConditionOverrides(
      range: json['Range'] != null
          ? RangeOverride.fromJson(json['Range'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final range = this.range;
    return {
      if (range != null) 'Range': range,
    };
  }
}

/// Overrides the original range on a calculated attribute definition.
class RangeOverride {
  /// The start time of when to include objects.
  final int start;

  /// The unit for start and end.
  final RangeUnit unit;

  /// The end time of when to include objects.
  final int? end;

  RangeOverride({
    required this.start,
    required this.unit,
    this.end,
  });

  factory RangeOverride.fromJson(Map<String, dynamic> json) {
    return RangeOverride(
      start: (json['Start'] as int?) ?? 0,
      unit: RangeUnit.fromString((json['Unit'] as String?) ?? ''),
      end: json['End'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final start = this.start;
    final unit = this.unit;
    final end = this.end;
    return {
      'Start': start,
      'Unit': unit.value,
      if (end != null) 'End': end,
    };
  }
}

class RangeUnit {
  static const days = RangeUnit._('DAYS');

  final String value;

  const RangeUnit._(this.value);

  static const values = [days];

  static RangeUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RangeUnit._(value));

  @override
  bool operator ==(other) => other is RangeUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object to hold the dimensions of a profile's fields to segment on.
class ProfileDimension {
  /// The action to segment on.
  final StringDimensionType dimensionType;

  /// The values to apply the DimensionType on.
  final List<String> values;

  ProfileDimension({
    required this.dimensionType,
    required this.values,
  });

  factory ProfileDimension.fromJson(Map<String, dynamic> json) {
    return ProfileDimension(
      dimensionType: StringDimensionType.fromString(
          (json['DimensionType'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionType = this.dimensionType;
    final values = this.values;
    return {
      'DimensionType': dimensionType.value,
      'Values': values,
    };
  }
}

/// Object that segments on various Customer profile's fields that are larger
/// than normal.
class ExtraLengthValueProfileDimension {
  /// The action to segment with.
  final StringDimensionType dimensionType;

  /// The values to apply the DimensionType on.
  final List<String> values;

  ExtraLengthValueProfileDimension({
    required this.dimensionType,
    required this.values,
  });

  factory ExtraLengthValueProfileDimension.fromJson(Map<String, dynamic> json) {
    return ExtraLengthValueProfileDimension(
      dimensionType: StringDimensionType.fromString(
          (json['DimensionType'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionType = this.dimensionType;
    final values = this.values;
    return {
      'DimensionType': dimensionType.value,
      'Values': values,
    };
  }
}

/// Object that segments on various Customer Profile's date fields.
class DateDimension {
  /// The action to segment with.
  final DateDimensionType dimensionType;

  /// The values to apply the DimensionType on.
  final List<String> values;

  DateDimension({
    required this.dimensionType,
    required this.values,
  });

  factory DateDimension.fromJson(Map<String, dynamic> json) {
    return DateDimension(
      dimensionType: DateDimensionType.fromString(
          (json['DimensionType'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionType = this.dimensionType;
    final values = this.values;
    return {
      'DimensionType': dimensionType.value,
      'Values': values,
    };
  }
}

/// Object that segments on Customer Profile's address object.
class AddressDimension {
  /// The city belonging to the address.
  final ProfileDimension? city;

  /// The country belonging to the address.
  final ProfileDimension? country;

  /// The county belonging to the address.
  final ProfileDimension? county;

  /// The postal code belonging to the address.
  final ProfileDimension? postalCode;

  /// The province belonging to the address.
  final ProfileDimension? province;

  /// The state belonging to the address.
  final ProfileDimension? state;

  AddressDimension({
    this.city,
    this.country,
    this.county,
    this.postalCode,
    this.province,
    this.state,
  });

  factory AddressDimension.fromJson(Map<String, dynamic> json) {
    return AddressDimension(
      city: json['City'] != null
          ? ProfileDimension.fromJson(json['City'] as Map<String, dynamic>)
          : null,
      country: json['Country'] != null
          ? ProfileDimension.fromJson(json['Country'] as Map<String, dynamic>)
          : null,
      county: json['County'] != null
          ? ProfileDimension.fromJson(json['County'] as Map<String, dynamic>)
          : null,
      postalCode: json['PostalCode'] != null
          ? ProfileDimension.fromJson(
              json['PostalCode'] as Map<String, dynamic>)
          : null,
      province: json['Province'] != null
          ? ProfileDimension.fromJson(json['Province'] as Map<String, dynamic>)
          : null,
      state: json['State'] != null
          ? ProfileDimension.fromJson(json['State'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final country = this.country;
    final county = this.county;
    final postalCode = this.postalCode;
    final province = this.province;
    final state = this.state;
    return {
      if (city != null) 'City': city,
      if (country != null) 'Country': country,
      if (county != null) 'County': county,
      if (postalCode != null) 'PostalCode': postalCode,
      if (province != null) 'Province': province,
      if (state != null) 'State': state,
    };
  }
}

/// Object to hold the dimension of a profile type field to segment on.
class ProfileTypeDimension {
  /// The action to segment on.
  final ProfileTypeDimensionType dimensionType;

  /// The values to apply the DimensionType on.
  final List<ProfileType> values;

  ProfileTypeDimension({
    required this.dimensionType,
    required this.values,
  });

  factory ProfileTypeDimension.fromJson(Map<String, dynamic> json) {
    return ProfileTypeDimension(
      dimensionType: ProfileTypeDimensionType.fromString(
          (json['DimensionType'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => ProfileType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionType = this.dimensionType;
    final values = this.values;
    return {
      'DimensionType': dimensionType.value,
      'Values': values.map((e) => e.value).toList(),
    };
  }
}

class ProfileTypeDimensionType {
  static const inclusive = ProfileTypeDimensionType._('INCLUSIVE');
  static const exclusive = ProfileTypeDimensionType._('EXCLUSIVE');

  final String value;

  const ProfileTypeDimensionType._(this.value);

  static const values = [inclusive, exclusive];

  static ProfileTypeDimensionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProfileTypeDimensionType._(value));

  @override
  bool operator ==(other) =>
      other is ProfileTypeDimensionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object that segments on various Customer Profile's fields.
class AttributeDimension {
  /// The action to segment with.
  final AttributeDimensionType dimensionType;

  /// The values to apply the DimensionType on.
  final List<String> values;

  AttributeDimension({
    required this.dimensionType,
    required this.values,
  });

  factory AttributeDimension.fromJson(Map<String, dynamic> json) {
    return AttributeDimension(
      dimensionType: AttributeDimensionType.fromString(
          (json['DimensionType'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionType = this.dimensionType;
    final values = this.values;
    return {
      'DimensionType': dimensionType.value,
      'Values': values,
    };
  }
}

class DateDimensionType {
  static const before = DateDimensionType._('BEFORE');
  static const after = DateDimensionType._('AFTER');
  static const between = DateDimensionType._('BETWEEN');
  static const notBetween = DateDimensionType._('NOT_BETWEEN');
  static const on = DateDimensionType._('ON');

  final String value;

  const DateDimensionType._(this.value);

  static const values = [before, after, between, notBetween, on];

  static DateDimensionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DateDimensionType._(value));

  @override
  bool operator ==(other) => other is DateDimensionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class StringDimensionType {
  static const inclusive = StringDimensionType._('INCLUSIVE');
  static const exclusive = StringDimensionType._('EXCLUSIVE');
  static const contains = StringDimensionType._('CONTAINS');
  static const beginsWith = StringDimensionType._('BEGINS_WITH');
  static const endsWith = StringDimensionType._('ENDS_WITH');

  final String value;

  const StringDimensionType._(this.value);

  static const values = [inclusive, exclusive, contains, beginsWith, endsWith];

  static StringDimensionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StringDimensionType._(value));

  @override
  bool operator ==(other) =>
      other is StringDimensionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains metrics and performance indicators from the training of a
/// recommender model.
class TrainingMetrics {
  /// A collection of performance metrics and statistics from the training
  /// process.
  final Map<TrainingMetricName, double>? metrics;

  /// The timestamp when these training metrics were recorded.
  final DateTime? time;

  TrainingMetrics({
    this.metrics,
    this.time,
  });

  factory TrainingMetrics.fromJson(Map<String, dynamic> json) {
    return TrainingMetrics(
      metrics: (json['Metrics'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(TrainingMetricName.fromString(k), e as double)),
      time: timeStampFromJson(json['Time']),
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final time = this.time;
    return {
      if (metrics != null)
        'Metrics': metrics.map((k, e) => MapEntry(k.value, e)),
      if (time != null) 'Time': unixTimestampToJson(time),
    };
  }
}

class TrainingMetricName {
  static const hit = TrainingMetricName._('hit');
  static const coverage = TrainingMetricName._('coverage');
  static const recall = TrainingMetricName._('recall');
  static const popularity = TrainingMetricName._('popularity');
  static const freshness = TrainingMetricName._('freshness');
  static const similarity = TrainingMetricName._('similarity');
  static const meanReciprocalRankAt_25 =
      TrainingMetricName._('mean_reciprocal_rank_at_25');
  static const normalizedDiscountedCumulativeGainAt_5 =
      TrainingMetricName._('normalized_discounted_cumulative_gain_at_5');
  static const normalizedDiscountedCumulativeGainAt_10 =
      TrainingMetricName._('normalized_discounted_cumulative_gain_at_10');
  static const normalizedDiscountedCumulativeGainAt_25 =
      TrainingMetricName._('normalized_discounted_cumulative_gain_at_25');
  static const precisionAt_5 = TrainingMetricName._('precision_at_5');
  static const precisionAt_10 = TrainingMetricName._('precision_at_10');
  static const precisionAt_25 = TrainingMetricName._('precision_at_25');

  final String value;

  const TrainingMetricName._(this.value);

  static const values = [
    hit,
    coverage,
    recall,
    popularity,
    freshness,
    similarity,
    meanReciprocalRankAt_25,
    normalizedDiscountedCumulativeGainAt_5,
    normalizedDiscountedCumulativeGainAt_10,
    normalizedDiscountedCumulativeGainAt_25,
    precisionAt_5,
    precisionAt_10,
    precisionAt_25
  ];

  static TrainingMetricName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrainingMetricName._(value));

  @override
  bool operator ==(other) =>
      other is TrainingMetricName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a single recommendation generated by the recommender system.
class Recommendation {
  /// The catalog item being recommended, including its complete details and
  /// attributes.
  final CatalogItem? catalogItem;

  /// Recommendation Score between 0 and 1.
  final double? score;

  Recommendation({
    this.catalogItem,
    this.score,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      catalogItem: json['CatalogItem'] != null
          ? CatalogItem.fromJson(json['CatalogItem'] as Map<String, dynamic>)
          : null,
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogItem = this.catalogItem;
    final score = this.score;
    return {
      if (catalogItem != null) 'CatalogItem': catalogItem,
      if (score != null) 'Score': score,
    };
  }
}

/// Represents an item in the catalog with its complete set of attributes and
/// metadata.
class CatalogItem {
  /// Supplementary information about the catalog item beyond the basic
  /// description.
  final String? additionalInformation;

  /// Additional attributes or properties associated with the catalog item stored
  /// as key-value pairs.
  final Map<String, String>? attributes;

  /// The category to which the catalog item belongs.
  final String? category;

  /// The product code or SKU of the catalog item.
  final String? code;

  /// The timestamp when the catalog item was created.
  final DateTime? createdAt;

  /// A detailed description of the catalog item.
  final String? description;

  /// The unique identifier for the catalog item.
  final String? id;

  /// The URL link to the item's image.
  final String? imageLink;

  /// The URL link to the item's detailed page or external resource.
  final String? link;

  /// The display name of the catalog item.
  final String? name;

  /// The price of the catalog item.
  final String? price;

  /// The type classification of the catalog item.
  final String? type;

  /// The timestamp when the catalog item was last updated.
  final DateTime? updatedAt;

  CatalogItem({
    this.additionalInformation,
    this.attributes,
    this.category,
    this.code,
    this.createdAt,
    this.description,
    this.id,
    this.imageLink,
    this.link,
    this.name,
    this.price,
    this.type,
    this.updatedAt,
  });

  factory CatalogItem.fromJson(Map<String, dynamic> json) {
    return CatalogItem(
      additionalInformation: json['AdditionalInformation'] as String?,
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      category: json['Category'] as String?,
      code: json['Code'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      imageLink: json['ImageLink'] as String?,
      link: json['Link'] as String?,
      name: json['Name'] as String?,
      price: json['Price'] as String?,
      type: json['Type'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalInformation = this.additionalInformation;
    final attributes = this.attributes;
    final category = this.category;
    final code = this.code;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final imageLink = this.imageLink;
    final link = this.link;
    final name = this.name;
    final price = this.price;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (additionalInformation != null)
        'AdditionalInformation': additionalInformation,
      if (attributes != null) 'Attributes': attributes,
      if (category != null) 'Category': category,
      if (code != null) 'Code': code,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (imageLink != null) 'ImageLink': imageLink,
      if (link != null) 'Link': link,
      if (name != null) 'Name': name,
      if (price != null) 'Price': price,
      if (type != null) 'Type': type,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Configuration for metadata to include in recommendation responses.
class MetadataConfig {
  /// A list of metadata column names from your Items dataset to include in the
  /// recommendation response.
  final List<String>? metadataColumns;

  MetadataConfig({
    this.metadataColumns,
  });

  Map<String, dynamic> toJson() {
    final metadataColumns = this.metadataColumns;
    return {
      if (metadataColumns != null) 'MetadataColumns': metadataColumns,
    };
  }
}

/// Contains information on a promotion. A promotion defines additional business
/// rules that apply to a configurable subset of recommended items.
class RecommenderPromotionalFilter {
  /// The name of the recommender filter to use for the promotion.
  final String? name;

  /// The percentage of recommended items to apply the promotion to.
  final int? percentPromotedItems;

  /// The name of the promotion.
  final String? promotionName;

  /// The values to use when promoting items. For each placeholder parameter in
  /// your promotion's filter expression, provide the parameter name (in matching
  /// case) as a key and the filter value(s) as the corresponding value. Separate
  /// multiple values for one parameter with a comma.
  final Map<String, String>? values;

  RecommenderPromotionalFilter({
    this.name,
    this.percentPromotedItems,
    this.promotionName,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final percentPromotedItems = this.percentPromotedItems;
    final promotionName = this.promotionName;
    final values = this.values;
    return {
      if (name != null) 'Name': name,
      if (percentPromotedItems != null)
        'PercentPromotedItems': percentPromotedItems,
      if (promotionName != null) 'PromotionName': promotionName,
      if (values != null) 'Values': values,
    };
  }
}

/// A filter that specifies criteria for including or excluding items from
/// recommendations.
class RecommenderFilter {
  /// The name of the recommender filter to apply.
  final String? name;

  /// The values to use when filtering recommendations. For each placeholder
  /// parameter in your filter expression, provide the parameter name (in matching
  /// case) as a key and the filter value(s) as the corresponding value. Separate
  /// multiple values for one parameter with a comma.
  final Map<String, String>? values;

  RecommenderFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name,
      if (values != null) 'Values': values,
    };
  }
}

/// Statistical measurements for object type attributes including basic
/// statistics and percentiles.
class GetObjectTypeAttributeStatisticsStats {
  /// The arithmetic mean of the attribute values.
  final double average;

  /// The maximum value found in the attribute dataset.
  final double maximum;

  /// The minimum value found in the attribute dataset.
  final double minimum;

  /// Percentile distribution statistics for the attribute values.
  final GetObjectTypeAttributeStatisticsPercentiles percentiles;

  /// The standard deviation of the attribute values, measuring their spread
  /// around the mean.
  final double standardDeviation;

  GetObjectTypeAttributeStatisticsStats({
    required this.average,
    required this.maximum,
    required this.minimum,
    required this.percentiles,
    required this.standardDeviation,
  });

  factory GetObjectTypeAttributeStatisticsStats.fromJson(
      Map<String, dynamic> json) {
    return GetObjectTypeAttributeStatisticsStats(
      average: (json['Average'] as double?) ?? 0,
      maximum: (json['Maximum'] as double?) ?? 0,
      minimum: (json['Minimum'] as double?) ?? 0,
      percentiles: GetObjectTypeAttributeStatisticsPercentiles.fromJson(
          (json['Percentiles'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      standardDeviation: (json['StandardDeviation'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final average = this.average;
    final maximum = this.maximum;
    final minimum = this.minimum;
    final percentiles = this.percentiles;
    final standardDeviation = this.standardDeviation;
    return {
      'Average': average,
      'Maximum': maximum,
      'Minimum': minimum,
      'Percentiles': percentiles,
      'StandardDeviation': standardDeviation,
    };
  }
}

/// Contains percentile statistics for object type attributes.
class GetObjectTypeAttributeStatisticsPercentiles {
  /// The 25th percentile value of the attribute.
  final double p25;

  /// The 5th percentile value of the attribute.
  final double p5;

  /// The 50th percentile (median) value of the attribute.
  final double p50;

  /// The 75th percentile value of the attribute.
  final double p75;

  /// The 95th percentile value of the attribute.
  final double p95;

  GetObjectTypeAttributeStatisticsPercentiles({
    required this.p25,
    required this.p5,
    required this.p50,
    required this.p75,
    required this.p95,
  });

  factory GetObjectTypeAttributeStatisticsPercentiles.fromJson(
      Map<String, dynamic> json) {
    return GetObjectTypeAttributeStatisticsPercentiles(
      p25: (json['P25'] as double?) ?? 0,
      p5: (json['P5'] as double?) ?? 0,
      p50: (json['P50'] as double?) ?? 0,
      p75: (json['P75'] as double?) ?? 0,
      p95: (json['P95'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final p25 = this.p25;
    final p5 = this.p5;
    final p50 = this.p50;
    final p75 = this.p75;
    final p95 = this.p95;
    return {
      'P25': p25,
      'P5': p5,
      'P50': p50,
      'P75': p75,
      'P95': p95,
    };
  }
}

/// The Match group object.
class MatchItem {
  /// A number between 0 and 1, where a higher score means higher similarity.
  /// Examining match confidence scores lets you distinguish between groups of
  /// similar records in which the system is highly confident (which you may
  /// decide to merge), groups of similar records about which the system is
  /// uncertain (which you may decide to have reviewed by a human), and groups of
  /// similar records that the system deems to be unlikely (which you may decide
  /// to reject). Given confidence scores vary as per the data input, it should
  /// not be used an absolute measure of matching quality.
  final double? confidenceScore;

  /// The unique identifiers for this group of profiles that match.
  final String? matchId;

  /// A list of identifiers for profiles that match.
  final List<String>? profileIds;

  MatchItem({
    this.confidenceScore,
    this.matchId,
    this.profileIds,
  });

  factory MatchItem.fromJson(Map<String, dynamic> json) {
    return MatchItem(
      confidenceScore: json['ConfidenceScore'] as double?,
      matchId: json['MatchId'] as String?,
      profileIds: (json['ProfileIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final confidenceScore = this.confidenceScore;
    final matchId = this.matchId;
    final profileIds = this.profileIds;
    return {
      if (confidenceScore != null) 'ConfidenceScore': confidenceScore,
      if (matchId != null) 'MatchId': matchId,
      if (profileIds != null) 'ProfileIds': profileIds,
    };
  }
}

/// Details of the destination being used for the EventStream.
class EventStreamDestinationDetails {
  /// The status of enabling the Kinesis stream as a destination for export.
  final EventStreamDestinationStatus status;

  /// The StreamARN of the destination to deliver profile events to. For example,
  /// arn:aws:kinesis:region:account-id:stream/stream-name.
  final String uri;

  /// The human-readable string that corresponds to the error or success while
  /// enabling the streaming destination.
  final String? message;

  /// The timestamp when the status last changed to <code>UNHEALHY</code>.
  final DateTime? unhealthySince;

  EventStreamDestinationDetails({
    required this.status,
    required this.uri,
    this.message,
    this.unhealthySince,
  });

  factory EventStreamDestinationDetails.fromJson(Map<String, dynamic> json) {
    return EventStreamDestinationDetails(
      status: EventStreamDestinationStatus.fromString(
          (json['Status'] as String?) ?? ''),
      uri: (json['Uri'] as String?) ?? '',
      message: json['Message'] as String?,
      unhealthySince: timeStampFromJson(json['UnhealthySince']),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final uri = this.uri;
    final message = this.message;
    final unhealthySince = this.unhealthySince;
    return {
      'Status': status.value,
      'Uri': uri,
      if (message != null) 'Message': message,
      if (unhealthySince != null)
        'UnhealthySince': unixTimestampToJson(unhealthySince),
    };
  }
}

/// Usage-specific statistics about the domain.
class DomainStats {
  /// The number of profiles that you are currently paying for in the domain. If
  /// you have more than 100 objects associated with a single profile, that
  /// profile counts as two profiles. If you have more than 200 objects, that
  /// profile counts as three, and so on.
  final int? meteringProfileCount;

  /// The total number of objects in domain.
  final int? objectCount;

  /// The total number of profiles currently in the domain.
  final int? profileCount;

  /// The total size, in bytes, of all objects in the domain.
  final int? totalSize;

  DomainStats({
    this.meteringProfileCount,
    this.objectCount,
    this.profileCount,
    this.totalSize,
  });

  factory DomainStats.fromJson(Map<String, dynamic> json) {
    return DomainStats(
      meteringProfileCount: json['MeteringProfileCount'] as int?,
      objectCount: json['ObjectCount'] as int?,
      profileCount: json['ProfileCount'] as int?,
      totalSize: json['TotalSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final meteringProfileCount = this.meteringProfileCount;
    final objectCount = this.objectCount;
    final profileCount = this.profileCount;
    final totalSize = this.totalSize;
    return {
      if (meteringProfileCount != null)
        'MeteringProfileCount': meteringProfileCount,
      if (objectCount != null) 'ObjectCount': objectCount,
      if (profileCount != null) 'ProfileCount': profileCount,
      if (totalSize != null) 'TotalSize': totalSize,
    };
  }
}

/// Defines how to filter the objects coming in for calculated attributes.
class Filter {
  /// Holds the list of Filter groups within the Filter definition.
  final List<FilterGroup> groups;

  /// Define whether to include or exclude objects for Calculated Attributed
  /// calculation that fit the filter groups criteria.
  final Include include;

  Filter({
    required this.groups,
    required this.include,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      groups: ((json['Groups'] as List?) ?? const [])
          .nonNulls
          .map((e) => FilterGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      include: Include.fromString((json['Include'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final include = this.include;
    return {
      'Groups': groups,
      'Include': include.value,
    };
  }
}

class Include {
  static const all = Include._('ALL');
  static const any = Include._('ANY');
  static const none = Include._('NONE');

  final String value;

  const Include._(this.value);

  static const values = [all, any, none];

  static Include fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Include._(value));

  @override
  bool operator ==(other) => other is Include && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object that holds the dimensions to filter on.
class FilterGroup {
  /// Object that holds the attributes to filter on.
  final List<FilterDimension> dimensions;

  /// The type of logical relationship between the dimensions of the Filter group.
  final Type type;

  FilterGroup({
    required this.dimensions,
    required this.type,
  });

  factory FilterGroup.fromJson(Map<String, dynamic> json) {
    return FilterGroup(
      dimensions: ((json['Dimensions'] as List?) ?? const [])
          .nonNulls
          .map((e) => FilterDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: Type.fromString((json['Type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final type = this.type;
    return {
      'Dimensions': dimensions,
      'Type': type.value,
    };
  }
}

class Type {
  static const all = Type._('ALL');
  static const any = Type._('ANY');
  static const none = Type._('NONE');

  final String value;

  const Type._(this.value);

  static const values = [all, any, none];

  static Type fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Type._(value));

  @override
  bool operator ==(other) => other is Type && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the map of attribute names to attribute dimensions.
class FilterDimension {
  /// Is the attribute within the FilterDimension map
  final Map<String, FilterAttributeDimension> attributes;

  FilterDimension({
    required this.attributes,
  });

  factory FilterDimension.fromJson(Map<String, dynamic> json) {
    return FilterDimension(
      attributes: ((json['Attributes'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k, FilterAttributeDimension.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    return {
      'Attributes': attributes,
    };
  }
}

/// Object that defines how to filter the incoming objects for the calculated
/// attribute.
class FilterAttributeDimension {
  /// The action to filter with.
  final FilterDimensionType dimensionType;

  /// The values to apply the DimensionType on.
  final List<String> values;

  FilterAttributeDimension({
    required this.dimensionType,
    required this.values,
  });

  factory FilterAttributeDimension.fromJson(Map<String, dynamic> json) {
    return FilterAttributeDimension(
      dimensionType: FilterDimensionType.fromString(
          (json['DimensionType'] as String?) ?? ''),
      values: ((json['Values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionType = this.dimensionType;
    final values = this.values;
    return {
      'DimensionType': dimensionType.value,
      'Values': values,
    };
  }
}

class FilterDimensionType {
  static const inclusive = FilterDimensionType._('INCLUSIVE');
  static const exclusive = FilterDimensionType._('EXCLUSIVE');
  static const contains = FilterDimensionType._('CONTAINS');
  static const beginsWith = FilterDimensionType._('BEGINS_WITH');
  static const endsWith = FilterDimensionType._('ENDS_WITH');
  static const before = FilterDimensionType._('BEFORE');
  static const after = FilterDimensionType._('AFTER');
  static const between = FilterDimensionType._('BETWEEN');
  static const notBetween = FilterDimensionType._('NOT_BETWEEN');
  static const on = FilterDimensionType._('ON');
  static const greaterThan = FilterDimensionType._('GREATER_THAN');
  static const lessThan = FilterDimensionType._('LESS_THAN');
  static const greaterThanOrEqual =
      FilterDimensionType._('GREATER_THAN_OR_EQUAL');
  static const lessThanOrEqual = FilterDimensionType._('LESS_THAN_OR_EQUAL');
  static const equal = FilterDimensionType._('EQUAL');

  final String value;

  const FilterDimensionType._(this.value);

  static const values = [
    inclusive,
    exclusive,
    contains,
    beginsWith,
    endsWith,
    before,
    after,
    between,
    notBetween,
    on,
    greaterThan,
    lessThan,
    greaterThanOrEqual,
    lessThanOrEqual,
    equal
  ];

  static FilterDimensionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FilterDimensionType._(value));

  @override
  bool operator ==(other) =>
      other is FilterDimensionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains <code>ProfileObjectType</code> mapping information from the model.
class DetectedProfileObjectType {
  /// A map of the name and the <code>ObjectType</code> field.
  final Map<String, ObjectTypeField>? fields;

  /// A list of unique keys that can be used to map data to a profile.
  final Map<String, List<ObjectTypeKey>>? keys;

  /// The format of <code>sourceLastUpdatedTimestamp</code> that was detected in
  /// fields.
  final String? sourceLastUpdatedTimestampFormat;

  DetectedProfileObjectType({
    this.fields,
    this.keys,
    this.sourceLastUpdatedTimestampFormat,
  });

  factory DetectedProfileObjectType.fromJson(Map<String, dynamic> json) {
    return DetectedProfileObjectType(
      fields: (json['Fields'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ObjectTypeField.fromJson(e as Map<String, dynamic>))),
      keys: (json['Keys'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k,
          (e as List)
              .nonNulls
              .map((e) => ObjectTypeKey.fromJson(e as Map<String, dynamic>))
              .toList())),
      sourceLastUpdatedTimestampFormat:
          json['SourceLastUpdatedTimestampFormat'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final keys = this.keys;
    final sourceLastUpdatedTimestampFormat =
        this.sourceLastUpdatedTimestampFormat;
    return {
      if (fields != null) 'Fields': fields,
      if (keys != null) 'Keys': keys,
      if (sourceLastUpdatedTimestampFormat != null)
        'SourceLastUpdatedTimestampFormat': sourceLastUpdatedTimestampFormat,
    };
  }
}

/// Contains all groups of the segment definition.
class SegmentGroupStructure {
  /// Holds the list of groups within the segment definition.
  final List<Group>? groups;

  /// Define whether to include or exclude the profiles that fit the segment
  /// criteria.
  final IncludeOptions? include;

  SegmentGroupStructure({
    this.groups,
    this.include,
  });

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final include = this.include;
    return {
      if (groups != null) 'Groups': groups,
      if (include != null) 'Include': include.value,
    };
  }
}

/// Configuration data for integration workflow.
class IntegrationConfig {
  /// Configuration data for <code>APPFLOW_INTEGRATION</code> workflow type.
  final AppflowIntegration? appflowIntegration;

  IntegrationConfig({
    this.appflowIntegration,
  });

  Map<String, dynamic> toJson() {
    final appflowIntegration = this.appflowIntegration;
    return {
      if (appflowIntegration != null) 'AppflowIntegration': appflowIntegration,
    };
  }
}

/// Details for workflow of type <code>APPFLOW_INTEGRATION</code>.
class AppflowIntegration {
  final FlowDefinition flowDefinition;

  /// Batches in workflow of type <code>APPFLOW_INTEGRATION</code>.
  final List<Batch>? batches;

  AppflowIntegration({
    required this.flowDefinition,
    this.batches,
  });

  Map<String, dynamic> toJson() {
    final flowDefinition = this.flowDefinition;
    final batches = this.batches;
    return {
      'FlowDefinition': flowDefinition,
      if (batches != null) 'Batches': batches,
    };
  }
}

/// Batch defines the boundaries for ingestion for each step in
/// <code>APPFLOW_INTEGRATION</code> workflow. <code>APPFLOW_INTEGRATION</code>
/// workflow splits ingestion based on these boundaries.
class Batch {
  /// End time of batch to split ingestion.
  final DateTime endTime;

  /// Start time of batch to split ingestion.
  final DateTime startTime;

  Batch({
    required this.endTime,
    required this.startTime,
  });

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// An item that failed to be added to the domain.
class BatchPutProfileObjectErrorItem {
  /// The HTTP status code for the error.
  final int code;

  /// The unique identifier of the item in the batch request that failed.
  final String id;

  /// A message describing the error.
  final String? message;

  BatchPutProfileObjectErrorItem({
    required this.code,
    required this.id,
    this.message,
  });

  factory BatchPutProfileObjectErrorItem.fromJson(Map<String, dynamic> json) {
    return BatchPutProfileObjectErrorItem(
      code: (json['Code'] as int?) ?? 0,
      id: (json['Id'] as String?) ?? '',
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final id = this.id;
    final message = this.message;
    return {
      'Code': code,
      'Id': id,
      if (message != null) 'Message': message,
    };
  }
}

/// An item that was successfully added to the domain.
class BatchPutProfileObjectResponseItem {
  /// The unique identifier of the item in the batch request.
  final String id;

  /// The unique identifier of the profile object generated by the service.
  final String profileObjectUniqueKey;

  BatchPutProfileObjectResponseItem({
    required this.id,
    required this.profileObjectUniqueKey,
  });

  factory BatchPutProfileObjectResponseItem.fromJson(
      Map<String, dynamic> json) {
    return BatchPutProfileObjectResponseItem(
      id: (json['Id'] as String?) ?? '',
      profileObjectUniqueKey: (json['ProfileObjectUniqueKey'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final profileObjectUniqueKey = this.profileObjectUniqueKey;
    return {
      'Id': id,
      'ProfileObjectUniqueKey': profileObjectUniqueKey,
    };
  }
}

/// An item to add to the domain as part of a batch request.
class BatchPutProfileObjectRequestItem {
  /// A unique identifier for this item in the batch request. Used to correlate
  /// items in the response.
  final String id;

  /// A string that is serialized from a JSON object.
  final String object;

  BatchPutProfileObjectRequestItem({
    required this.id,
    required this.object,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final object = this.object;
    return {
      'Id': id,
      'Object': object,
    };
  }
}

/// Error object describing why a specific profile failed.
class BatchGetProfileError {
  /// Status code for why a specific profile failed.
  final String code;

  /// Message describing why a specific profile failed.
  final String message;

  /// The profile id that failed.
  final String profileId;

  BatchGetProfileError({
    required this.code,
    required this.message,
    required this.profileId,
  });

  factory BatchGetProfileError.fromJson(Map<String, dynamic> json) {
    return BatchGetProfileError(
      code: (json['Code'] as String?) ?? '',
      message: (json['Message'] as String?) ?? '',
      profileId: (json['ProfileId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final profileId = this.profileId;
    return {
      'Code': code,
      'Message': message,
      'ProfileId': profileId,
    };
  }
}

/// The object containing the values of a single calculated attribute value.
class CalculatedAttributeValue {
  /// The unique name of the calculated attribute.
  final String? calculatedAttributeName;

  /// The display name of the calculated attribute.
  final String? displayName;

  /// Indicates whether the calculated attribute's value is based on partial data.
  /// If the data is partial, it is set to true.
  final String? isDataPartial;

  /// The timestamp of the newest object included in the calculated attribute
  /// calculation.
  final DateTime? lastObjectTimestamp;

  /// The profile id belonging to this calculated attribute value.
  final String? profileId;

  /// The value of the calculated attribute.
  final String? value;

  CalculatedAttributeValue({
    this.calculatedAttributeName,
    this.displayName,
    this.isDataPartial,
    this.lastObjectTimestamp,
    this.profileId,
    this.value,
  });

  factory CalculatedAttributeValue.fromJson(Map<String, dynamic> json) {
    return CalculatedAttributeValue(
      calculatedAttributeName: json['CalculatedAttributeName'] as String?,
      displayName: json['DisplayName'] as String?,
      isDataPartial: json['IsDataPartial'] as String?,
      lastObjectTimestamp: timeStampFromJson(json['LastObjectTimestamp']),
      profileId: json['ProfileId'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final calculatedAttributeName = this.calculatedAttributeName;
    final displayName = this.displayName;
    final isDataPartial = this.isDataPartial;
    final lastObjectTimestamp = this.lastObjectTimestamp;
    final profileId = this.profileId;
    final value = this.value;
    return {
      if (calculatedAttributeName != null)
        'CalculatedAttributeName': calculatedAttributeName,
      if (displayName != null) 'DisplayName': displayName,
      if (isDataPartial != null) 'IsDataPartial': isDataPartial,
      if (lastObjectTimestamp != null)
        'LastObjectTimestamp': unixTimestampToJson(lastObjectTimestamp),
      if (profileId != null) 'ProfileId': profileId,
      if (value != null) 'Value': value,
    };
  }
}

/// Error object describing why a specific profile and calculated attribute
/// failed.
class BatchGetCalculatedAttributeForProfileError {
  /// Status code for why a specific profile and calculated attribute failed.
  final String code;

  /// Message describing why a specific profile and calculated attribute failed.
  final String message;

  /// The profile id that failed.
  final String profileId;

  BatchGetCalculatedAttributeForProfileError({
    required this.code,
    required this.message,
    required this.profileId,
  });

  factory BatchGetCalculatedAttributeForProfileError.fromJson(
      Map<String, dynamic> json) {
    return BatchGetCalculatedAttributeForProfileError(
      code: (json['Code'] as String?) ?? '',
      message: (json['Message'] as String?) ?? '',
      profileId: (json['ProfileId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final profileId = this.profileId;
    return {
      'Code': code,
      'Message': message,
      'ProfileId': profileId,
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

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
