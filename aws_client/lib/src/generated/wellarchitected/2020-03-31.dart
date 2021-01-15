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

part '2020-03-31.g.dart';

/// This is the <i>AWS Well-Architected Tool API Reference</i>.
class WellArchitected {
  final _s.RestJsonProtocol _protocol;
  WellArchitected({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required List<String> lensAliases,
    @_s.required String workloadId,
  }) async {
    ArgumentError.checkNotNull(lensAliases, 'lensAliases');
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String clientRequestToken,
    @_s.required String milestoneName,
    @_s.required String workloadId,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    ArgumentError.checkNotNull(milestoneName, 'milestoneName');
    _s.validateStringLength(
      'milestoneName',
      milestoneName,
      3,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'MilestoneName': milestoneName,
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
  Future<CreateWorkloadOutput> createWorkload({
    @_s.required String clientRequestToken,
    @_s.required String description,
    @_s.required WorkloadEnvironment environment,
    @_s.required List<String> lenses,
    @_s.required String reviewOwner,
    @_s.required String workloadName,
    List<String> accountIds,
    String architecturalDesign,
    List<String> awsRegions,
    String industry,
    String industryType,
    List<String> nonAwsRegions,
    String notes,
    List<String> pillarPriorities,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
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
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'Description': description,
      'Environment': environment?.toValue() ?? '',
      'Lenses': lenses,
      'ReviewOwner': reviewOwner,
      'WorkloadName': workloadName,
      if (accountIds != null) 'AccountIds': accountIds,
      if (architecturalDesign != null)
        'ArchitecturalDesign': architecturalDesign,
      if (awsRegions != null) 'AwsRegions': awsRegions,
      if (industry != null) 'Industry': industry,
      if (industryType != null) 'IndustryType': industryType,
      if (nonAwsRegions != null) 'NonAwsRegions': nonAwsRegions,
      if (notes != null) 'Notes': notes,
      if (pillarPriorities != null) 'PillarPriorities': pillarPriorities,
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
    @_s.required String clientRequestToken,
    @_s.required PermissionType permissionType,
    @_s.required String sharedWith,
    @_s.required String workloadId,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
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
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'PermissionType': permissionType?.toValue() ?? '',
      'SharedWith': sharedWith,
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
    @_s.required String clientRequestToken,
    @_s.required String workloadId,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String clientRequestToken,
    @_s.required String shareId,
    @_s.required String workloadId,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    ArgumentError.checkNotNull(shareId, 'shareId');
    _s.validateStringPattern(
      'shareId',
      shareId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required List<String> lensAliases,
    @_s.required String workloadId,
  }) async {
    ArgumentError.checkNotNull(lensAliases, 'lensAliases');
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String lensAlias,
    @_s.required String questionId,
    @_s.required String workloadId,
    int milestoneNumber,
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
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String lensAlias,
    @_s.required String workloadId,
    int milestoneNumber,
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
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String lensAlias,
    @_s.required String workloadId,
    int milestoneNumber,
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
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String baseLensVersion,
    @_s.required String lensAlias,
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
      if (baseLensVersion != null) 'BaseLensVersion': [baseLensVersion],
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
    @_s.required int milestoneNumber,
    @_s.required String workloadId,
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
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String workloadId,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String lensAlias,
    @_s.required String workloadId,
    int maxResults,
    int milestoneNumber,
    String nextToken,
    String pillarId,
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
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String lensAlias,
    @_s.required String workloadId,
    int maxResults,
    int milestoneNumber,
    String nextToken,
    String pillarId,
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
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String workloadId,
    int maxResults,
    int milestoneNumber,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    int maxResults,
    String nextToken,
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
    @_s.required String workloadId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    int maxResults,
    String nextToken,
    String workloadId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
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
    int maxResults,
    String nextToken,
    String workloadNamePrefix,
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
    @_s.required String workloadId,
    int maxResults,
    String nextToken,
    String sharedWithPrefix,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    int maxResults,
    String nextToken,
    String workloadNamePrefix,
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

  /// Update the answer.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<UpdateAnswerOutput> updateAnswer({
    @_s.required String lensAlias,
    @_s.required String questionId,
    @_s.required String workloadId,
    bool isApplicable,
    String notes,
    List<String> selectedChoices,
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
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required String lensAlias,
    @_s.required String workloadId,
    String lensNotes,
    Map<String, String> pillarNotes,
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
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required ShareInvitationAction shareInvitationAction,
    @_s.required String shareInvitationId,
  }) async {
    ArgumentError.checkNotNull(shareInvitationAction, 'shareInvitationAction');
    ArgumentError.checkNotNull(shareInvitationId, 'shareInvitationId');
    _s.validateStringPattern(
      'shareInvitationId',
      shareInvitationId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ShareInvitationAction': shareInvitationAction?.toValue() ?? '',
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
    @_s.required String workloadId,
    List<String> accountIds,
    String architecturalDesign,
    List<String> awsRegions,
    String description,
    WorkloadEnvironment environment,
    WorkloadImprovementStatus improvementStatus,
    String industry,
    String industryType,
    bool isReviewOwnerUpdateAcknowledged,
    List<String> nonAwsRegions,
    String notes,
    List<String> pillarPriorities,
    String reviewOwner,
    String workloadName,
  }) async {
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
    @_s.required PermissionType permissionType,
    @_s.required String shareId,
    @_s.required String workloadId,
  }) async {
    ArgumentError.checkNotNull(permissionType, 'permissionType');
    ArgumentError.checkNotNull(shareId, 'shareId');
    _s.validateStringPattern(
      'shareId',
      shareId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'PermissionType': permissionType?.toValue() ?? '',
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
    @_s.required String lensAlias,
    @_s.required String milestoneName,
    @_s.required String workloadId,
    String clientRequestToken,
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
    _s.validateStringPattern(
      'workloadId',
      workloadId,
      r'''[0-9a-f]{32}''',
      isRequired: true,
    );
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Answer {
  @_s.JsonKey(name: 'Choices')
  final List<Choice> choices;
  @_s.JsonKey(name: 'HelpfulResourceUrl')
  final String helpfulResourceUrl;
  @_s.JsonKey(name: 'ImprovementPlanUrl')
  final String improvementPlanUrl;
  @_s.JsonKey(name: 'IsApplicable')
  final bool isApplicable;
  @_s.JsonKey(name: 'Notes')
  final String notes;
  @_s.JsonKey(name: 'PillarId')
  final String pillarId;
  @_s.JsonKey(name: 'QuestionDescription')
  final String questionDescription;
  @_s.JsonKey(name: 'QuestionId')
  final String questionId;
  @_s.JsonKey(name: 'QuestionTitle')
  final String questionTitle;
  @_s.JsonKey(name: 'Risk')
  final Risk risk;
  @_s.JsonKey(name: 'SelectedChoices')
  final List<String> selectedChoices;

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
  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

/// An answer summary of a lens review in a workload.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnswerSummary {
  @_s.JsonKey(name: 'Choices')
  final List<Choice> choices;
  @_s.JsonKey(name: 'IsApplicable')
  final bool isApplicable;
  @_s.JsonKey(name: 'PillarId')
  final String pillarId;
  @_s.JsonKey(name: 'QuestionId')
  final String questionId;
  @_s.JsonKey(name: 'QuestionTitle')
  final String questionTitle;
  @_s.JsonKey(name: 'Risk')
  final Risk risk;
  @_s.JsonKey(name: 'SelectedChoices')
  final List<String> selectedChoices;

  AnswerSummary({
    this.choices,
    this.isApplicable,
    this.pillarId,
    this.questionId,
    this.questionTitle,
    this.risk,
    this.selectedChoices,
  });
  factory AnswerSummary.fromJson(Map<String, dynamic> json) =>
      _$AnswerSummaryFromJson(json);
}

/// A choice available to answer question.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Choice {
  @_s.JsonKey(name: 'ChoiceId')
  final String choiceId;
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'Title')
  final String title;

  Choice({
    this.choiceId,
    this.description,
    this.title,
  });
  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}

/// Output of a create milestone call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMilestoneOutput {
  @_s.JsonKey(name: 'MilestoneNumber')
  final int milestoneNumber;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  CreateMilestoneOutput({
    this.milestoneNumber,
    this.workloadId,
  });
  factory CreateMilestoneOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateMilestoneOutputFromJson(json);
}

/// Output of a create workload call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWorkloadOutput {
  @_s.JsonKey(name: 'WorkloadArn')
  final String workloadArn;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  CreateWorkloadOutput({
    this.workloadArn,
    this.workloadId,
  });
  factory CreateWorkloadOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateWorkloadOutputFromJson(json);
}

