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

/// This is the <i>Well-Architected Tool API Reference</i>. The WA Tool API
/// provides programmatic access to the <a
/// href="http://aws.amazon.com/well-architected-tool">Well-Architected Tool</a>
/// in the <a href="https://console.aws.amazon.com/wellarchitected">Amazon Web
/// Services Management Console</a>. For information about the Well-Architected
/// Tool, see the <a
/// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/intro.html">Well-Architected
/// Tool User Guide</a>.
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
  /// Up to 10 lenses can be associated with a workload in a single API
  /// operation. A maximum of 20 lenses can be associated with a workload.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// By accessing and/or applying custom lenses created by another Amazon Web
  /// Services user or account, you acknowledge that custom lenses created by
  /// other users and shared with you are Third Party Content as defined in the
  /// Amazon Web Services Customer Agreement.
  /// </note>
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

  /// Create a lens share.
  ///
  /// The owner of a lens can share it with other Amazon Web Services accounts
  /// and IAM users in the same Amazon Web Services Region. Shared access to a
  /// lens is not removed until the lens invitation is deleted.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// By sharing your custom lenses with other Amazon Web Services accounts, you
  /// acknowledge that Amazon Web Services will make your custom lenses
  /// available to those other accounts. Those other accounts may continue to
  /// access and use your shared custom lenses even if you delete the custom
  /// lenses from your own Amazon Web Services account or terminate your Amazon
  /// Web Services account.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<CreateLensShareOutput> createLensShare({
    required String lensAlias,
    required String sharedWith,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    ArgumentError.checkNotNull(sharedWith, 'sharedWith');
    final $payload = <String, dynamic>{
      'SharedWith': sharedWith,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/lenses/${Uri.encodeComponent(lensAlias)}/shares',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLensShareOutput.fromJson(response);
  }

  /// Create a new lens version.
  ///
  /// A lens can have up to 100 versions.
  ///
  /// After a lens has been imported, create a new lens version to publish it.
  /// The owner of a lens can share the lens with other Amazon Web Services
  /// accounts and IAM users in the same Amazon Web Services Region. Only the
  /// owner of a lens can delete it.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensVersion] :
  /// The version of the lens being created.
  ///
  /// Parameter [isMajorVersion] :
  /// Set to true if this new major lens version.
  Future<CreateLensVersionOutput> createLensVersion({
    required String lensAlias,
    required String lensVersion,
    String? clientRequestToken,
    bool? isMajorVersion,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    ArgumentError.checkNotNull(lensVersion, 'lensVersion');
    final $payload = <String, dynamic>{
      'LensVersion': lensVersion,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (isMajorVersion != null) 'IsMajorVersion': isMajorVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/lenses/${Uri.encodeComponent(lensAlias)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLensVersionOutput.fromJson(response);
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
  /// The owner of a workload can share the workload with other Amazon Web
  /// Services accounts and IAM users in the same Amazon Web Services Region.
  /// Only the owner of a workload can delete it.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/define-workload.html">Defining
  /// a Workload</a> in the <i>Well-Architected Tool User Guide</i>.
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
    ArgumentError.checkNotNull(environment, 'environment');
    ArgumentError.checkNotNull(lenses, 'lenses');
    ArgumentError.checkNotNull(reviewOwner, 'reviewOwner');
    ArgumentError.checkNotNull(workloadName, 'workloadName');
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
  /// The owner of a workload can share it with other Amazon Web Services
  /// accounts and IAM users in the same Amazon Web Services Region. Shared
  /// access to a workload is not removed until the workload invitation is
  /// deleted.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/workloads-sharing.html">Sharing
  /// a Workload</a> in the <i>Well-Architected Tool User Guide</i>.
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

  /// Delete an existing lens.
  ///
  /// Only the owner of a lens can delete it. After the lens is deleted, Amazon
  /// Web Services accounts and IAM users that you shared the lens with can
  /// continue to use it, but they will no longer be able to apply it to new
  /// workloads.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// By sharing your custom lenses with other Amazon Web Services accounts, you
  /// acknowledge that Amazon Web Services will make your custom lenses
  /// available to those other accounts. Those other accounts may continue to
  /// access and use your shared custom lenses even if you delete the custom
  /// lenses from your own Amazon Web Services account or terminate your Amazon
  /// Web Services account.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensStatus] :
  /// The status of the lens to be deleted.
  Future<void> deleteLens({
    required String lensAlias,
    required LensStatusType lensStatus,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    ArgumentError.checkNotNull(lensStatus, 'lensStatus');
    final $query = <String, List<String>>{
      'LensStatus': [lensStatus.toValue()],
      if (clientRequestToken != null)
        'ClientRequestToken': [clientRequestToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/lenses/${Uri.encodeComponent(lensAlias)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a lens share.
  ///
  /// After the lens share is deleted, Amazon Web Services accounts and IAM
  /// users that you shared the lens with can continue to use it, but they will
  /// no longer be able to apply it to new workloads.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// By sharing your custom lenses with other Amazon Web Services accounts, you
  /// acknowledge that Amazon Web Services will make your custom lenses
  /// available to those other accounts. Those other accounts may continue to
  /// access and use your shared custom lenses even if you delete the custom
  /// lenses from your own Amazon Web Services account or terminate your Amazon
  /// Web Services account.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> deleteLensShare({
    required String lensAlias,
    required String shareId,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    ArgumentError.checkNotNull(shareId, 'shareId');
    final $query = <String, List<String>>{
      if (clientRequestToken != null)
        'ClientRequestToken': [clientRequestToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/lenses/${Uri.encodeComponent(lensAlias)}/shares/${Uri.encodeComponent(shareId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
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
  ///
  /// Up to 10 lenses can be disassociated from a workload in a single API
  /// operation.
  /// <note>
  /// The Amazon Web Services Well-Architected Framework lens
  /// (<code>wellarchitected</code>) cannot be removed from a workload.
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

  /// Export an existing lens.
  ///
  /// Lenses are defined in JSON. For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/lenses-format-specification.html">JSON
  /// format specification</a> in the <i>Well-Architected Tool User Guide</i>.
  /// Only the owner of a lens can export it.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// Do not include or gather personal identifiable information (PII) of end
  /// users or other identifiable individuals in or via your custom lenses. If
  /// your custom lens or those shared with you and used in your account do
  /// include or collect PII you are responsible for: ensuring that the included
  /// PII is processed in accordance with applicable law, providing adequate
  /// privacy notices, and obtaining necessary consents for processing such
  /// data.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensVersion] :
  /// The lens version to be exported.
  Future<ExportLensOutput> exportLens({
    required String lensAlias,
    String? lensVersion,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    final $query = <String, List<String>>{
      if (lensVersion != null) 'LensVersion': [lensVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/lenses/${Uri.encodeComponent(lensAlias)}/export',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ExportLensOutput.fromJson(response);
  }

  /// Get the answer to a specific question in a workload review.
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
    ArgumentError.checkNotNull(questionId, 'questionId');
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

  /// Get an existing lens.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensVersion] :
  /// The lens version to be retrieved.
  Future<GetLensOutput> getLens({
    required String lensAlias,
    String? lensVersion,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    final $query = <String, List<String>>{
      if (lensVersion != null) 'LensVersion': [lensVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/lenses/${Uri.encodeComponent(lensAlias)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLensOutput.fromJson(response);
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
  ///
  /// Parameter [targetLensVersion] :
  /// The lens version to target a difference for.
  Future<GetLensVersionDifferenceOutput> getLensVersionDifference({
    required String lensAlias,
    String? baseLensVersion,
    String? targetLensVersion,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    final $query = <String, List<String>>{
      if (baseLensVersion != null) 'BaseLensVersion': [baseLensVersion],
      if (targetLensVersion != null) 'TargetLensVersion': [targetLensVersion],
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

  /// Import a new lens.
  ///
  /// The lens cannot be applied to workloads or shared with other Amazon Web
  /// Services accounts until it's published with <a>CreateLensVersion</a>
  ///
  /// Lenses are defined in JSON. For more information, see <a
  /// href="https://docs.aws.amazon.com/wellarchitected/latest/userguide/lenses-format-specification.html">JSON
  /// format specification</a> in the <i>Well-Architected Tool User Guide</i>.
  ///
  /// A custom lens cannot exceed 500 KB in size.
  /// <note>
  /// <b>Disclaimer</b>
  ///
  /// Do not include or gather personal identifiable information (PII) of end
  /// users or other identifiable individuals in or via your custom lenses. If
  /// your custom lens or those shared with you and used in your account do
  /// include or collect PII you are responsible for: ensuring that the included
  /// PII is processed in accordance with applicable law, providing adequate
  /// privacy notices, and obtaining necessary consents for processing such
  /// data.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jSONString] :
  /// The JSON representation of a lens.
  ///
  /// Parameter [tags] :
  /// Tags to associate to a lens.
  Future<ImportLensOutput> importLens({
    required String jSONString,
    String? clientRequestToken,
    String? lensAlias,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(jSONString, 'jSONString');
    final $payload = <String, dynamic>{
      'JSONString': jSONString,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/importLens',
      exceptionFnMap: _exceptionFns,
    );
    return ImportLensOutput.fromJson(response);
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

  /// List the lens shares associated with the lens.
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
  /// The Amazon Web Services account ID or IAM role with which the lens is
  /// shared.
  Future<ListLensSharesOutput> listLensShares({
    required String lensAlias,
    int? maxResults,
    String? nextToken,
    String? sharedWithPrefix,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (sharedWithPrefix != null) 'SharedWithPrefix': [sharedWithPrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/lenses/${Uri.encodeComponent(lensAlias)}/shares',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLensSharesOutput.fromJson(response);
  }

  /// List the available lenses.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [lensStatus] :
  /// The status of lenses to be returned.
  ///
  /// Parameter [lensType] :
  /// The type of lenses to be returned.
  Future<ListLensesOutput> listLenses({
    String? lensName,
    LensStatusType? lensStatus,
    LensType? lensType,
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
      if (lensName != null) 'LensName': [lensName],
      if (lensStatus != null) 'LensStatus': [lensStatus.toValue()],
      if (lensType != null) 'LensType': [lensType.toValue()],
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
  /// Parameter [lensNamePrefix] :
  /// An optional string added to the beginning of each lens name returned in
  /// the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return for this request.
  ///
  /// Parameter [shareResourceType] :
  /// The type of share invitations to be returned.
  Future<ListShareInvitationsOutput> listShareInvitations({
    String? lensNamePrefix,
    int? maxResults,
    String? nextToken,
    ShareResourceType? shareResourceType,
    String? workloadNamePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (lensNamePrefix != null) 'LensNamePrefix': [lensNamePrefix],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (shareResourceType != null)
        'ShareResourceType': [shareResourceType.toValue()],
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
  /// The Amazon Web Services account ID or IAM role with which the workload is
  /// shared.
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
  /// To specify multiple tags, use separate <b>tagKeys</b> parameters, for
  /// example:
  ///
  /// <code>DELETE /tags/WorkloadArn?tagKeys=key1&amp;tagKeys=key2</code>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys. Existing tags of the resource whose keys are members
  /// of this list are removed from the resource.
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
  ///
  /// Parameter [choiceUpdates] :
  /// A list of choices to update on a question in your workload. The String key
  /// corresponds to the choice ID to be updated.
  ///
  /// Parameter [reason] :
  /// The reason why a question is not applicable to your workload.
  Future<UpdateAnswerOutput> updateAnswer({
    required String lensAlias,
    required String questionId,
    required String workloadId,
    Map<String, ChoiceUpdate>? choiceUpdates,
    bool? isApplicable,
    String? notes,
    AnswerReason? reason,
    List<String>? selectedChoices,
  }) async {
    ArgumentError.checkNotNull(lensAlias, 'lensAlias');
    ArgumentError.checkNotNull(questionId, 'questionId');
    ArgumentError.checkNotNull(workloadId, 'workloadId');
    final $payload = <String, dynamic>{
      if (choiceUpdates != null) 'ChoiceUpdates': choiceUpdates,
      if (isApplicable != null) 'IsApplicable': isApplicable,
      if (notes != null) 'Notes': notes,
      if (reason != null) 'Reason': reason.toValue(),
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
    ArgumentError.checkNotNull(workloadId, 'workloadId');
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
    ArgumentError.checkNotNull(milestoneName, 'milestoneName');
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
  /// A list of selected choices to a question in your workload.
  final List<ChoiceAnswer>? choiceAnswers;
  final List<Choice>? choices;

  /// The helpful resource text to be displayed.
  final String? helpfulResourceDisplayText;
  final String? helpfulResourceUrl;
  final String? improvementPlanUrl;
  final bool? isApplicable;
  final String? notes;
  final String? pillarId;
  final String? questionDescription;
  final String? questionId;
  final String? questionTitle;

  /// The reason why the question is not applicable to your workload.
  final AnswerReason? reason;
  final Risk? risk;
  final List<String>? selectedChoices;

  Answer({
    this.choiceAnswers,
    this.choices,
    this.helpfulResourceDisplayText,
    this.helpfulResourceUrl,
    this.improvementPlanUrl,
    this.isApplicable,
    this.notes,
    this.pillarId,
    this.questionDescription,
    this.questionId,
    this.questionTitle,
    this.reason,
    this.risk,
    this.selectedChoices,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      choiceAnswers: (json['ChoiceAnswers'] as List?)
          ?.whereNotNull()
          .map((e) => ChoiceAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      choices: (json['Choices'] as List?)
          ?.whereNotNull()
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      helpfulResourceDisplayText: json['HelpfulResourceDisplayText'] as String?,
      helpfulResourceUrl: json['HelpfulResourceUrl'] as String?,
      improvementPlanUrl: json['ImprovementPlanUrl'] as String?,
      isApplicable: json['IsApplicable'] as bool?,
      notes: json['Notes'] as String?,
      pillarId: json['PillarId'] as String?,
      questionDescription: json['QuestionDescription'] as String?,
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
      reason: (json['Reason'] as String?)?.toAnswerReason(),
      risk: (json['Risk'] as String?)?.toRisk(),
      selectedChoices: (json['SelectedChoices'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final choiceAnswers = this.choiceAnswers;
    final choices = this.choices;
    final helpfulResourceDisplayText = this.helpfulResourceDisplayText;
    final helpfulResourceUrl = this.helpfulResourceUrl;
    final improvementPlanUrl = this.improvementPlanUrl;
    final isApplicable = this.isApplicable;
    final notes = this.notes;
    final pillarId = this.pillarId;
    final questionDescription = this.questionDescription;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    final reason = this.reason;
    final risk = this.risk;
    final selectedChoices = this.selectedChoices;
    return {
      if (choiceAnswers != null) 'ChoiceAnswers': choiceAnswers,
      if (choices != null) 'Choices': choices,
      if (helpfulResourceDisplayText != null)
        'HelpfulResourceDisplayText': helpfulResourceDisplayText,
      if (helpfulResourceUrl != null) 'HelpfulResourceUrl': helpfulResourceUrl,
      if (improvementPlanUrl != null) 'ImprovementPlanUrl': improvementPlanUrl,
      if (isApplicable != null) 'IsApplicable': isApplicable,
      if (notes != null) 'Notes': notes,
      if (pillarId != null) 'PillarId': pillarId,
      if (questionDescription != null)
        'QuestionDescription': questionDescription,
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
      if (reason != null) 'Reason': reason.toValue(),
      if (risk != null) 'Risk': risk.toValue(),
      if (selectedChoices != null) 'SelectedChoices': selectedChoices,
    };
  }
}

enum AnswerReason {
  outOfScope,
  businessPriorities,
  architectureConstraints,
  other,
  none,
}

extension on AnswerReason {
  String toValue() {
    switch (this) {
      case AnswerReason.outOfScope:
        return 'OUT_OF_SCOPE';
      case AnswerReason.businessPriorities:
        return 'BUSINESS_PRIORITIES';
      case AnswerReason.architectureConstraints:
        return 'ARCHITECTURE_CONSTRAINTS';
      case AnswerReason.other:
        return 'OTHER';
      case AnswerReason.none:
        return 'NONE';
    }
  }
}

extension on String {
  AnswerReason toAnswerReason() {
    switch (this) {
      case 'OUT_OF_SCOPE':
        return AnswerReason.outOfScope;
      case 'BUSINESS_PRIORITIES':
        return AnswerReason.businessPriorities;
      case 'ARCHITECTURE_CONSTRAINTS':
        return AnswerReason.architectureConstraints;
      case 'OTHER':
        return AnswerReason.other;
      case 'NONE':
        return AnswerReason.none;
    }
    throw Exception('$this is not known in enum AnswerReason');
  }
}

/// An answer summary of a lens review in a workload.
class AnswerSummary {
  /// A list of selected choices to a question in your workload.
  final List<ChoiceAnswerSummary>? choiceAnswerSummaries;
  final List<Choice>? choices;
  final bool? isApplicable;
  final String? pillarId;
  final String? questionId;
  final String? questionTitle;

  /// The reason why a choice is non-applicable to a question in your workload.
  final AnswerReason? reason;
  final Risk? risk;
  final List<String>? selectedChoices;

  AnswerSummary({
    this.choiceAnswerSummaries,
    this.choices,
    this.isApplicable,
    this.pillarId,
    this.questionId,
    this.questionTitle,
    this.reason,
    this.risk,
    this.selectedChoices,
  });

  factory AnswerSummary.fromJson(Map<String, dynamic> json) {
    return AnswerSummary(
      choiceAnswerSummaries: (json['ChoiceAnswerSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ChoiceAnswerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      choices: (json['Choices'] as List?)
          ?.whereNotNull()
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      isApplicable: json['IsApplicable'] as bool?,
      pillarId: json['PillarId'] as String?,
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
      reason: (json['Reason'] as String?)?.toAnswerReason(),
      risk: (json['Risk'] as String?)?.toRisk(),
      selectedChoices: (json['SelectedChoices'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final choiceAnswerSummaries = this.choiceAnswerSummaries;
    final choices = this.choices;
    final isApplicable = this.isApplicable;
    final pillarId = this.pillarId;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    final reason = this.reason;
    final risk = this.risk;
    final selectedChoices = this.selectedChoices;
    return {
      if (choiceAnswerSummaries != null)
        'ChoiceAnswerSummaries': choiceAnswerSummaries,
      if (choices != null) 'Choices': choices,
      if (isApplicable != null) 'IsApplicable': isApplicable,
      if (pillarId != null) 'PillarId': pillarId,
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
      if (reason != null) 'Reason': reason.toValue(),
      if (risk != null) 'Risk': risk.toValue(),
      if (selectedChoices != null) 'SelectedChoices': selectedChoices,
    };
  }
}

/// A choice available to answer question.
class Choice {
  final String? choiceId;
  final String? description;

  /// The choice level helpful resource.
  final ChoiceContent? helpfulResource;

  /// The choice level improvement plan.
  final ChoiceContent? improvementPlan;
  final String? title;

  Choice({
    this.choiceId,
    this.description,
    this.helpfulResource,
    this.improvementPlan,
    this.title,
  });

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      choiceId: json['ChoiceId'] as String?,
      description: json['Description'] as String?,
      helpfulResource: json['HelpfulResource'] != null
          ? ChoiceContent.fromJson(
              json['HelpfulResource'] as Map<String, dynamic>)
          : null,
      improvementPlan: json['ImprovementPlan'] != null
          ? ChoiceContent.fromJson(
              json['ImprovementPlan'] as Map<String, dynamic>)
          : null,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final choiceId = this.choiceId;
    final description = this.description;
    final helpfulResource = this.helpfulResource;
    final improvementPlan = this.improvementPlan;
    final title = this.title;
    return {
      if (choiceId != null) 'ChoiceId': choiceId,
      if (description != null) 'Description': description,
      if (helpfulResource != null) 'HelpfulResource': helpfulResource,
      if (improvementPlan != null) 'ImprovementPlan': improvementPlan,
      if (title != null) 'Title': title,
    };
  }
}

/// A choice that has been answered on a question in your workload.
class ChoiceAnswer {
  final String? choiceId;

  /// The notes associated with a choice.
  final String? notes;

  /// The reason why a choice is non-applicable to a question in your workload.
  final ChoiceReason? reason;

  /// The status of a choice.
  final ChoiceStatus? status;

  ChoiceAnswer({
    this.choiceId,
    this.notes,
    this.reason,
    this.status,
  });

  factory ChoiceAnswer.fromJson(Map<String, dynamic> json) {
    return ChoiceAnswer(
      choiceId: json['ChoiceId'] as String?,
      notes: json['Notes'] as String?,
      reason: (json['Reason'] as String?)?.toChoiceReason(),
      status: (json['Status'] as String?)?.toChoiceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final choiceId = this.choiceId;
    final notes = this.notes;
    final reason = this.reason;
    final status = this.status;
    return {
      if (choiceId != null) 'ChoiceId': choiceId,
      if (notes != null) 'Notes': notes,
      if (reason != null) 'Reason': reason.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A choice summary that has been answered on a question in your workload.
class ChoiceAnswerSummary {
  final String? choiceId;

  /// The reason why a choice is non-applicable to a question in your workload.
  final ChoiceReason? reason;

  /// The status of a choice.
  final ChoiceStatus? status;

  ChoiceAnswerSummary({
    this.choiceId,
    this.reason,
    this.status,
  });

  factory ChoiceAnswerSummary.fromJson(Map<String, dynamic> json) {
    return ChoiceAnswerSummary(
      choiceId: json['ChoiceId'] as String?,
      reason: (json['Reason'] as String?)?.toChoiceReason(),
      status: (json['Status'] as String?)?.toChoiceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final choiceId = this.choiceId;
    final reason = this.reason;
    final status = this.status;
    return {
      if (choiceId != null) 'ChoiceId': choiceId,
      if (reason != null) 'Reason': reason.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// The choice content.
class ChoiceContent {
  /// The display text for the choice content.
  final String? displayText;

  /// The URL for the choice content.
  final String? url;

  ChoiceContent({
    this.displayText,
    this.url,
  });

  factory ChoiceContent.fromJson(Map<String, dynamic> json) {
    return ChoiceContent(
      displayText: json['DisplayText'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayText = this.displayText;
    final url = this.url;
    return {
      if (displayText != null) 'DisplayText': displayText,
      if (url != null) 'Url': url,
    };
  }
}

/// The choice level improvement plan.
class ChoiceImprovementPlan {
  final String? choiceId;

  /// The display text for the improvement plan.
  final String? displayText;
  final String? improvementPlanUrl;

  ChoiceImprovementPlan({
    this.choiceId,
    this.displayText,
    this.improvementPlanUrl,
  });

  factory ChoiceImprovementPlan.fromJson(Map<String, dynamic> json) {
    return ChoiceImprovementPlan(
      choiceId: json['ChoiceId'] as String?,
      displayText: json['DisplayText'] as String?,
      improvementPlanUrl: json['ImprovementPlanUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final choiceId = this.choiceId;
    final displayText = this.displayText;
    final improvementPlanUrl = this.improvementPlanUrl;
    return {
      if (choiceId != null) 'ChoiceId': choiceId,
      if (displayText != null) 'DisplayText': displayText,
      if (improvementPlanUrl != null) 'ImprovementPlanUrl': improvementPlanUrl,
    };
  }
}

enum ChoiceReason {
  outOfScope,
  businessPriorities,
  architectureConstraints,
  other,
  none,
}

extension on ChoiceReason {
  String toValue() {
    switch (this) {
      case ChoiceReason.outOfScope:
        return 'OUT_OF_SCOPE';
      case ChoiceReason.businessPriorities:
        return 'BUSINESS_PRIORITIES';
      case ChoiceReason.architectureConstraints:
        return 'ARCHITECTURE_CONSTRAINTS';
      case ChoiceReason.other:
        return 'OTHER';
      case ChoiceReason.none:
        return 'NONE';
    }
  }
}

extension on String {
  ChoiceReason toChoiceReason() {
    switch (this) {
      case 'OUT_OF_SCOPE':
        return ChoiceReason.outOfScope;
      case 'BUSINESS_PRIORITIES':
        return ChoiceReason.businessPriorities;
      case 'ARCHITECTURE_CONSTRAINTS':
        return ChoiceReason.architectureConstraints;
      case 'OTHER':
        return ChoiceReason.other;
      case 'NONE':
        return ChoiceReason.none;
    }
    throw Exception('$this is not known in enum ChoiceReason');
  }
}

enum ChoiceStatus {
  selected,
  notApplicable,
  unselected,
}

extension on ChoiceStatus {
  String toValue() {
    switch (this) {
      case ChoiceStatus.selected:
        return 'SELECTED';
      case ChoiceStatus.notApplicable:
        return 'NOT_APPLICABLE';
      case ChoiceStatus.unselected:
        return 'UNSELECTED';
    }
  }
}

extension on String {
  ChoiceStatus toChoiceStatus() {
    switch (this) {
      case 'SELECTED':
        return ChoiceStatus.selected;
      case 'NOT_APPLICABLE':
        return ChoiceStatus.notApplicable;
      case 'UNSELECTED':
        return ChoiceStatus.unselected;
    }
    throw Exception('$this is not known in enum ChoiceStatus');
  }
}

/// A list of choices to be updated.
class ChoiceUpdate {
  /// The status of a choice.
  final ChoiceStatus status;

  /// The notes associated with a choice.
  final String? notes;

  /// The reason why a choice is non-applicable to a question in your workload.
  final ChoiceReason? reason;

  ChoiceUpdate({
    required this.status,
    this.notes,
    this.reason,
  });

  factory ChoiceUpdate.fromJson(Map<String, dynamic> json) {
    return ChoiceUpdate(
      status: (json['Status'] as String).toChoiceStatus(),
      notes: json['Notes'] as String?,
      reason: (json['Reason'] as String?)?.toChoiceReason(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final notes = this.notes;
    final reason = this.reason;
    return {
      'Status': status.toValue(),
      if (notes != null) 'Notes': notes,
      if (reason != null) 'Reason': reason.toValue(),
    };
  }
}

class CreateLensShareOutput {
  final String? shareId;

  CreateLensShareOutput({
    this.shareId,
  });

  factory CreateLensShareOutput.fromJson(Map<String, dynamic> json) {
    return CreateLensShareOutput(
      shareId: json['ShareId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shareId = this.shareId;
    return {
      if (shareId != null) 'ShareId': shareId,
    };
  }
}

class CreateLensVersionOutput {
  /// The ARN for the lens.
  final String? lensArn;

  /// The version of the lens.
  final String? lensVersion;

  CreateLensVersionOutput({
    this.lensArn,
    this.lensVersion,
  });

  factory CreateLensVersionOutput.fromJson(Map<String, dynamic> json) {
    return CreateLensVersionOutput(
      lensArn: json['LensArn'] as String?,
      lensVersion: json['LensVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensArn = this.lensArn;
    final lensVersion = this.lensVersion;
    return {
      if (lensArn != null) 'LensArn': lensArn,
      if (lensVersion != null) 'LensVersion': lensVersion,
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

class ExportLensOutput {
  /// The JSON for the lens.
  final String? lensJSON;

  ExportLensOutput({
    this.lensJSON,
  });

  factory ExportLensOutput.fromJson(Map<String, dynamic> json) {
    return ExportLensOutput(
      lensJSON: json['LensJSON'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensJSON = this.lensJSON;
    return {
      if (lensJSON != null) 'LensJSON': lensJSON,
    };
  }
}

/// Output of a get answer call.
class GetAnswerOutput {
  final Answer? answer;
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final int? milestoneNumber;
  final String? workloadId;

  GetAnswerOutput({
    this.answer,
    this.lensAlias,
    this.lensArn,
    this.milestoneNumber,
    this.workloadId,
  });

  factory GetAnswerOutput.fromJson(Map<String, dynamic> json) {
    return GetAnswerOutput(
      answer: json['Answer'] != null
          ? Answer.fromJson(json['Answer'] as Map<String, dynamic>)
          : null,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answer = this.answer;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final milestoneNumber = this.milestoneNumber;
    final workloadId = this.workloadId;
    return {
      if (answer != null) 'Answer': answer,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (milestoneNumber != null) 'MilestoneNumber': milestoneNumber,
      if (workloadId != null) 'WorkloadId': workloadId,
    };
  }
}

class GetLensOutput {
  /// A lens return object.
  final Lens? lens;

  GetLensOutput({
    this.lens,
  });

  factory GetLensOutput.fromJson(Map<String, dynamic> json) {
    return GetLensOutput(
      lens: json['Lens'] != null
          ? Lens.fromJson(json['Lens'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lens = this.lens;
    return {
      if (lens != null) 'Lens': lens,
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

  /// The ARN for the lens.
  final String? lensArn;

  /// The target lens version for the lens.
  final String? targetLensVersion;
  final VersionDifferences? versionDifferences;

  GetLensVersionDifferenceOutput({
    this.baseLensVersion,
    this.latestLensVersion,
    this.lensAlias,
    this.lensArn,
    this.targetLensVersion,
    this.versionDifferences,
  });

  factory GetLensVersionDifferenceOutput.fromJson(Map<String, dynamic> json) {
    return GetLensVersionDifferenceOutput(
      baseLensVersion: json['BaseLensVersion'] as String?,
      latestLensVersion: json['LatestLensVersion'] as String?,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      targetLensVersion: json['TargetLensVersion'] as String?,
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
    final lensArn = this.lensArn;
    final targetLensVersion = this.targetLensVersion;
    final versionDifferences = this.versionDifferences;
    return {
      if (baseLensVersion != null) 'BaseLensVersion': baseLensVersion,
      if (latestLensVersion != null) 'LatestLensVersion': latestLensVersion,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (targetLensVersion != null) 'TargetLensVersion': targetLensVersion,
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

class ImportLensOutput {
  /// The ARN for the lens.
  final String? lensArn;

  /// The status of the imported lens.
  final ImportLensStatus? status;

  ImportLensOutput({
    this.lensArn,
    this.status,
  });

  factory ImportLensOutput.fromJson(Map<String, dynamic> json) {
    return ImportLensOutput(
      lensArn: json['LensArn'] as String?,
      status: (json['Status'] as String?)?.toImportLensStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final lensArn = this.lensArn;
    final status = this.status;
    return {
      if (lensArn != null) 'LensArn': lensArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ImportLensStatus {
  inProgress,
  complete,
  error,
}

extension on ImportLensStatus {
  String toValue() {
    switch (this) {
      case ImportLensStatus.inProgress:
        return 'IN_PROGRESS';
      case ImportLensStatus.complete:
        return 'COMPLETE';
      case ImportLensStatus.error:
        return 'ERROR';
    }
  }
}

extension on String {
  ImportLensStatus toImportLensStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ImportLensStatus.inProgress;
      case 'COMPLETE':
        return ImportLensStatus.complete;
      case 'ERROR':
        return ImportLensStatus.error;
    }
    throw Exception('$this is not known in enum ImportLensStatus');
  }
}

/// An improvement summary of a lens review in a workload.
class ImprovementSummary {
  final String? improvementPlanUrl;

  /// The improvement plan details.
  final List<ChoiceImprovementPlan>? improvementPlans;
  final String? pillarId;
  final String? questionId;
  final String? questionTitle;
  final Risk? risk;

  ImprovementSummary({
    this.improvementPlanUrl,
    this.improvementPlans,
    this.pillarId,
    this.questionId,
    this.questionTitle,
    this.risk,
  });

  factory ImprovementSummary.fromJson(Map<String, dynamic> json) {
    return ImprovementSummary(
      improvementPlanUrl: json['ImprovementPlanUrl'] as String?,
      improvementPlans: (json['ImprovementPlans'] as List?)
          ?.whereNotNull()
          .map((e) => ChoiceImprovementPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      pillarId: json['PillarId'] as String?,
      questionId: json['QuestionId'] as String?,
      questionTitle: json['QuestionTitle'] as String?,
      risk: (json['Risk'] as String?)?.toRisk(),
    );
  }

  Map<String, dynamic> toJson() {
    final improvementPlanUrl = this.improvementPlanUrl;
    final improvementPlans = this.improvementPlans;
    final pillarId = this.pillarId;
    final questionId = this.questionId;
    final questionTitle = this.questionTitle;
    final risk = this.risk;
    return {
      if (improvementPlanUrl != null) 'ImprovementPlanUrl': improvementPlanUrl,
      if (improvementPlans != null) 'ImprovementPlans': improvementPlans,
      if (pillarId != null) 'PillarId': pillarId,
      if (questionId != null) 'QuestionId': questionId,
      if (questionTitle != null) 'QuestionTitle': questionTitle,
      if (risk != null) 'Risk': risk.toValue(),
    };
  }
}

/// A lens return object.
class Lens {
  final String? description;

  /// The ARN of a lens.
  final String? lensArn;

  /// The version of a lens.
  final String? lensVersion;
  final String? name;

  /// The Amazon Web Services account ID that owns the lens.
  final String? owner;

  /// The ID assigned to the share invitation.
  final String? shareInvitationId;

  Lens({
    this.description,
    this.lensArn,
    this.lensVersion,
    this.name,
    this.owner,
    this.shareInvitationId,
  });

  factory Lens.fromJson(Map<String, dynamic> json) {
    return Lens(
      description: json['Description'] as String?,
      lensArn: json['LensArn'] as String?,
      lensVersion: json['LensVersion'] as String?,
      name: json['Name'] as String?,
      owner: json['Owner'] as String?,
      shareInvitationId: json['ShareInvitationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final lensArn = this.lensArn;
    final lensVersion = this.lensVersion;
    final name = this.name;
    final owner = this.owner;
    final shareInvitationId = this.shareInvitationId;
    return {
      if (description != null) 'Description': description,
      if (lensArn != null) 'LensArn': lensArn,
      if (lensVersion != null) 'LensVersion': lensVersion,
      if (name != null) 'Name': name,
      if (owner != null) 'Owner': owner,
      if (shareInvitationId != null) 'ShareInvitationId': shareInvitationId,
    };
  }
}

/// A lens review of a question.
class LensReview {
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
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
    this.lensArn,
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
      lensArn: json['LensArn'] as String?,
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
    final lensArn = this.lensArn;
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
      if (lensArn != null) 'LensArn': lensArn,
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

  /// The ARN for the lens.
  final String? lensArn;

  LensReviewReport({
    this.base64String,
    this.lensAlias,
    this.lensArn,
  });

  factory LensReviewReport.fromJson(Map<String, dynamic> json) {
    return LensReviewReport(
      base64String: json['Base64String'] as String?,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final base64String = this.base64String;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    return {
      if (base64String != null) 'Base64String': base64String,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
    };
  }
}

/// A lens review summary of a workload.
class LensReviewSummary {
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final String? lensName;

  /// The status of the lens.
  final LensStatus? lensStatus;

  /// The version of the lens.
  final String? lensVersion;
  final Map<Risk, int>? riskCounts;
  final DateTime? updatedAt;

  LensReviewSummary({
    this.lensAlias,
    this.lensArn,
    this.lensName,
    this.lensStatus,
    this.lensVersion,
    this.riskCounts,
    this.updatedAt,
  });

  factory LensReviewSummary.fromJson(Map<String, dynamic> json) {
    return LensReviewSummary(
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
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
    final lensArn = this.lensArn;
    final lensName = this.lensName;
    final lensStatus = this.lensStatus;
    final lensVersion = this.lensVersion;
    final riskCounts = this.riskCounts;
    final updatedAt = this.updatedAt;
    return {
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (lensName != null) 'LensName': lensName,
      if (lensStatus != null) 'LensStatus': lensStatus.toValue(),
      if (lensVersion != null) 'LensVersion': lensVersion,
      if (riskCounts != null)
        'RiskCounts': riskCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// A lens share summary return object.
class LensShareSummary {
  final String? shareId;
  final String? sharedWith;
  final ShareStatus? status;

  LensShareSummary({
    this.shareId,
    this.sharedWith,
    this.status,
  });

  factory LensShareSummary.fromJson(Map<String, dynamic> json) {
    return LensShareSummary(
      shareId: json['ShareId'] as String?,
      sharedWith: json['SharedWith'] as String?,
      status: (json['Status'] as String?)?.toShareStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final shareId = this.shareId;
    final sharedWith = this.sharedWith;
    final status = this.status;
    return {
      if (shareId != null) 'ShareId': shareId,
      if (sharedWith != null) 'SharedWith': sharedWith,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum LensStatus {
  current,
  notCurrent,
  deprecated,
  deleted,
  unshared,
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
      case LensStatus.deleted:
        return 'DELETED';
      case LensStatus.unshared:
        return 'UNSHARED';
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
      case 'DELETED':
        return LensStatus.deleted;
      case 'UNSHARED':
        return LensStatus.unshared;
    }
    throw Exception('$this is not known in enum LensStatus');
  }
}

enum LensStatusType {
  all,
  draft,
  published,
}

extension on LensStatusType {
  String toValue() {
    switch (this) {
      case LensStatusType.all:
        return 'ALL';
      case LensStatusType.draft:
        return 'DRAFT';
      case LensStatusType.published:
        return 'PUBLISHED';
    }
  }
}

extension on String {
  LensStatusType toLensStatusType() {
    switch (this) {
      case 'ALL':
        return LensStatusType.all;
      case 'DRAFT':
        return LensStatusType.draft;
      case 'PUBLISHED':
        return LensStatusType.published;
    }
    throw Exception('$this is not known in enum LensStatusType');
  }
}

/// A lens summary of a lens.
class LensSummary {
  final DateTime? createdAt;
  final String? description;
  final String? lensAlias;

  /// The ARN of the lens.
  final String? lensArn;
  final String? lensName;

  /// The status of the lens.
  final LensStatus? lensStatus;

  /// The type of the lens.
  final LensType? lensType;

  /// The version of the lens.
  final String? lensVersion;
  final String? owner;
  final DateTime? updatedAt;

  LensSummary({
    this.createdAt,
    this.description,
    this.lensAlias,
    this.lensArn,
    this.lensName,
    this.lensStatus,
    this.lensType,
    this.lensVersion,
    this.owner,
    this.updatedAt,
  });

  factory LensSummary.fromJson(Map<String, dynamic> json) {
    return LensSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      lensName: json['LensName'] as String?,
      lensStatus: (json['LensStatus'] as String?)?.toLensStatus(),
      lensType: (json['LensType'] as String?)?.toLensType(),
      lensVersion: json['LensVersion'] as String?,
      owner: json['Owner'] as String?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final lensName = this.lensName;
    final lensStatus = this.lensStatus;
    final lensType = this.lensType;
    final lensVersion = this.lensVersion;
    final owner = this.owner;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (lensName != null) 'LensName': lensName,
      if (lensStatus != null) 'LensStatus': lensStatus.toValue(),
      if (lensType != null) 'LensType': lensType.toValue(),
      if (lensVersion != null) 'LensVersion': lensVersion,
      if (owner != null) 'Owner': owner,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum LensType {
  awsOfficial,
  customShared,
  customSelf,
}

extension on LensType {
  String toValue() {
    switch (this) {
      case LensType.awsOfficial:
        return 'AWS_OFFICIAL';
      case LensType.customShared:
        return 'CUSTOM_SHARED';
      case LensType.customSelf:
        return 'CUSTOM_SELF';
    }
  }
}

extension on String {
  LensType toLensType() {
    switch (this) {
      case 'AWS_OFFICIAL':
        return LensType.awsOfficial;
      case 'CUSTOM_SHARED':
        return LensType.customShared;
      case 'CUSTOM_SELF':
        return LensType.customSelf;
    }
    throw Exception('$this is not known in enum LensType');
  }
}

/// Lens upgrade summary return object.
class LensUpgradeSummary {
  /// The current version of the lens.
  final String? currentLensVersion;

  /// The latest version of the lens.
  final String? latestLensVersion;
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final String? workloadId;
  final String? workloadName;

  LensUpgradeSummary({
    this.currentLensVersion,
    this.latestLensVersion,
    this.lensAlias,
    this.lensArn,
    this.workloadId,
    this.workloadName,
  });

  factory LensUpgradeSummary.fromJson(Map<String, dynamic> json) {
    return LensUpgradeSummary(
      currentLensVersion: json['CurrentLensVersion'] as String?,
      latestLensVersion: json['LatestLensVersion'] as String?,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentLensVersion = this.currentLensVersion;
    final latestLensVersion = this.latestLensVersion;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (currentLensVersion != null) 'CurrentLensVersion': currentLensVersion,
      if (latestLensVersion != null) 'LatestLensVersion': latestLensVersion,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

/// Output of a list answers call.
class ListAnswersOutput {
  final List<AnswerSummary>? answerSummaries;
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;
  final int? milestoneNumber;
  final String? nextToken;
  final String? workloadId;

  ListAnswersOutput({
    this.answerSummaries,
    this.lensAlias,
    this.lensArn,
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
      lensArn: json['LensArn'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answerSummaries = this.answerSummaries;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final milestoneNumber = this.milestoneNumber;
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    return {
      if (answerSummaries != null) 'AnswerSummaries': answerSummaries,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
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

  /// The ARN for the lens.
  final String? lensArn;
  final int? milestoneNumber;
  final String? nextToken;
  final String? workloadId;

  ListLensReviewImprovementsOutput({
    this.improvementSummaries,
    this.lensAlias,
    this.lensArn,
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
      lensArn: json['LensArn'] as String?,
      milestoneNumber: json['MilestoneNumber'] as int?,
      nextToken: json['NextToken'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final improvementSummaries = this.improvementSummaries;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final milestoneNumber = this.milestoneNumber;
    final nextToken = this.nextToken;
    final workloadId = this.workloadId;
    return {
      if (improvementSummaries != null)
        'ImprovementSummaries': improvementSummaries,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
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

class ListLensSharesOutput {
  /// A list of lens share summaries.
  final List<LensShareSummary>? lensShareSummaries;
  final String? nextToken;

  ListLensSharesOutput({
    this.lensShareSummaries,
    this.nextToken,
  });

  factory ListLensSharesOutput.fromJson(Map<String, dynamic> json) {
    return ListLensSharesOutput(
      lensShareSummaries: (json['LensShareSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => LensShareSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensShareSummaries = this.lensShareSummaries;
    final nextToken = this.nextToken;
    return {
      if (lensShareSummaries != null) 'LensShareSummaries': lensShareSummaries,
      if (nextToken != null) 'NextToken': nextToken,
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
  final String? pillarName;

  /// List of question differences.
  final List<QuestionDifference>? questionDifferences;

  PillarDifference({
    this.differenceStatus,
    this.pillarId,
    this.pillarName,
    this.questionDifferences,
  });

  factory PillarDifference.fromJson(Map<String, dynamic> json) {
    return PillarDifference(
      differenceStatus:
          (json['DifferenceStatus'] as String?)?.toDifferenceStatus(),
      pillarId: json['PillarId'] as String?,
      pillarName: json['PillarName'] as String?,
      questionDifferences: (json['QuestionDifferences'] as List?)
          ?.whereNotNull()
          .map((e) => QuestionDifference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final differenceStatus = this.differenceStatus;
    final pillarId = this.pillarId;
    final pillarName = this.pillarName;
    final questionDifferences = this.questionDifferences;
    return {
      if (differenceStatus != null)
        'DifferenceStatus': differenceStatus.toValue(),
      if (pillarId != null) 'PillarId': pillarId,
      if (pillarName != null) 'PillarName': pillarName,
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
  final String? lensAlias;

  /// The ARN for the lens.
  final String? lensArn;

  /// The ID assigned to the share invitation.
  final String? shareInvitationId;

  /// The resource type of the share invitation.
  final ShareResourceType? shareResourceType;
  final String? workloadId;

  ShareInvitation({
    this.lensAlias,
    this.lensArn,
    this.shareInvitationId,
    this.shareResourceType,
    this.workloadId,
  });

  factory ShareInvitation.fromJson(Map<String, dynamic> json) {
    return ShareInvitation(
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      shareInvitationId: json['ShareInvitationId'] as String?,
      shareResourceType:
          (json['ShareResourceType'] as String?)?.toShareResourceType(),
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final shareInvitationId = this.shareInvitationId;
    final shareResourceType = this.shareResourceType;
    final workloadId = this.workloadId;
    return {
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
      if (shareInvitationId != null) 'ShareInvitationId': shareInvitationId,
      if (shareResourceType != null)
        'ShareResourceType': shareResourceType.toValue(),
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
  /// The ARN for the lens.
  final String? lensArn;
  final String? lensName;
  final PermissionType? permissionType;

  /// The ID assigned to the share invitation.
  final String? shareInvitationId;

  /// The resource type of the share invitation.
  final ShareResourceType? shareResourceType;
  final String? sharedBy;
  final String? sharedWith;
  final String? workloadId;
  final String? workloadName;

  ShareInvitationSummary({
    this.lensArn,
    this.lensName,
    this.permissionType,
    this.shareInvitationId,
    this.shareResourceType,
    this.sharedBy,
    this.sharedWith,
    this.workloadId,
    this.workloadName,
  });

  factory ShareInvitationSummary.fromJson(Map<String, dynamic> json) {
    return ShareInvitationSummary(
      lensArn: json['LensArn'] as String?,
      lensName: json['LensName'] as String?,
      permissionType: (json['PermissionType'] as String?)?.toPermissionType(),
      shareInvitationId: json['ShareInvitationId'] as String?,
      shareResourceType:
          (json['ShareResourceType'] as String?)?.toShareResourceType(),
      sharedBy: json['SharedBy'] as String?,
      sharedWith: json['SharedWith'] as String?,
      workloadId: json['WorkloadId'] as String?,
      workloadName: json['WorkloadName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lensArn = this.lensArn;
    final lensName = this.lensName;
    final permissionType = this.permissionType;
    final shareInvitationId = this.shareInvitationId;
    final shareResourceType = this.shareResourceType;
    final sharedBy = this.sharedBy;
    final sharedWith = this.sharedWith;
    final workloadId = this.workloadId;
    final workloadName = this.workloadName;
    return {
      if (lensArn != null) 'LensArn': lensArn,
      if (lensName != null) 'LensName': lensName,
      if (permissionType != null) 'PermissionType': permissionType.toValue(),
      if (shareInvitationId != null) 'ShareInvitationId': shareInvitationId,
      if (shareResourceType != null)
        'ShareResourceType': shareResourceType.toValue(),
      if (sharedBy != null) 'SharedBy': sharedBy,
      if (sharedWith != null) 'SharedWith': sharedWith,
      if (workloadId != null) 'WorkloadId': workloadId,
      if (workloadName != null) 'WorkloadName': workloadName,
    };
  }
}

enum ShareResourceType {
  workload,
  lens,
}

extension on ShareResourceType {
  String toValue() {
    switch (this) {
      case ShareResourceType.workload:
        return 'WORKLOAD';
      case ShareResourceType.lens:
        return 'LENS';
    }
  }
}

extension on String {
  ShareResourceType toShareResourceType() {
    switch (this) {
      case 'WORKLOAD':
        return ShareResourceType.workload;
      case 'LENS':
        return ShareResourceType.lens;
    }
    throw Exception('$this is not known in enum ShareResourceType');
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

  /// The ARN for the lens.
  final String? lensArn;
  final String? workloadId;

  UpdateAnswerOutput({
    this.answer,
    this.lensAlias,
    this.lensArn,
    this.workloadId,
  });

  factory UpdateAnswerOutput.fromJson(Map<String, dynamic> json) {
    return UpdateAnswerOutput(
      answer: json['Answer'] != null
          ? Answer.fromJson(json['Answer'] as Map<String, dynamic>)
          : null,
      lensAlias: json['LensAlias'] as String?,
      lensArn: json['LensArn'] as String?,
      workloadId: json['WorkloadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final answer = this.answer;
    final lensAlias = this.lensAlias;
    final lensArn = this.lensArn;
    final workloadId = this.workloadId;
    return {
      if (answer != null) 'Answer': answer,
      if (lensAlias != null) 'LensAlias': lensAlias,
      if (lensArn != null) 'LensArn': lensArn,
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
