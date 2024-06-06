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

/// Identity and Access Management Access Analyzer helps you to set, verify, and
/// refine your IAM policies by providing a suite of capabilities. Its features
/// include findings for external and unused access, basic and custom policy
/// checks for validating policies, and policy generation to generate
/// fine-grained policies. To start using IAM Access Analyzer to identify
/// external or unused access, you first need to create an analyzer.
///
/// <b>External access analyzers</b> help identify potential risks of accessing
/// resources by enabling you to identify any resource policies that grant
/// access to an external principal. It does this by using logic-based reasoning
/// to analyze resource-based policies in your Amazon Web Services environment.
/// An external principal can be another Amazon Web Services account, a root
/// user, an IAM user or role, a federated user, an Amazon Web Services service,
/// or an anonymous user. You can also use IAM Access Analyzer to preview public
/// and cross-account access to your resources before deploying permissions
/// changes.
///
/// <b>Unused access analyzers</b> help identify potential identity access risks
/// by enabling you to identify unused IAM roles, unused access keys, unused
/// console passwords, and IAM principals with unused service and action-level
/// permissions.
///
/// Beyond findings, IAM Access Analyzer provides basic and custom policy checks
/// to validate IAM policies before deploying permissions changes. You can use
/// policy generation to refine permissions by attaching a policy generated
/// using access activity logged in CloudTrail logs.
///
/// This guide describes the IAM Access Analyzer operations that you can call
/// programmatically. For general information about IAM Access Analyzer, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html">Identity
/// and Access Management Access Analyzer</a> in the <b>IAM User Guide</b>.
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
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/policy/generation/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Checks whether the specified access isn't allowed by a policy.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [access] :
  /// An access object containing the permissions that shouldn't be granted by
  /// the specified policy.
  ///
  /// Parameter [policyDocument] :
  /// The JSON policy document to use as the content for the policy.
  ///
  /// Parameter [policyType] :
  /// The type of policy. Identity policies grant permissions to IAM principals.
  /// Identity policies include managed and inline policies for IAM roles,
  /// users, and groups.
  ///
  /// Resource policies grant permissions on Amazon Web Services resources.
  /// Resource policies include trust policies for IAM roles and bucket policies
  /// for Amazon S3 buckets. You can provide a generic input such as identity
  /// policy or resource policy or a specific input such as managed policy or
  /// Amazon S3 bucket policy.
  Future<CheckAccessNotGrantedResponse> checkAccessNotGranted({
    required List<Access> access,
    required String policyDocument,
    required AccessCheckPolicyType policyType,
  }) async {
    final $payload = <String, dynamic>{
      'access': access,
      'policyDocument': policyDocument,
      'policyType': policyType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/policy/check-access-not-granted',
      exceptionFnMap: _exceptionFns,
    );
    return CheckAccessNotGrantedResponse.fromJson(response);
  }

  /// Checks whether new access is allowed for an updated policy when compared
  /// to the existing policy.
  ///
  /// You can find examples for reference policies and learn how to set up and
  /// run a custom policy check for new access in the <a
  /// href="https://github.com/aws-samples/iam-access-analyzer-custom-policy-check-samples">IAM
  /// Access Analyzer custom policy checks samples</a> repository on GitHub. The
  /// reference policies in this repository are meant to be passed to the
  /// <code>existingPolicyDocument</code> request parameter.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [InvalidParameterException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [existingPolicyDocument] :
  /// The JSON policy document to use as the content for the existing policy.
  ///
  /// Parameter [newPolicyDocument] :
  /// The JSON policy document to use as the content for the updated policy.
  ///
  /// Parameter [policyType] :
  /// The type of policy to compare. Identity policies grant permissions to IAM
  /// principals. Identity policies include managed and inline policies for IAM
  /// roles, users, and groups.
  ///
  /// Resource policies grant permissions on Amazon Web Services resources.
  /// Resource policies include trust policies for IAM roles and bucket policies
  /// for Amazon S3 buckets. You can provide a generic input such as identity
  /// policy or resource policy or a specific input such as managed policy or
  /// Amazon S3 bucket policy.
  Future<CheckNoNewAccessResponse> checkNoNewAccess({
    required String existingPolicyDocument,
    required String newPolicyDocument,
    required AccessCheckPolicyType policyType,
  }) async {
    final $payload = <String, dynamic>{
      'existingPolicyDocument': existingPolicyDocument,
      'newPolicyDocument': newPolicyDocument,
      'policyType': policyType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/policy/check-no-new-access',
      exceptionFnMap: _exceptionFns,
    );
    return CheckNoNewAccessResponse.fromJson(response);
  }

  /// Creates an access preview that allows you to preview IAM Access Analyzer
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
  /// The type of analyzer to create. Only <code>ACCOUNT</code>,
  /// <code>ORGANIZATION</code>, <code>ACCOUNT_UNUSED_ACCESS</code>, and
  /// <code>ORGANIZATION_UNUSED_ACCESS</code> analyzers are supported. You can
  /// create only one analyzer per account per Region. You can create up to 5
  /// analyzers per organization per Region.
  ///
  /// Parameter [archiveRules] :
  /// Specifies the archive rules to add for the analyzer. Archive rules
  /// automatically archive findings that meet the criteria you define for the
  /// rule.
  ///
  /// Parameter [clientToken] :
  /// A client token.
  ///
  /// Parameter [configuration] :
  /// Specifies the configuration of the analyzer. If the analyzer is an unused
  /// access analyzer, the specified scope of unused access is used for the
  /// configuration. If the analyzer is an external access analyzer, this field
  /// is not used.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs to apply to the analyzer.
  Future<CreateAnalyzerResponse> createAnalyzer({
    required String analyzerName,
    required Type type,
    List<InlineArchiveRule>? archiveRules,
    String? clientToken,
    AnalyzerConfiguration? configuration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'analyzerName': analyzerName,
      'type': type.toValue(),
      if (archiveRules != null) 'archiveRules': archiveRules,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (configuration != null) 'configuration': configuration,
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
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-reference-filter-keys.html">IAM
  /// Access Analyzer filter keys</a> in the <b>IAM User Guide</b>.
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

  /// Deletes the specified analyzer. When you delete an analyzer, IAM Access
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
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-reference-filter-keys.html">IAM
  /// Access Analyzer filter keys</a> in the <b>IAM User Guide</b>.
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/analyzer/${Uri.encodeComponent(analyzerName)}/archive-rule/${Uri.encodeComponent(ruleName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetArchiveRuleResponse.fromJson(response);
  }

  /// Retrieves information about the specified finding. GetFinding and
  /// GetFindingV2 both use <code>access-analyzer:GetFinding</code> in the
  /// <code>Action</code> element of an IAM policy statement. You must have
  /// permission to perform the <code>access-analyzer:GetFinding</code> action.
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

  /// Retrieves information about the specified finding. GetFinding and
  /// GetFindingV2 both use <code>access-analyzer:GetFinding</code> in the
  /// <code>Action</code> element of an IAM policy statement. You must have
  /// permission to perform the <code>access-analyzer:GetFinding</code> action.
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
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned.
  Future<GetFindingV2Response> getFindingV2({
    required String analyzerArn,
    required String id,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'analyzerArn': [analyzerArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/findingv2/${Uri.encodeComponent(id)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingV2Response.fromJson(response);
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
  /// IAM Access Analyzer uses <code>iam:servicelastaccessed</code> to identify
  /// services that have been used recently to create this service-level
  /// template.
  Future<GetGeneratedPolicyResponse> getGeneratedPolicy({
    required String jobId,
    bool? includeResourcePlaceholders,
    bool? includeServiceLevelTemplate,
  }) async {
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
  /// analyzed by the specified external access analyzer. This action is not
  /// supported for unused access analyzers.
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
  /// ListFindings and ListFindingsV2 both use
  /// <code>access-analyzer:ListFindings</code> in the <code>Action</code>
  /// element of an IAM policy statement. You must have permission to perform
  /// the <code>access-analyzer:ListFindings</code> action.
  ///
  /// To learn about filter keys that you can use to retrieve a list of
  /// findings, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-reference-filter-keys.html">IAM
  /// Access Analyzer filter keys</a> in the <b>IAM User Guide</b>.
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

  /// Retrieves a list of findings generated by the specified analyzer.
  /// ListFindings and ListFindingsV2 both use
  /// <code>access-analyzer:ListFindings</code> in the <code>Action</code>
  /// element of an IAM policy statement. You must have permission to perform
  /// the <code>access-analyzer:ListFindings</code> action.
  ///
  /// To learn about filter keys that you can use to retrieve a list of
  /// findings, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-reference-filter-keys.html">IAM
  /// Access Analyzer filter keys</a> in the <b>IAM User Guide</b>.
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
  Future<ListFindingsV2Response> listFindingsV2({
    required String analyzerArn,
    Map<String, Criterion>? filter,
    int? maxResults,
    String? nextToken,
    SortCriteria? sort,
  }) async {
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
      requestUri: '/findingv2',
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingsV2Response.fromJson(response);
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
  /// the Amazon Web Services SDK.
  ///
  /// Parameter [cloudTrailDetails] :
  /// A <code>CloudTrailDetails</code> object that contains details about a
  /// <code>Trail</code> that you want to analyze to generate policies.
  Future<StartPolicyGenerationResponse> startPolicyGeneration({
    required PolicyGenerationDetails policyGenerationDetails,
    String? clientToken,
    CloudTrailDetails? cloudTrailDetails,
  }) async {
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
  ///
  /// Parameter [resourceOwnerAccount] :
  /// The Amazon Web Services account ID that owns the resource. For most Amazon
  /// Web Services resources, the owning account is the account in which the
  /// resource was created.
  Future<void> startResourceScan({
    required String analyzerArn,
    required String resourceArn,
    String? resourceOwnerAccount,
  }) async {
    final $payload = <String, dynamic>{
      'analyzerArn': analyzerArn,
      'resourceArn': resourceArn,
      if (resourceOwnerAccount != null)
        'resourceOwnerAccount': resourceOwnerAccount,
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
  /// roles, users, and groups.
  ///
  /// Resource policies grant permissions on Amazon Web Services resources.
  /// Resource policies include trust policies for IAM roles and bucket policies
  /// for Amazon S3 buckets. You can provide a generic input such as identity
  /// policy or resource policy or a specific input such as managed policy or
  /// Amazon S3 bucket policy.
  ///
  /// Service control policies (SCPs) are a type of organization policy attached
  /// to an Amazon Web Services organization, organizational unit (OU), or an
  /// account.
  ///
  /// Parameter [locale] :
  /// The locale to use for localizing the findings.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination of results returned.
  ///
  /// Parameter [validatePolicyResourceType] :
  /// The type of resource to attach to your resource policy. Specify a value
  /// for the policy validation resource type only if the policy type is
  /// <code>RESOURCE_POLICY</code>. For example, to validate a resource policy
  /// to attach to an Amazon S3 bucket, you can choose
  /// <code>AWS::S3::Bucket</code> for the policy validation resource type.
  ///
  /// For resource types not supported as valid values, IAM Access Analyzer runs
  /// policy checks that apply to all resource policies. For example, to
  /// validate a resource policy to attach to a KMS key, do not specify a value
  /// for the policy validation resource type and IAM Access Analyzer will run
  /// policy checks that apply to all resource policies.
  Future<ValidatePolicyResponse> validatePolicy({
    required String policyDocument,
    required PolicyType policyType,
    Locale? locale,
    int? maxResults,
    String? nextToken,
    ValidatePolicyResourceType? validatePolicyResourceType,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'policyDocument': policyDocument,
      'policyType': policyType.toValue(),
      if (locale != null) 'locale': locale.toValue(),
      if (validatePolicyResourceType != null)
        'validatePolicyResourceType': validatePolicyResourceType.toValue(),
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

/// Contains information about actions that define permissions to check against
/// a policy.
class Access {
  /// A list of actions for the access permissions. Any strings that can be used
  /// as an action in an IAM policy can be used in the list of actions to check.
  final List<String> actions;

  Access({
    required this.actions,
  });

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    return {
      'actions': actions,
    };
  }
}

enum AccessCheckPolicyType {
  identityPolicy,
  resourcePolicy,
}

extension AccessCheckPolicyTypeValueExtension on AccessCheckPolicyType {
  String toValue() {
    switch (this) {
      case AccessCheckPolicyType.identityPolicy:
        return 'IDENTITY_POLICY';
      case AccessCheckPolicyType.resourcePolicy:
        return 'RESOURCE_POLICY';
    }
  }
}

extension AccessCheckPolicyTypeFromString on String {
  AccessCheckPolicyType toAccessCheckPolicyType() {
    switch (this) {
      case 'IDENTITY_POLICY':
        return AccessCheckPolicyType.identityPolicy;
      case 'RESOURCE_POLICY':
        return AccessCheckPolicyType.resourcePolicy;
    }
    throw Exception('$this is not known in enum AccessCheckPolicyType');
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
  /// access identified in IAM Access Analyzer.
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

  /// The Amazon Web Services account ID that owns the resource. For most Amazon
  /// Web Services resources, the owning account is the account in which the
  /// resource was created.
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

  /// The existing ID of the finding in IAM Access Analyzer, provided only for
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

extension AccessPreviewStatusValueExtension on AccessPreviewStatus {
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

extension AccessPreviewStatusFromString on String {
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

extension AccessPreviewStatusReasonCodeValueExtension
    on AccessPreviewStatusReasonCode {
  String toValue() {
    switch (this) {
      case AccessPreviewStatusReasonCode.internalError:
        return 'INTERNAL_ERROR';
      case AccessPreviewStatusReasonCode.invalidConfiguration:
        return 'INVALID_CONFIGURATION';
    }
  }
}

extension AccessPreviewStatusReasonCodeFromString on String {
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
  /// The value specified is the canonical user ID of an Amazon Web Services
  /// account.
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

extension AclPermissionValueExtension on AclPermission {
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

extension AclPermissionFromString on String {
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

  /// The Amazon Web Services account ID that owns the resource.
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

  /// The Amazon Web Services account ID that owns the resource.
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

/// Contains information about the configuration of an unused access analyzer
/// for an Amazon Web Services organization or account.
class AnalyzerConfiguration {
  /// Specifies the configuration of an unused access analyzer for an Amazon Web
  /// Services organization or account. External access analyzers do not support
  /// any configuration.
  final UnusedAccessConfiguration? unusedAccess;

  AnalyzerConfiguration({
    this.unusedAccess,
  });

  factory AnalyzerConfiguration.fromJson(Map<String, dynamic> json) {
    return AnalyzerConfiguration(
      unusedAccess: json['unusedAccess'] != null
          ? UnusedAccessConfiguration.fromJson(
              json['unusedAccess'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final unusedAccess = this.unusedAccess;
    return {
      if (unusedAccess != null) 'unusedAccess': unusedAccess,
    };
  }
}

enum AnalyzerStatus {
  active,
  creating,
  disabled,
  failed,
}

extension AnalyzerStatusValueExtension on AnalyzerStatus {
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
  /// for Identity and Access Management Access Analyzer from Organizations,
  /// causes the analyzer to stop generating new findings. The status is
  /// <code>Creating</code> when the analyzer creation is in progress and
  /// <code>Failed</code> when the analyzer creation has failed.
  final AnalyzerStatus status;

  /// The type of analyzer, which corresponds to the zone of trust chosen for the
  /// analyzer.
  final Type type;

  /// Specifies whether the analyzer is an external access or unused access
  /// analyzer.
  final AnalyzerConfiguration? configuration;

  /// The resource that was most recently analyzed by the analyzer.
  final String? lastResourceAnalyzed;

  /// The time at which the most recently analyzed resource was analyzed.
  final DateTime? lastResourceAnalyzedAt;

  /// The <code>statusReason</code> provides more details about the current status
  /// of the analyzer. For example, if the creation for the analyzer fails, a
  /// <code>Failed</code> status is returned. For an analyzer with organization as
  /// the type, this failure can be due to an issue with creating the
  /// service-linked roles required in the member accounts of the Amazon Web
  /// Services organization.
  final StatusReason? statusReason;

  /// The tags added to the analyzer.
  final Map<String, String>? tags;

  AnalyzerSummary({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.status,
    required this.type,
    this.configuration,
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
      configuration: json['configuration'] != null
          ? AnalyzerConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
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
    final configuration = this.configuration;
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
      if (configuration != null) 'configuration': configuration,
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

class CheckAccessNotGrantedResponse {
  /// The message indicating whether the specified access is allowed.
  final String? message;

  /// A description of the reasoning of the result.
  final List<ReasonSummary>? reasons;

  /// The result of the check for whether the access is allowed. If the result is
  /// <code>PASS</code>, the specified policy doesn't allow any of the specified
  /// permissions in the access object. If the result is <code>FAIL</code>, the
  /// specified policy might allow some or all of the permissions in the access
  /// object.
  final CheckAccessNotGrantedResult? result;

  CheckAccessNotGrantedResponse({
    this.message,
    this.reasons,
    this.result,
  });

  factory CheckAccessNotGrantedResponse.fromJson(Map<String, dynamic> json) {
    return CheckAccessNotGrantedResponse(
      message: json['message'] as String?,
      reasons: (json['reasons'] as List?)
          ?.whereNotNull()
          .map((e) => ReasonSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      result: (json['result'] as String?)?.toCheckAccessNotGrantedResult(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final reasons = this.reasons;
    final result = this.result;
    return {
      if (message != null) 'message': message,
      if (reasons != null) 'reasons': reasons,
      if (result != null) 'result': result.toValue(),
    };
  }
}

enum CheckAccessNotGrantedResult {
  pass,
  fail,
}

extension CheckAccessNotGrantedResultValueExtension
    on CheckAccessNotGrantedResult {
  String toValue() {
    switch (this) {
      case CheckAccessNotGrantedResult.pass:
        return 'PASS';
      case CheckAccessNotGrantedResult.fail:
        return 'FAIL';
    }
  }
}

extension CheckAccessNotGrantedResultFromString on String {
  CheckAccessNotGrantedResult toCheckAccessNotGrantedResult() {
    switch (this) {
      case 'PASS':
        return CheckAccessNotGrantedResult.pass;
      case 'FAIL':
        return CheckAccessNotGrantedResult.fail;
    }
    throw Exception('$this is not known in enum CheckAccessNotGrantedResult');
  }
}

class CheckNoNewAccessResponse {
  /// The message indicating whether the updated policy allows new access.
  final String? message;

  /// A description of the reasoning of the result.
  final List<ReasonSummary>? reasons;

  /// The result of the check for new access. If the result is <code>PASS</code>,
  /// no new access is allowed by the updated policy. If the result is
  /// <code>FAIL</code>, the updated policy might allow new access.
  final CheckNoNewAccessResult? result;

  CheckNoNewAccessResponse({
    this.message,
    this.reasons,
    this.result,
  });

  factory CheckNoNewAccessResponse.fromJson(Map<String, dynamic> json) {
    return CheckNoNewAccessResponse(
      message: json['message'] as String?,
      reasons: (json['reasons'] as List?)
          ?.whereNotNull()
          .map((e) => ReasonSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      result: (json['result'] as String?)?.toCheckNoNewAccessResult(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final reasons = this.reasons;
    final result = this.result;
    return {
      if (message != null) 'message': message,
      if (reasons != null) 'reasons': reasons,
      if (result != null) 'result': result.toValue(),
    };
  }
}

enum CheckNoNewAccessResult {
  pass,
  fail,
}

extension CheckNoNewAccessResultValueExtension on CheckNoNewAccessResult {
  String toValue() {
    switch (this) {
      case CheckNoNewAccessResult.pass:
        return 'PASS';
      case CheckNoNewAccessResult.fail:
        return 'FAIL';
    }
  }
}

extension CheckNoNewAccessResultFromString on String {
  CheckNoNewAccessResult toCheckNoNewAccessResult() {
    switch (this) {
      case 'PASS':
        return CheckNoNewAccessResult.pass;
      case 'FAIL':
        return CheckNoNewAccessResult.fail;
    }
    throw Exception('$this is not known in enum CheckNoNewAccessResult');
  }
}

/// Contains information about CloudTrail access.
class CloudTrailDetails {
  /// The ARN of the service role that IAM Access Analyzer uses to access your
  /// CloudTrail trail and service last accessed information.
  final String accessRole;

  /// The start of the time range for which IAM Access Analyzer reviews your
  /// CloudTrail events. Events with a timestamp before this time are not
  /// considered to generate a policy.
  final DateTime startTime;

  /// A <code>Trail</code> object that contains settings for a trail.
  final List<Trail> trails;

  /// The end of the time range for which IAM Access Analyzer reviews your
  /// CloudTrail events. Events with a timestamp after this time are not
  /// considered to generate a policy. If this is not included in the request, the
  /// default value is the current time.
  final DateTime? endTime;

  CloudTrailDetails({
    required this.accessRole,
    required this.startTime,
    required this.trails,
    this.endTime,
  });

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
  /// The end of the time range for which IAM Access Analyzer reviews your
  /// CloudTrail events. Events with a timestamp after this time are not
  /// considered to generate a policy. If this is not included in the request, the
  /// default value is the current time.
  final DateTime endTime;

  /// The start of the time range for which IAM Access Analyzer reviews your
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
  /// The access control configuration is for a DynamoDB stream.
  final DynamodbStreamConfiguration? dynamodbStream;

  /// The access control configuration is for a DynamoDB table or index.
  final DynamodbTableConfiguration? dynamodbTable;

  /// The access control configuration is for an Amazon EBS volume snapshot.
  final EbsSnapshotConfiguration? ebsSnapshot;

  /// The access control configuration is for an Amazon ECR repository.
  final EcrRepositoryConfiguration? ecrRepository;

  /// The access control configuration is for an Amazon EFS file system.
  final EfsFileSystemConfiguration? efsFileSystem;

  /// The access control configuration is for an IAM role.
  final IamRoleConfiguration? iamRole;

  /// The access control configuration is for a KMS key.
  final KmsKeyConfiguration? kmsKey;

  /// The access control configuration is for an Amazon RDS DB cluster snapshot.
  final RdsDbClusterSnapshotConfiguration? rdsDbClusterSnapshot;

  /// The access control configuration is for an Amazon RDS DB snapshot.
  final RdsDbSnapshotConfiguration? rdsDbSnapshot;

  /// The access control configuration is for an Amazon S3 bucket.
  final S3BucketConfiguration? s3Bucket;

  /// The access control configuration is for an Amazon S3 directory bucket.
  final S3ExpressDirectoryBucketConfiguration? s3ExpressDirectoryBucket;

  /// The access control configuration is for a Secrets Manager secret.
  final SecretsManagerSecretConfiguration? secretsManagerSecret;

  /// The access control configuration is for an Amazon SNS topic
  final SnsTopicConfiguration? snsTopic;

  /// The access control configuration is for an Amazon SQS queue.
  final SqsQueueConfiguration? sqsQueue;

  Configuration({
    this.dynamodbStream,
    this.dynamodbTable,
    this.ebsSnapshot,
    this.ecrRepository,
    this.efsFileSystem,
    this.iamRole,
    this.kmsKey,
    this.rdsDbClusterSnapshot,
    this.rdsDbSnapshot,
    this.s3Bucket,
    this.s3ExpressDirectoryBucket,
    this.secretsManagerSecret,
    this.snsTopic,
    this.sqsQueue,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      dynamodbStream: json['dynamodbStream'] != null
          ? DynamodbStreamConfiguration.fromJson(
              json['dynamodbStream'] as Map<String, dynamic>)
          : null,
      dynamodbTable: json['dynamodbTable'] != null
          ? DynamodbTableConfiguration.fromJson(
              json['dynamodbTable'] as Map<String, dynamic>)
          : null,
      ebsSnapshot: json['ebsSnapshot'] != null
          ? EbsSnapshotConfiguration.fromJson(
              json['ebsSnapshot'] as Map<String, dynamic>)
          : null,
      ecrRepository: json['ecrRepository'] != null
          ? EcrRepositoryConfiguration.fromJson(
              json['ecrRepository'] as Map<String, dynamic>)
          : null,
      efsFileSystem: json['efsFileSystem'] != null
          ? EfsFileSystemConfiguration.fromJson(
              json['efsFileSystem'] as Map<String, dynamic>)
          : null,
      iamRole: json['iamRole'] != null
          ? IamRoleConfiguration.fromJson(
              json['iamRole'] as Map<String, dynamic>)
          : null,
      kmsKey: json['kmsKey'] != null
          ? KmsKeyConfiguration.fromJson(json['kmsKey'] as Map<String, dynamic>)
          : null,
      rdsDbClusterSnapshot: json['rdsDbClusterSnapshot'] != null
          ? RdsDbClusterSnapshotConfiguration.fromJson(
              json['rdsDbClusterSnapshot'] as Map<String, dynamic>)
          : null,
      rdsDbSnapshot: json['rdsDbSnapshot'] != null
          ? RdsDbSnapshotConfiguration.fromJson(
              json['rdsDbSnapshot'] as Map<String, dynamic>)
          : null,
      s3Bucket: json['s3Bucket'] != null
          ? S3BucketConfiguration.fromJson(
              json['s3Bucket'] as Map<String, dynamic>)
          : null,
      s3ExpressDirectoryBucket: json['s3ExpressDirectoryBucket'] != null
          ? S3ExpressDirectoryBucketConfiguration.fromJson(
              json['s3ExpressDirectoryBucket'] as Map<String, dynamic>)
          : null,
      secretsManagerSecret: json['secretsManagerSecret'] != null
          ? SecretsManagerSecretConfiguration.fromJson(
              json['secretsManagerSecret'] as Map<String, dynamic>)
          : null,
      snsTopic: json['snsTopic'] != null
          ? SnsTopicConfiguration.fromJson(
              json['snsTopic'] as Map<String, dynamic>)
          : null,
      sqsQueue: json['sqsQueue'] != null
          ? SqsQueueConfiguration.fromJson(
              json['sqsQueue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dynamodbStream = this.dynamodbStream;
    final dynamodbTable = this.dynamodbTable;
    final ebsSnapshot = this.ebsSnapshot;
    final ecrRepository = this.ecrRepository;
    final efsFileSystem = this.efsFileSystem;
    final iamRole = this.iamRole;
    final kmsKey = this.kmsKey;
    final rdsDbClusterSnapshot = this.rdsDbClusterSnapshot;
    final rdsDbSnapshot = this.rdsDbSnapshot;
    final s3Bucket = this.s3Bucket;
    final s3ExpressDirectoryBucket = this.s3ExpressDirectoryBucket;
    final secretsManagerSecret = this.secretsManagerSecret;
    final snsTopic = this.snsTopic;
    final sqsQueue = this.sqsQueue;
    return {
      if (dynamodbStream != null) 'dynamodbStream': dynamodbStream,
      if (dynamodbTable != null) 'dynamodbTable': dynamodbTable,
      if (ebsSnapshot != null) 'ebsSnapshot': ebsSnapshot,
      if (ecrRepository != null) 'ecrRepository': ecrRepository,
      if (efsFileSystem != null) 'efsFileSystem': efsFileSystem,
      if (iamRole != null) 'iamRole': iamRole,
      if (kmsKey != null) 'kmsKey': kmsKey,
      if (rdsDbClusterSnapshot != null)
        'rdsDbClusterSnapshot': rdsDbClusterSnapshot,
      if (rdsDbSnapshot != null) 'rdsDbSnapshot': rdsDbSnapshot,
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3ExpressDirectoryBucket != null)
        's3ExpressDirectoryBucket': s3ExpressDirectoryBucket,
      if (secretsManagerSecret != null)
        'secretsManagerSecret': secretsManagerSecret,
      if (snsTopic != null) 'snsTopic': snsTopic,
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

/// The criteria to use in the filter that defines the archive rule. For more
/// information on available filter keys, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access-analyzer-reference-filter-keys.html">IAM
/// Access Analyzer filter keys</a>.
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

/// The proposed access control configuration for a DynamoDB stream. You can
/// propose a configuration for a new DynamoDB stream or an existing DynamoDB
/// stream that you own by specifying the policy for the DynamoDB stream. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_PutResourcePolicy.html">PutResourcePolicy</a>.
///
/// <ul>
/// <li>
/// If the configuration is for an existing DynamoDB stream and you do not
/// specify the DynamoDB policy, then the access preview uses the existing
/// DynamoDB policy for the stream.
/// </li>
/// <li>
/// If the access preview is for a new resource and you do not specify the
/// policy, then the access preview assumes a DynamoDB stream without a policy.
/// </li>
/// <li>
/// To propose deletion of an existing DynamoDB stream policy, you can specify
/// an empty string for the DynamoDB policy.
/// </li>
/// </ul>
class DynamodbStreamConfiguration {
  /// The proposed resource policy defining who can access or manage the DynamoDB
  /// stream.
  final String? streamPolicy;

  DynamodbStreamConfiguration({
    this.streamPolicy,
  });

  factory DynamodbStreamConfiguration.fromJson(Map<String, dynamic> json) {
    return DynamodbStreamConfiguration(
      streamPolicy: json['streamPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamPolicy = this.streamPolicy;
    return {
      if (streamPolicy != null) 'streamPolicy': streamPolicy,
    };
  }
}

/// The proposed access control configuration for a DynamoDB table or index. You
/// can propose a configuration for a new DynamoDB table or index or an existing
/// DynamoDB table or index that you own by specifying the policy for the
/// DynamoDB table or index. For more information, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_PutResourcePolicy.html">PutResourcePolicy</a>.
///
/// <ul>
/// <li>
/// If the configuration is for an existing DynamoDB table or index and you do
/// not specify the DynamoDB policy, then the access preview uses the existing
/// DynamoDB policy for the table or index.
/// </li>
/// <li>
/// If the access preview is for a new resource and you do not specify the
/// policy, then the access preview assumes a DynamoDB table without a policy.
/// </li>
/// <li>
/// To propose deletion of an existing DynamoDB table or index policy, you can
/// specify an empty string for the DynamoDB policy.
/// </li>
/// </ul>
class DynamodbTableConfiguration {
  /// The proposed resource policy defining who can access or manage the DynamoDB
  /// table.
  final String? tablePolicy;

  DynamodbTableConfiguration({
    this.tablePolicy,
  });

  factory DynamodbTableConfiguration.fromJson(Map<String, dynamic> json) {
    return DynamodbTableConfiguration(
      tablePolicy: json['tablePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tablePolicy = this.tablePolicy;
    return {
      if (tablePolicy != null) 'tablePolicy': tablePolicy,
    };
  }
}

/// The proposed access control configuration for an Amazon EBS volume snapshot.
/// You can propose a configuration for a new Amazon EBS volume snapshot or an
/// Amazon EBS volume snapshot that you own by specifying the user IDs, groups,
/// and optional KMS encryption key. For more information, see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifySnapshotAttribute.html">ModifySnapshotAttribute</a>.
class EbsSnapshotConfiguration {
  /// The groups that have access to the Amazon EBS volume snapshot. If the value
  /// <code>all</code> is specified, then the Amazon EBS volume snapshot is
  /// public.
  ///
  /// <ul>
  /// <li>
  /// If the configuration is for an existing Amazon EBS volume snapshot and you
  /// do not specify the <code>groups</code>, then the access preview uses the
  /// existing shared <code>groups</code> for the snapshot.
  /// </li>
  /// <li>
  /// If the access preview is for a new resource and you do not specify the
  /// <code>groups</code>, then the access preview considers the snapshot without
  /// any <code>groups</code>.
  /// </li>
  /// <li>
  /// To propose deletion of existing shared <code>groups</code>, you can specify
  /// an empty list for <code>groups</code>.
  /// </li>
  /// </ul>
  final List<String>? groups;

  /// The KMS key identifier for an encrypted Amazon EBS volume snapshot. The KMS
  /// key identifier is the key ARN, key ID, alias ARN, or alias name for the KMS
  /// key.
  ///
  /// <ul>
  /// <li>
  /// If the configuration is for an existing Amazon EBS volume snapshot and you
  /// do not specify the <code>kmsKeyId</code>, or you specify an empty string,
  /// then the access preview uses the existing <code>kmsKeyId</code> of the
  /// snapshot.
  /// </li>
  /// <li>
  /// If the access preview is for a new resource and you do not specify the
  /// <code>kmsKeyId</code>, the access preview considers the snapshot as
  /// unencrypted.
  /// </li>
  /// </ul>
  final String? kmsKeyId;

  /// The IDs of the Amazon Web Services accounts that have access to the Amazon
  /// EBS volume snapshot.
  ///
  /// <ul>
  /// <li>
  /// If the configuration is for an existing Amazon EBS volume snapshot and you
  /// do not specify the <code>userIds</code>, then the access preview uses the
  /// existing shared <code>userIds</code> for the snapshot.
  /// </li>
  /// <li>
  /// If the access preview is for a new resource and you do not specify the
  /// <code>userIds</code>, then the access preview considers the snapshot without
  /// any <code>userIds</code>.
  /// </li>
  /// <li>
  /// To propose deletion of existing shared <code>accountIds</code>, you can
  /// specify an empty list for <code>userIds</code>.
  /// </li>
  /// </ul>
  final List<String>? userIds;

  EbsSnapshotConfiguration({
    this.groups,
    this.kmsKeyId,
    this.userIds,
  });

  factory EbsSnapshotConfiguration.fromJson(Map<String, dynamic> json) {
    return EbsSnapshotConfiguration(
      groups: (json['groups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      kmsKeyId: json['kmsKeyId'] as String?,
      userIds: (json['userIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final kmsKeyId = this.kmsKeyId;
    final userIds = this.userIds;
    return {
      if (groups != null) 'groups': groups,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (userIds != null) 'userIds': userIds,
    };
  }
}

/// The proposed access control configuration for an Amazon ECR repository. You
/// can propose a configuration for a new Amazon ECR repository or an existing
/// Amazon ECR repository that you own by specifying the Amazon ECR policy. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECR/latest/APIReference/API_Repository.html">Repository</a>.
///
/// <ul>
/// <li>
/// If the configuration is for an existing Amazon ECR repository and you do not
/// specify the Amazon ECR policy, then the access preview uses the existing
/// Amazon ECR policy for the repository.
/// </li>
/// <li>
/// If the access preview is for a new resource and you do not specify the
/// policy, then the access preview assumes an Amazon ECR repository without a
/// policy.
/// </li>
/// <li>
/// To propose deletion of an existing Amazon ECR repository policy, you can
/// specify an empty string for the Amazon ECR policy.
/// </li>
/// </ul>
class EcrRepositoryConfiguration {
  /// The JSON repository policy text to apply to the Amazon ECR repository. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policy-examples.html">Private
  /// repository policy examples</a> in the <i>Amazon ECR User Guide</i>.
  final String? repositoryPolicy;

  EcrRepositoryConfiguration({
    this.repositoryPolicy,
  });

  factory EcrRepositoryConfiguration.fromJson(Map<String, dynamic> json) {
    return EcrRepositoryConfiguration(
      repositoryPolicy: json['repositoryPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryPolicy = this.repositoryPolicy;
    return {
      if (repositoryPolicy != null) 'repositoryPolicy': repositoryPolicy,
    };
  }
}

/// The proposed access control configuration for an Amazon EFS file system. You
/// can propose a configuration for a new Amazon EFS file system or an existing
/// Amazon EFS file system that you own by specifying the Amazon EFS policy. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/efs/latest/ug/using-fs.html">Using file
/// systems in Amazon EFS</a>.
///
/// <ul>
/// <li>
/// If the configuration is for an existing Amazon EFS file system and you do
/// not specify the Amazon EFS policy, then the access preview uses the existing
/// Amazon EFS policy for the file system.
/// </li>
/// <li>
/// If the access preview is for a new resource and you do not specify the
/// policy, then the access preview assumes an Amazon EFS file system without a
/// policy.
/// </li>
/// <li>
/// To propose deletion of an existing Amazon EFS file system policy, you can
/// specify an empty string for the Amazon EFS policy.
/// </li>
/// </ul>
class EfsFileSystemConfiguration {
  /// The JSON policy definition to apply to the Amazon EFS file system. For more
  /// information on the elements that make up a file system policy, see <a
  /// href="https://docs.aws.amazon.com/efs/latest/ug/access-control-overview.html#access-control-manage-access-intro-resource-policies">Amazon
  /// EFS Resource-based policies</a>.
  final String? fileSystemPolicy;

  EfsFileSystemConfiguration({
    this.fileSystemPolicy,
  });

  factory EfsFileSystemConfiguration.fromJson(Map<String, dynamic> json) {
    return EfsFileSystemConfiguration(
      fileSystemPolicy: json['fileSystemPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemPolicy = this.fileSystemPolicy;
    return {
      if (fileSystemPolicy != null) 'fileSystemPolicy': fileSystemPolicy,
    };
  }
}

/// Contains information about an external access finding.
class ExternalAccessDetails {
  /// The condition in the analyzed policy statement that resulted in an external
  /// access finding.
  final Map<String, String> condition;

  /// The action in the analyzed policy statement that an external principal has
  /// permission to use.
  final List<String>? action;

  /// Specifies whether the external access finding is public.
  final bool? isPublic;

  /// The external principal that has access to a resource within the zone of
  /// trust.
  final Map<String, String>? principal;

  /// The sources of the external access finding. This indicates how the access
  /// that generated the finding is granted. It is populated for Amazon S3 bucket
  /// findings.
  final List<FindingSource>? sources;

  ExternalAccessDetails({
    required this.condition,
    this.action,
    this.isPublic,
    this.principal,
    this.sources,
  });

  factory ExternalAccessDetails.fromJson(Map<String, dynamic> json) {
    return ExternalAccessDetails(
      condition: (json['condition'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      action: (json['action'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      isPublic: json['isPublic'] as bool?,
      principal: (json['principal'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => FindingSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final action = this.action;
    final isPublic = this.isPublic;
    final principal = this.principal;
    final sources = this.sources;
    return {
      'condition': condition,
      if (action != null) 'action': action,
      if (isPublic != null) 'isPublic': isPublic,
      if (principal != null) 'principal': principal,
      if (sources != null) 'sources': sources,
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

  /// The Amazon Web Services account ID that owns the resource.
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

  /// The external principal that has access to a resource within the zone of
  /// trust.
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

extension FindingChangeTypeValueExtension on FindingChangeType {
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

extension FindingChangeTypeFromString on String {
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

/// Contains information about an external access or unused access finding. Only
/// one parameter can be used in a <code>FindingDetails</code> object.
class FindingDetails {
  /// The details for an external access analyzer finding.
  final ExternalAccessDetails? externalAccessDetails;

  /// The details for an unused access analyzer finding with an unused IAM role
  /// finding type.
  final UnusedIamRoleDetails? unusedIamRoleDetails;

  /// The details for an unused access analyzer finding with an unused IAM user
  /// access key finding type.
  final UnusedIamUserAccessKeyDetails? unusedIamUserAccessKeyDetails;

  /// The details for an unused access analyzer finding with an unused IAM user
  /// password finding type.
  final UnusedIamUserPasswordDetails? unusedIamUserPasswordDetails;

  /// The details for an unused access analyzer finding with an unused permission
  /// finding type.
  final UnusedPermissionDetails? unusedPermissionDetails;

  FindingDetails({
    this.externalAccessDetails,
    this.unusedIamRoleDetails,
    this.unusedIamUserAccessKeyDetails,
    this.unusedIamUserPasswordDetails,
    this.unusedPermissionDetails,
  });

  factory FindingDetails.fromJson(Map<String, dynamic> json) {
    return FindingDetails(
      externalAccessDetails: json['externalAccessDetails'] != null
          ? ExternalAccessDetails.fromJson(
              json['externalAccessDetails'] as Map<String, dynamic>)
          : null,
      unusedIamRoleDetails: json['unusedIamRoleDetails'] != null
          ? UnusedIamRoleDetails.fromJson(
              json['unusedIamRoleDetails'] as Map<String, dynamic>)
          : null,
      unusedIamUserAccessKeyDetails:
          json['unusedIamUserAccessKeyDetails'] != null
              ? UnusedIamUserAccessKeyDetails.fromJson(
                  json['unusedIamUserAccessKeyDetails'] as Map<String, dynamic>)
              : null,
      unusedIamUserPasswordDetails: json['unusedIamUserPasswordDetails'] != null
          ? UnusedIamUserPasswordDetails.fromJson(
              json['unusedIamUserPasswordDetails'] as Map<String, dynamic>)
          : null,
      unusedPermissionDetails: json['unusedPermissionDetails'] != null
          ? UnusedPermissionDetails.fromJson(
              json['unusedPermissionDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final externalAccessDetails = this.externalAccessDetails;
    final unusedIamRoleDetails = this.unusedIamRoleDetails;
    final unusedIamUserAccessKeyDetails = this.unusedIamUserAccessKeyDetails;
    final unusedIamUserPasswordDetails = this.unusedIamUserPasswordDetails;
    final unusedPermissionDetails = this.unusedPermissionDetails;
    return {
      if (externalAccessDetails != null)
        'externalAccessDetails': externalAccessDetails,
      if (unusedIamRoleDetails != null)
        'unusedIamRoleDetails': unusedIamRoleDetails,
      if (unusedIamUserAccessKeyDetails != null)
        'unusedIamUserAccessKeyDetails': unusedIamUserAccessKeyDetails,
      if (unusedIamUserPasswordDetails != null)
        'unusedIamUserPasswordDetails': unusedIamUserPasswordDetails,
      if (unusedPermissionDetails != null)
        'unusedPermissionDetails': unusedPermissionDetails,
    };
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
  /// The account of the cross-account access point that generated the finding.
  final String? accessPointAccount;

  /// The ARN of the access point that generated the finding. The ARN format
  /// depends on whether the ARN represents an access point or a multi-region
  /// access point.
  final String? accessPointArn;

  FindingSourceDetail({
    this.accessPointAccount,
    this.accessPointArn,
  });

  factory FindingSourceDetail.fromJson(Map<String, dynamic> json) {
    return FindingSourceDetail(
      accessPointAccount: json['accessPointAccount'] as String?,
      accessPointArn: json['accessPointArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessPointAccount = this.accessPointAccount;
    final accessPointArn = this.accessPointArn;
    return {
      if (accessPointAccount != null) 'accessPointAccount': accessPointAccount,
      if (accessPointArn != null) 'accessPointArn': accessPointArn,
    };
  }
}

enum FindingSourceType {
  policy,
  bucketAcl,
  s3AccessPoint,
  s3AccessPointAccount,
}

extension FindingSourceTypeValueExtension on FindingSourceType {
  String toValue() {
    switch (this) {
      case FindingSourceType.policy:
        return 'POLICY';
      case FindingSourceType.bucketAcl:
        return 'BUCKET_ACL';
      case FindingSourceType.s3AccessPoint:
        return 'S3_ACCESS_POINT';
      case FindingSourceType.s3AccessPointAccount:
        return 'S3_ACCESS_POINT_ACCOUNT';
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
      case 'S3_ACCESS_POINT_ACCOUNT':
        return FindingSourceType.s3AccessPointAccount;
    }
    throw Exception('$this is not known in enum FindingSourceType');
  }
}

enum FindingStatus {
  active,
  archived,
  resolved,
}

extension FindingStatusValueExtension on FindingStatus {
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

extension FindingStatusUpdateValueExtension on FindingStatusUpdate {
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

  /// The Amazon Web Services account ID that owns the resource.
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

/// Contains information about a finding.
class FindingSummaryV2 {
  /// The time at which the resource-based policy or IAM entity that generated the
  /// finding was analyzed.
  final DateTime analyzedAt;

  /// The time at which the finding was created.
  final DateTime createdAt;

  /// The ID of the finding.
  final String id;

  /// The Amazon Web Services account ID that owns the resource.
  final String resourceOwnerAccount;

  /// The type of the resource that the external principal has access to.
  final ResourceType resourceType;

  /// The status of the finding.
  final FindingStatus status;

  /// The time at which the finding was most recently updated.
  final DateTime updatedAt;

  /// The error that resulted in an Error finding.
  final String? error;

  /// The type of the external access or unused access finding.
  final FindingType? findingType;

  /// The resource that the external principal has access to.
  final String? resource;

  FindingSummaryV2({
    required this.analyzedAt,
    required this.createdAt,
    required this.id,
    required this.resourceOwnerAccount,
    required this.resourceType,
    required this.status,
    required this.updatedAt,
    this.error,
    this.findingType,
    this.resource,
  });

  factory FindingSummaryV2.fromJson(Map<String, dynamic> json) {
    return FindingSummaryV2(
      analyzedAt: nonNullableTimeStampFromJson(json['analyzedAt'] as Object),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      resourceOwnerAccount: json['resourceOwnerAccount'] as String,
      resourceType: (json['resourceType'] as String).toResourceType(),
      status: (json['status'] as String).toFindingStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      error: json['error'] as String?,
      findingType: (json['findingType'] as String?)?.toFindingType(),
      resource: json['resource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzedAt = this.analyzedAt;
    final createdAt = this.createdAt;
    final id = this.id;
    final resourceOwnerAccount = this.resourceOwnerAccount;
    final resourceType = this.resourceType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final error = this.error;
    final findingType = this.findingType;
    final resource = this.resource;
    return {
      'analyzedAt': iso8601ToJson(analyzedAt),
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'resourceOwnerAccount': resourceOwnerAccount,
      'resourceType': resourceType.toValue(),
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (error != null) 'error': error,
      if (findingType != null) 'findingType': findingType.toValue(),
      if (resource != null) 'resource': resource,
    };
  }
}

enum FindingType {
  externalAccess,
  unusedIAMRole,
  unusedIAMUserAccessKey,
  unusedIAMUserPassword,
  unusedPermission,
}

extension FindingTypeValueExtension on FindingType {
  String toValue() {
    switch (this) {
      case FindingType.externalAccess:
        return 'ExternalAccess';
      case FindingType.unusedIAMRole:
        return 'UnusedIAMRole';
      case FindingType.unusedIAMUserAccessKey:
        return 'UnusedIAMUserAccessKey';
      case FindingType.unusedIAMUserPassword:
        return 'UnusedIAMUserPassword';
      case FindingType.unusedPermission:
        return 'UnusedPermission';
    }
  }
}

extension FindingTypeFromString on String {
  FindingType toFindingType() {
    switch (this) {
      case 'ExternalAccess':
        return FindingType.externalAccess;
      case 'UnusedIAMRole':
        return FindingType.unusedIAMRole;
      case 'UnusedIAMUserAccessKey':
        return FindingType.unusedIAMUserAccessKey;
      case 'UnusedIAMUserPassword':
        return FindingType.unusedIAMUserPassword;
      case 'UnusedPermission':
        return FindingType.unusedPermission;
    }
    throw Exception('$this is not known in enum FindingType');
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
  /// possible actions for a service that IAM Access Analyzer identified from the
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
  /// An <code>AnalyzedResource</code> object that contains information that IAM
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

class GetFindingV2Response {
  /// The time at which the resource-based policy or IAM entity that generated the
  /// finding was analyzed.
  final DateTime analyzedAt;

  /// The time at which the finding was created.
  final DateTime createdAt;

  /// A localized message that explains the finding and provides guidance on how
  /// to address it.
  final List<FindingDetails> findingDetails;

  /// The ID of the finding to retrieve.
  final String id;

  /// Tye Amazon Web Services account ID that owns the resource.
  final String resourceOwnerAccount;

  /// The type of the resource identified in the finding.
  final ResourceType resourceType;

  /// The status of the finding.
  final FindingStatus status;

  /// The time at which the finding was updated.
  final DateTime updatedAt;

  /// An error.
  final String? error;

  /// The type of the finding. For external access analyzers, the type is
  /// <code>ExternalAccess</code>. For unused access analyzers, the type can be
  /// <code>UnusedIAMRole</code>, <code>UnusedIAMUserAccessKey</code>,
  /// <code>UnusedIAMUserPassword</code>, or <code>UnusedPermission</code>.
  final FindingType? findingType;

  /// A token used for pagination of results returned.
  final String? nextToken;

  /// The resource that generated the finding.
  final String? resource;

  GetFindingV2Response({
    required this.analyzedAt,
    required this.createdAt,
    required this.findingDetails,
    required this.id,
    required this.resourceOwnerAccount,
    required this.resourceType,
    required this.status,
    required this.updatedAt,
    this.error,
    this.findingType,
    this.nextToken,
    this.resource,
  });

  factory GetFindingV2Response.fromJson(Map<String, dynamic> json) {
    return GetFindingV2Response(
      analyzedAt: nonNullableTimeStampFromJson(json['analyzedAt'] as Object),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      findingDetails: (json['findingDetails'] as List)
          .whereNotNull()
          .map((e) => FindingDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      resourceOwnerAccount: json['resourceOwnerAccount'] as String,
      resourceType: (json['resourceType'] as String).toResourceType(),
      status: (json['status'] as String).toFindingStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      error: json['error'] as String?,
      findingType: (json['findingType'] as String?)?.toFindingType(),
      nextToken: json['nextToken'] as String?,
      resource: json['resource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzedAt = this.analyzedAt;
    final createdAt = this.createdAt;
    final findingDetails = this.findingDetails;
    final id = this.id;
    final resourceOwnerAccount = this.resourceOwnerAccount;
    final resourceType = this.resourceType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final error = this.error;
    final findingType = this.findingType;
    final nextToken = this.nextToken;
    final resource = this.resource;
    return {
      'analyzedAt': iso8601ToJson(analyzedAt),
      'createdAt': iso8601ToJson(createdAt),
      'findingDetails': findingDetails,
      'id': id,
      'resourceOwnerAccount': resourceOwnerAccount,
      'resourceType': resourceType.toValue(),
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      if (error != null) 'error': error,
      if (findingType != null) 'findingType': findingType.toValue(),
      if (nextToken != null) 'nextToken': nextToken,
      if (resource != null) 'resource': resource,
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

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final ruleName = this.ruleName;
    return {
      'filter': filter,
      'ruleName': ruleName,
    };
  }
}

/// This configuration sets the network origin for the Amazon S3 access point or
/// multi-region access point to <code>Internet</code>.
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

  /// The job error for the policy generation request.
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

extension JobErrorCodeValueExtension on JobErrorCode {
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

extension JobErrorCodeFromString on String {
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

extension JobStatusValueExtension on JobStatus {
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

extension JobStatusFromString on String {
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

  /// The Amazon Web Services account under which the grant was issued. The
  /// account is used to propose KMS grants issued by accounts other than the
  /// owner of the key.
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

extension KmsGrantOperationValueExtension on KmsGrantOperation {
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

extension KmsGrantOperationFromString on String {
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

class ListFindingsV2Response {
  /// A list of findings retrieved from the analyzer that match the filter
  /// criteria specified, if any.
  final List<FindingSummaryV2> findings;

  /// A token used for pagination of results returned.
  final String? nextToken;

  ListFindingsV2Response({
    required this.findings,
    this.nextToken,
  });

  factory ListFindingsV2Response.fromJson(Map<String, dynamic> json) {
    return ListFindingsV2Response(
      findings: (json['findings'] as List)
          .whereNotNull()
          .map((e) => FindingSummaryV2.fromJson(e as Map<String, dynamic>))
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

extension LocaleValueExtension on Locale {
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

extension LocaleFromString on String {
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
/// <code>VpcConfiguration</code> to apply to the Amazon S3 access point.
/// <code>VpcConfiguration</code> does not apply to multi-region access points.
/// You can make the access point accessible from the internet, or you can
/// specify that all requests made through that access point must originate from
/// a specific virtual private cloud (VPC). You can specify only one type of
/// network configuration. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/creating-access-points.html">Creating
/// access points</a>.
class NetworkOriginConfiguration {
  /// The configuration for the Amazon S3 access point or multi-region access
  /// point with an <code>Internet</code> origin.
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

extension OrderByValueExtension on OrderBy {
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

extension PolicyTypeValueExtension on PolicyType {
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

extension PolicyTypeFromString on String {
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

/// The values for a manual Amazon RDS DB cluster snapshot attribute.
class RdsDbClusterSnapshotAttributeValue {
  /// The Amazon Web Services account IDs that have access to the manual Amazon
  /// RDS DB cluster snapshot. If the value <code>all</code> is specified, then
  /// the Amazon RDS DB cluster snapshot is public and can be copied or restored
  /// by all Amazon Web Services accounts.
  ///
  /// <ul>
  /// <li>
  /// If the configuration is for an existing Amazon RDS DB cluster snapshot and
  /// you do not specify the <code>accountIds</code> in
  /// <code>RdsDbClusterSnapshotAttributeValue</code>, then the access preview
  /// uses the existing shared <code>accountIds</code> for the snapshot.
  /// </li>
  /// <li>
  /// If the access preview is for a new resource and you do not specify the
  /// specify the <code>accountIds</code> in
  /// <code>RdsDbClusterSnapshotAttributeValue</code>, then the access preview
  /// considers the snapshot without any attributes.
  /// </li>
  /// <li>
  /// To propose deletion of existing shared <code>accountIds</code>, you can
  /// specify an empty list for <code>accountIds</code> in the
  /// <code>RdsDbClusterSnapshotAttributeValue</code>.
  /// </li>
  /// </ul>
  final List<String>? accountIds;

  RdsDbClusterSnapshotAttributeValue({
    this.accountIds,
  });

  factory RdsDbClusterSnapshotAttributeValue.fromJson(
      Map<String, dynamic> json) {
    return RdsDbClusterSnapshotAttributeValue(
      accountIds: (json['accountIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    return {
      if (accountIds != null) 'accountIds': accountIds,
    };
  }
}

/// The proposed access control configuration for an Amazon RDS DB cluster
/// snapshot. You can propose a configuration for a new Amazon RDS DB cluster
/// snapshot or an Amazon RDS DB cluster snapshot that you own by specifying the
/// <code>RdsDbClusterSnapshotAttributeValue</code> and optional KMS encryption
/// key. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_ModifyDBClusterSnapshotAttribute.html">ModifyDBClusterSnapshotAttribute</a>.
class RdsDbClusterSnapshotConfiguration {
  /// The names and values of manual DB cluster snapshot attributes. Manual DB
  /// cluster snapshot attributes are used to authorize other Amazon Web Services
  /// accounts to restore a manual DB cluster snapshot. The only valid value for
  /// <code>AttributeName</code> for the attribute map is <code>restore</code>
  final Map<String, RdsDbClusterSnapshotAttributeValue>? attributes;

  /// The KMS key identifier for an encrypted Amazon RDS DB cluster snapshot. The
  /// KMS key identifier is the key ARN, key ID, alias ARN, or alias name for the
  /// KMS key.
  ///
  /// <ul>
  /// <li>
  /// If the configuration is for an existing Amazon RDS DB cluster snapshot and
  /// you do not specify the <code>kmsKeyId</code>, or you specify an empty
  /// string, then the access preview uses the existing <code>kmsKeyId</code> of
  /// the snapshot.
  /// </li>
  /// <li>
  /// If the access preview is for a new resource and you do not specify the
  /// specify the <code>kmsKeyId</code>, then the access preview considers the
  /// snapshot as unencrypted.
  /// </li>
  /// </ul>
  final String? kmsKeyId;

  RdsDbClusterSnapshotConfiguration({
    this.attributes,
    this.kmsKeyId,
  });

  factory RdsDbClusterSnapshotConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RdsDbClusterSnapshotConfiguration(
      attributes: (json['attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              RdsDbClusterSnapshotAttributeValue.fromJson(
                  e as Map<String, dynamic>))),
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final kmsKeyId = this.kmsKeyId;
    return {
      if (attributes != null) 'attributes': attributes,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

/// The name and values of a manual Amazon RDS DB snapshot attribute. Manual DB
/// snapshot attributes are used to authorize other Amazon Web Services accounts
/// to restore a manual DB snapshot.
class RdsDbSnapshotAttributeValue {
  /// The Amazon Web Services account IDs that have access to the manual Amazon
  /// RDS DB snapshot. If the value <code>all</code> is specified, then the Amazon
  /// RDS DB snapshot is public and can be copied or restored by all Amazon Web
  /// Services accounts.
  ///
  /// <ul>
  /// <li>
  /// If the configuration is for an existing Amazon RDS DB snapshot and you do
  /// not specify the <code>accountIds</code> in
  /// <code>RdsDbSnapshotAttributeValue</code>, then the access preview uses the
  /// existing shared <code>accountIds</code> for the snapshot.
  /// </li>
  /// <li>
  /// If the access preview is for a new resource and you do not specify the
  /// specify the <code>accountIds</code> in
  /// <code>RdsDbSnapshotAttributeValue</code>, then the access preview considers
  /// the snapshot without any attributes.
  /// </li>
  /// <li>
  /// To propose deletion of an existing shared <code>accountIds</code>, you can
  /// specify an empty list for <code>accountIds</code> in the
  /// <code>RdsDbSnapshotAttributeValue</code>.
  /// </li>
  /// </ul>
  final List<String>? accountIds;

  RdsDbSnapshotAttributeValue({
    this.accountIds,
  });

  factory RdsDbSnapshotAttributeValue.fromJson(Map<String, dynamic> json) {
    return RdsDbSnapshotAttributeValue(
      accountIds: (json['accountIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    return {
      if (accountIds != null) 'accountIds': accountIds,
    };
  }
}

/// The proposed access control configuration for an Amazon RDS DB snapshot. You
/// can propose a configuration for a new Amazon RDS DB snapshot or an Amazon
/// RDS DB snapshot that you own by specifying the
/// <code>RdsDbSnapshotAttributeValue</code> and optional KMS encryption key.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_ModifyDBSnapshotAttribute.html">ModifyDBSnapshotAttribute</a>.
class RdsDbSnapshotConfiguration {
  /// The names and values of manual DB snapshot attributes. Manual DB snapshot
  /// attributes are used to authorize other Amazon Web Services accounts to
  /// restore a manual DB snapshot. The only valid value for
  /// <code>attributeName</code> for the attribute map is restore.
  final Map<String, RdsDbSnapshotAttributeValue>? attributes;

  /// The KMS key identifier for an encrypted Amazon RDS DB snapshot. The KMS key
  /// identifier is the key ARN, key ID, alias ARN, or alias name for the KMS key.
  ///
  /// <ul>
  /// <li>
  /// If the configuration is for an existing Amazon RDS DB snapshot and you do
  /// not specify the <code>kmsKeyId</code>, or you specify an empty string, then
  /// the access preview uses the existing <code>kmsKeyId</code> of the snapshot.
  /// </li>
  /// <li>
  /// If the access preview is for a new resource and you do not specify the
  /// specify the <code>kmsKeyId</code>, then the access preview considers the
  /// snapshot as unencrypted.
  /// </li>
  /// </ul>
  final String? kmsKeyId;

  RdsDbSnapshotConfiguration({
    this.attributes,
    this.kmsKeyId,
  });

  factory RdsDbSnapshotConfiguration.fromJson(Map<String, dynamic> json) {
    return RdsDbSnapshotConfiguration(
      attributes: (json['attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k,
              RdsDbSnapshotAttributeValue.fromJson(e as Map<String, dynamic>))),
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final kmsKeyId = this.kmsKeyId;
    return {
      if (attributes != null) 'attributes': attributes,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

enum ReasonCode {
  awsServiceAccessDisabled,
  delegatedAdministratorDeregistered,
  organizationDeleted,
  serviceLinkedRoleCreationFailed,
}

extension ReasonCodeValueExtension on ReasonCode {
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

/// Contains information about the reasoning why a check for access passed or
/// failed.
class ReasonSummary {
  /// A description of the reasoning of a result of checking for access.
  final String? description;

  /// The identifier for the reason statement.
  final String? statementId;

  /// The index number of the reason statement.
  final int? statementIndex;

  ReasonSummary({
    this.description,
    this.statementId,
    this.statementIndex,
  });

  factory ReasonSummary.fromJson(Map<String, dynamic> json) {
    return ReasonSummary(
      description: json['description'] as String?,
      statementId: json['statementId'] as String?,
      statementIndex: json['statementIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final statementId = this.statementId;
    final statementIndex = this.statementIndex;
    return {
      if (description != null) 'description': description,
      if (statementId != null) 'statementId': statementId,
      if (statementIndex != null) 'statementIndex': statementIndex,
    };
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
  awsEfsFileSystem,
  awsEc2Snapshot,
  awsEcrRepository,
  awsRdsDBSnapshot,
  awsRdsDBClusterSnapshot,
  awsSnsTopic,
  awsS3ExpressDirectoryBucket,
  awsDynamoDBTable,
  awsDynamoDBStream,
}

extension ResourceTypeValueExtension on ResourceType {
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
      case ResourceType.awsEfsFileSystem:
        return 'AWS::EFS::FileSystem';
      case ResourceType.awsEc2Snapshot:
        return 'AWS::EC2::Snapshot';
      case ResourceType.awsEcrRepository:
        return 'AWS::ECR::Repository';
      case ResourceType.awsRdsDBSnapshot:
        return 'AWS::RDS::DBSnapshot';
      case ResourceType.awsRdsDBClusterSnapshot:
        return 'AWS::RDS::DBClusterSnapshot';
      case ResourceType.awsSnsTopic:
        return 'AWS::SNS::Topic';
      case ResourceType.awsS3ExpressDirectoryBucket:
        return 'AWS::S3Express::DirectoryBucket';
      case ResourceType.awsDynamoDBTable:
        return 'AWS::DynamoDB::Table';
      case ResourceType.awsDynamoDBStream:
        return 'AWS::DynamoDB::Stream';
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
      case 'AWS::SecretsManager::Secret':
        return ResourceType.awsSecretsManagerSecret;
      case 'AWS::EFS::FileSystem':
        return ResourceType.awsEfsFileSystem;
      case 'AWS::EC2::Snapshot':
        return ResourceType.awsEc2Snapshot;
      case 'AWS::ECR::Repository':
        return ResourceType.awsEcrRepository;
      case 'AWS::RDS::DBSnapshot':
        return ResourceType.awsRdsDBSnapshot;
      case 'AWS::RDS::DBClusterSnapshot':
        return ResourceType.awsRdsDBClusterSnapshot;
      case 'AWS::SNS::Topic':
        return ResourceType.awsSnsTopic;
      case 'AWS::S3Express::DirectoryBucket':
        return ResourceType.awsS3ExpressDirectoryBucket;
      case 'AWS::DynamoDB::Table':
        return ResourceType.awsDynamoDBTable;
      case 'AWS::DynamoDB::Stream':
        return ResourceType.awsDynamoDBStream;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// The configuration for an Amazon S3 access point or multi-region access point
/// for the bucket. You can propose up to 10 access points or multi-region
/// access points per bucket. If the proposed Amazon S3 access point
/// configuration is for an existing bucket, the access preview uses the
/// proposed access point configuration in place of the existing access points.
/// To propose an access point without a policy, you can provide an empty string
/// as the access point policy. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/creating-access-points.html">Creating
/// access points</a>. For more information about access point policy limits,
/// see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-points-restrictions-limitations.html">Access
/// points restrictions and limitations</a>.
class S3AccessPointConfiguration {
  /// The access point or multi-region access point policy.
  final String? accessPointPolicy;

  /// The proposed <code>Internet</code> and <code>VpcConfiguration</code> to
  /// apply to this Amazon S3 access point. <code>VpcConfiguration</code> does not
  /// apply to multi-region access points. If the access preview is for a new
  /// resource and neither is specified, the access preview uses
  /// <code>Internet</code> for the network origin. If the access preview is for
  /// an existing resource and neither is specified, the access preview uses the
  /// exiting network origin.
  final NetworkOriginConfiguration? networkOrigin;

  /// The proposed <code>S3PublicAccessBlock</code> configuration to apply to this
  /// Amazon S3 access point or multi-region access point.
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
/// bucket BPA settings, Amazon S3 access points, and multi-region access points
/// attached to the bucket. If the configuration is for an existing Amazon S3
/// bucket and you do not specify the Amazon S3 bucket policy, the access
/// preview uses the existing policy attached to the bucket. If the access
/// preview is for a new resource and you do not specify the Amazon S3 bucket
/// policy, the access preview assumes a bucket without a policy. To propose
/// deletion of an existing bucket policy, you can specify an empty string. For
/// more information about bucket policy limits, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html">Bucket
/// Policy Examples</a>.
class S3BucketConfiguration {
  /// The configuration of Amazon S3 access points or multi-region access points
  /// for the bucket. You can propose up to 10 new access points per bucket.
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

/// Proposed access control configuration for an Amazon S3 directory bucket. You
/// can propose a configuration for a new Amazon S3 directory bucket or an
/// existing Amazon S3 directory bucket that you own by specifying the Amazon S3
/// bucket policy. If the configuration is for an existing Amazon S3 directory
/// bucket and you do not specify the Amazon S3 bucket policy, the access
/// preview uses the existing policy attached to the directory bucket. If the
/// access preview is for a new resource and you do not specify the Amazon S3
/// bucket policy, the access preview assumes an directory bucket without a
/// policy. To propose deletion of an existing bucket policy, you can specify an
/// empty string. For more information about Amazon S3 directory bucket
/// policies, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-express-security-iam-example-bucket-policies.html">Example
/// directory bucket policies for S3 Express One Zone</a>.
class S3ExpressDirectoryBucketConfiguration {
  /// The proposed bucket policy for the Amazon S3 directory bucket.
  final String? bucketPolicy;

  S3ExpressDirectoryBucketConfiguration({
    this.bucketPolicy,
  });

  factory S3ExpressDirectoryBucketConfiguration.fromJson(
      Map<String, dynamic> json) {
    return S3ExpressDirectoryBucketConfiguration(
      bucketPolicy: json['bucketPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketPolicy = this.bucketPolicy;
    return {
      if (bucketPolicy != null) 'bucketPolicy': bucketPolicy,
    };
  }
}

/// The <code>PublicAccessBlock</code> configuration to apply to this Amazon S3
/// bucket. If the proposed configuration is for an existing Amazon S3 bucket
/// and the configuration is not specified, the access preview uses the existing
/// setting. If the proposed configuration is for a new bucket and the
/// configuration is not specified, the access preview uses <code>false</code>.
/// If the proposed configuration is for a new access point or multi-region
/// access point and the access point BPA configuration is not specified, the
/// access preview uses <code>true</code>. For more information, see <a
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
/// key ID, the access preview uses the Amazon Web Services managed key
/// <code>aws/secretsmanager</code>. If you specify an empty string for the KMS
/// key ID, the access preview uses the Amazon Web Services managed key of the
/// Amazon Web Services account. For more information about secret policy
/// limits, see <a
/// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_limits.html">Quotas
/// for Secrets Manager.</a>.
class SecretsManagerSecretConfiguration {
  /// The proposed ARN, key ID, or alias of the KMS key.
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

/// The proposed access control configuration for an Amazon SNS topic. You can
/// propose a configuration for a new Amazon SNS topic or an existing Amazon SNS
/// topic that you own by specifying the policy. If the configuration is for an
/// existing Amazon SNS topic and you do not specify the Amazon SNS policy, then
/// the access preview uses the existing Amazon SNS policy for the topic. If the
/// access preview is for a new resource and you do not specify the policy, then
/// the access preview assumes an Amazon SNS topic without a policy. To propose
/// deletion of an existing Amazon SNS topic policy, you can specify an empty
/// string for the Amazon SNS policy. For more information, see <a
/// href="https://docs.aws.amazon.com/sns/latest/api/API_Topic.html">Topic</a>.
class SnsTopicConfiguration {
  /// The JSON policy text that defines who can access an Amazon SNS topic. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-access-policy-use-cases.html">Example
  /// cases for Amazon SNS access control</a> in the <i>Amazon SNS Developer
  /// Guide</i>.
  final String? topicPolicy;

  SnsTopicConfiguration({
    this.topicPolicy,
  });

  factory SnsTopicConfiguration.fromJson(Map<String, dynamic> json) {
    return SnsTopicConfiguration(
      topicPolicy: json['topicPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final topicPolicy = this.topicPolicy;
    return {
      if (topicPolicy != null) 'topicPolicy': topicPolicy,
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

/// The proposed access control configuration for an Amazon SQS queue. You can
/// propose a configuration for a new Amazon SQS queue or an existing Amazon SQS
/// queue that you own by specifying the Amazon SQS policy. If the configuration
/// is for an existing Amazon SQS queue and you do not specify the Amazon SQS
/// policy, the access preview uses the existing Amazon SQS policy for the
/// queue. If the access preview is for a new resource and you do not specify
/// the policy, the access preview assumes an Amazon SQS queue without a policy.
/// To propose deletion of an existing Amazon SQS queue policy, you can specify
/// an empty string for the Amazon SQS policy. For more information about Amazon
/// SQS policy limits, see <a
/// href="https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/quotas-policies.html">Quotas
/// related to policies</a>.
class SqsQueueConfiguration {
  /// The proposed resource policy for the Amazon SQS queue.
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
/// member accounts of the Amazon Web Services organization.
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
  /// <code>true</code>, IAM Access Analyzer retrieves CloudTrail data from all
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
  /// <code>true</code>, IAM Access Analyzer retrieves CloudTrail data from all
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
  accountUnusedAccess,
  organizationUnusedAccess,
}

extension TypeValueExtension on Type {
  String toValue() {
    switch (this) {
      case Type.account:
        return 'ACCOUNT';
      case Type.organization:
        return 'ORGANIZATION';
      case Type.accountUnusedAccess:
        return 'ACCOUNT_UNUSED_ACCESS';
      case Type.organizationUnusedAccess:
        return 'ORGANIZATION_UNUSED_ACCESS';
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
      case 'ACCOUNT_UNUSED_ACCESS':
        return Type.accountUnusedAccess;
      case 'ORGANIZATION_UNUSED_ACCESS':
        return Type.organizationUnusedAccess;
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

/// Contains information about an unused access analyzer.
class UnusedAccessConfiguration {
  /// The specified access age in days for which to generate findings for unused
  /// access. For example, if you specify 90 days, the analyzer will generate
  /// findings for IAM entities within the accounts of the selected organization
  /// for any access that hasn't been used in 90 or more days since the analyzer's
  /// last scan. You can choose a value between 1 and 180 days.
  final int? unusedAccessAge;

  UnusedAccessConfiguration({
    this.unusedAccessAge,
  });

  factory UnusedAccessConfiguration.fromJson(Map<String, dynamic> json) {
    return UnusedAccessConfiguration(
      unusedAccessAge: json['unusedAccessAge'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final unusedAccessAge = this.unusedAccessAge;
    return {
      if (unusedAccessAge != null) 'unusedAccessAge': unusedAccessAge,
    };
  }
}

/// Contains information about an unused access finding for an action. IAM
/// Access Analyzer charges for unused access analysis based on the number of
/// IAM roles and users analyzed per month. For more details on pricing, see <a
/// href="https://aws.amazon.com/iam/access-analyzer/pricing">IAM Access
/// Analyzer pricing</a>.
class UnusedAction {
  /// The action for which the unused access finding was generated.
  final String action;

  /// The time at which the action was last accessed.
  final DateTime? lastAccessed;

  UnusedAction({
    required this.action,
    this.lastAccessed,
  });

  factory UnusedAction.fromJson(Map<String, dynamic> json) {
    return UnusedAction(
      action: json['action'] as String,
      lastAccessed: timeStampFromJson(json['lastAccessed']),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final lastAccessed = this.lastAccessed;
    return {
      'action': action,
      if (lastAccessed != null) 'lastAccessed': iso8601ToJson(lastAccessed),
    };
  }
}

/// Contains information about an unused access finding for an IAM role. IAM
/// Access Analyzer charges for unused access analysis based on the number of
/// IAM roles and users analyzed per month. For more details on pricing, see <a
/// href="https://aws.amazon.com/iam/access-analyzer/pricing">IAM Access
/// Analyzer pricing</a>.
class UnusedIamRoleDetails {
  /// The time at which the role was last accessed.
  final DateTime? lastAccessed;

  UnusedIamRoleDetails({
    this.lastAccessed,
  });

  factory UnusedIamRoleDetails.fromJson(Map<String, dynamic> json) {
    return UnusedIamRoleDetails(
      lastAccessed: timeStampFromJson(json['lastAccessed']),
    );
  }

  Map<String, dynamic> toJson() {
    final lastAccessed = this.lastAccessed;
    return {
      if (lastAccessed != null) 'lastAccessed': iso8601ToJson(lastAccessed),
    };
  }
}

/// Contains information about an unused access finding for an IAM user access
/// key. IAM Access Analyzer charges for unused access analysis based on the
/// number of IAM roles and users analyzed per month. For more details on
/// pricing, see <a
/// href="https://aws.amazon.com/iam/access-analyzer/pricing">IAM Access
/// Analyzer pricing</a>.
class UnusedIamUserAccessKeyDetails {
  /// The ID of the access key for which the unused access finding was generated.
  final String accessKeyId;

  /// The time at which the access key was last accessed.
  final DateTime? lastAccessed;

  UnusedIamUserAccessKeyDetails({
    required this.accessKeyId,
    this.lastAccessed,
  });

  factory UnusedIamUserAccessKeyDetails.fromJson(Map<String, dynamic> json) {
    return UnusedIamUserAccessKeyDetails(
      accessKeyId: json['accessKeyId'] as String,
      lastAccessed: timeStampFromJson(json['lastAccessed']),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final lastAccessed = this.lastAccessed;
    return {
      'accessKeyId': accessKeyId,
      if (lastAccessed != null) 'lastAccessed': iso8601ToJson(lastAccessed),
    };
  }
}

/// Contains information about an unused access finding for an IAM user
/// password. IAM Access Analyzer charges for unused access analysis based on
/// the number of IAM roles and users analyzed per month. For more details on
/// pricing, see <a
/// href="https://aws.amazon.com/iam/access-analyzer/pricing">IAM Access
/// Analyzer pricing</a>.
class UnusedIamUserPasswordDetails {
  /// The time at which the password was last accessed.
  final DateTime? lastAccessed;

  UnusedIamUserPasswordDetails({
    this.lastAccessed,
  });

  factory UnusedIamUserPasswordDetails.fromJson(Map<String, dynamic> json) {
    return UnusedIamUserPasswordDetails(
      lastAccessed: timeStampFromJson(json['lastAccessed']),
    );
  }

  Map<String, dynamic> toJson() {
    final lastAccessed = this.lastAccessed;
    return {
      if (lastAccessed != null) 'lastAccessed': iso8601ToJson(lastAccessed),
    };
  }
}

/// Contains information about an unused access finding for a permission. IAM
/// Access Analyzer charges for unused access analysis based on the number of
/// IAM roles and users analyzed per month. For more details on pricing, see <a
/// href="https://aws.amazon.com/iam/access-analyzer/pricing">IAM Access
/// Analyzer pricing</a>.
class UnusedPermissionDetails {
  /// The namespace of the Amazon Web Services service that contains the unused
  /// actions.
  final String serviceNamespace;

  /// A list of unused actions for which the unused access finding was generated.
  final List<UnusedAction>? actions;

  /// The time at which the permission last accessed.
  final DateTime? lastAccessed;

  UnusedPermissionDetails({
    required this.serviceNamespace,
    this.actions,
    this.lastAccessed,
  });

  factory UnusedPermissionDetails.fromJson(Map<String, dynamic> json) {
    return UnusedPermissionDetails(
      serviceNamespace: json['serviceNamespace'] as String,
      actions: (json['actions'] as List?)
          ?.whereNotNull()
          .map((e) => UnusedAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastAccessed: timeStampFromJson(json['lastAccessed']),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceNamespace = this.serviceNamespace;
    final actions = this.actions;
    final lastAccessed = this.lastAccessed;
    return {
      'serviceNamespace': serviceNamespace,
      if (actions != null) 'actions': actions,
      if (lastAccessed != null) 'lastAccessed': iso8601ToJson(lastAccessed),
    };
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

extension ValidatePolicyFindingTypeValueExtension on ValidatePolicyFindingType {
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

extension ValidatePolicyFindingTypeFromString on String {
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

enum ValidatePolicyResourceType {
  awsS3Bucket,
  awsS3AccessPoint,
  awsS3MultiRegionAccessPoint,
  awsS3ObjectLambdaAccessPoint,
  awsIamAssumeRolePolicyDocument,
  awsDynamoDBTable,
}

extension ValidatePolicyResourceTypeValueExtension
    on ValidatePolicyResourceType {
  String toValue() {
    switch (this) {
      case ValidatePolicyResourceType.awsS3Bucket:
        return 'AWS::S3::Bucket';
      case ValidatePolicyResourceType.awsS3AccessPoint:
        return 'AWS::S3::AccessPoint';
      case ValidatePolicyResourceType.awsS3MultiRegionAccessPoint:
        return 'AWS::S3::MultiRegionAccessPoint';
      case ValidatePolicyResourceType.awsS3ObjectLambdaAccessPoint:
        return 'AWS::S3ObjectLambda::AccessPoint';
      case ValidatePolicyResourceType.awsIamAssumeRolePolicyDocument:
        return 'AWS::IAM::AssumeRolePolicyDocument';
      case ValidatePolicyResourceType.awsDynamoDBTable:
        return 'AWS::DynamoDB::Table';
    }
  }
}

extension ValidatePolicyResourceTypeFromString on String {
  ValidatePolicyResourceType toValidatePolicyResourceType() {
    switch (this) {
      case 'AWS::S3::Bucket':
        return ValidatePolicyResourceType.awsS3Bucket;
      case 'AWS::S3::AccessPoint':
        return ValidatePolicyResourceType.awsS3AccessPoint;
      case 'AWS::S3::MultiRegionAccessPoint':
        return ValidatePolicyResourceType.awsS3MultiRegionAccessPoint;
      case 'AWS::S3ObjectLambda::AccessPoint':
        return ValidatePolicyResourceType.awsS3ObjectLambdaAccessPoint;
      case 'AWS::IAM::AssumeRolePolicyDocument':
        return ValidatePolicyResourceType.awsIamAssumeRolePolicyDocument;
      case 'AWS::DynamoDB::Table':
        return ValidatePolicyResourceType.awsDynamoDBTable;
    }
    throw Exception('$this is not known in enum ValidatePolicyResourceType');
  }
}

class ValidatePolicyResponse {
  /// The list of findings in a policy returned by IAM Access Analyzer based on
  /// its suite of policy checks.
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
/// access point. VPC configuration does not apply to multi-region access
/// points. For more information, see <a
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

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
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

class UnprocessableEntityException extends _s.GenericAwsException {
  UnprocessableEntityException({String? type, String? message})
      : super(
            type: type, code: 'UnprocessableEntityException', message: message);
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
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnprocessableEntityException': (type, message) =>
      UnprocessableEntityException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