/// Input for Create Workload Share
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWorkloadShareOutput {
  @_s.JsonKey(name: 'ShareId')
  final String shareId;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  CreateWorkloadShareOutput({
    this.shareId,
    this.workloadId,
  });
  factory CreateWorkloadShareOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateWorkloadShareOutputFromJson(json);
}

enum DifferenceStatus {
  @_s.JsonValue('UPDATED')
  updated,
  @_s.JsonValue('NEW')
  $new,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Output of a get answer call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAnswerOutput {
  @_s.JsonKey(name: 'Answer')
  final Answer answer;
  @_s.JsonKey(name: 'LensAlias')
  final String lensAlias;
  @_s.JsonKey(name: 'MilestoneNumber')
  final int milestoneNumber;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  GetAnswerOutput({
    this.answer,
    this.lensAlias,
    this.milestoneNumber,
    this.workloadId,
  });
  factory GetAnswerOutput.fromJson(Map<String, dynamic> json) =>
      _$GetAnswerOutputFromJson(json);
}

/// Output of a get lens review call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLensReviewOutput {
  @_s.JsonKey(name: 'LensReview')
  final LensReview lensReview;
  @_s.JsonKey(name: 'MilestoneNumber')
  final int milestoneNumber;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  GetLensReviewOutput({
    this.lensReview,
    this.milestoneNumber,
    this.workloadId,
  });
  factory GetLensReviewOutput.fromJson(Map<String, dynamic> json) =>
      _$GetLensReviewOutputFromJson(json);
}

