// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalize-runtime-2018-05-22.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPersonalizedRankingResponse _$GetPersonalizedRankingResponseFromJson(
    Map<String, dynamic> json) {
  return GetPersonalizedRankingResponse(
    personalizedRanking: (json['personalizedRanking'] as List<dynamic>?)
        ?.map((e) => PredictedItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    recommendationId: json['recommendationId'] as String?,
  );
}

GetRecommendationsResponse _$GetRecommendationsResponseFromJson(
    Map<String, dynamic> json) {
  return GetRecommendationsResponse(
    itemList: (json['itemList'] as List<dynamic>?)
        ?.map((e) => PredictedItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    recommendationId: json['recommendationId'] as String?,
  );
}

PredictedItem _$PredictedItemFromJson(Map<String, dynamic> json) {
  return PredictedItem(
    itemId: json['itemId'] as String?,
    score: (json['score'] as num?)?.toDouble(),
  );
}
