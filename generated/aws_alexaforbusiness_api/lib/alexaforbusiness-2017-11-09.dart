// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'a4b',
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
    required String skillId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ApproveSkill'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
      },
    );
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
    required String addressBookArn,
    required String contactArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateContactWithAddressBook'
    };
    await _protocol.send(
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
    required String deviceArn,
    required String networkProfileArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateDeviceWithNetworkProfile'
    };
    await _protocol.send(
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
    String? deviceArn,
    String? roomArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateDeviceWithRoom'
    };
    await _protocol.send(
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
    String? roomArn,
    String? skillGroupArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateSkillGroupWithRoom'
    };
    await _protocol.send(
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
    required String skillId,
    String? skillGroupArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateSkillWithSkillGroup'
    };
    await _protocol.send(
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
    required String skillId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.AssociateSkillWithUsers'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
      },
    );
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
  ///
  /// Parameter [tags] :
  /// The tags to be added to the specified resource. Do not provide system
  /// tags.
  Future<CreateAddressBookResponse> createAddressBook({
    required String name,
    String? clientRequestToken,
    String? description,
    List<Tag>? tags,
  }) async {
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
        if (tags != null) 'Tags': tags,
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
    required BusinessReportContentRange contentRange,
    required BusinessReportFormat format,
    String? clientRequestToken,
    BusinessReportRecurrence? recurrence,
    String? s3BucketName,
    String? s3KeyPrefix,
    String? scheduleName,
    List<Tag>? tags,
  }) async {
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
        'Format': format.value,
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
  ///
  /// Parameter [tags] :
  /// The tags to be added to the specified resource. Do not provide system
  /// tags.
  Future<CreateConferenceProviderResponse> createConferenceProvider({
    required String conferenceProviderName,
    required ConferenceProviderType conferenceProviderType,
    required MeetingSetting meetingSetting,
    String? clientRequestToken,
    IPDialIn? iPDialIn,
    PSTNDialIn? pSTNDialIn,
    List<Tag>? tags,
  }) async {
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
        'ConferenceProviderType': conferenceProviderType.value,
        'MeetingSetting': meetingSetting,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (iPDialIn != null) 'IPDialIn': iPDialIn,
        if (pSTNDialIn != null) 'PSTNDialIn': pSTNDialIn,
        if (tags != null) 'Tags': tags,
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
  ///
  /// Parameter [tags] :
  /// The tags to be added to the specified resource. Do not provide system
  /// tags.
  Future<CreateContactResponse> createContact({
    required String firstName,
    String? clientRequestToken,
    String? displayName,
    String? lastName,
    String? phoneNumber,
    List<PhoneNumber>? phoneNumbers,
    List<SipAddress>? sipAddresses,
    List<Tag>? tags,
  }) async {
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
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateContactResponse.fromJson(jsonResponse.body);
  }

  /// Creates a gateway group with the specified details.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [name] :
  /// The name of the gateway group.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, user-specified identifier for the request that ensures
  /// idempotency.
  ///
  /// Parameter [description] :
  /// The description of the gateway group.
  ///
  /// Parameter [tags] :
  /// The tags to be added to the specified resource. Do not provide system
  /// tags.
  Future<CreateGatewayGroupResponse> createGatewayGroup({
    required String name,
    String? clientRequestToken,
    String? description,
    List<Tag>? tags,
  }) async {
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
        'Name': name,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
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
  /// Parameter [tags] :
  /// The tags to be added to the specified resource. Do not provide system
  /// tags.
  ///
  /// Parameter [trustAnchors] :
  /// The root certificates of your authentication server that is installed on
  /// your devices and used to trust your authentication server during EAP
  /// negotiation.
  Future<CreateNetworkProfileResponse> createNetworkProfile({
    required String networkProfileName,
    required NetworkSecurityType securityType,
    required String ssid,
    String? certificateAuthorityArn,
    String? clientRequestToken,
    String? currentPassword,
    String? description,
    NetworkEapMethod? eapMethod,
    String? nextPassword,
    List<Tag>? tags,
    List<String>? trustAnchors,
  }) async {
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
        'NetworkProfileName': networkProfileName,
        'SecurityType': securityType.value,
        'Ssid': ssid,
        if (certificateAuthorityArn != null)
          'CertificateAuthorityArn': certificateAuthorityArn,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (currentPassword != null) 'CurrentPassword': currentPassword,
        if (description != null) 'Description': description,
        if (eapMethod != null) 'EapMethod': eapMethod.value,
        if (nextPassword != null) 'NextPassword': nextPassword,
        if (tags != null) 'Tags': tags,
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
  /// Parameter [dataRetentionOptIn] :
  /// Whether data retention of the profile is enabled.
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
    required String address,
    required DistanceUnit distanceUnit,
    required String profileName,
    required TemperatureUnit temperatureUnit,
    required String timezone,
    required WakeWord wakeWord,
    String? clientRequestToken,
    bool? dataRetentionOptIn,
    String? locale,
    int? maxVolumeLimit,
    CreateMeetingRoomConfiguration? meetingRoomConfiguration,
    bool? pSTNEnabled,
    bool? setupModeDisabled,
    List<Tag>? tags,
  }) async {
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
        'DistanceUnit': distanceUnit.value,
        'ProfileName': profileName,
        'TemperatureUnit': temperatureUnit.value,
        'Timezone': timezone,
        'WakeWord': wakeWord.value,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (dataRetentionOptIn != null)
          'DataRetentionOptIn': dataRetentionOptIn,
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
    required String roomName,
    String? clientRequestToken,
    String? description,
    String? profileArn,
    String? providerCalendarId,
    List<Tag>? tags,
  }) async {
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
    required String skillGroupName,
    String? clientRequestToken,
    String? description,
    List<Tag>? tags,
  }) async {
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
    required String userId,
    String? clientRequestToken,
    String? email,
    String? firstName,
    String? lastName,
    List<Tag>? tags,
  }) async {
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
    required String addressBookArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteAddressBook'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressBookArn': addressBookArn,
      },
    );
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
    required String scheduleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteBusinessReportSchedule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScheduleArn': scheduleArn,
      },
    );
  }

  /// Deletes a conference provider.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [conferenceProviderArn] :
  /// The ARN of the conference provider.
  Future<void> deleteConferenceProvider({
    required String conferenceProviderArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteConferenceProvider'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConferenceProviderArn': conferenceProviderArn,
      },
    );
  }

  /// Deletes a contact by the contact ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [contactArn] :
  /// The ARN of the contact to delete.
  Future<void> deleteContact({
    required String contactArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteContact'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContactArn': contactArn,
      },
    );
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
    required String deviceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteDevice'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceArn': deviceArn,
      },
    );
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
    required String deviceArn,
    required DeviceUsageType deviceUsageType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteDeviceUsageData'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeviceArn': deviceArn,
        'DeviceUsageType': deviceUsageType.value,
      },
    );
  }

  /// Deletes a gateway group.
  ///
  /// May throw [ResourceAssociatedException].
  ///
  /// Parameter [gatewayGroupArn] :
  /// The ARN of the gateway group to delete.
  Future<void> deleteGatewayGroup({
    required String gatewayGroupArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteGatewayGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GatewayGroupArn': gatewayGroupArn,
      },
    );
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
    required String networkProfileArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteNetworkProfile'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NetworkProfileArn': networkProfileArn,
      },
    );
  }

  /// Deletes a room profile by the profile ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [profileArn] :
  /// The ARN of the room profile to delete. Required.
  Future<void> deleteProfile({
    String? profileArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteProfile'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (profileArn != null) 'ProfileArn': profileArn,
      },
    );
  }

  /// Deletes a room by the room ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [roomArn] :
  /// The ARN of the room to delete. Required.
  Future<void> deleteRoom({
    String? roomArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteRoom'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );
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
    required String parameterKey,
    required String skillId,
    String? roomArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteRoomSkillParameter'
    };
    await _protocol.send(
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
    required String skillId,
    String? roomArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteSkillAuthorization'
    };
    await _protocol.send(
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
  }

  /// Deletes a skill group by skill group ARN.
  ///
  /// May throw [NotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [skillGroupArn] :
  /// The ARN of the skill group to delete. Required.
  Future<void> deleteSkillGroup({
    String? skillGroupArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteSkillGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
      },
    );
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
    required String enrollmentId,
    String? userArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DeleteUser'
    };
    await _protocol.send(
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
  }

  /// Disassociates a contact from a given address book.
  ///
  /// Parameter [addressBookArn] :
  /// The ARN of the address from which to disassociate the contact.
  ///
  /// Parameter [contactArn] :
  /// The ARN of the contact to disassociate from an address book.
  Future<void> disassociateContactFromAddressBook({
    required String addressBookArn,
    required String contactArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DisassociateContactFromAddressBook'
    };
    await _protocol.send(
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
    String? deviceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DisassociateDeviceFromRoom'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deviceArn != null) 'DeviceArn': deviceArn,
      },
    );
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
    required String skillId,
    String? skillGroupArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DisassociateSkillFromSkillGroup'
    };
    await _protocol.send(
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
    required String skillId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DisassociateSkillFromUsers'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
      },
    );
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
    String? roomArn,
    String? skillGroupArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.DisassociateSkillGroupFromRoom'
    };
    await _protocol.send(
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
  }

  /// Forgets smart home appliances associated to a room.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [roomArn] :
  /// The room that the appliances are associated with.
  Future<void> forgetSmartHomeAppliances({
    required String roomArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.ForgetSmartHomeAppliances'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoomArn': roomArn,
      },
    );
  }

  /// Gets address the book details by the address book ARN.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [addressBookArn] :
  /// The ARN of the address book for which to request details.
  Future<GetAddressBookResponse> getAddressBook({
    required String addressBookArn,
  }) async {
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
    required String conferenceProviderArn,
  }) async {
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
    required String contactArn,
  }) async {
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
    String? deviceArn,
  }) async {
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
    required String gatewayArn,
  }) async {
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
    required String gatewayGroupArn,
  }) async {
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
    required String networkProfileArn,
  }) async {
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
    String? profileArn,
  }) async {
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
    String? roomArn,
  }) async {
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
    required String parameterKey,
    required String skillId,
    String? roomArn,
  }) async {
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
    String? skillGroupArn,
  }) async {
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    required String deviceArn,
    DeviceEventType? eventType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
        if (eventType != null) 'EventType': eventType.value,
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    String? gatewayGroupArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    EnablementTypeFilter? enablementType,
    int? maxResults,
    String? nextToken,
    String? skillGroupArn,
    SkillTypeFilter? skillType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
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
        if (enablementType != null) 'EnablementType': enablementType.value,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (skillGroupArn != null) 'SkillGroupArn': skillGroupArn,
        if (skillType != null) 'SkillType': skillType.value,
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    required int categoryId,
    int? maxResults,
    String? nextToken,
  }) async {
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
    required String roomArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    required String arn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    required ConferencePreference conferencePreference,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.PutConferencePreference'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConferencePreference': conferencePreference,
      },
    );
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
    required String organizationName,
    String? contactEmail,
    List<String>? privateSkillIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.PutInvitationConfiguration'
    };
    await _protocol.send(
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
    required RoomSkillParameter roomSkillParameter,
    required String skillId,
    String? roomArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.PutRoomSkillParameter'
    };
    await _protocol.send(
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
    required Map<String, String> authorizationResult,
    required String skillId,
    String? roomArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.PutSkillAuthorization'
    };
    await _protocol.send(
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
  /// The Amazon Resource Name (ARN) of the room with which to associate your
  /// AVS device.
  ///
  /// Parameter [tags] :
  /// The tags to be added to the specified resource. Do not provide system
  /// tags.
  Future<RegisterAVSDeviceResponse> registerAVSDevice({
    required String amazonId,
    required String clientId,
    required String productId,
    required String userCode,
    String? deviceSerialNumber,
    String? roomArn,
    List<Tag>? tags,
  }) async {
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
        if (tags != null) 'Tags': tags,
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
    required String skillId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.RejectSkill'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SkillId': skillId,
      },
    );
  }

  /// Determines the details for the room from which a skill request was
  /// invoked. This operation is used by skill developers.
  ///
  /// To query ResolveRoom from an Alexa skill, the skill ID needs to be
  /// authorized. When the skill is using an AWS Lambda function, the skill is
  /// automatically authorized when you publish your skill as a private skill to
  /// your AWS account. Skills that are hosted using a custom web service must
  /// be manually authorized. To get your skill authorized, contact AWS Support
  /// with your AWS account ID that queries the ResolveRoom API and skill ID.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [skillId] :
  /// The ARN of the skill that was requested. Required.
  ///
  /// Parameter [userId] :
  /// The ARN of the user. Required.
  Future<ResolveRoomResponse> resolveRoom({
    required String skillId,
    required String userId,
  }) async {
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
    String? enrollmentId,
    String? userArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.RevokeInvitation'
    };
    await _protocol.send(
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
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<Sort>? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<Sort>? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<Sort>? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<Sort>? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<Sort>? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<Sort>? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<Sort>? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    List<Sort>? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
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
  /// Parameter [content] :
  /// The announcement content. This can contain only one of the three possible
  /// announcement types (text, SSML or audio).
  ///
  /// Parameter [roomFilters] :
  /// The filters to use to send an announcement to a specified list of rooms.
  /// The supported filter keys are RoomName, ProfileName, RoomArn, and
  /// ProfileArn. To send to all rooms, specify an empty RoomFilters list.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique, user-specified identifier for the request that ensures
  /// idempotency.
  ///
  /// Parameter [timeToLiveInSeconds] :
  /// The time to live for an announcement. Default is 300. If delivery doesn't
  /// occur within this time, the announcement is not delivered.
  Future<SendAnnouncementResponse> sendAnnouncement({
    required Content content,
    required List<Filter> roomFilters,
    String? clientRequestToken,
    int? timeToLiveInSeconds,
  }) async {
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
        'Content': content,
        'RoomFilters': roomFilters,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
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
    String? userArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.SendInvitation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (userArn != null) 'UserArn': userArn,
      },
    );
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
    required List<Feature> features,
    String? deviceArn,
    String? roomArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.StartDeviceSync'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Features': features.map((e) => e.value).toList(),
        if (deviceArn != null) 'DeviceArn': deviceArn,
        if (roomArn != null) 'RoomArn': roomArn,
      },
    );
  }

  /// Initiates the discovery of any smart home appliances associated with the
  /// room.
  ///
  /// May throw [NotFoundException].
  ///
  /// Parameter [roomArn] :
  /// The room where smart home appliance discovery was initiated.
  Future<void> startSmartHomeApplianceDiscovery({
    required String roomArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.StartSmartHomeApplianceDiscovery'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoomArn': roomArn,
      },
    );
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
    required String arn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.TagResource'
    };
    await _protocol.send(
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
    required String arn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UntagResource'
    };
    await _protocol.send(
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
    required String addressBookArn,
    String? description,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateAddressBook'
    };
    await _protocol.send(
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
    required String scheduleArn,
    BusinessReportFormat? format,
    BusinessReportRecurrence? recurrence,
    String? s3BucketName,
    String? s3KeyPrefix,
    String? scheduleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateBusinessReportSchedule'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScheduleArn': scheduleArn,
        if (format != null) 'Format': format.value,
        if (recurrence != null) 'Recurrence': recurrence,
        if (s3BucketName != null) 'S3BucketName': s3BucketName,
        if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
        if (scheduleName != null) 'ScheduleName': scheduleName,
      },
    );
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
    required String conferenceProviderArn,
    required ConferenceProviderType conferenceProviderType,
    required MeetingSetting meetingSetting,
    IPDialIn? iPDialIn,
    PSTNDialIn? pSTNDialIn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateConferenceProvider'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConferenceProviderArn': conferenceProviderArn,
        'ConferenceProviderType': conferenceProviderType.value,
        'MeetingSetting': meetingSetting,
        if (iPDialIn != null) 'IPDialIn': iPDialIn,
        if (pSTNDialIn != null) 'PSTNDialIn': pSTNDialIn,
      },
    );
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
    required String contactArn,
    String? displayName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    List<PhoneNumber>? phoneNumbers,
    List<SipAddress>? sipAddresses,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateContact'
    };
    await _protocol.send(
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
    String? deviceArn,
    String? deviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateDevice'
    };
    await _protocol.send(
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
    required String gatewayArn,
    String? description,
    String? name,
    String? softwareVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateGateway'
    };
    await _protocol.send(
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
    required String gatewayGroupArn,
    String? description,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateGatewayGroup'
    };
    await _protocol.send(
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
    required String networkProfileArn,
    String? certificateAuthorityArn,
    String? currentPassword,
    String? description,
    String? networkProfileName,
    String? nextPassword,
    List<String>? trustAnchors,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateNetworkProfile'
    };
    await _protocol.send(
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
  /// Parameter [dataRetentionOptIn] :
  /// Whether data retention of the profile is enabled.
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
    String? address,
    bool? dataRetentionOptIn,
    DistanceUnit? distanceUnit,
    bool? isDefault,
    String? locale,
    int? maxVolumeLimit,
    UpdateMeetingRoomConfiguration? meetingRoomConfiguration,
    bool? pSTNEnabled,
    String? profileArn,
    String? profileName,
    bool? setupModeDisabled,
    TemperatureUnit? temperatureUnit,
    String? timezone,
    WakeWord? wakeWord,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateProfile'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (address != null) 'Address': address,
        if (dataRetentionOptIn != null)
          'DataRetentionOptIn': dataRetentionOptIn,
        if (distanceUnit != null) 'DistanceUnit': distanceUnit.value,
        if (isDefault != null) 'IsDefault': isDefault,
        if (locale != null) 'Locale': locale,
        if (maxVolumeLimit != null) 'MaxVolumeLimit': maxVolumeLimit,
        if (meetingRoomConfiguration != null)
          'MeetingRoomConfiguration': meetingRoomConfiguration,
        if (pSTNEnabled != null) 'PSTNEnabled': pSTNEnabled,
        if (profileArn != null) 'ProfileArn': profileArn,
        if (profileName != null) 'ProfileName': profileName,
        if (setupModeDisabled != null) 'SetupModeDisabled': setupModeDisabled,
        if (temperatureUnit != null) 'TemperatureUnit': temperatureUnit.value,
        if (timezone != null) 'Timezone': timezone,
        if (wakeWord != null) 'WakeWord': wakeWord.value,
      },
    );
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
    String? description,
    String? profileArn,
    String? providerCalendarId,
    String? roomArn,
    String? roomName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateRoom'
    };
    await _protocol.send(
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
    String? description,
    String? skillGroupArn,
    String? skillGroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AlexaForBusiness.UpdateSkillGroup'
    };
    await _protocol.send(
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
  }
}