/// Output of a get lens review report call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLensReviewReportOutput {
  @_s.JsonKey(name: 'LensReviewReport')
  final LensReviewReport lensReviewReport;
  @_s.JsonKey(name: 'MilestoneNumber')
  final int milestoneNumber;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  GetLensReviewReportOutput({
    this.lensReviewReport,
    this.milestoneNumber,
    this.workloadId,
  });
  factory GetLensReviewReportOutput.fromJson(Map<String, dynamic> json) =>
      _$GetLensReviewReportOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLensVersionDifferenceOutput {
  /// The base version of the lens.
  @_s.JsonKey(name: 'BaseLensVersion')
  final String baseLensVersion;

  /// The latest version of the lens.
  @_s.JsonKey(name: 'LatestLensVersion')
  final String latestLensVersion;
  @_s.JsonKey(name: 'LensAlias')
  final String lensAlias;
  @_s.JsonKey(name: 'VersionDifferences')
  final VersionDifferences versionDifferences;

  GetLensVersionDifferenceOutput({
    this.baseLensVersion,
    this.latestLensVersion,
    this.lensAlias,
    this.versionDifferences,
  });
  factory GetLensVersionDifferenceOutput.fromJson(Map<String, dynamic> json) =>
      _$GetLensVersionDifferenceOutputFromJson(json);
}

/// Output of a get milestone call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMilestoneOutput {
  @_s.JsonKey(name: 'Milestone')
  final Milestone milestone;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  GetMilestoneOutput({
    this.milestone,
    this.workloadId,
  });
  factory GetMilestoneOutput.fromJson(Map<String, dynamic> json) =>
      _$GetMilestoneOutputFromJson(json);
}

/// Output of a get workload call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWorkloadOutput {
  @_s.JsonKey(name: 'Workload')
  final Workload workload;

  GetWorkloadOutput({
    this.workload,
  });
  factory GetWorkloadOutput.fromJson(Map<String, dynamic> json) =>
      _$GetWorkloadOutputFromJson(json);
}

