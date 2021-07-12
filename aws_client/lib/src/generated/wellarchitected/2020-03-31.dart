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

/// This is the <i>AWS Well-Architected Tool API Reference</i>. The AWS
/// Well-Architected Tool API provides programmatic access to the <a
/// href="http://aws.amazon.com/well-architected-tool">AWS Well-Architected
/// Tool</a> in the <a href="https://console.aws.amazon.com/wellarchitected">AWS
/// Management Console</a>. For information about the AWS Well-Architected Tool,
/// see the <a
/// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/intro.html">AWS
/// Well-Architected Tool User Guide</a>.
class WellArchitected {
  final _s.RestJsonProtocol _protocol;
  WellArchitected({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'wellarchitected',
            signingName: 'wellarchitected',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associate a lens to a workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> associateLenses({
    required List<String> lensAliases,
    required String workloadId,
  }) async {
    ArgumentError.checkNotNull(lensAliases, 'lensAliases');
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final $payload = <String, dynamic>{
      'LensAliases': lensAliases,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/associateLenses',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Create a milestone for an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<CreateMilestoneOutput> createMilestone({
    required String milestoneName,
    required String workloadId,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(milestoneName, 'milestoneName');
    _s.validateStringLength(
      'milestoneName',
      milestoneName,
      3,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final $payload = <String, dynamic>{
      'MilestoneName': milestoneName,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workloads/${Uri.encodeComponent(workloadId)}/milestones',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMilestoneOutput.fromJson(response);
  }

  /// Create a new workload.
  ///
  /// The owner of a workload can share the workload with other AWS accounts and
  /// IAM users in the same AWS Region. Only the owner of a workload can delete
  /// it.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/define-workload.html">Defining
  /// a Workload</a> in the <i>AWS Well-Architected Tool User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [tags] :
  /// The tags to be associated with the workload.
  Future<CreateWorkloadOutput> createWorkload({
    required String description,
    required WorkloadEnvironment environment,
    required List<String> lenses,
    required String reviewOwner,
    required String workloadName,
    List<String>? accountIds,
    String? architecturalDesign,
    List<String>? awsRegions,
    String? clientRequestToken,
    String? industry,
    String? industryType,
    List<String>? nonAwsRegions,
    String? notes,
    List<String>? pillarPriorities,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      3,
      250,
      isRequired: true,
    );
    ArgumentError.checkNotNull(environment, 'environment');
    ArgumentError.checkNotNull(lenses, 'lenses');
    ArgumentError.checkNotNull(reviewOwner, 'reviewOwner');
    _s.validateStringLength(
      'reviewOwner',
      reviewOwner,
      3,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadName, 'workloadName');
    _s.validateStringLength(
      'workloadName',
      workloadName,
      3,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'architecturalDesign',
      architecturalDesign,
      0,
      2048,
    );
    _s.validateStringLength(
      'industry',
      industry,
      0,
      100,
    );
    _s.validateStringLength(
      'industryType',
      industryType,
      0,
      100,
    );
    _s.validateStringLength(
      'notes',
      notes,
      0,
      2084,
    );
    final $payload = <String, dynamic>{
      'Description': description,
      'Environment': environment.toValue(),
      'Lenses': lenses,
      'ReviewOwner': reviewOwner,
      'WorkloadName': workloadName,
      if (accountIds != null) 'AccountIds': accountIds,
      if (architecturalDesign != null)
        'ArchitecturalDesign': architecturalDesign,
      if (awsRegions != null) 'AwsRegions': awsRegions,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (industry != null) 'Industry': industry,
      if (industryType != null) 'IndustryType': industryType,
      if (nonAwsRegions != null) 'NonAwsRegions': nonAwsRegions,
      if (notes != null) 'Notes': notes,
      if (pillarPriorities != null) 'PillarPriorities': pillarPriorities,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workloads',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkloadOutput.fromJson(response);
  }

  /// Create a workload share.
  ///
  /// The owner of a workload can share it with other AWS accounts and IAM users
  /// in the same AWS Region. Shared access to a workload is not removed until
  /// the workload invitation is deleted.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/workloads-sharing.html">Sharing
  /// a Workload</a> in the <i>AWS Well-Architected Tool User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<CreateWorkloadShareOutput> createWorkloadShare({
    required PermissionType permissionType,
    required String sharedWith,
    required String workloadId,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(permissionType, 'permissionType');
    ArgumentError.checkNotNull(sharedWith, 'sharedWith');
    _s.validateStringLength(
      'sharedWith',
      sharedWith,
      12,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final $payload = <String, dynamic>{
      'PermissionType': permissionType.toValue(),
      'SharedWith': sharedWith,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workloads/${Uri.encodeComponent(workloadId)}/shares',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkloadShareOutput.fromJson(response);
  }

  /// Delete an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> deleteWorkload({
    required String workloadId,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final $query = <String, List<String>>{
      if (clientRequestToken != null)
        'ClientRequestToken': [clientRequestToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workloads/${Uri.encodeComponent(workloadId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a workload share.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> deleteWorkloadShare({
    required String shareId,
    required String workloadId,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(shareId, 'shareId');
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final $query = <String, List<String>>{
      if (clientRequestToken != null)
        'ClientRequestToken': [clientRequestToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/shares/${Uri.encodeComponent(shareId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociate a lens from a workload.
  /// <note>
  /// The AWS Well-Architected Framework lens (<code>wellarchitected</code>)
  /// cannot be removed from a workload.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> disassociateLenses({
    required List<String> lensAliases,
    required String workloadId,
  }) async {
    ArgumentError.checkNotNull(lensAliases, 'lensAliases');
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final $payload = <String, dynamic>{
      'LensAliases': lensAliases,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/disassociateLenses',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get lens review.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetAnswerOutput> getAnswer({
    required String lensAlias,
    required String questionId,
    required String workloadId,
    int? milestoneNumber,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    _s.validateStringLength(
      'lensAlias',
      lensAlias,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(questionId, 'questionId');
    _s.validateStringLength(
      'questionId',
      questionId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/lensReviews/${Uri.encodeComponent(lensAlias)}/answers/${Uri.encodeComponent(questionId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAnswerOutput.fromJson(response);
  }

  /// Get lens review.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetLensReviewOutput> getLensReview({
    required String lensAlias,
    required String workloadId,
    int? milestoneNumber,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    _s.validateStringLength(
      'lensAlias',
      lensAlias,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/lensReviews/${Uri.encodeComponent(lensAlias)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLensReviewOutput.fromJson(response);
  }

  /// Get lens review report.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetLensReviewReportOutput> getLensReviewReport({
    required String lensAlias,
    required String workloadId,
    int? milestoneNumber,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    _s.validateStringLength(
      'lensAlias',
      lensAlias,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/lensReviews/${Uri.encodeComponent(lensAlias)}/report',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLensReviewReportOutput.fromJson(response);
  }

  /// Get lens version differences.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [baseLensVersion] :
  /// The base version of the lens.
  Future<GetLensVersionDifferenceOutput> getLensVersionDifference({
    required String baseLensVersion,
    required String lensAlias,
  }) async {
    ArgumentError.checkNotNull(baseLensVersion, 'baseLensVersion');
    _s.validateStringLength(
      'baseLensVersion',
      baseLensVersion,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    _s.validateStringLength(
      'lensAlias',
      lensAlias,
      1,
      64,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'BaseLensVersion': [baseLensVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/lenses/${Uri.encodeComponent(lensAlias)}/versionDifference',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLensVersionDifferenceOutput.fromJson(response);
  }

  /// Get a milestone for an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetMilestoneOutput> getMilestone({
    required int milestoneNumber,
    required String workloadId,
  }) async {
    ArgumentError.checkNotNull(milestoneNumber, 'milestoneNumber');
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/milestones/${Uri.encodeComponent(milestoneNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMilestoneOutput.fromJson(response);
  }

  /// Get an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetWorkloadOutput> getWorkload({
    required String workloadId,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workloads/${Uri.encodeComponent(workloadId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkloadOutput.fromJson(response);
  }

  /// List of answers.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  Future<ListAnswersOutput> listAnswers({
    required String lensAlias,
    required String workloadId,
    int? maxResults,
    int? milestoneNumber,
    String? nextToken,
    String? pillarId,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    _s.validateStringLength(
      'lensAlias',
      lensAlias,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    _s.validateStringLength(
      'pillarId',
      pillarId,
      1,
      64,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (pillarId != null) 'PillarId': [pillarId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/lensReviews/${Uri.encodeComponent(lensAlias)}/answers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAnswersOutput.fromJson(response);
  }

  /// List lens review improvements.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  Future<ListLensReviewImprovementsOutput> listLensReviewImprovements({
    required String lensAlias,
    required String workloadId,
    int? maxResults,
    int? milestoneNumber,
    String? nextToken,
    String? pillarId,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    _s.validateStringLength(
      'lensAlias',
      lensAlias,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    _s.validateStringLength(
      'pillarId',
      pillarId,
      1,
      64,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (pillarId != null) 'PillarId': [pillarId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/lensReviews/${Uri.encodeComponent(lensAlias)}/improvements',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLensReviewImprovementsOutput.fromJson(response);
  }

  /// List lens reviews.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<ListLensReviewsOutput> listLensReviews({
    required String workloadId,
    int? maxResults,
    int? milestoneNumber,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateNumRange(
      'milestoneNumber',
      milestoneNumber,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (milestoneNumber != null)
        'MilestoneNumber': [milestoneNumber.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workloads/${Uri.encodeComponent(workloadId)}/lensReviews',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLensReviewsOutput.fromJson(response);
  }

  /// List the available lenses.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<ListLensesOutput> listLenses({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/lenses',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLensesOutput.fromJson(response);
  }

  /// List all milestones for an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<ListMilestonesOutput> listMilestones({
    required String workloadId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/milestonesSummaries',
      exceptionFnMap: _exceptionFns,
    );
    return ListMilestonesOutput.fromJson(response);
  }

  /// List lens notifications.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  Future<ListNotificationsOutput> listNotifications({
    int? maxResults,
    String? nextToken,
    String? workloadId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/notifications',
      exceptionFnMap: _exceptionFns,
    );
    return ListNotificationsOutput.fromJson(response);
  }

  /// List the workload invitations.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  Future<ListShareInvitationsOutput> listShareInvitations({
    int? maxResults,
    String? nextToken,
    String? workloadNamePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'workloadNamePrefix',
      workloadNamePrefix,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (workloadNamePrefix != null)
        'WorkloadNamePrefix': [workloadNamePrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/shareInvitations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListShareInvitationsOutput.fromJson(response);
  }

  /// List the tags for a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String workloadArn,
  }) async {
    ArgumentError.checkNotNull(workloadArn, 'workloadArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(workloadArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// List the workload shares associated with the workload.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  ///
  /// Parameter [sharedWithPrefix] :
  /// The AWS account ID or IAM role with which the workload is shared.
  Future<ListWorkloadSharesOutput> listWorkloadShares({
    required String workloadId,
    int? maxResults,
    String? nextToken,
    String? sharedWithPrefix,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'sharedWithPrefix',
      sharedWithPrefix,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (sharedWithPrefix != null) 'SharedWithPrefix': [sharedWithPrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workloads/${Uri.encodeComponent(workloadId)}/shares',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkloadSharesOutput.fromJson(response);
  }

  /// List workloads. Paginated.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  Future<ListWorkloadsOutput> listWorkloads({
    int? maxResults,
    String? nextToken,
    String? workloadNamePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'workloadNamePrefix',
      workloadNamePrefix,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadNamePrefix != null) 'WorkloadNamePrefix': workloadNamePrefix,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workloadsSummaries',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkloadsOutput.fromJson(response);
  }

  /// Adds one or more tags to the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [tags] :
  /// The tags for the resource.
  Future<void> tagResource({
    required Map<String, String> tags,
    required String workloadArn,
  }) async {
    ArgumentError.checkNotNull(tags, 'tags');
    ArgumentError.checkNotNull(workloadArn, 'workloadArn');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(workloadArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes specified tags from a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required List<String> tagKeys,
    required String workloadArn,
  }) async {
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    ArgumentError.checkNotNull(workloadArn, 'workloadArn');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(workloadArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update the answer to a specific question in a workload review.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<UpdateAnswerOutput> updateAnswer({
    required String lensAlias,
    required String questionId,
    required String workloadId,
    bool? isApplicable,
    String? notes,
    List<String>? selectedChoices,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    _s.validateStringLength(
      'lensAlias',
      lensAlias,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(questionId, 'questionId');
    _s.validateStringLength(
      'questionId',
      questionId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringLength(
      'notes',
      notes,
      0,
      2084,
    );
    final $payload = <String, dynamic>{
      if (isApplicable != null) 'IsApplicable': isApplicable,
      if (notes != null) 'Notes': notes,
      if (selectedChoices != null) 'SelectedChoices': selectedChoices,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/lensReviews/${Uri.encodeComponent(lensAlias)}/answers/${Uri.encodeComponent(questionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAnswerOutput.fromJson(response);
  }

  /// Update lens review.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<UpdateLensReviewOutput> updateLensReview({
    required String lensAlias,
    required String workloadId,
    String? lensNotes,
    Map<String, String>? pillarNotes,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    _s.validateStringLength(
      'lensAlias',
      lensAlias,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringLength(
      'lensNotes',
      lensNotes,
      0,
      2084,
    );
    final $payload = <String, dynamic>{
      if (lensNotes != null) 'LensNotes': lensNotes,
      if (pillarNotes != null) 'PillarNotes': pillarNotes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/lensReviews/${Uri.encodeComponent(lensAlias)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLensReviewOutput.fromJson(response);
  }

  /// Update a workload invitation.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [shareInvitationId] :
  /// The ID assigned to the share invitation.
  Future<UpdateShareInvitationOutput> updateShareInvitation({
    required ShareInvitationAction shareInvitationAction,
    required String shareInvitationId,
  }) async {
    ArgumentError.checkNotNull(shareInvitationAction, 'shareInvitationAction');
    ArgumentError.checkNotNull(shareInvitationId, 'shareInvitationId');
    final $payload = <String, dynamic>{
      'ShareInvitationAction': shareInvitationAction.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/shareInvitations/${Uri.encodeComponent(shareInvitationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateShareInvitationOutput.fromJson(response);
  }

  /// Update an existing workload.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [isReviewOwnerUpdateAcknowledged] :
  /// Flag indicating whether the workload owner has acknowledged that the
  /// <i>Review owner</i> field is required.
  ///
  /// If a <b>Review owner</b> is not added to the workload within 60 days of
  /// acknowledgement, access to the workload is restricted until an owner is
  /// added.
  Future<UpdateWorkloadOutput> updateWorkload({
    required String workloadId,
    List<String>? accountIds,
    String? architecturalDesign,
    List<String>? awsRegions,
    String? description,
    WorkloadEnvironment? environment,
    WorkloadImprovementStatus? improvementStatus,
    String? industry,
    String? industryType,
    bool? isReviewOwnerUpdateAcknowledged,
    List<String>? nonAwsRegions,
    String? notes,
    List<String>? pillarPriorities,
    String? reviewOwner,
    String? workloadName,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringLength(
      'architecturalDesign',
      architecturalDesign,
      0,
      2048,
    );
    _s.validateStringLength(
      'description',
      description,
      3,
      250,
    );
    _s.validateStringLength(
      'industry',
      industry,
      0,
      100,
    );
    _s.validateStringLength(
      'industryType',
      industryType,
      0,
      100,
    );
    _s.validateStringLength(
      'notes',
      notes,
      0,
      2084,
    );
    _s.validateStringLength(
      'reviewOwner',
      reviewOwner,
      3,
      255,
    );
    _s.validateStringLength(
      'workloadName',
      workloadName,
      3,
      100,
    );
    final $payload = <String, dynamic>{
      if (accountIds != null) 'AccountIds': accountIds,
      if (architecturalDesign != null)
        'ArchitecturalDesign': architecturalDesign,
      if (awsRegions != null) 'AwsRegions': awsRegions,
      if (description != null) 'Description': description,
      if (environment != null) 'Environment': environment.toValue(),
      if (improvementStatus != null)
        'ImprovementStatus': improvementStatus.toValue(),
      if (industry != null) 'Industry': industry,
      if (industryType != null) 'IndustryType': industryType,
      if (isReviewOwnerUpdateAcknowledged != null)
        'IsReviewOwnerUpdateAcknowledged': isReviewOwnerUpdateAcknowledged,
      if (nonAwsRegions != null) 'NonAwsRegions': nonAwsRegions,
      if (notes != null) 'Notes': notes,
      if (pillarPriorities != null) 'PillarPriorities': pillarPriorities,
      if (reviewOwner != null) 'ReviewOwner': reviewOwner,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/workloads/${Uri.encodeComponent(workloadId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkloadOutput.fromJson(response);
  }

  /// Update a workload share.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<UpdateWorkloadShareOutput> updateWorkloadShare({
    required PermissionType permissionType,
    required String shareId,
    required String workloadId,
  }) async {
    ArgumentError.checkNotNull(permissionType, 'permissionType');
    ArgumentError.checkNotNull(shareId, 'shareId');
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final $payload = <String, dynamic>{
      'PermissionType': permissionType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/shares/${Uri.encodeComponent(shareId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkloadShareOutput.fromJson(response);
  }

  /// Upgrade lens review.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> upgradeLensReview({
    required String lensAlias,
    required String milestoneName,
    required String workloadId,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    _s.validateStringLength(
      'lensAlias',
      lensAlias,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(milestoneName, 'milestoneName');
    _s.validateStringLength(
      'milestoneName',
      milestoneName,
      3,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final $payload = <String, dynamic>{
      'MilestoneName': milestoneName,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workloads/${Uri.encodeComponent(workloadId)}/lensReviews/${Uri.encodeComponent(lensAlias)}/upgrade',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// An answer of the question.
class Answer {
  final List<Choice>? choices;
  final String? helpfulResourceUrl;
  final String? improvementPlanUrl;
  final bool? isApplicable;
  final String? notes;
  final String? pillarId;
  final String? questionDescription;
  final String? questionId;
  final String? questionTitle;
  final Risk? risk;
  final List<String>? selectedChoices;

  Answer({
    this.choices,
    this.helpfulResourceUrl,
    this.improvementPlanUrl,
    this.isApplicable,
    this.notes,
    this.pillarId,
    this.questionDescription,
    this.questionId,
    this.questionTitle,
    this.risk,
    this.selectedChoices,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      choices: (json['Choices'] as List?)
          ?.whereNotNull()
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      helpfulResourceUrl: json['HelpfulResourceUrl'] as String?,
      improvementPlanUrl: json['ImprovementPlanUrl'] as String?,
      isApplicable: json['IsApplicable'] as bool?,
      notes: json['Notes'] as String?,
      pillarId: json['PillarId'] as String?,
      questionDescription: json['QuestionDescription'] as String?,
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
      risk: (json['Risk'] as String?)?.toRisk(),
      selectedChoices: (json['SelectedChoices'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final choices = this.choices;
    final helpfulResourceUrl = this.helpfulResourceUrl;
    final improvementPlanUrl = this.improvementPlanUrl;
    final isApplicable = this.isApplicable;
    final notes = this.notes;
    final pillarId = this.pillarId;
    final questionDescription = this.questionDescription;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    final risk = this.risk;
    final selectedChoices = this.selectedChoices;
    return {
      if (choices != null) 'Choices': choices,
      if (helpfulResourceUrl != null) 'HelpfulResourceUrl': helpfulResourceUrl,
      if (improvementPlanUrl != null) 'ImprovementPlanUrl': improvementPlanUrl,
      if (isApplicable != null) 'IsApplicable': isApplicable,
      if (notes != null) 'Notes': notes,
      if (pillarId != null) 'PillarId': pillarId,
      if (questionDescription != null)
        'QuestionDescription': questionDescription,
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
      if (risk != null) 'Risk': risk.toValue(),
      if (selectedChoices != null) 'SelectedChoices': selectedChoices,
    };
  }
}

/// An answer summary of a lens review in a workload.
class AnswerSummary {
  final List<Choice>? choices;
  final bool? isApplicable;
  final String? pillarId;
  final String? questionId;
  final String? questionTitle;
  final Risk? risk;
  final List<String>? selectedChoices;

  AnswerSummary({
    this.choices,
    this.isApplicable,
    this.pillarId,
    this.questionId,
    this.questionTitle,
    this.risk,
    this.selectedChoices,
  });

  factory AnswerSummary.fromJson(Map<String, dynamic> json) {
    return AnswerSummary(
      choices: (json['Choices'] as List?)
          ?.whereNotNull()
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      isApplicable: json['IsApplicable'] as bool?,
      pillarId: json['PillarId'] as String?,
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
      risk: (json['Risk'] as String?)?.toRisk(),
      selectedChoices: (json['SelectedChoices'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final choices = this.choices;
    final isApplicable = this.isApplicable;
    final pillarId = this.pillarId;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    final risk = this.risk;
    final selectedChoices = this.selectedChoices;
    return {
      if (choices != null) 'Choices': choices,
      if (isApplicable != null) 'IsApplicable': isApplicable,
      if (pillarId != null) 'PillarId': pillarId,
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
      if (risk != null) 'Risk': risk.toValue(),
      if (selectedChoices != null) 'SelectedChoices': selectedChoices,
    };
  }
}

/// A choice available to answer question.
class Choice {
  final String? choiceId;
  final String? description;
  final String? title;

  Choice({
    this.choiceId,
    this.description,
    this.title,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      choiceId: json['ChoiceId'] as String?,
      description: json['Description'] as String?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final choiceId = this.choiceId;
    final description = this.description;
    final title = this.title;
    return {
      if (choiceId != null) 'ChoiceId': choiceId,
      if (description != null) 'Description': description,
      if (title != null) 'Title': title,
    };
  }
}

/// Output of a create milestone call.
class CreateMilestoneOutput {
  final int? milestoneNumber;
  final String? workloadId;

  CreateMilestoneOutput({
    this.milestoneNumber,
    this.workloadId,
  });

  factory CreateMilestoneOutput.fromJson(Map<String, dynamic> json) {
    return CreateMilestoneOutput(
      milestoneNumber: json['MilestoneNumber'] as int?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final milestoneNumber = this.milestoneNumber;
    final workloadId = this.workloadId;
    return {
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a create workload call.
class CreateWorkloadOutput {
  final String? workloadArn;
  final String? workloadId;

  CreateWorkloadOutput({
    this.workloadArn,
    this.workloadId,
  });

  factory CreateWorkloadOutput.fromJson(Map<String, dynamic> json) {
    return CreateWorkloadOutput(
      workloadArn: json['WorkloadArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workloadArn = this.workloadArn;
    final workloadId = this.workloadId;
    return {
      if (workloadArn != null) 'WorkloadArn': workloadArn,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Input for Create Workload Share
class CreateWorkloadShareOutput {
  final String? shareId;
  final String? workloadId;

  CreateWorkloadShareOutput({
    this.shareId,
    this.workloadId,
  });

  factory CreateWorkloadShareOutput.fromJson(Map<String, dynamic> json) {
    return CreateWorkloadShareOutput(
      shareId: json['ShareId'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shareId = this.shareId;
    final workloadId = this.workloadId;
    return {
      if (shareId != null) 'ShareId': shareId,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

enum DifferenceStatus {
  updated,
  $new,
  deleted,
}

extension on DifferenceStatus {
  String toValue() {
    switch (this) {
      case DifferenceStatus.updated:
        return 'UPDATED';
      case DifferenceStatus.$new:
        return 'NEW';
      case DifferenceStatus.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  DifferenceStatus toDifferenceStatus() {
    switch (this) {
      case 'UPDATED':
        return DifferenceStatus.updated;
      case 'NEW':
        return DifferenceStatus.$new;
      case 'DELETED':
        return DifferenceStatus.deleted;
    }
    throw Exception('$this is not known in enum DifferenceStatus');
  }
}

/// Output of a get answer call.
class GetAnswerOutput {
  final Answer? answer;
  final String? lensAlias;
  final int? milestoneNumber;
  final String? workloadId;

  GetAnswerOutput({
    this.answer,
    this.lensAlias,
    this.milestoneNumber,
    this.workloadId,
  });

  factory GetAnswerOutput.fromJson(Map<String, dynamic> json) {
    return GetAnswerOutput(
      answer: json['Answer'] != null
          ? Answer.fromJson(json['Answer'] as Map<String, dynamic>)
          : null,
      lensAlias: json['LensAlias'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answer = this.answer;
    final lensAlias = this.lensAlias;
    final milestoneNumber = this.milestoneNumber;
    final workloadId = this.workloadId;
    return {
      if (answer != null) 'Answer': answer,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a get lens review call.
class GetLensReviewOutput {
  final LensReview? lensReview;
  final int? milestoneNumber;
  final String? workloadId;

  GetLensReviewOutput({
    this.lensReview,
    this.milestoneNumber,
    this.workloadId,
  });

  factory GetLensReviewOutput.fromJson(Map<String, dynamic> json) {
    return GetLensReviewOutput(
      lensReview: json['LensReview'] != null
          ? LensReview.fromJson(json['LensReview'] as Map<String, dynamic>)
          : null,
      milestoneNumber: json['MilestoneNumber'] as int?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensReview = this.lensReview;
    final milestoneNumber = this.milestoneNumber;
    final workloadId = this.workloadId;
    return {
      if (lensReview != null) 'LensReview': lensReview,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a get lens review report call.
class GetLensReviewReportOutput {
  final LensReviewReport? lensReviewReport;
  final int? milestoneNumber;
  final String? workloadId;

  GetLensReviewReportOutput({
    this.lensReviewReport,
    this.milestoneNumber,
    this.workloadId,
  });

  factory GetLensReviewReportOutput.fromJson(Map<String, dynamic> json) {
    return GetLensReviewReportOutput(
      lensReviewReport: json['LensReviewReport'] != null
          ? LensReviewReport.fromJson(
              json['LensReviewReport'] as Map<String, dynamic>)
          : null,
      milestoneNumber: json['MilestoneNumber'] as int?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensReviewReport = this.lensReviewReport;
    final milestoneNumber = this.milestoneNumber;
    final workloadId = this.workloadId;
    return {
      if (lensReviewReport != null) 'LensReviewReport': lensReviewReport,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

class GetLensVersionDifferenceOutput {
  /// The base version of the lens.
  final String? baseLensVersion;

  /// The latest version of the lens.
  final String? latestLensVersion;
  final String? lensAlias;
  final VersionDifferences? versionDifferences;

  GetLensVersionDifferenceOutput({
    this.baseLensVersion,
    this.latestLensVersion,
    this.lensAlias,
    this.versionDifferences,
  });

  factory GetLensVersionDifferenceOutput.fromJson(Map<String, dynamic> json) {
    return GetLensVersionDifferenceOutput(
      baseLensVersion: json['BaseLensVersion'] as String?,
      latestLensVersion: json['LatestLensVersion'] as String?,
      lensAlias: json['LensAlias'] as String?,
      versionDifferences: json['VersionDifferences'] != null
          ? VersionDifferences.fromJson(
              json['VersionDifferences'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final baseLensVersion = this.baseLensVersion;
    final latestLensVersion = this.latestLensVersion;
    final lensAlias = this.lensAlias;
    final versionDifferences = this.versionDifferences;
    return {
      if (baseLensVersion != null) 'BaseLensVersion': baseLensVersion,
      if (latestLensVersion != null) 'LatestLensVersion': latestLensVersion,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (versionDifferences != null) 'VersionDifferences': versionDifferences,
    };
  }
}

/// Output of a get milestone call.
class GetMilestoneOutput {
  final Milestone? milestone;
  final String? workloadId;

  GetMilestoneOutput({
    this.milestone,
    this.workloadId,
  });

  factory GetMilestoneOutput.fromJson(Map<String, dynamic> json) {
    return GetMilestoneOutput(
      milestone: json['Milestone'] != null
          ? Milestone.fromJson(json['Milestone'] as Map<String, dynamic>)
          : null,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final milestone = this.milestone;
    final workloadId = this.workloadId;
    return {
      if (milestone != null) 'Milestone': milestone,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a get workload call.
class GetWorkloadOutput {
  final Workload? workload;

  GetWorkloadOutput({
    this.workload,
  });

  factory GetWorkloadOutput.fromJson(Map<String, dynamic> json) {
    return GetWorkloadOutput(
      workload: json['Workload'] != null
          ? Workload.fromJson(json['Workload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workload = this.workload;
    return {
      if (workload != null) 'Workload': workload,
    };
  }
}

/// An improvement summary of a lens review in a workload.
class ImprovementSummary {
  final String? improvementPlanUrl;
  final String? pillarId;
  final String? questionId;
  final String? questionTitle;
  final Risk? risk;

  ImprovementSummary({
    this.improvementPlanUrl,
    this.pillarId,
    this.questionId,
    this.questionTitle,
    this.risk,
  });

  factory ImprovementSummary.fromJson(Map<String, dynamic> json) {
    return ImprovementSummary(
      improvementPlanUrl: json['ImprovementPlanUrl'] as String?,
      pillarId: json['PillarId'] as String?,
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
      risk: (json['Risk'] as String?)?.toRisk(),
    );
  }

  Map<String, dynamic> toJson() {
    final improvementPlanUrl = this.improvementPlanUrl;
    final pillarId = this.pillarId;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    final risk = this.risk;
    return {
      if (improvementPlanUrl != null) 'ImprovementPlanUrl': improvementPlanUrl,
      if (pillarId != null) 'PillarId': pillarId,
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
      if (risk != null) 'Risk': risk.toValue(),
    };
  }
}

/// A lens review of a question.
class LensReview {
  final String? lensAlias;
  final String? lensName;

  /// The status of the lens.
  final LensStatus? lensStatus;

  /// The version of the lens.
  final String? lensVersion;
  final String? nextToken;
  final String? notes;
  final List<PillarReviewSummary>? pillarReviewSummaries;
  final Map<Risk, int>? riskCounts;
  final DateTime? updatedAt;

  LensReview({
    this.lensAlias,
    this.lensName,
    this.lensStatus,
    this.lensVersion,
    this.nextToken,
    this.notes,
    this.pillarReviewSummaries,
    this.riskCounts,
    this.updatedAt,
  });

  factory LensReview.fromJson(Map<String, dynamic> json) {
    return LensReview(
      lensAlias: json['LensAlias'] as String?,
      lensName: json['LensName'] as String?,
      lensStatus: (json['LensStatus'] as String?)?.toLensStatus(),
      lensVersion: json['LensVersion'] as String?,
      nextToken: json['NextToken'] as String?,
      notes: json['Notes'] as String?,
      pillarReviewSummaries: (json['PillarReviewSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => PillarReviewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final lensAlias = this.lensAlias;
    final lensName = this.lensName;
    final lensStatus = this.lensStatus;
    final lensVersion = this.lensVersion;
    final nextToken = this.nextToken;
    final notes = this.notes;
    final pillarReviewSummaries = this.pillarReviewSummaries;
    final riskCounts = this.riskCounts;
    final updatedAt = this.updatedAt;
    return {
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensName != null) 'LensName': lensName,
      if (lensStatus != null) 'LensStatus': lensStatus.toValue(),
      if (lensVersion != null) 'LensVersion': lensVersion,
      if (nextToken != null) 'NextToken': nextToken,
      if (notes != null) 'Notes': notes,
      if (pillarReviewSummaries != null)
        'PillarReviewSummaries': pillarReviewSummaries,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// A report of a lens review.
class LensReviewReport {
  final String? base64String;
  final String? lensAlias;

  LensReviewReport({
    this.base64String,
    this.lensAlias,
  });

  factory LensReviewReport.fromJson(Map<String, dynamic> json) {
    return LensReviewReport(
      base64String: json['Base64String'] as String?,
      lensAlias: json['LensAlias'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final base64String = this.base64String;
    final lensAlias = this.lensAlias;
    return {
      if (base64String != null) 'Base64String': base64String,
      if (lensAlias != null) 'LensAlias': lensAlias,
    };
  }
}

/// A lens review summary of a workload.
class LensReviewSummary {
  final String? lensAlias;
  final String? lensName;

  /// The status of the lens.
  final LensStatus? lensStatus;

  /// The version of the lens.
  final String? lensVersion;
  final Map<Risk, int>? riskCounts;
  final DateTime? updatedAt;

  LensReviewSummary({
    this.lensAlias,
    this.lensName,
    this.lensStatus,
    this.lensVersion,
    this.riskCounts,
    this.updatedAt,
  });

  factory LensReviewSummary.fromJson(Map<String, dynamic> json) {
    return LensReviewSummary(
      lensAlias: json['LensAlias'] as String?,
      lensName: json['LensName'] as String?,
      lensStatus: (json['LensStatus'] as String?)?.toLensStatus(),
      lensVersion: json['LensVersion'] as String?,
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final lensAlias = this.lensAlias;
    final lensName = this.lensName;
    final lensStatus = this.lensStatus;
    final lensVersion = this.lensVersion;
    final riskCounts = this.riskCounts;
    final updatedAt = this.updatedAt;
    return {
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensName != null) 'LensName': lensName,
      if (lensStatus != null) 'LensStatus': lensStatus.toValue(),
      if (lensVersion != null) 'LensVersion': lensVersion,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum LensStatus {
  current,
  notCurrent,
  deprecated,
}

extension on LensStatus {
  String toValue() {
    switch (this) {
      case LensStatus.current:
        return 'CURRENT';
      case LensStatus.notCurrent:
        return 'NOT_CURRENT';
      case LensStatus.deprecated:
        return 'DEPRECATED';
    }
  }
}

extension on String {
  LensStatus toLensStatus() {
    switch (this) {
      case 'CURRENT':
        return LensStatus.current;
      case 'NOT_CURRENT':
        return LensStatus.notCurrent;
      case 'DEPRECATED':
        return LensStatus.deprecated;
    }
    throw Exception('$this is not known in enum LensStatus');
  }
}

/// A lens summary of a lens.
class LensSummary {
  final String? description;
  final String? lensAlias;
  final String? lensName;

  /// The version of the lens.
  final String? lensVersion;

  LensSummary({
    this.description,
    this.lensAlias,
    this.lensName,
    this.lensVersion,
  });

  factory LensSummary.fromJson(Map<String, dynamic> json) {
    return LensSummary(
      description: json['Description'] as String?,
      lensAlias: json['LensAlias'] as String?,
      lensName: json['LensName'] as String?,
      lensVersion: json['LensVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final lensAlias = this.lensAlias;
    final lensName = this.lensName;
    final lensVersion = this.lensVersion;
    return {
      if (description != null) 'Description': description,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensName != null) 'LensName': lensName,
      if (lensVersion != null) 'LensVersion': lensVersion,
    };
  }
}

/// Lens upgrade summary return object.
class LensUpgradeSummary {
  /// The current version of the lens.
  final String? currentLensVersion;

  /// The latest version of the lens.
  final String? latestLensVersion;
  final String? lensAlias;
  final String? workloadId;
  final String? workloadName;

  LensUpgradeSummary({
    this.currentLensVersion,
    this.latestLensVersion,
    this.lensAlias,
    this.workloadId,
    this.workloadName,
  });

  factory LensUpgradeSummary.fromJson(Map<String, dynamic> json) {
    return LensUpgradeSummary(
      currentLensVersion: json['CurrentLensVersion'] as String?,
      latestLensVersion: json['LatestLensVersion'] as String?,
      lensAlias: json['LensAlias'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentLensVersion = this.currentLensVersion;
    final latestLensVersion = this.latestLensVersion;
    final lensAlias = this.lensAlias;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (currentLensVersion != null) 'CurrentLensVersion': currentLensVersion,
      if (latestLensVersion != null) 'LatestLensVersion': latestLensVersion,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

/// Output of a list answers call.
class ListAnswersOutput {
  final List<AnswerSummary>? answerSummaries;
  final String? lensAlias;
  final int? milestoneNumber;
  final String? nextToken;
  final String? workloadId;

  ListAnswersOutput({
    this.answerSummaries,
    this.lensAlias,
    this.milestoneNumber,
    this.nextToken,
    this.workloadId,
  });

  factory ListAnswersOutput.fromJson(Map<String, dynamic> json) {
    return ListAnswersOutput(
      answerSummaries: (json['AnswerSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => AnswerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lensAlias: json['LensAlias'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answerSummaries = this.answerSummaries;
    final lensAlias = this.lensAlias;
    final milestoneNumber = this.milestoneNumber;
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    return {
      if (answerSummaries != null) 'AnswerSummaries': answerSummaries,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a list lens review improvements call.
class ListLensReviewImprovementsOutput {
  final List<ImprovementSummary>? improvementSummaries;
  final String? lensAlias;
  final int? milestoneNumber;
  final String? nextToken;
  final String? workloadId;

  ListLensReviewImprovementsOutput({
    this.improvementSummaries,
    this.lensAlias,
    this.milestoneNumber,
    this.nextToken,
    this.workloadId,
  });

  factory ListLensReviewImprovementsOutput.fromJson(Map<String, dynamic> json) {
    return ListLensReviewImprovementsOutput(
      improvementSummaries: (json['ImprovementSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ImprovementSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lensAlias: json['LensAlias'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final improvementSummaries = this.improvementSummaries;
    final lensAlias = this.lensAlias;
    final milestoneNumber = this.milestoneNumber;
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    return {
      if (improvementSummaries != null)
        'ImprovementSummaries': improvementSummaries,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a list lens reviews call.
class ListLensReviewsOutput {
  final List<LensReviewSummary>? lensReviewSummaries;
  final int? milestoneNumber;
  final String? nextToken;
  final String? workloadId;

  ListLensReviewsOutput({
    this.lensReviewSummaries,
    this.milestoneNumber,
    this.nextToken,
    this.workloadId,
  });

  factory ListLensReviewsOutput.fromJson(Map<String, dynamic> json) {
    return ListLensReviewsOutput(
      lensReviewSummaries: (json['LensReviewSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => LensReviewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      milestoneNumber: json['MilestoneNumber'] as int?,
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensReviewSummaries = this.lensReviewSummaries;
    final milestoneNumber = this.milestoneNumber;
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    return {
      if (lensReviewSummaries != null)
        'LensReviewSummaries': lensReviewSummaries,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a list lenses call.
class ListLensesOutput {
  final List<LensSummary>? lensSummaries;
  final String? nextToken;

  ListLensesOutput({
    this.lensSummaries,
    this.nextToken,
  });

  factory ListLensesOutput.fromJson(Map<String, dynamic> json) {
    return ListLensesOutput(
      lensSummaries: (json['LensSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => LensSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensSummaries = this.lensSummaries;
    final nextToken = this.nextToken;
    return {
      if (lensSummaries != null) 'LensSummaries': lensSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Output of a list milestones call.
class ListMilestonesOutput {
  final List<MilestoneSummary>? milestoneSummaries;
  final String? nextToken;
  final String? workloadId;

  ListMilestonesOutput({
    this.milestoneSummaries,
    this.nextToken,
    this.workloadId,
  });

  factory ListMilestonesOutput.fromJson(Map<String, dynamic> json) {
    return ListMilestonesOutput(
      milestoneSummaries: (json['MilestoneSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => MilestoneSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final milestoneSummaries = this.milestoneSummaries;
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    return {
      if (milestoneSummaries != null) 'MilestoneSummaries': milestoneSummaries,
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

class ListNotificationsOutput {
  final String? nextToken;

  /// List of lens notification summaries in a workload.
  final List<NotificationSummary>? notificationSummaries;

  ListNotificationsOutput({
    this.nextToken,
    this.notificationSummaries,
  });

  factory ListNotificationsOutput.fromJson(Map<String, dynamic> json) {
    return ListNotificationsOutput(
      nextToken: json['NextToken'] as String?,
      notificationSummaries: (json['NotificationSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => NotificationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notificationSummaries = this.notificationSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (notificationSummaries != null)
        'NotificationSummaries': notificationSummaries,
    };
  }
}

/// Input for List Share Invitations
class ListShareInvitationsOutput {
  final String? nextToken;

  /// List of share invitation summaries in a workload.
  final List<ShareInvitationSummary>? shareInvitationSummaries;

  ListShareInvitationsOutput({
    this.nextToken,
    this.shareInvitationSummaries,
  });

  factory ListShareInvitationsOutput.fromJson(Map<String, dynamic> json) {
    return ListShareInvitationsOutput(
      nextToken: json['NextToken'] as String?,
      shareInvitationSummaries: (json['ShareInvitationSummaries'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ShareInvitationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final shareInvitationSummaries = this.shareInvitationSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (shareInvitationSummaries != null)
        'ShareInvitationSummaries': shareInvitationSummaries,
    };
  }
}

class ListTagsForResourceOutput {
  /// The tags for the resource.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Input for List Workload Share
class ListWorkloadSharesOutput {
  final String? nextToken;
  final String? workloadId;
  final List<WorkloadShareSummary>? workloadShareSummaries;

  ListWorkloadSharesOutput({
    this.nextToken,
    this.workloadId,
    this.workloadShareSummaries,
  });

  factory ListWorkloadSharesOutput.fromJson(Map<String, dynamic> json) {
    return ListWorkloadSharesOutput(
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadShareSummaries: (json['WorkloadShareSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => WorkloadShareSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    final workloadShareSummaries = this.workloadShareSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadShareSummaries != null)
        'WorkloadShareSummaries': workloadShareSummaries,
    };
  }
}

/// Output of a list workloads call.
class ListWorkloadsOutput {
  final String? nextToken;
  final List<WorkloadSummary>? workloadSummaries;

  ListWorkloadsOutput({
    this.nextToken,
    this.workloadSummaries,
  });

  factory ListWorkloadsOutput.fromJson(Map<String, dynamic> json) {
    return ListWorkloadsOutput(
      nextToken: json['NextToken'] as String?,
      workloadSummaries: (json['WorkloadSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => WorkloadSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workloadSummaries = this.workloadSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (workloadSummaries != null) 'WorkloadSummaries': workloadSummaries,
    };
  }
}

/// A milestone return object.
class Milestone {
  final String? milestoneName;
  final int? milestoneNumber;
  final DateTime? recordedAt;
  final Workload? workload;

  Milestone({
    this.milestoneName,
    this.milestoneNumber,
    this.recordedAt,
    this.workload,
  });

  factory Milestone.fromJson(Map<String, dynamic> json) {
    return Milestone(
      milestoneName: json['MilestoneName'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      recordedAt: timeStampFromJson(json['RecordedAt']),
      workload: json['Workload'] != null
          ? Workload.fromJson(json['Workload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final milestoneName = this.milestoneName;
    final milestoneNumber = this.milestoneNumber;
    final recordedAt = this.recordedAt;
    final workload = this.workload;
    return {
      if (milestoneName != null) 'MilestoneName': milestoneName,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (recordedAt != null) 'RecordedAt': unixTimestampToJson(recordedAt),
      if (workload != null) 'Workload': workload,
    };
  }
}

/// A milestone summary return object.
class MilestoneSummary {
  final String? milestoneName;
  final int? milestoneNumber;
  final DateTime? recordedAt;
  final WorkloadSummary? workloadSummary;

  MilestoneSummary({
    this.milestoneName,
    this.milestoneNumber,
    this.recordedAt,
    this.workloadSummary,
  });

  factory MilestoneSummary.fromJson(Map<String, dynamic> json) {
    return MilestoneSummary(
      milestoneName: json['MilestoneName'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      recordedAt: timeStampFromJson(json['RecordedAt']),
      workloadSummary: json['WorkloadSummary'] != null
          ? WorkloadSummary.fromJson(
              json['WorkloadSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final milestoneName = this.milestoneName;
    final milestoneNumber = this.milestoneNumber;
    final recordedAt = this.recordedAt;
    final workloadSummary = this.workloadSummary;
    return {
      if (milestoneName != null) 'MilestoneName': milestoneName,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (recordedAt != null) 'RecordedAt': unixTimestampToJson(recordedAt),
      if (workloadSummary != null) 'WorkloadSummary': workloadSummary,
    };
  }
}

/// A notification summary return object.
class NotificationSummary {
  /// Summary of lens upgrade.
  final LensUpgradeSummary? lensUpgradeSummary;

  /// The type of notification.
  final NotificationType? type;

  NotificationSummary({
    this.lensUpgradeSummary,
    this.type,
  });

  factory NotificationSummary.fromJson(Map<String, dynamic> json) {
    return NotificationSummary(
      lensUpgradeSummary: json['LensUpgradeSummary'] != null
          ? LensUpgradeSummary.fromJson(
              json['LensUpgradeSummary'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toNotificationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final lensUpgradeSummary = this.lensUpgradeSummary;
    final type = this.type;
    return {
      if (lensUpgradeSummary != null) 'LensUpgradeSummary': lensUpgradeSummary,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum NotificationType {
  lensVersionUpgraded,
  lensVersionDeprecated,
}

extension on NotificationType {
  String toValue() {
    switch (this) {
      case NotificationType.lensVersionUpgraded:
        return 'LENS_VERSION_UPGRADED';
      case NotificationType.lensVersionDeprecated:
        return 'LENS_VERSION_DEPRECATED';
    }
  }
}

extension on String {
  NotificationType toNotificationType() {
    switch (this) {
      case 'LENS_VERSION_UPGRADED':
        return NotificationType.lensVersionUpgraded;
      case 'LENS_VERSION_DEPRECATED':
        return NotificationType.lensVersionDeprecated;
    }
    throw Exception('$this is not known in enum NotificationType');
  }
}

/// Permission granted on a workload share.
enum PermissionType {
  readonly,
  contributor,
}

extension on PermissionType {
  String toValue() {
    switch (this) {
      case PermissionType.readonly:
        return 'READONLY';
      case PermissionType.contributor:
        return 'CONTRIBUTOR';
    }
  }
}

extension on String {
  PermissionType toPermissionType() {
    switch (this) {
      case 'READONLY':
        return PermissionType.readonly;
      case 'CONTRIBUTOR':
        return PermissionType.contributor;
    }
    throw Exception('$this is not known in enum PermissionType');
  }
}

/// A pillar difference return object.
class PillarDifference {
  /// Indicates the type of change to the pillar.
  final DifferenceStatus? differenceStatus;
  final String? pillarId;

  /// List of question differences.
  final List<QuestionDifference>? questionDifferences;

  PillarDifference({
    this.differenceStatus,
    this.pillarId,
    this.questionDifferences,
  });

  factory PillarDifference.fromJson(Map<String, dynamic> json) {
    return PillarDifference(
      differenceStatus:
          (json['DifferenceStatus'] as String?)?.toDifferenceStatus(),
      pillarId: json['PillarId'] as String?,
      questionDifferences: (json['QuestionDifferences'] as List?)
          ?.whereNotNull()
          .map((e) => QuestionDifference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final differenceStatus = this.differenceStatus;
    final pillarId = this.pillarId;
    final questionDifferences = this.questionDifferences;
    return {
      if (differenceStatus != null)
        'DifferenceStatus': differenceStatus.toValue(),
      if (pillarId != null) 'PillarId': pillarId,
      if (questionDifferences != null)
        'QuestionDifferences': questionDifferences,
    };
  }
}

/// A pillar review summary of a lens review.
class PillarReviewSummary {
  final String? notes;
  final String? pillarId;
  final String? pillarName;
  final Map<Risk, int>? riskCounts;

  PillarReviewSummary({
    this.notes,
    this.pillarId,
    this.pillarName,
    this.riskCounts,
  });

  factory PillarReviewSummary.fromJson(Map<String, dynamic> json) {
    return PillarReviewSummary(
      notes: json['Notes'] as String?,
      pillarId: json['PillarId'] as String?,
      pillarName: json['PillarName'] as String?,
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final notes = this.notes;
    final pillarId = this.pillarId;
    final pillarName = this.pillarName;
    final riskCounts = this.riskCounts;
    return {
      if (notes != null) 'Notes': notes,
      if (pillarId != null) 'PillarId': pillarId,
      if (pillarName != null) 'PillarName': pillarName,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// A question difference return object.
class QuestionDifference {
  /// Indicates the type of change to the question.
  final DifferenceStatus? differenceStatus;
  final String? questionId;
  final String? questionTitle;

  QuestionDifference({
    this.differenceStatus,
    this.questionId,
    this.questionTitle,
  });

  factory QuestionDifference.fromJson(Map<String, dynamic> json) {
    return QuestionDifference(
      differenceStatus:
          (json['DifferenceStatus'] as String?)?.toDifferenceStatus(),
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final differenceStatus = this.differenceStatus;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    return {
      if (differenceStatus != null)
        'DifferenceStatus': differenceStatus.toValue(),
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
    };
  }
}

/// The risk for a given workload, lens review, pillar, or question.
enum Risk {
  unanswered,
  high,
  medium,
  none,
  notApplicable,
}

extension on Risk {
  String toValue() {
    switch (this) {
      case Risk.unanswered:
        return 'UNANSWERED';
      case Risk.high:
        return 'HIGH';
      case Risk.medium:
        return 'MEDIUM';
      case Risk.none:
        return 'NONE';
      case Risk.notApplicable:
        return 'NOT_APPLICABLE';
    }
  }
}

extension on String {
  Risk toRisk() {
    switch (this) {
      case 'UNANSWERED':
        return Risk.unanswered;
      case 'HIGH':
        return Risk.high;
      case 'MEDIUM':
        return Risk.medium;
      case 'NONE':
        return Risk.none;
      case 'NOT_APPLICABLE':
        return Risk.notApplicable;
    }
    throw Exception('$this is not known in enum Risk');
  }
}

/// The share invitation.
class ShareInvitation {
  /// The ID assigned to the share invitation.
  final String? shareInvitationId;
  final String? workloadId;

  ShareInvitation({
    this.shareInvitationId,
    this.workloadId,
  });

  factory ShareInvitation.fromJson(Map<String, dynamic> json) {
    return ShareInvitation(
      shareInvitationId: json['ShareInvitationId'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shareInvitationId = this.shareInvitationId;
    final workloadId = this.workloadId;
    return {
      if (shareInvitationId != null) 'ShareInvitationId': shareInvitationId,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Share invitation action taken by contributor.
enum ShareInvitationAction {
  accept,
  reject,
}

extension on ShareInvitationAction {
  String toValue() {
    switch (this) {
      case ShareInvitationAction.accept:
        return 'ACCEPT';
      case ShareInvitationAction.reject:
        return 'REJECT';
    }
  }
}

extension on String {
  ShareInvitationAction toShareInvitationAction() {
    switch (this) {
      case 'ACCEPT':
        return ShareInvitationAction.accept;
      case 'REJECT':
        return ShareInvitationAction.reject;
    }
    throw Exception('$this is not known in enum ShareInvitationAction');
  }
}

/// A share invitation summary return object.
class ShareInvitationSummary {
  final PermissionType? permissionType;

  /// The ID assigned to the share invitation.
  final String? shareInvitationId;
  final String? sharedBy;
  final String? sharedWith;
  final String? workloadId;
  final String? workloadName;

  ShareInvitationSummary({
    this.permissionType,
    this.shareInvitationId,
    this.sharedBy,
    this.sharedWith,
    this.workloadId,
    this.workloadName,
  });

  factory ShareInvitationSummary.fromJson(Map<String, dynamic> json) {
    return ShareInvitationSummary(
      permissionType: (json['PermissionType'] as String?)?.toPermissionType(),
      shareInvitationId: json['ShareInvitationId'] as String?,
      sharedBy: json['SharedBy'] as String?,
      sharedWith: json['SharedWith'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionType = this.permissionType;
    final shareInvitationId = this.shareInvitationId;
    final sharedBy = this.sharedBy;
    final sharedWith = this.sharedWith;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (permissionType != null) 'PermissionType': permissionType.toValue(),
      if (shareInvitationId != null) 'ShareInvitationId': shareInvitationId,
      if (sharedBy != null) 'SharedBy': sharedBy,
      if (sharedWith != null) 'SharedWith': sharedWith,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

/// The status of a workload share.
enum ShareStatus {
  accepted,
  rejected,
  pending,
  revoked,
  expired,
}

extension on ShareStatus {
  String toValue() {
    switch (this) {
      case ShareStatus.accepted:
        return 'ACCEPTED';
      case ShareStatus.rejected:
        return 'REJECTED';
      case ShareStatus.pending:
        return 'PENDING';
      case ShareStatus.revoked:
        return 'REVOKED';
      case ShareStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension on String {
  ShareStatus toShareStatus() {
    switch (this) {
      case 'ACCEPTED':
        return ShareStatus.accepted;
      case 'REJECTED':
        return ShareStatus.rejected;
      case 'PENDING':
        return ShareStatus.pending;
      case 'REVOKED':
        return ShareStatus.revoked;
      case 'EXPIRED':
        return ShareStatus.expired;
    }
    throw Exception('$this is not known in enum ShareStatus');
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Output of a update answer call.
class UpdateAnswerOutput {
  final Answer? answer;
  final String? lensAlias;
  final String? workloadId;

  UpdateAnswerOutput({
    this.answer,
    this.lensAlias,
    this.workloadId,
  });

  factory UpdateAnswerOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAnswerOutput(
      answer: json['Answer'] != null
          ? Answer.fromJson(json['Answer'] as Map<String, dynamic>)
          : null,
      lensAlias: json['LensAlias'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answer = this.answer;
    final lensAlias = this.lensAlias;
    final workloadId = this.workloadId;
    return {
      if (answer != null) 'Answer': answer,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

/// Output of a update lens review call.
class UpdateLensReviewOutput {
  final LensReview? lensReview;
  final String? workloadId;

  UpdateLensReviewOutput({
    this.lensReview,
    this.workloadId,
  });

  factory UpdateLensReviewOutput.fromJson(Map<String, dynamic> json) {
    return UpdateLensReviewOutput(
      lensReview: json['LensReview'] != null
          ? LensReview.fromJson(json['LensReview'] as Map<String, dynamic>)
          : null,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensReview = this.lensReview;
    final workloadId = this.workloadId;
    return {
      if (lensReview != null) 'LensReview': lensReview,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

class UpdateShareInvitationOutput {
  /// The updated workload share invitation.
  final ShareInvitation? shareInvitation;

  UpdateShareInvitationOutput({
    this.shareInvitation,
  });

  factory UpdateShareInvitationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateShareInvitationOutput(
      shareInvitation: json['ShareInvitation'] != null
          ? ShareInvitation.fromJson(
              json['ShareInvitation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final shareInvitation = this.shareInvitation;
    return {
      if (shareInvitation != null) 'ShareInvitation': shareInvitation,
    };
  }
}

/// Output of an update workload call.
class UpdateWorkloadOutput {
  final Workload? workload;

  UpdateWorkloadOutput({
    this.workload,
  });

  factory UpdateWorkloadOutput.fromJson(Map<String, dynamic> json) {
    return UpdateWorkloadOutput(
      workload: json['Workload'] != null
          ? Workload.fromJson(json['Workload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workload = this.workload;
    return {
      if (workload != null) 'Workload': workload,
    };
  }
}

/// Input for Update Workload Share
class UpdateWorkloadShareOutput {
  final String? workloadId;
  final WorkloadShare? workloadShare;

  UpdateWorkloadShareOutput({
    this.workloadId,
    this.workloadShare,
  });

  factory UpdateWorkloadShareOutput.fromJson(Map<String, dynamic> json) {
    return UpdateWorkloadShareOutput(
      workloadId: json['WorkloadId'] as String?,
      workloadShare: json['WorkloadShare'] != null
          ? WorkloadShare.fromJson(
              json['WorkloadShare'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workloadId = this.workloadId;
    final workloadShare = this.workloadShare;
    return {
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadShare != null) 'WorkloadShare': workloadShare,
    };
  }
}

/// The differences between the base and latest versions of the lens.
class VersionDifferences {
  /// The differences between the base and latest versions of the lens.
  final List<PillarDifference>? pillarDifferences;

  VersionDifferences({
    this.pillarDifferences,
  });

  factory VersionDifferences.fromJson(Map<String, dynamic> json) {
    return VersionDifferences(
      pillarDifferences: (json['PillarDifferences'] as List?)
          ?.whereNotNull()
          .map((e) => PillarDifference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pillarDifferences = this.pillarDifferences;
    return {
      if (pillarDifferences != null) 'PillarDifferences': pillarDifferences,
    };
  }
}

/// A workload return object.
class Workload {
  final List<String>? accountIds;
  final String? architecturalDesign;
  final List<String>? awsRegions;
  final String? description;
  final WorkloadEnvironment? environment;
  final WorkloadImprovementStatus? improvementStatus;
  final String? industry;
  final String? industryType;

  /// Flag indicating whether the workload owner has acknowledged that the
  /// <i>Review owner</i> field is required.
  ///
  /// If a <b>Review owner</b> is not added to the workload within 60 days of
  /// acknowledgement, access to the workload is restricted until an owner is
  /// added.
  final bool? isReviewOwnerUpdateAcknowledged;
  final List<String>? lenses;
  final List<String>? nonAwsRegions;
  final String? notes;
  final String? owner;
  final List<String>? pillarPriorities;
  final String? reviewOwner;
  final DateTime? reviewRestrictionDate;
  final Map<Risk, int>? riskCounts;

  /// The ID assigned to the share invitation.
  final String? shareInvitationId;

  /// The tags associated with the workload.
  final Map<String, String>? tags;
  final DateTime? updatedAt;
  final String? workloadArn;
  final String? workloadId;
  final String? workloadName;

  Workload({
    this.accountIds,
    this.architecturalDesign,
    this.awsRegions,
    this.description,
    this.environment,
    this.improvementStatus,
    this.industry,
    this.industryType,
    this.isReviewOwnerUpdateAcknowledged,
    this.lenses,
    this.nonAwsRegions,
    this.notes,
    this.owner,
    this.pillarPriorities,
    this.reviewOwner,
    this.reviewRestrictionDate,
    this.riskCounts,
    this.shareInvitationId,
    this.tags,
    this.updatedAt,
    this.workloadArn,
    this.workloadId,
    this.workloadName,
  });

  factory Workload.fromJson(Map<String, dynamic> json) {
    return Workload(
      accountIds: (json['AccountIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      architecturalDesign: json['ArchitecturalDesign'] as String?,
      awsRegions: (json['AwsRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['Description'] as String?,
      environment: (json['Environment'] as String?)?.toWorkloadEnvironment(),
      improvementStatus:
          (json['ImprovementStatus'] as String?)?.toWorkloadImprovementStatus(),
      industry: json['Industry'] as String?,
      industryType: json['IndustryType'] as String?,
      isReviewOwnerUpdateAcknowledged:
          json['IsReviewOwnerUpdateAcknowledged'] as bool?,
      lenses: (json['Lenses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nonAwsRegions: (json['NonAwsRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notes: json['Notes'] as String?,
      owner: json['Owner'] as String?,
      pillarPriorities: (json['PillarPriorities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      reviewOwner: json['ReviewOwner'] as String?,
      reviewRestrictionDate: timeStampFromJson(json['ReviewRestrictionDate']),
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
      shareInvitationId: json['ShareInvitationId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      workloadArn: json['WorkloadArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final architecturalDesign = this.architecturalDesign;
    final awsRegions = this.awsRegions;
    final description = this.description;
    final environment = this.environment;
    final improvementStatus = this.improvementStatus;
    final industry = this.industry;
    final industryType = this.industryType;
    final isReviewOwnerUpdateAcknowledged =
        this.isReviewOwnerUpdateAcknowledged;
    final lenses = this.lenses;
    final nonAwsRegions = this.nonAwsRegions;
    final notes = this.notes;
    final owner = this.owner;
    final pillarPriorities = this.pillarPriorities;
    final reviewOwner = this.reviewOwner;
    final reviewRestrictionDate = this.reviewRestrictionDate;
    final riskCounts = this.riskCounts;
    final shareInvitationId = this.shareInvitationId;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    final workloadArn = this.workloadArn;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (accountIds != null) 'AccountIds': accountIds,
      if (architecturalDesign != null)
        'ArchitecturalDesign': architecturalDesign,
      if (awsRegions != null) 'AwsRegions': awsRegions,
      if (description != null) 'Description': description,
      if (environment != null) 'Environment': environment.toValue(),
      if (improvementStatus != null)
        'ImprovementStatus': improvementStatus.toValue(),
      if (industry != null) 'Industry': industry,
      if (industryType != null) 'IndustryType': industryType,
      if (isReviewOwnerUpdateAcknowledged != null)
        'IsReviewOwnerUpdateAcknowledged': isReviewOwnerUpdateAcknowledged,
      if (lenses != null) 'Lenses': lenses,
      if (nonAwsRegions != null) 'NonAwsRegions': nonAwsRegions,
      if (notes != null) 'Notes': notes,
      if (owner != null) 'Owner': owner,
      if (pillarPriorities != null) 'PillarPriorities': pillarPriorities,
      if (reviewOwner != null) 'ReviewOwner': reviewOwner,
      if (reviewRestrictionDate != null)
        'ReviewRestrictionDate': unixTimestampToJson(reviewRestrictionDate),
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (shareInvitationId != null) 'ShareInvitationId': shareInvitationId,
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (workloadArn != null) 'WorkloadArn': workloadArn,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

/// The environment for the workload.
enum WorkloadEnvironment {
  production,
  preproduction,
}

extension on WorkloadEnvironment {
  String toValue() {
    switch (this) {
      case WorkloadEnvironment.production:
        return 'PRODUCTION';
      case WorkloadEnvironment.preproduction:
        return 'PREPRODUCTION';
    }
  }
}

extension on String {
  WorkloadEnvironment toWorkloadEnvironment() {
    switch (this) {
      case 'PRODUCTION':
        return WorkloadEnvironment.production;
      case 'PREPRODUCTION':
        return WorkloadEnvironment.preproduction;
    }
    throw Exception('$this is not known in enum WorkloadEnvironment');
  }
}

/// The improvement status for a workload.
enum WorkloadImprovementStatus {
  notApplicable,
  notStarted,
  inProgress,
  complete,
  riskAcknowledged,
}

extension on WorkloadImprovementStatus {
  String toValue() {
    switch (this) {
      case WorkloadImprovementStatus.notApplicable:
        return 'NOT_APPLICABLE';
      case WorkloadImprovementStatus.notStarted:
        return 'NOT_STARTED';
      case WorkloadImprovementStatus.inProgress:
        return 'IN_PROGRESS';
      case WorkloadImprovementStatus.complete:
        return 'COMPLETE';
      case WorkloadImprovementStatus.riskAcknowledged:
        return 'RISK_ACKNOWLEDGED';
    }
  }
}

extension on String {
  WorkloadImprovementStatus toWorkloadImprovementStatus() {
    switch (this) {
      case 'NOT_APPLICABLE':
        return WorkloadImprovementStatus.notApplicable;
      case 'NOT_STARTED':
        return WorkloadImprovementStatus.notStarted;
      case 'IN_PROGRESS':
        return WorkloadImprovementStatus.inProgress;
      case 'COMPLETE':
        return WorkloadImprovementStatus.complete;
      case 'RISK_ACKNOWLEDGED':
        return WorkloadImprovementStatus.riskAcknowledged;
    }
    throw Exception('$this is not known in enum WorkloadImprovementStatus');
  }
}

/// A workload share return object.
class WorkloadShare {
  final PermissionType? permissionType;
  final String? shareId;
  final String? sharedBy;
  final String? sharedWith;
  final ShareStatus? status;
  final String? workloadId;
  final String? workloadName;

  WorkloadShare({
    this.permissionType,
    this.shareId,
    this.sharedBy,
    this.sharedWith,
    this.status,
    this.workloadId,
    this.workloadName,
  });

  factory WorkloadShare.fromJson(Map<String, dynamic> json) {
    return WorkloadShare(
      permissionType: (json['PermissionType'] as String?)?.toPermissionType(),
      shareId: json['ShareId'] as String?,
      sharedBy: json['SharedBy'] as String?,
      sharedWith: json['SharedWith'] as String?,
      status: (json['Status'] as String?)?.toShareStatus(),
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissionType = this.permissionType;
    final shareId = this.shareId;
    final sharedBy = this.sharedBy;
    final sharedWith = this.sharedWith;
    final status = this.status;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (permissionType != null) 'PermissionType': permissionType.toValue(),
      if (shareId != null) 'ShareId': shareId,
      if (sharedBy != null) 'SharedBy': sharedBy,
      if (sharedWith != null) 'SharedWith': sharedWith,
      if (status != null) 'Status': status.toValue(),
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

/// A workload share summary return object.
class WorkloadShareSummary {
  final PermissionType? permissionType;
  final String? shareId;
  final String? sharedWith;
  final ShareStatus? status;

  WorkloadShareSummary({
    this.permissionType,
    this.shareId,
    this.sharedWith,
    this.status,
  });

  factory WorkloadShareSummary.fromJson(Map<String, dynamic> json) {
    return WorkloadShareSummary(
      permissionType: (json['PermissionType'] as String?)?.toPermissionType(),
      shareId: json['ShareId'] as String?,
      sharedWith: json['SharedWith'] as String?,
      status: (json['Status'] as String?)?.toShareStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final permissionType = this.permissionType;
    final shareId = this.shareId;
    final sharedWith = this.sharedWith;
    final status = this.status;
    return {
      if (permissionType != null) 'PermissionType': permissionType.toValue(),
      if (shareId != null) 'ShareId': shareId,
      if (sharedWith != null) 'SharedWith': sharedWith,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A workload summary return object.
class WorkloadSummary {
  final WorkloadImprovementStatus? improvementStatus;
  final List<String>? lenses;
  final String? owner;
  final Map<Risk, int>? riskCounts;
  final DateTime? updatedAt;
  final String? workloadArn;
  final String? workloadId;
  final String? workloadName;

  WorkloadSummary({
    this.improvementStatus,
    this.lenses,
    this.owner,
    this.riskCounts,
    this.updatedAt,
    this.workloadArn,
    this.workloadId,
    this.workloadName,
  });

  factory WorkloadSummary.fromJson(Map<String, dynamic> json) {
    return WorkloadSummary(
      improvementStatus:
          (json['ImprovementStatus'] as String?)?.toWorkloadImprovementStatus(),
      lenses: (json['Lenses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      owner: json['Owner'] as String?,
      riskCounts: (json['RiskCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toRisk(), e as int)),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      workloadArn: json['WorkloadArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final improvementStatus = this.improvementStatus;
    final lenses = this.lenses;
    final owner = this.owner;
    final riskCounts = this.riskCounts;
    final updatedAt = this.updatedAt;
    final workloadArn = this.workloadArn;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (improvementStatus != null)
        'ImprovementStatus': improvementStatus.toValue(),
      if (lenses != null) 'Lenses': lenses,
      if (owner != null) 'Owner': owner,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (workloadArn != null) 'WorkloadArn': workloadArn,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
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
