// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// AWS IAM Access Analyzer helps identify potential resource-access risks by
/// enabling you to identify any policies that grant access to an external
/// principal. It does this by using logic-based reasoning to analyze
/// resource-based policies in your AWS environment. An external principal can
/// be another AWS account, a root user, an IAM user or role, a federated user,
/// an AWS service, or an anonymous user. You can also use Access Analyzer to
/// preview and validate public and cross-account access to your resources
/// before deploying permissions changes. This guide describes the AWS IAM
/// Access Analyzer operations that you can call programmatically. For general
/// information about Access Analyzer, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html">AWS
/// IAM Access Analyzer</a> in the <b>IAM User Guide</b>.
///
/// To start using Access Analyzer, you first need to create an analyzer.
class AccessAnalyzer {
  final _s.RestJsonProtocol _protocol;
  AccessAnalyzer({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'access-analyzer',
            signingName: 'access-analyzer',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Retroactively applies the archive rule to existing findings that meet the
  /// archive rule criteria.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerArn] :
  /// The Amazon resource name (ARN) of the analyzer.
  ///
  /// Parameter [ruleName] :
  /// The name of the rule to apply.
  ///
  /// Parameter [clientToken] :
  /// A client token.
  Future<void> applyArchiveRule({
    required String analyzerArn,
    required String ruleName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      255,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'analyzerArn': analyzerArn,
      'ruleName': ruleName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/archive-rule',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels the requested policy generation.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The <code>JobId</code> that is returned by the
  /// <code>StartPolicyGeneration</code> operation. The <code>JobId</code> can
  /// be used with <code>GetGeneratedPolicy</code> to retrieve the generated
  /// policies or used with <code>CancelPolicyGeneration</code> to cancel the
  /// policy generation request.
  Future<void> cancelPolicyGeneration({
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/policy/generation/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an access preview that allows you to preview Access Analyzer
  /// findings for your resource before deploying resource permissions.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources">ARN
  /// of the account analyzer</a> used to generate the access preview. You can
  /// only create an access preview for analyzers with an <code>Account</code>
  /// type and <code>Active</code> status.
  ///
  /// Parameter [configurations] :
  /// Access control configuration for your resource that is used to generate
  /// the access preview. The access preview includes findings for external
  /// access allowed to the resource with the proposed access control
  /// configuration. The configuration must contain exactly one element.
  ///
  /// Parameter [clientToken] :
  /// A client token.
  Future<CreateAccessPreviewResponse> createAccessPreview({
    required String analyzerArn,
    required Map<String, Configuration> configurations,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    ArgumentError.checkNotNull(configurations, 'configurations');
    final $payload = <String, dynamic>{
      'analyzerArn': analyzerArn,
      'configurations': configurations,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/access-preview',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessPreviewResponse.fromJson(response);
  }

  /// Creates an analyzer for your account.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerName] :
  /// The name of the analyzer to create.
  ///
  /// Parameter [type] :
  /// The type of analyzer to create. Only ACCOUNT and ORGANIZATION analyzers
  /// are supported. You can create only one analyzer per account per Region.
  /// You can create up to 5 analyzers per organization per Region.
  ///
  /// Parameter [archiveRules] :
  /// Specifies the archive rules to add for the analyzer. Archive rules
  /// automatically archive findings that meet the criteria you define for the
  /// rule.
  ///
  /// Parameter [clientToken] :
  /// A client token.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the analyzer.
  Future<CreateAnalyzerResponse> createAnalyzer({
    required String analyzerName,
    required Type type,
    List<InlineArchiveRule>? archiveRules,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'analyzerName': analyzerName,
      'type': type.toValue(),
      if (archiveRules != null) 'archiveRules': archiveRules,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/analyzer',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAnalyzerResponse.fromJson(response);
  }

  /// Creates an archive rule for the specified analyzer. Archive rules
  /// automatically archive new findings that meet the criteria you define when
  /// you create the rule.
  ///
  /// To learn about filter keys that you can use to create an archive rule, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-reference-filter-keys.html">Access
  /// Analyzer filter keys</a> in the <b>IAM User Guide</b>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerName] :
  /// The name of the created analyzer.
  ///
  /// Parameter [filter] :
  /// The criteria for the rule.
  ///
  /// Parameter [ruleName] :
  /// The name of the rule to create.
  ///
  /// Parameter [clientToken] :
  /// A client token.
  Future<void> createArchiveRule({
    required String analyzerName,
    required Map<String, Criterion> filter,
    required String ruleName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(filter, 'filter');
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      255,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'filter': filter,
      'ruleName': ruleName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/analyzer/${Uri.encodeComponent(analyzerName)}/archive-rule',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified analyzer. When you delete an analyzer, Access
  /// Analyzer is disabled for the account or organization in the current or
  /// specific Region. All findings that were generated by the analyzer are
  /// deleted. You cannot undo this action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerName] :
  /// The name of the analyzer to delete.
  ///
  /// Parameter [clientToken] :
  /// A client token.
  Future<void> deleteAnalyzer({
    required String analyzerName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/analyzer/${Uri.encodeComponent(analyzerName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified archive rule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerName] :
  /// The name of the analyzer that associated with the archive rule to delete.
  ///
  /// Parameter [ruleName] :
  /// The name of the rule to delete.
  ///
  /// Parameter [clientToken] :
  /// A client token.
  Future<void> deleteArchiveRule({
    required String analyzerName,
    required String ruleName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      255,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/analyzer/${Uri.encodeComponent(analyzerName)}/archive-rule/${Uri.encodeComponent(ruleName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves information about an access preview for the specified analyzer.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [accessPreviewId] :
  /// The unique ID for the access preview.
  ///
  /// Parameter [analyzerArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources">ARN
  /// of the analyzer</a> used to generate the access preview.
  Future<GetAccessPreviewResponse> getAccessPreview({
    required String accessPreviewId,
    required String analyzerArn,
  }) async {
    ArgumentError.checkNotNull(accessPreviewId, 'accessPreviewId');
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    final $query = <String, List<String>>{
      'analyzerArn': [analyzerArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/access-preview/${Uri.encodeComponent(accessPreviewId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessPreviewResponse.fromJson(response);
  }

  /// Retrieves information about a resource that was analyzed.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources">ARN
  /// of the analyzer</a> to retrieve information from.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to retrieve information about.
  Future<GetAnalyzedResourceResponse> getAnalyzedResource({
    required String analyzerArn,
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $query = <String, List<String>>{
      'analyzerArn': [analyzerArn],
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/analyzed-resource',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAnalyzedResourceResponse.fromJson(response);
  }

  /// Retrieves information about the specified analyzer.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerName] :
  /// The name of the analyzer retrieved.
  Future<GetAnalyzerResponse> getAnalyzer({
    required String analyzerName,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/analyzer/${Uri.encodeComponent(analyzerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAnalyzerResponse.fromJson(response);
  }

  /// Retrieves information about an archive rule.
  ///
  /// To learn about filter keys that you can use to create an archive rule, see
  /// <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-reference-filter-keys.html">Access
  /// Analyzer filter keys</a> in the <b>IAM User Guide</b>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerName] :
  /// The name of the analyzer to retrieve rules from.
  ///
  /// Parameter [ruleName] :
  /// The name of the rule to retrieve.
  Future<GetArchiveRuleResponse> getArchiveRule({
    required String analyzerName,
    required String ruleName,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      255,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/analyzer/${Uri.encodeComponent(analyzerName)}/archive-rule/${Uri.encodeComponent(ruleName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetArchiveRuleResponse.fromJson(response);
  }

  /// Retrieves information about the specified finding.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources">ARN
  /// of the analyzer</a> that generated the finding.
  ///
  /// Parameter [id] :
  /// The ID of the finding to retrieve.
  Future<GetFindingResponse> getFinding({
    required String analyzerArn,
    required String id,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    ArgumentError.checkNotNull(id, 'id');
    final $query = <String, List<String>>{
      'analyzerArn': [analyzerArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/finding/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingResponse.fromJson(response);
  }

  /// Retrieves the policy that was generated using
  /// <code>StartPolicyGeneration</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [jobId] :
  /// The <code>JobId</code> that is returned by the
  /// <code>StartPolicyGeneration</code> operation. The <code>JobId</code> can
  /// be used with <code>GetGeneratedPolicy</code> to retrieve the generated
  /// policies or used with <code>CancelPolicyGeneration</code> to cancel the
  /// policy generation request.
  ///
  /// Parameter [includeResourcePlaceholders] :
  /// The level of detail that you want to generate. You can specify whether to
  /// generate policies with placeholders for resource ARNs for actions that
  /// support resource level granularity in policies.
  ///
  /// For example, in the resource section of a policy, you can receive a
  /// placeholder such as <code>"Resource":"arn:aws:s3:::${BucketName}"</code>
  /// instead of <code>"*"</code>.
  ///
  /// Parameter [includeServiceLevelTemplate] :
  /// The level of detail that you want to generate. You can specify whether to
  /// generate service-level policies.
  ///
  /// Access Analyzer uses <code>iam:servicelastaccessed</code> to identify
  /// services that have been used recently to create this service-level
  /// template.
  Future<GetGeneratedPolicyResponse> getGeneratedPolicy({
    required String jobId,
    bool? includeResourcePlaceholders,
    bool? includeServiceLevelTemplate,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    final $query = <String, List<String>>{
      if (includeResourcePlaceholders != null)
        'includeResourcePlaceholders': [includeResourcePlaceholders.toString()],
      if (includeServiceLevelTemplate != null)
        'includeServiceLevelTemplate': [includeServiceLevelTemplate.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policy/generation/${Uri.encodeComponent(jobId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetGeneratedPolicyResponse.fromJson(response);
  }

  /// Retrieves a list of access preview findings generated by the specified
  /// access preview.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [accessPreviewId] :
  /// The unique ID for the access preview.
  ///
  /// Parameter [analyzerArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources">ARN
  /// of the analyzer</a> used to generate the access.
  ///
  /// Parameter [filter] :
  /// Criteria to filter the returned findings.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned.
  Future<ListAccessPreviewFindingsResponse> listAccessPreviewFindings({
    required String accessPreviewId,
    required String analyzerArn,
    Map<String, Criterion>? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(accessPreviewId, 'accessPreviewId');
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    final $payload = <String, dynamic>{
      'analyzerArn': analyzerArn,
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/access-preview/${Uri.encodeComponent(accessPreviewId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessPreviewFindingsResponse.fromJson(response);
  }

  /// Retrieves a list of access previews for the specified analyzer.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources">ARN
  /// of the analyzer</a> used to generate the access preview.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned.
  Future<ListAccessPreviewsResponse> listAccessPreviews({
    required String analyzerArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    final $query = <String, List<String>>{
      'analyzerArn': [analyzerArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/access-preview',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessPreviewsResponse.fromJson(response);
  }

  /// Retrieves a list of resources of the specified type that have been
  /// analyzed by the specified analyzer..
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources">ARN
  /// of the analyzer</a> to retrieve a list of analyzed resources from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned.
  ///
  /// Parameter [resourceType] :
  /// The type of resource.
  Future<ListAnalyzedResourcesResponse> listAnalyzedResources({
    required String analyzerArn,
    int? maxResults,
    String? nextToken,
    ResourceType? resourceType,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    final $payload = <String, dynamic>{
      'analyzerArn': analyzerArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/analyzed-resource',
      exceptionFnMap: _exceptionFns,
    );
    return ListAnalyzedResourcesResponse.fromJson(response);
  }

  /// Retrieves a list of analyzers.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned.
  ///
  /// Parameter [type] :
  /// The type of analyzer.
  Future<ListAnalyzersResponse> listAnalyzers({
    int? maxResults,
    String? nextToken,
    Type? type,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (type != null) 'type': [type.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/analyzer',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAnalyzersResponse.fromJson(response);
  }

  /// Retrieves a list of archive rules created for the specified analyzer.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerName] :
  /// The name of the analyzer to retrieve rules from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the request.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned.
  Future<ListArchiveRulesResponse> listArchiveRules({
    required String analyzerName,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/analyzer/${Uri.encodeComponent(analyzerName)}/archive-rule',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListArchiveRulesResponse.fromJson(response);
  }

  /// Retrieves a list of findings generated by the specified analyzer.
  ///
  /// To learn about filter keys that you can use to retrieve a list of
  /// findings, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-reference-filter-keys.html">Access
  /// Analyzer filter keys</a> in the <b>IAM User Guide</b>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources">ARN
  /// of the analyzer</a> to retrieve findings from.
  ///
  /// Parameter [filter] :
  /// A filter to match for the findings to return.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned.
  ///
  /// Parameter [sort] :
  /// The sort order for the findings returned.
  Future<ListFindingsResponse> listFindings({
    required String analyzerArn,
    Map<String, Criterion>? filter,
    int? maxResults,
    String? nextToken,
    SortCriteria? sort,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    final $payload = <String, dynamic>{
      'analyzerArn': analyzerArn,
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sort != null) 'sort': sort,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/finding',
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingsResponse.fromJson(response);
  }

  /// Lists all of the policy generations requested in the last seven days.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned.
  ///
  /// Parameter [principalArn] :
  /// The ARN of the IAM entity (user or role) for which you are generating a
  /// policy. Use this with <code>ListGeneratedPolicies</code> to filter the
  /// results to only include results for a specific principal.
  Future<ListPolicyGenerationsResponse> listPolicyGenerations({
    int? maxResults,
    String? nextToken,
    String? principalArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (principalArn != null) 'principalArn': [principalArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policy/generation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPolicyGenerationsResponse.fromJson(response);
  }

  /// Retrieves a list of tags applied to the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to retrieve tags from.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Starts the policy generation request.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [policyGenerationDetails] :
  /// Contains the ARN of the IAM entity (user or role) for which you are
  /// generating a policy.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully, the subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the AWS SDK.
  ///
  /// Parameter [cloudTrailDetails] :
  /// A <code>CloudTrailDetails</code> object that contains details about a
  /// <code>Trail</code> that you want to analyze to generate policies.
  Future<StartPolicyGenerationResponse> startPolicyGeneration({
    required PolicyGenerationDetails policyGenerationDetails,
    String? clientToken,
    CloudTrailDetails? cloudTrailDetails,
  }) async {
    ArgumentError.checkNotNull(
        policyGenerationDetails, 'policyGenerationDetails');
    final $payload = <String, dynamic>{
      'policyGenerationDetails': policyGenerationDetails,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (cloudTrailDetails != null) 'cloudTrailDetails': cloudTrailDetails,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/policy/generation',
      exceptionFnMap: _exceptionFns,
    );
    return StartPolicyGenerationResponse.fromJson(response);
  }

  /// Immediately starts a scan of the policies applied to the specified
  /// resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources">ARN
  /// of the analyzer</a> to use to scan the policies applied to the specified
  /// resource.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to scan.
  Future<void> startResourceScan({
    required String analyzerArn,
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $payload = <String, dynamic>{
      'analyzerArn': analyzerArn,
      'resourceArn': resourceArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resource/scan',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds a tag to the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to add the tag to.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to remove the tag from.
  ///
  /// Parameter [tagKeys] :
  /// The key for the tag to add.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the criteria and values for the specified archive rule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerName] :
  /// The name of the analyzer to update the archive rules for.
  ///
  /// Parameter [filter] :
  /// A filter to match for the rules to update. Only rules that match the
  /// filter are updated.
  ///
  /// Parameter [ruleName] :
  /// The name of the rule to update.
  ///
  /// Parameter [clientToken] :
  /// A client token.
  Future<void> updateArchiveRule({
    required String analyzerName,
    required Map<String, Criterion> filter,
    required String ruleName,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(filter, 'filter');
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      255,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'filter': filter,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/analyzer/${Uri.encodeComponent(analyzerName)}/archive-rule/${Uri.encodeComponent(ruleName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the status for the specified findings.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-getting-started.html#permission-resources">ARN
  /// of the analyzer</a> that generated the findings to update.
  ///
  /// Parameter [status] :
  /// The state represents the action to take to update the finding Status. Use
  /// <code>ARCHIVE</code> to change an Active finding to an Archived finding.
  /// Use <code>ACTIVE</code> to change an Archived finding to an Active
  /// finding.
  ///
  /// Parameter [clientToken] :
  /// A client token.
  ///
  /// Parameter [ids] :
  /// The IDs of the findings to update.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource identified in the finding.
  Future<void> updateFindings({
    required String analyzerArn,
    required FindingStatusUpdate status,
    String? clientToken,
    List<String>? ids,
    String? resourceArn,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    ArgumentError.checkNotNull(status, 'status');
    final $payload = <String, dynamic>{
      'analyzerArn': analyzerArn,
      'status': status.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (ids != null) 'ids': ids,
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/finding',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Requests the validation of a policy and returns a list of findings. The
  /// findings help you identify issues and provide actionable recommendations
  /// to resolve the issue and enable you to author functional policies that
  /// meet security best practices.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [policyDocument] :
  /// The JSON policy document to use as the content for the policy.
  ///
  /// Parameter [policyType] :
  /// The type of policy to validate. Identity policies grant permissions to IAM
  /// principals. Identity policies include managed and inline policies for IAM
  /// roles, users, and groups. They also include service-control policies
  /// (SCPs) that are attached to an AWS organization, organizational unit (OU),
  /// or an account.
  ///
  /// Resource policies grant permissions on AWS resources. Resource policies
  /// include trust policies for IAM roles and bucket policies for S3 buckets.
  /// You can provide a generic input such as identity policy or resource policy
  /// or a specific input such as managed policy or S3 bucket policy.
  ///
  /// Parameter [locale] :
  /// The locale to use for localizing the findings.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned.
  Future<ValidatePolicyResponse> validatePolicy({
    required String policyDocument,
    required PolicyType policyType,
    Locale? locale,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    ArgumentError.checkNotNull(policyType, 'policyType');
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'policyDocument': policyDocument,
      'policyType': policyType.toValue(),
      if (locale != null) 'locale': locale.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/policy/validation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ValidatePolicyResponse.fromJson(response);
  }
}

/// Contains information about an access preview.
class AccessPreview {
  /// The ARN of the analyzer used to generate the access preview.
  final String analyzerArn;

  /// A map of resource ARNs for the proposed resource configuration.
  final Map<String, Configuration> configurations;

  /// The time at which the access preview was created.
  final DateTime createdAt;

  /// The unique ID for the access preview.
  final String id;

  /// The status of the access preview.
  ///
  /// <ul>
  /// <li>
  /// <code>Creating</code> - The access preview creation is in progress.
  /// </li>
  /// <li>
  /// <code>Completed</code> - The access preview is complete. You can preview
  /// findings for external access to the resource.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The access preview creation has failed.
  /// </li>
  /// </ul>
  final AccessPreviewStatus status;

  /// Provides more details about the current status of the access preview.
  ///
  /// For example, if the creation of the access preview fails, a
  /// <code>Failed</code> status is returned. This failure can be due to an
  /// internal issue with the analysis or due to an invalid resource
  /// configuration.
  final AccessPreviewStatusReason? statusReason;

  AccessPreview({
    required this.analyzerArn,
    required this.configurations,
    required this.createdAt,
    required this.id,
    required this.status,
    this.statusReason,
  });

  factory AccessPreview.fromJson(Map<String, dynamic> json) {
    return AccessPreview(
      analyzerArn: json['analyzerArn'] as String,
      configurations: (json['configurations'] as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry(k, Configuration.fromJson(e as Map<String, dynamic>))),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      status: (json['status'] as String).toAccessPreviewStatus(),
      statusReason: json['statusReason'] != null
          ? AccessPreviewStatusReason.fromJson(
              json['statusReason'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzerArn = this.analyzerArn;
    final configurations = this.configurations;
    final createdAt = this.createdAt;
    final id = this.id;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'analyzerArn': analyzerArn,
      'configurations': configurations,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// An access preview finding generated by the access preview.
class AccessPreviewFinding {
  /// Provides context on how the access preview finding compares to existing
  /// access identified in Access Analyzer.
  ///
  /// <ul>
  /// <li>
  /// <code>New</code> - The finding is for newly-introduced access.
  /// </li>
  /// <li>
  /// <code>Unchanged</code> - The preview finding is an existing finding that
  /// would remain unchanged.
  /// </li>
  /// <li>
  /// <code>Changed</code> - The preview finding is an existing finding with a
  /// change in status.
  /// </li>
  /// </ul>
  /// For example, a <code>Changed</code> finding with preview status
  /// <code>Resolved</code> and existing status <code>Active</code> indicates the
  /// existing <code>Active</code> finding would become <code>Resolved</code> as a
  /// result of the proposed permissions change.
  final FindingChangeType changeType;

  /// The time at which the access preview finding was created.
  final DateTime createdAt;

  /// The ID of the access preview finding. This ID uniquely identifies the
  /// element in the list of access preview findings and is not related to the
  /// finding ID in Access Analyzer.
  final String id;

  /// The AWS account ID that owns the resource. For most AWS resources, the
  /// owning account is the account in which the resource was created.
  final String resourceOwnerAccount;

  /// The type of the resource that can be accessed in the finding.
  final ResourceType resourceType;

  /// The preview status of the finding. This is what the status of the finding
  /// would be after permissions deployment. For example, a <code>Changed</code>
  /// finding with preview status <code>Resolved</code> and existing status
  /// <code>Active</code> indicates the existing <code>Active</code> finding would
  /// become <code>Resolved</code> as a result of the proposed permissions change.
  final FindingStatus status;

  /// The action in the analyzed policy statement that an external principal has
  /// permission to perform.
  final List<String>? action;

  /// The condition in the analyzed policy statement that resulted in a finding.
  final Map<String, String>? condition;

  /// An error.
  final String? error;

  /// The existing ID of the finding in Access Analyzer, provided only for
  /// existing findings.
  final String? existingFindingId;

  /// The existing status of the finding, provided only for existing findings.
  final FindingStatus? existingFindingStatus;

  /// Indicates whether the policy that generated the finding allows public access
  /// to the resource.
  final bool? isPublic;

  /// The external principal that has access to a resource within the zone of
  /// trust.
  final Map<String, String>? principal;

  /// The resource that an external principal has access to. This is the resource
  /// associated with the access preview.
  final String? resource;

  /// The sources of the finding. This indicates how the access that generated the
  /// finding is granted. It is populated for Amazon S3 bucket findings.
  final List<FindingSource>? sources;

  AccessPreviewFinding({
    required this.changeType,
    required this.createdAt,
    required this.id,
    required this.resourceOwnerAccount,
    required this.resourceType,
    required this.status,
    this.action,
    this.condition,
    this.error,
    this.existingFindingId,
    this.existingFindingStatus,
    this.isPublic,
    this.principal,
    this.resource,
    this.sources,
  });

  factory AccessPreviewFinding.fromJson(Map<String, dynamic> json) {
    return AccessPreviewFinding(
      changeType: (json['changeType'] as String).toFindingChangeType(),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      resourceOwnerAccount: json['resourceOwnerAccount'] as String,
      resourceType: (json['resourceType'] as String).toResourceType(),
      status: (json['status'] as String).toFindingStatus(),
      action: (json['action'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      condition: (json['condition'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      error: json['error'] as String?,
      existingFindingId: json['existingFindingId'] as String?,
      existingFindingStatus:
          (json['existingFindingStatus'] as String?)?.toFindingStatus(),
      isPublic: json['isPublic'] as bool?,
      principal: (json['principal'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resource: json['resource'] as String?,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => FindingSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final changeType = this.changeType;
    final createdAt = this.createdAt;
    final id = this.id;
    final resourceOwnerAccount = this.resourceOwnerAccount;
    final resourceType = this.resourceType;
    final status = this.status;
    final action = this.action;
    final condition = this.condition;
    final error = this.error;
    final existingFindingId = this.existingFindingId;
    final existingFindingStatus = this.existingFindingStatus;
    final isPublic = this.isPublic;
    final principal = this.principal;
    final resource = this.resource;
    final sources = this.sources;
    return {
      'changeType': changeType.toValue(),
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'resourceOwnerAccount': resourceOwnerAccount,
      'resourceType': resourceType.toValue(),
      'status': status.toValue(),
      if (action != null) 'action': action,
      if (condition != null) 'condition': condition,
      if (error != null) 'error': error,
      if (existingFindingId != null) 'existingFindingId': existingFindingId,
      if (existingFindingStatus != null)
        'existingFindingStatus': existingFindingStatus.toValue(),
      if (isPublic != null) 'isPublic': isPublic,
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
      if (sources != null) 'sources': sources,
    };
  }
}

enum AccessPreviewStatus {
  completed,
  creating,
  failed,
}

extension on AccessPreviewStatus {
  String toValue() {
    switch (this) {
      case AccessPreviewStatus.completed:
        return 'COMPLETED';
      case AccessPreviewStatus.creating:
        return 'CREATING';
      case AccessPreviewStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  AccessPreviewStatus toAccessPreviewStatus() {
    switch (this) {
      case 'COMPLETED':
        return AccessPreviewStatus.completed;
      case 'CREATING':
        return AccessPreviewStatus.creating;
      case 'FAILED':
        return AccessPreviewStatus.failed;
    }
    throw Exception('$this is not known in enum AccessPreviewStatus');
  }
}

/// Provides more details about the current status of the access preview. For
/// example, if the creation of the access preview fails, a <code>Failed</code>
/// status is returned. This failure can be due to an internal issue with the
/// analysis or due to an invalid proposed resource configuration.
class AccessPreviewStatusReason {
  /// The reason code for the current status of the access preview.
  final AccessPreviewStatusReasonCode code;

  AccessPreviewStatusReason({
    required this.code,
  });

  factory AccessPreviewStatusReason.fromJson(Map<String, dynamic> json) {
    return AccessPreviewStatusReason(
      code: (json['code'] as String).toAccessPreviewStatusReasonCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    return {
      'code': code.toValue(),
    };
  }
}

enum AccessPreviewStatusReasonCode {
  internalError,
  invalidConfiguration,
}

extension on AccessPreviewStatusReasonCode {
  String toValue() {
    switch (this) {
      case AccessPreviewStatusReasonCode.internalError:
        return 'INTERNAL_ERROR';
      case AccessPreviewStatusReasonCode.invalidConfiguration:
        return 'INVALID_CONFIGURATION';
    }
  }
}

extension on String {
  AccessPreviewStatusReasonCode toAccessPreviewStatusReasonCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return AccessPreviewStatusReasonCode.internalError;
      case 'INVALID_CONFIGURATION':
        return AccessPreviewStatusReasonCode.invalidConfiguration;
    }
    throw Exception('$this is not known in enum AccessPreviewStatusReasonCode');
  }
}

/// Contains a summary of information about an access preview.
class AccessPreviewSummary {
  /// The ARN of the analyzer used to generate the access preview.
  final String analyzerArn;

  /// The time at which the access preview was created.
  final DateTime createdAt;

  /// The unique ID for the access preview.
  final String id;

  /// The status of the access preview.
  ///
  /// <ul>
  /// <li>
  /// <code>Creating</code> - The access preview creation is in progress.
  /// </li>
  /// <li>
  /// <code>Completed</code> - The access preview is complete and previews the
  /// findings for external access to the resource.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The access preview creation has failed.
  /// </li>
  /// </ul>
  final AccessPreviewStatus status;
  final AccessPreviewStatusReason? statusReason;

  AccessPreviewSummary({
    required this.analyzerArn,
    required this.createdAt,
    required this.id,
    required this.status,
    this.statusReason,
  });

  factory AccessPreviewSummary.fromJson(Map<String, dynamic> json) {
    return AccessPreviewSummary(
      analyzerArn: json['analyzerArn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      status: (json['status'] as String).toAccessPreviewStatus(),
      statusReason: json['statusReason'] != null
          ? AccessPreviewStatusReason.fromJson(
              json['statusReason'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzerArn = this.analyzerArn;
    final createdAt = this.createdAt;
    final id = this.id;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'analyzerArn': analyzerArn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// You specify each grantee as a type-value pair using one of these types. You
/// can specify only one type of grantee. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAcl.html">PutBucketAcl</a>.
class AclGrantee {
  /// The value specified is the canonical user ID of an AWS account.
  final String? id;

  /// Used for granting permissions to a predefined group.
  final String? uri;

  AclGrantee({
    this.id,
    this.uri,
  });

  factory AclGrantee.fromJson(Map<String, dynamic> json) {
    return AclGrantee(
      id: json['id'] as String?,
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final uri = this.uri;
    return {
      if (id != null) 'id': id,
      if (uri != null) 'uri': uri,
    };
  }
}

enum AclPermission {
  read,
  write,
  readAcp,
  writeAcp,
  fullControl,
}

extension on AclPermission {
  String toValue() {
    switch (this) {
      case AclPermission.read:
        return 'READ';
      case AclPermission.write:
        return 'WRITE';
      case AclPermission.readAcp:
        return 'READ_ACP';
      case AclPermission.writeAcp:
        return 'WRITE_ACP';
      case AclPermission.fullControl:
        return 'FULL_CONTROL';
    }
  }
}

extension on String {
  AclPermission toAclPermission() {
    switch (this) {
      case 'READ':
        return AclPermission.read;
      case 'WRITE':
        return AclPermission.write;
      case 'READ_ACP':
        return AclPermission.readAcp;
      case 'WRITE_ACP':
        return AclPermission.writeAcp;
      case 'FULL_CONTROL':
        return AclPermission.fullControl;
    }
    throw Exception('$this is not known in enum AclPermission');
  }
}

/// Contains details about the analyzed resource.
class AnalyzedResource {
  /// The time at which the resource was analyzed.
  final DateTime analyzedAt;

  /// The time at which the finding was created.
  final DateTime createdAt;

  /// Indicates whether the policy that generated the finding grants public access
  /// to the resource.
  final bool isPublic;

  /// The ARN of the resource that was analyzed.
  final String resourceArn;

  /// The AWS account ID that owns the resource.
  final String resourceOwnerAccount;

  /// The type of the resource that was analyzed.
  final ResourceType resourceType;

  /// The time at which the finding was updated.
  final DateTime updatedAt;

  /// The actions that an external principal is granted permission to use by the
  /// policy that generated the finding.
  final List<String>? actions;

  /// An error message.
  final String? error;

  /// Indicates how the access that generated the finding is granted. This is
  /// populated for Amazon S3 bucket findings.
  final List<String>? sharedVia;

  /// The current status of the finding generated from the analyzed resource.
  final FindingStatus? status;

  AnalyzedResource({
    required this.analyzedAt,
    required this.createdAt,
    required this.isPublic,
    required this.resourceArn,
    required this.resourceOwnerAccount,
    required this.resourceType,
    required this.updatedAt,
    this.actions,
    this.error,
    this.sharedVia,
    this.status,
  });

  factory AnalyzedResource.fromJson(Map<String, dynamic> json) {
    return AnalyzedResource(
      analyzedAt: nonNullableTimeStampFromJson(json['analyzedAt'] as Object),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      isPublic: json['isPublic'] as bool,
      resourceArn: json['resourceArn'] as String,
      resourceOwnerAccount: json['resourceOwnerAccount'] as String,
      resourceType: (json['resourceType'] as String).toResourceType(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      error: json['error'] as String?,
      sharedVia: (json['sharedVia'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.toFindingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final analyzedAt = this.analyzedAt;
    final createdAt = this.createdAt;
    final isPublic = this.isPublic;
    final resourceArn = this.resourceArn;
    final resourceOwnerAccount = this.resourceOwnerAccount;
    final resourceType = this.resourceType;
    final updatedAt = this.updatedAt;
    final actions = this.actions;
    final error = this.error;
    final sharedVia = this.sharedVia;
    final status = this.status;
    return {
      'analyzedAt': iso8601ToJson(analyzedAt),
      'createdAt': iso8601ToJson(createdAt),
      'isPublic': isPublic,
      'resourceArn': resourceArn,
      'resourceOwnerAccount': resourceOwnerAccount,
      'resourceType': resourceType.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (actions != null) 'actions': actions,
      if (error != null) 'error': error,
      if (sharedVia != null) 'sharedVia': sharedVia,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Contains the ARN of the analyzed resource.
class AnalyzedResourceSummary {
  /// The ARN of the analyzed resource.
  final String resourceArn;

  /// The AWS account ID that owns the resource.
  final String resourceOwnerAccount;

  /// The type of resource that was analyzed.
  final ResourceType resourceType;

  AnalyzedResourceSummary({
    required this.resourceArn,
    required this.resourceOwnerAccount,
    required this.resourceType,
  });

  factory AnalyzedResourceSummary.fromJson(Map<String, dynamic> json) {
    return AnalyzedResourceSummary(
      resourceArn: json['resourceArn'] as String,
      resourceOwnerAccount: json['resourceOwnerAccount'] as String,
      resourceType: (json['resourceType'] as String).toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final resourceOwnerAccount = this.resourceOwnerAccount;
    final resourceType = this.resourceType;
    return {
      'resourceArn': resourceArn,
      'resourceOwnerAccount': resourceOwnerAccount,
      'resourceType': resourceType.toValue(),
    };
  }
}

enum AnalyzerStatus {
  active,
  creating,
  disabled,
  failed,
}

extension on AnalyzerStatus {
  String toValue() {
    switch (this) {
      case AnalyzerStatus.active:
        return 'ACTIVE';
      case AnalyzerStatus.creating:
        return 'CREATING';
      case AnalyzerStatus.disabled:
        return 'DISABLED';
      case AnalyzerStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  AnalyzerStatus toAnalyzerStatus() {
    switch (this) {
      case 'ACTIVE':
        return AnalyzerStatus.active;
      case 'CREATING':
        return AnalyzerStatus.creating;
      case 'DISABLED':
        return AnalyzerStatus.disabled;
      case 'FAILED':
        return AnalyzerStatus.failed;
    }
    throw Exception('$this is not known in enum AnalyzerStatus');
  }
}

/// Contains information about the analyzer.
class AnalyzerSummary {
  /// The ARN of the analyzer.
  final String arn;

  /// A timestamp for the time at which the analyzer was created.
  final DateTime createdAt;

  /// The name of the analyzer.
  final String name;

  /// The status of the analyzer. An <code>Active</code> analyzer successfully
  /// monitors supported resources and generates new findings. The analyzer is
  /// <code>Disabled</code> when a user action, such as removing trusted access
  /// for AWS IAM Access Analyzer from AWS Organizations, causes the analyzer to
  /// stop generating new findings. The status is <code>Creating</code> when the
  /// analyzer creation is in progress and <code>Failed</code> when the analyzer
  /// creation has failed.
  final AnalyzerStatus status;

  /// The type of analyzer, which corresponds to the zone of trust chosen for the
  /// analyzer.
  final Type type;

  /// The resource that was most recently analyzed by the analyzer.
  final String? lastResourceAnalyzed;

  /// The time at which the most recently analyzed resource was analyzed.
  final DateTime? lastResourceAnalyzedAt;

  /// The <code>statusReason</code> provides more details about the current status
  /// of the analyzer. For example, if the creation for the analyzer fails, a
  /// <code>Failed</code> status is returned. For an analyzer with organization as
  /// the type, this failure can be due to an issue with creating the
  /// service-linked roles required in the member accounts of the AWS
  /// organization.
  final StatusReason? statusReason;

  /// The tags added to the analyzer.
  final Map<String, String>? tags;

  AnalyzerSummary({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.status,
    required this.type,
    this.lastResourceAnalyzed,
    this.lastResourceAnalyzedAt,
    this.statusReason,
    this.tags,
  });

  factory AnalyzerSummary.fromJson(Map<String, dynamic> json) {
    return AnalyzerSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      name: json['name'] as String,
      status: (json['status'] as String).toAnalyzerStatus(),
      type: (json['type'] as String).toType(),
      lastResourceAnalyzed: json['lastResourceAnalyzed'] as String?,
      lastResourceAnalyzedAt: timeStampFromJson(json['lastResourceAnalyzedAt']),
      statusReason: json['statusReason'] != null
          ? StatusReason.fromJson(json['statusReason'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final lastResourceAnalyzed = this.lastResourceAnalyzed;
    final lastResourceAnalyzedAt = this.lastResourceAnalyzedAt;
    final statusReason = this.statusReason;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'status': status.toValue(),
      'type': type.toValue(),
      if (lastResourceAnalyzed != null)
        'lastResourceAnalyzed': lastResourceAnalyzed,
      if (lastResourceAnalyzedAt != null)
        'lastResourceAnalyzedAt': iso8601ToJson(lastResourceAnalyzedAt),
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Contains information about an archive rule.
class ArchiveRuleSummary {
  /// The time at which the archive rule was created.
  final DateTime createdAt;

  /// A filter used to define the archive rule.
  final Map<String, Criterion> filter;

  /// The name of the archive rule.
  final String ruleName;

  /// The time at which the archive rule was last updated.
  final DateTime updatedAt;

  ArchiveRuleSummary({
    required this.createdAt,
    required this.filter,
    required this.ruleName,
    required this.updatedAt,
  });

  factory ArchiveRuleSummary.fromJson(Map<String, dynamic> json) {
    return ArchiveRuleSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      filter: (json['filter'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(k, Criterion.fromJson(e as Map<String, dynamic>))),
      ruleName: json['ruleName'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final filter = this.filter;
    final ruleName = this.ruleName;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'filter': filter,
      'ruleName': ruleName,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

class CancelPolicyGenerationResponse {
  CancelPolicyGenerationResponse();

  factory CancelPolicyGenerationResponse.fromJson(Map<String, dynamic> _) {
    return CancelPolicyGenerationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about CloudTrail access.
class CloudTrailDetails {
  /// The ARN of the service role that Access Analyzer uses to access your
  /// CloudTrail trail and service last accessed information.
  final String accessRole;

  /// The start of the time range for which Access Analyzer reviews your
  /// CloudTrail events. Events with a timestamp before this time are not
  /// considered to generate a policy.
  final DateTime startTime;

  /// A <code>Trail</code> object that contains settings for a trail.
  final List<Trail> trails;

  /// The end of the time range for which Access Analyzer reviews your CloudTrail
  /// events. Events with a timestamp after this time are not considered to
  /// generate a policy. If this is not included in the request, the default value
  /// is the current time.
  final DateTime? endTime;

  CloudTrailDetails({
    required this.accessRole,
    required this.startTime,
    required this.trails,
    this.endTime,
  });

  factory CloudTrailDetails.fromJson(Map<String, dynamic> json) {
    return CloudTrailDetails(
      accessRole: json['accessRole'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      trails: (json['trails'] as List)
          .whereNotNull()
          .map((e) => Trail.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTime: timeStampFromJson(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final accessRole = this.accessRole;
    final startTime = this.startTime;
    final trails = this.trails;
    final endTime = this.endTime;
    return {
      'accessRole': accessRole,
      'startTime': iso8601ToJson(startTime),
      'trails': trails,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
    };
  }
}

/// Contains information about CloudTrail access.
class CloudTrailProperties {
  /// The end of the time range for which Access Analyzer reviews your CloudTrail
  /// events. Events with a timestamp after this time are not considered to
  /// generate a policy. If this is not included in the request, the default value
  /// is the current time.
  final DateTime endTime;

  /// The start of the time range for which Access Analyzer reviews your
  /// CloudTrail events. Events with a timestamp before this time are not
  /// considered to generate a policy.
  final DateTime startTime;

  /// A <code>TrailProperties</code> object that contains settings for trail
  /// properties.
  final List<TrailProperties> trailProperties;

  CloudTrailProperties({
    required this.endTime,
    required this.startTime,
    required this.trailProperties,
  });

  factory CloudTrailProperties.fromJson(Map<String, dynamic> json) {
    return CloudTrailProperties(
      endTime: nonNullableTimeStampFromJson(json['endTime'] as Object),
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      trailProperties: (json['trailProperties'] as List)
          .whereNotNull()
          .map((e) => TrailProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    final trailProperties = this.trailProperties;
    return {
      'endTime': iso8601ToJson(endTime),
      'startTime': iso8601ToJson(startTime),
      'trailProperties': trailProperties,
    };
  }
}

/// Access control configuration structures for your resource. You specify the
/// configuration as a type-value pair. You can specify only one type of access
/// control configuration.
class Configuration {
  /// The access control configuration is for an IAM role.
  final IamRoleConfiguration? iamRole;

  /// The access control configuration is for a KMS key.
  final KmsKeyConfiguration? kmsKey;

  /// The access control configuration is for an Amazon S3 Bucket.
  final S3BucketConfiguration? s3Bucket;

  /// The access control configuration is for a Secrets Manager secret.
  final SecretsManagerSecretConfiguration? secretsManagerSecret;

  /// The access control configuration is for an SQS queue.
  final SqsQueueConfiguration? sqsQueue;

  Configuration({
    this.iamRole,
    this.kmsKey,
    this.s3Bucket,
    this.secretsManagerSecret,
    this.sqsQueue,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      iamRole: json['iamRole'] != null
          ? IamRoleConfiguration.fromJson(
              json['iamRole'] as Map<String, dynamic>)
          : null,
      kmsKey: json['kmsKey'] != null
          ? KmsKeyConfiguration.fromJson(json['kmsKey'] as Map<String, dynamic>)
          : null,
      s3Bucket: json['s3Bucket'] != null
          ? S3BucketConfiguration.fromJson(
              json['s3Bucket'] as Map<String, dynamic>)
          : null,
      secretsManagerSecret: json['secretsManagerSecret'] != null
          ? SecretsManagerSecretConfiguration.fromJson(
              json['secretsManagerSecret'] as Map<String, dynamic>)
          : null,
      sqsQueue: json['sqsQueue'] != null
          ? SqsQueueConfiguration.fromJson(
              json['sqsQueue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iamRole = this.iamRole;
    final kmsKey = this.kmsKey;
    final s3Bucket = this.s3Bucket;
    final secretsManagerSecret = this.secretsManagerSecret;
    final sqsQueue = this.sqsQueue;
    return {
      if (iamRole != null) 'iamRole': iamRole,
      if (kmsKey != null) 'kmsKey': kmsKey,
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (secretsManagerSecret != null)
        'secretsManagerSecret': secretsManagerSecret,
      if (sqsQueue != null) 'sqsQueue': sqsQueue,
    };
  }
}

class CreateAccessPreviewResponse {
  /// The unique ID for the access preview.
  final String id;

  CreateAccessPreviewResponse({
    required this.id,
  });

  factory CreateAccessPreviewResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccessPreviewResponse(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// The response to the request to create an analyzer.
class CreateAnalyzerResponse {
  /// The ARN of the analyzer that was created by the request.
  final String? arn;

  CreateAnalyzerResponse({
    this.arn,
  });

  factory CreateAnalyzerResponse.fromJson(Map<String, dynamic> json) {
    return CreateAnalyzerResponse(
      arn: json['arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'arn': arn,
    };
  }
}

/// The criteria to use in the filter that defines the archive rule.
class Criterion {
  /// A "contains" operator to match for the filter used to create the rule.
  final List<String>? contains;

  /// An "equals" operator to match for the filter used to create the rule.
  final List<String>? eq;

  /// An "exists" operator to match for the filter used to create the rule.
  final bool? exists;

  /// A "not equals" operator to match for the filter used to create the rule.
  final List<String>? neq;

  Criterion({
    this.contains,
    this.eq,
    this.exists,
    this.neq,
  });

  factory Criterion.fromJson(Map<String, dynamic> json) {
    return Criterion(
      contains: (json['contains'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      eq: (json['eq'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      exists: json['exists'] as bool?,
      neq: (json['neq'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final contains = this.contains;
    final eq = this.eq;
    final exists = this.exists;
    final neq = this.neq;
    return {
      if (contains != null) 'contains': contains,
      if (eq != null) 'eq': eq,
      if (exists != null) 'exists': exists,
      if (neq != null) 'neq': neq,
    };
  }
}

/// Contains information about a finding.
class Finding {
  /// The time at which the resource was analyzed.
  final DateTime analyzedAt;

  /// The condition in the analyzed policy statement that resulted in a finding.
  final Map<String, String> condition;

  /// The time at which the finding was generated.
  final DateTime createdAt;

  /// The ID of the finding.
  final String id;

  /// The AWS account ID that owns the resource.
  final String resourceOwnerAccount;

  /// The type of the resource identified in the finding.
  final ResourceType resourceType;

  /// The current status of the finding.
  final FindingStatus status;

  /// The time at which the finding was updated.
  final DateTime updatedAt;

  /// The action in the analyzed policy statement that an external principal has
  /// permission to use.
  final List<String>? action;

  /// An error.
  final String? error;

  /// Indicates whether the policy that generated the finding allows public access
  /// to the resource.
  final bool? isPublic;

  /// The external principal that access to a resource within the zone of trust.
  final Map<String, String>? principal;

  /// The resource that an external principal has access to.
  final String? resource;

  /// The sources of the finding. This indicates how the access that generated the
  /// finding is granted. It is populated for Amazon S3 bucket findings.
  final List<FindingSource>? sources;

  Finding({
    required this.analyzedAt,
    required this.condition,
    required this.createdAt,
    required this.id,
    required this.resourceOwnerAccount,
    required this.resourceType,
    required this.status,
    required this.updatedAt,
    this.action,
    this.error,
    this.isPublic,
    this.principal,
    this.resource,
    this.sources,
  });

  factory Finding.fromJson(Map<String, dynamic> json) {
    return Finding(
      analyzedAt: nonNullableTimeStampFromJson(json['analyzedAt'] as Object),
      condition: (json['condition'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      resourceOwnerAccount: json['resourceOwnerAccount'] as String,
      resourceType: (json['resourceType'] as String).toResourceType(),
      status: (json['status'] as String).toFindingStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      action: (json['action'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      error: json['error'] as String?,
      isPublic: json['isPublic'] as bool?,
      principal: (json['principal'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resource: json['resource'] as String?,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => FindingSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final analyzedAt = this.analyzedAt;
    final condition = this.condition;
    final createdAt = this.createdAt;
    final id = this.id;
    final resourceOwnerAccount = this.resourceOwnerAccount;
    final resourceType = this.resourceType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final action = this.action;
    final error = this.error;
    final isPublic = this.isPublic;
    final principal = this.principal;
    final resource = this.resource;
    final sources = this.sources;
    return {
      'analyzedAt': iso8601ToJson(analyzedAt),
      'condition': condition,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'resourceOwnerAccount': resourceOwnerAccount,
      'resourceType': resourceType.toValue(),
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (action != null) 'action': action,
      if (error != null) 'error': error,
      if (isPublic != null) 'isPublic': isPublic,
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
      if (sources != null) 'sources': sources,
    };
  }
}

enum FindingChangeType {
  changed,
  $new,
  unchanged,
}

extension on FindingChangeType {
  String toValue() {
    switch (this) {
      case FindingChangeType.changed:
        return 'CHANGED';
      case FindingChangeType.$new:
        return 'NEW';
      case FindingChangeType.unchanged:
        return 'UNCHANGED';
    }
  }
}

extension on String {
  FindingChangeType toFindingChangeType() {
    switch (this) {
      case 'CHANGED':
        return FindingChangeType.changed;
      case 'NEW':
        return FindingChangeType.$new;
      case 'UNCHANGED':
        return FindingChangeType.unchanged;
    }
    throw Exception('$this is not known in enum FindingChangeType');
  }
}

/// The source of the finding. This indicates how the access that generated the
/// finding is granted. It is populated for Amazon S3 bucket findings.
class FindingSource {
  /// Indicates the type of access that generated the finding.
  final FindingSourceType type;

  /// Includes details about how the access that generated the finding is granted.
  /// This is populated for Amazon S3 bucket findings.
  final FindingSourceDetail? detail;

  FindingSource({
    required this.type,
    this.detail,
  });

  factory FindingSource.fromJson(Map<String, dynamic> json) {
    return FindingSource(
      type: (json['type'] as String).toFindingSourceType(),
      detail: json['detail'] != null
          ? FindingSourceDetail.fromJson(json['detail'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final detail = this.detail;
    return {
      'type': type.toValue(),
      if (detail != null) 'detail': detail,
    };
  }
}

/// Includes details about how the access that generated the finding is granted.
/// This is populated for Amazon S3 bucket findings.
class FindingSourceDetail {
  /// The ARN of the access point that generated the finding.
  final String? accessPointArn;

  FindingSourceDetail({
    this.accessPointArn,
  });

  factory FindingSourceDetail.fromJson(Map<String, dynamic> json) {
    return FindingSourceDetail(
      accessPointArn: json['accessPointArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointArn = this.accessPointArn;
    return {
      if (accessPointArn != null) 'accessPointArn': accessPointArn,
    };
  }
}

enum FindingSourceType {
  policy,
  bucketAcl,
  s3AccessPoint,
}

extension on FindingSourceType {
  String toValue() {
    switch (this) {
      case FindingSourceType.policy:
        return 'POLICY';
      case FindingSourceType.bucketAcl:
        return 'BUCKET_ACL';
      case FindingSourceType.s3AccessPoint:
        return 'S3_ACCESS_POINT';
    }
  }
}

extension on String {
  FindingSourceType toFindingSourceType() {
    switch (this) {
      case 'POLICY':
        return FindingSourceType.policy;
      case 'BUCKET_ACL':
        return FindingSourceType.bucketAcl;
      case 'S3_ACCESS_POINT':
        return FindingSourceType.s3AccessPoint;
    }
    throw Exception('$this is not known in enum FindingSourceType');
  }
}

enum FindingStatus {
  active,
  archived,
  resolved,
}

extension on FindingStatus {
  String toValue() {
    switch (this) {
      case FindingStatus.active:
        return 'ACTIVE';
      case FindingStatus.archived:
        return 'ARCHIVED';
      case FindingStatus.resolved:
        return 'RESOLVED';
    }
  }
}

extension on String {
  FindingStatus toFindingStatus() {
    switch (this) {
      case 'ACTIVE':
        return FindingStatus.active;
      case 'ARCHIVED':
        return FindingStatus.archived;
      case 'RESOLVED':
        return FindingStatus.resolved;
    }
    throw Exception('$this is not known in enum FindingStatus');
  }
}

enum FindingStatusUpdate {
  active,
  archived,
}

extension on FindingStatusUpdate {
  String toValue() {
    switch (this) {
      case FindingStatusUpdate.active:
        return 'ACTIVE';
      case FindingStatusUpdate.archived:
        return 'ARCHIVED';
    }
  }
}

extension on String {
  FindingStatusUpdate toFindingStatusUpdate() {
    switch (this) {
      case 'ACTIVE':
        return FindingStatusUpdate.active;
      case 'ARCHIVED':
        return FindingStatusUpdate.archived;
    }
    throw Exception('$this is not known in enum FindingStatusUpdate');
  }
}

/// Contains information about a finding.
class FindingSummary {
  /// The time at which the resource-based policy that generated the finding was
  /// analyzed.
  final DateTime analyzedAt;

  /// The condition in the analyzed policy statement that resulted in a finding.
  final Map<String, String> condition;

  /// The time at which the finding was created.
  final DateTime createdAt;

  /// The ID of the finding.
  final String id;

  /// The AWS account ID that owns the resource.
  final String resourceOwnerAccount;

  /// The type of the resource that the external principal has access to.
  final ResourceType resourceType;

  /// The status of the finding.
  final FindingStatus status;

  /// The time at which the finding was most recently updated.
  final DateTime updatedAt;

  /// The action in the analyzed policy statement that an external principal has
  /// permission to use.
  final List<String>? action;

  /// The error that resulted in an Error finding.
  final String? error;

  /// Indicates whether the finding reports a resource that has a policy that
  /// allows public access.
  final bool? isPublic;

  /// The external principal that has access to a resource within the zone of
  /// trust.
  final Map<String, String>? principal;

  /// The resource that the external principal has access to.
  final String? resource;

  /// The sources of the finding. This indicates how the access that generated the
  /// finding is granted. It is populated for Amazon S3 bucket findings.
  final List<FindingSource>? sources;

  FindingSummary({
    required this.analyzedAt,
    required this.condition,
    required this.createdAt,
    required this.id,
    required this.resourceOwnerAccount,
    required this.resourceType,
    required this.status,
    required this.updatedAt,
    this.action,
    this.error,
    this.isPublic,
    this.principal,
    this.resource,
    this.sources,
  });

  factory FindingSummary.fromJson(Map<String, dynamic> json) {
    return FindingSummary(
      analyzedAt: nonNullableTimeStampFromJson(json['analyzedAt'] as Object),
      condition: (json['condition'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      resourceOwnerAccount: json['resourceOwnerAccount'] as String,
      resourceType: (json['resourceType'] as String).toResourceType(),
      status: (json['status'] as String).toFindingStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      action: (json['action'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      error: json['error'] as String?,
      isPublic: json['isPublic'] as bool?,
      principal: (json['principal'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resource: json['resource'] as String?,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => FindingSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final analyzedAt = this.analyzedAt;
    final condition = this.condition;
    final createdAt = this.createdAt;
    final id = this.id;
    final resourceOwnerAccount = this.resourceOwnerAccount;
    final resourceType = this.resourceType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final action = this.action;
    final error = this.error;
    final isPublic = this.isPublic;
    final principal = this.principal;
    final resource = this.resource;
    final sources = this.sources;
    return {
      'analyzedAt': iso8601ToJson(analyzedAt),
      'condition': condition,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'resourceOwnerAccount': resourceOwnerAccount,
      'resourceType': resourceType.toValue(),
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (action != null) 'action': action,
      if (error != null) 'error': error,
      if (isPublic != null) 'isPublic': isPublic,
      if (principal != null) 'principal': principal,
      if (resource != null) 'resource': resource,
      if (sources != null) 'sources': sources,
    };
  }
}

/// Contains the text for the generated policy.
class GeneratedPolicy {
  /// The text to use as the content for the new policy. The policy is created
  /// using the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html">CreatePolicy</a>
  /// action.
  final String policy;

  GeneratedPolicy({
    required this.policy,
  });

  factory GeneratedPolicy.fromJson(Map<String, dynamic> json) {
    return GeneratedPolicy(
      policy: json['policy'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      'policy': policy,
    };
  }
}

/// Contains the generated policy details.
class GeneratedPolicyProperties {
  /// The ARN of the IAM entity (user or role) for which you are generating a
  /// policy.
  final String principalArn;

  /// Lists details about the <code>Trail</code> used to generated policy.
  final CloudTrailProperties? cloudTrailProperties;

  /// This value is set to <code>true</code> if the generated policy contains all
  /// possible actions for a service that Access Analyzer identified from the
  /// CloudTrail trail that you specified, and <code>false</code> otherwise.
  final bool? isComplete;

  GeneratedPolicyProperties({
    required this.principalArn,
    this.cloudTrailProperties,
    this.isComplete,
  });

  factory GeneratedPolicyProperties.fromJson(Map<String, dynamic> json) {
    return GeneratedPolicyProperties(
      principalArn: json['principalArn'] as String,
      cloudTrailProperties: json['cloudTrailProperties'] != null
          ? CloudTrailProperties.fromJson(
              json['cloudTrailProperties'] as Map<String, dynamic>)
          : null,
      isComplete: json['isComplete'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final principalArn = this.principalArn;
    final cloudTrailProperties = this.cloudTrailProperties;
    final isComplete = this.isComplete;
    return {
      'principalArn': principalArn,
      if (cloudTrailProperties != null)
        'cloudTrailProperties': cloudTrailProperties,
      if (isComplete != null) 'isComplete': isComplete,
    };
  }
}

/// Contains the text for the generated policy and its details.
class GeneratedPolicyResult {
  /// A <code>GeneratedPolicyProperties</code> object that contains properties of
  /// the generated policy.
  final GeneratedPolicyProperties properties;

  /// The text to use as the content for the new policy. The policy is created
  /// using the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreatePolicy.html">CreatePolicy</a>
  /// action.
  final List<GeneratedPolicy>? generatedPolicies;

  GeneratedPolicyResult({
    required this.properties,
    this.generatedPolicies,
  });

  factory GeneratedPolicyResult.fromJson(Map<String, dynamic> json) {
    return GeneratedPolicyResult(
      properties: GeneratedPolicyProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
      generatedPolicies: (json['generatedPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => GeneratedPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final properties = this.properties;
    final generatedPolicies = this.generatedPolicies;
    return {
      'properties': properties,
      if (generatedPolicies != null) 'generatedPolicies': generatedPolicies,
    };
  }
}

class GetAccessPreviewResponse {
  /// An object that contains information about the access preview.
  final AccessPreview accessPreview;

  GetAccessPreviewResponse({
    required this.accessPreview,
  });

  factory GetAccessPreviewResponse.fromJson(Map<String, dynamic> json) {
    return GetAccessPreviewResponse(
      accessPreview:
          AccessPreview.fromJson(json['accessPreview'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPreview = this.accessPreview;
    return {
      'accessPreview': accessPreview,
    };
  }
}

/// The response to the request.
class GetAnalyzedResourceResponse {
  /// An <code>AnalyzedResource</code> object that contains information that
  /// Access Analyzer found when it analyzed the resource.
  final AnalyzedResource? resource;

  GetAnalyzedResourceResponse({
    this.resource,
  });

  factory GetAnalyzedResourceResponse.fromJson(Map<String, dynamic> json) {
    return GetAnalyzedResourceResponse(
      resource: json['resource'] != null
          ? AnalyzedResource.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    return {
      if (resource != null) 'resource': resource,
    };
  }
}

/// The response to the request.
class GetAnalyzerResponse {
  /// An <code>AnalyzerSummary</code> object that contains information about the
  /// analyzer.
  final AnalyzerSummary analyzer;

  GetAnalyzerResponse({
    required this.analyzer,
  });

  factory GetAnalyzerResponse.fromJson(Map<String, dynamic> json) {
    return GetAnalyzerResponse(
      analyzer:
          AnalyzerSummary.fromJson(json['analyzer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final analyzer = this.analyzer;
    return {
      'analyzer': analyzer,
    };
  }
}

/// The response to the request.
class GetArchiveRuleResponse {
  final ArchiveRuleSummary archiveRule;

  GetArchiveRuleResponse({
    required this.archiveRule,
  });

  factory GetArchiveRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveRuleResponse(
      archiveRule: ArchiveRuleSummary.fromJson(
          json['archiveRule'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final archiveRule = this.archiveRule;
    return {
      'archiveRule': archiveRule,
    };
  }
}

/// The response to the request.
class GetFindingResponse {
  /// A <code>finding</code> object that contains finding details.
  final Finding? finding;

  GetFindingResponse({
    this.finding,
  });

  factory GetFindingResponse.fromJson(Map<String, dynamic> json) {
    return GetFindingResponse(
      finding: json['finding'] != null
          ? Finding.fromJson(json['finding'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final finding = this.finding;
    return {
      if (finding != null) 'finding': finding,
    };
  }
}

class GetGeneratedPolicyResponse {
  /// A <code>GeneratedPolicyResult</code> object that contains the generated
  /// policies and associated details.
  final GeneratedPolicyResult generatedPolicyResult;

  /// A <code>GeneratedPolicyDetails</code> object that contains details about the
  /// generated policy.
  final JobDetails jobDetails;

  GetGeneratedPolicyResponse({
    required this.generatedPolicyResult,
    required this.jobDetails,
  });

  factory GetGeneratedPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetGeneratedPolicyResponse(
      generatedPolicyResult: GeneratedPolicyResult.fromJson(
          json['generatedPolicyResult'] as Map<String, dynamic>),
      jobDetails:
          JobDetails.fromJson(json['jobDetails'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final generatedPolicyResult = this.generatedPolicyResult;
    final jobDetails = this.jobDetails;
    return {
      'generatedPolicyResult': generatedPolicyResult,
      'jobDetails': jobDetails,
    };
  }
}

/// The proposed access control configuration for an IAM role. You can propose a
/// configuration for a new IAM role or an existing IAM role that you own by
/// specifying the trust policy. If the configuration is for a new IAM role, you
/// must specify the trust policy. If the configuration is for an existing IAM
/// role that you own and you do not propose the trust policy, the access
/// preview uses the existing trust policy for the role. The proposed trust
/// policy cannot be an empty string. For more information about role trust
/// policy limits, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html">IAM
/// and STS quotas</a>.
class IamRoleConfiguration {
  /// The proposed trust policy for the IAM role.
  final String? trustPolicy;

  IamRoleConfiguration({
    this.trustPolicy,
  });

  factory IamRoleConfiguration.fromJson(Map<String, dynamic> json) {
    return IamRoleConfiguration(
      trustPolicy: json['trustPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trustPolicy = this.trustPolicy;
    return {
      if (trustPolicy != null) 'trustPolicy': trustPolicy,
    };
  }
}

/// An criterion statement in an archive rule. Each archive rule may have
/// multiple criteria.
class InlineArchiveRule {
  /// The condition and values for a criterion.
  final Map<String, Criterion> filter;

  /// The name of the rule.
  final String ruleName;

  InlineArchiveRule({
    required this.filter,
    required this.ruleName,
  });

  factory InlineArchiveRule.fromJson(Map<String, dynamic> json) {
    return InlineArchiveRule(
      filter: (json['filter'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(k, Criterion.fromJson(e as Map<String, dynamic>))),
      ruleName: json['ruleName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final ruleName = this.ruleName;
    return {
      'filter': filter,
      'ruleName': ruleName,
    };
  }
}

/// This configuration sets the Amazon S3 access point network origin to
/// <code>Internet</code>.
class InternetConfiguration {
  InternetConfiguration();

  factory InternetConfiguration.fromJson(Map<String, dynamic> _) {
    return InternetConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains details about the policy generation request.
class JobDetails {
  /// The <code>JobId</code> that is returned by the
  /// <code>StartPolicyGeneration</code> operation. The <code>JobId</code> can be
  /// used with <code>GetGeneratedPolicy</code> to retrieve the generated policies
  /// or used with <code>CancelPolicyGeneration</code> to cancel the policy
  /// generation request.
  final String jobId;

  /// A timestamp of when the job was started.
  final DateTime startedOn;

  /// The status of the job request.
  final JobStatus status;

  /// A timestamp of when the job was completed.
  final DateTime? completedOn;
  final JobError? jobError;

  JobDetails({
    required this.jobId,
    required this.startedOn,
    required this.status,
    this.completedOn,
    this.jobError,
  });

  factory JobDetails.fromJson(Map<String, dynamic> json) {
    return JobDetails(
      jobId: json['jobId'] as String,
      startedOn: nonNullableTimeStampFromJson(json['startedOn'] as Object),
      status: (json['status'] as String).toJobStatus(),
      completedOn: timeStampFromJson(json['completedOn']),
      jobError: json['jobError'] != null
          ? JobError.fromJson(json['jobError'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final startedOn = this.startedOn;
    final status = this.status;
    final completedOn = this.completedOn;
    final jobError = this.jobError;
    return {
      'jobId': jobId,
      'startedOn': iso8601ToJson(startedOn),
      'status': status.toValue(),
      if (completedOn != null) 'completedOn': iso8601ToJson(completedOn),
      if (jobError != null) 'jobError': jobError,
    };
  }
}

/// Contains the details about the policy generation error.
class JobError {
  /// The job error code.
  final JobErrorCode code;

  /// Specific information about the error. For example, which service quota was
  /// exceeded or which resource was not found.
  final String message;

  JobError({
    required this.code,
    required this.message,
  });

  factory JobError.fromJson(Map<String, dynamic> json) {
    return JobError(
      code: (json['code'] as String).toJobErrorCode(),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'code': code.toValue(),
      'message': message,
    };
  }
}

enum JobErrorCode {
  authorizationError,
  resourceNotFoundError,
  serviceQuotaExceededError,
  serviceError,
}

extension on JobErrorCode {
  String toValue() {
    switch (this) {
      case JobErrorCode.authorizationError:
        return 'AUTHORIZATION_ERROR';
      case JobErrorCode.resourceNotFoundError:
        return 'RESOURCE_NOT_FOUND_ERROR';
      case JobErrorCode.serviceQuotaExceededError:
        return 'SERVICE_QUOTA_EXCEEDED_ERROR';
      case JobErrorCode.serviceError:
        return 'SERVICE_ERROR';
    }
  }
}

extension on String {
  JobErrorCode toJobErrorCode() {
    switch (this) {
      case 'AUTHORIZATION_ERROR':
        return JobErrorCode.authorizationError;
      case 'RESOURCE_NOT_FOUND_ERROR':
        return JobErrorCode.resourceNotFoundError;
      case 'SERVICE_QUOTA_EXCEEDED_ERROR':
        return JobErrorCode.serviceQuotaExceededError;
      case 'SERVICE_ERROR':
        return JobErrorCode.serviceError;
    }
    throw Exception('$this is not known in enum JobErrorCode');
  }
}

enum JobStatus {
  inProgress,
  succeeded,
  failed,
  canceled,
}

extension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.inProgress:
        return 'IN_PROGRESS';
      case JobStatus.succeeded:
        return 'SUCCEEDED';
      case JobStatus.failed:
        return 'FAILED';
      case JobStatus.canceled:
        return 'CANCELED';
    }
  }
}

extension on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return JobStatus.inProgress;
      case 'SUCCEEDED':
        return JobStatus.succeeded;
      case 'FAILED':
        return JobStatus.failed;
      case 'CANCELED':
        return JobStatus.canceled;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// A proposed grant configuration for a KMS key. For more information, see <a
/// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateGrant.html">CreateGrant</a>.
class KmsGrantConfiguration {
  /// The principal that is given permission to perform the operations that the
  /// grant permits.
  final String granteePrincipal;

  /// The AWS account under which the grant was issued. The account is used to
  /// propose KMS grants issued by accounts other than the owner of the key.
  final String issuingAccount;

  /// A list of operations that the grant permits.
  final List<KmsGrantOperation> operations;

  /// Use this structure to propose allowing <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operations</a> in the grant only when the operation request includes the
  /// specified <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">encryption
  /// context</a>.
  final KmsGrantConstraints? constraints;

  /// The principal that is given permission to retire the grant by using <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_RetireGrant.html">RetireGrant</a>
  /// operation.
  final String? retiringPrincipal;

  KmsGrantConfiguration({
    required this.granteePrincipal,
    required this.issuingAccount,
    required this.operations,
    this.constraints,
    this.retiringPrincipal,
  });

  factory KmsGrantConfiguration.fromJson(Map<String, dynamic> json) {
    return KmsGrantConfiguration(
      granteePrincipal: json['granteePrincipal'] as String,
      issuingAccount: json['issuingAccount'] as String,
      operations: (json['operations'] as List)
          .whereNotNull()
          .map((e) => (e as String).toKmsGrantOperation())
          .toList(),
      constraints: json['constraints'] != null
          ? KmsGrantConstraints.fromJson(
              json['constraints'] as Map<String, dynamic>)
          : null,
      retiringPrincipal: json['retiringPrincipal'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final granteePrincipal = this.granteePrincipal;
    final issuingAccount = this.issuingAccount;
    final operations = this.operations;
    final constraints = this.constraints;
    final retiringPrincipal = this.retiringPrincipal;
    return {
      'granteePrincipal': granteePrincipal,
      'issuingAccount': issuingAccount,
      'operations': operations.map((e) => e.toValue()).toList(),
      if (constraints != null) 'constraints': constraints,
      if (retiringPrincipal != null) 'retiringPrincipal': retiringPrincipal,
    };
  }
}

/// Use this structure to propose allowing <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
/// operations</a> in the grant only when the operation request includes the
/// specified <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">encryption
/// context</a>. You can specify only one type of encryption context. An empty
/// map is treated as not specified. For more information, see <a
/// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GrantConstraints.html">GrantConstraints</a>.
class KmsGrantConstraints {
  /// A list of key-value pairs that must match the encryption context in the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operation</a> request. The grant allows the operation only when the
  /// encryption context in the request is the same as the encryption context
  /// specified in this constraint.
  final Map<String, String>? encryptionContextEquals;

  /// A list of key-value pairs that must be included in the encryption context of
  /// the <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic
  /// operation</a> request. The grant allows the cryptographic operation only
  /// when the encryption context in the request includes the key-value pairs
  /// specified in this constraint, although it can include additional key-value
  /// pairs.
  final Map<String, String>? encryptionContextSubset;

  KmsGrantConstraints({
    this.encryptionContextEquals,
    this.encryptionContextSubset,
  });

  factory KmsGrantConstraints.fromJson(Map<String, dynamic> json) {
    return KmsGrantConstraints(
      encryptionContextEquals:
          (json['encryptionContextEquals'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      encryptionContextSubset:
          (json['encryptionContextSubset'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionContextEquals = this.encryptionContextEquals;
    final encryptionContextSubset = this.encryptionContextSubset;
    return {
      if (encryptionContextEquals != null)
        'encryptionContextEquals': encryptionContextEquals,
      if (encryptionContextSubset != null)
        'encryptionContextSubset': encryptionContextSubset,
    };
  }
}

enum KmsGrantOperation {
  createGrant,
  decrypt,
  describeKey,
  encrypt,
  generateDataKey,
  generateDataKeyPair,
  generateDataKeyPairWithoutPlaintext,
  generateDataKeyWithoutPlaintext,
  getPublicKey,
  reEncryptFrom,
  reEncryptTo,
  retireGrant,
  sign,
  verify,
}

extension on KmsGrantOperation {
  String toValue() {
    switch (this) {
      case KmsGrantOperation.createGrant:
        return 'CreateGrant';
      case KmsGrantOperation.decrypt:
        return 'Decrypt';
      case KmsGrantOperation.describeKey:
        return 'DescribeKey';
      case KmsGrantOperation.encrypt:
        return 'Encrypt';
      case KmsGrantOperation.generateDataKey:
        return 'GenerateDataKey';
      case KmsGrantOperation.generateDataKeyPair:
        return 'GenerateDataKeyPair';
      case KmsGrantOperation.generateDataKeyPairWithoutPlaintext:
        return 'GenerateDataKeyPairWithoutPlaintext';
      case KmsGrantOperation.generateDataKeyWithoutPlaintext:
        return 'GenerateDataKeyWithoutPlaintext';
      case KmsGrantOperation.getPublicKey:
        return 'GetPublicKey';
      case KmsGrantOperation.reEncryptFrom:
        return 'ReEncryptFrom';
      case KmsGrantOperation.reEncryptTo:
        return 'ReEncryptTo';
      case KmsGrantOperation.retireGrant:
        return 'RetireGrant';
      case KmsGrantOperation.sign:
        return 'Sign';
      case KmsGrantOperation.verify:
        return 'Verify';
    }
  }
}

extension on String {
  KmsGrantOperation toKmsGrantOperation() {
    switch (this) {
      case 'CreateGrant':
        return KmsGrantOperation.createGrant;
      case 'Decrypt':
        return KmsGrantOperation.decrypt;
      case 'DescribeKey':
        return KmsGrantOperation.describeKey;
      case 'Encrypt':
        return KmsGrantOperation.encrypt;
      case 'GenerateDataKey':
        return KmsGrantOperation.generateDataKey;
      case 'GenerateDataKeyPair':
        return KmsGrantOperation.generateDataKeyPair;
      case 'GenerateDataKeyPairWithoutPlaintext':
        return KmsGrantOperation.generateDataKeyPairWithoutPlaintext;
      case 'GenerateDataKeyWithoutPlaintext':
        return KmsGrantOperation.generateDataKeyWithoutPlaintext;
      case 'GetPublicKey':
        return KmsGrantOperation.getPublicKey;
      case 'ReEncryptFrom':
        return KmsGrantOperation.reEncryptFrom;
      case 'ReEncryptTo':
        return KmsGrantOperation.reEncryptTo;
      case 'RetireGrant':
        return KmsGrantOperation.retireGrant;
      case 'Sign':
        return KmsGrantOperation.sign;
      case 'Verify':
        return KmsGrantOperation.verify;
    }
    throw Exception('$this is not known in enum KmsGrantOperation');
  }
}

/// Proposed access control configuration for a KMS key. You can propose a
/// configuration for a new KMS key or an existing KMS key that you own by
/// specifying the key policy and KMS grant configuration. If the configuration
/// is for an existing key and you do not specify the key policy, the access
/// preview uses the existing policy for the key. If the access preview is for a
/// new resource and you do not specify the key policy, then the access preview
/// uses the default key policy. The proposed key policy cannot be an empty
/// string. For more information, see <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default">Default
/// key policy</a>. For more information about key policy limits, see <a
/// href="https://docs.aws.amazon.com/kms/latest/developerguide/resource-limits.html">Resource
/// quotas</a>.
/// <p/>
class KmsKeyConfiguration {
  /// A list of proposed grant configurations for the KMS key. If the proposed
  /// grant configuration is for an existing key, the access preview uses the
  /// proposed list of grant configurations in place of the existing grants.
  /// Otherwise, the access preview uses the existing grants for the key.
  final List<KmsGrantConfiguration>? grants;

  /// Resource policy configuration for the KMS key. The only valid value for the
  /// name of the key policy is <code>default</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html#key-policy-default">Default
  /// key policy</a>.
  final Map<String, String>? keyPolicies;

  KmsKeyConfiguration({
    this.grants,
    this.keyPolicies,
  });

  factory KmsKeyConfiguration.fromJson(Map<String, dynamic> json) {
    return KmsKeyConfiguration(
      grants: (json['grants'] as List?)
          ?.whereNotNull()
          .map((e) => KmsGrantConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      keyPolicies: (json['keyPolicies'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final grants = this.grants;
    final keyPolicies = this.keyPolicies;
    return {
      if (grants != null) 'grants': grants,
      if (keyPolicies != null) 'keyPolicies': keyPolicies,
    };
  }
}

class ListAccessPreviewFindingsResponse {
  /// A list of access preview findings that match the specified filter criteria.
  final List<AccessPreviewFinding> findings;

  /// A token used for pagination of results returned.
  final String? nextToken;

  ListAccessPreviewFindingsResponse({
    required this.findings,
    this.nextToken,
  });

  factory ListAccessPreviewFindingsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAccessPreviewFindingsResponse(
      findings: (json['findings'] as List)
          .whereNotNull()
          .map((e) => AccessPreviewFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    final nextToken = this.nextToken;
    return {
      'findings': findings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAccessPreviewsResponse {
  /// A list of access previews retrieved for the analyzer.
  final List<AccessPreviewSummary> accessPreviews;

  /// A token used for pagination of results returned.
  final String? nextToken;

  ListAccessPreviewsResponse({
    required this.accessPreviews,
    this.nextToken,
  });

  factory ListAccessPreviewsResponse.fromJson(Map<String, dynamic> json) {
    return ListAccessPreviewsResponse(
      accessPreviews: (json['accessPreviews'] as List)
          .whereNotNull()
          .map((e) => AccessPreviewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPreviews = this.accessPreviews;
    final nextToken = this.nextToken;
    return {
      'accessPreviews': accessPreviews,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response to the request.
class ListAnalyzedResourcesResponse {
  /// A list of resources that were analyzed.
  final List<AnalyzedResourceSummary> analyzedResources;

  /// A token used for pagination of results returned.
  final String? nextToken;

  ListAnalyzedResourcesResponse({
    required this.analyzedResources,
    this.nextToken,
  });

  factory ListAnalyzedResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListAnalyzedResourcesResponse(
      analyzedResources: (json['analyzedResources'] as List)
          .whereNotNull()
          .map((e) =>
              AnalyzedResourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzedResources = this.analyzedResources;
    final nextToken = this.nextToken;
    return {
      'analyzedResources': analyzedResources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response to the request.
class ListAnalyzersResponse {
  /// The analyzers retrieved.
  final List<AnalyzerSummary> analyzers;

  /// A token used for pagination of results returned.
  final String? nextToken;

  ListAnalyzersResponse({
    required this.analyzers,
    this.nextToken,
  });

  factory ListAnalyzersResponse.fromJson(Map<String, dynamic> json) {
    return ListAnalyzersResponse(
      analyzers: (json['analyzers'] as List)
          .whereNotNull()
          .map((e) => AnalyzerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzers = this.analyzers;
    final nextToken = this.nextToken;
    return {
      'analyzers': analyzers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response to the request.
class ListArchiveRulesResponse {
  /// A list of archive rules created for the specified analyzer.
  final List<ArchiveRuleSummary> archiveRules;

  /// A token used for pagination of results returned.
  final String? nextToken;

  ListArchiveRulesResponse({
    required this.archiveRules,
    this.nextToken,
  });

  factory ListArchiveRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListArchiveRulesResponse(
      archiveRules: (json['archiveRules'] as List)
          .whereNotNull()
          .map((e) => ArchiveRuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archiveRules = this.archiveRules;
    final nextToken = this.nextToken;
    return {
      'archiveRules': archiveRules,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response to the request.
class ListFindingsResponse {
  /// A list of findings retrieved from the analyzer that match the filter
  /// criteria specified, if any.
  final List<FindingSummary> findings;

  /// A token used for pagination of results returned.
  final String? nextToken;

  ListFindingsResponse({
    required this.findings,
    this.nextToken,
  });

  factory ListFindingsResponse.fromJson(Map<String, dynamic> json) {
    return ListFindingsResponse(
      findings: (json['findings'] as List)
          .whereNotNull()
          .map((e) => FindingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    final nextToken = this.nextToken;
    return {
      'findings': findings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListPolicyGenerationsResponse {
  /// A <code>PolicyGeneration</code> object that contains details about the
  /// generated policy.
  final List<PolicyGeneration> policyGenerations;

  /// A token used for pagination of results returned.
  final String? nextToken;

  ListPolicyGenerationsResponse({
    required this.policyGenerations,
    this.nextToken,
  });

  factory ListPolicyGenerationsResponse.fromJson(Map<String, dynamic> json) {
    return ListPolicyGenerationsResponse(
      policyGenerations: (json['policyGenerations'] as List)
          .whereNotNull()
          .map((e) => PolicyGeneration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyGenerations = this.policyGenerations;
    final nextToken = this.nextToken;
    return {
      'policyGenerations': policyGenerations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response to the request.
class ListTagsForResourceResponse {
  /// The tags that are applied to the specified resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

enum Locale {
  de,
  en,
  es,
  fr,
  it,
  ja,
  ko,
  ptBr,
  zhCn,
  zhTw,
}

extension on Locale {
  String toValue() {
    switch (this) {
      case Locale.de:
        return 'DE';
      case Locale.en:
        return 'EN';
      case Locale.es:
        return 'ES';
      case Locale.fr:
        return 'FR';
      case Locale.it:
        return 'IT';
      case Locale.ja:
        return 'JA';
      case Locale.ko:
        return 'KO';
      case Locale.ptBr:
        return 'PT_BR';
      case Locale.zhCn:
        return 'ZH_CN';
      case Locale.zhTw:
        return 'ZH_TW';
    }
  }
}

extension on String {
  Locale toLocale() {
    switch (this) {
      case 'DE':
        return Locale.de;
      case 'EN':
        return Locale.en;
      case 'ES':
        return Locale.es;
      case 'FR':
        return Locale.fr;
      case 'IT':
        return Locale.it;
      case 'JA':
        return Locale.ja;
      case 'KO':
        return Locale.ko;
      case 'PT_BR':
        return Locale.ptBr;
      case 'ZH_CN':
        return Locale.zhCn;
      case 'ZH_TW':
        return Locale.zhTw;
    }
    throw Exception('$this is not known in enum Locale');
  }
}

/// A location in a policy that is represented as a path through the JSON
/// representation and a corresponding span.
class Location {
  /// A path in a policy, represented as a sequence of path elements.
  final List<PathElement> path;

  /// A span in a policy.
  final Span span;

  Location({
    required this.path,
    required this.span,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      path: (json['path'] as List)
          .whereNotNull()
          .map((e) => PathElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      span: Span.fromJson(json['span'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final span = this.span;
    return {
      'path': path,
      'span': span,
    };
  }
}

/// The proposed <code>InternetConfiguration</code> or
/// <code>VpcConfiguration</code> to apply to the Amazon S3 Access point. You
/// can make the access point accessible from the internet, or you can specify
/// that all requests made through that access point must originate from a
/// specific virtual private cloud (VPC). You can specify only one type of
/// network configuration. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/creating-access-points.html">Creating
/// access points</a>.
class NetworkOriginConfiguration {
  /// The configuration for the Amazon S3 access point with an
  /// <code>Internet</code> origin.
  final InternetConfiguration? internetConfiguration;
  final VpcConfiguration? vpcConfiguration;

  NetworkOriginConfiguration({
    this.internetConfiguration,
    this.vpcConfiguration,
  });

  factory NetworkOriginConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkOriginConfiguration(
      internetConfiguration: json['internetConfiguration'] != null
          ? InternetConfiguration.fromJson(
              json['internetConfiguration'] as Map<String, dynamic>)
          : null,
      vpcConfiguration: json['vpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['vpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final internetConfiguration = this.internetConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (internetConfiguration != null)
        'internetConfiguration': internetConfiguration,
      if (vpcConfiguration != null) 'vpcConfiguration': vpcConfiguration,
    };
  }
}

enum OrderBy {
  asc,
  desc,
}

extension on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.asc:
        return 'ASC';
      case OrderBy.desc:
        return 'DESC';
    }
  }
}

extension on String {
  OrderBy toOrderBy() {
    switch (this) {
      case 'ASC':
        return OrderBy.asc;
      case 'DESC':
        return OrderBy.desc;
    }
    throw Exception('$this is not known in enum OrderBy');
  }
}

/// A single element in a path through the JSON representation of a policy.
class PathElement {
  /// Refers to an index in a JSON array.
  final int? index;

  /// Refers to a key in a JSON object.
  final String? key;

  /// Refers to a substring of a literal string in a JSON object.
  final Substring? substring;

  /// Refers to the value associated with a given key in a JSON object.
  final String? value;

  PathElement({
    this.index,
    this.key,
    this.substring,
    this.value,
  });

  factory PathElement.fromJson(Map<String, dynamic> json) {
    return PathElement(
      index: json['index'] as int?,
      key: json['key'] as String?,
      substring: json['substring'] != null
          ? Substring.fromJson(json['substring'] as Map<String, dynamic>)
          : null,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    final key = this.key;
    final substring = this.substring;
    final value = this.value;
    return {
      if (index != null) 'index': index,
      if (key != null) 'key': key,
      if (substring != null) 'substring': substring,
      if (value != null) 'value': value,
    };
  }
}

/// Contains details about the policy generation status and properties.
class PolicyGeneration {
  /// The <code>JobId</code> that is returned by the
  /// <code>StartPolicyGeneration</code> operation. The <code>JobId</code> can be
  /// used with <code>GetGeneratedPolicy</code> to retrieve the generated policies
  /// or used with <code>CancelPolicyGeneration</code> to cancel the policy
  /// generation request.
  final String jobId;

  /// The ARN of the IAM entity (user or role) for which you are generating a
  /// policy.
  final String principalArn;

  /// A timestamp of when the policy generation started.
  final DateTime startedOn;

  /// The status of the policy generation request.
  final JobStatus status;

  /// A timestamp of when the policy generation was completed.
  final DateTime? completedOn;

  PolicyGeneration({
    required this.jobId,
    required this.principalArn,
    required this.startedOn,
    required this.status,
    this.completedOn,
  });

  factory PolicyGeneration.fromJson(Map<String, dynamic> json) {
    return PolicyGeneration(
      jobId: json['jobId'] as String,
      principalArn: json['principalArn'] as String,
      startedOn: nonNullableTimeStampFromJson(json['startedOn'] as Object),
      status: (json['status'] as String).toJobStatus(),
      completedOn: timeStampFromJson(json['completedOn']),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final principalArn = this.principalArn;
    final startedOn = this.startedOn;
    final status = this.status;
    final completedOn = this.completedOn;
    return {
      'jobId': jobId,
      'principalArn': principalArn,
      'startedOn': iso8601ToJson(startedOn),
      'status': status.toValue(),
      if (completedOn != null) 'completedOn': iso8601ToJson(completedOn),
    };
  }
}

/// Contains the ARN details about the IAM entity for which the policy is
/// generated.
class PolicyGenerationDetails {
  /// The ARN of the IAM entity (user or role) for which you are generating a
  /// policy.
  final String principalArn;

  PolicyGenerationDetails({
    required this.principalArn,
  });

  factory PolicyGenerationDetails.fromJson(Map<String, dynamic> json) {
    return PolicyGenerationDetails(
      principalArn: json['principalArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final principalArn = this.principalArn;
    return {
      'principalArn': principalArn,
    };
  }
}

enum PolicyType {
  identityPolicy,
  resourcePolicy,
  serviceControlPolicy,
}

extension on PolicyType {
  String toValue() {
    switch (this) {
      case PolicyType.identityPolicy:
        return 'IDENTITY_POLICY';
      case PolicyType.resourcePolicy:
        return 'RESOURCE_POLICY';
      case PolicyType.serviceControlPolicy:
        return 'SERVICE_CONTROL_POLICY';
    }
  }
}

extension on String {
  PolicyType toPolicyType() {
    switch (this) {
      case 'IDENTITY_POLICY':
        return PolicyType.identityPolicy;
      case 'RESOURCE_POLICY':
        return PolicyType.resourcePolicy;
      case 'SERVICE_CONTROL_POLICY':
        return PolicyType.serviceControlPolicy;
    }
    throw Exception('$this is not known in enum PolicyType');
  }
}

/// A position in a policy.
class Position {
  /// The column of the position, starting from 0.
  final int column;

  /// The line of the position, starting from 1.
  final int line;

  /// The offset within the policy that corresponds to the position, starting from
  /// 0.
  final int offset;

  Position({
    required this.column,
    required this.line,
    required this.offset,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      column: json['column'] as int,
      line: json['line'] as int,
      offset: json['offset'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final column = this.column;
    final line = this.line;
    final offset = this.offset;
    return {
      'column': column,
      'line': line,
      'offset': offset,
    };
  }
}

enum ReasonCode {
  awsServiceAccessDisabled,
  delegatedAdministratorDeregistered,
  organizationDeleted,
  serviceLinkedRoleCreationFailed,
}

extension on ReasonCode {
  String toValue() {
    switch (this) {
      case ReasonCode.awsServiceAccessDisabled:
        return 'AWS_SERVICE_ACCESS_DISABLED';
      case ReasonCode.delegatedAdministratorDeregistered:
        return 'DELEGATED_ADMINISTRATOR_DEREGISTERED';
      case ReasonCode.organizationDeleted:
        return 'ORGANIZATION_DELETED';
      case ReasonCode.serviceLinkedRoleCreationFailed:
        return 'SERVICE_LINKED_ROLE_CREATION_FAILED';
    }
  }
}

extension on String {
  ReasonCode toReasonCode() {
    switch (this) {
      case 'AWS_SERVICE_ACCESS_DISABLED':
        return ReasonCode.awsServiceAccessDisabled;
      case 'DELEGATED_ADMINISTRATOR_DEREGISTERED':
        return ReasonCode.delegatedAdministratorDeregistered;
      case 'ORGANIZATION_DELETED':
        return ReasonCode.organizationDeleted;
      case 'SERVICE_LINKED_ROLE_CREATION_FAILED':
        return ReasonCode.serviceLinkedRoleCreationFailed;
    }
    throw Exception('$this is not known in enum ReasonCode');
  }
}

enum ResourceType {
  awsS3Bucket,
  awsIamRole,
  awsSqsQueue,
  awsLambdaFunction,
  awsLambdaLayerVersion,
  awsKmsKey,
  awsSecretsManagerSecret,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.awsS3Bucket:
        return 'AWS::S3::Bucket';
      case ResourceType.awsIamRole:
        return 'AWS::IAM::Role';
      case ResourceType.awsSqsQueue:
        return 'AWS::SQS::Queue';
      case ResourceType.awsLambdaFunction:
        return 'AWS::Lambda::Function';
      case ResourceType.awsLambdaLayerVersion:
        return 'AWS::Lambda::LayerVersion';
      case ResourceType.awsKmsKey:
        return 'AWS::KMS::Key';
      case ResourceType.awsSecretsManagerSecret:
        return 'AWS::SecretsManager::Secret';
    }
  }
}

extension on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'AWS::S3::Bucket':
        return ResourceType.awsS3Bucket;
      case 'AWS::IAM::Role':
        return ResourceType.awsIamRole;
      case 'AWS::SQS::Queue':
        return ResourceType.awsSqsQueue;
      case 'AWS::Lambda::Function':
        return ResourceType.awsLambdaFunction;
      case 'AWS::Lambda::LayerVersion':
        return ResourceType.awsLambdaLayerVersion;
      case 'AWS::KMS::Key':
        return ResourceType.awsKmsKey;
      case 'AWS::SecretsManager::Secret':
        return ResourceType.awsSecretsManagerSecret;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// The configuration for an Amazon S3 access point for the bucket. You can
/// propose up to 10 access points per bucket. If the proposed Amazon S3 access
/// point configuration is for an existing bucket, the access preview uses the
/// proposed access point configuration in place of the existing access points.
/// To propose an access point without a policy, you can provide an empty string
/// as the access point policy. For more information, see <a
/// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonS3/latest/dev/creating-access-points.html">Creating
/// access points</a>. For more information about access point policy limits,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points-restrictions-limitations.html">Access
/// points restrictions and limitations</a>.
class S3AccessPointConfiguration {
  /// The access point policy.
  final String? accessPointPolicy;

  /// The proposed <code>Internet</code> and <code>VpcConfiguration</code> to
  /// apply to this Amazon S3 access point. If the access preview is for a new
  /// resource and neither is specified, the access preview uses
  /// <code>Internet</code> for the network origin. If the access preview is for
  /// an existing resource and neither is specified, the access preview uses the
  /// exiting network origin.
  final NetworkOriginConfiguration? networkOrigin;

  /// The proposed <code>S3PublicAccessBlock</code> configuration to apply to this
  /// Amazon S3 Access Point.
  final S3PublicAccessBlockConfiguration? publicAccessBlock;

  S3AccessPointConfiguration({
    this.accessPointPolicy,
    this.networkOrigin,
    this.publicAccessBlock,
  });

  factory S3AccessPointConfiguration.fromJson(Map<String, dynamic> json) {
    return S3AccessPointConfiguration(
      accessPointPolicy: json['accessPointPolicy'] as String?,
      networkOrigin: json['networkOrigin'] != null
          ? NetworkOriginConfiguration.fromJson(
              json['networkOrigin'] as Map<String, dynamic>)
          : null,
      publicAccessBlock: json['publicAccessBlock'] != null
          ? S3PublicAccessBlockConfiguration.fromJson(
              json['publicAccessBlock'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointPolicy = this.accessPointPolicy;
    final networkOrigin = this.networkOrigin;
    final publicAccessBlock = this.publicAccessBlock;
    return {
      if (accessPointPolicy != null) 'accessPointPolicy': accessPointPolicy,
      if (networkOrigin != null) 'networkOrigin': networkOrigin,
      if (publicAccessBlock != null) 'publicAccessBlock': publicAccessBlock,
    };
  }
}

/// A proposed access control list grant configuration for an Amazon S3 bucket.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#setting-acls">How
/// to Specify an ACL</a>.
class S3BucketAclGrantConfiguration {
  /// The grantee to whom you’re assigning access rights.
  final AclGrantee grantee;

  /// The permissions being granted.
  final AclPermission permission;

  S3BucketAclGrantConfiguration({
    required this.grantee,
    required this.permission,
  });

  factory S3BucketAclGrantConfiguration.fromJson(Map<String, dynamic> json) {
    return S3BucketAclGrantConfiguration(
      grantee: AclGrantee.fromJson(json['grantee'] as Map<String, dynamic>),
      permission: (json['permission'] as String).toAclPermission(),
    );
  }

  Map<String, dynamic> toJson() {
    final grantee = this.grantee;
    final permission = this.permission;
    return {
      'grantee': grantee,
      'permission': permission.toValue(),
    };
  }
}

/// Proposed access control configuration for an Amazon S3 bucket. You can
/// propose a configuration for a new Amazon S3 bucket or an existing Amazon S3
/// bucket that you own by specifying the Amazon S3 bucket policy, bucket ACLs,
/// bucket BPA settings, and Amazon S3 access points attached to the bucket. If
/// the configuration is for an existing Amazon S3 bucket and you do not specify
/// the Amazon S3 bucket policy, the access preview uses the existing policy
/// attached to the bucket. If the access preview is for a new resource and you
/// do not specify the Amazon S3 bucket policy, the access preview assumes a
/// bucket without a policy. To propose deletion of an existing bucket policy,
/// you can specify an empty string. For more information about bucket policy
/// limits, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html">Bucket
/// Policy Examples</a>.
class S3BucketConfiguration {
  /// The configuration of Amazon S3 access points for the bucket.
  final Map<String, S3AccessPointConfiguration>? accessPoints;

  /// The proposed list of ACL grants for the Amazon S3 bucket. You can propose up
  /// to 100 ACL grants per bucket. If the proposed grant configuration is for an
  /// existing bucket, the access preview uses the proposed list of grant
  /// configurations in place of the existing grants. Otherwise, the access
  /// preview uses the existing grants for the bucket.
  final List<S3BucketAclGrantConfiguration>? bucketAclGrants;

  /// The proposed bucket policy for the Amazon S3 bucket.
  final String? bucketPolicy;

  /// The proposed block public access configuration for the Amazon S3 bucket.
  final S3PublicAccessBlockConfiguration? bucketPublicAccessBlock;

  S3BucketConfiguration({
    this.accessPoints,
    this.bucketAclGrants,
    this.bucketPolicy,
    this.bucketPublicAccessBlock,
  });

  factory S3BucketConfiguration.fromJson(Map<String, dynamic> json) {
    return S3BucketConfiguration(
      accessPoints: (json['accessPoints'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k,
              S3AccessPointConfiguration.fromJson(e as Map<String, dynamic>))),
      bucketAclGrants: (json['bucketAclGrants'] as List?)
          ?.whereNotNull()
          .map((e) =>
              S3BucketAclGrantConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      bucketPolicy: json['bucketPolicy'] as String?,
      bucketPublicAccessBlock: json['bucketPublicAccessBlock'] != null
          ? S3PublicAccessBlockConfiguration.fromJson(
              json['bucketPublicAccessBlock'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPoints = this.accessPoints;
    final bucketAclGrants = this.bucketAclGrants;
    final bucketPolicy = this.bucketPolicy;
    final bucketPublicAccessBlock = this.bucketPublicAccessBlock;
    return {
      if (accessPoints != null) 'accessPoints': accessPoints,
      if (bucketAclGrants != null) 'bucketAclGrants': bucketAclGrants,
      if (bucketPolicy != null) 'bucketPolicy': bucketPolicy,
      if (bucketPublicAccessBlock != null)
        'bucketPublicAccessBlock': bucketPublicAccessBlock,
    };
  }
}

/// The <code>PublicAccessBlock</code> configuration to apply to this Amazon S3
/// bucket. If the proposed configuration is for an existing Amazon S3 bucket
/// and the configuration is not specified, the access preview uses the existing
/// setting. If the proposed configuration is for a new bucket and the
/// configuration is not specified, the access preview uses <code>false</code>.
/// If the proposed configuration is for a new access point and the access point
/// BPA configuration is not specified, the access preview uses
/// <code>true</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket-publicaccessblockconfiguration.html">PublicAccessBlockConfiguration</a>.
class S3PublicAccessBlockConfiguration {
  /// Specifies whether Amazon S3 should ignore public ACLs for this bucket and
  /// objects in this bucket.
  final bool ignorePublicAcls;

  /// Specifies whether Amazon S3 should restrict public bucket policies for this
  /// bucket.
  final bool restrictPublicBuckets;

  S3PublicAccessBlockConfiguration({
    required this.ignorePublicAcls,
    required this.restrictPublicBuckets,
  });

  factory S3PublicAccessBlockConfiguration.fromJson(Map<String, dynamic> json) {
    return S3PublicAccessBlockConfiguration(
      ignorePublicAcls: json['ignorePublicAcls'] as bool,
      restrictPublicBuckets: json['restrictPublicBuckets'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final ignorePublicAcls = this.ignorePublicAcls;
    final restrictPublicBuckets = this.restrictPublicBuckets;
    return {
      'ignorePublicAcls': ignorePublicAcls,
      'restrictPublicBuckets': restrictPublicBuckets,
    };
  }
}

/// The configuration for a Secrets Manager secret. For more information, see <a
/// href="https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_CreateSecret.html">CreateSecret</a>.
///
/// You can propose a configuration for a new secret or an existing secret that
/// you own by specifying the secret policy and optional KMS encryption key. If
/// the configuration is for an existing secret and you do not specify the
/// secret policy, the access preview uses the existing policy for the secret.
/// If the access preview is for a new resource and you do not specify the
/// policy, the access preview assumes a secret without a policy. To propose
/// deletion of an existing policy, you can specify an empty string. If the
/// proposed configuration is for a new secret and you do not specify the KMS
/// key ID, the access preview uses the default CMK of the AWS account. If you
/// specify an empty string for the KMS key ID, the access preview uses the
/// default CMK of the AWS account. For more information about secret policy
/// limits, see <a
/// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_limits.html">Quotas
/// for AWS Secrets Manager.</a>.
class SecretsManagerSecretConfiguration {
  /// The proposed ARN, key ID, or alias of the AWS KMS customer master key (CMK).
  final String? kmsKeyId;

  /// The proposed resource policy defining who can access or manage the secret.
  final String? secretPolicy;

  SecretsManagerSecretConfiguration({
    this.kmsKeyId,
    this.secretPolicy,
  });

  factory SecretsManagerSecretConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SecretsManagerSecretConfiguration(
      kmsKeyId: json['kmsKeyId'] as String?,
      secretPolicy: json['secretPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final secretPolicy = this.secretPolicy;
    return {
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (secretPolicy != null) 'secretPolicy': secretPolicy,
    };
  }
}

/// The criteria used to sort.
class SortCriteria {
  /// The name of the attribute to sort on.
  final String? attributeName;

  /// The sort order, ascending or descending.
  final OrderBy? orderBy;

  SortCriteria({
    this.attributeName,
    this.orderBy,
  });

  factory SortCriteria.fromJson(Map<String, dynamic> json) {
    return SortCriteria(
      attributeName: json['attributeName'] as String?,
      orderBy: (json['orderBy'] as String?)?.toOrderBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName,
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

/// A span in a policy. The span consists of a start position (inclusive) and
/// end position (exclusive).
class Span {
  /// The end position of the span (exclusive).
  final Position end;

  /// The start position of the span (inclusive).
  final Position start;

  Span({
    required this.end,
    required this.start,
  });

  factory Span.fromJson(Map<String, dynamic> json) {
    return Span(
      end: Position.fromJson(json['end'] as Map<String, dynamic>),
      start: Position.fromJson(json['start'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      'end': end,
      'start': start,
    };
  }
}

/// The proposed access control configuration for an SQS queue. You can propose
/// a configuration for a new SQS queue or an existing SQS queue that you own by
/// specifying the SQS policy. If the configuration is for an existing SQS queue
/// and you do not specify the SQS policy, the access preview uses the existing
/// SQS policy for the queue. If the access preview is for a new resource and
/// you do not specify the policy, the access preview assumes an SQS queue
/// without a policy. To propose deletion of an existing SQS queue policy, you
/// can specify an empty string for the SQS policy. For more information about
/// SQS policy limits, see <a
/// href="https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-policies.html">Quotas
/// related to policies</a>.
class SqsQueueConfiguration {
  /// The proposed resource policy for the SQS queue.
  final String? queuePolicy;

  SqsQueueConfiguration({
    this.queuePolicy,
  });

  factory SqsQueueConfiguration.fromJson(Map<String, dynamic> json) {
    return SqsQueueConfiguration(
      queuePolicy: json['queuePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queuePolicy = this.queuePolicy;
    return {
      if (queuePolicy != null) 'queuePolicy': queuePolicy,
    };
  }
}

class StartPolicyGenerationResponse {
  /// The <code>JobId</code> that is returned by the
  /// <code>StartPolicyGeneration</code> operation. The <code>JobId</code> can be
  /// used with <code>GetGeneratedPolicy</code> to retrieve the generated policies
  /// or used with <code>CancelPolicyGeneration</code> to cancel the policy
  /// generation request.
  final String jobId;

  StartPolicyGenerationResponse({
    required this.jobId,
  });

  factory StartPolicyGenerationResponse.fromJson(Map<String, dynamic> json) {
    return StartPolicyGenerationResponse(
      jobId: json['jobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

/// Provides more details about the current status of the analyzer. For example,
/// if the creation for the analyzer fails, a <code>Failed</code> status is
/// returned. For an analyzer with organization as the type, this failure can be
/// due to an issue with creating the service-linked roles required in the
/// member accounts of the AWS organization.
class StatusReason {
  /// The reason code for the current status of the analyzer.
  final ReasonCode code;

  StatusReason({
    required this.code,
  });

  factory StatusReason.fromJson(Map<String, dynamic> json) {
    return StatusReason(
      code: (json['code'] as String).toReasonCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    return {
      'code': code.toValue(),
    };
  }
}

/// A reference to a substring of a literal string in a JSON document.
class Substring {
  /// The length of the substring.
  final int length;

  /// The start index of the substring, starting from 0.
  final int start;

  Substring({
    required this.length,
    required this.start,
  });

  factory Substring.fromJson(Map<String, dynamic> json) {
    return Substring(
      length: json['length'] as int,
      start: json['start'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final length = this.length;
    final start = this.start;
    return {
      'length': length,
      'start': start,
    };
  }
}

/// The response to the request.
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains details about the CloudTrail trail being analyzed to generate a
/// policy.
class Trail {
  /// Specifies the ARN of the trail. The format of a trail ARN is
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>.
  final String cloudTrailArn;

  /// Possible values are <code>true</code> or <code>false</code>. If set to
  /// <code>true</code>, Access Analyzer retrieves CloudTrail data from all
  /// regions to analyze and generate a policy.
  final bool? allRegions;

  /// A list of regions to get CloudTrail data from and analyze to generate a
  /// policy.
  final List<String>? regions;

  Trail({
    required this.cloudTrailArn,
    this.allRegions,
    this.regions,
  });

  factory Trail.fromJson(Map<String, dynamic> json) {
    return Trail(
      cloudTrailArn: json['cloudTrailArn'] as String,
      allRegions: json['allRegions'] as bool?,
      regions: (json['regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudTrailArn = this.cloudTrailArn;
    final allRegions = this.allRegions;
    final regions = this.regions;
    return {
      'cloudTrailArn': cloudTrailArn,
      if (allRegions != null) 'allRegions': allRegions,
      if (regions != null) 'regions': regions,
    };
  }
}

/// Contains details about the CloudTrail trail being analyzed to generate a
/// policy.
class TrailProperties {
  /// Specifies the ARN of the trail. The format of a trail ARN is
  /// <code>arn:aws:cloudtrail:us-east-2:123456789012:trail/MyTrail</code>.
  final String cloudTrailArn;

  /// Possible values are <code>true</code> or <code>false</code>. If set to
  /// <code>true</code>, Access Analyzer retrieves CloudTrail data from all
  /// regions to analyze and generate a policy.
  final bool? allRegions;

  /// A list of regions to get CloudTrail data from and analyze to generate a
  /// policy.
  final List<String>? regions;

  TrailProperties({
    required this.cloudTrailArn,
    this.allRegions,
    this.regions,
  });

  factory TrailProperties.fromJson(Map<String, dynamic> json) {
    return TrailProperties(
      cloudTrailArn: json['cloudTrailArn'] as String,
      allRegions: json['allRegions'] as bool?,
      regions: (json['regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudTrailArn = this.cloudTrailArn;
    final allRegions = this.allRegions;
    final regions = this.regions;
    return {
      'cloudTrailArn': cloudTrailArn,
      if (allRegions != null) 'allRegions': allRegions,
      if (regions != null) 'regions': regions,
    };
  }
}

enum Type {
  account,
  organization,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.account:
        return 'ACCOUNT';
      case Type.organization:
        return 'ORGANIZATION';
    }
  }
}

extension on String {
  Type toType() {
    switch (this) {
      case 'ACCOUNT':
        return Type.account;
      case 'ORGANIZATION':
        return Type.organization;
    }
    throw Exception('$this is not known in enum Type');
  }
}

/// The response to the request.
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A finding in a policy. Each finding is an actionable recommendation that can
/// be used to improve the policy.
class ValidatePolicyFinding {
  /// A localized message that explains the finding and provides guidance on how
  /// to address it.
  final String findingDetails;

  /// The impact of the finding.
  ///
  /// Security warnings report when the policy allows access that we consider
  /// overly permissive.
  ///
  /// Errors report when a part of the policy is not functional.
  ///
  /// Warnings report non-security issues when a policy does not conform to policy
  /// writing best practices.
  ///
  /// Suggestions recommend stylistic improvements in the policy that do not
  /// impact access.
  final ValidatePolicyFindingType findingType;

  /// The issue code provides an identifier of the issue associated with this
  /// finding.
  final String issueCode;

  /// A link to additional documentation about the type of finding.
  final String learnMoreLink;

  /// The list of locations in the policy document that are related to the
  /// finding. The issue code provides a summary of an issue identified by the
  /// finding.
  final List<Location> locations;

  ValidatePolicyFinding({
    required this.findingDetails,
    required this.findingType,
    required this.issueCode,
    required this.learnMoreLink,
    required this.locations,
  });

  factory ValidatePolicyFinding.fromJson(Map<String, dynamic> json) {
    return ValidatePolicyFinding(
      findingDetails: json['findingDetails'] as String,
      findingType:
          (json['findingType'] as String).toValidatePolicyFindingType(),
      issueCode: json['issueCode'] as String,
      learnMoreLink: json['learnMoreLink'] as String,
      locations: (json['locations'] as List)
          .whereNotNull()
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final findingDetails = this.findingDetails;
    final findingType = this.findingType;
    final issueCode = this.issueCode;
    final learnMoreLink = this.learnMoreLink;
    final locations = this.locations;
    return {
      'findingDetails': findingDetails,
      'findingType': findingType.toValue(),
      'issueCode': issueCode,
      'learnMoreLink': learnMoreLink,
      'locations': locations,
    };
  }
}

enum ValidatePolicyFindingType {
  error,
  securityWarning,
  suggestion,
  warning,
}

extension on ValidatePolicyFindingType {
  String toValue() {
    switch (this) {
      case ValidatePolicyFindingType.error:
        return 'ERROR';
      case ValidatePolicyFindingType.securityWarning:
        return 'SECURITY_WARNING';
      case ValidatePolicyFindingType.suggestion:
        return 'SUGGESTION';
      case ValidatePolicyFindingType.warning:
        return 'WARNING';
    }
  }
}

extension on String {
  ValidatePolicyFindingType toValidatePolicyFindingType() {
    switch (this) {
      case 'ERROR':
        return ValidatePolicyFindingType.error;
      case 'SECURITY_WARNING':
        return ValidatePolicyFindingType.securityWarning;
      case 'SUGGESTION':
        return ValidatePolicyFindingType.suggestion;
      case 'WARNING':
        return ValidatePolicyFindingType.warning;
    }
    throw Exception('$this is not known in enum ValidatePolicyFindingType');
  }
}

class ValidatePolicyResponse {
  /// The list of findings in a policy returned by Access Analyzer based on its
  /// suite of policy checks.
  final List<ValidatePolicyFinding> findings;

  /// A token used for pagination of results returned.
  final String? nextToken;

  ValidatePolicyResponse({
    required this.findings,
    this.nextToken,
  });

  factory ValidatePolicyResponse.fromJson(Map<String, dynamic> json) {
    return ValidatePolicyResponse(
      findings: (json['findings'] as List)
          .whereNotNull()
          .map((e) => ValidatePolicyFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    final nextToken = this.nextToken;
    return {
      'findings': findings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The proposed virtual private cloud (VPC) configuration for the Amazon S3
/// access point. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_control_VpcConfiguration.html">VpcConfiguration</a>.
class VpcConfiguration {
  /// If this field is specified, this access point will only allow connections
  /// from the specified VPC ID.
  final String vpcId;

  VpcConfiguration({
    required this.vpcId,
  });

  factory VpcConfiguration.fromJson(Map<String, dynamic> json) {
    return VpcConfiguration(
      vpcId: json['vpcId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcId = this.vpcId;
    return {
      'vpcId': vpcId,
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

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
