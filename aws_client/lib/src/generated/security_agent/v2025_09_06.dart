// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2025_09_06.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// AWS Security Agent is a frontier agent that proactively secures your
/// applications throughout the development lifecycle. It conducts automated
/// security reviews tailored to your organizational requirements and delivers
/// context-aware penetration testing on demand. By continuously validating
/// security from design to deployment, AWS Security Agent helps prevent
/// vulnerabilities early across all your environments. Key capabilities include
/// design security review for architecture documents, code security review for
/// pull requests in connected repositories, and on-demand penetration testing
/// that discovers, validates, and remediates security vulnerabilities through
/// tailored multi-step attack scenarios. For more information, see the <a
/// href="https://docs.aws.amazon.com/securityagent/latest/userguide/what-is.html">AWS
/// Security Agent User Guide</a>.
class SecurityAgent {
  final _s.RestJsonProtocol _protocol;
  factory SecurityAgent({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'securityagent',
    );
    return SecurityAgent._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  SecurityAgent._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Uploads an artifact to an agent space. Artifacts provide additional
  /// context for security testing, such as architecture diagrams, API
  /// specifications, or configuration files.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to add the artifact to.
  ///
  /// Parameter [artifactContent] :
  /// The binary content of the artifact to upload.
  ///
  /// Parameter [artifactType] :
  /// The file type of the artifact. Valid values include TXT, PNG, JPEG, MD,
  /// PDF, DOCX, DOC, JSON, and YAML.
  ///
  /// Parameter [fileName] :
  /// The file name of the artifact.
  Future<AddArtifactOutput> addArtifact({
    required String agentSpaceId,
    required Uint8List artifactContent,
    required ArtifactType artifactType,
    required String fileName,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'artifactContent': base64Encode(artifactContent),
      'artifactType': artifactType.value,
      'fileName': fileName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/AddArtifact',
      exceptionFnMap: _exceptionFns,
    );
    return AddArtifactOutput.fromJson(response);
  }

  /// Deletes one or more code reviews from an agent space.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the code reviews to
  /// delete.
  ///
  /// Parameter [codeReviewIds] :
  /// The list of code review identifiers to delete.
  Future<BatchDeleteCodeReviewsOutput> batchDeleteCodeReviews({
    required String agentSpaceId,
    required List<String> codeReviewIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'codeReviewIds': codeReviewIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchDeleteCodeReviews',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteCodeReviewsOutput.fromJson(response);
  }

  /// Deletes one or more pentests from an agent space.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the pentests to
  /// delete.
  ///
  /// Parameter [pentestIds] :
  /// The list of pentest identifiers to delete.
  Future<BatchDeletePentestsOutput> batchDeletePentests({
    required String agentSpaceId,
    required List<String> pentestIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'pentestIds': pentestIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchDeletePentests',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeletePentestsOutput.fromJson(response);
  }

  /// Retrieves metadata for one or more artifacts in an agent space.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the artifacts.
  ///
  /// Parameter [artifactIds] :
  /// The list of artifact identifiers to retrieve metadata for.
  Future<BatchGetArtifactMetadataOutput> batchGetArtifactMetadata({
    required String agentSpaceId,
    required List<String> artifactIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'artifactIds': artifactIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetArtifactMetadata',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetArtifactMetadataOutput.fromJson(response);
  }

  /// Retrieves information about one or more code review jobs in an agent
  /// space.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the code review
  /// jobs.
  ///
  /// Parameter [codeReviewJobIds] :
  /// The list of code review job identifiers to retrieve.
  Future<BatchGetCodeReviewJobsOutput> batchGetCodeReviewJobs({
    required String agentSpaceId,
    required List<String> codeReviewJobIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'codeReviewJobIds': codeReviewJobIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetCodeReviewJobs',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetCodeReviewJobsOutput.fromJson(response);
  }

  /// Retrieves information about one or more tasks within a code review job.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the tasks.
  ///
  /// Parameter [codeReviewJobTaskIds] :
  /// The list of task identifiers to retrieve.
  Future<BatchGetCodeReviewJobTasksOutput> batchGetCodeReviewJobTasks({
    required String agentSpaceId,
    required List<String> codeReviewJobTaskIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'codeReviewJobTaskIds': codeReviewJobTaskIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetCodeReviewJobTasks',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetCodeReviewJobTasksOutput.fromJson(response);
  }

  /// Retrieves information about one or more code reviews in an agent space.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the code reviews.
  ///
  /// Parameter [codeReviewIds] :
  /// The list of code review identifiers to retrieve.
  Future<BatchGetCodeReviewsOutput> batchGetCodeReviews({
    required String agentSpaceId,
    required List<String> codeReviewIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'codeReviewIds': codeReviewIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetCodeReviews',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetCodeReviewsOutput.fromJson(response);
  }

  /// Retrieves information about one or more security findings in an agent
  /// space.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the findings.
  ///
  /// Parameter [findingIds] :
  /// The list of finding identifiers to retrieve.
  Future<BatchGetFindingsOutput> batchGetFindings({
    required String agentSpaceId,
    required List<String> findingIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'findingIds': findingIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetFindings',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetFindingsOutput.fromJson(response);
  }

  /// Retrieves information about one or more pentest jobs in an agent space.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the pentest jobs.
  ///
  /// Parameter [pentestJobIds] :
  /// The list of pentest job identifiers to retrieve.
  Future<BatchGetPentestJobsOutput> batchGetPentestJobs({
    required String agentSpaceId,
    required List<String> pentestJobIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'pentestJobIds': pentestJobIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetPentestJobs',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetPentestJobsOutput.fromJson(response);
  }

  /// Retrieves information about one or more tasks within a pentest job.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the tasks.
  ///
  /// Parameter [taskIds] :
  /// The list of task identifiers to retrieve.
  Future<BatchGetPentestJobTasksOutput> batchGetPentestJobTasks({
    required String agentSpaceId,
    required List<String> taskIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'taskIds': taskIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetPentestJobTasks',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetPentestJobTasksOutput.fromJson(response);
  }

  /// Retrieves information about one or more pentests in an agent space.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the pentests.
  ///
  /// Parameter [pentestIds] :
  /// The list of pentest identifiers to retrieve.
  Future<BatchGetPentestsOutput> batchGetPentests({
    required String agentSpaceId,
    required List<String> pentestIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'pentestIds': pentestIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetPentests',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetPentestsOutput.fromJson(response);
  }

  /// Creates a new code review configuration in an agent space. A code review
  /// defines the parameters for automated security-focused code analysis.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to create the code review in.
  ///
  /// Parameter [assets] :
  /// The assets to include in the code review, such as documents and source
  /// code.
  ///
  /// Parameter [title] :
  /// The title of the code review.
  ///
  /// Parameter [codeRemediationStrategy] :
  /// The code remediation strategy for the code review. Valid values are
  /// AUTOMATIC and DISABLED.
  ///
  /// Parameter [logConfig] :
  /// The CloudWatch Logs configuration for the code review.
  ///
  /// Parameter [serviceRole] :
  /// The IAM service role to use for the code review.
  Future<CreateCodeReviewOutput> createCodeReview({
    required String agentSpaceId,
    required Assets assets,
    required String title,
    CodeRemediationStrategy? codeRemediationStrategy,
    CloudWatchLog? logConfig,
    String? serviceRole,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'assets': assets,
      'title': title,
      if (codeRemediationStrategy != null)
        'codeRemediationStrategy': codeRemediationStrategy.value,
      if (logConfig != null) 'logConfig': logConfig,
      if (serviceRole != null) 'serviceRole': serviceRole,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateCodeReview',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCodeReviewOutput.fromJson(response);
  }

  /// Creates a new membership, granting a user access to an agent space within
  /// an application.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to grant access to.
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application that contains the agent space.
  ///
  /// Parameter [memberType] :
  /// The type of member. Currently, only USER is supported.
  ///
  /// Parameter [membershipId] :
  /// The unique identifier for the membership.
  ///
  /// Parameter [config] :
  /// The configuration for the membership, such as the user role.
  Future<void> createMembership({
    required String agentSpaceId,
    required String applicationId,
    required MembershipType memberType,
    required String membershipId,
    MembershipConfig? config,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'applicationId': applicationId,
      'memberType': memberType.value,
      'membershipId': membershipId,
      if (config != null) 'config': config,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateMembership',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new pentest configuration in an agent space. A pentest defines
  /// the security test parameters, including target assets, risk type
  /// exclusions, and logging configuration.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to create the pentest in.
  ///
  /// Parameter [title] :
  /// The title of the pentest.
  ///
  /// Parameter [assets] :
  /// The assets to include in the pentest, such as endpoints, actors,
  /// documents, and source code.
  ///
  /// Parameter [codeRemediationStrategy] :
  /// The code remediation strategy for the pentest. Valid values are AUTOMATIC
  /// and DISABLED.
  ///
  /// Parameter [excludeRiskTypes] :
  /// The list of risk types to exclude from the pentest.
  ///
  /// Parameter [logConfig] :
  /// The CloudWatch Logs configuration for the pentest.
  ///
  /// Parameter [networkTrafficConfig] :
  /// The network traffic configuration for the pentest, including custom
  /// headers and traffic rules.
  ///
  /// Parameter [serviceRole] :
  /// The IAM service role to use for the pentest.
  ///
  /// Parameter [vpcConfig] :
  /// The VPC configuration for the pentest.
  Future<CreatePentestOutput> createPentest({
    required String agentSpaceId,
    required String title,
    Assets? assets,
    CodeRemediationStrategy? codeRemediationStrategy,
    List<RiskType>? excludeRiskTypes,
    CloudWatchLog? logConfig,
    NetworkTrafficConfig? networkTrafficConfig,
    String? serviceRole,
    VpcConfig? vpcConfig,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'title': title,
      if (assets != null) 'assets': assets,
      if (codeRemediationStrategy != null)
        'codeRemediationStrategy': codeRemediationStrategy.value,
      if (excludeRiskTypes != null)
        'excludeRiskTypes': excludeRiskTypes.map((e) => e.value).toList(),
      if (logConfig != null) 'logConfig': logConfig,
      if (networkTrafficConfig != null)
        'networkTrafficConfig': networkTrafficConfig,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreatePentest',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePentestOutput.fromJson(response);
  }

  /// Deletes an artifact from an agent space.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the artifact.
  ///
  /// Parameter [artifactId] :
  /// The unique identifier of the artifact to delete.
  Future<void> deleteArtifact({
    required String agentSpaceId,
    required String artifactId,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'artifactId': artifactId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteArtifact',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a membership, revoking a user's access to an agent space.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to revoke access from.
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application that contains the agent space.
  ///
  /// Parameter [membershipId] :
  /// The unique identifier of the membership to delete.
  ///
  /// Parameter [memberType] :
  /// The type of member to remove.
  Future<void> deleteMembership({
    required String agentSpaceId,
    required String applicationId,
    required String membershipId,
    MembershipType? memberType,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'applicationId': applicationId,
      'membershipId': membershipId,
      if (memberType != null) 'memberType': memberType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteMembership',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves an artifact from an agent space.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the artifact.
  ///
  /// Parameter [artifactId] :
  /// The unique identifier of the artifact to retrieve.
  Future<GetArtifactOutput> getArtifact({
    required String agentSpaceId,
    required String artifactId,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'artifactId': artifactId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetArtifact',
      exceptionFnMap: _exceptionFns,
    );
    return GetArtifactOutput.fromJson(response);
  }

  /// Initiates the OAuth registration flow with a third-party provider. Returns
  /// a redirect URL and CSRF state token for completing the authorization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [provider] :
  /// The provider to initiate registration with. Currently, only GITHUB is
  /// supported.
  Future<InitiateProviderRegistrationOutput> initiateProviderRegistration({
    required Provider provider,
  }) async {
    final $payload = <String, dynamic>{
      'provider': provider.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/oauth2/provider/register',
      exceptionFnMap: _exceptionFns,
    );
    return InitiateProviderRegistrationOutput.fromJson(response);
  }

  /// Returns a paginated list of artifact summaries for the specified agent
  /// space.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to list artifacts for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  Future<ListArtifactsOutput> listArtifacts({
    required String agentSpaceId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListArtifacts',
      exceptionFnMap: _exceptionFns,
    );
    return ListArtifactsOutput.fromJson(response);
  }

  /// Returns a paginated list of code review job summaries for the specified
  /// code review configuration.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [codeReviewId] :
  /// The unique identifier of the code review to list jobs for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  Future<ListCodeReviewJobsForCodeReviewOutput>
      listCodeReviewJobsForCodeReview({
    required String agentSpaceId,
    required String codeReviewId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'codeReviewId': codeReviewId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListCodeReviewJobsForCodeReview',
      exceptionFnMap: _exceptionFns,
    );
    return ListCodeReviewJobsForCodeReviewOutput.fromJson(response);
  }

  /// Returns a paginated list of task summaries for the specified code review
  /// job, optionally filtered by step name or category.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [categoryName] :
  /// Filter tasks by category name.
  ///
  /// Parameter [codeReviewJobId] :
  /// The unique identifier of the code review job to list tasks for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  ///
  /// Parameter [stepName] :
  /// Filter tasks by step name.
  Future<ListCodeReviewJobTasksOutput> listCodeReviewJobTasks({
    required String agentSpaceId,
    String? categoryName,
    String? codeReviewJobId,
    int? maxResults,
    String? nextToken,
    StepName? stepName,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      if (categoryName != null) 'categoryName': categoryName,
      if (codeReviewJobId != null) 'codeReviewJobId': codeReviewJobId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (stepName != null) 'stepName': stepName.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListCodeReviewJobTasks',
      exceptionFnMap: _exceptionFns,
    );
    return ListCodeReviewJobTasksOutput.fromJson(response);
  }

  /// Returns a paginated list of code review summaries for the specified agent
  /// space.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to list code reviews for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  Future<ListCodeReviewsOutput> listCodeReviews({
    required String agentSpaceId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListCodeReviews',
      exceptionFnMap: _exceptionFns,
    );
    return ListCodeReviewsOutput.fromJson(response);
  }

  /// Returns a paginated list of endpoints discovered during a pentest job
  /// execution.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [pentestJobId] :
  /// The unique identifier of the pentest job to list discovered endpoints for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  ///
  /// Parameter [prefix] :
  /// A prefix to filter discovered endpoints by URI.
  Future<ListDiscoveredEndpointsOutput> listDiscoveredEndpoints({
    required String agentSpaceId,
    required String pentestJobId,
    int? maxResults,
    String? nextToken,
    String? prefix,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'pentestJobId': pentestJobId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (prefix != null) 'prefix': prefix,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListDiscoveredEndpoints',
      exceptionFnMap: _exceptionFns,
    );
    return ListDiscoveredEndpointsOutput.fromJson(response);
  }

  /// Lists the security findings for a pentest job.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [codeReviewJobId] :
  /// The unique identifier of the code review job to list findings for.
  /// Mutually exclusive with pentestJobId.
  ///
  /// Parameter [confidence] :
  /// Filter findings by confidence level.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [name] :
  /// Filter findings by name.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  ///
  /// Parameter [pentestJobId] :
  /// The unique identifier of the pentest job to list findings for.
  ///
  /// Parameter [riskLevel] :
  /// Filter findings by risk level.
  ///
  /// Parameter [riskType] :
  /// Filter findings by risk type.
  ///
  /// Parameter [status] :
  /// Filter findings by status.
  Future<ListFindingsOutput> listFindings({
    required String agentSpaceId,
    String? codeReviewJobId,
    ConfidenceLevel? confidence,
    int? maxResults,
    String? name,
    String? nextToken,
    String? pentestJobId,
    RiskLevel? riskLevel,
    String? riskType,
    FindingStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      if (codeReviewJobId != null) 'codeReviewJobId': codeReviewJobId,
      if (confidence != null) 'confidence': confidence.value,
      if (maxResults != null) 'maxResults': maxResults,
      if (name != null) 'name': name,
      if (nextToken != null) 'nextToken': nextToken,
      if (pentestJobId != null) 'pentestJobId': pentestJobId,
      if (riskLevel != null) 'riskLevel': riskLevel.value,
      if (riskType != null) 'riskType': riskType,
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListFindings',
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingsOutput.fromJson(response);
  }

  /// Lists the integrated resources for an agent space, optionally filtered by
  /// integration or resource type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to list integrated resources for.
  ///
  /// Parameter [integrationId] :
  /// The unique identifier of the integration to filter by.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  ///
  /// Parameter [resourceType] :
  /// The type of resource to filter by.
  Future<ListIntegratedResourcesOutput> listIntegratedResources({
    required String agentSpaceId,
    String? integrationId,
    int? maxResults,
    String? nextToken,
    ResourceType? resourceType,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      if (integrationId != null) 'integrationId': integrationId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceType != null) 'resourceType': resourceType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListIntegratedResources',
      exceptionFnMap: _exceptionFns,
    );
    return ListIntegratedResourcesOutput.fromJson(response);
  }

  /// Returns a paginated list of membership summaries for the specified agent
  /// space within an application.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to list memberships for.
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application that contains the agent space.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [memberType] :
  /// Filter memberships by member type.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  Future<ListMembershipsResponse> listMemberships({
    required String agentSpaceId,
    required String applicationId,
    int? maxResults,
    MembershipTypeFilter? memberType,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'applicationId': applicationId,
      if (maxResults != null) 'maxResults': maxResults,
      if (memberType != null) 'memberType': memberType.value,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListMemberships',
      exceptionFnMap: _exceptionFns,
    );
    return ListMembershipsResponse.fromJson(response);
  }

  /// Returns a paginated list of pentest job summaries for the specified
  /// pentest configuration.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [pentestId] :
  /// The unique identifier of the pentest to list jobs for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  Future<ListPentestJobsForPentestOutput> listPentestJobsForPentest({
    required String agentSpaceId,
    required String pentestId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'pentestId': pentestId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListPentestJobsForPentest',
      exceptionFnMap: _exceptionFns,
    );
    return ListPentestJobsForPentestOutput.fromJson(response);
  }

  /// Returns a paginated list of task summaries for the specified pentest job,
  /// optionally filtered by step name or category.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [categoryName] :
  /// Filter tasks by category name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  ///
  /// Parameter [pentestJobId] :
  /// The unique identifier of the pentest job to list tasks for.
  ///
  /// Parameter [stepName] :
  /// Filter tasks by step name. Valid values include PREFLIGHT,
  /// STATIC_ANALYSIS, PENTEST, and FINALIZING.
  Future<ListPentestJobTasksOutput> listPentestJobTasks({
    required String agentSpaceId,
    String? categoryName,
    int? maxResults,
    String? nextToken,
    String? pentestJobId,
    StepName? stepName,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      if (categoryName != null) 'categoryName': categoryName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (pentestJobId != null) 'pentestJobId': pentestJobId,
      if (stepName != null) 'stepName': stepName.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListPentestJobTasks',
      exceptionFnMap: _exceptionFns,
    );
    return ListPentestJobTasksOutput.fromJson(response);
  }

  /// Returns a paginated list of pentest summaries for the specified agent
  /// space.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to list pentests for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  Future<ListPentestsOutput> listPentests({
    required String agentSpaceId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListPentests',
      exceptionFnMap: _exceptionFns,
    );
    return ListPentestsOutput.fromJson(response);
  }

  /// Returns the tags associated with the specified resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to list tags for.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Initiates code remediation for one or more security findings. This creates
  /// pull requests in integrated repositories to fix the identified
  /// vulnerabilities.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [findingIds] :
  /// The list of finding identifiers to initiate code remediation for.
  ///
  /// Parameter [codeReviewJobId] :
  /// The unique identifier of the code review job that produced the findings.
  /// Mutually exclusive with <code>pentestJobId</code>.
  ///
  /// Parameter [pentestJobId] :
  /// The unique identifier of the pentest job that produced the findings.
  /// Mutually exclusive with <code>codeReviewJobId</code>.
  Future<void> startCodeRemediation({
    required String agentSpaceId,
    required List<String> findingIds,
    String? codeReviewJobId,
    String? pentestJobId,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'findingIds': findingIds,
      if (codeReviewJobId != null) 'codeReviewJobId': codeReviewJobId,
      if (pentestJobId != null) 'pentestJobId': pentestJobId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartCodeRemediation',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a new code review job for a code review configuration. The job
  /// executes the security-focused code analysis defined in the code review.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [codeReviewId] :
  /// The unique identifier of the code review to start a job for.
  Future<StartCodeReviewJobOutput> startCodeReviewJob({
    required String agentSpaceId,
    required String codeReviewId,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'codeReviewId': codeReviewId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartCodeReviewJob',
      exceptionFnMap: _exceptionFns,
    );
    return StartCodeReviewJobOutput.fromJson(response);
  }

  /// Starts a new pentest job for a pentest configuration. The job executes the
  /// security tests defined in the pentest.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [pentestId] :
  /// The unique identifier of the pentest to start a job for.
  Future<StartPentestJobOutput> startPentestJob({
    required String agentSpaceId,
    required String pentestId,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'pentestId': pentestId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartPentestJob',
      exceptionFnMap: _exceptionFns,
    );
    return StartPentestJobOutput.fromJson(response);
  }

  /// Stops a running code review job. The job transitions to a stopping state
  /// and then to stopped after cleanup completes.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [codeReviewJobId] :
  /// The unique identifier of the code review job to stop.
  Future<void> stopCodeReviewJob({
    required String agentSpaceId,
    required String codeReviewJobId,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'codeReviewJobId': codeReviewJobId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StopCodeReviewJob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops a running pentest job. The job transitions to a stopping state and
  /// then to stopped after cleanup completes.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [pentestJobId] :
  /// The unique identifier of the pentest job to stop.
  Future<void> stopPentestJob({
    required String agentSpaceId,
    required String pentestJobId,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'pentestJobId': pentestJobId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StopPentestJob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds tags to a resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to tag.
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

  /// Removes tags from a resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
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

  /// Updates an existing code review configuration.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the code review.
  ///
  /// Parameter [codeReviewId] :
  /// The unique identifier of the code review to update.
  ///
  /// Parameter [assets] :
  /// The updated assets for the code review.
  ///
  /// Parameter [codeRemediationStrategy] :
  /// The updated code remediation strategy for the code review.
  ///
  /// Parameter [logConfig] :
  /// The updated CloudWatch Logs configuration for the code review.
  ///
  /// Parameter [serviceRole] :
  /// The updated IAM service role for the code review.
  ///
  /// Parameter [title] :
  /// The updated title of the code review.
  Future<UpdateCodeReviewOutput> updateCodeReview({
    required String agentSpaceId,
    required String codeReviewId,
    Assets? assets,
    CodeRemediationStrategy? codeRemediationStrategy,
    CloudWatchLog? logConfig,
    String? serviceRole,
    String? title,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'codeReviewId': codeReviewId,
      if (assets != null) 'assets': assets,
      if (codeRemediationStrategy != null)
        'codeRemediationStrategy': codeRemediationStrategy.value,
      if (logConfig != null) 'logConfig': logConfig,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (title != null) 'title': title,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateCodeReview',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCodeReviewOutput.fromJson(response);
  }

  /// Updates the status or risk level of a security finding.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the finding.
  ///
  /// Parameter [findingId] :
  /// The unique identifier of the finding to update.
  ///
  /// Parameter [riskLevel] :
  /// The updated risk level for the finding.
  ///
  /// Parameter [status] :
  /// The updated status for the finding.
  Future<void> updateFinding({
    required String agentSpaceId,
    required String findingId,
    RiskLevel? riskLevel,
    FindingStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'findingId': findingId,
      if (riskLevel != null) 'riskLevel': riskLevel.value,
      if (status != null) 'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateFinding',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the integrated resources for an agent space, including their
  /// capabilities.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space.
  ///
  /// Parameter [integrationId] :
  /// The unique identifier of the integration.
  ///
  /// Parameter [items] :
  /// The list of integrated resource items to update.
  Future<void> updateIntegratedResources({
    required String agentSpaceId,
    required String integrationId,
    required List<IntegratedResourceInputItem> items,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'integrationId': integrationId,
      'items': items,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateIntegratedResources',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing pentest configuration.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space that contains the pentest.
  ///
  /// Parameter [pentestId] :
  /// The unique identifier of the pentest to update.
  ///
  /// Parameter [assets] :
  /// The updated assets for the pentest.
  ///
  /// Parameter [codeRemediationStrategy] :
  /// The updated code remediation strategy for the pentest.
  ///
  /// Parameter [excludeRiskTypes] :
  /// The updated list of risk types to exclude from the pentest.
  ///
  /// Parameter [logConfig] :
  /// The updated CloudWatch Logs configuration for the pentest.
  ///
  /// Parameter [networkTrafficConfig] :
  /// The updated network traffic configuration for the pentest.
  ///
  /// Parameter [serviceRole] :
  /// The updated IAM service role for the pentest.
  ///
  /// Parameter [title] :
  /// The updated title of the pentest.
  ///
  /// Parameter [vpcConfig] :
  /// The updated VPC configuration for the pentest.
  Future<UpdatePentestOutput> updatePentest({
    required String agentSpaceId,
    required String pentestId,
    Assets? assets,
    CodeRemediationStrategy? codeRemediationStrategy,
    List<RiskType>? excludeRiskTypes,
    CloudWatchLog? logConfig,
    NetworkTrafficConfig? networkTrafficConfig,
    String? serviceRole,
    String? title,
    VpcConfig? vpcConfig,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      'pentestId': pentestId,
      if (assets != null) 'assets': assets,
      if (codeRemediationStrategy != null)
        'codeRemediationStrategy': codeRemediationStrategy.value,
      if (excludeRiskTypes != null)
        'excludeRiskTypes': excludeRiskTypes.map((e) => e.value).toList(),
      if (logConfig != null) 'logConfig': logConfig,
      if (networkTrafficConfig != null)
        'networkTrafficConfig': networkTrafficConfig,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (title != null) 'title': title,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdatePentest',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePentestOutput.fromJson(response);
  }

  /// Initiates verification of a target domain. This checks whether the domain
  /// ownership verification token has been properly configured.
  ///
  /// Parameter [targetDomainId] :
  /// The unique identifier of the target domain to verify.
  Future<VerifyTargetDomainOutput> verifyTargetDomain({
    required String targetDomainId,
  }) async {
    final $payload = <String, dynamic>{
      'targetDomainId': targetDomainId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/VerifyTargetDomain',
      exceptionFnMap: _exceptionFns,
    );
    return VerifyTargetDomainOutput.fromJson(response);
  }

  /// Creates a new agent space. An agent space is a dedicated workspace for
  /// securing a specific application.
  ///
  /// Parameter [name] :
  /// The name of the agent space.
  ///
  /// Parameter [awsResources] :
  /// The AWS resources to associate with the agent space.
  ///
  /// Parameter [codeReviewSettings] :
  /// The code review settings for the agent space.
  ///
  /// Parameter [description] :
  /// A description of the agent space.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier of the AWS KMS key to use for encrypting data in the agent
  /// space.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the agent space.
  ///
  /// Parameter [targetDomainIds] :
  /// The list of target domain identifiers to associate with the agent space.
  Future<CreateAgentSpaceOutput> createAgentSpace({
    required String name,
    AWSResources? awsResources,
    CodeReviewSettings? codeReviewSettings,
    String? description,
    String? kmsKeyId,
    Map<String, String>? tags,
    List<String>? targetDomainIds,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (awsResources != null) 'awsResources': awsResources,
      if (codeReviewSettings != null) 'codeReviewSettings': codeReviewSettings,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (tags != null) 'tags': tags,
      if (targetDomainIds != null) 'targetDomainIds': targetDomainIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateAgentSpace',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAgentSpaceOutput.fromJson(response);
  }

  /// Updates the configuration of an existing agent space, including its name,
  /// description, AWS resources, target domains, and code review settings.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to update.
  ///
  /// Parameter [awsResources] :
  /// The updated AWS resources to associate with the agent space.
  ///
  /// Parameter [codeReviewSettings] :
  /// The updated code review settings for the agent space.
  ///
  /// Parameter [description] :
  /// The updated description of the agent space.
  ///
  /// Parameter [name] :
  /// The updated name of the agent space.
  ///
  /// Parameter [targetDomainIds] :
  /// The updated list of target domain identifiers to associate with the agent
  /// space.
  Future<UpdateAgentSpaceOutput> updateAgentSpace({
    required String agentSpaceId,
    AWSResources? awsResources,
    CodeReviewSettings? codeReviewSettings,
    String? description,
    String? name,
    List<String>? targetDomainIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
      if (awsResources != null) 'awsResources': awsResources,
      if (codeReviewSettings != null) 'codeReviewSettings': codeReviewSettings,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (targetDomainIds != null) 'targetDomainIds': targetDomainIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateAgentSpace',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAgentSpaceOutput.fromJson(response);
  }

  /// Deletes an agent space and all of its associated resources, including
  /// pentests, findings, and artifacts.
  ///
  /// Parameter [agentSpaceId] :
  /// The unique identifier of the agent space to delete.
  Future<DeleteAgentSpaceOutput> deleteAgentSpace({
    required String agentSpaceId,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceId': agentSpaceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteAgentSpace',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAgentSpaceOutput.fromJson(response);
  }

  /// Returns a paginated list of agent space summaries in your account.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  Future<ListAgentSpacesOutput> listAgentSpaces({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListAgentSpaces',
      exceptionFnMap: _exceptionFns,
    );
    return ListAgentSpacesOutput.fromJson(response);
  }

  /// Retrieves information about one or more agent spaces.
  ///
  /// Parameter [agentSpaceIds] :
  /// The list of agent space identifiers to retrieve.
  Future<BatchGetAgentSpacesOutput> batchGetAgentSpaces({
    required List<String> agentSpaceIds,
  }) async {
    final $payload = <String, dynamic>{
      'agentSpaceIds': agentSpaceIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetAgentSpaces',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetAgentSpacesOutput.fromJson(response);
  }

  /// Creates a new application. An application is the top-level organizational
  /// unit that supports IAM Identity Center integration.
  ///
  /// Parameter [defaultKmsKeyId] :
  /// The identifier of the default AWS KMS key to use for encrypting data in
  /// the application.
  ///
  /// Parameter [idcInstanceArn] :
  /// The Amazon Resource Name (ARN) of the IAM Identity Center instance to
  /// associate with the application.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to associate with the
  /// application.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the application.
  Future<CreateApplicationResponse> createApplication({
    String? defaultKmsKeyId,
    String? idcInstanceArn,
    String? roleArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (defaultKmsKeyId != null) 'defaultKmsKeyId': defaultKmsKeyId,
      if (idcInstanceArn != null) 'idcInstanceArn': idcInstanceArn,
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateApplication',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationResponse.fromJson(response);
  }

  /// Retrieves information about an application.
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application to retrieve.
  Future<GetApplicationResponse> getApplication({
    required String applicationId,
  }) async {
    final $payload = <String, dynamic>{
      'applicationId': applicationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetApplication',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationResponse.fromJson(response);
  }

  /// Updates the configuration of an existing application, including the IAM
  /// role and default KMS key.
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application to update.
  ///
  /// Parameter [defaultKmsKeyId] :
  /// The updated identifier of the default AWS KMS key for the application.
  ///
  /// Parameter [roleArn] :
  /// The updated Amazon Resource Name (ARN) of the IAM role for the
  /// application.
  Future<UpdateApplicationResponse> updateApplication({
    required String applicationId,
    String? defaultKmsKeyId,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'applicationId': applicationId,
      if (defaultKmsKeyId != null) 'defaultKmsKeyId': defaultKmsKeyId,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateApplication',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApplicationResponse.fromJson(response);
  }

  /// Deletes an application and its associated configuration, including IAM
  /// Identity Center settings.
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application to delete.
  Future<void> deleteApplication({
    required String applicationId,
  }) async {
    final $payload = <String, dynamic>{
      'applicationId': applicationId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteApplication',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a paginated list of application summaries in your account.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  Future<ListApplicationsResponse> listApplications({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListApplications',
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsResponse.fromJson(response);
  }

  /// Creates a new integration with a third-party provider, such as GitHub, for
  /// code review and remediation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [input] :
  /// The provider-specific input required to create the integration.
  ///
  /// Parameter [integrationDisplayName] :
  /// The display name for the integration.
  ///
  /// Parameter [provider] :
  /// The integration provider. Currently, only GITHUB is supported.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier of the AWS KMS key to use for encrypting data associated
  /// with the integration.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the integration.
  Future<CreateIntegrationOutput> createIntegration({
    required ProviderInput input,
    required String integrationDisplayName,
    required Provider provider,
    String? kmsKeyId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'input': input,
      'integrationDisplayName': integrationDisplayName,
      'provider': provider.value,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateIntegration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIntegrationOutput.fromJson(response);
  }

  /// Retrieves information about an integration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [integrationId] :
  /// The unique identifier of the integration to retrieve.
  Future<GetIntegrationOutput> getIntegration({
    required String integrationId,
  }) async {
    final $payload = <String, dynamic>{
      'integrationId': integrationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetIntegration',
      exceptionFnMap: _exceptionFns,
    );
    return GetIntegrationOutput.fromJson(response);
  }

  /// Deletes an integration with a third-party provider.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [integrationId] :
  /// The unique identifier of the integration to delete.
  Future<void> deleteIntegration({
    required String integrationId,
  }) async {
    final $payload = <String, dynamic>{
      'integrationId': integrationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteIntegration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the integrations in your account, optionally filtered by provider or
  /// provider type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filter] :
  /// A filter to apply to the list of integrations.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  Future<ListIntegrationsOutput> listIntegrations({
    IntegrationFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListIntegrations',
      exceptionFnMap: _exceptionFns,
    );
    return ListIntegrationsOutput.fromJson(response);
  }

  /// Creates a new target domain for penetration testing. A target domain is a
  /// web domain that must be registered and verified before it can be tested.
  ///
  /// Parameter [targetDomainName] :
  /// The domain name to register as a target domain.
  ///
  /// Parameter [verificationMethod] :
  /// The method to use for verifying domain ownership. Valid values are
  /// DNS_TXT, HTTP_ROUTE, and PRIVATE_VPC.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the target domain.
  Future<CreateTargetDomainOutput> createTargetDomain({
    required String targetDomainName,
    required DomainVerificationMethod verificationMethod,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'targetDomainName': targetDomainName,
      'verificationMethod': verificationMethod.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateTargetDomain',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTargetDomainOutput.fromJson(response);
  }

  /// Updates the verification method for a target domain.
  ///
  /// Parameter [targetDomainId] :
  /// The unique identifier of the target domain to update.
  ///
  /// Parameter [verificationMethod] :
  /// The updated verification method for the target domain.
  Future<UpdateTargetDomainOutput> updateTargetDomain({
    required String targetDomainId,
    required DomainVerificationMethod verificationMethod,
  }) async {
    final $payload = <String, dynamic>{
      'targetDomainId': targetDomainId,
      'verificationMethod': verificationMethod.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateTargetDomain',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTargetDomainOutput.fromJson(response);
  }

  /// Deletes a target domain registration. After deletion, the domain can no
  /// longer be used for penetration testing.
  ///
  /// Parameter [targetDomainId] :
  /// The unique identifier of the target domain to delete.
  Future<DeleteTargetDomainOutput> deleteTargetDomain({
    required String targetDomainId,
  }) async {
    final $payload = <String, dynamic>{
      'targetDomainId': targetDomainId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteTargetDomain',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteTargetDomainOutput.fromJson(response);
  }

  /// Returns a paginated list of target domain summaries in your account.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the nextToken value returned from the previous
  /// request.
  Future<ListTargetDomainsOutput> listTargetDomains({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTargetDomains',
      exceptionFnMap: _exceptionFns,
    );
    return ListTargetDomainsOutput.fromJson(response);
  }

  /// Retrieves information about one or more target domains.
  ///
  /// Parameter [targetDomainIds] :
  /// The list of target domain identifiers to retrieve.
  Future<BatchGetTargetDomainsOutput> batchGetTargetDomains({
    required List<String> targetDomainIds,
  }) async {
    final $payload = <String, dynamic>{
      'targetDomainIds': targetDomainIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetTargetDomains',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetTargetDomainsOutput.fromJson(response);
  }
}

/// @nodoc
class AddArtifactOutput {
  /// The unique identifier assigned to the uploaded artifact.
  final String artifactId;

  AddArtifactOutput({
    required this.artifactId,
  });

  factory AddArtifactOutput.fromJson(Map<String, dynamic> json) {
    return AddArtifactOutput(
      artifactId: (json['artifactId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final artifactId = this.artifactId;
    return {
      'artifactId': artifactId,
    };
  }
}

/// Output for the BatchDeleteCodeReviews operation.
///
/// @nodoc
class BatchDeleteCodeReviewsOutput {
  /// The list of identifiers of the code reviews that were successfully deleted.
  final List<String>? deleted;

  /// The list of code reviews that failed to delete, including the reason for
  /// each failure.
  final List<DeleteCodeReviewFailure>? failed;

  BatchDeleteCodeReviewsOutput({
    this.deleted,
    this.failed,
  });

  factory BatchDeleteCodeReviewsOutput.fromJson(Map<String, dynamic> json) {
    return BatchDeleteCodeReviewsOutput(
      deleted:
          (json['deleted'] as List?)?.nonNulls.map((e) => e as String).toList(),
      failed: (json['failed'] as List?)
          ?.nonNulls
          .map((e) =>
              DeleteCodeReviewFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deleted = this.deleted;
    final failed = this.failed;
    return {
      if (deleted != null) 'deleted': deleted,
      if (failed != null) 'failed': failed,
    };
  }
}

/// Output for the BatchDeletePentests operation.
///
/// @nodoc
class BatchDeletePentestsOutput {
  /// The list of pentests that were successfully deleted.
  final List<Pentest>? deleted;

  /// The list of pentests that failed to delete, including the reason for each
  /// failure.
  final List<DeletePentestFailure>? failed;

  BatchDeletePentestsOutput({
    this.deleted,
    this.failed,
  });

  factory BatchDeletePentestsOutput.fromJson(Map<String, dynamic> json) {
    return BatchDeletePentestsOutput(
      deleted: (json['deleted'] as List?)
          ?.nonNulls
          .map((e) => Pentest.fromJson(e as Map<String, dynamic>))
          .toList(),
      failed: (json['failed'] as List?)
          ?.nonNulls
          .map((e) => DeletePentestFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deleted = this.deleted;
    final failed = this.failed;
    return {
      if (deleted != null) 'deleted': deleted,
      if (failed != null) 'failed': failed,
    };
  }
}

/// @nodoc
class BatchGetArtifactMetadataOutput {
  /// The list of artifact metadata items that were found.
  final List<ArtifactMetadataItem> artifactMetadataList;

  BatchGetArtifactMetadataOutput({
    required this.artifactMetadataList,
  });

  factory BatchGetArtifactMetadataOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetArtifactMetadataOutput(
      artifactMetadataList: ((json['artifactMetadataList'] as List?) ??
              const [])
          .nonNulls
          .map((e) => ArtifactMetadataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final artifactMetadataList = this.artifactMetadataList;
    return {
      'artifactMetadataList': artifactMetadataList,
    };
  }
}

/// Output for the BatchGetCodeReviewJobs operation.
///
/// @nodoc
class BatchGetCodeReviewJobsOutput {
  /// The list of code review jobs that were found.
  final List<CodeReviewJob>? codeReviewJobs;

  /// The list of code review job identifiers that were not found.
  final List<String>? notFound;

  BatchGetCodeReviewJobsOutput({
    this.codeReviewJobs,
    this.notFound,
  });

  factory BatchGetCodeReviewJobsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetCodeReviewJobsOutput(
      codeReviewJobs: (json['codeReviewJobs'] as List?)
          ?.nonNulls
          .map((e) => CodeReviewJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      notFound: (json['notFound'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewJobs = this.codeReviewJobs;
    final notFound = this.notFound;
    return {
      if (codeReviewJobs != null) 'codeReviewJobs': codeReviewJobs,
      if (notFound != null) 'notFound': notFound,
    };
  }
}

/// Output for the BatchGetCodeReviewJobTasks operation.
///
/// @nodoc
class BatchGetCodeReviewJobTasksOutput {
  /// The list of code review job tasks that were found.
  final List<CodeReviewJobTask>? codeReviewJobTasks;

  /// The list of task identifiers that were not found.
  final List<String>? notFound;

  BatchGetCodeReviewJobTasksOutput({
    this.codeReviewJobTasks,
    this.notFound,
  });

  factory BatchGetCodeReviewJobTasksOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetCodeReviewJobTasksOutput(
      codeReviewJobTasks: (json['codeReviewJobTasks'] as List?)
          ?.nonNulls
          .map((e) => CodeReviewJobTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      notFound: (json['notFound'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewJobTasks = this.codeReviewJobTasks;
    final notFound = this.notFound;
    return {
      if (codeReviewJobTasks != null) 'codeReviewJobTasks': codeReviewJobTasks,
      if (notFound != null) 'notFound': notFound,
    };
  }
}

/// Output for the BatchGetCodeReviews operation.
///
/// @nodoc
class BatchGetCodeReviewsOutput {
  /// The list of code reviews that were found.
  final List<CodeReview>? codeReviews;

  /// The list of code review identifiers that were not found.
  final List<String>? notFound;

  BatchGetCodeReviewsOutput({
    this.codeReviews,
    this.notFound,
  });

  factory BatchGetCodeReviewsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetCodeReviewsOutput(
      codeReviews: (json['codeReviews'] as List?)
          ?.nonNulls
          .map((e) => CodeReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      notFound: (json['notFound'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviews = this.codeReviews;
    final notFound = this.notFound;
    return {
      if (codeReviews != null) 'codeReviews': codeReviews,
      if (notFound != null) 'notFound': notFound,
    };
  }
}

/// Output for the BatchGetFindings operation.
///
/// @nodoc
class BatchGetFindingsOutput {
  /// The list of findings that were found.
  final List<Finding>? findings;

  /// The list of finding identifiers that were not found.
  final List<String>? notFound;

  BatchGetFindingsOutput({
    this.findings,
    this.notFound,
  });

  factory BatchGetFindingsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetFindingsOutput(
      findings: (json['findings'] as List?)
          ?.nonNulls
          .map((e) => Finding.fromJson(e as Map<String, dynamic>))
          .toList(),
      notFound: (json['notFound'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    final notFound = this.notFound;
    return {
      if (findings != null) 'findings': findings,
      if (notFound != null) 'notFound': notFound,
    };
  }
}

/// Output for the BatchGetPentestJobs operation.
///
/// @nodoc
class BatchGetPentestJobsOutput {
  /// The list of pentest job identifiers that were not found.
  final List<String>? notFound;

  /// The list of pentest jobs that were found.
  final List<PentestJob>? pentestJobs;

  BatchGetPentestJobsOutput({
    this.notFound,
    this.pentestJobs,
  });

  factory BatchGetPentestJobsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetPentestJobsOutput(
      notFound: (json['notFound'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      pentestJobs: (json['pentestJobs'] as List?)
          ?.nonNulls
          .map((e) => PentestJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final notFound = this.notFound;
    final pentestJobs = this.pentestJobs;
    return {
      if (notFound != null) 'notFound': notFound,
      if (pentestJobs != null) 'pentestJobs': pentestJobs,
    };
  }
}

/// Output for the BatchGetPentestJobTasks operation.
///
/// @nodoc
class BatchGetPentestJobTasksOutput {
  /// The list of task identifiers that were not found.
  final List<String>? notFound;

  /// The list of tasks that were found.
  final List<Task>? tasks;

  BatchGetPentestJobTasksOutput({
    this.notFound,
    this.tasks,
  });

  factory BatchGetPentestJobTasksOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetPentestJobTasksOutput(
      notFound: (json['notFound'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tasks: (json['tasks'] as List?)
          ?.nonNulls
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final notFound = this.notFound;
    final tasks = this.tasks;
    return {
      if (notFound != null) 'notFound': notFound,
      if (tasks != null) 'tasks': tasks,
    };
  }
}

/// Output for the BatchGetPentests operation.
///
/// @nodoc
class BatchGetPentestsOutput {
  /// The list of pentest identifiers that were not found.
  final List<String>? notFound;

  /// The list of pentests that were found.
  final List<Pentest>? pentests;

  BatchGetPentestsOutput({
    this.notFound,
    this.pentests,
  });

  factory BatchGetPentestsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetPentestsOutput(
      notFound: (json['notFound'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      pentests: (json['pentests'] as List?)
          ?.nonNulls
          .map((e) => Pentest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final notFound = this.notFound;
    final pentests = this.pentests;
    return {
      if (notFound != null) 'notFound': notFound,
      if (pentests != null) 'pentests': pentests,
    };
  }
}

/// Output for the CreateCodeReview operation.
///
/// @nodoc
class CreateCodeReviewOutput {
  /// The unique identifier of the created code review.
  final String codeReviewId;

  /// The unique identifier of the agent space that contains the code review.
  final String? agentSpaceId;

  /// The assets included in the code review.
  final Assets? assets;

  /// The code remediation strategy for the code review.
  final CodeRemediationStrategy? codeRemediationStrategy;

  /// The date and time the code review was created, in UTC format.
  final DateTime? createdAt;

  /// The CloudWatch Logs configuration for the code review.
  final CloudWatchLog? logConfig;

  /// The IAM service role used for the code review.
  final String? serviceRole;

  /// The title of the code review.
  final String? title;

  /// The date and time the code review was last updated, in UTC format.
  final DateTime? updatedAt;

  CreateCodeReviewOutput({
    required this.codeReviewId,
    this.agentSpaceId,
    this.assets,
    this.codeRemediationStrategy,
    this.createdAt,
    this.logConfig,
    this.serviceRole,
    this.title,
    this.updatedAt,
  });

  factory CreateCodeReviewOutput.fromJson(Map<String, dynamic> json) {
    return CreateCodeReviewOutput(
      codeReviewId: (json['codeReviewId'] as String?) ?? '',
      agentSpaceId: json['agentSpaceId'] as String?,
      assets: json['assets'] != null
          ? Assets.fromJson(json['assets'] as Map<String, dynamic>)
          : null,
      codeRemediationStrategy: (json['codeRemediationStrategy'] as String?)
          ?.let(CodeRemediationStrategy.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      logConfig: json['logConfig'] != null
          ? CloudWatchLog.fromJson(json['logConfig'] as Map<String, dynamic>)
          : null,
      serviceRole: json['serviceRole'] as String?,
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewId = this.codeReviewId;
    final agentSpaceId = this.agentSpaceId;
    final assets = this.assets;
    final codeRemediationStrategy = this.codeRemediationStrategy;
    final createdAt = this.createdAt;
    final logConfig = this.logConfig;
    final serviceRole = this.serviceRole;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      'codeReviewId': codeReviewId,
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
      if (assets != null) 'assets': assets,
      if (codeRemediationStrategy != null)
        'codeRemediationStrategy': codeRemediationStrategy.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (logConfig != null) 'logConfig': logConfig,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Response structure for adding a single member to an agent space.
///
/// @nodoc
class CreateMembershipResponse {
  CreateMembershipResponse();

  factory CreateMembershipResponse.fromJson(Map<String, dynamic> _) {
    return CreateMembershipResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output for the CreatePentest operation.
///
/// @nodoc
class CreatePentestOutput {
  /// The unique identifier of the agent space that contains the pentest.
  final String? agentSpaceId;

  /// The assets included in the pentest.
  final Assets? assets;

  /// The date and time the pentest was created, in UTC format.
  final DateTime? createdAt;

  /// The list of risk types excluded from the pentest.
  final List<RiskType>? excludeRiskTypes;

  /// The CloudWatch Logs configuration for the pentest.
  final CloudWatchLog? logConfig;

  /// The unique identifier of the created pentest.
  final String? pentestId;

  /// The IAM service role used for the pentest.
  final String? serviceRole;

  /// The title of the pentest.
  final String? title;

  /// The date and time the pentest was last updated, in UTC format.
  final DateTime? updatedAt;

  CreatePentestOutput({
    this.agentSpaceId,
    this.assets,
    this.createdAt,
    this.excludeRiskTypes,
    this.logConfig,
    this.pentestId,
    this.serviceRole,
    this.title,
    this.updatedAt,
  });

  factory CreatePentestOutput.fromJson(Map<String, dynamic> json) {
    return CreatePentestOutput(
      agentSpaceId: json['agentSpaceId'] as String?,
      assets: json['assets'] != null
          ? Assets.fromJson(json['assets'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      excludeRiskTypes: (json['excludeRiskTypes'] as List?)
          ?.nonNulls
          .map((e) => RiskType.fromString((e as String)))
          .toList(),
      logConfig: json['logConfig'] != null
          ? CloudWatchLog.fromJson(json['logConfig'] as Map<String, dynamic>)
          : null,
      pentestId: json['pentestId'] as String?,
      serviceRole: json['serviceRole'] as String?,
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final assets = this.assets;
    final createdAt = this.createdAt;
    final excludeRiskTypes = this.excludeRiskTypes;
    final logConfig = this.logConfig;
    final pentestId = this.pentestId;
    final serviceRole = this.serviceRole;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
      if (assets != null) 'assets': assets,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (excludeRiskTypes != null)
        'excludeRiskTypes': excludeRiskTypes.map((e) => e.value).toList(),
      if (logConfig != null) 'logConfig': logConfig,
      if (pentestId != null) 'pentestId': pentestId,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class DeleteArtifactOutput {
  DeleteArtifactOutput();

  factory DeleteArtifactOutput.fromJson(Map<String, dynamic> _) {
    return DeleteArtifactOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response structure for removing a single member from an agent space.
///
/// @nodoc
class DeleteMembershipResponse {
  DeleteMembershipResponse();

  factory DeleteMembershipResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMembershipResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetArtifactOutput {
  /// The unique identifier of the agent space that contains the artifact.
  final String agentSpaceId;

  /// The artifact content and type.
  final Artifact artifact;

  /// The unique identifier of the artifact.
  final String artifactId;

  /// The file name of the artifact.
  final String fileName;

  /// The date and time the artifact was last updated, in UTC format.
  final DateTime updatedAt;

  GetArtifactOutput({
    required this.agentSpaceId,
    required this.artifact,
    required this.artifactId,
    required this.fileName,
    required this.updatedAt,
  });

  factory GetArtifactOutput.fromJson(Map<String, dynamic> json) {
    return GetArtifactOutput(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      artifact: Artifact.fromJson((json['artifact'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      artifactId: (json['artifactId'] as String?) ?? '',
      fileName: (json['fileName'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final artifact = this.artifact;
    final artifactId = this.artifactId;
    final fileName = this.fileName;
    final updatedAt = this.updatedAt;
    return {
      'agentSpaceId': agentSpaceId,
      'artifact': artifact,
      'artifactId': artifactId,
      'fileName': fileName,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class InitiateProviderRegistrationOutput {
  /// The CSRF state token to use when completing the OAuth flow.
  final String csrfState;

  /// The URL to redirect the user to for completing the OAuth authorization.
  final String redirectTo;

  InitiateProviderRegistrationOutput({
    required this.csrfState,
    required this.redirectTo,
  });

  factory InitiateProviderRegistrationOutput.fromJson(
      Map<String, dynamic> json) {
    return InitiateProviderRegistrationOutput(
      csrfState: (json['csrfState'] as String?) ?? '',
      redirectTo: (json['redirectTo'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final csrfState = this.csrfState;
    final redirectTo = this.redirectTo;
    return {
      'csrfState': csrfState,
      'redirectTo': redirectTo,
    };
  }
}

/// @nodoc
class ListArtifactsOutput {
  /// The list of artifact summaries.
  final List<ArtifactSummary> artifactSummaries;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListArtifactsOutput({
    required this.artifactSummaries,
    this.nextToken,
  });

  factory ListArtifactsOutput.fromJson(Map<String, dynamic> json) {
    return ListArtifactsOutput(
      artifactSummaries: ((json['artifactSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ArtifactSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactSummaries = this.artifactSummaries;
    final nextToken = this.nextToken;
    return {
      'artifactSummaries': artifactSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Output for the ListCodeReviewJobsForCodeReview operation.
///
/// @nodoc
class ListCodeReviewJobsForCodeReviewOutput {
  /// The list of code review job summaries.
  final List<CodeReviewJobSummary>? codeReviewJobSummaries;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListCodeReviewJobsForCodeReviewOutput({
    this.codeReviewJobSummaries,
    this.nextToken,
  });

  factory ListCodeReviewJobsForCodeReviewOutput.fromJson(
      Map<String, dynamic> json) {
    return ListCodeReviewJobsForCodeReviewOutput(
      codeReviewJobSummaries: (json['codeReviewJobSummaries'] as List?)
          ?.nonNulls
          .map((e) => CodeReviewJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewJobSummaries = this.codeReviewJobSummaries;
    final nextToken = this.nextToken;
    return {
      if (codeReviewJobSummaries != null)
        'codeReviewJobSummaries': codeReviewJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Output for the ListCodeReviewJobTasks operation.
///
/// @nodoc
class ListCodeReviewJobTasksOutput {
  /// The list of code review job task summaries.
  final List<CodeReviewJobTaskSummary>? codeReviewJobTaskSummaries;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListCodeReviewJobTasksOutput({
    this.codeReviewJobTaskSummaries,
    this.nextToken,
  });

  factory ListCodeReviewJobTasksOutput.fromJson(Map<String, dynamic> json) {
    return ListCodeReviewJobTasksOutput(
      codeReviewJobTaskSummaries: (json['codeReviewJobTaskSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              CodeReviewJobTaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewJobTaskSummaries = this.codeReviewJobTaskSummaries;
    final nextToken = this.nextToken;
    return {
      if (codeReviewJobTaskSummaries != null)
        'codeReviewJobTaskSummaries': codeReviewJobTaskSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Output for the ListCodeReviews operation.
///
/// @nodoc
class ListCodeReviewsOutput {
  /// The list of code review summaries.
  final List<CodeReviewSummary>? codeReviewSummaries;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListCodeReviewsOutput({
    this.codeReviewSummaries,
    this.nextToken,
  });

  factory ListCodeReviewsOutput.fromJson(Map<String, dynamic> json) {
    return ListCodeReviewsOutput(
      codeReviewSummaries: (json['codeReviewSummaries'] as List?)
          ?.nonNulls
          .map((e) => CodeReviewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewSummaries = this.codeReviewSummaries;
    final nextToken = this.nextToken;
    return {
      if (codeReviewSummaries != null)
        'codeReviewSummaries': codeReviewSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Output for the ListDiscoveredEndpoints operation.
///
/// @nodoc
class ListDiscoveredEndpointsOutput {
  /// The list of discovered endpoints.
  final List<DiscoveredEndpoint>? discoveredEndpoints;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListDiscoveredEndpointsOutput({
    this.discoveredEndpoints,
    this.nextToken,
  });

  factory ListDiscoveredEndpointsOutput.fromJson(Map<String, dynamic> json) {
    return ListDiscoveredEndpointsOutput(
      discoveredEndpoints: (json['discoveredEndpoints'] as List?)
          ?.nonNulls
          .map((e) => DiscoveredEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final discoveredEndpoints = this.discoveredEndpoints;
    final nextToken = this.nextToken;
    return {
      if (discoveredEndpoints != null)
        'discoveredEndpoints': discoveredEndpoints,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Output for the ListFindings operation.
///
/// @nodoc
class ListFindingsOutput {
  /// The list of finding summaries.
  final List<FindingSummary>? findingsSummaries;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListFindingsOutput({
    this.findingsSummaries,
    this.nextToken,
  });

  factory ListFindingsOutput.fromJson(Map<String, dynamic> json) {
    return ListFindingsOutput(
      findingsSummaries: (json['findingsSummaries'] as List?)
          ?.nonNulls
          .map((e) => FindingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findingsSummaries = this.findingsSummaries;
    final nextToken = this.nextToken;
    return {
      if (findingsSummaries != null) 'findingsSummaries': findingsSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListIntegratedResourcesOutput {
  /// The list of integrated resource summaries.
  final List<IntegratedResourceSummary> integratedResourceSummaries;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListIntegratedResourcesOutput({
    required this.integratedResourceSummaries,
    this.nextToken,
  });

  factory ListIntegratedResourcesOutput.fromJson(Map<String, dynamic> json) {
    return ListIntegratedResourcesOutput(
      integratedResourceSummaries:
          ((json['integratedResourceSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  IntegratedResourceSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integratedResourceSummaries = this.integratedResourceSummaries;
    final nextToken = this.nextToken;
    return {
      'integratedResourceSummaries': integratedResourceSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Response structure for listing members associated to an agent space.
///
/// @nodoc
class ListMembershipsResponse {
  /// The list of membership summaries.
  final List<MembershipSummary> membershipSummaries;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListMembershipsResponse({
    required this.membershipSummaries,
    this.nextToken,
  });

  factory ListMembershipsResponse.fromJson(Map<String, dynamic> json) {
    return ListMembershipsResponse(
      membershipSummaries: ((json['membershipSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => MembershipSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final membershipSummaries = this.membershipSummaries;
    final nextToken = this.nextToken;
    return {
      'membershipSummaries': membershipSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Output for the ListPentestJobsForPentest operation.
///
/// @nodoc
class ListPentestJobsForPentestOutput {
  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  /// The list of pentest job summaries.
  final List<PentestJobSummary>? pentestJobSummaries;

  ListPentestJobsForPentestOutput({
    this.nextToken,
    this.pentestJobSummaries,
  });

  factory ListPentestJobsForPentestOutput.fromJson(Map<String, dynamic> json) {
    return ListPentestJobsForPentestOutput(
      nextToken: json['nextToken'] as String?,
      pentestJobSummaries: (json['pentestJobSummaries'] as List?)
          ?.nonNulls
          .map((e) => PentestJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pentestJobSummaries = this.pentestJobSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (pentestJobSummaries != null)
        'pentestJobSummaries': pentestJobSummaries,
    };
  }
}

/// Output for the ListPentestJobTasks operation.
///
/// @nodoc
class ListPentestJobTasksOutput {
  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  /// The list of task summaries.
  final List<TaskSummary>? taskSummaries;

  ListPentestJobTasksOutput({
    this.nextToken,
    this.taskSummaries,
  });

  factory ListPentestJobTasksOutput.fromJson(Map<String, dynamic> json) {
    return ListPentestJobTasksOutput(
      nextToken: json['nextToken'] as String?,
      taskSummaries: (json['taskSummaries'] as List?)
          ?.nonNulls
          .map((e) => TaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final taskSummaries = this.taskSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (taskSummaries != null) 'taskSummaries': taskSummaries,
    };
  }
}

/// Output for the ListPentests operation.
///
/// @nodoc
class ListPentestsOutput {
  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  /// The list of pentest summaries.
  final List<PentestSummary>? pentestSummaries;

  ListPentestsOutput({
    this.nextToken,
    this.pentestSummaries,
  });

  factory ListPentestsOutput.fromJson(Map<String, dynamic> json) {
    return ListPentestsOutput(
      nextToken: json['nextToken'] as String?,
      pentestSummaries: (json['pentestSummaries'] as List?)
          ?.nonNulls
          .map((e) => PentestSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pentestSummaries = this.pentestSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (pentestSummaries != null) 'pentestSummaries': pentestSummaries,
    };
  }
}

/// Output for ListTagsForResource operation.
///
/// @nodoc
class ListTagsForResourceOutput {
  /// The tags associated with the resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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

/// Output for the StartCodeRemediation operation.
///
/// @nodoc
class StartCodeRemediationOutput {
  StartCodeRemediationOutput();

  factory StartCodeRemediationOutput.fromJson(Map<String, dynamic> _) {
    return StartCodeRemediationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output for the StartCodeReviewJob operation.
///
/// @nodoc
class StartCodeReviewJobOutput {
  /// The unique identifier of the code review.
  final String codeReviewId;

  /// The unique identifier of the started code review job.
  final String codeReviewJobId;

  /// The unique identifier of the agent space.
  final String? agentSpaceId;

  /// The date and time the code review job was created, in UTC format.
  final DateTime? createdAt;

  /// The current status of the code review job.
  final JobStatus? status;

  /// The title of the code review job.
  final String? title;

  /// The date and time the code review job was last updated, in UTC format.
  final DateTime? updatedAt;

  StartCodeReviewJobOutput({
    required this.codeReviewId,
    required this.codeReviewJobId,
    this.agentSpaceId,
    this.createdAt,
    this.status,
    this.title,
    this.updatedAt,
  });

  factory StartCodeReviewJobOutput.fromJson(Map<String, dynamic> json) {
    return StartCodeReviewJobOutput(
      codeReviewId: (json['codeReviewId'] as String?) ?? '',
      codeReviewJobId: (json['codeReviewJobId'] as String?) ?? '',
      agentSpaceId: json['agentSpaceId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      status: (json['status'] as String?)?.let(JobStatus.fromString),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewId = this.codeReviewId;
    final codeReviewJobId = this.codeReviewJobId;
    final agentSpaceId = this.agentSpaceId;
    final createdAt = this.createdAt;
    final status = this.status;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      'codeReviewId': codeReviewId,
      'codeReviewJobId': codeReviewJobId,
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (status != null) 'status': status.value,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Output for the StartPentestJob operation.
///
/// @nodoc
class StartPentestJobOutput {
  /// The unique identifier of the agent space.
  final String? agentSpaceId;

  /// The date and time the pentest job was created, in UTC format.
  final DateTime? createdAt;

  /// The unique identifier of the pentest.
  final String? pentestId;

  /// The unique identifier of the started pentest job.
  final String? pentestJobId;

  /// The current status of the pentest job.
  final JobStatus? status;

  /// The title of the pentest job.
  final String? title;

  /// The date and time the pentest job was last updated, in UTC format.
  final DateTime? updatedAt;

  StartPentestJobOutput({
    this.agentSpaceId,
    this.createdAt,
    this.pentestId,
    this.pentestJobId,
    this.status,
    this.title,
    this.updatedAt,
  });

  factory StartPentestJobOutput.fromJson(Map<String, dynamic> json) {
    return StartPentestJobOutput(
      agentSpaceId: json['agentSpaceId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      pentestId: json['pentestId'] as String?,
      pentestJobId: json['pentestJobId'] as String?,
      status: (json['status'] as String?)?.let(JobStatus.fromString),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final createdAt = this.createdAt;
    final pentestId = this.pentestId;
    final pentestJobId = this.pentestJobId;
    final status = this.status;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (pentestId != null) 'pentestId': pentestId,
      if (pentestJobId != null) 'pentestJobId': pentestJobId,
      if (status != null) 'status': status.value,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Output for the StopCodeReviewJob operation.
///
/// @nodoc
class StopCodeReviewJobOutput {
  StopCodeReviewJobOutput();

  factory StopCodeReviewJobOutput.fromJson(Map<String, dynamic> _) {
    return StopCodeReviewJobOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output for the StopPentestJob operation.
///
/// @nodoc
class StopPentestJobOutput {
  StopPentestJobOutput();

  factory StopPentestJobOutput.fromJson(Map<String, dynamic> _) {
    return StopPentestJobOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output for TagResource operation.
///
/// @nodoc
class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output for UntagResource operation.
///
/// @nodoc
class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output for the UpdateCodeReview operation.
///
/// @nodoc
class UpdateCodeReviewOutput {
  /// The unique identifier of the code review.
  final String codeReviewId;

  /// The unique identifier of the agent space that contains the code review.
  final String? agentSpaceId;

  /// The assets included in the code review.
  final Assets? assets;

  /// The code remediation strategy for the code review.
  final CodeRemediationStrategy? codeRemediationStrategy;

  /// The date and time the code review was created, in UTC format.
  final DateTime? createdAt;

  /// The CloudWatch Logs configuration for the code review.
  final CloudWatchLog? logConfig;

  /// The IAM service role used for the code review.
  final String? serviceRole;

  /// The title of the code review.
  final String? title;

  /// The date and time the code review was last updated, in UTC format.
  final DateTime? updatedAt;

  UpdateCodeReviewOutput({
    required this.codeReviewId,
    this.agentSpaceId,
    this.assets,
    this.codeRemediationStrategy,
    this.createdAt,
    this.logConfig,
    this.serviceRole,
    this.title,
    this.updatedAt,
  });

  factory UpdateCodeReviewOutput.fromJson(Map<String, dynamic> json) {
    return UpdateCodeReviewOutput(
      codeReviewId: (json['codeReviewId'] as String?) ?? '',
      agentSpaceId: json['agentSpaceId'] as String?,
      assets: json['assets'] != null
          ? Assets.fromJson(json['assets'] as Map<String, dynamic>)
          : null,
      codeRemediationStrategy: (json['codeRemediationStrategy'] as String?)
          ?.let(CodeRemediationStrategy.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      logConfig: json['logConfig'] != null
          ? CloudWatchLog.fromJson(json['logConfig'] as Map<String, dynamic>)
          : null,
      serviceRole: json['serviceRole'] as String?,
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewId = this.codeReviewId;
    final agentSpaceId = this.agentSpaceId;
    final assets = this.assets;
    final codeRemediationStrategy = this.codeRemediationStrategy;
    final createdAt = this.createdAt;
    final logConfig = this.logConfig;
    final serviceRole = this.serviceRole;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      'codeReviewId': codeReviewId,
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
      if (assets != null) 'assets': assets,
      if (codeRemediationStrategy != null)
        'codeRemediationStrategy': codeRemediationStrategy.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (logConfig != null) 'logConfig': logConfig,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Output for the UpdateFinding operation.
///
/// @nodoc
class UpdateFindingOutput {
  UpdateFindingOutput();

  factory UpdateFindingOutput.fromJson(Map<String, dynamic> _) {
    return UpdateFindingOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateIntegratedResourcesOutput {
  UpdateIntegratedResourcesOutput();

  factory UpdateIntegratedResourcesOutput.fromJson(Map<String, dynamic> _) {
    return UpdateIntegratedResourcesOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output for the UpdatePentest operation.
///
/// @nodoc
class UpdatePentestOutput {
  /// The unique identifier of the agent space that contains the pentest.
  final String? agentSpaceId;

  /// The assets included in the pentest.
  final Assets? assets;

  /// The date and time the pentest was created, in UTC format.
  final DateTime? createdAt;

  /// The list of risk types excluded from the pentest.
  final List<RiskType>? excludeRiskTypes;

  /// The CloudWatch Logs configuration for the pentest.
  final CloudWatchLog? logConfig;

  /// The unique identifier of the pentest.
  final String? pentestId;

  /// The IAM service role used for the pentest.
  final String? serviceRole;

  /// The title of the pentest.
  final String? title;

  /// The date and time the pentest was last updated, in UTC format.
  final DateTime? updatedAt;

  UpdatePentestOutput({
    this.agentSpaceId,
    this.assets,
    this.createdAt,
    this.excludeRiskTypes,
    this.logConfig,
    this.pentestId,
    this.serviceRole,
    this.title,
    this.updatedAt,
  });

  factory UpdatePentestOutput.fromJson(Map<String, dynamic> json) {
    return UpdatePentestOutput(
      agentSpaceId: json['agentSpaceId'] as String?,
      assets: json['assets'] != null
          ? Assets.fromJson(json['assets'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      excludeRiskTypes: (json['excludeRiskTypes'] as List?)
          ?.nonNulls
          .map((e) => RiskType.fromString((e as String)))
          .toList(),
      logConfig: json['logConfig'] != null
          ? CloudWatchLog.fromJson(json['logConfig'] as Map<String, dynamic>)
          : null,
      pentestId: json['pentestId'] as String?,
      serviceRole: json['serviceRole'] as String?,
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final assets = this.assets;
    final createdAt = this.createdAt;
    final excludeRiskTypes = this.excludeRiskTypes;
    final logConfig = this.logConfig;
    final pentestId = this.pentestId;
    final serviceRole = this.serviceRole;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
      if (assets != null) 'assets': assets,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (excludeRiskTypes != null)
        'excludeRiskTypes': excludeRiskTypes.map((e) => e.value).toList(),
      if (logConfig != null) 'logConfig': logConfig,
      if (pentestId != null) 'pentestId': pentestId,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Output for verifying ownership for a registered target domain in an agent
/// space.
///
/// @nodoc
class VerifyTargetDomainOutput {
  /// The date and time the target domain was created, in UTC format.
  final DateTime? createdAt;

  /// The domain name of the target domain.
  final String? domainName;

  /// The verification status of the target domain.
  final TargetDomainStatus? status;

  /// The unique identifier of the target domain.
  final String? targetDomainId;

  /// The date and time the target domain was last updated, in UTC format.
  final DateTime? updatedAt;

  /// The reason for the current target domain verification status.
  final String? verificationStatusReason;

  /// The date and time the target domain was verified, in UTC format.
  final DateTime? verifiedAt;

  VerifyTargetDomainOutput({
    this.createdAt,
    this.domainName,
    this.status,
    this.targetDomainId,
    this.updatedAt,
    this.verificationStatusReason,
    this.verifiedAt,
  });

  factory VerifyTargetDomainOutput.fromJson(Map<String, dynamic> json) {
    return VerifyTargetDomainOutput(
      createdAt: timeStampFromJson(json['createdAt']),
      domainName: json['domainName'] as String?,
      status: (json['status'] as String?)?.let(TargetDomainStatus.fromString),
      targetDomainId: json['targetDomainId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      verificationStatusReason: json['verificationStatusReason'] as String?,
      verifiedAt: timeStampFromJson(json['verifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final status = this.status;
    final targetDomainId = this.targetDomainId;
    final updatedAt = this.updatedAt;
    final verificationStatusReason = this.verificationStatusReason;
    final verifiedAt = this.verifiedAt;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (domainName != null) 'domainName': domainName,
      if (status != null) 'status': status.value,
      if (targetDomainId != null) 'targetDomainId': targetDomainId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (verificationStatusReason != null)
        'verificationStatusReason': verificationStatusReason,
      if (verifiedAt != null) 'verifiedAt': iso8601ToJson(verifiedAt),
    };
  }
}

/// Output for the CreateAgentSpace operation.
///
/// @nodoc
class CreateAgentSpaceOutput {
  /// The unique identifier of the created agent space.
  final String agentSpaceId;

  /// The name of the agent space.
  final String name;

  /// The AWS resources associated with the agent space.
  final AWSResources? awsResources;

  /// The code review settings for the agent space.
  final CodeReviewSettings? codeReviewSettings;

  /// The date and time the agent space was created, in UTC format.
  final DateTime? createdAt;

  /// The description of the agent space.
  final String? description;

  /// The identifier of the AWS KMS key used to encrypt data in the agent space.
  final String? kmsKeyId;

  /// The list of target domain identifiers associated with the agent space.
  final List<String>? targetDomainIds;

  /// The date and time the agent space was last updated, in UTC format.
  final DateTime? updatedAt;

  CreateAgentSpaceOutput({
    required this.agentSpaceId,
    required this.name,
    this.awsResources,
    this.codeReviewSettings,
    this.createdAt,
    this.description,
    this.kmsKeyId,
    this.targetDomainIds,
    this.updatedAt,
  });

  factory CreateAgentSpaceOutput.fromJson(Map<String, dynamic> json) {
    return CreateAgentSpaceOutput(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      awsResources: json['awsResources'] != null
          ? AWSResources.fromJson(json['awsResources'] as Map<String, dynamic>)
          : null,
      codeReviewSettings: json['codeReviewSettings'] != null
          ? CodeReviewSettings.fromJson(
              json['codeReviewSettings'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      targetDomainIds: (json['targetDomainIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final name = this.name;
    final awsResources = this.awsResources;
    final codeReviewSettings = this.codeReviewSettings;
    final createdAt = this.createdAt;
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final targetDomainIds = this.targetDomainIds;
    final updatedAt = this.updatedAt;
    return {
      'agentSpaceId': agentSpaceId,
      'name': name,
      if (awsResources != null) 'awsResources': awsResources,
      if (codeReviewSettings != null) 'codeReviewSettings': codeReviewSettings,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (targetDomainIds != null) 'targetDomainIds': targetDomainIds,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Output for the UpdateAgentSpace operation.
///
/// @nodoc
class UpdateAgentSpaceOutput {
  /// The unique identifier of the updated agent space.
  final String agentSpaceId;

  /// The name of the agent space.
  final String name;

  /// The AWS resources associated with the agent space.
  final AWSResources? awsResources;

  /// The code review settings for the agent space.
  final CodeReviewSettings? codeReviewSettings;

  /// The date and time the agent space was created, in UTC format.
  final DateTime? createdAt;

  /// The description of the agent space.
  final String? description;

  /// The list of target domain identifiers associated with the agent space.
  final List<String>? targetDomainIds;

  /// The date and time the agent space was last updated, in UTC format.
  final DateTime? updatedAt;

  UpdateAgentSpaceOutput({
    required this.agentSpaceId,
    required this.name,
    this.awsResources,
    this.codeReviewSettings,
    this.createdAt,
    this.description,
    this.targetDomainIds,
    this.updatedAt,
  });

  factory UpdateAgentSpaceOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAgentSpaceOutput(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      awsResources: json['awsResources'] != null
          ? AWSResources.fromJson(json['awsResources'] as Map<String, dynamic>)
          : null,
      codeReviewSettings: json['codeReviewSettings'] != null
          ? CodeReviewSettings.fromJson(
              json['codeReviewSettings'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      targetDomainIds: (json['targetDomainIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final name = this.name;
    final awsResources = this.awsResources;
    final codeReviewSettings = this.codeReviewSettings;
    final createdAt = this.createdAt;
    final description = this.description;
    final targetDomainIds = this.targetDomainIds;
    final updatedAt = this.updatedAt;
    return {
      'agentSpaceId': agentSpaceId,
      'name': name,
      if (awsResources != null) 'awsResources': awsResources,
      if (codeReviewSettings != null) 'codeReviewSettings': codeReviewSettings,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (targetDomainIds != null) 'targetDomainIds': targetDomainIds,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Output for the DeleteAgentSpace operation.
///
/// @nodoc
class DeleteAgentSpaceOutput {
  /// The unique identifier of the deleted agent space.
  final String? agentSpaceId;

  DeleteAgentSpaceOutput({
    this.agentSpaceId,
  });

  factory DeleteAgentSpaceOutput.fromJson(Map<String, dynamic> json) {
    return DeleteAgentSpaceOutput(
      agentSpaceId: json['agentSpaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    return {
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
    };
  }
}

/// Output for the ListAgentSpaces operation.
///
/// @nodoc
class ListAgentSpacesOutput {
  /// The list of agent space summaries.
  final List<AgentSpaceSummary>? agentSpaceSummaries;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListAgentSpacesOutput({
    this.agentSpaceSummaries,
    this.nextToken,
  });

  factory ListAgentSpacesOutput.fromJson(Map<String, dynamic> json) {
    return ListAgentSpacesOutput(
      agentSpaceSummaries: (json['agentSpaceSummaries'] as List?)
          ?.nonNulls
          .map((e) => AgentSpaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceSummaries = this.agentSpaceSummaries;
    final nextToken = this.nextToken;
    return {
      if (agentSpaceSummaries != null)
        'agentSpaceSummaries': agentSpaceSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Output for the BatchGetAgentSpaces operation.
///
/// @nodoc
class BatchGetAgentSpacesOutput {
  /// The list of agent spaces that were found.
  final List<AgentSpace>? agentSpaces;

  /// The list of agent space identifiers that were not found.
  final List<String>? notFound;

  BatchGetAgentSpacesOutput({
    this.agentSpaces,
    this.notFound,
  });

  factory BatchGetAgentSpacesOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetAgentSpacesOutput(
      agentSpaces: (json['agentSpaces'] as List?)
          ?.nonNulls
          .map((e) => AgentSpace.fromJson(e as Map<String, dynamic>))
          .toList(),
      notFound: (json['notFound'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaces = this.agentSpaces;
    final notFound = this.notFound;
    return {
      if (agentSpaces != null) 'agentSpaces': agentSpaces,
      if (notFound != null) 'notFound': notFound,
    };
  }
}

/// @nodoc
class CreateApplicationResponse {
  /// The unique identifier of the created application.
  final String applicationId;

  CreateApplicationResponse({
    required this.applicationId,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      applicationId: (json['applicationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    return {
      'applicationId': applicationId,
    };
  }
}

/// @nodoc
class GetApplicationResponse {
  /// The unique identifier of the application.
  final String applicationId;

  /// The domain associated with the application.
  final String domain;

  /// The name of the application.
  final String? applicationName;

  /// The identifier of the default AWS KMS key used to encrypt data for the
  /// application.
  final String? defaultKmsKeyId;

  /// The IAM Identity Center configuration for the application.
  final IdCConfiguration? idcConfiguration;

  /// The Amazon Resource Name (ARN) of the IAM role associated with the
  /// application.
  final String? roleArn;

  GetApplicationResponse({
    required this.applicationId,
    required this.domain,
    this.applicationName,
    this.defaultKmsKeyId,
    this.idcConfiguration,
    this.roleArn,
  });

  factory GetApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationResponse(
      applicationId: (json['applicationId'] as String?) ?? '',
      domain: (json['domain'] as String?) ?? '',
      applicationName: json['applicationName'] as String?,
      defaultKmsKeyId: json['defaultKmsKeyId'] as String?,
      idcConfiguration: json['idcConfiguration'] != null
          ? IdCConfiguration.fromJson(
              json['idcConfiguration'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final domain = this.domain;
    final applicationName = this.applicationName;
    final defaultKmsKeyId = this.defaultKmsKeyId;
    final idcConfiguration = this.idcConfiguration;
    final roleArn = this.roleArn;
    return {
      'applicationId': applicationId,
      'domain': domain,
      if (applicationName != null) 'applicationName': applicationName,
      if (defaultKmsKeyId != null) 'defaultKmsKeyId': defaultKmsKeyId,
      if (idcConfiguration != null) 'idcConfiguration': idcConfiguration,
      if (roleArn != null) 'roleArn': roleArn,
    };
  }
}

/// @nodoc
class UpdateApplicationResponse {
  /// The unique identifier of the updated application.
  final String applicationId;

  UpdateApplicationResponse({
    required this.applicationId,
  });

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApplicationResponse(
      applicationId: (json['applicationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    return {
      'applicationId': applicationId,
    };
  }
}

/// @nodoc
class ListApplicationsResponse {
  /// The list of application summaries.
  final List<ApplicationSummary> applicationSummaries;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListApplicationsResponse({
    required this.applicationSummaries,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applicationSummaries: ((json['applicationSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationSummaries = this.applicationSummaries;
    final nextToken = this.nextToken;
    return {
      'applicationSummaries': applicationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateIntegrationOutput {
  /// The unique identifier of the created integration.
  final String integrationId;

  CreateIntegrationOutput({
    required this.integrationId,
  });

  factory CreateIntegrationOutput.fromJson(Map<String, dynamic> json) {
    return CreateIntegrationOutput(
      integrationId: (json['integrationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final integrationId = this.integrationId;
    return {
      'integrationId': integrationId,
    };
  }
}

/// @nodoc
class GetIntegrationOutput {
  /// The installation identifier from the integration provider.
  final String installationId;

  /// The unique identifier of the integration.
  final String integrationId;

  /// The integration provider.
  final Provider provider;

  /// The type of the integration provider.
  final ProviderType providerType;

  /// The display name of the integration.
  final String? displayName;

  /// The identifier of the AWS KMS key used to encrypt data associated with the
  /// integration.
  final String? kmsKeyId;

  GetIntegrationOutput({
    required this.installationId,
    required this.integrationId,
    required this.provider,
    required this.providerType,
    this.displayName,
    this.kmsKeyId,
  });

  factory GetIntegrationOutput.fromJson(Map<String, dynamic> json) {
    return GetIntegrationOutput(
      installationId: (json['installationId'] as String?) ?? '',
      integrationId: (json['integrationId'] as String?) ?? '',
      provider: Provider.fromString((json['provider'] as String?) ?? ''),
      providerType:
          ProviderType.fromString((json['providerType'] as String?) ?? ''),
      displayName: json['displayName'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final installationId = this.installationId;
    final integrationId = this.integrationId;
    final provider = this.provider;
    final providerType = this.providerType;
    final displayName = this.displayName;
    final kmsKeyId = this.kmsKeyId;
    return {
      'installationId': installationId,
      'integrationId': integrationId,
      'provider': provider.value,
      'providerType': providerType.value,
      if (displayName != null) 'displayName': displayName,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
    };
  }
}

/// @nodoc
class DeleteIntegrationOutput {
  DeleteIntegrationOutput();

  factory DeleteIntegrationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteIntegrationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListIntegrationsOutput {
  /// The list of integration summaries.
  final List<IntegrationSummary> integrationSummaries;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  ListIntegrationsOutput({
    required this.integrationSummaries,
    this.nextToken,
  });

  factory ListIntegrationsOutput.fromJson(Map<String, dynamic> json) {
    return ListIntegrationsOutput(
      integrationSummaries: ((json['integrationSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => IntegrationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integrationSummaries = this.integrationSummaries;
    final nextToken = this.nextToken;
    return {
      'integrationSummaries': integrationSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Output for the CreateTargetDomain operation.
///
/// @nodoc
class CreateTargetDomainOutput {
  /// The domain name of the target domain.
  final String domainName;

  /// The unique identifier of the created target domain.
  final String targetDomainId;

  /// The current verification status of the target domain.
  final TargetDomainStatus verificationStatus;

  /// The date and time the target domain was created, in UTC format.
  final DateTime? createdAt;

  /// The verification details for the target domain, including the verification
  /// token and instructions.
  final VerificationDetails? verificationDetails;

  /// The reason for the current target domain verification status.
  final String? verificationStatusReason;

  /// The date and time the target domain was verified, in UTC format.
  final DateTime? verifiedAt;

  CreateTargetDomainOutput({
    required this.domainName,
    required this.targetDomainId,
    required this.verificationStatus,
    this.createdAt,
    this.verificationDetails,
    this.verificationStatusReason,
    this.verifiedAt,
  });

  factory CreateTargetDomainOutput.fromJson(Map<String, dynamic> json) {
    return CreateTargetDomainOutput(
      domainName: (json['domainName'] as String?) ?? '',
      targetDomainId: (json['targetDomainId'] as String?) ?? '',
      verificationStatus: TargetDomainStatus.fromString(
          (json['verificationStatus'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['createdAt']),
      verificationDetails: json['verificationDetails'] != null
          ? VerificationDetails.fromJson(
              json['verificationDetails'] as Map<String, dynamic>)
          : null,
      verificationStatusReason: json['verificationStatusReason'] as String?,
      verifiedAt: timeStampFromJson(json['verifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final targetDomainId = this.targetDomainId;
    final verificationStatus = this.verificationStatus;
    final createdAt = this.createdAt;
    final verificationDetails = this.verificationDetails;
    final verificationStatusReason = this.verificationStatusReason;
    final verifiedAt = this.verifiedAt;
    return {
      'domainName': domainName,
      'targetDomainId': targetDomainId,
      'verificationStatus': verificationStatus.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (verificationDetails != null)
        'verificationDetails': verificationDetails,
      if (verificationStatusReason != null)
        'verificationStatusReason': verificationStatusReason,
      if (verifiedAt != null) 'verifiedAt': iso8601ToJson(verifiedAt),
    };
  }
}

/// Output for the UpdateTargetDomain operation.
///
/// @nodoc
class UpdateTargetDomainOutput {
  /// The domain name of the target domain.
  final String domainName;

  /// The unique identifier of the target domain.
  final String targetDomainId;

  /// The current verification status of the target domain.
  final TargetDomainStatus verificationStatus;

  /// The date and time the target domain was created, in UTC format.
  final DateTime? createdAt;

  /// The updated verification details for the target domain.
  final VerificationDetails? verificationDetails;

  /// The reason for the current target domain verification status.
  final String? verificationStatusReason;

  /// The date and time the target domain was verified, in UTC format.
  final DateTime? verifiedAt;

  UpdateTargetDomainOutput({
    required this.domainName,
    required this.targetDomainId,
    required this.verificationStatus,
    this.createdAt,
    this.verificationDetails,
    this.verificationStatusReason,
    this.verifiedAt,
  });

  factory UpdateTargetDomainOutput.fromJson(Map<String, dynamic> json) {
    return UpdateTargetDomainOutput(
      domainName: (json['domainName'] as String?) ?? '',
      targetDomainId: (json['targetDomainId'] as String?) ?? '',
      verificationStatus: TargetDomainStatus.fromString(
          (json['verificationStatus'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['createdAt']),
      verificationDetails: json['verificationDetails'] != null
          ? VerificationDetails.fromJson(
              json['verificationDetails'] as Map<String, dynamic>)
          : null,
      verificationStatusReason: json['verificationStatusReason'] as String?,
      verifiedAt: timeStampFromJson(json['verifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final targetDomainId = this.targetDomainId;
    final verificationStatus = this.verificationStatus;
    final createdAt = this.createdAt;
    final verificationDetails = this.verificationDetails;
    final verificationStatusReason = this.verificationStatusReason;
    final verifiedAt = this.verifiedAt;
    return {
      'domainName': domainName,
      'targetDomainId': targetDomainId,
      'verificationStatus': verificationStatus.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (verificationDetails != null)
        'verificationDetails': verificationDetails,
      if (verificationStatusReason != null)
        'verificationStatusReason': verificationStatusReason,
      if (verifiedAt != null) 'verifiedAt': iso8601ToJson(verifiedAt),
    };
  }
}

/// Output for the DeleteTargetDomain operation.
///
/// @nodoc
class DeleteTargetDomainOutput {
  /// The unique identifier of the deleted target domain.
  final String? targetDomainId;

  DeleteTargetDomainOutput({
    this.targetDomainId,
  });

  factory DeleteTargetDomainOutput.fromJson(Map<String, dynamic> json) {
    return DeleteTargetDomainOutput(
      targetDomainId: json['targetDomainId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetDomainId = this.targetDomainId;
    return {
      if (targetDomainId != null) 'targetDomainId': targetDomainId,
    };
  }
}

/// Output for the ListTargetDomains operation.
///
/// @nodoc
class ListTargetDomainsOutput {
  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the nextToken value returned from the previous request.
  final String? nextToken;

  /// The list of target domain summaries.
  final List<TargetDomainSummary>? targetDomainSummaries;

  ListTargetDomainsOutput({
    this.nextToken,
    this.targetDomainSummaries,
  });

  factory ListTargetDomainsOutput.fromJson(Map<String, dynamic> json) {
    return ListTargetDomainsOutput(
      nextToken: json['nextToken'] as String?,
      targetDomainSummaries: (json['targetDomainSummaries'] as List?)
          ?.nonNulls
          .map((e) => TargetDomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final targetDomainSummaries = this.targetDomainSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (targetDomainSummaries != null)
        'targetDomainSummaries': targetDomainSummaries,
    };
  }
}

/// Output for the BatchGetTargetDomains operation.
///
/// @nodoc
class BatchGetTargetDomainsOutput {
  /// The list of target domain identifiers that were not found.
  final List<String>? notFound;

  /// The list of target domains that were found.
  final List<TargetDomain>? targetDomains;

  BatchGetTargetDomainsOutput({
    this.notFound,
    this.targetDomains,
  });

  factory BatchGetTargetDomainsOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetTargetDomainsOutput(
      notFound: (json['notFound'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      targetDomains: (json['targetDomains'] as List?)
          ?.nonNulls
          .map((e) => TargetDomain.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final notFound = this.notFound;
    final targetDomains = this.targetDomains;
    return {
      if (notFound != null) 'notFound': notFound,
      if (targetDomains != null) 'targetDomains': targetDomains,
    };
  }
}

/// Represents a target domain registered for penetration testing. A target
/// domain must be verified through DNS TXT or HTTP route verification before it
/// can be used in pentests.
///
/// @nodoc
class TargetDomain {
  /// The domain name of the target domain.
  final String domainName;

  /// The unique identifier of the target domain.
  final String targetDomainId;

  /// The date and time the target domain was created, in UTC format.
  final DateTime? createdAt;

  /// The verification details for the target domain.
  final VerificationDetails? verificationDetails;

  /// The current verification status of the target domain.
  final TargetDomainStatus? verificationStatus;

  /// The reason for the current target domain verification status.
  final String? verificationStatusReason;

  /// The date and time the target domain was verified, in UTC format.
  final DateTime? verifiedAt;

  TargetDomain({
    required this.domainName,
    required this.targetDomainId,
    this.createdAt,
    this.verificationDetails,
    this.verificationStatus,
    this.verificationStatusReason,
    this.verifiedAt,
  });

  factory TargetDomain.fromJson(Map<String, dynamic> json) {
    return TargetDomain(
      domainName: (json['domainName'] as String?) ?? '',
      targetDomainId: (json['targetDomainId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      verificationDetails: json['verificationDetails'] != null
          ? VerificationDetails.fromJson(
              json['verificationDetails'] as Map<String, dynamic>)
          : null,
      verificationStatus: (json['verificationStatus'] as String?)
          ?.let(TargetDomainStatus.fromString),
      verificationStatusReason: json['verificationStatusReason'] as String?,
      verifiedAt: timeStampFromJson(json['verifiedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final targetDomainId = this.targetDomainId;
    final createdAt = this.createdAt;
    final verificationDetails = this.verificationDetails;
    final verificationStatus = this.verificationStatus;
    final verificationStatusReason = this.verificationStatusReason;
    final verifiedAt = this.verifiedAt;
    return {
      'domainName': domainName,
      'targetDomainId': targetDomainId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (verificationDetails != null)
        'verificationDetails': verificationDetails,
      if (verificationStatus != null)
        'verificationStatus': verificationStatus.value,
      if (verificationStatusReason != null)
        'verificationStatusReason': verificationStatusReason,
      if (verifiedAt != null) 'verifiedAt': iso8601ToJson(verifiedAt),
    };
  }
}

/// Verification status of a target domain.
///
/// @nodoc
class TargetDomainStatus {
  static const pending = TargetDomainStatus._('PENDING');
  static const verified = TargetDomainStatus._('VERIFIED');
  static const failed = TargetDomainStatus._('FAILED');
  static const unreachable = TargetDomainStatus._('UNREACHABLE');

  final String value;

  const TargetDomainStatus._(this.value);

  static const values = [pending, verified, failed, unreachable];

  static TargetDomainStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetDomainStatus._(value));

  @override
  bool operator ==(other) =>
      other is TargetDomainStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the verification details for a target domain, including the
/// verification method and provider-specific details.
///
/// @nodoc
class VerificationDetails {
  /// The DNS TXT verification details.
  final DnsVerification? dnsTxt;

  /// The HTTP route verification details.
  final HttpVerification? httpRoute;

  /// The verification method used for the target domain.
  final DomainVerificationMethod? method;

  VerificationDetails({
    this.dnsTxt,
    this.httpRoute,
    this.method,
  });

  factory VerificationDetails.fromJson(Map<String, dynamic> json) {
    return VerificationDetails(
      dnsTxt: json['dnsTxt'] != null
          ? DnsVerification.fromJson(json['dnsTxt'] as Map<String, dynamic>)
          : null,
      httpRoute: json['httpRoute'] != null
          ? HttpVerification.fromJson(json['httpRoute'] as Map<String, dynamic>)
          : null,
      method:
          (json['method'] as String?)?.let(DomainVerificationMethod.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final dnsTxt = this.dnsTxt;
    final httpRoute = this.httpRoute;
    final method = this.method;
    return {
      if (dnsTxt != null) 'dnsTxt': dnsTxt,
      if (httpRoute != null) 'httpRoute': httpRoute,
      if (method != null) 'method': method.value,
    };
  }
}

/// Method used to verify domain ownership.
///
/// @nodoc
class DomainVerificationMethod {
  static const dnsTxt = DomainVerificationMethod._('DNS_TXT');
  static const httpRoute = DomainVerificationMethod._('HTTP_ROUTE');
  static const privateVpc = DomainVerificationMethod._('PRIVATE_VPC');

  final String value;

  const DomainVerificationMethod._(this.value);

  static const values = [dnsTxt, httpRoute, privateVpc];

  static DomainVerificationMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DomainVerificationMethod._(value));

  @override
  bool operator ==(other) =>
      other is DomainVerificationMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains DNS verification details for a target domain, including the DNS
/// record to create for domain ownership verification.
///
/// @nodoc
class DnsVerification {
  /// The name of the DNS record to create for verification.
  final String? dnsRecordName;

  /// The type of DNS record to create. Currently, only TXT is supported.
  final DNSRecordType? dnsRecordType;

  /// The verification token to include in the DNS record value.
  final String? token;

  DnsVerification({
    this.dnsRecordName,
    this.dnsRecordType,
    this.token,
  });

  factory DnsVerification.fromJson(Map<String, dynamic> json) {
    return DnsVerification(
      dnsRecordName: json['dnsRecordName'] as String?,
      dnsRecordType:
          (json['dnsRecordType'] as String?)?.let(DNSRecordType.fromString),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dnsRecordName = this.dnsRecordName;
    final dnsRecordType = this.dnsRecordType;
    final token = this.token;
    return {
      if (dnsRecordName != null) 'dnsRecordName': dnsRecordName,
      if (dnsRecordType != null) 'dnsRecordType': dnsRecordType.value,
      if (token != null) 'token': token,
    };
  }
}

/// Contains HTTP route verification details for a target domain, including the
/// route path and token to serve for domain ownership verification.
///
/// @nodoc
class HttpVerification {
  /// The HTTP route path where the verification token must be served.
  final String? routePath;

  /// The verification token to serve at the specified route path.
  final String? token;

  HttpVerification({
    this.routePath,
    this.token,
  });

  factory HttpVerification.fromJson(Map<String, dynamic> json) {
    return HttpVerification(
      routePath: json['routePath'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routePath = this.routePath;
    final token = this.token;
    return {
      if (routePath != null) 'routePath': routePath,
      if (token != null) 'token': token,
    };
  }
}

/// Type of DNS record.
///
/// @nodoc
class DNSRecordType {
  static const txt = DNSRecordType._('TXT');

  final String value;

  const DNSRecordType._(this.value);

  static const values = [txt];

  static DNSRecordType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DNSRecordType._(value));

  @override
  bool operator ==(other) => other is DNSRecordType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a target domain.
///
/// @nodoc
class TargetDomainSummary {
  /// The domain name of the target domain.
  final String domainName;

  /// The unique identifier of the target domain.
  final String targetDomainId;

  /// The current verification status of the target domain.
  final TargetDomainStatus? verificationStatus;

  TargetDomainSummary({
    required this.domainName,
    required this.targetDomainId,
    this.verificationStatus,
  });

  factory TargetDomainSummary.fromJson(Map<String, dynamic> json) {
    return TargetDomainSummary(
      domainName: (json['domainName'] as String?) ?? '',
      targetDomainId: (json['targetDomainId'] as String?) ?? '',
      verificationStatus: (json['verificationStatus'] as String?)
          ?.let(TargetDomainStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final targetDomainId = this.targetDomainId;
    final verificationStatus = this.verificationStatus;
    return {
      'domainName': domainName,
      'targetDomainId': targetDomainId,
      if (verificationStatus != null)
        'verificationStatus': verificationStatus.value,
    };
  }
}

/// Contains summary information about an integration.
///
/// @nodoc
class IntegrationSummary {
  /// The display name of the integration.
  final String displayName;

  /// The installation identifier from the integration provider.
  final String installationId;

  /// The unique identifier of the integration.
  final String integrationId;

  /// The integration provider.
  final Provider provider;

  /// The type of the integration provider.
  final ProviderType providerType;

  IntegrationSummary({
    required this.displayName,
    required this.installationId,
    required this.integrationId,
    required this.provider,
    required this.providerType,
  });

  factory IntegrationSummary.fromJson(Map<String, dynamic> json) {
    return IntegrationSummary(
      displayName: (json['displayName'] as String?) ?? '',
      installationId: (json['installationId'] as String?) ?? '',
      integrationId: (json['integrationId'] as String?) ?? '',
      provider: Provider.fromString((json['provider'] as String?) ?? ''),
      providerType:
          ProviderType.fromString((json['providerType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final installationId = this.installationId;
    final integrationId = this.integrationId;
    final provider = this.provider;
    final providerType = this.providerType;
    return {
      'displayName': displayName,
      'installationId': installationId,
      'integrationId': integrationId,
      'provider': provider.value,
      'providerType': providerType.value,
    };
  }
}

/// Third-party provider type.
///
/// @nodoc
class Provider {
  static const github = Provider._('GITHUB');

  final String value;

  const Provider._(this.value);

  static const values = [github];

  static Provider fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Provider._(value));

  @override
  bool operator ==(other) => other is Provider && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Type of provider integration.
///
/// @nodoc
class ProviderType {
  static const sourceCode = ProviderType._('SOURCE_CODE');
  static const documentation = ProviderType._('DOCUMENTATION');

  final String value;

  const ProviderType._(this.value);

  static const values = [sourceCode, documentation];

  static ProviderType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ProviderType._(value));

  @override
  bool operator ==(other) => other is ProviderType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter for listing integrations. This is a union type where you can filter
/// by provider or provider type.
///
/// @nodoc
class IntegrationFilter {
  /// Filter integrations by provider.
  final Provider? provider;

  /// Filter integrations by provider type.
  final ProviderType? providerType;

  IntegrationFilter({
    this.provider,
    this.providerType,
  });

  Map<String, dynamic> toJson() {
    final provider = this.provider;
    final providerType = this.providerType;
    return {
      if (provider != null) 'provider': provider.value,
      if (providerType != null) 'providerType': providerType.value,
    };
  }
}

/// The provider-specific input for creating an integration. This is a union
/// type that contains provider-specific configuration.
///
/// @nodoc
class ProviderInput {
  /// The GitHub-specific input for creating an integration.
  final GitHubIntegrationInput? github;

  ProviderInput({
    this.github,
  });

  Map<String, dynamic> toJson() {
    final github = this.github;
    return {
      if (github != null) 'github': github,
    };
  }
}

/// The input required to create a GitHub integration, including the OAuth
/// authorization code and CSRF state.
///
/// @nodoc
class GitHubIntegrationInput {
  /// The OAuth authorization code received from GitHub.
  final String code;

  /// The CSRF state token for validating the OAuth flow.
  final String state;

  /// The name of the GitHub organization to integrate with.
  final String? organizationName;

  GitHubIntegrationInput({
    required this.code,
    required this.state,
    this.organizationName,
  });

  Map<String, dynamic> toJson() {
    final code = this.code;
    final state = this.state;
    final organizationName = this.organizationName;
    return {
      'code': code,
      'state': state,
      if (organizationName != null) 'organizationName': organizationName,
    };
  }
}

/// Contains summary information about an application.
///
/// @nodoc
class ApplicationSummary {
  /// The unique identifier of the application.
  final String applicationId;

  /// The name of the application.
  final String applicationName;

  /// The domain associated with the application.
  final String domain;

  /// The identifier of the default AWS KMS key used to encrypt data for the
  /// application.
  final String? defaultKmsKeyId;

  ApplicationSummary({
    required this.applicationId,
    required this.applicationName,
    required this.domain,
    this.defaultKmsKeyId,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      applicationId: (json['applicationId'] as String?) ?? '',
      applicationName: (json['applicationName'] as String?) ?? '',
      domain: (json['domain'] as String?) ?? '',
      defaultKmsKeyId: json['defaultKmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final applicationName = this.applicationName;
    final domain = this.domain;
    final defaultKmsKeyId = this.defaultKmsKeyId;
    return {
      'applicationId': applicationId,
      'applicationName': applicationName,
      'domain': domain,
      if (defaultKmsKeyId != null) 'defaultKmsKeyId': defaultKmsKeyId,
    };
  }
}

/// The IAM Identity Center configuration for an application.
///
/// @nodoc
class IdCConfiguration {
  /// The Amazon Resource Name (ARN) of the IAM Identity Center application.
  final String? idcApplicationArn;

  /// The Amazon Resource Name (ARN) of the IAM Identity Center instance.
  final String? idcInstanceArn;

  IdCConfiguration({
    this.idcApplicationArn,
    this.idcInstanceArn,
  });

  factory IdCConfiguration.fromJson(Map<String, dynamic> json) {
    return IdCConfiguration(
      idcApplicationArn: json['idcApplicationArn'] as String?,
      idcInstanceArn: json['idcInstanceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final idcApplicationArn = this.idcApplicationArn;
    final idcInstanceArn = this.idcInstanceArn;
    return {
      if (idcApplicationArn != null) 'idcApplicationArn': idcApplicationArn,
      if (idcInstanceArn != null) 'idcInstanceArn': idcInstanceArn,
    };
  }
}

/// Represents an agent space, which is a dedicated workspace for securing a
/// specific application. An agent space contains the configuration, resources,
/// and settings needed for security testing.
///
/// @nodoc
class AgentSpace {
  /// The unique identifier of the agent space.
  final String agentSpaceId;

  /// The name of the agent space.
  final String name;

  /// The AWS resources associated with the agent space.
  final AWSResources? awsResources;

  /// The code review settings for the agent space.
  final CodeReviewSettings? codeReviewSettings;

  /// The date and time the agent space was created, in UTC format.
  final DateTime? createdAt;

  /// A description of the agent space.
  final String? description;

  /// The identifier of the AWS KMS key used to encrypt data in the agent space.
  final String? kmsKeyId;

  /// The list of target domain identifiers associated with the agent space.
  final List<String>? targetDomainIds;

  /// The date and time the agent space was last updated, in UTC format.
  final DateTime? updatedAt;

  AgentSpace({
    required this.agentSpaceId,
    required this.name,
    this.awsResources,
    this.codeReviewSettings,
    this.createdAt,
    this.description,
    this.kmsKeyId,
    this.targetDomainIds,
    this.updatedAt,
  });

  factory AgentSpace.fromJson(Map<String, dynamic> json) {
    return AgentSpace(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      awsResources: json['awsResources'] != null
          ? AWSResources.fromJson(json['awsResources'] as Map<String, dynamic>)
          : null,
      codeReviewSettings: json['codeReviewSettings'] != null
          ? CodeReviewSettings.fromJson(
              json['codeReviewSettings'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      targetDomainIds: (json['targetDomainIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final name = this.name;
    final awsResources = this.awsResources;
    final codeReviewSettings = this.codeReviewSettings;
    final createdAt = this.createdAt;
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final targetDomainIds = this.targetDomainIds;
    final updatedAt = this.updatedAt;
    return {
      'agentSpaceId': agentSpaceId,
      'name': name,
      if (awsResources != null) 'awsResources': awsResources,
      if (codeReviewSettings != null) 'codeReviewSettings': codeReviewSettings,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (targetDomainIds != null) 'targetDomainIds': targetDomainIds,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// The AWS resources associated with an agent space, including VPCs, log
/// groups, S3 buckets, secrets, Lambda functions, and IAM roles.
///
/// @nodoc
class AWSResources {
  /// The IAM roles associated with the agent space.
  final List<String>? iamRoles;

  /// The Amazon Resource Names (ARNs) of the Lambda functions associated with the
  /// agent space.
  final List<String>? lambdaFunctionArns;

  /// The Amazon Resource Names (ARNs) of the CloudWatch log groups associated
  /// with the agent space.
  final List<String>? logGroups;

  /// The Amazon Resource Names (ARNs) of the S3 buckets associated with the agent
  /// space.
  final List<String>? s3Buckets;

  /// The Amazon Resource Names (ARNs) of the Secrets Manager secrets associated
  /// with the agent space.
  final List<String>? secretArns;

  /// The VPC configurations associated with the agent space.
  final List<VpcConfig>? vpcs;

  AWSResources({
    this.iamRoles,
    this.lambdaFunctionArns,
    this.logGroups,
    this.s3Buckets,
    this.secretArns,
    this.vpcs,
  });

  factory AWSResources.fromJson(Map<String, dynamic> json) {
    return AWSResources(
      iamRoles: (json['iamRoles'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      lambdaFunctionArns: (json['lambdaFunctionArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      logGroups: (json['logGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      s3Buckets: (json['s3Buckets'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      secretArns: (json['secretArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcs: (json['vpcs'] as List?)
          ?.nonNulls
          .map((e) => VpcConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final iamRoles = this.iamRoles;
    final lambdaFunctionArns = this.lambdaFunctionArns;
    final logGroups = this.logGroups;
    final s3Buckets = this.s3Buckets;
    final secretArns = this.secretArns;
    final vpcs = this.vpcs;
    return {
      if (iamRoles != null) 'iamRoles': iamRoles,
      if (lambdaFunctionArns != null) 'lambdaFunctionArns': lambdaFunctionArns,
      if (logGroups != null) 'logGroups': logGroups,
      if (s3Buckets != null) 's3Buckets': s3Buckets,
      if (secretArns != null) 'secretArns': secretArns,
      if (vpcs != null) 'vpcs': vpcs,
    };
  }
}

/// The code review settings for an agent space, controlling which types of
/// scanning are enabled.
///
/// @nodoc
class CodeReviewSettings {
  /// Indicates whether controls scanning is enabled for code reviews.
  final bool controlsScanning;

  /// Indicates whether general-purpose scanning is enabled for code reviews.
  final bool generalPurposeScanning;

  CodeReviewSettings({
    required this.controlsScanning,
    required this.generalPurposeScanning,
  });

  factory CodeReviewSettings.fromJson(Map<String, dynamic> json) {
    return CodeReviewSettings(
      controlsScanning: (json['controlsScanning'] as bool?) ?? false,
      generalPurposeScanning:
          (json['generalPurposeScanning'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final controlsScanning = this.controlsScanning;
    final generalPurposeScanning = this.generalPurposeScanning;
    return {
      'controlsScanning': controlsScanning,
      'generalPurposeScanning': generalPurposeScanning,
    };
  }
}

/// The VPC configuration for a pentest, specifying the VPC, security groups,
/// and subnets to use during testing.
///
/// @nodoc
class VpcConfig {
  /// The Amazon Resource Names (ARNs) of the security groups for the VPC
  /// configuration.
  final List<String>? securityGroupArns;

  /// The Amazon Resource Names (ARNs) of the subnets for the VPC configuration.
  final List<String>? subnetArns;

  /// The Amazon Resource Name (ARN) of the VPC.
  final String? vpcArn;

  VpcConfig({
    this.securityGroupArns,
    this.subnetArns,
    this.vpcArn,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      securityGroupArns: (json['securityGroupArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetArns: (json['subnetArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcArn: json['vpcArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupArns = this.securityGroupArns;
    final subnetArns = this.subnetArns;
    final vpcArn = this.vpcArn;
    return {
      if (securityGroupArns != null) 'securityGroupArns': securityGroupArns,
      if (subnetArns != null) 'subnetArns': subnetArns,
      if (vpcArn != null) 'vpcArn': vpcArn,
    };
  }
}

/// Contains summary information about an agent space.
///
/// @nodoc
class AgentSpaceSummary {
  /// The unique identifier of the agent space.
  final String agentSpaceId;

  /// The name of the agent space.
  final String name;

  /// The date and time the agent space was created, in UTC format.
  final DateTime? createdAt;

  /// The date and time the agent space was last updated, in UTC format.
  final DateTime? updatedAt;

  AgentSpaceSummary({
    required this.agentSpaceId,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory AgentSpaceSummary.fromJson(Map<String, dynamic> json) {
    return AgentSpaceSummary(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final name = this.name;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    return {
      'agentSpaceId': agentSpaceId,
      'name': name,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// The collection of assets used in a pentest configuration, including
/// endpoints, actors, documents, source code repositories, and integrated
/// repositories.
///
/// @nodoc
class Assets {
  /// The list of actors used during penetration testing.
  final List<Actor>? actors;

  /// The list of documents that provide context for the pentest.
  final List<DocumentInfo>? documents;

  /// The list of endpoints to test during the pentest.
  final List<Endpoint>? endpoints;

  /// The list of integrated repositories associated with the pentest.
  final List<IntegratedRepository>? integratedRepositories;

  /// The list of source code repositories to analyze during the pentest.
  final List<SourceCodeRepository>? sourceCode;

  Assets({
    this.actors,
    this.documents,
    this.endpoints,
    this.integratedRepositories,
    this.sourceCode,
  });

  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
      actors: (json['actors'] as List?)
          ?.nonNulls
          .map((e) => Actor.fromJson(e as Map<String, dynamic>))
          .toList(),
      documents: (json['documents'] as List?)
          ?.nonNulls
          .map((e) => DocumentInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      endpoints: (json['endpoints'] as List?)
          ?.nonNulls
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      integratedRepositories: (json['integratedRepositories'] as List?)
          ?.nonNulls
          .map((e) => IntegratedRepository.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceCode: (json['sourceCode'] as List?)
          ?.nonNulls
          .map((e) => SourceCodeRepository.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actors = this.actors;
    final documents = this.documents;
    final endpoints = this.endpoints;
    final integratedRepositories = this.integratedRepositories;
    final sourceCode = this.sourceCode;
    return {
      if (actors != null) 'actors': actors,
      if (documents != null) 'documents': documents,
      if (endpoints != null) 'endpoints': endpoints,
      if (integratedRepositories != null)
        'integratedRepositories': integratedRepositories,
      if (sourceCode != null) 'sourceCode': sourceCode,
    };
  }
}

/// The Amazon CloudWatch Logs configuration for pentest job logging.
///
/// @nodoc
class CloudWatchLog {
  /// The name of the CloudWatch log group.
  final String? logGroup;

  /// The name of the CloudWatch log stream.
  final String? logStream;

  CloudWatchLog({
    this.logGroup,
    this.logStream,
  });

  factory CloudWatchLog.fromJson(Map<String, dynamic> json) {
    return CloudWatchLog(
      logGroup: json['logGroup'] as String?,
      logStream: json['logStream'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroup = this.logGroup;
    final logStream = this.logStream;
    return {
      if (logGroup != null) 'logGroup': logGroup,
      if (logStream != null) 'logStream': logStream,
    };
  }
}

/// Type of security risk.
///
/// @nodoc
class RiskType {
  static const crossSiteScripting = RiskType._('CROSS_SITE_SCRIPTING');
  static const defaultCredentials = RiskType._('DEFAULT_CREDENTIALS');
  static const insecureDirectObjectReference =
      RiskType._('INSECURE_DIRECT_OBJECT_REFERENCE');
  static const privilegeEscalation = RiskType._('PRIVILEGE_ESCALATION');
  static const serverSideTemplateInjection =
      RiskType._('SERVER_SIDE_TEMPLATE_INJECTION');
  static const commandInjection = RiskType._('COMMAND_INJECTION');
  static const codeInjection = RiskType._('CODE_INJECTION');
  static const sqlInjection = RiskType._('SQL_INJECTION');
  static const arbitraryFileUpload = RiskType._('ARBITRARY_FILE_UPLOAD');
  static const insecureDeserialization = RiskType._('INSECURE_DESERIALIZATION');
  static const localFileInclusion = RiskType._('LOCAL_FILE_INCLUSION');
  static const informationDisclosure = RiskType._('INFORMATION_DISCLOSURE');
  static const pathTraversal = RiskType._('PATH_TRAVERSAL');
  static const serverSideRequestForgery =
      RiskType._('SERVER_SIDE_REQUEST_FORGERY');
  static const jsonWebTokenVulnerabilities =
      RiskType._('JSON_WEB_TOKEN_VULNERABILITIES');
  static const xmlExternalEntity = RiskType._('XML_EXTERNAL_ENTITY');
  static const fileDeletion = RiskType._('FILE_DELETION');
  static const other = RiskType._('OTHER');
  static const graphqlVulnerabilities = RiskType._('GRAPHQL_VULNERABILITIES');
  static const businessLogicVulnerabilities =
      RiskType._('BUSINESS_LOGIC_VULNERABILITIES');
  static const cryptographicVulnerabilities =
      RiskType._('CRYPTOGRAPHIC_VULNERABILITIES');
  static const denialOfService = RiskType._('DENIAL_OF_SERVICE');
  static const fileAccess = RiskType._('FILE_ACCESS');
  static const fileCreation = RiskType._('FILE_CREATION');
  static const databaseModification = RiskType._('DATABASE_MODIFICATION');
  static const databaseAccess = RiskType._('DATABASE_ACCESS');
  static const outboundServiceRequest = RiskType._('OUTBOUND_SERVICE_REQUEST');
  static const unknown = RiskType._('UNKNOWN');

  final String value;

  const RiskType._(this.value);

  static const values = [
    crossSiteScripting,
    defaultCredentials,
    insecureDirectObjectReference,
    privilegeEscalation,
    serverSideTemplateInjection,
    commandInjection,
    codeInjection,
    sqlInjection,
    arbitraryFileUpload,
    insecureDeserialization,
    localFileInclusion,
    informationDisclosure,
    pathTraversal,
    serverSideRequestForgery,
    jsonWebTokenVulnerabilities,
    xmlExternalEntity,
    fileDeletion,
    other,
    graphqlVulnerabilities,
    businessLogicVulnerabilities,
    cryptographicVulnerabilities,
    denialOfService,
    fileAccess,
    fileCreation,
    databaseModification,
    databaseAccess,
    outboundServiceRequest,
    unknown
  ];

  static RiskType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RiskType._(value));

  @override
  bool operator ==(other) => other is RiskType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a code repository that is integrated with the service through a
/// third-party provider.
///
/// @nodoc
class IntegratedRepository {
  /// The unique identifier of the integration that provides access to the
  /// repository.
  final String integrationId;

  /// The provider-specific resource identifier for the repository.
  final String providerResourceId;

  IntegratedRepository({
    required this.integrationId,
    required this.providerResourceId,
  });

  factory IntegratedRepository.fromJson(Map<String, dynamic> json) {
    return IntegratedRepository(
      integrationId: (json['integrationId'] as String?) ?? '',
      providerResourceId: (json['providerResourceId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final integrationId = this.integrationId;
    final providerResourceId = this.providerResourceId;
    return {
      'integrationId': integrationId,
      'providerResourceId': providerResourceId,
    };
  }
}

/// Represents a source code repository used for security analysis during a
/// pentest.
///
/// @nodoc
class SourceCodeRepository {
  /// The Amazon S3 location of the source code repository archive.
  final String? s3Location;

  SourceCodeRepository({
    this.s3Location,
  });

  factory SourceCodeRepository.fromJson(Map<String, dynamic> json) {
    return SourceCodeRepository(
      s3Location: json['s3Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// Represents a document that provides context for security testing.
///
/// @nodoc
class DocumentInfo {
  /// The unique identifier of the artifact associated with the document.
  final String? artifactId;

  /// The Amazon S3 location of the document.
  final String? s3Location;

  DocumentInfo({
    this.artifactId,
    this.s3Location,
  });

  factory DocumentInfo.fromJson(Map<String, dynamic> json) {
    return DocumentInfo(
      artifactId: json['artifactId'] as String?,
      s3Location: json['s3Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactId = this.artifactId;
    final s3Location = this.s3Location;
    return {
      if (artifactId != null) 'artifactId': artifactId,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// Represents an actor used during penetration testing. An actor defines a user
/// or entity that interacts with the target application, including
/// authentication credentials and target URIs.
///
/// @nodoc
class Actor {
  /// The authentication configuration for the actor.
  final Authentication? authentication;

  /// A description of the actor.
  final String? description;

  /// The unique identifier for the actor.
  final String? identifier;

  /// The list of URIs that the actor targets during testing.
  final List<String>? uris;

  Actor({
    this.authentication,
    this.description,
    this.identifier,
    this.uris,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      authentication: json['authentication'] != null
          ? Authentication.fromJson(
              json['authentication'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      identifier: json['identifier'] as String?,
      uris: (json['uris'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final authentication = this.authentication;
    final description = this.description;
    final identifier = this.identifier;
    final uris = this.uris;
    return {
      if (authentication != null) 'authentication': authentication,
      if (description != null) 'description': description,
      if (identifier != null) 'identifier': identifier,
      if (uris != null) 'uris': uris,
    };
  }
}

/// The authentication configuration for an actor, specifying the provider type
/// and credentials.
///
/// @nodoc
class Authentication {
  /// The type of authentication provider. Valid values include SECRETS_MANAGER,
  /// AWS_LAMBDA, AWS_IAM_ROLE, and AWS_INTERNAL.
  final AuthenticationProviderType? providerType;

  /// The authentication value, such as a secret ARN, Lambda function ARN, or IAM
  /// role ARN, depending on the provider type.
  final String? value;

  Authentication({
    this.providerType,
    this.value,
  });

  factory Authentication.fromJson(Map<String, dynamic> json) {
    return Authentication(
      providerType: (json['providerType'] as String?)
          ?.let(AuthenticationProviderType.fromString),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final providerType = this.providerType;
    final value = this.value;
    return {
      if (providerType != null) 'providerType': providerType.value,
      if (value != null) 'value': value,
    };
  }
}

/// Type of authentication provider.
///
/// @nodoc
class AuthenticationProviderType {
  static const secretsManager = AuthenticationProviderType._('SECRETS_MANAGER');
  static const awsLambda = AuthenticationProviderType._('AWS_LAMBDA');
  static const awsIamRole = AuthenticationProviderType._('AWS_IAM_ROLE');
  static const awsInternal = AuthenticationProviderType._('AWS_INTERNAL');

  final String value;

  const AuthenticationProviderType._(this.value);

  static const values = [secretsManager, awsLambda, awsIamRole, awsInternal];

  static AuthenticationProviderType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AuthenticationProviderType._(value));

  @override
  bool operator ==(other) =>
      other is AuthenticationProviderType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a target endpoint for penetration testing.
///
/// @nodoc
class Endpoint {
  /// The URI of the endpoint.
  final String? uri;

  Endpoint({
    this.uri,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      if (uri != null) 'uri': uri,
    };
  }
}

/// The network traffic configuration for a pentest, including custom headers
/// and traffic rules.
///
/// @nodoc
class NetworkTrafficConfig {
  /// The list of custom HTTP headers to include in network traffic during
  /// testing.
  final List<CustomHeader>? customHeaders;

  /// The list of network traffic rules that control which URLs are allowed or
  /// denied during testing.
  final List<NetworkTrafficRule>? rules;

  NetworkTrafficConfig({
    this.customHeaders,
    this.rules,
  });

  factory NetworkTrafficConfig.fromJson(Map<String, dynamic> json) {
    return NetworkTrafficConfig(
      customHeaders: (json['customHeaders'] as List?)
          ?.nonNulls
          .map((e) => CustomHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      rules: (json['rules'] as List?)
          ?.nonNulls
          .map((e) => NetworkTrafficRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final customHeaders = this.customHeaders;
    final rules = this.rules;
    return {
      if (customHeaders != null) 'customHeaders': customHeaders,
      if (rules != null) 'rules': rules,
    };
  }
}

/// Strategy for automated code remediation.
///
/// @nodoc
class CodeRemediationStrategy {
  static const automatic = CodeRemediationStrategy._('AUTOMATIC');
  static const disabled = CodeRemediationStrategy._('DISABLED');

  final String value;

  const CodeRemediationStrategy._(this.value);

  static const values = [automatic, disabled];

  static CodeRemediationStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CodeRemediationStrategy._(value));

  @override
  bool operator ==(other) =>
      other is CodeRemediationStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A custom HTTP header to include in network traffic during penetration
/// testing.
///
/// @nodoc
class CustomHeader {
  /// The name of the custom header.
  final String? name;

  /// The value of the custom header.
  final String? value;

  CustomHeader({
    this.name,
    this.value,
  });

  factory CustomHeader.fromJson(Map<String, dynamic> json) {
    return CustomHeader(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// A rule that controls network traffic during penetration testing by allowing
/// or denying traffic to specific URL patterns.
///
/// @nodoc
class NetworkTrafficRule {
  /// The effect of the rule. Valid values are ALLOW and DENY.
  final NetworkTrafficRuleEffect? effect;

  /// The type of the network traffic rule. Currently, only URL is supported.
  final NetworkTrafficRuleType? networkTrafficRuleType;

  /// The URL pattern to match for the rule.
  final String? pattern;

  NetworkTrafficRule({
    this.effect,
    this.networkTrafficRuleType,
    this.pattern,
  });

  factory NetworkTrafficRule.fromJson(Map<String, dynamic> json) {
    return NetworkTrafficRule(
      effect:
          (json['effect'] as String?)?.let(NetworkTrafficRuleEffect.fromString),
      networkTrafficRuleType: (json['networkTrafficRuleType'] as String?)
          ?.let(NetworkTrafficRuleType.fromString),
      pattern: json['pattern'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final effect = this.effect;
    final networkTrafficRuleType = this.networkTrafficRuleType;
    final pattern = this.pattern;
    return {
      if (effect != null) 'effect': effect.value,
      if (networkTrafficRuleType != null)
        'networkTrafficRuleType': networkTrafficRuleType.value,
      if (pattern != null) 'pattern': pattern,
    };
  }
}

/// Effect of a network traffic rule.
///
/// @nodoc
class NetworkTrafficRuleEffect {
  static const allow = NetworkTrafficRuleEffect._('ALLOW');
  static const deny = NetworkTrafficRuleEffect._('DENY');

  final String value;

  const NetworkTrafficRuleEffect._(this.value);

  static const values = [allow, deny];

  static NetworkTrafficRuleEffect fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkTrafficRuleEffect._(value));

  @override
  bool operator ==(other) =>
      other is NetworkTrafficRuleEffect && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Type of network traffic rule.
///
/// @nodoc
class NetworkTrafficRuleType {
  static const url = NetworkTrafficRuleType._('URL');

  final String value;

  const NetworkTrafficRuleType._(this.value);

  static const values = [url];

  static NetworkTrafficRuleType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkTrafficRuleType._(value));

  @override
  bool operator ==(other) =>
      other is NetworkTrafficRuleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an input item for updating integrated resources, including the
/// resource and its capabilities.
///
/// @nodoc
class IntegratedResourceInputItem {
  /// The integrated resource to update.
  final IntegratedResource resource;

  /// The capabilities to enable for the integrated resource.
  final ProviderResourceCapabilities? capabilities;

  IntegratedResourceInputItem({
    required this.resource,
    this.capabilities,
  });

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final capabilities = this.capabilities;
    return {
      'resource': resource,
      if (capabilities != null) 'capabilities': capabilities,
    };
  }
}

/// Represents an integrated resource from a third-party provider. This is a
/// union type that contains provider-specific resource information.
///
/// @nodoc
class IntegratedResource {
  /// The GitHub repository resource information.
  final GitHubRepositoryResource? githubRepository;

  IntegratedResource({
    this.githubRepository,
  });

  Map<String, dynamic> toJson() {
    final githubRepository = this.githubRepository;
    return {
      if (githubRepository != null) 'githubRepository': githubRepository,
    };
  }
}

/// The capabilities for an integrated resource from a third-party provider.
/// This is a union type that contains provider-specific capabilities.
///
/// @nodoc
class ProviderResourceCapabilities {
  /// The GitHub-specific resource capabilities.
  final GitHubResourceCapabilities? github;

  ProviderResourceCapabilities({
    this.github,
  });

  factory ProviderResourceCapabilities.fromJson(Map<String, dynamic> json) {
    return ProviderResourceCapabilities(
      github: json['github'] != null
          ? GitHubResourceCapabilities.fromJson(
              json['github'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final github = this.github;
    return {
      if (github != null) 'github': github,
    };
  }
}

/// The capabilities enabled for a GitHub resource integration.
///
/// @nodoc
class GitHubResourceCapabilities {
  /// Indicates whether the integration can leave comments on pull requests.
  final bool? leaveComments;

  /// Indicates whether the integration can create code remediation pull requests.
  final bool? remediateCode;

  GitHubResourceCapabilities({
    this.leaveComments,
    this.remediateCode,
  });

  factory GitHubResourceCapabilities.fromJson(Map<String, dynamic> json) {
    return GitHubResourceCapabilities(
      leaveComments: json['leaveComments'] as bool?,
      remediateCode: json['remediateCode'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final leaveComments = this.leaveComments;
    final remediateCode = this.remediateCode;
    return {
      if (leaveComments != null) 'leaveComments': leaveComments,
      if (remediateCode != null) 'remediateCode': remediateCode,
    };
  }
}

/// Represents a GitHub repository resource used in an integration.
///
/// @nodoc
class GitHubRepositoryResource {
  /// The name of the GitHub repository.
  final String name;

  /// The owner of the GitHub repository.
  final String owner;

  GitHubRepositoryResource({
    required this.name,
    required this.owner,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final owner = this.owner;
    return {
      'name': name,
      'owner': owner,
    };
  }
}

/// Risk severity level.
///
/// @nodoc
class RiskLevel {
  static const unknown = RiskLevel._('UNKNOWN');
  static const informational = RiskLevel._('INFORMATIONAL');
  static const low = RiskLevel._('LOW');
  static const medium = RiskLevel._('MEDIUM');
  static const high = RiskLevel._('HIGH');
  static const critical = RiskLevel._('CRITICAL');

  final String value;

  const RiskLevel._(this.value);

  static const values = [unknown, informational, low, medium, high, critical];

  static RiskLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RiskLevel._(value));

  @override
  bool operator ==(other) => other is RiskLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Finding status.
///
/// @nodoc
class FindingStatus {
  static const active = FindingStatus._('ACTIVE');
  static const resolved = FindingStatus._('RESOLVED');
  static const accepted = FindingStatus._('ACCEPTED');
  static const falsePositive = FindingStatus._('FALSE_POSITIVE');

  final String value;

  const FindingStatus._(this.value);

  static const values = [active, resolved, accepted, falsePositive];

  static FindingStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FindingStatus._(value));

  @override
  bool operator ==(other) => other is FindingStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Status of a pentest job.
///
/// @nodoc
class JobStatus {
  static const inProgress = JobStatus._('IN_PROGRESS');
  static const stopping = JobStatus._('STOPPING');
  static const stopped = JobStatus._('STOPPED');
  static const failed = JobStatus._('FAILED');
  static const completed = JobStatus._('COMPLETED');

  final String value;

  const JobStatus._(this.value);

  static const values = [inProgress, stopping, stopped, failed, completed];

  static JobStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobStatus._(value));

  @override
  bool operator ==(other) => other is JobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a pentest.
///
/// @nodoc
class PentestSummary {
  /// The unique identifier of the agent space that contains the pentest.
  final String agentSpaceId;

  /// The unique identifier of the pentest.
  final String pentestId;

  /// The title of the pentest.
  final String title;

  /// The date and time the pentest was created, in UTC format.
  final DateTime? createdAt;

  /// The date and time the pentest was last updated, in UTC format.
  final DateTime? updatedAt;

  PentestSummary({
    required this.agentSpaceId,
    required this.pentestId,
    required this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory PentestSummary.fromJson(Map<String, dynamic> json) {
    return PentestSummary(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      pentestId: (json['pentestId'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final pentestId = this.pentestId;
    final title = this.title;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    return {
      'agentSpaceId': agentSpaceId,
      'pentestId': pentestId,
      'title': title,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Contains summary information about a task.
///
/// @nodoc
class TaskSummary {
  /// The unique identifier of the task.
  final String taskId;

  /// The unique identifier of the agent space.
  final String? agentSpaceId;

  /// The date and time the task was created, in UTC format.
  final DateTime? createdAt;

  /// The current execution status of the task.
  final TaskExecutionStatus? executionStatus;

  /// The unique identifier of the pentest associated with the task.
  final String? pentestId;

  /// The unique identifier of the pentest job that contains the task.
  final String? pentestJobId;

  /// The type of security risk the task is testing for.
  final RiskType? riskType;

  /// The title of the task.
  final String? title;

  /// The date and time the task was last updated, in UTC format.
  final DateTime? updatedAt;

  TaskSummary({
    required this.taskId,
    this.agentSpaceId,
    this.createdAt,
    this.executionStatus,
    this.pentestId,
    this.pentestJobId,
    this.riskType,
    this.title,
    this.updatedAt,
  });

  factory TaskSummary.fromJson(Map<String, dynamic> json) {
    return TaskSummary(
      taskId: (json['taskId'] as String?) ?? '',
      agentSpaceId: json['agentSpaceId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      executionStatus: (json['executionStatus'] as String?)
          ?.let(TaskExecutionStatus.fromString),
      pentestId: json['pentestId'] as String?,
      pentestJobId: json['pentestJobId'] as String?,
      riskType: (json['riskType'] as String?)?.let(RiskType.fromString),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final taskId = this.taskId;
    final agentSpaceId = this.agentSpaceId;
    final createdAt = this.createdAt;
    final executionStatus = this.executionStatus;
    final pentestId = this.pentestId;
    final pentestJobId = this.pentestJobId;
    final riskType = this.riskType;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      'taskId': taskId,
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (executionStatus != null) 'executionStatus': executionStatus.value,
      if (pentestId != null) 'pentestId': pentestId,
      if (pentestJobId != null) 'pentestJobId': pentestJobId,
      if (riskType != null) 'riskType': riskType.value,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Execution status of a task.
///
/// @nodoc
class TaskExecutionStatus {
  static const inProgress = TaskExecutionStatus._('IN_PROGRESS');
  static const aborted = TaskExecutionStatus._('ABORTED');
  static const completed = TaskExecutionStatus._('COMPLETED');
  static const internalError = TaskExecutionStatus._('INTERNAL_ERROR');
  static const failed = TaskExecutionStatus._('FAILED');

  final String value;

  const TaskExecutionStatus._(this.value);

  static const values = [inProgress, aborted, completed, internalError, failed];

  static TaskExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaskExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is TaskExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Pentest job step names.
///
/// @nodoc
class StepName {
  static const preflight = StepName._('PREFLIGHT');
  static const staticAnalysis = StepName._('STATIC_ANALYSIS');
  static const pentest = StepName._('PENTEST');
  static const finalizing = StepName._('FINALIZING');

  final String value;

  const StepName._(this.value);

  static const values = [preflight, staticAnalysis, pentest, finalizing];

  static StepName fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StepName._(value));

  @override
  bool operator ==(other) => other is StepName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a pentest job.
///
/// @nodoc
class PentestJobSummary {
  /// The unique identifier of the pentest associated with the job.
  final String pentestId;

  /// The unique identifier of the pentest job.
  final String pentestJobId;

  /// The date and time the pentest job was created, in UTC format.
  final DateTime? createdAt;

  /// The current status of the pentest job.
  final JobStatus? status;

  /// The title of the pentest job.
  final String? title;

  /// The date and time the pentest job was last updated, in UTC format.
  final DateTime? updatedAt;

  PentestJobSummary({
    required this.pentestId,
    required this.pentestJobId,
    this.createdAt,
    this.status,
    this.title,
    this.updatedAt,
  });

  factory PentestJobSummary.fromJson(Map<String, dynamic> json) {
    return PentestJobSummary(
      pentestId: (json['pentestId'] as String?) ?? '',
      pentestJobId: (json['pentestJobId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      status: (json['status'] as String?)?.let(JobStatus.fromString),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final pentestId = this.pentestId;
    final pentestJobId = this.pentestJobId;
    final createdAt = this.createdAt;
    final status = this.status;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      'pentestId': pentestId,
      'pentestJobId': pentestJobId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (status != null) 'status': status.value,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Contains summary information about a membership.
///
/// @nodoc
class MembershipSummary {
  /// The unique identifier of the agent space.
  final String agentSpaceId;

  /// The unique identifier of the application.
  final String applicationId;

  /// The date and time the membership was created, in UTC format.
  final DateTime createdAt;

  /// The identifier of the entity that created the membership.
  final String createdBy;

  /// The type of member.
  final MembershipType memberType;

  /// The unique identifier of the membership.
  final String membershipId;

  /// The date and time the membership was last updated, in UTC format.
  final DateTime updatedAt;

  /// The identifier of the entity that last updated the membership.
  final String updatedBy;

  /// The configuration for the membership.
  final MembershipConfig? config;

  /// The metadata for the member.
  final MemberMetadata? metadata;

  MembershipSummary({
    required this.agentSpaceId,
    required this.applicationId,
    required this.createdAt,
    required this.createdBy,
    required this.memberType,
    required this.membershipId,
    required this.updatedAt,
    required this.updatedBy,
    this.config,
    this.metadata,
  });

  factory MembershipSummary.fromJson(Map<String, dynamic> json) {
    return MembershipSummary(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      applicationId: (json['applicationId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      memberType:
          MembershipType.fromString((json['memberType'] as String?) ?? ''),
      membershipId: (json['membershipId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      updatedBy: (json['updatedBy'] as String?) ?? '',
      config: json['config'] != null
          ? MembershipConfig.fromJson(json['config'] as Map<String, dynamic>)
          : null,
      metadata: json['metadata'] != null
          ? MemberMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final applicationId = this.applicationId;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final memberType = this.memberType;
    final membershipId = this.membershipId;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final config = this.config;
    final metadata = this.metadata;
    return {
      'agentSpaceId': agentSpaceId,
      'applicationId': applicationId,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'memberType': memberType.value,
      'membershipId': membershipId,
      'updatedAt': iso8601ToJson(updatedAt),
      'updatedBy': updatedBy,
      if (config != null) 'config': config,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// Type of membership.
///
/// @nodoc
class MembershipType {
  static const user = MembershipType._('USER');

  final String value;

  const MembershipType._(this.value);

  static const values = [user];

  static MembershipType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipType._(value));

  @override
  bool operator ==(other) => other is MembershipType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration for a membership. This is a union type that contains
/// member-type-specific configuration.
///
/// @nodoc
class MembershipConfig {
  /// The user configuration for the membership.
  final UserConfig? user;

  MembershipConfig({
    this.user,
  });

  factory MembershipConfig.fromJson(Map<String, dynamic> json) {
    return MembershipConfig(
      user: json['user'] != null
          ? UserConfig.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'user': user,
    };
  }
}

/// Contains metadata about a member. This is a union type that contains
/// member-type-specific metadata.
///
/// @nodoc
class MemberMetadata {
  /// The user metadata for the member.
  final UserMetadata? user;

  MemberMetadata({
    this.user,
  });

  factory MemberMetadata.fromJson(Map<String, dynamic> json) {
    return MemberMetadata(
      user: json['user'] != null
          ? UserMetadata.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'user': user,
    };
  }
}

/// Contains metadata about a user member, including the username and email
/// address.
///
/// @nodoc
class UserMetadata {
  /// The email address of the user.
  final String email;

  /// The username of the user.
  final String username;

  UserMetadata({
    required this.email,
    required this.username,
  });

  factory UserMetadata.fromJson(Map<String, dynamic> json) {
    return UserMetadata(
      email: (json['email'] as String?) ?? '',
      username: (json['username'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final username = this.username;
    return {
      'email': email,
      'username': username,
    };
  }
}

/// The configuration for a user membership, including the role assigned to the
/// user within the agent space.
///
/// @nodoc
class UserConfig {
  /// The role assigned to the user. Currently, only MEMBER is supported.
  final UserRole? role;

  UserConfig({
    this.role,
  });

  factory UserConfig.fromJson(Map<String, dynamic> json) {
    return UserConfig(
      role: (json['role'] as String?)?.let(UserRole.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    return {
      if (role != null) 'role': role.value,
    };
  }
}

/// Role of a user member associated to an agent space.
///
/// @nodoc
class UserRole {
  static const member = UserRole._('MEMBER');

  final String value;

  const UserRole._(this.value);

  static const values = [member];

  static UserRole fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UserRole._(value));

  @override
  bool operator ==(other) => other is UserRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filter for member type in list operations.
///
/// @nodoc
class MembershipTypeFilter {
  static const user = MembershipTypeFilter._('USER');
  static const all = MembershipTypeFilter._('ALL');

  final String value;

  const MembershipTypeFilter._(this.value);

  static const values = [user, all];

  static MembershipTypeFilter fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MembershipTypeFilter._(value));

  @override
  bool operator ==(other) =>
      other is MembershipTypeFilter && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about an integrated resource.
///
/// @nodoc
class IntegratedResourceSummary {
  /// The unique identifier of the integration that provides access to the
  /// resource.
  final String integrationId;

  /// The metadata for the integrated resource.
  final IntegratedResourceMetadata resource;

  /// The capabilities enabled for the integrated resource.
  final ProviderResourceCapabilities? capabilities;

  IntegratedResourceSummary({
    required this.integrationId,
    required this.resource,
    this.capabilities,
  });

  factory IntegratedResourceSummary.fromJson(Map<String, dynamic> json) {
    return IntegratedResourceSummary(
      integrationId: (json['integrationId'] as String?) ?? '',
      resource: IntegratedResourceMetadata.fromJson(
          (json['resource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      capabilities: json['capabilities'] != null
          ? ProviderResourceCapabilities.fromJson(
              json['capabilities'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final integrationId = this.integrationId;
    final resource = this.resource;
    final capabilities = this.capabilities;
    return {
      'integrationId': integrationId,
      'resource': resource,
      if (capabilities != null) 'capabilities': capabilities,
    };
  }
}

/// Contains metadata about an integrated resource. This is a union type that
/// contains provider-specific metadata.
///
/// @nodoc
class IntegratedResourceMetadata {
  /// The GitHub repository metadata.
  final GitHubRepositoryMetadata? githubRepository;

  IntegratedResourceMetadata({
    this.githubRepository,
  });

  factory IntegratedResourceMetadata.fromJson(Map<String, dynamic> json) {
    return IntegratedResourceMetadata(
      githubRepository: json['githubRepository'] != null
          ? GitHubRepositoryMetadata.fromJson(
              json['githubRepository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final githubRepository = this.githubRepository;
    return {
      if (githubRepository != null) 'githubRepository': githubRepository,
    };
  }
}

/// Contains metadata about a GitHub repository that is integrated with the
/// service.
///
/// @nodoc
class GitHubRepositoryMetadata {
  /// The name of the GitHub repository.
  final String name;

  /// The owner of the GitHub repository.
  final String owner;

  /// The provider-specific resource identifier for the GitHub repository.
  final String providerResourceId;

  /// The access type of the GitHub repository. Valid values are PRIVATE and
  /// PUBLIC.
  final AccessType? accessType;

  GitHubRepositoryMetadata({
    required this.name,
    required this.owner,
    required this.providerResourceId,
    this.accessType,
  });

  factory GitHubRepositoryMetadata.fromJson(Map<String, dynamic> json) {
    return GitHubRepositoryMetadata(
      name: (json['name'] as String?) ?? '',
      owner: (json['owner'] as String?) ?? '',
      providerResourceId: (json['providerResourceId'] as String?) ?? '',
      accessType: (json['accessType'] as String?)?.let(AccessType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final owner = this.owner;
    final providerResourceId = this.providerResourceId;
    final accessType = this.accessType;
    return {
      'name': name,
      'owner': owner,
      'providerResourceId': providerResourceId,
      if (accessType != null) 'accessType': accessType.value,
    };
  }
}

/// Defines the visibility level of provider resources. PRIVATE indicates
/// restricted access, while PUBLIC indicates open access.
///
/// @nodoc
class AccessType {
  static const private = AccessType._('PRIVATE');
  static const public = AccessType._('PUBLIC');

  final String value;

  const AccessType._(this.value);

  static const values = [private, public];

  static AccessType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AccessType._(value));

  @override
  bool operator ==(other) => other is AccessType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Type of resource.
///
/// @nodoc
class ResourceType {
  static const codeRepository = ResourceType._('CODE_REPOSITORY');

  final String value;

  const ResourceType._(this.value);

  static const values = [codeRepository];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a security finding.
///
/// @nodoc
class FindingSummary {
  /// The unique identifier of the agent space associated with the finding.
  final String agentSpaceId;

  /// The unique identifier of the finding.
  final String findingId;

  /// The unique identifier of the code review associated with the finding.
  final String? codeReviewId;

  /// The unique identifier of the code review job that produced the finding.
  final String? codeReviewJobId;

  /// The confidence level of the finding.
  final ConfidenceLevel? confidence;

  /// The date and time the finding was created, in UTC format.
  final DateTime? createdAt;

  /// The name of the finding.
  final String? name;

  /// The unique identifier of the pentest associated with the finding.
  final String? pentestId;

  /// The unique identifier of the pentest job that produced the finding.
  final String? pentestJobId;

  /// The risk level of the finding.
  final RiskLevel? riskLevel;

  /// The type of security risk identified by the finding.
  final String? riskType;

  /// The current status of the finding.
  final FindingStatus? status;

  /// The date and time the finding was last updated, in UTC format.
  final DateTime? updatedAt;

  FindingSummary({
    required this.agentSpaceId,
    required this.findingId,
    this.codeReviewId,
    this.codeReviewJobId,
    this.confidence,
    this.createdAt,
    this.name,
    this.pentestId,
    this.pentestJobId,
    this.riskLevel,
    this.riskType,
    this.status,
    this.updatedAt,
  });

  factory FindingSummary.fromJson(Map<String, dynamic> json) {
    return FindingSummary(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      findingId: (json['findingId'] as String?) ?? '',
      codeReviewId: json['codeReviewId'] as String?,
      codeReviewJobId: json['codeReviewJobId'] as String?,
      confidence:
          (json['confidence'] as String?)?.let(ConfidenceLevel.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      name: json['name'] as String?,
      pentestId: json['pentestId'] as String?,
      pentestJobId: json['pentestJobId'] as String?,
      riskLevel: (json['riskLevel'] as String?)?.let(RiskLevel.fromString),
      riskType: json['riskType'] as String?,
      status: (json['status'] as String?)?.let(FindingStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final findingId = this.findingId;
    final codeReviewId = this.codeReviewId;
    final codeReviewJobId = this.codeReviewJobId;
    final confidence = this.confidence;
    final createdAt = this.createdAt;
    final name = this.name;
    final pentestId = this.pentestId;
    final pentestJobId = this.pentestJobId;
    final riskLevel = this.riskLevel;
    final riskType = this.riskType;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'agentSpaceId': agentSpaceId,
      'findingId': findingId,
      if (codeReviewId != null) 'codeReviewId': codeReviewId,
      if (codeReviewJobId != null) 'codeReviewJobId': codeReviewJobId,
      if (confidence != null) 'confidence': confidence.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (name != null) 'name': name,
      if (pentestId != null) 'pentestId': pentestId,
      if (pentestJobId != null) 'pentestJobId': pentestJobId,
      if (riskLevel != null) 'riskLevel': riskLevel.value,
      if (riskType != null) 'riskType': riskType,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Finding confidence level.
///
/// @nodoc
class ConfidenceLevel {
  static const falsePositive = ConfidenceLevel._('FALSE_POSITIVE');
  static const unconfirmed = ConfidenceLevel._('UNCONFIRMED');
  static const low = ConfidenceLevel._('LOW');
  static const medium = ConfidenceLevel._('MEDIUM');
  static const high = ConfidenceLevel._('HIGH');

  final String value;

  const ConfidenceLevel._(this.value);

  static const values = [falsePositive, unconfirmed, low, medium, high];

  static ConfidenceLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfidenceLevel._(value));

  @override
  bool operator ==(other) => other is ConfidenceLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an endpoint discovered during a pentest job.
///
/// @nodoc
class DiscoveredEndpoint {
  /// The unique identifier of the agent space associated with the discovered
  /// endpoint.
  final String agentSpaceId;

  /// The unique identifier of the pentest job that discovered the endpoint.
  final String pentestJobId;

  /// The unique identifier of the task that discovered the endpoint.
  final String taskId;

  /// The URI of the discovered endpoint.
  final String uri;

  /// A description of the discovered endpoint.
  final String? description;

  /// The evidence that led to the discovery of the endpoint.
  final String? evidence;

  /// The HTTP operation associated with the discovered endpoint.
  final String? operation;

  DiscoveredEndpoint({
    required this.agentSpaceId,
    required this.pentestJobId,
    required this.taskId,
    required this.uri,
    this.description,
    this.evidence,
    this.operation,
  });

  factory DiscoveredEndpoint.fromJson(Map<String, dynamic> json) {
    return DiscoveredEndpoint(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      pentestJobId: (json['pentestJobId'] as String?) ?? '',
      taskId: (json['taskId'] as String?) ?? '',
      uri: (json['uri'] as String?) ?? '',
      description: json['description'] as String?,
      evidence: json['evidence'] as String?,
      operation: json['operation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final pentestJobId = this.pentestJobId;
    final taskId = this.taskId;
    final uri = this.uri;
    final description = this.description;
    final evidence = this.evidence;
    final operation = this.operation;
    return {
      'agentSpaceId': agentSpaceId,
      'pentestJobId': pentestJobId,
      'taskId': taskId,
      'uri': uri,
      if (description != null) 'description': description,
      if (evidence != null) 'evidence': evidence,
      if (operation != null) 'operation': operation,
    };
  }
}

/// Contains summary information about a code review.
///
/// @nodoc
class CodeReviewSummary {
  /// The unique identifier of the agent space that contains the code review.
  final String agentSpaceId;

  /// The unique identifier of the code review.
  final String codeReviewId;

  /// The title of the code review.
  final String title;

  /// The date and time the code review was created, in UTC format.
  final DateTime? createdAt;

  /// The date and time the code review was last updated, in UTC format.
  final DateTime? updatedAt;

  CodeReviewSummary({
    required this.agentSpaceId,
    required this.codeReviewId,
    required this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory CodeReviewSummary.fromJson(Map<String, dynamic> json) {
    return CodeReviewSummary(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      codeReviewId: (json['codeReviewId'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final codeReviewId = this.codeReviewId;
    final title = this.title;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    return {
      'agentSpaceId': agentSpaceId,
      'codeReviewId': codeReviewId,
      'title': title,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Contains summary information about a code review job task.
///
/// @nodoc
class CodeReviewJobTaskSummary {
  /// The unique identifier of the task.
  final String taskId;

  /// The unique identifier of the agent space.
  final String? agentSpaceId;

  /// The unique identifier of the code review associated with the task.
  final String? codeReviewId;

  /// The unique identifier of the code review job that contains the task.
  final String? codeReviewJobId;

  /// The date and time the task was created, in UTC format.
  final DateTime? createdAt;

  /// The current execution status of the task.
  final TaskExecutionStatus? executionStatus;

  /// The type of security risk the task is testing for.
  final RiskType? riskType;

  /// The title of the task.
  final String? title;

  /// The date and time the task was last updated, in UTC format.
  final DateTime? updatedAt;

  CodeReviewJobTaskSummary({
    required this.taskId,
    this.agentSpaceId,
    this.codeReviewId,
    this.codeReviewJobId,
    this.createdAt,
    this.executionStatus,
    this.riskType,
    this.title,
    this.updatedAt,
  });

  factory CodeReviewJobTaskSummary.fromJson(Map<String, dynamic> json) {
    return CodeReviewJobTaskSummary(
      taskId: (json['taskId'] as String?) ?? '',
      agentSpaceId: json['agentSpaceId'] as String?,
      codeReviewId: json['codeReviewId'] as String?,
      codeReviewJobId: json['codeReviewJobId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      executionStatus: (json['executionStatus'] as String?)
          ?.let(TaskExecutionStatus.fromString),
      riskType: (json['riskType'] as String?)?.let(RiskType.fromString),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final taskId = this.taskId;
    final agentSpaceId = this.agentSpaceId;
    final codeReviewId = this.codeReviewId;
    final codeReviewJobId = this.codeReviewJobId;
    final createdAt = this.createdAt;
    final executionStatus = this.executionStatus;
    final riskType = this.riskType;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      'taskId': taskId,
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
      if (codeReviewId != null) 'codeReviewId': codeReviewId,
      if (codeReviewJobId != null) 'codeReviewJobId': codeReviewJobId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (executionStatus != null) 'executionStatus': executionStatus.value,
      if (riskType != null) 'riskType': riskType.value,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Contains summary information about a code review job.
///
/// @nodoc
class CodeReviewJobSummary {
  /// The unique identifier of the code review associated with the job.
  final String codeReviewId;

  /// The unique identifier of the code review job.
  final String codeReviewJobId;

  /// The date and time the code review job was created, in UTC format.
  final DateTime? createdAt;

  /// The current status of the code review job.
  final JobStatus? status;

  /// The title of the code review job.
  final String? title;

  /// The date and time the code review job was last updated, in UTC format.
  final DateTime? updatedAt;

  CodeReviewJobSummary({
    required this.codeReviewId,
    required this.codeReviewJobId,
    this.createdAt,
    this.status,
    this.title,
    this.updatedAt,
  });

  factory CodeReviewJobSummary.fromJson(Map<String, dynamic> json) {
    return CodeReviewJobSummary(
      codeReviewId: (json['codeReviewId'] as String?) ?? '',
      codeReviewJobId: (json['codeReviewJobId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      status: (json['status'] as String?)?.let(JobStatus.fromString),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewId = this.codeReviewId;
    final codeReviewJobId = this.codeReviewJobId;
    final createdAt = this.createdAt;
    final status = this.status;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      'codeReviewId': codeReviewId,
      'codeReviewJobId': codeReviewJobId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (status != null) 'status': status.value,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Contains summary information about an artifact.
///
/// @nodoc
class ArtifactSummary {
  /// The unique identifier of the artifact.
  final String artifactId;

  /// The file type of the artifact.
  final ArtifactType artifactType;

  /// The file name of the artifact.
  final String fileName;

  ArtifactSummary({
    required this.artifactId,
    required this.artifactType,
    required this.fileName,
  });

  factory ArtifactSummary.fromJson(Map<String, dynamic> json) {
    return ArtifactSummary(
      artifactId: (json['artifactId'] as String?) ?? '',
      artifactType:
          ArtifactType.fromString((json['artifactType'] as String?) ?? ''),
      fileName: (json['fileName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final artifactId = this.artifactId;
    final artifactType = this.artifactType;
    final fileName = this.fileName;
    return {
      'artifactId': artifactId,
      'artifactType': artifactType.value,
      'fileName': fileName,
    };
  }
}

/// Supported file extension types for artifacts.
///
/// @nodoc
class ArtifactType {
  static const txt = ArtifactType._('TXT');
  static const png = ArtifactType._('PNG');
  static const jpeg = ArtifactType._('JPEG');
  static const md = ArtifactType._('MD');
  static const pdf = ArtifactType._('PDF');
  static const docx = ArtifactType._('DOCX');
  static const doc = ArtifactType._('DOC');
  static const json = ArtifactType._('JSON');
  static const yaml = ArtifactType._('YAML');

  final String value;

  const ArtifactType._(this.value);

  static const values = [txt, png, jpeg, md, pdf, docx, doc, json, yaml];

  static ArtifactType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ArtifactType._(value));

  @override
  bool operator ==(other) => other is ArtifactType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an artifact that provides context for security testing, such as
/// documentation, diagrams, or configuration files.
///
/// @nodoc
class Artifact {
  /// The content of the artifact.
  final String contents;

  /// The file type of the artifact.
  final ArtifactType type;

  Artifact({
    required this.contents,
    required this.type,
  });

  factory Artifact.fromJson(Map<String, dynamic> json) {
    return Artifact(
      contents: (json['contents'] as String?) ?? '',
      type: ArtifactType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final contents = this.contents;
    final type = this.type;
    return {
      'contents': contents,
      'type': type.value,
    };
  }
}

/// Represents a pentest configuration that defines the parameters for security
/// testing, including target assets, risk type exclusions, and infrastructure
/// settings.
///
/// @nodoc
class Pentest {
  /// The unique identifier of the agent space that contains the pentest.
  final String agentSpaceId;

  /// The assets included in the pentest.
  final Assets assets;

  /// The unique identifier of the pentest.
  final String pentestId;

  /// The title of the pentest.
  final String title;

  /// The code remediation strategy for the pentest.
  final CodeRemediationStrategy? codeRemediationStrategy;

  /// The date and time the pentest was created, in UTC format.
  final DateTime? createdAt;

  /// The list of risk types excluded from the pentest.
  final List<RiskType>? excludeRiskTypes;

  /// The CloudWatch Logs configuration for the pentest.
  final CloudWatchLog? logConfig;

  /// The network traffic configuration for the pentest.
  final NetworkTrafficConfig? networkTrafficConfig;

  /// The IAM service role used for the pentest.
  final String? serviceRole;

  /// The date and time the pentest was last updated, in UTC format.
  final DateTime? updatedAt;

  /// The VPC configuration for the pentest.
  final VpcConfig? vpcConfig;

  Pentest({
    required this.agentSpaceId,
    required this.assets,
    required this.pentestId,
    required this.title,
    this.codeRemediationStrategy,
    this.createdAt,
    this.excludeRiskTypes,
    this.logConfig,
    this.networkTrafficConfig,
    this.serviceRole,
    this.updatedAt,
    this.vpcConfig,
  });

  factory Pentest.fromJson(Map<String, dynamic> json) {
    return Pentest(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      assets: Assets.fromJson((json['assets'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      pentestId: (json['pentestId'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      codeRemediationStrategy: (json['codeRemediationStrategy'] as String?)
          ?.let(CodeRemediationStrategy.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      excludeRiskTypes: (json['excludeRiskTypes'] as List?)
          ?.nonNulls
          .map((e) => RiskType.fromString((e as String)))
          .toList(),
      logConfig: json['logConfig'] != null
          ? CloudWatchLog.fromJson(json['logConfig'] as Map<String, dynamic>)
          : null,
      networkTrafficConfig: json['networkTrafficConfig'] != null
          ? NetworkTrafficConfig.fromJson(
              json['networkTrafficConfig'] as Map<String, dynamic>)
          : null,
      serviceRole: json['serviceRole'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final assets = this.assets;
    final pentestId = this.pentestId;
    final title = this.title;
    final codeRemediationStrategy = this.codeRemediationStrategy;
    final createdAt = this.createdAt;
    final excludeRiskTypes = this.excludeRiskTypes;
    final logConfig = this.logConfig;
    final networkTrafficConfig = this.networkTrafficConfig;
    final serviceRole = this.serviceRole;
    final updatedAt = this.updatedAt;
    final vpcConfig = this.vpcConfig;
    return {
      'agentSpaceId': agentSpaceId,
      'assets': assets,
      'pentestId': pentestId,
      'title': title,
      if (codeRemediationStrategy != null)
        'codeRemediationStrategy': codeRemediationStrategy.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (excludeRiskTypes != null)
        'excludeRiskTypes': excludeRiskTypes.map((e) => e.value).toList(),
      if (logConfig != null) 'logConfig': logConfig,
      if (networkTrafficConfig != null)
        'networkTrafficConfig': networkTrafficConfig,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// Represents an individual security test task within a pentest job. Each task
/// targets a specific risk type or endpoint and executes independently.
///
/// @nodoc
class Task {
  /// The unique identifier of the task.
  final String taskId;

  /// The unique identifier of the agent space.
  final String? agentSpaceId;

  /// The list of categories assigned to the task.
  final List<Category>? categories;

  /// The date and time the task was created, in UTC format.
  final DateTime? createdAt;

  /// A description of the task.
  final String? description;

  /// The current execution status of the task.
  final TaskExecutionStatus? executionStatus;

  /// The location of the task execution logs.
  final LogLocation? logsLocation;

  /// The unique identifier of the pentest associated with the task.
  final String? pentestId;

  /// The unique identifier of the pentest job that contains the task.
  final String? pentestJobId;

  /// The type of security risk the task is testing for.
  final RiskType? riskType;

  /// The target endpoint being tested by the task.
  final Endpoint? targetEndpoint;

  /// The title of the task.
  final String? title;

  /// The date and time the task was last updated, in UTC format.
  final DateTime? updatedAt;

  Task({
    required this.taskId,
    this.agentSpaceId,
    this.categories,
    this.createdAt,
    this.description,
    this.executionStatus,
    this.logsLocation,
    this.pentestId,
    this.pentestJobId,
    this.riskType,
    this.targetEndpoint,
    this.title,
    this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskId: (json['taskId'] as String?) ?? '',
      agentSpaceId: json['agentSpaceId'] as String?,
      categories: (json['categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      executionStatus: (json['executionStatus'] as String?)
          ?.let(TaskExecutionStatus.fromString),
      logsLocation: json['logsLocation'] != null
          ? LogLocation.fromJson(json['logsLocation'] as Map<String, dynamic>)
          : null,
      pentestId: json['pentestId'] as String?,
      pentestJobId: json['pentestJobId'] as String?,
      riskType: (json['riskType'] as String?)?.let(RiskType.fromString),
      targetEndpoint: json['targetEndpoint'] != null
          ? Endpoint.fromJson(json['targetEndpoint'] as Map<String, dynamic>)
          : null,
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final taskId = this.taskId;
    final agentSpaceId = this.agentSpaceId;
    final categories = this.categories;
    final createdAt = this.createdAt;
    final description = this.description;
    final executionStatus = this.executionStatus;
    final logsLocation = this.logsLocation;
    final pentestId = this.pentestId;
    final pentestJobId = this.pentestJobId;
    final riskType = this.riskType;
    final targetEndpoint = this.targetEndpoint;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      'taskId': taskId,
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
      if (categories != null) 'categories': categories,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (executionStatus != null) 'executionStatus': executionStatus.value,
      if (logsLocation != null) 'logsLocation': logsLocation,
      if (pentestId != null) 'pentestId': pentestId,
      if (pentestJobId != null) 'pentestJobId': pentestJobId,
      if (riskType != null) 'riskType': riskType.value,
      if (targetEndpoint != null) 'targetEndpoint': targetEndpoint,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// The log location for a task, specifying where task execution logs are
/// stored.
///
/// @nodoc
class LogLocation {
  /// The CloudWatch Logs location for the task logs.
  final CloudWatchLog? cloudWatchLog;

  /// The type of log storage. Currently, only CLOUDWATCH is supported.
  final LogType? logType;

  LogLocation({
    this.cloudWatchLog,
    this.logType,
  });

  factory LogLocation.fromJson(Map<String, dynamic> json) {
    return LogLocation(
      cloudWatchLog: json['cloudWatchLog'] != null
          ? CloudWatchLog.fromJson(
              json['cloudWatchLog'] as Map<String, dynamic>)
          : null,
      logType: (json['logType'] as String?)?.let(LogType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLog = this.cloudWatchLog;
    final logType = this.logType;
    return {
      if (cloudWatchLog != null) 'cloudWatchLog': cloudWatchLog,
      if (logType != null) 'logType': logType.value,
    };
  }
}

/// Type of log storage.
///
/// @nodoc
class LogType {
  static const cloudwatch = LogType._('CLOUDWATCH');

  final String value;

  const LogType._(this.value);

  static const values = [cloudwatch];

  static LogType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogType._(value));

  @override
  bool operator ==(other) => other is LogType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a category assigned to a security testing task.
///
/// @nodoc
class Category {
  /// Indicates whether this is the primary category for the task.
  final bool? isPrimary;

  /// The name of the category.
  final String? name;

  Category({
    this.isPrimary,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      isPrimary: json['isPrimary'] as bool?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isPrimary = this.isPrimary;
    final name = this.name;
    return {
      if (isPrimary != null) 'isPrimary': isPrimary,
      if (name != null) 'name': name,
    };
  }
}

/// Represents a pentest job, which is an execution instance of a pentest. A
/// pentest job progresses through preflight, static analysis, pentest, and
/// finalizing steps.
///
/// @nodoc
class PentestJob {
  /// The list of actors used during the pentest job.
  final List<Actor>? actors;

  /// The list of domains allowed during the pentest job.
  final List<Endpoint>? allowedDomains;

  /// The code remediation strategy for the pentest job.
  final CodeRemediationStrategy? codeRemediationStrategy;

  /// The date and time the pentest job was created, in UTC format.
  final DateTime? createdAt;

  /// The list of documents providing context for the pentest job.
  final List<DocumentInfo>? documents;

  /// The list of endpoints being tested in the pentest job.
  final List<Endpoint>? endpoints;

  /// Error information if the pentest job encountered an error.
  final ErrorInformation? errorInformation;

  /// The list of paths excluded from the pentest job.
  final List<Endpoint>? excludePaths;

  /// The list of risk types excluded from the pentest job.
  final List<RiskType>? excludeRiskTypes;

  /// The execution context messages for the pentest job.
  final List<ExecutionContext>? executionContext;

  /// The list of integrated repositories associated with the pentest job.
  final List<IntegratedRepository>? integratedRepositories;

  /// The CloudWatch Logs configuration for the pentest job.
  final CloudWatchLog? logConfig;

  /// The network traffic configuration for the pentest job.
  final NetworkTrafficConfig? networkTrafficConfig;

  /// An overview of the pentest job results.
  final String? overview;

  /// The unique identifier of the pentest associated with the job.
  final String? pentestId;

  /// The unique identifier of the pentest job.
  final String? pentestJobId;

  /// The IAM service role used for the pentest job.
  final String? serviceRole;

  /// The list of source code repositories analyzed during the pentest job.
  final List<SourceCodeRepository>? sourceCode;

  /// The current status of the pentest job.
  final JobStatus? status;

  /// The list of steps in the pentest job execution.
  final List<Step>? steps;

  /// The title of the pentest job.
  final String? title;

  /// The date and time the pentest job was last updated, in UTC format.
  final DateTime? updatedAt;

  /// The VPC configuration for the pentest job.
  final VpcConfig? vpcConfig;

  PentestJob({
    this.actors,
    this.allowedDomains,
    this.codeRemediationStrategy,
    this.createdAt,
    this.documents,
    this.endpoints,
    this.errorInformation,
    this.excludePaths,
    this.excludeRiskTypes,
    this.executionContext,
    this.integratedRepositories,
    this.logConfig,
    this.networkTrafficConfig,
    this.overview,
    this.pentestId,
    this.pentestJobId,
    this.serviceRole,
    this.sourceCode,
    this.status,
    this.steps,
    this.title,
    this.updatedAt,
    this.vpcConfig,
  });

  factory PentestJob.fromJson(Map<String, dynamic> json) {
    return PentestJob(
      actors: (json['actors'] as List?)
          ?.nonNulls
          .map((e) => Actor.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowedDomains: (json['allowedDomains'] as List?)
          ?.nonNulls
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      codeRemediationStrategy: (json['codeRemediationStrategy'] as String?)
          ?.let(CodeRemediationStrategy.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      documents: (json['documents'] as List?)
          ?.nonNulls
          .map((e) => DocumentInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      endpoints: (json['endpoints'] as List?)
          ?.nonNulls
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorInformation: json['errorInformation'] != null
          ? ErrorInformation.fromJson(
              json['errorInformation'] as Map<String, dynamic>)
          : null,
      excludePaths: (json['excludePaths'] as List?)
          ?.nonNulls
          .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      excludeRiskTypes: (json['excludeRiskTypes'] as List?)
          ?.nonNulls
          .map((e) => RiskType.fromString((e as String)))
          .toList(),
      executionContext: (json['executionContext'] as List?)
          ?.nonNulls
          .map((e) => ExecutionContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      integratedRepositories: (json['integratedRepositories'] as List?)
          ?.nonNulls
          .map((e) => IntegratedRepository.fromJson(e as Map<String, dynamic>))
          .toList(),
      logConfig: json['logConfig'] != null
          ? CloudWatchLog.fromJson(json['logConfig'] as Map<String, dynamic>)
          : null,
      networkTrafficConfig: json['networkTrafficConfig'] != null
          ? NetworkTrafficConfig.fromJson(
              json['networkTrafficConfig'] as Map<String, dynamic>)
          : null,
      overview: json['overview'] as String?,
      pentestId: json['pentestId'] as String?,
      pentestJobId: json['pentestJobId'] as String?,
      serviceRole: json['serviceRole'] as String?,
      sourceCode: (json['sourceCode'] as List?)
          ?.nonNulls
          .map((e) => SourceCodeRepository.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.let(JobStatus.fromString),
      steps: (json['steps'] as List?)
          ?.nonNulls
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actors = this.actors;
    final allowedDomains = this.allowedDomains;
    final codeRemediationStrategy = this.codeRemediationStrategy;
    final createdAt = this.createdAt;
    final documents = this.documents;
    final endpoints = this.endpoints;
    final errorInformation = this.errorInformation;
    final excludePaths = this.excludePaths;
    final excludeRiskTypes = this.excludeRiskTypes;
    final executionContext = this.executionContext;
    final integratedRepositories = this.integratedRepositories;
    final logConfig = this.logConfig;
    final networkTrafficConfig = this.networkTrafficConfig;
    final overview = this.overview;
    final pentestId = this.pentestId;
    final pentestJobId = this.pentestJobId;
    final serviceRole = this.serviceRole;
    final sourceCode = this.sourceCode;
    final status = this.status;
    final steps = this.steps;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final vpcConfig = this.vpcConfig;
    return {
      if (actors != null) 'actors': actors,
      if (allowedDomains != null) 'allowedDomains': allowedDomains,
      if (codeRemediationStrategy != null)
        'codeRemediationStrategy': codeRemediationStrategy.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (documents != null) 'documents': documents,
      if (endpoints != null) 'endpoints': endpoints,
      if (errorInformation != null) 'errorInformation': errorInformation,
      if (excludePaths != null) 'excludePaths': excludePaths,
      if (excludeRiskTypes != null)
        'excludeRiskTypes': excludeRiskTypes.map((e) => e.value).toList(),
      if (executionContext != null) 'executionContext': executionContext,
      if (integratedRepositories != null)
        'integratedRepositories': integratedRepositories,
      if (logConfig != null) 'logConfig': logConfig,
      if (networkTrafficConfig != null)
        'networkTrafficConfig': networkTrafficConfig,
      if (overview != null) 'overview': overview,
      if (pentestId != null) 'pentestId': pentestId,
      if (pentestJobId != null) 'pentestJobId': pentestJobId,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (sourceCode != null) 'sourceCode': sourceCode,
      if (status != null) 'status': status.value,
      if (steps != null) 'steps': steps,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// Contains error information for a pentest job that encountered an error.
///
/// @nodoc
class ErrorInformation {
  /// The error code. Valid values include CLIENT_ERROR, INTERNAL_ERROR, and
  /// STOPPED_BY_USER.
  final ErrorCode? code;

  /// A message describing the error.
  final String? message;

  ErrorInformation({
    this.code,
    this.message,
  });

  factory ErrorInformation.fromJson(Map<String, dynamic> json) {
    return ErrorInformation(
      code: (json['code'] as String?)?.let(ErrorCode.fromString),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.value,
      if (message != null) 'message': message,
    };
  }
}

/// Error code for pentest job failure.
///
/// @nodoc
class ErrorCode {
  static const clientError = ErrorCode._('CLIENT_ERROR');
  static const internalError = ErrorCode._('INTERNAL_ERROR');
  static const stoppedByUser = ErrorCode._('STOPPED_BY_USER');

  final String value;

  const ErrorCode._(this.value);

  static const values = [clientError, internalError, stoppedByUser];

  static ErrorCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ErrorCode._(value));

  @override
  bool operator ==(other) => other is ErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains contextual information about the execution of a pentest job, such
/// as errors, warnings, or informational messages.
///
/// @nodoc
class ExecutionContext {
  /// The context message.
  final String? context;

  /// The type of context. Valid values include ERROR, CLIENT_ERROR, WARNING, and
  /// INFO.
  final ContextType? contextType;

  /// The date and time the context was recorded, in UTC format.
  final DateTime? timestamp;

  ExecutionContext({
    this.context,
    this.contextType,
    this.timestamp,
  });

  factory ExecutionContext.fromJson(Map<String, dynamic> json) {
    return ExecutionContext(
      context: json['context'] as String?,
      contextType:
          (json['contextType'] as String?)?.let(ContextType.fromString),
      timestamp: timeStampFromJson(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final context = this.context;
    final contextType = this.contextType;
    final timestamp = this.timestamp;
    return {
      if (context != null) 'context': context,
      if (contextType != null) 'contextType': contextType.value,
      if (timestamp != null) 'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Category of execution context.
///
/// @nodoc
class ContextType {
  static const error = ContextType._('ERROR');
  static const clientError = ContextType._('CLIENT_ERROR');
  static const warning = ContextType._('WARNING');
  static const info = ContextType._('INFO');

  final String value;

  const ContextType._(this.value);

  static const values = [error, clientError, warning, info];

  static ContextType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ContextType._(value));

  @override
  bool operator ==(other) => other is ContextType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a step in the pentest job execution pipeline. Steps include
/// preflight, static analysis, pentest, and finalizing.
///
/// @nodoc
class Step {
  /// The date and time the step was created, in UTC format.
  final DateTime? createdAt;

  /// The name of the step. Valid values include PREFLIGHT, STATIC_ANALYSIS,
  /// PENTEST, and FINALIZING.
  final StepName? name;

  /// The current status of the step.
  final StepStatus? status;

  /// The date and time the step was last updated, in UTC format.
  final DateTime? updatedAt;

  Step({
    this.createdAt,
    this.name,
    this.status,
    this.updatedAt,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      createdAt: timeStampFromJson(json['createdAt']),
      name: (json['name'] as String?)?.let(StepName.fromString),
      status: (json['status'] as String?)?.let(StepStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (name != null) 'name': name.value,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Pentest job step status.
///
/// @nodoc
class StepStatus {
  static const notStarted = StepStatus._('NOT_STARTED');
  static const inProgress = StepStatus._('IN_PROGRESS');
  static const completed = StepStatus._('COMPLETED');
  static const failed = StepStatus._('FAILED');
  static const stopped = StepStatus._('STOPPED');

  final String value;

  const StepStatus._(this.value);

  static const values = [notStarted, inProgress, completed, failed, stopped];

  static StepStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StepStatus._(value));

  @override
  bool operator ==(other) => other is StepStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a security finding discovered during a pentest job. A finding
/// contains details about a vulnerability, including its risk level,
/// confidence, and remediation status.
///
/// @nodoc
class Finding {
  /// The unique identifier of the agent space associated with the finding.
  final String agentSpaceId;

  /// The unique identifier of the finding.
  final String findingId;

  /// The attack script used to reproduce the finding.
  final String? attackScript;

  /// The file locations involved in the vulnerability, as reported by the code
  /// scanner.
  final List<CodeLocation>? codeLocations;

  /// The code remediation task associated with the finding, if code remediation
  /// was initiated.
  final CodeRemediationTask? codeRemediationTask;

  /// The unique identifier of the code review associated with the finding.
  final String? codeReviewId;

  /// The unique identifier of the code review job that produced the finding.
  final String? codeReviewJobId;

  /// The confidence level of the finding. Valid values include FALSE_POSITIVE,
  /// UNCONFIRMED, LOW, MEDIUM, and HIGH.
  final ConfidenceLevel? confidence;

  /// The date and time the finding was created, in UTC format.
  final DateTime? createdAt;

  /// A description of the finding.
  final String? description;

  /// The identifier of the entity that last updated the finding.
  final String? lastUpdatedBy;

  /// The name of the finding.
  final String? name;

  /// The unique identifier of the pentest associated with the finding.
  final String? pentestId;

  /// The unique identifier of the pentest job that produced the finding.
  final String? pentestJobId;

  /// The reasoning behind the finding, explaining why it was identified as a
  /// vulnerability.
  final String? reasoning;

  /// The risk level of the finding. Valid values include UNKNOWN, INFORMATIONAL,
  /// LOW, MEDIUM, HIGH, and CRITICAL.
  final RiskLevel? riskLevel;

  /// The numerical risk score of the finding.
  final String? riskScore;

  /// The type of security risk identified by the finding.
  final String? riskType;

  /// The current status of the finding. Valid values include ACTIVE, RESOLVED,
  /// ACCEPTED, and FALSE_POSITIVE.
  final FindingStatus? status;

  /// The unique identifier of the task that produced the finding.
  final String? taskId;

  /// The date and time the finding was last updated, in UTC format.
  final DateTime? updatedAt;

  /// The verification script metadata for reproducing the finding, including
  /// download URL, instructions, and required environment variables.
  final VerificationScript? verificationScript;

  Finding({
    required this.agentSpaceId,
    required this.findingId,
    this.attackScript,
    this.codeLocations,
    this.codeRemediationTask,
    this.codeReviewId,
    this.codeReviewJobId,
    this.confidence,
    this.createdAt,
    this.description,
    this.lastUpdatedBy,
    this.name,
    this.pentestId,
    this.pentestJobId,
    this.reasoning,
    this.riskLevel,
    this.riskScore,
    this.riskType,
    this.status,
    this.taskId,
    this.updatedAt,
    this.verificationScript,
  });

  factory Finding.fromJson(Map<String, dynamic> json) {
    return Finding(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      findingId: (json['findingId'] as String?) ?? '',
      attackScript: json['attackScript'] as String?,
      codeLocations: (json['codeLocations'] as List?)
          ?.nonNulls
          .map((e) => CodeLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      codeRemediationTask: json['codeRemediationTask'] != null
          ? CodeRemediationTask.fromJson(
              json['codeRemediationTask'] as Map<String, dynamic>)
          : null,
      codeReviewId: json['codeReviewId'] as String?,
      codeReviewJobId: json['codeReviewJobId'] as String?,
      confidence:
          (json['confidence'] as String?)?.let(ConfidenceLevel.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      lastUpdatedBy: json['lastUpdatedBy'] as String?,
      name: json['name'] as String?,
      pentestId: json['pentestId'] as String?,
      pentestJobId: json['pentestJobId'] as String?,
      reasoning: json['reasoning'] as String?,
      riskLevel: (json['riskLevel'] as String?)?.let(RiskLevel.fromString),
      riskScore: json['riskScore'] as String?,
      riskType: json['riskType'] as String?,
      status: (json['status'] as String?)?.let(FindingStatus.fromString),
      taskId: json['taskId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      verificationScript: json['verificationScript'] != null
          ? VerificationScript.fromJson(
              json['verificationScript'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final findingId = this.findingId;
    final attackScript = this.attackScript;
    final codeLocations = this.codeLocations;
    final codeRemediationTask = this.codeRemediationTask;
    final codeReviewId = this.codeReviewId;
    final codeReviewJobId = this.codeReviewJobId;
    final confidence = this.confidence;
    final createdAt = this.createdAt;
    final description = this.description;
    final lastUpdatedBy = this.lastUpdatedBy;
    final name = this.name;
    final pentestId = this.pentestId;
    final pentestJobId = this.pentestJobId;
    final reasoning = this.reasoning;
    final riskLevel = this.riskLevel;
    final riskScore = this.riskScore;
    final riskType = this.riskType;
    final status = this.status;
    final taskId = this.taskId;
    final updatedAt = this.updatedAt;
    final verificationScript = this.verificationScript;
    return {
      'agentSpaceId': agentSpaceId,
      'findingId': findingId,
      if (attackScript != null) 'attackScript': attackScript,
      if (codeLocations != null) 'codeLocations': codeLocations,
      if (codeRemediationTask != null)
        'codeRemediationTask': codeRemediationTask,
      if (codeReviewId != null) 'codeReviewId': codeReviewId,
      if (codeReviewJobId != null) 'codeReviewJobId': codeReviewJobId,
      if (confidence != null) 'confidence': confidence.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (lastUpdatedBy != null) 'lastUpdatedBy': lastUpdatedBy,
      if (name != null) 'name': name,
      if (pentestId != null) 'pentestId': pentestId,
      if (pentestJobId != null) 'pentestJobId': pentestJobId,
      if (reasoning != null) 'reasoning': reasoning,
      if (riskLevel != null) 'riskLevel': riskLevel.value,
      if (riskScore != null) 'riskScore': riskScore,
      if (riskType != null) 'riskType': riskType,
      if (status != null) 'status': status.value,
      if (taskId != null) 'taskId': taskId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (verificationScript != null) 'verificationScript': verificationScript,
    };
  }
}

/// Represents a code remediation task that was initiated to fix a security
/// finding.
///
/// @nodoc
class CodeRemediationTask {
  /// The current status of the code remediation task.
  final CodeRemediationTaskStatus status;

  /// The reason for the current status of the code remediation task.
  final String? statusReason;

  /// The list of details for the code remediation task, including repository
  /// name, code diff link, and pull request link.
  final List<CodeRemediationTaskDetails>? taskDetails;

  CodeRemediationTask({
    required this.status,
    this.statusReason,
    this.taskDetails,
  });

  factory CodeRemediationTask.fromJson(Map<String, dynamic> json) {
    return CodeRemediationTask(
      status: CodeRemediationTaskStatus.fromString(
          (json['status'] as String?) ?? ''),
      statusReason: json['statusReason'] as String?,
      taskDetails: (json['taskDetails'] as List?)
          ?.nonNulls
          .map((e) =>
              CodeRemediationTaskDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusReason = this.statusReason;
    final taskDetails = this.taskDetails;
    return {
      'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (taskDetails != null) 'taskDetails': taskDetails,
    };
  }
}

/// Contains metadata for a verification script that can be used to reproduce a
/// security finding.
///
/// @nodoc
class VerificationScript {
  /// The list of environment variables required to run the verification script.
  final List<VerificationScriptEnvVar>? envVars;

  /// Instructions for running the verification script, including prerequisites
  /// and how to interpret results.
  final String? instructions;

  /// The type of script. Valid values are python and bash.
  final String? scriptType;

  /// URL to download the verification script.
  final String? scriptUrl;

  VerificationScript({
    this.envVars,
    this.instructions,
    this.scriptType,
    this.scriptUrl,
  });

  factory VerificationScript.fromJson(Map<String, dynamic> json) {
    return VerificationScript(
      envVars: (json['envVars'] as List?)
          ?.nonNulls
          .map((e) =>
              VerificationScriptEnvVar.fromJson(e as Map<String, dynamic>))
          .toList(),
      instructions: json['instructions'] as String?,
      scriptType: json['scriptType'] as String?,
      scriptUrl: json['scriptUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final envVars = this.envVars;
    final instructions = this.instructions;
    final scriptType = this.scriptType;
    final scriptUrl = this.scriptUrl;
    return {
      if (envVars != null) 'envVars': envVars,
      if (instructions != null) 'instructions': instructions,
      if (scriptType != null) 'scriptType': scriptType,
      if (scriptUrl != null) 'scriptUrl': scriptUrl,
    };
  }
}

/// Represents an environment variable required to run a verification script.
///
/// @nodoc
class VerificationScriptEnvVar {
  /// The name of the environment variable.
  final String? name;

  /// The value of the environment variable.
  final String? value;

  VerificationScriptEnvVar({
    this.name,
    this.value,
  });

  factory VerificationScriptEnvVar.fromJson(Map<String, dynamic> json) {
    return VerificationScriptEnvVar(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// Represents a location in source code associated with a security finding.
///
/// @nodoc
class CodeLocation {
  /// The absolute path to the file containing the code location.
  final String filePath;

  /// The role of this location in the vulnerability, such as source or sink.
  final String? label;

  /// The ending line number of the code location.
  final int? lineEnd;

  /// The starting line number of the code location.
  final int? lineStart;

  CodeLocation({
    required this.filePath,
    this.label,
    this.lineEnd,
    this.lineStart,
  });

  factory CodeLocation.fromJson(Map<String, dynamic> json) {
    return CodeLocation(
      filePath: (json['filePath'] as String?) ?? '',
      label: json['label'] as String?,
      lineEnd: json['lineEnd'] as int?,
      lineStart: json['lineStart'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final filePath = this.filePath;
    final label = this.label;
    final lineEnd = this.lineEnd;
    final lineStart = this.lineStart;
    return {
      'filePath': filePath,
      if (label != null) 'label': label,
      if (lineEnd != null) 'lineEnd': lineEnd,
      if (lineStart != null) 'lineStart': lineStart,
    };
  }
}

/// Code remediation task status.
///
/// @nodoc
class CodeRemediationTaskStatus {
  static const inProgress = CodeRemediationTaskStatus._('IN_PROGRESS');
  static const completed = CodeRemediationTaskStatus._('COMPLETED');
  static const failed = CodeRemediationTaskStatus._('FAILED');

  final String value;

  const CodeRemediationTaskStatus._(this.value);

  static const values = [inProgress, completed, failed];

  static CodeRemediationTaskStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CodeRemediationTaskStatus._(value));

  @override
  bool operator ==(other) =>
      other is CodeRemediationTaskStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a code remediation task, including links to the code
/// diff and pull request.
///
/// @nodoc
class CodeRemediationTaskDetails {
  /// The link to the code diff for the remediation.
  final String? codeDiffLink;

  /// The link to the pull request created for the remediation.
  final String? pullRequestLink;

  /// The name of the repository where the remediation was applied.
  final String? repoName;

  CodeRemediationTaskDetails({
    this.codeDiffLink,
    this.pullRequestLink,
    this.repoName,
  });

  factory CodeRemediationTaskDetails.fromJson(Map<String, dynamic> json) {
    return CodeRemediationTaskDetails(
      codeDiffLink: json['codeDiffLink'] as String?,
      pullRequestLink: json['pullRequestLink'] as String?,
      repoName: json['repoName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeDiffLink = this.codeDiffLink;
    final pullRequestLink = this.pullRequestLink;
    final repoName = this.repoName;
    return {
      if (codeDiffLink != null) 'codeDiffLink': codeDiffLink,
      if (pullRequestLink != null) 'pullRequestLink': pullRequestLink,
      if (repoName != null) 'repoName': repoName,
    };
  }
}

/// Represents a code review configuration that defines the parameters for
/// automated security-focused code analysis, including target assets and
/// logging configuration.
///
/// @nodoc
class CodeReview {
  /// The unique identifier of the agent space that contains the code review.
  final String agentSpaceId;

  /// The assets included in the code review.
  final Assets assets;

  /// The unique identifier of the code review.
  final String codeReviewId;

  /// The title of the code review.
  final String title;

  /// The code remediation strategy for the code review.
  final CodeRemediationStrategy? codeRemediationStrategy;

  /// The date and time the code review was created, in UTC format.
  final DateTime? createdAt;

  /// The CloudWatch Logs configuration for the code review.
  final CloudWatchLog? logConfig;

  /// The IAM service role used for the code review.
  final String? serviceRole;

  /// The date and time the code review was last updated, in UTC format.
  final DateTime? updatedAt;

  CodeReview({
    required this.agentSpaceId,
    required this.assets,
    required this.codeReviewId,
    required this.title,
    this.codeRemediationStrategy,
    this.createdAt,
    this.logConfig,
    this.serviceRole,
    this.updatedAt,
  });

  factory CodeReview.fromJson(Map<String, dynamic> json) {
    return CodeReview(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      assets: Assets.fromJson((json['assets'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      codeReviewId: (json['codeReviewId'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      codeRemediationStrategy: (json['codeRemediationStrategy'] as String?)
          ?.let(CodeRemediationStrategy.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      logConfig: json['logConfig'] != null
          ? CloudWatchLog.fromJson(json['logConfig'] as Map<String, dynamic>)
          : null,
      serviceRole: json['serviceRole'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final assets = this.assets;
    final codeReviewId = this.codeReviewId;
    final title = this.title;
    final codeRemediationStrategy = this.codeRemediationStrategy;
    final createdAt = this.createdAt;
    final logConfig = this.logConfig;
    final serviceRole = this.serviceRole;
    final updatedAt = this.updatedAt;
    return {
      'agentSpaceId': agentSpaceId,
      'assets': assets,
      'codeReviewId': codeReviewId,
      'title': title,
      if (codeRemediationStrategy != null)
        'codeRemediationStrategy': codeRemediationStrategy.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (logConfig != null) 'logConfig': logConfig,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Represents an individual security test task within a code review job. Each
/// task targets a specific risk type and executes independently.
///
/// @nodoc
class CodeReviewJobTask {
  /// The unique identifier of the task.
  final String taskId;

  /// The unique identifier of the agent space.
  final String? agentSpaceId;

  /// The list of categories assigned to the task.
  final List<Category>? categories;

  /// The unique identifier of the code review associated with the task.
  final String? codeReviewId;

  /// The unique identifier of the code review job that contains the task.
  final String? codeReviewJobId;

  /// The date and time the task was created, in UTC format.
  final DateTime? createdAt;

  /// A description of the task.
  final String? description;

  /// The current execution status of the task.
  final TaskExecutionStatus? executionStatus;

  /// The location of the task execution logs.
  final LogLocation? logsLocation;

  /// The type of security risk the task is testing for.
  final RiskType? riskType;

  /// The title of the task.
  final String? title;

  /// The date and time the task was last updated, in UTC format.
  final DateTime? updatedAt;

  CodeReviewJobTask({
    required this.taskId,
    this.agentSpaceId,
    this.categories,
    this.codeReviewId,
    this.codeReviewJobId,
    this.createdAt,
    this.description,
    this.executionStatus,
    this.logsLocation,
    this.riskType,
    this.title,
    this.updatedAt,
  });

  factory CodeReviewJobTask.fromJson(Map<String, dynamic> json) {
    return CodeReviewJobTask(
      taskId: (json['taskId'] as String?) ?? '',
      agentSpaceId: json['agentSpaceId'] as String?,
      categories: (json['categories'] as List?)
          ?.nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      codeReviewId: json['codeReviewId'] as String?,
      codeReviewJobId: json['codeReviewJobId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      executionStatus: (json['executionStatus'] as String?)
          ?.let(TaskExecutionStatus.fromString),
      logsLocation: json['logsLocation'] != null
          ? LogLocation.fromJson(json['logsLocation'] as Map<String, dynamic>)
          : null,
      riskType: (json['riskType'] as String?)?.let(RiskType.fromString),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final taskId = this.taskId;
    final agentSpaceId = this.agentSpaceId;
    final categories = this.categories;
    final codeReviewId = this.codeReviewId;
    final codeReviewJobId = this.codeReviewJobId;
    final createdAt = this.createdAt;
    final description = this.description;
    final executionStatus = this.executionStatus;
    final logsLocation = this.logsLocation;
    final riskType = this.riskType;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      'taskId': taskId,
      if (agentSpaceId != null) 'agentSpaceId': agentSpaceId,
      if (categories != null) 'categories': categories,
      if (codeReviewId != null) 'codeReviewId': codeReviewId,
      if (codeReviewJobId != null) 'codeReviewJobId': codeReviewJobId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (executionStatus != null) 'executionStatus': executionStatus.value,
      if (logsLocation != null) 'logsLocation': logsLocation,
      if (riskType != null) 'riskType': riskType.value,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Represents a code review job, which is an execution instance of a code
/// review. A code review job progresses through preflight, static analysis, and
/// finalizing steps.
///
/// @nodoc
class CodeReviewJob {
  /// The code remediation strategy for the code review job.
  final CodeRemediationStrategy? codeRemediationStrategy;

  /// The unique identifier of the code review associated with the job.
  final String? codeReviewId;

  /// The unique identifier of the code review job.
  final String? codeReviewJobId;

  /// The date and time the code review job was created, in UTC format.
  final DateTime? createdAt;

  /// The list of documents providing context for the code review job.
  final List<DocumentInfo>? documents;

  /// Error information if the code review job encountered an error.
  final ErrorInformation? errorInformation;

  /// The execution context messages for the code review job.
  final List<ExecutionContext>? executionContext;

  /// The list of integrated repositories associated with the code review job.
  final List<IntegratedRepository>? integratedRepositories;

  /// The CloudWatch Logs configuration for the code review job.
  final CloudWatchLog? logConfig;

  /// An overview of the code review job results.
  final String? overview;

  /// The IAM service role used for the code review job.
  final String? serviceRole;

  /// The list of source code repositories analyzed during the code review job.
  final List<SourceCodeRepository>? sourceCode;

  /// The current status of the code review job.
  final JobStatus? status;

  /// The list of steps in the code review job execution.
  final List<Step>? steps;

  /// The title of the code review job.
  final String? title;

  /// The date and time the code review job was last updated, in UTC format.
  final DateTime? updatedAt;

  CodeReviewJob({
    this.codeRemediationStrategy,
    this.codeReviewId,
    this.codeReviewJobId,
    this.createdAt,
    this.documents,
    this.errorInformation,
    this.executionContext,
    this.integratedRepositories,
    this.logConfig,
    this.overview,
    this.serviceRole,
    this.sourceCode,
    this.status,
    this.steps,
    this.title,
    this.updatedAt,
  });

  factory CodeReviewJob.fromJson(Map<String, dynamic> json) {
    return CodeReviewJob(
      codeRemediationStrategy: (json['codeRemediationStrategy'] as String?)
          ?.let(CodeRemediationStrategy.fromString),
      codeReviewId: json['codeReviewId'] as String?,
      codeReviewJobId: json['codeReviewJobId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      documents: (json['documents'] as List?)
          ?.nonNulls
          .map((e) => DocumentInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorInformation: json['errorInformation'] != null
          ? ErrorInformation.fromJson(
              json['errorInformation'] as Map<String, dynamic>)
          : null,
      executionContext: (json['executionContext'] as List?)
          ?.nonNulls
          .map((e) => ExecutionContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      integratedRepositories: (json['integratedRepositories'] as List?)
          ?.nonNulls
          .map((e) => IntegratedRepository.fromJson(e as Map<String, dynamic>))
          .toList(),
      logConfig: json['logConfig'] != null
          ? CloudWatchLog.fromJson(json['logConfig'] as Map<String, dynamic>)
          : null,
      overview: json['overview'] as String?,
      serviceRole: json['serviceRole'] as String?,
      sourceCode: (json['sourceCode'] as List?)
          ?.nonNulls
          .map((e) => SourceCodeRepository.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.let(JobStatus.fromString),
      steps: (json['steps'] as List?)
          ?.nonNulls
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final codeRemediationStrategy = this.codeRemediationStrategy;
    final codeReviewId = this.codeReviewId;
    final codeReviewJobId = this.codeReviewJobId;
    final createdAt = this.createdAt;
    final documents = this.documents;
    final errorInformation = this.errorInformation;
    final executionContext = this.executionContext;
    final integratedRepositories = this.integratedRepositories;
    final logConfig = this.logConfig;
    final overview = this.overview;
    final serviceRole = this.serviceRole;
    final sourceCode = this.sourceCode;
    final status = this.status;
    final steps = this.steps;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      if (codeRemediationStrategy != null)
        'codeRemediationStrategy': codeRemediationStrategy.value,
      if (codeReviewId != null) 'codeReviewId': codeReviewId,
      if (codeReviewJobId != null) 'codeReviewJobId': codeReviewJobId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (documents != null) 'documents': documents,
      if (errorInformation != null) 'errorInformation': errorInformation,
      if (executionContext != null) 'executionContext': executionContext,
      if (integratedRepositories != null)
        'integratedRepositories': integratedRepositories,
      if (logConfig != null) 'logConfig': logConfig,
      if (overview != null) 'overview': overview,
      if (serviceRole != null) 'serviceRole': serviceRole,
      if (sourceCode != null) 'sourceCode': sourceCode,
      if (status != null) 'status': status.value,
      if (steps != null) 'steps': steps,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Contains metadata about an artifact.
///
/// @nodoc
class ArtifactMetadataItem {
  /// The unique identifier of the agent space that contains the artifact.
  final String agentSpaceId;

  /// The unique identifier of the artifact.
  final String artifactId;

  /// The file name of the artifact.
  final String fileName;

  /// The date and time the artifact was last updated, in UTC format.
  final DateTime updatedAt;

  ArtifactMetadataItem({
    required this.agentSpaceId,
    required this.artifactId,
    required this.fileName,
    required this.updatedAt,
  });

  factory ArtifactMetadataItem.fromJson(Map<String, dynamic> json) {
    return ArtifactMetadataItem(
      agentSpaceId: (json['agentSpaceId'] as String?) ?? '',
      artifactId: (json['artifactId'] as String?) ?? '',
      fileName: (json['fileName'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final agentSpaceId = this.agentSpaceId;
    final artifactId = this.artifactId;
    final fileName = this.fileName;
    final updatedAt = this.updatedAt;
    return {
      'agentSpaceId': agentSpaceId,
      'artifactId': artifactId,
      'fileName': fileName,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Contains information about a pentest that failed to delete.
///
/// @nodoc
class DeletePentestFailure {
  /// The unique identifier of the pentest that failed to delete.
  final String? pentestId;

  /// The reason the pentest failed to delete.
  final String? reason;

  DeletePentestFailure({
    this.pentestId,
    this.reason,
  });

  factory DeletePentestFailure.fromJson(Map<String, dynamic> json) {
    return DeletePentestFailure(
      pentestId: json['pentestId'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pentestId = this.pentestId;
    final reason = this.reason;
    return {
      if (pentestId != null) 'pentestId': pentestId,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Contains information about a code review that failed to delete.
///
/// @nodoc
class DeleteCodeReviewFailure {
  /// The unique identifier of the code review that failed to delete.
  final String? codeReviewId;

  /// The reason the code review failed to delete.
  final String? reason;

  DeleteCodeReviewFailure({
    this.codeReviewId,
    this.reason,
  });

  factory DeleteCodeReviewFailure.fromJson(Map<String, dynamic> json) {
    return DeleteCodeReviewFailure(
      codeReviewId: json['codeReviewId'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeReviewId = this.codeReviewId;
    final reason = this.reason;
    return {
      if (codeReviewId != null) 'codeReviewId': codeReviewId,
      if (reason != null) 'reason': reason,
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
