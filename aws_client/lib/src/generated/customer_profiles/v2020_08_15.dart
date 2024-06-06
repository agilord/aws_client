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

/// Amazon Connect Customer Profiles is a unified customer profile for your
/// contact center that has pre-built connectors powered by AppFlow that make it
/// easy to combine customer information from third party applications, such as
/// Salesforce (CRM), ServiceNow (ITSM), and your enterprise resource planning
/// (ERP), with contact history from your Amazon Connect contact center. If
/// you're new to Amazon Connect, you might find it helpful to review the <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/">Amazon Connect
/// Administrator Guide</a>.
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
            signingName: 'profile',
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
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Creates a new calculated attribute definition. After creation, new object
  /// data ingested into Customer Profiles will be included in the calculated
  /// attribute, which can be retrieved for a profile using the <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_GetCalculatedAttributeForProfile.html">GetCalculatedAttributeForProfile</a>
  /// API. Defining a calculated attribute makes it available for all profiles
  /// within a domain. Each calculated attribute can only reference one
  /// <code>ObjectType</code> and at most, two fields from that
  /// <code>ObjectType</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateCalculatedAttributeDefinitionResponse>
      createCalculatedAttributeDefinition({
    required AttributeDetails attributeDetails,
    required String calculatedAttributeName,
    required String domainName,
    required Statistic statistic,
    Conditions? conditions,
    String? description,
    String? displayName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'AttributeDetails': attributeDetails,
      'Statistic': statistic.toValue(),
      if (conditions != null) 'Conditions': conditions,
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (tags != null) 'Tags': tags,
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
  /// Each Amazon Connect instance can be associated with only one domain.
  /// Multiple Amazon Connect instances can be associated with one domain.
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
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [defaultExpirationDays] :
  /// The default number of days until the data within the domain expires.
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
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
  /// If <code>RuleBasedMatching</code> = true, Amazon Connect Customer Profiles
  /// will start to match and merge your profiles according to your
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

  /// Creates an event stream, which is a subscription to real-time events, such
  /// as when profiles are created and updated through Amazon Connect Customer
  /// Profiles.
  ///
  /// Each event stream can be associated with only one Kinesis Data Stream
  /// destination in the same region and Amazon Web Services account as the
  /// customer profiles domain
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Creates an integration workflow. An integration workflow is an async
  /// process which ingests historic data and sets up an integration for ongoing
  /// updates. The supported Amazon AppFlow sources are Salesforce, ServiceNow,
  /// and Marketo.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      'WorkflowType': workflowType.toValue(),
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
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [accountNumber] :
  /// A unique account number that you have given to the customer.
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
      if (firstName != null) 'FirstName': firstName,
      if (gender != null) 'Gender': gender.toValue(),
      if (genderString != null) 'GenderString': genderString,
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'PartyType': partyType.toValue(),
      if (partyTypeString != null) 'PartyTypeString': partyTypeString,
      if (personalEmailAddress != null)
        'PersonalEmailAddress': personalEmailAddress,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
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

  /// Deletes an existing calculated attribute definition. Note that deleting a
  /// default calculated attribute is possible, however once deleted, you will
  /// be unable to undo that action and will need to recreate it on your own
  /// using the CreateCalculatedAttributeDefinition API if you want it back.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Disables and deletes the specified event stream.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Removes an integration from a specific domain.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Deletes the specified workflow and all its corresponding resources. This
  /// is an async process.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      0,
      1,
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Returns information about the specified event stream in a specific domain.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Returns information about an Identity Resolution Job in a specific domain.
  ///
  /// Identity Resolution Jobs are set up using the Amazon Connect admin
  /// console. For more information, see <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/use-identity-resolution.html">Use
  /// Identity Resolution to consolidate similar profiles</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Returns the object types for a specific domain.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Returns a set of profiles that belong to the same matching group using the
  /// <code>matchId</code> or <code>profileId</code>. You can also specify the
  /// type of matching that you want for finding similar profiles using either
  /// <code>RULE_BASED_MATCHING</code> or <code>ML_BASED_MATCHING</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      'MatchType': matchType.toValue(),
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

  /// Get details of specified workflow.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Returns a list of all the domains for an AWS account that have been
  /// created.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Lists all of the Identity Resolution Jobs in your domain. The response
  /// sorts the list by <code>JobStartTime</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Lists all of the template information for object types.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Lists all of the templates available within the service.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Returns a list of objects associated with a profile of a given
  /// ProfileObjectType.
  ///
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Returns a set of <code>MatchIds</code> that belong to the given domain.
  ///
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Displays the tags associated with an Amazon Connect Customer Profiles
  /// resource. In Connect Customer Profiles, domains, profile object types, and
  /// integrations can be tagged.
  ///
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
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

  /// Query to list all workflows.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (status != null) 'Status': status.toValue(),
      if (workflowType != null) 'WorkflowType': workflowType.toValue(),
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
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
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  ///
  /// Parameter [uri] :
  /// The URI of the S3 bucket or any other type of data source.
  Future<PutIntegrationResponse> putIntegration({
    required String domainName,
    FlowDefinition? flowDefinition,
    String? objectTypeName,
    Map<String, String>? objectTypeNames,
    Map<String, String>? tags,
    String? uri,
  }) async {
    final $payload = <String, dynamic>{
      if (flowDefinition != null) 'FlowDefinition': flowDefinition,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (objectTypeNames != null) 'ObjectTypeNames': objectTypeNames,
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
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// Parameter [sourceLastUpdatedTimestampFormat] :
  /// The format of your <code>sourceLastUpdatedTimestamp</code> that was
  /// previously set up.
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
    String? sourceLastUpdatedTimestampFormat,
    Map<String, String>? tags,
    String? templateId,
  }) async {
    _s.validateNumRange(
      'expirationDays',
      expirationDays,
      1,
      1098,
    );
    final $payload = <String, dynamic>{
      'Description': description,
      if (allowProfileCreation != null)
        'AllowProfileCreation': allowProfileCreation,
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (expirationDays != null) 'ExpirationDays': expirationDays,
      if (fields != null) 'Fields': fields,
      if (keys != null) 'Keys': keys,
      if (sourceLastUpdatedTimestampFormat != null)
        'SourceLastUpdatedTimestampFormat': sourceLastUpdatedTimestampFormat,
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
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (logicalOperator != null) 'LogicalOperator': logicalOperator.toValue(),
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
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
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
  /// May throw [InternalServerException].
  /// May throw [BadRequestException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
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
  /// If <code>RuleBasedMatching</code> = true, Amazon Connect Customer Profiles
  /// will start to match and merge your profiles according to your
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

  /// Updates the properties of a profile. The ProfileId is required for
  /// updating a customer profile.
  ///
  /// When calling the UpdateProfile API, specifying an empty string value means
  /// that any existing value will be removed. Not specifying a string value
  /// means that any value already there will be kept.
  ///
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [domainName] :
  /// The unique name of the domain.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of a customer profile.
  ///
  /// Parameter [accountNumber] :
  /// A unique account number that you have given to the customer.
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
      if (firstName != null) 'FirstName': firstName,
      if (gender != null) 'Gender': gender.toValue(),
      if (genderString != null) 'GenderString': genderString,
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'PartyType': partyType.toValue(),
      if (partyTypeString != null) 'PartyTypeString': partyTypeString,
      if (personalEmailAddress != null)
        'PersonalEmailAddress': personalEmailAddress,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
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
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
      connectorProfileName: json['ConnectorProfileName'] as String,
      sourceConnectorType:
          (json['SourceConnectorType'] as String).toSourceConnectorType(),
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorProfileName = this.connectorProfileName;
    final sourceConnectorType = this.sourceConnectorType;
    final roleArn = this.roleArn;
    return {
      'ConnectorProfileName': connectorProfileName,
      'SourceConnectorType': sourceConnectorType.toValue(),
      if (roleArn != null) 'RoleArn': roleArn,
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
      recordsProcessed: json['RecordsProcessed'] as int,
      stepsCompleted: json['StepsCompleted'] as int,
      totalSteps: json['TotalSteps'] as int,
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
      batchRecordsEndTime: json['BatchRecordsEndTime'] as String,
      batchRecordsStartTime: json['BatchRecordsStartTime'] as String,
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      executionMessage: json['ExecutionMessage'] as String,
      flowName: json['FlowName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      recordsProcessed: json['RecordsProcessed'] as int,
      status: (json['Status'] as String).toStatus(),
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
      'Status': status.toValue(),
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
      attributes: (json['Attributes'] as List)
          .whereNotNull()
          .map((e) => AttributeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      expression: json['Expression'] as String,
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
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'Name': name,
    };
  }
}

enum AttributeMatchingModel {
  oneToOne,
  manyToMany,
}

extension AttributeMatchingModelValueExtension on AttributeMatchingModel {
  String toValue() {
    switch (this) {
      case AttributeMatchingModel.oneToOne:
        return 'ONE_TO_ONE';
      case AttributeMatchingModel.manyToMany:
        return 'MANY_TO_MANY';
    }
  }
}

extension AttributeMatchingModelFromString on String {
  AttributeMatchingModel toAttributeMatchingModel() {
    switch (this) {
      case 'ONE_TO_ONE':
        return AttributeMatchingModel.oneToOne;
      case 'MANY_TO_MANY':
        return AttributeMatchingModel.manyToMany;
    }
    throw Exception('$this is not known in enum AttributeMatchingModel');
  }
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
      attributeMatchingModel:
          (json['AttributeMatchingModel'] as String).toAttributeMatchingModel(),
      address: (json['Address'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      emailAddress: (json['EmailAddress'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      phoneNumber: (json['PhoneNumber'] as List?)
          ?.whereNotNull()
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
      'AttributeMatchingModel': attributeMatchingModel.toValue(),
      if (address != null) 'Address': address,
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
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
      enabled: json['Enabled'] as bool,
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
      conflictResolvingModel:
          (json['ConflictResolvingModel'] as String).toConflictResolvingModel(),
      sourceName: json['SourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conflictResolvingModel = this.conflictResolvingModel;
    final sourceName = this.sourceName;
    return {
      'ConflictResolvingModel': conflictResolvingModel.toValue(),
      if (sourceName != null) 'SourceName': sourceName,
    };
  }
}

enum ConflictResolvingModel {
  recency,
  source,
}

extension ConflictResolvingModelValueExtension on ConflictResolvingModel {
  String toValue() {
    switch (this) {
      case ConflictResolvingModel.recency:
        return 'RECENCY';
      case ConflictResolvingModel.source:
        return 'SOURCE';
    }
  }
}

extension ConflictResolvingModelFromString on String {
  ConflictResolvingModel toConflictResolvingModel() {
    switch (this) {
      case 'RECENCY':
        return ConflictResolvingModel.recency;
      case 'SOURCE':
        return ConflictResolvingModel.source;
    }
    throw Exception('$this is not known in enum ConflictResolvingModel');
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
      if (marketo != null) 'Marketo': marketo.toValue(),
      if (s3 != null) 'S3': s3.toValue(),
      if (salesforce != null) 'Salesforce': salesforce.toValue(),
      if (serviceNow != null) 'ServiceNow': serviceNow.toValue(),
      if (zendesk != null) 'Zendesk': zendesk.toValue(),
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
      matchingAttributesList: (json['MatchingAttributesList'] as List)
          .whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as String).toList())
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

  /// The timestamp of when the calculated attribute definition was most recently
  /// edited.
  final DateTime? lastUpdatedAt;

  /// The aggregation operation to perform for the calculated attribute.
  final Statistic? statistic;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  CreateCalculatedAttributeDefinitionResponse({
    this.attributeDetails,
    this.calculatedAttributeName,
    this.conditions,
    this.createdAt,
    this.description,
    this.displayName,
    this.lastUpdatedAt,
    this.statistic,
    this.tags,
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
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      statistic: (json['Statistic'] as String?)?.toStatistic(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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
    final statistic = this.statistic;
    final tags = this.tags;
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
      if (statistic != null) 'Statistic': statistic.toValue(),
      if (tags != null) 'Tags': tags,
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
  /// <code>RuleBasedMatching</code> = true, Amazon Connect Customer Profiles will
  /// start to match and merge your profiles according to your configuration in
  /// the <code>RuleBasedMatchingRequest</code>. You can use the
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
    this.deadLetterQueueUrl,
    this.defaultEncryptionKey,
    this.matching,
    this.ruleBasedMatching,
    this.tags,
  });

  factory CreateDomainResponse.fromJson(Map<String, dynamic> json) {
    return CreateDomainResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      defaultExpirationDays: json['DefaultExpirationDays'] as int,
      domainName: json['DomainName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
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
      if (deadLetterQueueUrl != null) 'DeadLetterQueueUrl': deadLetterQueueUrl,
      if (defaultEncryptionKey != null)
        'DefaultEncryptionKey': defaultEncryptionKey,
      if (matching != null) 'Matching': matching,
      if (ruleBasedMatching != null) 'RuleBasedMatching': ruleBasedMatching,
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
      eventStreamArn: json['EventStreamArn'] as String,
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
      message: json['Message'] as String,
      workflowId: json['WorkflowId'] as String,
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
      profileId: json['ProfileId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final profileId = this.profileId;
    return {
      'ProfileId': profileId,
    };
  }
}

enum DataPullMode {
  incremental,
  complete,
}

extension DataPullModeValueExtension on DataPullMode {
  String toValue() {
    switch (this) {
      case DataPullMode.incremental:
        return 'Incremental';
      case DataPullMode.complete:
        return 'Complete';
    }
  }
}

extension DataPullModeFromString on String {
  DataPullMode toDataPullMode() {
    switch (this) {
      case 'Incremental':
        return DataPullMode.incremental;
      case 'Complete':
        return DataPullMode.complete;
    }
    throw Exception('$this is not known in enum DataPullMode');
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
      message: json['Message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'Message': message,
    };
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

class DeleteIntegrationResponse {
  /// A message that indicates the delete request is done.
  final String message;

  DeleteIntegrationResponse({
    required this.message,
  });

  factory DeleteIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteIntegrationResponse(
      message: json['Message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      'Message': message,
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
      message: json['Message'] as String,
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

class DeleteWorkflowResponse {
  DeleteWorkflowResponse();

  factory DeleteWorkflowResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkflowResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
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
      status: (json['Status'] as String).toEventStreamDestinationStatus(),
      uri: json['Uri'] as String,
      unhealthySince: timeStampFromJson(json['UnhealthySince']),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final uri = this.uri;
    final unhealthySince = this.unhealthySince;
    return {
      'Status': status.toValue(),
      'Uri': uri,
      if (unhealthySince != null)
        'UnhealthySince': unixTimestampToJson(unhealthySince),
    };
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
          ?.whereNotNull()
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
              .whereNotNull()
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
      status: (json['Status'] as String).toEventStreamDestinationStatus(),
      uri: json['Uri'] as String,
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
      'Status': status.toValue(),
      'Uri': uri,
      if (message != null) 'Message': message,
      if (unhealthySince != null)
        'UnhealthySince': unixTimestampToJson(unhealthySince),
    };
  }
}

enum EventStreamDestinationStatus {
  healthy,
  unhealthy,
}

extension EventStreamDestinationStatusValueExtension
    on EventStreamDestinationStatus {
  String toValue() {
    switch (this) {
      case EventStreamDestinationStatus.healthy:
        return 'HEALTHY';
      case EventStreamDestinationStatus.unhealthy:
        return 'UNHEALTHY';
    }
  }
}

extension EventStreamDestinationStatusFromString on String {
  EventStreamDestinationStatus toEventStreamDestinationStatus() {
    switch (this) {
      case 'HEALTHY':
        return EventStreamDestinationStatus.healthy;
      case 'UNHEALTHY':
        return EventStreamDestinationStatus.unhealthy;
    }
    throw Exception('$this is not known in enum EventStreamDestinationStatus');
  }
}

enum EventStreamState {
  running,
  stopped,
}

extension EventStreamStateValueExtension on EventStreamState {
  String toValue() {
    switch (this) {
      case EventStreamState.running:
        return 'RUNNING';
      case EventStreamState.stopped:
        return 'STOPPED';
    }
  }
}

extension EventStreamStateFromString on String {
  EventStreamState toEventStreamState() {
    switch (this) {
      case 'RUNNING':
        return EventStreamState.running;
      case 'STOPPED':
        return EventStreamState.stopped;
    }
    throw Exception('$this is not known in enum EventStreamState');
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
      domainName: json['DomainName'] as String,
      eventStreamArn: json['EventStreamArn'] as String,
      eventStreamName: json['EventStreamName'] as String,
      state: (json['State'] as String).toEventStreamState(),
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
      'State': state.toValue(),
      if (destinationSummary != null) 'DestinationSummary': destinationSummary,
      if (stoppedSince != null)
        'StoppedSince': unixTimestampToJson(stoppedSince),
      if (tags != null) 'Tags': tags,
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

enum FieldContentType {
  string,
  number,
  phoneNumber,
  emailAddress,
  name,
}

extension FieldContentTypeValueExtension on FieldContentType {
  String toValue() {
    switch (this) {
      case FieldContentType.string:
        return 'STRING';
      case FieldContentType.number:
        return 'NUMBER';
      case FieldContentType.phoneNumber:
        return 'PHONE_NUMBER';
      case FieldContentType.emailAddress:
        return 'EMAIL_ADDRESS';
      case FieldContentType.name:
        return 'NAME';
    }
  }
}

extension FieldContentTypeFromString on String {
  FieldContentType toFieldContentType() {
    switch (this) {
      case 'STRING':
        return FieldContentType.string;
      case 'NUMBER':
        return FieldContentType.number;
      case 'PHONE_NUMBER':
        return FieldContentType.phoneNumber;
      case 'EMAIL_ADDRESS':
        return FieldContentType.emailAddress;
      case 'NAME':
        return FieldContentType.name;
    }
    throw Exception('$this is not known in enum FieldContentType');
  }
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
      if (shippingAddress != null) 'ShippingAddress': shippingAddress,
    };
  }
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
      values: (json['Values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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

@Deprecated('Deprecated')
enum Gender {
  male,
  female,
  unspecified,
}

extension GenderValueExtension on Gender {
  String toValue() {
    switch (this) {
      case Gender.male:
        return 'MALE';
      case Gender.female:
        return 'FEMALE';
      case Gender.unspecified:
        return 'UNSPECIFIED';
    }
  }
}

extension GenderFromString on String {
  Gender toGender() {
    switch (this) {
      case 'MALE':
        return Gender.male;
      case 'FEMALE':
        return Gender.female;
      case 'UNSPECIFIED':
        return Gender.unspecified;
    }
    throw Exception('$this is not known in enum Gender');
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
      domainName: json['DomainName'] as String,
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

  /// The timestamp of when the calculated attribute definition was most recently
  /// edited.
  final DateTime? lastUpdatedAt;

  /// The aggregation operation to perform for the calculated attribute.
  final Statistic? statistic;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetCalculatedAttributeDefinitionResponse({
    this.attributeDetails,
    this.calculatedAttributeName,
    this.conditions,
    this.createdAt,
    this.description,
    this.displayName,
    this.lastUpdatedAt,
    this.statistic,
    this.tags,
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
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      statistic: (json['Statistic'] as String?)?.toStatistic(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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
    final statistic = this.statistic;
    final tags = this.tags;
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
      if (statistic != null) 'Statistic': statistic.toValue(),
      if (tags != null) 'Tags': tags,
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

  /// The value of the calculated attribute.
  final String? value;

  GetCalculatedAttributeForProfileResponse({
    this.calculatedAttributeName,
    this.displayName,
    this.isDataPartial,
    this.value,
  });

  factory GetCalculatedAttributeForProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCalculatedAttributeForProfileResponse(
      calculatedAttributeName: json['CalculatedAttributeName'] as String?,
      displayName: json['DisplayName'] as String?,
      isDataPartial: json['IsDataPartial'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final calculatedAttributeName = this.calculatedAttributeName;
    final displayName = this.displayName;
    final isDataPartial = this.isDataPartial;
    final value = this.value;
    return {
      if (calculatedAttributeName != null)
        'CalculatedAttributeName': calculatedAttributeName,
      if (displayName != null) 'DisplayName': displayName,
      if (isDataPartial != null) 'IsDataPartial': isDataPartial,
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
  /// <code>RuleBasedMatching</code> = true, Amazon Connect Customer Profiles will
  /// start to match and merge your profiles according to your configuration in
  /// the <code>RuleBasedMatchingRequest</code>. You can use the
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
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      domainName: json['DomainName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
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
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      destinationDetails: EventStreamDestinationDetails.fromJson(
          json['DestinationDetails'] as Map<String, dynamic>),
      domainName: json['DomainName'] as String,
      eventStreamArn: json['EventStreamArn'] as String,
      state: (json['State'] as String).toEventStreamState(),
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
      'State': state.toValue(),
      if (stoppedSince != null)
        'StoppedSince': unixTimestampToJson(stoppedSince),
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
      status: (json['Status'] as String?)?.toIdentityResolutionJobStatus(),
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
      if (status != null) 'Status': status.toValue(),
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

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Unique identifier for the workflow.
  final String? workflowId;

  GetIntegrationResponse({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    required this.uri,
    this.isUnstructured,
    this.objectTypeName,
    this.objectTypeNames,
    this.tags,
    this.workflowId,
  });

  factory GetIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return GetIntegrationResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      domainName: json['DomainName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      uri: json['Uri'] as String,
      isUnstructured: json['IsUnstructured'] as bool?,
      objectTypeName: json['ObjectTypeName'] as String?,
      objectTypeNames: (json['ObjectTypeNames'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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
    final isUnstructured = this.isUnstructured;
    final objectTypeName = this.objectTypeName;
    final objectTypeNames = this.objectTypeNames;
    final tags = this.tags;
    final workflowId = this.workflowId;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'Uri': uri,
      if (isUnstructured != null) 'IsUnstructured': isUnstructured,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (objectTypeNames != null) 'ObjectTypeNames': objectTypeNames,
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
          ?.whereNotNull()
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

  /// The format of your <code>sourceLastUpdatedTimestamp</code> that was
  /// previously set up.
  final String? sourceLastUpdatedTimestampFormat;

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
    this.sourceLastUpdatedTimestampFormat,
    this.tags,
    this.templateId,
  });

  factory GetProfileObjectTypeResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileObjectTypeResponse(
      description: json['Description'] as String,
      objectTypeName: json['ObjectTypeName'] as String,
      allowProfileCreation: json['AllowProfileCreation'] as bool?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      encryptionKey: json['EncryptionKey'] as String?,
      expirationDays: json['ExpirationDays'] as int?,
      fields: (json['Fields'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ObjectTypeField.fromJson(e as Map<String, dynamic>))),
      keys: (json['Keys'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k,
          (e as List)
              .whereNotNull()
              .map((e) => ObjectTypeKey.fromJson(e as Map<String, dynamic>))
              .toList())),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      sourceLastUpdatedTimestampFormat:
          json['SourceLastUpdatedTimestampFormat'] as String?,
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
    final sourceLastUpdatedTimestampFormat =
        this.sourceLastUpdatedTimestampFormat;
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
      if (sourceLastUpdatedTimestampFormat != null)
        'SourceLastUpdatedTimestampFormat': sourceLastUpdatedTimestampFormat,
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
              .whereNotNull()
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
      matchType: (json['MatchType'] as String?)?.toMatchType(),
      nextToken: json['NextToken'] as String?,
      profileIds: (json['ProfileIds'] as List?)
          ?.whereNotNull()
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
      if (matchType != null) 'MatchType': matchType.toValue(),
      if (nextToken != null) 'NextToken': nextToken,
      if (profileIds != null) 'ProfileIds': profileIds,
      if (ruleLevel != null) 'RuleLevel': ruleLevel,
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
      status: (json['Status'] as String?)?.toStatus(),
      workflowId: json['WorkflowId'] as String?,
      workflowType: (json['WorkflowType'] as String?)?.toWorkflowType(),
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
      if (status != null) 'Status': status.toValue(),
      if (workflowId != null) 'WorkflowId': workflowId,
      if (workflowType != null) 'WorkflowType': workflowType.toValue(),
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
          ?.whereNotNull()
          .map((e) => WorkflowStepItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      workflowId: json['WorkflowId'] as String?,
      workflowType: (json['WorkflowType'] as String?)?.toWorkflowType(),
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
      if (workflowType != null) 'WorkflowType': workflowType.toValue(),
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
      status: (json['Status'] as String?)?.toIdentityResolutionJobStatus(),
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
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum IdentityResolutionJobStatus {
  pending,
  preprocessing,
  findMatching,
  merging,
  completed,
  partialSuccess,
  failed,
}

extension IdentityResolutionJobStatusValueExtension
    on IdentityResolutionJobStatus {
  String toValue() {
    switch (this) {
      case IdentityResolutionJobStatus.pending:
        return 'PENDING';
      case IdentityResolutionJobStatus.preprocessing:
        return 'PREPROCESSING';
      case IdentityResolutionJobStatus.findMatching:
        return 'FIND_MATCHING';
      case IdentityResolutionJobStatus.merging:
        return 'MERGING';
      case IdentityResolutionJobStatus.completed:
        return 'COMPLETED';
      case IdentityResolutionJobStatus.partialSuccess:
        return 'PARTIAL_SUCCESS';
      case IdentityResolutionJobStatus.failed:
        return 'FAILED';
    }
  }
}

extension IdentityResolutionJobStatusFromString on String {
  IdentityResolutionJobStatus toIdentityResolutionJobStatus() {
    switch (this) {
      case 'PENDING':
        return IdentityResolutionJobStatus.pending;
      case 'PREPROCESSING':
        return IdentityResolutionJobStatus.preprocessing;
      case 'FIND_MATCHING':
        return IdentityResolutionJobStatus.findMatching;
      case 'MERGING':
        return IdentityResolutionJobStatus.merging;
      case 'COMPLETED':
        return IdentityResolutionJobStatus.completed;
      case 'PARTIAL_SUCCESS':
        return IdentityResolutionJobStatus.partialSuccess;
      case 'FAILED':
        return IdentityResolutionJobStatus.failed;
    }
    throw Exception('$this is not known in enum IdentityResolutionJobStatus');
  }
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
      dayOfTheWeek:
          (json['DayOfTheWeek'] as String).toJobScheduleDayOfTheWeek(),
      time: json['Time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dayOfTheWeek = this.dayOfTheWeek;
    final time = this.time;
    return {
      'DayOfTheWeek': dayOfTheWeek.toValue(),
      'Time': time,
    };
  }
}

enum JobScheduleDayOfTheWeek {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

extension JobScheduleDayOfTheWeekValueExtension on JobScheduleDayOfTheWeek {
  String toValue() {
    switch (this) {
      case JobScheduleDayOfTheWeek.sunday:
        return 'SUNDAY';
      case JobScheduleDayOfTheWeek.monday:
        return 'MONDAY';
      case JobScheduleDayOfTheWeek.tuesday:
        return 'TUESDAY';
      case JobScheduleDayOfTheWeek.wednesday:
        return 'WEDNESDAY';
      case JobScheduleDayOfTheWeek.thursday:
        return 'THURSDAY';
      case JobScheduleDayOfTheWeek.friday:
        return 'FRIDAY';
      case JobScheduleDayOfTheWeek.saturday:
        return 'SATURDAY';
    }
  }
}

extension JobScheduleDayOfTheWeekFromString on String {
  JobScheduleDayOfTheWeek toJobScheduleDayOfTheWeek() {
    switch (this) {
      case 'SUNDAY':
        return JobScheduleDayOfTheWeek.sunday;
      case 'MONDAY':
        return JobScheduleDayOfTheWeek.monday;
      case 'TUESDAY':
        return JobScheduleDayOfTheWeek.tuesday;
      case 'WEDNESDAY':
        return JobScheduleDayOfTheWeek.wednesday;
      case 'THURSDAY':
        return JobScheduleDayOfTheWeek.thursday;
      case 'FRIDAY':
        return JobScheduleDayOfTheWeek.friday;
      case 'SATURDAY':
        return JobScheduleDayOfTheWeek.saturday;
    }
    throw Exception('$this is not known in enum JobScheduleDayOfTheWeek');
  }
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
          ?.whereNotNull()
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

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ListCalculatedAttributeDefinitionItem({
    this.calculatedAttributeName,
    this.createdAt,
    this.description,
    this.displayName,
    this.lastUpdatedAt,
    this.tags,
  });

  factory ListCalculatedAttributeDefinitionItem.fromJson(
      Map<String, dynamic> json) {
    return ListCalculatedAttributeDefinitionItem(
      calculatedAttributeName: json['CalculatedAttributeName'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      displayName: json['DisplayName'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final calculatedAttributeName = this.calculatedAttributeName;
    final createdAt = this.createdAt;
    final description = this.description;
    final displayName = this.displayName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final tags = this.tags;
    return {
      if (calculatedAttributeName != null)
        'CalculatedAttributeName': calculatedAttributeName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (displayName != null) 'DisplayName': displayName,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (tags != null) 'Tags': tags,
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
          ?.whereNotNull()
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

/// The details of a single calculated attribute for a profile.
class ListCalculatedAttributeForProfileItem {
  /// The unique name of the calculated attribute.
  final String? calculatedAttributeName;

  /// The display name of the calculated attribute.
  final String? displayName;

  /// Indicates whether the calculated attribute’s value is based on partial data.
  /// If data is partial, it is set to true.
  final String? isDataPartial;

  /// The value of the calculated attribute.
  final String? value;

  ListCalculatedAttributeForProfileItem({
    this.calculatedAttributeName,
    this.displayName,
    this.isDataPartial,
    this.value,
  });

  factory ListCalculatedAttributeForProfileItem.fromJson(
      Map<String, dynamic> json) {
    return ListCalculatedAttributeForProfileItem(
      calculatedAttributeName: json['CalculatedAttributeName'] as String?,
      displayName: json['DisplayName'] as String?,
      isDataPartial: json['IsDataPartial'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final calculatedAttributeName = this.calculatedAttributeName;
    final displayName = this.displayName;
    final isDataPartial = this.isDataPartial;
    final value = this.value;
    return {
      if (calculatedAttributeName != null)
        'CalculatedAttributeName': calculatedAttributeName,
      if (displayName != null) 'DisplayName': displayName,
      if (isDataPartial != null) 'IsDataPartial': isDataPartial,
      if (value != null) 'Value': value,
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
          ?.whereNotNull()
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
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      domainName: json['DomainName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

/// An integration in list of integrations.
class ListIntegrationItem {
  /// The timestamp of when the domain was created.
  final DateTime createdAt;

  /// The unique name of the domain.
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  final DateTime lastUpdatedAt;

  /// The URI of the S3 bucket or any other type of data source.
  final String uri;

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

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Unique identifier for the workflow.
  final String? workflowId;

  ListIntegrationItem({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    required this.uri,
    this.isUnstructured,
    this.objectTypeName,
    this.objectTypeNames,
    this.tags,
    this.workflowId,
  });

  factory ListIntegrationItem.fromJson(Map<String, dynamic> json) {
    return ListIntegrationItem(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      domainName: json['DomainName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      uri: json['Uri'] as String,
      isUnstructured: json['IsUnstructured'] as bool?,
      objectTypeName: json['ObjectTypeName'] as String?,
      objectTypeNames: (json['ObjectTypeNames'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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
    final isUnstructured = this.isUnstructured;
    final objectTypeName = this.objectTypeName;
    final objectTypeNames = this.objectTypeNames;
    final tags = this.tags;
    final workflowId = this.workflowId;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'Uri': uri,
      if (isUnstructured != null) 'IsUnstructured': isUnstructured,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (objectTypeNames != null) 'ObjectTypeNames': objectTypeNames,
      if (tags != null) 'Tags': tags,
      if (workflowId != null) 'WorkflowId': workflowId,
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
          ?.whereNotNull()
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

/// A ProfileObjectType instance.
class ListProfileObjectTypeItem {
  /// Description of the profile object type.
  final String description;

  /// The name of the profile object type.
  final String objectTypeName;

  /// The timestamp of when the domain was created.
  final DateTime? createdAt;

  /// The timestamp of when the domain was most recently edited.
  final DateTime? lastUpdatedAt;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ListProfileObjectTypeItem({
    required this.description,
    required this.objectTypeName,
    this.createdAt,
    this.lastUpdatedAt,
    this.tags,
  });

  factory ListProfileObjectTypeItem.fromJson(Map<String, dynamic> json) {
    return ListProfileObjectTypeItem(
      description: json['Description'] as String,
      objectTypeName: json['ObjectTypeName'] as String,
      createdAt: timeStampFromJson(json['CreatedAt']),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final objectTypeName = this.objectTypeName;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final tags = this.tags;
    return {
      'Description': description,
      'ObjectTypeName': objectTypeName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (tags != null) 'Tags': tags,
    };
  }
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      status: (json['Status'] as String).toStatus(),
      statusDescription: json['StatusDescription'] as String,
      workflowId: json['WorkflowId'] as String,
      workflowType: (json['WorkflowType'] as String).toWorkflowType(),
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
      'Status': status.toValue(),
      'StatusDescription': statusDescription,
      'WorkflowId': workflowId,
      'WorkflowType': workflowType.toValue(),
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
          ?.whereNotNull()
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

enum MarketoConnectorOperator {
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
  noOp,
}

extension MarketoConnectorOperatorValueExtension on MarketoConnectorOperator {
  String toValue() {
    switch (this) {
      case MarketoConnectorOperator.projection:
        return 'PROJECTION';
      case MarketoConnectorOperator.lessThan:
        return 'LESS_THAN';
      case MarketoConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case MarketoConnectorOperator.between:
        return 'BETWEEN';
      case MarketoConnectorOperator.addition:
        return 'ADDITION';
      case MarketoConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case MarketoConnectorOperator.division:
        return 'DIVISION';
      case MarketoConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case MarketoConnectorOperator.maskAll:
        return 'MASK_ALL';
      case MarketoConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case MarketoConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case MarketoConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case MarketoConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case MarketoConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case MarketoConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case MarketoConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension MarketoConnectorOperatorFromString on String {
  MarketoConnectorOperator toMarketoConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return MarketoConnectorOperator.projection;
      case 'LESS_THAN':
        return MarketoConnectorOperator.lessThan;
      case 'GREATER_THAN':
        return MarketoConnectorOperator.greaterThan;
      case 'BETWEEN':
        return MarketoConnectorOperator.between;
      case 'ADDITION':
        return MarketoConnectorOperator.addition;
      case 'MULTIPLICATION':
        return MarketoConnectorOperator.multiplication;
      case 'DIVISION':
        return MarketoConnectorOperator.division;
      case 'SUBTRACTION':
        return MarketoConnectorOperator.subtraction;
      case 'MASK_ALL':
        return MarketoConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return MarketoConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return MarketoConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return MarketoConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return MarketoConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return MarketoConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return MarketoConnectorOperator.validateNumeric;
      case 'NO_OP':
        return MarketoConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum MarketoConnectorOperator');
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
          ?.whereNotNull()
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

enum MatchType {
  ruleBasedMatching,
  mlBasedMatching,
}

extension MatchTypeValueExtension on MatchType {
  String toValue() {
    switch (this) {
      case MatchType.ruleBasedMatching:
        return 'RULE_BASED_MATCHING';
      case MatchType.mlBasedMatching:
        return 'ML_BASED_MATCHING';
    }
  }
}

extension MatchTypeFromString on String {
  MatchType toMatchType() {
    switch (this) {
      case 'RULE_BASED_MATCHING':
        return MatchType.ruleBasedMatching;
      case 'ML_BASED_MATCHING':
        return MatchType.mlBasedMatching;
    }
    throw Exception('$this is not known in enum MatchType');
  }
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
      rule: (json['Rule'] as List)
          .whereNotNull()
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

/// Represents a field in a ProfileObjectType.
class ObjectTypeField {
  /// The content type of the field. Used for determining equality when searching.
  final FieldContentType? contentType;

  /// A field of a ProfileObject. For example: _source.FirstName, where “_source”
  /// is a ProfileObjectType of a Zendesk user and “FirstName” is a field in that
  /// ObjectType.
  final String? source;

  /// The location of the data in the standard ProfileObject model. For example:
  /// _profile.Address.PostalCode.
  final String? target;

  ObjectTypeField({
    this.contentType,
    this.source,
    this.target,
  });

  factory ObjectTypeField.fromJson(Map<String, dynamic> json) {
    return ObjectTypeField(
      contentType: (json['ContentType'] as String?)?.toFieldContentType(),
      source: json['Source'] as String?,
      target: json['Target'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final source = this.source;
    final target = this.target;
    return {
      if (contentType != null) 'ContentType': contentType.toValue(),
      if (source != null) 'Source': source,
      if (target != null) 'Target': target,
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      standardIdentifiers: (json['StandardIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toStandardIdentifier())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldNames = this.fieldNames;
    final standardIdentifiers = this.standardIdentifiers;
    return {
      if (fieldNames != null) 'FieldNames': fieldNames,
      if (standardIdentifiers != null)
        'StandardIdentifiers':
            standardIdentifiers.map((e) => e.toValue()).toList(),
    };
  }
}

enum Operator {
  equalTo,
  greaterThan,
  lessThan,
  notEqualTo,
}

extension OperatorValueExtension on Operator {
  String toValue() {
    switch (this) {
      case Operator.equalTo:
        return 'EQUAL_TO';
      case Operator.greaterThan:
        return 'GREATER_THAN';
      case Operator.lessThan:
        return 'LESS_THAN';
      case Operator.notEqualTo:
        return 'NOT_EQUAL_TO';
    }
  }
}

extension OperatorFromString on String {
  Operator toOperator() {
    switch (this) {
      case 'EQUAL_TO':
        return Operator.equalTo;
      case 'GREATER_THAN':
        return Operator.greaterThan;
      case 'LESS_THAN':
        return Operator.lessThan;
      case 'NOT_EQUAL_TO':
        return Operator.notEqualTo;
    }
    throw Exception('$this is not known in enum Operator');
  }
}

enum OperatorPropertiesKeys {
  value,
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
  subfieldCategoryMap,
}

extension OperatorPropertiesKeysValueExtension on OperatorPropertiesKeys {
  String toValue() {
    switch (this) {
      case OperatorPropertiesKeys.value:
        return 'VALUE';
      case OperatorPropertiesKeys.$values:
        return 'VALUES';
      case OperatorPropertiesKeys.dataType:
        return 'DATA_TYPE';
      case OperatorPropertiesKeys.upperBound:
        return 'UPPER_BOUND';
      case OperatorPropertiesKeys.lowerBound:
        return 'LOWER_BOUND';
      case OperatorPropertiesKeys.sourceDataType:
        return 'SOURCE_DATA_TYPE';
      case OperatorPropertiesKeys.destinationDataType:
        return 'DESTINATION_DATA_TYPE';
      case OperatorPropertiesKeys.validationAction:
        return 'VALIDATION_ACTION';
      case OperatorPropertiesKeys.maskValue:
        return 'MASK_VALUE';
      case OperatorPropertiesKeys.maskLength:
        return 'MASK_LENGTH';
      case OperatorPropertiesKeys.truncateLength:
        return 'TRUNCATE_LENGTH';
      case OperatorPropertiesKeys.mathOperationFieldsOrder:
        return 'MATH_OPERATION_FIELDS_ORDER';
      case OperatorPropertiesKeys.concatFormat:
        return 'CONCAT_FORMAT';
      case OperatorPropertiesKeys.subfieldCategoryMap:
        return 'SUBFIELD_CATEGORY_MAP';
    }
  }
}

extension OperatorPropertiesKeysFromString on String {
  OperatorPropertiesKeys toOperatorPropertiesKeys() {
    switch (this) {
      case 'VALUE':
        return OperatorPropertiesKeys.value;
      case 'VALUES':
        return OperatorPropertiesKeys.$values;
      case 'DATA_TYPE':
        return OperatorPropertiesKeys.dataType;
      case 'UPPER_BOUND':
        return OperatorPropertiesKeys.upperBound;
      case 'LOWER_BOUND':
        return OperatorPropertiesKeys.lowerBound;
      case 'SOURCE_DATA_TYPE':
        return OperatorPropertiesKeys.sourceDataType;
      case 'DESTINATION_DATA_TYPE':
        return OperatorPropertiesKeys.destinationDataType;
      case 'VALIDATION_ACTION':
        return OperatorPropertiesKeys.validationAction;
      case 'MASK_VALUE':
        return OperatorPropertiesKeys.maskValue;
      case 'MASK_LENGTH':
        return OperatorPropertiesKeys.maskLength;
      case 'TRUNCATE_LENGTH':
        return OperatorPropertiesKeys.truncateLength;
      case 'MATH_OPERATION_FIELDS_ORDER':
        return OperatorPropertiesKeys.mathOperationFieldsOrder;
      case 'CONCAT_FORMAT':
        return OperatorPropertiesKeys.concatFormat;
      case 'SUBFIELD_CATEGORY_MAP':
        return OperatorPropertiesKeys.subfieldCategoryMap;
    }
    throw Exception('$this is not known in enum OperatorPropertiesKeys');
  }
}

@Deprecated('Deprecated')
enum PartyType {
  individual,
  business,
  other,
}

extension PartyTypeValueExtension on PartyType {
  String toValue() {
    switch (this) {
      case PartyType.individual:
        return 'INDIVIDUAL';
      case PartyType.business:
        return 'BUSINESS';
      case PartyType.other:
        return 'OTHER';
    }
  }
}

extension PartyTypeFromString on String {
  PartyType toPartyType() {
    switch (this) {
      case 'INDIVIDUAL':
        return PartyType.individual;
      case 'BUSINESS':
        return PartyType.business;
      case 'OTHER':
        return PartyType.other;
    }
    throw Exception('$this is not known in enum PartyType');
  }
}

/// The standard profile of a customer.
class Profile {
  /// A unique account number that you have given to the customer.
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
      firstName: json['FirstName'] as String?,
      foundByItems: (json['FoundByItems'] as List?)
          ?.whereNotNull()
          .map((e) => FoundByKeyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      gender: (json['Gender'] as String?)?.toGender(),
      genderString: json['GenderString'] as String?,
      homePhoneNumber: json['HomePhoneNumber'] as String?,
      lastName: json['LastName'] as String?,
      mailingAddress: json['MailingAddress'] != null
          ? Address.fromJson(json['MailingAddress'] as Map<String, dynamic>)
          : null,
      middleName: json['MiddleName'] as String?,
      mobilePhoneNumber: json['MobilePhoneNumber'] as String?,
      partyType: (json['PartyType'] as String?)?.toPartyType(),
      partyTypeString: json['PartyTypeString'] as String?,
      personalEmailAddress: json['PersonalEmailAddress'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      profileId: json['ProfileId'] as String?,
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
      if (foundByItems != null) 'FoundByItems': foundByItems,
      if (gender != null) 'Gender': gender.toValue(),
      if (genderString != null) 'GenderString': genderString,
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'PartyType': partyType.toValue(),
      if (partyTypeString != null) 'PartyTypeString': partyTypeString,
      if (personalEmailAddress != null)
        'PersonalEmailAddress': personalEmailAddress,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (profileId != null) 'ProfileId': profileId,
      if (shippingAddress != null) 'ShippingAddress': shippingAddress,
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

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  /// Unique identifier for the workflow.
  final String? workflowId;

  PutIntegrationResponse({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    required this.uri,
    this.isUnstructured,
    this.objectTypeName,
    this.objectTypeNames,
    this.tags,
    this.workflowId,
  });

  factory PutIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return PutIntegrationResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      domainName: json['DomainName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      uri: json['Uri'] as String,
      isUnstructured: json['IsUnstructured'] as bool?,
      objectTypeName: json['ObjectTypeName'] as String?,
      objectTypeNames: (json['ObjectTypeNames'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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
    final isUnstructured = this.isUnstructured;
    final objectTypeName = this.objectTypeName;
    final objectTypeNames = this.objectTypeNames;
    final tags = this.tags;
    final workflowId = this.workflowId;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'Uri': uri,
      if (isUnstructured != null) 'IsUnstructured': isUnstructured,
      if (objectTypeName != null) 'ObjectTypeName': objectTypeName,
      if (objectTypeNames != null) 'ObjectTypeNames': objectTypeNames,
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

  /// The format of your <code>sourceLastUpdatedTimestamp</code> that was
  /// previously set up in fields that were parsed using <a
  /// href="https://docs.oracle.com/javase/10/docs/api/java/text/SimpleDateFormat.html">SimpleDateFormat</a>.
  /// If you have <code>sourceLastUpdatedTimestamp</code> in your field, you must
  /// set up <code>sourceLastUpdatedTimestampFormat</code>.
  final String? sourceLastUpdatedTimestampFormat;

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
    this.sourceLastUpdatedTimestampFormat,
    this.tags,
    this.templateId,
  });

  factory PutProfileObjectTypeResponse.fromJson(Map<String, dynamic> json) {
    return PutProfileObjectTypeResponse(
      description: json['Description'] as String,
      objectTypeName: json['ObjectTypeName'] as String,
      allowProfileCreation: json['AllowProfileCreation'] as bool?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      encryptionKey: json['EncryptionKey'] as String?,
      expirationDays: json['ExpirationDays'] as int?,
      fields: (json['Fields'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ObjectTypeField.fromJson(e as Map<String, dynamic>))),
      keys: (json['Keys'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k,
          (e as List)
              .whereNotNull()
              .map((e) => ObjectTypeKey.fromJson(e as Map<String, dynamic>))
              .toList())),
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      sourceLastUpdatedTimestampFormat:
          json['SourceLastUpdatedTimestampFormat'] as String?,
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
    final sourceLastUpdatedTimestampFormat =
        this.sourceLastUpdatedTimestampFormat;
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
      if (sourceLastUpdatedTimestampFormat != null)
        'SourceLastUpdatedTimestampFormat': sourceLastUpdatedTimestampFormat,
      if (tags != null) 'Tags': tags,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

/// The relative time period over which data is included in the aggregation.
class Range {
  /// The unit of time.
  final Unit unit;

  /// The amount of time of the specified unit.
  final int value;

  Range({
    required this.unit,
    required this.value,
  });

  factory Range.fromJson(Map<String, dynamic> json) {
    return Range(
      unit: (json['Unit'] as String).toUnit(),
      value: json['Value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'Unit': unit.toValue(),
      'Value': value,
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
          ?.whereNotNull()
          .map((e) => MatchingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxAllowedRuleLevelForMatching:
          json['MaxAllowedRuleLevelForMatching'] as int?,
      maxAllowedRuleLevelForMerging:
          json['MaxAllowedRuleLevelForMerging'] as int?,
      status: (json['Status'] as String?)?.toRuleBasedMatchingStatus(),
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
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum RuleBasedMatchingStatus {
  pending,
  inProgress,
  active,
}

extension RuleBasedMatchingStatusValueExtension on RuleBasedMatchingStatus {
  String toValue() {
    switch (this) {
      case RuleBasedMatchingStatus.pending:
        return 'PENDING';
      case RuleBasedMatchingStatus.inProgress:
        return 'IN_PROGRESS';
      case RuleBasedMatchingStatus.active:
        return 'ACTIVE';
    }
  }
}

extension RuleBasedMatchingStatusFromString on String {
  RuleBasedMatchingStatus toRuleBasedMatchingStatus() {
    switch (this) {
      case 'PENDING':
        return RuleBasedMatchingStatus.pending;
      case 'IN_PROGRESS':
        return RuleBasedMatchingStatus.inProgress;
      case 'ACTIVE':
        return RuleBasedMatchingStatus.active;
    }
    throw Exception('$this is not known in enum RuleBasedMatchingStatus');
  }
}

enum S3ConnectorOperator {
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
  noOp,
}

extension S3ConnectorOperatorValueExtension on S3ConnectorOperator {
  String toValue() {
    switch (this) {
      case S3ConnectorOperator.projection:
        return 'PROJECTION';
      case S3ConnectorOperator.lessThan:
        return 'LESS_THAN';
      case S3ConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case S3ConnectorOperator.between:
        return 'BETWEEN';
      case S3ConnectorOperator.lessThanOrEqualTo:
        return 'LESS_THAN_OR_EQUAL_TO';
      case S3ConnectorOperator.greaterThanOrEqualTo:
        return 'GREATER_THAN_OR_EQUAL_TO';
      case S3ConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case S3ConnectorOperator.notEqualTo:
        return 'NOT_EQUAL_TO';
      case S3ConnectorOperator.addition:
        return 'ADDITION';
      case S3ConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case S3ConnectorOperator.division:
        return 'DIVISION';
      case S3ConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case S3ConnectorOperator.maskAll:
        return 'MASK_ALL';
      case S3ConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case S3ConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case S3ConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case S3ConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case S3ConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case S3ConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case S3ConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension S3ConnectorOperatorFromString on String {
  S3ConnectorOperator toS3ConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return S3ConnectorOperator.projection;
      case 'LESS_THAN':
        return S3ConnectorOperator.lessThan;
      case 'GREATER_THAN':
        return S3ConnectorOperator.greaterThan;
      case 'BETWEEN':
        return S3ConnectorOperator.between;
      case 'LESS_THAN_OR_EQUAL_TO':
        return S3ConnectorOperator.lessThanOrEqualTo;
      case 'GREATER_THAN_OR_EQUAL_TO':
        return S3ConnectorOperator.greaterThanOrEqualTo;
      case 'EQUAL_TO':
        return S3ConnectorOperator.equalTo;
      case 'NOT_EQUAL_TO':
        return S3ConnectorOperator.notEqualTo;
      case 'ADDITION':
        return S3ConnectorOperator.addition;
      case 'MULTIPLICATION':
        return S3ConnectorOperator.multiplication;
      case 'DIVISION':
        return S3ConnectorOperator.division;
      case 'SUBTRACTION':
        return S3ConnectorOperator.subtraction;
      case 'MASK_ALL':
        return S3ConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return S3ConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return S3ConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return S3ConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return S3ConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return S3ConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return S3ConnectorOperator.validateNumeric;
      case 'NO_OP':
        return S3ConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum S3ConnectorOperator');
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
      s3BucketName: json['S3BucketName'] as String,
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

enum SalesforceConnectorOperator {
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
  noOp,
}

extension SalesforceConnectorOperatorValueExtension
    on SalesforceConnectorOperator {
  String toValue() {
    switch (this) {
      case SalesforceConnectorOperator.projection:
        return 'PROJECTION';
      case SalesforceConnectorOperator.lessThan:
        return 'LESS_THAN';
      case SalesforceConnectorOperator.contains:
        return 'CONTAINS';
      case SalesforceConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case SalesforceConnectorOperator.between:
        return 'BETWEEN';
      case SalesforceConnectorOperator.lessThanOrEqualTo:
        return 'LESS_THAN_OR_EQUAL_TO';
      case SalesforceConnectorOperator.greaterThanOrEqualTo:
        return 'GREATER_THAN_OR_EQUAL_TO';
      case SalesforceConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case SalesforceConnectorOperator.notEqualTo:
        return 'NOT_EQUAL_TO';
      case SalesforceConnectorOperator.addition:
        return 'ADDITION';
      case SalesforceConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case SalesforceConnectorOperator.division:
        return 'DIVISION';
      case SalesforceConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case SalesforceConnectorOperator.maskAll:
        return 'MASK_ALL';
      case SalesforceConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case SalesforceConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case SalesforceConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case SalesforceConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case SalesforceConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case SalesforceConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case SalesforceConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension SalesforceConnectorOperatorFromString on String {
  SalesforceConnectorOperator toSalesforceConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return SalesforceConnectorOperator.projection;
      case 'LESS_THAN':
        return SalesforceConnectorOperator.lessThan;
      case 'CONTAINS':
        return SalesforceConnectorOperator.contains;
      case 'GREATER_THAN':
        return SalesforceConnectorOperator.greaterThan;
      case 'BETWEEN':
        return SalesforceConnectorOperator.between;
      case 'LESS_THAN_OR_EQUAL_TO':
        return SalesforceConnectorOperator.lessThanOrEqualTo;
      case 'GREATER_THAN_OR_EQUAL_TO':
        return SalesforceConnectorOperator.greaterThanOrEqualTo;
      case 'EQUAL_TO':
        return SalesforceConnectorOperator.equalTo;
      case 'NOT_EQUAL_TO':
        return SalesforceConnectorOperator.notEqualTo;
      case 'ADDITION':
        return SalesforceConnectorOperator.addition;
      case 'MULTIPLICATION':
        return SalesforceConnectorOperator.multiplication;
      case 'DIVISION':
        return SalesforceConnectorOperator.division;
      case 'SUBTRACTION':
        return SalesforceConnectorOperator.subtraction;
      case 'MASK_ALL':
        return SalesforceConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return SalesforceConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return SalesforceConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return SalesforceConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return SalesforceConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return SalesforceConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return SalesforceConnectorOperator.validateNumeric;
      case 'NO_OP':
        return SalesforceConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum SalesforceConnectorOperator');
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
      if (dataPullMode != null) 'DataPullMode': dataPullMode.toValue(),
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
          ?.whereNotNull()
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

enum ServiceNowConnectorOperator {
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
  noOp,
}

extension ServiceNowConnectorOperatorValueExtension
    on ServiceNowConnectorOperator {
  String toValue() {
    switch (this) {
      case ServiceNowConnectorOperator.projection:
        return 'PROJECTION';
      case ServiceNowConnectorOperator.contains:
        return 'CONTAINS';
      case ServiceNowConnectorOperator.lessThan:
        return 'LESS_THAN';
      case ServiceNowConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case ServiceNowConnectorOperator.between:
        return 'BETWEEN';
      case ServiceNowConnectorOperator.lessThanOrEqualTo:
        return 'LESS_THAN_OR_EQUAL_TO';
      case ServiceNowConnectorOperator.greaterThanOrEqualTo:
        return 'GREATER_THAN_OR_EQUAL_TO';
      case ServiceNowConnectorOperator.equalTo:
        return 'EQUAL_TO';
      case ServiceNowConnectorOperator.notEqualTo:
        return 'NOT_EQUAL_TO';
      case ServiceNowConnectorOperator.addition:
        return 'ADDITION';
      case ServiceNowConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case ServiceNowConnectorOperator.division:
        return 'DIVISION';
      case ServiceNowConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case ServiceNowConnectorOperator.maskAll:
        return 'MASK_ALL';
      case ServiceNowConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case ServiceNowConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case ServiceNowConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case ServiceNowConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case ServiceNowConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case ServiceNowConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case ServiceNowConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension ServiceNowConnectorOperatorFromString on String {
  ServiceNowConnectorOperator toServiceNowConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return ServiceNowConnectorOperator.projection;
      case 'CONTAINS':
        return ServiceNowConnectorOperator.contains;
      case 'LESS_THAN':
        return ServiceNowConnectorOperator.lessThan;
      case 'GREATER_THAN':
        return ServiceNowConnectorOperator.greaterThan;
      case 'BETWEEN':
        return ServiceNowConnectorOperator.between;
      case 'LESS_THAN_OR_EQUAL_TO':
        return ServiceNowConnectorOperator.lessThanOrEqualTo;
      case 'GREATER_THAN_OR_EQUAL_TO':
        return ServiceNowConnectorOperator.greaterThanOrEqualTo;
      case 'EQUAL_TO':
        return ServiceNowConnectorOperator.equalTo;
      case 'NOT_EQUAL_TO':
        return ServiceNowConnectorOperator.notEqualTo;
      case 'ADDITION':
        return ServiceNowConnectorOperator.addition;
      case 'MULTIPLICATION':
        return ServiceNowConnectorOperator.multiplication;
      case 'DIVISION':
        return ServiceNowConnectorOperator.division;
      case 'SUBTRACTION':
        return ServiceNowConnectorOperator.subtraction;
      case 'MASK_ALL':
        return ServiceNowConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return ServiceNowConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return ServiceNowConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return ServiceNowConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return ServiceNowConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return ServiceNowConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return ServiceNowConnectorOperator.validateNumeric;
      case 'NO_OP':
        return ServiceNowConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum ServiceNowConnectorOperator');
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

enum SourceConnectorType {
  salesforce,
  marketo,
  zendesk,
  servicenow,
  s3,
}

extension SourceConnectorTypeValueExtension on SourceConnectorType {
  String toValue() {
    switch (this) {
      case SourceConnectorType.salesforce:
        return 'Salesforce';
      case SourceConnectorType.marketo:
        return 'Marketo';
      case SourceConnectorType.zendesk:
        return 'Zendesk';
      case SourceConnectorType.servicenow:
        return 'Servicenow';
      case SourceConnectorType.s3:
        return 'S3';
    }
  }
}

extension SourceConnectorTypeFromString on String {
  SourceConnectorType toSourceConnectorType() {
    switch (this) {
      case 'Salesforce':
        return SourceConnectorType.salesforce;
      case 'Marketo':
        return SourceConnectorType.marketo;
      case 'Zendesk':
        return SourceConnectorType.zendesk;
      case 'Servicenow':
        return SourceConnectorType.servicenow;
      case 'S3':
        return SourceConnectorType.s3;
    }
    throw Exception('$this is not known in enum SourceConnectorType');
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
      'ConnectorType': connectorType.toValue(),
      'SourceConnectorProperties': sourceConnectorProperties,
      if (connectorProfileName != null)
        'ConnectorProfileName': connectorProfileName,
      if (incrementalPullConfig != null)
        'IncrementalPullConfig': incrementalPullConfig,
    };
  }
}

enum StandardIdentifier {
  profile,
  asset,
  $case,
  unique,
  secondary,
  lookupOnly,
  newOnly,
  order,
}

extension StandardIdentifierValueExtension on StandardIdentifier {
  String toValue() {
    switch (this) {
      case StandardIdentifier.profile:
        return 'PROFILE';
      case StandardIdentifier.asset:
        return 'ASSET';
      case StandardIdentifier.$case:
        return 'CASE';
      case StandardIdentifier.unique:
        return 'UNIQUE';
      case StandardIdentifier.secondary:
        return 'SECONDARY';
      case StandardIdentifier.lookupOnly:
        return 'LOOKUP_ONLY';
      case StandardIdentifier.newOnly:
        return 'NEW_ONLY';
      case StandardIdentifier.order:
        return 'ORDER';
    }
  }
}

extension StandardIdentifierFromString on String {
  StandardIdentifier toStandardIdentifier() {
    switch (this) {
      case 'PROFILE':
        return StandardIdentifier.profile;
      case 'ASSET':
        return StandardIdentifier.asset;
      case 'CASE':
        return StandardIdentifier.$case;
      case 'UNIQUE':
        return StandardIdentifier.unique;
      case 'SECONDARY':
        return StandardIdentifier.secondary;
      case 'LOOKUP_ONLY':
        return StandardIdentifier.lookupOnly;
      case 'NEW_ONLY':
        return StandardIdentifier.newOnly;
      case 'ORDER':
        return StandardIdentifier.order;
    }
    throw Exception('$this is not known in enum StandardIdentifier');
  }
}

enum Statistic {
  firstOccurrence,
  lastOccurrence,
  count,
  sum,
  minimum,
  maximum,
  average,
  maxOccurrence,
}

extension StatisticValueExtension on Statistic {
  String toValue() {
    switch (this) {
      case Statistic.firstOccurrence:
        return 'FIRST_OCCURRENCE';
      case Statistic.lastOccurrence:
        return 'LAST_OCCURRENCE';
      case Statistic.count:
        return 'COUNT';
      case Statistic.sum:
        return 'SUM';
      case Statistic.minimum:
        return 'MINIMUM';
      case Statistic.maximum:
        return 'MAXIMUM';
      case Statistic.average:
        return 'AVERAGE';
      case Statistic.maxOccurrence:
        return 'MAX_OCCURRENCE';
    }
  }
}

extension StatisticFromString on String {
  Statistic toStatistic() {
    switch (this) {
      case 'FIRST_OCCURRENCE':
        return Statistic.firstOccurrence;
      case 'LAST_OCCURRENCE':
        return Statistic.lastOccurrence;
      case 'COUNT':
        return Statistic.count;
      case 'SUM':
        return Statistic.sum;
      case 'MINIMUM':
        return Statistic.minimum;
      case 'MAXIMUM':
        return Statistic.maximum;
      case 'AVERAGE':
        return Statistic.average;
      case 'MAX_OCCURRENCE':
        return Statistic.maxOccurrence;
    }
    throw Exception('$this is not known in enum Statistic');
  }
}

enum Status {
  notStarted,
  inProgress,
  complete,
  failed,
  split,
  retry,
  cancelled,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.notStarted:
        return 'NOT_STARTED';
      case Status.inProgress:
        return 'IN_PROGRESS';
      case Status.complete:
        return 'COMPLETE';
      case Status.failed:
        return 'FAILED';
      case Status.split:
        return 'SPLIT';
      case Status.retry:
        return 'RETRY';
      case Status.cancelled:
        return 'CANCELLED';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return Status.notStarted;
      case 'IN_PROGRESS':
        return Status.inProgress;
      case 'COMPLETE':
        return Status.complete;
      case 'FAILED':
        return Status.failed;
      case 'SPLIT':
        return Status.split;
      case 'RETRY':
        return Status.retry;
      case 'CANCELLED':
        return Status.cancelled;
    }
    throw Exception('$this is not known in enum Status');
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
      'TaskType': taskType.toValue(),
      if (connectorOperator != null) 'ConnectorOperator': connectorOperator,
      if (destinationField != null) 'DestinationField': destinationField,
      if (taskProperties != null)
        'TaskProperties':
            taskProperties.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

enum TaskType {
  arithmetic,
  filter,
  map,
  mask,
  merge,
  truncate,
  validate,
}

extension TaskTypeValueExtension on TaskType {
  String toValue() {
    switch (this) {
      case TaskType.arithmetic:
        return 'Arithmetic';
      case TaskType.filter:
        return 'Filter';
      case TaskType.map:
        return 'Map';
      case TaskType.mask:
        return 'Mask';
      case TaskType.merge:
        return 'Merge';
      case TaskType.truncate:
        return 'Truncate';
      case TaskType.validate:
        return 'Validate';
    }
  }
}

extension TaskTypeFromString on String {
  TaskType toTaskType() {
    switch (this) {
      case 'Arithmetic':
        return TaskType.arithmetic;
      case 'Filter':
        return TaskType.filter;
      case 'Map':
        return TaskType.map;
      case 'Mask':
        return TaskType.mask;
      case 'Merge':
        return TaskType.merge;
      case 'Truncate':
        return TaskType.truncate;
      case 'Validate':
        return TaskType.validate;
    }
    throw Exception('$this is not known in enum TaskType');
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
      operator: (json['Operator'] as String).toOperator(),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final operator = this.operator;
    final value = this.value;
    return {
      'Operator': operator.toValue(),
      'Value': value,
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
      'TriggerType': triggerType.toValue(),
      if (triggerProperties != null) 'TriggerProperties': triggerProperties,
    };
  }
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

enum TriggerType {
  scheduled,
  event,
  onDemand,
}

extension TriggerTypeValueExtension on TriggerType {
  String toValue() {
    switch (this) {
      case TriggerType.scheduled:
        return 'Scheduled';
      case TriggerType.event:
        return 'Event';
      case TriggerType.onDemand:
        return 'OnDemand';
    }
  }
}

extension TriggerTypeFromString on String {
  TriggerType toTriggerType() {
    switch (this) {
      case 'Scheduled':
        return TriggerType.scheduled;
      case 'Event':
        return TriggerType.event;
      case 'OnDemand':
        return TriggerType.onDemand;
    }
    throw Exception('$this is not known in enum TriggerType');
  }
}

enum Unit {
  days,
}

extension UnitValueExtension on Unit {
  String toValue() {
    switch (this) {
      case Unit.days:
        return 'DAYS';
    }
  }
}

extension UnitFromString on String {
  Unit toUnit() {
    switch (this) {
      case 'DAYS':
        return Unit.days;
    }
    throw Exception('$this is not known in enum Unit');
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

  /// The aggregation operation to perform for the calculated attribute.
  final Statistic? statistic;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  UpdateCalculatedAttributeDefinitionResponse({
    this.attributeDetails,
    this.calculatedAttributeName,
    this.conditions,
    this.createdAt,
    this.description,
    this.displayName,
    this.lastUpdatedAt,
    this.statistic,
    this.tags,
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
      statistic: (json['Statistic'] as String?)?.toStatistic(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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
    final statistic = this.statistic;
    final tags = this.tags;
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
      if (statistic != null) 'Statistic': statistic.toValue(),
      if (tags != null) 'Tags': tags,
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
  /// <code>RuleBasedMatching</code> = true, Amazon Connect Customer Profiles will
  /// start to match and merge your profiles according to your configuration in
  /// the <code>RuleBasedMatchingRequest</code>. You can use the
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
    this.deadLetterQueueUrl,
    this.defaultEncryptionKey,
    this.defaultExpirationDays,
    this.matching,
    this.ruleBasedMatching,
    this.tags,
  });

  factory UpdateDomainResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      domainName: json['DomainName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
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

class UpdateProfileResponse {
  /// The unique identifier of a customer profile.
  final String profileId;

  UpdateProfileResponse({
    required this.profileId,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      profileId: json['ProfileId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final profileId = this.profileId;
    return {
      'ProfileId': profileId,
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

enum WorkflowType {
  appflowIntegration,
}

extension WorkflowTypeValueExtension on WorkflowType {
  String toValue() {
    switch (this) {
      case WorkflowType.appflowIntegration:
        return 'APPFLOW_INTEGRATION';
    }
  }
}

extension WorkflowTypeFromString on String {
  WorkflowType toWorkflowType() {
    switch (this) {
      case 'APPFLOW_INTEGRATION':
        return WorkflowType.appflowIntegration;
    }
    throw Exception('$this is not known in enum WorkflowType');
  }
}

enum ZendeskConnectorOperator {
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
  noOp,
}

extension ZendeskConnectorOperatorValueExtension on ZendeskConnectorOperator {
  String toValue() {
    switch (this) {
      case ZendeskConnectorOperator.projection:
        return 'PROJECTION';
      case ZendeskConnectorOperator.greaterThan:
        return 'GREATER_THAN';
      case ZendeskConnectorOperator.addition:
        return 'ADDITION';
      case ZendeskConnectorOperator.multiplication:
        return 'MULTIPLICATION';
      case ZendeskConnectorOperator.division:
        return 'DIVISION';
      case ZendeskConnectorOperator.subtraction:
        return 'SUBTRACTION';
      case ZendeskConnectorOperator.maskAll:
        return 'MASK_ALL';
      case ZendeskConnectorOperator.maskFirstN:
        return 'MASK_FIRST_N';
      case ZendeskConnectorOperator.maskLastN:
        return 'MASK_LAST_N';
      case ZendeskConnectorOperator.validateNonNull:
        return 'VALIDATE_NON_NULL';
      case ZendeskConnectorOperator.validateNonZero:
        return 'VALIDATE_NON_ZERO';
      case ZendeskConnectorOperator.validateNonNegative:
        return 'VALIDATE_NON_NEGATIVE';
      case ZendeskConnectorOperator.validateNumeric:
        return 'VALIDATE_NUMERIC';
      case ZendeskConnectorOperator.noOp:
        return 'NO_OP';
    }
  }
}

extension ZendeskConnectorOperatorFromString on String {
  ZendeskConnectorOperator toZendeskConnectorOperator() {
    switch (this) {
      case 'PROJECTION':
        return ZendeskConnectorOperator.projection;
      case 'GREATER_THAN':
        return ZendeskConnectorOperator.greaterThan;
      case 'ADDITION':
        return ZendeskConnectorOperator.addition;
      case 'MULTIPLICATION':
        return ZendeskConnectorOperator.multiplication;
      case 'DIVISION':
        return ZendeskConnectorOperator.division;
      case 'SUBTRACTION':
        return ZendeskConnectorOperator.subtraction;
      case 'MASK_ALL':
        return ZendeskConnectorOperator.maskAll;
      case 'MASK_FIRST_N':
        return ZendeskConnectorOperator.maskFirstN;
      case 'MASK_LAST_N':
        return ZendeskConnectorOperator.maskLastN;
      case 'VALIDATE_NON_NULL':
        return ZendeskConnectorOperator.validateNonNull;
      case 'VALIDATE_NON_ZERO':
        return ZendeskConnectorOperator.validateNonZero;
      case 'VALIDATE_NON_NEGATIVE':
        return ZendeskConnectorOperator.validateNonNegative;
      case 'VALIDATE_NUMERIC':
        return ZendeskConnectorOperator.validateNumeric;
      case 'NO_OP':
        return ZendeskConnectorOperator.noOp;
    }
    throw Exception('$this is not known in enum ZendeskConnectorOperator');
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

enum LogicalOperator {
  and,
  or,
}

extension LogicalOperatorValueExtension on LogicalOperator {
  String toValue() {
    switch (this) {
      case LogicalOperator.and:
        return 'AND';
      case LogicalOperator.or:
        return 'OR';
    }
  }
}

extension LogicalOperatorFromString on String {
  LogicalOperator toLogicalOperator() {
    switch (this) {
      case 'AND':
        return LogicalOperator.and;
      case 'OR':
        return LogicalOperator.or;
    }
    throw Exception('$this is not known in enum LogicalOperator');
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