/// An improvement summary of a lens review in a workload.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImprovementSummary {
  @_s.JsonKey(name: 'ImprovementPlanUrl')
  final String improvementPlanUrl;
  @_s.JsonKey(name: 'PillarId')
  final String pillarId;
  @_s.JsonKey(name: 'QuestionId')
  final String questionId;
  @_s.JsonKey(name: 'QuestionTitle')
  final String questionTitle;
  @_s.JsonKey(name: 'Risk')
  final Risk risk;

  ImprovementSummary({
    this.improvementPlanUrl,
    this.pillarId,
    this.questionId,
    this.questionTitle,
    this.risk,
  });
  factory ImprovementSummary.fromJson(Map<String, dynamic> json) =>
      _$ImprovementSummaryFromJson(json);
}

/// A lens review of a question.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LensReview {
  @_s.JsonKey(name: 'LensAlias')
  final String lensAlias;
  @_s.JsonKey(name: 'LensName')
  final String lensName;

  /// The status of the lens.
  @_s.JsonKey(name: 'LensStatus')
  final LensStatus lensStatus;

  /// The version of the lens.
  @_s.JsonKey(name: 'LensVersion')
  final String lensVersion;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'Notes')
  final String notes;
  @_s.JsonKey(name: 'PillarReviewSummaries')
  final List<PillarReviewSummary> pillarReviewSummaries;
  @_s.JsonKey(name: 'RiskCounts')
  final Map<Risk, int> riskCounts;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

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
  factory LensReview.fromJson(Map<String, dynamic> json) =>
      _$LensReviewFromJson(json);
}

/// A report of a lens review.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LensReviewReport {
  @_s.JsonKey(name: 'Base64String')
  final String base64String;
  @_s.JsonKey(name: 'LensAlias')
  final String lensAlias;

  LensReviewReport({
    this.base64String,
    this.lensAlias,
  });
  factory LensReviewReport.fromJson(Map<String, dynamic> json) =>
      _$LensReviewReportFromJson(json);
}

/// A lens review summary of a workload.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LensReviewSummary {
  @_s.JsonKey(name: 'LensAlias')
  final String lensAlias;
  @_s.JsonKey(name: 'LensName')
  final String lensName;

  /// The status of the lens.
  @_s.JsonKey(name: 'LensStatus')
  final LensStatus lensStatus;

  /// The version of the lens.
  @_s.JsonKey(name: 'LensVersion')
  final String lensVersion;
  @_s.JsonKey(name: 'RiskCounts')
  final Map<Risk, int> riskCounts;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  LensReviewSummary({
    this.lensAlias,
    this.lensName,
    this.lensStatus,
    this.lensVersion,
    this.riskCounts,
    this.updatedAt,
  });
  factory LensReviewSummary.fromJson(Map<String, dynamic> json) =>
      _$LensReviewSummaryFromJson(json);
}

enum LensStatus {
  @_s.JsonValue('CURRENT')
  current,
  @_s.JsonValue('NOT_CURRENT')
  notCurrent,
  @_s.JsonValue('DEPRECATED')
  deprecated,
}

/// A lens summary of a lens.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LensSummary {
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'LensAlias')
  final String lensAlias;
  @_s.JsonKey(name: 'LensName')
  final String lensName;

  /// The version of the lens.
  @_s.JsonKey(name: 'LensVersion')
  final String lensVersion;

  LensSummary({
    this.description,
    this.lensAlias,
    this.lensName,
    this.lensVersion,
  });
  factory LensSummary.fromJson(Map<String, dynamic> json) =>
      _$LensSummaryFromJson(json);
}

/// Lens upgrade summary return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LensUpgradeSummary {
  /// The current version of the lens.
  @_s.JsonKey(name: 'CurrentLensVersion')
  final String currentLensVersion;

  /// The latest version of the lens.
  @_s.JsonKey(name: 'LatestLensVersion')
  final String latestLensVersion;
  @_s.JsonKey(name: 'LensAlias')
  final String lensAlias;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;
  @_s.JsonKey(name: 'WorkloadName')
  final String workloadName;

  LensUpgradeSummary({
    this.currentLensVersion,
    this.latestLensVersion,
    this.lensAlias,
    this.workloadId,
    this.workloadName,
  });
  factory LensUpgradeSummary.fromJson(Map<String, dynamic> json) =>
      _$LensUpgradeSummaryFromJson(json);
}

