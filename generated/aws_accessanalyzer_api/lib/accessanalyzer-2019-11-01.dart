// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

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
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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
  /// The ARN of the analyzer that generated the finding.
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
}

enum AnalyzerStatus {
  active,
  creating,
  disabled,
  failed,
}

extension AnalyzerStatusValue on AnalyzerStatus {
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

extension AnalyzerStatusFromString on String {
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
  /// for IAM Access Analyzer from AWS Organizations, causes the analyzer to stop
  /// generating new findings. The status is <code>Creating</code> when the
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
  /// <code>Failed</code> status is displayed. For an analyzer with organization
  /// as the type, this failure can be due to an issue with creating the
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

  /// The type of the resource reported in the finding.
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
}

enum FindingSourceType {
  policy,
  bucketAcl,
  s3AccessPoint,
}

extension FindingSourceTypeValue on FindingSourceType {
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

extension FindingSourceTypeFromString on String {
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

extension FindingStatusValue on FindingStatus {
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

extension FindingStatusFromString on String {
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

extension FindingStatusUpdateValue on FindingStatusUpdate {
  String toValue() {
    switch (this) {
      case FindingStatusUpdate.active:
        return 'ACTIVE';
      case FindingStatusUpdate.archived:
        return 'ARCHIVED';
    }
  }
}

extension FindingStatusUpdateFromString on String {
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
}

/// The response to the request.
class GetAnalyzedResourceResponse {
  /// An <code>AnalyedResource</code> object that contains information that Access
  /// Analyzer found when it analyzed the resource.
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
  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final ruleName = this.ruleName;
    return {
      'filter': filter,
      'ruleName': ruleName,
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
}

enum OrderBy {
  asc,
  desc,
}

extension OrderByValue on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.asc:
        return 'ASC';
      case OrderBy.desc:
        return 'DESC';
    }
  }
}

extension OrderByFromString on String {
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

enum ReasonCode {
  awsServiceAccessDisabled,
  delegatedAdministratorDeregistered,
  organizationDeleted,
  serviceLinkedRoleCreationFailed,
}

extension ReasonCodeValue on ReasonCode {
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

extension ReasonCodeFromString on String {
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
}

extension ResourceTypeValue on ResourceType {
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
  }
}

extension ResourceTypeFromString on String {
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
    }
    throw Exception('$this is not known in enum ResourceType');
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
  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName,
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

/// Provides more details about the current status of the analyzer. For example,
/// if the creation for the analyzer fails, a <code>Failed</code> status is
/// displayed. For an analyzer with organization as the type, this failure can
/// be due to an issue with creating the service-linked roles required in the
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
}

/// The response to the request.
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

enum Type {
  account,
  organization,
}

extension TypeValue on Type {
  String toValue() {
    switch (this) {
      case Type.account:
        return 'ACCOUNT';
      case Type.organization:
        return 'ORGANIZATION';
    }
  }
}

extension TypeFromString on String {
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