/// An address book with attributes.
class AddressBook {
  /// The ARN of the address book.
  final String? addressBookArn;

  /// The description of the address book.
  final String? description;

  /// The name of the address book.
  final String? name;

  AddressBook({
    this.addressBookArn,
    this.description,
    this.name,
  });

  factory AddressBook.fromJson(Map<String, dynamic> json) {
    return AddressBook(
      addressBookArn: json['AddressBookArn'] as String?,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
    );
  }
}

/// Information related to an address book.
class AddressBookData {
  /// The ARN of the address book.
  final String? addressBookArn;

  /// The description of the address book.
  final String? description;

  /// The name of the address book.
  final String? name;

  AddressBookData({
    this.addressBookArn,
    this.description,
    this.name,
  });

  factory AddressBookData.fromJson(Map<String, dynamic> json) {
    return AddressBookData(
      addressBookArn: json['AddressBookArn'] as String?,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
    );
  }
}

class ApproveSkillResponse {
  ApproveSkillResponse();

  factory ApproveSkillResponse.fromJson(Map<String, dynamic> _) {
    return ApproveSkillResponse();
  }
}

class AssociateContactWithAddressBookResponse {
  AssociateContactWithAddressBookResponse();

  factory AssociateContactWithAddressBookResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateContactWithAddressBookResponse();
  }
}

class AssociateDeviceWithNetworkProfileResponse {
  AssociateDeviceWithNetworkProfileResponse();

  factory AssociateDeviceWithNetworkProfileResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateDeviceWithNetworkProfileResponse();
  }
}

class AssociateDeviceWithRoomResponse {
  AssociateDeviceWithRoomResponse();

  factory AssociateDeviceWithRoomResponse.fromJson(Map<String, dynamic> _) {
    return AssociateDeviceWithRoomResponse();
  }
}

class AssociateSkillGroupWithRoomResponse {
  AssociateSkillGroupWithRoomResponse();

  factory AssociateSkillGroupWithRoomResponse.fromJson(Map<String, dynamic> _) {
    return AssociateSkillGroupWithRoomResponse();
  }
}

class AssociateSkillWithSkillGroupResponse {
  AssociateSkillWithSkillGroupResponse();

  factory AssociateSkillWithSkillGroupResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateSkillWithSkillGroupResponse();
  }
}

class AssociateSkillWithUsersResponse {
  AssociateSkillWithUsersResponse();

  factory AssociateSkillWithUsersResponse.fromJson(Map<String, dynamic> _) {
    return AssociateSkillWithUsersResponse();
  }
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
class Audio {
  /// The locale of the audio message. Currently, en-US is supported.
  final Locale locale;

  /// The location of the audio file. Currently, S3 URLs are supported. Only S3
  /// locations comprised of safe characters are valid. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#Safe%20Characters">Safe
  /// Characters</a>.
  final String location;

  Audio({
    required this.locale,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    final locale = this.locale;
    final location = this.location;
    return {
      'Locale': locale.value,
      'Location': location,
    };
  }
}

/// Usage report with specified parameters.
class BusinessReport {
  /// The time of report delivery.
  final DateTime? deliveryTime;

  /// The download link where a user can download the report.
  final String? downloadUrl;

  /// The failure code.
  final BusinessReportFailureCode? failureCode;

  /// The S3 location of the output reports.
  final BusinessReportS3Location? s3Location;

  /// The status of the report generation execution (RUNNING, SUCCEEDED, or
  /// FAILED).
  final BusinessReportStatus? status;

  BusinessReport({
    this.deliveryTime,
    this.downloadUrl,
    this.failureCode,
    this.s3Location,
    this.status,
  });

