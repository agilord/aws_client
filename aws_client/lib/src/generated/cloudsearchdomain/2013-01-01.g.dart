// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2013-01-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bucket _$BucketFromJson(Map<String, dynamic> json) {
  return Bucket(
    count: json['count'] as int,
    value: json['value'] as String,
  );
}

BucketInfo _$BucketInfoFromJson(Map<String, dynamic> json) {
  return BucketInfo(
    buckets: (json['buckets'] as List)
        ?.map((e) =>
            e == null ? null : Bucket.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DocumentServiceException _$DocumentServiceExceptionFromJson(
    Map<String, dynamic> json) {
  return DocumentServiceException(
    message: json['message'] as String,
    status: json['status'] as String,
  );
}

DocumentServiceWarning _$DocumentServiceWarningFromJson(
    Map<String, dynamic> json) {
  return DocumentServiceWarning(
    message: json['message'] as String,
  );
}

FieldStats _$FieldStatsFromJson(Map<String, dynamic> json) {
  return FieldStats(
    count: json['count'] as int,
    max: json['max'] as String,
    mean: json['mean'] as String,
    min: json['min'] as String,
    missing: json['missing'] as int,
    stddev: (json['stddev'] as num)?.toDouble(),
    sum: (json['sum'] as num)?.toDouble(),
    sumOfSquares: (json['sumOfSquares'] as num)?.toDouble(),
  );
}

Hit _$HitFromJson(Map<String, dynamic> json) {
  return Hit(
    exprs: (json['exprs'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    fields: (json['fields'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    highlights: (json['highlights'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    id: json['id'] as String,
  );
}

Hits _$HitsFromJson(Map<String, dynamic> json) {
  return Hits(
    cursor: json['cursor'] as String,
    found: json['found'] as int,
    hit: (json['hit'] as List)
        ?.map((e) => e == null ? null : Hit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    start: json['start'] as int,
  );
}

SearchException _$SearchExceptionFromJson(Map<String, dynamic> json) {
  return SearchException(
    message: json['message'] as String,
  );
}

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) {
  return SearchResponse(
    facets: (json['facets'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : BucketInfo.fromJson(e as Map<String, dynamic>)),
    ),
    hits: json['hits'] == null
        ? null
        : Hits.fromJson(json['hits'] as Map<String, dynamic>),
    stats: (json['stats'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : FieldStats.fromJson(e as Map<String, dynamic>)),
    ),
    status: json['status'] == null
        ? null
        : SearchStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

SearchStatus _$SearchStatusFromJson(Map<String, dynamic> json) {
  return SearchStatus(
    rid: json['rid'] as String,
    timems: json['timems'] as int,
  );
}

SuggestModel _$SuggestModelFromJson(Map<String, dynamic> json) {
  return SuggestModel(
    found: json['found'] as int,
    query: json['query'] as String,
    suggestions: (json['suggestions'] as List)
        ?.map((e) => e == null
            ? null
            : SuggestionMatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SuggestResponse _$SuggestResponseFromJson(Map<String, dynamic> json) {
  return SuggestResponse(
    status: json['status'] == null
        ? null
        : SuggestStatus.fromJson(json['status'] as Map<String, dynamic>),
    suggest: json['suggest'] == null
        ? null
        : SuggestModel.fromJson(json['suggest'] as Map<String, dynamic>),
  );
}

SuggestStatus _$SuggestStatusFromJson(Map<String, dynamic> json) {
  return SuggestStatus(
    rid: json['rid'] as String,
    timems: json['timems'] as int,
  );
}

SuggestionMatch _$SuggestionMatchFromJson(Map<String, dynamic> json) {
  return SuggestionMatch(
    id: json['id'] as String,
    score: json['score'] as int,
    suggestion: json['suggestion'] as String,
  );
}

UploadDocumentsResponse _$UploadDocumentsResponseFromJson(
    Map<String, dynamic> json) {
  return UploadDocumentsResponse(
    adds: json['adds'] as int,
    deletes: json['deletes'] as int,
    status: json['status'] as String,
    warnings: (json['warnings'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentServiceWarning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
