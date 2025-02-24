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
class TrustedAdvisorPublicApi {
  final _s.RestJsonProtocol _protocol;
  TrustedAdvisorPublicApi({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'trustedadvisor',
            signingName: 'trustedadvisor',
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

  /// Update one or more exclusion status for a list of recommendation resources
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
  /// This API supports only prioritized recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

  /// Get a specific Recommendation
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [recommendationIdentifier] :
  /// The Recommendation identifier
  Future<GetRecommendationResponse> getRecommendation({
    required String recommendationIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/recommendations/${Uri.encodeComponent(recommendationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommendationResponse.fromJson(response);
  }

  /// List a filterable set of Checks
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
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
  /// recommendation. This API only supports prioritized recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
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
  /// supports prioritized recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
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
  /// only supports prioritized recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
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

  /// List Resources of a Recommendation
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [recommendationIdentifier] :
  /// The Recommendation identifier
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
  Future<ListRecommendationResourcesResponse> listRecommendationResources({
    required String recommendationIdentifier,
    ExclusionStatus? exclusionStatus,
    int? maxResults,
    String? nextToken,
    String? regionCode,
    ResourceStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $query = <String, List<String>>{
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
          '/v1/recommendations/${Uri.encodeComponent(recommendationIdentifier)}/resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationResourcesResponse.fromJson(response);
  }

  /// List a filterable set of Recommendations
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
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
  Future<ListRecommendationsResponse> listRecommendations({
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
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
      requestUri: '/v1/recommendations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationsResponse.fromJson(response);
  }

  /// Update the lifecycle of a Recommendation within an Organization. This API
  /// only supports prioritized recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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
  /// prioritized recommendations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
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

/// Summary of an AccountRecommendationLifecycle for an Organization
/// Recommendation
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
          (json['batchUpdateRecommendationResourceExclusionErrors'] as List)
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

/// A summary of an AWS Trusted Advisor Check
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
      arn: json['arn'] as String,
      awsServices: (json['awsServices'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      id: json['id'] as String,
      metadata: (json['metadata'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      name: json['name'] as String,
      pillars: (json['pillars'] as List)
          .nonNulls
          .map((e) => RecommendationPillar.fromString((e as String)))
          .toList(),
      source: RecommendationSource.fromString((json['source'] as String)),
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

enum ExclusionStatus {
  excluded('excluded'),
  included('included'),
  ;

  final String value;

  const ExclusionStatus(this.value);

  static ExclusionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ExclusionStatus'));
}

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
      checkSummaries: (json['checkSummaries'] as List)
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
          (json['accountRecommendationLifecycleSummaries'] as List)
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
          (json['organizationRecommendationResourceSummaries'] as List)
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
          (json['organizationRecommendationSummaries'] as List)
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
      recommendationResourceSummaries: (json['recommendationResourceSummaries']
              as List)
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
      recommendationSummaries: (json['recommendationSummaries'] as List)
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

/// A Recommendation for accounts within an Organization
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
      arn: json['arn'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      pillars: (json['pillars'] as List)
          .nonNulls
          .map((e) => RecommendationPillar.fromString((e as String)))
          .toList(),
      resourcesAggregates: RecommendationResourcesAggregates.fromJson(
          json['resourcesAggregates'] as Map<String, dynamic>),
      source: RecommendationSource.fromString((json['source'] as String)),
      status: RecommendationStatus.fromString((json['status'] as String)),
      type: RecommendationType.fromString((json['type'] as String)),
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

/// Organization Recommendation Resource Summary
class OrganizationRecommendationResourceSummary {
  /// The ARN of the Recommendation Resource
  final String arn;

  /// The AWS resource identifier
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
      arn: json['arn'] as String,
      awsResourceId: json['awsResourceId'] as String,
      id: json['id'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      metadata: (json['metadata'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      recommendationArn: json['recommendationArn'] as String,
      regionCode: json['regionCode'] as String,
      status: ResourceStatus.fromString((json['status'] as String)),
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

/// Summary of recommendation for accounts within an Organization
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
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      pillars: (json['pillars'] as List)
          .nonNulls
          .map((e) => RecommendationPillar.fromString((e as String)))
          .toList(),
      resourcesAggregates: RecommendationResourcesAggregates.fromJson(
          json['resourcesAggregates'] as Map<String, dynamic>),
      source: RecommendationSource.fromString((json['source'] as String)),
      status: RecommendationStatus.fromString((json['status'] as String)),
      type: RecommendationType.fromString((json['type'] as String)),
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

/// A Recommendation for an Account
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
    this.updateReason,
    this.updateReasonCode,
    this.updatedOnBehalfOf,
    this.updatedOnBehalfOfJobTitle,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      arn: json['arn'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      pillars: (json['pillars'] as List)
          .nonNulls
          .map((e) => RecommendationPillar.fromString((e as String)))
          .toList(),
      resourcesAggregates: RecommendationResourcesAggregates.fromJson(
          json['resourcesAggregates'] as Map<String, dynamic>),
      source: RecommendationSource.fromString((json['source'] as String)),
      status: RecommendationStatus.fromString((json['status'] as String)),
      type: RecommendationType.fromString((json['type'] as String)),
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

/// Cost optimizing aggregates for a Recommendation
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
      estimatedMonthlySavings: json['estimatedMonthlySavings'] as double,
      estimatedPercentMonthlySavings:
          json['estimatedPercentMonthlySavings'] as double,
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

enum RecommendationLanguage {
  en('en'),
  ja('ja'),
  zh('zh'),
  fr('fr'),
  de('de'),
  ko('ko'),
  zhTw('zh_TW'),
  it('it'),
  es('es'),
  ptBr('pt_BR'),
  id('id'),
  ;

  final String value;

  const RecommendationLanguage(this.value);

  static RecommendationLanguage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RecommendationLanguage'));
}

enum RecommendationLifecycleStage {
  inProgress('in_progress'),
  pendingResponse('pending_response'),
  dismissed('dismissed'),
  resolved('resolved'),
  ;

  final String value;

  const RecommendationLifecycleStage(this.value);

  static RecommendationLifecycleStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum RecommendationLifecycleStage'));
}

enum RecommendationPillar {
  costOptimizing('cost_optimizing'),
  performance('performance'),
  security('security'),
  serviceLimits('service_limits'),
  faultTolerance('fault_tolerance'),
  operationalExcellence('operational_excellence'),
  ;

  final String value;

  const RecommendationPillar(this.value);

  static RecommendationPillar fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RecommendationPillar'));
}

/// Recommendation pillar aggregates
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

/// The request entry for Recommendation Resource exclusion. Each entry is a
/// combination of Recommendation Resource ARN and corresponding exclusion
/// status
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

/// Summary of a Recommendation Resource
class RecommendationResourceSummary {
  /// The ARN of the Recommendation Resource
  final String arn;

  /// The AWS resource identifier
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
      arn: json['arn'] as String,
      awsResourceId: json['awsResourceId'] as String,
      id: json['id'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      metadata: (json['metadata'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      recommendationArn: json['recommendationArn'] as String,
      regionCode: json['regionCode'] as String,
      status: ResourceStatus.fromString((json['status'] as String)),
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

/// Aggregation of Recommendation Resources
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

  RecommendationResourcesAggregates({
    required this.errorCount,
    required this.okCount,
    required this.warningCount,
  });

  factory RecommendationResourcesAggregates.fromJson(
      Map<String, dynamic> json) {
    return RecommendationResourcesAggregates(
      errorCount: json['errorCount'] as int,
      okCount: json['okCount'] as int,
      warningCount: json['warningCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCount = this.errorCount;
    final okCount = this.okCount;
    final warningCount = this.warningCount;
    return {
      'errorCount': errorCount,
      'okCount': okCount,
      'warningCount': warningCount,
    };
  }
}

enum RecommendationSource {
  awsConfig('aws_config'),
  computeOptimizer('compute_optimizer'),
  costExplorer('cost_explorer'),
  lse('lse'),
  manual('manual'),
  pse('pse'),
  rds('rds'),
  resilience('resilience'),
  resilienceHub('resilience_hub'),
  securityHub('security_hub'),
  stir('stir'),
  taCheck('ta_check'),
  wellArchitected('well_architected'),
  ;

  final String value;

  const RecommendationSource(this.value);

  static RecommendationSource fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RecommendationSource'));
}

enum RecommendationStatus {
  ok('ok'),
  warning('warning'),
  error('error'),
  ;

  final String value;

  const RecommendationStatus(this.value);

  static RecommendationStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RecommendationStatus'));
}

/// Summary of Recommendation for an Account
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
  });

  factory RecommendationSummary.fromJson(Map<String, dynamic> json) {
    return RecommendationSummary(
      arn: json['arn'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      pillars: (json['pillars'] as List)
          .nonNulls
          .map((e) => RecommendationPillar.fromString((e as String)))
          .toList(),
      resourcesAggregates: RecommendationResourcesAggregates.fromJson(
          json['resourcesAggregates'] as Map<String, dynamic>),
      source: RecommendationSource.fromString((json['source'] as String)),
      status: RecommendationStatus.fromString((json['status'] as String)),
      type: RecommendationType.fromString((json['type'] as String)),
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

enum RecommendationType {
  standard('standard'),
  priority('priority'),
  ;

  final String value;

  const RecommendationType(this.value);

  static RecommendationType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RecommendationType'));
}

enum ResourceStatus {
  ok('ok'),
  warning('warning'),
  error('error'),
  ;

  final String value;

  const ResourceStatus(this.value);

  static ResourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ResourceStatus'));
}

enum UpdateRecommendationLifecycleStage {
  pendingResponse('pending_response'),
  inProgress('in_progress'),
  dismissed('dismissed'),
  resolved('resolved'),
  ;

  final String value;

  const UpdateRecommendationLifecycleStage(this.value);

  static UpdateRecommendationLifecycleStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum UpdateRecommendationLifecycleStage'));
}

enum UpdateRecommendationLifecycleStageReasonCode {
  nonCriticalAccount('non_critical_account'),
  temporaryAccount('temporary_account'),
  validBusinessCase('valid_business_case'),
  otherMethodsAvailable('other_methods_available'),
  lowPriority('low_priority'),
  notApplicable('not_applicable'),
  other('other'),
  ;

  final String value;

  const UpdateRecommendationLifecycleStageReasonCode(this.value);

  static UpdateRecommendationLifecycleStageReasonCode fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum UpdateRecommendationLifecycleStageReasonCode'));
}

/// The error entry for Recommendation Resource exclusion. Each entry is a
/// combination of Recommendation Resource ARN, error code and error message
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

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