/// Output of a list answers call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAnswersOutput {
  @_s.JsonKey(name: 'AnswerSummaries')
  final List<AnswerSummary> answerSummaries;
  @_s.JsonKey(name: 'LensAlias')
  final String lensAlias;
  @_s.JsonKey(name: 'MilestoneNumber')
  final int milestoneNumber;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  ListAnswersOutput({
    this.answerSummaries,
    this.lensAlias,
    this.milestoneNumber,
    this.nextToken,
    this.workloadId,
  });
  factory ListAnswersOutput.fromJson(Map<String, dynamic> json) =>
      _$ListAnswersOutputFromJson(json);
}

/// Output of a list lens review improvements call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLensReviewImprovementsOutput {
  @_s.JsonKey(name: 'ImprovementSummaries')
  final List<ImprovementSummary> improvementSummaries;
  @_s.JsonKey(name: 'LensAlias')
  final String lensAlias;
  @_s.JsonKey(name: 'MilestoneNumber')
  final int milestoneNumber;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  ListLensReviewImprovementsOutput({
    this.improvementSummaries,
    this.lensAlias,
    this.milestoneNumber,
    this.nextToken,
    this.workloadId,
  });
  factory ListLensReviewImprovementsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListLensReviewImprovementsOutputFromJson(json);
}

/// Output of a list lens reviews call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLensReviewsOutput {
  @_s.JsonKey(name: 'LensReviewSummaries')
  final List<LensReviewSummary> lensReviewSummaries;
  @_s.JsonKey(name: 'MilestoneNumber')
  final int milestoneNumber;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  ListLensReviewsOutput({
    this.lensReviewSummaries,
    this.milestoneNumber,
    this.nextToken,
    this.workloadId,
  });
  factory ListLensReviewsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListLensReviewsOutputFromJson(json);
}

/// Output of a list lenses call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLensesOutput {
  @_s.JsonKey(name: 'LensSummaries')
  final List<LensSummary> lensSummaries;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLensesOutput({
    this.lensSummaries,
    this.nextToken,
  });
  factory ListLensesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListLensesOutputFromJson(json);
}

/// Output of a list milestones call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMilestonesOutput {
  @_s.JsonKey(name: 'MilestoneSummaries')
  final List<MilestoneSummary> milestoneSummaries;
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  ListMilestonesOutput({
    this.milestoneSummaries,
    this.nextToken,
    this.workloadId,
  });
  factory ListMilestonesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListMilestonesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNotificationsOutput {
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of lens notification summaries in a workload.
  @_s.JsonKey(name: 'NotificationSummaries')
  final List<NotificationSummary> notificationSummaries;

  ListNotificationsOutput({
    this.nextToken,
    this.notificationSummaries,
  });
  factory ListNotificationsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListNotificationsOutputFromJson(json);
}

/// Input for List Share Invitations
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListShareInvitationsOutput {
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of share invitation summaries in a workload.
  @_s.JsonKey(name: 'ShareInvitationSummaries')
  final List<ShareInvitationSummary> shareInvitationSummaries;

  ListShareInvitationsOutput({
    this.nextToken,
    this.shareInvitationSummaries,
  });
  factory ListShareInvitationsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListShareInvitationsOutputFromJson(json);
}

/// Input for List Workload Share
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWorkloadSharesOutput {
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;
  @_s.JsonKey(name: 'WorkloadShareSummaries')
  final List<WorkloadShareSummary> workloadShareSummaries;

  ListWorkloadSharesOutput({
    this.nextToken,
    this.workloadId,
    this.workloadShareSummaries,
  });
  factory ListWorkloadSharesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListWorkloadSharesOutputFromJson(json);
}

/// Output of a list workloads call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWorkloadsOutput {
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;
  @_s.JsonKey(name: 'WorkloadSummaries')
  final List<WorkloadSummary> workloadSummaries;

  ListWorkloadsOutput({
    this.nextToken,
    this.workloadSummaries,
  });
  factory ListWorkloadsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListWorkloadsOutputFromJson(json);
}

/// A milestone return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Milestone {
  @_s.JsonKey(name: 'MilestoneName')
  final String milestoneName;
  @_s.JsonKey(name: 'MilestoneNumber')
  final int milestoneNumber;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RecordedAt')
  final DateTime recordedAt;
  @_s.JsonKey(name: 'Workload')
  final Workload workload;

  Milestone({
    this.milestoneName,
    this.milestoneNumber,
    this.recordedAt,
    this.workload,
  });
  factory Milestone.fromJson(Map<String, dynamic> json) =>
      _$MilestoneFromJson(json);
}

