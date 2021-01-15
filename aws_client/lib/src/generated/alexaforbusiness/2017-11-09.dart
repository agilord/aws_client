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

part '2017-11-09.g.dart';

/// Alexa for Business helps you use Alexa in your organization. Alexa for
/// Business provides you with the tools to manage Alexa devices, enroll your
/// users, and assign skills, at scale. You can build your own context-aware
/// voice skills using the Alexa Skills Kit and the Alexa for Business API
/// operations. You can also make these available as private skills for your
/// organization. Alexa for Business makes it efficient to voice-enable your
/// products and services, thus providing context-aware voice experiences for
/// your customers. Device makers building with the Alexa Voice Service (AVS)
/// can create fully integrated solutions, register their products with Alexa
/// for Business, and manage them as shared devices in their organization.
class AlexaForBusiness {
  final _s.JsonProtocol _protocol;
  AlexaForBusiness({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'a4b',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates a skill with the organization under the customer's AWS account.
  /// If a skill is private, the user implicitly accepts access to this skill
  /// during enablement.
  ///
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [skillId] :
  /// The unique identifier of the skill.
  Future<void> approveSkill({
    @_s.required String skillId,
  }) async {
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ApproveSkill'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
      },
    );

    return ApproveSkillResponse.fromJson(jsonResponse.body);
  }

  /// Associates a contact with a given address book.
  ///
  /// May throw [LimitExceededException].
  ///
  /// Parameter [addressBookArn] :
  /// The ARN of the address book with which to associate the contact.
  ///
  /// Parameter [contactArn] :
  /// The ARN of the contact to associate with an address book.
  Future<void> associateContactWithAddressBook({
    @_s.required String addressBookArn,
    @_s.required String contactArn,
  }) async {
    ArgumentError.checkNotNull(addressBookArn, 'addressBookArn');
    _s.validateStringPattern(
      'addressBookArn',
      addressBookArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(contactArn, 'contactArn');
    _s.validateStringPattern(
      'contactArn',
      contactArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateContactWithAddressBook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressBookArn': addressBookArn,
        'ContactArn': contactArn,
      },
    );

    return AssociateContactWithAddressBookResponse.fromJson(jsonResponse.body);
  }

  /// Associates a device with the specified network profile.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [DeviceNotRegisteredException].
  ///
  /// Parameter [deviceArn] :
  /// The device ARN.
  ///
  /// Parameter [networkProfileArn] :
  /// The ARN of the network profile to associate with a device.
  Future<void> associateDeviceWithNetworkProfile({
    @_s.required String deviceArn,
    @_s.required String networkProfileArn,
  }) async {
    ArgumentError.checkNotNull(deviceArn, 'deviceArn');
    _s.validateStringPattern(
      'deviceArn',
      deviceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkProfileArn, 'networkProfileArn');
    _s.validateStringPattern(
      'networkProfileArn',
      networkProfileArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateDeviceWithNetworkProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceArn': deviceArn,
        'NetworkProfileArn': networkProfileArn,
      },
    );

