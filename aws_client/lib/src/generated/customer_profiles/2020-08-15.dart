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

/// Welcome to the Amazon Connect Customer Profiles API Reference. This guide
/// provides information about the Amazon Connect Customer Profiles API,
/// including supported operations, data types, parameters, and schemas.
class CustomerProfiles {
  final _s.RestJsonProtocol _protocol;
  CustomerProfiles({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// Associates a new key value with a specific profile, such as a Contact
  /// Trace Record (CTR) ContactId.
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
  /// A searchable identifier of a customer profile.
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(keyName, 'keyName');
    _s.validateStringLength(
      'keyName',
      keyName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    ArgumentError.checkNotNull(values, 'values');
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

  /// Creates a domain, which is a container for all customer data, such as
  /// customer profile attributes, object types, profile keys, and encryption
  /// keys. You can create multiple domains, and each domain can have multiple
  /// third-party integrations.
  ///
  /// Each Amazon Connect instance can be associated with only one domain.
  /// Multiple Amazon Connect instances can be associated with one domain.
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
  /// The process of matching duplicate profiles. This process runs every
  /// Saturday at 12AM.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateDomainResponse> createDomain({
    required int defaultExpirationDays,
    required String domainName,
    String? deadLetterQueueUrl,
    String? defaultEncryptionKey,
    MatchingRequest? matching,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(defaultExpirationDays, 'defaultExpirationDays');
    _s.validateNumRange(
      'defaultExpirationDays',
      defaultExpirationDays,
      1,
      1098,
      isRequired: true,
    );
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'deadLetterQueueUrl',
      deadLetterQueueUrl,
      0,
      255,
    );
    _s.validateStringLength(
      'defaultEncryptionKey',
      defaultEncryptionKey,
      0,
      255,
    );
    final $payload = <String, dynamic>{
      'DefaultExpirationDays': defaultExpirationDays,
      if (deadLetterQueueUrl != null) 'DeadLetterQueueUrl': deadLetterQueueUrl,
      if (defaultEncryptionKey != null)
        'DefaultEncryptionKey': defaultEncryptionKey,
      if (matching != null) 'Matching': matching,
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
    String? homePhoneNumber,
    String? lastName,
    Address? mailingAddress,
    String? middleName,
    String? mobilePhoneNumber,
    PartyType? partyType,
    String? personalEmailAddress,
    String? phoneNumber,
    Address? shippingAddress,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'accountNumber',
      accountNumber,
      1,
      255,
    );
    _s.validateStringLength(
      'additionalInformation',
      additionalInformation,
      1,
      1000,
    );
    _s.validateStringLength(
      'birthDate',
      birthDate,
      1,
      255,
    );
    _s.validateStringLength(
      'businessEmailAddress',
      businessEmailAddress,
      1,
      255,
    );
    _s.validateStringLength(
      'businessName',
      businessName,
      1,
      255,
    );
    _s.validateStringLength(
      'businessPhoneNumber',
      businessPhoneNumber,
      1,
      255,
    );
    _s.validateStringLength(
      'emailAddress',
      emailAddress,
      1,
      255,
    );
    _s.validateStringLength(
      'firstName',
      firstName,
      1,
      255,
    );
    _s.validateStringLength(
      'homePhoneNumber',
      homePhoneNumber,
      1,
      255,
    );
    _s.validateStringLength(
      'lastName',
      lastName,
      1,
      255,
    );
    _s.validateStringLength(
      'middleName',
      middleName,
      1,
      255,
    );
    _s.validateStringLength(
      'mobilePhoneNumber',
      mobilePhoneNumber,
      1,
      255,
    );
    _s.validateStringLength(
      'personalEmailAddress',
      personalEmailAddress,
      1,
      255,
    );
    _s.validateStringLength(
      'phoneNumber',
      phoneNumber,
      1,
      255,
    );
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
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'PartyType': partyType.toValue(),
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainResponse.fromJson(response);
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(uri, 'uri');
    _s.validateStringLength(
      'uri',
      uri,
      1,
      255,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(keyName, 'keyName');
    _s.validateStringLength(
      'keyName',
      keyName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    ArgumentError.checkNotNull(values, 'values');
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(objectTypeName, 'objectTypeName');
    _s.validateStringLength(
      'objectTypeName',
      objectTypeName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    ArgumentError.checkNotNull(
        profileObjectUniqueKey, 'profileObjectUniqueKey');
    _s.validateStringLength(
      'profileObjectUniqueKey',
      profileObjectUniqueKey,
      1,
      255,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(objectTypeName, 'objectTypeName');
    _s.validateStringLength(
      'objectTypeName',
      objectTypeName,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domains/${Uri.encodeComponent(domainName)}/object-types/${Uri.encodeComponent(objectTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProfileObjectTypeResponse.fromJson(response);
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainResponse.fromJson(response);
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(uri, 'uri');
    _s.validateStringLength(
      'uri',
      uri,
      1,
      255,
      isRequired: true,
    );
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

  /// This API is in preview release for Amazon Connect and subject to change.
  ///
  /// Before calling this API, use <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_CreateDomain.html">CreateDomain</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/customerprofiles/latest/APIReference/API_UpdateDomain.html">UpdateDomain</a>
  /// to enable identity resolution: set <code>Matching</code> to true.
  ///
  /// GetMatches returns potentially matching profiles, based on the results of
  /// the latest run of a machine learning process.
  /// <important>
  /// Amazon Connect runs a batch process every Saturday at 12AM UTC to identify
  /// matching profiles. The results are returned up to seven days after the
  /// Saturday run.
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
  /// <li>
  /// BusinessName
  /// </li>
  /// </ul>
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(objectTypeName, 'objectTypeName');
    _s.validateStringLength(
      'objectTypeName',
      objectTypeName,
      1,
      255,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/templates/${Uri.encodeComponent(templateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProfileObjectTypeTemplateResponse.fromJson(response);
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
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous ListAccountIntegrations API call.
  Future<ListAccountIntegrationsResponse> listAccountIntegrations({
    required String uri,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(uri, 'uri');
    _s.validateStringLength(
      'uri',
      uri,
      1,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $query = <String, List<String>>{
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
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
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous ListIntegrations API call.
  Future<ListIntegrationsResponse> listIntegrations({
    required String domainName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $query = <String, List<String>>{
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
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
  Future<ListProfileObjectsResponse> listProfileObjects({
    required String domainName,
    required String objectTypeName,
    required String profileId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(objectTypeName, 'objectTypeName');
    _s.validateStringLength(
      'objectTypeName',
      objectTypeName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final $payload = <String, dynamic>{
      'ObjectTypeName': objectTypeName,
      'ProfileId': profileId,
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// This API is in preview release for Amazon Connect and subject to change.
  ///
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(mainProfileId, 'mainProfileId');
    ArgumentError.checkNotNull(profileIdsToBeMerged, 'profileIdsToBeMerged');
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
  ///
  /// Parameter [flowDefinition] :
  /// The configuration that controls how Customer Profiles retrieves data from
  /// the source.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  ///
  /// Parameter [uri] :
  /// The URI of the S3 bucket or any other type of data source.
  Future<PutIntegrationResponse> putIntegration({
    required String domainName,
    required String objectTypeName,
    FlowDefinition? flowDefinition,
    Map<String, String>? tags,
    String? uri,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(objectTypeName, 'objectTypeName');
    _s.validateStringLength(
      'objectTypeName',
      objectTypeName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'uri',
      uri,
      1,
      255,
    );
    final $payload = <String, dynamic>{
      'ObjectTypeName': objectTypeName,
      if (flowDefinition != null) 'FlowDefinition': flowDefinition,
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
  /// When adding a specific profile object, like a Contact Trace Record (CTR),
  /// an inferred profile can get created if it is not mapped to an existing
  /// profile. The resulting profile will only have a phone number populated in
  /// the standard ProfileObject. Any additional CTRs with the same phone number
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
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(object, 'object');
    _s.validateStringLength(
      'object',
      object,
      1,
      256000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(objectTypeName, 'objectTypeName');
    _s.validateStringLength(
      'objectTypeName',
      objectTypeName,
      1,
      255,
      isRequired: true,
    );
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
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  ///
  /// Parameter [templateId] :
  /// A unique identifier for the object template.
  Future<PutProfileObjectTypeResponse> putProfileObjectType({
    required String description,
    required String domainName,
    required String objectTypeName,
    bool? allowProfileCreation,
    String? encryptionKey,
    int? expirationDays,
    Map<String, ObjectTypeField>? fields,
    Map<String, List<ObjectTypeKey>>? keys,
    Map<String, String>? tags,
    String? templateId,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(objectTypeName, 'objectTypeName');
    _s.validateStringLength(
      'objectTypeName',
      objectTypeName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'encryptionKey',
      encryptionKey,
      0,
      255,
    );
    _s.validateNumRange(
      'expirationDays',
      expirationDays,
      1,
      1098,
    );
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      64,
    );
    final $payload = <String, dynamic>{
      'Description': description,
      if (allowProfileCreation != null)
        'AllowProfileCreation': allowProfileCreation,
      if (encryptionKey != null) 'EncryptionKey': encryptionKey,
      if (expirationDays != null) 'ExpirationDays': expirationDays,
      if (fields != null) 'Fields': fields,
      if (keys != null) 'Keys': keys,
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

  /// Searches for profiles within a specific domain name using name, phone
  /// number, email address, account number, or a custom defined index.
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
  /// use to search include: _account, _profileId, _fullName, _phone, _email,
  /// _ctrContactId, _marketoLeadId, _salesforceAccountId, _salesforceContactId,
  /// _zendeskUserId, _zendeskExternalId, _serviceNowSystemId.
  ///
  /// Parameter [values] :
  /// A list of key values.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects returned per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the previous SearchProfiles API call.
  Future<SearchProfilesResponse> searchProfiles({
    required String domainName,
    required String keyName,
    required List<String> values,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(keyName, 'keyName');
    _s.validateStringLength(
      'keyName',
      keyName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(values, 'values');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final $payload = <String, dynamic>{
      'KeyName': keyName,
      'Values': values,
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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

  /// Updates the properties of a domain, including creating or selecting a dead
  /// letter queue or an encryption key.
  ///
  /// After a domain is created, the name can’t be changed.
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
  /// The process of matching duplicate profiles. This process runs every
  /// Saturday at 12AM.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<UpdateDomainResponse> updateDomain({
    required String domainName,
    String? deadLetterQueueUrl,
    String? defaultEncryptionKey,
    int? defaultExpirationDays,
    MatchingRequest? matching,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'deadLetterQueueUrl',
      deadLetterQueueUrl,
      0,
      255,
    );
    _s.validateStringLength(
      'defaultEncryptionKey',
      defaultEncryptionKey,
      0,
      255,
    );
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
    String? homePhoneNumber,
    String? lastName,
    UpdateAddress? mailingAddress,
    String? middleName,
    String? mobilePhoneNumber,
    PartyType? partyType,
    String? personalEmailAddress,
    String? phoneNumber,
    UpdateAddress? shippingAddress,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    _s.validateStringLength(
      'accountNumber',
      accountNumber,
      0,
      255,
    );
    _s.validateStringLength(
      'additionalInformation',
      additionalInformation,
      0,
      1000,
    );
    _s.validateStringLength(
      'birthDate',
      birthDate,
      0,
      255,
    );
    _s.validateStringLength(
      'businessEmailAddress',
      businessEmailAddress,
      0,
      255,
    );
    _s.validateStringLength(
      'businessName',
      businessName,
      0,
      255,
    );
    _s.validateStringLength(
      'businessPhoneNumber',
      businessPhoneNumber,
      0,
      255,
    );
    _s.validateStringLength(
      'emailAddress',
      emailAddress,
      0,
      255,
    );
    _s.validateStringLength(
      'firstName',
      firstName,
      0,
      255,
    );
    _s.validateStringLength(
      'homePhoneNumber',
      homePhoneNumber,
      0,
      255,
    );
    _s.validateStringLength(
      'lastName',
      lastName,
      0,
      255,
    );
    _s.validateStringLength(
      'middleName',
      middleName,
      0,
      255,
    );
    _s.validateStringLength(
      'mobilePhoneNumber',
      mobilePhoneNumber,
      0,
      255,
    );
    _s.validateStringLength(
      'personalEmailAddress',
      personalEmailAddress,
      0,
      255,
    );
    _s.validateStringLength(
      'phoneNumber',
      phoneNumber,
      0,
      255,
    );
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
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'PartyType': partyType.toValue(),
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

  factory ConnectorOperator.fromJson(Map<String, dynamic> json) {
    return ConnectorOperator(
      marketo: (json['Marketo'] as String?)?.toMarketoConnectorOperator(),
      s3: (json['S3'] as String?)?.toS3ConnectorOperator(),
      salesforce:
          (json['Salesforce'] as String?)?.toSalesforceConnectorOperator(),
      serviceNow:
          (json['ServiceNow'] as String?)?.toServiceNowConnectorOperator(),
      zendesk: (json['Zendesk'] as String?)?.toZendeskConnectorOperator(),
    );
  }

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

  /// The process of matching duplicate profiles. This process runs every Saturday
  /// at 12AM.
  final MatchingResponse? matching;

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
      if (tags != null) 'Tags': tags,
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

extension on DataPullMode {
  String toValue() {
    switch (this) {
      case DataPullMode.incremental:
        return 'Incremental';
      case DataPullMode.complete:
        return 'Complete';
    }
  }
}

extension on String {
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

enum FieldContentType {
  string,
  number,
  phoneNumber,
  emailAddress,
  name,
}

extension on FieldContentType {
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

extension on String {
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

  factory FieldSourceProfileIds.fromJson(Map<String, dynamic> json) {
    return FieldSourceProfileIds(
      accountNumber: json['AccountNumber'] as String?,
      additionalInformation: json['AdditionalInformation'] as String?,
      address: json['Address'] as String?,
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      billingAddress: json['BillingAddress'] as String?,
      birthDate: json['BirthDate'] as String?,
      businessEmailAddress: json['BusinessEmailAddress'] as String?,
      businessName: json['BusinessName'] as String?,
      businessPhoneNumber: json['BusinessPhoneNumber'] as String?,
      emailAddress: json['EmailAddress'] as String?,
      firstName: json['FirstName'] as String?,
      gender: json['Gender'] as String?,
      homePhoneNumber: json['HomePhoneNumber'] as String?,
      lastName: json['LastName'] as String?,
      mailingAddress: json['MailingAddress'] as String?,
      middleName: json['MiddleName'] as String?,
      mobilePhoneNumber: json['MobilePhoneNumber'] as String?,
      partyType: json['PartyType'] as String?,
      personalEmailAddress: json['PersonalEmailAddress'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      shippingAddress: json['ShippingAddress'] as String?,
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

  factory FlowDefinition.fromJson(Map<String, dynamic> json) {
    return FlowDefinition(
      flowName: json['FlowName'] as String,
      kmsArn: json['KmsArn'] as String,
      sourceFlowConfig: SourceFlowConfig.fromJson(
          json['SourceFlowConfig'] as Map<String, dynamic>),
      tasks: (json['Tasks'] as List)
          .whereNotNull()
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      triggerConfig:
          TriggerConfig.fromJson(json['TriggerConfig'] as Map<String, dynamic>),
      description: json['Description'] as String?,
    );
  }

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

enum Gender {
  male,
  female,
  unspecified,
}

extension on Gender {
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

extension on String {
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

  /// The process of matching duplicate profiles. This process runs every Saturday
  /// at 12AM.
  final MatchingResponse? matching;

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
      if (stats != null) 'Stats': stats,
      if (tags != null) 'Tags': tags,
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

  /// The name of the profile object type.
  final String objectTypeName;

  /// The URI of the S3 bucket or any other type of data source.
  final String uri;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  GetIntegrationResponse({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    required this.objectTypeName,
    required this.uri,
    this.tags,
  });

  factory GetIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return GetIntegrationResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      domainName: json['DomainName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      objectTypeName: json['ObjectTypeName'] as String,
      uri: json['Uri'] as String,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final objectTypeName = this.objectTypeName;
    final uri = this.uri;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'ObjectTypeName': objectTypeName,
      'Uri': uri,
      if (tags != null) 'Tags': tags,
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
      sourceName: json['SourceName'] as String?,
      sourceObject: json['SourceObject'] as String?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowProfileCreation = this.allowProfileCreation;
    final fields = this.fields;
    final keys = this.keys;
    final sourceName = this.sourceName;
    final sourceObject = this.sourceObject;
    final templateId = this.templateId;
    return {
      if (allowProfileCreation != null)
        'AllowProfileCreation': allowProfileCreation,
      if (fields != null) 'Fields': fields,
      if (keys != null) 'Keys': keys,
      if (sourceName != null) 'SourceName': sourceName,
      if (sourceObject != null) 'SourceObject': sourceObject,
      if (templateId != null) 'TemplateId': templateId,
    };
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

  factory IncrementalPullConfig.fromJson(Map<String, dynamic> json) {
    return IncrementalPullConfig(
      datetimeTypeFieldName: json['DatetimeTypeFieldName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datetimeTypeFieldName = this.datetimeTypeFieldName;
    return {
      if (datetimeTypeFieldName != null)
        'DatetimeTypeFieldName': datetimeTypeFieldName,
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

/// An integration in list of integrations.
class ListIntegrationItem {
  /// The timestamp of when the domain was created.
  final DateTime createdAt;

  /// The unique name of the domain.
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  final DateTime lastUpdatedAt;

  /// The name of the profile object type.
  final String objectTypeName;

  /// The URI of the S3 bucket or any other type of data source.
  final String uri;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  ListIntegrationItem({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    required this.objectTypeName,
    required this.uri,
    this.tags,
  });

  factory ListIntegrationItem.fromJson(Map<String, dynamic> json) {
    return ListIntegrationItem(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      domainName: json['DomainName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      objectTypeName: json['ObjectTypeName'] as String,
      uri: json['Uri'] as String,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final objectTypeName = this.objectTypeName;
    final uri = this.uri;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'ObjectTypeName': objectTypeName,
      'Uri': uri,
      if (tags != null) 'Tags': tags,
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

extension on MarketoConnectorOperator {
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

extension on String {
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

  factory MarketoSourceProperties.fromJson(Map<String, dynamic> json) {
    return MarketoSourceProperties(
      object: json['Object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'Object': object,
    };
  }
}

/// The Match group object.
class MatchItem {
  /// The unique identifiers for this group of profiles that match.
  final String? matchId;

  /// A list of identifiers for profiles that match.
  final List<String>? profileIds;

  MatchItem({
    this.matchId,
    this.profileIds,
  });

  factory MatchItem.fromJson(Map<String, dynamic> json) {
    return MatchItem(
      matchId: json['MatchId'] as String?,
      profileIds: (json['ProfileIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final matchId = this.matchId;
    final profileIds = this.profileIds;
    return {
      if (matchId != null) 'MatchId': matchId,
      if (profileIds != null) 'ProfileIds': profileIds,
    };
  }
}

/// The flag that enables the matching process of duplicate profiles.
class MatchingRequest {
  /// The flag that enables the matching process of duplicate profiles.
  final bool enabled;

  MatchingRequest({
    required this.enabled,
  });

  factory MatchingRequest.fromJson(Map<String, dynamic> json) {
    return MatchingRequest(
      enabled: json['Enabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      'Enabled': enabled,
    };
  }
}

/// The flag that enables the matching process of duplicate profiles.
class MatchingResponse {
  /// The flag that enables the matching process of duplicate profiles.
  final bool? enabled;

  MatchingResponse({
    this.enabled,
  });

  factory MatchingResponse.fromJson(Map<String, dynamic> json) {
    return MatchingResponse(
      enabled: json['Enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
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
  /// only 1 UNIQUE key but multiple PROFILE keys. PROFILE means that this key can
  /// be used to tie an object to a PROFILE. UNIQUE means that it can be used to
  /// uniquely identify an object. If a key a is marked as SECONDARY, it will be
  /// used to search for profiles after all other PROFILE keys have been searched.
  /// A LOOKUP_ONLY key is only used to match a profile but is not persisted to be
  /// used for searching of the profile. A NEW_ONLY key is only used if the
  /// profile does not already exist before the object is ingested, otherwise it
  /// is only used for matching objects to profiles.
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

extension on OperatorPropertiesKeys {
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

extension on String {
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

enum PartyType {
  individual,
  business,
  other,
}

extension on PartyType {
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

extension on String {
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

  /// The gender with which the customer identifies.
  final Gender? gender;

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
    this.gender,
    this.homePhoneNumber,
    this.lastName,
    this.mailingAddress,
    this.middleName,
    this.mobilePhoneNumber,
    this.partyType,
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
      gender: (json['Gender'] as String?)?.toGender(),
      homePhoneNumber: json['HomePhoneNumber'] as String?,
      lastName: json['LastName'] as String?,
      mailingAddress: json['MailingAddress'] != null
          ? Address.fromJson(json['MailingAddress'] as Map<String, dynamic>)
          : null,
      middleName: json['MiddleName'] as String?,
      mobilePhoneNumber: json['MobilePhoneNumber'] as String?,
      partyType: (json['PartyType'] as String?)?.toPartyType(),
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
    final gender = this.gender;
    final homePhoneNumber = this.homePhoneNumber;
    final lastName = this.lastName;
    final mailingAddress = this.mailingAddress;
    final middleName = this.middleName;
    final mobilePhoneNumber = this.mobilePhoneNumber;
    final partyType = this.partyType;
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
      if (gender != null) 'Gender': gender.toValue(),
      if (homePhoneNumber != null) 'HomePhoneNumber': homePhoneNumber,
      if (lastName != null) 'LastName': lastName,
      if (mailingAddress != null) 'MailingAddress': mailingAddress,
      if (middleName != null) 'MiddleName': middleName,
      if (mobilePhoneNumber != null) 'MobilePhoneNumber': mobilePhoneNumber,
      if (partyType != null) 'PartyType': partyType.toValue(),
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

  /// The name of the profile object type.
  final String objectTypeName;

  /// The URI of the S3 bucket or any other type of data source.
  final String uri;

  /// The tags used to organize, track, or control access for this resource.
  final Map<String, String>? tags;

  PutIntegrationResponse({
    required this.createdAt,
    required this.domainName,
    required this.lastUpdatedAt,
    required this.objectTypeName,
    required this.uri,
    this.tags,
  });

  factory PutIntegrationResponse.fromJson(Map<String, dynamic> json) {
    return PutIntegrationResponse(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      domainName: json['DomainName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['LastUpdatedAt'] as Object),
      objectTypeName: json['ObjectTypeName'] as String,
      uri: json['Uri'] as String,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final objectTypeName = this.objectTypeName;
    final uri = this.uri;
    final tags = this.tags;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'DomainName': domainName,
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'ObjectTypeName': objectTypeName,
      'Uri': uri,
      if (tags != null) 'Tags': tags,
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
      if (tags != null) 'Tags': tags,
      if (templateId != null) 'TemplateId': templateId,
    };
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

extension on S3ConnectorOperator {
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

extension on String {
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

  factory S3SourceProperties.fromJson(Map<String, dynamic> json) {
    return S3SourceProperties(
      bucketName: json['BucketName'] as String,
      bucketPrefix: json['BucketPrefix'] as String?,
    );
  }

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

extension on SalesforceConnectorOperator {
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

extension on String {
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

  factory SalesforceSourceProperties.fromJson(Map<String, dynamic> json) {
    return SalesforceSourceProperties(
      object: json['Object'] as String,
      enableDynamicFieldUpdate: json['EnableDynamicFieldUpdate'] as bool?,
      includeDeletedRecords: json['IncludeDeletedRecords'] as bool?,
    );
  }

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

  factory ScheduledTriggerProperties.fromJson(Map<String, dynamic> json) {
    return ScheduledTriggerProperties(
      scheduleExpression: json['ScheduleExpression'] as String,
      dataPullMode: (json['DataPullMode'] as String?)?.toDataPullMode(),
      firstExecutionFrom: timeStampFromJson(json['FirstExecutionFrom']),
      scheduleEndTime: timeStampFromJson(json['ScheduleEndTime']),
      scheduleOffset: json['ScheduleOffset'] as int?,
      scheduleStartTime: timeStampFromJson(json['ScheduleStartTime']),
      timezone: json['Timezone'] as String?,
    );
  }

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
  /// The list of SearchProfiles instances.
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

extension on ServiceNowConnectorOperator {
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

extension on String {
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

  factory ServiceNowSourceProperties.fromJson(Map<String, dynamic> json) {
    return ServiceNowSourceProperties(
      object: json['Object'] as String,
    );
  }

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

  factory SourceConnectorProperties.fromJson(Map<String, dynamic> json) {
    return SourceConnectorProperties(
      marketo: json['Marketo'] != null
          ? MarketoSourceProperties.fromJson(
              json['Marketo'] as Map<String, dynamic>)
          : null,
      s3: json['S3'] != null
          ? S3SourceProperties.fromJson(json['S3'] as Map<String, dynamic>)
          : null,
      salesforce: json['Salesforce'] != null
          ? SalesforceSourceProperties.fromJson(
              json['Salesforce'] as Map<String, dynamic>)
          : null,
      serviceNow: json['ServiceNow'] != null
          ? ServiceNowSourceProperties.fromJson(
              json['ServiceNow'] as Map<String, dynamic>)
          : null,
      zendesk: json['Zendesk'] != null
          ? ZendeskSourceProperties.fromJson(
              json['Zendesk'] as Map<String, dynamic>)
          : null,
    );
  }

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

extension on SourceConnectorType {
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

extension on String {
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

  factory SourceFlowConfig.fromJson(Map<String, dynamic> json) {
    return SourceFlowConfig(
      connectorType: (json['ConnectorType'] as String).toSourceConnectorType(),
      sourceConnectorProperties: SourceConnectorProperties.fromJson(
          json['SourceConnectorProperties'] as Map<String, dynamic>),
      connectorProfileName: json['ConnectorProfileName'] as String?,
      incrementalPullConfig: json['IncrementalPullConfig'] != null
          ? IncrementalPullConfig.fromJson(
              json['IncrementalPullConfig'] as Map<String, dynamic>)
          : null,
    );
  }

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
  unique,
  secondary,
  lookupOnly,
  newOnly,
}

extension on StandardIdentifier {
  String toValue() {
    switch (this) {
      case StandardIdentifier.profile:
        return 'PROFILE';
      case StandardIdentifier.unique:
        return 'UNIQUE';
      case StandardIdentifier.secondary:
        return 'SECONDARY';
      case StandardIdentifier.lookupOnly:
        return 'LOOKUP_ONLY';
      case StandardIdentifier.newOnly:
        return 'NEW_ONLY';
    }
  }
}

extension on String {
  StandardIdentifier toStandardIdentifier() {
    switch (this) {
      case 'PROFILE':
        return StandardIdentifier.profile;
      case 'UNIQUE':
        return StandardIdentifier.unique;
      case 'SECONDARY':
        return StandardIdentifier.secondary;
      case 'LOOKUP_ONLY':
        return StandardIdentifier.lookupOnly;
      case 'NEW_ONLY':
        return StandardIdentifier.newOnly;
    }
    throw Exception('$this is not known in enum StandardIdentifier');
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

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      sourceFields: (json['SourceFields'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      taskType: (json['TaskType'] as String).toTaskType(),
      connectorOperator: json['ConnectorOperator'] != null
          ? ConnectorOperator.fromJson(
              json['ConnectorOperator'] as Map<String, dynamic>)
          : null,
      destinationField: json['DestinationField'] as String?,
      taskProperties: (json['TaskProperties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toOperatorPropertiesKeys(), e as String)),
    );
  }

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

extension on TaskType {
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

extension on String {
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

  factory TriggerConfig.fromJson(Map<String, dynamic> json) {
    return TriggerConfig(
      triggerType: (json['TriggerType'] as String).toTriggerType(),
      triggerProperties: json['TriggerProperties'] != null
          ? TriggerProperties.fromJson(
              json['TriggerProperties'] as Map<String, dynamic>)
          : null,
    );
  }

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

  factory TriggerProperties.fromJson(Map<String, dynamic> json) {
    return TriggerProperties(
      scheduled: json['Scheduled'] != null
          ? ScheduledTriggerProperties.fromJson(
              json['Scheduled'] as Map<String, dynamic>)
          : null,
    );
  }

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

extension on TriggerType {
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

extension on String {
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

  factory UpdateAddress.fromJson(Map<String, dynamic> json) {
    return UpdateAddress(
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

  /// The process of matching duplicate profiles. This process runs every Saturday
  /// at 12AM.
  final MatchingResponse? matching;

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

extension on ZendeskConnectorOperator {
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

extension on String {
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

  factory ZendeskSourceProperties.fromJson(Map<String, dynamic> json) {
    return ZendeskSourceProperties(
      object: json['Object'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final object = this.object;
    return {
      'Object': object,
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