/// A milestone summary return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MilestoneSummary {
  @_s.JsonKey(name: 'MilestoneName')
  final String milestoneName;
  @_s.JsonKey(name: 'MilestoneNumber')
  final int milestoneNumber;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'RecordedAt')
  final DateTime recordedAt;
  @_s.JsonKey(name: 'WorkloadSummary')
  final WorkloadSummary workloadSummary;

  MilestoneSummary({
    this.milestoneName,
    this.milestoneNumber,
    this.recordedAt,
    this.workloadSummary,
  });
  factory MilestoneSummary.fromJson(Map<String, dynamic> json) =>
      _$MilestoneSummaryFromJson(json);
}

/// A notification summary return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotificationSummary {
  /// Summary of lens upgrade.
  @_s.JsonKey(name: 'LensUpgradeSummary')
  final LensUpgradeSummary lensUpgradeSummary;

  /// The type of notification.
  @_s.JsonKey(name: 'Type')
  final NotificationType type;

  NotificationSummary({
    this.lensUpgradeSummary,
    this.type,
  });
  factory NotificationSummary.fromJson(Map<String, dynamic> json) =>
      _$NotificationSummaryFromJson(json);
}

enum NotificationType {
  @_s.JsonValue('LENS_VERSION_UPGRADED')
  lensVersionUpgraded,
  @_s.JsonValue('LENS_VERSION_DEPRECATED')
  lensVersionDeprecated,
}

/// Permission granted on a workload share.
enum PermissionType {
  @_s.JsonValue('READONLY')
  readonly,
  @_s.JsonValue('CONTRIBUTOR')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A pillar difference return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PillarDifference {
  /// Indicates the type of change to the pillar.
  @_s.JsonKey(name: 'DifferenceStatus')
  final DifferenceStatus differenceStatus;
  @_s.JsonKey(name: 'PillarId')
  final String pillarId;

  /// List of question differences.
  @_s.JsonKey(name: 'QuestionDifferences')
  final List<QuestionDifference> questionDifferences;

  PillarDifference({
    this.differenceStatus,
    this.pillarId,
    this.questionDifferences,
  });
  factory PillarDifference.fromJson(Map<String, dynamic> json) =>
      _$PillarDifferenceFromJson(json);
}

/// A pillar review summary of a lens review.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PillarReviewSummary {
  @_s.JsonKey(name: 'Notes')
  final String notes;
  @_s.JsonKey(name: 'PillarId')
  final String pillarId;
  @_s.JsonKey(name: 'PillarName')
  final String pillarName;
  @_s.JsonKey(name: 'RiskCounts')
  final Map<Risk, int> riskCounts;

  PillarReviewSummary({
    this.notes,
    this.pillarId,
    this.pillarName,
    this.riskCounts,
  });
  factory PillarReviewSummary.fromJson(Map<String, dynamic> json) =>
      _$PillarReviewSummaryFromJson(json);
}

/// A question difference return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QuestionDifference {
  /// Indicates the type of change to the question.
  @_s.JsonKey(name: 'DifferenceStatus')
  final DifferenceStatus differenceStatus;
  @_s.JsonKey(name: 'QuestionId')
  final String questionId;
  @_s.JsonKey(name: 'QuestionTitle')
  final String questionTitle;

  QuestionDifference({
    this.differenceStatus,
    this.questionId,
    this.questionTitle,
  });
  factory QuestionDifference.fromJson(Map<String, dynamic> json) =>
      _$QuestionDifferenceFromJson(json);
}

/// The risk for a given workload, lens review, pillar, or question.
enum Risk {
  @_s.JsonValue('UNANSWERED')
  unanswered,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('NOT_APPLICABLE')
  notApplicable,
}

/// The share invitation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ShareInvitation {
  /// The ID assigned to the share invitation.
  @_s.JsonKey(name: 'ShareInvitationId')
  final String shareInvitationId;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  ShareInvitation({
    this.shareInvitationId,
    this.workloadId,
  });
  factory ShareInvitation.fromJson(Map<String, dynamic> json) =>
      _$ShareInvitationFromJson(json);
}

