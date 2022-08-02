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

/// The Amazon Chime SDK meetings APIs in this section allow software developers
/// to create Amazon Chime SDK meetings, set the AWS Regions for meetings,
/// create and manage users, and send and receive meeting notifications. For
/// more information about the meeting APIs, see <a
/// href="https://docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Meetings.html">Amazon
/// Chime SDK meetings</a>.
class ChimeSdkMeetings {
  final _s.RestJsonProtocol _protocol;
  ChimeSdkMeetings({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

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
    ArgumentError.checkNotNull(attendees, 'attendees');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
  /// content streams, remote attendess can receive those streams, but only
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
    ArgumentError.checkNotNull(capabilities, 'capabilities');
    ArgumentError.checkNotNull(excludedAttendeeIds, 'excludedAttendeeIds');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
  /// content streams, remote attendess can receive those streams, but only
  /// after media renegotiation between the client and the Amazon Chime back-end
  /// server.
  /// </li>
  /// </ul>
  Future<CreateAttendeeResponse> createAttendee({
    required String externalUserId,
    required String meetingId,
    AttendeeCapabilities? capabilities,
  }) async {
    ArgumentError.checkNotNull(externalUserId, 'externalUserId');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
  /// Available values in AWS GovCloud (US) Regions: <code>us-gov-east-1</code>,
  /// <code>us-gov-west-1</code>.
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
    List<String>? tenantIds,
  }) async {
    ArgumentError.checkNotNull(externalMeetingId, 'externalMeetingId');
    ArgumentError.checkNotNull(mediaRegion, 'mediaRegion');
    final $payload = <String, dynamic>{
      'ExternalMeetingId': externalMeetingId,
      'MediaRegion': mediaRegion,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (meetingFeatures != null) 'MeetingFeatures': meetingFeatures,
      if (meetingHostId != null) 'MeetingHostId': meetingHostId,
      if (notificationsConfiguration != null)
        'NotificationsConfiguration': notificationsConfiguration,
      if (primaryMeetingId != null) 'PrimaryMeetingId': primaryMeetingId,
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
  /// Available values in AWS GovCloud (US) Regions: <code>us-gov-east-1</code>,
  /// <code>us-gov-west-1</code>.
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
    List<String>? tenantIds,
  }) async {
    ArgumentError.checkNotNull(attendees, 'attendees');
    ArgumentError.checkNotNull(externalMeetingId, 'externalMeetingId');
    ArgumentError.checkNotNull(mediaRegion, 'mediaRegion');
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
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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

  /// Starts transcription for the specified <code>meetingId</code>.
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
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    ArgumentError.checkNotNull(
        transcriptionConfiguration, 'transcriptionConfiguration');
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

  /// Stops transcription for the specified <code>meetingId</code>.
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
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/transcription?operation=stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The capabilties that you want to update.
  /// <note>
  /// You use the capabilities with a set of values that control what the
  /// capabilities can do, such as <code>SendReceive</code> data. For more
  /// information about those values, see .
  /// </note>
  /// When using capabilities, be aware of these corner cases:
  ///
  /// <ul>
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
  /// content streams, remote attendess can receive those streams, but only
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
  ///
  /// Parameter [attendeeId] :
  /// The ID of the attendee associated with the update request.
  ///
  /// Parameter [capabilities] :
  /// The capabilties that you want to update.
  ///
  /// Parameter [meetingId] :
  /// The ID of the meeting associated with the update request.
  Future<UpdateAttendeeCapabilitiesResponse> updateAttendeeCapabilities({
    required String attendeeId,
    required AttendeeCapabilities capabilities,
    required String meetingId,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    ArgumentError.checkNotNull(capabilities, 'capabilities');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
  /// content streams, remote attendess can receive those streams, but only after
  /// media renegotiation between the client and the Amazon Chime back-end server.
  /// </li>
  /// </ul>
  final AttendeeCapabilities? capabilities;

  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application.
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
/// information about those values, see .
/// </note>
/// When using capabilities, be aware of these corner cases:
///
/// <ul>
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
/// content streams, remote attendess can receive those streams, but only after
/// media renegotiation between the client and the Amazon Chime back-end server.
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

/// A structure that contains one or more attendee IDs.
class AttendeeIdItem {
  /// A list of one or more attendee IDs.
  final String attendeeId;

  AttendeeIdItem({
    required this.attendeeId,
  });

  factory AttendeeIdItem.fromJson(Map<String, dynamic> json) {
    return AttendeeIdItem(
      attendeeId: json['AttendeeId'] as String,
    );
  }

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
  final String externalUserId;

  /// A list of one or more capabilities.
  final AttendeeCapabilities? capabilities;

  CreateAttendeeRequestItem({
    required this.externalUserId,
    this.capabilities,
  });

  factory CreateAttendeeRequestItem.fromJson(Map<String, dynamic> json) {
    return CreateAttendeeRequestItem(
      externalUserId: json['ExternalUserId'] as String,
      capabilities: json['Capabilities'] != null
          ? AttendeeCapabilities.fromJson(
              json['Capabilities'] as Map<String, dynamic>)
          : null,
    );
  }

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

  /// The AWS Region passed to Amazon Transcribe Medical. If you don't specify a
  /// Region, Amazon Chime uses the meeting's Region.
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

  factory EngineTranscribeMedicalSettings.fromJson(Map<String, dynamic> json) {
    return EngineTranscribeMedicalSettings(
      languageCode:
          (json['LanguageCode'] as String).toTranscribeMedicalLanguageCode(),
      specialty: (json['Specialty'] as String).toTranscribeMedicalSpecialty(),
      type: (json['Type'] as String).toTranscribeMedicalType(),
      contentIdentificationType: (json['ContentIdentificationType'] as String?)
          ?.toTranscribeMedicalContentIdentificationType(),
      region: (json['Region'] as String?)?.toTranscribeMedicalRegion(),
      vocabularyName: json['VocabularyName'] as String?,
    );
  }

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

/// Settings specific to the Amazon Transcribe engine.
class EngineTranscribeSettings {
  /// Set this field to <code>PII</code> to identify personally identifiable
  /// information in the transcription output.
  final TranscribeContentIdentificationType? contentIdentificationType;

  /// Set this field to <code>PII</code> to redact personally identifiable
  /// information in the transcription output. Content redaction is performed only
  /// upon complete transcription of the audio segments.
  ///
  /// You can’t set <code>ContentRedactionType</code> and
  /// <code>ContentIdentificationType</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>.
  final TranscribeContentRedactionType? contentRedactionType;

  /// Generates partial transcription results that are less likely to change as
  /// meeting attendees speak. It does so by only allowing the last few words from
  /// the partial results to change.
  final bool? enablePartialResultsStabilization;

  /// Automatically identifies the language spoken in media files.
  final bool? identifyLanguage;

  /// The language code specified for the Amazon Transcribe engine.
  final TranscribeLanguageCode? languageCode;

  /// The name of the language model used during transcription.
  final String? languageModelName;

  /// Language codes for the languages that you want to identify. You must provide
  /// at least 2 codes.
  final String? languageOptions;

  /// The stabity level of a partial results transcription. Determines how stable
  /// you want the transcription results to be. A higher level means the
  /// transcription results are less likely to change.
  final TranscribePartialResultsStability? partialResultsStability;

  /// Lists the PII entity types you want to identify or redact. To specify entity
  /// types, you must enable <code>ContentIdentificationType</code> or
  /// <code>ContentRedactionType</code>.
  ///
  /// <code>PIIEntityTypes</code> must be comma-separated. The available values
  /// are: <code>BANK_ACCOUNT_NUMBER</code>, <code>BANK_ROUTING,
  /// CREDIT_DEBIT_NUMBER</code>, <code>CREDIT_DEBIT_CVV</code>,
  /// <code>CREDIT_DEBIT_EXPIRY</code>, <code>PIN</code>, <code>EMAIL</code>,
  /// <code>ADDRESS</code>, <code>NAME</code>, <code>PHONE</code>,
  /// <code>SSN</code>, and <code>ALL</code>.
  ///
  /// <code>PiiEntityTypes</code> is an optional parameter with a default value of
  /// <code>ALL</code>.
  final String? piiEntityTypes;

  /// Language code for the preferred language.
  final TranscribeLanguageCode? preferredLanguage;

  /// The AWS Region passed to Amazon Transcribe. If you don't specify a Region,
  /// Amazon Chime uses the meeting's Region.
  final TranscribeRegion? region;

  /// The filtering method passed to Amazon Transcribe.
  final TranscribeVocabularyFilterMethod? vocabularyFilterMethod;

  /// The name of the vocabulary filter passed to Amazon Transcribe.
  final String? vocabularyFilterName;

  /// The name of the vocabulary passed to Amazon Transcribe.
  final String? vocabularyName;

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
    this.vocabularyName,
  });

  factory EngineTranscribeSettings.fromJson(Map<String, dynamic> json) {
    return EngineTranscribeSettings(
      contentIdentificationType: (json['ContentIdentificationType'] as String?)
          ?.toTranscribeContentIdentificationType(),
      contentRedactionType: (json['ContentRedactionType'] as String?)
          ?.toTranscribeContentRedactionType(),
      enablePartialResultsStabilization:
          json['EnablePartialResultsStabilization'] as bool?,
      identifyLanguage: json['IdentifyLanguage'] as bool?,
      languageCode:
          (json['LanguageCode'] as String?)?.toTranscribeLanguageCode(),
      languageModelName: json['LanguageModelName'] as String?,
      languageOptions: json['LanguageOptions'] as String?,
      partialResultsStability: (json['PartialResultsStability'] as String?)
          ?.toTranscribePartialResultsStability(),
      piiEntityTypes: json['PiiEntityTypes'] as String?,
      preferredLanguage:
          (json['PreferredLanguage'] as String?)?.toTranscribeLanguageCode(),
      region: (json['Region'] as String?)?.toTranscribeRegion(),
      vocabularyFilterMethod: (json['VocabularyFilterMethod'] as String?)
          ?.toTranscribeVocabularyFilterMethod(),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
      vocabularyName: json['VocabularyName'] as String?,
    );
  }

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
    final vocabularyName = this.vocabularyName;
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
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
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

enum MediaCapabilities {
  sendReceive,
  send,
  receive,
  none,
}

extension on MediaCapabilities {
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

extension on String {
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
  final String? screenDataUrl;

  /// The screen sharing URL.
  final String? screenSharingUrl;

  /// The screen viewing URL.
  final String? screenViewingUrl;

  /// The signaling URL.
  final String? signalingUrl;

  /// The turn control URL.
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
  /// Available values in AWS GovCloud (US) Regions: <code>us-gov-east-1</code>,
  /// <code>us-gov-west-1</code>.
  final String? mediaRegion;

  /// The features available to a meeting, such as Amazon Voice Focus.
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
    final meetingFeatures = this.meetingFeatures;
    final meetingHostId = this.meetingHostId;
    final meetingId = this.meetingId;
    final primaryMeetingId = this.primaryMeetingId;
    final tenantIds = this.tenantIds;
    return {
      if (externalMeetingId != null) 'ExternalMeetingId': externalMeetingId,
      if (mediaPlacement != null) 'MediaPlacement': mediaPlacement,
      if (mediaRegion != null) 'MediaRegion': mediaRegion,
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

extension on MeetingFeatureStatus {
  String toValue() {
    switch (this) {
      case MeetingFeatureStatus.available:
        return 'AVAILABLE';
      case MeetingFeatureStatus.unavailable:
        return 'UNAVAILABLE';
    }
  }
}

extension on String {
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

/// The configuration settings of the features available to a meeting.&gt;
class MeetingFeaturesConfiguration {
  /// The configuration settings for the audio features available to a meeting.
  final AudioFeatures? audio;

  MeetingFeaturesConfiguration({
    this.audio,
  });

  factory MeetingFeaturesConfiguration.fromJson(Map<String, dynamic> json) {
    return MeetingFeaturesConfiguration(
      audio: json['Audio'] != null
          ? AudioFeatures.fromJson(json['Audio'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    return {
      if (audio != null) 'Audio': audio,
    };
  }
}

/// The configuration for resource targets to receive notifications when meeting
/// and attendee events occur.
class NotificationsConfiguration {
  /// The ARN of the AWS Lambda function in the notifications configuration.
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

  factory NotificationsConfiguration.fromJson(Map<String, dynamic> json) {
    return NotificationsConfiguration(
      lambdaFunctionArn: json['LambdaFunctionArn'] as String?,
      snsTopicArn: json['SnsTopicArn'] as String?,
      sqsQueueArn: json['SqsQueueArn'] as String?,
    );
  }

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

enum TranscribeContentIdentificationType {
  pii,
}

extension on TranscribeContentIdentificationType {
  String toValue() {
    switch (this) {
      case TranscribeContentIdentificationType.pii:
        return 'PII';
    }
  }
}

extension on String {
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

extension on TranscribeContentRedactionType {
  String toValue() {
    switch (this) {
      case TranscribeContentRedactionType.pii:
        return 'PII';
    }
  }
}

extension on String {
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
}

extension on TranscribeLanguageCode {
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
    }
  }
}

extension on String {
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
    }
    throw Exception('$this is not known in enum TranscribeLanguageCode');
  }
}

enum TranscribeMedicalContentIdentificationType {
  phi,
}

extension on TranscribeMedicalContentIdentificationType {
  String toValue() {
    switch (this) {
      case TranscribeMedicalContentIdentificationType.phi:
        return 'PHI';
    }
  }
}

extension on String {
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

extension on TranscribeMedicalLanguageCode {
  String toValue() {
    switch (this) {
      case TranscribeMedicalLanguageCode.enUs:
        return 'en-US';
    }
  }
}

extension on String {
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

extension on TranscribeMedicalRegion {
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

extension on String {
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

extension on TranscribeMedicalSpecialty {
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

extension on String {
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

extension on TranscribeMedicalType {
  String toValue() {
    switch (this) {
      case TranscribeMedicalType.conversation:
        return 'CONVERSATION';
      case TranscribeMedicalType.dictation:
        return 'DICTATION';
    }
  }
}

extension on String {
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

extension on TranscribePartialResultsStability {
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

extension on String {
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

extension on TranscribeRegion {
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

extension on String {
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

extension on TranscribeVocabularyFilterMethod {
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

extension on String {
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

  factory TranscriptionConfiguration.fromJson(Map<String, dynamic> json) {
    return TranscriptionConfiguration(
      engineTranscribeMedicalSettings:
          json['EngineTranscribeMedicalSettings'] != null
              ? EngineTranscribeMedicalSettings.fromJson(
                  json['EngineTranscribeMedicalSettings']
                      as Map<String, dynamic>)
              : null,
      engineTranscribeSettings: json['EngineTranscribeSettings'] != null
          ? EngineTranscribeSettings.fromJson(
              json['EngineTranscribeSettings'] as Map<String, dynamic>)
          : null,
    );
  }

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
  'ServiceFailureException': (type, message) =>
      ServiceFailureException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'UnprocessableEntityException': (type, message) =>
      UnprocessableEntityException(type: type, message: message),
};
