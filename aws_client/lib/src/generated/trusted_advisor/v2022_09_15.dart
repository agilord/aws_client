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

/// TrustedAdvisor Public API
class TrustedAdvisor {
  final _s.RestJsonProtocol _protocol;
  TrustedAdvisor({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'trustedadvisor',
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

  /// Update one or more exclusion statuses for a list of recommendation
  /// resources. This API supports up to 25 unique recommendation resource ARNs
  /// per request. This API currently doesn't support prioritized recommendation
  /// resources. This API updates global recommendations, eliminating the need
  /// to call the API in each AWS Region. After submitting an exclusion update,
  /// note that it might take a few minutes for the changes to be reflected in
  /// the system.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recommendationResourceExclusions] :
  /// A list of recommendation resource ARNs and exclusion status to update
  Future<BatchUpdateRecommendationResourceExclusionResponse>
      batchUpdateRecommendationResourceExclusion({
    required List<RecommendationResourceExclusion>
        recommendationResourceExclusions,
  }) async {
    final $payload = <String, dynamic>{
      'recommendationResourceExclusions': recommendationResourceExclusions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/batch-update-recommendation-resource-exclusion',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateRecommendationResourceExclusionResponse.fromJson(
        response);
  }

  /// Get a specific recommendation within an AWS Organizations organization.
  /// This API supports only prioritized recommendations and provides global
  /// priority recommendations, eliminating the need to call the API in each AWS
  /// Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [organizationRecommendationIdentifier] :
  /// The Recommendation identifier
  Future<GetOrganizationRecommendationResponse> getOrganizationRecommendation({
    required String organizationRecommendationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/organization-recommendations/${Uri.encodeComponent(organizationRecommendationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOrganizationRecommendationResponse.fromJson(response);
  }

  /// Get a specific Recommendation. This API provides global recommendations,
  /// eliminating the need to call the API in each AWS Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recommendationIdentifier] :
  /// The Recommendation identifier
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language that you want your recommendations to
  /// appear in.
  Future<GetRecommendationResponse> getRecommendation({
    required String recommendationIdentifier,
    RecommendationLanguage? language,
  }) async {
    final $query = <String, List<String>>{
      if (language != null) 'language': [language.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/recommendations/${Uri.encodeComponent(recommendationIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommendationResponse.fromJson(response);
  }

  /// List a filterable set of Checks. This API provides global recommendations,
  /// eliminating the need to call the API in each AWS Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [awsService] :
  /// The aws service associated with the check
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language that you want your checks to appear
  /// in.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [pillar] :
  /// The pillar of the check
  ///
  /// Parameter [source] :
  /// The source of the check
  Future<ListChecksResponse> listChecks({
    String? awsService,
    RecommendationLanguage? language,
    int? maxResults,
    String? nextToken,
    RecommendationPillar? pillar,
    RecommendationSource? source,
  }) async {
    final $query = <String, List<String>>{
      if (awsService != null) 'awsService': [awsService],
      if (language != null) 'language': [language.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (pillar != null) 'pillar': [pillar.value],
      if (source != null) 'source': [source.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/checks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChecksResponse.fromJson(response);
  }

  /// Lists the accounts that own the resources for an organization aggregate
  /// recommendation. This API only supports prioritized recommendations and
  /// provides global priority recommendations, eliminating the need to call the
  /// API in each AWS Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [organizationRecommendationIdentifier] :
  /// The Recommendation identifier
  ///
  /// Parameter [affectedAccountId] :
  /// An account affected by this organization recommendation
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  Future<ListOrganizationRecommendationAccountsResponse>
      listOrganizationRecommendationAccounts({
    required String organizationRecommendationIdentifier,
    String? affectedAccountId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (affectedAccountId != null) 'affectedAccountId': [affectedAccountId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/organization-recommendations/${Uri.encodeComponent(organizationRecommendationIdentifier)}/accounts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOrganizationRecommendationAccountsResponse.fromJson(response);
  }

  /// List Resources of a Recommendation within an Organization. This API only
  /// supports prioritized recommendations and provides global priority
  /// recommendations, eliminating the need to call the API in each AWS Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [organizationRecommendationIdentifier] :
  /// The AWS Organization organization's Recommendation identifier
  ///
  /// Parameter [affectedAccountId] :
  /// An account affected by this organization recommendation
  ///
  /// Parameter [exclusionStatus] :
  /// The exclusion status of the resource
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [regionCode] :
  /// The AWS Region code of the resource
  ///
  /// Parameter [status] :
  /// The status of the resource
  Future<ListOrganizationRecommendationResourcesResponse>
      listOrganizationRecommendationResources({
    required String organizationRecommendationIdentifier,
    String? affectedAccountId,
    ExclusionStatus? exclusionStatus,
    int? maxResults,
    String? nextToken,
    String? regionCode,
    ResourceStatus? status,
  }) async {
    final $query = <String, List<String>>{
      if (affectedAccountId != null) 'affectedAccountId': [affectedAccountId],
      if (exclusionStatus != null) 'exclusionStatus': [exclusionStatus.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (regionCode != null) 'regionCode': [regionCode],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/organization-recommendations/${Uri.encodeComponent(organizationRecommendationIdentifier)}/resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOrganizationRecommendationResourcesResponse.fromJson(response);
  }

  /// List a filterable set of Recommendations within an Organization. This API
  /// only supports prioritized recommendations and provides global priority
  /// recommendations, eliminating the need to call the API in each AWS Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [afterLastUpdatedAt] :
  /// After the last update of the Recommendation
  ///
  /// Parameter [awsService] :
  /// The aws service associated with the Recommendation
  ///
  /// Parameter [beforeLastUpdatedAt] :
  /// Before the last update of the Recommendation
  ///
  /// Parameter [checkIdentifier] :
  /// The check identifier of the Recommendation
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [pillar] :
  /// The pillar of the Recommendation
  ///
  /// Parameter [source] :
  /// The source of the Recommendation
  ///
  /// Parameter [status] :
  /// The status of the Recommendation
  ///
  /// Parameter [type] :
  /// The type of the Recommendation
  Future<ListOrganizationRecommendationsResponse>
      listOrganizationRecommendations({
    DateTime? afterLastUpdatedAt,
    String? awsService,
    DateTime? beforeLastUpdatedAt,
    String? checkIdentifier,
    int? maxResults,
    String? nextToken,
    RecommendationPillar? pillar,
    RecommendationSource? source,
    RecommendationStatus? status,
    RecommendationType? type,
  }) async {
    final $query = <String, List<String>>{
      if (afterLastUpdatedAt != null)
        'afterLastUpdatedAt': [_s.iso8601ToJson(afterLastUpdatedAt).toString()],
      if (awsService != null) 'awsService': [awsService],
      if (beforeLastUpdatedAt != null)
        'beforeLastUpdatedAt': [
          _s.iso8601ToJson(beforeLastUpdatedAt).toString()
        ],
      if (checkIdentifier != null) 'checkIdentifier': [checkIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (pillar != null) 'pillar': [pillar.value],
      if (source != null) 'source': [source.value],
      if (status != null) 'status': [status.value],
      if (type != null) 'type': [type.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/organization-recommendations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOrganizationRecommendationsResponse.fromJson(response);
  }

  /// List Resources of a Recommendation. This API provides global
  /// recommendations, eliminating the need to call the API in each AWS Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recommendationIdentifier] :
  /// The Recommendation identifier
  ///
  /// Parameter [exclusionStatus] :
  /// The exclusion status of the resource
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language that you want your recommendations to
  /// appear in.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [regionCode] :
  /// The AWS Region code of the resource
  ///
  /// Parameter [status] :
  /// The status of the resource
  Future<ListRecommendationResourcesResponse> listRecommendationResources({
    required String recommendationIdentifier,
    ExclusionStatus? exclusionStatus,
    RecommendationLanguage? language,
    int? maxResults,
    String? nextToken,
    String? regionCode,
    ResourceStatus? status,
  }) async {
    final $query = <String, List<String>>{
      if (exclusionStatus != null) 'exclusionStatus': [exclusionStatus.value],
      if (language != null) 'language': [language.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (regionCode != null) 'regionCode': [regionCode],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/recommendations/${Uri.encodeComponent(recommendationIdentifier)}/resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationResourcesResponse.fromJson(response);
  }

  /// List a filterable set of Recommendations. This API provides global
  /// recommendations, eliminating the need to call the API in each AWS Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [afterLastUpdatedAt] :
  /// After the last update of the Recommendation
  ///
  /// Parameter [awsService] :
  /// The aws service associated with the Recommendation
  ///
  /// Parameter [beforeLastUpdatedAt] :
  /// Before the last update of the Recommendation
  ///
  /// Parameter [checkIdentifier] :
  /// The check identifier of the Recommendation
  ///
  /// Parameter [language] :
  /// The ISO 639-1 code for the language that you want your recommendations to
  /// appear in.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  ///
  /// Parameter [pillar] :
  /// The pillar of the Recommendation
  ///
  /// Parameter [source] :
  /// The source of the Recommendation
  ///
  /// Parameter [status] :
  /// The status of the Recommendation
  ///
  /// Parameter [type] :
  /// The type of the Recommendation
  Future<ListRecommendationsResponse> listRecommendations({
    DateTime? afterLastUpdatedAt,
    String? awsService,
    DateTime? beforeLastUpdatedAt,
    String? checkIdentifier,
    RecommendationLanguage? language,
    int? maxResults,
    String? nextToken,
    RecommendationPillar? pillar,
    RecommendationSource? source,
    RecommendationStatus? status,
    RecommendationType? type,
  }) async {
    final $query = <String, List<String>>{
      if (afterLastUpdatedAt != null)
        'afterLastUpdatedAt': [_s.iso8601ToJson(afterLastUpdatedAt).toString()],
      if (awsService != null) 'awsService': [awsService],
      if (beforeLastUpdatedAt != null)
        'beforeLastUpdatedAt': [
          _s.iso8601ToJson(beforeLastUpdatedAt).toString()
        ],
      if (checkIdentifier != null) 'checkIdentifier': [checkIdentifier],
      if (language != null) 'language': [language.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (pillar != null) 'pillar': [pillar.value],
      if (source != null) 'source': [source.value],
      if (status != null) 'status': [status.value],
      if (type != null) 'type': [type.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/recommendations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationsResponse.fromJson(response);
  }

  /// Update the lifecycle of a Recommendation within an Organization. This API
  /// only supports prioritized recommendations and updates global priority
  /// recommendations, eliminating the need to call the API in each AWS Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [lifecycleStage] :
  /// The new lifecycle stage
  ///
  /// Parameter [organizationRecommendationIdentifier] :
  /// The Recommendation identifier for AWS Trusted Advisor Priority
  /// recommendations
  ///
  /// Parameter [updateReason] :
  /// Reason for the lifecycle stage change
  ///
  /// Parameter [updateReasonCode] :
  /// Reason code for the lifecycle state change
  Future<void> updateOrganizationRecommendationLifecycle({
    required UpdateRecommendationLifecycleStage lifecycleStage,
    required String organizationRecommendationIdentifier,
    String? updateReason,
    UpdateRecommendationLifecycleStageReasonCode? updateReasonCode,
  }) async {
    final $payload = <String, dynamic>{
      'lifecycleStage': lifecycleStage.value,
      if (updateReason != null) 'updateReason': updateReason,
      if (updateReasonCode != null) 'updateReasonCode': updateReasonCode.value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/organization-recommendations/${Uri.encodeComponent(organizationRecommendationIdentifier)}/lifecycle',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update the lifecyle of a Recommendation. This API only supports
  /// prioritized recommendations and updates global priority recommendations,
  /// eliminating the need to call the API in each AWS Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [lifecycleStage] :
  /// The new lifecycle stage
  ///
  /// Parameter [recommendationIdentifier] :
  /// The Recommendation identifier for AWS Trusted Advisor Priority
  /// recommendations
  ///
  /// Parameter [updateReason] :
  /// Reason for the lifecycle stage change
  ///
  /// Parameter [updateReasonCode] :
  /// Reason code for the lifecycle state change
  Future<void> updateRecommendationLifecycle({
    required UpdateRecommendationLifecycleStage lifecycleStage,
    required String recommendationIdentifier,
    String? updateReason,
    UpdateRecommendationLifecycleStageReasonCode? updateReasonCode,
  }) async {
    final $payload = <String, dynamic>{
      'lifecycleStage': lifecycleStage.value,
      if (updateReason != null) 'updateReason': updateReason,
      if (updateReasonCode != null) 'updateReasonCode': updateReasonCode.value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/recommendations/${Uri.encodeComponent(recommendationIdentifier)}/lifecycle',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class BatchUpdateRecommendationResourceExclusionResponse {
  /// A list of recommendation resource ARNs whose exclusion status failed to
  /// update, if any
  final List<UpdateRecommendationResourceExclusionError>
      batchUpdateRecommendationResourceExclusionErrors;

  BatchUpdateRecommendationResourceExclusionResponse({
    required this.batchUpdateRecommendationResourceExclusionErrors,
  });

  factory BatchUpdateRecommendationResourceExclusionResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateRecommendationResourceExclusionResponse(
      batchUpdateRecommendationResourceExclusionErrors:
          ((json['batchUpdateRecommendationResourceExclusionErrors']
                      as List?) ??
                  const [])
              .nonNulls
              .map((e) => UpdateRecommendationResourceExclusionError.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final batchUpdateRecommendationResourceExclusionErrors =
        this.batchUpdateRecommendationResourceExclusionErrors;
    return {
      'batchUpdateRecommendationResourceExclusionErrors':
          batchUpdateRecommendationResourceExclusionErrors,
    };
  }
}

/// @nodoc
class GetOrganizationRecommendationResponse {
  /// The Recommendation
  final OrganizationRecommendation? organizationRecommendation;

  GetOrganizationRecommendationResponse({
    this.organizationRecommendation,
  });

  factory GetOrganizationRecommendationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetOrganizationRecommendationResponse(
      organizationRecommendation: json['organizationRecommendation'] != null
          ? OrganizationRecommendation.fromJson(
              json['organizationRecommendation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final organizationRecommendation = this.organizationRecommendation;
    return {
      if (organizationRecommendation != null)
        'organizationRecommendation': organizationRecommendation,
    };
  }
}

/// @nodoc
class GetRecommendationResponse {
  /// The Recommendation
  final Recommendation? recommendation;

  GetRecommendationResponse({
    this.recommendation,
  });

  factory GetRecommendationResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommendationResponse(
      recommendation: json['recommendation'] != null
          ? Recommendation.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendation = this.recommendation;
    return {
      if (recommendation != null) 'recommendation': recommendation,
    };
  }
}

/// @nodoc
class ListChecksResponse {
  /// The list of Checks
  final List<CheckSummary> checkSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListChecksResponse({
    required this.checkSummaries,
    this.nextToken,
  });

  factory ListChecksResponse.fromJson(Map<String, dynamic> json) {
    return ListChecksResponse(
      checkSummaries: ((json['checkSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => CheckSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checkSummaries = this.checkSummaries;
    final nextToken = this.nextToken;
    return {
      'checkSummaries': checkSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListOrganizationRecommendationAccountsResponse {
  /// The account recommendations lifecycles that are applicable to the
  /// Recommendation
  final List<AccountRecommendationLifecycleSummary>
      accountRecommendationLifecycleSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListOrganizationRecommendationAccountsResponse({
    required this.accountRecommendationLifecycleSummaries,
    this.nextToken,
  });

  factory ListOrganizationRecommendationAccountsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListOrganizationRecommendationAccountsResponse(
      accountRecommendationLifecycleSummaries:
          ((json['accountRecommendationLifecycleSummaries'] as List?) ??
                  const [])
              .nonNulls
              .map((e) => AccountRecommendationLifecycleSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountRecommendationLifecycleSummaries =
        this.accountRecommendationLifecycleSummaries;
    final nextToken = this.nextToken;
    return {
      'accountRecommendationLifecycleSummaries':
          accountRecommendationLifecycleSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListOrganizationRecommendationResourcesResponse {
  /// A list of Recommendation Resources
  final List<OrganizationRecommendationResourceSummary>
      organizationRecommendationResourceSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListOrganizationRecommendationResourcesResponse({
    required this.organizationRecommendationResourceSummaries,
    this.nextToken,
  });

  factory ListOrganizationRecommendationResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListOrganizationRecommendationResourcesResponse(
      organizationRecommendationResourceSummaries:
          ((json['organizationRecommendationResourceSummaries'] as List?) ??
                  const [])
              .nonNulls
              .map((e) => OrganizationRecommendationResourceSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final organizationRecommendationResourceSummaries =
        this.organizationRecommendationResourceSummaries;
    final nextToken = this.nextToken;
    return {
      'organizationRecommendationResourceSummaries':
          organizationRecommendationResourceSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListOrganizationRecommendationsResponse {
  /// The list of Recommendations
  final List<OrganizationRecommendationSummary>
      organizationRecommendationSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListOrganizationRecommendationsResponse({
    required this.organizationRecommendationSummaries,
    this.nextToken,
  });

  factory ListOrganizationRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListOrganizationRecommendationsResponse(
      organizationRecommendationSummaries:
          ((json['organizationRecommendationSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) => OrganizationRecommendationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final organizationRecommendationSummaries =
        this.organizationRecommendationSummaries;
    final nextToken = this.nextToken;
    return {
      'organizationRecommendationSummaries':
          organizationRecommendationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListRecommendationResourcesResponse {
  /// A list of Recommendation Resources
  final List<RecommendationResourceSummary> recommendationResourceSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListRecommendationResourcesResponse({
    required this.recommendationResourceSummaries,
    this.nextToken,
  });

  factory ListRecommendationResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRecommendationResourcesResponse(
      recommendationResourceSummaries: ((json['recommendationResourceSummaries']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              RecommendationResourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationResourceSummaries =
        this.recommendationResourceSummaries;
    final nextToken = this.nextToken;
    return {
      'recommendationResourceSummaries': recommendationResourceSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListRecommendationsResponse {
  /// The list of Recommendations
  final List<RecommendationSummary> recommendationSummaries;

  /// The token for the next set of results. Use the value returned in the
  /// previous response in the next request to retrieve the next set of results.
  final String? nextToken;

  ListRecommendationsResponse({
    required this.recommendationSummaries,
    this.nextToken,
  });

  factory ListRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendationsResponse(
      recommendationSummaries: ((json['recommendationSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => RecommendationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationSummaries = this.recommendationSummaries;
    final nextToken = this.nextToken;
    return {
      'recommendationSummaries': recommendationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class UpdateRecommendationLifecycleStage {
  static const pendingResponse =
      UpdateRecommendationLifecycleStage._('pending_response');
  static const inProgress = UpdateRecommendationLifecycleStage._('in_progress');
  static const dismissed = UpdateRecommendationLifecycleStage._('dismissed');
  static const resolved = UpdateRecommendationLifecycleStage._('resolved');

  final String value;

  const UpdateRecommendationLifecycleStage._(this.value);

  static const values = [pendingResponse, inProgress, dismissed, resolved];

  static UpdateRecommendationLifecycleStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpdateRecommendationLifecycleStage._(value));

  @override
  bool operator ==(other) =>
      other is UpdateRecommendationLifecycleStage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class UpdateRecommendationLifecycleStageReasonCode {
  static const nonCriticalAccount =
      UpdateRecommendationLifecycleStageReasonCode._('non_critical_account');
  static const temporaryAccount =
      UpdateRecommendationLifecycleStageReasonCode._('temporary_account');
  static const validBusinessCase =
      UpdateRecommendationLifecycleStageReasonCode._('valid_business_case');
  static const otherMethodsAvailable =
      UpdateRecommendationLifecycleStageReasonCode._('other_methods_available');
  static const lowPriority =
      UpdateRecommendationLifecycleStageReasonCode._('low_priority');
  static const notApplicable =
      UpdateRecommendationLifecycleStageReasonCode._('not_applicable');
  static const other = UpdateRecommendationLifecycleStageReasonCode._('other');

  final String value;

  const UpdateRecommendationLifecycleStageReasonCode._(this.value);

  static const values = [
    nonCriticalAccount,
    temporaryAccount,
    validBusinessCase,
    otherMethodsAvailable,
    lowPriority,
    notApplicable,
    other
  ];

  static UpdateRecommendationLifecycleStageReasonCode fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpdateRecommendationLifecycleStageReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is UpdateRecommendationLifecycleStageReasonCode &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary of Recommendation for an Account
///
/// @nodoc
class RecommendationSummary {
  /// The ARN of the Recommendation
  final String arn;

  /// The ID which identifies where the Recommendation was produced
  final String id;

  /// The name of the AWS Trusted Advisor Recommendation
  final String name;

  /// The Pillars that the Recommendation is optimizing
  final List<RecommendationPillar> pillars;

  /// An aggregation of all resources
  final RecommendationResourcesAggregates resourcesAggregates;

  /// The source of the Recommendation
  final RecommendationSource source;

  /// The status of the Recommendation
  final RecommendationStatus status;

  /// Whether the Recommendation was automated or generated by AWS Trusted Advisor
  /// Priority
  final RecommendationType type;

  /// The AWS Services that the Recommendation applies to
  final List<String>? awsServices;

  /// The AWS Trusted Advisor Check ARN that relates to the Recommendation
  final String? checkArn;

  /// When the Recommendation was created, if created by AWS Trusted Advisor
  /// Priority
  final DateTime? createdAt;

  /// When the Recommendation was last updated
  final DateTime? lastUpdatedAt;

  /// The lifecycle stage from AWS Trusted Advisor Priority
  final RecommendationLifecycleStage? lifecycleStage;

  /// The pillar aggregations for cost savings
  final RecommendationPillarSpecificAggregates? pillarSpecificAggregates;

  /// This attribute provides additional details about potential discrepancies in
  /// check status determination.
  final StatusReason? statusReason;

  RecommendationSummary({
    required this.arn,
    required this.id,
    required this.name,
    required this.pillars,
    required this.resourcesAggregates,
    required this.source,
    required this.status,
    required this.type,
    this.awsServices,
    this.checkArn,
    this.createdAt,
    this.lastUpdatedAt,
    this.lifecycleStage,
    this.pillarSpecificAggregates,
    this.statusReason,
  });

  factory RecommendationSummary.fromJson(Map<String, dynamic> json) {
    return RecommendationSummary(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      pillars: ((json['pillars'] as List?) ?? const [])
          .nonNulls
          .map((e) => RecommendationPillar.fromString((e as String)))
          .toList(),
      resourcesAggregates: RecommendationResourcesAggregates.fromJson(
          (json['resourcesAggregates'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      source:
          RecommendationSource.fromString((json['source'] as String?) ?? ''),
      status:
          RecommendationStatus.fromString((json['status'] as String?) ?? ''),
      type: RecommendationType.fromString((json['type'] as String?) ?? ''),
      awsServices: (json['awsServices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      checkArn: json['checkArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lifecycleStage: (json['lifecycleStage'] as String?)
          ?.let(RecommendationLifecycleStage.fromString),
      pillarSpecificAggregates: json['pillarSpecificAggregates'] != null
          ? RecommendationPillarSpecificAggregates.fromJson(
              json['pillarSpecificAggregates'] as Map<String, dynamic>)
          : null,
      statusReason:
          (json['statusReason'] as String?)?.let(StatusReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final pillars = this.pillars;
    final resourcesAggregates = this.resourcesAggregates;
    final source = this.source;
    final status = this.status;
    final type = this.type;
    final awsServices = this.awsServices;
    final checkArn = this.checkArn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lifecycleStage = this.lifecycleStage;
    final pillarSpecificAggregates = this.pillarSpecificAggregates;
    final statusReason = this.statusReason;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'pillars': pillars.map((e) => e.value).toList(),
      'resourcesAggregates': resourcesAggregates,
      'source': source.value,
      'status': status.value,
      'type': type.value,
      if (awsServices != null) 'awsServices': awsServices,
      if (checkArn != null) 'checkArn': checkArn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (lifecycleStage != null) 'lifecycleStage': lifecycleStage.value,
      if (pillarSpecificAggregates != null)
        'pillarSpecificAggregates': pillarSpecificAggregates,
      if (statusReason != null) 'statusReason': statusReason.value,
    };
  }
}

/// @nodoc
class RecommendationType {
  static const standard = RecommendationType._('standard');
  static const priority = RecommendationType._('priority');

  final String value;

  const RecommendationType._(this.value);

  static const values = [standard, priority];

  static RecommendationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationType._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RecommendationStatus {
  static const ok = RecommendationStatus._('ok');
  static const warning = RecommendationStatus._('warning');
  static const error = RecommendationStatus._('error');

  final String value;

  const RecommendationStatus._(this.value);

  static const values = [ok, warning, error];

  static RecommendationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationStatus._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RecommendationLifecycleStage {
  static const inProgress = RecommendationLifecycleStage._('in_progress');
  static const pendingResponse =
      RecommendationLifecycleStage._('pending_response');
  static const dismissed = RecommendationLifecycleStage._('dismissed');
  static const resolved = RecommendationLifecycleStage._('resolved');

  final String value;

  const RecommendationLifecycleStage._(this.value);

  static const values = [inProgress, pendingResponse, dismissed, resolved];

  static RecommendationLifecycleStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationLifecycleStage._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationLifecycleStage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RecommendationSource {
  static const awsConfig = RecommendationSource._('aws_config');
  static const computeOptimizer = RecommendationSource._('compute_optimizer');
  static const costExplorer = RecommendationSource._('cost_explorer');
  static const lse = RecommendationSource._('lse');
  static const manual = RecommendationSource._('manual');
  static const pse = RecommendationSource._('pse');
  static const rds = RecommendationSource._('rds');
  static const resilience = RecommendationSource._('resilience');
  static const resilienceHub = RecommendationSource._('resilience_hub');
  static const securityHub = RecommendationSource._('security_hub');
  static const stir = RecommendationSource._('stir');
  static const taCheck = RecommendationSource._('ta_check');
  static const wellArchitected = RecommendationSource._('well_architected');
  static const costOptimizationHub =
      RecommendationSource._('cost_optimization_hub');

  final String value;

  const RecommendationSource._(this.value);

  static const values = [
    awsConfig,
    computeOptimizer,
    costExplorer,
    lse,
    manual,
    pse,
    rds,
    resilience,
    resilienceHub,
    securityHub,
    stir,
    taCheck,
    wellArchitected,
    costOptimizationHub
  ];

  static RecommendationSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationSource._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Aggregation of Recommendation Resources
///
/// @nodoc
class RecommendationResourcesAggregates {
  /// The number of AWS resources that were flagged to have errors according to
  /// the Trusted Advisor check
  final int errorCount;

  /// The number of AWS resources that were flagged to be OK according to the
  /// Trusted Advisor check
  final int okCount;

  /// The number of AWS resources that were flagged to have warning according to
  /// the Trusted Advisor check
  final int warningCount;

  /// The number of AWS resources belonging to this Trusted Advisor check that
  /// were excluded by the customer
  final int? excludedCount;

  RecommendationResourcesAggregates({
    required this.errorCount,
    required this.okCount,
    required this.warningCount,
    this.excludedCount,
  });

  factory RecommendationResourcesAggregates.fromJson(
      Map<String, dynamic> json) {
    return RecommendationResourcesAggregates(
      errorCount: (json['errorCount'] as int?) ?? 0,
      okCount: (json['okCount'] as int?) ?? 0,
      warningCount: (json['warningCount'] as int?) ?? 0,
      excludedCount: json['excludedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCount = this.errorCount;
    final okCount = this.okCount;
    final warningCount = this.warningCount;
    final excludedCount = this.excludedCount;
    return {
      'errorCount': errorCount,
      'okCount': okCount,
      'warningCount': warningCount,
      if (excludedCount != null) 'excludedCount': excludedCount,
    };
  }
}

/// Recommendation pillar aggregates
///
/// @nodoc
class RecommendationPillarSpecificAggregates {
  /// Cost optimizing aggregates
  final RecommendationCostOptimizingAggregates? costOptimizing;

  RecommendationPillarSpecificAggregates({
    this.costOptimizing,
  });

  factory RecommendationPillarSpecificAggregates.fromJson(
      Map<String, dynamic> json) {
    return RecommendationPillarSpecificAggregates(
      costOptimizing: json['costOptimizing'] != null
          ? RecommendationCostOptimizingAggregates.fromJson(
              json['costOptimizing'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final costOptimizing = this.costOptimizing;
    return {
      if (costOptimizing != null) 'costOptimizing': costOptimizing,
    };
  }
}

/// @nodoc
class StatusReason {
  static const noDataOk = StatusReason._('no_data_ok');

  final String value;

  const StatusReason._(this.value);

  static const values = [noDataOk];

  static StatusReason fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StatusReason._(value));

  @override
  bool operator ==(other) => other is StatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Cost optimizing aggregates for a Recommendation
///
/// @nodoc
class RecommendationCostOptimizingAggregates {
  /// The estimated monthly savings
  final double estimatedMonthlySavings;

  /// The estimated percently monthly savings
  final double estimatedPercentMonthlySavings;

  RecommendationCostOptimizingAggregates({
    required this.estimatedMonthlySavings,
    required this.estimatedPercentMonthlySavings,
  });

  factory RecommendationCostOptimizingAggregates.fromJson(
      Map<String, dynamic> json) {
    return RecommendationCostOptimizingAggregates(
      estimatedMonthlySavings:
          (json['estimatedMonthlySavings'] as double?) ?? 0,
      estimatedPercentMonthlySavings:
          (json['estimatedPercentMonthlySavings'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final estimatedMonthlySavings = this.estimatedMonthlySavings;
    final estimatedPercentMonthlySavings = this.estimatedPercentMonthlySavings;
    return {
      'estimatedMonthlySavings': estimatedMonthlySavings,
      'estimatedPercentMonthlySavings': estimatedPercentMonthlySavings,
    };
  }
}

/// @nodoc
class RecommendationPillar {
  static const costOptimizing = RecommendationPillar._('cost_optimizing');
  static const performance = RecommendationPillar._('performance');
  static const security = RecommendationPillar._('security');
  static const serviceLimits = RecommendationPillar._('service_limits');
  static const faultTolerance = RecommendationPillar._('fault_tolerance');
  static const operationalExcellence =
      RecommendationPillar._('operational_excellence');

  final String value;

  const RecommendationPillar._(this.value);

  static const values = [
    costOptimizing,
    performance,
    security,
    serviceLimits,
    faultTolerance,
    operationalExcellence
  ];

  static RecommendationPillar fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationPillar._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationPillar && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RecommendationLanguage {
  static const en = RecommendationLanguage._('en');
  static const ja = RecommendationLanguage._('ja');
  static const zh = RecommendationLanguage._('zh');
  static const fr = RecommendationLanguage._('fr');
  static const de = RecommendationLanguage._('de');
  static const ko = RecommendationLanguage._('ko');
  static const zhTw = RecommendationLanguage._('zh_TW');
  static const it = RecommendationLanguage._('it');
  static const es = RecommendationLanguage._('es');
  static const ptBr = RecommendationLanguage._('pt_BR');
  static const id = RecommendationLanguage._('id');

  final String value;

  const RecommendationLanguage._(this.value);

  static const values = [en, ja, zh, fr, de, ko, zhTw, it, es, ptBr, id];

  static RecommendationLanguage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecommendationLanguage._(value));

  @override
  bool operator ==(other) =>
      other is RecommendationLanguage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary of a Recommendation Resource
///
/// @nodoc
class RecommendationResourceSummary {
  /// The ARN of the Recommendation Resource
  final String arn;

  /// The AWS resource identifier. There are certain checks that generate
  /// recommendation resources without an awsResourceId.
  final String awsResourceId;

  /// The ID of the Recommendation Resource
  final String id;

  /// When the Recommendation Resource was last updated
  final DateTime lastUpdatedAt;

  /// Metadata associated with the Recommendation Resource
  final Map<String, String> metadata;

  /// The Recommendation ARN
  final String recommendationArn;

  /// The AWS Region code that the Recommendation Resource is in
  final String regionCode;

  /// The current status of the Recommendation Resource
  final ResourceStatus status;

  /// The exclusion status of the Recommendation Resource
  final ExclusionStatus? exclusionStatus;

  RecommendationResourceSummary({
    required this.arn,
    required this.awsResourceId,
    required this.id,
    required this.lastUpdatedAt,
    required this.metadata,
    required this.recommendationArn,
    required this.regionCode,
    required this.status,
    this.exclusionStatus,
  });

  factory RecommendationResourceSummary.fromJson(Map<String, dynamic> json) {
    return RecommendationResourceSummary(
      arn: (json['arn'] as String?) ?? '',
      awsResourceId: (json['awsResourceId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      metadata: ((json['metadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      recommendationArn: (json['recommendationArn'] as String?) ?? '',
      regionCode: (json['regionCode'] as String?) ?? '',
      status: ResourceStatus.fromString((json['status'] as String?) ?? ''),
      exclusionStatus:
          (json['exclusionStatus'] as String?)?.let(ExclusionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final awsResourceId = this.awsResourceId;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final metadata = this.metadata;
    final recommendationArn = this.recommendationArn;
    final regionCode = this.regionCode;
    final status = this.status;
    final exclusionStatus = this.exclusionStatus;
    return {
      'arn': arn,
      'awsResourceId': awsResourceId,
      'id': id,
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'metadata': metadata,
      'recommendationArn': recommendationArn,
      'regionCode': regionCode,
      'status': status.value,
      if (exclusionStatus != null) 'exclusionStatus': exclusionStatus.value,
    };
  }
}

/// @nodoc
class ResourceStatus {
  static const ok = ResourceStatus._('ok');
  static const warning = ResourceStatus._('warning');
  static const error = ResourceStatus._('error');

  final String value;

  const ResourceStatus._(this.value);

  static const values = [ok, warning, error];

  static ResourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceStatus._(value));

  @override
  bool operator ==(other) => other is ResourceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ExclusionStatus {
  static const excluded = ExclusionStatus._('excluded');
  static const included = ExclusionStatus._('included');

  final String value;

  const ExclusionStatus._(this.value);

  static const values = [excluded, included];

  static ExclusionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExclusionStatus._(value));

  @override
  bool operator ==(other) => other is ExclusionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary of recommendation for accounts within an Organization
///
/// @nodoc
class OrganizationRecommendationSummary {
  /// The ARN of the Recommendation
  final String arn;

  /// The ID which identifies where the Recommendation was produced
  final String id;

  /// The name of the AWS Trusted Advisor Recommendation
  final String name;

  /// The Pillars that the Recommendation is optimizing
  final List<RecommendationPillar> pillars;

  /// An aggregation of all resources
  final RecommendationResourcesAggregates resourcesAggregates;

  /// The source of the Recommendation
  final RecommendationSource source;

  /// The status of the Recommendation
  final RecommendationStatus status;

  /// Whether the Recommendation was automated or generated by AWS Trusted Advisor
  /// Priority
  final RecommendationType type;

  /// The AWS Services that the Recommendation applies to
  final List<String>? awsServices;

  /// The AWS Trusted Advisor Check ARN that relates to the Recommendation
  final String? checkArn;

  /// When the Recommendation was created, if created by AWS Trusted Advisor
  /// Priority
  final DateTime? createdAt;

  /// When the Recommendation was last updated
  final DateTime? lastUpdatedAt;

  /// The lifecycle stage from AWS Trusted Advisor Priority
  final RecommendationLifecycleStage? lifecycleStage;

  /// The pillar aggregations for cost savings
  final RecommendationPillarSpecificAggregates? pillarSpecificAggregates;

  OrganizationRecommendationSummary({
    required this.arn,
    required this.id,
    required this.name,
    required this.pillars,
    required this.resourcesAggregates,
    required this.source,
    required this.status,
    required this.type,
    this.awsServices,
    this.checkArn,
    this.createdAt,
    this.lastUpdatedAt,
    this.lifecycleStage,
    this.pillarSpecificAggregates,
  });

  factory OrganizationRecommendationSummary.fromJson(
      Map<String, dynamic> json) {
    return OrganizationRecommendationSummary(
      arn: (json['arn'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      pillars: ((json['pillars'] as List?) ?? const [])
          .nonNulls
          .map((e) => RecommendationPillar.fromString((e as String)))
          .toList(),
      resourcesAggregates: RecommendationResourcesAggregates.fromJson(
          (json['resourcesAggregates'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      source:
          RecommendationSource.fromString((json['source'] as String?) ?? ''),
      status:
          RecommendationStatus.fromString((json['status'] as String?) ?? ''),
      type: RecommendationType.fromString((json['type'] as String?) ?? ''),
      awsServices: (json['awsServices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      checkArn: json['checkArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lifecycleStage: (json['lifecycleStage'] as String?)
          ?.let(RecommendationLifecycleStage.fromString),
      pillarSpecificAggregates: json['pillarSpecificAggregates'] != null
          ? RecommendationPillarSpecificAggregates.fromJson(
              json['pillarSpecificAggregates'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final pillars = this.pillars;
    final resourcesAggregates = this.resourcesAggregates;
    final source = this.source;
    final status = this.status;
    final type = this.type;
    final awsServices = this.awsServices;
    final checkArn = this.checkArn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lifecycleStage = this.lifecycleStage;
    final pillarSpecificAggregates = this.pillarSpecificAggregates;
    return {
      'arn': arn,
      'id': id,
      'name': name,
      'pillars': pillars.map((e) => e.value).toList(),
      'resourcesAggregates': resourcesAggregates,
      'source': source.value,
      'status': status.value,
      'type': type.value,
      if (awsServices != null) 'awsServices': awsServices,
      if (checkArn != null) 'checkArn': checkArn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (lifecycleStage != null) 'lifecycleStage': lifecycleStage.value,
      if (pillarSpecificAggregates != null)
        'pillarSpecificAggregates': pillarSpecificAggregates,
    };
  }
}

/// Organization Recommendation Resource Summary
///
/// @nodoc
class OrganizationRecommendationResourceSummary {
  /// The ARN of the Recommendation Resource
  final String arn;

  /// The AWS resource identifier. There are certain checks that generate
  /// recommendation resources without an awsResourceId.
  final String awsResourceId;

  /// The ID of the Recommendation Resource
  final String id;

  /// When the Recommendation Resource was last updated
  final DateTime lastUpdatedAt;

  /// Metadata associated with the Recommendation Resource
  final Map<String, String> metadata;

  /// The Recommendation ARN
  final String recommendationArn;

  /// The AWS Region code that the Recommendation Resource is in
  final String regionCode;

  /// The current status of the Recommendation Resource
  final ResourceStatus status;

  /// The AWS account ID
  final String? accountId;

  /// The exclusion status of the Recommendation Resource
  final ExclusionStatus? exclusionStatus;

  OrganizationRecommendationResourceSummary({
    required this.arn,
    required this.awsResourceId,
    required this.id,
    required this.lastUpdatedAt,
    required this.metadata,
    required this.recommendationArn,
    required this.regionCode,
    required this.status,
    this.accountId,
    this.exclusionStatus,
  });

  factory OrganizationRecommendationResourceSummary.fromJson(
      Map<String, dynamic> json) {
    return OrganizationRecommendationResourceSummary(
      arn: (json['arn'] as String?) ?? '',
      awsResourceId: (json['awsResourceId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      metadata: ((json['metadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      recommendationArn: (json['recommendationArn'] as String?) ?? '',
      regionCode: (json['regionCode'] as String?) ?? '',
      status: ResourceStatus.fromString((json['status'] as String?) ?? ''),
      accountId: json['accountId'] as String?,
      exclusionStatus:
          (json['exclusionStatus'] as String?)?.let(ExclusionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final awsResourceId = this.awsResourceId;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final metadata = this.metadata;
    final recommendationArn = this.recommendationArn;
    final regionCode = this.regionCode;
    final status = this.status;
    final accountId = this.accountId;
    final exclusionStatus = this.exclusionStatus;
    return {
      'arn': arn,
      'awsResourceId': awsResourceId,
      'id': id,
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'metadata': metadata,
      'recommendationArn': recommendationArn,
      'regionCode': regionCode,
      'status': status.value,
      if (accountId != null) 'accountId': accountId,
      if (exclusionStatus != null) 'exclusionStatus': exclusionStatus.value,
    };
  }
}

/// Summary of an AccountRecommendationLifecycle for an Organization
/// Recommendation
///
/// @nodoc
class AccountRecommendationLifecycleSummary {
  /// The AWS account ID
  final String? accountId;

  /// The Recommendation ARN
  final String? accountRecommendationArn;

  /// When the Recommendation was last updated
  final DateTime? lastUpdatedAt;

  /// The lifecycle stage from AWS Trusted Advisor Priority
  final RecommendationLifecycleStage? lifecycleStage;

  /// Reason for the lifecycle stage change
  final String? updateReason;

  /// Reason code for the lifecycle state change
  final UpdateRecommendationLifecycleStageReasonCode? updateReasonCode;

  /// The person on whose behalf a Technical Account Manager (TAM) updated the
  /// recommendation. This information is only available when a Technical Account
  /// Manager takes an action on a recommendation managed by AWS Trusted Advisor
  /// Priority
  final String? updatedOnBehalfOf;

  /// The job title of the person on whose behalf a Technical Account Manager
  /// (TAM) updated the recommendation. This information is only available when a
  /// Technical Account Manager takes an action on a recommendation managed by AWS
  /// Trusted Advisor Priority
  final String? updatedOnBehalfOfJobTitle;

  AccountRecommendationLifecycleSummary({
    this.accountId,
    this.accountRecommendationArn,
    this.lastUpdatedAt,
    this.lifecycleStage,
    this.updateReason,
    this.updateReasonCode,
    this.updatedOnBehalfOf,
    this.updatedOnBehalfOfJobTitle,
  });

  factory AccountRecommendationLifecycleSummary.fromJson(
      Map<String, dynamic> json) {
    return AccountRecommendationLifecycleSummary(
      accountId: json['accountId'] as String?,
      accountRecommendationArn: json['accountRecommendationArn'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lifecycleStage: (json['lifecycleStage'] as String?)
          ?.let(RecommendationLifecycleStage.fromString),
      updateReason: json['updateReason'] as String?,
      updateReasonCode: (json['updateReasonCode'] as String?)
          ?.let(UpdateRecommendationLifecycleStageReasonCode.fromString),
      updatedOnBehalfOf: json['updatedOnBehalfOf'] as String?,
      updatedOnBehalfOfJobTitle: json['updatedOnBehalfOfJobTitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final accountRecommendationArn = this.accountRecommendationArn;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lifecycleStage = this.lifecycleStage;
    final updateReason = this.updateReason;
    final updateReasonCode = this.updateReasonCode;
    final updatedOnBehalfOf = this.updatedOnBehalfOf;
    final updatedOnBehalfOfJobTitle = this.updatedOnBehalfOfJobTitle;
    return {
      if (accountId != null) 'accountId': accountId,
      if (accountRecommendationArn != null)
        'accountRecommendationArn': accountRecommendationArn,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (lifecycleStage != null) 'lifecycleStage': lifecycleStage.value,
      if (updateReason != null) 'updateReason': updateReason,
      if (updateReasonCode != null) 'updateReasonCode': updateReasonCode.value,
      if (updatedOnBehalfOf != null) 'updatedOnBehalfOf': updatedOnBehalfOf,
      if (updatedOnBehalfOfJobTitle != null)
        'updatedOnBehalfOfJobTitle': updatedOnBehalfOfJobTitle,
    };
  }
}

/// A summary of an AWS Trusted Advisor Check
///
/// @nodoc
class CheckSummary {
  /// The ARN of the AWS Trusted Advisor Check
  final String arn;

  /// The AWS Services that the Check applies to
  final List<String> awsServices;

  /// A description of what the AWS Trusted Advisor Check is monitoring
  final String description;

  /// The unique identifier of the AWS Trusted Advisor Check
  final String id;

  /// The column headings for the metadata returned in the resource
  final Map<String, String> metadata;

  /// The name of the AWS Trusted Advisor Check
  final String name;

  /// The Recommendation pillars that the AWS Trusted Advisor Check falls under
  final List<RecommendationPillar> pillars;

  /// The source of the Recommendation
  final RecommendationSource source;

  CheckSummary({
    required this.arn,
    required this.awsServices,
    required this.description,
    required this.id,
    required this.metadata,
    required this.name,
    required this.pillars,
    required this.source,
  });

  factory CheckSummary.fromJson(Map<String, dynamic> json) {
    return CheckSummary(
      arn: (json['arn'] as String?) ?? '',
      awsServices: ((json['awsServices'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      metadata: ((json['metadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      name: (json['name'] as String?) ?? '',
      pillars: ((json['pillars'] as List?) ?? const [])
          .nonNulls
          .map((e) => RecommendationPillar.fromString((e as String)))
          .toList(),
      source:
          RecommendationSource.fromString((json['source'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final awsServices = this.awsServices;
    final description = this.description;
    final id = this.id;
    final metadata = this.metadata;
    final name = this.name;
    final pillars = this.pillars;
    final source = this.source;
    return {
      'arn': arn,
      'awsServices': awsServices,
      'description': description,
      'id': id,
      'metadata': metadata,
      'name': name,
      'pillars': pillars.map((e) => e.value).toList(),
      'source': source.value,
    };
  }
}

/// A Recommendation for an Account
///
/// @nodoc
class Recommendation {
  /// The ARN of the Recommendation
  final String arn;

  /// A description for AWS Trusted Advisor recommendations
  final String description;

  /// The ID which identifies where the Recommendation was produced
  final String id;

  /// The name of the AWS Trusted Advisor Recommendation
  final String name;

  /// The Pillars that the Recommendation is optimizing
  final List<RecommendationPillar> pillars;

  /// An aggregation of all resources
  final RecommendationResourcesAggregates resourcesAggregates;

  /// The source of the Recommendation
  final RecommendationSource source;

  /// The status of the Recommendation
  final RecommendationStatus status;

  /// Whether the Recommendation was automated or generated by AWS Trusted Advisor
  /// Priority
  final RecommendationType type;

  /// The AWS Services that the Recommendation applies to
  final List<String>? awsServices;

  /// The AWS Trusted Advisor Check ARN that relates to the Recommendation
  final String? checkArn;

  /// When the Recommendation was created, if created by AWS Trusted Advisor
  /// Priority
  final DateTime? createdAt;

  /// The creator, if created by AWS Trusted Advisor Priority
  final String? createdBy;

  /// When the Recommendation was last updated
  final DateTime? lastUpdatedAt;

  /// The lifecycle stage from AWS Trusted Advisor Priority
  final RecommendationLifecycleStage? lifecycleStage;

  /// The pillar aggregations for cost savings
  final RecommendationPillarSpecificAggregates? pillarSpecificAggregates;

  /// When the Recommendation was resolved
  final DateTime? resolvedAt;

  /// This attribute provides additional details about potential discrepancies in
  /// check status determination.
  final StatusReason? statusReason;

  /// Reason for the lifecycle stage change
  final String? updateReason;

  /// Reason code for the lifecycle state change
  final UpdateRecommendationLifecycleStageReasonCode? updateReasonCode;

  /// The person on whose behalf a Technical Account Manager (TAM) updated the
  /// recommendation. This information is only available when a Technical Account
  /// Manager takes an action on a recommendation managed by AWS Trusted Advisor
  /// Priority
  final String? updatedOnBehalfOf;

  /// The job title of the person on whose behalf a Technical Account Manager
  /// (TAM) updated the recommendation. This information is only available when a
  /// Technical Account Manager takes an action on a recommendation managed by AWS
  /// Trusted Advisor Priority
  final String? updatedOnBehalfOfJobTitle;

  Recommendation({
    required this.arn,
    required this.description,
    required this.id,
    required this.name,
    required this.pillars,
    required this.resourcesAggregates,
    required this.source,
    required this.status,
    required this.type,
    this.awsServices,
    this.checkArn,
    this.createdAt,
    this.createdBy,
    this.lastUpdatedAt,
    this.lifecycleStage,
    this.pillarSpecificAggregates,
    this.resolvedAt,
    this.statusReason,
    this.updateReason,
    this.updateReasonCode,
    this.updatedOnBehalfOf,
    this.updatedOnBehalfOfJobTitle,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      arn: (json['arn'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      pillars: ((json['pillars'] as List?) ?? const [])
          .nonNulls
          .map((e) => RecommendationPillar.fromString((e as String)))
          .toList(),
      resourcesAggregates: RecommendationResourcesAggregates.fromJson(
          (json['resourcesAggregates'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      source:
          RecommendationSource.fromString((json['source'] as String?) ?? ''),
      status:
          RecommendationStatus.fromString((json['status'] as String?) ?? ''),
      type: RecommendationType.fromString((json['type'] as String?) ?? ''),
      awsServices: (json['awsServices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      checkArn: json['checkArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lifecycleStage: (json['lifecycleStage'] as String?)
          ?.let(RecommendationLifecycleStage.fromString),
      pillarSpecificAggregates: json['pillarSpecificAggregates'] != null
          ? RecommendationPillarSpecificAggregates.fromJson(
              json['pillarSpecificAggregates'] as Map<String, dynamic>)
          : null,
      resolvedAt: timeStampFromJson(json['resolvedAt']),
      statusReason:
          (json['statusReason'] as String?)?.let(StatusReason.fromString),
      updateReason: json['updateReason'] as String?,
      updateReasonCode: (json['updateReasonCode'] as String?)
          ?.let(UpdateRecommendationLifecycleStageReasonCode.fromString),
      updatedOnBehalfOf: json['updatedOnBehalfOf'] as String?,
      updatedOnBehalfOfJobTitle: json['updatedOnBehalfOfJobTitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final pillars = this.pillars;
    final resourcesAggregates = this.resourcesAggregates;
    final source = this.source;
    final status = this.status;
    final type = this.type;
    final awsServices = this.awsServices;
    final checkArn = this.checkArn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lifecycleStage = this.lifecycleStage;
    final pillarSpecificAggregates = this.pillarSpecificAggregates;
    final resolvedAt = this.resolvedAt;
    final statusReason = this.statusReason;
    final updateReason = this.updateReason;
    final updateReasonCode = this.updateReasonCode;
    final updatedOnBehalfOf = this.updatedOnBehalfOf;
    final updatedOnBehalfOfJobTitle = this.updatedOnBehalfOfJobTitle;
    return {
      'arn': arn,
      'description': description,
      'id': id,
      'name': name,
      'pillars': pillars.map((e) => e.value).toList(),
      'resourcesAggregates': resourcesAggregates,
      'source': source.value,
      'status': status.value,
      'type': type.value,
      if (awsServices != null) 'awsServices': awsServices,
      if (checkArn != null) 'checkArn': checkArn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (lifecycleStage != null) 'lifecycleStage': lifecycleStage.value,
      if (pillarSpecificAggregates != null)
        'pillarSpecificAggregates': pillarSpecificAggregates,
      if (resolvedAt != null) 'resolvedAt': iso8601ToJson(resolvedAt),
      if (statusReason != null) 'statusReason': statusReason.value,
      if (updateReason != null) 'updateReason': updateReason,
      if (updateReasonCode != null) 'updateReasonCode': updateReasonCode.value,
      if (updatedOnBehalfOf != null) 'updatedOnBehalfOf': updatedOnBehalfOf,
      if (updatedOnBehalfOfJobTitle != null)
        'updatedOnBehalfOfJobTitle': updatedOnBehalfOfJobTitle,
    };
  }
}

/// A Recommendation for accounts within an Organization
///
/// @nodoc
class OrganizationRecommendation {
  /// The ARN of the Recommendation
  final String arn;

  /// A description for AWS Trusted Advisor recommendations
  final String description;

  /// The ID which identifies where the Recommendation was produced
  final String id;

  /// The name of the AWS Trusted Advisor Recommendation
  final String name;

  /// The Pillars that the Recommendation is optimizing
  final List<RecommendationPillar> pillars;

  /// An aggregation of all resources
  final RecommendationResourcesAggregates resourcesAggregates;

  /// The source of the Recommendation
  final RecommendationSource source;

  /// The status of the Recommendation
  final RecommendationStatus status;

  /// Whether the Recommendation was automated or generated by AWS Trusted Advisor
  /// Priority
  final RecommendationType type;

  /// The AWS Services that the Recommendation applies to
  final List<String>? awsServices;

  /// The AWS Trusted Advisor Check ARN that relates to the Recommendation
  final String? checkArn;

  /// When the Recommendation was created, if created by AWS Trusted Advisor
  /// Priority
  final DateTime? createdAt;

  /// The creator, if created by AWS Trusted Advisor Priority
  final String? createdBy;

  /// When the Recommendation was last updated
  final DateTime? lastUpdatedAt;

  /// The lifecycle stage from AWS Trusted Advisor Priority
  final RecommendationLifecycleStage? lifecycleStage;

  /// The pillar aggregations for cost savings
  final RecommendationPillarSpecificAggregates? pillarSpecificAggregates;

  /// When the Recommendation was resolved
  final DateTime? resolvedAt;

  /// Reason for the lifecycle stage change
  final String? updateReason;

  /// Reason code for the lifecycle state change
  final UpdateRecommendationLifecycleStageReasonCode? updateReasonCode;

  /// The person on whose behalf a Technical Account Manager (TAM) updated the
  /// recommendation. This information is only available when a Technical Account
  /// Manager takes an action on a recommendation managed by AWS Trusted Advisor
  /// Priority
  final String? updatedOnBehalfOf;

  /// The job title of the person on whose behalf a Technical Account Manager
  /// (TAM) updated the recommendation. This information is only available when a
  /// Technical Account Manager takes an action on a recommendation managed by AWS
  /// Trusted Advisor Priority
  final String? updatedOnBehalfOfJobTitle;

  OrganizationRecommendation({
    required this.arn,
    required this.description,
    required this.id,
    required this.name,
    required this.pillars,
    required this.resourcesAggregates,
    required this.source,
    required this.status,
    required this.type,
    this.awsServices,
    this.checkArn,
    this.createdAt,
    this.createdBy,
    this.lastUpdatedAt,
    this.lifecycleStage,
    this.pillarSpecificAggregates,
    this.resolvedAt,
    this.updateReason,
    this.updateReasonCode,
    this.updatedOnBehalfOf,
    this.updatedOnBehalfOfJobTitle,
  });

  factory OrganizationRecommendation.fromJson(Map<String, dynamic> json) {
    return OrganizationRecommendation(
      arn: (json['arn'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      pillars: ((json['pillars'] as List?) ?? const [])
          .nonNulls
          .map((e) => RecommendationPillar.fromString((e as String)))
          .toList(),
      resourcesAggregates: RecommendationResourcesAggregates.fromJson(
          (json['resourcesAggregates'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      source:
          RecommendationSource.fromString((json['source'] as String?) ?? ''),
      status:
          RecommendationStatus.fromString((json['status'] as String?) ?? ''),
      type: RecommendationType.fromString((json['type'] as String?) ?? ''),
      awsServices: (json['awsServices'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      checkArn: json['checkArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lifecycleStage: (json['lifecycleStage'] as String?)
          ?.let(RecommendationLifecycleStage.fromString),
      pillarSpecificAggregates: json['pillarSpecificAggregates'] != null
          ? RecommendationPillarSpecificAggregates.fromJson(
              json['pillarSpecificAggregates'] as Map<String, dynamic>)
          : null,
      resolvedAt: timeStampFromJson(json['resolvedAt']),
      updateReason: json['updateReason'] as String?,
      updateReasonCode: (json['updateReasonCode'] as String?)
          ?.let(UpdateRecommendationLifecycleStageReasonCode.fromString),
      updatedOnBehalfOf: json['updatedOnBehalfOf'] as String?,
      updatedOnBehalfOfJobTitle: json['updatedOnBehalfOfJobTitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final pillars = this.pillars;
    final resourcesAggregates = this.resourcesAggregates;
    final source = this.source;
    final status = this.status;
    final type = this.type;
    final awsServices = this.awsServices;
    final checkArn = this.checkArn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lifecycleStage = this.lifecycleStage;
    final pillarSpecificAggregates = this.pillarSpecificAggregates;
    final resolvedAt = this.resolvedAt;
    final updateReason = this.updateReason;
    final updateReasonCode = this.updateReasonCode;
    final updatedOnBehalfOf = this.updatedOnBehalfOf;
    final updatedOnBehalfOfJobTitle = this.updatedOnBehalfOfJobTitle;
    return {
      'arn': arn,
      'description': description,
      'id': id,
      'name': name,
      'pillars': pillars.map((e) => e.value).toList(),
      'resourcesAggregates': resourcesAggregates,
      'source': source.value,
      'status': status.value,
      'type': type.value,
      if (awsServices != null) 'awsServices': awsServices,
      if (checkArn != null) 'checkArn': checkArn,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (lifecycleStage != null) 'lifecycleStage': lifecycleStage.value,
      if (pillarSpecificAggregates != null)
        'pillarSpecificAggregates': pillarSpecificAggregates,
      if (resolvedAt != null) 'resolvedAt': iso8601ToJson(resolvedAt),
      if (updateReason != null) 'updateReason': updateReason,
      if (updateReasonCode != null) 'updateReasonCode': updateReasonCode.value,
      if (updatedOnBehalfOf != null) 'updatedOnBehalfOf': updatedOnBehalfOf,
      if (updatedOnBehalfOfJobTitle != null)
        'updatedOnBehalfOfJobTitle': updatedOnBehalfOfJobTitle,
    };
  }
}

/// The error entry for Recommendation Resource exclusion. Each entry is a
/// combination of Recommendation Resource ARN, error code and error message
///
/// @nodoc
class UpdateRecommendationResourceExclusionError {
  /// The ARN of the Recommendation Resource
  final String? arn;

  /// The error code
  final String? errorCode;

  /// The error message
  final String? errorMessage;

  UpdateRecommendationResourceExclusionError({
    this.arn,
    this.errorCode,
    this.errorMessage,
  });

  factory UpdateRecommendationResourceExclusionError.fromJson(
      Map<String, dynamic> json) {
    return UpdateRecommendationResourceExclusionError(
      arn: json['arn'] as String?,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (arn != null) 'arn': arn,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// The request entry for Recommendation Resource exclusion. Each entry is a
/// combination of Recommendation Resource ARN and corresponding exclusion
/// status
///
/// @nodoc
class RecommendationResourceExclusion {
  /// The ARN of the Recommendation Resource
  final String arn;

  /// The exclusion status
  final bool isExcluded;

  RecommendationResourceExclusion({
    required this.arn,
    required this.isExcluded,
  });

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final isExcluded = this.isExcluded;
    return {
      'arn': arn,
      'isExcluded': isExcluded,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
