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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
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

/// @nodoc
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
      segments: ((json['Segments'] as List?) ?? const [])
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

/// An analyzed segment for a real-time analysis session.
///
/// @nodoc
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

/// A list of messages in the session.
///
/// @nodoc
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

  /// List of positions where issues were detected on the transcript.
  final List<IssueDetected>? issuesDetected;

  /// The sentiment detected for this piece of transcript.
  final SentimentValue? sentiment;

  Transcript({
    required this.beginOffsetMillis,
    required this.content,
    required this.endOffsetMillis,
    required this.id,
    required this.participantId,
    required this.participantRole,
    this.issuesDetected,
    this.sentiment,
  });

  factory Transcript.fromJson(Map<String, dynamic> json) {
    return Transcript(
      beginOffsetMillis: (json['BeginOffsetMillis'] as int?) ?? 0,
      content: (json['Content'] as String?) ?? '',
      endOffsetMillis: (json['EndOffsetMillis'] as int?) ?? 0,
      id: (json['Id'] as String?) ?? '',
      participantId: (json['ParticipantId'] as String?) ?? '',
      participantRole: (json['ParticipantRole'] as String?) ?? '',
      issuesDetected: (json['IssuesDetected'] as List?)
          ?.nonNulls
          .map((e) => IssueDetected.fromJson(e as Map<String, dynamic>))
          .toList(),
      sentiment: (json['Sentiment'] as String?)?.let(SentimentValue.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffsetMillis = this.beginOffsetMillis;
    final content = this.content;
    final endOffsetMillis = this.endOffsetMillis;
    final id = this.id;
    final participantId = this.participantId;
    final participantRole = this.participantRole;
    final issuesDetected = this.issuesDetected;
    final sentiment = this.sentiment;
    return {
      'BeginOffsetMillis': beginOffsetMillis,
      'Content': content,
      'EndOffsetMillis': endOffsetMillis,
      'Id': id,
      'ParticipantId': participantId,
      'ParticipantRole': participantRole,
      if (issuesDetected != null) 'IssuesDetected': issuesDetected,
      if (sentiment != null) 'Sentiment': sentiment.value,
    };
  }
}

/// Provides the category rules that are used to automatically categorize
/// contacts based on uttered keywords and phrases.
///
/// @nodoc
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
      matchedCategories: ((json['MatchedCategories'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      matchedDetails: ((json['MatchedDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) =>
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

/// Information about the post-contact summary.
///
/// @nodoc
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
      status: PostContactSummaryStatus.fromString(
          (json['Status'] as String?) ?? ''),
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

/// @nodoc
class PostContactSummaryStatus {
  static const failed = PostContactSummaryStatus._('FAILED');
  static const completed = PostContactSummaryStatus._('COMPLETED');

  final String value;

  const PostContactSummaryStatus._(this.value);

  static const values = [failed, completed];

  static PostContactSummaryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PostContactSummaryStatus._(value));

  @override
  bool operator ==(other) =>
      other is PostContactSummaryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PostContactSummaryFailureCode {
  static const quotaExceeded =
      PostContactSummaryFailureCode._('QUOTA_EXCEEDED');
  static const insufficientConversationContent =
      PostContactSummaryFailureCode._('INSUFFICIENT_CONVERSATION_CONTENT');
  static const failedSafetyGuidelines =
      PostContactSummaryFailureCode._('FAILED_SAFETY_GUIDELINES');
  static const invalidAnalysisConfiguration =
      PostContactSummaryFailureCode._('INVALID_ANALYSIS_CONFIGURATION');
  static const internalError =
      PostContactSummaryFailureCode._('INTERNAL_ERROR');

  final String value;

  const PostContactSummaryFailureCode._(this.value);

  static const values = [
    quotaExceeded,
    insufficientConversationContent,
    failedSafetyGuidelines,
    invalidAnalysisConfiguration,
    internalError
  ];

  static PostContactSummaryFailureCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PostContactSummaryFailureCode._(value));

  @override
  bool operator ==(other) =>
      other is PostContactSummaryFailureCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information about the category rule that was matched.
///
/// @nodoc
class CategoryDetails {
  /// The section of audio where the category rule was detected.
  final List<PointOfInterest> pointsOfInterest;

  CategoryDetails({
    required this.pointsOfInterest,
  });

  factory CategoryDetails.fromJson(Map<String, dynamic> json) {
    return CategoryDetails(
      pointsOfInterest: ((json['PointsOfInterest'] as List?) ?? const [])
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

/// The section of the contact audio where that category rule was detected.
///
/// @nodoc
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
      beginOffsetMillis: (json['BeginOffsetMillis'] as int?) ?? 0,
      endOffsetMillis: (json['EndOffsetMillis'] as int?) ?? 0,
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

/// @nodoc
class SentimentValue {
  static const positive = SentimentValue._('POSITIVE');
  static const neutral = SentimentValue._('NEUTRAL');
  static const negative = SentimentValue._('NEGATIVE');

  final String value;

  const SentimentValue._(this.value);

  static const values = [positive, neutral, negative];

  static SentimentValue fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SentimentValue._(value));

  @override
  bool operator ==(other) => other is SentimentValue && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Potential issues that are detected based on an artificial intelligence
/// analysis of each turn in the conversation.
///
/// @nodoc
class IssueDetected {
  /// The offset for when the issue was detected in the segment.
  final CharacterOffsets characterOffsets;

  IssueDetected({
    required this.characterOffsets,
  });

  factory IssueDetected.fromJson(Map<String, dynamic> json) {
    return IssueDetected(
      characterOffsets: CharacterOffsets.fromJson(
          (json['CharacterOffsets'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final characterOffsets = this.characterOffsets;
    return {
      'CharacterOffsets': characterOffsets,
    };
  }
}

/// For characters that were detected as issues, where they occur in the
/// transcript.
///
/// @nodoc
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
      beginOffsetChar: (json['BeginOffsetChar'] as int?) ?? 0,
      endOffsetChar: (json['EndOffsetChar'] as int?) ?? 0,
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

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

/// @nodoc
class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
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
