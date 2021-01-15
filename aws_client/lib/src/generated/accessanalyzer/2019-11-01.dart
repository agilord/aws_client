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

part '2019-11-01.g.dart';

/// AWS IAM Access Analyzer helps identify potential resource-access risks by
/// enabling you to identify any policies that grant access to an external
/// principal. It does this by using logic-based reasoning to analyze
/// resource-based policies in your AWS environment. An external principal can
/// be another AWS account, a root user, an IAM user or role, a federated user,
/// an AWS service, or an anonymous user. This guide describes the AWS IAM
/// Access Analyzer operations that you can call programmatically. For general
/// information about Access Analyzer, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html">AWS
/// IAM Access Analyzer</a> in the <b>IAM User Guide</b>.
///
/// To start using Access Analyzer, you first need to create an analyzer.
class AccessAnalyzer {
  final _s.RestJsonProtocol _protocol;
  AccessAnalyzer({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String analyzerArn,
    @_s.required String ruleName,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    _s.validateStringPattern(
      'analyzerArn',
      analyzerArn,
      r'''^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:analyzer/.{1,255}$''',
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
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
  /// The type of analyzer to create. Only ACCOUNT analyzers are supported. You
  /// can create only one analyzer per account per Region.
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
    @_s.required String analyzerName,
    @_s.required Type type,
    List<InlineArchiveRule> archiveRules,
    String clientToken,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analyzerName',
      analyzerName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'analyzerName': analyzerName,
      'type': type?.toValue() ?? '',
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
    @_s.required String analyzerName,
    @_s.required Map<String, Criterion> filter,
    @_s.required String ruleName,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analyzerName',
      analyzerName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
  /// Analyzer is disabled for the account in the current or specific Region.
  /// All findings that were generated by the analyzer are deleted. You cannot
  /// undo this action.
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
    @_s.required String analyzerName,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analyzerName',
      analyzerName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
    @_s.required String analyzerName,
    @_s.required String ruleName,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analyzerName',
      analyzerName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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

  /// Retrieves information about a resource that was analyzed.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [analyzerArn] :
  /// The ARN of the analyzer to retrieve information from.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to retrieve information about.
  Future<GetAnalyzedResourceResponse> getAnalyzedResource({
    @_s.required String analyzerArn,
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    _s.validateStringPattern(
      'analyzerArn',
      analyzerArn,
      r'''^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:analyzer/.{1,255}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:[^:]*:[^:]*:[^:]*:[^:]*:.*$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (analyzerArn != null) 'analyzerArn': [analyzerArn],
      if (resourceArn != null) 'resourceArn': [resourceArn],
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
    @_s.required String analyzerName,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analyzerName',
      analyzerName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
    @_s.required String analyzerName,
    @_s.required String ruleName,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analyzerName',
      analyzerName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
  /// The ARN of the analyzer that generated the finding.
  ///
  /// Parameter [id] :
  /// The ID of the finding to retrieve.
  Future<GetFindingResponse> getFinding({
    @_s.required String analyzerArn,
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    _s.validateStringPattern(
      'analyzerArn',
      analyzerArn,
      r'''^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:analyzer/.{1,255}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(id, 'id');
    final $query = <String, List<String>>{
      if (analyzerArn != null) 'analyzerArn': [analyzerArn],
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
  /// The ARN of the analyzer to retrieve a list of analyzed resources from.
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
    @_s.required String analyzerArn,
    int maxResults,
    String nextToken,
    ResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    _s.validateStringPattern(
      'analyzerArn',
      analyzerArn,
      r'''^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:analyzer/.{1,255}$''',
      isRequired: true,
    );
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
    int maxResults,
    String nextToken,
    Type type,
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
    @_s.required String analyzerName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analyzerName',
      analyzerName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
  /// Parameter [analyzerArn] :
  /// The ARN of the analyzer to retrieve findings from.
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
    @_s.required String analyzerArn,
    Map<String, Criterion> filter,
    int maxResults,
    String nextToken,
    SortCriteria sort,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    _s.validateStringPattern(
      'analyzerArn',
      analyzerArn,
      r'''^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:analyzer/.{1,255}$''',
      isRequired: true,
    );
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
    @_s.required String resourceArn,
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
  /// The ARN of the analyzer to use to scan the policies applied to the
  /// specified resource.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to scan.
  Future<void> startResourceScan({
    @_s.required String analyzerArn,
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    _s.validateStringPattern(
      'analyzerArn',
      analyzerArn,
      r'''^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:analyzer/.{1,255}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:[^:]*:[^:]*:[^:]*:[^:]*:.*$''',
      isRequired: true,
    );
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required String analyzerName,
    @_s.required Map<String, Criterion> filter,
    @_s.required String ruleName,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(analyzerName, 'analyzerName');
    _s.validateStringLength(
      'analyzerName',
      analyzerName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'analyzerName',
      analyzerName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[A-Za-z][A-Za-z0-9_.-]*$''',
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
  /// The ARN of the analyzer that generated the findings to update.
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
    @_s.required String analyzerArn,
    @_s.required FindingStatusUpdate status,
    String clientToken,
    List<String> ids,
    String resourceArn,
  }) async {
    ArgumentError.checkNotNull(analyzerArn, 'analyzerArn');
    _s.validateStringPattern(
      'analyzerArn',
      analyzerArn,
      r'''^[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:analyzer/.{1,255}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:[^:]*:[^:]*:[^:]*:[^:]*:.*$''',
    );
    final $payload = <String, dynamic>{
      'analyzerArn': analyzerArn,
      'status': status?.toValue() ?? '',
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
}

/// Contains details about the analyzed resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnalyzedResource {
  /// The time at which the resource was analyzed.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'analyzedAt')
  final DateTime analyzedAt;

  /// The time at which the finding was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Indicates whether the policy that generated the finding grants public access
  /// to the resource.
  @_s.JsonKey(name: 'isPublic')
  final bool isPublic;

  /// The ARN of the resource that was analyzed.
  @_s.JsonKey(name: 'resourceArn')
  final String resourceArn;

  /// The AWS account ID that owns the resource.
  @_s.JsonKey(name: 'resourceOwnerAccount')
  final String resourceOwnerAccount;

  /// The type of the resource that was analyzed.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The time at which the finding was updated.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  /// The actions that an external principal is granted permission to use by the
  /// policy that generated the finding.
  @_s.JsonKey(name: 'actions')
  final List<String> actions;

  /// An error message.
  @_s.JsonKey(name: 'error')
  final String error;

  /// Indicates how the access that generated the finding is granted. This is
  /// populated for Amazon S3 bucket findings.
  @_s.JsonKey(name: 'sharedVia')
  final List<String> sharedVia;

  /// The current status of the finding generated from the analyzed resource.
  @_s.JsonKey(name: 'status')
  final FindingStatus status;

  AnalyzedResource({
    @_s.required this.analyzedAt,
    @_s.required this.createdAt,
    @_s.required this.isPublic,
    @_s.required this.resourceArn,
    @_s.required this.resourceOwnerAccount,
    @_s.required this.resourceType,
    @_s.required this.updatedAt,
    this.actions,
    this.error,
    this.sharedVia,
    this.status,
  });
  factory AnalyzedResource.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedResourceFromJson(json);
}

/// Contains the ARN of the analyzed resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnalyzedResourceSummary {
  /// The ARN of the analyzed resource.
  @_s.JsonKey(name: 'resourceArn')
  final String resourceArn;

  /// The AWS account ID that owns the resource.
  @_s.JsonKey(name: 'resourceOwnerAccount')
  final String resourceOwnerAccount;

  /// The type of resource that was analyzed.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  AnalyzedResourceSummary({
    @_s.required this.resourceArn,
    @_s.required this.resourceOwnerAccount,
    @_s.required this.resourceType,
  });
  factory AnalyzedResourceSummary.fromJson(Map<String, dynamic> json) =>
      _$AnalyzedResourceSummaryFromJson(json);
}

enum AnalyzerStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('FAILED')
  failed,
}

/// Contains information about the analyzer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnalyzerSummary {
  /// The ARN of the analyzer.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A timestamp for the time at which the analyzer was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The name of the analyzer.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the analyzer. An <code>Active</code> analyzer successfully
  /// monitors supported resources and generates new findings. The analyzer is
  /// <code>Disabled</code> when a user action, such as removing trusted access
  /// for IAM Access Analyzer from AWS Organizations, causes the analyzer to stop
  /// generating new findings. The status is <code>Creating</code> when the
  /// analyzer creation is in progress and <code>Failed</code> when the analyzer
  /// creation has failed.
  @_s.JsonKey(name: 'status')
  final AnalyzerStatus status;

  /// The type of analyzer, which corresponds to the zone of trust chosen for the
  /// analyzer.
  @_s.JsonKey(name: 'type')
  final Type type;

  /// The resource that was most recently analyzed by the analyzer.
  @_s.JsonKey(name: 'lastResourceAnalyzed')
  final String lastResourceAnalyzed;

  /// The time at which the most recently analyzed resource was analyzed.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastResourceAnalyzedAt')
  final DateTime lastResourceAnalyzedAt;

  /// The <code>statusReason</code> provides more details about the current status
  /// of the analyzer. For example, if the creation for the analyzer fails, a
  /// <code>Failed</code> status is displayed. For an analyzer with organization
  /// as the type, this failure can be due to an issue with creating the
  /// service-linked roles required in the member accounts of the AWS
  /// organization.
  @_s.JsonKey(name: 'statusReason')
  final StatusReason statusReason;

  /// The tags added to the analyzer.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  AnalyzerSummary({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.name,
    @_s.required this.status,
    @_s.required this.type,
    this.lastResourceAnalyzed,
    this.lastResourceAnalyzedAt,
    this.statusReason,
    this.tags,
  });
  factory AnalyzerSummary.fromJson(Map<String, dynamic> json) =>
      _$AnalyzerSummaryFromJson(json);
}

/// Contains information about an archive rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ArchiveRuleSummary {
  /// The time at which the archive rule was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// A filter used to define the archive rule.
  @_s.JsonKey(name: 'filter')
  final Map<String, Criterion> filter;

  /// The name of the archive rule.
  @_s.JsonKey(name: 'ruleName')
  final String ruleName;

  /// The time at which the archive rule was last updated.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  ArchiveRuleSummary({
    @_s.required this.createdAt,
    @_s.required this.filter,
    @_s.required this.ruleName,
    @_s.required this.updatedAt,
  });
  factory ArchiveRuleSummary.fromJson(Map<String, dynamic> json) =>
      _$ArchiveRuleSummaryFromJson(json);
}

/// The response to the request to create an analyzer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAnalyzerResponse {
  /// The ARN of the analyzer that was created by the request.
  @_s.JsonKey(name: 'arn')
  final String arn;

  CreateAnalyzerResponse({
    this.arn,
  });
  factory CreateAnalyzerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAnalyzerResponseFromJson(json);
}

/// The criteria to use in the filter that defines the archive rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Criterion {
  /// A "contains" operator to match for the filter used to create the rule.
  @_s.JsonKey(name: 'contains')
  final List<String> contains;

  /// An "equals" operator to match for the filter used to create the rule.
  @_s.JsonKey(name: 'eq')
  final List<String> eq;

  /// An "exists" operator to match for the filter used to create the rule.
  @_s.JsonKey(name: 'exists')
  final bool exists;

  /// A "not equals" operator to match for the filter used to create the rule.
  @_s.JsonKey(name: 'neq')
  final List<String> neq;

  Criterion({
    this.contains,
    this.eq,
    this.exists,
    this.neq,
  });
  factory Criterion.fromJson(Map<String, dynamic> json) =>
      _$CriterionFromJson(json);

  Map<String, dynamic> toJson() => _$CriterionToJson(this);
}

/// Contains information about a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Finding {
  /// The time at which the resource was analyzed.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'analyzedAt')
  final DateTime analyzedAt;

  /// The condition in the analyzed policy statement that resulted in a finding.
  @_s.JsonKey(name: 'condition')
  final Map<String, String> condition;

  /// The time at which the finding was generated.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ID of the finding.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The AWS account ID that owns the resource.
  @_s.JsonKey(name: 'resourceOwnerAccount')
  final String resourceOwnerAccount;

  /// The type of the resource reported in the finding.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The current status of the finding.
  @_s.JsonKey(name: 'status')
  final FindingStatus status;

  /// The time at which the finding was updated.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  /// The action in the analyzed policy statement that an external principal has
  /// permission to use.
  @_s.JsonKey(name: 'action')
  final List<String> action;

  /// An error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// Indicates whether the policy that generated the finding allows public access
  /// to the resource.
  @_s.JsonKey(name: 'isPublic')
  final bool isPublic;

  /// The external principal that access to a resource within the zone of trust.
  @_s.JsonKey(name: 'principal')
  final Map<String, String> principal;

  /// The resource that an external principal has access to.
  @_s.JsonKey(name: 'resource')
  final String resource;

  /// The sources of the finding. This indicates how the access that generated the
  /// finding is granted. It is populated for Amazon S3 bucket findings.
  @_s.JsonKey(name: 'sources')
  final List<FindingSource> sources;

  Finding({
    @_s.required this.analyzedAt,
    @_s.required this.condition,
    @_s.required this.createdAt,
    @_s.required this.id,
    @_s.required this.resourceOwnerAccount,
    @_s.required this.resourceType,
    @_s.required this.status,
    @_s.required this.updatedAt,
    this.action,
    this.error,
    this.isPublic,
    this.principal,
    this.resource,
    this.sources,
  });
  factory Finding.fromJson(Map<String, dynamic> json) =>
      _$FindingFromJson(json);
}

/// The source of the finding. This indicates how the access that generated the
/// finding is granted. It is populated for Amazon S3 bucket findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FindingSource {
  /// Indicates the type of access that generated the finding.
  @_s.JsonKey(name: 'type')
  final FindingSourceType type;

  /// Includes details about how the access that generated the finding is granted.
  /// This is populated for Amazon S3 bucket findings.
  @_s.JsonKey(name: 'detail')
  final FindingSourceDetail detail;

  FindingSource({
    @_s.required this.type,
    this.detail,
  });
  factory FindingSource.fromJson(Map<String, dynamic> json) =>
      _$FindingSourceFromJson(json);
}

/// Includes details about how the access that generated the finding is granted.
/// This is populated for Amazon S3 bucket findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FindingSourceDetail {
  /// The ARN of the access point that generated the finding.
  @_s.JsonKey(name: 'accessPointArn')
  final String accessPointArn;

  FindingSourceDetail({
    this.accessPointArn,
  });
  factory FindingSourceDetail.fromJson(Map<String, dynamic> json) =>
      _$FindingSourceDetailFromJson(json);
}

enum FindingSourceType {
  @_s.JsonValue('POLICY')
  policy,
  @_s.JsonValue('BUCKET_ACL')
  bucketAcl,
  @_s.JsonValue('S3_ACCESS_POINT')
  s3AccessPoint,
}

enum FindingStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('ARCHIVED')
  archived,
  @_s.JsonValue('RESOLVED')
  resolved,
}

enum FindingStatusUpdate {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('ARCHIVED')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FindingSummary {
  /// The time at which the resource-based policy that generated the finding was
  /// analyzed.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'analyzedAt')
  final DateTime analyzedAt;

  /// The condition in the analyzed policy statement that resulted in a finding.
  @_s.JsonKey(name: 'condition')
  final Map<String, String> condition;

  /// The time at which the finding was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The ID of the finding.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The AWS account ID that owns the resource.
  @_s.JsonKey(name: 'resourceOwnerAccount')
  final String resourceOwnerAccount;

  /// The type of the resource that the external principal has access to.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The status of the finding.
  @_s.JsonKey(name: 'status')
  final FindingStatus status;

  /// The time at which the finding was most recently updated.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  /// The action in the analyzed policy statement that an external principal has
  /// permission to use.
  @_s.JsonKey(name: 'action')
  final List<String> action;

  /// The error that resulted in an Error finding.
  @_s.JsonKey(name: 'error')
  final String error;

  /// Indicates whether the finding reports a resource that has a policy that
  /// allows public access.
  @_s.JsonKey(name: 'isPublic')
  final bool isPublic;

  /// The external principal that has access to a resource within the zone of
  /// trust.
  @_s.JsonKey(name: 'principal')
  final Map<String, String> principal;

  /// The resource that the external principal has access to.
  @_s.JsonKey(name: 'resource')
  final String resource;

  /// The sources of the finding. This indicates how the access that generated the
  /// finding is granted. It is populated for Amazon S3 bucket findings.
  @_s.JsonKey(name: 'sources')
  final List<FindingSource> sources;

  FindingSummary({
    @_s.required this.analyzedAt,
    @_s.required this.condition,
    @_s.required this.createdAt,
    @_s.required this.id,
    @_s.required this.resourceOwnerAccount,
    @_s.required this.resourceType,
    @_s.required this.status,
    @_s.required this.updatedAt,
    this.action,
    this.error,
    this.isPublic,
    this.principal,
    this.resource,
    this.sources,
  });
  factory FindingSummary.fromJson(Map<String, dynamic> json) =>
      _$FindingSummaryFromJson(json);
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAnalyzedResourceResponse {
  /// An <code>AnalyedResource</code> object that contains information that Access
  /// Analyzer found when it analyzed the resource.
  @_s.JsonKey(name: 'resource')
  final AnalyzedResource resource;

  GetAnalyzedResourceResponse({
    this.resource,
  });
  factory GetAnalyzedResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAnalyzedResourceResponseFromJson(json);
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAnalyzerResponse {
  /// An <code>AnalyzerSummary</code> object that contains information about the
  /// analyzer.
  @_s.JsonKey(name: 'analyzer')
  final AnalyzerSummary analyzer;

  GetAnalyzerResponse({
    @_s.required this.analyzer,
  });
  factory GetAnalyzerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAnalyzerResponseFromJson(json);
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetArchiveRuleResponse {
  @_s.JsonKey(name: 'archiveRule')
  final ArchiveRuleSummary archiveRule;

  GetArchiveRuleResponse({
    @_s.required this.archiveRule,
  });
  factory GetArchiveRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetArchiveRuleResponseFromJson(json);
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFindingResponse {
  /// A <code>finding</code> object that contains finding details.
  @_s.JsonKey(name: 'finding')
  final Finding finding;

  GetFindingResponse({
    this.finding,
  });
  factory GetFindingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFindingResponseFromJson(json);
}

/// An criterion statement in an archive rule. Each archive rule may have
/// multiple criteria.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InlineArchiveRule {
  /// The condition and values for a criterion.
  @_s.JsonKey(name: 'filter')
  final Map<String, Criterion> filter;

  /// The name of the rule.
  @_s.JsonKey(name: 'ruleName')
  final String ruleName;

  InlineArchiveRule({
    @_s.required this.filter,
    @_s.required this.ruleName,
  });
  Map<String, dynamic> toJson() => _$InlineArchiveRuleToJson(this);
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAnalyzedResourcesResponse {
  /// A list of resources that were analyzed.
  @_s.JsonKey(name: 'analyzedResources')
  final List<AnalyzedResourceSummary> analyzedResources;

  /// A token used for pagination of results returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAnalyzedResourcesResponse({
    @_s.required this.analyzedResources,
    this.nextToken,
  });
  factory ListAnalyzedResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAnalyzedResourcesResponseFromJson(json);
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAnalyzersResponse {
  /// The analyzers retrieved.
  @_s.JsonKey(name: 'analyzers')
  final List<AnalyzerSummary> analyzers;

  /// A token used for pagination of results returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAnalyzersResponse({
    @_s.required this.analyzers,
    this.nextToken,
  });
  factory ListAnalyzersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAnalyzersResponseFromJson(json);
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListArchiveRulesResponse {
  /// A list of archive rules created for the specified analyzer.
  @_s.JsonKey(name: 'archiveRules')
  final List<ArchiveRuleSummary> archiveRules;

  /// A token used for pagination of results returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListArchiveRulesResponse({
    @_s.required this.archiveRules,
    this.nextToken,
  });
  factory ListArchiveRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListArchiveRulesResponseFromJson(json);
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFindingsResponse {
  /// A list of findings retrieved from the analyzer that match the filter
  /// criteria specified, if any.
  @_s.JsonKey(name: 'findings')
  final List<FindingSummary> findings;

  /// A token used for pagination of results returned.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFindingsResponse({
    @_s.required this.findings,
    this.nextToken,
  });
  factory ListFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFindingsResponseFromJson(json);
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags that are applied to the specified resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

enum OrderBy {
  @_s.JsonValue('ASC')
  asc,
  @_s.JsonValue('DESC')
  desc,
}

enum ReasonCode {
  @_s.JsonValue('AWS_SERVICE_ACCESS_DISABLED')
  awsServiceAccessDisabled,
  @_s.JsonValue('DELEGATED_ADMINISTRATOR_DEREGISTERED')
  delegatedAdministratorDeregistered,
  @_s.JsonValue('ORGANIZATION_DELETED')
  organizationDeleted,
  @_s.JsonValue('SERVICE_LINKED_ROLE_CREATION_FAILED')
  serviceLinkedRoleCreationFailed,
}

enum ResourceType {
  @_s.JsonValue('AWS::S3::Bucket')
  awsS3Bucket,
  @_s.JsonValue('AWS::IAM::Role')
  awsIamRole,
  @_s.JsonValue('AWS::SQS::Queue')
  awsSqsQueue,
  @_s.JsonValue('AWS::Lambda::Function')
  awsLambdaFunction,
  @_s.JsonValue('AWS::Lambda::LayerVersion')
  awsLambdaLayerVersion,
  @_s.JsonValue('AWS::KMS::Key')
  awsKmsKey,
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The criteria used to sort.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SortCriteria {
  /// The name of the attribute to sort on.
  @_s.JsonKey(name: 'attributeName')
  final String attributeName;

  /// The sort order, ascending or descending.
  @_s.JsonKey(name: 'orderBy')
  final OrderBy orderBy;

  SortCriteria({
    this.attributeName,
    this.orderBy,
  });
  Map<String, dynamic> toJson() => _$SortCriteriaToJson(this);
}

/// Provides more details about the current status of the analyzer. For example,
/// if the creation for the analyzer fails, a <code>Failed</code> status is
/// displayed. For an analyzer with organization as the type, this failure can
/// be due to an issue with creating the service-linked roles required in the
/// member accounts of the AWS organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StatusReason {
  /// The reason code for the current status of the analyzer.
  @_s.JsonKey(name: 'code')
  final ReasonCode code;

  StatusReason({
    @_s.required this.code,
  });
  factory StatusReason.fromJson(Map<String, dynamic> json) =>
      _$StatusReasonFromJson(json);
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

enum Type {
  @_s.JsonValue('ACCOUNT')
  account,
  @_s.JsonValue('ORGANIZATION')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The response to the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
