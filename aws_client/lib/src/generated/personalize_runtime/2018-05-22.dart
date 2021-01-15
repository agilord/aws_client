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

part '2018-05-22.g.dart';

/// <p/>
class PersonalizeRuntime {
  final _s.RestJsonProtocol _protocol;
  PersonalizeRuntime({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'personalize-runtime',
            signingName: 'personalize',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// reranked list. The maximum is 500.
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
  Future<GetPersonalizedRankingResponse> getPersonalizedRanking({
    @_s.required String campaignArn,
    @_s.required List<String> inputList,
    @_s.required String userId,
    Map<String, String> context,
    String filterArn,
    Map<String, String> filterValues,
  }) async {
    ArgumentError.checkNotNull(campaignArn, 'campaignArn');
    _s.validateStringLength(
      'campaignArn',
      campaignArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'campaignArn',
      campaignArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputList, 'inputList');
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringLength(
      'userId',
      userId,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'filterArn',
      filterArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'filterArn',
      filterArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
    );
    final $payload = <String, dynamic>{
      'campaignArn': campaignArn,
      'inputList': inputList,
      'userId': userId,
      if (context != null) 'context': context,
      if (filterArn != null) 'filterArn': filterArn,
      if (filterValues != null) 'filterValues': filterValues,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/personalize-ranking',
      exceptionFnMap: _exceptionFns,
    );
    return GetPersonalizedRankingResponse.fromJson(response);
  }

  /// Returns a list of recommended items. The required input depends on the
  /// recipe type used to create the solution backing the campaign, as follows:
  ///
  /// <ul>
  /// <li>
  /// RELATED_ITEMS - <code>itemId</code> required, <code>userId</code> not used
  /// </li>
  /// <li>
  /// USER_PERSONALIZATION - <code>itemId</code> optional, <code>userId</code>
  /// required
  /// </li>
  /// </ul> <note>
  /// Campaigns that are backed by a solution created using a recipe of type
  /// PERSONALIZED_RANKING use the API.
  /// </note>
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
  /// Recommendations</a>.
  ///
  /// Parameter [itemId] :
  /// The item ID to provide recommendations for.
  ///
  /// Required for <code>RELATED_ITEMS</code> recipe type.
  ///
  /// Parameter [numResults] :
  /// The number of results to return. The default is 25. The maximum is 500.
  ///
  /// Parameter [userId] :
  /// The user ID to provide recommendations for.
  ///
  /// Required for <code>USER_PERSONALIZATION</code> recipe type.
  Future<GetRecommendationsResponse> getRecommendations({
    @_s.required String campaignArn,
    Map<String, String> context,
    String filterArn,
    Map<String, String> filterValues,
    String itemId,
    int numResults,
    String userId,
  }) async {
    ArgumentError.checkNotNull(campaignArn, 'campaignArn');
    _s.validateStringLength(
      'campaignArn',
      campaignArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'campaignArn',
      campaignArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'filterArn',
      filterArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'filterArn',
      filterArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
    );
    _s.validateStringLength(
      'itemId',
      itemId,
      0,
      256,
    );
    _s.validateNumRange(
      'numResults',
      numResults,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'userId',
      userId,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      'campaignArn': campaignArn,
      if (context != null) 'context': context,
      if (filterArn != null) 'filterArn': filterArn,
      if (filterValues != null) 'filterValues': filterValues,
      if (itemId != null) 'itemId': itemId,
      if (numResults != null) 'numResults': numResults,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPersonalizedRankingResponse {
  /// A list of items in order of most likely interest to the user. The maximum is
  /// 500.
  @_s.JsonKey(name: 'personalizedRanking')
  final List<PredictedItem> personalizedRanking;

  /// The ID of the recommendation.
  @_s.JsonKey(name: 'recommendationId')
  final String recommendationId;

  GetPersonalizedRankingResponse({
    this.personalizedRanking,
    this.recommendationId,
  });
  factory GetPersonalizedRankingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPersonalizedRankingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRecommendationsResponse {
  /// A list of recommendations sorted in ascending order by prediction score.
  /// There can be a maximum of 500 items in the list.
  @_s.JsonKey(name: 'itemList')
  final List<PredictedItem> itemList;

  /// The ID of the recommendation.
  @_s.JsonKey(name: 'recommendationId')
  final String recommendationId;

  GetRecommendationsResponse({
    this.itemList,
    this.recommendationId,
  });
  factory GetRecommendationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecommendationsResponseFromJson(json);
}

/// An object that identifies an item.
///
/// The and APIs return a list of <code>PredictedItem</code>s.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PredictedItem {
  /// The recommended item ID.
  @_s.JsonKey(name: 'itemId')
  final String itemId;

  /// A numeric representation of the model's certainty that the item will be the
  /// next user selection. For more information on scoring logic, see
  /// <a>how-scores-work</a>.
  @_s.JsonKey(name: 'score')
  final double score;

  PredictedItem({
    this.itemId,
    this.score,
  });
  factory PredictedItem.fromJson(Map<String, dynamic> json) =>
      _$PredictedItemFromJson(json);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
