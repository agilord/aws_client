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

/// The Amazon Chime SDK meetings APIs in this section allow software developers
/// to create Amazon Chime SDK meetings, set the Amazon Web Services Regions for
/// meetings, create and manage users, and send and receive meeting
/// notifications. For more information about the meeting APIs, see <a
/// href="https://docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Meetings.html">Amazon
/// Chime SDK meetings</a>.
class ChimeSdkMeetings {
  final _s.RestJsonProtocol _protocol;
  ChimeSdkMeetings({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'meetings-chime',
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

  /// Creates up to 100 attendees for an active Amazon Chime SDK meeting. For
  /// more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [UnprocessableEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [attendees] :
  /// The attendee information, including attendees' IDs and join tokens.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK ID of the meeting to which you're adding attendees.
  Future<BatchCreateAttendeeResponse> batchCreateAttendee({
    required List<CreateAttendeeRequestItem> attendees,
    required String meetingId,
  }) async {
    final $payload = <String, dynamic>{
      'Attendees': attendees,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees?operation=batch-create',
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateAttendeeResponse.fromJson(response);
  }

  /// Updates <code>AttendeeCapabilities</code> except the capabilities listed
  /// in an <code>ExcludedAttendeeIds</code> table.
  /// <note>
  /// You use the capabilities with a set of values that control what the
  /// capabilities can do, such as <code>SendReceive</code> data. For more
  /// information about those values, see .
  /// </note>
  /// When using capabilities, be aware of these corner cases:
  ///
  /// <ul>
  /// <li>
  /// If you specify <code>MeetingFeatures:Video:MaxResolution:None</code> when
  /// you create a meeting, all API requests that include
  /// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
  /// <code>AttendeeCapabilities:Video</code> will be rejected with
  /// <code>ValidationError 400</code>.
  /// </li>
  /// <li>
  /// If you specify <code>MeetingFeatures:Content:MaxResolution:None</code>
  /// when you create a meeting, all API requests that include
  /// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
  /// <code>AttendeeCapabilities:Content</code> will be rejected with
  /// <code>ValidationError 400</code>.
  /// </li>
  /// <li>
  /// You can't set <code>content</code> capabilities to
  /// <code>SendReceive</code> or <code>Receive</code> unless you also set
  /// <code>video</code> capabilities to <code>SendReceive</code> or
  /// <code>Receive</code>. If you don't set the <code>video</code> capability
  /// to receive, the response will contain an HTTP 400 Bad Request status code.
  /// However, you can set your <code>video</code> capability to receive and you
  /// set your <code>content</code> capability to not receive.
  /// </li>
  /// <li>
  /// When you change an <code>audio</code> capability from <code>None</code> or
  /// <code>Receive</code> to <code>Send</code> or <code>SendReceive</code> ,
  /// and if the attendee left their microphone unmuted, audio will flow from
  /// the attendee to the other meeting participants.
  /// </li>
  /// <li>
  /// When you change a <code>video</code> or <code>content</code> capability
  /// from <code>None</code> or <code>Receive</code> to <code>Send</code> or
  /// <code>SendReceive</code> , and if the attendee turned on their video or
  /// content streams, remote attendees can receive those streams, but only
  /// after media renegotiation between the client and the Amazon Chime back-end
  /// server.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [capabilities] :
  /// The capabilities (<code>audio</code>, <code>video</code>, or
  /// <code>content</code>) that you want to update.
  ///
  /// Parameter [excludedAttendeeIds] :
  /// The <code>AttendeeIDs</code> that you want to exclude from one or more
  /// capabilities.
  ///
  /// Parameter [meetingId] :
  /// The ID of the meeting associated with the update request.
  Future<void> batchUpdateAttendeeCapabilitiesExcept({
    required AttendeeCapabilities capabilities,
    required List<AttendeeIdItem> excludedAttendeeIds,
    required String meetingId,
  }) async {
    final $payload = <String, dynamic>{
      'Capabilities': capabilities,
      'ExcludedAttendeeIds': excludedAttendeeIds,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees/capabilities?operation=batch-update-except',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new attendee for an active Amazon Chime SDK meeting. For more
  /// information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [UnprocessableEntityException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [externalUserId] :
  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application.
  ///
  /// Pattern: <code>[-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]*</code>
  ///
  /// Values that begin with <code>aws:</code> are reserved. You can't configure
  /// a value that uses this prefix.
  ///
  /// Parameter [meetingId] :
  /// The unique ID of the meeting.
  ///
  /// Parameter [capabilities] :
  /// The capabilities (<code>audio</code>, <code>video</code>, or
  /// <code>content</code>) that you want to grant an attendee. If you don't
  /// specify capabilities, all users have send and receive capabilities on all
  /// media channels by default.
  /// <note>
  /// You use the capabilities with a set of values that control what the
  /// capabilities can do, such as <code>SendReceive</code> data. For more
  /// information about those values, see .
  /// </note>
  /// When using capabilities, be aware of these corner cases:
  ///
  /// <ul>
  /// <li>
  /// If you specify <code>MeetingFeatures:Video:MaxResolution:None</code> when
  /// you create a meeting, all API requests that include
  /// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
  /// <code>AttendeeCapabilities:Video</code> will be rejected with
  /// <code>ValidationError 400</code>.
  /// </li>
  /// <li>
  /// If you specify <code>MeetingFeatures:Content:MaxResolution:None</code>
  /// when you create a meeting, all API requests that include
  /// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
  /// <code>AttendeeCapabilities:Content</code> will be rejected with
  /// <code>ValidationError 400</code>.
  /// </li>
  /// <li>
  /// You can't set <code>content</code> capabilities to
  /// <code>SendReceive</code> or <code>Receive</code> unless you also set
  /// <code>video</code> capabilities to <code>SendReceive</code> or
  /// <code>Receive</code>. If you don't set the <code>video</code> capability
  /// to receive, the response will contain an HTTP 400 Bad Request status code.
  /// However, you can set your <code>video</code> capability to receive and you
  /// set your <code>content</code> capability to not receive.
  /// </li>
  /// <li>
  /// When you change an <code>audio</code> capability from <code>None</code> or
  /// <code>Receive</code> to <code>Send</code> or <code>SendReceive</code> ,
  /// and if the attendee left their microphone unmuted, audio will flow from
  /// the attendee to the other meeting participants.
  /// </li>
  /// <li>
  /// When you change a <code>video</code> or <code>content</code> capability
  /// from <code>None</code> or <code>Receive</code> to <code>Send</code> or
  /// <code>SendReceive</code> , and if the attendee turned on their video or
  /// content streams, remote attendees can receive those streams, but only
  /// after media renegotiation between the client and the Amazon Chime back-end
  /// server.
  /// </li>
  /// </ul>
  Future<CreateAttendeeResponse> createAttendee({
    required String externalUserId,
    required String meetingId,
    AttendeeCapabilities? capabilities,
  }) async {
    final $payload = <String, dynamic>{
      'ExternalUserId': externalUserId,
      if (capabilities != null) 'Capabilities': capabilities,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}/attendees',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAttendeeResponse.fromJson(response);
  }

  /// Creates a new Amazon Chime SDK meeting in the specified media Region with
  /// no initial attendees. For more information about specifying media Regions,
  /// see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html">Amazon
  /// Chime SDK Media Regions</a> in the <i>Amazon Chime Developer Guide</i>.
  /// For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [externalMeetingId] :
  /// The external meeting ID.
  ///
  /// Pattern: <code>[-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]*</code>
  ///
  /// Values that begin with <code>aws:</code> are reserved. You can't configure
  /// a value that uses this prefix. Case insensitive.
  ///
  /// Parameter [mediaRegion] :
  /// The Region in which to create the meeting.
  ///
  /// Available values: <code>af-south-1</code>, <code>ap-northeast-1</code>,
  /// <code>ap-northeast-2</code>, <code>ap-south-1</code>,
  /// <code>ap-southeast-1</code>, <code>ap-southeast-2</code>,
  /// <code>ca-central-1</code>, <code>eu-central-1</code>,
  /// <code>eu-north-1</code>, <code>eu-south-1</code>, <code>eu-west-1</code>,
  /// <code>eu-west-2</code>, <code>eu-west-3</code>, <code>sa-east-1</code>,
  /// <code>us-east-1</code>, <code>us-east-2</code>, <code>us-west-1</code>,
  /// <code>us-west-2</code>.
  ///
  /// Available values in Amazon Web Services GovCloud (US) Regions:
  /// <code>us-gov-east-1</code>, <code>us-gov-west-1</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. Use a different token for
  /// different meetings.
  ///
  /// Parameter [meetingFeatures] :
  /// Lists the audio and video features enabled for a meeting, such as echo
  /// reduction.
  ///
  /// Parameter [meetingHostId] :
  /// Reserved.
  ///
  /// Parameter [notificationsConfiguration] :
  /// The configuration for resource targets to receive notifications when
  /// meeting and attendee events occur.
  ///
  /// Parameter [primaryMeetingId] :
  /// When specified, replicates the media from the primary meeting to the new
  /// meeting.
  ///
  /// Parameter [tags] :
  /// Applies one or more tags to an Amazon Chime SDK meeting. Note the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Not all resources have tags. For a list of services with resources that
  /// support tagging using this operation, see <a
  /// href="https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/supported-services.html">Services
  /// that support the Resource Groups Tagging API</a>. If the resource doesn't
  /// yet support this operation, the resource's service might support tagging
  /// using its own API operations. For more information, refer to the
  /// documentation for that service.
  /// </li>
  /// <li>
  /// Each resource can have up to 50 tags. For other limits, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html#tag-conventions">Tag
  /// Naming and Usage Conventions</a> in the <i>AWS General Reference</i>.
  /// </li>
  /// <li>
  /// You can only tag resources that are located in the specified Amazon Web
  /// Services Region for the Amazon Web Services account.
  /// </li>
  /// <li>
  /// To add tags to a resource, you need the necessary permissions for the
  /// service that the resource belongs to as well as permissions for adding
  /// tags. For more information, see the documentation for each service.
  /// </li>
  /// </ul> <important>
  /// Do not store personally identifiable information (PII) or other
  /// confidential or sensitive information in tags. We use tags to provide you
  /// with billing and administration services. Tags are not intended to be used
  /// for private or sensitive data.
  /// </important>
  /// <b>Minimum permissions</b>
  ///
  /// In addition to the <code>tag:TagResources</code> permission required by
  /// this operation, you must also have the tagging permission defined by the
  /// service that created the resource. For example, to tag a
  /// <code>ChimeSDKMeetings</code> instance using the <code>TagResources</code>
  /// operation, you must have both of the following permissions:
  ///
  /// <code>tag:TagResources</code>
  ///
  /// <code>ChimeSDKMeetings:CreateTags</code>
  /// <note>
  /// Some services might have specific requirements for tagging some resources.
  /// For example, to tag an Amazon S3 bucket, you must also have the
  /// <code>s3:GetBucketTagging</code> permission. If the expected minimum
  /// permissions don't work, check the documentation for that service's tagging
  /// APIs for more information.
  /// </note>
  ///
  /// Parameter [tenantIds] :
  /// A consistent and opaque identifier, created and maintained by the builder
  /// to represent a segment of their users.
  Future<CreateMeetingResponse> createMeeting({
    required String externalMeetingId,
    required String mediaRegion,
    String? clientRequestToken,
    MeetingFeaturesConfiguration? meetingFeatures,
    String? meetingHostId,
    NotificationsConfiguration? notificationsConfiguration,
    String? primaryMeetingId,
    List<Tag>? tags,
    List<String>? tenantIds,
  }) async {
    final $payload = <String, dynamic>{
      'ExternalMeetingId': externalMeetingId,
      'MediaRegion': mediaRegion,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (meetingFeatures != null) 'MeetingFeatures': meetingFeatures,
      if (meetingHostId != null) 'MeetingHostId': meetingHostId,
      if (notificationsConfiguration != null)
        'NotificationsConfiguration': notificationsConfiguration,
      if (primaryMeetingId != null) 'PrimaryMeetingId': primaryMeetingId,
      if (tags != null) 'Tags': tags,
      if (tenantIds != null) 'TenantIds': tenantIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/meetings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMeetingResponse.fromJson(response);
  }

  /// Creates a new Amazon Chime SDK meeting in the specified media Region, with
  /// attendees. For more information about specifying media Regions, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html">Amazon
  /// Chime SDK Media Regions</a> in the <i>Amazon Chime Developer Guide</i>.
  /// For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [attendees] :
  /// The attendee information, including attendees' IDs and join tokens.
  ///
  /// Parameter [externalMeetingId] :
  /// The external meeting ID.
  ///
  /// Pattern: <code>[-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]*</code>
  ///
  /// Values that begin with <code>aws:</code> are reserved. You can't configure
  /// a value that uses this prefix. Case insensitive.
  ///
  /// Parameter [mediaRegion] :
  /// The Region in which to create the meeting.
  ///
  /// Available values: <code>af-south-1</code>, <code>ap-northeast-1</code>,
  /// <code>ap-northeast-2</code>, <code>ap-south-1</code>,
  /// <code>ap-southeast-1</code>, <code>ap-southeast-2</code>,
  /// <code>ca-central-1</code>, <code>eu-central-1</code>,
  /// <code>eu-north-1</code>, <code>eu-south-1</code>, <code>eu-west-1</code>,
  /// <code>eu-west-2</code>, <code>eu-west-3</code>, <code>sa-east-1</code>,
  /// <code>us-east-1</code>, <code>us-east-2</code>, <code>us-west-1</code>,
  /// <code>us-west-2</code>.
  ///
  /// Available values in Amazon Web Services GovCloud (US) Regions:
  /// <code>us-gov-east-1</code>, <code>us-gov-west-1</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. Use a different token for
  /// different meetings.
  ///
  /// Parameter [meetingFeatures] :
  /// Lists the audio and video features enabled for a meeting, such as echo
  /// reduction.
  ///
  /// Parameter [meetingHostId] :
  /// Reserved.
  ///
  /// Parameter [notificationsConfiguration] :
  /// The configuration for resource targets to receive notifications when
  /// meeting and attendee events occur.
  ///
  /// Parameter [primaryMeetingId] :
  /// When specified, replicates the media from the primary meeting to the new
  /// meeting.
  ///
  /// Parameter [tags] :
  /// The tags in the request.
  ///
  /// Parameter [tenantIds] :
  /// A consistent and opaque identifier, created and maintained by the builder
  /// to represent a segment of their users.
  Future<CreateMeetingWithAttendeesResponse> createMeetingWithAttendees({
    required List<CreateAttendeeRequestItem> attendees,
    required String externalMeetingId,
    required String mediaRegion,
    String? clientRequestToken,
    MeetingFeaturesConfiguration? meetingFeatures,
    String? meetingHostId,
    NotificationsConfiguration? notificationsConfiguration,
    String? primaryMeetingId,
    List<Tag>? tags,
    List<String>? tenantIds,
  }) async {
    final $payload = <String, dynamic>{
      'Attendees': attendees,
      'ExternalMeetingId': externalMeetingId,
      'MediaRegion': mediaRegion,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (meetingFeatures != null) 'MeetingFeatures': meetingFeatures,
      if (meetingHostId != null) 'MeetingHostId': meetingHostId,
      if (notificationsConfiguration != null)
        'NotificationsConfiguration': notificationsConfiguration,
      if (primaryMeetingId != null) 'PrimaryMeetingId': primaryMeetingId,
      if (tags != null) 'Tags': tags,
      if (tenantIds != null) 'TenantIds': tenantIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/meetings?operation=create-attendees',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMeetingWithAttendeesResponse.fromJson(response);
  }

  /// Deletes an attendee from the specified Amazon Chime SDK meeting and
  /// deletes their <code>JoinToken</code>. Attendees are automatically deleted
  /// when a Amazon Chime SDK meeting is deleted. For more information about the
  /// Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [attendeeId] :
  /// The Amazon Chime SDK attendee ID.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  Future<void> deleteAttendee({
    required String attendeeId,
    required String meetingId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees/${Uri.encodeComponent(attendeeId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified Amazon Chime SDK meeting. The operation deletes all
  /// attendees, disconnects all clients, and prevents new clients from joining
  /// the meeting. For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  Future<void> deleteMeeting({
    required String meetingId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the Amazon Chime SDK attendee details for a specified meeting ID and
  /// attendee ID. For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [attendeeId] :
  /// The Amazon Chime SDK attendee ID.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  Future<GetAttendeeResponse> getAttendee({
    required String attendeeId,
    required String meetingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees/${Uri.encodeComponent(attendeeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAttendeeResponse.fromJson(response);
  }

  /// Gets the Amazon Chime SDK meeting details for the specified meeting ID.
  /// For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  Future<GetMeetingResponse> getMeeting({
    required String meetingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMeetingResponse.fromJson(response);
  }

  /// Lists the attendees for the specified Amazon Chime SDK meeting. For more
  /// information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  Future<ListAttendeesResponse> listAttendees({
    required String meetingId,
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
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}/attendees',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAttendeesResponse.fromJson(response);
  }

  /// Returns a list of the tags available for the specified resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource.
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

  /// Starts transcription for the specified <code>meetingId</code>. For more
  /// information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meeting-transcription.html">
  /// Using Amazon Chime SDK live transcription </a> in the <i>Amazon Chime SDK
  /// Developer Guide</i>.
  ///
  /// If you specify an invalid configuration, a <code>TranscriptFailed</code>
  /// event will be sent with the contents of the
  /// <code>BadRequestException</code> generated by Amazon Transcribe. For more
  /// information on each parameter and which combinations are valid, refer to
  /// the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/API_streaming_StartStreamTranscription.html">StartStreamTranscription</a>
  /// API in the <i>Amazon Transcribe Developer Guide</i>.
  /// <note>
  /// By default, Amazon Transcribe may use and store audio content processed by
  /// the service to develop and improve Amazon Web Services AI/ML services as
  /// further described in section 50 of the <a
  /// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a>. Using Amazon Transcribe may be subject to federal and state
  /// laws or regulations regarding the recording or interception of electronic
  /// communications. It is your and your end users’ responsibility to comply
  /// with all applicable laws regarding the recording, including properly
  /// notifying all participants in a recorded session or communication that the
  /// session or communication is being recorded, and obtaining all necessary
  /// consents. You can opt out from Amazon Web Services using audio content to
  /// develop and improve AWS AI/ML services by configuring an AI services opt
  /// out policy using Amazon Web Services Organizations.
  /// </note>
  ///
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [meetingId] :
  /// The unique ID of the meeting being transcribed.
  ///
  /// Parameter [transcriptionConfiguration] :
  /// The configuration for the current transcription operation. Must contain
  /// <code>EngineTranscribeSettings</code> or
  /// <code>EngineTranscribeMedicalSettings</code>.
  Future<void> startMeetingTranscription({
    required String meetingId,
    required TranscriptionConfiguration transcriptionConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'TranscriptionConfiguration': transcriptionConfiguration,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/transcription?operation=start',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops transcription for the specified <code>meetingId</code>. For more
  /// information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meeting-transcription.html">
  /// Using Amazon Chime SDK live transcription </a> in the <i>Amazon Chime SDK
  /// Developer Guide</i>.
  /// <important>
  /// By default, Amazon Transcribe may use and store audio content processed by
  /// the service to develop and improve Amazon Web Services AI/ML services as
  /// further described in section 50 of the <a
  /// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a>. Using Amazon Transcribe may be subject to federal and state
  /// laws or regulations regarding the recording or interception of electronic
  /// communications. It is your and your end users’ responsibility to comply
  /// with all applicable laws regarding the recording, including properly
  /// notifying all participants in a recorded session or communication that the
  /// session or communication is being recorded, and obtaining all necessary
  /// consents. You can opt out from Amazon Web Services using audio content to
  /// develop and improve Amazon Web Services AI/ML services by configuring an
  /// AI services opt out policy using Amazon Web Services Organizations.
  /// </important>
  ///
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [meetingId] :
  /// The unique ID of the meeting for which you stop transcription.
  Future<void> stopMeetingTranscription({
    required String meetingId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/transcription?operation=stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The resource that supports tags.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// Lists the requested tags.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags?operation=tag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified tags from the specified resources. When you specify
  /// a tag key, the action removes both that key and its associated value. The
  /// operation succeeds even if you attempt to remove tags from a resource that
  /// were already removed. Note the following:
  ///
  /// <ul>
  /// <li>
  /// To remove tags from a resource, you need the necessary permissions for the
  /// service that the resource belongs to as well as permissions for removing
  /// tags. For more information, see the documentation for the service whose
  /// resource you want to untag.
  /// </li>
  /// <li>
  /// You can only tag resources that are located in the specified Amazon Web
  /// Services Region for the calling Amazon Web Services account.
  /// </li>
  /// </ul>
  /// <b>Minimum permissions</b>
  ///
  /// In addition to the <code>tag:UntagResources</code> permission required by
  /// this operation, you must also have the remove tags permission defined by
  /// the service that created the resource. For example, to remove the tags
  /// from an Amazon EC2 instance using the <code>UntagResources</code>
  /// operation, you must have both of the following permissions:
  ///
  /// <code>tag:UntagResource</code>
  ///
  /// <code>ChimeSDKMeetings:DeleteTags</code>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource that you're removing tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys being removed from the resources.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags?operation=untag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The capabilities that you want to update.
  /// <note>
  /// You use the capabilities with a set of values that control what the
  /// capabilities can do, such as <code>SendReceive</code> data. For more
  /// information about those values, see .
  /// </note>
  /// When using capabilities, be aware of these corner cases:
  ///
  /// <ul>
  /// <li>
  /// If you specify <code>MeetingFeatures:Video:MaxResolution:None</code> when
  /// you create a meeting, all API requests that include
  /// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
  /// <code>AttendeeCapabilities:Video</code> will be rejected with
  /// <code>ValidationError 400</code>.
  /// </li>
  /// <li>
  /// If you specify <code>MeetingFeatures:Content:MaxResolution:None</code>
  /// when you create a meeting, all API requests that include
  /// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
  /// <code>AttendeeCapabilities:Content</code> will be rejected with
  /// <code>ValidationError 400</code>.
  /// </li>
  /// <li>
  /// You can't set <code>content</code> capabilities to
  /// <code>SendReceive</code> or <code>Receive</code> unless you also set
  /// <code>video</code> capabilities to <code>SendReceive</code> or
  /// <code>Receive</code>. If you don't set the <code>video</code> capability
  /// to receive, the response will contain an HTTP 400 Bad Request status code.
  /// However, you can set your <code>video</code> capability to receive and you
  /// set your <code>content</code> capability to not receive.
  /// </li>
  /// <li>
  /// When you change an <code>audio</code> capability from <code>None</code> or
  /// <code>Receive</code> to <code>Send</code> or <code>SendReceive</code> ,
  /// and if the attendee left their microphone unmuted, audio will flow from
  /// the attendee to the other meeting participants.
  /// </li>
  /// <li>
  /// When you change a <code>video</code> or <code>content</code> capability
  /// from <code>None</code> or <code>Receive</code> to <code>Send</code> or
  /// <code>SendReceive</code> , and if the attendee turned on their video or
  /// content streams, remote attendees can receive those streams, but only
  /// after media renegotiation between the client and the Amazon Chime back-end
  /// server.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [attendeeId] :
  /// The ID of the attendee associated with the update request.
  ///
  /// Parameter [capabilities] :
  /// The capabilities that you want to update.
  ///
  /// Parameter [meetingId] :
  /// The ID of the meeting associated with the update request.
  Future<UpdateAttendeeCapabilitiesResponse> updateAttendeeCapabilities({
    required String attendeeId,
    required AttendeeCapabilities capabilities,
    required String meetingId,
  }) async {
    final $payload = <String, dynamic>{
      'Capabilities': capabilities,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees/${Uri.encodeComponent(attendeeId)}/capabilities',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAttendeeCapabilitiesResponse.fromJson(response);
  }
}

/// An Amazon Chime SDK meeting attendee. Includes a unique
/// <code>AttendeeId</code> and <code>JoinToken</code>. The
/// <code>JoinToken</code> allows a client to authenticate and join as the
/// specified attendee. The <code>JoinToken</code> expires when the meeting
/// ends, or when <a>DeleteAttendee</a> is called. After that, the attendee is
/// unable to join the meeting.
///
/// We recommend securely transferring each <code>JoinToken</code> from your
/// server application to the client so that no other client has access to the
/// token except for the one authorized to represent the attendee.
class Attendee {
  /// The Amazon Chime SDK attendee ID.
  final String? attendeeId;

  /// The capabilities assigned to an attendee: audio, video, or content.
  /// <note>
  /// You use the capabilities with a set of values that control what the
  /// capabilities can do, such as <code>SendReceive</code> data. For more
  /// information about those values, see .
  /// </note>
  /// When using capabilities, be aware of these corner cases:
  ///
  /// <ul>
  /// <li>
  /// If you specify <code>MeetingFeatures:Video:MaxResolution:None</code> when
  /// you create a meeting, all API requests that include
  /// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
  /// <code>AttendeeCapabilities:Video</code> will be rejected with
  /// <code>ValidationError 400</code>.
  /// </li>
  /// <li>
  /// If you specify <code>MeetingFeatures:Content:MaxResolution:None</code> when
  /// you create a meeting, all API requests that include
  /// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
  /// <code>AttendeeCapabilities:Content</code> will be rejected with
  /// <code>ValidationError 400</code>.
  /// </li>
  /// <li>
  /// You can't set <code>content</code> capabilities to <code>SendReceive</code>
  /// or <code>Receive</code> unless you also set <code>video</code> capabilities
  /// to <code>SendReceive</code> or <code>Receive</code>. If you don't set the
  /// <code>video</code> capability to receive, the response will contain an HTTP
  /// 400 Bad Request status code. However, you can set your <code>video</code>
  /// capability to receive and you set your <code>content</code> capability to
  /// not receive.
  /// </li>
  /// <li>
  /// When you change an <code>audio</code> capability from <code>None</code> or
  /// <code>Receive</code> to <code>Send</code> or <code>SendReceive</code> , and
  /// if the attendee left their microphone unmuted, audio will flow from the
  /// attendee to the other meeting participants.
  /// </li>
  /// <li>
  /// When you change a <code>video</code> or <code>content</code> capability from
  /// <code>None</code> or <code>Receive</code> to <code>Send</code> or
  /// <code>SendReceive</code> , and if the attendee turned on their video or
  /// content streams, remote attendees can receive those streams, but only after
  /// media renegotiation between the client and the Amazon Chime back-end server.
  /// </li>
  /// </ul>
  final AttendeeCapabilities? capabilities;

  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application.
  ///
  /// Pattern: <code>[-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]*</code>
  ///
  /// Values that begin with <code>aws:</code> are reserved. You can't configure a
  /// value that uses this prefix. Case insensitive.
  final String? externalUserId;

  /// The join token used by the Amazon Chime SDK attendee.
  final String? joinToken;

  Attendee({
    this.attendeeId,
    this.capabilities,
    this.externalUserId,
    this.joinToken,
  });

  factory Attendee.fromJson(Map<String, dynamic> json) {
    return Attendee(
      attendeeId: json['AttendeeId'] as String?,
      capabilities: json['Capabilities'] != null
          ? AttendeeCapabilities.fromJson(
              json['Capabilities'] as Map<String, dynamic>)
          : null,
      externalUserId: json['ExternalUserId'] as String?,
      joinToken: json['JoinToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attendeeId = this.attendeeId;
    final capabilities = this.capabilities;
    final externalUserId = this.externalUserId;
    final joinToken = this.joinToken;
    return {
      if (attendeeId != null) 'AttendeeId': attendeeId,
      if (capabilities != null) 'Capabilities': capabilities,
      if (externalUserId != null) 'ExternalUserId': externalUserId,
      if (joinToken != null) 'JoinToken': joinToken,
    };
  }
}

/// The media capabilities of an attendee: audio, video, or content.
/// <note>
/// You use the capabilities with a set of values that control what the
/// capabilities can do, such as <code>SendReceive</code> data. For more
/// information, refer to and .
/// </note>
/// When using capabilities, be aware of these corner cases:
///
/// <ul>
/// <li>
/// If you specify <code>MeetingFeatures:Video:MaxResolution:None</code> when
/// you create a meeting, all API requests that include
/// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
/// <code>AttendeeCapabilities:Video</code> will be rejected with
/// <code>ValidationError 400</code>.
/// </li>
/// <li>
/// If you specify <code>MeetingFeatures:Content:MaxResolution:None</code> when
/// you create a meeting, all API requests that include
/// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
/// <code>AttendeeCapabilities:Content</code> will be rejected with
/// <code>ValidationError 400</code>.
/// </li>
/// <li>
/// You can't set <code>content</code> capabilities to <code>SendReceive</code>
/// or <code>Receive</code> unless you also set <code>video</code> capabilities
/// to <code>SendReceive</code> or <code>Receive</code>. If you don't set the
/// <code>video</code> capability to receive, the response will contain an HTTP
/// 400 Bad Request status code. However, you can set your <code>video</code>
/// capability to receive and you set your <code>content</code> capability to
/// not receive.
/// </li>
/// <li>
/// When you change an <code>audio</code> capability from <code>None</code> or
/// <code>Receive</code> to <code>Send</code> or <code>SendReceive</code> , and
/// an attendee unmutes their microphone, audio flows from the attendee to the
/// other meeting participants.
/// </li>
/// <li>
/// When you change a <code>video</code> or <code>content</code> capability from
/// <code>None</code> or <code>Receive</code> to <code>Send</code> or
/// <code>SendReceive</code> , and the attendee turns on their video or content
/// streams, remote attendees can receive those streams, but only after media
/// renegotiation between the client and the Amazon Chime back-end server.
/// </li>
/// </ul>
class AttendeeCapabilities {
  /// The audio capability assigned to an attendee.
  final MediaCapabilities audio;

  /// The content capability assigned to an attendee.
  final MediaCapabilities content;

  /// The video capability assigned to an attendee.
  final MediaCapabilities video;

  AttendeeCapabilities({
    required this.audio,
    required this.content,
    required this.video,
  });

  factory AttendeeCapabilities.fromJson(Map<String, dynamic> json) {
    return AttendeeCapabilities(
      audio: (json['Audio'] as String).toMediaCapabilities(),
      content: (json['Content'] as String).toMediaCapabilities(),
      video: (json['Video'] as String).toMediaCapabilities(),
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    final content = this.content;
    final video = this.video;
    return {
      'Audio': audio.toValue(),
      'Content': content.toValue(),
      'Video': video.toValue(),
    };
  }
}

/// Lists the maximum number of attendees allowed into the meeting.
/// <note>
/// If you specify <code>FHD</code> for
/// <code>MeetingFeatures:Video:MaxResolution</code>, or if you specify
/// <code>UHD</code> for <code>MeetingFeatures:Content:MaxResolution</code>, the
/// maximum number of attendees changes from the default of <code>250</code> to
/// <code>25</code>.
/// </note>
class AttendeeFeatures {
  /// The maximum number of attendees allowed into the meeting.
  final int? maxCount;

  AttendeeFeatures({
    this.maxCount,
  });

  factory AttendeeFeatures.fromJson(Map<String, dynamic> json) {
    return AttendeeFeatures(
      maxCount: json['MaxCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxCount = this.maxCount;
    return {
      if (maxCount != null) 'MaxCount': maxCount,
    };
  }
}

/// A structure that contains one or more attendee IDs.
class AttendeeIdItem {
  /// A list of one or more attendee IDs.
  final String attendeeId;

  AttendeeIdItem({
    required this.attendeeId,
  });

  Map<String, dynamic> toJson() {
    final attendeeId = this.attendeeId;
    return {
      'AttendeeId': attendeeId,
    };
  }
}

/// An optional category of meeting features that contains audio-specific
/// configurations, such as operating parameters for Amazon Voice Focus.
class AudioFeatures {
  /// Makes echo reduction available to clients who connect to the meeting.
  final MeetingFeatureStatus? echoReduction;

  AudioFeatures({
    this.echoReduction,
  });

  factory AudioFeatures.fromJson(Map<String, dynamic> json) {
    return AudioFeatures(
      echoReduction:
          (json['EchoReduction'] as String?)?.toMeetingFeatureStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final echoReduction = this.echoReduction;
    return {
      if (echoReduction != null) 'EchoReduction': echoReduction.toValue(),
    };
  }
}

class BatchCreateAttendeeResponse {
  /// The attendee information, including attendees' IDs and join tokens.
  final List<Attendee>? attendees;

  /// If the action fails for one or more of the attendees in the request, a list
  /// of the attendees is returned, along with error codes and error messages.
  final List<CreateAttendeeError>? errors;

  BatchCreateAttendeeResponse({
    this.attendees,
    this.errors,
  });

  factory BatchCreateAttendeeResponse.fromJson(Map<String, dynamic> json) {
    return BatchCreateAttendeeResponse(
      attendees: (json['Attendees'] as List?)
          ?.whereNotNull()
          .map((e) => Attendee.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => CreateAttendeeError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attendees = this.attendees;
    final errors = this.errors;
    return {
      if (attendees != null) 'Attendees': attendees,
      if (errors != null) 'Errors': errors,
    };
  }
}

/// Lists the content (screen share) features for the meeting. Applies to all
/// attendees.
/// <note>
/// If you specify <code>MeetingFeatures:Content:MaxResolution:None</code> when
/// you create a meeting, all API requests that include
/// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
/// <code>AttendeeCapabilities:Content</code> will be rejected with
/// <code>ValidationError 400</code>.
/// </note>
class ContentFeatures {
  /// The maximum resolution for the meeting content.
  /// <note>
  /// Defaults to <code>FHD</code>. To use <code>UHD</code>, you must also provide
  /// a <code>MeetingFeatures:Attendee:MaxCount</code> value and override the
  /// default size limit of 250 attendees.
  /// </note>
  final ContentResolution? maxResolution;

  ContentFeatures({
    this.maxResolution,
  });

  factory ContentFeatures.fromJson(Map<String, dynamic> json) {
    return ContentFeatures(
      maxResolution: (json['MaxResolution'] as String?)?.toContentResolution(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxResolution = this.maxResolution;
    return {
      if (maxResolution != null) 'MaxResolution': maxResolution.toValue(),
    };
  }
}

enum ContentResolution {
  none,
  fhd,
  uhd,
}

extension ContentResolutionValueExtension on ContentResolution {
  String toValue() {
    switch (this) {
      case ContentResolution.none:
        return 'None';
      case ContentResolution.fhd:
        return 'FHD';
      case ContentResolution.uhd:
        return 'UHD';
    }
  }
}

extension ContentResolutionFromString on String {
  ContentResolution toContentResolution() {
    switch (this) {
      case 'None':
        return ContentResolution.none;
      case 'FHD':
        return ContentResolution.fhd;
      case 'UHD':
        return ContentResolution.uhd;
    }
    throw Exception('$this is not known in enum ContentResolution');
  }
}

/// The list of errors returned when errors are encountered during the
/// BatchCreateAttendee and CreateAttendee actions. This includes external user
/// IDs, error codes, and error messages.
class CreateAttendeeError {
  /// The error code.
  final String? errorCode;

  /// The error message.
  final String? errorMessage;

  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application.
  ///
  /// Pattern: <code>[-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]*</code>
  ///
  /// Values that begin with <code>aws:</code> are reserved. You can't configure a
  /// value that uses this prefix. Case insensitive.
  final String? externalUserId;

  CreateAttendeeError({
    this.errorCode,
    this.errorMessage,
    this.externalUserId,
  });

  factory CreateAttendeeError.fromJson(Map<String, dynamic> json) {
    return CreateAttendeeError(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      externalUserId: json['ExternalUserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final externalUserId = this.externalUserId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (externalUserId != null) 'ExternalUserId': externalUserId,
    };
  }
}

/// The Amazon Chime SDK attendee fields to create, used with the
/// BatchCreateAttendee action.
class CreateAttendeeRequestItem {
  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application.
  ///
  /// Pattern: <code>[-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]*</code>
  ///
  /// Values that begin with <code>aws:</code> are reserved. You can't configure a
  /// value that uses this prefix. Case insensitive.
  final String externalUserId;

  /// A list of one or more capabilities.
  final AttendeeCapabilities? capabilities;

  CreateAttendeeRequestItem({
    required this.externalUserId,
    this.capabilities,
  });

  Map<String, dynamic> toJson() {
    final externalUserId = this.externalUserId;
    final capabilities = this.capabilities;
    return {
      'ExternalUserId': externalUserId,
      if (capabilities != null) 'Capabilities': capabilities,
    };
  }
}

class CreateAttendeeResponse {
  /// The attendee information, including attendee ID and join token.
  final Attendee? attendee;

  CreateAttendeeResponse({
    this.attendee,
  });

  factory CreateAttendeeResponse.fromJson(Map<String, dynamic> json) {
    return CreateAttendeeResponse(
      attendee: json['Attendee'] != null
          ? Attendee.fromJson(json['Attendee'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attendee = this.attendee;
    return {
      if (attendee != null) 'Attendee': attendee,
    };
  }
}

class CreateMeetingResponse {
  /// The meeting information, including the meeting ID and
  /// <code>MediaPlacement</code>.
  final Meeting? meeting;

  CreateMeetingResponse({
    this.meeting,
  });

  factory CreateMeetingResponse.fromJson(Map<String, dynamic> json) {
    return CreateMeetingResponse(
      meeting: json['Meeting'] != null
          ? Meeting.fromJson(json['Meeting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meeting = this.meeting;
    return {
      if (meeting != null) 'Meeting': meeting,
    };
  }
}

class CreateMeetingWithAttendeesResponse {
  /// The attendee information, including attendees' IDs and join tokens.
  final List<Attendee>? attendees;

  /// If the action fails for one or more of the attendees in the request, a list
  /// of the attendees is returned, along with error codes and error messages.
  final List<CreateAttendeeError>? errors;

  /// The meeting information, including the meeting ID and
  /// <code>MediaPlacement</code>.
  final Meeting? meeting;

  CreateMeetingWithAttendeesResponse({
    this.attendees,
    this.errors,
    this.meeting,
  });

  factory CreateMeetingWithAttendeesResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMeetingWithAttendeesResponse(
      attendees: (json['Attendees'] as List?)
          ?.whereNotNull()
          .map((e) => Attendee.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => CreateAttendeeError.fromJson(e as Map<String, dynamic>))
          .toList(),
      meeting: json['Meeting'] != null
          ? Meeting.fromJson(json['Meeting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attendees = this.attendees;
    final errors = this.errors;
    final meeting = this.meeting;
    return {
      if (attendees != null) 'Attendees': attendees,
      if (errors != null) 'Errors': errors,
      if (meeting != null) 'Meeting': meeting,
    };
  }
}

/// Settings specific to the Amazon Transcribe Medical engine.
class EngineTranscribeMedicalSettings {
  /// The language code specified for the Amazon Transcribe Medical engine.
  final TranscribeMedicalLanguageCode languageCode;

  /// The specialty specified for the Amazon Transcribe Medical engine.
  final TranscribeMedicalSpecialty specialty;

  /// The type of transcription.
  final TranscribeMedicalType type;

  /// Set this field to <code>PHI</code> to identify personal health information
  /// in the transcription output.
  final TranscribeMedicalContentIdentificationType? contentIdentificationType;

  /// The Amazon Web Services Region passed to Amazon Transcribe Medical. If you
  /// don't specify a Region, Amazon Chime uses the meeting's Region.
  final TranscribeMedicalRegion? region;

  /// The name of the vocabulary passed to Amazon Transcribe Medical.
  final String? vocabularyName;

  EngineTranscribeMedicalSettings({
    required this.languageCode,
    required this.specialty,
    required this.type,
    this.contentIdentificationType,
    this.region,
    this.vocabularyName,
  });

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final specialty = this.specialty;
    final type = this.type;
    final contentIdentificationType = this.contentIdentificationType;
    final region = this.region;
    final vocabularyName = this.vocabularyName;
    return {
      'LanguageCode': languageCode.toValue(),
      'Specialty': specialty.toValue(),
      'Type': type.toValue(),
      if (contentIdentificationType != null)
        'ContentIdentificationType': contentIdentificationType.toValue(),
      if (region != null) 'Region': region.toValue(),
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
    };
  }
}

/// Settings specific for Amazon Transcribe as the live transcription engine.
///
/// If you specify an invalid combination of parameters, a
/// <code>TranscriptFailed</code> event will be sent with the contents of the
/// <code>BadRequestException</code> generated by Amazon Transcribe. For more
/// information on each parameter and which combinations are valid, refer to the
/// <a
/// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/API_streaming_StartStreamTranscription.html">StartStreamTranscription</a>
/// API in the <i>Amazon Transcribe Developer Guide</i>.
class EngineTranscribeSettings {
  /// Labels all personally identifiable information (PII) identified in your
  /// transcript. If you don't include <code>PiiEntityTypes</code>, all PII is
  /// identified.
  /// <note>
  /// You can’t set <code>ContentIdentificationType</code> and
  /// <code>ContentRedactionType</code>.
  /// </note>
  final TranscribeContentIdentificationType? contentIdentificationType;

  /// Content redaction is performed at the segment level. If you don't include
  /// <code>PiiEntityTypes</code>, all PII is redacted.
  /// <note>
  /// You can’t set <code>ContentRedactionType</code> and
  /// <code>ContentIdentificationType</code>.
  /// </note>
  final TranscribeContentRedactionType? contentRedactionType;

  /// Enables partial result stabilization for your transcription. Partial result
  /// stabilization can reduce latency in your output, but may impact accuracy.
  final bool? enablePartialResultsStabilization;

  /// Enables automatic language identification for your transcription.
  ///
  /// If you include <code>IdentifyLanguage</code>, you can optionally use
  /// <code>LanguageOptions</code> to include a list of language codes that you
  /// think may be present in your audio stream. Including language options can
  /// improve transcription accuracy.
  ///
  /// You can also use <code>PreferredLanguage</code> to include a preferred
  /// language. Doing so can help Amazon Transcribe identify the language faster.
  ///
  /// You must include either <code>LanguageCode</code> or
  /// <code>IdentifyLanguage</code>.
  ///
  /// Language identification can't be combined with custom language models or
  /// redaction.
  final bool? identifyLanguage;

  /// Specify the language code that represents the language spoken.
  ///
  /// If you're unsure of the language spoken in your audio, consider using
  /// <code>IdentifyLanguage</code> to enable automatic language identification.
  final TranscribeLanguageCode? languageCode;

  /// Specify the name of the custom language model that you want to use when
  /// processing your transcription. Note that language model names are case
  /// sensitive.
  ///
  /// The language of the specified language model must match the language code.
  /// If the languages don't match, the custom language model isn't applied. There
  /// are no errors or warnings associated with a language mismatch.
  ///
  /// If you use Amazon Transcribe in multiple Regions, the custom language model
  /// must be available in Amazon Transcribe in each Region.
  final String? languageModelName;

  /// Specify two or more language codes that represent the languages you think
  /// may be present in your media; including more than five is not recommended.
  /// If you're unsure what languages are present, do not include this parameter.
  ///
  /// Including language options can improve the accuracy of language
  /// identification.
  ///
  /// If you include <code>LanguageOptions</code>, you must also include
  /// <code>IdentifyLanguage</code>.
  /// <important>
  /// You can only include one language dialect per language. For example, you
  /// cannot include <code>en-US</code> and <code>en-AU</code>.
  /// </important>
  final String? languageOptions;

  /// Specify the level of stability to use when you enable partial results
  /// stabilization (<code>EnablePartialResultsStabilization</code>).
  ///
  /// Low stability provides the highest accuracy. High stability transcribes
  /// faster, but with slightly lower accuracy.
  final TranscribePartialResultsStability? partialResultsStability;

  /// Specify which types of personally identifiable information (PII) you want to
  /// redact in your transcript. You can include as many types as you'd like, or
  /// you can select <code>ALL</code>.
  ///
  /// Values must be comma-separated and can include: <code>ADDRESS</code>,
  /// <code>BANK_ACCOUNT_NUMBER</code>, <code>BANK_ROUTING</code>,
  /// <code>CREDIT_DEBIT_CVV</code>, <code>CREDIT_DEBIT_EXPIRY</code>
  /// <code>CREDIT_DEBIT_NUMBER</code>, <code>EMAIL</code>,<code>NAME</code>,
  /// <code>PHONE</code>, <code>PIN</code>, <code>SSN</code>, or <code>ALL</code>.
  ///
  /// Note that if you include <code>PiiEntityTypes</code>, you must also include
  /// <code>ContentIdentificationType</code> or <code>ContentRedactionType</code>.
  ///
  /// If you include <code>ContentRedactionType</code> or
  /// <code>ContentIdentificationType</code>, but do not include PiiEntityTypes,
  /// all PII is redacted or identified.
  final String? piiEntityTypes;

  /// Specify a preferred language from the subset of languages codes you
  /// specified in <code>LanguageOptions</code>.
  ///
  /// You can only use this parameter if you include <code>IdentifyLanguage</code>
  /// and <code>LanguageOptions</code>.
  final TranscribeLanguageCode? preferredLanguage;

  /// The Amazon Web Services Region in which to use Amazon Transcribe.
  ///
  /// If you don't specify a Region, then the <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_CreateMeeting.html">MediaRegion</a>
  /// of the meeting is used. However, if Amazon Transcribe is not available in
  /// the <code>MediaRegion</code>, then a <code>TranscriptFailed</code> event is
  /// sent.
  ///
  /// Use <code>auto</code> to use Amazon Transcribe in a Region near the
  /// meeting’s <code>MediaRegion</code>. For more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/transcription-options.html#choose-region">Choosing
  /// a transcription Region</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  final TranscribeRegion? region;

  /// Specify how you want your vocabulary filter applied to your transcript.
  ///
  /// To replace words with <code>***</code>, choose <code>mask</code>.
  ///
  /// To delete words, choose <code>remove</code>.
  ///
  /// To flag words without changing them, choose <code>tag</code>.
  final TranscribeVocabularyFilterMethod? vocabularyFilterMethod;

  /// Specify the name of the custom vocabulary filter that you want to use when
  /// processing your transcription. Note that vocabulary filter names are case
  /// sensitive.
  ///
  /// If you use Amazon Transcribe in multiple Regions, the vocabulary filter must
  /// be available in Amazon Transcribe in each Region.
  ///
  /// If you include <code>IdentifyLanguage</code> and want to use one or more
  /// vocabulary filters with your transcription, use the
  /// <code>VocabularyFilterNames</code> parameter instead.
  final String? vocabularyFilterName;

  /// Specify the names of the custom vocabulary filters that you want to use when
  /// processing your transcription. Note that vocabulary filter names are case
  /// sensitive.
  ///
  /// If you use Amazon Transcribe in multiple Regions, the vocabulary filter must
  /// be available in Amazon Transcribe in each Region.
  ///
  /// If you're <i>not</i> including <code>IdentifyLanguage</code> and want to use
  /// a custom vocabulary filter with your transcription, use the
  /// <code>VocabularyFilterName</code> parameter instead.
  final String? vocabularyFilterNames;

  /// Specify the name of the custom vocabulary that you want to use when
  /// processing your transcription. Note that vocabulary names are case
  /// sensitive.
  ///
  /// If you use Amazon Transcribe multiple Regions, the vocabulary must be
  /// available in Amazon Transcribe in each Region.
  ///
  /// If you include <code>IdentifyLanguage</code> and want to use one or more
  /// custom vocabularies with your transcription, use the
  /// <code>VocabularyNames</code> parameter instead.
  final String? vocabularyName;

  /// Specify the names of the custom vocabularies that you want to use when
  /// processing your transcription. Note that vocabulary names are case
  /// sensitive.
  ///
  /// If you use Amazon Transcribe in multiple Regions, the vocabulary must be
  /// available in Amazon Transcribe in each Region.
  ///
  /// If you don't include <code>IdentifyLanguage</code> and want to use a custom
  /// vocabulary with your transcription, use the <code>VocabularyName</code>
  /// parameter instead.
  final String? vocabularyNames;

  EngineTranscribeSettings({
    this.contentIdentificationType,
    this.contentRedactionType,
    this.enablePartialResultsStabilization,
    this.identifyLanguage,
    this.languageCode,
    this.languageModelName,
    this.languageOptions,
    this.partialResultsStability,
    this.piiEntityTypes,
    this.preferredLanguage,
    this.region,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyFilterNames,
    this.vocabularyName,
    this.vocabularyNames,
  });

  Map<String, dynamic> toJson() {
    final contentIdentificationType = this.contentIdentificationType;
    final contentRedactionType = this.contentRedactionType;
    final enablePartialResultsStabilization =
        this.enablePartialResultsStabilization;
    final identifyLanguage = this.identifyLanguage;
    final languageCode = this.languageCode;
    final languageModelName = this.languageModelName;
    final languageOptions = this.languageOptions;
    final partialResultsStability = this.partialResultsStability;
    final piiEntityTypes = this.piiEntityTypes;
    final preferredLanguage = this.preferredLanguage;
    final region = this.region;
    final vocabularyFilterMethod = this.vocabularyFilterMethod;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyFilterNames = this.vocabularyFilterNames;
    final vocabularyName = this.vocabularyName;
    final vocabularyNames = this.vocabularyNames;
    return {
      if (contentIdentificationType != null)
        'ContentIdentificationType': contentIdentificationType.toValue(),
      if (contentRedactionType != null)
        'ContentRedactionType': contentRedactionType.toValue(),
      if (enablePartialResultsStabilization != null)
        'EnablePartialResultsStabilization': enablePartialResultsStabilization,
      if (identifyLanguage != null) 'IdentifyLanguage': identifyLanguage,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (languageModelName != null) 'LanguageModelName': languageModelName,
      if (languageOptions != null) 'LanguageOptions': languageOptions,
      if (partialResultsStability != null)
        'PartialResultsStability': partialResultsStability.toValue(),
      if (piiEntityTypes != null) 'PiiEntityTypes': piiEntityTypes,
      if (preferredLanguage != null)
        'PreferredLanguage': preferredLanguage.toValue(),
      if (region != null) 'Region': region.toValue(),
      if (vocabularyFilterMethod != null)
        'VocabularyFilterMethod': vocabularyFilterMethod.toValue(),
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
      if (vocabularyFilterNames != null)
        'VocabularyFilterNames': vocabularyFilterNames,
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
      if (vocabularyNames != null) 'VocabularyNames': vocabularyNames,
    };
  }
}

class GetAttendeeResponse {
  /// The Amazon Chime SDK attendee information.
  final Attendee? attendee;

  GetAttendeeResponse({
    this.attendee,
  });

  factory GetAttendeeResponse.fromJson(Map<String, dynamic> json) {
    return GetAttendeeResponse(
      attendee: json['Attendee'] != null
          ? Attendee.fromJson(json['Attendee'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attendee = this.attendee;
    return {
      if (attendee != null) 'Attendee': attendee,
    };
  }
}

class GetMeetingResponse {
  /// The Amazon Chime SDK meeting information.
  final Meeting? meeting;

  GetMeetingResponse({
    this.meeting,
  });

  factory GetMeetingResponse.fromJson(Map<String, dynamic> json) {
    return GetMeetingResponse(
      meeting: json['Meeting'] != null
          ? Meeting.fromJson(json['Meeting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meeting = this.meeting;
    return {
      if (meeting != null) 'Meeting': meeting,
    };
  }
}

class ListAttendeesResponse {
  /// The Amazon Chime SDK attendee information.
  final List<Attendee>? attendees;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListAttendeesResponse({
    this.attendees,
    this.nextToken,
  });

  factory ListAttendeesResponse.fromJson(Map<String, dynamic> json) {
    return ListAttendeesResponse(
      attendees: (json['Attendees'] as List?)
          ?.whereNotNull()
          .map((e) => Attendee.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attendees = this.attendees;
    final nextToken = this.nextToken;
    return {
      if (attendees != null) 'Attendees': attendees,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags requested for the specified resource.
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

enum MediaCapabilities {
  sendReceive,
  send,
  receive,
  none,
}

extension MediaCapabilitiesValueExtension on MediaCapabilities {
  String toValue() {
    switch (this) {
      case MediaCapabilities.sendReceive:
        return 'SendReceive';
      case MediaCapabilities.send:
        return 'Send';
      case MediaCapabilities.receive:
        return 'Receive';
      case MediaCapabilities.none:
        return 'None';
    }
  }
}

extension MediaCapabilitiesFromString on String {
  MediaCapabilities toMediaCapabilities() {
    switch (this) {
      case 'SendReceive':
        return MediaCapabilities.sendReceive;
      case 'Send':
        return MediaCapabilities.send;
      case 'Receive':
        return MediaCapabilities.receive;
      case 'None':
        return MediaCapabilities.none;
    }
    throw Exception('$this is not known in enum MediaCapabilities');
  }
}

/// A set of endpoints used by clients to connect to the media service group for
/// an Amazon Chime SDK meeting.
class MediaPlacement {
  /// The audio fallback URL.
  final String? audioFallbackUrl;

  /// The audio host URL.
  final String? audioHostUrl;

  /// The event ingestion URL.
  final String? eventIngestionUrl;

  /// The screen data URL.
  /// <important>
  /// <b>This parameter is deprecated and no longer used by the Amazon Chime
  /// SDK.</b>
  /// </important>
  final String? screenDataUrl;

  /// The screen sharing URL.
  /// <important>
  /// <b>This parameter is deprecated and no longer used by the Amazon Chime
  /// SDK.</b>
  /// </important>
  final String? screenSharingUrl;

  /// The screen viewing URL.
  /// <important>
  /// <b>This parameter is deprecated and no longer used by the Amazon Chime
  /// SDK.</b>
  /// </important>
  final String? screenViewingUrl;

  /// The signaling URL.
  final String? signalingUrl;

  /// The turn control URL.
  /// <important>
  /// <b>This parameter is deprecated and no longer used by the Amazon Chime
  /// SDK.</b>
  /// </important>
  final String? turnControlUrl;

  MediaPlacement({
    this.audioFallbackUrl,
    this.audioHostUrl,
    this.eventIngestionUrl,
    this.screenDataUrl,
    this.screenSharingUrl,
    this.screenViewingUrl,
    this.signalingUrl,
    this.turnControlUrl,
  });

  factory MediaPlacement.fromJson(Map<String, dynamic> json) {
    return MediaPlacement(
      audioFallbackUrl: json['AudioFallbackUrl'] as String?,
      audioHostUrl: json['AudioHostUrl'] as String?,
      eventIngestionUrl: json['EventIngestionUrl'] as String?,
      screenDataUrl: json['ScreenDataUrl'] as String?,
      screenSharingUrl: json['ScreenSharingUrl'] as String?,
      screenViewingUrl: json['ScreenViewingUrl'] as String?,
      signalingUrl: json['SignalingUrl'] as String?,
      turnControlUrl: json['TurnControlUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioFallbackUrl = this.audioFallbackUrl;
    final audioHostUrl = this.audioHostUrl;
    final eventIngestionUrl = this.eventIngestionUrl;
    final screenDataUrl = this.screenDataUrl;
    final screenSharingUrl = this.screenSharingUrl;
    final screenViewingUrl = this.screenViewingUrl;
    final signalingUrl = this.signalingUrl;
    final turnControlUrl = this.turnControlUrl;
    return {
      if (audioFallbackUrl != null) 'AudioFallbackUrl': audioFallbackUrl,
      if (audioHostUrl != null) 'AudioHostUrl': audioHostUrl,
      if (eventIngestionUrl != null) 'EventIngestionUrl': eventIngestionUrl,
      if (screenDataUrl != null) 'ScreenDataUrl': screenDataUrl,
      if (screenSharingUrl != null) 'ScreenSharingUrl': screenSharingUrl,
      if (screenViewingUrl != null) 'ScreenViewingUrl': screenViewingUrl,
      if (signalingUrl != null) 'SignalingUrl': signalingUrl,
      if (turnControlUrl != null) 'TurnControlUrl': turnControlUrl,
    };
  }
}

/// A meeting created using the Amazon Chime SDK.
class Meeting {
  /// The external meeting ID.
  ///
  /// Pattern: <code>[-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]*</code>
  ///
  /// Values that begin with <code>aws:</code> are reserved. You can't configure a
  /// value that uses this prefix. Case insensitive.
  final String? externalMeetingId;

  /// The media placement for the meeting.
  final MediaPlacement? mediaPlacement;

  /// The Region in which you create the meeting. Available values:
  /// <code>af-south-1</code>, <code>ap-northeast-1</code>,
  /// <code>ap-northeast-2</code>, <code>ap-south-1</code>,
  /// <code>ap-southeast-1</code>, <code>ap-southeast-2</code>,
  /// <code>ca-central-1</code>, <code>eu-central-1</code>,
  /// <code>eu-north-1</code>, <code>eu-south-1</code>, <code>eu-west-1</code>,
  /// <code>eu-west-2</code>, <code>eu-west-3</code>, <code>sa-east-1</code>,
  /// <code>us-east-1</code>, <code>us-east-2</code>, <code>us-west-1</code>,
  /// <code>us-west-2</code>.
  ///
  /// Available values in Amazon Web Services GovCloud (US) Regions:
  /// <code>us-gov-east-1</code>, <code>us-gov-west-1</code>.
  final String? mediaRegion;

  /// The ARN of the meeting.
  final String? meetingArn;

  /// The features available to a meeting, such as echo reduction.
  final MeetingFeaturesConfiguration? meetingFeatures;

  /// Reserved.
  final String? meetingHostId;

  /// The Amazon Chime SDK meeting ID.
  final String? meetingId;

  /// When specified, replicates the media from the primary meeting to this
  /// meeting.
  final String? primaryMeetingId;

  /// Array of strings.
  final List<String>? tenantIds;

  Meeting({
    this.externalMeetingId,
    this.mediaPlacement,
    this.mediaRegion,
    this.meetingArn,
    this.meetingFeatures,
    this.meetingHostId,
    this.meetingId,
    this.primaryMeetingId,
    this.tenantIds,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      externalMeetingId: json['ExternalMeetingId'] as String?,
      mediaPlacement: json['MediaPlacement'] != null
          ? MediaPlacement.fromJson(
              json['MediaPlacement'] as Map<String, dynamic>)
          : null,
      mediaRegion: json['MediaRegion'] as String?,
      meetingArn: json['MeetingArn'] as String?,
      meetingFeatures: json['MeetingFeatures'] != null
          ? MeetingFeaturesConfiguration.fromJson(
              json['MeetingFeatures'] as Map<String, dynamic>)
          : null,
      meetingHostId: json['MeetingHostId'] as String?,
      meetingId: json['MeetingId'] as String?,
      primaryMeetingId: json['PrimaryMeetingId'] as String?,
      tenantIds: (json['TenantIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final externalMeetingId = this.externalMeetingId;
    final mediaPlacement = this.mediaPlacement;
    final mediaRegion = this.mediaRegion;
    final meetingArn = this.meetingArn;
    final meetingFeatures = this.meetingFeatures;
    final meetingHostId = this.meetingHostId;
    final meetingId = this.meetingId;
    final primaryMeetingId = this.primaryMeetingId;
    final tenantIds = this.tenantIds;
    return {
      if (externalMeetingId != null) 'ExternalMeetingId': externalMeetingId,
      if (mediaPlacement != null) 'MediaPlacement': mediaPlacement,
      if (mediaRegion != null) 'MediaRegion': mediaRegion,
      if (meetingArn != null) 'MeetingArn': meetingArn,
      if (meetingFeatures != null) 'MeetingFeatures': meetingFeatures,
      if (meetingHostId != null) 'MeetingHostId': meetingHostId,
      if (meetingId != null) 'MeetingId': meetingId,
      if (primaryMeetingId != null) 'PrimaryMeetingId': primaryMeetingId,
      if (tenantIds != null) 'TenantIds': tenantIds,
    };
  }
}

enum MeetingFeatureStatus {
  available,
  unavailable,
}

extension MeetingFeatureStatusValueExtension on MeetingFeatureStatus {
  String toValue() {
    switch (this) {
      case MeetingFeatureStatus.available:
        return 'AVAILABLE';
      case MeetingFeatureStatus.unavailable:
        return 'UNAVAILABLE';
    }
  }
}

extension MeetingFeatureStatusFromString on String {
  MeetingFeatureStatus toMeetingFeatureStatus() {
    switch (this) {
      case 'AVAILABLE':
        return MeetingFeatureStatus.available;
      case 'UNAVAILABLE':
        return MeetingFeatureStatus.unavailable;
    }
    throw Exception('$this is not known in enum MeetingFeatureStatus');
  }
}

/// The configuration settings of the features available to a meeting.
class MeetingFeaturesConfiguration {
  /// The configuration settings for the attendee features available to a meeting.
  final AttendeeFeatures? attendee;

  /// The configuration settings for the audio features available to a meeting.
  final AudioFeatures? audio;

  /// The configuration settings for the content features available to a meeting.
  final ContentFeatures? content;

  /// The configuration settings for the video features available to a meeting.
  final VideoFeatures? video;

  MeetingFeaturesConfiguration({
    this.attendee,
    this.audio,
    this.content,
    this.video,
  });

  factory MeetingFeaturesConfiguration.fromJson(Map<String, dynamic> json) {
    return MeetingFeaturesConfiguration(
      attendee: json['Attendee'] != null
          ? AttendeeFeatures.fromJson(json['Attendee'] as Map<String, dynamic>)
          : null,
      audio: json['Audio'] != null
          ? AudioFeatures.fromJson(json['Audio'] as Map<String, dynamic>)
          : null,
      content: json['Content'] != null
          ? ContentFeatures.fromJson(json['Content'] as Map<String, dynamic>)
          : null,
      video: json['Video'] != null
          ? VideoFeatures.fromJson(json['Video'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attendee = this.attendee;
    final audio = this.audio;
    final content = this.content;
    final video = this.video;
    return {
      if (attendee != null) 'Attendee': attendee,
      if (audio != null) 'Audio': audio,
      if (content != null) 'Content': content,
      if (video != null) 'Video': video,
    };
  }
}

/// The configuration for resource targets to receive notifications when meeting
/// and attendee events occur.
class NotificationsConfiguration {
  /// The ARN of the Amazon Web Services Lambda function in the notifications
  /// configuration.
  final String? lambdaFunctionArn;

  /// The ARN of the SNS topic.
  final String? snsTopicArn;

  /// The ARN of the SQS queue.
  final String? sqsQueueArn;

  NotificationsConfiguration({
    this.lambdaFunctionArn,
    this.snsTopicArn,
    this.sqsQueueArn,
  });

  Map<String, dynamic> toJson() {
    final lambdaFunctionArn = this.lambdaFunctionArn;
    final snsTopicArn = this.snsTopicArn;
    final sqsQueueArn = this.sqsQueueArn;
    return {
      if (lambdaFunctionArn != null) 'LambdaFunctionArn': lambdaFunctionArn,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (sqsQueueArn != null) 'SqsQueueArn': sqsQueueArn,
    };
  }
}

/// A key-value pair that you define.
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TranscribeContentIdentificationType {
  pii,
}

extension TranscribeContentIdentificationTypeValueExtension
    on TranscribeContentIdentificationType {
  String toValue() {
    switch (this) {
      case TranscribeContentIdentificationType.pii:
        return 'PII';
    }
  }
}

extension TranscribeContentIdentificationTypeFromString on String {
  TranscribeContentIdentificationType toTranscribeContentIdentificationType() {
    switch (this) {
      case 'PII':
        return TranscribeContentIdentificationType.pii;
    }
    throw Exception(
        '$this is not known in enum TranscribeContentIdentificationType');
  }
}

enum TranscribeContentRedactionType {
  pii,
}

extension TranscribeContentRedactionTypeValueExtension
    on TranscribeContentRedactionType {
  String toValue() {
    switch (this) {
      case TranscribeContentRedactionType.pii:
        return 'PII';
    }
  }
}

extension TranscribeContentRedactionTypeFromString on String {
  TranscribeContentRedactionType toTranscribeContentRedactionType() {
    switch (this) {
      case 'PII':
        return TranscribeContentRedactionType.pii;
    }
    throw Exception(
        '$this is not known in enum TranscribeContentRedactionType');
  }
}

enum TranscribeLanguageCode {
  enUs,
  enGb,
  esUs,
  frCa,
  frFr,
  enAu,
  itIt,
  deDe,
  ptBr,
  jaJp,
  koKr,
  zhCn,
  thTh,
  hiIn,
}

extension TranscribeLanguageCodeValueExtension on TranscribeLanguageCode {
  String toValue() {
    switch (this) {
      case TranscribeLanguageCode.enUs:
        return 'en-US';
      case TranscribeLanguageCode.enGb:
        return 'en-GB';
      case TranscribeLanguageCode.esUs:
        return 'es-US';
      case TranscribeLanguageCode.frCa:
        return 'fr-CA';
      case TranscribeLanguageCode.frFr:
        return 'fr-FR';
      case TranscribeLanguageCode.enAu:
        return 'en-AU';
      case TranscribeLanguageCode.itIt:
        return 'it-IT';
      case TranscribeLanguageCode.deDe:
        return 'de-DE';
      case TranscribeLanguageCode.ptBr:
        return 'pt-BR';
      case TranscribeLanguageCode.jaJp:
        return 'ja-JP';
      case TranscribeLanguageCode.koKr:
        return 'ko-KR';
      case TranscribeLanguageCode.zhCn:
        return 'zh-CN';
      case TranscribeLanguageCode.thTh:
        return 'th-TH';
      case TranscribeLanguageCode.hiIn:
        return 'hi-IN';
    }
  }
}

extension TranscribeLanguageCodeFromString on String {
  TranscribeLanguageCode toTranscribeLanguageCode() {
    switch (this) {
      case 'en-US':
        return TranscribeLanguageCode.enUs;
      case 'en-GB':
        return TranscribeLanguageCode.enGb;
      case 'es-US':
        return TranscribeLanguageCode.esUs;
      case 'fr-CA':
        return TranscribeLanguageCode.frCa;
      case 'fr-FR':
        return TranscribeLanguageCode.frFr;
      case 'en-AU':
        return TranscribeLanguageCode.enAu;
      case 'it-IT':
        return TranscribeLanguageCode.itIt;
      case 'de-DE':
        return TranscribeLanguageCode.deDe;
      case 'pt-BR':
        return TranscribeLanguageCode.ptBr;
      case 'ja-JP':
        return TranscribeLanguageCode.jaJp;
      case 'ko-KR':
        return TranscribeLanguageCode.koKr;
      case 'zh-CN':
        return TranscribeLanguageCode.zhCn;
      case 'th-TH':
        return TranscribeLanguageCode.thTh;
      case 'hi-IN':
        return TranscribeLanguageCode.hiIn;
    }
    throw Exception('$this is not known in enum TranscribeLanguageCode');
  }
}

enum TranscribeMedicalContentIdentificationType {
  phi,
}

extension TranscribeMedicalContentIdentificationTypeValueExtension
    on TranscribeMedicalContentIdentificationType {
  String toValue() {
    switch (this) {
      case TranscribeMedicalContentIdentificationType.phi:
        return 'PHI';
    }
  }
}

extension TranscribeMedicalContentIdentificationTypeFromString on String {
  TranscribeMedicalContentIdentificationType
      toTranscribeMedicalContentIdentificationType() {
    switch (this) {
      case 'PHI':
        return TranscribeMedicalContentIdentificationType.phi;
    }
    throw Exception(
        '$this is not known in enum TranscribeMedicalContentIdentificationType');
  }
}

enum TranscribeMedicalLanguageCode {
  enUs,
}

extension TranscribeMedicalLanguageCodeValueExtension
    on TranscribeMedicalLanguageCode {
  String toValue() {
    switch (this) {
      case TranscribeMedicalLanguageCode.enUs:
        return 'en-US';
    }
  }
}

extension TranscribeMedicalLanguageCodeFromString on String {
  TranscribeMedicalLanguageCode toTranscribeMedicalLanguageCode() {
    switch (this) {
      case 'en-US':
        return TranscribeMedicalLanguageCode.enUs;
    }
    throw Exception('$this is not known in enum TranscribeMedicalLanguageCode');
  }
}

enum TranscribeMedicalRegion {
  usEast_1,
  usEast_2,
  usWest_2,
  apSoutheast_2,
  caCentral_1,
  euWest_1,
  auto,
}

extension TranscribeMedicalRegionValueExtension on TranscribeMedicalRegion {
  String toValue() {
    switch (this) {
      case TranscribeMedicalRegion.usEast_1:
        return 'us-east-1';
      case TranscribeMedicalRegion.usEast_2:
        return 'us-east-2';
      case TranscribeMedicalRegion.usWest_2:
        return 'us-west-2';
      case TranscribeMedicalRegion.apSoutheast_2:
        return 'ap-southeast-2';
      case TranscribeMedicalRegion.caCentral_1:
        return 'ca-central-1';
      case TranscribeMedicalRegion.euWest_1:
        return 'eu-west-1';
      case TranscribeMedicalRegion.auto:
        return 'auto';
    }
  }
}

extension TranscribeMedicalRegionFromString on String {
  TranscribeMedicalRegion toTranscribeMedicalRegion() {
    switch (this) {
      case 'us-east-1':
        return TranscribeMedicalRegion.usEast_1;
      case 'us-east-2':
        return TranscribeMedicalRegion.usEast_2;
      case 'us-west-2':
        return TranscribeMedicalRegion.usWest_2;
      case 'ap-southeast-2':
        return TranscribeMedicalRegion.apSoutheast_2;
      case 'ca-central-1':
        return TranscribeMedicalRegion.caCentral_1;
      case 'eu-west-1':
        return TranscribeMedicalRegion.euWest_1;
      case 'auto':
        return TranscribeMedicalRegion.auto;
    }
    throw Exception('$this is not known in enum TranscribeMedicalRegion');
  }
}

enum TranscribeMedicalSpecialty {
  primarycare,
  cardiology,
  neurology,
  oncology,
  radiology,
  urology,
}

extension TranscribeMedicalSpecialtyValueExtension
    on TranscribeMedicalSpecialty {
  String toValue() {
    switch (this) {
      case TranscribeMedicalSpecialty.primarycare:
        return 'PRIMARYCARE';
      case TranscribeMedicalSpecialty.cardiology:
        return 'CARDIOLOGY';
      case TranscribeMedicalSpecialty.neurology:
        return 'NEUROLOGY';
      case TranscribeMedicalSpecialty.oncology:
        return 'ONCOLOGY';
      case TranscribeMedicalSpecialty.radiology:
        return 'RADIOLOGY';
      case TranscribeMedicalSpecialty.urology:
        return 'UROLOGY';
    }
  }
}

extension TranscribeMedicalSpecialtyFromString on String {
  TranscribeMedicalSpecialty toTranscribeMedicalSpecialty() {
    switch (this) {
      case 'PRIMARYCARE':
        return TranscribeMedicalSpecialty.primarycare;
      case 'CARDIOLOGY':
        return TranscribeMedicalSpecialty.cardiology;
      case 'NEUROLOGY':
        return TranscribeMedicalSpecialty.neurology;
      case 'ONCOLOGY':
        return TranscribeMedicalSpecialty.oncology;
      case 'RADIOLOGY':
        return TranscribeMedicalSpecialty.radiology;
      case 'UROLOGY':
        return TranscribeMedicalSpecialty.urology;
    }
    throw Exception('$this is not known in enum TranscribeMedicalSpecialty');
  }
}

enum TranscribeMedicalType {
  conversation,
  dictation,
}

extension TranscribeMedicalTypeValueExtension on TranscribeMedicalType {
  String toValue() {
    switch (this) {
      case TranscribeMedicalType.conversation:
        return 'CONVERSATION';
      case TranscribeMedicalType.dictation:
        return 'DICTATION';
    }
  }
}

extension TranscribeMedicalTypeFromString on String {
  TranscribeMedicalType toTranscribeMedicalType() {
    switch (this) {
      case 'CONVERSATION':
        return TranscribeMedicalType.conversation;
      case 'DICTATION':
        return TranscribeMedicalType.dictation;
    }
    throw Exception('$this is not known in enum TranscribeMedicalType');
  }
}

enum TranscribePartialResultsStability {
  low,
  medium,
  high,
}

extension TranscribePartialResultsStabilityValueExtension
    on TranscribePartialResultsStability {
  String toValue() {
    switch (this) {
      case TranscribePartialResultsStability.low:
        return 'low';
      case TranscribePartialResultsStability.medium:
        return 'medium';
      case TranscribePartialResultsStability.high:
        return 'high';
    }
  }
}

extension TranscribePartialResultsStabilityFromString on String {
  TranscribePartialResultsStability toTranscribePartialResultsStability() {
    switch (this) {
      case 'low':
        return TranscribePartialResultsStability.low;
      case 'medium':
        return TranscribePartialResultsStability.medium;
      case 'high':
        return TranscribePartialResultsStability.high;
    }
    throw Exception(
        '$this is not known in enum TranscribePartialResultsStability');
  }
}

enum TranscribeRegion {
  usEast_2,
  usEast_1,
  usWest_2,
  apNortheast_2,
  apSoutheast_2,
  apNortheast_1,
  caCentral_1,
  euCentral_1,
  euWest_1,
  euWest_2,
  saEast_1,
  auto,
  usGovWest_1,
}

extension TranscribeRegionValueExtension on TranscribeRegion {
  String toValue() {
    switch (this) {
      case TranscribeRegion.usEast_2:
        return 'us-east-2';
      case TranscribeRegion.usEast_1:
        return 'us-east-1';
      case TranscribeRegion.usWest_2:
        return 'us-west-2';
      case TranscribeRegion.apNortheast_2:
        return 'ap-northeast-2';
      case TranscribeRegion.apSoutheast_2:
        return 'ap-southeast-2';
      case TranscribeRegion.apNortheast_1:
        return 'ap-northeast-1';
      case TranscribeRegion.caCentral_1:
        return 'ca-central-1';
      case TranscribeRegion.euCentral_1:
        return 'eu-central-1';
      case TranscribeRegion.euWest_1:
        return 'eu-west-1';
      case TranscribeRegion.euWest_2:
        return 'eu-west-2';
      case TranscribeRegion.saEast_1:
        return 'sa-east-1';
      case TranscribeRegion.auto:
        return 'auto';
      case TranscribeRegion.usGovWest_1:
        return 'us-gov-west-1';
    }
  }
}

extension TranscribeRegionFromString on String {
  TranscribeRegion toTranscribeRegion() {
    switch (this) {
      case 'us-east-2':
        return TranscribeRegion.usEast_2;
      case 'us-east-1':
        return TranscribeRegion.usEast_1;
      case 'us-west-2':
        return TranscribeRegion.usWest_2;
      case 'ap-northeast-2':
        return TranscribeRegion.apNortheast_2;
      case 'ap-southeast-2':
        return TranscribeRegion.apSoutheast_2;
      case 'ap-northeast-1':
        return TranscribeRegion.apNortheast_1;
      case 'ca-central-1':
        return TranscribeRegion.caCentral_1;
      case 'eu-central-1':
        return TranscribeRegion.euCentral_1;
      case 'eu-west-1':
        return TranscribeRegion.euWest_1;
      case 'eu-west-2':
        return TranscribeRegion.euWest_2;
      case 'sa-east-1':
        return TranscribeRegion.saEast_1;
      case 'auto':
        return TranscribeRegion.auto;
      case 'us-gov-west-1':
        return TranscribeRegion.usGovWest_1;
    }
    throw Exception('$this is not known in enum TranscribeRegion');
  }
}

enum TranscribeVocabularyFilterMethod {
  remove,
  mask,
  tag,
}

extension TranscribeVocabularyFilterMethodValueExtension
    on TranscribeVocabularyFilterMethod {
  String toValue() {
    switch (this) {
      case TranscribeVocabularyFilterMethod.remove:
        return 'remove';
      case TranscribeVocabularyFilterMethod.mask:
        return 'mask';
      case TranscribeVocabularyFilterMethod.tag:
        return 'tag';
    }
  }
}

extension TranscribeVocabularyFilterMethodFromString on String {
  TranscribeVocabularyFilterMethod toTranscribeVocabularyFilterMethod() {
    switch (this) {
      case 'remove':
        return TranscribeVocabularyFilterMethod.remove;
      case 'mask':
        return TranscribeVocabularyFilterMethod.mask;
      case 'tag':
        return TranscribeVocabularyFilterMethod.tag;
    }
    throw Exception(
        '$this is not known in enum TranscribeVocabularyFilterMethod');
  }
}

/// The configuration for the current transcription operation. Must contain
/// <code>EngineTranscribeSettings</code> or
/// <code>EngineTranscribeMedicalSettings</code>.
class TranscriptionConfiguration {
  /// The transcription configuration settings passed to Amazon Transcribe
  /// Medical.
  final EngineTranscribeMedicalSettings? engineTranscribeMedicalSettings;

  /// The transcription configuration settings passed to Amazon Transcribe.
  final EngineTranscribeSettings? engineTranscribeSettings;

  TranscriptionConfiguration({
    this.engineTranscribeMedicalSettings,
    this.engineTranscribeSettings,
  });

  Map<String, dynamic> toJson() {
    final engineTranscribeMedicalSettings =
        this.engineTranscribeMedicalSettings;
    final engineTranscribeSettings = this.engineTranscribeSettings;
    return {
      if (engineTranscribeMedicalSettings != null)
        'EngineTranscribeMedicalSettings': engineTranscribeMedicalSettings,
      if (engineTranscribeSettings != null)
        'EngineTranscribeSettings': engineTranscribeSettings,
    };
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

class UpdateAttendeeCapabilitiesResponse {
  /// The updated attendee data.
  final Attendee? attendee;

  UpdateAttendeeCapabilitiesResponse({
    this.attendee,
  });

  factory UpdateAttendeeCapabilitiesResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAttendeeCapabilitiesResponse(
      attendee: json['Attendee'] != null
          ? Attendee.fromJson(json['Attendee'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attendee = this.attendee;
    return {
      if (attendee != null) 'Attendee': attendee,
    };
  }
}

/// The video features set for the meeting. Applies to all attendees.
/// <note>
/// If you specify <code>MeetingFeatures:Video:MaxResolution:None</code> when
/// you create a meeting, all API requests that include
/// <code>SendReceive</code>, <code>Send</code>, or <code>Receive</code> for
/// <code>AttendeeCapabilities:Video</code> will be rejected with
/// <code>ValidationError 400</code>.
/// </note>
class VideoFeatures {
  /// The maximum video resolution for the meeting. Applies to all attendees.
  /// <note>
  /// Defaults to <code>HD</code>. To use <code>FHD</code>, you must also provide
  /// a <code>MeetingFeatures:Attendee:MaxCount</code> value and override the
  /// default size limit of 250 attendees.
  /// </note>
  final VideoResolution? maxResolution;

  VideoFeatures({
    this.maxResolution,
  });

  factory VideoFeatures.fromJson(Map<String, dynamic> json) {
    return VideoFeatures(
      maxResolution: (json['MaxResolution'] as String?)?.toVideoResolution(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxResolution = this.maxResolution;
    return {
      if (maxResolution != null) 'MaxResolution': maxResolution.toValue(),
    };
  }
}

enum VideoResolution {
  none,
  hd,
  fhd,
}

extension VideoResolutionValueExtension on VideoResolution {
  String toValue() {
    switch (this) {
      case VideoResolution.none:
        return 'None';
      case VideoResolution.hd:
        return 'HD';
      case VideoResolution.fhd:
        return 'FHD';
    }
  }
}

extension VideoResolutionFromString on String {
  VideoResolution toVideoResolution() {
    switch (this) {
      case 'None':
        return VideoResolution.none;
      case 'HD':
        return VideoResolution.hd;
      case 'FHD':
        return VideoResolution.fhd;
    }
    throw Exception('$this is not known in enum VideoResolution');
  }
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

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

class UnprocessableEntityException extends _s.GenericAwsException {
  UnprocessableEntityException({String? type, String? message})
      : super(
            type: type, code: 'UnprocessableEntityException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceFailureException': (type, message) =>
      ServiceFailureException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'UnprocessableEntityException': (type, message) =>
      UnprocessableEntityException(type: type, message: message),
};
