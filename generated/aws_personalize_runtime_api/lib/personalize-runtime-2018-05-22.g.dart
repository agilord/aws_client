// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalize-runtime-2018-05-22.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GetPersonalizedRankingRequestToJson(
    GetPersonalizedRankingRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('campaignArn', instance.campaignArn);
  writeNotNull('inputList', instance.inputList);
  writeNotNull('userId', instance.userId);
  writeNotNull('context', instance.context);
  return val;
}

GetPersonalizedRankingResponse _$GetPersonalizedRankingResponseFromJson(
    Map<String, dynamic> json) {
  return GetPersonalizedRankingResponse(
    personalizedRanking: (json['personalizedRanking'] as List)
        ?.map((e) => e == null
            ? null
            : PredictedItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetRecommendationsRequestToJson(
    GetRecommendationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('campaignArn', instance.campaignArn);
  writeNotNull('context', instance.context);
  writeNotNull('itemId', instance.itemId);
  writeNotNull('numResults', instance.numResults);
  writeNotNull('userId', instance.userId);
  return val;
}

GetRecommendationsResponse _$GetRecommendationsResponseFromJson(
    Map<String, dynamic> json) {
  return GetRecommendationsResponse(
    itemList: (json['itemList'] as List)
        ?.map((e) => e == null
            ? null
            : PredictedItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PredictedItem _$PredictedItemFromJson(Map<String, dynamic> json) {
  return PredictedItem(
    itemId: json['itemId'] as String,
    score: (json['score'] as num)?.toDouble(),
  );
}