/// Share invitation action taken by contributor.
enum ShareInvitationAction {
  @_s.JsonValue('ACCEPT')
  accept,
  @_s.JsonValue('REJECT')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A share invitation summary return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ShareInvitationSummary {
  @_s.JsonKey(name: 'PermissionType')
  final PermissionType permissionType;

  /// The ID assigned to the share invitation.
  @_s.JsonKey(name: 'ShareInvitationId')
  final String shareInvitationId;
  @_s.JsonKey(name: 'SharedBy')
  final String sharedBy;
  @_s.JsonKey(name: 'SharedWith')
  final String sharedWith;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;
  @_s.JsonKey(name: 'WorkloadName')
  final String workloadName;

  ShareInvitationSummary({
    this.permissionType,
    this.shareInvitationId,
    this.sharedBy,
    this.sharedWith,
    this.workloadId,
    this.workloadName,
  });
  factory ShareInvitationSummary.fromJson(Map<String, dynamic> json) =>
      _$ShareInvitationSummaryFromJson(json);
}

/// The status of a workload share.
enum ShareStatus {
  @_s.JsonValue('ACCEPTED')
  accepted,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('REVOKED')
  revoked,
  @_s.JsonValue('EXPIRED')
  expired,
}

/// Output of a update answer call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAnswerOutput {
  @_s.JsonKey(name: 'Answer')
  final Answer answer;
  @_s.JsonKey(name: 'LensAlias')
  final String lensAlias;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  UpdateAnswerOutput({
    this.answer,
    this.lensAlias,
    this.workloadId,
  });
  factory UpdateAnswerOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateAnswerOutputFromJson(json);
}

/// Output of a update lens review call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLensReviewOutput {
  @_s.JsonKey(name: 'LensReview')
  final LensReview lensReview;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;

  UpdateLensReviewOutput({
    this.lensReview,
    this.workloadId,
  });
  factory UpdateLensReviewOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateLensReviewOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateShareInvitationOutput {
  /// The updated workload share invitation.
  @_s.JsonKey(name: 'ShareInvitation')
  final ShareInvitation shareInvitation;

  UpdateShareInvitationOutput({
    this.shareInvitation,
  });
  factory UpdateShareInvitationOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateShareInvitationOutputFromJson(json);
}

/// Output of an update workload call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWorkloadOutput {
  @_s.JsonKey(name: 'Workload')
  final Workload workload;

  UpdateWorkloadOutput({
    this.workload,
  });
  factory UpdateWorkloadOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorkloadOutputFromJson(json);
}

/// Input for Update Workload Share
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWorkloadShareOutput {
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;
  @_s.JsonKey(name: 'WorkloadShare')
  final WorkloadShare workloadShare;

  UpdateWorkloadShareOutput({
    this.workloadId,
    this.workloadShare,
  });
  factory UpdateWorkloadShareOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorkloadShareOutputFromJson(json);
}

/// The differences between the base and latest versions of the lens.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VersionDifferences {
  /// The differences between the base and latest versions of the lens.
  @_s.JsonKey(name: 'PillarDifferences')
  final List<PillarDifference> pillarDifferences;

  VersionDifferences({
    this.pillarDifferences,
  });
  factory VersionDifferences.fromJson(Map<String, dynamic> json) =>
      _$VersionDifferencesFromJson(json);
}

