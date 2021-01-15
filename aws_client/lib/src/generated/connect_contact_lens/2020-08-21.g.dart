// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-08-21.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return Categories(
    matchedCategories:
        (json['MatchedCategories'] as List)?.map((e) => e as String)?.toList(),
    matchedDetails: (json['MatchedDetails'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : CategoryDetails.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

CategoryDetails _$CategoryDetailsFromJson(Map<String, dynamic> json) {
  return CategoryDetails(
    pointsOfInterest: (json['PointsOfInterest'] as List)
        ?.map((e) => e == null
            ? null
            : PointOfInterest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CharacterOffsets _$CharacterOffsetsFromJson(Map<String, dynamic> json) {
  return CharacterOffsets(
    beginOffsetChar: json['BeginOffsetChar'] as int,
    endOffsetChar: json['EndOffsetChar'] as int,
  );
}

IssueDetected _$IssueDetectedFromJson(Map<String, dynamic> json) {
  return IssueDetected(
    characterOffsets: json['CharacterOffsets'] == null
        ? null
        : CharacterOffsets.fromJson(
            json['CharacterOffsets'] as Map<String, dynamic>),
  );
}

ListRealtimeContactAnalysisSegmentsResponse
    _$ListRealtimeContactAnalysisSegmentsResponseFromJson(
        Map<String, dynamic> json) {
  return ListRealtimeContactAnalysisSegmentsResponse(
    segments: (json['Segments'] as List)
        ?.map((e) => e == null
            ? null
            : RealtimeContactAnalysisSegment.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

PointOfInterest _$PointOfInterestFromJson(Map<String, dynamic> json) {
  return PointOfInterest(
    beginOffsetMillis: json['BeginOffsetMillis'] as int,
    endOffsetMillis: json['EndOffsetMillis'] as int,
  );
}

RealtimeContactAnalysisSegment _$RealtimeContactAnalysisSegmentFromJson(
    Map<String, dynamic> json) {
  return RealtimeContactAnalysisSegment(
    categories: json['Categories'] == null
        ? null
        : Categories.fromJson(json['Categories'] as Map<String, dynamic>),
    transcript: json['Transcript'] == null
        ? null
        : Transcript.fromJson(json['Transcript'] as Map<String, dynamic>),
  );
}

Transcript _$TranscriptFromJson(Map<String, dynamic> json) {
  return Transcript(
    beginOffsetMillis: json['BeginOffsetMillis'] as int,
    content: json['Content'] as String,
    endOffsetMillis: json['EndOffsetMillis'] as int,
    id: json['Id'] as String,
    participantId: json['ParticipantId'] as String,
    participantRole: json['ParticipantRole'] as String,
    sentiment: _$enumDecodeNullable(_$SentimentValueEnumMap, json['Sentiment']),
    issuesDetected: (json['IssuesDetected'] as List)
        ?.map((e) => e == null
            ? null
            : IssueDetected.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SentimentValueEnumMap = {
  SentimentValue.positive: 'POSITIVE',
  SentimentValue.neutral: 'NEUTRAL',
  SentimentValue.negative: 'NEGATIVE',
};
