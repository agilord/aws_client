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

part '2020-08-21.g.dart';

/// Contact Lens for Amazon Connect enables you to analyze conversations between
/// customer and agents, by using speech transcription, natural language
/// processing, and intelligent search capabilities. It performs sentiment
/// analysis, detects issues, and enables you to automatically categorize
/// contacts.
///
/// Contact Lens for Amazon Connect provides both real-time and post-call
/// analytics of customer-agent conversations. For more information, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/analyze-conversations.html">Analyze
/// conversations using Contact Lens</a> in the <i>Amazon Connect Administrator
/// Guide</i>.
class ConnectContactLens {
  final _s.RestJsonProtocol _protocol;
  ConnectContactLens({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'contact-lens',
            signingName: 'connect',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Provides a list of analysis segments for a real-time analysis session.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [contactId] :
  /// The identifier of the contact.
  ///
  /// Parameter [instanceId] :
  /// The identifier of the Amazon Connect instance.
  ///
  /// Parameter [maxResults] :
  /// The maximimum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListRealtimeContactAnalysisSegmentsResponse>
      listRealtimeContactAnalysisSegments({
    @_s.required String contactId,
    @_s.required String instanceId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    _s.validateStringLength(
      'contactId',
      contactId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'contactId',
      contactId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceId, 'instanceId');
    _s.validateStringLength(
      'instanceId',
      instanceId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'instanceId',
      instanceId,
      r'''.*\S.*''',
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
      131070,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*\S.*''',
    );
    final $payload = <String, dynamic>{
      'ContactId': contactId,
      'InstanceId': instanceId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/realtime-contact-analysis/analysis-segments',
      exceptionFnMap: _exceptionFns,
    );
    return ListRealtimeContactAnalysisSegmentsResponse.fromJson(response);
  }
}

/// Provides the category rules that are used to automatically categorize
/// contacts based on uttered keywords and phrases.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Categories {
  /// The category rules that have been matched in the analyzed segment.
  @_s.JsonKey(name: 'MatchedCategories')
  final List<String> matchedCategories;

  /// The category rule that was matched and when it occurred in the transcript.
  @_s.JsonKey(name: 'MatchedDetails')
  final Map<String, CategoryDetails> matchedDetails;

  Categories({
    @_s.required this.matchedCategories,
    @_s.required this.matchedDetails,
  });
  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}

/// Provides information about the category rule that was matched.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CategoryDetails {
  /// The section of audio where the category rule was detected.
  @_s.JsonKey(name: 'PointsOfInterest')
  final List<PointOfInterest> pointsOfInterest;

  CategoryDetails({
    @_s.required this.pointsOfInterest,
  });
  factory CategoryDetails.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailsFromJson(json);
}

/// For characters that were detected as issues, where they occur in the
/// transcript.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CharacterOffsets {
  /// The beginning of the issue.
  @_s.JsonKey(name: 'BeginOffsetChar')
  final int beginOffsetChar;

  /// The end of the issue.
  @_s.JsonKey(name: 'EndOffsetChar')
  final int endOffsetChar;

  CharacterOffsets({
    @_s.required this.beginOffsetChar,
    @_s.required this.endOffsetChar,
  });
  factory CharacterOffsets.fromJson(Map<String, dynamic> json) =>
      _$CharacterOffsetsFromJson(json);
}

/// Potential issues that are detected based on an artificial intelligence
/// analysis of each turn in the conversation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IssueDetected {
  /// The offset for when the issue was detected in the segment.
  @_s.JsonKey(name: 'CharacterOffsets')
  final CharacterOffsets characterOffsets;

  IssueDetected({
    @_s.required this.characterOffsets,
  });
  factory IssueDetected.fromJson(Map<String, dynamic> json) =>
      _$IssueDetectedFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRealtimeContactAnalysisSegmentsResponse {
  /// An analyzed transcript or category.
  @_s.JsonKey(name: 'Segments')
  final List<RealtimeContactAnalysisSegment> segments;

  /// If there are additional results, this is the token for the next set of
  /// results. If response includes <code>nextToken</code> there are two possible
  /// scenarios:
  ///
  /// <ul>
  /// <li>
  /// There are more segments so another call is required to get them.
  /// </li>
  /// <li>
  /// There are no more segments at this time, but more may be available later
  /// (real-time analysis is in progress) so the client should call the operation
  /// again to get new segments.
  /// </li>
  /// </ul>
  /// If response does not include <code>nextToken</code>, the analysis is
  /// completed (successfully or failed) and there are no more segments to
  /// retrieve.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListRealtimeContactAnalysisSegmentsResponse({
    @_s.required this.segments,
    this.nextToken,
  });
  factory ListRealtimeContactAnalysisSegmentsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListRealtimeContactAnalysisSegmentsResponseFromJson(json);
}

/// The section of the contact audio where that category rule was detected.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PointOfInterest {
  /// The beginning offset in milliseconds where the category rule was detected.
  @_s.JsonKey(name: 'BeginOffsetMillis')
  final int beginOffsetMillis;

  /// The ending offset in milliseconds where the category rule was detected.
  @_s.JsonKey(name: 'EndOffsetMillis')
  final int endOffsetMillis;

  PointOfInterest({
    @_s.required this.beginOffsetMillis,
    @_s.required this.endOffsetMillis,
  });
  factory PointOfInterest.fromJson(Map<String, dynamic> json) =>
      _$PointOfInterestFromJson(json);
}

/// An analyzed segment for a real-time analysis session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RealtimeContactAnalysisSegment {
  /// The matched category rules.
  @_s.JsonKey(name: 'Categories')
  final Categories categories;

  /// The analyzed transcript.
  @_s.JsonKey(name: 'Transcript')
  final Transcript transcript;

  RealtimeContactAnalysisSegment({
    this.categories,
    this.transcript,
  });
  factory RealtimeContactAnalysisSegment.fromJson(Map<String, dynamic> json) =>
      _$RealtimeContactAnalysisSegmentFromJson(json);
}

enum SentimentValue {
  @_s.JsonValue('POSITIVE')
  positive,
  @_s.JsonValue('NEUTRAL')
  neutral,
  @_s.JsonValue('NEGATIVE')
  negative,
}

/// A list of messages in the session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Transcript {
  /// The beginning offset in the contact for this transcript.
  @_s.JsonKey(name: 'BeginOffsetMillis')
  final int beginOffsetMillis;

  /// The content of the transcript.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The end offset in the contact for this transcript.
  @_s.JsonKey(name: 'EndOffsetMillis')
  final int endOffsetMillis;

  /// The identifier of the transcript.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The identifier of the participant.
  @_s.JsonKey(name: 'ParticipantId')
  final String participantId;

  /// The role of participant. For example, is it a customer, agent, or system.
  @_s.JsonKey(name: 'ParticipantRole')
  final String participantRole;

  /// The sentiment of the detected for this piece of transcript.
  @_s.JsonKey(name: 'Sentiment')
  final SentimentValue sentiment;

  /// List of positions where issues were detected on the transcript.
  @_s.JsonKey(name: 'IssuesDetected')
  final List<IssueDetected> issuesDetected;

  Transcript({
    @_s.required this.beginOffsetMillis,
    @_s.required this.content,
    @_s.required this.endOffsetMillis,
    @_s.required this.id,
    @_s.required this.participantId,
    @_s.required this.participantRole,
    @_s.required this.sentiment,
    this.issuesDetected,
  });
  factory Transcript.fromJson(Map<String, dynamic> json) =>
      _$TranscriptFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
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
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
