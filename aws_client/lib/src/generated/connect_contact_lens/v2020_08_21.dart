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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'contact-lens',
            signingName: 'connect',
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
    required String contactId,
    required String instanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
class Categories {
  /// The category rules that have been matched in the analyzed segment.
  final List<String> matchedCategories;

  /// The category rule that was matched and when it occurred in the transcript.
  final Map<String, CategoryDetails> matchedDetails;

  Categories({
    required this.matchedCategories,
    required this.matchedDetails,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      matchedCategories: (json['MatchedCategories'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      matchedDetails: (json['MatchedDetails'] as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry(k, CategoryDetails.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final matchedCategories = this.matchedCategories;
    final matchedDetails = this.matchedDetails;
    return {
      'MatchedCategories': matchedCategories,
      'MatchedDetails': matchedDetails,
    };
  }
}

/// Provides information about the category rule that was matched.
class CategoryDetails {
  /// The section of audio where the category rule was detected.
  final List<PointOfInterest> pointsOfInterest;

  CategoryDetails({
    required this.pointsOfInterest,
  });

  factory CategoryDetails.fromJson(Map<String, dynamic> json) {
    return CategoryDetails(
      pointsOfInterest: (json['PointsOfInterest'] as List)
          .whereNotNull()
          .map((e) => PointOfInterest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pointsOfInterest = this.pointsOfInterest;
    return {
      'PointsOfInterest': pointsOfInterest,
    };
  }
}

/// For characters that were detected as issues, where they occur in the
/// transcript.
class CharacterOffsets {
  /// The beginning of the issue.
  final int beginOffsetChar;

  /// The end of the issue.
  final int endOffsetChar;

  CharacterOffsets({
    required this.beginOffsetChar,
    required this.endOffsetChar,
  });

  factory CharacterOffsets.fromJson(Map<String, dynamic> json) {
    return CharacterOffsets(
      beginOffsetChar: json['BeginOffsetChar'] as int,
      endOffsetChar: json['EndOffsetChar'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffsetChar = this.beginOffsetChar;
    final endOffsetChar = this.endOffsetChar;
    return {
      'BeginOffsetChar': beginOffsetChar,
      'EndOffsetChar': endOffsetChar,
    };
  }
}

/// Potential issues that are detected based on an artificial intelligence
/// analysis of each turn in the conversation.
class IssueDetected {
  /// The offset for when the issue was detected in the segment.
  final CharacterOffsets characterOffsets;

  IssueDetected({
    required this.characterOffsets,
  });

  factory IssueDetected.fromJson(Map<String, dynamic> json) {
    return IssueDetected(
      characterOffsets: CharacterOffsets.fromJson(
          json['CharacterOffsets'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final characterOffsets = this.characterOffsets;
    return {
      'CharacterOffsets': characterOffsets,
    };
  }
}

class ListRealtimeContactAnalysisSegmentsResponse {
  /// An analyzed transcript or category.
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
  final String? nextToken;

  ListRealtimeContactAnalysisSegmentsResponse({
    required this.segments,
    this.nextToken,
  });

  factory ListRealtimeContactAnalysisSegmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRealtimeContactAnalysisSegmentsResponse(
      segments: (json['Segments'] as List)
          .whereNotNull()
          .map((e) => RealtimeContactAnalysisSegment.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final segments = this.segments;
    final nextToken = this.nextToken;
    return {
      'Segments': segments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The section of the contact audio where that category rule was detected.
class PointOfInterest {
  /// The beginning offset in milliseconds where the category rule was detected.
  final int beginOffsetMillis;

  /// The ending offset in milliseconds where the category rule was detected.
  final int endOffsetMillis;

  PointOfInterest({
    required this.beginOffsetMillis,
    required this.endOffsetMillis,
  });

  factory PointOfInterest.fromJson(Map<String, dynamic> json) {
    return PointOfInterest(
      beginOffsetMillis: json['BeginOffsetMillis'] as int,
      endOffsetMillis: json['EndOffsetMillis'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffsetMillis = this.beginOffsetMillis;
    final endOffsetMillis = this.endOffsetMillis;
    return {
      'BeginOffsetMillis': beginOffsetMillis,
      'EndOffsetMillis': endOffsetMillis,
    };
  }
}

/// An analyzed segment for a real-time analysis session.
class RealtimeContactAnalysisSegment {
  /// The matched category rules.
  final Categories? categories;

  /// The analyzed transcript.
  final Transcript? transcript;

  RealtimeContactAnalysisSegment({
    this.categories,
    this.transcript,
  });

  factory RealtimeContactAnalysisSegment.fromJson(Map<String, dynamic> json) {
    return RealtimeContactAnalysisSegment(
      categories: json['Categories'] != null
          ? Categories.fromJson(json['Categories'] as Map<String, dynamic>)
          : null,
      transcript: json['Transcript'] != null
          ? Transcript.fromJson(json['Transcript'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final transcript = this.transcript;
    return {
      if (categories != null) 'Categories': categories,
      if (transcript != null) 'Transcript': transcript,
    };
  }
}

enum SentimentValue {
  positive,
  neutral,
  negative,
}

extension SentimentValueValueExtension on SentimentValue {
  String toValue() {
    switch (this) {
      case SentimentValue.positive:
        return 'POSITIVE';
      case SentimentValue.neutral:
        return 'NEUTRAL';
      case SentimentValue.negative:
        return 'NEGATIVE';
    }
  }
}

extension SentimentValueFromString on String {
  SentimentValue toSentimentValue() {
    switch (this) {
      case 'POSITIVE':
        return SentimentValue.positive;
      case 'NEUTRAL':
        return SentimentValue.neutral;
      case 'NEGATIVE':
        return SentimentValue.negative;
    }
    throw Exception('$this is not known in enum SentimentValue');
  }
}

/// A list of messages in the session.
class Transcript {
  /// The beginning offset in the contact for this transcript.
  final int beginOffsetMillis;

  /// The content of the transcript.
  final String content;

  /// The end offset in the contact for this transcript.
  final int endOffsetMillis;

  /// The identifier of the transcript.
  final String id;

  /// The identifier of the participant.
  final String participantId;

  /// The role of participant. For example, is it a customer, agent, or system.
  final String participantRole;

  /// The sentiment of the detected for this piece of transcript.
  final SentimentValue sentiment;

  /// List of positions where issues were detected on the transcript.
  final List<IssueDetected>? issuesDetected;

  Transcript({
    required this.beginOffsetMillis,
    required this.content,
    required this.endOffsetMillis,
    required this.id,
    required this.participantId,
    required this.participantRole,
    required this.sentiment,
    this.issuesDetected,
  });

  factory Transcript.fromJson(Map<String, dynamic> json) {
    return Transcript(
      beginOffsetMillis: json['BeginOffsetMillis'] as int,
      content: json['Content'] as String,
      endOffsetMillis: json['EndOffsetMillis'] as int,
      id: json['Id'] as String,
      participantId: json['ParticipantId'] as String,
      participantRole: json['ParticipantRole'] as String,
      sentiment: (json['Sentiment'] as String).toSentimentValue(),
      issuesDetected: (json['IssuesDetected'] as List?)
          ?.whereNotNull()
          .map((e) => IssueDetected.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffsetMillis = this.beginOffsetMillis;
    final content = this.content;
    final endOffsetMillis = this.endOffsetMillis;
    final id = this.id;
    final participantId = this.participantId;
    final participantRole = this.participantRole;
    final sentiment = this.sentiment;
    final issuesDetected = this.issuesDetected;
    return {
      'BeginOffsetMillis': beginOffsetMillis,
      'Content': content,
      'EndOffsetMillis': endOffsetMillis,
      'Id': id,
      'ParticipantId': participantId,
      'ParticipantRole': participantRole,
      'Sentiment': sentiment.toValue(),
      if (issuesDetected != null) 'IssuesDetected': issuesDetected,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
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
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
