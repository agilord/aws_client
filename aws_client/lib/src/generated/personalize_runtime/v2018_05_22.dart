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

/// <p/>
class PersonalizeRuntime {
  final _s.RestJsonProtocol _protocol;
  PersonalizeRuntime({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'personalize-runtime',
            signingName: 'personalize',
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

  /// Returns a list of recommended actions in sorted in descending order by
  /// prediction score. Use the <code>GetActionRecommendations</code> API if you
  /// have a custom campaign that deploys a solution version trained with a
  /// PERSONALIZED_ACTIONS recipe.
  ///
  /// For more information about PERSONALIZED_ACTIONS recipes, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/nexts-best-action-recipes.html">PERSONALIZED_ACTIONS
  /// recipes</a>. For more information about getting action recommendations,
  /// see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/get-action-recommendations.html">Getting
  /// action recommendations</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [campaignArn] :
  /// The Amazon Resource Name (ARN) of the campaign to use for getting action
  /// recommendations. This campaign must deploy a solution version trained with
  /// a PERSONALIZED_ACTIONS recipe.
  ///
  /// Parameter [filterArn] :
  /// The ARN of the filter to apply to the returned recommendations. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter.html">Filtering
  /// Recommendations</a>.
  ///
  /// When using this parameter, be sure the filter resource is
  /// <code>ACTIVE</code>.
  ///
  /// Parameter [filterValues] :
  /// The values to use when filtering recommendations. For each placeholder
  /// parameter in your filter expression, provide the parameter name (in
  /// matching case) as a key and the filter value(s) as the corresponding
  /// value. Separate multiple values for one parameter with a comma.
  ///
  /// For filter expressions that use an <code>INCLUDE</code> element to include
  /// actions, you must provide values for all parameters that are defined in
  /// the expression. For filters with expressions that use an
  /// <code>EXCLUDE</code> element to exclude actions, you can omit the
  /// <code>filter-values</code>. In this case, Amazon Personalize doesn't use
  /// that portion of the expression to filter recommendations.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter.html">Filtering
  /// recommendations and user segments</a>.
  ///
  /// Parameter [numResults] :
  /// The number of results to return. The default is 5. The maximum is 100.
  ///
  /// Parameter [userId] :
  /// The user ID of the user to provide action recommendations for.
  Future<GetActionRecommendationsResponse> getActionRecommendations({
    String? campaignArn,
    String? filterArn,
    Map<String, String>? filterValues,
    int? numResults,
    String? userId,
  }) async {
    _s.validateNumRange(
      'numResults',
      numResults,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (campaignArn != null) 'campaignArn': campaignArn,
      if (filterArn != null) 'filterArn': filterArn,
      if (filterValues != null) 'filterValues': filterValues,
      if (numResults != null) 'numResults': numResults,
      if (userId != null) 'userId': userId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/action-recommendations',
      exceptionFnMap: _exceptionFns,
    );
    return GetActionRecommendationsResponse.fromJson(response);
  }

  /// Re-ranks a list of recommended items for the given user. The first item in
  /// the list is deemed the most likely item to be of interest to the user.
  /// <note>
  /// The solution backing the campaign must have been created using a recipe of
  /// type PERSONALIZED_RANKING.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [campaignArn] :
  /// The Amazon Resource Name (ARN) of the campaign to use for generating the
  /// personalized ranking.
  ///
  /// Parameter [inputList] :
  /// A list of items (by <code>itemId</code>) to rank. If an item was not
  /// included in the training dataset, the item is appended to the end of the
  /// reranked list. If you are including metadata in recommendations, the
  /// maximum is 50. Otherwise, the maximum is 500.
  ///
  /// Parameter [userId] :
  /// The user for which you want the campaign to provide a personalized
  /// ranking.
  ///
  /// Parameter [context] :
  /// The contextual metadata to use when getting recommendations. Contextual
  /// metadata includes any interaction information that might be relevant when
  /// getting a user's recommendations, such as the user's current location or
  /// device type.
  ///
  /// Parameter [filterArn] :
  /// The Amazon Resource Name (ARN) of a filter you created to include items or
  /// exclude items from recommendations for a given user. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter.html">Filtering
  /// Recommendations</a>.
  ///
  /// Parameter [filterValues] :
  /// The values to use when filtering recommendations. For each placeholder
  /// parameter in your filter expression, provide the parameter name (in
  /// matching case) as a key and the filter value(s) as the corresponding
  /// value. Separate multiple values for one parameter with a comma.
  ///
  /// For filter expressions that use an <code>INCLUDE</code> element to include
  /// items, you must provide values for all parameters that are defined in the
  /// expression. For filters with expressions that use an <code>EXCLUDE</code>
  /// element to exclude items, you can omit the <code>filter-values</code>.In
  /// this case, Amazon Personalize doesn't use that portion of the expression
  /// to filter recommendations.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter.html">Filtering
  /// Recommendations</a>.
  ///
  /// Parameter [metadataColumns] :
  /// If you enabled metadata in recommendations when you created or updated the
  /// campaign, specify metadata columns from your Items dataset to include in
  /// the personalized ranking. The map key is <code>ITEMS</code> and the value
  /// is a list of column names from your Items dataset. The maximum number of
  /// columns you can provide is 10.
  ///
  /// For information about enabling metadata for a campaign, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html#create-campaign-return-metadata">Enabling
  /// metadata in recommendations for a campaign</a>.
  Future<GetPersonalizedRankingResponse> getPersonalizedRanking({
    required String campaignArn,
    required List<String> inputList,
    required String userId,
    Map<String, String>? context,
    String? filterArn,
    Map<String, String>? filterValues,
    Map<String, List<String>>? metadataColumns,
  }) async {
    final $payload = <String, dynamic>{
      'campaignArn': campaignArn,
      'inputList': inputList,
      'userId': userId,
      if (context != null) 'context': context,
      if (filterArn != null) 'filterArn': filterArn,
      if (filterValues != null) 'filterValues': filterValues,
      if (metadataColumns != null) 'metadataColumns': metadataColumns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/personalize-ranking',
      exceptionFnMap: _exceptionFns,
    );
    return GetPersonalizedRankingResponse.fromJson(response);
  }

  /// Returns a list of recommended items. For campaigns, the campaign's Amazon
  /// Resource Name (ARN) is required and the required user and item input
  /// depends on the recipe type used to create the solution backing the
  /// campaign as follows:
  ///
  /// <ul>
  /// <li>
  /// USER_PERSONALIZATION - <code>userId</code> required, <code>itemId</code>
  /// not used
  /// </li>
  /// <li>
  /// RELATED_ITEMS - <code>itemId</code> required, <code>userId</code> not used
  /// </li>
  /// </ul> <note>
  /// Campaigns that are backed by a solution created using a recipe of type
  /// PERSONALIZED_RANKING use the API.
  /// </note>
  /// For recommenders, the recommender's ARN is required and the required item
  /// and user input depends on the use case (domain-based recipe) backing the
  /// recommender. For information on use case requirements see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/domain-use-cases.html">Choosing
  /// recommender use cases</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [campaignArn] :
  /// The Amazon Resource Name (ARN) of the campaign to use for getting
  /// recommendations.
  ///
  /// Parameter [context] :
  /// The contextual metadata to use when getting recommendations. Contextual
  /// metadata includes any interaction information that might be relevant when
  /// getting a user's recommendations, such as the user's current location or
  /// device type.
  ///
  /// Parameter [filterArn] :
  /// The ARN of the filter to apply to the returned recommendations. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter.html">Filtering
  /// Recommendations</a>.
  ///
  /// When using this parameter, be sure the filter resource is
  /// <code>ACTIVE</code>.
  ///
  /// Parameter [filterValues] :
  /// The values to use when filtering recommendations. For each placeholder
  /// parameter in your filter expression, provide the parameter name (in
  /// matching case) as a key and the filter value(s) as the corresponding
  /// value. Separate multiple values for one parameter with a comma.
  ///
  /// For filter expressions that use an <code>INCLUDE</code> element to include
  /// items, you must provide values for all parameters that are defined in the
  /// expression. For filters with expressions that use an <code>EXCLUDE</code>
  /// element to exclude items, you can omit the <code>filter-values</code>.In
  /// this case, Amazon Personalize doesn't use that portion of the expression
  /// to filter recommendations.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter.html">Filtering
  /// recommendations and user segments</a>.
  ///
  /// Parameter [itemId] :
  /// The item ID to provide recommendations for.
  ///
  /// Required for <code>RELATED_ITEMS</code> recipe type.
  ///
  /// Parameter [metadataColumns] :
  /// If you enabled metadata in recommendations when you created or updated the
  /// campaign or recommender, specify the metadata columns from your Items
  /// dataset to include in item recommendations. The map key is
  /// <code>ITEMS</code> and the value is a list of column names from your Items
  /// dataset. The maximum number of columns you can provide is 10.
  ///
  /// For information about enabling metadata for a campaign, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html#create-campaign-return-metadata">Enabling
  /// metadata in recommendations for a campaign</a>. For information about
  /// enabling metadata for a recommender, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/creating-recommenders.html#create-recommender-return-metadata">Enabling
  /// metadata in recommendations for a recommender</a>.
  ///
  /// Parameter [numResults] :
  /// The number of results to return. The default is 25. If you are including
  /// metadata in recommendations, the maximum is 50. Otherwise, the maximum is
  /// 500.
  ///
  /// Parameter [promotions] :
  /// The promotions to apply to the recommendation request. A promotion defines
  /// additional business rules that apply to a configurable subset of
  /// recommended items.
  ///
  /// Parameter [recommenderArn] :
  /// The Amazon Resource Name (ARN) of the recommender to use to get
  /// recommendations. Provide a recommender ARN if you created a Domain dataset
  /// group with a recommender for a domain use case.
  ///
  /// Parameter [userId] :
  /// The user ID to provide recommendations for.
  ///
  /// Required for <code>USER_PERSONALIZATION</code> recipe type.
  Future<GetRecommendationsResponse> getRecommendations({
    String? campaignArn,
    Map<String, String>? context,
    String? filterArn,
    Map<String, String>? filterValues,
    String? itemId,
    Map<String, List<String>>? metadataColumns,
    int? numResults,
    List<Promotion>? promotions,
    String? recommenderArn,
    String? userId,
  }) async {
    _s.validateNumRange(
      'numResults',
      numResults,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (campaignArn != null) 'campaignArn': campaignArn,
      if (context != null) 'context': context,
      if (filterArn != null) 'filterArn': filterArn,
      if (filterValues != null) 'filterValues': filterValues,
      if (itemId != null) 'itemId': itemId,
      if (metadataColumns != null) 'metadataColumns': metadataColumns,
      if (numResults != null) 'numResults': numResults,
      if (promotions != null) 'promotions': promotions,
      if (recommenderArn != null) 'recommenderArn': recommenderArn,
      if (userId != null) 'userId': userId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/recommendations',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommendationsResponse.fromJson(response);
  }
}

class GetActionRecommendationsResponse {
  /// A list of action recommendations sorted in descending order by prediction
  /// score. There can be a maximum of 100 actions in the list. For information
  /// about action scores, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/how-action-recommendation-scoring-works.html">How
  /// action recommendation scoring works</a>.
  final List<PredictedAction>? actionList;

  /// The ID of the recommendation.
  final String? recommendationId;

  GetActionRecommendationsResponse({
    this.actionList,
    this.recommendationId,
  });

  factory GetActionRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return GetActionRecommendationsResponse(
      actionList: (json['actionList'] as List?)
          ?.whereNotNull()
          .map((e) => PredictedAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendationId: json['recommendationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionList = this.actionList;
    final recommendationId = this.recommendationId;
    return {
      if (actionList != null) 'actionList': actionList,
      if (recommendationId != null) 'recommendationId': recommendationId,
    };
  }
}

class GetPersonalizedRankingResponse {
  /// A list of items in order of most likely interest to the user. The maximum is
  /// 500.
  final List<PredictedItem>? personalizedRanking;

  /// The ID of the recommendation.
  final String? recommendationId;

  GetPersonalizedRankingResponse({
    this.personalizedRanking,
    this.recommendationId,
  });

  factory GetPersonalizedRankingResponse.fromJson(Map<String, dynamic> json) {
    return GetPersonalizedRankingResponse(
      personalizedRanking: (json['personalizedRanking'] as List?)
          ?.whereNotNull()
          .map((e) => PredictedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendationId: json['recommendationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final personalizedRanking = this.personalizedRanking;
    final recommendationId = this.recommendationId;
    return {
      if (personalizedRanking != null)
        'personalizedRanking': personalizedRanking,
      if (recommendationId != null) 'recommendationId': recommendationId,
    };
  }
}

class GetRecommendationsResponse {
  /// A list of recommendations sorted in descending order by prediction score.
  /// There can be a maximum of 500 items in the list.
  final List<PredictedItem>? itemList;

  /// The ID of the recommendation.
  final String? recommendationId;

  GetRecommendationsResponse({
    this.itemList,
    this.recommendationId,
  });

  factory GetRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommendationsResponse(
      itemList: (json['itemList'] as List?)
          ?.whereNotNull()
          .map((e) => PredictedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendationId: json['recommendationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final itemList = this.itemList;
    final recommendationId = this.recommendationId;
    return {
      if (itemList != null) 'itemList': itemList,
      if (recommendationId != null) 'recommendationId': recommendationId,
    };
  }
}

/// An object that identifies an action.
///
/// The API returns a list of <code>PredictedAction</code>s.
class PredictedAction {
  /// The ID of the recommended action.
  final String? actionId;

  /// The score of the recommended action. For information about action scores,
  /// see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/how-action-recommendation-scoring-works.html">How
  /// action recommendation scoring works</a>.
  final double? score;

  PredictedAction({
    this.actionId,
    this.score,
  });

  factory PredictedAction.fromJson(Map<String, dynamic> json) {
    return PredictedAction(
      actionId: json['actionId'] as String?,
      score: json['score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionId = this.actionId;
    final score = this.score;
    return {
      if (actionId != null) 'actionId': actionId,
      if (score != null) 'score': score,
    };
  }
}

/// An object that identifies an item.
///
/// The and APIs return a list of <code>PredictedItem</code>s.
class PredictedItem {
  /// The recommended item ID.
  final String? itemId;

  /// Metadata about the item from your Items dataset.
  final Map<String, String>? metadata;

  /// The name of the promotion that included the predicted item.
  final String? promotionName;

  /// If you use User-Personalization-v2, a list of reasons for why the item was
  /// included in recommendations. Possible reasons include the following:
  ///
  /// <ul>
  /// <li>
  /// Promoted item - Indicates the item was included as part of a promotion that
  /// you applied in your recommendation request.
  /// </li>
  /// <li>
  /// Exploration - Indicates the item was included with exploration. With
  /// exploration, recommendations include items with less interactions data or
  /// relevance for the user. For more information about exploration, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/use-case-recipe-features.html#about-exploration">Exploration</a>.
  /// </li>
  /// <li>
  /// Popular item - Indicates the item was included as a placeholder popular
  /// item. If you use a filter, depending on how many recommendations the filter
  /// removes, Amazon Personalize might add placeholder items to meet the
  /// <code>numResults</code> for your recommendation request. These items are
  /// popular items, based on interactions data, that satisfy your filter
  /// criteria. They don't have a relevance score for the user.
  /// </li>
  /// </ul>
  final List<String>? reason;

  /// A numeric representation of the model's certainty that the item will be the
  /// next user selection. For more information on scoring logic, see
  /// <a>how-scores-work</a>.
  final double? score;

  PredictedItem({
    this.itemId,
    this.metadata,
    this.promotionName,
    this.reason,
    this.score,
  });

  factory PredictedItem.fromJson(Map<String, dynamic> json) {
    return PredictedItem(
      itemId: json['itemId'] as String?,
      metadata: (json['metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      promotionName: json['promotionName'] as String?,
      reason: (json['reason'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      score: json['score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final itemId = this.itemId;
    final metadata = this.metadata;
    final promotionName = this.promotionName;
    final reason = this.reason;
    final score = this.score;
    return {
      if (itemId != null) 'itemId': itemId,
      if (metadata != null) 'metadata': metadata,
      if (promotionName != null) 'promotionName': promotionName,
      if (reason != null) 'reason': reason,
      if (score != null) 'score': score,
    };
  }
}

/// Contains information on a promotion. A promotion defines additional business
/// rules that apply to a configurable subset of recommended items.
class Promotion {
  /// The Amazon Resource Name (ARN) of the filter used by the promotion. This
  /// filter defines the criteria for promoted items. For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/promoting-items.html#promotion-filters">Promotion
  /// filters</a>.
  final String? filterArn;

  /// The values to use when promoting items. For each placeholder parameter in
  /// your promotion's filter expression, provide the parameter name (in matching
  /// case) as a key and the filter value(s) as the corresponding value. Separate
  /// multiple values for one parameter with a comma.
  ///
  /// For filter expressions that use an <code>INCLUDE</code> element to include
  /// items, you must provide values for all parameters that are defined in the
  /// expression. For filters with expressions that use an <code>EXCLUDE</code>
  /// element to exclude items, you can omit the <code>filter-values</code>. In
  /// this case, Amazon Personalize doesn't use that portion of the expression to
  /// filter recommendations.
  ///
  /// For more information on creating filters, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter.html">Filtering
  /// recommendations and user segments</a>.
  final Map<String, String>? filterValues;

  /// The name of the promotion.
  final String? name;

  /// The percentage of recommended items to apply the promotion to.
  final int? percentPromotedItems;

  Promotion({
    this.filterArn,
    this.filterValues,
    this.name,
    this.percentPromotedItems,
  });

  Map<String, dynamic> toJson() {
    final filterArn = this.filterArn;
    final filterValues = this.filterValues;
    final name = this.name;
    final percentPromotedItems = this.percentPromotedItems;
    return {
      if (filterArn != null) 'filterArn': filterArn,
      if (filterValues != null) 'filterValues': filterValues,
      if (name != null) 'name': name,
      if (percentPromotedItems != null)
        'percentPromotedItems': percentPromotedItems,
    };
  }
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