    return AssociateDeviceWithNetworkProfileResponse.fromJson(
        jsonResponse.body);
  }

  /// Associates a device with a given room. This applies all the settings from
  /// the room profile to the device, and all the skills in any skill groups
  /// added to that room. This operation requires the device to be online, or
  /// else a manual sync is required.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [DeviceNotRegisteredException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device to associate to a room. Required.
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room with which to associate the device. Required.
  Future<void> associateDeviceWithRoom({
    String deviceArn,
    String roomArn,
  }) async {
    _s.validateStringPattern(
      'deviceArn',
      deviceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateDeviceWithRoom'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deviceArn != null) 'DeviceArn': deviceArn,
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );

    return AssociateDeviceWithRoomResponse.fromJson(jsonResponse.body);
  }

  /// Associates a skill group with a given room. This enables all skills in the
  /// associated skill group on all devices in the room.
  ///
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room with which to associate the skill group. Required.
  ///
  /// Parameter [skillGroupArn] :
  /// The ARN of the skill group to associate with a room. Required.
  Future<void> associateSkillGroupWithRoom({
    String roomArn,
    String skillGroupArn,
  }) async {
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringPattern(
      'skillGroupArn',
      skillGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateSkillGroupWithRoom'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (roomArn != null) 'RoomArn': roomArn,
        if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      },
    );

    return AssociateSkillGroupWithRoomResponse.fromJson(jsonResponse.body);
  }

  /// Associates a skill with a skill group.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [SkillNotLinkedException].
  ///
  /// Parameter [skillId] :
  /// The unique identifier of the skill.
  ///
  /// Parameter [skillGroupArn] :
  /// The ARN of the skill group to associate the skill to. Required.
  Future<void> associateSkillWithSkillGroup({
    @_s.required String skillId,
    String skillGroupArn,
  }) async {
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'skillGroupArn',
      skillGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateSkillWithSkillGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
        if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      },
    );

    return AssociateSkillWithSkillGroupResponse.fromJson(jsonResponse.body);
  }

  /// Makes a private skill available for enrolled users to enable on their
  /// devices.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [skillId] :
  /// The private skill ID you want to make available to enrolled users.
  Future<void> associateSkillWithUsers({
    @_s.required String skillId,
  }) async {
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateSkillWithUsers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
      },
    );

    return AssociateSkillWithUsersResponse.fromJson(jsonResponse.body);
  }

  /// Creates an address book with the specified details.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [name] :
  /// The name of the address book.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, user-specified identifier for the request that ensures
  /// idempotency.
  ///
  /// Parameter [description] :
  /// The description of the address book.
  Future<CreateAddressBookResponse> createAddressBook({
    @_s.required String name,
    String clientRequestToken,
    String description,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      200,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.CreateAddressBook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
      },
    );

    return CreateAddressBookResponse.fromJson(jsonResponse.body);
  }

  /// Creates a recurring schedule for usage reports to deliver to the specified
  /// S3 location with a specified daily or weekly interval.
  ///
  /// May throw [AlreadyExistsException].
  ///
  /// Parameter [contentRange] :
  /// The content range of the reports.
  ///
  /// Parameter [format] :
  /// The format of the generated report (individual CSV files or zipped files
  /// of individual files).
  ///
  /// Parameter [clientRequestToken] :
  /// The client request token.
  ///
  /// Parameter [recurrence] :
  /// The recurrence of the reports. If this isn't specified, the report will
  /// only be delivered one time when the API is called.
  ///
  /// Parameter [s3BucketName] :
  /// The S3 bucket name of the output reports. If this isn't specified, the
  /// report can be retrieved from a download link by calling
  /// ListBusinessReportSchedule.
  ///
  /// Parameter [s3KeyPrefix] :
  /// The S3 key where the report is delivered.
  ///
  /// Parameter [scheduleName] :
  /// The name identifier of the schedule.
  ///
  /// Parameter [tags] :
  /// The tags for the business report schedule.
  Future<CreateBusinessReportScheduleResponse> createBusinessReportSchedule({
    @_s.required BusinessReportContentRange contentRange,
    @_s.required BusinessReportFormat format,
    String clientRequestToken,
    BusinessReportRecurrence recurrence,
    String s3BucketName,
    String s3KeyPrefix,
    String scheduleName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(contentRange, 'contentRange');
    ArgumentError.checkNotNull(format, 'format');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
    );
    _s.validateStringPattern(
      's3BucketName',
      s3BucketName,
      r'''[a-z0-9-\.]{3,63}''',
    );
    _s.validateStringLength(
      's3KeyPrefix',
      s3KeyPrefix,
      0,
      100,
    );
    _s.validateStringPattern(
      's3KeyPrefix',
      s3KeyPrefix,
      r'''[A-Za-z0-9!_\-\.\*'()/]*''',
    );
    _s.validateStringLength(
      'scheduleName',
      scheduleName,
      0,
      64,
    );
    _s.validateStringPattern(
      'scheduleName',
      scheduleName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.CreateBusinessReportSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContentRange': contentRange,
        'Format': format?.toValue() ?? '',
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (recurrence != null) 'Recurrence': recurrence,
        if (s3BucketName != null) 'S3BucketName': s3BucketName,
        if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
        if (scheduleName != null) 'ScheduleName': scheduleName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateBusinessReportScheduleResponse.fromJson(jsonResponse.body);
  }

  /// Adds a new conference provider under the user's AWS account.
  ///
  /// May throw [AlreadyExistsException].
  ///
  /// Parameter [conferenceProviderName] :
  /// The name of the conference provider.
  ///
  /// Parameter [conferenceProviderType] :
  /// Represents a type within a list of predefined types.
  ///
  /// Parameter [meetingSetting] :
  /// The meeting settings for the conference provider.
  ///
  /// Parameter [clientRequestToken] :
  /// The request token of the client.
  ///
  /// Parameter [iPDialIn] :
  /// The IP endpoint and protocol for calling.
  ///
  /// Parameter [pSTNDialIn] :
  /// The information for PSTN conferencing.
  Future<CreateConferenceProviderResponse> createConferenceProvider({
    @_s.required String conferenceProviderName,
    @_s.required ConferenceProviderType conferenceProviderType,
    @_s.required MeetingSetting meetingSetting,
    String clientRequestToken,
    IPDialIn iPDialIn,
    PSTNDialIn pSTNDialIn,
  }) async {
    ArgumentError.checkNotNull(
        conferenceProviderName, 'conferenceProviderName');
    _s.validateStringLength(
      'conferenceProviderName',
      conferenceProviderName,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'conferenceProviderName',
      conferenceProviderName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        conferenceProviderType, 'conferenceProviderType');
    ArgumentError.checkNotNull(meetingSetting, 'meetingSetting');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.CreateConferenceProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConferenceProviderName': conferenceProviderName,
        'ConferenceProviderType': conferenceProviderType?.toValue() ?? '',
        'MeetingSetting': meetingSetting,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (iPDialIn != null) 'IPDialIn': iPDialIn,
        if (pSTNDialIn != null) 'PSTNDialIn': pSTNDialIn,
      },
    );

    return CreateConferenceProviderResponse.fromJson(jsonResponse.body);
  }

  /// Creates a contact with the specified details.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [firstName] :
  /// The first name of the contact that is used to call the contact on the
  /// device.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, user-specified identifier for this request that ensures
  /// idempotency.
  ///
  /// Parameter [displayName] :
  /// The name of the contact to display on the console.
  ///
  /// Parameter [lastName] :
  /// The last name of the contact that is used to call the contact on the
  /// device.
  ///
  /// Parameter [phoneNumber] :
  /// The phone number of the contact in E.164 format. The phone number type
  /// defaults to WORK. You can specify PhoneNumber or PhoneNumbers. We
  /// recommend that you use PhoneNumbers, which lets you specify the phone
  /// number type and multiple numbers.
  ///
  /// Parameter [phoneNumbers] :
  /// The list of phone numbers for the contact.
  ///
  /// Parameter [sipAddresses] :
  /// The list of SIP addresses for the contact.
  Future<CreateContactResponse> createContact({
    @_s.required String firstName,
    String clientRequestToken,
    String displayName,
    String lastName,
    String phoneNumber,
    List<PhoneNumber> phoneNumbers,
    List<SipAddress> sipAddresses,
  }) async {
    ArgumentError.checkNotNull(firstName, 'firstName');
    _s.validateStringLength(
      'firstName',
      firstName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'firstName',
      firstName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      1,
      100,
    );
    _s.validateStringPattern(
      'displayName',
      displayName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'lastName',
      lastName,
      1,
      100,
    );
    _s.validateStringPattern(
      'lastName',
      lastName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'phoneNumber',
      phoneNumber,
      0,
      50,
    );
    _s.validateStringPattern(
      'phoneNumber',
      phoneNumber,
      r'''^[\+0-9\#\,\(][\+0-9\-\.\/\(\)\,\#\s]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.CreateContact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FirstName': firstName,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (displayName != null) 'DisplayName': displayName,
        if (lastName != null) 'LastName': lastName,
        if (phoneNumber != null) 'PhoneNumber': phoneNumber,
        if (phoneNumbers != null) 'PhoneNumbers': phoneNumbers,
        if (sipAddresses != null) 'SipAddresses': sipAddresses,
      },
    );

    return CreateContactResponse.fromJson(jsonResponse.body);
  }

  /// Creates a gateway group with the specified details.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, user-specified identifier for the request that ensures
  /// idempotency.
  ///
  /// Parameter [name] :
  /// The name of the gateway group.
  ///
  /// Parameter [description] :
  /// The description of the gateway group.
  Future<CreateGatewayGroupResponse> createGatewayGroup({
    @_s.required String clientRequestToken,
    @_s.required String name,
    String description,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.CreateGatewayGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        'Name': name,
        if (description != null) 'Description': description,
      },
    );

    return CreateGatewayGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a network profile with the specified details.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidCertificateAuthorityException].
  /// May throw [InvalidServiceLinkedRoleStateException].
  ///
  /// Parameter [networkProfileName] :
  /// The name of the network profile associated with a device.
  ///
  /// Parameter [securityType] :
  /// The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE,
  /// WPA2_PSK, WPA_PSK, WEP, or OPEN.
  ///
  /// Parameter [ssid] :
  /// The SSID of the Wi-Fi network.
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The ARN of the Private Certificate Authority (PCA) created in AWS
  /// Certificate Manager (ACM). This is used to issue certificates to the
  /// devices.
  ///
  /// Parameter [currentPassword] :
  /// The current password of the Wi-Fi network.
  ///
  /// Parameter [description] :
  /// Detailed information about a device's network profile.
  ///
  /// Parameter [eapMethod] :
  /// The authentication standard that is used in the EAP framework. Currently,
  /// EAP_TLS is supported.
  ///
  /// Parameter [nextPassword] :
  /// The next, or subsequent, password of the Wi-Fi network. This password is
  /// asynchronously transmitted to the device and is used when the password of
  /// the network changes to NextPassword.
  ///
  /// Parameter [trustAnchors] :
  /// The root certificates of your authentication server that is installed on
  /// your devices and used to trust your authentication server during EAP
  /// negotiation.
  Future<CreateNetworkProfileResponse> createNetworkProfile({
    @_s.required String clientRequestToken,
    @_s.required String networkProfileName,
    @_s.required NetworkSecurityType securityType,
    @_s.required String ssid,
    String certificateAuthorityArn,
    String currentPassword,
    String description,
    NetworkEapMethod eapMethod,
    String nextPassword,
    List<String> trustAnchors,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkProfileName, 'networkProfileName');
    _s.validateStringLength(
      'networkProfileName',
      networkProfileName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'networkProfileName',
      networkProfileName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(securityType, 'securityType');
    ArgumentError.checkNotNull(ssid, 'ssid');
    _s.validateStringLength(
      'ssid',
      ssid,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ssid',
      ssid,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringLength(
      'currentPassword',
      currentPassword,
      5,
      128,
    );
    _s.validateStringPattern(
      'currentPassword',
      currentPassword,
      r'''[\x00-\x7F]*''',
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'nextPassword',
      nextPassword,
      0,
      128,
    );
    _s.validateStringPattern(
      'nextPassword',
      nextPassword,
      r'''(^$)|([\x00-\x7F]{5,})''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.CreateNetworkProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        'NetworkProfileName': networkProfileName,
        'SecurityType': securityType?.toValue() ?? '',
        'Ssid': ssid,
        if (certificateAuthorityArn != null)
          'CertificateAuthorityArn': certificateAuthorityArn,
        if (currentPassword != null) 'CurrentPassword': currentPassword,
        if (description != null) 'Description': description,
        if (eapMethod != null) 'EapMethod': eapMethod.toValue(),
        if (nextPassword != null) 'NextPassword': nextPassword,
        if (trustAnchors != null) 'TrustAnchors': trustAnchors,
      },
    );

    return CreateNetworkProfileResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new room profile with the specified details.
  ///
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [address] :
  /// The valid address for the room.
  ///
  /// Parameter [distanceUnit] :
  /// The distance unit to be used by devices in the profile.
  ///
  /// Parameter [profileName] :
  /// The name of a room profile.
  ///
  /// Parameter [temperatureUnit] :
  /// The temperature unit to be used by devices in the profile.
  ///
  /// Parameter [timezone] :
  /// The time zone used by a room profile.
  ///
  /// Parameter [wakeWord] :
  /// A wake word for Alexa, Echo, Amazon, or a computer.
  ///
  /// Parameter [clientRequestToken] :
  /// The user-specified token that is used during the creation of a profile.
  ///
  /// Parameter [locale] :
  /// The locale of the room profile. (This is currently only available to a
  /// limited preview audience.)
  ///
  /// Parameter [maxVolumeLimit] :
  /// The maximum volume limit for a room profile.
  ///
  /// Parameter [meetingRoomConfiguration] :
  /// The meeting room settings of a room profile.
  ///
  /// Parameter [pSTNEnabled] :
  /// Whether PSTN calling is enabled.
  ///
  /// Parameter [setupModeDisabled] :
  /// Whether room profile setup is enabled.
  ///
  /// Parameter [tags] :
  /// The tags for the profile.
  Future<CreateProfileResponse> createProfile({
    @_s.required String address,
    @_s.required DistanceUnit distanceUnit,
    @_s.required String profileName,
    @_s.required TemperatureUnit temperatureUnit,
    @_s.required String timezone,
    @_s.required WakeWord wakeWord,
    String clientRequestToken,
    String locale,
    int maxVolumeLimit,
    CreateMeetingRoomConfiguration meetingRoomConfiguration,
    bool pSTNEnabled,
    bool setupModeDisabled,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(address, 'address');
    _s.validateStringLength(
      'address',
      address,
      1,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(distanceUnit, 'distanceUnit');
    ArgumentError.checkNotNull(profileName, 'profileName');
    _s.validateStringLength(
      'profileName',
      profileName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(temperatureUnit, 'temperatureUnit');
    ArgumentError.checkNotNull(timezone, 'timezone');
    _s.validateStringLength(
      'timezone',
      timezone,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(wakeWord, 'wakeWord');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
    );
    _s.validateStringLength(
      'locale',
      locale,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.CreateProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Address': address,
        'DistanceUnit': distanceUnit?.toValue() ?? '',
        'ProfileName': profileName,
        'TemperatureUnit': temperatureUnit?.toValue() ?? '',
        'Timezone': timezone,
        'WakeWord': wakeWord?.toValue() ?? '',
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (locale != null) 'Locale': locale,
        if (maxVolumeLimit != null) 'MaxVolumeLimit': maxVolumeLimit,
        if (meetingRoomConfiguration != null)
          'MeetingRoomConfiguration': meetingRoomConfiguration,
        if (pSTNEnabled != null) 'PSTNEnabled': pSTNEnabled,
        if (setupModeDisabled != null) 'SetupModeDisabled': setupModeDisabled,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateProfileResponse.fromJson(jsonResponse.body);
  }

  /// Creates a room with the specified details.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [roomName] :
  /// The name for the room.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, user-specified identifier for this request that ensures
  /// idempotency.
  ///
  /// Parameter [description] :
  /// The description for the room.
  ///
  /// Parameter [profileArn] :
  /// The profile ARN for the room. This is required.
  ///
  /// Parameter [providerCalendarId] :
  /// The calendar ARN for the room.
  ///
  /// Parameter [tags] :
  /// The tags for the room.
  Future<CreateRoomResponse> createRoom({
    @_s.required String roomName,
    String clientRequestToken,
    String description,
    String profileArn,
    String providerCalendarId,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(roomName, 'roomName');
    _s.validateStringLength(
      'roomName',
      roomName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roomName',
      roomName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      200,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringPattern(
      'profileArn',
      profileArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringLength(
      'providerCalendarId',
      providerCalendarId,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.CreateRoom'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoomName': roomName,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (profileArn != null) 'ProfileArn': profileArn,
        if (providerCalendarId != null)
          'ProviderCalendarId': providerCalendarId,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRoomResponse.fromJson(jsonResponse.body);
  }

  /// Creates a skill group with a specified name and description.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [skillGroupName] :
  /// The name for the skill group.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, user-specified identifier for this request that ensures
  /// idempotency.
  ///
  /// Parameter [description] :
  /// The description for the skill group.
  ///
  /// Parameter [tags] :
  /// The tags for the skill group.
  Future<CreateSkillGroupResponse> createSkillGroup({
    @_s.required String skillGroupName,
    String clientRequestToken,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(skillGroupName, 'skillGroupName');
    _s.validateStringLength(
      'skillGroupName',
      skillGroupName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'skillGroupName',
      skillGroupName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      200,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.CreateSkillGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillGroupName': skillGroupName,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateSkillGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a user.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [userId] :
  /// The ARN for the user.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, user-specified identifier for this request that ensures
  /// idempotency.
  ///
  /// Parameter [email] :
  /// The email address for the user.
  ///
  /// Parameter [firstName] :
  /// The first name for the user.
  ///
  /// Parameter [lastName] :
  /// The last name for the user.
  ///
  /// Parameter [tags] :
  /// The tags for the user.
  Future<CreateUserResponse> createUser({
    @_s.required String userId,
    String clientRequestToken,
    String email,
    String firstName,
    String lastName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userId',
      userId,
      r'''[a-zA-Z0-9@_+.-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
    );
    _s.validateStringLength(
      'email',
      email,
      1,
      128,
    );
    _s.validateStringPattern(
      'email',
      email,
      r'''([0-9a-zA-Z]([+-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z]([-\w]*[0-9a-zA-Z]+)*\.)+[a-zA-Z]{2,9})''',
    );
    _s.validateStringLength(
      'firstName',
      firstName,
      0,
      30,
    );
    _s.validateStringPattern(
      'firstName',
      firstName,
      r'''([A-Za-z\-' 0-9._]|\p{IsLetter})*''',
    );
    _s.validateStringLength(
      'lastName',
      lastName,
      0,
      30,
    );
    _s.validateStringPattern(
      'lastName',
      lastName,
      r'''([A-Za-z\-' 0-9._]|\p{IsLetter})*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.CreateUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'UserId': userId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (email != null) 'Email': email,
        if (firstName != null) 'FirstName': firstName,
        if (lastName != null) 'LastName': lastName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateUserResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an address book by the address book ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [addressBookArn] :
  /// The ARN of the address book to delete.
  Future<void> deleteAddressBook({
    @_s.required String addressBookArn,
  }) async {
    ArgumentError.checkNotNull(addressBookArn, 'addressBookArn');
    _s.validateStringPattern(
      'addressBookArn',
      addressBookArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteAddressBook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressBookArn': addressBookArn,
      },
    );

    return DeleteAddressBookResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the recurring report delivery schedule with the specified schedule
  /// ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [scheduleArn] :
  /// The ARN of the business report schedule.
  Future<void> deleteBusinessReportSchedule({
    @_s.required String scheduleArn,
  }) async {
    ArgumentError.checkNotNull(scheduleArn, 'scheduleArn');
    _s.validateStringPattern(
      'scheduleArn',
      scheduleArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteBusinessReportSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScheduleArn': scheduleArn,
      },
    );

    return DeleteBusinessReportScheduleResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a conference provider.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [conferenceProviderArn] :
  /// The ARN of the conference provider.
  Future<void> deleteConferenceProvider({
    @_s.required String conferenceProviderArn,
  }) async {
    ArgumentError.checkNotNull(conferenceProviderArn, 'conferenceProviderArn');
    _s.validateStringPattern(
      'conferenceProviderArn',
      conferenceProviderArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteConferenceProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConferenceProviderArn': conferenceProviderArn,
      },
    );

    return DeleteConferenceProviderResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a contact by the contact ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [contactArn] :
  /// The ARN of the contact to delete.
  Future<void> deleteContact({
    @_s.required String contactArn,
  }) async {
    ArgumentError.checkNotNull(contactArn, 'contactArn');
    _s.validateStringPattern(
      'contactArn',
      contactArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteContact'
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

    return DeleteContactResponse.fromJson(jsonResponse.body);
  }

  /// Removes a device from Alexa For Business.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidCertificateAuthorityException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device for which to request details.
  Future<void> deleteDevice({
    @_s.required String deviceArn,
  }) async {
    ArgumentError.checkNotNull(deviceArn, 'deviceArn');
    _s.validateStringPattern(
      'deviceArn',
      deviceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteDevice'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceArn': deviceArn,
      },
    );

    return DeleteDeviceResponse.fromJson(jsonResponse.body);
  }

  /// When this action is called for a specified shared device, it allows
  /// authorized users to delete the device's entire previous history of voice
  /// input data and associated response data. This action can be called once
  /// every 24 hours for a specific shared device.
  ///
  /// May throw [NotFoundException].
  /// May throw [DeviceNotRegisteredException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device.
  ///
  /// Parameter [deviceUsageType] :
  /// The type of usage data to delete.
  Future<void> deleteDeviceUsageData({
    @_s.required String deviceArn,
    @_s.required DeviceUsageType deviceUsageType,
  }) async {
    ArgumentError.checkNotNull(deviceArn, 'deviceArn');
    _s.validateStringPattern(
      'deviceArn',
      deviceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(deviceUsageType, 'deviceUsageType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteDeviceUsageData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceArn': deviceArn,
        'DeviceUsageType': deviceUsageType?.toValue() ?? '',
      },
    );

    return DeleteDeviceUsageDataResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a gateway group.
  ///
  /// May throw [ResourceAssociatedException].
  ///
  /// Parameter [gatewayGroupArn] :
  /// The ARN of the gateway group to delete.
  Future<void> deleteGatewayGroup({
    @_s.required String gatewayGroupArn,
  }) async {
    ArgumentError.checkNotNull(gatewayGroupArn, 'gatewayGroupArn');
    _s.validateStringPattern(
      'gatewayGroupArn',
      gatewayGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteGatewayGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayGroupArn': gatewayGroupArn,
      },
    );

    return DeleteGatewayGroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a network profile by the network profile ARN.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [networkProfileArn] :
  /// The ARN of the network profile associated with a device.
  Future<void> deleteNetworkProfile({
    @_s.required String networkProfileArn,
  }) async {
    ArgumentError.checkNotNull(networkProfileArn, 'networkProfileArn');
    _s.validateStringPattern(
      'networkProfileArn',
      networkProfileArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteNetworkProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NetworkProfileArn': networkProfileArn,
      },
    );

    return DeleteNetworkProfileResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a room profile by the profile ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [profileArn] :
  /// The ARN of the room profile to delete. Required.
  Future<void> deleteProfile({
    String profileArn,
  }) async {
    _s.validateStringPattern(
      'profileArn',
      profileArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (profileArn != null) 'ProfileArn': profileArn,
      },
    );

    return DeleteProfileResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a room by the room ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room to delete. Required.
  Future<void> deleteRoom({
    String roomArn,
  }) async {
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteRoom'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );

    return DeleteRoomResponse.fromJson(jsonResponse.body);
  }

  /// Deletes room skill parameter details by room, skill, and parameter key ID.
  ///
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [parameterKey] :
  /// The room skill parameter key for which to remove details.
  ///
  /// Parameter [skillId] :
  /// The ID of the skill from which to remove the room skill parameter details.
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room from which to remove the room skill parameter details.
  Future<void> deleteRoomSkillParameter({
    @_s.required String parameterKey,
    @_s.required String skillId,
    String roomArn,
  }) async {
    ArgumentError.checkNotNull(parameterKey, 'parameterKey');
    _s.validateStringLength(
      'parameterKey',
      parameterKey,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteRoomSkillParameter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParameterKey': parameterKey,
        'SkillId': skillId,
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );

    return DeleteRoomSkillParameterResponse.fromJson(jsonResponse.body);
  }

  /// Unlinks a third-party account from a skill.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [skillId] :
  /// The unique identifier of a skill.
  ///
  /// Parameter [roomArn] :
  /// The room that the skill is authorized for.
  Future<void> deleteSkillAuthorization({
    @_s.required String skillId,
    String roomArn,
  }) async {
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteSkillAuthorization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );

    return DeleteSkillAuthorizationResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a skill group by skill group ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [skillGroupArn] :
  /// The ARN of the skill group to delete. Required.
  Future<void> deleteSkillGroup({
    String skillGroupArn,
  }) async {
    _s.validateStringPattern(
      'skillGroupArn',
      skillGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteSkillGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      },
    );

    return DeleteSkillGroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a specified user by user ARN and enrollment ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [enrollmentId] :
  /// The ARN of the user's enrollment in the organization. Required.
  ///
  /// Parameter [userArn] :
  /// The ARN of the user to delete in the organization. Required.
  Future<void> deleteUser({
    @_s.required String enrollmentId,
    String userArn,
  }) async {
    ArgumentError.checkNotNull(enrollmentId, 'enrollmentId');
    _s.validateStringLength(
      'enrollmentId',
      enrollmentId,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'userArn',
      userArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteUser'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EnrollmentId': enrollmentId,
        if (userArn != null) 'UserArn': userArn,
      },
    );

    return DeleteUserResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates a contact from a given address book.
  ///
  /// Parameter [addressBookArn] :
  /// The ARN of the address from which to disassociate the contact.
  ///
  /// Parameter [contactArn] :
  /// The ARN of the contact to disassociate from an address book.
  Future<void> disassociateContactFromAddressBook({
    @_s.required String addressBookArn,
    @_s.required String contactArn,
  }) async {
    ArgumentError.checkNotNull(addressBookArn, 'addressBookArn');
    _s.validateStringPattern(
      'addressBookArn',
      addressBookArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(contactArn, 'contactArn');
    _s.validateStringPattern(
      'contactArn',
      contactArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DisassociateContactFromAddressBook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressBookArn': addressBookArn,
        'ContactArn': contactArn,
      },
    );

    return DisassociateContactFromAddressBookResponse.fromJson(
        jsonResponse.body);
  }

  /// Disassociates a device from its current room. The device continues to be
  /// connected to the Wi-Fi network and is still registered to the account. The
  /// device settings and skills are removed from the room.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [DeviceNotRegisteredException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device to disassociate from a room. Required.
  Future<void> disassociateDeviceFromRoom({
    String deviceArn,
  }) async {
    _s.validateStringPattern(
      'deviceArn',
      deviceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DisassociateDeviceFromRoom'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deviceArn != null) 'DeviceArn': deviceArn,
      },
    );

    return DisassociateDeviceFromRoomResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates a skill from a skill group.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [skillId] :
  /// The ARN of a skill group to associate to a skill.
  ///
  /// Parameter [skillGroupArn] :
  /// The unique identifier of a skill. Required.
  Future<void> disassociateSkillFromSkillGroup({
    @_s.required String skillId,
    String skillGroupArn,
  }) async {
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'skillGroupArn',
      skillGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DisassociateSkillFromSkillGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
        if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      },
    );

    return DisassociateSkillFromSkillGroupResponse.fromJson(jsonResponse.body);
  }

  /// Makes a private skill unavailable for enrolled users and prevents them
  /// from enabling it on their devices.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [skillId] :
  /// The private skill ID you want to make unavailable for enrolled users.
  Future<void> disassociateSkillFromUsers({
    @_s.required String skillId,
  }) async {
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DisassociateSkillFromUsers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
      },
    );

    return DisassociateSkillFromUsersResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates a skill group from a specified room. This disables all
  /// skills in the skill group on all devices in the room.
  ///
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room from which the skill group is to be disassociated.
  /// Required.
  ///
  /// Parameter [skillGroupArn] :
  /// The ARN of the skill group to disassociate from a room. Required.
  Future<void> disassociateSkillGroupFromRoom({
    String roomArn,
    String skillGroupArn,
  }) async {
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringPattern(
      'skillGroupArn',
      skillGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DisassociateSkillGroupFromRoom'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (roomArn != null) 'RoomArn': roomArn,
        if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      },
    );

    return DisassociateSkillGroupFromRoomResponse.fromJson(jsonResponse.body);
  }

  /// Forgets smart home appliances associated to a room.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [roomArn] :
  /// The room that the appliances are associated with.
  Future<void> forgetSmartHomeAppliances({
    @_s.required String roomArn,
  }) async {
    ArgumentError.checkNotNull(roomArn, 'roomArn');
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ForgetSmartHomeAppliances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoomArn': roomArn,
      },
    );

    return ForgetSmartHomeAppliancesResponse.fromJson(jsonResponse.body);
  }

  /// Gets address the book details by the address book ARN.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [addressBookArn] :
  /// The ARN of the address book for which to request details.
  Future<GetAddressBookResponse> getAddressBook({
    @_s.required String addressBookArn,
  }) async {
    ArgumentError.checkNotNull(addressBookArn, 'addressBookArn');
    _s.validateStringPattern(
      'addressBookArn',
      addressBookArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetAddressBook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressBookArn': addressBookArn,
      },
    );

    return GetAddressBookResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the existing conference preferences.
  ///
  /// May throw [NotFoundException].
  Future<GetConferencePreferenceResponse> getConferencePreference() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetConferencePreference'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetConferencePreferenceResponse.fromJson(jsonResponse.body);
  }

  /// Gets details about a specific conference provider.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [conferenceProviderArn] :
  /// The ARN of the newly created conference provider.
  Future<GetConferenceProviderResponse> getConferenceProvider({
    @_s.required String conferenceProviderArn,
  }) async {
    ArgumentError.checkNotNull(conferenceProviderArn, 'conferenceProviderArn');
    _s.validateStringPattern(
      'conferenceProviderArn',
      conferenceProviderArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetConferenceProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConferenceProviderArn': conferenceProviderArn,
      },
    );

    return GetConferenceProviderResponse.fromJson(jsonResponse.body);
  }

  /// Gets the contact details by the contact ARN.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [contactArn] :
  /// The ARN of the contact for which to request details.
  Future<GetContactResponse> getContact({
    @_s.required String contactArn,
  }) async {
    ArgumentError.checkNotNull(contactArn, 'contactArn');
    _s.validateStringPattern(
      'contactArn',
      contactArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetContact'
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

    return GetContactResponse.fromJson(jsonResponse.body);
  }

  /// Gets the details of a device by device ARN.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device for which to request details. Required.
  Future<GetDeviceResponse> getDevice({
    String deviceArn,
  }) async {
    _s.validateStringPattern(
      'deviceArn',
      deviceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetDevice'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deviceArn != null) 'DeviceArn': deviceArn,
      },
    );

    return GetDeviceResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details of a gateway.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [gatewayArn] :
  /// The ARN of the gateway to get.
  Future<GetGatewayResponse> getGateway({
    @_s.required String gatewayArn,
  }) async {
    ArgumentError.checkNotNull(gatewayArn, 'gatewayArn');
    _s.validateStringPattern(
      'gatewayArn',
      gatewayArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
      },
    );

    return GetGatewayResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details of a gateway group.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [gatewayGroupArn] :
  /// The ARN of the gateway group to get.
  Future<GetGatewayGroupResponse> getGatewayGroup({
    @_s.required String gatewayGroupArn,
  }) async {
    ArgumentError.checkNotNull(gatewayGroupArn, 'gatewayGroupArn');
    _s.validateStringPattern(
      'gatewayGroupArn',
      gatewayGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetGatewayGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayGroupArn': gatewayGroupArn,
      },
    );

    return GetGatewayGroupResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the configured values for the user enrollment invitation email
  /// template.
  ///
  /// May throw [NotFoundException].
  Future<GetInvitationConfigurationResponse>
      getInvitationConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetInvitationConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetInvitationConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Gets the network profile details by the network profile ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidSecretsManagerResourceException].
  ///
  /// Parameter [networkProfileArn] :
  /// The ARN of the network profile associated with a device.
  Future<GetNetworkProfileResponse> getNetworkProfile({
    @_s.required String networkProfileArn,
  }) async {
    ArgumentError.checkNotNull(networkProfileArn, 'networkProfileArn');
    _s.validateStringPattern(
      'networkProfileArn',
      networkProfileArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetNetworkProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NetworkProfileArn': networkProfileArn,
      },
    );

    return GetNetworkProfileResponse.fromJson(jsonResponse.body);
  }

  /// Gets the details of a room profile by profile ARN.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [profileArn] :
  /// The ARN of the room profile for which to request details. Required.
  Future<GetProfileResponse> getProfile({
    String profileArn,
  }) async {
    _s.validateStringPattern(
      'profileArn',
      profileArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (profileArn != null) 'ProfileArn': profileArn,
      },
    );

    return GetProfileResponse.fromJson(jsonResponse.body);
  }

  /// Gets room details by room ARN.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room for which to request details. Required.
  Future<GetRoomResponse> getRoom({
    String roomArn,
  }) async {
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetRoom'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );

    return GetRoomResponse.fromJson(jsonResponse.body);
  }

  /// Gets room skill parameter details by room, skill, and parameter key ARN.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [parameterKey] :
  /// The room skill parameter key for which to get details. Required.
  ///
  /// Parameter [skillId] :
  /// The ARN of the skill from which to get the room skill parameter details.
  /// Required.
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room from which to get the room skill parameter details.
  Future<GetRoomSkillParameterResponse> getRoomSkillParameter({
    @_s.required String parameterKey,
    @_s.required String skillId,
    String roomArn,
  }) async {
    ArgumentError.checkNotNull(parameterKey, 'parameterKey');
    _s.validateStringLength(
      'parameterKey',
      parameterKey,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetRoomSkillParameter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ParameterKey': parameterKey,
        'SkillId': skillId,
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );

    return GetRoomSkillParameterResponse.fromJson(jsonResponse.body);
  }

  /// Gets skill group details by skill group ARN.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [skillGroupArn] :
  /// The ARN of the skill group for which to get details. Required.
  Future<GetSkillGroupResponse> getSkillGroup({
    String skillGroupArn,
  }) async {
    _s.validateStringPattern(
      'skillGroupArn',
      skillGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.GetSkillGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      },
    );

    return GetSkillGroupResponse.fromJson(jsonResponse.body);
  }

  /// Lists the details of the schedules that a user configured. A download URL
  /// of the report associated with each schedule is returned every time this
  /// action is called. A new download URL is returned each time, and is valid
  /// for 24 hours.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of schedules listed in the call.
  ///
  /// Parameter [nextToken] :
  /// The token used to list the remaining schedules from the previous API call.
  Future<ListBusinessReportSchedulesResponse> listBusinessReportSchedules({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ListBusinessReportSchedules'
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

    return ListBusinessReportSchedulesResponse.fromJson(jsonResponse.body);
  }

  /// Lists conference providers under a specific AWS account.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of conference providers to be returned, per paginated
  /// calls.
  ///
  /// Parameter [nextToken] :
  /// The tokens used for pagination.
  Future<ListConferenceProvidersResponse> listConferenceProviders({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ListConferenceProviders'
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

    return ListConferenceProvidersResponse.fromJson(jsonResponse.body);
  }

  /// Lists the device event history, including device connection status, for up
  /// to 30 days.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of a device.
  ///
  /// Parameter [eventType] :
  /// The event type to filter device events. If EventType isn't specified, this
  /// returns a list of all device events in reverse chronological order. If
  /// EventType is specified, this returns a list of device events for that
  /// EventType in reverse chronological order.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. The default
  /// value is 50. If more results exist than the specified MaxResults value, a
  /// token is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response only includes results beyond the token, up to the value
  /// specified by MaxResults. When the end of results is reached, the response
  /// has a value of null.
  Future<ListDeviceEventsResponse> listDeviceEvents({
    @_s.required String deviceArn,
    DeviceEventType eventType,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(deviceArn, 'deviceArn');
    _s.validateStringPattern(
      'deviceArn',
      deviceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ListDeviceEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceArn': deviceArn,
        if (eventType != null) 'EventType': eventType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDeviceEventsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of gateway group summaries. Use GetGatewayGroup to
  /// retrieve details of a specific gateway group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of gateway group summaries to return. The default is
  /// 50.
  ///
  /// Parameter [nextToken] :
  /// The token used to paginate though multiple pages of gateway group
  /// summaries.
  Future<ListGatewayGroupsResponse> listGatewayGroups({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ListGatewayGroups'
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

    return ListGatewayGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a list of gateway summaries. Use GetGateway to retrieve details
  /// of a specific gateway. An optional gateway group ARN can be provided to
  /// only retrieve gateway summaries of gateways that are associated with that
  /// gateway group ARN.
  ///
  /// Parameter [gatewayGroupArn] :
  /// The gateway group ARN for which to list gateways.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of gateway summaries to return. The default is 50.
  ///
  /// Parameter [nextToken] :
  /// The token used to paginate though multiple pages of gateway summaries.
  Future<ListGatewaysResponse> listGateways({
    String gatewayGroupArn,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringPattern(
      'gatewayGroupArn',
      gatewayGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ListGateways'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (gatewayGroupArn != null) 'GatewayGroupArn': gatewayGroupArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGatewaysResponse.fromJson(jsonResponse.body);
  }

  /// Lists all enabled skills in a specific skill group.
  ///
  /// Parameter [enablementType] :
  /// Whether the skill is enabled under the user's account.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  ///
  /// Parameter [skillGroupArn] :
  /// The ARN of the skill group for which to list enabled skills.
  ///
  /// Parameter [skillType] :
  /// Whether the skill is publicly available or is a private skill.
  Future<ListSkillsResponse> listSkills({
    EnablementTypeFilter enablementType,
    int maxResults,
    String nextToken,
    String skillGroupArn,
    SkillTypeFilter skillType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    _s.validateStringPattern(
      'skillGroupArn',
      skillGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ListSkills'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (enablementType != null) 'EnablementType': enablementType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
        if (skillType != null) 'SkillType': skillType.toValue(),
      },
    );

    return ListSkillsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all categories in the Alexa skill store.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of categories returned, per paginated calls.
  ///
  /// Parameter [nextToken] :
  /// The tokens used for pagination.
  Future<ListSkillsStoreCategoriesResponse> listSkillsStoreCategories({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ListSkillsStoreCategories'
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

    return ListSkillsStoreCategoriesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all skills in the Alexa skill store by category.
  ///
  /// Parameter [categoryId] :
  /// The category ID for which the skills are being retrieved from the skill
  /// store.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of skills returned per paginated calls.
  ///
  /// Parameter [nextToken] :
  /// The tokens used for pagination.
  Future<ListSkillsStoreSkillsByCategoryResponse>
      listSkillsStoreSkillsByCategory({
    @_s.required int categoryId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(categoryId, 'categoryId');
    _s.validateNumRange(
      'categoryId',
      categoryId,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ListSkillsStoreSkillsByCategory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CategoryId': categoryId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSkillsStoreSkillsByCategoryResponse.fromJson(jsonResponse.body);
  }

  /// Lists all of the smart home appliances associated with a room.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [roomArn] :
  /// The room that the appliances are associated with.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of appliances to be returned, per paginated calls.
  ///
  /// Parameter [nextToken] :
  /// The tokens used for pagination.
  Future<ListSmartHomeAppliancesResponse> listSmartHomeAppliances({
    @_s.required String roomArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(roomArn, 'roomArn');
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ListSmartHomeAppliances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoomArn': roomArn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSmartHomeAppliancesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all tags for the specified resource.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [arn] :
  /// The ARN of the specified resource for which to list tags.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  Future<ListTagsResponse> listTags({
    @_s.required String arn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ListTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Arn': arn,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsResponse.fromJson(jsonResponse.body);
  }

  /// Sets the conference preferences on a specific conference provider at the
  /// account level.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [conferencePreference] :
  /// The conference preference of a specific conference provider.
  Future<void> putConferencePreference({
    @_s.required ConferencePreference conferencePreference,
  }) async {
    ArgumentError.checkNotNull(conferencePreference, 'conferencePreference');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.PutConferencePreference'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConferencePreference': conferencePreference,
      },
    );

    return PutConferencePreferenceResponse.fromJson(jsonResponse.body);
  }

  /// Configures the email template for the user enrollment invitation with the
  /// specified attributes.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [organizationName] :
  /// The name of the organization sending the enrollment invite to a user.
  ///
  /// Parameter [contactEmail] :
  /// The email ID of the organization or individual contact that the enrolled
  /// user can use.
  ///
  /// Parameter [privateSkillIds] :
  /// The list of private skill IDs that you want to recommend to the user to
  /// enable in the invitation.
  Future<void> putInvitationConfiguration({
    @_s.required String organizationName,
    String contactEmail,
    List<String> privateSkillIds,
  }) async {
    ArgumentError.checkNotNull(organizationName, 'organizationName');
    _s.validateStringLength(
      'organizationName',
      organizationName,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'organizationName',
      organizationName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'contactEmail',
      contactEmail,
      1,
      128,
    );
    _s.validateStringPattern(
      'contactEmail',
      contactEmail,
      r'''([0-9a-zA-Z]([+-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z]([-\w]*[0-9a-zA-Z]+)*\.)+[a-zA-Z]{2,9})''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.PutInvitationConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OrganizationName': organizationName,
        if (contactEmail != null) 'ContactEmail': contactEmail,
        if (privateSkillIds != null) 'PrivateSkillIds': privateSkillIds,
      },
    );

    return PutInvitationConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Updates room skill parameter details by room, skill, and parameter key ID.
  /// Not all skills have a room skill parameter.
  ///
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [roomSkillParameter] :
  /// The updated room skill parameter. Required.
  ///
  /// Parameter [skillId] :
  /// The ARN of the skill associated with the room skill parameter. Required.
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room associated with the room skill parameter. Required.
  Future<void> putRoomSkillParameter({
    @_s.required RoomSkillParameter roomSkillParameter,
    @_s.required String skillId,
    String roomArn,
  }) async {
    ArgumentError.checkNotNull(roomSkillParameter, 'roomSkillParameter');
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.PutRoomSkillParameter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoomSkillParameter': roomSkillParameter,
        'SkillId': skillId,
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );

    return PutRoomSkillParameterResponse.fromJson(jsonResponse.body);
  }

  /// Links a user's account to a third-party skill provider. If this API
  /// operation is called by an assumed IAM role, the skill being linked must be
  /// a private skill. Also, the skill must be owned by the AWS account that
  /// assumed the IAM role.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [authorizationResult] :
  /// The authorization result specific to OAUTH code grant output. "Code” must
  /// be populated in the AuthorizationResult map to establish the
  /// authorization.
  ///
  /// Parameter [skillId] :
  /// The unique identifier of a skill.
  ///
  /// Parameter [roomArn] :
  /// The room that the skill is authorized for.
  Future<void> putSkillAuthorization({
    @_s.required Map<String, String> authorizationResult,
    @_s.required String skillId,
    String roomArn,
  }) async {
    ArgumentError.checkNotNull(authorizationResult, 'authorizationResult');
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.PutSkillAuthorization'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthorizationResult': authorizationResult,
        'SkillId': skillId,
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );

    return PutSkillAuthorizationResponse.fromJson(jsonResponse.body);
  }

  /// Registers an Alexa-enabled device built by an Original Equipment
  /// Manufacturer (OEM) using Alexa Voice Service (AVS).
  ///
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [InvalidDeviceException].
  ///
  /// Parameter [amazonId] :
  /// The device type ID for your AVS device generated by Amazon when the OEM
  /// creates a new product on Amazon's Developer Console.
  ///
  /// Parameter [clientId] :
  /// The client ID of the OEM used for code-based linking authorization on an
  /// AVS device.
  ///
  /// Parameter [productId] :
  /// The product ID used to identify your AVS device during authorization.
  ///
  /// Parameter [userCode] :
  /// The code that is obtained after your AVS device has made a POST request to
  /// LWA as a part of the Device Authorization Request component of the OAuth
  /// code-based linking specification.
  ///
  /// Parameter [deviceSerialNumber] :
  /// The key generated by the OEM that uniquely identifies a specified instance
  /// of your AVS device.
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room with which to associate your AVS device.
  Future<RegisterAVSDeviceResponse> registerAVSDevice({
    @_s.required String amazonId,
    @_s.required String clientId,
    @_s.required String productId,
    @_s.required String userCode,
    String deviceSerialNumber,
    String roomArn,
  }) async {
    ArgumentError.checkNotNull(amazonId, 'amazonId');
    _s.validateStringPattern(
      'amazonId',
      amazonId,
      r'''[a-zA-Z0-9]{1,18}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(clientId, 'clientId');
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''^\S+{1,256}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(productId, 'productId');
    _s.validateStringPattern(
      'productId',
      productId,
      r'''^[a-zA-Z0-9_]{1,256}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userCode, 'userCode');
    _s.validateStringLength(
      'userCode',
      userCode,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deviceSerialNumber',
      deviceSerialNumber,
      r'''^[a-zA-Z0-9]{1,50}$''',
    );
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.RegisterAVSDevice'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AmazonId': amazonId,
        'ClientId': clientId,
        'ProductId': productId,
        'UserCode': userCode,
        if (deviceSerialNumber != null)
          'DeviceSerialNumber': deviceSerialNumber,
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );

    return RegisterAVSDeviceResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates a skill from the organization under a user's AWS account. If
  /// the skill is a private skill, it moves to an AcceptStatus of PENDING. Any
  /// private or public skill that is rejected can be added later by calling the
  /// ApproveSkill API.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [skillId] :
  /// The unique identifier of the skill.
  Future<void> rejectSkill({
    @_s.required String skillId,
  }) async {
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.RejectSkill'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
      },
    );

    return RejectSkillResponse.fromJson(jsonResponse.body);
  }

  /// Determines the details for the room from which a skill request was
  /// invoked. This operation is used by skill developers.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [skillId] :
  /// The ARN of the skill that was requested. Required.
  ///
  /// Parameter [userId] :
  /// The ARN of the user. Required.
  Future<ResolveRoomResponse> resolveRoom({
    @_s.required String skillId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(skillId, 'skillId');
    _s.validateStringPattern(
      'skillId',
      skillId,
      r'''(^amzn1\.ask\.skill\.[0-9a-f\-]{1,200})|(^amzn1\.echo-sdk-ams\.app\.[0-9a-f\-]{1,200})''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringPattern(
      'userId',
      userId,
      r'''amzn1\.[A-Za-z0-9+-\/=.]{1,300}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ResolveRoom'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
        'UserId': userId,
      },
    );

    return ResolveRoomResponse.fromJson(jsonResponse.body);
  }

  /// Revokes an invitation and invalidates the enrollment URL.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [enrollmentId] :
  /// The ARN of the enrollment invitation to revoke. Required.
  ///
  /// Parameter [userArn] :
  /// The ARN of the user for whom to revoke an enrollment invitation. Required.
  Future<void> revokeInvitation({
    String enrollmentId,
    String userArn,
  }) async {
    _s.validateStringLength(
      'enrollmentId',
      enrollmentId,
      0,
      128,
    );
    _s.validateStringPattern(
      'userArn',
      userArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.RevokeInvitation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (enrollmentId != null) 'EnrollmentId': enrollmentId,
        if (userArn != null) 'UserArn': userArn,
      },
    );

    return RevokeInvitationResponse.fromJson(jsonResponse.body);
  }

  /// Searches address books and lists the ones that meet a set of filter and
  /// sort criteria.
  ///
  /// Parameter [filters] :
  /// The filters to use to list a specified set of address books. The supported
  /// filter key is AddressBookName.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response only includes results beyond the token, up to the value
  /// specified by MaxResults.
  ///
  /// Parameter [sortCriteria] :
  /// The sort order to use in listing the specified set of address books. The
  /// supported sort key is AddressBookName.
  Future<SearchAddressBooksResponse> searchAddressBooks({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    List<Sort> sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SearchAddressBooks'
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
        if (sortCriteria != null) 'SortCriteria': sortCriteria,
      },
    );

    return SearchAddressBooksResponse.fromJson(jsonResponse.body);
  }

  /// Searches contacts and lists the ones that meet a set of filter and sort
  /// criteria.
  ///
  /// Parameter [filters] :
  /// The filters to use to list a specified set of address books. The supported
  /// filter keys are DisplayName, FirstName, LastName, and AddressBookArns.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response only includes results beyond the token, up to the value
  /// specified by MaxResults.
  ///
  /// Parameter [sortCriteria] :
  /// The sort order to use in listing the specified set of contacts. The
  /// supported sort keys are DisplayName, FirstName, and LastName.
  Future<SearchContactsResponse> searchContacts({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    List<Sort> sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SearchContacts'
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
        if (sortCriteria != null) 'SortCriteria': sortCriteria,
      },
    );

    return SearchContactsResponse.fromJson(jsonResponse.body);
  }

  /// Searches devices and lists the ones that meet a set of filter criteria.
  ///
  /// Parameter [filters] :
  /// The filters to use to list a specified set of devices. Supported filter
  /// keys are DeviceName, DeviceStatus, DeviceStatusDetailCode, RoomName,
  /// DeviceType, DeviceSerialNumber, UnassociatedOnly, ConnectionStatus (ONLINE
  /// and OFFLINE), NetworkProfileName, NetworkProfileArn, Feature, and
  /// FailureCode.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  ///
  /// Parameter [sortCriteria] :
  /// The sort order to use in listing the specified set of devices. Supported
  /// sort keys are DeviceName, DeviceStatus, RoomName, DeviceType,
  /// DeviceSerialNumber, ConnectionStatus, NetworkProfileName,
  /// NetworkProfileArn, Feature, and FailureCode.
  Future<SearchDevicesResponse> searchDevices({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    List<Sort> sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SearchDevices'
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
        if (sortCriteria != null) 'SortCriteria': sortCriteria,
      },
    );

    return SearchDevicesResponse.fromJson(jsonResponse.body);
  }

  /// Searches network profiles and lists the ones that meet a set of filter and
  /// sort criteria.
  ///
  /// Parameter [filters] :
  /// The filters to use to list a specified set of network profiles. Valid
  /// filters are NetworkProfileName, Ssid, and SecurityType.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified MaxResults value, a token is included in the
  /// response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by MaxResults.
  ///
  /// Parameter [sortCriteria] :
  /// The sort order to use to list the specified set of network profiles. Valid
  /// sort criteria includes NetworkProfileName, Ssid, and SecurityType.
  Future<SearchNetworkProfilesResponse> searchNetworkProfiles({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    List<Sort> sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SearchNetworkProfiles'
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
        if (sortCriteria != null) 'SortCriteria': sortCriteria,
      },
    );

    return SearchNetworkProfilesResponse.fromJson(jsonResponse.body);
  }

  /// Searches room profiles and lists the ones that meet a set of filter
  /// criteria.
  ///
  /// Parameter [filters] :
  /// The filters to use to list a specified set of room profiles. Supported
  /// filter keys are ProfileName and Address. Required.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  ///
  /// Parameter [sortCriteria] :
  /// The sort order to use in listing the specified set of room profiles.
  /// Supported sort keys are ProfileName and Address.
  Future<SearchProfilesResponse> searchProfiles({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    List<Sort> sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SearchProfiles'
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
        if (sortCriteria != null) 'SortCriteria': sortCriteria,
      },
    );

    return SearchProfilesResponse.fromJson(jsonResponse.body);
  }

  /// Searches rooms and lists the ones that meet a set of filter and sort
  /// criteria.
  ///
  /// Parameter [filters] :
  /// The filters to use to list a specified set of rooms. The supported filter
  /// keys are RoomName and ProfileName.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>.
  ///
  /// Parameter [sortCriteria] :
  /// The sort order to use in listing the specified set of rooms. The supported
  /// sort keys are RoomName and ProfileName.
  Future<SearchRoomsResponse> searchRooms({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    List<Sort> sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SearchRooms'
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
        if (sortCriteria != null) 'SortCriteria': sortCriteria,
      },
    );

    return SearchRoomsResponse.fromJson(jsonResponse.body);
  }

  /// Searches skill groups and lists the ones that meet a set of filter and
  /// sort criteria.
  ///
  /// Parameter [filters] :
  /// The filters to use to list a specified set of skill groups. The supported
  /// filter key is SkillGroupName.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>. Required.
  ///
  /// Parameter [sortCriteria] :
  /// The sort order to use in listing the specified set of skill groups. The
  /// supported sort key is SkillGroupName.
  Future<SearchSkillGroupsResponse> searchSkillGroups({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    List<Sort> sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SearchSkillGroups'
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
        if (sortCriteria != null) 'SortCriteria': sortCriteria,
      },
    );

    return SearchSkillGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Searches users and lists the ones that meet a set of filter and sort
  /// criteria.
  ///
  /// Parameter [filters] :
  /// The filters to use for listing a specific set of users. Required.
  /// Supported filter keys are UserId, FirstName, LastName, Email, and
  /// EnrollmentStatus.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  /// Required.
  ///
  /// Parameter [nextToken] :
  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified,
  /// the response includes only results beyond the token, up to the value
  /// specified by <code>MaxResults</code>. Required.
  ///
  /// Parameter [sortCriteria] :
  /// The sort order to use in listing the filtered set of users. Required.
  /// Supported sort keys are UserId, FirstName, LastName, Email, and
  /// EnrollmentStatus.
  Future<SearchUsersResponse> searchUsers({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    List<Sort> sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SearchUsers'
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
        if (sortCriteria != null) 'SortCriteria': sortCriteria,
      },
    );

    return SearchUsersResponse.fromJson(jsonResponse.body);
  }

  /// Triggers an asynchronous flow to send text, SSML, or audio announcements
  /// to rooms that are identified by a search or filter.
  ///
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  ///
  /// Parameter [clientRequestToken] :
  /// The unique, user-specified identifier for the request that ensures
  /// idempotency.
  ///
  /// Parameter [content] :
  /// The announcement content. This can contain only one of the three possible
  /// announcement types (text, SSML or audio).
  ///
  /// Parameter [roomFilters] :
  /// The filters to use to send an announcement to a specified list of rooms.
  /// The supported filter keys are RoomName, ProfileName, RoomArn, and
  /// ProfileArn. To send to all rooms, specify an empty RoomFilters list.
  ///
  /// Parameter [timeToLiveInSeconds] :
  /// The time to live for an announcement. Default is 300. If delivery doesn't
  /// occur within this time, the announcement is not delivered.
  Future<SendAnnouncementResponse> sendAnnouncement({
    @_s.required String clientRequestToken,
    @_s.required Content content,
    @_s.required List<Filter> roomFilters,
    int timeToLiveInSeconds,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      10,
      150,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(roomFilters, 'roomFilters');
    _s.validateNumRange(
      'timeToLiveInSeconds',
      timeToLiveInSeconds,
      1,
      3600,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SendAnnouncement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        'Content': content,
        'RoomFilters': roomFilters,
        if (timeToLiveInSeconds != null)
          'TimeToLiveInSeconds': timeToLiveInSeconds,
      },
    );

    return SendAnnouncementResponse.fromJson(jsonResponse.body);
  }

  /// Sends an enrollment invitation email with a URL to a user. The URL is
  /// valid for 30 days or until you call this operation again, whichever comes
  /// first.
  ///
  /// May throw [NotFoundException].
  /// May throw [InvalidUserStatusException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [userArn] :
  /// The ARN of the user to whom to send an invitation. Required.
  Future<void> sendInvitation({
    String userArn,
  }) async {
    _s.validateStringPattern(
      'userArn',
      userArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SendInvitation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (userArn != null) 'UserArn': userArn,
      },
    );

    return SendInvitationResponse.fromJson(jsonResponse.body);
  }

  /// Resets a device and its account to the known default settings. This clears
  /// all information and settings set by previous users in the following ways:
  ///
  /// <ul>
  /// <li>
  /// Bluetooth - This unpairs all bluetooth devices paired with your echo
  /// device.
  /// </li>
  /// <li>
  /// Volume - This resets the echo device's volume to the default value.
  /// </li>
  /// <li>
  /// Notifications - This clears all notifications from your echo device.
  /// </li>
  /// <li>
  /// Lists - This clears all to-do items from your echo device.
  /// </li>
  /// <li>
  /// Settings - This internally syncs the room's profile (if the device is
  /// assigned to a room), contacts, address books, delegation access for
  /// account linking, and communications (if enabled on the room profile).
  /// </li>
  /// </ul>
  ///
  /// May throw [DeviceNotRegisteredException].
  ///
  /// Parameter [features] :
  /// Request structure to start the device sync. Required.
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device to sync. Required.
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room with which the device to sync is associated. Required.
  Future<void> startDeviceSync({
    @_s.required List<Feature> features,
    String deviceArn,
    String roomArn,
  }) async {
    ArgumentError.checkNotNull(features, 'features');
    _s.validateStringPattern(
      'deviceArn',
      deviceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.StartDeviceSync'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Features': features?.map((e) => e?.toValue() ?? '')?.toList(),
        if (deviceArn != null) 'DeviceArn': deviceArn,
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );

    return StartDeviceSyncResponse.fromJson(jsonResponse.body);
  }

  /// Initiates the discovery of any smart home appliances associated with the
  /// room.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [roomArn] :
  /// The room where smart home appliance discovery was initiated.
  Future<void> startSmartHomeApplianceDiscovery({
    @_s.required String roomArn,
  }) async {
    ArgumentError.checkNotNull(roomArn, 'roomArn');
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.StartSmartHomeApplianceDiscovery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoomArn': roomArn,
      },
    );

    return StartSmartHomeApplianceDiscoveryResponse.fromJson(jsonResponse.body);
  }

  /// Adds metadata tags to a specified resource.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [arn] :
  /// The ARN of the resource to which to add metadata tags. Required.
  ///
  /// Parameter [tags] :
  /// The tags to be added to the specified resource. Do not provide system
  /// tags. Required.
  Future<void> tagResource({
    @_s.required String arn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Arn': arn,
        'Tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes metadata tags from a specified resource.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [arn] :
  /// The ARN of the resource from which to remove metadata tags. Required.
  ///
  /// Parameter [tagKeys] :
  /// The tags to be removed from the specified resource. Do not provide system
  /// tags. Required.
  Future<void> untagResource({
    @_s.required String arn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Arn': arn,
        'TagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Updates address book details by the address book ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [NameInUseException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [addressBookArn] :
  /// The ARN of the room to update.
  ///
  /// Parameter [description] :
  /// The updated description of the room.
  ///
  /// Parameter [name] :
  /// The updated name of the room.
  Future<void> updateAddressBook({
    @_s.required String addressBookArn,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(addressBookArn, 'addressBookArn');
    _s.validateStringPattern(
      'addressBookArn',
      addressBookArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      200,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateAddressBook'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressBookArn': addressBookArn,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
      },
    );

    return UpdateAddressBookResponse.fromJson(jsonResponse.body);
  }

  /// Updates the configuration of the report delivery schedule with the
  /// specified schedule ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [scheduleArn] :
  /// The ARN of the business report schedule.
  ///
  /// Parameter [format] :
  /// The format of the generated report (individual CSV files or zipped files
  /// of individual files).
  ///
  /// Parameter [recurrence] :
  /// The recurrence of the reports.
  ///
  /// Parameter [s3BucketName] :
  /// The S3 location of the output reports.
  ///
  /// Parameter [s3KeyPrefix] :
  /// The S3 key where the report is delivered.
  ///
  /// Parameter [scheduleName] :
  /// The name identifier of the schedule.
  Future<void> updateBusinessReportSchedule({
    @_s.required String scheduleArn,
    BusinessReportFormat format,
    BusinessReportRecurrence recurrence,
    String s3BucketName,
    String s3KeyPrefix,
    String scheduleName,
  }) async {
    ArgumentError.checkNotNull(scheduleArn, 'scheduleArn');
    _s.validateStringPattern(
      'scheduleArn',
      scheduleArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateStringPattern(
      's3BucketName',
      s3BucketName,
      r'''[a-z0-9-\.]{3,63}''',
    );
    _s.validateStringLength(
      's3KeyPrefix',
      s3KeyPrefix,
      0,
      100,
    );
    _s.validateStringPattern(
      's3KeyPrefix',
      s3KeyPrefix,
      r'''[A-Za-z0-9!_\-\.\*'()/]*''',
    );
    _s.validateStringLength(
      'scheduleName',
      scheduleName,
      0,
      64,
    );
    _s.validateStringPattern(
      'scheduleName',
      scheduleName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateBusinessReportSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScheduleArn': scheduleArn,
        if (format != null) 'Format': format.toValue(),
        if (recurrence != null) 'Recurrence': recurrence,
        if (s3BucketName != null) 'S3BucketName': s3BucketName,
        if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
        if (scheduleName != null) 'ScheduleName': scheduleName,
      },
    );

    return UpdateBusinessReportScheduleResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing conference provider's settings.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [conferenceProviderArn] :
  /// The ARN of the conference provider.
  ///
  /// Parameter [conferenceProviderType] :
  /// The type of the conference provider.
  ///
  /// Parameter [meetingSetting] :
  /// The meeting settings for the conference provider.
  ///
  /// Parameter [iPDialIn] :
  /// The IP endpoint and protocol for calling.
  ///
  /// Parameter [pSTNDialIn] :
  /// The information for PSTN conferencing.
  Future<void> updateConferenceProvider({
    @_s.required String conferenceProviderArn,
    @_s.required ConferenceProviderType conferenceProviderType,
    @_s.required MeetingSetting meetingSetting,
    IPDialIn iPDialIn,
    PSTNDialIn pSTNDialIn,
  }) async {
    ArgumentError.checkNotNull(conferenceProviderArn, 'conferenceProviderArn');
    _s.validateStringPattern(
      'conferenceProviderArn',
      conferenceProviderArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        conferenceProviderType, 'conferenceProviderType');
    ArgumentError.checkNotNull(meetingSetting, 'meetingSetting');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateConferenceProvider'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConferenceProviderArn': conferenceProviderArn,
        'ConferenceProviderType': conferenceProviderType?.toValue() ?? '',
        'MeetingSetting': meetingSetting,
        if (iPDialIn != null) 'IPDialIn': iPDialIn,
        if (pSTNDialIn != null) 'PSTNDialIn': pSTNDialIn,
      },
    );

    return UpdateConferenceProviderResponse.fromJson(jsonResponse.body);
  }

  /// Updates the contact details by the contact ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [contactArn] :
  /// The ARN of the contact to update.
  ///
  /// Parameter [displayName] :
  /// The updated display name of the contact.
  ///
  /// Parameter [firstName] :
  /// The updated first name of the contact.
  ///
  /// Parameter [lastName] :
  /// The updated last name of the contact.
  ///
  /// Parameter [phoneNumber] :
  /// The updated phone number of the contact. The phone number type defaults to
  /// WORK. You can either specify PhoneNumber or PhoneNumbers. We recommend
  /// that you use PhoneNumbers, which lets you specify the phone number type
  /// and multiple numbers.
  ///
  /// Parameter [phoneNumbers] :
  /// The list of phone numbers for the contact.
  ///
  /// Parameter [sipAddresses] :
  /// The list of SIP addresses for the contact.
  Future<void> updateContact({
    @_s.required String contactArn,
    String displayName,
    String firstName,
    String lastName,
    String phoneNumber,
    List<PhoneNumber> phoneNumbers,
    List<SipAddress> sipAddresses,
  }) async {
    ArgumentError.checkNotNull(contactArn, 'contactArn');
    _s.validateStringPattern(
      'contactArn',
      contactArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'displayName',
      displayName,
      1,
      100,
    );
    _s.validateStringPattern(
      'displayName',
      displayName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'firstName',
      firstName,
      1,
      100,
    );
    _s.validateStringPattern(
      'firstName',
      firstName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'lastName',
      lastName,
      1,
      100,
    );
    _s.validateStringPattern(
      'lastName',
      lastName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'phoneNumber',
      phoneNumber,
      0,
      50,
    );
    _s.validateStringPattern(
      'phoneNumber',
      phoneNumber,
      r'''^[\+0-9\#\,\(][\+0-9\-\.\/\(\)\,\#\s]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateContact'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactArn': contactArn,
        if (displayName != null) 'DisplayName': displayName,
        if (firstName != null) 'FirstName': firstName,
        if (lastName != null) 'LastName': lastName,
        if (phoneNumber != null) 'PhoneNumber': phoneNumber,
        if (phoneNumbers != null) 'PhoneNumbers': phoneNumbers,
        if (sipAddresses != null) 'SipAddresses': sipAddresses,
      },
    );

    return UpdateContactResponse.fromJson(jsonResponse.body);
  }

  /// Updates the device name by device ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  /// May throw [DeviceNotRegisteredException].
  ///
  /// Parameter [deviceArn] :
  /// The ARN of the device to update. Required.
  ///
  /// Parameter [deviceName] :
  /// The updated device name. Required.
  Future<void> updateDevice({
    String deviceArn,
    String deviceName,
  }) async {
    _s.validateStringPattern(
      'deviceArn',
      deviceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringLength(
      'deviceName',
      deviceName,
      2,
      100,
    );
    _s.validateStringPattern(
      'deviceName',
      deviceName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateDevice'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deviceArn != null) 'DeviceArn': deviceArn,
        if (deviceName != null) 'DeviceName': deviceName,
      },
    );

    return UpdateDeviceResponse.fromJson(jsonResponse.body);
  }

  /// Updates the details of a gateway. If any optional field is not provided,
  /// the existing corresponding value is left unmodified.
  ///
  /// May throw [NotFoundException].
  /// May throw [NameInUseException].
  ///
  /// Parameter [gatewayArn] :
  /// The ARN of the gateway to update.
  ///
  /// Parameter [description] :
  /// The updated description of the gateway.
  ///
  /// Parameter [name] :
  /// The updated name of the gateway.
  ///
  /// Parameter [softwareVersion] :
  /// The updated software version of the gateway. The gateway automatically
  /// updates its software version during normal operation.
  Future<void> updateGateway({
    @_s.required String gatewayArn,
    String description,
    String name,
    String softwareVersion,
  }) async {
    ArgumentError.checkNotNull(gatewayArn, 'gatewayArn');
    _s.validateStringPattern(
      'gatewayArn',
      gatewayArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      253,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'softwareVersion',
      softwareVersion,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayArn': gatewayArn,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
        if (softwareVersion != null) 'SoftwareVersion': softwareVersion,
      },
    );

    return UpdateGatewayResponse.fromJson(jsonResponse.body);
  }

  /// Updates the details of a gateway group. If any optional field is not
  /// provided, the existing corresponding value is left unmodified.
  ///
  /// May throw [NotFoundException].
  /// May throw [NameInUseException].
  ///
  /// Parameter [gatewayGroupArn] :
  /// The ARN of the gateway group to update.
  ///
  /// Parameter [description] :
  /// The updated description of the gateway group.
  ///
  /// Parameter [name] :
  /// The updated name of the gateway group.
  Future<void> updateGatewayGroup({
    @_s.required String gatewayGroupArn,
    String description,
    String name,
  }) async {
    ArgumentError.checkNotNull(gatewayGroupArn, 'gatewayGroupArn');
    _s.validateStringPattern(
      'gatewayGroupArn',
      gatewayGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateGatewayGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayGroupArn': gatewayGroupArn,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
      },
    );

    return UpdateGatewayGroupResponse.fromJson(jsonResponse.body);
  }

  /// Updates a network profile by the network profile ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [NameInUseException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InvalidCertificateAuthorityException].
  /// May throw [InvalidSecretsManagerResourceException].
  ///
  /// Parameter [networkProfileArn] :
  /// The ARN of the network profile associated with a device.
  ///
  /// Parameter [certificateAuthorityArn] :
  /// The ARN of the Private Certificate Authority (PCA) created in AWS
  /// Certificate Manager (ACM). This is used to issue certificates to the
  /// devices.
  ///
  /// Parameter [currentPassword] :
  /// The current password of the Wi-Fi network.
  ///
  /// Parameter [description] :
  /// Detailed information about a device's network profile.
  ///
  /// Parameter [networkProfileName] :
  /// The name of the network profile associated with a device.
  ///
  /// Parameter [nextPassword] :
  /// The next, or subsequent, password of the Wi-Fi network. This password is
  /// asynchronously transmitted to the device and is used when the password of
  /// the network changes to NextPassword.
  ///
  /// Parameter [trustAnchors] :
  /// The root certificate(s) of your authentication server that will be
  /// installed on your devices and used to trust your authentication server
  /// during EAP negotiation.
  Future<void> updateNetworkProfile({
    @_s.required String networkProfileArn,
    String certificateAuthorityArn,
    String currentPassword,
    String description,
    String networkProfileName,
    String nextPassword,
    List<String> trustAnchors,
  }) async {
    ArgumentError.checkNotNull(networkProfileArn, 'networkProfileArn');
    _s.validateStringPattern(
      'networkProfileArn',
      networkProfileArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateAuthorityArn',
      certificateAuthorityArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringLength(
      'currentPassword',
      currentPassword,
      5,
      128,
    );
    _s.validateStringPattern(
      'currentPassword',
      currentPassword,
      r'''[\x00-\x7F]*''',
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      200,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'networkProfileName',
      networkProfileName,
      1,
      100,
    );
    _s.validateStringPattern(
      'networkProfileName',
      networkProfileName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'nextPassword',
      nextPassword,
      0,
      128,
    );
    _s.validateStringPattern(
      'nextPassword',
      nextPassword,
      r'''(^$)|([\x00-\x7F]{5,})''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateNetworkProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NetworkProfileArn': networkProfileArn,
        if (certificateAuthorityArn != null)
          'CertificateAuthorityArn': certificateAuthorityArn,
        if (currentPassword != null) 'CurrentPassword': currentPassword,
        if (description != null) 'Description': description,
        if (networkProfileName != null)
          'NetworkProfileName': networkProfileName,
        if (nextPassword != null) 'NextPassword': nextPassword,
        if (trustAnchors != null) 'TrustAnchors': trustAnchors,
      },
    );

    return UpdateNetworkProfileResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing room profile by room profile ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [NameInUseException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [address] :
  /// The updated address for the room profile.
  ///
  /// Parameter [distanceUnit] :
  /// The updated distance unit for the room profile.
  ///
  /// Parameter [isDefault] :
  /// Sets the profile as default if selected. If this is missing, no update is
  /// done to the default status.
  ///
  /// Parameter [locale] :
  /// The updated locale for the room profile. (This is currently only available
  /// to a limited preview audience.)
  ///
  /// Parameter [maxVolumeLimit] :
  /// The updated maximum volume limit for the room profile.
  ///
  /// Parameter [meetingRoomConfiguration] :
  /// The updated meeting room settings of a room profile.
  ///
  /// Parameter [pSTNEnabled] :
  /// Whether the PSTN setting of the room profile is enabled.
  ///
  /// Parameter [profileArn] :
  /// The ARN of the room profile to update. Required.
  ///
  /// Parameter [profileName] :
  /// The updated name for the room profile.
  ///
  /// Parameter [setupModeDisabled] :
  /// Whether the setup mode of the profile is enabled.
  ///
  /// Parameter [temperatureUnit] :
  /// The updated temperature unit for the room profile.
  ///
  /// Parameter [timezone] :
  /// The updated timezone for the room profile.
  ///
  /// Parameter [wakeWord] :
  /// The updated wake word for the room profile.
  Future<void> updateProfile({
    String address,
    DistanceUnit distanceUnit,
    bool isDefault,
    String locale,
    int maxVolumeLimit,
    UpdateMeetingRoomConfiguration meetingRoomConfiguration,
    bool pSTNEnabled,
    String profileArn,
    String profileName,
    bool setupModeDisabled,
    TemperatureUnit temperatureUnit,
    String timezone,
    WakeWord wakeWord,
  }) async {
    _s.validateStringLength(
      'address',
      address,
      1,
      500,
    );
    _s.validateStringLength(
      'locale',
      locale,
      1,
      256,
    );
    _s.validateStringPattern(
      'profileArn',
      profileArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringLength(
      'profileName',
      profileName,
      1,
      100,
    );
    _s.validateStringPattern(
      'profileName',
      profileName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringLength(
      'timezone',
      timezone,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (address != null) 'Address': address,
        if (distanceUnit != null) 'DistanceUnit': distanceUnit.toValue(),
        if (isDefault != null) 'IsDefault': isDefault,
        if (locale != null) 'Locale': locale,
        if (maxVolumeLimit != null) 'MaxVolumeLimit': maxVolumeLimit,
        if (meetingRoomConfiguration != null)
          'MeetingRoomConfiguration': meetingRoomConfiguration,
        if (pSTNEnabled != null) 'PSTNEnabled': pSTNEnabled,
        if (profileArn != null) 'ProfileArn': profileArn,
        if (profileName != null) 'ProfileName': profileName,
        if (setupModeDisabled != null) 'SetupModeDisabled': setupModeDisabled,
        if (temperatureUnit != null)
          'TemperatureUnit': temperatureUnit.toValue(),
        if (timezone != null) 'Timezone': timezone,
        if (wakeWord != null) 'WakeWord': wakeWord.toValue(),
      },
    );

    return UpdateProfileResponse.fromJson(jsonResponse.body);
  }

  /// Updates room details by room ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [NameInUseException].
  ///
  /// Parameter [description] :
  /// The updated description for the room.
  ///
  /// Parameter [profileArn] :
  /// The updated profile ARN for the room.
  ///
  /// Parameter [providerCalendarId] :
  /// The updated provider calendar ARN for the room.
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room to update.
  ///
  /// Parameter [roomName] :
  /// The updated name for the room.
  Future<void> updateRoom({
    String description,
    String profileArn,
    String providerCalendarId,
    String roomArn,
    String roomName,
  }) async {
    _s.validateStringLength(
      'description',
      description,
      1,
      200,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringPattern(
      'profileArn',
      profileArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringLength(
      'providerCalendarId',
      providerCalendarId,
      0,
      100,
    );
    _s.validateStringPattern(
      'roomArn',
      roomArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringLength(
      'roomName',
      roomName,
      1,
      100,
    );
    _s.validateStringPattern(
      'roomName',
      roomName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateRoom'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (description != null) 'Description': description,
        if (profileArn != null) 'ProfileArn': profileArn,
        if (providerCalendarId != null)
          'ProviderCalendarId': providerCalendarId,
        if (roomArn != null) 'RoomArn': roomArn,
        if (roomName != null) 'RoomName': roomName,
      },
    );

    return UpdateRoomResponse.fromJson(jsonResponse.body);
  }

  /// Updates skill group details by skill group ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [NameInUseException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [description] :
  /// The updated description for the skill group.
  ///
  /// Parameter [skillGroupArn] :
  /// The ARN of the skill group to update.
  ///
  /// Parameter [skillGroupName] :
  /// The updated name for the skill group.
  Future<void> updateSkillGroup({
    String description,
    String skillGroupArn,
    String skillGroupName,
  }) async {
    _s.validateStringLength(
      'description',
      description,
      1,
      200,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    _s.validateStringPattern(
      'skillGroupArn',
      skillGroupArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    _s.validateStringLength(
      'skillGroupName',
      skillGroupName,
      1,
      100,
    );
    _s.validateStringPattern(
      'skillGroupName',
      skillGroupName,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateSkillGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (description != null) 'Description': description,
        if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
        if (skillGroupName != null) 'SkillGroupName': skillGroupName,
      },
    );

    return UpdateSkillGroupResponse.fromJson(jsonResponse.body);
  }
}

/// An address book with attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddressBook {
  /// The ARN of the address book.
  @_s.JsonKey(name: 'AddressBookArn')
  final String addressBookArn;

  /// The description of the address book.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the address book.
  @_s.JsonKey(name: 'Name')
  final String name;

  AddressBook({
    this.addressBookArn,
    this.description,
    this.name,
  });
  factory AddressBook.fromJson(Map<String, dynamic> json) =>
      _$AddressBookFromJson(json);
}

/// Information related to an address book.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddressBookData {
  /// The ARN of the address book.
  @_s.JsonKey(name: 'AddressBookArn')
  final String addressBookArn;

  /// The description of the address book.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the address book.
  @_s.JsonKey(name: 'Name')
  final String name;

  AddressBookData({
    this.addressBookArn,
    this.description,
    this.name,
  });
  factory AddressBookData.fromJson(Map<String, dynamic> json) =>
      _$AddressBookDataFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApproveSkillResponse {
  ApproveSkillResponse();
  factory ApproveSkillResponse.fromJson(Map<String, dynamic> json) =>
      _$ApproveSkillResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateContactWithAddressBookResponse {
  AssociateContactWithAddressBookResponse();
  factory AssociateContactWithAddressBookResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateContactWithAddressBookResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateDeviceWithNetworkProfileResponse {
  AssociateDeviceWithNetworkProfileResponse();
  factory AssociateDeviceWithNetworkProfileResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateDeviceWithNetworkProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateDeviceWithRoomResponse {
  AssociateDeviceWithRoomResponse();
  factory AssociateDeviceWithRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateDeviceWithRoomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateSkillGroupWithRoomResponse {
  AssociateSkillGroupWithRoomResponse();
  factory AssociateSkillGroupWithRoomResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateSkillGroupWithRoomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateSkillWithSkillGroupResponse {
  AssociateSkillWithSkillGroupResponse();
  factory AssociateSkillWithSkillGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateSkillWithSkillGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateSkillWithUsersResponse {
  AssociateSkillWithUsersResponse();
  factory AssociateSkillWithUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateSkillWithUsersResponseFromJson(json);
}

/// The audio message. There is a 1 MB limit on the audio file input and the
/// only supported format is MP3. To convert your MP3 audio files to an
/// Alexa-friendly,
///
/// required codec version (MPEG version 2) and bit rate (48 kbps), you might
/// use converter software. One option for this is a command-line tool, FFmpeg.
/// For more information, see <a href="https://www.ffmpeg.org/">FFmpeg</a>. The
/// following command converts the provided &lt;input-file&gt; to an MP3 file
/// that is played in the announcement:
///
/// <code>ffmpeg -i &lt;input-file&gt; -ac 2 -codec:a libmp3lame -b:a 48k -ar
/// 16000 &lt;output-file.mp3&gt;</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Audio {
  /// The locale of the audio message. Currently, en-US is supported.
  @_s.JsonKey(name: 'Locale')
  final Locale locale;

  /// The location of the audio file. Currently, S3 URLs are supported. Only S3
  /// locations comprised of safe characters are valid. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#Safe%20Characters">Safe
  /// Characters</a>.
  @_s.JsonKey(name: 'Location')
  final String location;

  Audio({
    @_s.required this.locale,
    @_s.required this.location,
  });
  Map<String, dynamic> toJson() => _$AudioToJson(this);
}

/// Usage report with specified parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BusinessReport {
  /// The time of report delivery.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeliveryTime')
  final DateTime deliveryTime;

  /// The download link where a user can download the report.
  @_s.JsonKey(name: 'DownloadUrl')
  final String downloadUrl;

  /// The failure code.
  @_s.JsonKey(name: 'FailureCode')
  final BusinessReportFailureCode failureCode;

  /// The S3 location of the output reports.
  @_s.JsonKey(name: 'S3Location')
  final BusinessReportS3Location s3Location;

  /// The status of the report generation execution (RUNNING, SUCCEEDED, or
  /// FAILED).
  @_s.JsonKey(name: 'Status')
  final BusinessReportStatus status;

  BusinessReport({
    this.deliveryTime,
    this.downloadUrl,
    this.failureCode,
    this.s3Location,
    this.status,
  });
  factory BusinessReport.fromJson(Map<String, dynamic> json) =>
      _$BusinessReportFromJson(json);
}

/// The content range of the report.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BusinessReportContentRange {
  /// The interval of the content range.
  @_s.JsonKey(name: 'Interval')
  final BusinessReportInterval interval;

  BusinessReportContentRange({
    @_s.required this.interval,
  });
  factory BusinessReportContentRange.fromJson(Map<String, dynamic> json) =>
      _$BusinessReportContentRangeFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessReportContentRangeToJson(this);
}

enum BusinessReportFailureCode {
  @_s.JsonValue('ACCESS_DENIED')
  accessDenied,
  @_s.JsonValue('NO_SUCH_BUCKET')
  noSuchBucket,
  @_s.JsonValue('INTERNAL_FAILURE')
  internalFailure,
}

enum BusinessReportFormat {
  @_s.JsonValue('CSV')
  csv,
  @_s.JsonValue('CSV_ZIP')
  csvZip,
}

extension on BusinessReportFormat {
  String toValue() {
    switch (this) {
      case BusinessReportFormat.csv:
        return 'CSV';
      case BusinessReportFormat.csvZip:
        return 'CSV_ZIP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum BusinessReportInterval {
  @_s.JsonValue('ONE_DAY')
  oneDay,
  @_s.JsonValue('ONE_WEEK')
  oneWeek,
  @_s.JsonValue('THIRTY_DAYS')
  thirtyDays,
}

/// The recurrence of the reports.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BusinessReportRecurrence {
  /// The start date.
  @_s.JsonKey(name: 'StartDate')
  final String startDate;

  BusinessReportRecurrence({
    this.startDate,
  });
  factory BusinessReportRecurrence.fromJson(Map<String, dynamic> json) =>
      _$BusinessReportRecurrenceFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessReportRecurrenceToJson(this);
}

/// The S3 location of the output reports.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BusinessReportS3Location {
  /// The S3 bucket name of the output reports.
  @_s.JsonKey(name: 'BucketName')
  final String bucketName;

  /// The path of the business report.
  @_s.JsonKey(name: 'Path')
  final String path;

  BusinessReportS3Location({
    this.bucketName,
    this.path,
  });
  factory BusinessReportS3Location.fromJson(Map<String, dynamic> json) =>
      _$BusinessReportS3LocationFromJson(json);
}

/// The schedule of the usage report.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BusinessReportSchedule {
  /// The content range of the reports.
  @_s.JsonKey(name: 'ContentRange')
  final BusinessReportContentRange contentRange;

  /// The format of the generated report (individual CSV files or zipped files of
  /// individual files).
  @_s.JsonKey(name: 'Format')
  final BusinessReportFormat format;

  /// The details of the last business report delivery for a specified time
  /// interval.
  @_s.JsonKey(name: 'LastBusinessReport')
  final BusinessReport lastBusinessReport;

  /// The recurrence of the reports.
  @_s.JsonKey(name: 'Recurrence')
  final BusinessReportRecurrence recurrence;

  /// The S3 bucket name of the output reports.
  @_s.JsonKey(name: 'S3BucketName')
  final String s3BucketName;

  /// The S3 key where the report is delivered.
  @_s.JsonKey(name: 'S3KeyPrefix')
  final String s3KeyPrefix;

  /// The ARN of the business report schedule.
  @_s.JsonKey(name: 'ScheduleArn')
  final String scheduleArn;

  /// The name identifier of the schedule.
  @_s.JsonKey(name: 'ScheduleName')
  final String scheduleName;

  BusinessReportSchedule({
    this.contentRange,
    this.format,
    this.lastBusinessReport,
    this.recurrence,
    this.s3BucketName,
    this.s3KeyPrefix,
    this.scheduleArn,
    this.scheduleName,
  });
  factory BusinessReportSchedule.fromJson(Map<String, dynamic> json) =>
      _$BusinessReportScheduleFromJson(json);
}

enum BusinessReportStatus {
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

/// The skill store category that is shown. Alexa skills are assigned a specific
/// skill category during creation, such as News, Social, and Sports.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Category {
  /// The ID of the skill store category.
  @_s.JsonKey(name: 'CategoryId')
  final int categoryId;

  /// The name of the skill store category.
  @_s.JsonKey(name: 'CategoryName')
  final String categoryName;

  Category({
    this.categoryId,
    this.categoryName,
  });
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

enum CommsProtocol {
  @_s.JsonValue('SIP')
  sip,
  @_s.JsonValue('SIPS')
  sips,
  @_s.JsonValue('H323')
  h323,
}

/// The default conference provider that is used if no other scheduled meetings
/// are detected.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConferencePreference {
  /// The ARN of the default conference provider.
  @_s.JsonKey(name: 'DefaultConferenceProviderArn')
  final String defaultConferenceProviderArn;

  ConferencePreference({
    this.defaultConferenceProviderArn,
  });
  factory ConferencePreference.fromJson(Map<String, dynamic> json) =>
      _$ConferencePreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$ConferencePreferenceToJson(this);
}

/// An entity that provides a conferencing solution. Alexa for Business acts as
/// the voice interface and mediator that connects users to their preferred
/// conference provider. Examples of conference providers include Amazon Chime,
/// Zoom, Cisco, and Polycom.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConferenceProvider {
  /// The ARN of the newly created conference provider.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The IP endpoint and protocol for calling.
  @_s.JsonKey(name: 'IPDialIn')
  final IPDialIn iPDialIn;

  /// The meeting settings for the conference provider.
  @_s.JsonKey(name: 'MeetingSetting')
  final MeetingSetting meetingSetting;

  /// The name of the conference provider.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The information for PSTN conferencing.
  @_s.JsonKey(name: 'PSTNDialIn')
  final PSTNDialIn pSTNDialIn;

  /// The type of conference providers.
  @_s.JsonKey(name: 'Type')
  final ConferenceProviderType type;

  ConferenceProvider({
    this.arn,
    this.iPDialIn,
    this.meetingSetting,
    this.name,
    this.pSTNDialIn,
    this.type,
  });
  factory ConferenceProvider.fromJson(Map<String, dynamic> json) =>
      _$ConferenceProviderFromJson(json);
}

enum ConferenceProviderType {
  @_s.JsonValue('CHIME')
  chime,
  @_s.JsonValue('BLUEJEANS')
  bluejeans,
  @_s.JsonValue('FUZE')
  fuze,
  @_s.JsonValue('GOOGLE_HANGOUTS')
  googleHangouts,
  @_s.JsonValue('POLYCOM')
  polycom,
  @_s.JsonValue('RINGCENTRAL')
  ringcentral,
  @_s.JsonValue('SKYPE_FOR_BUSINESS')
  skypeForBusiness,
  @_s.JsonValue('WEBEX')
  webex,
  @_s.JsonValue('ZOOM')
  zoom,
  @_s.JsonValue('CUSTOM')
  custom,
}

extension on ConferenceProviderType {
  String toValue() {
    switch (this) {
      case ConferenceProviderType.chime:
        return 'CHIME';
      case ConferenceProviderType.bluejeans:
        return 'BLUEJEANS';
      case ConferenceProviderType.fuze:
        return 'FUZE';
      case ConferenceProviderType.googleHangouts:
        return 'GOOGLE_HANGOUTS';
      case ConferenceProviderType.polycom:
        return 'POLYCOM';
      case ConferenceProviderType.ringcentral:
        return 'RINGCENTRAL';
      case ConferenceProviderType.skypeForBusiness:
        return 'SKYPE_FOR_BUSINESS';
      case ConferenceProviderType.webex:
        return 'WEBEX';
      case ConferenceProviderType.zoom:
        return 'ZOOM';
      case ConferenceProviderType.custom:
        return 'CUSTOM';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ConnectionStatus {
  @_s.JsonValue('ONLINE')
  online,
  @_s.JsonValue('OFFLINE')
  offline,
}

/// A contact with attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Contact {
  /// The ARN of the contact.
  @_s.JsonKey(name: 'ContactArn')
  final String contactArn;

  /// The name of the contact to display on the console.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The first name of the contact, used to call the contact on the device.
  @_s.JsonKey(name: 'FirstName')
  final String firstName;

  /// The last name of the contact, used to call the contact on the device.
  @_s.JsonKey(name: 'LastName')
  final String lastName;

  /// The phone number of the contact. The phone number type defaults to WORK. You
  /// can either specify PhoneNumber or PhoneNumbers. We recommend that you use
  /// PhoneNumbers, which lets you specify the phone number type and multiple
  /// numbers.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  /// The list of phone numbers for the contact.
  @_s.JsonKey(name: 'PhoneNumbers')
  final List<PhoneNumber> phoneNumbers;

  /// The list of SIP addresses for the contact.
  @_s.JsonKey(name: 'SipAddresses')
  final List<SipAddress> sipAddresses;

  Contact({
    this.contactArn,
    this.displayName,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.phoneNumbers,
    this.sipAddresses,
  });
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

/// Information related to a contact.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContactData {
  /// The ARN of the contact.
  @_s.JsonKey(name: 'ContactArn')
  final String contactArn;

  /// The name of the contact to display on the console.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The first name of the contact, used to call the contact on the device.
  @_s.JsonKey(name: 'FirstName')
  final String firstName;

  /// The last name of the contact, used to call the contact on the device.
  @_s.JsonKey(name: 'LastName')
  final String lastName;

  /// The phone number of the contact. The phone number type defaults to WORK. You
  /// can specify PhoneNumber or PhoneNumbers. We recommend that you use
  /// PhoneNumbers, which lets you specify the phone number type and multiple
  /// numbers.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  /// The list of phone numbers for the contact.
  @_s.JsonKey(name: 'PhoneNumbers')
  final List<PhoneNumber> phoneNumbers;

  /// The list of SIP addresses for the contact.
  @_s.JsonKey(name: 'SipAddresses')
  final List<SipAddress> sipAddresses;

  ContactData({
    this.contactArn,
    this.displayName,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.phoneNumbers,
    this.sipAddresses,
  });
  factory ContactData.fromJson(Map<String, dynamic> json) =>
      _$ContactDataFromJson(json);
}

/// The content definition. This can contain only one text, SSML, or audio list
/// object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Content {
  /// The list of audio messages.
  @_s.JsonKey(name: 'AudioList')
  final List<Audio> audioList;

  /// The list of SSML messages.
  @_s.JsonKey(name: 'SsmlList')
  final List<Ssml> ssmlList;

  /// The list of text messages.
  @_s.JsonKey(name: 'TextList')
  final List<Text> textList;

  Content({
    this.audioList,
    this.ssmlList,
    this.textList,
  });
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAddressBookResponse {
  /// The ARN of the newly created address book.
  @_s.JsonKey(name: 'AddressBookArn')
  final String addressBookArn;

  CreateAddressBookResponse({
    this.addressBookArn,
  });
  factory CreateAddressBookResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressBookResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBusinessReportScheduleResponse {
  /// The ARN of the business report schedule.
  @_s.JsonKey(name: 'ScheduleArn')
  final String scheduleArn;

  CreateBusinessReportScheduleResponse({
    this.scheduleArn,
  });
  factory CreateBusinessReportScheduleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateBusinessReportScheduleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConferenceProviderResponse {
  /// The ARN of the newly-created conference provider.
  @_s.JsonKey(name: 'ConferenceProviderArn')
  final String conferenceProviderArn;

  CreateConferenceProviderResponse({
    this.conferenceProviderArn,
  });
  factory CreateConferenceProviderResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateConferenceProviderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateContactResponse {
  /// The ARN of the newly created address book.
  @_s.JsonKey(name: 'ContactArn')
  final String contactArn;

  CreateContactResponse({
    this.contactArn,
  });
  factory CreateContactResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateContactResponseFromJson(json);
}

/// Creates settings for the end of meeting reminder feature that are applied to
/// a room profile. The end of meeting reminder enables Alexa to remind users
/// when a meeting is ending.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateEndOfMeetingReminder {
  /// Whether an end of meeting reminder is enabled or not.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// A range of 3 to 15 minutes that determines when the reminder begins.
  @_s.JsonKey(name: 'ReminderAtMinutes')
  final List<int> reminderAtMinutes;

  /// The type of sound that users hear during the end of meeting reminder.
  @_s.JsonKey(name: 'ReminderType')
  final EndOfMeetingReminderType reminderType;

  CreateEndOfMeetingReminder({
    @_s.required this.enabled,
    @_s.required this.reminderAtMinutes,
    @_s.required this.reminderType,
  });
  Map<String, dynamic> toJson() => _$CreateEndOfMeetingReminderToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGatewayGroupResponse {
  /// The ARN of the created gateway group.
  @_s.JsonKey(name: 'GatewayGroupArn')
  final String gatewayGroupArn;

  CreateGatewayGroupResponse({
    this.gatewayGroupArn,
  });
  factory CreateGatewayGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGatewayGroupResponseFromJson(json);
}

/// Creates settings for the instant booking feature that are applied to a room
/// profile. When users start their meeting with Alexa, Alexa automatically
/// books the room for the configured duration if the room is available.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateInstantBooking {
  /// Duration between 15 and 240 minutes at increments of 15 that determines how
  /// long to book an available room when a meeting is started with Alexa.
  @_s.JsonKey(name: 'DurationInMinutes')
  final int durationInMinutes;

  /// Whether instant booking is enabled or not.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  CreateInstantBooking({
    @_s.required this.durationInMinutes,
    @_s.required this.enabled,
  });
  Map<String, dynamic> toJson() => _$CreateInstantBookingToJson(this);
}

/// Creates meeting room settings of a room profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateMeetingRoomConfiguration {
  @_s.JsonKey(name: 'EndOfMeetingReminder')
  final CreateEndOfMeetingReminder endOfMeetingReminder;

  /// Settings to automatically book a room for a configured duration if it's free
  /// when joining a meeting with Alexa.
  @_s.JsonKey(name: 'InstantBooking')
  final CreateInstantBooking instantBooking;

  /// Settings for requiring a check in when a room is reserved. Alexa can cancel
  /// a room reservation if it's not checked into to make the room available for
  /// others. Users can check in by joining the meeting with Alexa or an AVS
  /// device, or by saying “Alexa, check in.”
  @_s.JsonKey(name: 'RequireCheckIn')
  final CreateRequireCheckIn requireCheckIn;

  /// Whether room utilization metrics are enabled or not.
  @_s.JsonKey(name: 'RoomUtilizationMetricsEnabled')
  final bool roomUtilizationMetricsEnabled;

  CreateMeetingRoomConfiguration({
    this.endOfMeetingReminder,
    this.instantBooking,
    this.requireCheckIn,
    this.roomUtilizationMetricsEnabled,
  });
  Map<String, dynamic> toJson() => _$CreateMeetingRoomConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNetworkProfileResponse {
  /// The ARN of the network profile associated with a device.
  @_s.JsonKey(name: 'NetworkProfileArn')
  final String networkProfileArn;

  CreateNetworkProfileResponse({
    this.networkProfileArn,
  });
  factory CreateNetworkProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateNetworkProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProfileResponse {
  /// The ARN of the newly created room profile in the response.
  @_s.JsonKey(name: 'ProfileArn')
  final String profileArn;

  CreateProfileResponse({
    this.profileArn,
  });
  factory CreateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProfileResponseFromJson(json);
}

/// Creates settings for the require check in feature that are applied to a room
/// profile. Require check in allows a meeting room’s Alexa or AVS device to
/// prompt the user to check in; otherwise, the room will be released.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateRequireCheckIn {
  /// Whether require check in is enabled or not.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Duration between 5 and 20 minutes to determine when to release the room if
  /// it's not checked into.
  @_s.JsonKey(name: 'ReleaseAfterMinutes')
  final int releaseAfterMinutes;

  CreateRequireCheckIn({
    @_s.required this.enabled,
    @_s.required this.releaseAfterMinutes,
  });
  Map<String, dynamic> toJson() => _$CreateRequireCheckInToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRoomResponse {
  /// The ARN of the newly created room in the response.
  @_s.JsonKey(name: 'RoomArn')
  final String roomArn;

  CreateRoomResponse({
    this.roomArn,
  });
  factory CreateRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSkillGroupResponse {
  /// The ARN of the newly created skill group in the response.
  @_s.JsonKey(name: 'SkillGroupArn')
  final String skillGroupArn;

  CreateSkillGroupResponse({
    this.skillGroupArn,
  });
  factory CreateSkillGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSkillGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserResponse {
  /// The ARN of the newly created user in the response.
  @_s.JsonKey(name: 'UserArn')
  final String userArn;

  CreateUserResponse({
    this.userArn,
  });
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAddressBookResponse {
  DeleteAddressBookResponse();
  factory DeleteAddressBookResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAddressBookResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBusinessReportScheduleResponse {
  DeleteBusinessReportScheduleResponse();
  factory DeleteBusinessReportScheduleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteBusinessReportScheduleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConferenceProviderResponse {
  DeleteConferenceProviderResponse();
  factory DeleteConferenceProviderResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteConferenceProviderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteContactResponse {
  DeleteContactResponse();
  factory DeleteContactResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteContactResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDeviceResponse {
  DeleteDeviceResponse();
  factory DeleteDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDeviceUsageDataResponse {
  DeleteDeviceUsageDataResponse();
  factory DeleteDeviceUsageDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDeviceUsageDataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGatewayGroupResponse {
  DeleteGatewayGroupResponse();
  factory DeleteGatewayGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteGatewayGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteNetworkProfileResponse {
  DeleteNetworkProfileResponse();
  factory DeleteNetworkProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteNetworkProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProfileResponse {
  DeleteProfileResponse();
  factory DeleteProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRoomResponse {
  DeleteRoomResponse();
  factory DeleteRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRoomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRoomSkillParameterResponse {
  DeleteRoomSkillParameterResponse();
  factory DeleteRoomSkillParameterResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteRoomSkillParameterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSkillAuthorizationResponse {
  DeleteSkillAuthorizationResponse();
  factory DeleteSkillAuthorizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteSkillAuthorizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSkillGroupResponse {
  DeleteSkillGroupResponse();
  factory DeleteSkillGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSkillGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserResponse {
  DeleteUserResponse();
  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);
}

/// The details about the developer that published the skill.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeveloperInfo {
  /// The name of the developer.
  @_s.JsonKey(name: 'DeveloperName')
  final String developerName;

  /// The email of the developer.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The URL of the privacy policy.
  @_s.JsonKey(name: 'PrivacyPolicy')
  final String privacyPolicy;

  /// The website of the developer.
  @_s.JsonKey(name: 'Url')
  final String url;

  DeveloperInfo({
    this.developerName,
    this.email,
    this.privacyPolicy,
    this.url,
  });
  factory DeveloperInfo.fromJson(Map<String, dynamic> json) =>
      _$DeveloperInfoFromJson(json);
}

/// A device with attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Device {
  /// The ARN of a device.
  @_s.JsonKey(name: 'DeviceArn')
  final String deviceArn;

  /// The name of a device.
  @_s.JsonKey(name: 'DeviceName')
  final String deviceName;

  /// The serial number of a device.
  @_s.JsonKey(name: 'DeviceSerialNumber')
  final String deviceSerialNumber;

  /// The status of a device. If the status is not READY, check the
  /// DeviceStatusInfo value for details.
  @_s.JsonKey(name: 'DeviceStatus')
  final DeviceStatus deviceStatus;

  /// Detailed information about a device's status.
  @_s.JsonKey(name: 'DeviceStatusInfo')
  final DeviceStatusInfo deviceStatusInfo;

  /// The type of a device.
  @_s.JsonKey(name: 'DeviceType')
  final String deviceType;

  /// The MAC address of a device.
  @_s.JsonKey(name: 'MacAddress')
  final String macAddress;

  /// Detailed information about a device's network profile.
  @_s.JsonKey(name: 'NetworkProfileInfo')
  final DeviceNetworkProfileInfo networkProfileInfo;

  /// The room ARN of a device.
  @_s.JsonKey(name: 'RoomArn')
  final String roomArn;

  /// The software version of a device.
  @_s.JsonKey(name: 'SoftwareVersion')
  final String softwareVersion;

  Device({
    this.deviceArn,
    this.deviceName,
    this.deviceSerialNumber,
    this.deviceStatus,
    this.deviceStatusInfo,
    this.deviceType,
    this.macAddress,
    this.networkProfileInfo,
    this.roomArn,
    this.softwareVersion,
  });
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

/// Device attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceData {
  /// The time (in epoch) when the device data was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTime')
  final DateTime createdTime;

  /// The ARN of a device.
  @_s.JsonKey(name: 'DeviceArn')
  final String deviceArn;

  /// The name of a device.
  @_s.JsonKey(name: 'DeviceName')
  final String deviceName;

  /// The serial number of a device.
  @_s.JsonKey(name: 'DeviceSerialNumber')
  final String deviceSerialNumber;

  /// The status of a device.
  @_s.JsonKey(name: 'DeviceStatus')
  final DeviceStatus deviceStatus;

  /// Detailed information about a device's status.
  @_s.JsonKey(name: 'DeviceStatusInfo')
  final DeviceStatusInfo deviceStatusInfo;

  /// The type of a device.
  @_s.JsonKey(name: 'DeviceType')
  final String deviceType;

  /// The MAC address of a device.
  @_s.JsonKey(name: 'MacAddress')
  final String macAddress;

  /// The ARN of the network profile associated with a device.
  @_s.JsonKey(name: 'NetworkProfileArn')
  final String networkProfileArn;

  /// The name of the network profile associated with a device.
  @_s.JsonKey(name: 'NetworkProfileName')
  final String networkProfileName;

  /// The room ARN associated with a device.
  @_s.JsonKey(name: 'RoomArn')
  final String roomArn;

  /// The name of the room associated with a device.
  @_s.JsonKey(name: 'RoomName')
  final String roomName;

  /// The software version of a device.
  @_s.JsonKey(name: 'SoftwareVersion')
  final String softwareVersion;

  DeviceData({
    this.createdTime,
    this.deviceArn,
    this.deviceName,
    this.deviceSerialNumber,
    this.deviceStatus,
    this.deviceStatusInfo,
    this.deviceType,
    this.macAddress,
    this.networkProfileArn,
    this.networkProfileName,
    this.roomArn,
    this.roomName,
    this.softwareVersion,
  });
  factory DeviceData.fromJson(Map<String, dynamic> json) =>
      _$DeviceDataFromJson(json);
}

/// The list of device events.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceEvent {
  /// The time (in epoch) when the event occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  /// The type of device event.
  @_s.JsonKey(name: 'Type')
  final DeviceEventType type;

  /// The value of the event.
  @_s.JsonKey(name: 'Value')
  final String value;

  DeviceEvent({
    this.timestamp,
    this.type,
    this.value,
  });
  factory DeviceEvent.fromJson(Map<String, dynamic> json) =>
      _$DeviceEventFromJson(json);
}

enum DeviceEventType {
  @_s.JsonValue('CONNECTION_STATUS')
  connectionStatus,
  @_s.JsonValue('DEVICE_STATUS')
  deviceStatus,
}

extension on DeviceEventType {
  String toValue() {
    switch (this) {
      case DeviceEventType.connectionStatus:
        return 'CONNECTION_STATUS';
      case DeviceEventType.deviceStatus:
        return 'DEVICE_STATUS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Detailed information about a device's network profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceNetworkProfileInfo {
  /// The ARN of the certificate associated with a device.
  @_s.JsonKey(name: 'CertificateArn')
  final String certificateArn;

  /// The time (in epoch) when the certificate expires.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CertificateExpirationTime')
  final DateTime certificateExpirationTime;

  /// The ARN of the network profile associated with a device.
  @_s.JsonKey(name: 'NetworkProfileArn')
  final String networkProfileArn;

  DeviceNetworkProfileInfo({
    this.certificateArn,
    this.certificateExpirationTime,
    this.networkProfileArn,
  });
  factory DeviceNetworkProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceNetworkProfileInfoFromJson(json);
}

enum DeviceStatus {
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('WAS_OFFLINE')
  wasOffline,
  @_s.JsonValue('DEREGISTERED')
  deregistered,
  @_s.JsonValue('FAILED')
  failed,
}

/// Details of a device’s status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceStatusDetail {
  /// The device status detail code.
  @_s.JsonKey(name: 'Code')
  final DeviceStatusDetailCode code;

  /// The list of available features on the device.
  @_s.JsonKey(name: 'Feature')
  final Feature feature;

  DeviceStatusDetail({
    this.code,
    this.feature,
  });
  factory DeviceStatusDetail.fromJson(Map<String, dynamic> json) =>
      _$DeviceStatusDetailFromJson(json);
}

enum DeviceStatusDetailCode {
  @_s.JsonValue('DEVICE_SOFTWARE_UPDATE_NEEDED')
  deviceSoftwareUpdateNeeded,
  @_s.JsonValue('DEVICE_WAS_OFFLINE')
  deviceWasOffline,
  @_s.JsonValue('CREDENTIALS_ACCESS_FAILURE')
  credentialsAccessFailure,
  @_s.JsonValue('TLS_VERSION_MISMATCH')
  tlsVersionMismatch,
  @_s.JsonValue('ASSOCIATION_REJECTION')
  associationRejection,
  @_s.JsonValue('AUTHENTICATION_FAILURE')
  authenticationFailure,
  @_s.JsonValue('DHCP_FAILURE')
  dhcpFailure,
  @_s.JsonValue('INTERNET_UNAVAILABLE')
  internetUnavailable,
  @_s.JsonValue('DNS_FAILURE')
  dnsFailure,
  @_s.JsonValue('UNKNOWN_FAILURE')
  unknownFailure,
  @_s.JsonValue('CERTIFICATE_ISSUING_LIMIT_EXCEEDED')
  certificateIssuingLimitExceeded,
  @_s.JsonValue('INVALID_CERTIFICATE_AUTHORITY')
  invalidCertificateAuthority,
  @_s.JsonValue('NETWORK_PROFILE_NOT_FOUND')
  networkProfileNotFound,
  @_s.JsonValue('INVALID_PASSWORD_STATE')
  invalidPasswordState,
  @_s.JsonValue('PASSWORD_NOT_FOUND')
  passwordNotFound,
  @_s.JsonValue('PASSWORD_MANAGER_ACCESS_DENIED')
  passwordManagerAccessDenied,
  @_s.JsonValue('CERTIFICATE_AUTHORITY_ACCESS_DENIED')
  certificateAuthorityAccessDenied,
}

/// Detailed information about a device's status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeviceStatusInfo {
  /// The latest available information about the connection status of a device.
  @_s.JsonKey(name: 'ConnectionStatus')
  final ConnectionStatus connectionStatus;

  /// The time (in epoch) when the device connection status changed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ConnectionStatusUpdatedTime')
  final DateTime connectionStatusUpdatedTime;

  /// One or more device status detail descriptions.
  @_s.JsonKey(name: 'DeviceStatusDetails')
  final List<DeviceStatusDetail> deviceStatusDetails;

  DeviceStatusInfo({
    this.connectionStatus,
    this.connectionStatusUpdatedTime,
    this.deviceStatusDetails,
  });
  factory DeviceStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceStatusInfoFromJson(json);
}

enum DeviceUsageType {
  @_s.JsonValue('VOICE')
  voice,
}

extension on DeviceUsageType {
  String toValue() {
    switch (this) {
      case DeviceUsageType.voice:
        return 'VOICE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateContactFromAddressBookResponse {
  DisassociateContactFromAddressBookResponse();
  factory DisassociateContactFromAddressBookResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateContactFromAddressBookResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateDeviceFromRoomResponse {
  DisassociateDeviceFromRoomResponse();
  factory DisassociateDeviceFromRoomResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateDeviceFromRoomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateSkillFromSkillGroupResponse {
  DisassociateSkillFromSkillGroupResponse();
  factory DisassociateSkillFromSkillGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateSkillFromSkillGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateSkillFromUsersResponse {
  DisassociateSkillFromUsersResponse();
  factory DisassociateSkillFromUsersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateSkillFromUsersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateSkillGroupFromRoomResponse {
  DisassociateSkillGroupFromRoomResponse();
  factory DisassociateSkillGroupFromRoomResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateSkillGroupFromRoomResponseFromJson(json);
}

enum DistanceUnit {
  @_s.JsonValue('METRIC')
  metric,
  @_s.JsonValue('IMPERIAL')
  imperial,
}

extension on DistanceUnit {
  String toValue() {
    switch (this) {
      case DistanceUnit.metric:
        return 'METRIC';
      case DistanceUnit.imperial:
        return 'IMPERIAL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum EnablementType {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('PENDING')
  pending,
}

enum EnablementTypeFilter {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('PENDING')
  pending,
}

extension on EnablementTypeFilter {
  String toValue() {
    switch (this) {
      case EnablementTypeFilter.enabled:
        return 'ENABLED';
      case EnablementTypeFilter.pending:
        return 'PENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Settings for the end of meeting reminder feature that are applied to a room
/// profile. The end of meeting reminder enables Alexa to remind users when a
/// meeting is ending.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EndOfMeetingReminder {
  /// Whether an end of meeting reminder is enabled or not.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// A range of 3 to 15 minutes that determines when the reminder begins.
  @_s.JsonKey(name: 'ReminderAtMinutes')
  final List<int> reminderAtMinutes;

  /// The type of sound that users hear during the end of meeting reminder.
  @_s.JsonKey(name: 'ReminderType')
  final EndOfMeetingReminderType reminderType;

  EndOfMeetingReminder({
    this.enabled,
    this.reminderAtMinutes,
    this.reminderType,
  });
  factory EndOfMeetingReminder.fromJson(Map<String, dynamic> json) =>
      _$EndOfMeetingReminderFromJson(json);
}

enum EndOfMeetingReminderType {
  @_s.JsonValue('ANNOUNCEMENT_TIME_CHECK')
  announcementTimeCheck,
  @_s.JsonValue('ANNOUNCEMENT_VARIABLE_TIME_LEFT')
  announcementVariableTimeLeft,
  @_s.JsonValue('CHIME')
  chime,
  @_s.JsonValue('KNOCK')
  knock,
}

enum EnrollmentStatus {
  @_s.JsonValue('INITIALIZED')
  initialized,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('REGISTERED')
  registered,
  @_s.JsonValue('DISASSOCIATING')
  disassociating,
  @_s.JsonValue('DEREGISTERING')
  deregistering,
}

enum Feature {
  @_s.JsonValue('BLUETOOTH')
  bluetooth,
  @_s.JsonValue('VOLUME')
  volume,
  @_s.JsonValue('NOTIFICATIONS')
  notifications,
  @_s.JsonValue('LISTS')
  lists,
  @_s.JsonValue('SKILLS')
  skills,
  @_s.JsonValue('NETWORK_PROFILE')
  networkProfile,
  @_s.JsonValue('SETTINGS')
  settings,
  @_s.JsonValue('ALL')
  all,
}

extension on Feature {
  String toValue() {
    switch (this) {
      case Feature.bluetooth:
        return 'BLUETOOTH';
      case Feature.volume:
        return 'VOLUME';
      case Feature.notifications:
        return 'NOTIFICATIONS';
      case Feature.lists:
        return 'LISTS';
      case Feature.skills:
        return 'SKILLS';
      case Feature.networkProfile:
        return 'NETWORK_PROFILE';
      case Feature.settings:
        return 'SETTINGS';
      case Feature.all:
        return 'ALL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A filter name and value pair that is used to return a more specific list of
/// results. Filters can be used to match a set of resources by various
/// criteria.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The key of a filter.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The values of a filter.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  Filter({
    @_s.required this.key,
    @_s.required this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ForgetSmartHomeAppliancesResponse {
  ForgetSmartHomeAppliancesResponse();
  factory ForgetSmartHomeAppliancesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ForgetSmartHomeAppliancesResponseFromJson(json);
}

/// The details of the gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Gateway {
  /// The ARN of the gateway.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the gateway.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the gateway group that the gateway is associated to.
  @_s.JsonKey(name: 'GatewayGroupArn')
  final String gatewayGroupArn;

  /// The name of the gateway.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The software version of the gateway. The gateway automatically updates its
  /// software version during normal operation.
  @_s.JsonKey(name: 'SoftwareVersion')
  final String softwareVersion;

  Gateway({
    this.arn,
    this.description,
    this.gatewayGroupArn,
    this.name,
    this.softwareVersion,
  });
  factory Gateway.fromJson(Map<String, dynamic> json) =>
      _$GatewayFromJson(json);
}

/// The details of the gateway group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewayGroup {
  /// The ARN of the gateway group.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the gateway group.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the gateway group.
  @_s.JsonKey(name: 'Name')
  final String name;

  GatewayGroup({
    this.arn,
    this.description,
    this.name,
  });
  factory GatewayGroup.fromJson(Map<String, dynamic> json) =>
      _$GatewayGroupFromJson(json);
}

/// The summary of a gateway group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewayGroupSummary {
  /// The ARN of the gateway group.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the gateway group.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the gateway group.
  @_s.JsonKey(name: 'Name')
  final String name;

  GatewayGroupSummary({
    this.arn,
    this.description,
    this.name,
  });
  factory GatewayGroupSummary.fromJson(Map<String, dynamic> json) =>
      _$GatewayGroupSummaryFromJson(json);
}

/// The summary of a gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewaySummary {
  /// The ARN of the gateway.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The description of the gateway.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the gateway group that the gateway is associated to.
  @_s.JsonKey(name: 'GatewayGroupArn')
  final String gatewayGroupArn;

  /// The name of the gateway.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The software version of the gateway. The gateway automatically updates its
  /// software version during normal operation.
  @_s.JsonKey(name: 'SoftwareVersion')
  final String softwareVersion;

  GatewaySummary({
    this.arn,
    this.description,
    this.gatewayGroupArn,
    this.name,
    this.softwareVersion,
  });
  factory GatewaySummary.fromJson(Map<String, dynamic> json) =>
      _$GatewaySummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAddressBookResponse {
  /// The details of the requested address book.
  @_s.JsonKey(name: 'AddressBook')
  final AddressBook addressBook;

  GetAddressBookResponse({
    this.addressBook,
  });
  factory GetAddressBookResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAddressBookResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConferencePreferenceResponse {
  /// The conference preference.
  @_s.JsonKey(name: 'Preference')
  final ConferencePreference preference;

  GetConferencePreferenceResponse({
    this.preference,
  });
  factory GetConferencePreferenceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConferencePreferenceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConferenceProviderResponse {
  /// The conference provider.
  @_s.JsonKey(name: 'ConferenceProvider')
  final ConferenceProvider conferenceProvider;

  GetConferenceProviderResponse({
    this.conferenceProvider,
  });
  factory GetConferenceProviderResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConferenceProviderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContactResponse {
  /// The details of the requested contact.
  @_s.JsonKey(name: 'Contact')
  final Contact contact;

  GetContactResponse({
    this.contact,
  });
  factory GetContactResponse.fromJson(Map<String, dynamic> json) =>
      _$GetContactResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeviceResponse {
  /// The details of the device requested. Required.
  @_s.JsonKey(name: 'Device')
  final Device device;

  GetDeviceResponse({
    this.device,
  });
  factory GetDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGatewayGroupResponse {
  @_s.JsonKey(name: 'GatewayGroup')
  final GatewayGroup gatewayGroup;

  GetGatewayGroupResponse({
    this.gatewayGroup,
  });
  factory GetGatewayGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGatewayGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGatewayResponse {
  /// The details of the gateway.
  @_s.JsonKey(name: 'Gateway')
  final Gateway gateway;

  GetGatewayResponse({
    this.gateway,
  });
  factory GetGatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGatewayResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInvitationConfigurationResponse {
  /// The email ID of the organization or individual contact that the enrolled
  /// user can use.
  @_s.JsonKey(name: 'ContactEmail')
  final String contactEmail;

  /// The name of the organization sending the enrollment invite to a user.
  @_s.JsonKey(name: 'OrganizationName')
  final String organizationName;

  /// The list of private skill IDs that you want to recommend to the user to
  /// enable in the invitation.
  @_s.JsonKey(name: 'PrivateSkillIds')
  final List<String> privateSkillIds;

  GetInvitationConfigurationResponse({
    this.contactEmail,
    this.organizationName,
    this.privateSkillIds,
  });
  factory GetInvitationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetInvitationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetNetworkProfileResponse {
  /// The network profile associated with a device.
  @_s.JsonKey(name: 'NetworkProfile')
  final NetworkProfile networkProfile;

  GetNetworkProfileResponse({
    this.networkProfile,
  });
  factory GetNetworkProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNetworkProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProfileResponse {
  /// The details of the room profile requested. Required.
  @_s.JsonKey(name: 'Profile')
  final Profile profile;

  GetProfileResponse({
    this.profile,
  });
  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRoomResponse {
  /// The details of the room requested.
  @_s.JsonKey(name: 'Room')
  final Room room;

  GetRoomResponse({
    this.room,
  });
  factory GetRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRoomSkillParameterResponse {
  /// The details of the room skill parameter requested. Required.
  @_s.JsonKey(name: 'RoomSkillParameter')
  final RoomSkillParameter roomSkillParameter;

  GetRoomSkillParameterResponse({
    this.roomSkillParameter,
  });
  factory GetRoomSkillParameterResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoomSkillParameterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSkillGroupResponse {
  /// The details of the skill group requested. Required.
  @_s.JsonKey(name: 'SkillGroup')
  final SkillGroup skillGroup;

  GetSkillGroupResponse({
    this.skillGroup,
  });
  factory GetSkillGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSkillGroupResponseFromJson(json);
}

/// The IP endpoint and protocol for calling.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IPDialIn {
  /// The protocol, including SIP, SIPS, and H323.
  @_s.JsonKey(name: 'CommsProtocol')
  final CommsProtocol commsProtocol;

  /// The IP address.
  @_s.JsonKey(name: 'Endpoint')
  final String endpoint;

  IPDialIn({
    @_s.required this.commsProtocol,
    @_s.required this.endpoint,
  });
  factory IPDialIn.fromJson(Map<String, dynamic> json) =>
      _$IPDialInFromJson(json);

  Map<String, dynamic> toJson() => _$IPDialInToJson(this);
}

/// Settings for the instant booking feature that are applied to a room profile.
/// When users start their meeting with Alexa, Alexa automatically books the
/// room for the configured duration if the room is available.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstantBooking {
  /// Duration between 15 and 240 minutes at increments of 15 that determines how
  /// long to book an available room when a meeting is started with Alexa.
  @_s.JsonKey(name: 'DurationInMinutes')
  final int durationInMinutes;

  /// Whether instant booking is enabled or not.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  InstantBooking({
    this.durationInMinutes,
    this.enabled,
  });
  factory InstantBooking.fromJson(Map<String, dynamic> json) =>
      _$InstantBookingFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBusinessReportSchedulesResponse {
  /// The schedule of the reports.
  @_s.JsonKey(name: 'BusinessReportSchedules')
  final List<BusinessReportSchedule> businessReportSchedules;

  /// The token used to list the remaining schedules from the previous API call.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBusinessReportSchedulesResponse({
    this.businessReportSchedules,
    this.nextToken,
  });
  factory ListBusinessReportSchedulesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListBusinessReportSchedulesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConferenceProvidersResponse {
  /// The conference providers.
  @_s.JsonKey(name: 'ConferenceProviders')
  final List<ConferenceProvider> conferenceProviders;

  /// The tokens used for pagination.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListConferenceProvidersResponse({
    this.conferenceProviders,
    this.nextToken,
  });
  factory ListConferenceProvidersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListConferenceProvidersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeviceEventsResponse {
  /// The device events requested for the device ARN.
  @_s.JsonKey(name: 'DeviceEvents')
  final List<DeviceEvent> deviceEvents;

  /// The token returned to indicate that there is more data available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDeviceEventsResponse({
    this.deviceEvents,
    this.nextToken,
  });
  factory ListDeviceEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDeviceEventsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGatewayGroupsResponse {
  /// The gateway groups in the list.
  @_s.JsonKey(name: 'GatewayGroups')
  final List<GatewayGroupSummary> gatewayGroups;

  /// The token used to paginate though multiple pages of gateway group summaries.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGatewayGroupsResponse({
    this.gatewayGroups,
    this.nextToken,
  });
  factory ListGatewayGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGatewayGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGatewaysResponse {
  /// The gateways in the list.
  @_s.JsonKey(name: 'Gateways')
  final List<GatewaySummary> gateways;

  /// The token used to paginate though multiple pages of gateway summaries.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListGatewaysResponse({
    this.gateways,
    this.nextToken,
  });
  factory ListGatewaysResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGatewaysResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSkillsResponse {
  /// The token returned to indicate that there is more data available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of enabled skills requested. Required.
  @_s.JsonKey(name: 'SkillSummaries')
  final List<SkillSummary> skillSummaries;

  ListSkillsResponse({
    this.nextToken,
    this.skillSummaries,
  });
  factory ListSkillsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSkillsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSkillsStoreCategoriesResponse {
  /// The list of categories.
  @_s.JsonKey(name: 'CategoryList')
  final List<Category> categoryList;

  /// The tokens used for pagination.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListSkillsStoreCategoriesResponse({
    this.categoryList,
    this.nextToken,
  });
  factory ListSkillsStoreCategoriesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListSkillsStoreCategoriesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSkillsStoreSkillsByCategoryResponse {
  /// The tokens used for pagination.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The skill store skills.
  @_s.JsonKey(name: 'SkillsStoreSkills')
  final List<SkillsStoreSkill> skillsStoreSkills;

  ListSkillsStoreSkillsByCategoryResponse({
    this.nextToken,
    this.skillsStoreSkills,
  });
  factory ListSkillsStoreSkillsByCategoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListSkillsStoreSkillsByCategoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSmartHomeAppliancesResponse {
  /// The tokens used for pagination.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The smart home appliances.
  @_s.JsonKey(name: 'SmartHomeAppliances')
  final List<SmartHomeAppliance> smartHomeAppliances;

  ListSmartHomeAppliancesResponse({
    this.nextToken,
    this.smartHomeAppliances,
  });
  factory ListSmartHomeAppliancesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSmartHomeAppliancesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsResponse {
  /// The token returned to indicate that there is more data available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The tags requested for the specified resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsResponseFromJson(json);
}

enum Locale {
  @_s.JsonValue('en-US')
  enUs,
}

/// Meeting room settings of a room profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MeetingRoomConfiguration {
  /// Settings for the end of meeting reminder feature that are applied to a room
  /// profile. The end of meeting reminder enables Alexa to remind users when a
  /// meeting is ending.
  @_s.JsonKey(name: 'EndOfMeetingReminder')
  final EndOfMeetingReminder endOfMeetingReminder;

  /// Settings to automatically book the room if available for a configured
  /// duration when joining a meeting with Alexa.
  @_s.JsonKey(name: 'InstantBooking')
  final InstantBooking instantBooking;

  /// Settings for requiring a check in when a room is reserved. Alexa can cancel
  /// a room reservation if it's not checked into. This makes the room available
  /// for others. Users can check in by joining the meeting with Alexa or an AVS
  /// device, or by saying “Alexa, check in.”
  @_s.JsonKey(name: 'RequireCheckIn')
  final RequireCheckIn requireCheckIn;

  /// Whether room utilization metrics are enabled or not.
  @_s.JsonKey(name: 'RoomUtilizationMetricsEnabled')
  final bool roomUtilizationMetricsEnabled;

  MeetingRoomConfiguration({
    this.endOfMeetingReminder,
    this.instantBooking,
    this.requireCheckIn,
    this.roomUtilizationMetricsEnabled,
  });
  factory MeetingRoomConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MeetingRoomConfigurationFromJson(json);
}

/// The values that indicate whether a pin is always required (YES), never
/// required (NO), or OPTIONAL.
///
/// <ul>
/// <li>
/// If YES, Alexa will always ask for a meeting pin.
/// </li>
/// <li>
/// If NO, Alexa will never ask for a meeting pin.
/// </li>
/// <li>
/// If OPTIONAL, Alexa will ask if you have a meeting pin and if the customer
/// responds with yes, it will ask for the meeting pin.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MeetingSetting {
  /// The values that indicate whether the pin is always required.
  @_s.JsonKey(name: 'RequirePin')
  final RequirePin requirePin;

  MeetingSetting({
    @_s.required this.requirePin,
  });
  factory MeetingSetting.fromJson(Map<String, dynamic> json) =>
      _$MeetingSettingFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingSettingToJson(this);
}

enum NetworkEapMethod {
  @_s.JsonValue('EAP_TLS')
  eapTls,
}

extension on NetworkEapMethod {
  String toValue() {
    switch (this) {
      case NetworkEapMethod.eapTls:
        return 'EAP_TLS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The network profile associated with a device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkProfile {
  /// The ARN of the Private Certificate Authority (PCA) created in AWS
  /// Certificate Manager (ACM). This is used to issue certificates to the
  /// devices.
  @_s.JsonKey(name: 'CertificateAuthorityArn')
  final String certificateAuthorityArn;

  /// The current password of the Wi-Fi network.
  @_s.JsonKey(name: 'CurrentPassword')
  final String currentPassword;

  /// Detailed information about a device's network profile.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The authentication standard that is used in the EAP framework. Currently,
  /// EAP_TLS is supported.
  @_s.JsonKey(name: 'EapMethod')
  final NetworkEapMethod eapMethod;

  /// The ARN of the network profile associated with a device.
  @_s.JsonKey(name: 'NetworkProfileArn')
  final String networkProfileArn;

  /// The name of the network profile associated with a device.
  @_s.JsonKey(name: 'NetworkProfileName')
  final String networkProfileName;

  /// The next, or subsequent, password of the Wi-Fi network. This password is
  /// asynchronously transmitted to the device and is used when the password of
  /// the network changes to NextPassword.
  @_s.JsonKey(name: 'NextPassword')
  final String nextPassword;

  /// The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE,
  /// WPA2_PSK, WPA_PSK, WEP, or OPEN.
  @_s.JsonKey(name: 'SecurityType')
  final NetworkSecurityType securityType;

  /// The SSID of the Wi-Fi network.
  @_s.JsonKey(name: 'Ssid')
  final String ssid;

  /// The root certificates of your authentication server, which is installed on
  /// your devices and used to trust your authentication server during EAP
  /// negotiation.
  @_s.JsonKey(name: 'TrustAnchors')
  final List<String> trustAnchors;

  NetworkProfile({
    this.certificateAuthorityArn,
    this.currentPassword,
    this.description,
    this.eapMethod,
    this.networkProfileArn,
    this.networkProfileName,
    this.nextPassword,
    this.securityType,
    this.ssid,
    this.trustAnchors,
  });
  factory NetworkProfile.fromJson(Map<String, dynamic> json) =>
      _$NetworkProfileFromJson(json);
}

/// The data associated with a network profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkProfileData {
  /// The ARN of the Private Certificate Authority (PCA) created in AWS
  /// Certificate Manager (ACM). This is used to issue certificates to the
  /// devices.
  @_s.JsonKey(name: 'CertificateAuthorityArn')
  final String certificateAuthorityArn;

  /// Detailed information about a device's network profile.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The authentication standard that is used in the EAP framework. Currently,
  /// EAP_TLS is supported.
  @_s.JsonKey(name: 'EapMethod')
  final NetworkEapMethod eapMethod;

  /// The ARN of the network profile associated with a device.
  @_s.JsonKey(name: 'NetworkProfileArn')
  final String networkProfileArn;

  /// The name of the network profile associated with a device.
  @_s.JsonKey(name: 'NetworkProfileName')
  final String networkProfileName;

  /// The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE,
  /// WPA2_PSK, WPA_PSK, WEP, or OPEN.
  @_s.JsonKey(name: 'SecurityType')
  final NetworkSecurityType securityType;

  /// The SSID of the Wi-Fi network.
  @_s.JsonKey(name: 'Ssid')
  final String ssid;

  NetworkProfileData({
    this.certificateAuthorityArn,
    this.description,
    this.eapMethod,
    this.networkProfileArn,
    this.networkProfileName,
    this.securityType,
    this.ssid,
  });
  factory NetworkProfileData.fromJson(Map<String, dynamic> json) =>
      _$NetworkProfileDataFromJson(json);
}

enum NetworkSecurityType {
  @_s.JsonValue('OPEN')
  open,
  @_s.JsonValue('WEP')
  wep,
  @_s.JsonValue('WPA_PSK')
  wpaPsk,
  @_s.JsonValue('WPA2_PSK')
  wpa2Psk,
  @_s.JsonValue('WPA2_ENTERPRISE')
  wpa2Enterprise,
}

extension on NetworkSecurityType {
  String toValue() {
    switch (this) {
      case NetworkSecurityType.open:
        return 'OPEN';
      case NetworkSecurityType.wep:
        return 'WEP';
      case NetworkSecurityType.wpaPsk:
        return 'WPA_PSK';
      case NetworkSecurityType.wpa2Psk:
        return 'WPA2_PSK';
      case NetworkSecurityType.wpa2Enterprise:
        return 'WPA2_ENTERPRISE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The information for public switched telephone network (PSTN) conferencing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PSTNDialIn {
  /// The zip code.
  @_s.JsonKey(name: 'CountryCode')
  final String countryCode;

  /// The delay duration before Alexa enters the conference ID with dual-tone
  /// multi-frequency (DTMF). Each number on the dial pad corresponds to a DTMF
  /// tone, which is how we send data over the telephone network.
  @_s.JsonKey(name: 'OneClickIdDelay')
  final String oneClickIdDelay;

  /// The delay duration before Alexa enters the conference pin with dual-tone
  /// multi-frequency (DTMF). Each number on the dial pad corresponds to a DTMF
  /// tone, which is how we send data over the telephone network.
  @_s.JsonKey(name: 'OneClickPinDelay')
  final String oneClickPinDelay;

  /// The phone number to call to join the conference.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  PSTNDialIn({
    @_s.required this.countryCode,
    @_s.required this.oneClickIdDelay,
    @_s.required this.oneClickPinDelay,
    @_s.required this.phoneNumber,
  });
  factory PSTNDialIn.fromJson(Map<String, dynamic> json) =>
      _$PSTNDialInFromJson(json);

  Map<String, dynamic> toJson() => _$PSTNDialInToJson(this);
}

/// The phone number for the contact containing the raw number and phone number
/// type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PhoneNumber {
  /// The raw value of the phone number.
  @_s.JsonKey(name: 'Number')
  final String number;

  /// The type of the phone number.
  @_s.JsonKey(name: 'Type')
  final PhoneNumberType type;

  PhoneNumber({
    @_s.required this.number,
    @_s.required this.type,
  });
  factory PhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneNumberToJson(this);
}

enum PhoneNumberType {
  @_s.JsonValue('MOBILE')
  mobile,
  @_s.JsonValue('WORK')
  work,
  @_s.JsonValue('HOME')
  home,
}

/// A room profile with attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Profile {
  /// The address of a room profile.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The ARN of the address book.
  @_s.JsonKey(name: 'AddressBookArn')
  final String addressBookArn;

  /// The distance unit of a room profile.
  @_s.JsonKey(name: 'DistanceUnit')
  final DistanceUnit distanceUnit;

  /// Retrieves if the profile is default or not.
  @_s.JsonKey(name: 'IsDefault')
  final bool isDefault;

  /// The locale of a room profile. (This is currently available only to a limited
  /// preview audience.)
  @_s.JsonKey(name: 'Locale')
  final String locale;

  /// The max volume limit of a room profile.
  @_s.JsonKey(name: 'MaxVolumeLimit')
  final int maxVolumeLimit;

  /// Meeting room settings of a room profile.
  @_s.JsonKey(name: 'MeetingRoomConfiguration')
  final MeetingRoomConfiguration meetingRoomConfiguration;

  /// The PSTN setting of a room profile.
  @_s.JsonKey(name: 'PSTNEnabled')
  final bool pSTNEnabled;

  /// The ARN of a room profile.
  @_s.JsonKey(name: 'ProfileArn')
  final String profileArn;

  /// The name of a room profile.
  @_s.JsonKey(name: 'ProfileName')
  final String profileName;

  /// The setup mode of a room profile.
  @_s.JsonKey(name: 'SetupModeDisabled')
  final bool setupModeDisabled;

  /// The temperature unit of a room profile.
  @_s.JsonKey(name: 'TemperatureUnit')
  final TemperatureUnit temperatureUnit;

  /// The time zone of a room profile.
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

  /// The wake word of a room profile.
  @_s.JsonKey(name: 'WakeWord')
  final WakeWord wakeWord;

  Profile({
    this.address,
    this.addressBookArn,
    this.distanceUnit,
    this.isDefault,
    this.locale,
    this.maxVolumeLimit,
    this.meetingRoomConfiguration,
    this.pSTNEnabled,
    this.profileArn,
    this.profileName,
    this.setupModeDisabled,
    this.temperatureUnit,
    this.timezone,
    this.wakeWord,
  });
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

/// The data of a room profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProfileData {
  /// The address of a room profile.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The distance unit of a room profile.
  @_s.JsonKey(name: 'DistanceUnit')
  final DistanceUnit distanceUnit;

  /// Retrieves if the profile data is default or not.
  @_s.JsonKey(name: 'IsDefault')
  final bool isDefault;

  /// The locale of a room profile. (This is currently available only to a limited
  /// preview audience.)
  @_s.JsonKey(name: 'Locale')
  final String locale;

  /// The ARN of a room profile.
  @_s.JsonKey(name: 'ProfileArn')
  final String profileArn;

  /// The name of a room profile.
  @_s.JsonKey(name: 'ProfileName')
  final String profileName;

  /// The temperature unit of a room profile.
  @_s.JsonKey(name: 'TemperatureUnit')
  final TemperatureUnit temperatureUnit;

  /// The time zone of a room profile.
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

  /// The wake word of a room profile.
  @_s.JsonKey(name: 'WakeWord')
  final WakeWord wakeWord;

  ProfileData({
    this.address,
    this.distanceUnit,
    this.isDefault,
    this.locale,
    this.profileArn,
    this.profileName,
    this.temperatureUnit,
    this.timezone,
    this.wakeWord,
  });
  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutConferencePreferenceResponse {
  PutConferencePreferenceResponse();
  factory PutConferencePreferenceResponse.fromJson(Map<String, dynamic> json) =>
      _$PutConferencePreferenceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutInvitationConfigurationResponse {
  PutInvitationConfigurationResponse();
  factory PutInvitationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutInvitationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRoomSkillParameterResponse {
  PutRoomSkillParameterResponse();
  factory PutRoomSkillParameterResponse.fromJson(Map<String, dynamic> json) =>
      _$PutRoomSkillParameterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutSkillAuthorizationResponse {
  PutSkillAuthorizationResponse();
  factory PutSkillAuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      _$PutSkillAuthorizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterAVSDeviceResponse {
  /// The ARN of the device.
  @_s.JsonKey(name: 'DeviceArn')
  final String deviceArn;

  RegisterAVSDeviceResponse({
    this.deviceArn,
  });
  factory RegisterAVSDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterAVSDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RejectSkillResponse {
  RejectSkillResponse();
  factory RejectSkillResponse.fromJson(Map<String, dynamic> json) =>
      _$RejectSkillResponseFromJson(json);
}

/// Settings for the require check in feature that are applied to a room
/// profile. Require check in allows a meeting room’s Alexa or AVS device to
/// prompt the user to check in; otherwise, the room will be released.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequireCheckIn {
  /// Whether require check in is enabled or not.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Duration between 5 and 20 minutes to determine when to release the room if
  /// it's not checked into.
  @_s.JsonKey(name: 'ReleaseAfterMinutes')
  final int releaseAfterMinutes;

  RequireCheckIn({
    this.enabled,
    this.releaseAfterMinutes,
  });
  factory RequireCheckIn.fromJson(Map<String, dynamic> json) =>
      _$RequireCheckInFromJson(json);
}

enum RequirePin {
  @_s.JsonValue('YES')
  yes,
  @_s.JsonValue('NO')
  no,
  @_s.JsonValue('OPTIONAL')
  optional,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolveRoomResponse {
  /// The ARN of the room from which the skill request was invoked.
  @_s.JsonKey(name: 'RoomArn')
  final String roomArn;

  /// The name of the room from which the skill request was invoked.
  @_s.JsonKey(name: 'RoomName')
  final String roomName;

  /// Response to get the room profile request. Required.
  @_s.JsonKey(name: 'RoomSkillParameters')
  final List<RoomSkillParameter> roomSkillParameters;

  ResolveRoomResponse({
    this.roomArn,
    this.roomName,
    this.roomSkillParameters,
  });
  factory ResolveRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$ResolveRoomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RevokeInvitationResponse {
  RevokeInvitationResponse();
  factory RevokeInvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$RevokeInvitationResponseFromJson(json);
}

/// A room with attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Room {
  /// The description of a room.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The profile ARN of a room.
  @_s.JsonKey(name: 'ProfileArn')
  final String profileArn;

  /// The provider calendar ARN of a room.
  @_s.JsonKey(name: 'ProviderCalendarId')
  final String providerCalendarId;

  /// The ARN of a room.
  @_s.JsonKey(name: 'RoomArn')
  final String roomArn;

  /// The name of a room.
  @_s.JsonKey(name: 'RoomName')
  final String roomName;

  Room({
    this.description,
    this.profileArn,
    this.providerCalendarId,
    this.roomArn,
    this.roomName,
  });
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

/// The data of a room.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RoomData {
  /// The description of a room.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The profile ARN of a room.
  @_s.JsonKey(name: 'ProfileArn')
  final String profileArn;

  /// The profile name of a room.
  @_s.JsonKey(name: 'ProfileName')
  final String profileName;

  /// The provider calendar ARN of a room.
  @_s.JsonKey(name: 'ProviderCalendarId')
  final String providerCalendarId;

  /// The ARN of a room.
  @_s.JsonKey(name: 'RoomArn')
  final String roomArn;

  /// The name of a room.
  @_s.JsonKey(name: 'RoomName')
  final String roomName;

  RoomData({
    this.description,
    this.profileArn,
    this.profileName,
    this.providerCalendarId,
    this.roomArn,
    this.roomName,
  });
  factory RoomData.fromJson(Map<String, dynamic> json) =>
      _$RoomDataFromJson(json);
}

/// A skill parameter associated with a room.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RoomSkillParameter {
  /// The parameter key of a room skill parameter. ParameterKey is an enumerated
  /// type that only takes “DEFAULT” or “SCOPE” as valid values.
  @_s.JsonKey(name: 'ParameterKey')
  final String parameterKey;

  /// The parameter value of a room skill parameter.
  @_s.JsonKey(name: 'ParameterValue')
  final String parameterValue;

  RoomSkillParameter({
    @_s.required this.parameterKey,
    @_s.required this.parameterValue,
  });
  factory RoomSkillParameter.fromJson(Map<String, dynamic> json) =>
      _$RoomSkillParameterFromJson(json);

  Map<String, dynamic> toJson() => _$RoomSkillParameterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchAddressBooksResponse {
  /// The address books that meet the specified set of filter criteria, in sort
  /// order.
  @_s.JsonKey(name: 'AddressBooks')
  final List<AddressBookData> addressBooks;

  /// The token returned to indicate that there is more data available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The total number of address books returned.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  SearchAddressBooksResponse({
    this.addressBooks,
    this.nextToken,
    this.totalCount,
  });
  factory SearchAddressBooksResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchAddressBooksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchContactsResponse {
  /// The contacts that meet the specified set of filter criteria, in sort order.
  @_s.JsonKey(name: 'Contacts')
  final List<ContactData> contacts;

  /// The token returned to indicate that there is more data available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The total number of contacts returned.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  SearchContactsResponse({
    this.contacts,
    this.nextToken,
    this.totalCount,
  });
  factory SearchContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchContactsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchDevicesResponse {
  /// The devices that meet the specified set of filter criteria, in sort order.
  @_s.JsonKey(name: 'Devices')
  final List<DeviceData> devices;

  /// The token returned to indicate that there is more data available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The total number of devices returned.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  SearchDevicesResponse({
    this.devices,
    this.nextToken,
    this.totalCount,
  });
  factory SearchDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchDevicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchNetworkProfilesResponse {
  /// The network profiles that meet the specified set of filter criteria, in sort
  /// order. It is a list of NetworkProfileData objects.
  @_s.JsonKey(name: 'NetworkProfiles')
  final List<NetworkProfileData> networkProfiles;

  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified, the
  /// response includes only results beyond the token, up to the value specified
  /// by MaxResults.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The total number of network profiles returned.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  SearchNetworkProfilesResponse({
    this.networkProfiles,
    this.nextToken,
    this.totalCount,
  });
  factory SearchNetworkProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchNetworkProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchProfilesResponse {
  /// The token returned to indicate that there is more data available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The profiles that meet the specified set of filter criteria, in sort order.
  @_s.JsonKey(name: 'Profiles')
  final List<ProfileData> profiles;

  /// The total number of room profiles returned.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  SearchProfilesResponse({
    this.nextToken,
    this.profiles,
    this.totalCount,
  });
  factory SearchProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchRoomsResponse {
  /// The token returned to indicate that there is more data available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The rooms that meet the specified set of filter criteria, in sort order.
  @_s.JsonKey(name: 'Rooms')
  final List<RoomData> rooms;

  /// The total number of rooms returned.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  SearchRoomsResponse({
    this.nextToken,
    this.rooms,
    this.totalCount,
  });
  factory SearchRoomsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchRoomsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchSkillGroupsResponse {
  /// The token returned to indicate that there is more data available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The skill groups that meet the filter criteria, in sort order.
  @_s.JsonKey(name: 'SkillGroups')
  final List<SkillGroupData> skillGroups;

  /// The total number of skill groups returned.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  SearchSkillGroupsResponse({
    this.nextToken,
    this.skillGroups,
    this.totalCount,
  });
  factory SearchSkillGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchSkillGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchUsersResponse {
  /// The token returned to indicate that there is more data available.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The total number of users returned.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  /// The users that meet the specified set of filter criteria, in sort order.
  @_s.JsonKey(name: 'Users')
  final List<UserData> users;

  SearchUsersResponse({
    this.nextToken,
    this.totalCount,
    this.users,
  });
  factory SearchUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchUsersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendAnnouncementResponse {
  /// The identifier of the announcement.
  @_s.JsonKey(name: 'AnnouncementArn')
  final String announcementArn;

  SendAnnouncementResponse({
    this.announcementArn,
  });
  factory SendAnnouncementResponse.fromJson(Map<String, dynamic> json) =>
      _$SendAnnouncementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendInvitationResponse {
  SendInvitationResponse();
  factory SendInvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$SendInvitationResponseFromJson(json);
}

/// The SIP address for the contact containing the URI and SIP address type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SipAddress {
  /// The type of the SIP address.
  @_s.JsonKey(name: 'Type')
  final SipType type;

  /// The URI for the SIP address.
  @_s.JsonKey(name: 'Uri')
  final String uri;

  SipAddress({
    @_s.required this.type,
    @_s.required this.uri,
  });
  factory SipAddress.fromJson(Map<String, dynamic> json) =>
      _$SipAddressFromJson(json);

  Map<String, dynamic> toJson() => _$SipAddressToJson(this);
}

enum SipType {
  @_s.JsonValue('WORK')
  work,
}

/// Granular information about the skill.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SkillDetails {
  /// The details about what the skill supports organized as bullet points.
  @_s.JsonKey(name: 'BulletPoints')
  final List<String> bulletPoints;

  /// The details about the developer that published the skill.
  @_s.JsonKey(name: 'DeveloperInfo')
  final DeveloperInfo developerInfo;

  /// The URL of the end user license agreement.
  @_s.JsonKey(name: 'EndUserLicenseAgreement')
  final String endUserLicenseAgreement;

  /// The generic keywords associated with the skill that can be used to find a
  /// skill.
  @_s.JsonKey(name: 'GenericKeywords')
  final List<String> genericKeywords;

  /// The phrase used to trigger the skill.
  @_s.JsonKey(name: 'InvocationPhrase')
  final String invocationPhrase;

  /// The updates added in bullet points.
  @_s.JsonKey(name: 'NewInThisVersionBulletPoints')
  final List<String> newInThisVersionBulletPoints;

  /// The description of the product.
  @_s.JsonKey(name: 'ProductDescription')
  final String productDescription;

  /// The date when the skill was released.
  @_s.JsonKey(name: 'ReleaseDate')
  final String releaseDate;

  /// <i>This member has been deprecated.</i>
  ///
  /// The list of reviews for the skill, including Key and Value pair.
  @_s.JsonKey(name: 'Reviews')
  final Map<String, String> reviews;

  /// The types of skills.
  @_s.JsonKey(name: 'SkillTypes')
  final List<String> skillTypes;

  SkillDetails({
    this.bulletPoints,
    this.developerInfo,
    this.endUserLicenseAgreement,
    this.genericKeywords,
    this.invocationPhrase,
    this.newInThisVersionBulletPoints,
    this.productDescription,
    this.releaseDate,
    this.reviews,
    this.skillTypes,
  });
  factory SkillDetails.fromJson(Map<String, dynamic> json) =>
      _$SkillDetailsFromJson(json);
}

/// A skill group with attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SkillGroup {
  /// The description of a skill group.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of a skill group.
  @_s.JsonKey(name: 'SkillGroupArn')
  final String skillGroupArn;

  /// The name of a skill group.
  @_s.JsonKey(name: 'SkillGroupName')
  final String skillGroupName;

  SkillGroup({
    this.description,
    this.skillGroupArn,
    this.skillGroupName,
  });
  factory SkillGroup.fromJson(Map<String, dynamic> json) =>
      _$SkillGroupFromJson(json);
}

/// The attributes of a skill group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SkillGroupData {
  /// The description of a skill group.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The skill group ARN of a skill group.
  @_s.JsonKey(name: 'SkillGroupArn')
  final String skillGroupArn;

  /// The skill group name of a skill group.
  @_s.JsonKey(name: 'SkillGroupName')
  final String skillGroupName;

  SkillGroupData({
    this.description,
    this.skillGroupArn,
    this.skillGroupName,
  });
  factory SkillGroupData.fromJson(Map<String, dynamic> json) =>
      _$SkillGroupDataFromJson(json);
}

/// The summary of skills.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SkillSummary {
  /// Whether the skill is enabled under the user's account, or if it requires
  /// linking to be used.
  @_s.JsonKey(name: 'EnablementType')
  final EnablementType enablementType;

  /// The ARN of the skill summary.
  @_s.JsonKey(name: 'SkillId')
  final String skillId;

  /// The name of the skill.
  @_s.JsonKey(name: 'SkillName')
  final String skillName;

  /// Whether the skill is publicly available or is a private skill.
  @_s.JsonKey(name: 'SkillType')
  final SkillType skillType;

  /// Linking support for a skill.
  @_s.JsonKey(name: 'SupportsLinking')
  final bool supportsLinking;

  SkillSummary({
    this.enablementType,
    this.skillId,
    this.skillName,
    this.skillType,
    this.supportsLinking,
  });
  factory SkillSummary.fromJson(Map<String, dynamic> json) =>
      _$SkillSummaryFromJson(json);
}

enum SkillType {
  @_s.JsonValue('PUBLIC')
  public,
  @_s.JsonValue('PRIVATE')
  private,
}

enum SkillTypeFilter {
  @_s.JsonValue('PUBLIC')
  public,
  @_s.JsonValue('PRIVATE')
  private,
  @_s.JsonValue('ALL')
  all,
}

extension on SkillTypeFilter {
  String toValue() {
    switch (this) {
      case SkillTypeFilter.public:
        return 'PUBLIC';
      case SkillTypeFilter.private:
        return 'PRIVATE';
      case SkillTypeFilter.all:
        return 'ALL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The detailed information about an Alexa skill.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SkillsStoreSkill {
  /// The URL where the skill icon resides.
  @_s.JsonKey(name: 'IconUrl')
  final String iconUrl;

  /// Sample utterances that interact with the skill.
  @_s.JsonKey(name: 'SampleUtterances')
  final List<String> sampleUtterances;

  /// Short description about the skill.
  @_s.JsonKey(name: 'ShortDescription')
  final String shortDescription;

  /// Information about the skill.
  @_s.JsonKey(name: 'SkillDetails')
  final SkillDetails skillDetails;

  /// The ARN of the skill.
  @_s.JsonKey(name: 'SkillId')
  final String skillId;

  /// The name of the skill.
  @_s.JsonKey(name: 'SkillName')
  final String skillName;

  /// Linking support for a skill.
  @_s.JsonKey(name: 'SupportsLinking')
  final bool supportsLinking;

  SkillsStoreSkill({
    this.iconUrl,
    this.sampleUtterances,
    this.shortDescription,
    this.skillDetails,
    this.skillId,
    this.skillName,
    this.supportsLinking,
  });
  factory SkillsStoreSkill.fromJson(Map<String, dynamic> json) =>
      _$SkillsStoreSkillFromJson(json);
}

/// A smart home appliance that can connect to a central system. Any domestic
/// device can be a smart appliance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SmartHomeAppliance {
  /// The description of the smart home appliance.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The friendly name of the smart home appliance.
  @_s.JsonKey(name: 'FriendlyName')
  final String friendlyName;

  /// The name of the manufacturer of the smart home appliance.
  @_s.JsonKey(name: 'ManufacturerName')
  final String manufacturerName;

  SmartHomeAppliance({
    this.description,
    this.friendlyName,
    this.manufacturerName,
  });
  factory SmartHomeAppliance.fromJson(Map<String, dynamic> json) =>
      _$SmartHomeApplianceFromJson(json);
}

/// An object representing a sort criteria.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Sort {
  /// The sort key of a sort object.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The sort value of a sort object.
  @_s.JsonKey(name: 'Value')
  final SortValue value;

  Sort({
    @_s.required this.key,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$SortToJson(this);
}

enum SortValue {
  @_s.JsonValue('ASC')
  asc,
  @_s.JsonValue('DESC')
  desc,
}

/// The SSML message. For more information, see <a
/// href="https://developer.amazon.com/docs/custom-skills/speech-synthesis-markup-language-ssml-reference.html">SSML
/// Reference</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Ssml {
  /// The locale of the SSML message. Currently, en-US is supported.
  @_s.JsonKey(name: 'Locale')
  final Locale locale;

  /// The value of the SSML message in the correct SSML format. The audio tag is
  /// not supported.
  @_s.JsonKey(name: 'Value')
  final String value;

  Ssml({
    @_s.required this.locale,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$SsmlToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartDeviceSyncResponse {
  StartDeviceSyncResponse();
  factory StartDeviceSyncResponse.fromJson(Map<String, dynamic> json) =>
      _$StartDeviceSyncResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartSmartHomeApplianceDiscoveryResponse {
  StartSmartHomeApplianceDiscoveryResponse();
  factory StartSmartHomeApplianceDiscoveryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartSmartHomeApplianceDiscoveryResponseFromJson(json);
}

/// A key-value pair that can be associated with a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of a tag. Tag keys are case-sensitive.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of a tag. Tag values are case sensitive and can be null.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
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

enum TemperatureUnit {
  @_s.JsonValue('FAHRENHEIT')
  fahrenheit,
  @_s.JsonValue('CELSIUS')
  celsius,
}

extension on TemperatureUnit {
  String toValue() {
    switch (this) {
      case TemperatureUnit.fahrenheit:
        return 'FAHRENHEIT';
      case TemperatureUnit.celsius:
        return 'CELSIUS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The text message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Text {
  /// The locale of the text message. Currently, en-US is supported.
  @_s.JsonKey(name: 'Locale')
  final Locale locale;

  /// The value of the text message.
  @_s.JsonKey(name: 'Value')
  final String value;

  Text({
    @_s.required this.locale,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$TextToJson(this);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAddressBookResponse {
  UpdateAddressBookResponse();
  factory UpdateAddressBookResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddressBookResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBusinessReportScheduleResponse {
  UpdateBusinessReportScheduleResponse();
  factory UpdateBusinessReportScheduleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateBusinessReportScheduleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConferenceProviderResponse {
  UpdateConferenceProviderResponse();
  factory UpdateConferenceProviderResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateConferenceProviderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateContactResponse {
  UpdateContactResponse();
  factory UpdateContactResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateContactResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDeviceResponse {
  UpdateDeviceResponse();
  factory UpdateDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeviceResponseFromJson(json);
}

/// Settings for the end of meeting reminder feature that are applied to a room
/// profile. The end of meeting reminder enables Alexa to remind users when a
/// meeting is ending.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateEndOfMeetingReminder {
  /// Whether an end of meeting reminder is enabled or not.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Updates settings for the end of meeting reminder feature that are applied to
  /// a room profile. The end of meeting reminder enables Alexa to remind users
  /// when a meeting is ending.
  @_s.JsonKey(name: 'ReminderAtMinutes')
  final List<int> reminderAtMinutes;

  /// The type of sound that users hear during the end of meeting reminder.
  @_s.JsonKey(name: 'ReminderType')
  final EndOfMeetingReminderType reminderType;

  UpdateEndOfMeetingReminder({
    this.enabled,
    this.reminderAtMinutes,
    this.reminderType,
  });
  Map<String, dynamic> toJson() => _$UpdateEndOfMeetingReminderToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGatewayGroupResponse {
  UpdateGatewayGroupResponse();
  factory UpdateGatewayGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGatewayGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGatewayResponse {
  UpdateGatewayResponse();
  factory UpdateGatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGatewayResponseFromJson(json);
}

/// Updates settings for the instant booking feature that are applied to a room
/// profile. If instant booking is enabled, Alexa automatically reserves a room
/// if it is free when a user joins a meeting with Alexa.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateInstantBooking {
  /// Duration between 15 and 240 minutes at increments of 15 that determines how
  /// long to book an available room when a meeting is started with Alexa.
  @_s.JsonKey(name: 'DurationInMinutes')
  final int durationInMinutes;

  /// Whether instant booking is enabled or not.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  UpdateInstantBooking({
    this.durationInMinutes,
    this.enabled,
  });
  Map<String, dynamic> toJson() => _$UpdateInstantBookingToJson(this);
}

/// Updates meeting room settings of a room profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateMeetingRoomConfiguration {
  /// Settings for the end of meeting reminder feature that are applied to a room
  /// profile. The end of meeting reminder enables Alexa to remind users when a
  /// meeting is ending.
  @_s.JsonKey(name: 'EndOfMeetingReminder')
  final UpdateEndOfMeetingReminder endOfMeetingReminder;

  /// Settings to automatically book an available room available for a configured
  /// duration when joining a meeting with Alexa.
  @_s.JsonKey(name: 'InstantBooking')
  final UpdateInstantBooking instantBooking;

  /// Settings for requiring a check in when a room is reserved. Alexa can cancel
  /// a room reservation if it's not checked into to make the room available for
  /// others. Users can check in by joining the meeting with Alexa or an AVS
  /// device, or by saying “Alexa, check in.”
  @_s.JsonKey(name: 'RequireCheckIn')
  final UpdateRequireCheckIn requireCheckIn;

  /// Whether room utilization metrics are enabled or not.
  @_s.JsonKey(name: 'RoomUtilizationMetricsEnabled')
  final bool roomUtilizationMetricsEnabled;

  UpdateMeetingRoomConfiguration({
    this.endOfMeetingReminder,
    this.instantBooking,
    this.requireCheckIn,
    this.roomUtilizationMetricsEnabled,
  });
  Map<String, dynamic> toJson() => _$UpdateMeetingRoomConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNetworkProfileResponse {
  UpdateNetworkProfileResponse();
  factory UpdateNetworkProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateNetworkProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProfileResponse {
  UpdateProfileResponse();
  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);
}

/// Updates settings for the require check in feature that are applied to a room
/// profile. Require check in allows a meeting room’s Alexa or AVS device to
/// prompt the user to check in; otherwise, the room will be released.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateRequireCheckIn {
  /// Whether require check in is enabled or not.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Duration between 5 and 20 minutes to determine when to release the room if
  /// it's not checked into.
  @_s.JsonKey(name: 'ReleaseAfterMinutes')
  final int releaseAfterMinutes;

  UpdateRequireCheckIn({
    this.enabled,
    this.releaseAfterMinutes,
  });
  Map<String, dynamic> toJson() => _$UpdateRequireCheckInToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRoomResponse {
  UpdateRoomResponse();
  factory UpdateRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRoomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSkillGroupResponse {
  UpdateSkillGroupResponse();
  factory UpdateSkillGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSkillGroupResponseFromJson(json);
}

/// Information related to a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserData {
  /// The email of a user.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The enrollment ARN of a user.
  @_s.JsonKey(name: 'EnrollmentId')
  final String enrollmentId;

  /// The enrollment status of a user.
  @_s.JsonKey(name: 'EnrollmentStatus')
  final EnrollmentStatus enrollmentStatus;

  /// The first name of a user.
  @_s.JsonKey(name: 'FirstName')
  final String firstName;

  /// The last name of a user.
  @_s.JsonKey(name: 'LastName')
  final String lastName;

  /// The ARN of a user.
  @_s.JsonKey(name: 'UserArn')
  final String userArn;

  UserData({
    this.email,
    this.enrollmentId,
    this.enrollmentStatus,
    this.firstName,
    this.lastName,
    this.userArn,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

enum WakeWord {
  @_s.JsonValue('ALEXA')
  alexa,
  @_s.JsonValue('AMAZON')
  amazon,
  @_s.JsonValue('ECHO')
  echo,
  @_s.JsonValue('COMPUTER')
  computer,
}

extension on WakeWord {
  String toValue() {
    switch (this) {
      case WakeWord.alexa:
        return 'ALEXA';
      case WakeWord.amazon:
        return 'AMAZON';
      case WakeWord.echo:
        return 'ECHO';
      case WakeWord.computer:
        return 'COMPUTER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String type, String message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class DeviceNotRegisteredException extends _s.GenericAwsException {
  DeviceNotRegisteredException({String type, String message})
      : super(
            type: type, code: 'DeviceNotRegisteredException', message: message);
}

class InvalidCertificateAuthorityException extends _s.GenericAwsException {
  InvalidCertificateAuthorityException({String type, String message})
      : super(
            type: type,
            code: 'InvalidCertificateAuthorityException',
            message: message);
}

class InvalidDeviceException extends _s.GenericAwsException {
  InvalidDeviceException({String type, String message})
      : super(type: type, code: 'InvalidDeviceException', message: message);
}

class InvalidSecretsManagerResourceException extends _s.GenericAwsException {
  InvalidSecretsManagerResourceException({String type, String message})
      : super(
            type: type,
            code: 'InvalidSecretsManagerResourceException',
            message: message);
}

class InvalidServiceLinkedRoleStateException extends _s.GenericAwsException {
  InvalidServiceLinkedRoleStateException({String type, String message})
      : super(
            type: type,
            code: 'InvalidServiceLinkedRoleStateException',
            message: message);
}

class InvalidUserStatusException extends _s.GenericAwsException {
  InvalidUserStatusException({String type, String message})
      : super(type: type, code: 'InvalidUserStatusException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NameInUseException extends _s.GenericAwsException {
  NameInUseException({String type, String message})
      : super(type: type, code: 'NameInUseException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceAssociatedException extends _s.GenericAwsException {
  ResourceAssociatedException({String type, String message})
      : super(
            type: type, code: 'ResourceAssociatedException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class SkillNotLinkedException extends _s.GenericAwsException {
  SkillNotLinkedException({String type, String message})
      : super(type: type, code: 'SkillNotLinkedException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'DeviceNotRegisteredException': (type, message) =>
      DeviceNotRegisteredException(type: type, message: message),
  'InvalidCertificateAuthorityException': (type, message) =>
      InvalidCertificateAuthorityException(type: type, message: message),
  'InvalidDeviceException': (type, message) =>
      InvalidDeviceException(type: type, message: message),
  'InvalidSecretsManagerResourceException': (type, message) =>
      InvalidSecretsManagerResourceException(type: type, message: message),
  'InvalidServiceLinkedRoleStateException': (type, message) =>
      InvalidServiceLinkedRoleStateException(type: type, message: message),
  'InvalidUserStatusException': (type, message) =>
      InvalidUserStatusException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NameInUseException': (type, message) =>
      NameInUseException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceAssociatedException': (type, message) =>
      ResourceAssociatedException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'SkillNotLinkedException': (type, message) =>
      SkillNotLinkedException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