  factory BusinessReport.fromJson(Map<String, dynamic> json) {
    return BusinessReport(
      deliveryTime: timeStampFromJson(json['DeliveryTime']),
      downloadUrl: json['DownloadUrl'] as String?,
      failureCode: (json['FailureCode'] as String?)
          ?.let(BusinessReportFailureCode.fromString),
      s3Location: json['S3Location'] != null
          ? BusinessReportS3Location.fromJson(
              json['S3Location'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(BusinessReportStatus.fromString),
    );
  }
}

/// The content range of the report.
class BusinessReportContentRange {
  /// The interval of the content range.
  final BusinessReportInterval interval;

  BusinessReportContentRange({
    required this.interval,
  });

  factory BusinessReportContentRange.fromJson(Map<String, dynamic> json) {
    return BusinessReportContentRange(
      interval: BusinessReportInterval.fromString((json['Interval'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final interval = this.interval;
    return {
      'Interval': interval.value,
    };
  }
}

enum BusinessReportFailureCode {
  accessDenied('ACCESS_DENIED'),
  noSuchBucket('NO_SUCH_BUCKET'),
  internalFailure('INTERNAL_FAILURE'),
  ;

  final String value;

  const BusinessReportFailureCode(this.value);

  static BusinessReportFailureCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum BusinessReportFailureCode'));
}

enum BusinessReportFormat {
  csv('CSV'),
  csvZip('CSV_ZIP'),
  ;

  final String value;

  const BusinessReportFormat(this.value);

  static BusinessReportFormat fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum BusinessReportFormat'));
}

enum BusinessReportInterval {
  oneDay('ONE_DAY'),
  oneWeek('ONE_WEEK'),
  thirtyDays('THIRTY_DAYS'),
  ;

  final String value;

  const BusinessReportInterval(this.value);

  static BusinessReportInterval fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum BusinessReportInterval'));
}

/// The recurrence of the reports.
class BusinessReportRecurrence {
  /// The start date.
  final String? startDate;

  BusinessReportRecurrence({
    this.startDate,
  });

  factory BusinessReportRecurrence.fromJson(Map<String, dynamic> json) {
    return BusinessReportRecurrence(
      startDate: json['StartDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final startDate = this.startDate;
    return {
      if (startDate != null) 'StartDate': startDate,
    };
  }
}

/// The S3 location of the output reports.
class BusinessReportS3Location {
  /// The S3 bucket name of the output reports.
  final String? bucketName;

  /// The path of the business report.
  final String? path;

  BusinessReportS3Location({
    this.bucketName,
    this.path,
  });

  factory BusinessReportS3Location.fromJson(Map<String, dynamic> json) {
    return BusinessReportS3Location(
      bucketName: json['BucketName'] as String?,
      path: json['Path'] as String?,
    );
  }
}

/// The schedule of the usage report.
class BusinessReportSchedule {
  /// The content range of the reports.
  final BusinessReportContentRange? contentRange;

  /// The format of the generated report (individual CSV files or zipped files of
  /// individual files).
  final BusinessReportFormat? format;

  /// The details of the last business report delivery for a specified time
  /// interval.
  final BusinessReport? lastBusinessReport;

  /// The recurrence of the reports.
  final BusinessReportRecurrence? recurrence;

  /// The S3 bucket name of the output reports.
  final String? s3BucketName;

  /// The S3 key where the report is delivered.
  final String? s3KeyPrefix;

  /// The ARN of the business report schedule.
  final String? scheduleArn;

  /// The name identifier of the schedule.
  final String? scheduleName;

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

  factory BusinessReportSchedule.fromJson(Map<String, dynamic> json) {
    return BusinessReportSchedule(
      contentRange: json['ContentRange'] != null
          ? BusinessReportContentRange.fromJson(
              json['ContentRange'] as Map<String, dynamic>)
          : null,
      format: (json['Format'] as String?)?.let(BusinessReportFormat.fromString),
      lastBusinessReport: json['LastBusinessReport'] != null
          ? BusinessReport.fromJson(
              json['LastBusinessReport'] as Map<String, dynamic>)
          : null,
      recurrence: json['Recurrence'] != null
          ? BusinessReportRecurrence.fromJson(
              json['Recurrence'] as Map<String, dynamic>)
          : null,
      s3BucketName: json['S3BucketName'] as String?,
      s3KeyPrefix: json['S3KeyPrefix'] as String?,
      scheduleArn: json['ScheduleArn'] as String?,
      scheduleName: json['ScheduleName'] as String?,
    );
  }
}

enum BusinessReportStatus {
  running('RUNNING'),
  succeeded('SUCCEEDED'),
  failed('FAILED'),
  ;

  final String value;

  const BusinessReportStatus(this.value);

  static BusinessReportStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum BusinessReportStatus'));
}

/// The skill store category that is shown. Alexa skills are assigned a specific
/// skill category during creation, such as News, Social, and Sports.
class Category {
  /// The ID of the skill store category.
  final int? categoryId;

  /// The name of the skill store category.
  final String? categoryName;

  Category({
    this.categoryId,
    this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['CategoryId'] as int?,
      categoryName: json['CategoryName'] as String?,
    );
  }
}

enum CommsProtocol {
  sip('SIP'),
  sips('SIPS'),
  h323('H323'),
  ;

  final String value;

  const CommsProtocol(this.value);

  static CommsProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CommsProtocol'));
}

/// The default conference provider that is used if no other scheduled meetings
/// are detected.
class ConferencePreference {
  /// The ARN of the default conference provider.
  final String? defaultConferenceProviderArn;

  ConferencePreference({
    this.defaultConferenceProviderArn,
  });

  factory ConferencePreference.fromJson(Map<String, dynamic> json) {
    return ConferencePreference(
      defaultConferenceProviderArn:
          json['DefaultConferenceProviderArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultConferenceProviderArn = this.defaultConferenceProviderArn;
    return {
      if (defaultConferenceProviderArn != null)
        'DefaultConferenceProviderArn': defaultConferenceProviderArn,
    };
  }
}

/// An entity that provides a conferencing solution. Alexa for Business acts as
/// the voice interface and mediator that connects users to their preferred
/// conference provider. Examples of conference providers include Amazon Chime,
/// Zoom, Cisco, and Polycom.
class ConferenceProvider {
  /// The ARN of the newly created conference provider.
  final String? arn;

  /// The IP endpoint and protocol for calling.
  final IPDialIn? iPDialIn;

  /// The meeting settings for the conference provider.
  final MeetingSetting? meetingSetting;

  /// The name of the conference provider.
  final String? name;

  /// The information for PSTN conferencing.
  final PSTNDialIn? pSTNDialIn;

  /// The type of conference providers.
  final ConferenceProviderType? type;

  ConferenceProvider({
    this.arn,
    this.iPDialIn,
    this.meetingSetting,
    this.name,
    this.pSTNDialIn,
    this.type,
  });

  factory ConferenceProvider.fromJson(Map<String, dynamic> json) {
    return ConferenceProvider(
      arn: json['Arn'] as String?,
      iPDialIn: json['IPDialIn'] != null
          ? IPDialIn.fromJson(json['IPDialIn'] as Map<String, dynamic>)
          : null,
      meetingSetting: json['MeetingSetting'] != null
          ? MeetingSetting.fromJson(
              json['MeetingSetting'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      pSTNDialIn: json['PSTNDialIn'] != null
          ? PSTNDialIn.fromJson(json['PSTNDialIn'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.let(ConferenceProviderType.fromString),
    );
  }
}

enum ConferenceProviderType {
  chime('CHIME'),
  bluejeans('BLUEJEANS'),
  fuze('FUZE'),
  googleHangouts('GOOGLE_HANGOUTS'),
  polycom('POLYCOM'),
  ringcentral('RINGCENTRAL'),
  skypeForBusiness('SKYPE_FOR_BUSINESS'),
  webex('WEBEX'),
  zoom('ZOOM'),
  custom('CUSTOM'),
  ;

  final String value;

  const ConferenceProviderType(this.value);

  static ConferenceProviderType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ConferenceProviderType'));
}

enum ConnectionStatus {
  online('ONLINE'),
  offline('OFFLINE'),
  ;

  final String value;

  const ConnectionStatus(this.value);

  static ConnectionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConnectionStatus'));
}

/// A contact with attributes.
class Contact {
  /// The ARN of the contact.
  final String? contactArn;

  /// The name of the contact to display on the console.
  final String? displayName;

  /// The first name of the contact, used to call the contact on the device.
  final String? firstName;

  /// The last name of the contact, used to call the contact on the device.
  final String? lastName;

  /// The phone number of the contact. The phone number type defaults to WORK. You
  /// can either specify PhoneNumber or PhoneNumbers. We recommend that you use
  /// PhoneNumbers, which lets you specify the phone number type and multiple
  /// numbers.
  final String? phoneNumber;

  /// The list of phone numbers for the contact.
  final List<PhoneNumber>? phoneNumbers;

  /// The list of SIP addresses for the contact.
  final List<SipAddress>? sipAddresses;

  Contact({
    this.contactArn,
    this.displayName,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.phoneNumbers,
    this.sipAddresses,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      contactArn: json['ContactArn'] as String?,
      displayName: json['DisplayName'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumbers: (json['PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      sipAddresses: (json['SipAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => SipAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Information related to a contact.
class ContactData {
  /// The ARN of the contact.
  final String? contactArn;

  /// The name of the contact to display on the console.
  final String? displayName;

  /// The first name of the contact, used to call the contact on the device.
  final String? firstName;

  /// The last name of the contact, used to call the contact on the device.
  final String? lastName;

  /// The phone number of the contact. The phone number type defaults to WORK. You
  /// can specify PhoneNumber or PhoneNumbers. We recommend that you use
  /// PhoneNumbers, which lets you specify the phone number type and multiple
  /// numbers.
  final String? phoneNumber;

  /// The list of phone numbers for the contact.
  final List<PhoneNumber>? phoneNumbers;

  /// The list of SIP addresses for the contact.
  final List<SipAddress>? sipAddresses;

  ContactData({
    this.contactArn,
    this.displayName,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.phoneNumbers,
    this.sipAddresses,
  });

  factory ContactData.fromJson(Map<String, dynamic> json) {
    return ContactData(
      contactArn: json['ContactArn'] as String?,
      displayName: json['DisplayName'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumbers: (json['PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      sipAddresses: (json['SipAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => SipAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The content definition. This can contain only one text, SSML, or audio list
/// object.
class Content {
  /// The list of audio messages.
  final List<Audio>? audioList;

  /// The list of SSML messages.
  final List<Ssml>? ssmlList;

  /// The list of text messages.
  final List<Text>? textList;

  Content({
    this.audioList,
    this.ssmlList,
    this.textList,
  });

  Map<String, dynamic> toJson() {
    final audioList = this.audioList;
    final ssmlList = this.ssmlList;
    final textList = this.textList;
    return {
      if (audioList != null) 'AudioList': audioList,
      if (ssmlList != null) 'SsmlList': ssmlList,
      if (textList != null) 'TextList': textList,
    };
  }
}

class CreateAddressBookResponse {
  /// The ARN of the newly created address book.
  final String? addressBookArn;

  CreateAddressBookResponse({
    this.addressBookArn,
  });

  factory CreateAddressBookResponse.fromJson(Map<String, dynamic> json) {
    return CreateAddressBookResponse(
      addressBookArn: json['AddressBookArn'] as String?,
    );
  }
}

class CreateBusinessReportScheduleResponse {
  /// The ARN of the business report schedule.
  final String? scheduleArn;

  CreateBusinessReportScheduleResponse({
    this.scheduleArn,
  });

  factory CreateBusinessReportScheduleResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateBusinessReportScheduleResponse(
      scheduleArn: json['ScheduleArn'] as String?,
    );
  }
}

class CreateConferenceProviderResponse {
  /// The ARN of the newly-created conference provider.
  final String? conferenceProviderArn;

  CreateConferenceProviderResponse({
    this.conferenceProviderArn,
  });

  factory CreateConferenceProviderResponse.fromJson(Map<String, dynamic> json) {
    return CreateConferenceProviderResponse(
      conferenceProviderArn: json['ConferenceProviderArn'] as String?,
    );
  }
}

class CreateContactResponse {
  /// The ARN of the newly created address book.
  final String? contactArn;

  CreateContactResponse({
    this.contactArn,
  });

  factory CreateContactResponse.fromJson(Map<String, dynamic> json) {
    return CreateContactResponse(
      contactArn: json['ContactArn'] as String?,
    );
  }
}

/// Creates settings for the end of meeting reminder feature that are applied to
/// a room profile. The end of meeting reminder enables Alexa to remind users
/// when a meeting is ending.
class CreateEndOfMeetingReminder {
  /// Whether an end of meeting reminder is enabled or not.
  final bool enabled;

  /// A range of 3 to 15 minutes that determines when the reminder begins.
  final List<int> reminderAtMinutes;

  /// The type of sound that users hear during the end of meeting reminder.
  final EndOfMeetingReminderType reminderType;

  CreateEndOfMeetingReminder({
    required this.enabled,
    required this.reminderAtMinutes,
    required this.reminderType,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final reminderAtMinutes = this.reminderAtMinutes;
    final reminderType = this.reminderType;
    return {
      'Enabled': enabled,
      'ReminderAtMinutes': reminderAtMinutes,
      'ReminderType': reminderType.value,
    };
  }
}

class CreateGatewayGroupResponse {
  /// The ARN of the created gateway group.
  final String? gatewayGroupArn;

  CreateGatewayGroupResponse({
    this.gatewayGroupArn,
  });

  factory CreateGatewayGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateGatewayGroupResponse(
      gatewayGroupArn: json['GatewayGroupArn'] as String?,
    );
  }
}

/// Creates settings for the instant booking feature that are applied to a room
/// profile. When users start their meeting with Alexa, Alexa automatically
/// books the room for the configured duration if the room is available.
class CreateInstantBooking {
  /// Duration between 15 and 240 minutes at increments of 15 that determines how
  /// long to book an available room when a meeting is started with Alexa.
  final int durationInMinutes;

  /// Whether instant booking is enabled or not.
  final bool enabled;

  CreateInstantBooking({
    required this.durationInMinutes,
    required this.enabled,
  });

  Map<String, dynamic> toJson() {
    final durationInMinutes = this.durationInMinutes;
    final enabled = this.enabled;
    return {
      'DurationInMinutes': durationInMinutes,
      'Enabled': enabled,
    };
  }
}

/// Creates meeting room settings of a room profile.
class CreateMeetingRoomConfiguration {
  final CreateEndOfMeetingReminder? endOfMeetingReminder;

  /// Settings to automatically book a room for a configured duration if it's free
  /// when joining a meeting with Alexa.
  final CreateInstantBooking? instantBooking;

  /// Settings for requiring a check in when a room is reserved. Alexa can cancel
  /// a room reservation if it's not checked into to make the room available for
  /// others. Users can check in by joining the meeting with Alexa or an AVS
  /// device, or by saying “Alexa, check in.”
  final CreateRequireCheckIn? requireCheckIn;

  /// Whether room utilization metrics are enabled or not.
  final bool? roomUtilizationMetricsEnabled;

  CreateMeetingRoomConfiguration({
    this.endOfMeetingReminder,
    this.instantBooking,
    this.requireCheckIn,
    this.roomUtilizationMetricsEnabled,
  });

  Map<String, dynamic> toJson() {
    final endOfMeetingReminder = this.endOfMeetingReminder;
    final instantBooking = this.instantBooking;
    final requireCheckIn = this.requireCheckIn;
    final roomUtilizationMetricsEnabled = this.roomUtilizationMetricsEnabled;
    return {
      if (endOfMeetingReminder != null)
        'EndOfMeetingReminder': endOfMeetingReminder,
      if (instantBooking != null) 'InstantBooking': instantBooking,
      if (requireCheckIn != null) 'RequireCheckIn': requireCheckIn,
      if (roomUtilizationMetricsEnabled != null)
        'RoomUtilizationMetricsEnabled': roomUtilizationMetricsEnabled,
    };
  }
}

class CreateNetworkProfileResponse {
  /// The ARN of the network profile associated with a device.
  final String? networkProfileArn;

  CreateNetworkProfileResponse({
    this.networkProfileArn,
  });

  factory CreateNetworkProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateNetworkProfileResponse(
      networkProfileArn: json['NetworkProfileArn'] as String?,
    );
  }
}

class CreateProfileResponse {
  /// The ARN of the newly created room profile in the response.
  final String? profileArn;

  CreateProfileResponse({
    this.profileArn,
  });

  factory CreateProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateProfileResponse(
      profileArn: json['ProfileArn'] as String?,
    );
  }
}

/// Creates settings for the require check in feature that are applied to a room
/// profile. Require check in allows a meeting room’s Alexa or AVS device to
/// prompt the user to check in; otherwise, the room will be released.
class CreateRequireCheckIn {
  /// Whether require check in is enabled or not.
  final bool enabled;

  /// Duration between 5 and 20 minutes to determine when to release the room if
  /// it's not checked into.
  final int releaseAfterMinutes;

  CreateRequireCheckIn({
    required this.enabled,
    required this.releaseAfterMinutes,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final releaseAfterMinutes = this.releaseAfterMinutes;
    return {
      'Enabled': enabled,
      'ReleaseAfterMinutes': releaseAfterMinutes,
    };
  }
}

class CreateRoomResponse {
  /// The ARN of the newly created room in the response.
  final String? roomArn;

  CreateRoomResponse({
    this.roomArn,
  });

  factory CreateRoomResponse.fromJson(Map<String, dynamic> json) {
    return CreateRoomResponse(
      roomArn: json['RoomArn'] as String?,
    );
  }
}

class CreateSkillGroupResponse {
  /// The ARN of the newly created skill group in the response.
  final String? skillGroupArn;

  CreateSkillGroupResponse({
    this.skillGroupArn,
  });

  factory CreateSkillGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateSkillGroupResponse(
      skillGroupArn: json['SkillGroupArn'] as String?,
    );
  }
}

class CreateUserResponse {
  /// The ARN of the newly created user in the response.
  final String? userArn;

  CreateUserResponse({
    this.userArn,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      userArn: json['UserArn'] as String?,
    );
  }
}

class DeleteAddressBookResponse {
  DeleteAddressBookResponse();

  factory DeleteAddressBookResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAddressBookResponse();
  }
}

class DeleteBusinessReportScheduleResponse {
  DeleteBusinessReportScheduleResponse();

  factory DeleteBusinessReportScheduleResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteBusinessReportScheduleResponse();
  }
}

class DeleteConferenceProviderResponse {
  DeleteConferenceProviderResponse();

  factory DeleteConferenceProviderResponse.fromJson(Map<String, dynamic> _) {
    return DeleteConferenceProviderResponse();
  }
}

class DeleteContactResponse {
  DeleteContactResponse();

  factory DeleteContactResponse.fromJson(Map<String, dynamic> _) {
    return DeleteContactResponse();
  }
}

class DeleteDeviceResponse {
  DeleteDeviceResponse();

  factory DeleteDeviceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDeviceResponse();
  }
}

class DeleteDeviceUsageDataResponse {
  DeleteDeviceUsageDataResponse();

  factory DeleteDeviceUsageDataResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDeviceUsageDataResponse();
  }
}

class DeleteGatewayGroupResponse {
  DeleteGatewayGroupResponse();

  factory DeleteGatewayGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGatewayGroupResponse();
  }
}

class DeleteNetworkProfileResponse {
  DeleteNetworkProfileResponse();

  factory DeleteNetworkProfileResponse.fromJson(Map<String, dynamic> _) {
    return DeleteNetworkProfileResponse();
  }
}

class DeleteProfileResponse {
  DeleteProfileResponse();

  factory DeleteProfileResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProfileResponse();
  }
}

class DeleteRoomResponse {
  DeleteRoomResponse();

  factory DeleteRoomResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRoomResponse();
  }
}

class DeleteRoomSkillParameterResponse {
  DeleteRoomSkillParameterResponse();

  factory DeleteRoomSkillParameterResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRoomSkillParameterResponse();
  }
}

class DeleteSkillAuthorizationResponse {
  DeleteSkillAuthorizationResponse();

  factory DeleteSkillAuthorizationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSkillAuthorizationResponse();
  }
}

class DeleteSkillGroupResponse {
  DeleteSkillGroupResponse();

  factory DeleteSkillGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSkillGroupResponse();
  }
}

class DeleteUserResponse {
  DeleteUserResponse();

  factory DeleteUserResponse.fromJson(Map<String, dynamic> _) {
    return DeleteUserResponse();
  }
}

/// The details about the developer that published the skill.
class DeveloperInfo {
  /// The name of the developer.
  final String? developerName;

  /// The email of the developer.
  final String? email;

  /// The URL of the privacy policy.
  final String? privacyPolicy;

  /// The website of the developer.
  final String? url;

  DeveloperInfo({
    this.developerName,
    this.email,
    this.privacyPolicy,
    this.url,
  });

  factory DeveloperInfo.fromJson(Map<String, dynamic> json) {
    return DeveloperInfo(
      developerName: json['DeveloperName'] as String?,
      email: json['Email'] as String?,
      privacyPolicy: json['PrivacyPolicy'] as String?,
      url: json['Url'] as String?,
    );
  }
}

/// A device with attributes.
class Device {
  /// The ARN of a device.
  final String? deviceArn;

  /// The name of a device.
  final String? deviceName;

  /// The serial number of a device.
  final String? deviceSerialNumber;

  /// The status of a device. If the status is not READY, check the
  /// DeviceStatusInfo value for details.
  final DeviceStatus? deviceStatus;

  /// Detailed information about a device's status.
  final DeviceStatusInfo? deviceStatusInfo;

  /// The type of a device.
  final String? deviceType;

  /// The MAC address of a device.
  final String? macAddress;

  /// Detailed information about a device's network profile.
  final DeviceNetworkProfileInfo? networkProfileInfo;

  /// The room ARN of a device.
  final String? roomArn;

  /// The software version of a device.
  final String? softwareVersion;

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

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      deviceArn: json['DeviceArn'] as String?,
      deviceName: json['DeviceName'] as String?,
      deviceSerialNumber: json['DeviceSerialNumber'] as String?,
      deviceStatus:
          (json['DeviceStatus'] as String?)?.let(DeviceStatus.fromString),
      deviceStatusInfo: json['DeviceStatusInfo'] != null
          ? DeviceStatusInfo.fromJson(
              json['DeviceStatusInfo'] as Map<String, dynamic>)
          : null,
      deviceType: json['DeviceType'] as String?,
      macAddress: json['MacAddress'] as String?,
      networkProfileInfo: json['NetworkProfileInfo'] != null
          ? DeviceNetworkProfileInfo.fromJson(
              json['NetworkProfileInfo'] as Map<String, dynamic>)
          : null,
      roomArn: json['RoomArn'] as String?,
      softwareVersion: json['SoftwareVersion'] as String?,
    );
  }
}

/// Device attributes.
class DeviceData {
  /// The time (in epoch) when the device data was created.
  final DateTime? createdTime;

  /// The ARN of a device.
  final String? deviceArn;

  /// The name of a device.
  final String? deviceName;

  /// The serial number of a device.
  final String? deviceSerialNumber;

  /// The status of a device.
  final DeviceStatus? deviceStatus;

  /// Detailed information about a device's status.
  final DeviceStatusInfo? deviceStatusInfo;

  /// The type of a device.
  final String? deviceType;

  /// The MAC address of a device.
  final String? macAddress;

  /// The ARN of the network profile associated with a device.
  final String? networkProfileArn;

  /// The name of the network profile associated with a device.
  final String? networkProfileName;

  /// The room ARN associated with a device.
  final String? roomArn;

  /// The name of the room associated with a device.
  final String? roomName;

  /// The software version of a device.
  final String? softwareVersion;

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

  factory DeviceData.fromJson(Map<String, dynamic> json) {
    return DeviceData(
      createdTime: timeStampFromJson(json['CreatedTime']),
      deviceArn: json['DeviceArn'] as String?,
      deviceName: json['DeviceName'] as String?,
      deviceSerialNumber: json['DeviceSerialNumber'] as String?,
      deviceStatus:
          (json['DeviceStatus'] as String?)?.let(DeviceStatus.fromString),
      deviceStatusInfo: json['DeviceStatusInfo'] != null
          ? DeviceStatusInfo.fromJson(
              json['DeviceStatusInfo'] as Map<String, dynamic>)
          : null,
      deviceType: json['DeviceType'] as String?,
      macAddress: json['MacAddress'] as String?,
      networkProfileArn: json['NetworkProfileArn'] as String?,
      networkProfileName: json['NetworkProfileName'] as String?,
      roomArn: json['RoomArn'] as String?,
      roomName: json['RoomName'] as String?,
      softwareVersion: json['SoftwareVersion'] as String?,
    );
  }
}

/// The list of device events.
class DeviceEvent {
  /// The time (in epoch) when the event occurred.
  final DateTime? timestamp;

  /// The type of device event.
  final DeviceEventType? type;

  /// The value of the event.
  final String? value;

  DeviceEvent({
    this.timestamp,
    this.type,
    this.value,
  });

  factory DeviceEvent.fromJson(Map<String, dynamic> json) {
    return DeviceEvent(
      timestamp: timeStampFromJson(json['Timestamp']),
      type: (json['Type'] as String?)?.let(DeviceEventType.fromString),
      value: json['Value'] as String?,
    );
  }
}

enum DeviceEventType {
  connectionStatus('CONNECTION_STATUS'),
  deviceStatus('DEVICE_STATUS'),
  ;

  final String value;

  const DeviceEventType(this.value);

  static DeviceEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DeviceEventType'));
}

/// Detailed information about a device's network profile.
class DeviceNetworkProfileInfo {
  /// The ARN of the certificate associated with a device.
  final String? certificateArn;

  /// The time (in epoch) when the certificate expires.
  final DateTime? certificateExpirationTime;

  /// The ARN of the network profile associated with a device.
  final String? networkProfileArn;

  DeviceNetworkProfileInfo({
    this.certificateArn,
    this.certificateExpirationTime,
    this.networkProfileArn,
  });

  factory DeviceNetworkProfileInfo.fromJson(Map<String, dynamic> json) {
    return DeviceNetworkProfileInfo(
      certificateArn: json['CertificateArn'] as String?,
      certificateExpirationTime:
          timeStampFromJson(json['CertificateExpirationTime']),
      networkProfileArn: json['NetworkProfileArn'] as String?,
    );
  }
}

enum DeviceStatus {
  ready('READY'),
  pending('PENDING'),
  wasOffline('WAS_OFFLINE'),
  deregistered('DEREGISTERED'),
  failed('FAILED'),
  ;

  final String value;

  const DeviceStatus(this.value);

  static DeviceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DeviceStatus'));
}

/// Details of a device’s status.
class DeviceStatusDetail {
  /// The device status detail code.
  final DeviceStatusDetailCode? code;

  /// The list of available features on the device.
  final Feature? feature;

  DeviceStatusDetail({
    this.code,
    this.feature,
  });

  factory DeviceStatusDetail.fromJson(Map<String, dynamic> json) {
    return DeviceStatusDetail(
      code: (json['Code'] as String?)?.let(DeviceStatusDetailCode.fromString),
      feature: (json['Feature'] as String?)?.let(Feature.fromString),
    );
  }
}

enum DeviceStatusDetailCode {
  deviceSoftwareUpdateNeeded('DEVICE_SOFTWARE_UPDATE_NEEDED'),
  deviceWasOffline('DEVICE_WAS_OFFLINE'),
  credentialsAccessFailure('CREDENTIALS_ACCESS_FAILURE'),
  tlsVersionMismatch('TLS_VERSION_MISMATCH'),
  associationRejection('ASSOCIATION_REJECTION'),
  authenticationFailure('AUTHENTICATION_FAILURE'),
  dhcpFailure('DHCP_FAILURE'),
  internetUnavailable('INTERNET_UNAVAILABLE'),
  dnsFailure('DNS_FAILURE'),
  unknownFailure('UNKNOWN_FAILURE'),
  certificateIssuingLimitExceeded('CERTIFICATE_ISSUING_LIMIT_EXCEEDED'),
  invalidCertificateAuthority('INVALID_CERTIFICATE_AUTHORITY'),
  networkProfileNotFound('NETWORK_PROFILE_NOT_FOUND'),
  invalidPasswordState('INVALID_PASSWORD_STATE'),
  passwordNotFound('PASSWORD_NOT_FOUND'),
  passwordManagerAccessDenied('PASSWORD_MANAGER_ACCESS_DENIED'),
  certificateAuthorityAccessDenied('CERTIFICATE_AUTHORITY_ACCESS_DENIED'),
  ;

  final String value;

  const DeviceStatusDetailCode(this.value);

  static DeviceStatusDetailCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DeviceStatusDetailCode'));
}

/// Detailed information about a device's status.
class DeviceStatusInfo {
  /// The latest available information about the connection status of a device.
  final ConnectionStatus? connectionStatus;

  /// The time (in epoch) when the device connection status changed.
  final DateTime? connectionStatusUpdatedTime;

  /// One or more device status detail descriptions.
  final List<DeviceStatusDetail>? deviceStatusDetails;

  DeviceStatusInfo({
    this.connectionStatus,
    this.connectionStatusUpdatedTime,
    this.deviceStatusDetails,
  });

  factory DeviceStatusInfo.fromJson(Map<String, dynamic> json) {
    return DeviceStatusInfo(
      connectionStatus: (json['ConnectionStatus'] as String?)
          ?.let(ConnectionStatus.fromString),
      connectionStatusUpdatedTime:
          timeStampFromJson(json['ConnectionStatusUpdatedTime']),
      deviceStatusDetails: (json['DeviceStatusDetails'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceStatusDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum DeviceUsageType {
  voice('VOICE'),
  ;

  final String value;

  const DeviceUsageType(this.value);

  static DeviceUsageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DeviceUsageType'));
}

class DisassociateContactFromAddressBookResponse {
  DisassociateContactFromAddressBookResponse();

  factory DisassociateContactFromAddressBookResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateContactFromAddressBookResponse();
  }
}

class DisassociateDeviceFromRoomResponse {
  DisassociateDeviceFromRoomResponse();

  factory DisassociateDeviceFromRoomResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateDeviceFromRoomResponse();
  }
}

class DisassociateSkillFromSkillGroupResponse {
  DisassociateSkillFromSkillGroupResponse();

  factory DisassociateSkillFromSkillGroupResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateSkillFromSkillGroupResponse();
  }
}

class DisassociateSkillFromUsersResponse {
  DisassociateSkillFromUsersResponse();

  factory DisassociateSkillFromUsersResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateSkillFromUsersResponse();
  }
}

class DisassociateSkillGroupFromRoomResponse {
  DisassociateSkillGroupFromRoomResponse();

  factory DisassociateSkillGroupFromRoomResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateSkillGroupFromRoomResponse();
  }
}

enum DistanceUnit {
  metric('METRIC'),
  imperial('IMPERIAL'),
  ;

  final String value;

  const DistanceUnit(this.value);

  static DistanceUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DistanceUnit'));
}

enum EnablementType {
  enabled('ENABLED'),
  pending('PENDING'),
  ;

  final String value;

  const EnablementType(this.value);

  static EnablementType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EnablementType'));
}

enum EnablementTypeFilter {
  enabled('ENABLED'),
  pending('PENDING'),
  ;

  final String value;

  const EnablementTypeFilter(this.value);

  static EnablementTypeFilter fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum EnablementTypeFilter'));
}

/// Settings for the end of meeting reminder feature that are applied to a room
/// profile. The end of meeting reminder enables Alexa to remind users when a
/// meeting is ending.
class EndOfMeetingReminder {
  /// Whether an end of meeting reminder is enabled or not.
  final bool? enabled;

  /// A range of 3 to 15 minutes that determines when the reminder begins.
  final List<int>? reminderAtMinutes;

  /// The type of sound that users hear during the end of meeting reminder.
  final EndOfMeetingReminderType? reminderType;

  EndOfMeetingReminder({
    this.enabled,
    this.reminderAtMinutes,
    this.reminderType,
  });

  factory EndOfMeetingReminder.fromJson(Map<String, dynamic> json) {
    return EndOfMeetingReminder(
      enabled: json['Enabled'] as bool?,
      reminderAtMinutes: (json['ReminderAtMinutes'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      reminderType: (json['ReminderType'] as String?)
          ?.let(EndOfMeetingReminderType.fromString),
    );
  }
}

enum EndOfMeetingReminderType {
  announcementTimeCheck('ANNOUNCEMENT_TIME_CHECK'),
  announcementVariableTimeLeft('ANNOUNCEMENT_VARIABLE_TIME_LEFT'),
  chime('CHIME'),
  knock('KNOCK'),
  ;

  final String value;

  const EndOfMeetingReminderType(this.value);

  static EndOfMeetingReminderType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum EndOfMeetingReminderType'));
}

enum EnrollmentStatus {
  initialized('INITIALIZED'),
  pending('PENDING'),
  registered('REGISTERED'),
  disassociating('DISASSOCIATING'),
  deregistering('DEREGISTERING'),
  ;

  final String value;

  const EnrollmentStatus(this.value);

  static EnrollmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EnrollmentStatus'));
}

enum Feature {
  bluetooth('BLUETOOTH'),
  volume('VOLUME'),
  notifications('NOTIFICATIONS'),
  lists('LISTS'),
  skills('SKILLS'),
  networkProfile('NETWORK_PROFILE'),
  settings('SETTINGS'),
  all('ALL'),
  ;

  final String value;

  const Feature(this.value);

  static Feature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Feature'));
}

/// A filter name and value pair that is used to return a more specific list of
/// results. Filters can be used to match a set of resources by various
/// criteria.
class Filter {
  /// The key of a filter.
  final String key;

  /// The values of a filter.
  final List<String> values;

  Filter({
    required this.key,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'Key': key,
      'Values': values,
    };
  }
}

class ForgetSmartHomeAppliancesResponse {
  ForgetSmartHomeAppliancesResponse();

  factory ForgetSmartHomeAppliancesResponse.fromJson(Map<String, dynamic> _) {
    return ForgetSmartHomeAppliancesResponse();
  }
}

/// The details of the gateway.
class Gateway {
  /// The ARN of the gateway.
  final String? arn;

  /// The description of the gateway.
  final String? description;

  /// The ARN of the gateway group that the gateway is associated to.
  final String? gatewayGroupArn;

  /// The name of the gateway.
  final String? name;

  /// The software version of the gateway. The gateway automatically updates its
  /// software version during normal operation.
  final String? softwareVersion;

  Gateway({
    this.arn,
    this.description,
    this.gatewayGroupArn,
    this.name,
    this.softwareVersion,
  });

  factory Gateway.fromJson(Map<String, dynamic> json) {
    return Gateway(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      gatewayGroupArn: json['GatewayGroupArn'] as String?,
      name: json['Name'] as String?,
      softwareVersion: json['SoftwareVersion'] as String?,
    );
  }
}

/// The details of the gateway group.
class GatewayGroup {
  /// The ARN of the gateway group.
  final String? arn;

  /// The description of the gateway group.
  final String? description;

  /// The name of the gateway group.
  final String? name;

  GatewayGroup({
    this.arn,
    this.description,
    this.name,
  });

  factory GatewayGroup.fromJson(Map<String, dynamic> json) {
    return GatewayGroup(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
    );
  }
}

/// The summary of a gateway group.
class GatewayGroupSummary {
  /// The ARN of the gateway group.
  final String? arn;

  /// The description of the gateway group.
  final String? description;

  /// The name of the gateway group.
  final String? name;

  GatewayGroupSummary({
    this.arn,
    this.description,
    this.name,
  });

  factory GatewayGroupSummary.fromJson(Map<String, dynamic> json) {
    return GatewayGroupSummary(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
    );
  }
}

/// The summary of a gateway.
class GatewaySummary {
  /// The ARN of the gateway.
  final String? arn;

  /// The description of the gateway.
  final String? description;

  /// The ARN of the gateway group that the gateway is associated to.
  final String? gatewayGroupArn;

  /// The name of the gateway.
  final String? name;

  /// The software version of the gateway. The gateway automatically updates its
  /// software version during normal operation.
  final String? softwareVersion;

  GatewaySummary({
    this.arn,
    this.description,
    this.gatewayGroupArn,
    this.name,
    this.softwareVersion,
  });

  factory GatewaySummary.fromJson(Map<String, dynamic> json) {
    return GatewaySummary(
      arn: json['Arn'] as String?,
      description: json['Description'] as String?,
      gatewayGroupArn: json['GatewayGroupArn'] as String?,
      name: json['Name'] as String?,
      softwareVersion: json['SoftwareVersion'] as String?,
    );
  }
}

class GetAddressBookResponse {
  /// The details of the requested address book.
  final AddressBook? addressBook;

  GetAddressBookResponse({
    this.addressBook,
  });

  factory GetAddressBookResponse.fromJson(Map<String, dynamic> json) {
    return GetAddressBookResponse(
      addressBook: json['AddressBook'] != null
          ? AddressBook.fromJson(json['AddressBook'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetConferencePreferenceResponse {
  /// The conference preference.
  final ConferencePreference? preference;

  GetConferencePreferenceResponse({
    this.preference,
  });

  factory GetConferencePreferenceResponse.fromJson(Map<String, dynamic> json) {
    return GetConferencePreferenceResponse(
      preference: json['Preference'] != null
          ? ConferencePreference.fromJson(
              json['Preference'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetConferenceProviderResponse {
  /// The conference provider.
  final ConferenceProvider? conferenceProvider;

  GetConferenceProviderResponse({
    this.conferenceProvider,
  });

  factory GetConferenceProviderResponse.fromJson(Map<String, dynamic> json) {
    return GetConferenceProviderResponse(
      conferenceProvider: json['ConferenceProvider'] != null
          ? ConferenceProvider.fromJson(
              json['ConferenceProvider'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetContactResponse {
  /// The details of the requested contact.
  final Contact? contact;

  GetContactResponse({
    this.contact,
  });

  factory GetContactResponse.fromJson(Map<String, dynamic> json) {
    return GetContactResponse(
      contact: json['Contact'] != null
          ? Contact.fromJson(json['Contact'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetDeviceResponse {
  /// The details of the device requested. Required.
  final Device? device;

  GetDeviceResponse({
    this.device,
  });

  factory GetDeviceResponse.fromJson(Map<String, dynamic> json) {
    return GetDeviceResponse(
      device: json['Device'] != null
          ? Device.fromJson(json['Device'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetGatewayGroupResponse {
  final GatewayGroup? gatewayGroup;

  GetGatewayGroupResponse({
    this.gatewayGroup,
  });

  factory GetGatewayGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetGatewayGroupResponse(
      gatewayGroup: json['GatewayGroup'] != null
          ? GatewayGroup.fromJson(json['GatewayGroup'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetGatewayResponse {
  /// The details of the gateway.
  final Gateway? gateway;

  GetGatewayResponse({
    this.gateway,
  });

  factory GetGatewayResponse.fromJson(Map<String, dynamic> json) {
    return GetGatewayResponse(
      gateway: json['Gateway'] != null
          ? Gateway.fromJson(json['Gateway'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetInvitationConfigurationResponse {
  /// The email ID of the organization or individual contact that the enrolled
  /// user can use.
  final String? contactEmail;

  /// The name of the organization sending the enrollment invite to a user.
  final String? organizationName;

  /// The list of private skill IDs that you want to recommend to the user to
  /// enable in the invitation.
  final List<String>? privateSkillIds;

  GetInvitationConfigurationResponse({
    this.contactEmail,
    this.organizationName,
    this.privateSkillIds,
  });

  factory GetInvitationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetInvitationConfigurationResponse(
      contactEmail: json['ContactEmail'] as String?,
      organizationName: json['OrganizationName'] as String?,
      privateSkillIds: (json['PrivateSkillIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

class GetNetworkProfileResponse {
  /// The network profile associated with a device.
  final NetworkProfile? networkProfile;

  GetNetworkProfileResponse({
    this.networkProfile,
  });

  factory GetNetworkProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkProfileResponse(
      networkProfile: json['NetworkProfile'] != null
          ? NetworkProfile.fromJson(
              json['NetworkProfile'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetProfileResponse {
  /// The details of the room profile requested. Required.
  final Profile? profile;

  GetProfileResponse({
    this.profile,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileResponse(
      profile: json['Profile'] != null
          ? Profile.fromJson(json['Profile'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetRoomResponse {
  /// The details of the room requested.
  final Room? room;

  GetRoomResponse({
    this.room,
  });

  factory GetRoomResponse.fromJson(Map<String, dynamic> json) {
    return GetRoomResponse(
      room: json['Room'] != null
          ? Room.fromJson(json['Room'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetRoomSkillParameterResponse {
  /// The details of the room skill parameter requested. Required.
  final RoomSkillParameter? roomSkillParameter;

  GetRoomSkillParameterResponse({
    this.roomSkillParameter,
  });

  factory GetRoomSkillParameterResponse.fromJson(Map<String, dynamic> json) {
    return GetRoomSkillParameterResponse(
      roomSkillParameter: json['RoomSkillParameter'] != null
          ? RoomSkillParameter.fromJson(
              json['RoomSkillParameter'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetSkillGroupResponse {
  /// The details of the skill group requested. Required.
  final SkillGroup? skillGroup;

  GetSkillGroupResponse({
    this.skillGroup,
  });

  factory GetSkillGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetSkillGroupResponse(
      skillGroup: json['SkillGroup'] != null
          ? SkillGroup.fromJson(json['SkillGroup'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// The IP endpoint and protocol for calling.
class IPDialIn {
  /// The protocol, including SIP, SIPS, and H323.
  final CommsProtocol commsProtocol;

  /// The IP address.
  final String endpoint;

  IPDialIn({
    required this.commsProtocol,
    required this.endpoint,
  });

  factory IPDialIn.fromJson(Map<String, dynamic> json) {
    return IPDialIn(
      commsProtocol:
          CommsProtocol.fromString((json['CommsProtocol'] as String)),
      endpoint: json['Endpoint'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final commsProtocol = this.commsProtocol;
    final endpoint = this.endpoint;
    return {
      'CommsProtocol': commsProtocol.value,
      'Endpoint': endpoint,
    };
  }
}

/// Settings for the instant booking feature that are applied to a room profile.
/// When users start their meeting with Alexa, Alexa automatically books the
/// room for the configured duration if the room is available.
class InstantBooking {
  /// Duration between 15 and 240 minutes at increments of 15 that determines how
  /// long to book an available room when a meeting is started with Alexa.
  final int? durationInMinutes;

  /// Whether instant booking is enabled or not.
  final bool? enabled;

  InstantBooking({
    this.durationInMinutes,
    this.enabled,
  });

  factory InstantBooking.fromJson(Map<String, dynamic> json) {
    return InstantBooking(
      durationInMinutes: json['DurationInMinutes'] as int?,
      enabled: json['Enabled'] as bool?,
    );
  }
}

class ListBusinessReportSchedulesResponse {
  /// The schedule of the reports.
  final List<BusinessReportSchedule>? businessReportSchedules;

  /// The token used to list the remaining schedules from the previous API call.
  final String? nextToken;

  ListBusinessReportSchedulesResponse({
    this.businessReportSchedules,
    this.nextToken,
  });

  factory ListBusinessReportSchedulesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListBusinessReportSchedulesResponse(
      businessReportSchedules: (json['BusinessReportSchedules'] as List?)
          ?.whereNotNull()
          .map(
              (e) => BusinessReportSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListConferenceProvidersResponse {
  /// The conference providers.
  final List<ConferenceProvider>? conferenceProviders;

  /// The tokens used for pagination.
  final String? nextToken;

  ListConferenceProvidersResponse({
    this.conferenceProviders,
    this.nextToken,
  });

  factory ListConferenceProvidersResponse.fromJson(Map<String, dynamic> json) {
    return ListConferenceProvidersResponse(
      conferenceProviders: (json['ConferenceProviders'] as List?)
          ?.whereNotNull()
          .map((e) => ConferenceProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListDeviceEventsResponse {
  /// The device events requested for the device ARN.
  final List<DeviceEvent>? deviceEvents;

  /// The token returned to indicate that there is more data available.
  final String? nextToken;

  ListDeviceEventsResponse({
    this.deviceEvents,
    this.nextToken,
  });

  factory ListDeviceEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListDeviceEventsResponse(
      deviceEvents: (json['DeviceEvents'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListGatewayGroupsResponse {
  /// The gateway groups in the list.
  final List<GatewayGroupSummary>? gatewayGroups;

  /// The token used to paginate though multiple pages of gateway group summaries.
  final String? nextToken;

  ListGatewayGroupsResponse({
    this.gatewayGroups,
    this.nextToken,
  });

  factory ListGatewayGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListGatewayGroupsResponse(
      gatewayGroups: (json['GatewayGroups'] as List?)
          ?.whereNotNull()
          .map((e) => GatewayGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListGatewaysResponse {
  /// The gateways in the list.
  final List<GatewaySummary>? gateways;

  /// The token used to paginate though multiple pages of gateway summaries.
  final String? nextToken;

  ListGatewaysResponse({
    this.gateways,
    this.nextToken,
  });

  factory ListGatewaysResponse.fromJson(Map<String, dynamic> json) {
    return ListGatewaysResponse(
      gateways: (json['Gateways'] as List?)
          ?.whereNotNull()
          .map((e) => GatewaySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListSkillsResponse {
  /// The token returned to indicate that there is more data available.
  final String? nextToken;

  /// The list of enabled skills requested. Required.
  final List<SkillSummary>? skillSummaries;

  ListSkillsResponse({
    this.nextToken,
    this.skillSummaries,
  });

  factory ListSkillsResponse.fromJson(Map<String, dynamic> json) {
    return ListSkillsResponse(
      nextToken: json['NextToken'] as String?,
      skillSummaries: (json['SkillSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => SkillSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListSkillsStoreCategoriesResponse {
  /// The list of categories.
  final List<Category>? categoryList;

  /// The tokens used for pagination.
  final String? nextToken;

  ListSkillsStoreCategoriesResponse({
    this.categoryList,
    this.nextToken,
  });

  factory ListSkillsStoreCategoriesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSkillsStoreCategoriesResponse(
      categoryList: (json['CategoryList'] as List?)
          ?.whereNotNull()
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListSkillsStoreSkillsByCategoryResponse {
  /// The tokens used for pagination.
  final String? nextToken;

  /// The skill store skills.
  final List<SkillsStoreSkill>? skillsStoreSkills;

  ListSkillsStoreSkillsByCategoryResponse({
    this.nextToken,
    this.skillsStoreSkills,
  });

  factory ListSkillsStoreSkillsByCategoryResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSkillsStoreSkillsByCategoryResponse(
      nextToken: json['NextToken'] as String?,
      skillsStoreSkills: (json['SkillsStoreSkills'] as List?)
          ?.whereNotNull()
          .map((e) => SkillsStoreSkill.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListSmartHomeAppliancesResponse {
  /// The tokens used for pagination.
  final String? nextToken;

  /// The smart home appliances.
  final List<SmartHomeAppliance>? smartHomeAppliances;

  ListSmartHomeAppliancesResponse({
    this.nextToken,
    this.smartHomeAppliances,
  });

  factory ListSmartHomeAppliancesResponse.fromJson(Map<String, dynamic> json) {
    return ListSmartHomeAppliancesResponse(
      nextToken: json['NextToken'] as String?,
      smartHomeAppliances: (json['SmartHomeAppliances'] as List?)
          ?.whereNotNull()
          .map((e) => SmartHomeAppliance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListTagsResponse {
  /// The token returned to indicate that there is more data available.
  final String? nextToken;

  /// The tags requested for the specified resource.
  final List<Tag>? tags;

  ListTagsResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum Locale {
  enUs('en-US'),
  ;

  final String value;

  const Locale(this.value);

  static Locale fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Locale'));
}

/// Meeting room settings of a room profile.
class MeetingRoomConfiguration {
  /// Settings for the end of meeting reminder feature that are applied to a room
  /// profile. The end of meeting reminder enables Alexa to remind users when a
  /// meeting is ending.
  final EndOfMeetingReminder? endOfMeetingReminder;

  /// Settings to automatically book the room if available for a configured
  /// duration when joining a meeting with Alexa.
  final InstantBooking? instantBooking;

  /// Settings for requiring a check in when a room is reserved. Alexa can cancel
  /// a room reservation if it's not checked into. This makes the room available
  /// for others. Users can check in by joining the meeting with Alexa or an AVS
  /// device, or by saying “Alexa, check in.”
  final RequireCheckIn? requireCheckIn;

  /// Whether room utilization metrics are enabled or not.
  final bool? roomUtilizationMetricsEnabled;

  MeetingRoomConfiguration({
    this.endOfMeetingReminder,
    this.instantBooking,
    this.requireCheckIn,
    this.roomUtilizationMetricsEnabled,
  });

  factory MeetingRoomConfiguration.fromJson(Map<String, dynamic> json) {
    return MeetingRoomConfiguration(
      endOfMeetingReminder: json['EndOfMeetingReminder'] != null
          ? EndOfMeetingReminder.fromJson(
              json['EndOfMeetingReminder'] as Map<String, dynamic>)
          : null,
      instantBooking: json['InstantBooking'] != null
          ? InstantBooking.fromJson(
              json['InstantBooking'] as Map<String, dynamic>)
          : null,
      requireCheckIn: json['RequireCheckIn'] != null
          ? RequireCheckIn.fromJson(
              json['RequireCheckIn'] as Map<String, dynamic>)
          : null,
      roomUtilizationMetricsEnabled:
          json['RoomUtilizationMetricsEnabled'] as bool?,
    );
  }
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
class MeetingSetting {
  /// The values that indicate whether the pin is always required.
  final RequirePin requirePin;

  MeetingSetting({
    required this.requirePin,
  });

  factory MeetingSetting.fromJson(Map<String, dynamic> json) {
    return MeetingSetting(
      requirePin: RequirePin.fromString((json['RequirePin'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final requirePin = this.requirePin;
    return {
      'RequirePin': requirePin.value,
    };
  }
}

enum NetworkEapMethod {
  eapTls('EAP_TLS'),
  ;

  final String value;

  const NetworkEapMethod(this.value);

  static NetworkEapMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum NetworkEapMethod'));
}

/// The network profile associated with a device.
class NetworkProfile {
  /// The ARN of the Private Certificate Authority (PCA) created in AWS
  /// Certificate Manager (ACM). This is used to issue certificates to the
  /// devices.
  final String? certificateAuthorityArn;

  /// The current password of the Wi-Fi network.
  final String? currentPassword;

  /// Detailed information about a device's network profile.
  final String? description;

  /// The authentication standard that is used in the EAP framework. Currently,
  /// EAP_TLS is supported.
  final NetworkEapMethod? eapMethod;

  /// The ARN of the network profile associated with a device.
  final String? networkProfileArn;

  /// The name of the network profile associated with a device.
  final String? networkProfileName;

  /// The next, or subsequent, password of the Wi-Fi network. This password is
  /// asynchronously transmitted to the device and is used when the password of
  /// the network changes to NextPassword.
  final String? nextPassword;

  /// The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE,
  /// WPA2_PSK, WPA_PSK, WEP, or OPEN.
  final NetworkSecurityType? securityType;

  /// The SSID of the Wi-Fi network.
  final String? ssid;

  /// The root certificates of your authentication server, which is installed on
  /// your devices and used to trust your authentication server during EAP
  /// negotiation.
  final List<String>? trustAnchors;

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

  factory NetworkProfile.fromJson(Map<String, dynamic> json) {
    return NetworkProfile(
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      currentPassword: json['CurrentPassword'] as String?,
      description: json['Description'] as String?,
      eapMethod:
          (json['EapMethod'] as String?)?.let(NetworkEapMethod.fromString),
      networkProfileArn: json['NetworkProfileArn'] as String?,
      networkProfileName: json['NetworkProfileName'] as String?,
      nextPassword: json['NextPassword'] as String?,
      securityType: (json['SecurityType'] as String?)
          ?.let(NetworkSecurityType.fromString),
      ssid: json['Ssid'] as String?,
      trustAnchors: (json['TrustAnchors'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// The data associated with a network profile.
class NetworkProfileData {
  /// The ARN of the Private Certificate Authority (PCA) created in AWS
  /// Certificate Manager (ACM). This is used to issue certificates to the
  /// devices.
  final String? certificateAuthorityArn;

  /// Detailed information about a device's network profile.
  final String? description;

  /// The authentication standard that is used in the EAP framework. Currently,
  /// EAP_TLS is supported.
  final NetworkEapMethod? eapMethod;

  /// The ARN of the network profile associated with a device.
  final String? networkProfileArn;

  /// The name of the network profile associated with a device.
  final String? networkProfileName;

  /// The security type of the Wi-Fi network. This can be WPA2_ENTERPRISE,
  /// WPA2_PSK, WPA_PSK, WEP, or OPEN.
  final NetworkSecurityType? securityType;

  /// The SSID of the Wi-Fi network.
  final String? ssid;

  NetworkProfileData({
    this.certificateAuthorityArn,
    this.description,
    this.eapMethod,
    this.networkProfileArn,
    this.networkProfileName,
    this.securityType,
    this.ssid,
  });

  factory NetworkProfileData.fromJson(Map<String, dynamic> json) {
    return NetworkProfileData(
      certificateAuthorityArn: json['CertificateAuthorityArn'] as String?,
      description: json['Description'] as String?,
      eapMethod:
          (json['EapMethod'] as String?)?.let(NetworkEapMethod.fromString),
      networkProfileArn: json['NetworkProfileArn'] as String?,
      networkProfileName: json['NetworkProfileName'] as String?,
      securityType: (json['SecurityType'] as String?)
          ?.let(NetworkSecurityType.fromString),
      ssid: json['Ssid'] as String?,
    );
  }
}

enum NetworkSecurityType {
  open('OPEN'),
  wep('WEP'),
  wpaPsk('WPA_PSK'),
  wpa2Psk('WPA2_PSK'),
  wpa2Enterprise('WPA2_ENTERPRISE'),
  ;

  final String value;

  const NetworkSecurityType(this.value);

  static NetworkSecurityType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum NetworkSecurityType'));
}

/// The information for public switched telephone network (PSTN) conferencing.
class PSTNDialIn {
  /// The zip code.
  final String countryCode;

  /// The delay duration before Alexa enters the conference ID with dual-tone
  /// multi-frequency (DTMF). Each number on the dial pad corresponds to a DTMF
  /// tone, which is how we send data over the telephone network.
  final String oneClickIdDelay;

  /// The delay duration before Alexa enters the conference pin with dual-tone
  /// multi-frequency (DTMF). Each number on the dial pad corresponds to a DTMF
  /// tone, which is how we send data over the telephone network.
  final String oneClickPinDelay;

  /// The phone number to call to join the conference.
  final String phoneNumber;

  PSTNDialIn({
    required this.countryCode,
    required this.oneClickIdDelay,
    required this.oneClickPinDelay,
    required this.phoneNumber,
  });

  factory PSTNDialIn.fromJson(Map<String, dynamic> json) {
    return PSTNDialIn(
      countryCode: json['CountryCode'] as String,
      oneClickIdDelay: json['OneClickIdDelay'] as String,
      oneClickPinDelay: json['OneClickPinDelay'] as String,
      phoneNumber: json['PhoneNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final countryCode = this.countryCode;
    final oneClickIdDelay = this.oneClickIdDelay;
    final oneClickPinDelay = this.oneClickPinDelay;
    final phoneNumber = this.phoneNumber;
    return {
      'CountryCode': countryCode,
      'OneClickIdDelay': oneClickIdDelay,
      'OneClickPinDelay': oneClickPinDelay,
      'PhoneNumber': phoneNumber,
    };
  }
}

/// The phone number for the contact containing the raw number and phone number
/// type.
class PhoneNumber {
  /// The raw value of the phone number.
  final String number;

  /// The type of the phone number.
  final PhoneNumberType type;

  PhoneNumber({
    required this.number,
    required this.type,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> json) {
    return PhoneNumber(
      number: json['Number'] as String,
      type: PhoneNumberType.fromString((json['Type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final number = this.number;
    final type = this.type;
    return {
      'Number': number,
      'Type': type.value,
    };
  }
}

enum PhoneNumberType {
  mobile('MOBILE'),
  work('WORK'),
  home('HOME'),
  ;

  final String value;

  const PhoneNumberType(this.value);

  static PhoneNumberType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PhoneNumberType'));
}

/// A room profile with attributes.
class Profile {
  /// The address of a room profile.
  final String? address;

  /// The ARN of the address book.
  final String? addressBookArn;

  /// Whether data retention of the profile is enabled.
  final bool? dataRetentionOptIn;

  /// The distance unit of a room profile.
  final DistanceUnit? distanceUnit;

  /// Retrieves if the profile is default or not.
  final bool? isDefault;

  /// The locale of a room profile. (This is currently available only to a limited
  /// preview audience.)
  final String? locale;

  /// The max volume limit of a room profile.
  final int? maxVolumeLimit;

  /// Meeting room settings of a room profile.
  final MeetingRoomConfiguration? meetingRoomConfiguration;

  /// The PSTN setting of a room profile.
  final bool? pSTNEnabled;

  /// The ARN of a room profile.
  final String? profileArn;

  /// The name of a room profile.
  final String? profileName;

  /// The setup mode of a room profile.
  final bool? setupModeDisabled;

  /// The temperature unit of a room profile.
  final TemperatureUnit? temperatureUnit;

  /// The time zone of a room profile.
  final String? timezone;

  /// The wake word of a room profile.
  final WakeWord? wakeWord;

  Profile({
    this.address,
    this.addressBookArn,
    this.dataRetentionOptIn,
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

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      address: json['Address'] as String?,
      addressBookArn: json['AddressBookArn'] as String?,
      dataRetentionOptIn: json['DataRetentionOptIn'] as bool?,
      distanceUnit:
          (json['DistanceUnit'] as String?)?.let(DistanceUnit.fromString),
      isDefault: json['IsDefault'] as bool?,
      locale: json['Locale'] as String?,
      maxVolumeLimit: json['MaxVolumeLimit'] as int?,
      meetingRoomConfiguration: json['MeetingRoomConfiguration'] != null
          ? MeetingRoomConfiguration.fromJson(
              json['MeetingRoomConfiguration'] as Map<String, dynamic>)
          : null,
      pSTNEnabled: json['PSTNEnabled'] as bool?,
      profileArn: json['ProfileArn'] as String?,
      profileName: json['ProfileName'] as String?,
      setupModeDisabled: json['SetupModeDisabled'] as bool?,
      temperatureUnit:
          (json['TemperatureUnit'] as String?)?.let(TemperatureUnit.fromString),
      timezone: json['Timezone'] as String?,
      wakeWord: (json['WakeWord'] as String?)?.let(WakeWord.fromString),
    );
  }
}

/// The data of a room profile.
class ProfileData {
  /// The address of a room profile.
  final String? address;

  /// The distance unit of a room profile.
  final DistanceUnit? distanceUnit;

  /// Retrieves if the profile data is default or not.
  final bool? isDefault;

  /// The locale of a room profile. (This is currently available only to a limited
  /// preview audience.)
  final String? locale;

  /// The ARN of a room profile.
  final String? profileArn;

  /// The name of a room profile.
  final String? profileName;

  /// The temperature unit of a room profile.
  final TemperatureUnit? temperatureUnit;

  /// The time zone of a room profile.
  final String? timezone;

  /// The wake word of a room profile.
  final WakeWord? wakeWord;

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

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      address: json['Address'] as String?,
      distanceUnit:
          (json['DistanceUnit'] as String?)?.let(DistanceUnit.fromString),
      isDefault: json['IsDefault'] as bool?,
      locale: json['Locale'] as String?,
      profileArn: json['ProfileArn'] as String?,
      profileName: json['ProfileName'] as String?,
      temperatureUnit:
          (json['TemperatureUnit'] as String?)?.let(TemperatureUnit.fromString),
      timezone: json['Timezone'] as String?,
      wakeWord: (json['WakeWord'] as String?)?.let(WakeWord.fromString),
    );
  }
}

class PutConferencePreferenceResponse {
  PutConferencePreferenceResponse();

  factory PutConferencePreferenceResponse.fromJson(Map<String, dynamic> _) {
    return PutConferencePreferenceResponse();
  }
}

class PutInvitationConfigurationResponse {
  PutInvitationConfigurationResponse();

  factory PutInvitationConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return PutInvitationConfigurationResponse();
  }
}

class PutRoomSkillParameterResponse {
  PutRoomSkillParameterResponse();

  factory PutRoomSkillParameterResponse.fromJson(Map<String, dynamic> _) {
    return PutRoomSkillParameterResponse();
  }
}

class PutSkillAuthorizationResponse {
  PutSkillAuthorizationResponse();

  factory PutSkillAuthorizationResponse.fromJson(Map<String, dynamic> _) {
    return PutSkillAuthorizationResponse();
  }
}

class RegisterAVSDeviceResponse {
  /// The ARN of the device.
  final String? deviceArn;

  RegisterAVSDeviceResponse({
    this.deviceArn,
  });

  factory RegisterAVSDeviceResponse.fromJson(Map<String, dynamic> json) {
    return RegisterAVSDeviceResponse(
      deviceArn: json['DeviceArn'] as String?,
    );
  }
}

class RejectSkillResponse {
  RejectSkillResponse();

  factory RejectSkillResponse.fromJson(Map<String, dynamic> _) {
    return RejectSkillResponse();
  }
}

/// Settings for the require check in feature that are applied to a room
/// profile. Require check in allows a meeting room’s Alexa or AVS device to
/// prompt the user to check in; otherwise, the room will be released.
class RequireCheckIn {
  /// Whether require check in is enabled or not.
  final bool? enabled;

  /// Duration between 5 and 20 minutes to determine when to release the room if
  /// it's not checked into.
  final int? releaseAfterMinutes;

  RequireCheckIn({
    this.enabled,
    this.releaseAfterMinutes,
  });

  factory RequireCheckIn.fromJson(Map<String, dynamic> json) {
    return RequireCheckIn(
      enabled: json['Enabled'] as bool?,
      releaseAfterMinutes: json['ReleaseAfterMinutes'] as int?,
    );
  }
}

enum RequirePin {
  yes('YES'),
  no('NO'),
  optional('OPTIONAL'),
  ;

  final String value;

  const RequirePin(this.value);

  static RequirePin fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum RequirePin'));
}

class ResolveRoomResponse {
  /// The ARN of the room from which the skill request was invoked.
  final String? roomArn;

  /// The name of the room from which the skill request was invoked.
  final String? roomName;

  /// Response to get the room profile request. Required.
  final List<RoomSkillParameter>? roomSkillParameters;

  ResolveRoomResponse({
    this.roomArn,
    this.roomName,
    this.roomSkillParameters,
  });

  factory ResolveRoomResponse.fromJson(Map<String, dynamic> json) {
    return ResolveRoomResponse(
      roomArn: json['RoomArn'] as String?,
      roomName: json['RoomName'] as String?,
      roomSkillParameters: (json['RoomSkillParameters'] as List?)
          ?.whereNotNull()
          .map((e) => RoomSkillParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class RevokeInvitationResponse {
  RevokeInvitationResponse();

  factory RevokeInvitationResponse.fromJson(Map<String, dynamic> _) {
    return RevokeInvitationResponse();
  }
}

/// A room with attributes.
class Room {
  /// The description of a room.
  final String? description;

  /// The profile ARN of a room.
  final String? profileArn;

  /// The provider calendar ARN of a room.
  final String? providerCalendarId;

  /// The ARN of a room.
  final String? roomArn;

  /// The name of a room.
  final String? roomName;

  Room({
    this.description,
    this.profileArn,
    this.providerCalendarId,
    this.roomArn,
    this.roomName,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      description: json['Description'] as String?,
      profileArn: json['ProfileArn'] as String?,
      providerCalendarId: json['ProviderCalendarId'] as String?,
      roomArn: json['RoomArn'] as String?,
      roomName: json['RoomName'] as String?,
    );
  }
}

/// The data of a room.
class RoomData {
  /// The description of a room.
  final String? description;

  /// The profile ARN of a room.
  final String? profileArn;

  /// The profile name of a room.
  final String? profileName;

  /// The provider calendar ARN of a room.
  final String? providerCalendarId;

  /// The ARN of a room.
  final String? roomArn;

  /// The name of a room.
  final String? roomName;

  RoomData({
    this.description,
    this.profileArn,
    this.profileName,
    this.providerCalendarId,
    this.roomArn,
    this.roomName,
  });

  factory RoomData.fromJson(Map<String, dynamic> json) {
    return RoomData(
      description: json['Description'] as String?,
      profileArn: json['ProfileArn'] as String?,
      profileName: json['ProfileName'] as String?,
      providerCalendarId: json['ProviderCalendarId'] as String?,
      roomArn: json['RoomArn'] as String?,
      roomName: json['RoomName'] as String?,
    );
  }
}

/// A skill parameter associated with a room.
class RoomSkillParameter {
  /// The parameter key of a room skill parameter. ParameterKey is an enumerated
  /// type that only takes “DEFAULT” or “SCOPE” as valid values.
  final String parameterKey;

  /// The parameter value of a room skill parameter.
  final String parameterValue;

  RoomSkillParameter({
    required this.parameterKey,
    required this.parameterValue,
  });

  factory RoomSkillParameter.fromJson(Map<String, dynamic> json) {
    return RoomSkillParameter(
      parameterKey: json['ParameterKey'] as String,
      parameterValue: json['ParameterValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterKey = this.parameterKey;
    final parameterValue = this.parameterValue;
    return {
      'ParameterKey': parameterKey,
      'ParameterValue': parameterValue,
    };
  }
}

class SearchAddressBooksResponse {
  /// The address books that meet the specified set of filter criteria, in sort
  /// order.
  final List<AddressBookData>? addressBooks;

  /// The token returned to indicate that there is more data available.
  final String? nextToken;

  /// The total number of address books returned.
  final int? totalCount;

  SearchAddressBooksResponse({
    this.addressBooks,
    this.nextToken,
    this.totalCount,
  });

  factory SearchAddressBooksResponse.fromJson(Map<String, dynamic> json) {
    return SearchAddressBooksResponse(
      addressBooks: (json['AddressBooks'] as List?)
          ?.whereNotNull()
          .map((e) => AddressBookData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      totalCount: json['TotalCount'] as int?,
    );
  }
}

class SearchContactsResponse {
  /// The contacts that meet the specified set of filter criteria, in sort order.
  final List<ContactData>? contacts;

  /// The token returned to indicate that there is more data available.
  final String? nextToken;

  /// The total number of contacts returned.
  final int? totalCount;

  SearchContactsResponse({
    this.contacts,
    this.nextToken,
    this.totalCount,
  });

  factory SearchContactsResponse.fromJson(Map<String, dynamic> json) {
    return SearchContactsResponse(
      contacts: (json['Contacts'] as List?)
          ?.whereNotNull()
          .map((e) => ContactData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      totalCount: json['TotalCount'] as int?,
    );
  }
}

class SearchDevicesResponse {
  /// The devices that meet the specified set of filter criteria, in sort order.
  final List<DeviceData>? devices;

  /// The token returned to indicate that there is more data available.
  final String? nextToken;

  /// The total number of devices returned.
  final int? totalCount;

  SearchDevicesResponse({
    this.devices,
    this.nextToken,
    this.totalCount,
  });

  factory SearchDevicesResponse.fromJson(Map<String, dynamic> json) {
    return SearchDevicesResponse(
      devices: (json['Devices'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      totalCount: json['TotalCount'] as int?,
    );
  }
}

class SearchNetworkProfilesResponse {
  /// The network profiles that meet the specified set of filter criteria, in sort
  /// order. It is a list of NetworkProfileData objects.
  final List<NetworkProfileData>? networkProfiles;

  /// An optional token returned from a prior request. Use this token for
  /// pagination of results from this action. If this parameter is specified, the
  /// response includes only results beyond the token, up to the value specified
  /// by MaxResults.
  final String? nextToken;

  /// The total number of network profiles returned.
  final int? totalCount;

  SearchNetworkProfilesResponse({
    this.networkProfiles,
    this.nextToken,
    this.totalCount,
  });

  factory SearchNetworkProfilesResponse.fromJson(Map<String, dynamic> json) {
    return SearchNetworkProfilesResponse(
      networkProfiles: (json['NetworkProfiles'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkProfileData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      totalCount: json['TotalCount'] as int?,
    );
  }
}

class SearchProfilesResponse {
  /// The token returned to indicate that there is more data available.
  final String? nextToken;

  /// The profiles that meet the specified set of filter criteria, in sort order.
  final List<ProfileData>? profiles;

  /// The total number of room profiles returned.
  final int? totalCount;

  SearchProfilesResponse({
    this.nextToken,
    this.profiles,
    this.totalCount,
  });

  factory SearchProfilesResponse.fromJson(Map<String, dynamic> json) {
    return SearchProfilesResponse(
      nextToken: json['NextToken'] as String?,
      profiles: (json['Profiles'] as List?)
          ?.whereNotNull()
          .map((e) => ProfileData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['TotalCount'] as int?,
    );
  }
}

class SearchRoomsResponse {
  /// The token returned to indicate that there is more data available.
  final String? nextToken;

  /// The rooms that meet the specified set of filter criteria, in sort order.
  final List<RoomData>? rooms;

  /// The total number of rooms returned.
  final int? totalCount;

  SearchRoomsResponse({
    this.nextToken,
    this.rooms,
    this.totalCount,
  });

  factory SearchRoomsResponse.fromJson(Map<String, dynamic> json) {
    return SearchRoomsResponse(
      nextToken: json['NextToken'] as String?,
      rooms: (json['Rooms'] as List?)
          ?.whereNotNull()
          .map((e) => RoomData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['TotalCount'] as int?,
    );
  }
}

class SearchSkillGroupsResponse {
  /// The token returned to indicate that there is more data available.
  final String? nextToken;

  /// The skill groups that meet the filter criteria, in sort order.
  final List<SkillGroupData>? skillGroups;

  /// The total number of skill groups returned.
  final int? totalCount;

  SearchSkillGroupsResponse({
    this.nextToken,
    this.skillGroups,
    this.totalCount,
  });

  factory SearchSkillGroupsResponse.fromJson(Map<String, dynamic> json) {
    return SearchSkillGroupsResponse(
      nextToken: json['NextToken'] as String?,
      skillGroups: (json['SkillGroups'] as List?)
          ?.whereNotNull()
          .map((e) => SkillGroupData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['TotalCount'] as int?,
    );
  }
}

class SearchUsersResponse {
  /// The token returned to indicate that there is more data available.
  final String? nextToken;

  /// The total number of users returned.
  final int? totalCount;

  /// The users that meet the specified set of filter criteria, in sort order.
  final List<UserData>? users;

  SearchUsersResponse({
    this.nextToken,
    this.totalCount,
    this.users,
  });

  factory SearchUsersResponse.fromJson(Map<String, dynamic> json) {
    return SearchUsersResponse(
      nextToken: json['NextToken'] as String?,
      totalCount: json['TotalCount'] as int?,
      users: (json['Users'] as List?)
          ?.whereNotNull()
          .map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SendAnnouncementResponse {
  /// The identifier of the announcement.
  final String? announcementArn;

  SendAnnouncementResponse({
    this.announcementArn,
  });

  factory SendAnnouncementResponse.fromJson(Map<String, dynamic> json) {
    return SendAnnouncementResponse(
      announcementArn: json['AnnouncementArn'] as String?,
    );
  }
}

class SendInvitationResponse {
  SendInvitationResponse();

  factory SendInvitationResponse.fromJson(Map<String, dynamic> _) {
    return SendInvitationResponse();
  }
}

/// The SIP address for the contact containing the URI and SIP address type.
class SipAddress {
  /// The type of the SIP address.
  final SipType type;

  /// The URI for the SIP address.
  final String uri;

  SipAddress({
    required this.type,
    required this.uri,
  });

  factory SipAddress.fromJson(Map<String, dynamic> json) {
    return SipAddress(
      type: SipType.fromString((json['Type'] as String)),
      uri: json['Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final uri = this.uri;
    return {
      'Type': type.value,
      'Uri': uri,
    };
  }
}

enum SipType {
  work('WORK'),
  ;

  final String value;

  const SipType(this.value);

  static SipType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum SipType'));
}

/// Granular information about the skill.
class SkillDetails {
  /// The details about what the skill supports organized as bullet points.
  final List<String>? bulletPoints;

  /// The details about the developer that published the skill.
  final DeveloperInfo? developerInfo;

  /// The URL of the end user license agreement.
  final String? endUserLicenseAgreement;

  /// The generic keywords associated with the skill that can be used to find a
  /// skill.
  final List<String>? genericKeywords;

  /// The phrase used to trigger the skill.
  final String? invocationPhrase;

  /// The updates added in bullet points.
  final List<String>? newInThisVersionBulletPoints;

  /// The description of the product.
  final String? productDescription;

  /// The date when the skill was released.
  final String? releaseDate;

  /// <i>This member has been deprecated.</i>
  ///
  /// The list of reviews for the skill, including Key and Value pair.
  final Map<String, String>? reviews;

  /// The types of skills.
  final List<String>? skillTypes;

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

  factory SkillDetails.fromJson(Map<String, dynamic> json) {
    return SkillDetails(
      bulletPoints: (json['BulletPoints'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      developerInfo: json['DeveloperInfo'] != null
          ? DeveloperInfo.fromJson(
              json['DeveloperInfo'] as Map<String, dynamic>)
          : null,
      endUserLicenseAgreement: json['EndUserLicenseAgreement'] as String?,
      genericKeywords: (json['GenericKeywords'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      invocationPhrase: json['InvocationPhrase'] as String?,
      newInThisVersionBulletPoints:
          (json['NewInThisVersionBulletPoints'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      productDescription: json['ProductDescription'] as String?,
      releaseDate: json['ReleaseDate'] as String?,
      reviews: (json['Reviews'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      skillTypes: (json['SkillTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// A skill group with attributes.
class SkillGroup {
  /// The description of a skill group.
  final String? description;

  /// The ARN of a skill group.
  final String? skillGroupArn;

  /// The name of a skill group.
  final String? skillGroupName;

  SkillGroup({
    this.description,
    this.skillGroupArn,
    this.skillGroupName,
  });

  factory SkillGroup.fromJson(Map<String, dynamic> json) {
    return SkillGroup(
      description: json['Description'] as String?,
      skillGroupArn: json['SkillGroupArn'] as String?,
      skillGroupName: json['SkillGroupName'] as String?,
    );
  }
}

/// The attributes of a skill group.
class SkillGroupData {
  /// The description of a skill group.
  final String? description;

  /// The skill group ARN of a skill group.
  final String? skillGroupArn;

  /// The skill group name of a skill group.
  final String? skillGroupName;

  SkillGroupData({
    this.description,
    this.skillGroupArn,
    this.skillGroupName,
  });

  factory SkillGroupData.fromJson(Map<String, dynamic> json) {
    return SkillGroupData(
      description: json['Description'] as String?,
      skillGroupArn: json['SkillGroupArn'] as String?,
      skillGroupName: json['SkillGroupName'] as String?,
    );
  }
}

/// The summary of skills.
class SkillSummary {
  /// Whether the skill is enabled under the user's account, or if it requires
  /// linking to be used.
  final EnablementType? enablementType;

  /// The ARN of the skill summary.
  final String? skillId;

  /// The name of the skill.
  final String? skillName;

  /// Whether the skill is publicly available or is a private skill.
  final SkillType? skillType;

  /// Linking support for a skill.
  final bool? supportsLinking;

  SkillSummary({
    this.enablementType,
    this.skillId,
    this.skillName,
    this.skillType,
    this.supportsLinking,
  });

  factory SkillSummary.fromJson(Map<String, dynamic> json) {
    return SkillSummary(
      enablementType:
          (json['EnablementType'] as String?)?.let(EnablementType.fromString),
      skillId: json['SkillId'] as String?,
      skillName: json['SkillName'] as String?,
      skillType: (json['SkillType'] as String?)?.let(SkillType.fromString),
      supportsLinking: json['SupportsLinking'] as bool?,
    );
  }
}

enum SkillType {
  public('PUBLIC'),
  private('PRIVATE'),
  ;

  final String value;

  const SkillType(this.value);

  static SkillType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SkillType'));
}

enum SkillTypeFilter {
  public('PUBLIC'),
  private('PRIVATE'),
  all('ALL'),
  ;

  final String value;

  const SkillTypeFilter(this.value);

  static SkillTypeFilter fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SkillTypeFilter'));
}

/// The detailed information about an Alexa skill.
class SkillsStoreSkill {
  /// The URL where the skill icon resides.
  final String? iconUrl;

  /// Sample utterances that interact with the skill.
  final List<String>? sampleUtterances;

  /// Short description about the skill.
  final String? shortDescription;

  /// Information about the skill.
  final SkillDetails? skillDetails;

  /// The ARN of the skill.
  final String? skillId;

  /// The name of the skill.
  final String? skillName;

  /// Linking support for a skill.
  final bool? supportsLinking;

  SkillsStoreSkill({
    this.iconUrl,
    this.sampleUtterances,
    this.shortDescription,
    this.skillDetails,
    this.skillId,
    this.skillName,
    this.supportsLinking,
  });

  factory SkillsStoreSkill.fromJson(Map<String, dynamic> json) {
    return SkillsStoreSkill(
      iconUrl: json['IconUrl'] as String?,
      sampleUtterances: (json['SampleUtterances'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      shortDescription: json['ShortDescription'] as String?,
      skillDetails: json['SkillDetails'] != null
          ? SkillDetails.fromJson(json['SkillDetails'] as Map<String, dynamic>)
          : null,
      skillId: json['SkillId'] as String?,
      skillName: json['SkillName'] as String?,
      supportsLinking: json['SupportsLinking'] as bool?,
    );
  }
}

/// A smart home appliance that can connect to a central system. Any domestic
/// device can be a smart appliance.
class SmartHomeAppliance {
  /// The description of the smart home appliance.
  final String? description;

  /// The friendly name of the smart home appliance.
  final String? friendlyName;

  /// The name of the manufacturer of the smart home appliance.
  final String? manufacturerName;

  SmartHomeAppliance({
    this.description,
    this.friendlyName,
    this.manufacturerName,
  });

  factory SmartHomeAppliance.fromJson(Map<String, dynamic> json) {
    return SmartHomeAppliance(
      description: json['Description'] as String?,
      friendlyName: json['FriendlyName'] as String?,
      manufacturerName: json['ManufacturerName'] as String?,
    );
  }
}

/// An object representing a sort criteria.
class Sort {
  /// The sort key of a sort object.
  final String key;

  /// The sort value of a sort object.
  final SortValue value;

  Sort({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value.value,
    };
  }
}

enum SortValue {
  asc('ASC'),
  desc('DESC'),
  ;

  final String value;

  const SortValue(this.value);

  static SortValue fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SortValue'));
}

/// The SSML message. For more information, see <a
/// href="https://developer.amazon.com/docs/custom-skills/speech-synthesis-markup-language-ssml-reference.html">SSML
/// Reference</a>.
class Ssml {
  /// The locale of the SSML message. Currently, en-US is supported.
  final Locale locale;

  /// The value of the SSML message in the correct SSML format. The audio tag is
  /// not supported.
  final String value;

  Ssml({
    required this.locale,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final locale = this.locale;
    final value = this.value;
    return {
      'Locale': locale.value,
      'Value': value,
    };
  }
}

class StartDeviceSyncResponse {
  StartDeviceSyncResponse();

  factory StartDeviceSyncResponse.fromJson(Map<String, dynamic> _) {
    return StartDeviceSyncResponse();
  }
}

class StartSmartHomeApplianceDiscoveryResponse {
  StartSmartHomeApplianceDiscoveryResponse();

  factory StartSmartHomeApplianceDiscoveryResponse.fromJson(
      Map<String, dynamic> _) {
    return StartSmartHomeApplianceDiscoveryResponse();
  }
}

/// A key-value pair that can be associated with a resource.
class Tag {
  /// The key of a tag. Tag keys are case-sensitive.
  final String key;

  /// The value of a tag. Tag values are case sensitive and can be null.
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

enum TemperatureUnit {
  fahrenheit('FAHRENHEIT'),
  celsius('CELSIUS'),
  ;

  final String value;

  const TemperatureUnit(this.value);

  static TemperatureUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum TemperatureUnit'));
}

/// The text message.
class Text {
  /// The locale of the text message. Currently, en-US is supported.
  final Locale locale;

  /// The value of the text message.
  final String value;

  Text({
    required this.locale,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final locale = this.locale;
    final value = this.value;
    return {
      'Locale': locale.value,
      'Value': value,
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateAddressBookResponse {
  UpdateAddressBookResponse();

  factory UpdateAddressBookResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAddressBookResponse();
  }
}

class UpdateBusinessReportScheduleResponse {
  UpdateBusinessReportScheduleResponse();

  factory UpdateBusinessReportScheduleResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateBusinessReportScheduleResponse();
  }
}

class UpdateConferenceProviderResponse {
  UpdateConferenceProviderResponse();

  factory UpdateConferenceProviderResponse.fromJson(Map<String, dynamic> _) {
    return UpdateConferenceProviderResponse();
  }
}

class UpdateContactResponse {
  UpdateContactResponse();

  factory UpdateContactResponse.fromJson(Map<String, dynamic> _) {
    return UpdateContactResponse();
  }
}

class UpdateDeviceResponse {
  UpdateDeviceResponse();

  factory UpdateDeviceResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDeviceResponse();
  }
}

/// Settings for the end of meeting reminder feature that are applied to a room
/// profile. The end of meeting reminder enables Alexa to remind users when a
/// meeting is ending.
class UpdateEndOfMeetingReminder {
  /// Whether an end of meeting reminder is enabled or not.
  final bool? enabled;

  /// Updates settings for the end of meeting reminder feature that are applied to
  /// a room profile. The end of meeting reminder enables Alexa to remind users
  /// when a meeting is ending.
  final List<int>? reminderAtMinutes;

  /// The type of sound that users hear during the end of meeting reminder.
  final EndOfMeetingReminderType? reminderType;

  UpdateEndOfMeetingReminder({
    this.enabled,
    this.reminderAtMinutes,
    this.reminderType,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final reminderAtMinutes = this.reminderAtMinutes;
    final reminderType = this.reminderType;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (reminderAtMinutes != null) 'ReminderAtMinutes': reminderAtMinutes,
      if (reminderType != null) 'ReminderType': reminderType.value,
    };
  }
}

class UpdateGatewayGroupResponse {
  UpdateGatewayGroupResponse();

  factory UpdateGatewayGroupResponse.fromJson(Map<String, dynamic> _) {
    return UpdateGatewayGroupResponse();
  }
}

class UpdateGatewayResponse {
  UpdateGatewayResponse();

  factory UpdateGatewayResponse.fromJson(Map<String, dynamic> _) {
    return UpdateGatewayResponse();
  }
}

/// Updates settings for the instant booking feature that are applied to a room
/// profile. If instant booking is enabled, Alexa automatically reserves a room
/// if it is free when a user joins a meeting with Alexa.
class UpdateInstantBooking {
  /// Duration between 15 and 240 minutes at increments of 15 that determines how
  /// long to book an available room when a meeting is started with Alexa.
  final int? durationInMinutes;

  /// Whether instant booking is enabled or not.
  final bool? enabled;

  UpdateInstantBooking({
    this.durationInMinutes,
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    final durationInMinutes = this.durationInMinutes;
    final enabled = this.enabled;
    return {
      if (durationInMinutes != null) 'DurationInMinutes': durationInMinutes,
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Updates meeting room settings of a room profile.
class UpdateMeetingRoomConfiguration {
  /// Settings for the end of meeting reminder feature that are applied to a room
  /// profile. The end of meeting reminder enables Alexa to remind users when a
  /// meeting is ending.
  final UpdateEndOfMeetingReminder? endOfMeetingReminder;

  /// Settings to automatically book an available room available for a configured
  /// duration when joining a meeting with Alexa.
  final UpdateInstantBooking? instantBooking;

  /// Settings for requiring a check in when a room is reserved. Alexa can cancel
  /// a room reservation if it's not checked into to make the room available for
  /// others. Users can check in by joining the meeting with Alexa or an AVS
  /// device, or by saying “Alexa, check in.”
  final UpdateRequireCheckIn? requireCheckIn;

  /// Whether room utilization metrics are enabled or not.
  final bool? roomUtilizationMetricsEnabled;

  UpdateMeetingRoomConfiguration({
    this.endOfMeetingReminder,
    this.instantBooking,
    this.requireCheckIn,
    this.roomUtilizationMetricsEnabled,
  });

  Map<String, dynamic> toJson() {
    final endOfMeetingReminder = this.endOfMeetingReminder;
    final instantBooking = this.instantBooking;
    final requireCheckIn = this.requireCheckIn;
    final roomUtilizationMetricsEnabled = this.roomUtilizationMetricsEnabled;
    return {
      if (endOfMeetingReminder != null)
        'EndOfMeetingReminder': endOfMeetingReminder,
      if (instantBooking != null) 'InstantBooking': instantBooking,
      if (requireCheckIn != null) 'RequireCheckIn': requireCheckIn,
      if (roomUtilizationMetricsEnabled != null)
        'RoomUtilizationMetricsEnabled': roomUtilizationMetricsEnabled,
    };
  }
}

class UpdateNetworkProfileResponse {
  UpdateNetworkProfileResponse();

  factory UpdateNetworkProfileResponse.fromJson(Map<String, dynamic> _) {
    return UpdateNetworkProfileResponse();
  }
}

class UpdateProfileResponse {
  UpdateProfileResponse();

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> _) {
    return UpdateProfileResponse();
  }
}

/// Updates settings for the require check in feature that are applied to a room
/// profile. Require check in allows a meeting room’s Alexa or AVS device to
/// prompt the user to check in; otherwise, the room will be released.
class UpdateRequireCheckIn {
  /// Whether require check in is enabled or not.
  final bool? enabled;

  /// Duration between 5 and 20 minutes to determine when to release the room if
  /// it's not checked into.
  final int? releaseAfterMinutes;

  UpdateRequireCheckIn({
    this.enabled,
    this.releaseAfterMinutes,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final releaseAfterMinutes = this.releaseAfterMinutes;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (releaseAfterMinutes != null)
        'ReleaseAfterMinutes': releaseAfterMinutes,
    };
  }
}

class UpdateRoomResponse {
  UpdateRoomResponse();

  factory UpdateRoomResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRoomResponse();
  }
}

class UpdateSkillGroupResponse {
  UpdateSkillGroupResponse();

  factory UpdateSkillGroupResponse.fromJson(Map<String, dynamic> _) {
    return UpdateSkillGroupResponse();
  }
}

/// Information related to a user.
class UserData {
  /// The email of a user.
  final String? email;

  /// The enrollment ARN of a user.
  final String? enrollmentId;

  /// The enrollment status of a user.
  final EnrollmentStatus? enrollmentStatus;

  /// The first name of a user.
  final String? firstName;

  /// The last name of a user.
  final String? lastName;

  /// The ARN of a user.
  final String? userArn;

  UserData({
    this.email,
    this.enrollmentId,
    this.enrollmentStatus,
    this.firstName,
    this.lastName,
    this.userArn,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['Email'] as String?,
      enrollmentId: json['EnrollmentId'] as String?,
      enrollmentStatus: (json['EnrollmentStatus'] as String?)
          ?.let(EnrollmentStatus.fromString),
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      userArn: json['UserArn'] as String?,
    );
  }
}

enum WakeWord {
  alexa('ALEXA'),
  amazon('AMAZON'),
  echo('ECHO'),
  computer('COMPUTER'),
  ;

  final String value;

  const WakeWord(this.value);

  static WakeWord fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum WakeWord'));
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class DeviceNotRegisteredException extends _s.GenericAwsException {
  DeviceNotRegisteredException({String? type, String? message})
      : super(
            type: type, code: 'DeviceNotRegisteredException', message: message);
}

class InvalidCertificateAuthorityException extends _s.GenericAwsException {
  InvalidCertificateAuthorityException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCertificateAuthorityException',
            message: message);
}

class InvalidDeviceException extends _s.GenericAwsException {
  InvalidDeviceException({String? type, String? message})
      : super(type: type, code: 'InvalidDeviceException', message: message);
}

class InvalidSecretsManagerResourceException extends _s.GenericAwsException {
  InvalidSecretsManagerResourceException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidSecretsManagerResourceException',
            message: message);
}

class InvalidServiceLinkedRoleStateException extends _s.GenericAwsException {
  InvalidServiceLinkedRoleStateException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidServiceLinkedRoleStateException',
            message: message);
}

class InvalidUserStatusException extends _s.GenericAwsException {
  InvalidUserStatusException({String? type, String? message})
      : super(type: type, code: 'InvalidUserStatusException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NameInUseException extends _s.GenericAwsException {
  NameInUseException({String? type, String? message})
      : super(type: type, code: 'NameInUseException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceAssociatedException extends _s.GenericAwsException {
  ResourceAssociatedException({String? type, String? message})
      : super(
            type: type, code: 'ResourceAssociatedException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class SkillNotLinkedException extends _s.GenericAwsException {
  SkillNotLinkedException({String? type, String? message})
      : super(type: type, code: 'SkillNotLinkedException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
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