/// A workload return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Workload {
  @_s.JsonKey(name: 'AccountIds')
  final List<String> accountIds;
  @_s.JsonKey(name: 'ArchitecturalDesign')
  final String architecturalDesign;
  @_s.JsonKey(name: 'AwsRegions')
  final List<String> awsRegions;
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'Environment')
  final WorkloadEnvironment environment;
  @_s.JsonKey(name: 'ImprovementStatus')
  final WorkloadImprovementStatus improvementStatus;
  @_s.JsonKey(name: 'Industry')
  final String industry;
  @_s.JsonKey(name: 'IndustryType')
  final String industryType;

  /// Flag indicating whether the workload owner has acknowledged that the
  /// <i>Review owner</i> field is required.
  ///
  /// If a <b>Review owner</b> is not added to the workload within 60 days of
  /// acknowledgement, access to the workload is restricted until an owner is
  /// added.
  @_s.JsonKey(name: 'IsReviewOwnerUpdateAcknowledged')
  final bool isReviewOwnerUpdateAcknowledged;
  @_s.JsonKey(name: 'Lenses')
  final List<String> lenses;
  @_s.JsonKey(name: 'NonAwsRegions')
  final List<String> nonAwsRegions;
  @_s.JsonKey(name: 'Notes')
  final String notes;
  @_s.JsonKey(name: 'Owner')
  final String owner;
  @_s.JsonKey(name: 'PillarPriorities')
  final List<String> pillarPriorities;
  @_s.JsonKey(name: 'ReviewOwner')
  final String reviewOwner;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReviewRestrictionDate')
  final DateTime reviewRestrictionDate;
  @_s.JsonKey(name: 'RiskCounts')
  final Map<Risk, int> riskCounts;

  /// The ID assigned to the share invitation.
  @_s.JsonKey(name: 'ShareInvitationId')
  final String shareInvitationId;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;
  @_s.JsonKey(name: 'WorkloadArn')
  final String workloadArn;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;
  @_s.JsonKey(name: 'WorkloadName')
  final String workloadName;

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
    this.updatedAt,
    this.workloadArn,
    this.workloadId,
    this.workloadName,
  });
  factory Workload.fromJson(Map<String, dynamic> json) =>
      _$WorkloadFromJson(json);
}

/// The environment for the workload.
enum WorkloadEnvironment {
  @_s.JsonValue('PRODUCTION')
  production,
  @_s.JsonValue('PREPRODUCTION')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The improvement status for a workload.
enum WorkloadImprovementStatus {
  @_s.JsonValue('NOT_APPLICABLE')
  notApplicable,
  @_s.JsonValue('NOT_STARTED')
  notStarted,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('RISK_ACKNOWLEDGED')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A workload share return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkloadShare {
  @_s.JsonKey(name: 'PermissionType')
  final PermissionType permissionType;
  @_s.JsonKey(name: 'ShareId')
  final String shareId;
  @_s.JsonKey(name: 'SharedBy')
  final String sharedBy;
  @_s.JsonKey(name: 'SharedWith')
  final String sharedWith;
  @_s.JsonKey(name: 'Status')
  final ShareStatus status;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;
  @_s.JsonKey(name: 'WorkloadName')
  final String workloadName;

  WorkloadShare({
    this.permissionType,
    this.shareId,
    this.sharedBy,
    this.sharedWith,
    this.status,
    this.workloadId,
    this.workloadName,
  });
  factory WorkloadShare.fromJson(Map<String, dynamic> json) =>
      _$WorkloadShareFromJson(json);
}

/// A workload share summary return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkloadShareSummary {
  @_s.JsonKey(name: 'PermissionType')
  final PermissionType permissionType;
  @_s.JsonKey(name: 'ShareId')
  final String shareId;
  @_s.JsonKey(name: 'SharedWith')
  final String sharedWith;
  @_s.JsonKey(name: 'Status')
  final ShareStatus status;

  WorkloadShareSummary({
    this.permissionType,
    this.shareId,
    this.sharedWith,
    this.status,
  });
  factory WorkloadShareSummary.fromJson(Map<String, dynamic> json) =>
      _$WorkloadShareSummaryFromJson(json);
}

/// A workload summary return object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkloadSummary {
  @_s.JsonKey(name: 'ImprovementStatus')
  final WorkloadImprovementStatus improvementStatus;
  @_s.JsonKey(name: 'Lenses')
  final List<String> lenses;
  @_s.JsonKey(name: 'Owner')
  final String owner;
  @_s.JsonKey(name: 'RiskCounts')
  final Map<Risk, int> riskCounts;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;
  @_s.JsonKey(name: 'WorkloadArn')
  final String workloadArn;
  @_s.JsonKey(name: 'WorkloadId')
  final String workloadId;
  @_s.JsonKey(name: 'WorkloadName')
  final String workloadName;

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
  factory WorkloadSummary.fromJson(Map<String, dynamic> json) =>
      _$WorkloadSummaryFromJson(json);
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
