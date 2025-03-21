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
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Operations_Amazon_Connect_Contact_Lens.html">Contact
/// Lens actions</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/connect/latest/APIReference/API_Types_Amazon_Connect_Contact_Lens.html">Contact
/// Lens data types</a>
/// </li>
/// </ul>
/// Amazon Connect Contact Lens enables you to analyze conversations between
/// customer and agents, by using speech transcription, natural language
/// processing, and intelligent search capabilities. It performs sentiment
/// analysis, detects issues, and enables you to automatically categorize
/// contacts.
///
/// Amazon Connect Contact Lens provides both real-time and post-call analytics
/// of customer-agent conversations. For more information, see <a
/// href="https://docs.aws.amazon.com/connect/latest/adminguide/analyze-conversations.html">Analyze
/// conversations using speech analytics</a> in the <i>Amazon Connect
/// Administrator Guide</i>.
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
  /// The maximum number of results to return per page.
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
          .nonNulls
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
          .nonNulls
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
          .nonNulls
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

/// Information about the post-contact summary.
class PostContactSummary {
  /// Whether the summary was successfully COMPLETED or FAILED to be generated.
  final PostContactSummaryStatus status;

  /// The content of the summary.
  final String? content;

  /// If the summary failed to be generated, one of the following failure codes
  /// occurs:
  ///
  /// <ul>
  /// <li>
  /// <code>QUOTA_EXCEEDED</code>: The number of concurrent analytics jobs reached
  /// your service quota.
  /// </li>
  /// <li>
  /// <code>INSUFFICIENT_CONVERSATION_CONTENT</code>: The conversation needs to
  /// have at least one turn from both the participants in order to generate the
  /// summary.
  /// </li>
  /// <li>
  /// <code>FAILED_SAFETY_GUIDELINES</code>: The generated summary cannot be
  /// provided because it failed to meet system safety guidelines.
  /// </li>
  /// <li>
  /// <code>INVALID_ANALYSIS_CONFIGURATION</code>: This code occurs when, for
  /// example, you're using a <a
  /// href="https://docs.aws.amazon.com/connect/latest/adminguide/supported-languages.html#supported-languages-contact-lens">language</a>
  /// that isn't supported by generative AI-powered post-contact summaries.
  /// </li>
  /// <li>
  /// <code>INTERNAL_ERROR</code>: Internal system error.
  /// </li>
  /// </ul>
  final PostContactSummaryFailureCode? failureCode;

  PostContactSummary({
    required this.status,
    this.content,
    this.failureCode,
  });

  factory PostContactSummary.fromJson(Map<String, dynamic> json) {
    return PostContactSummary(
      status: PostContactSummaryStatus.fromString((json['Status'] as String)),
      content: json['Content'] as String?,
      failureCode: (json['FailureCode'] as String?)
          ?.let(PostContactSummaryFailureCode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final content = this.content;
    final failureCode = this.failureCode;
    return {
      'Status': status.value,
      if (content != null) 'Content': content,
      if (failureCode != null) 'FailureCode': failureCode.value,
    };
  }
}

enum PostContactSummaryFailureCode {
  quotaExceeded('QUOTA_EXCEEDED'),
  insufficientConversationContent('INSUFFICIENT_CONVERSATION_CONTENT'),
  failedSafetyGuidelines('FAILED_SAFETY_GUIDELINES'),
  invalidAnalysisConfiguration('INVALID_ANALYSIS_CONFIGURATION'),
  internalError('INTERNAL_ERROR'),
  ;

  final String value;

  const PostContactSummaryFailureCode(this.value);

  static PostContactSummaryFailureCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum PostContactSummaryFailureCode'));
}

enum PostContactSummaryStatus {
  failed('FAILED'),
  completed('COMPLETED'),
  ;

  final String value;

  const PostContactSummaryStatus(this.value);

  static PostContactSummaryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum PostContactSummaryStatus'));
}

/// An analyzed segment for a real-time analysis session.
class RealtimeContactAnalysisSegment {
  /// The matched category rules.
  final Categories? categories;

  /// Information about the post-contact summary.
  final PostContactSummary? postContactSummary;

  /// The analyzed transcript.
  final Transcript? transcript;

  RealtimeContactAnalysisSegment({
    this.categories,
    this.postContactSummary,
    this.transcript,
  });

  factory RealtimeContactAnalysisSegment.fromJson(Map<String, dynamic> json) {
    return RealtimeContactAnalysisSegment(
      categories: json['Categories'] != null
          ? Categories.fromJson(json['Categories'] as Map<String, dynamic>)
          : null,
      postContactSummary: json['PostContactSummary'] != null
          ? PostContactSummary.fromJson(
              json['PostContactSummary'] as Map<String, dynamic>)
          : null,
      transcript: json['Transcript'] != null
          ? Transcript.fromJson(json['Transcript'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final postContactSummary = this.postContactSummary;
    final transcript = this.transcript;
    return {
      if (categories != null) 'Categories': categories,
      if (postContactSummary != null) 'PostContactSummary': postContactSummary,
      if (transcript != null) 'Transcript': transcript,
    };
  }
}

enum SentimentValue {
  positive('POSITIVE'),
  neutral('NEUTRAL'),
  negative('NEGATIVE'),
  ;

  final String value;

  const SentimentValue(this.value);

  static SentimentValue fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SentimentValue'));
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

  /// The identifier of the participant. Valid values are CUSTOMER or AGENT.
  final String participantId;

  /// The role of participant. For example, is it a customer, agent, or system.
  final String participantRole;

  /// The sentiment detected for this piece of transcript.
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
      sentiment: SentimentValue.fromString((json['Sentiment'] as String)),
      issuesDetected: (json['IssuesDetected'] as List?)
          ?.nonNulls
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
      'Sentiment': sentiment.value,
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
