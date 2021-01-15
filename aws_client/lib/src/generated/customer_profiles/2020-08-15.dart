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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2020-08-15.g.dart';

/// Welcome to the Amazon Connect Customer Profiles API Reference. This guide
/// provides information about the Amazon Connect Customer Profiles API,
/// including supported operations, data types, parameters, and schemas.
class CustomerProfiles {
  final _s.RestJsonProtocol _protocol;
  CustomerProfiles({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String domainName,
    @_s.required String keyName,
    @_s.required String profileId,
    @_s.required List<String> values,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    _s.validateStringPattern(
      'keyName',
      keyName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    _s.validateStringPattern(
      'profileId',
      profileId,
      r'''[a-f0-9]{32}''',
      isRequired: true,
    );
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
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<CreateDomainResponse> createDomain({
    @_s.required int defaultExpirationDays,
    @_s.required String domainName,
    String deadLetterQueueUrl,
    String defaultEncryptionKey,
    Map<String, String> tags,
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
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
  /// Any additional information relevant to the customer's profile.
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
  /// The customer's email address, which has not been specified as a personal
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
  /// The customer's phone number, which has not been specified as a mobile,
  /// home, or business number.
  ///
  /// Parameter [shippingAddress] :
  /// The customer’s shipping address.
  Future<CreateProfileResponse> createProfile({
    @_s.required String domainName,
    String accountNumber,
    String additionalInformation,
    Address address,
    Map<String, String> attributes,
    Address billingAddress,
    String birthDate,
    String businessEmailAddress,
    String businessName,
    String businessPhoneNumber,
    String emailAddress,
    String firstName,
    Gender gender,
    String homePhoneNumber,
    String lastName,
    Address mailingAddress,
    String middleName,
    String mobilePhoneNumber,
    PartyType partyType,
    String personalEmailAddress,
    String phoneNumber,
    Address shippingAddress,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    @_s.required String domainName,
    String uri,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'uri',
      uri,
      1,
      255,
    );
    final $payload = <String, dynamic>{
      if (uri != null) 'Uri': uri,
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
    @_s.required String domainName,
    @_s.required String profileId,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    _s.validateStringPattern(
      'profileId',
      profileId,
      r'''[a-f0-9]{32}''',
      isRequired: true,
    );
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
    @_s.required String domainName,
    @_s.required String keyName,
    @_s.required String profileId,
    @_s.required List<String> values,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    _s.validateStringPattern(
      'keyName',
      keyName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    _s.validateStringPattern(
      'profileId',
      profileId,
      r'''[a-f0-9]{32}''',
      isRequired: true,
    );
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
    @_s.required String domainName,
    @_s.required String objectTypeName,
    @_s.required String profileId,
    @_s.required String profileObjectUniqueKey,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    _s.validateStringPattern(
      'objectTypeName',
      objectTypeName,
      r'''^[a-zA-Z_][a-zA-Z_0-9-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    _s.validateStringPattern(
      'profileId',
      profileId,
      r'''[a-f0-9]{32}''',
      isRequired: true,
    );
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
    @_s.required String domainName,
    @_s.required String objectTypeName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    _s.validateStringPattern(
      'objectTypeName',
      objectTypeName,
      r'''^[a-zA-Z_][a-zA-Z_0-9-]*$''',
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
  /// A unique name for the domain.
  Future<GetDomainResponse> getDomain({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    @_s.required String domainName,
    String uri,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'uri',
      uri,
      1,
      255,
    );
    final $payload = <String, dynamic>{
      if (uri != null) 'Uri': uri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainName)}/integrations',
      exceptionFnMap: _exceptionFns,
    );
    return GetIntegrationResponse.fromJson(response);
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
    @_s.required String domainName,
    @_s.required String objectTypeName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    _s.validateStringPattern(
      'objectTypeName',
      objectTypeName,
      r'''^[a-zA-Z_][a-zA-Z_0-9-]*$''',
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
    @_s.required String templateId,
  }) async {
    ArgumentError.checkNotNull(templateId, 'templateId');
    _s.validateStringLength(
      'templateId',
      templateId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''^[a-zA-Z0-9_-]+$''',
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
    @_s.required String uri,
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    @_s.required String domainName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    int maxResults,
    String nextToken,
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
    @_s.required String domainName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    @_s.required String domainName,
    @_s.required String objectTypeName,
    @_s.required String profileId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    _s.validateStringPattern(
      'objectTypeName',
      objectTypeName,
      r'''^[a-zA-Z_][a-zA-Z_0-9-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    _s.validateStringPattern(
      'profileId',
      profileId,
      r'''[a-f0-9]{32}''',
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:[a-z0-9]{1,10}:profile''',
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
  /// Parameter [uri] :
  /// The URI of the S3 bucket or any other type of data source.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<PutIntegrationResponse> putIntegration({
    @_s.required String domainName,
    @_s.required String objectTypeName,
    @_s.required String uri,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    _s.validateStringPattern(
      'objectTypeName',
      objectTypeName,
      r'''^[a-zA-Z_][a-zA-Z_0-9-]*$''',
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
      'ObjectTypeName': objectTypeName,
      'Uri': uri,
      if (tags != null) 'Tags': tags,
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
    @_s.required String domainName,
    @_s.required String object,
    @_s.required String objectTypeName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    _s.validateStringPattern(
      'objectTypeName',
      objectTypeName,
      r'''^[a-zA-Z_][a-zA-Z_0-9-]*$''',
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
    @_s.required String description,
    @_s.required String domainName,
    @_s.required String objectTypeName,
    bool allowProfileCreation,
    String encryptionKey,
    int expirationDays,
    Map<String, ObjectTypeField> fields,
    Map<String, List<ObjectTypeKey>> keys,
    Map<String, String> tags,
    String templateId,
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
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    _s.validateStringPattern(
      'objectTypeName',
      objectTypeName,
      r'''^[a-zA-Z_][a-zA-Z_0-9-]*$''',
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
    _s.validateStringPattern(
      'templateId',
      templateId,
      r'''^[a-zA-Z0-9_-]+$''',
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
    @_s.required String domainName,
    @_s.required String keyName,
    @_s.required List<String> values,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    _s.validateStringPattern(
      'keyName',
      keyName,
      r'''^[a-zA-Z0-9_-]+$''',
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:[a-z0-9]{1,10}:profile''',
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:[a-z0-9]{1,10}:profile''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Updates the properties of a domain, including creating or selecting a dead
  /// letter queue or an encryption key.
  ///
  /// Once a domain is created, the name can’t be changed.
  ///
  /// May throw [BadRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [domainName] :
  /// The unique name for the domain.
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
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for this resource.
  Future<UpdateDomainResponse> updateDomain({
    @_s.required String domainName,
    String deadLetterQueueUrl,
    String defaultEncryptionKey,
    int defaultExpirationDays,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
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
  /// Any additional information relevant to the customer's profile.
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
  /// The customer's email address, which has not been specified as a personal
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
  /// The customer's phone number, which has not been specified as a mobile,
  /// home, or business number.
  ///
  /// Parameter [shippingAddress] :
  /// The customer’s shipping address.
  Future<UpdateProfileResponse> updateProfile({
    @_s.required String domainName,
    @_s.required String profileId,
    String accountNumber,
    String additionalInformation,
    UpdateAddress address,
    Map<String, String> attributes,
    UpdateAddress billingAddress,
    String birthDate,
    String businessEmailAddress,
    String businessName,
    String businessPhoneNumber,
    String emailAddress,
    String firstName,
    Gender gender,
    String homePhoneNumber,
    String lastName,
    UpdateAddress mailingAddress,
    String middleName,
    String mobilePhoneNumber,
    PartyType partyType,
    String personalEmailAddress,
    String phoneNumber,
    UpdateAddress shippingAddress,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profileId, 'profileId');
    _s.validateStringPattern(
      'profileId',
      profileId,
      r'''[a-f0-9]{32}''',
      isRequired: true,
    );
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddProfileKeyResponse {
  /// A searchable identifier of a customer profile.
  @_s.JsonKey(name: 'KeyName')
  final String keyName;

  /// A list of key values.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  AddProfileKeyResponse({
    this.keyName,
    this.values,
  });
  factory AddProfileKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$AddProfileKeyResponseFromJson(json);
}

/// A generic address associated with the customer that is not mailing,
/// shipping, or billing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Address {
  /// The first line of a customer address.
  @_s.JsonKey(name: 'Address1')
  final String address1;

  /// The second line of a customer address.
  @_s.JsonKey(name: 'Address2')
  final String address2;

  /// The third line of a customer address.
  @_s.JsonKey(name: 'Address3')
  final String address3;

  /// The fourth line of a customer address.
  @_s.JsonKey(name: 'Address4')
  final String address4;

  /// The city in which a customer lives.
  @_s.JsonKey(name: 'City')
  final String city;

  /// The country in which a customer lives.
  @_s.JsonKey(name: 'Country')
  final String country;

  /// The county in which a customer lives.
  @_s.JsonKey(name: 'County')
  final String county;

  /// The postal code of a customer address.
  @_s.JsonKey(name: 'PostalCode')
  final String postalCode;

  /// The province in which a customer lives.
  @_s.JsonKey(name: 'Province')
  final String province;

  /// The state in which a customer lives.
  @_s.JsonKey(name: 'State')
  final String state;

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
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDomainResponse {
  /// The timestamp of when the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The default number of days until the data within the domain expires.
  @_s.JsonKey(name: 'DefaultExpirationDays')
  final int defaultExpirationDays;

  /// The unique name of the domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The URL of the SQS dead letter queue, which is used for reporting errors
  /// associated with ingesting data from third party applications.
  @_s.JsonKey(name: 'DeadLetterQueueUrl')
  final String deadLetterQueueUrl;

  /// The default encryption key, which is an AWS managed key, is used when no
  /// specific type of encryption key is specified. It is used to encrypt all data
  /// before it is placed in permanent or semi-permanent storage.
  @_s.JsonKey(name: 'DefaultEncryptionKey')
  final String defaultEncryptionKey;

  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  CreateDomainResponse({
    @_s.required this.createdAt,
    @_s.required this.defaultExpirationDays,
    @_s.required this.domainName,
    @_s.required this.lastUpdatedAt,
    this.deadLetterQueueUrl,
    this.defaultEncryptionKey,
    this.tags,
  });
  factory CreateDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProfileResponse {
  /// The unique identifier of a customer profile.
  @_s.JsonKey(name: 'ProfileId')
  final String profileId;

  CreateProfileResponse({
    @_s.required this.profileId,
  });
  factory CreateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDomainResponse {
  /// A message that indicates the delete request is done.
  @_s.JsonKey(name: 'Message')
  final String message;

  DeleteDomainResponse({
    @_s.required this.message,
  });
  factory DeleteDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteIntegrationResponse {
  /// A message that indicates the delete request is done.
  @_s.JsonKey(name: 'Message')
  final String message;

  DeleteIntegrationResponse({
    @_s.required this.message,
  });
  factory DeleteIntegrationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteIntegrationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProfileKeyResponse {
  /// A message that indicates the delete request is done.
  @_s.JsonKey(name: 'Message')
  final String message;

  DeleteProfileKeyResponse({
    this.message,
  });
  factory DeleteProfileKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfileKeyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProfileObjectResponse {
  /// A message that indicates the delete request is done.
  @_s.JsonKey(name: 'Message')
  final String message;

  DeleteProfileObjectResponse({
    this.message,
  });
  factory DeleteProfileObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfileObjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProfileObjectTypeResponse {
  /// A message that indicates the delete request is done.
  @_s.JsonKey(name: 'Message')
  final String message;

  DeleteProfileObjectTypeResponse({
    @_s.required this.message,
  });
  factory DeleteProfileObjectTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfileObjectTypeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProfileResponse {
  /// A message that indicates the delete request is done.
  @_s.JsonKey(name: 'Message')
  final String message;

  DeleteProfileResponse({
    this.message,
  });
  factory DeleteProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfileResponseFromJson(json);
}

/// Usage-specific statistics about the domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainStats {
  /// The number of profiles that you are currently paying for in the domain. If
  /// you have more than 100 objects associated with a single profile, that
  /// profile counts as two profiles. If you have more than 200 objects, that
  /// profile counts as three, and so on.
  @_s.JsonKey(name: 'MeteringProfileCount')
  final int meteringProfileCount;

  /// The total number of objects in domain.
  @_s.JsonKey(name: 'ObjectCount')
  final int objectCount;

  /// The total number of profiles currently in the domain.
  @_s.JsonKey(name: 'ProfileCount')
  final int profileCount;

  /// The total size, in bytes, of all objects in the domain.
  @_s.JsonKey(name: 'TotalSize')
  final int totalSize;

  DomainStats({
    this.meteringProfileCount,
    this.objectCount,
    this.profileCount,
    this.totalSize,
  });
  factory DomainStats.fromJson(Map<String, dynamic> json) =>
      _$DomainStatsFromJson(json);
}

enum FieldContentType {
  @_s.JsonValue('STRING')
  string,
  @_s.JsonValue('NUMBER')
  number,
  @_s.JsonValue('PHONE_NUMBER')
  phoneNumber,
  @_s.JsonValue('EMAIL_ADDRESS')
  emailAddress,
  @_s.JsonValue('NAME')
  name,
}

enum Gender {
  @_s.JsonValue('MALE')
  male,
  @_s.JsonValue('FEMALE')
  female,
  @_s.JsonValue('UNSPECIFIED')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainResponse {
  /// The timestamp of when the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique name of the domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The URL of the SQS dead letter queue, which is used for reporting errors
  /// associated with ingesting data from third party applications.
  @_s.JsonKey(name: 'DeadLetterQueueUrl')
  final String deadLetterQueueUrl;

  /// The default encryption key, which is an AWS managed key, is used when no
  /// specific type of encryption key is specified. It is used to encrypt all data
  /// before it is placed in permanent or semi-permanent storage.
  @_s.JsonKey(name: 'DefaultEncryptionKey')
  final String defaultEncryptionKey;

  /// The default number of days until the data within the domain expires.
  @_s.JsonKey(name: 'DefaultExpirationDays')
  final int defaultExpirationDays;

  /// Usage-specific statistics about the domain.
  @_s.JsonKey(name: 'Stats')
  final DomainStats stats;

  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  GetDomainResponse({
    @_s.required this.createdAt,
    @_s.required this.domainName,
    @_s.required this.lastUpdatedAt,
    this.deadLetterQueueUrl,
    this.defaultEncryptionKey,
    this.defaultExpirationDays,
    this.stats,
    this.tags,
  });
  factory GetDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIntegrationResponse {
  /// The timestamp of when the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique name of the domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the profile object type.
  @_s.JsonKey(name: 'ObjectTypeName')
  final String objectTypeName;

  /// The URI of the S3 bucket or any other type of data source.
  @_s.JsonKey(name: 'Uri')
  final String uri;

  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  GetIntegrationResponse({
    @_s.required this.createdAt,
    @_s.required this.domainName,
    @_s.required this.lastUpdatedAt,
    @_s.required this.objectTypeName,
    @_s.required this.uri,
    this.tags,
  });
  factory GetIntegrationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIntegrationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProfileObjectTypeResponse {
  /// The description of the profile object type.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the profile object type.
  @_s.JsonKey(name: 'ObjectTypeName')
  final String objectTypeName;

  /// Indicates whether a profile should be created when data is received if one
  /// doesn’t exist for an object of this type. The default is <code>FALSE</code>.
  /// If the AllowProfileCreation flag is set to <code>FALSE</code>, then the
  /// service tries to fetch a standard profile and associate this object with the
  /// profile. If it is set to <code>TRUE</code>, and if no match is found, then
  /// the service creates a new standard profile.
  @_s.JsonKey(name: 'AllowProfileCreation')
  final bool allowProfileCreation;

  /// The timestamp of when the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The customer-provided key to encrypt the profile object that will be created
  /// in this profile object type.
  @_s.JsonKey(name: 'EncryptionKey')
  final String encryptionKey;

  /// The number of days until the data in the object expires.
  @_s.JsonKey(name: 'ExpirationDays')
  final int expirationDays;

  /// A map of the name and ObjectType field.
  @_s.JsonKey(name: 'Fields')
  final Map<String, ObjectTypeField> fields;

  /// A list of unique keys that can be used to map data to the profile.
  @_s.JsonKey(name: 'Keys')
  final Map<String, List<ObjectTypeKey>> keys;

  /// The timestamp of when the domain was most recently edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// A unique identifier for the object template.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  GetProfileObjectTypeResponse({
    @_s.required this.description,
    @_s.required this.objectTypeName,
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
  factory GetProfileObjectTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileObjectTypeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProfileObjectTypeTemplateResponse {
  /// Indicates whether a profile should be created when data is received if one
  /// doesn’t exist for an object of this type. The default is <code>FALSE</code>.
  /// If the AllowProfileCreation flag is set to <code>FALSE</code>, then the
  /// service tries to fetch a standard profile and associate this object with the
  /// profile. If it is set to <code>TRUE</code>, and if no match is found, then
  /// the service creates a new standard profile.
  @_s.JsonKey(name: 'AllowProfileCreation')
  final bool allowProfileCreation;

  /// A map of the name and ObjectType field.
  @_s.JsonKey(name: 'Fields')
  final Map<String, ObjectTypeField> fields;

  /// A list of unique keys that can be used to map data to the profile.
  @_s.JsonKey(name: 'Keys')
  final Map<String, List<ObjectTypeKey>> keys;

  /// The name of the source of the object template.
  @_s.JsonKey(name: 'SourceName')
  final String sourceName;

  /// The source of the object template.
  @_s.JsonKey(name: 'SourceObject')
  final String sourceObject;

  /// A unique identifier for the object template.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  GetProfileObjectTypeTemplateResponse({
    this.allowProfileCreation,
    this.fields,
    this.keys,
    this.sourceName,
    this.sourceObject,
    this.templateId,
  });
  factory GetProfileObjectTypeTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetProfileObjectTypeTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccountIntegrationsResponse {
  /// The list of ListAccountIntegration instances.
  @_s.JsonKey(name: 'Items')
  final List<ListIntegrationItem> items;

  /// The pagination token from the previous ListAccountIntegrations API call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAccountIntegrationsResponse({
    this.items,
    this.nextToken,
  });
  factory ListAccountIntegrationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAccountIntegrationsResponseFromJson(json);
}

/// An object in a list that represents a domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainItem {
  /// The timestamp of when the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique name of the domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListDomainItem({
    @_s.required this.createdAt,
    @_s.required this.domainName,
    @_s.required this.lastUpdatedAt,
    this.tags,
  });
  factory ListDomainItem.fromJson(Map<String, dynamic> json) =>
      _$ListDomainItemFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainsResponse {
  /// The list of ListDomains instances.
  @_s.JsonKey(name: 'Items')
  final List<ListDomainItem> items;

  /// The pagination token from the previous ListDomains API call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDomainsResponse({
    this.items,
    this.nextToken,
  });
  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDomainsResponseFromJson(json);
}

/// An integration in list of integrations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIntegrationItem {
  /// The timestamp of when the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique name of the domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the profile object type.
  @_s.JsonKey(name: 'ObjectTypeName')
  final String objectTypeName;

  /// The URI of the S3 bucket or any other type of data source.
  @_s.JsonKey(name: 'Uri')
  final String uri;

  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListIntegrationItem({
    @_s.required this.createdAt,
    @_s.required this.domainName,
    @_s.required this.lastUpdatedAt,
    @_s.required this.objectTypeName,
    @_s.required this.uri,
    this.tags,
  });
  factory ListIntegrationItem.fromJson(Map<String, dynamic> json) =>
      _$ListIntegrationItemFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIntegrationsResponse {
  /// The list of ListIntegrations instances.
  @_s.JsonKey(name: 'Items')
  final List<ListIntegrationItem> items;

  /// The pagination token from the previous ListIntegrations API call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIntegrationsResponse({
    this.items,
    this.nextToken,
  });
  factory ListIntegrationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIntegrationsResponseFromJson(json);
}

/// A ProfileObjectType instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfileObjectTypeItem {
  /// Description of the profile object type.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the profile object type.
  @_s.JsonKey(name: 'ObjectTypeName')
  final String objectTypeName;

  /// The timestamp of when the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The timestamp of when the domain was most recently edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListProfileObjectTypeItem({
    @_s.required this.description,
    @_s.required this.objectTypeName,
    this.createdAt,
    this.lastUpdatedAt,
    this.tags,
  });
  factory ListProfileObjectTypeItem.fromJson(Map<String, dynamic> json) =>
      _$ListProfileObjectTypeItemFromJson(json);
}

/// A ProfileObjectTypeTemplate in a list of ProfileObjectTypeTemplates.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfileObjectTypeTemplateItem {
  /// The name of the source of the object template.
  @_s.JsonKey(name: 'SourceName')
  final String sourceName;

  /// The source of the object template.
  @_s.JsonKey(name: 'SourceObject')
  final String sourceObject;

  /// A unique identifier for the object template.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  ListProfileObjectTypeTemplateItem({
    this.sourceName,
    this.sourceObject,
    this.templateId,
  });
  factory ListProfileObjectTypeTemplateItem.fromJson(
          Map<String, dynamic> json) =>
      _$ListProfileObjectTypeTemplateItemFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfileObjectTypeTemplatesResponse {
  /// The list of ListProfileObjectType template instances.
  @_s.JsonKey(name: 'Items')
  final List<ListProfileObjectTypeTemplateItem> items;

  /// The pagination token from the previous ListObjectTypeTemplates API call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListProfileObjectTypeTemplatesResponse({
    this.items,
    this.nextToken,
  });
  factory ListProfileObjectTypeTemplatesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListProfileObjectTypeTemplatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfileObjectTypesResponse {
  /// The list of ListProfileObjectTypes instances.
  @_s.JsonKey(name: 'Items')
  final List<ListProfileObjectTypeItem> items;

  /// Identifies the next page of results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListProfileObjectTypesResponse({
    this.items,
    this.nextToken,
  });
  factory ListProfileObjectTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProfileObjectTypesResponseFromJson(json);
}

/// A ProfileObject in a list of ProfileObjects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfileObjectsItem {
  /// A JSON representation of a ProfileObject that belongs to a profile.
  @_s.JsonKey(name: 'Object')
  final String object;

  /// Specifies the kind of object being added to a profile, such as
  /// "Salesforce-Account."
  @_s.JsonKey(name: 'ObjectTypeName')
  final String objectTypeName;

  /// The unique identifier of the ProfileObject generated by the service.
  @_s.JsonKey(name: 'ProfileObjectUniqueKey')
  final String profileObjectUniqueKey;

  ListProfileObjectsItem({
    this.object,
    this.objectTypeName,
    this.profileObjectUniqueKey,
  });
  factory ListProfileObjectsItem.fromJson(Map<String, dynamic> json) =>
      _$ListProfileObjectsItemFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfileObjectsResponse {
  /// The list of ListProfileObject instances.
  @_s.JsonKey(name: 'Items')
  final List<ListProfileObjectsItem> items;

  /// The pagination token from the previous call to ListProfileObjects.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListProfileObjectsResponse({
    this.items,
    this.nextToken,
  });
  factory ListProfileObjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProfileObjectsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Represents a field in a ProfileObjectType.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ObjectTypeField {
  /// The content type of the field. Used for determining equality when searching.
  @_s.JsonKey(name: 'ContentType')
  final FieldContentType contentType;

  /// A field of a ProfileObject. For example: _source.FirstName, where “_source”
  /// is a ProfileObjectType of a Zendesk user and “FirstName” is a field in that
  /// ObjectType.
  @_s.JsonKey(name: 'Source')
  final String source;

  /// The location of the data in the standard ProfileObject model. For example:
  /// _profile.Address.PostalCode.
  @_s.JsonKey(name: 'Target')
  final String target;

  ObjectTypeField({
    this.contentType,
    this.source,
    this.target,
  });
  factory ObjectTypeField.fromJson(Map<String, dynamic> json) =>
      _$ObjectTypeFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectTypeFieldToJson(this);
}

/// An object that defines the Key element of a ProfileObject. A Key is a
/// special element that can be used to search for a customer profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ObjectTypeKey {
  /// The reference for the key name of the fields map.
  @_s.JsonKey(name: 'FieldNames')
  final List<String> fieldNames;

  /// The types of keys that a ProfileObject can have. Each ProfileObject can have
  /// only 1 UNIQUE key but multiple PROFILE keys. PROFILE means that this key can
  /// be used to tie an object to a PROFILE. UNIQUE means that it can be used to
  /// uniquely identify an object. If a key a is marked as SECONDARY, it will be
  /// used to search for profiles after all other PROFILE keys have been searched.
  /// A LOOKUP_ONLY key is only used to match a profile but is not persisted to be
  /// used for searching of the profile. A NEW_ONLY key is only used if the
  /// profile does not already exist before the object is ingested, otherwise it
  /// is only used for matching objects to profiles.
  @_s.JsonKey(name: 'StandardIdentifiers')
  final List<StandardIdentifier> standardIdentifiers;

  ObjectTypeKey({
    this.fieldNames,
    this.standardIdentifiers,
  });
  factory ObjectTypeKey.fromJson(Map<String, dynamic> json) =>
      _$ObjectTypeKeyFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectTypeKeyToJson(this);
}

enum PartyType {
  @_s.JsonValue('INDIVIDUAL')
  individual,
  @_s.JsonValue('BUSINESS')
  business,
  @_s.JsonValue('OTHER')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The standard profile of a customer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Profile {
  /// A unique account number that you have given to the customer.
  @_s.JsonKey(name: 'AccountNumber')
  final String accountNumber;

  /// Any additional information relevant to the customer's profile.
  @_s.JsonKey(name: 'AdditionalInformation')
  final String additionalInformation;

  /// A generic address associated with the customer that is not mailing,
  /// shipping, or billing.
  @_s.JsonKey(name: 'Address')
  final Address address;

  /// A key value pair of attributes of a customer profile.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// The customer’s billing address.
  @_s.JsonKey(name: 'BillingAddress')
  final Address billingAddress;

  /// The customer’s birth date.
  @_s.JsonKey(name: 'BirthDate')
  final String birthDate;

  /// The customer’s business email address.
  @_s.JsonKey(name: 'BusinessEmailAddress')
  final String businessEmailAddress;

  /// The name of the customer’s business.
  @_s.JsonKey(name: 'BusinessName')
  final String businessName;

  /// The customer’s home phone number.
  @_s.JsonKey(name: 'BusinessPhoneNumber')
  final String businessPhoneNumber;

  /// The customer's email address, which has not been specified as a personal or
  /// business address.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  /// The customer’s first name.
  @_s.JsonKey(name: 'FirstName')
  final String firstName;

  /// The gender with which the customer identifies.
  @_s.JsonKey(name: 'Gender')
  final Gender gender;

  /// The customer’s home phone number.
  @_s.JsonKey(name: 'HomePhoneNumber')
  final String homePhoneNumber;

  /// The customer’s last name.
  @_s.JsonKey(name: 'LastName')
  final String lastName;

  /// The customer’s mailing address.
  @_s.JsonKey(name: 'MailingAddress')
  final Address mailingAddress;

  /// The customer’s middle name.
  @_s.JsonKey(name: 'MiddleName')
  final String middleName;

  /// The customer’s mobile phone number.
  @_s.JsonKey(name: 'MobilePhoneNumber')
  final String mobilePhoneNumber;

  /// The type of profile used to describe the customer.
  @_s.JsonKey(name: 'PartyType')
  final PartyType partyType;

  /// The customer’s personal email address.
  @_s.JsonKey(name: 'PersonalEmailAddress')
  final String personalEmailAddress;

  /// The customer's phone number, which has not been specified as a mobile, home,
  /// or business number.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  /// The unique identifier of a customer profile.
  @_s.JsonKey(name: 'ProfileId')
  final String profileId;

  /// The customer’s shipping address.
  @_s.JsonKey(name: 'ShippingAddress')
  final Address shippingAddress;

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
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutIntegrationResponse {
  /// The timestamp of when the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique name of the domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the profile object type.
  @_s.JsonKey(name: 'ObjectTypeName')
  final String objectTypeName;

  /// The URI of the S3 bucket or any other type of data source.
  @_s.JsonKey(name: 'Uri')
  final String uri;

  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  PutIntegrationResponse({
    @_s.required this.createdAt,
    @_s.required this.domainName,
    @_s.required this.lastUpdatedAt,
    @_s.required this.objectTypeName,
    @_s.required this.uri,
    this.tags,
  });
  factory PutIntegrationResponse.fromJson(Map<String, dynamic> json) =>
      _$PutIntegrationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutProfileObjectResponse {
  /// The unique identifier of the profile object generated by the service.
  @_s.JsonKey(name: 'ProfileObjectUniqueKey')
  final String profileObjectUniqueKey;

  PutProfileObjectResponse({
    this.profileObjectUniqueKey,
  });
  factory PutProfileObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$PutProfileObjectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutProfileObjectTypeResponse {
  /// Description of the profile object type.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the profile object type.
  @_s.JsonKey(name: 'ObjectTypeName')
  final String objectTypeName;

  /// Indicates whether a profile should be created when data is received if one
  /// doesn’t exist for an object of this type. The default is <code>FALSE</code>.
  /// If the AllowProfileCreation flag is set to <code>FALSE</code>, then the
  /// service tries to fetch a standard profile and associate this object with the
  /// profile. If it is set to <code>TRUE</code>, and if no match is found, then
  /// the service creates a new standard profile.
  @_s.JsonKey(name: 'AllowProfileCreation')
  final bool allowProfileCreation;

  /// The timestamp of when the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The customer-provided key to encrypt the profile object that will be created
  /// in this profile object type.
  @_s.JsonKey(name: 'EncryptionKey')
  final String encryptionKey;

  /// The number of days until the data in the object expires.
  @_s.JsonKey(name: 'ExpirationDays')
  final int expirationDays;

  /// A map of the name and ObjectType field.
  @_s.JsonKey(name: 'Fields')
  final Map<String, ObjectTypeField> fields;

  /// A list of unique keys that can be used to map data to the profile.
  @_s.JsonKey(name: 'Keys')
  final Map<String, List<ObjectTypeKey>> keys;

  /// The timestamp of when the domain was most recently edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// A unique identifier for the object template.
  @_s.JsonKey(name: 'TemplateId')
  final String templateId;

  PutProfileObjectTypeResponse({
    @_s.required this.description,
    @_s.required this.objectTypeName,
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
  factory PutProfileObjectTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$PutProfileObjectTypeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchProfilesResponse {
  /// The list of SearchProfiles instances.
  @_s.JsonKey(name: 'Items')
  final List<Profile> items;

  /// The pagination token from the previous SearchProfiles API call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  SearchProfilesResponse({
    this.items,
    this.nextToken,
  });
  factory SearchProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchProfilesResponseFromJson(json);
}

enum StandardIdentifier {
  @_s.JsonValue('PROFILE')
  profile,
  @_s.JsonValue('UNIQUE')
  unique,
  @_s.JsonValue('SECONDARY')
  secondary,
  @_s.JsonValue('LOOKUP_ONLY')
  lookupOnly,
  @_s.JsonValue('NEW_ONLY')
  newOnly,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// Updates associated with the address properties of a customer profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateAddress {
  /// The first line of a customer address.
  @_s.JsonKey(name: 'Address1')
  final String address1;

  /// The second line of a customer address.
  @_s.JsonKey(name: 'Address2')
  final String address2;

  /// The third line of a customer address.
  @_s.JsonKey(name: 'Address3')
  final String address3;

  /// The fourth line of a customer address.
  @_s.JsonKey(name: 'Address4')
  final String address4;

  /// The city in which a customer lives.
  @_s.JsonKey(name: 'City')
  final String city;

  /// The country in which a customer lives.
  @_s.JsonKey(name: 'Country')
  final String country;

  /// The county in which a customer lives.
  @_s.JsonKey(name: 'County')
  final String county;

  /// The postal code of a customer address.
  @_s.JsonKey(name: 'PostalCode')
  final String postalCode;

  /// The province in which a customer lives.
  @_s.JsonKey(name: 'Province')
  final String province;

  /// The state in which a customer lives.
  @_s.JsonKey(name: 'State')
  final String state;

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
  Map<String, dynamic> toJson() => _$UpdateAddressToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainResponse {
  /// The timestamp of when the domain was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique name for the domain.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The timestamp of when the domain was most recently edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The URL of the SQS dead letter queue, which is used for reporting errors
  /// associated with ingesting data from third party applications.
  @_s.JsonKey(name: 'DeadLetterQueueUrl')
  final String deadLetterQueueUrl;

  /// The default encryption key, which is an AWS managed key, is used when no
  /// specific type of encryption key is specified. It is used to encrypt all data
  /// before it is placed in permanent or semi-permanent storage.
  @_s.JsonKey(name: 'DefaultEncryptionKey')
  final String defaultEncryptionKey;

  /// The default number of days until the data within the domain expires.
  @_s.JsonKey(name: 'DefaultExpirationDays')
  final int defaultExpirationDays;

  /// The tags used to organize, track, or control access for this resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  UpdateDomainResponse({
    @_s.required this.createdAt,
    @_s.required this.domainName,
    @_s.required this.lastUpdatedAt,
    this.deadLetterQueueUrl,
    this.defaultEncryptionKey,
    this.defaultExpirationDays,
    this.tags,
  });
  factory UpdateDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProfileResponse {
  /// The unique identifier of a customer profile.
  @_s.JsonKey(name: 'ProfileId')
  final String profileId;

  UpdateProfileResponse({
    @_s.required this.profileId,
  });
  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
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
