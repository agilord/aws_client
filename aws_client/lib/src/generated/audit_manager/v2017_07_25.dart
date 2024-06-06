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

/// Welcome to the Audit Manager API reference. This guide is for developers who
/// need detailed information about the Audit Manager API operations, data
/// types, and errors.
///
/// Audit Manager is a service that provides automated evidence collection so
/// that you can continually audit your Amazon Web Services usage. You can use
/// it to assess the effectiveness of your controls, manage risk, and simplify
/// compliance.
///
/// Audit Manager provides prebuilt frameworks that structure and automate
/// assessments for a given compliance standard. Frameworks include a prebuilt
/// collection of controls with descriptions and testing procedures. These
/// controls are grouped according to the requirements of the specified
/// compliance standard or regulation. You can also customize frameworks and
/// controls to support internal audits with specific requirements.
///
/// Use the following links to get started with the Audit Manager API:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_Operations.html">Actions</a>:
/// An alphabetical list of all Audit Manager API operations.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_Types.html">Data
/// types</a>: An alphabetical list of all Audit Manager data types.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/CommonParameters.html">Common
/// parameters</a>: Parameters that all operations can use.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/CommonErrors.html">Common
/// errors</a>: Client and server errors that all operations can return.
/// </li>
/// </ul>
/// If you're new to Audit Manager, we recommend that you review the <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/what-is.html">
/// Audit Manager User Guide</a>.
class AuditManager {
  final _s.RestJsonProtocol _protocol;
  AuditManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'auditmanager',
            signingName: 'auditmanager',
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

  /// Associates an evidence folder to an assessment report in an Audit Manager
  /// assessment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the assessment.
  ///
  /// Parameter [evidenceFolderId] :
  /// The identifier for the folder that the evidence is stored in.
  Future<void> associateAssessmentReportEvidenceFolder({
    required String assessmentId,
    required String evidenceFolderId,
  }) async {
    final $payload = <String, dynamic>{
      'evidenceFolderId': evidenceFolderId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/associateToAssessmentReport',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a list of evidence to an assessment report in an Audit Manager
  /// assessment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the assessment.
  ///
  /// Parameter [evidenceFolderId] :
  /// The identifier for the folder that the evidence is stored in.
  ///
  /// Parameter [evidenceIds] :
  /// The list of evidence identifiers.
  Future<BatchAssociateAssessmentReportEvidenceResponse>
      batchAssociateAssessmentReportEvidence({
    required String assessmentId,
    required String evidenceFolderId,
    required List<String> evidenceIds,
  }) async {
    final $payload = <String, dynamic>{
      'evidenceFolderId': evidenceFolderId,
      'evidenceIds': evidenceIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/batchAssociateToAssessmentReport',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAssociateAssessmentReportEvidenceResponse.fromJson(response);
  }

  /// Creates a batch of delegations for an assessment in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the assessment.
  ///
  /// Parameter [createDelegationRequests] :
  /// The API request to batch create delegations in Audit Manager.
  Future<BatchCreateDelegationByAssessmentResponse>
      batchCreateDelegationByAssessment({
    required String assessmentId,
    required List<CreateDelegationRequest> createDelegationRequests,
  }) async {
    final $payload = <String, dynamic>{
      'createDelegationRequests': createDelegationRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/delegations',
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateDelegationByAssessmentResponse.fromJson(response);
  }

  /// Deletes a batch of delegations for an assessment in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the assessment.
  ///
  /// Parameter [delegationIds] :
  /// The identifiers for the delegations.
  Future<BatchDeleteDelegationByAssessmentResponse>
      batchDeleteDelegationByAssessment({
    required String assessmentId,
    required List<String> delegationIds,
  }) async {
    final $payload = <String, dynamic>{
      'delegationIds': delegationIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/delegations',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteDelegationByAssessmentResponse.fromJson(response);
  }

  /// Disassociates a list of evidence from an assessment report in Audit
  /// Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the assessment.
  ///
  /// Parameter [evidenceFolderId] :
  /// The identifier for the folder that the evidence is stored in.
  ///
  /// Parameter [evidenceIds] :
  /// The list of evidence identifiers.
  Future<BatchDisassociateAssessmentReportEvidenceResponse>
      batchDisassociateAssessmentReportEvidence({
    required String assessmentId,
    required String evidenceFolderId,
    required List<String> evidenceIds,
  }) async {
    final $payload = <String, dynamic>{
      'evidenceFolderId': evidenceFolderId,
      'evidenceIds': evidenceIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/batchDisassociateFromAssessmentReport',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDisassociateAssessmentReportEvidenceResponse.fromJson(response);
  }

  /// Adds one or more pieces of evidence to a control in an Audit Manager
  /// assessment.
  ///
  /// You can import manual evidence from any S3 bucket by specifying the S3 URI
  /// of the object. You can also upload a file from your browser, or enter
  /// plain text in response to a risk assessment question.
  ///
  /// The following restrictions apply to this action:
  ///
  /// <ul>
  /// <li>
  /// <code>manualEvidence</code> can be only one of the following:
  /// <code>evidenceFileName</code>, <code>s3ResourcePath</code>, or
  /// <code>textResponse</code>
  /// </li>
  /// <li>
  /// Maximum size of an individual evidence file: 100 MB
  /// </li>
  /// <li>
  /// Number of daily manual evidence uploads per control: 100
  /// </li>
  /// <li>
  /// Supported file formats: See <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/upload-evidence.html#supported-manual-evidence-files">Supported
  /// file types for manual evidence</a> in the <i>Audit Manager User Guide</i>
  /// </li>
  /// </ul>
  /// For more information about Audit Manager service restrictions, see <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/service-quotas.html">Quotas
  /// and restrictions for Audit Manager</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the assessment.
  ///
  /// Parameter [controlId] :
  /// The identifier for the control.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the control set.
  ///
  /// Parameter [manualEvidence] :
  /// The list of manual evidence objects.
  Future<BatchImportEvidenceToAssessmentControlResponse>
      batchImportEvidenceToAssessmentControl({
    required String assessmentId,
    required String controlId,
    required String controlSetId,
    required List<ManualEvidence> manualEvidence,
  }) async {
    final $payload = <String, dynamic>{
      'manualEvidence': manualEvidence,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/controlSets/${Uri.encodeComponent(controlSetId)}/controls/${Uri.encodeComponent(controlId)}/evidence',
      exceptionFnMap: _exceptionFns,
    );
    return BatchImportEvidenceToAssessmentControlResponse.fromJson(response);
  }

  /// Creates an assessment in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [assessmentReportsDestination] :
  /// The assessment report storage destination for the assessment that's being
  /// created.
  ///
  /// Parameter [frameworkId] :
  /// The identifier for the framework that the assessment will be created from.
  ///
  /// Parameter [name] :
  /// The name of the assessment to be created.
  ///
  /// Parameter [roles] :
  /// The list of roles for the assessment.
  ///
  /// Parameter [description] :
  /// The optional description of the assessment to be created.
  ///
  /// Parameter [tags] :
  /// The tags that are associated with the assessment.
  Future<CreateAssessmentResponse> createAssessment({
    required AssessmentReportsDestination assessmentReportsDestination,
    required String frameworkId,
    required String name,
    required List<Role> roles,
    required Scope scope,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'assessmentReportsDestination': assessmentReportsDestination,
      'frameworkId': frameworkId,
      'name': name,
      'roles': roles,
      'scope': scope,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assessments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssessmentResponse.fromJson(response);
  }

  /// Creates a custom framework in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [controlSets] :
  /// The control sets that are associated with the framework.
  ///
  /// Parameter [name] :
  /// The name of the new custom framework.
  ///
  /// Parameter [complianceType] :
  /// The compliance type that the new custom framework supports, such as CIS or
  /// HIPAA.
  ///
  /// Parameter [description] :
  /// An optional description for the new custom framework.
  ///
  /// Parameter [tags] :
  /// The tags that are associated with the framework.
  Future<CreateAssessmentFrameworkResponse> createAssessmentFramework({
    required List<CreateAssessmentFrameworkControlSet> controlSets,
    required String name,
    String? complianceType,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'controlSets': controlSets,
      'name': name,
      if (complianceType != null) 'complianceType': complianceType,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assessmentFrameworks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssessmentFrameworkResponse.fromJson(response);
  }

  /// Creates an assessment report for the specified assessment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the assessment.
  ///
  /// Parameter [name] :
  /// The name of the new assessment report.
  ///
  /// Parameter [description] :
  /// The description of the assessment report.
  ///
  /// Parameter [queryStatement] :
  /// A SQL statement that represents an evidence finder query.
  ///
  /// Provide this parameter when you want to generate an assessment report from
  /// the results of an evidence finder search query. When you use this
  /// parameter, Audit Manager generates a one-time report using only the
  /// evidence from the query output. This report does not include any
  /// assessment evidence that was manually <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/generate-assessment-report.html#generate-assessment-report-include-evidence">added
  /// to a report using the console</a>, or <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_BatchAssociateAssessmentReportEvidence.html">associated
  /// with a report using the API</a>.
  ///
  /// To use this parameter, the <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_EvidenceFinderEnablement.html#auditmanager-Type-EvidenceFinderEnablement-enablementStatus">enablementStatus</a>
  /// of evidence finder must be <code>ENABLED</code>.
  ///
  /// For examples and help resolving <code>queryStatement</code> validation
  /// exceptions, see <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/evidence-finder-issues.html#querystatement-exceptions">Troubleshooting
  /// evidence finder issues</a> in the <i>Audit Manager User Guide.</i>
  Future<CreateAssessmentReportResponse> createAssessmentReport({
    required String assessmentId,
    required String name,
    String? description,
    String? queryStatement,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (description != null) 'description': description,
      if (queryStatement != null) 'queryStatement': queryStatement,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assessments/${Uri.encodeComponent(assessmentId)}/reports',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssessmentReportResponse.fromJson(response);
  }

  /// Creates a new custom control in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [controlMappingSources] :
  /// The data mapping sources for the control.
  ///
  /// Parameter [name] :
  /// The name of the control.
  ///
  /// Parameter [actionPlanInstructions] :
  /// The recommended actions to carry out if the control isn't fulfilled.
  ///
  /// Parameter [actionPlanTitle] :
  /// The title of the action plan for remediating the control.
  ///
  /// Parameter [description] :
  /// The description of the control.
  ///
  /// Parameter [tags] :
  /// The tags that are associated with the control.
  ///
  /// Parameter [testingInformation] :
  /// The steps to follow to determine if the control is satisfied.
  Future<CreateControlResponse> createControl({
    required List<CreateControlMappingSource> controlMappingSources,
    required String name,
    String? actionPlanInstructions,
    String? actionPlanTitle,
    String? description,
    Map<String, String>? tags,
    String? testingInformation,
  }) async {
    final $payload = <String, dynamic>{
      'controlMappingSources': controlMappingSources,
      'name': name,
      if (actionPlanInstructions != null)
        'actionPlanInstructions': actionPlanInstructions,
      if (actionPlanTitle != null) 'actionPlanTitle': actionPlanTitle,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (testingInformation != null) 'testingInformation': testingInformation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/controls',
      exceptionFnMap: _exceptionFns,
    );
    return CreateControlResponse.fromJson(response);
  }

  /// Deletes an assessment in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the assessment.
  Future<void> deleteAssessment({
    required String assessmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assessments/${Uri.encodeComponent(assessmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a custom framework in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [frameworkId] :
  /// The identifier for the custom framework.
  Future<void> deleteAssessmentFramework({
    required String frameworkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assessmentFrameworks/${Uri.encodeComponent(frameworkId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a share request for a custom framework in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [requestId] :
  /// The unique identifier for the share request to be deleted.
  ///
  /// Parameter [requestType] :
  /// Specifies whether the share request is a sent request or a received
  /// request.
  Future<void> deleteAssessmentFrameworkShare({
    required String requestId,
    required ShareRequestType requestType,
  }) async {
    final $query = <String, List<String>>{
      'requestType': [requestType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assessmentFrameworkShareRequests/${Uri.encodeComponent(requestId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an assessment report in Audit Manager.
  ///
  /// When you run the <code>DeleteAssessmentReport</code> operation, Audit
  /// Manager attempts to delete the following data:
  /// <ol>
  /// <li>
  /// The specified assessment report that’s stored in your S3 bucket
  /// </li>
  /// <li>
  /// The associated metadata that’s stored in Audit Manager
  /// </li> </ol>
  /// If Audit Manager can’t access the assessment report in your S3 bucket, the
  /// report isn’t deleted. In this event, the
  /// <code>DeleteAssessmentReport</code> operation doesn’t fail. Instead, it
  /// proceeds to delete the associated metadata only. You must then delete the
  /// assessment report from the S3 bucket yourself.
  ///
  /// This scenario happens when Audit Manager receives a <code>403
  /// (Forbidden)</code> or <code>404 (Not Found)</code> error from Amazon S3.
  /// To avoid this, make sure that your S3 bucket is available, and that you
  /// configured the correct permissions for Audit Manager to delete resources
  /// in your S3 bucket. For an example permissions policy that you can use, see
  /// <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/security_iam_id-based-policy-examples.html#full-administrator-access-assessment-report-destination">Assessment
  /// report destination permissions</a> in the <i>Audit Manager User Guide</i>.
  /// For information about the issues that could cause a <code>403
  /// (Forbidden)</code> or <code>404 (Not Found</code>) error from Amazon S3,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html#ErrorCodeList">List
  /// of Error Codes</a> in the <i>Amazon Simple Storage Service API
  /// Reference</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [assessmentReportId] :
  /// The unique identifier for the assessment report.
  Future<void> deleteAssessmentReport({
    required String assessmentId,
    required String assessmentReportId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/reports/${Uri.encodeComponent(assessmentReportId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a custom control in Audit Manager.
  /// <important>
  /// When you invoke this operation, the custom control is deleted from any
  /// frameworks or assessments that it’s currently part of. As a result, Audit
  /// Manager will stop collecting evidence for that custom control in all of
  /// your assessments. This includes assessments that you previously created
  /// before you deleted the custom control.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlId] :
  /// The unique identifier for the control.
  Future<void> deleteControl({
    required String controlId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/controls/${Uri.encodeComponent(controlId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deregisters an account in Audit Manager.
  /// <note>
  /// Before you deregister, you can use the <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_UpdateSettings.html">UpdateSettings</a>
  /// API operation to set your preferred data retention policy. By default,
  /// Audit Manager retains your data. If you want to delete your data, you can
  /// use the <code>DeregistrationPolicy</code> attribute to request the
  /// deletion of your data.
  ///
  /// For more information about data retention, see <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/data-protection.html">Data
  /// Protection</a> in the <i>Audit Manager User Guide</i>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  Future<DeregisterAccountResponse> deregisterAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/account/deregisterAccount',
      exceptionFnMap: _exceptionFns,
    );
    return DeregisterAccountResponse.fromJson(response);
  }

  /// Removes the specified Amazon Web Services account as a delegated
  /// administrator for Audit Manager.
  ///
  /// When you remove a delegated administrator from your Audit Manager
  /// settings, you continue to have access to the evidence that you previously
  /// collected under that account. This is also the case when you deregister a
  /// delegated administrator from Organizations. However, Audit Manager stops
  /// collecting and attaching evidence to that delegated administrator account
  /// moving forward.
  /// <important>
  /// Keep in mind the following cleanup task if you use evidence finder:
  ///
  /// Before you use your management account to remove a delegated
  /// administrator, make sure that the current delegated administrator account
  /// signs in to Audit Manager and disables evidence finder first. Disabling
  /// evidence finder automatically deletes the event data store that was
  /// created in their account when they enabled evidence finder. If this task
  /// isn’t completed, the event data store remains in their account. In this
  /// case, we recommend that the original delegated administrator goes to
  /// CloudTrail Lake and manually <a
  /// href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-eds-disable-termination.html">deletes
  /// the event data store</a>.
  ///
  /// This cleanup task is necessary to ensure that you don't end up with
  /// multiple event data stores. Audit Manager ignores an unused event data
  /// store after you remove or change a delegated administrator account.
  /// However, the unused event data store continues to incur storage costs from
  /// CloudTrail Lake if you don't delete it.
  /// </important>
  /// When you deregister a delegated administrator account for Audit Manager,
  /// the data for that account isn’t deleted. If you want to delete resource
  /// data for a delegated administrator account, you must perform that task
  /// separately before you deregister the account. Either, you can do this in
  /// the Audit Manager console. Or, you can use one of the delete API
  /// operations that are provided by Audit Manager.
  ///
  /// To delete your Audit Manager resource data, see the following
  /// instructions:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_DeleteAssessment.html">DeleteAssessment</a>
  /// (see also: <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/delete-assessment.html">Deleting
  /// an assessment</a> in the <i>Audit Manager User Guide</i>)
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_DeleteAssessmentFramework.html">DeleteAssessmentFramework</a>
  /// (see also: <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/delete-custom-framework.html">Deleting
  /// a custom framework</a> in the <i>Audit Manager User Guide</i>)
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_DeleteAssessmentFrameworkShare.html">DeleteAssessmentFrameworkShare</a>
  /// (see also: <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/deleting-shared-framework-requests.html">Deleting
  /// a share request</a> in the <i>Audit Manager User Guide</i>)
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_DeleteAssessmentReport.html">DeleteAssessmentReport</a>
  /// (see also: <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/generate-assessment-report.html#delete-assessment-report-steps">Deleting
  /// an assessment report</a> in the <i>Audit Manager User Guide</i>)
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_DeleteControl.html">DeleteControl</a>
  /// (see also: <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/delete-controls.html">Deleting
  /// a custom control</a> in the <i>Audit Manager User Guide</i>)
  /// </li>
  /// </ul>
  /// At this time, Audit Manager doesn't provide an option to delete evidence
  /// for a specific delegated administrator. Instead, when your management
  /// account deregisters Audit Manager, we perform a cleanup for the current
  /// delegated administrator account at the time of deregistration.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [adminAccountId] :
  /// The identifier for the administrator account.
  Future<void> deregisterOrganizationAdminAccount({
    String? adminAccountId,
  }) async {
    final $payload = <String, dynamic>{
      if (adminAccountId != null) 'adminAccountId': adminAccountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/account/deregisterOrganizationAdminAccount',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates an evidence folder from the specified assessment report in
  /// Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [evidenceFolderId] :
  /// The unique identifier for the folder that the evidence is stored in.
  Future<void> disassociateAssessmentReportEvidenceFolder({
    required String assessmentId,
    required String evidenceFolderId,
  }) async {
    final $payload = <String, dynamic>{
      'evidenceFolderId': evidenceFolderId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/disassociateFromAssessmentReport',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the registration status of an account in Audit Manager.
  ///
  /// May throw [InternalServerException].
  Future<GetAccountStatusResponse> getAccountStatus() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/account/status',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountStatusResponse.fromJson(response);
  }

  /// Gets information about a specified assessment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  Future<GetAssessmentResponse> getAssessment({
    required String assessmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assessments/${Uri.encodeComponent(assessmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssessmentResponse.fromJson(response);
  }

  /// Gets information about a specified framework.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [frameworkId] :
  /// The identifier for the framework.
  Future<GetAssessmentFrameworkResponse> getAssessmentFramework({
    required String frameworkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assessmentFrameworks/${Uri.encodeComponent(frameworkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssessmentFrameworkResponse.fromJson(response);
  }

  /// Gets the URL of an assessment report in Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [assessmentReportId] :
  /// The unique identifier for the assessment report.
  Future<GetAssessmentReportUrlResponse> getAssessmentReportUrl({
    required String assessmentId,
    required String assessmentReportId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/reports/${Uri.encodeComponent(assessmentReportId)}/url',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssessmentReportUrlResponse.fromJson(response);
  }

  /// Gets a list of changelogs from Audit Manager.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [controlId] :
  /// The unique identifier for the control.
  ///
  /// Parameter [controlSetId] :
  /// The unique identifier for the control set.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<GetChangeLogsResponse> getChangeLogs({
    required String assessmentId,
    String? controlId,
    String? controlSetId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (controlId != null) 'controlId': [controlId],
      if (controlSetId != null) 'controlSetId': [controlSetId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/changelogs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetChangeLogsResponse.fromJson(response);
  }

  /// Gets information about a specified control.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlId] :
  /// The identifier for the control.
  Future<GetControlResponse> getControl({
    required String controlId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/controls/${Uri.encodeComponent(controlId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetControlResponse.fromJson(response);
  }

  /// Gets a list of delegations from an audit owner to a delegate.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<GetDelegationsResponse> getDelegations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/delegations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDelegationsResponse.fromJson(response);
  }

  /// Gets information about a specified evidence item.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [controlSetId] :
  /// The unique identifier for the control set.
  ///
  /// Parameter [evidenceFolderId] :
  /// The unique identifier for the folder that the evidence is stored in.
  ///
  /// Parameter [evidenceId] :
  /// The unique identifier for the evidence.
  Future<GetEvidenceResponse> getEvidence({
    required String assessmentId,
    required String controlSetId,
    required String evidenceFolderId,
    required String evidenceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/controlSets/${Uri.encodeComponent(controlSetId)}/evidenceFolders/${Uri.encodeComponent(evidenceFolderId)}/evidence/${Uri.encodeComponent(evidenceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEvidenceResponse.fromJson(response);
  }

  /// Gets all evidence from a specified evidence folder in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the assessment.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the control set.
  ///
  /// Parameter [evidenceFolderId] :
  /// The unique identifier for the folder that the evidence is stored in.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<GetEvidenceByEvidenceFolderResponse> getEvidenceByEvidenceFolder({
    required String assessmentId,
    required String controlSetId,
    required String evidenceFolderId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/controlSets/${Uri.encodeComponent(controlSetId)}/evidenceFolders/${Uri.encodeComponent(evidenceFolderId)}/evidence',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetEvidenceByEvidenceFolderResponse.fromJson(response);
  }

  /// Creates a presigned Amazon S3 URL that can be used to upload a file as
  /// manual evidence. For instructions on how to use this operation, see <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/upload-evidence.html#how-to-upload-manual-evidence-files">Upload
  /// a file from your browser </a> in the <i>Audit Manager User Guide</i>.
  ///
  /// The following restrictions apply to this operation:
  ///
  /// <ul>
  /// <li>
  /// Maximum size of an individual evidence file: 100 MB
  /// </li>
  /// <li>
  /// Number of daily manual evidence uploads per control: 100
  /// </li>
  /// <li>
  /// Supported file formats: See <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/upload-evidence.html#supported-manual-evidence-files">Supported
  /// file types for manual evidence</a> in the <i>Audit Manager User Guide</i>
  /// </li>
  /// </ul>
  /// For more information about Audit Manager service restrictions, see <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/service-quotas.html">Quotas
  /// and restrictions for Audit Manager</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [fileName] :
  /// The file that you want to upload. For a list of supported file formats,
  /// see <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/upload-evidence.html#supported-manual-evidence-files">Supported
  /// file types for manual evidence</a> in the <i>Audit Manager User Guide</i>.
  Future<GetEvidenceFileUploadUrlResponse> getEvidenceFileUploadUrl({
    required String fileName,
  }) async {
    final $query = <String, List<String>>{
      'fileName': [fileName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/evidenceFileUploadUrl',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetEvidenceFileUploadUrlResponse.fromJson(response);
  }

  /// Gets an evidence folder from a specified assessment in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [controlSetId] :
  /// The unique identifier for the control set.
  ///
  /// Parameter [evidenceFolderId] :
  /// The unique identifier for the folder that the evidence is stored in.
  Future<GetEvidenceFolderResponse> getEvidenceFolder({
    required String assessmentId,
    required String controlSetId,
    required String evidenceFolderId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/controlSets/${Uri.encodeComponent(controlSetId)}/evidenceFolders/${Uri.encodeComponent(evidenceFolderId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEvidenceFolderResponse.fromJson(response);
  }

  /// Gets the evidence folders from a specified assessment in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<GetEvidenceFoldersByAssessmentResponse>
      getEvidenceFoldersByAssessment({
    required String assessmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/evidenceFolders',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetEvidenceFoldersByAssessmentResponse.fromJson(response);
  }

  /// Gets a list of evidence folders that are associated with a specified
  /// control in an Audit Manager assessment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the assessment.
  ///
  /// Parameter [controlId] :
  /// The identifier for the control.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the control set.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<GetEvidenceFoldersByAssessmentControlResponse>
      getEvidenceFoldersByAssessmentControl({
    required String assessmentId,
    required String controlId,
    required String controlSetId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/evidenceFolders-by-assessment-control/${Uri.encodeComponent(controlSetId)}/${Uri.encodeComponent(controlId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetEvidenceFoldersByAssessmentControlResponse.fromJson(response);
  }

  /// Gets the latest analytics data for all your current active assessments.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<GetInsightsResponse> getInsights() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/insights',
      exceptionFnMap: _exceptionFns,
    );
    return GetInsightsResponse.fromJson(response);
  }

  /// Gets the latest analytics data for a specific active assessment.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  Future<GetInsightsByAssessmentResponse> getInsightsByAssessment({
    required String assessmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/insights/assessments/${Uri.encodeComponent(assessmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetInsightsByAssessmentResponse.fromJson(response);
  }

  /// Gets the name of the delegated Amazon Web Services administrator account
  /// for a specified organization.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  Future<GetOrganizationAdminAccountResponse>
      getOrganizationAdminAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/account/organizationAdminAccount',
      exceptionFnMap: _exceptionFns,
    );
    return GetOrganizationAdminAccountResponse.fromJson(response);
  }

  /// Gets a list of all of the Amazon Web Services that you can choose to
  /// include in your assessment. When you <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_CreateAssessment.html">create
  /// an assessment</a>, specify which of these services you want to include to
  /// narrow the assessment's <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_Scope.html">scope</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  Future<GetServicesInScopeResponse> getServicesInScope() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/services',
      exceptionFnMap: _exceptionFns,
    );
    return GetServicesInScopeResponse.fromJson(response);
  }

  /// Gets the settings for a specified Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attribute] :
  /// The list of setting attribute enum values.
  Future<GetSettingsResponse> getSettings({
    required SettingAttribute attribute,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/settings/${Uri.encodeComponent(attribute.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSettingsResponse.fromJson(response);
  }

  /// Lists the latest analytics data for controls within a specific control
  /// domain and a specific active assessment.
  /// <note>
  /// Control insights are listed only if the control belongs to the control
  /// domain and assessment that was specified. Moreover, the control must have
  /// collected evidence on the <code>lastUpdated</code> date of
  /// <code>controlInsightsByAssessment</code>. If neither of these conditions
  /// are met, no data is listed for that control.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the active assessment.
  ///
  /// Parameter [controlDomainId] :
  /// The unique identifier for the control domain.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListAssessmentControlInsightsByControlDomainResponse>
      listAssessmentControlInsightsByControlDomain({
    required String assessmentId,
    required String controlDomainId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'assessmentId': [assessmentId],
      'controlDomainId': [controlDomainId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/insights/controls-by-assessment',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssessmentControlInsightsByControlDomainResponse.fromJson(
        response);
  }

  /// Returns a list of sent or received share requests for custom frameworks in
  /// Audit Manager.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [requestType] :
  /// Specifies whether the share request is a sent request or a received
  /// request.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListAssessmentFrameworkShareRequestsResponse>
      listAssessmentFrameworkShareRequests({
    required ShareRequestType requestType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'requestType': [requestType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assessmentFrameworkShareRequests',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssessmentFrameworkShareRequestsResponse.fromJson(response);
  }

  /// Returns a list of the frameworks that are available in the Audit Manager
  /// framework library.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [frameworkType] :
  /// The type of framework, such as a standard framework or a custom framework.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListAssessmentFrameworksResponse> listAssessmentFrameworks({
    required FrameworkType frameworkType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'frameworkType': [frameworkType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assessmentFrameworks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssessmentFrameworksResponse.fromJson(response);
  }

  /// Returns a list of assessment reports created in Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListAssessmentReportsResponse> listAssessmentReports({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assessmentReports',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssessmentReportsResponse.fromJson(response);
  }

  /// Returns a list of current and past assessments from Audit Manager.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  ///
  /// Parameter [status] :
  /// The current status of the assessment.
  Future<ListAssessmentsResponse> listAssessments({
    int? maxResults,
    String? nextToken,
    AssessmentStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assessments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssessmentsResponse.fromJson(response);
  }

  /// Lists the latest analytics data for control domains across all of your
  /// active assessments.
  /// <note>
  /// A control domain is listed only if at least one of the controls within
  /// that domain collected evidence on the <code>lastUpdated</code> date of
  /// <code>controlDomainInsights</code>. If this condition isn’t met, no data
  /// is listed for that control domain.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListControlDomainInsightsResponse> listControlDomainInsights({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/insights/control-domains',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListControlDomainInsightsResponse.fromJson(response);
  }

  /// Lists analytics data for control domains within a specified active
  /// assessment.
  /// <note>
  /// A control domain is listed only if at least one of the controls within
  /// that domain collected evidence on the <code>lastUpdated</code> date of
  /// <code>controlDomainInsights</code>. If this condition isn’t met, no data
  /// is listed for that domain.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the active assessment.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListControlDomainInsightsByAssessmentResponse>
      listControlDomainInsightsByAssessment({
    required String assessmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'assessmentId': [assessmentId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/insights/control-domains-by-assessment',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListControlDomainInsightsByAssessmentResponse.fromJson(response);
  }

  /// Lists the latest analytics data for controls within a specific control
  /// domain across all active assessments.
  /// <note>
  /// Control insights are listed only if the control belongs to the control
  /// domain that was specified and the control collected evidence on the
  /// <code>lastUpdated</code> date of <code>controlInsightsMetadata</code>. If
  /// neither of these conditions are met, no data is listed for that control.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [controlDomainId] :
  /// The unique identifier for the control domain.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListControlInsightsByControlDomainResponse>
      listControlInsightsByControlDomain({
    required String controlDomainId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'controlDomainId': [controlDomainId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/insights/controls',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListControlInsightsByControlDomainResponse.fromJson(response);
  }

  /// Returns a list of controls from Audit Manager.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlType] :
  /// The type of control, such as a standard control or a custom control.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListControlsResponse> listControls({
    required ControlType controlType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'controlType': [controlType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/controls',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListControlsResponse.fromJson(response);
  }

  /// Returns a list of keywords that are pre-mapped to the specified control
  /// data source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [source] :
  /// The control mapping data source that the keywords apply to.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListKeywordsForDataSourceResponse> listKeywordsForDataSource({
    required SourceType source,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'source': [source.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dataSourceKeywords',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListKeywordsForDataSourceResponse.fromJson(response);
  }

  /// Returns a list of all Audit Manager notifications.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results on a page or for an API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that's used to fetch the next set of results.
  Future<ListNotificationsResponse> listNotifications({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/notifications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNotificationsResponse.fromJson(response);
  }

  /// Returns a list of tags for the specified resource in Audit Manager.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Enables Audit Manager for the specified Amazon Web Services account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [delegatedAdminAccount] :
  /// The delegated administrator account for Audit Manager.
  ///
  /// Parameter [kmsKey] :
  /// The KMS key details.
  Future<RegisterAccountResponse> registerAccount({
    String? delegatedAdminAccount,
    String? kmsKey,
  }) async {
    final $payload = <String, dynamic>{
      if (delegatedAdminAccount != null)
        'delegatedAdminAccount': delegatedAdminAccount,
      if (kmsKey != null) 'kmsKey': kmsKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/account/registerAccount',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterAccountResponse.fromJson(response);
  }

  /// Enables an Amazon Web Services account within the organization as the
  /// delegated administrator for Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [adminAccountId] :
  /// The identifier for the delegated administrator account.
  Future<RegisterOrganizationAdminAccountResponse>
      registerOrganizationAdminAccount({
    required String adminAccountId,
  }) async {
    final $payload = <String, dynamic>{
      'adminAccountId': adminAccountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/account/registerOrganizationAdminAccount',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterOrganizationAdminAccountResponse.fromJson(response);
  }

  /// Creates a share request for a custom framework in Audit Manager.
  ///
  /// The share request specifies a recipient and notifies them that a custom
  /// framework is available. Recipients have 120 days to accept or decline the
  /// request. If no action is taken, the share request expires.
  ///
  /// When you create a share request, Audit Manager stores a snapshot of your
  /// custom framework in the US East (N. Virginia) Amazon Web Services Region.
  /// Audit Manager also stores a backup of the same snapshot in the US West
  /// (Oregon) Amazon Web Services Region.
  ///
  /// Audit Manager deletes the snapshot and the backup snapshot when one of the
  /// following events occurs:
  ///
  /// <ul>
  /// <li>
  /// The sender revokes the share request.
  /// </li>
  /// <li>
  /// The recipient declines the share request.
  /// </li>
  /// <li>
  /// The recipient encounters an error and doesn't successfully accept the
  /// share request.
  /// </li>
  /// <li>
  /// The share request expires before the recipient responds to the request.
  /// </li>
  /// </ul>
  /// When a sender <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/framework-sharing.html#framework-sharing-resend">resends
  /// a share request</a>, the snapshot is replaced with an updated version that
  /// corresponds with the latest version of the custom framework.
  ///
  /// When a recipient accepts a share request, the snapshot is replicated into
  /// their Amazon Web Services account under the Amazon Web Services Region
  /// that was specified in the share request.
  /// <important>
  /// When you invoke the <code>StartAssessmentFrameworkShare</code> API, you
  /// are about to share a custom framework with another Amazon Web Services
  /// account. You may not share a custom framework that is derived from a
  /// standard framework if the standard framework is designated as not eligible
  /// for sharing by Amazon Web Services, unless you have obtained permission to
  /// do so from the owner of the standard framework. To learn more about which
  /// standard frameworks are eligible for sharing, see <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/share-custom-framework-concepts-and-terminology.html#eligibility">Framework
  /// sharing eligibility</a> in the <i>Audit Manager User Guide</i>.
  /// </important>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [destinationAccount] :
  /// The Amazon Web Services account of the recipient.
  ///
  /// Parameter [destinationRegion] :
  /// The Amazon Web Services Region of the recipient.
  ///
  /// Parameter [frameworkId] :
  /// The unique identifier for the custom framework to be shared.
  ///
  /// Parameter [comment] :
  /// An optional comment from the sender about the share request.
  Future<StartAssessmentFrameworkShareResponse> startAssessmentFrameworkShare({
    required String destinationAccount,
    required String destinationRegion,
    required String frameworkId,
    String? comment,
  }) async {
    final $payload = <String, dynamic>{
      'destinationAccount': destinationAccount,
      'destinationRegion': destinationRegion,
      if (comment != null) 'comment': comment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/assessmentFrameworks/${Uri.encodeComponent(frameworkId)}/shareRequests',
      exceptionFnMap: _exceptionFns,
    );
    return StartAssessmentFrameworkShareResponse.fromJson(response);
  }

  /// Tags the specified resource in Audit Manager.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags that are associated with the resource.
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

  /// Removes a tag from a resource in Audit Manager.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the specified resource.
  ///
  /// Parameter [tagKeys] :
  /// The name or key of the tag.
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

  /// Edits an Audit Manager assessment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [scope] :
  /// The scope of the assessment.
  ///
  /// Parameter [assessmentDescription] :
  /// The description of the assessment.
  ///
  /// Parameter [assessmentName] :
  /// The name of the assessment to be updated.
  ///
  /// Parameter [assessmentReportsDestination] :
  /// The assessment report storage destination for the assessment that's being
  /// updated.
  ///
  /// Parameter [roles] :
  /// The list of roles for the assessment.
  Future<UpdateAssessmentResponse> updateAssessment({
    required String assessmentId,
    required Scope scope,
    String? assessmentDescription,
    String? assessmentName,
    AssessmentReportsDestination? assessmentReportsDestination,
    List<Role>? roles,
  }) async {
    final $payload = <String, dynamic>{
      'scope': scope,
      if (assessmentDescription != null)
        'assessmentDescription': assessmentDescription,
      if (assessmentName != null) 'assessmentName': assessmentName,
      if (assessmentReportsDestination != null)
        'assessmentReportsDestination': assessmentReportsDestination,
      if (roles != null) 'roles': roles,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/assessments/${Uri.encodeComponent(assessmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssessmentResponse.fromJson(response);
  }

  /// Updates a control within an assessment in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [controlId] :
  /// The unique identifier for the control.
  ///
  /// Parameter [controlSetId] :
  /// The unique identifier for the control set.
  ///
  /// Parameter [commentBody] :
  /// The comment body text for the control.
  ///
  /// Parameter [controlStatus] :
  /// The status of the control.
  Future<UpdateAssessmentControlResponse> updateAssessmentControl({
    required String assessmentId,
    required String controlId,
    required String controlSetId,
    String? commentBody,
    ControlStatus? controlStatus,
  }) async {
    final $payload = <String, dynamic>{
      if (commentBody != null) 'commentBody': commentBody,
      if (controlStatus != null) 'controlStatus': controlStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/controlSets/${Uri.encodeComponent(controlSetId)}/controls/${Uri.encodeComponent(controlId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssessmentControlResponse.fromJson(response);
  }

  /// Updates the status of a control set in an Audit Manager assessment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [comment] :
  /// The comment that's related to the status update.
  ///
  /// Parameter [controlSetId] :
  /// The unique identifier for the control set.
  ///
  /// Parameter [status] :
  /// The status of the control set that's being updated.
  Future<UpdateAssessmentControlSetStatusResponse>
      updateAssessmentControlSetStatus({
    required String assessmentId,
    required String comment,
    required String controlSetId,
    required ControlSetStatus status,
  }) async {
    final $payload = <String, dynamic>{
      'comment': comment,
      'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/controlSets/${Uri.encodeComponent(controlSetId)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssessmentControlSetStatusResponse.fromJson(response);
  }

  /// Updates a custom framework in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlSets] :
  /// The control sets that are associated with the framework.
  ///
  /// Parameter [frameworkId] :
  /// The unique identifier for the framework.
  ///
  /// Parameter [name] :
  /// The name of the framework to be updated.
  ///
  /// Parameter [complianceType] :
  /// The compliance type that the new custom framework supports, such as CIS or
  /// HIPAA.
  ///
  /// Parameter [description] :
  /// The description of the updated framework.
  Future<UpdateAssessmentFrameworkResponse> updateAssessmentFramework({
    required List<UpdateAssessmentFrameworkControlSet> controlSets,
    required String frameworkId,
    required String name,
    String? complianceType,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'controlSets': controlSets,
      'name': name,
      if (complianceType != null) 'complianceType': complianceType,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/assessmentFrameworks/${Uri.encodeComponent(frameworkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssessmentFrameworkResponse.fromJson(response);
  }

  /// Updates a share request for a custom framework in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [action] :
  /// Specifies the update action for the share request.
  ///
  /// Parameter [requestId] :
  /// The unique identifier for the share request.
  ///
  /// Parameter [requestType] :
  /// Specifies whether the share request is a sent request or a received
  /// request.
  Future<UpdateAssessmentFrameworkShareResponse>
      updateAssessmentFrameworkShare({
    required ShareRequestAction action,
    required String requestId,
    required ShareRequestType requestType,
  }) async {
    final $payload = <String, dynamic>{
      'action': action.toValue(),
      'requestType': requestType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/assessmentFrameworkShareRequests/${Uri.encodeComponent(requestId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssessmentFrameworkShareResponse.fromJson(response);
  }

  /// Updates the status of an assessment in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the assessment.
  ///
  /// Parameter [status] :
  /// The current status of the assessment.
  Future<UpdateAssessmentStatusResponse> updateAssessmentStatus({
    required String assessmentId,
    required AssessmentStatus status,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/assessments/${Uri.encodeComponent(assessmentId)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssessmentStatusResponse.fromJson(response);
  }

  /// Updates a custom control in Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlId] :
  /// The identifier for the control.
  ///
  /// Parameter [controlMappingSources] :
  /// The data mapping sources for the control.
  ///
  /// Parameter [name] :
  /// The name of the updated control.
  ///
  /// Parameter [actionPlanInstructions] :
  /// The recommended actions to carry out if the control isn't fulfilled.
  ///
  /// Parameter [actionPlanTitle] :
  /// The title of the action plan for remediating the control.
  ///
  /// Parameter [description] :
  /// The optional description of the control.
  ///
  /// Parameter [testingInformation] :
  /// The steps that you should follow to determine if the control is met.
  Future<UpdateControlResponse> updateControl({
    required String controlId,
    required List<ControlMappingSource> controlMappingSources,
    required String name,
    String? actionPlanInstructions,
    String? actionPlanTitle,
    String? description,
    String? testingInformation,
  }) async {
    final $payload = <String, dynamic>{
      'controlMappingSources': controlMappingSources,
      'name': name,
      if (actionPlanInstructions != null)
        'actionPlanInstructions': actionPlanInstructions,
      if (actionPlanTitle != null) 'actionPlanTitle': actionPlanTitle,
      if (description != null) 'description': description,
      if (testingInformation != null) 'testingInformation': testingInformation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/controls/${Uri.encodeComponent(controlId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateControlResponse.fromJson(response);
  }

  /// Updates Audit Manager settings for the current account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [defaultAssessmentReportsDestination] :
  /// The default S3 destination bucket for storing assessment reports.
  ///
  /// Parameter [defaultExportDestination] :
  /// The default S3 destination bucket for storing evidence finder exports.
  ///
  /// Parameter [defaultProcessOwners] :
  /// A list of the default audit owners.
  ///
  /// Parameter [deregistrationPolicy] :
  /// The deregistration policy for your Audit Manager data. You can use this
  /// attribute to determine how your data is handled when you deregister Audit
  /// Manager.
  ///
  /// Parameter [evidenceFinderEnabled] :
  /// Specifies whether the evidence finder feature is enabled. Change this
  /// attribute to enable or disable evidence finder.
  /// <important>
  /// When you use this attribute to disable evidence finder, Audit Manager
  /// deletes the event data store that’s used to query your evidence data. As a
  /// result, you can’t re-enable evidence finder and use the feature again.
  /// Your only alternative is to <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_DeregisterAccount.html">deregister</a>
  /// and then <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_RegisterAccount.html">re-register</a>
  /// Audit Manager.
  /// </important>
  ///
  /// Parameter [kmsKey] :
  /// The KMS key details.
  ///
  /// Parameter [snsTopic] :
  /// The Amazon Simple Notification Service (Amazon SNS) topic that Audit
  /// Manager sends notifications to.
  Future<UpdateSettingsResponse> updateSettings({
    AssessmentReportsDestination? defaultAssessmentReportsDestination,
    DefaultExportDestination? defaultExportDestination,
    List<Role>? defaultProcessOwners,
    DeregistrationPolicy? deregistrationPolicy,
    bool? evidenceFinderEnabled,
    String? kmsKey,
    String? snsTopic,
  }) async {
    final $payload = <String, dynamic>{
      if (defaultAssessmentReportsDestination != null)
        'defaultAssessmentReportsDestination':
            defaultAssessmentReportsDestination,
      if (defaultExportDestination != null)
        'defaultExportDestination': defaultExportDestination,
      if (defaultProcessOwners != null)
        'defaultProcessOwners': defaultProcessOwners,
      if (deregistrationPolicy != null)
        'deregistrationPolicy': deregistrationPolicy,
      if (evidenceFinderEnabled != null)
        'evidenceFinderEnabled': evidenceFinderEnabled,
      if (kmsKey != null) 'kmsKey': kmsKey,
      if (snsTopic != null) 'snsTopic': snsTopic,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/settings',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSettingsResponse.fromJson(response);
  }

  /// Validates the integrity of an assessment report in Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [s3RelativePath] :
  /// The relative path of the Amazon S3 bucket that the assessment report is
  /// stored in.
  Future<ValidateAssessmentReportIntegrityResponse>
      validateAssessmentReportIntegrity({
    required String s3RelativePath,
  }) async {
    final $payload = <String, dynamic>{
      's3RelativePath': s3RelativePath,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assessmentReports/integrity',
      exceptionFnMap: _exceptionFns,
    );
    return ValidateAssessmentReportIntegrityResponse.fromJson(response);
  }
}

/// The wrapper of Amazon Web Services account details, such as account ID or
/// email address.
class AWSAccount {
  /// The email address that's associated with the Amazon Web Services account.
  final String? emailAddress;

  /// The identifier for the Amazon Web Services account.
  final String? id;

  /// The name of the Amazon Web Services account.
  final String? name;

  AWSAccount({
    this.emailAddress,
    this.id,
    this.name,
  });

  factory AWSAccount.fromJson(Map<String, dynamic> json) {
    return AWSAccount(
      emailAddress: json['emailAddress'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final id = this.id;
    final name = this.name;
    return {
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

/// An Amazon Web Service such as Amazon S3 or CloudTrail.
///
/// For an example of how to find an Amazon Web Service name and how to define
/// it in your assessment scope, see the following:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_GetServicesInScope.html#API_GetServicesInScope_Example_2">Finding
/// an Amazon Web Service name to use in your assessment scope</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_GetServicesInScope.html#API_GetServicesInScope_Example_3">Defining
/// an Amazon Web Service name in your assessment scope</a>
/// </li>
/// </ul>
class AWSService {
  /// The name of the Amazon Web Service.
  final String? serviceName;

  AWSService({
    this.serviceName,
  });

  factory AWSService.fromJson(Map<String, dynamic> json) {
    return AWSService(
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    return {
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

enum AccountStatus {
  active,
  inactive,
  pendingActivation,
}

extension AccountStatusValueExtension on AccountStatus {
  String toValue() {
    switch (this) {
      case AccountStatus.active:
        return 'ACTIVE';
      case AccountStatus.inactive:
        return 'INACTIVE';
      case AccountStatus.pendingActivation:
        return 'PENDING_ACTIVATION';
    }
  }
}

extension AccountStatusFromString on String {
  AccountStatus toAccountStatus() {
    switch (this) {
      case 'ACTIVE':
        return AccountStatus.active;
      case 'INACTIVE':
        return AccountStatus.inactive;
      case 'PENDING_ACTIVATION':
        return AccountStatus.pendingActivation;
    }
    throw Exception('$this is not known in enum AccountStatus');
  }
}

enum ActionEnum {
  create,
  updateMetadata,
  active,
  inactive,
  delete,
  underReview,
  reviewed,
  importEvidence,
}

extension ActionEnumValueExtension on ActionEnum {
  String toValue() {
    switch (this) {
      case ActionEnum.create:
        return 'CREATE';
      case ActionEnum.updateMetadata:
        return 'UPDATE_METADATA';
      case ActionEnum.active:
        return 'ACTIVE';
      case ActionEnum.inactive:
        return 'INACTIVE';
      case ActionEnum.delete:
        return 'DELETE';
      case ActionEnum.underReview:
        return 'UNDER_REVIEW';
      case ActionEnum.reviewed:
        return 'REVIEWED';
      case ActionEnum.importEvidence:
        return 'IMPORT_EVIDENCE';
    }
  }
}

extension ActionEnumFromString on String {
  ActionEnum toActionEnum() {
    switch (this) {
      case 'CREATE':
        return ActionEnum.create;
      case 'UPDATE_METADATA':
        return ActionEnum.updateMetadata;
      case 'ACTIVE':
        return ActionEnum.active;
      case 'INACTIVE':
        return ActionEnum.inactive;
      case 'DELETE':
        return ActionEnum.delete;
      case 'UNDER_REVIEW':
        return ActionEnum.underReview;
      case 'REVIEWED':
        return ActionEnum.reviewed;
      case 'IMPORT_EVIDENCE':
        return ActionEnum.importEvidence;
    }
    throw Exception('$this is not known in enum ActionEnum');
  }
}

/// An entity that defines the scope of audit evidence collected by Audit
/// Manager. An Audit Manager assessment is an implementation of an Audit
/// Manager framework.
class Assessment {
  /// The Amazon Resource Name (ARN) of the assessment.
  final String? arn;

  /// The Amazon Web Services account that's associated with the assessment.
  final AWSAccount? awsAccount;

  /// The framework that the assessment was created from.
  final AssessmentFramework? framework;

  /// The metadata for the assessment.
  final AssessmentMetadata? metadata;

  /// The tags that are associated with the assessment.
  final Map<String, String>? tags;

  Assessment({
    this.arn,
    this.awsAccount,
    this.framework,
    this.metadata,
    this.tags,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      arn: json['arn'] as String?,
      awsAccount: json['awsAccount'] != null
          ? AWSAccount.fromJson(json['awsAccount'] as Map<String, dynamic>)
          : null,
      framework: json['framework'] != null
          ? AssessmentFramework.fromJson(
              json['framework'] as Map<String, dynamic>)
          : null,
      metadata: json['metadata'] != null
          ? AssessmentMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final awsAccount = this.awsAccount;
    final framework = this.framework;
    final metadata = this.metadata;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (awsAccount != null) 'awsAccount': awsAccount,
      if (framework != null) 'framework': framework,
      if (metadata != null) 'metadata': metadata,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The control entity that represents a standard control or a custom control in
/// an Audit Manager assessment.
class AssessmentControl {
  /// The amount of evidence in the assessment report.
  final int? assessmentReportEvidenceCount;

  /// The list of comments that's attached to the control.
  final List<ControlComment>? comments;

  /// The description of the control.
  final String? description;

  /// The amount of evidence that's collected for the control.
  final int? evidenceCount;

  /// The list of data sources for the evidence.
  final List<String>? evidenceSources;

  /// The identifier for the control.
  final String? id;

  /// The name of the control.
  final String? name;

  /// The response of the control.
  final ControlResponse? response;

  /// The status of the control.
  final ControlStatus? status;

  AssessmentControl({
    this.assessmentReportEvidenceCount,
    this.comments,
    this.description,
    this.evidenceCount,
    this.evidenceSources,
    this.id,
    this.name,
    this.response,
    this.status,
  });

  factory AssessmentControl.fromJson(Map<String, dynamic> json) {
    return AssessmentControl(
      assessmentReportEvidenceCount:
          json['assessmentReportEvidenceCount'] as int?,
      comments: (json['comments'] as List?)
          ?.whereNotNull()
          .map((e) => ControlComment.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      evidenceCount: json['evidenceCount'] as int?,
      evidenceSources: (json['evidenceSources'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      name: json['name'] as String?,
      response: (json['response'] as String?)?.toControlResponse(),
      status: (json['status'] as String?)?.toControlStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentReportEvidenceCount = this.assessmentReportEvidenceCount;
    final comments = this.comments;
    final description = this.description;
    final evidenceCount = this.evidenceCount;
    final evidenceSources = this.evidenceSources;
    final id = this.id;
    final name = this.name;
    final response = this.response;
    final status = this.status;
    return {
      if (assessmentReportEvidenceCount != null)
        'assessmentReportEvidenceCount': assessmentReportEvidenceCount,
      if (comments != null) 'comments': comments,
      if (description != null) 'description': description,
      if (evidenceCount != null) 'evidenceCount': evidenceCount,
      if (evidenceSources != null) 'evidenceSources': evidenceSources,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (response != null) 'response': response.toValue(),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Represents a set of controls in an Audit Manager assessment.
class AssessmentControlSet {
  /// The list of controls that's contained with the control set.
  final List<AssessmentControl>? controls;

  /// The delegations that are associated with the control set.
  final List<Delegation>? delegations;

  /// The description for the control set.
  final String? description;

  /// The identifier of the control set in the assessment. This is the control set
  /// name in a plain string format.
  final String? id;

  /// The total number of evidence objects that are uploaded manually to the
  /// control set.
  final int? manualEvidenceCount;

  /// The roles that are associated with the control set.
  final List<Role>? roles;

  /// The current status of the control set.
  final ControlSetStatus? status;

  /// The total number of evidence objects that are retrieved automatically for
  /// the control set.
  final int? systemEvidenceCount;

  AssessmentControlSet({
    this.controls,
    this.delegations,
    this.description,
    this.id,
    this.manualEvidenceCount,
    this.roles,
    this.status,
    this.systemEvidenceCount,
  });

  factory AssessmentControlSet.fromJson(Map<String, dynamic> json) {
    return AssessmentControlSet(
      controls: (json['controls'] as List?)
          ?.whereNotNull()
          .map((e) => AssessmentControl.fromJson(e as Map<String, dynamic>))
          .toList(),
      delegations: (json['delegations'] as List?)
          ?.whereNotNull()
          .map((e) => Delegation.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      id: json['id'] as String?,
      manualEvidenceCount: json['manualEvidenceCount'] as int?,
      roles: (json['roles'] as List?)
          ?.whereNotNull()
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toControlSetStatus(),
      systemEvidenceCount: json['systemEvidenceCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final controls = this.controls;
    final delegations = this.delegations;
    final description = this.description;
    final id = this.id;
    final manualEvidenceCount = this.manualEvidenceCount;
    final roles = this.roles;
    final status = this.status;
    final systemEvidenceCount = this.systemEvidenceCount;
    return {
      if (controls != null) 'controls': controls,
      if (delegations != null) 'delegations': delegations,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (manualEvidenceCount != null)
        'manualEvidenceCount': manualEvidenceCount,
      if (roles != null) 'roles': roles,
      if (status != null) 'status': status.toValue(),
      if (systemEvidenceCount != null)
        'systemEvidenceCount': systemEvidenceCount,
    };
  }
}

/// The folder where Audit Manager stores evidence for an assessment.
class AssessmentEvidenceFolder {
  /// The identifier for the assessment.
  final String? assessmentId;

  /// The total count of evidence that's included in the assessment report.
  final int? assessmentReportSelectionCount;

  /// The name of the user who created the evidence folder.
  final String? author;

  /// The unique identifier for the control.
  final String? controlId;

  /// The name of the control.
  final String? controlName;

  /// The identifier for the control set.
  final String? controlSetId;

  /// The Amazon Web Service that the evidence was collected from.
  final String? dataSource;

  /// The date when the first evidence was added to the evidence folder.
  final DateTime? date;

  /// The total number of Amazon Web Services resources that were assessed to
  /// generate the evidence.
  final int? evidenceAwsServiceSourceCount;

  /// The number of evidence that falls under the compliance check category. This
  /// evidence is collected from Config or Security Hub.
  final int? evidenceByTypeComplianceCheckCount;

  /// The total number of issues that were reported directly from Security Hub,
  /// Config, or both.
  final int? evidenceByTypeComplianceCheckIssuesCount;

  /// The number of evidence that falls under the configuration data category.
  /// This evidence is collected from configuration snapshots of other Amazon Web
  /// Services such as Amazon EC2, Amazon S3, or IAM.
  final int? evidenceByTypeConfigurationDataCount;

  /// The number of evidence that falls under the manual category. This evidence
  /// is imported manually.
  final int? evidenceByTypeManualCount;

  /// The number of evidence that falls under the user activity category. This
  /// evidence is collected from CloudTrail logs.
  final int? evidenceByTypeUserActivityCount;

  /// The amount of evidence that's included in the evidence folder.
  final int? evidenceResourcesIncludedCount;

  /// The identifier for the folder that the evidence is stored in.
  final String? id;

  /// The name of the evidence folder.
  final String? name;

  /// The total amount of evidence in the evidence folder.
  final int? totalEvidence;

  AssessmentEvidenceFolder({
    this.assessmentId,
    this.assessmentReportSelectionCount,
    this.author,
    this.controlId,
    this.controlName,
    this.controlSetId,
    this.dataSource,
    this.date,
    this.evidenceAwsServiceSourceCount,
    this.evidenceByTypeComplianceCheckCount,
    this.evidenceByTypeComplianceCheckIssuesCount,
    this.evidenceByTypeConfigurationDataCount,
    this.evidenceByTypeManualCount,
    this.evidenceByTypeUserActivityCount,
    this.evidenceResourcesIncludedCount,
    this.id,
    this.name,
    this.totalEvidence,
  });

  factory AssessmentEvidenceFolder.fromJson(Map<String, dynamic> json) {
    return AssessmentEvidenceFolder(
      assessmentId: json['assessmentId'] as String?,
      assessmentReportSelectionCount:
          json['assessmentReportSelectionCount'] as int?,
      author: json['author'] as String?,
      controlId: json['controlId'] as String?,
      controlName: json['controlName'] as String?,
      controlSetId: json['controlSetId'] as String?,
      dataSource: json['dataSource'] as String?,
      date: timeStampFromJson(json['date']),
      evidenceAwsServiceSourceCount:
          json['evidenceAwsServiceSourceCount'] as int?,
      evidenceByTypeComplianceCheckCount:
          json['evidenceByTypeComplianceCheckCount'] as int?,
      evidenceByTypeComplianceCheckIssuesCount:
          json['evidenceByTypeComplianceCheckIssuesCount'] as int?,
      evidenceByTypeConfigurationDataCount:
          json['evidenceByTypeConfigurationDataCount'] as int?,
      evidenceByTypeManualCount: json['evidenceByTypeManualCount'] as int?,
      evidenceByTypeUserActivityCount:
          json['evidenceByTypeUserActivityCount'] as int?,
      evidenceResourcesIncludedCount:
          json['evidenceResourcesIncludedCount'] as int?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      totalEvidence: json['totalEvidence'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final assessmentReportSelectionCount = this.assessmentReportSelectionCount;
    final author = this.author;
    final controlId = this.controlId;
    final controlName = this.controlName;
    final controlSetId = this.controlSetId;
    final dataSource = this.dataSource;
    final date = this.date;
    final evidenceAwsServiceSourceCount = this.evidenceAwsServiceSourceCount;
    final evidenceByTypeComplianceCheckCount =
        this.evidenceByTypeComplianceCheckCount;
    final evidenceByTypeComplianceCheckIssuesCount =
        this.evidenceByTypeComplianceCheckIssuesCount;
    final evidenceByTypeConfigurationDataCount =
        this.evidenceByTypeConfigurationDataCount;
    final evidenceByTypeManualCount = this.evidenceByTypeManualCount;
    final evidenceByTypeUserActivityCount =
        this.evidenceByTypeUserActivityCount;
    final evidenceResourcesIncludedCount = this.evidenceResourcesIncludedCount;
    final id = this.id;
    final name = this.name;
    final totalEvidence = this.totalEvidence;
    return {
      if (assessmentId != null) 'assessmentId': assessmentId,
      if (assessmentReportSelectionCount != null)
        'assessmentReportSelectionCount': assessmentReportSelectionCount,
      if (author != null) 'author': author,
      if (controlId != null) 'controlId': controlId,
      if (controlName != null) 'controlName': controlName,
      if (controlSetId != null) 'controlSetId': controlSetId,
      if (dataSource != null) 'dataSource': dataSource,
      if (date != null) 'date': unixTimestampToJson(date),
      if (evidenceAwsServiceSourceCount != null)
        'evidenceAwsServiceSourceCount': evidenceAwsServiceSourceCount,
      if (evidenceByTypeComplianceCheckCount != null)
        'evidenceByTypeComplianceCheckCount':
            evidenceByTypeComplianceCheckCount,
      if (evidenceByTypeComplianceCheckIssuesCount != null)
        'evidenceByTypeComplianceCheckIssuesCount':
            evidenceByTypeComplianceCheckIssuesCount,
      if (evidenceByTypeConfigurationDataCount != null)
        'evidenceByTypeConfigurationDataCount':
            evidenceByTypeConfigurationDataCount,
      if (evidenceByTypeManualCount != null)
        'evidenceByTypeManualCount': evidenceByTypeManualCount,
      if (evidenceByTypeUserActivityCount != null)
        'evidenceByTypeUserActivityCount': evidenceByTypeUserActivityCount,
      if (evidenceResourcesIncludedCount != null)
        'evidenceResourcesIncludedCount': evidenceResourcesIncludedCount,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (totalEvidence != null) 'totalEvidence': totalEvidence,
    };
  }
}

/// The file used to structure and automate Audit Manager assessments for a
/// given compliance standard.
class AssessmentFramework {
  /// The Amazon Resource Name (ARN) of the framework.
  final String? arn;

  /// The control sets that are associated with the framework.
  final List<AssessmentControlSet>? controlSets;

  /// The unique identifier for the framework.
  final String? id;
  final FrameworkMetadata? metadata;

  AssessmentFramework({
    this.arn,
    this.controlSets,
    this.id,
    this.metadata,
  });

  factory AssessmentFramework.fromJson(Map<String, dynamic> json) {
    return AssessmentFramework(
      arn: json['arn'] as String?,
      controlSets: (json['controlSets'] as List?)
          ?.whereNotNull()
          .map((e) => AssessmentControlSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      metadata: json['metadata'] != null
          ? FrameworkMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final controlSets = this.controlSets;
    final id = this.id;
    final metadata = this.metadata;
    return {
      if (arn != null) 'arn': arn,
      if (controlSets != null) 'controlSets': controlSets,
      if (id != null) 'id': id,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// The metadata that's associated with a standard framework or a custom
/// framework.
class AssessmentFrameworkMetadata {
  /// The Amazon Resource Name (ARN) of the framework.
  final String? arn;

  /// The compliance type that the new custom framework supports, such as CIS or
  /// HIPAA.
  final String? complianceType;

  /// The number of control sets that are associated with the framework.
  final int? controlSetsCount;

  /// The number of controls that are associated with the framework.
  final int? controlsCount;

  /// The time when the framework was created.
  final DateTime? createdAt;

  /// The description of the framework.
  final String? description;

  /// The unique identifier for the framework.
  final String? id;

  /// The time when the framework was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The logo that's associated with the framework.
  final String? logo;

  /// The name of the framework.
  final String? name;

  /// The framework type, such as a standard framework or a custom framework.
  final FrameworkType? type;

  AssessmentFrameworkMetadata({
    this.arn,
    this.complianceType,
    this.controlSetsCount,
    this.controlsCount,
    this.createdAt,
    this.description,
    this.id,
    this.lastUpdatedAt,
    this.logo,
    this.name,
    this.type,
  });

  factory AssessmentFrameworkMetadata.fromJson(Map<String, dynamic> json) {
    return AssessmentFrameworkMetadata(
      arn: json['arn'] as String?,
      complianceType: json['complianceType'] as String?,
      controlSetsCount: json['controlSetsCount'] as int?,
      controlsCount: json['controlsCount'] as int?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      logo: json['logo'] as String?,
      name: json['name'] as String?,
      type: (json['type'] as String?)?.toFrameworkType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final complianceType = this.complianceType;
    final controlSetsCount = this.controlSetsCount;
    final controlsCount = this.controlsCount;
    final createdAt = this.createdAt;
    final description = this.description;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final logo = this.logo;
    final name = this.name;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (complianceType != null) 'complianceType': complianceType,
      if (controlSetsCount != null) 'controlSetsCount': controlSetsCount,
      if (controlsCount != null) 'controlsCount': controlsCount,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (logo != null) 'logo': logo,
      if (name != null) 'name': name,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Represents a share request for a custom framework in Audit Manager.
class AssessmentFrameworkShareRequest {
  /// An optional comment from the sender about the share request.
  final String? comment;

  /// The compliance type that the shared custom framework supports, such as CIS
  /// or HIPAA.
  final String? complianceType;

  /// The time when the share request was created.
  final DateTime? creationTime;

  /// The number of custom controls that are part of the shared custom framework.
  final int? customControlsCount;

  /// The Amazon Web Services account of the recipient.
  final String? destinationAccount;

  /// The Amazon Web Services Region of the recipient.
  final String? destinationRegion;

  /// The time when the share request expires.
  final DateTime? expirationTime;

  /// The description of the shared custom framework.
  final String? frameworkDescription;

  /// The unique identifier for the shared custom framework.
  final String? frameworkId;

  /// The name of the custom framework that the share request is for.
  final String? frameworkName;

  /// The unique identifier for the share request.
  final String? id;

  /// Specifies when the share request was last updated.
  final DateTime? lastUpdated;

  /// The Amazon Web Services account of the sender.
  final String? sourceAccount;

  /// The number of standard controls that are part of the shared custom
  /// framework.
  final int? standardControlsCount;

  /// The status of the share request.
  final ShareRequestStatus? status;

  AssessmentFrameworkShareRequest({
    this.comment,
    this.complianceType,
    this.creationTime,
    this.customControlsCount,
    this.destinationAccount,
    this.destinationRegion,
    this.expirationTime,
    this.frameworkDescription,
    this.frameworkId,
    this.frameworkName,
    this.id,
    this.lastUpdated,
    this.sourceAccount,
    this.standardControlsCount,
    this.status,
  });

  factory AssessmentFrameworkShareRequest.fromJson(Map<String, dynamic> json) {
    return AssessmentFrameworkShareRequest(
      comment: json['comment'] as String?,
      complianceType: json['complianceType'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      customControlsCount: json['customControlsCount'] as int?,
      destinationAccount: json['destinationAccount'] as String?,
      destinationRegion: json['destinationRegion'] as String?,
      expirationTime: timeStampFromJson(json['expirationTime']),
      frameworkDescription: json['frameworkDescription'] as String?,
      frameworkId: json['frameworkId'] as String?,
      frameworkName: json['frameworkName'] as String?,
      id: json['id'] as String?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      sourceAccount: json['sourceAccount'] as String?,
      standardControlsCount: json['standardControlsCount'] as int?,
      status: (json['status'] as String?)?.toShareRequestStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final complianceType = this.complianceType;
    final creationTime = this.creationTime;
    final customControlsCount = this.customControlsCount;
    final destinationAccount = this.destinationAccount;
    final destinationRegion = this.destinationRegion;
    final expirationTime = this.expirationTime;
    final frameworkDescription = this.frameworkDescription;
    final frameworkId = this.frameworkId;
    final frameworkName = this.frameworkName;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final sourceAccount = this.sourceAccount;
    final standardControlsCount = this.standardControlsCount;
    final status = this.status;
    return {
      if (comment != null) 'comment': comment,
      if (complianceType != null) 'complianceType': complianceType,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (customControlsCount != null)
        'customControlsCount': customControlsCount,
      if (destinationAccount != null) 'destinationAccount': destinationAccount,
      if (destinationRegion != null) 'destinationRegion': destinationRegion,
      if (expirationTime != null)
        'expirationTime': unixTimestampToJson(expirationTime),
      if (frameworkDescription != null)
        'frameworkDescription': frameworkDescription,
      if (frameworkId != null) 'frameworkId': frameworkId,
      if (frameworkName != null) 'frameworkName': frameworkName,
      if (id != null) 'id': id,
      if (lastUpdated != null) 'lastUpdated': unixTimestampToJson(lastUpdated),
      if (sourceAccount != null) 'sourceAccount': sourceAccount,
      if (standardControlsCount != null)
        'standardControlsCount': standardControlsCount,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The metadata that's associated with the specified assessment.
class AssessmentMetadata {
  /// The destination that evidence reports are stored in for the assessment.
  final AssessmentReportsDestination? assessmentReportsDestination;

  /// The name of the compliance standard that's related to the assessment, such
  /// as PCI-DSS.
  final String? complianceType;

  /// Specifies when the assessment was created.
  final DateTime? creationTime;

  /// The delegations that are associated with the assessment.
  final List<Delegation>? delegations;

  /// The description of the assessment.
  final String? description;

  /// The unique identifier for the assessment.
  final String? id;

  /// The time of the most recent update.
  final DateTime? lastUpdated;

  /// The name of the assessment.
  final String? name;

  /// The roles that are associated with the assessment.
  final List<Role>? roles;

  /// The wrapper of Amazon Web Services accounts and services that are in scope
  /// for the assessment.
  final Scope? scope;

  /// The overall status of the assessment.
  final AssessmentStatus? status;

  AssessmentMetadata({
    this.assessmentReportsDestination,
    this.complianceType,
    this.creationTime,
    this.delegations,
    this.description,
    this.id,
    this.lastUpdated,
    this.name,
    this.roles,
    this.scope,
    this.status,
  });

  factory AssessmentMetadata.fromJson(Map<String, dynamic> json) {
    return AssessmentMetadata(
      assessmentReportsDestination: json['assessmentReportsDestination'] != null
          ? AssessmentReportsDestination.fromJson(
              json['assessmentReportsDestination'] as Map<String, dynamic>)
          : null,
      complianceType: json['complianceType'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      delegations: (json['delegations'] as List?)
          ?.whereNotNull()
          .map((e) => Delegation.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      name: json['name'] as String?,
      roles: (json['roles'] as List?)
          ?.whereNotNull()
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      scope: json['scope'] != null
          ? Scope.fromJson(json['scope'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toAssessmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentReportsDestination = this.assessmentReportsDestination;
    final complianceType = this.complianceType;
    final creationTime = this.creationTime;
    final delegations = this.delegations;
    final description = this.description;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final name = this.name;
    final roles = this.roles;
    final scope = this.scope;
    final status = this.status;
    return {
      if (assessmentReportsDestination != null)
        'assessmentReportsDestination': assessmentReportsDestination,
      if (complianceType != null) 'complianceType': complianceType,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (delegations != null) 'delegations': delegations,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastUpdated != null) 'lastUpdated': unixTimestampToJson(lastUpdated),
      if (name != null) 'name': name,
      if (roles != null) 'roles': roles,
      if (scope != null) 'scope': scope,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// A metadata object that's associated with an assessment in Audit Manager.
class AssessmentMetadataItem {
  /// The name of the compliance standard that's related to the assessment, such
  /// as PCI-DSS.
  final String? complianceType;

  /// Specifies when the assessment was created.
  final DateTime? creationTime;

  /// The delegations that are associated with the assessment.
  final List<Delegation>? delegations;

  /// The unique identifier for the assessment.
  final String? id;

  /// The time of the most recent update.
  final DateTime? lastUpdated;

  /// The name of the assessment.
  final String? name;

  /// The roles that are associated with the assessment.
  final List<Role>? roles;

  /// The current status of the assessment.
  final AssessmentStatus? status;

  AssessmentMetadataItem({
    this.complianceType,
    this.creationTime,
    this.delegations,
    this.id,
    this.lastUpdated,
    this.name,
    this.roles,
    this.status,
  });

  factory AssessmentMetadataItem.fromJson(Map<String, dynamic> json) {
    return AssessmentMetadataItem(
      complianceType: json['complianceType'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      delegations: (json['delegations'] as List?)
          ?.whereNotNull()
          .map((e) => Delegation.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      name: json['name'] as String?,
      roles: (json['roles'] as List?)
          ?.whereNotNull()
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toAssessmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final complianceType = this.complianceType;
    final creationTime = this.creationTime;
    final delegations = this.delegations;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final name = this.name;
    final roles = this.roles;
    final status = this.status;
    return {
      if (complianceType != null) 'complianceType': complianceType,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (delegations != null) 'delegations': delegations,
      if (id != null) 'id': id,
      if (lastUpdated != null) 'lastUpdated': unixTimestampToJson(lastUpdated),
      if (name != null) 'name': name,
      if (roles != null) 'roles': roles,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// A finalized document that's generated from an Audit Manager assessment.
/// These reports summarize the relevant evidence that was collected for your
/// audit, and link to the relevant evidence folders. These evidence folders are
/// named and organized according to the controls that are specified in your
/// assessment.
class AssessmentReport {
  /// The identifier for the specified assessment.
  final String? assessmentId;

  /// The name of the associated assessment.
  final String? assessmentName;

  /// The name of the user who created the assessment report.
  final String? author;

  /// The identifier for the specified Amazon Web Services account.
  final String? awsAccountId;

  /// Specifies when the assessment report was created.
  final DateTime? creationTime;

  /// The description of the specified assessment report.
  final String? description;

  /// The unique identifier for the assessment report.
  final String? id;

  /// The name that's given to the assessment report.
  final String? name;

  /// The current status of the specified assessment report.
  final AssessmentReportStatus? status;

  AssessmentReport({
    this.assessmentId,
    this.assessmentName,
    this.author,
    this.awsAccountId,
    this.creationTime,
    this.description,
    this.id,
    this.name,
    this.status,
  });

  factory AssessmentReport.fromJson(Map<String, dynamic> json) {
    return AssessmentReport(
      assessmentId: json['assessmentId'] as String?,
      assessmentName: json['assessmentName'] as String?,
      author: json['author'] as String?,
      awsAccountId: json['awsAccountId'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toAssessmentReportStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final assessmentName = this.assessmentName;
    final author = this.author;
    final awsAccountId = this.awsAccountId;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (assessmentId != null) 'assessmentId': assessmentId,
      if (assessmentName != null) 'assessmentName': assessmentName,
      if (author != null) 'author': author,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum AssessmentReportDestinationType {
  s3,
}

extension AssessmentReportDestinationTypeValueExtension
    on AssessmentReportDestinationType {
  String toValue() {
    switch (this) {
      case AssessmentReportDestinationType.s3:
        return 'S3';
    }
  }
}

extension AssessmentReportDestinationTypeFromString on String {
  AssessmentReportDestinationType toAssessmentReportDestinationType() {
    switch (this) {
      case 'S3':
        return AssessmentReportDestinationType.s3;
    }
    throw Exception(
        '$this is not known in enum AssessmentReportDestinationType');
  }
}

/// An error entity for assessment report evidence errors. This is used to
/// provide more meaningful errors than a simple string message.
class AssessmentReportEvidenceError {
  /// The error code that was returned.
  final String? errorCode;

  /// The error message that was returned.
  final String? errorMessage;

  /// The identifier for the evidence.
  final String? evidenceId;

  AssessmentReportEvidenceError({
    this.errorCode,
    this.errorMessage,
    this.evidenceId,
  });

  factory AssessmentReportEvidenceError.fromJson(Map<String, dynamic> json) {
    return AssessmentReportEvidenceError(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      evidenceId: json['evidenceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final evidenceId = this.evidenceId;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (evidenceId != null) 'evidenceId': evidenceId,
    };
  }
}

/// The metadata objects that are associated with the specified assessment
/// report.
class AssessmentReportMetadata {
  /// The unique identifier for the associated assessment.
  final String? assessmentId;

  /// The name of the associated assessment.
  final String? assessmentName;

  /// The name of the user who created the assessment report.
  final String? author;

  /// Specifies when the assessment report was created.
  final DateTime? creationTime;

  /// The description of the assessment report.
  final String? description;

  /// The unique identifier for the assessment report.
  final String? id;

  /// The name of the assessment report.
  final String? name;

  /// The current status of the assessment report.
  final AssessmentReportStatus? status;

  AssessmentReportMetadata({
    this.assessmentId,
    this.assessmentName,
    this.author,
    this.creationTime,
    this.description,
    this.id,
    this.name,
    this.status,
  });

  factory AssessmentReportMetadata.fromJson(Map<String, dynamic> json) {
    return AssessmentReportMetadata(
      assessmentId: json['assessmentId'] as String?,
      assessmentName: json['assessmentName'] as String?,
      author: json['author'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toAssessmentReportStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final assessmentName = this.assessmentName;
    final author = this.author;
    final creationTime = this.creationTime;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (assessmentId != null) 'assessmentId': assessmentId,
      if (assessmentName != null) 'assessmentName': assessmentName,
      if (author != null) 'author': author,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum AssessmentReportStatus {
  complete,
  inProgress,
  failed,
}

extension AssessmentReportStatusValueExtension on AssessmentReportStatus {
  String toValue() {
    switch (this) {
      case AssessmentReportStatus.complete:
        return 'COMPLETE';
      case AssessmentReportStatus.inProgress:
        return 'IN_PROGRESS';
      case AssessmentReportStatus.failed:
        return 'FAILED';
    }
  }
}

extension AssessmentReportStatusFromString on String {
  AssessmentReportStatus toAssessmentReportStatus() {
    switch (this) {
      case 'COMPLETE':
        return AssessmentReportStatus.complete;
      case 'IN_PROGRESS':
        return AssessmentReportStatus.inProgress;
      case 'FAILED':
        return AssessmentReportStatus.failed;
    }
    throw Exception('$this is not known in enum AssessmentReportStatus');
  }
}

/// The location where Audit Manager saves assessment reports for the given
/// assessment.
class AssessmentReportsDestination {
  /// The destination bucket where Audit Manager stores assessment reports.
  final String? destination;

  /// The destination type, such as Amazon S3.
  final AssessmentReportDestinationType? destinationType;

  AssessmentReportsDestination({
    this.destination,
    this.destinationType,
  });

  factory AssessmentReportsDestination.fromJson(Map<String, dynamic> json) {
    return AssessmentReportsDestination(
      destination: json['destination'] as String?,
      destinationType: (json['destinationType'] as String?)
          ?.toAssessmentReportDestinationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final destinationType = this.destinationType;
    return {
      if (destination != null) 'destination': destination,
      if (destinationType != null) 'destinationType': destinationType.toValue(),
    };
  }
}

enum AssessmentStatus {
  active,
  inactive,
}

extension AssessmentStatusValueExtension on AssessmentStatus {
  String toValue() {
    switch (this) {
      case AssessmentStatus.active:
        return 'ACTIVE';
      case AssessmentStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension AssessmentStatusFromString on String {
  AssessmentStatus toAssessmentStatus() {
    switch (this) {
      case 'ACTIVE':
        return AssessmentStatus.active;
      case 'INACTIVE':
        return AssessmentStatus.inactive;
    }
    throw Exception('$this is not known in enum AssessmentStatus');
  }
}

class AssociateAssessmentReportEvidenceFolderResponse {
  AssociateAssessmentReportEvidenceFolderResponse();

  factory AssociateAssessmentReportEvidenceFolderResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateAssessmentReportEvidenceFolderResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class BatchAssociateAssessmentReportEvidenceResponse {
  /// A list of errors that the
  /// <code>BatchAssociateAssessmentReportEvidence</code> API returned.
  final List<AssessmentReportEvidenceError>? errors;

  /// The list of evidence identifiers.
  final List<String>? evidenceIds;

  BatchAssociateAssessmentReportEvidenceResponse({
    this.errors,
    this.evidenceIds,
  });

  factory BatchAssociateAssessmentReportEvidenceResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateAssessmentReportEvidenceResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AssessmentReportEvidenceError.fromJson(e as Map<String, dynamic>))
          .toList(),
      evidenceIds: (json['evidenceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final evidenceIds = this.evidenceIds;
    return {
      if (errors != null) 'errors': errors,
      if (evidenceIds != null) 'evidenceIds': evidenceIds,
    };
  }
}

/// An error entity for the <code>BatchCreateDelegationByAssessment</code> API.
/// This is used to provide more meaningful errors than a simple string message.
class BatchCreateDelegationByAssessmentError {
  /// The API request to batch create delegations in Audit Manager.
  final CreateDelegationRequest? createDelegationRequest;

  /// The error code that the <code>BatchCreateDelegationByAssessment</code> API
  /// returned.
  final String? errorCode;

  /// The error message that the <code>BatchCreateDelegationByAssessment</code>
  /// API returned.
  final String? errorMessage;

  BatchCreateDelegationByAssessmentError({
    this.createDelegationRequest,
    this.errorCode,
    this.errorMessage,
  });

  factory BatchCreateDelegationByAssessmentError.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateDelegationByAssessmentError(
      createDelegationRequest: json['createDelegationRequest'] != null
          ? CreateDelegationRequest.fromJson(
              json['createDelegationRequest'] as Map<String, dynamic>)
          : null,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createDelegationRequest = this.createDelegationRequest;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (createDelegationRequest != null)
        'createDelegationRequest': createDelegationRequest,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

class BatchCreateDelegationByAssessmentResponse {
  /// The delegations that are associated with the assessment.
  final List<Delegation>? delegations;

  /// A list of errors that the <code>BatchCreateDelegationByAssessment</code> API
  /// returned.
  final List<BatchCreateDelegationByAssessmentError>? errors;

  BatchCreateDelegationByAssessmentResponse({
    this.delegations,
    this.errors,
  });

  factory BatchCreateDelegationByAssessmentResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateDelegationByAssessmentResponse(
      delegations: (json['delegations'] as List?)
          ?.whereNotNull()
          .map((e) => Delegation.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchCreateDelegationByAssessmentError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final delegations = this.delegations;
    final errors = this.errors;
    return {
      if (delegations != null) 'delegations': delegations,
      if (errors != null) 'errors': errors,
    };
  }
}

/// An error entity for the <code>BatchDeleteDelegationByAssessment</code> API.
/// This is used to provide more meaningful errors than a simple string message.
class BatchDeleteDelegationByAssessmentError {
  /// The identifier for the delegation.
  final String? delegationId;

  /// The error code that the <code>BatchDeleteDelegationByAssessment</code> API
  /// returned.
  final String? errorCode;

  /// The error message that the <code>BatchDeleteDelegationByAssessment</code>
  /// API returned.
  final String? errorMessage;

  BatchDeleteDelegationByAssessmentError({
    this.delegationId,
    this.errorCode,
    this.errorMessage,
  });

  factory BatchDeleteDelegationByAssessmentError.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteDelegationByAssessmentError(
      delegationId: json['delegationId'] as String?,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final delegationId = this.delegationId;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (delegationId != null) 'delegationId': delegationId,
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

class BatchDeleteDelegationByAssessmentResponse {
  /// A list of errors that the <code>BatchDeleteDelegationByAssessment</code> API
  /// returned.
  final List<BatchDeleteDelegationByAssessmentError>? errors;

  BatchDeleteDelegationByAssessmentResponse({
    this.errors,
  });

  factory BatchDeleteDelegationByAssessmentResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteDelegationByAssessmentResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchDeleteDelegationByAssessmentError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

class BatchDisassociateAssessmentReportEvidenceResponse {
  /// A list of errors that the
  /// <code>BatchDisassociateAssessmentReportEvidence</code> API returned.
  final List<AssessmentReportEvidenceError>? errors;

  /// The identifier for the evidence.
  final List<String>? evidenceIds;

  BatchDisassociateAssessmentReportEvidenceResponse({
    this.errors,
    this.evidenceIds,
  });

  factory BatchDisassociateAssessmentReportEvidenceResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateAssessmentReportEvidenceResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AssessmentReportEvidenceError.fromJson(e as Map<String, dynamic>))
          .toList(),
      evidenceIds: (json['evidenceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final evidenceIds = this.evidenceIds;
    return {
      if (errors != null) 'errors': errors,
      if (evidenceIds != null) 'evidenceIds': evidenceIds,
    };
  }
}

/// An error entity for the <code>BatchImportEvidenceToAssessmentControl</code>
/// API. This is used to provide more meaningful errors than a simple string
/// message.
class BatchImportEvidenceToAssessmentControlError {
  /// The error code that the <code>BatchImportEvidenceToAssessmentControl</code>
  /// API returned.
  final String? errorCode;

  /// The error message that the
  /// <code>BatchImportEvidenceToAssessmentControl</code> API returned.
  final String? errorMessage;

  /// Manual evidence that can't be collected automatically by Audit Manager.
  final ManualEvidence? manualEvidence;

  BatchImportEvidenceToAssessmentControlError({
    this.errorCode,
    this.errorMessage,
    this.manualEvidence,
  });

  factory BatchImportEvidenceToAssessmentControlError.fromJson(
      Map<String, dynamic> json) {
    return BatchImportEvidenceToAssessmentControlError(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      manualEvidence: json['manualEvidence'] != null
          ? ManualEvidence.fromJson(
              json['manualEvidence'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final manualEvidence = this.manualEvidence;
    return {
      if (errorCode != null) 'errorCode': errorCode,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (manualEvidence != null) 'manualEvidence': manualEvidence,
    };
  }
}

class BatchImportEvidenceToAssessmentControlResponse {
  /// A list of errors that the
  /// <code>BatchImportEvidenceToAssessmentControl</code> API returned.
  final List<BatchImportEvidenceToAssessmentControlError>? errors;

  BatchImportEvidenceToAssessmentControlResponse({
    this.errors,
  });

  factory BatchImportEvidenceToAssessmentControlResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchImportEvidenceToAssessmentControlResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchImportEvidenceToAssessmentControlError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

/// The record of a change within Audit Manager. For example, this could be the
/// status change of an assessment or the delegation of a control set.
class ChangeLog {
  /// The action that was performed.
  final ActionEnum? action;

  /// The time when the action was performed and the changelog record was created.
  final DateTime? createdAt;

  /// The user or role that performed the action.
  final String? createdBy;

  /// The name of the object that changed. This could be the name of an
  /// assessment, control, or control set.
  final String? objectName;

  /// The object that was changed, such as an assessment, control, or control set.
  final ObjectTypeEnum? objectType;

  ChangeLog({
    this.action,
    this.createdAt,
    this.createdBy,
    this.objectName,
    this.objectType,
  });

  factory ChangeLog.fromJson(Map<String, dynamic> json) {
    return ChangeLog(
      action: (json['action'] as String?)?.toActionEnum(),
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      objectName: json['objectName'] as String?,
      objectType: (json['objectType'] as String?)?.toObjectTypeEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final objectName = this.objectName;
    final objectType = this.objectType;
    return {
      if (action != null) 'action': action.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (objectName != null) 'objectName': objectName,
      if (objectType != null) 'objectType': objectType.toValue(),
    };
  }
}

/// A control in Audit Manager.
class Control {
  /// The recommended actions to carry out if the control isn't fulfilled.
  final String? actionPlanInstructions;

  /// The title of the action plan for remediating the control.
  final String? actionPlanTitle;

  /// The Amazon Resource Name (ARN) of the control.
  final String? arn;

  /// The data mapping sources for the control.
  final List<ControlMappingSource>? controlMappingSources;

  /// The data source types that determine where Audit Manager collects evidence
  /// from for the control.
  final String? controlSources;

  /// The time when the control was created.
  final DateTime? createdAt;

  /// The user or role that created the control.
  final String? createdBy;

  /// The description of the control.
  final String? description;

  /// The unique identifier for the control.
  final String? id;

  /// The time when the control was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The user or role that most recently updated the control.
  final String? lastUpdatedBy;

  /// The name of the control.
  final String? name;

  /// The tags associated with the control.
  final Map<String, String>? tags;

  /// The steps that you should follow to determine if the control has been
  /// satisfied.
  final String? testingInformation;

  /// Specifies whether the control is a standard control or a custom control.
  final ControlType? type;

  Control({
    this.actionPlanInstructions,
    this.actionPlanTitle,
    this.arn,
    this.controlMappingSources,
    this.controlSources,
    this.createdAt,
    this.createdBy,
    this.description,
    this.id,
    this.lastUpdatedAt,
    this.lastUpdatedBy,
    this.name,
    this.tags,
    this.testingInformation,
    this.type,
  });

  factory Control.fromJson(Map<String, dynamic> json) {
    return Control(
      actionPlanInstructions: json['actionPlanInstructions'] as String?,
      actionPlanTitle: json['actionPlanTitle'] as String?,
      arn: json['arn'] as String?,
      controlMappingSources: (json['controlMappingSources'] as List?)
          ?.whereNotNull()
          .map((e) => ControlMappingSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      controlSources: json['controlSources'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lastUpdatedBy: json['lastUpdatedBy'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      testingInformation: json['testingInformation'] as String?,
      type: (json['type'] as String?)?.toControlType(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionPlanInstructions = this.actionPlanInstructions;
    final actionPlanTitle = this.actionPlanTitle;
    final arn = this.arn;
    final controlMappingSources = this.controlMappingSources;
    final controlSources = this.controlSources;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lastUpdatedBy = this.lastUpdatedBy;
    final name = this.name;
    final tags = this.tags;
    final testingInformation = this.testingInformation;
    final type = this.type;
    return {
      if (actionPlanInstructions != null)
        'actionPlanInstructions': actionPlanInstructions,
      if (actionPlanTitle != null) 'actionPlanTitle': actionPlanTitle,
      if (arn != null) 'arn': arn,
      if (controlMappingSources != null)
        'controlMappingSources': controlMappingSources,
      if (controlSources != null) 'controlSources': controlSources,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lastUpdatedBy != null) 'lastUpdatedBy': lastUpdatedBy,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (testingInformation != null) 'testingInformation': testingInformation,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// A comment that's posted by a user on a control. This includes the author's
/// name, the comment text, and a timestamp.
class ControlComment {
  /// The name of the user who authored the comment.
  final String? authorName;

  /// The body text of a control comment.
  final String? commentBody;

  /// The time when the comment was posted.
  final DateTime? postedDate;

  ControlComment({
    this.authorName,
    this.commentBody,
    this.postedDate,
  });

  factory ControlComment.fromJson(Map<String, dynamic> json) {
    return ControlComment(
      authorName: json['authorName'] as String?,
      commentBody: json['commentBody'] as String?,
      postedDate: timeStampFromJson(json['postedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final authorName = this.authorName;
    final commentBody = this.commentBody;
    final postedDate = this.postedDate;
    return {
      if (authorName != null) 'authorName': authorName,
      if (commentBody != null) 'commentBody': commentBody,
      if (postedDate != null) 'postedDate': unixTimestampToJson(postedDate),
    };
  }
}

/// A summary of the latest analytics data for a specific control domain.
///
/// Control domain insights are grouped by control domain, and ranked by the
/// highest total count of non-compliant evidence.
class ControlDomainInsights {
  /// The number of controls in the control domain that collected non-compliant
  /// evidence on the <code>lastUpdated</code> date.
  final int? controlsCountByNoncompliantEvidence;

  /// A breakdown of the compliance check status for the evidence that’s
  /// associated with the control domain.
  final EvidenceInsights? evidenceInsights;

  /// The unique identifier for the control domain.
  final String? id;

  /// The time when the control domain insights were last updated.
  final DateTime? lastUpdated;

  /// The name of the control domain.
  final String? name;

  /// The total number of controls in the control domain.
  final int? totalControlsCount;

  ControlDomainInsights({
    this.controlsCountByNoncompliantEvidence,
    this.evidenceInsights,
    this.id,
    this.lastUpdated,
    this.name,
    this.totalControlsCount,
  });

  factory ControlDomainInsights.fromJson(Map<String, dynamic> json) {
    return ControlDomainInsights(
      controlsCountByNoncompliantEvidence:
          json['controlsCountByNoncompliantEvidence'] as int?,
      evidenceInsights: json['evidenceInsights'] != null
          ? EvidenceInsights.fromJson(
              json['evidenceInsights'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      name: json['name'] as String?,
      totalControlsCount: json['totalControlsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlsCountByNoncompliantEvidence =
        this.controlsCountByNoncompliantEvidence;
    final evidenceInsights = this.evidenceInsights;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final name = this.name;
    final totalControlsCount = this.totalControlsCount;
    return {
      if (controlsCountByNoncompliantEvidence != null)
        'controlsCountByNoncompliantEvidence':
            controlsCountByNoncompliantEvidence,
      if (evidenceInsights != null) 'evidenceInsights': evidenceInsights,
      if (id != null) 'id': id,
      if (lastUpdated != null) 'lastUpdated': unixTimestampToJson(lastUpdated),
      if (name != null) 'name': name,
      if (totalControlsCount != null) 'totalControlsCount': totalControlsCount,
    };
  }
}

/// A summary of the latest analytics data for a specific control in a specific
/// active assessment.
///
/// Control insights are grouped by control domain, and ranked by the highest
/// total count of non-compliant evidence.
class ControlInsightsMetadataByAssessmentItem {
  /// The name of the control set that the assessment control belongs to.
  final String? controlSetName;

  /// A breakdown of the compliance check status for the evidence that’s
  /// associated with the assessment control.
  final EvidenceInsights? evidenceInsights;

  /// The unique identifier for the assessment control.
  final String? id;

  /// The time when the assessment control insights were last updated.
  final DateTime? lastUpdated;

  /// The name of the assessment control.
  final String? name;

  ControlInsightsMetadataByAssessmentItem({
    this.controlSetName,
    this.evidenceInsights,
    this.id,
    this.lastUpdated,
    this.name,
  });

  factory ControlInsightsMetadataByAssessmentItem.fromJson(
      Map<String, dynamic> json) {
    return ControlInsightsMetadataByAssessmentItem(
      controlSetName: json['controlSetName'] as String?,
      evidenceInsights: json['evidenceInsights'] != null
          ? EvidenceInsights.fromJson(
              json['evidenceInsights'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlSetName = this.controlSetName;
    final evidenceInsights = this.evidenceInsights;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final name = this.name;
    return {
      if (controlSetName != null) 'controlSetName': controlSetName,
      if (evidenceInsights != null) 'evidenceInsights': evidenceInsights,
      if (id != null) 'id': id,
      if (lastUpdated != null) 'lastUpdated': unixTimestampToJson(lastUpdated),
      if (name != null) 'name': name,
    };
  }
}

/// A summary of the latest analytics data for a specific control.
///
/// This data reflects the total counts for the specified control across all
/// active assessments. Control insights are grouped by control domain, and
/// ranked by the highest total count of non-compliant evidence.
class ControlInsightsMetadataItem {
  /// A breakdown of the compliance check status for the evidence that’s
  /// associated with the control.
  final EvidenceInsights? evidenceInsights;

  /// The unique identifier for the control.
  final String? id;

  /// The time when the control insights were last updated.
  final DateTime? lastUpdated;

  /// The name of the control.
  final String? name;

  ControlInsightsMetadataItem({
    this.evidenceInsights,
    this.id,
    this.lastUpdated,
    this.name,
  });

  factory ControlInsightsMetadataItem.fromJson(Map<String, dynamic> json) {
    return ControlInsightsMetadataItem(
      evidenceInsights: json['evidenceInsights'] != null
          ? EvidenceInsights.fromJson(
              json['evidenceInsights'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evidenceInsights = this.evidenceInsights;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final name = this.name;
    return {
      if (evidenceInsights != null) 'evidenceInsights': evidenceInsights,
      if (id != null) 'id': id,
      if (lastUpdated != null) 'lastUpdated': unixTimestampToJson(lastUpdated),
      if (name != null) 'name': name,
    };
  }
}

/// The data source that determines where Audit Manager collects evidence from
/// for the control.
class ControlMappingSource {
  /// The description of the source.
  final String? sourceDescription;

  /// Specifies how often evidence is collected from the control mapping source.
  final SourceFrequency? sourceFrequency;

  /// The unique identifier for the source.
  final String? sourceId;
  final SourceKeyword? sourceKeyword;

  /// The name of the source.
  final String? sourceName;

  /// The setup option for the data source. This option reflects if the evidence
  /// collection is automated or manual.
  final SourceSetUpOption? sourceSetUpOption;

  /// Specifies one of the five data source types for evidence collection.
  final SourceType? sourceType;

  /// The instructions for troubleshooting the control.
  final String? troubleshootingText;

  ControlMappingSource({
    this.sourceDescription,
    this.sourceFrequency,
    this.sourceId,
    this.sourceKeyword,
    this.sourceName,
    this.sourceSetUpOption,
    this.sourceType,
    this.troubleshootingText,
  });

  factory ControlMappingSource.fromJson(Map<String, dynamic> json) {
    return ControlMappingSource(
      sourceDescription: json['sourceDescription'] as String?,
      sourceFrequency:
          (json['sourceFrequency'] as String?)?.toSourceFrequency(),
      sourceId: json['sourceId'] as String?,
      sourceKeyword: json['sourceKeyword'] != null
          ? SourceKeyword.fromJson(
              json['sourceKeyword'] as Map<String, dynamic>)
          : null,
      sourceName: json['sourceName'] as String?,
      sourceSetUpOption:
          (json['sourceSetUpOption'] as String?)?.toSourceSetUpOption(),
      sourceType: (json['sourceType'] as String?)?.toSourceType(),
      troubleshootingText: json['troubleshootingText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceDescription = this.sourceDescription;
    final sourceFrequency = this.sourceFrequency;
    final sourceId = this.sourceId;
    final sourceKeyword = this.sourceKeyword;
    final sourceName = this.sourceName;
    final sourceSetUpOption = this.sourceSetUpOption;
    final sourceType = this.sourceType;
    final troubleshootingText = this.troubleshootingText;
    return {
      if (sourceDescription != null) 'sourceDescription': sourceDescription,
      if (sourceFrequency != null) 'sourceFrequency': sourceFrequency.toValue(),
      if (sourceId != null) 'sourceId': sourceId,
      if (sourceKeyword != null) 'sourceKeyword': sourceKeyword,
      if (sourceName != null) 'sourceName': sourceName,
      if (sourceSetUpOption != null)
        'sourceSetUpOption': sourceSetUpOption.toValue(),
      if (sourceType != null) 'sourceType': sourceType.toValue(),
      if (troubleshootingText != null)
        'troubleshootingText': troubleshootingText,
    };
  }
}

/// The metadata that's associated with the standard control or custom control.
class ControlMetadata {
  /// The Amazon Resource Name (ARN) of the control.
  final String? arn;

  /// The data source that determines where Audit Manager collects evidence from
  /// for the control.
  final String? controlSources;

  /// The time when the control was created.
  final DateTime? createdAt;

  /// The unique identifier for the control.
  final String? id;

  /// The time when the control was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The name of the control.
  final String? name;

  ControlMetadata({
    this.arn,
    this.controlSources,
    this.createdAt,
    this.id,
    this.lastUpdatedAt,
    this.name,
  });

  factory ControlMetadata.fromJson(Map<String, dynamic> json) {
    return ControlMetadata(
      arn: json['arn'] as String?,
      controlSources: json['controlSources'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final controlSources = this.controlSources;
    final createdAt = this.createdAt;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (controlSources != null) 'controlSources': controlSources,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (id != null) 'id': id,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
    };
  }
}

enum ControlResponse {
  manual,
  automate,
  defer,
  ignore,
}

extension ControlResponseValueExtension on ControlResponse {
  String toValue() {
    switch (this) {
      case ControlResponse.manual:
        return 'MANUAL';
      case ControlResponse.automate:
        return 'AUTOMATE';
      case ControlResponse.defer:
        return 'DEFER';
      case ControlResponse.ignore:
        return 'IGNORE';
    }
  }
}

extension ControlResponseFromString on String {
  ControlResponse toControlResponse() {
    switch (this) {
      case 'MANUAL':
        return ControlResponse.manual;
      case 'AUTOMATE':
        return ControlResponse.automate;
      case 'DEFER':
        return ControlResponse.defer;
      case 'IGNORE':
        return ControlResponse.ignore;
    }
    throw Exception('$this is not known in enum ControlResponse');
  }
}

/// A set of controls in Audit Manager.
class ControlSet {
  /// The list of controls within the control set.
  final List<Control>? controls;

  /// The identifier of the control set in the assessment. This is the control set
  /// name in a plain string format.
  final String? id;

  /// The name of the control set.
  final String? name;

  ControlSet({
    this.controls,
    this.id,
    this.name,
  });

  factory ControlSet.fromJson(Map<String, dynamic> json) {
    return ControlSet(
      controls: (json['controls'] as List?)
          ?.whereNotNull()
          .map((e) => Control.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controls = this.controls;
    final id = this.id;
    final name = this.name;
    return {
      if (controls != null) 'controls': controls,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    };
  }
}

enum ControlSetStatus {
  active,
  underReview,
  reviewed,
}

extension ControlSetStatusValueExtension on ControlSetStatus {
  String toValue() {
    switch (this) {
      case ControlSetStatus.active:
        return 'ACTIVE';
      case ControlSetStatus.underReview:
        return 'UNDER_REVIEW';
      case ControlSetStatus.reviewed:
        return 'REVIEWED';
    }
  }
}

extension ControlSetStatusFromString on String {
  ControlSetStatus toControlSetStatus() {
    switch (this) {
      case 'ACTIVE':
        return ControlSetStatus.active;
      case 'UNDER_REVIEW':
        return ControlSetStatus.underReview;
      case 'REVIEWED':
        return ControlSetStatus.reviewed;
    }
    throw Exception('$this is not known in enum ControlSetStatus');
  }
}

enum ControlStatus {
  underReview,
  reviewed,
  inactive,
}

extension ControlStatusValueExtension on ControlStatus {
  String toValue() {
    switch (this) {
      case ControlStatus.underReview:
        return 'UNDER_REVIEW';
      case ControlStatus.reviewed:
        return 'REVIEWED';
      case ControlStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension ControlStatusFromString on String {
  ControlStatus toControlStatus() {
    switch (this) {
      case 'UNDER_REVIEW':
        return ControlStatus.underReview;
      case 'REVIEWED':
        return ControlStatus.reviewed;
      case 'INACTIVE':
        return ControlStatus.inactive;
    }
    throw Exception('$this is not known in enum ControlStatus');
  }
}

enum ControlType {
  standard,
  custom,
}

extension ControlTypeValueExtension on ControlType {
  String toValue() {
    switch (this) {
      case ControlType.standard:
        return 'Standard';
      case ControlType.custom:
        return 'Custom';
    }
  }
}

extension ControlTypeFromString on String {
  ControlType toControlType() {
    switch (this) {
      case 'Standard':
        return ControlType.standard;
      case 'Custom':
        return ControlType.custom;
    }
    throw Exception('$this is not known in enum ControlType');
  }
}

/// The control entity attributes that uniquely identify an existing control to
/// be added to a framework in Audit Manager.
class CreateAssessmentFrameworkControl {
  /// The unique identifier of the control.
  final String id;

  CreateAssessmentFrameworkControl({
    required this.id,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// A <code>controlSet</code> entity that represents a collection of controls in
/// Audit Manager. This doesn't contain the control set ID.
class CreateAssessmentFrameworkControlSet {
  /// The name of the control set.
  final String name;

  /// The list of controls within the control set. This doesn't contain the
  /// control set ID.
  final List<CreateAssessmentFrameworkControl>? controls;

  CreateAssessmentFrameworkControlSet({
    required this.name,
    this.controls,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final controls = this.controls;
    return {
      'name': name,
      if (controls != null) 'controls': controls,
    };
  }
}

class CreateAssessmentFrameworkResponse {
  /// The name of the new framework that the
  /// <code>CreateAssessmentFramework</code> API returned.
  final Framework? framework;

  CreateAssessmentFrameworkResponse({
    this.framework,
  });

  factory CreateAssessmentFrameworkResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAssessmentFrameworkResponse(
      framework: json['framework'] != null
          ? Framework.fromJson(json['framework'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final framework = this.framework;
    return {
      if (framework != null) 'framework': framework,
    };
  }
}

class CreateAssessmentReportResponse {
  /// The new assessment report that the <code>CreateAssessmentReport</code> API
  /// returned.
  final AssessmentReport? assessmentReport;

  CreateAssessmentReportResponse({
    this.assessmentReport,
  });

  factory CreateAssessmentReportResponse.fromJson(Map<String, dynamic> json) {
    return CreateAssessmentReportResponse(
      assessmentReport: json['assessmentReport'] != null
          ? AssessmentReport.fromJson(
              json['assessmentReport'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentReport = this.assessmentReport;
    return {
      if (assessmentReport != null) 'assessmentReport': assessmentReport,
    };
  }
}

class CreateAssessmentResponse {
  final Assessment? assessment;

  CreateAssessmentResponse({
    this.assessment,
  });

  factory CreateAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateAssessmentResponse(
      assessment: json['assessment'] != null
          ? Assessment.fromJson(json['assessment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assessment = this.assessment;
    return {
      if (assessment != null) 'assessment': assessment,
    };
  }
}

/// The control mapping fields that represent the source for evidence
/// collection, along with related parameters and metadata. This doesn't contain
/// <code>mappingID</code>.
class CreateControlMappingSource {
  /// The description of the data source that determines where Audit Manager
  /// collects evidence from for the control.
  final String? sourceDescription;

  /// Specifies how often evidence is collected from the control mapping source.
  final SourceFrequency? sourceFrequency;
  final SourceKeyword? sourceKeyword;

  /// The name of the control mapping data source.
  final String? sourceName;

  /// The setup option for the data source, which reflects if the evidence
  /// collection is automated or manual.
  final SourceSetUpOption? sourceSetUpOption;

  /// Specifies one of the five types of data sources for evidence collection.
  final SourceType? sourceType;

  /// The instructions for troubleshooting the control.
  final String? troubleshootingText;

  CreateControlMappingSource({
    this.sourceDescription,
    this.sourceFrequency,
    this.sourceKeyword,
    this.sourceName,
    this.sourceSetUpOption,
    this.sourceType,
    this.troubleshootingText,
  });

  Map<String, dynamic> toJson() {
    final sourceDescription = this.sourceDescription;
    final sourceFrequency = this.sourceFrequency;
    final sourceKeyword = this.sourceKeyword;
    final sourceName = this.sourceName;
    final sourceSetUpOption = this.sourceSetUpOption;
    final sourceType = this.sourceType;
    final troubleshootingText = this.troubleshootingText;
    return {
      if (sourceDescription != null) 'sourceDescription': sourceDescription,
      if (sourceFrequency != null) 'sourceFrequency': sourceFrequency.toValue(),
      if (sourceKeyword != null) 'sourceKeyword': sourceKeyword,
      if (sourceName != null) 'sourceName': sourceName,
      if (sourceSetUpOption != null)
        'sourceSetUpOption': sourceSetUpOption.toValue(),
      if (sourceType != null) 'sourceType': sourceType.toValue(),
      if (troubleshootingText != null)
        'troubleshootingText': troubleshootingText,
    };
  }
}

class CreateControlResponse {
  /// The new control that the <code>CreateControl</code> API returned.
  final Control? control;

  CreateControlResponse({
    this.control,
  });

  factory CreateControlResponse.fromJson(Map<String, dynamic> json) {
    return CreateControlResponse(
      control: json['control'] != null
          ? Control.fromJson(json['control'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final control = this.control;
    return {
      if (control != null) 'control': control,
    };
  }
}

/// A collection of attributes that's used to create a delegation for an
/// assessment in Audit Manager.
class CreateDelegationRequest {
  /// A comment that's related to the delegation request.
  final String? comment;

  /// The unique identifier for the control set.
  final String? controlSetId;

  /// The Amazon Resource Name (ARN) of the IAM role.
  final String? roleArn;

  /// The type of customer persona.
  /// <note>
  /// In <code>CreateAssessment</code>, <code>roleType</code> can only be
  /// <code>PROCESS_OWNER</code>.
  ///
  /// In <code>UpdateSettings</code>, <code>roleType</code> can only be
  /// <code>PROCESS_OWNER</code>.
  ///
  /// In <code>BatchCreateDelegationByAssessment</code>, <code>roleType</code> can
  /// only be <code>RESOURCE_OWNER</code>.
  /// </note>
  final RoleType? roleType;

  CreateDelegationRequest({
    this.comment,
    this.controlSetId,
    this.roleArn,
    this.roleType,
  });

  factory CreateDelegationRequest.fromJson(Map<String, dynamic> json) {
    return CreateDelegationRequest(
      comment: json['comment'] as String?,
      controlSetId: json['controlSetId'] as String?,
      roleArn: json['roleArn'] as String?,
      roleType: (json['roleType'] as String?)?.toRoleType(),
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final controlSetId = this.controlSetId;
    final roleArn = this.roleArn;
    final roleType = this.roleType;
    return {
      if (comment != null) 'comment': comment,
      if (controlSetId != null) 'controlSetId': controlSetId,
      if (roleArn != null) 'roleArn': roleArn,
      if (roleType != null) 'roleType': roleType.toValue(),
    };
  }
}

/// The default s3 bucket where Audit Manager saves the files that you export
/// from evidence finder.
class DefaultExportDestination {
  /// The destination bucket where Audit Manager stores exported files.
  final String? destination;

  /// The destination type, such as Amazon S3.
  final ExportDestinationType? destinationType;

  DefaultExportDestination({
    this.destination,
    this.destinationType,
  });

  factory DefaultExportDestination.fromJson(Map<String, dynamic> json) {
    return DefaultExportDestination(
      destination: json['destination'] as String?,
      destinationType:
          (json['destinationType'] as String?)?.toExportDestinationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final destinationType = this.destinationType;
    return {
      if (destination != null) 'destination': destination,
      if (destinationType != null) 'destinationType': destinationType.toValue(),
    };
  }
}

/// The assignment of a control set to a delegate for review.
class Delegation {
  /// The identifier for the assessment that's associated with the delegation.
  final String? assessmentId;

  /// The name of the assessment that's associated with the delegation.
  final String? assessmentName;

  /// The comment that's related to the delegation.
  final String? comment;

  /// The identifier for the control set that's associated with the delegation.
  final String? controlSetId;

  /// The user or role that created the delegation.
  final String? createdBy;

  /// Specifies when the delegation was created.
  final DateTime? creationTime;

  /// The unique identifier for the delegation.
  final String? id;

  /// Specifies when the delegation was last updated.
  final DateTime? lastUpdated;

  /// The Amazon Resource Name (ARN) of the IAM role.
  final String? roleArn;

  /// The type of customer persona.
  /// <note>
  /// In <code>CreateAssessment</code>, <code>roleType</code> can only be
  /// <code>PROCESS_OWNER</code>.
  ///
  /// In <code>UpdateSettings</code>, <code>roleType</code> can only be
  /// <code>PROCESS_OWNER</code>.
  ///
  /// In <code>BatchCreateDelegationByAssessment</code>, <code>roleType</code> can
  /// only be <code>RESOURCE_OWNER</code>.
  /// </note>
  final RoleType? roleType;

  /// The status of the delegation.
  final DelegationStatus? status;

  Delegation({
    this.assessmentId,
    this.assessmentName,
    this.comment,
    this.controlSetId,
    this.createdBy,
    this.creationTime,
    this.id,
    this.lastUpdated,
    this.roleArn,
    this.roleType,
    this.status,
  });

  factory Delegation.fromJson(Map<String, dynamic> json) {
    return Delegation(
      assessmentId: json['assessmentId'] as String?,
      assessmentName: json['assessmentName'] as String?,
      comment: json['comment'] as String?,
      controlSetId: json['controlSetId'] as String?,
      createdBy: json['createdBy'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      id: json['id'] as String?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      roleArn: json['roleArn'] as String?,
      roleType: (json['roleType'] as String?)?.toRoleType(),
      status: (json['status'] as String?)?.toDelegationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final assessmentName = this.assessmentName;
    final comment = this.comment;
    final controlSetId = this.controlSetId;
    final createdBy = this.createdBy;
    final creationTime = this.creationTime;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final roleArn = this.roleArn;
    final roleType = this.roleType;
    final status = this.status;
    return {
      if (assessmentId != null) 'assessmentId': assessmentId,
      if (assessmentName != null) 'assessmentName': assessmentName,
      if (comment != null) 'comment': comment,
      if (controlSetId != null) 'controlSetId': controlSetId,
      if (createdBy != null) 'createdBy': createdBy,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (id != null) 'id': id,
      if (lastUpdated != null) 'lastUpdated': unixTimestampToJson(lastUpdated),
      if (roleArn != null) 'roleArn': roleArn,
      if (roleType != null) 'roleType': roleType.toValue(),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The metadata that's associated with the delegation.
class DelegationMetadata {
  /// The unique identifier for the assessment.
  final String? assessmentId;

  /// The name of the associated assessment.
  final String? assessmentName;

  /// Specifies the name of the control set that was delegated for review.
  final String? controlSetName;

  /// Specifies when the delegation was created.
  final DateTime? creationTime;

  /// The unique identifier for the delegation.
  final String? id;

  /// The Amazon Resource Name (ARN) of the IAM role.
  final String? roleArn;

  /// The current status of the delegation.
  final DelegationStatus? status;

  DelegationMetadata({
    this.assessmentId,
    this.assessmentName,
    this.controlSetName,
    this.creationTime,
    this.id,
    this.roleArn,
    this.status,
  });

  factory DelegationMetadata.fromJson(Map<String, dynamic> json) {
    return DelegationMetadata(
      assessmentId: json['assessmentId'] as String?,
      assessmentName: json['assessmentName'] as String?,
      controlSetName: json['controlSetName'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      id: json['id'] as String?,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.toDelegationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final assessmentName = this.assessmentName;
    final controlSetName = this.controlSetName;
    final creationTime = this.creationTime;
    final id = this.id;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (assessmentId != null) 'assessmentId': assessmentId,
      if (assessmentName != null) 'assessmentName': assessmentName,
      if (controlSetName != null) 'controlSetName': controlSetName,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (id != null) 'id': id,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum DelegationStatus {
  inProgress,
  underReview,
  complete,
}

extension DelegationStatusValueExtension on DelegationStatus {
  String toValue() {
    switch (this) {
      case DelegationStatus.inProgress:
        return 'IN_PROGRESS';
      case DelegationStatus.underReview:
        return 'UNDER_REVIEW';
      case DelegationStatus.complete:
        return 'COMPLETE';
    }
  }
}

extension DelegationStatusFromString on String {
  DelegationStatus toDelegationStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return DelegationStatus.inProgress;
      case 'UNDER_REVIEW':
        return DelegationStatus.underReview;
      case 'COMPLETE':
        return DelegationStatus.complete;
    }
    throw Exception('$this is not known in enum DelegationStatus');
  }
}

class DeleteAssessmentFrameworkResponse {
  DeleteAssessmentFrameworkResponse();

  factory DeleteAssessmentFrameworkResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAssessmentFrameworkResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAssessmentFrameworkShareResponse {
  DeleteAssessmentFrameworkShareResponse();

  factory DeleteAssessmentFrameworkShareResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteAssessmentFrameworkShareResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAssessmentReportResponse {
  DeleteAssessmentReportResponse();

  factory DeleteAssessmentReportResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAssessmentReportResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAssessmentResponse {
  DeleteAssessmentResponse();

  factory DeleteAssessmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAssessmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteControlResponse {
  DeleteControlResponse();

  factory DeleteControlResponse.fromJson(Map<String, dynamic> _) {
    return DeleteControlResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DeleteResources {
  all,
  $default,
}

extension DeleteResourcesValueExtension on DeleteResources {
  String toValue() {
    switch (this) {
      case DeleteResources.all:
        return 'ALL';
      case DeleteResources.$default:
        return 'DEFAULT';
    }
  }
}

extension DeleteResourcesFromString on String {
  DeleteResources toDeleteResources() {
    switch (this) {
      case 'ALL':
        return DeleteResources.all;
      case 'DEFAULT':
        return DeleteResources.$default;
    }
    throw Exception('$this is not known in enum DeleteResources');
  }
}

class DeregisterAccountResponse {
  /// The registration status of the account.
  final AccountStatus? status;

  DeregisterAccountResponse({
    this.status,
  });

  factory DeregisterAccountResponse.fromJson(Map<String, dynamic> json) {
    return DeregisterAccountResponse(
      status: (json['status'] as String?)?.toAccountStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

class DeregisterOrganizationAdminAccountResponse {
  DeregisterOrganizationAdminAccountResponse();

  factory DeregisterOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DeregisterOrganizationAdminAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The deregistration policy for the data that's stored in Audit Manager. You
/// can use this attribute to determine how your data is handled when you <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_DeregisterAccount.html">deregister
/// Audit Manager</a>.
///
/// By default, Audit Manager retains evidence data for two years from the time
/// of its creation. Other Audit Manager resources (including assessments,
/// custom controls, and custom frameworks) remain in Audit Manager
/// indefinitely, and are available if you <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_RegisterAccount.html">re-register
/// Audit Manager</a> in the future. For more information about data retention,
/// see <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/data-protection.html">Data
/// Protection</a> in the <i>Audit Manager User Guide</i>.
/// <important>
/// If you choose to delete all data, this action permanently deletes all
/// evidence data in your account within seven days. It also deletes all of the
/// Audit Manager resources that you created, including assessments, custom
/// controls, and custom frameworks. Your data will not be available if you
/// re-register Audit Manager in the future.
/// </important>
class DeregistrationPolicy {
  /// Specifies which Audit Manager data will be deleted when you deregister Audit
  /// Manager.
  ///
  /// <ul>
  /// <li>
  /// If you set the value to <code>ALL</code>, all of your data is deleted within
  /// seven days of deregistration.
  /// </li>
  /// <li>
  /// If you set the value to <code>DEFAULT</code>, none of your data is deleted
  /// at the time of deregistration. However, keep in mind that the Audit Manager
  /// data retention policy still applies. As a result, any evidence data will be
  /// deleted two years after its creation date. Your other Audit Manager
  /// resources will continue to exist indefinitely.
  /// </li>
  /// </ul>
  final DeleteResources? deleteResources;

  DeregistrationPolicy({
    this.deleteResources,
  });

  factory DeregistrationPolicy.fromJson(Map<String, dynamic> json) {
    return DeregistrationPolicy(
      deleteResources:
          (json['deleteResources'] as String?)?.toDeleteResources(),
    );
  }

  Map<String, dynamic> toJson() {
    final deleteResources = this.deleteResources;
    return {
      if (deleteResources != null) 'deleteResources': deleteResources.toValue(),
    };
  }
}

class DisassociateAssessmentReportEvidenceFolderResponse {
  DisassociateAssessmentReportEvidenceFolderResponse();

  factory DisassociateAssessmentReportEvidenceFolderResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateAssessmentReportEvidenceFolderResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A record that contains the information needed to demonstrate compliance with
/// the requirements specified by a control. Examples of evidence include change
/// activity invoked by a user, or a system configuration snapshot.
class Evidence {
  /// Specifies whether the evidence is included in the assessment report.
  final String? assessmentReportSelection;

  /// The names and values that are used by the evidence event. This includes an
  /// attribute name (such as <code>allowUsersToChangePassword</code>) and value
  /// (such as <code>true</code> or <code>false</code>).
  final Map<String, String>? attributes;

  /// The identifier for the Amazon Web Services account.
  final String? awsAccountId;

  /// The Amazon Web Services account that the evidence is collected from, and its
  /// organization path.
  final String? awsOrganization;

  /// The evaluation status for automated evidence that falls under the compliance
  /// check category.
  ///
  /// <ul>
  /// <li>
  /// Audit Manager classes evidence as non-compliant if Security Hub reports a
  /// <i>Fail</i> result, or if Config reports a <i>Non-compliant</i> result.
  /// </li>
  /// <li>
  /// Audit Manager classes evidence as compliant if Security Hub reports a
  /// <i>Pass</i> result, or if Config reports a <i>Compliant</i> result.
  /// </li>
  /// <li>
  /// If a compliance check isn't available or applicable, then no compliance
  /// evaluation can be made for that evidence. This is the case if the evidence
  /// uses Config or Security Hub as the underlying data source type, but those
  /// services aren't enabled. This is also the case if the evidence uses an
  /// underlying data source type that doesn't support compliance checks (such as
  /// manual evidence, Amazon Web Services API calls, or CloudTrail).
  /// </li>
  /// </ul>
  final String? complianceCheck;

  /// The data source where the evidence was collected from.
  final String? dataSource;

  /// The name of the evidence event.
  final String? eventName;

  /// The Amazon Web Service that the evidence is collected from.
  final String? eventSource;

  /// The identifier for the Amazon Web Services account.
  final String? evidenceAwsAccountId;

  /// The type of automated evidence.
  final String? evidenceByType;

  /// The identifier for the folder that the evidence is stored in.
  final String? evidenceFolderId;

  /// The unique identifier for the user or role that's associated with the
  /// evidence.
  final String? iamId;

  /// The identifier for the evidence.
  final String? id;

  /// The list of resources that are assessed to generate the evidence.
  final List<Resource>? resourcesIncluded;

  /// The timestamp that represents when the evidence was collected.
  final DateTime? time;

  Evidence({
    this.assessmentReportSelection,
    this.attributes,
    this.awsAccountId,
    this.awsOrganization,
    this.complianceCheck,
    this.dataSource,
    this.eventName,
    this.eventSource,
    this.evidenceAwsAccountId,
    this.evidenceByType,
    this.evidenceFolderId,
    this.iamId,
    this.id,
    this.resourcesIncluded,
    this.time,
  });

  factory Evidence.fromJson(Map<String, dynamic> json) {
    return Evidence(
      assessmentReportSelection: json['assessmentReportSelection'] as String?,
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      awsAccountId: json['awsAccountId'] as String?,
      awsOrganization: json['awsOrganization'] as String?,
      complianceCheck: json['complianceCheck'] as String?,
      dataSource: json['dataSource'] as String?,
      eventName: json['eventName'] as String?,
      eventSource: json['eventSource'] as String?,
      evidenceAwsAccountId: json['evidenceAwsAccountId'] as String?,
      evidenceByType: json['evidenceByType'] as String?,
      evidenceFolderId: json['evidenceFolderId'] as String?,
      iamId: json['iamId'] as String?,
      id: json['id'] as String?,
      resourcesIncluded: (json['resourcesIncluded'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: timeStampFromJson(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentReportSelection = this.assessmentReportSelection;
    final attributes = this.attributes;
    final awsAccountId = this.awsAccountId;
    final awsOrganization = this.awsOrganization;
    final complianceCheck = this.complianceCheck;
    final dataSource = this.dataSource;
    final eventName = this.eventName;
    final eventSource = this.eventSource;
    final evidenceAwsAccountId = this.evidenceAwsAccountId;
    final evidenceByType = this.evidenceByType;
    final evidenceFolderId = this.evidenceFolderId;
    final iamId = this.iamId;
    final id = this.id;
    final resourcesIncluded = this.resourcesIncluded;
    final time = this.time;
    return {
      if (assessmentReportSelection != null)
        'assessmentReportSelection': assessmentReportSelection,
      if (attributes != null) 'attributes': attributes,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsOrganization != null) 'awsOrganization': awsOrganization,
      if (complianceCheck != null) 'complianceCheck': complianceCheck,
      if (dataSource != null) 'dataSource': dataSource,
      if (eventName != null) 'eventName': eventName,
      if (eventSource != null) 'eventSource': eventSource,
      if (evidenceAwsAccountId != null)
        'evidenceAwsAccountId': evidenceAwsAccountId,
      if (evidenceByType != null) 'evidenceByType': evidenceByType,
      if (evidenceFolderId != null) 'evidenceFolderId': evidenceFolderId,
      if (iamId != null) 'iamId': iamId,
      if (id != null) 'id': id,
      if (resourcesIncluded != null) 'resourcesIncluded': resourcesIncluded,
      if (time != null) 'time': unixTimestampToJson(time),
    };
  }
}

enum EvidenceFinderBackfillStatus {
  notStarted,
  inProgress,
  completed,
}

extension EvidenceFinderBackfillStatusValueExtension
    on EvidenceFinderBackfillStatus {
  String toValue() {
    switch (this) {
      case EvidenceFinderBackfillStatus.notStarted:
        return 'NOT_STARTED';
      case EvidenceFinderBackfillStatus.inProgress:
        return 'IN_PROGRESS';
      case EvidenceFinderBackfillStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension EvidenceFinderBackfillStatusFromString on String {
  EvidenceFinderBackfillStatus toEvidenceFinderBackfillStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return EvidenceFinderBackfillStatus.notStarted;
      case 'IN_PROGRESS':
        return EvidenceFinderBackfillStatus.inProgress;
      case 'COMPLETED':
        return EvidenceFinderBackfillStatus.completed;
    }
    throw Exception('$this is not known in enum EvidenceFinderBackfillStatus');
  }
}

/// The settings object that specifies whether evidence finder is enabled. This
/// object also describes the related event data store, and the backfill status
/// for populating the event data store with evidence data.
class EvidenceFinderEnablement {
  /// The current status of the evidence data backfill process.
  ///
  /// The backfill starts after you enable evidence finder. During this task,
  /// Audit Manager populates an event data store with your past two years’ worth
  /// of evidence data so that your evidence can be queried.
  ///
  /// <ul>
  /// <li>
  /// <code>NOT_STARTED</code> means that the backfill hasn’t started yet.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> means that the backfill is in progress. This can
  /// take up to 7 days to complete, depending on the amount of evidence data.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code> means that the backfill is complete. All of your past
  /// evidence is now queryable.
  /// </li>
  /// </ul>
  final EvidenceFinderBackfillStatus? backfillStatus;

  /// The current status of the evidence finder feature and the related event data
  /// store.
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLE_IN_PROGRESS</code> means that you requested to enable evidence
  /// finder. An event data store is currently being created to support evidence
  /// finder queries.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> means that an event data store was successfully created
  /// and evidence finder is enabled. We recommend that you wait 7 days until the
  /// event data store is backfilled with your past two years’ worth of evidence
  /// data. You can use evidence finder in the meantime, but not all data might be
  /// available until the backfill is complete.
  /// </li>
  /// <li>
  /// <code>DISABLE_IN_PROGRESS</code> means that you requested to disable
  /// evidence finder, and your request is pending the deletion of the event data
  /// store.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> means that you have permanently disabled evidence
  /// finder and the event data store has been deleted. You can't re-enable
  /// evidence finder after this point.
  /// </li>
  /// </ul>
  final EvidenceFinderEnablementStatus? enablementStatus;

  /// Represents any errors that occurred when enabling or disabling evidence
  /// finder.
  final String? error;

  /// The Amazon Resource Name (ARN) of the CloudTrail Lake event data store
  /// that’s used by evidence finder. The event data store is the lake of evidence
  /// data that evidence finder runs queries against.
  final String? eventDataStoreArn;

  EvidenceFinderEnablement({
    this.backfillStatus,
    this.enablementStatus,
    this.error,
    this.eventDataStoreArn,
  });

  factory EvidenceFinderEnablement.fromJson(Map<String, dynamic> json) {
    return EvidenceFinderEnablement(
      backfillStatus:
          (json['backfillStatus'] as String?)?.toEvidenceFinderBackfillStatus(),
      enablementStatus: (json['enablementStatus'] as String?)
          ?.toEvidenceFinderEnablementStatus(),
      error: json['error'] as String?,
      eventDataStoreArn: json['eventDataStoreArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backfillStatus = this.backfillStatus;
    final enablementStatus = this.enablementStatus;
    final error = this.error;
    final eventDataStoreArn = this.eventDataStoreArn;
    return {
      if (backfillStatus != null) 'backfillStatus': backfillStatus.toValue(),
      if (enablementStatus != null)
        'enablementStatus': enablementStatus.toValue(),
      if (error != null) 'error': error,
      if (eventDataStoreArn != null) 'eventDataStoreArn': eventDataStoreArn,
    };
  }
}

enum EvidenceFinderEnablementStatus {
  enabled,
  disabled,
  enableInProgress,
  disableInProgress,
}

extension EvidenceFinderEnablementStatusValueExtension
    on EvidenceFinderEnablementStatus {
  String toValue() {
    switch (this) {
      case EvidenceFinderEnablementStatus.enabled:
        return 'ENABLED';
      case EvidenceFinderEnablementStatus.disabled:
        return 'DISABLED';
      case EvidenceFinderEnablementStatus.enableInProgress:
        return 'ENABLE_IN_PROGRESS';
      case EvidenceFinderEnablementStatus.disableInProgress:
        return 'DISABLE_IN_PROGRESS';
    }
  }
}

extension EvidenceFinderEnablementStatusFromString on String {
  EvidenceFinderEnablementStatus toEvidenceFinderEnablementStatus() {
    switch (this) {
      case 'ENABLED':
        return EvidenceFinderEnablementStatus.enabled;
      case 'DISABLED':
        return EvidenceFinderEnablementStatus.disabled;
      case 'ENABLE_IN_PROGRESS':
        return EvidenceFinderEnablementStatus.enableInProgress;
      case 'DISABLE_IN_PROGRESS':
        return EvidenceFinderEnablementStatus.disableInProgress;
    }
    throw Exception(
        '$this is not known in enum EvidenceFinderEnablementStatus');
  }
}

/// A breakdown of the latest compliance check status for the evidence in your
/// Audit Manager assessments.
class EvidenceInsights {
  /// The number of compliance check evidence that Audit Manager classified as
  /// compliant. This includes evidence that was collected from Security Hub with
  /// a <i>Pass</i> ruling, or collected from Config with a <i>Compliant</i>
  /// ruling.
  final int? compliantEvidenceCount;

  /// The number of evidence that a compliance check ruling isn't available for.
  /// Evidence is inconclusive when the associated control uses Security Hub or
  /// Config as a data source but you didn't enable those services. This is also
  /// the case when a control uses a data source that doesn’t support compliance
  /// checks (for example, manual evidence, API calls, or CloudTrail).
  /// <note>
  /// If evidence has a compliance check status of <i>not applicable</i> in the
  /// console, it's classified as <i>inconclusive</i> in
  /// <code>EvidenceInsights</code> data.
  /// </note>
  final int? inconclusiveEvidenceCount;

  /// The number of compliance check evidence that Audit Manager classified as
  /// non-compliant. This includes evidence that was collected from Security Hub
  /// with a <i>Fail</i> ruling, or collected from Config with a
  /// <i>Non-compliant</i> ruling.
  final int? noncompliantEvidenceCount;

  EvidenceInsights({
    this.compliantEvidenceCount,
    this.inconclusiveEvidenceCount,
    this.noncompliantEvidenceCount,
  });

  factory EvidenceInsights.fromJson(Map<String, dynamic> json) {
    return EvidenceInsights(
      compliantEvidenceCount: json['compliantEvidenceCount'] as int?,
      inconclusiveEvidenceCount: json['inconclusiveEvidenceCount'] as int?,
      noncompliantEvidenceCount: json['noncompliantEvidenceCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final compliantEvidenceCount = this.compliantEvidenceCount;
    final inconclusiveEvidenceCount = this.inconclusiveEvidenceCount;
    final noncompliantEvidenceCount = this.noncompliantEvidenceCount;
    return {
      if (compliantEvidenceCount != null)
        'compliantEvidenceCount': compliantEvidenceCount,
      if (inconclusiveEvidenceCount != null)
        'inconclusiveEvidenceCount': inconclusiveEvidenceCount,
      if (noncompliantEvidenceCount != null)
        'noncompliantEvidenceCount': noncompliantEvidenceCount,
    };
  }
}

enum ExportDestinationType {
  s3,
}

extension ExportDestinationTypeValueExtension on ExportDestinationType {
  String toValue() {
    switch (this) {
      case ExportDestinationType.s3:
        return 'S3';
    }
  }
}

extension ExportDestinationTypeFromString on String {
  ExportDestinationType toExportDestinationType() {
    switch (this) {
      case 'S3':
        return ExportDestinationType.s3;
    }
    throw Exception('$this is not known in enum ExportDestinationType');
  }
}

/// The file that's used to structure and automate Audit Manager assessments for
/// a given compliance standard.
class Framework {
  /// The Amazon Resource Name (ARN) of the framework.
  final String? arn;

  /// The compliance type that the framework supports, such as CIS or HIPAA.
  final String? complianceType;

  /// The control sets that are associated with the framework.
  final List<ControlSet>? controlSets;

  /// The control data sources where Audit Manager collects evidence from.
  final String? controlSources;

  /// The time when the framework was created.
  final DateTime? createdAt;

  /// The user or role that created the framework.
  final String? createdBy;

  /// The description of the framework.
  final String? description;

  /// The unique identifier for the framework.
  final String? id;

  /// The time when the framework was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The user or role that most recently updated the framework.
  final String? lastUpdatedBy;

  /// The logo that's associated with the framework.
  final String? logo;

  /// The name of the framework.
  final String? name;

  /// The tags that are associated with the framework.
  final Map<String, String>? tags;

  /// Specifies whether the framework is a standard framework or a custom
  /// framework.
  final FrameworkType? type;

  Framework({
    this.arn,
    this.complianceType,
    this.controlSets,
    this.controlSources,
    this.createdAt,
    this.createdBy,
    this.description,
    this.id,
    this.lastUpdatedAt,
    this.lastUpdatedBy,
    this.logo,
    this.name,
    this.tags,
    this.type,
  });

  factory Framework.fromJson(Map<String, dynamic> json) {
    return Framework(
      arn: json['arn'] as String?,
      complianceType: json['complianceType'] as String?,
      controlSets: (json['controlSets'] as List?)
          ?.whereNotNull()
          .map((e) => ControlSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      controlSources: json['controlSources'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      lastUpdatedBy: json['lastUpdatedBy'] as String?,
      logo: json['logo'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toFrameworkType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final complianceType = this.complianceType;
    final controlSets = this.controlSets;
    final controlSources = this.controlSources;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final description = this.description;
    final id = this.id;
    final lastUpdatedAt = this.lastUpdatedAt;
    final lastUpdatedBy = this.lastUpdatedBy;
    final logo = this.logo;
    final name = this.name;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (complianceType != null) 'complianceType': complianceType,
      if (controlSets != null) 'controlSets': controlSets,
      if (controlSources != null) 'controlSources': controlSources,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (lastUpdatedBy != null) 'lastUpdatedBy': lastUpdatedBy,
      if (logo != null) 'logo': logo,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// The metadata of a framework, such as the name, ID, or description.
class FrameworkMetadata {
  /// The compliance standard that's associated with the framework. For example,
  /// this could be PCI DSS or HIPAA.
  final String? complianceType;

  /// The description of the framework.
  final String? description;

  /// The logo that's associated with the framework.
  final String? logo;

  /// The name of the framework.
  final String? name;

  FrameworkMetadata({
    this.complianceType,
    this.description,
    this.logo,
    this.name,
  });

  factory FrameworkMetadata.fromJson(Map<String, dynamic> json) {
    return FrameworkMetadata(
      complianceType: json['complianceType'] as String?,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceType = this.complianceType;
    final description = this.description;
    final logo = this.logo;
    final name = this.name;
    return {
      if (complianceType != null) 'complianceType': complianceType,
      if (description != null) 'description': description,
      if (logo != null) 'logo': logo,
      if (name != null) 'name': name,
    };
  }
}

enum FrameworkType {
  standard,
  custom,
}

extension FrameworkTypeValueExtension on FrameworkType {
  String toValue() {
    switch (this) {
      case FrameworkType.standard:
        return 'Standard';
      case FrameworkType.custom:
        return 'Custom';
    }
  }
}

extension FrameworkTypeFromString on String {
  FrameworkType toFrameworkType() {
    switch (this) {
      case 'Standard':
        return FrameworkType.standard;
      case 'Custom':
        return FrameworkType.custom;
    }
    throw Exception('$this is not known in enum FrameworkType');
  }
}

class GetAccountStatusResponse {
  /// The status of the Amazon Web Services account.
  final AccountStatus? status;

  GetAccountStatusResponse({
    this.status,
  });

  factory GetAccountStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountStatusResponse(
      status: (json['status'] as String?)?.toAccountStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetAssessmentFrameworkResponse {
  /// The framework that the <code>GetAssessmentFramework</code> API returned.
  final Framework? framework;

  GetAssessmentFrameworkResponse({
    this.framework,
  });

  factory GetAssessmentFrameworkResponse.fromJson(Map<String, dynamic> json) {
    return GetAssessmentFrameworkResponse(
      framework: json['framework'] != null
          ? Framework.fromJson(json['framework'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final framework = this.framework;
    return {
      if (framework != null) 'framework': framework,
    };
  }
}

class GetAssessmentReportUrlResponse {
  final URL? preSignedUrl;

  GetAssessmentReportUrlResponse({
    this.preSignedUrl,
  });

  factory GetAssessmentReportUrlResponse.fromJson(Map<String, dynamic> json) {
    return GetAssessmentReportUrlResponse(
      preSignedUrl: json['preSignedUrl'] != null
          ? URL.fromJson(json['preSignedUrl'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final preSignedUrl = this.preSignedUrl;
    return {
      if (preSignedUrl != null) 'preSignedUrl': preSignedUrl,
    };
  }
}

class GetAssessmentResponse {
  final Assessment? assessment;
  final Role? userRole;

  GetAssessmentResponse({
    this.assessment,
    this.userRole,
  });

  factory GetAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return GetAssessmentResponse(
      assessment: json['assessment'] != null
          ? Assessment.fromJson(json['assessment'] as Map<String, dynamic>)
          : null,
      userRole: json['userRole'] != null
          ? Role.fromJson(json['userRole'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assessment = this.assessment;
    final userRole = this.userRole;
    return {
      if (assessment != null) 'assessment': assessment,
      if (userRole != null) 'userRole': userRole,
    };
  }
}

class GetChangeLogsResponse {
  /// The list of user activity for the control.
  final List<ChangeLog>? changeLogs;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  GetChangeLogsResponse({
    this.changeLogs,
    this.nextToken,
  });

  factory GetChangeLogsResponse.fromJson(Map<String, dynamic> json) {
    return GetChangeLogsResponse(
      changeLogs: (json['changeLogs'] as List?)
          ?.whereNotNull()
          .map((e) => ChangeLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeLogs = this.changeLogs;
    final nextToken = this.nextToken;
    return {
      if (changeLogs != null) 'changeLogs': changeLogs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetControlResponse {
  /// The details of the control that the <code>GetControl</code> API returned.
  final Control? control;

  GetControlResponse({
    this.control,
  });

  factory GetControlResponse.fromJson(Map<String, dynamic> json) {
    return GetControlResponse(
      control: json['control'] != null
          ? Control.fromJson(json['control'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final control = this.control;
    return {
      if (control != null) 'control': control,
    };
  }
}

class GetDelegationsResponse {
  /// The list of delegations that the <code>GetDelegations</code> API returned.
  final List<DelegationMetadata>? delegations;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  GetDelegationsResponse({
    this.delegations,
    this.nextToken,
  });

  factory GetDelegationsResponse.fromJson(Map<String, dynamic> json) {
    return GetDelegationsResponse(
      delegations: (json['delegations'] as List?)
          ?.whereNotNull()
          .map((e) => DelegationMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final delegations = this.delegations;
    final nextToken = this.nextToken;
    return {
      if (delegations != null) 'delegations': delegations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetEvidenceByEvidenceFolderResponse {
  /// The list of evidence that the <code>GetEvidenceByEvidenceFolder</code> API
  /// returned.
  final List<Evidence>? evidence;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  GetEvidenceByEvidenceFolderResponse({
    this.evidence,
    this.nextToken,
  });

  factory GetEvidenceByEvidenceFolderResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEvidenceByEvidenceFolderResponse(
      evidence: (json['evidence'] as List?)
          ?.whereNotNull()
          .map((e) => Evidence.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evidence = this.evidence;
    final nextToken = this.nextToken;
    return {
      if (evidence != null) 'evidence': evidence,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetEvidenceFileUploadUrlResponse {
  /// The name of the uploaded manual evidence file that the presigned URL was
  /// generated for.
  final String? evidenceFileName;

  /// The presigned URL that was generated.
  final String? uploadUrl;

  GetEvidenceFileUploadUrlResponse({
    this.evidenceFileName,
    this.uploadUrl,
  });

  factory GetEvidenceFileUploadUrlResponse.fromJson(Map<String, dynamic> json) {
    return GetEvidenceFileUploadUrlResponse(
      evidenceFileName: json['evidenceFileName'] as String?,
      uploadUrl: json['uploadUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evidenceFileName = this.evidenceFileName;
    final uploadUrl = this.uploadUrl;
    return {
      if (evidenceFileName != null) 'evidenceFileName': evidenceFileName,
      if (uploadUrl != null) 'uploadUrl': uploadUrl,
    };
  }
}

class GetEvidenceFolderResponse {
  /// The folder that the evidence is stored in.
  final AssessmentEvidenceFolder? evidenceFolder;

  GetEvidenceFolderResponse({
    this.evidenceFolder,
  });

  factory GetEvidenceFolderResponse.fromJson(Map<String, dynamic> json) {
    return GetEvidenceFolderResponse(
      evidenceFolder: json['evidenceFolder'] != null
          ? AssessmentEvidenceFolder.fromJson(
              json['evidenceFolder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final evidenceFolder = this.evidenceFolder;
    return {
      if (evidenceFolder != null) 'evidenceFolder': evidenceFolder,
    };
  }
}

class GetEvidenceFoldersByAssessmentControlResponse {
  /// The list of evidence folders that the
  /// <code>GetEvidenceFoldersByAssessmentControl</code> API returned.
  final List<AssessmentEvidenceFolder>? evidenceFolders;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  GetEvidenceFoldersByAssessmentControlResponse({
    this.evidenceFolders,
    this.nextToken,
  });

  factory GetEvidenceFoldersByAssessmentControlResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEvidenceFoldersByAssessmentControlResponse(
      evidenceFolders: (json['evidenceFolders'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AssessmentEvidenceFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evidenceFolders = this.evidenceFolders;
    final nextToken = this.nextToken;
    return {
      if (evidenceFolders != null) 'evidenceFolders': evidenceFolders,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetEvidenceFoldersByAssessmentResponse {
  /// The list of evidence folders that the
  /// <code>GetEvidenceFoldersByAssessment</code> API returned.
  final List<AssessmentEvidenceFolder>? evidenceFolders;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  GetEvidenceFoldersByAssessmentResponse({
    this.evidenceFolders,
    this.nextToken,
  });

  factory GetEvidenceFoldersByAssessmentResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEvidenceFoldersByAssessmentResponse(
      evidenceFolders: (json['evidenceFolders'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AssessmentEvidenceFolder.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evidenceFolders = this.evidenceFolders;
    final nextToken = this.nextToken;
    return {
      if (evidenceFolders != null) 'evidenceFolders': evidenceFolders,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetEvidenceResponse {
  /// The evidence that the <code>GetEvidence</code> API returned.
  final Evidence? evidence;

  GetEvidenceResponse({
    this.evidence,
  });

  factory GetEvidenceResponse.fromJson(Map<String, dynamic> json) {
    return GetEvidenceResponse(
      evidence: json['evidence'] != null
          ? Evidence.fromJson(json['evidence'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final evidence = this.evidence;
    return {
      if (evidence != null) 'evidence': evidence,
    };
  }
}

class GetInsightsByAssessmentResponse {
  /// The assessment analytics data that the <code>GetInsightsByAssessment</code>
  /// API returned.
  final InsightsByAssessment? insights;

  GetInsightsByAssessmentResponse({
    this.insights,
  });

  factory GetInsightsByAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return GetInsightsByAssessmentResponse(
      insights: json['insights'] != null
          ? InsightsByAssessment.fromJson(
              json['insights'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final insights = this.insights;
    return {
      if (insights != null) 'insights': insights,
    };
  }
}

class GetInsightsResponse {
  /// The analytics data that the <code>GetInsights</code> API returned.
  final Insights? insights;

  GetInsightsResponse({
    this.insights,
  });

  factory GetInsightsResponse.fromJson(Map<String, dynamic> json) {
    return GetInsightsResponse(
      insights: json['insights'] != null
          ? Insights.fromJson(json['insights'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final insights = this.insights;
    return {
      if (insights != null) 'insights': insights,
    };
  }
}

class GetOrganizationAdminAccountResponse {
  /// The identifier for the administrator account.
  final String? adminAccountId;

  /// The identifier for the organization.
  final String? organizationId;

  GetOrganizationAdminAccountResponse({
    this.adminAccountId,
    this.organizationId,
  });

  factory GetOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return GetOrganizationAdminAccountResponse(
      adminAccountId: json['adminAccountId'] as String?,
      organizationId: json['organizationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adminAccountId = this.adminAccountId;
    final organizationId = this.organizationId;
    return {
      if (adminAccountId != null) 'adminAccountId': adminAccountId,
      if (organizationId != null) 'organizationId': organizationId,
    };
  }
}

class GetServicesInScopeResponse {
  /// The metadata that's associated with the Amazon Web Service.
  final List<ServiceMetadata>? serviceMetadata;

  GetServicesInScopeResponse({
    this.serviceMetadata,
  });

  factory GetServicesInScopeResponse.fromJson(Map<String, dynamic> json) {
    return GetServicesInScopeResponse(
      serviceMetadata: (json['serviceMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceMetadata = this.serviceMetadata;
    return {
      if (serviceMetadata != null) 'serviceMetadata': serviceMetadata,
    };
  }
}

class GetSettingsResponse {
  /// The settings object that holds all supported Audit Manager settings.
  final Settings? settings;

  GetSettingsResponse({
    this.settings,
  });

  factory GetSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetSettingsResponse(
      settings: json['settings'] != null
          ? Settings.fromJson(json['settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final settings = this.settings;
    return {
      if (settings != null) 'settings': settings,
    };
  }
}

/// A summary of the latest analytics data for all your active assessments.
///
/// This summary is a snapshot of the data that your active assessments
/// collected on the <code>lastUpdated</code> date. It’s important to understand
/// that the following totals are daily counts based on this date — they aren’t
/// a total sum to date.
///
/// The <code>Insights</code> data is eventually consistent. This means that,
/// when you read data from <code>Insights</code>, the response might not
/// instantly reflect the results of a recently completed write or update
/// operation. If you repeat your read request after a few hours, the response
/// should return the latest data.
/// <note>
/// If you delete an assessment or change its status to inactive,
/// <code>InsightsByAssessment</code> includes data for that assessment as
/// follows.
///
/// <ul>
/// <li>
/// <b>Inactive assessments</b> - If Audit Manager collected evidence for your
/// assessment before you changed it inactive, that evidence is included in the
/// <code>InsightsByAssessment</code> counts for that day.
/// </li>
/// <li>
/// <b>Deleted assessments</b> - If Audit Manager collected evidence for your
/// assessment before you deleted it, that evidence isn't included in the
/// <code>InsightsByAssessment</code> counts for that day.
/// </li>
/// </ul> </note>
class Insights {
  /// The number of active assessments in Audit Manager.
  final int? activeAssessmentsCount;

  /// The number of assessment controls that collected non-compliant evidence on
  /// the <code>lastUpdated</code> date.
  final int? assessmentControlsCountByNoncompliantEvidence;

  /// The number of compliance check evidence that Audit Manager classified as
  /// compliant on the <code>lastUpdated</code> date. This includes evidence that
  /// was collected from Security Hub with a <i>Pass</i> ruling, or collected from
  /// Config with a <i>Compliant</i> ruling.
  final int? compliantEvidenceCount;

  /// The number of evidence without a compliance check ruling. Evidence is
  /// inconclusive when the associated control uses Security Hub or Config as a
  /// data source but you didn't enable those services. This is also the case when
  /// a control uses a data source that doesn’t support compliance checks (for
  /// example: manual evidence, API calls, or CloudTrail).
  /// <note>
  /// If evidence has a compliance check status of <i>not applicable</i>, it's
  /// classed as <i>inconclusive</i> in <code>Insights</code> data.
  /// </note>
  final int? inconclusiveEvidenceCount;

  /// The time when the cross-assessment insights were last updated.
  final DateTime? lastUpdated;

  /// The number of compliance check evidence that Audit Manager classified as
  /// non-compliant on the <code>lastUpdated</code> date. This includes evidence
  /// that was collected from Security Hub with a <i>Fail</i> ruling, or collected
  /// from Config with a <i>Non-compliant</i> ruling.
  final int? noncompliantEvidenceCount;

  /// The total number of controls across all active assessments.
  final int? totalAssessmentControlsCount;

  Insights({
    this.activeAssessmentsCount,
    this.assessmentControlsCountByNoncompliantEvidence,
    this.compliantEvidenceCount,
    this.inconclusiveEvidenceCount,
    this.lastUpdated,
    this.noncompliantEvidenceCount,
    this.totalAssessmentControlsCount,
  });

  factory Insights.fromJson(Map<String, dynamic> json) {
    return Insights(
      activeAssessmentsCount: json['activeAssessmentsCount'] as int?,
      assessmentControlsCountByNoncompliantEvidence:
          json['assessmentControlsCountByNoncompliantEvidence'] as int?,
      compliantEvidenceCount: json['compliantEvidenceCount'] as int?,
      inconclusiveEvidenceCount: json['inconclusiveEvidenceCount'] as int?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      noncompliantEvidenceCount: json['noncompliantEvidenceCount'] as int?,
      totalAssessmentControlsCount:
          json['totalAssessmentControlsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeAssessmentsCount = this.activeAssessmentsCount;
    final assessmentControlsCountByNoncompliantEvidence =
        this.assessmentControlsCountByNoncompliantEvidence;
    final compliantEvidenceCount = this.compliantEvidenceCount;
    final inconclusiveEvidenceCount = this.inconclusiveEvidenceCount;
    final lastUpdated = this.lastUpdated;
    final noncompliantEvidenceCount = this.noncompliantEvidenceCount;
    final totalAssessmentControlsCount = this.totalAssessmentControlsCount;
    return {
      if (activeAssessmentsCount != null)
        'activeAssessmentsCount': activeAssessmentsCount,
      if (assessmentControlsCountByNoncompliantEvidence != null)
        'assessmentControlsCountByNoncompliantEvidence':
            assessmentControlsCountByNoncompliantEvidence,
      if (compliantEvidenceCount != null)
        'compliantEvidenceCount': compliantEvidenceCount,
      if (inconclusiveEvidenceCount != null)
        'inconclusiveEvidenceCount': inconclusiveEvidenceCount,
      if (lastUpdated != null) 'lastUpdated': unixTimestampToJson(lastUpdated),
      if (noncompliantEvidenceCount != null)
        'noncompliantEvidenceCount': noncompliantEvidenceCount,
      if (totalAssessmentControlsCount != null)
        'totalAssessmentControlsCount': totalAssessmentControlsCount,
    };
  }
}

/// A summary of the latest analytics data for a specific active assessment.
///
/// This summary is a snapshot of the data that was collected on the
/// <code>lastUpdated</code> date. It’s important to understand that the totals
/// in <code>InsightsByAssessment</code> are daily counts based on this date —
/// they aren’t a total sum to date.
///
/// The <code>InsightsByAssessment</code> data is eventually consistent. This
/// means that when you read data from <code>InsightsByAssessment</code>, the
/// response might not instantly reflect the results of a recently completed
/// write or update operation. If you repeat your read request after a few
/// hours, the response returns the latest data.
/// <note>
/// If you delete an assessment or change its status to inactive,
/// <code>InsightsByAssessment</code> includes data for that assessment as
/// follows.
///
/// <ul>
/// <li>
/// <b>Inactive assessments</b> - If Audit Manager collected evidence for your
/// assessment before you changed it inactive, that evidence is included in the
/// <code>InsightsByAssessment</code> counts for that day.
/// </li>
/// <li>
/// <b>Deleted assessments</b> - If Audit Manager collected evidence for your
/// assessment before you deleted it, that evidence isn't included in the
/// <code>InsightsByAssessment</code> counts for that day.
/// </li>
/// </ul> </note>
class InsightsByAssessment {
  /// The number of assessment controls that collected non-compliant evidence on
  /// the <code>lastUpdated</code> date.
  final int? assessmentControlsCountByNoncompliantEvidence;

  /// The number of compliance check evidence that Audit Manager classified as
  /// compliant. This includes evidence that was collected from Security Hub with
  /// a <i>Pass</i> ruling, or collected from Config with a <i>Compliant</i>
  /// ruling.
  final int? compliantEvidenceCount;

  /// The amount of evidence without a compliance check ruling. Evidence is
  /// inconclusive if the associated control uses Security Hub or Config as a data
  /// source and you didn't enable those services. This is also the case if a
  /// control uses a data source that doesn’t support compliance checks (for
  /// example, manual evidence, API calls, or CloudTrail).
  /// <note>
  /// If evidence has a compliance check status of <i>not applicable</i>, it's
  /// classified as <i>inconclusive</i> in <code>InsightsByAssessment</code> data.
  /// </note>
  final int? inconclusiveEvidenceCount;

  /// The time when the assessment insights were last updated.
  final DateTime? lastUpdated;

  /// The number of compliance check evidence that Audit Manager classified as
  /// non-compliant. This includes evidence that was collected from Security Hub
  /// with a <i>Fail</i> ruling, or collected from Config with a
  /// <i>Non-compliant</i> ruling.
  final int? noncompliantEvidenceCount;

  /// The total number of controls in the assessment.
  final int? totalAssessmentControlsCount;

  InsightsByAssessment({
    this.assessmentControlsCountByNoncompliantEvidence,
    this.compliantEvidenceCount,
    this.inconclusiveEvidenceCount,
    this.lastUpdated,
    this.noncompliantEvidenceCount,
    this.totalAssessmentControlsCount,
  });

  factory InsightsByAssessment.fromJson(Map<String, dynamic> json) {
    return InsightsByAssessment(
      assessmentControlsCountByNoncompliantEvidence:
          json['assessmentControlsCountByNoncompliantEvidence'] as int?,
      compliantEvidenceCount: json['compliantEvidenceCount'] as int?,
      inconclusiveEvidenceCount: json['inconclusiveEvidenceCount'] as int?,
      lastUpdated: timeStampFromJson(json['lastUpdated']),
      noncompliantEvidenceCount: json['noncompliantEvidenceCount'] as int?,
      totalAssessmentControlsCount:
          json['totalAssessmentControlsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentControlsCountByNoncompliantEvidence =
        this.assessmentControlsCountByNoncompliantEvidence;
    final compliantEvidenceCount = this.compliantEvidenceCount;
    final inconclusiveEvidenceCount = this.inconclusiveEvidenceCount;
    final lastUpdated = this.lastUpdated;
    final noncompliantEvidenceCount = this.noncompliantEvidenceCount;
    final totalAssessmentControlsCount = this.totalAssessmentControlsCount;
    return {
      if (assessmentControlsCountByNoncompliantEvidence != null)
        'assessmentControlsCountByNoncompliantEvidence':
            assessmentControlsCountByNoncompliantEvidence,
      if (compliantEvidenceCount != null)
        'compliantEvidenceCount': compliantEvidenceCount,
      if (inconclusiveEvidenceCount != null)
        'inconclusiveEvidenceCount': inconclusiveEvidenceCount,
      if (lastUpdated != null) 'lastUpdated': unixTimestampToJson(lastUpdated),
      if (noncompliantEvidenceCount != null)
        'noncompliantEvidenceCount': noncompliantEvidenceCount,
      if (totalAssessmentControlsCount != null)
        'totalAssessmentControlsCount': totalAssessmentControlsCount,
    };
  }
}

enum KeywordInputType {
  selectFromList,
  uploadFile,
  inputText,
}

extension KeywordInputTypeValueExtension on KeywordInputType {
  String toValue() {
    switch (this) {
      case KeywordInputType.selectFromList:
        return 'SELECT_FROM_LIST';
      case KeywordInputType.uploadFile:
        return 'UPLOAD_FILE';
      case KeywordInputType.inputText:
        return 'INPUT_TEXT';
    }
  }
}

extension KeywordInputTypeFromString on String {
  KeywordInputType toKeywordInputType() {
    switch (this) {
      case 'SELECT_FROM_LIST':
        return KeywordInputType.selectFromList;
      case 'UPLOAD_FILE':
        return KeywordInputType.uploadFile;
      case 'INPUT_TEXT':
        return KeywordInputType.inputText;
    }
    throw Exception('$this is not known in enum KeywordInputType');
  }
}

class ListAssessmentControlInsightsByControlDomainResponse {
  /// The assessment control analytics data that the
  /// <code>ListAssessmentControlInsightsByControlDomain</code> API returned.
  final List<ControlInsightsMetadataByAssessmentItem>?
      controlInsightsByAssessment;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListAssessmentControlInsightsByControlDomainResponse({
    this.controlInsightsByAssessment,
    this.nextToken,
  });

  factory ListAssessmentControlInsightsByControlDomainResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAssessmentControlInsightsByControlDomainResponse(
      controlInsightsByAssessment:
          (json['controlInsightsByAssessment'] as List?)
              ?.whereNotNull()
              .map((e) => ControlInsightsMetadataByAssessmentItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlInsightsByAssessment = this.controlInsightsByAssessment;
    final nextToken = this.nextToken;
    return {
      if (controlInsightsByAssessment != null)
        'controlInsightsByAssessment': controlInsightsByAssessment,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssessmentFrameworkShareRequestsResponse {
  /// The list of share requests that the
  /// <code>ListAssessmentFrameworkShareRequests</code> API returned.
  final List<AssessmentFrameworkShareRequest>? assessmentFrameworkShareRequests;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListAssessmentFrameworkShareRequestsResponse({
    this.assessmentFrameworkShareRequests,
    this.nextToken,
  });

  factory ListAssessmentFrameworkShareRequestsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAssessmentFrameworkShareRequestsResponse(
      assessmentFrameworkShareRequests:
          (json['assessmentFrameworkShareRequests'] as List?)
              ?.whereNotNull()
              .map((e) => AssessmentFrameworkShareRequest.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentFrameworkShareRequests =
        this.assessmentFrameworkShareRequests;
    final nextToken = this.nextToken;
    return {
      if (assessmentFrameworkShareRequests != null)
        'assessmentFrameworkShareRequests': assessmentFrameworkShareRequests,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssessmentFrameworksResponse {
  /// A list of metadata that the <code>ListAssessmentFrameworks</code> API
  /// returns for each framework.
  final List<AssessmentFrameworkMetadata>? frameworkMetadataList;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListAssessmentFrameworksResponse({
    this.frameworkMetadataList,
    this.nextToken,
  });

  factory ListAssessmentFrameworksResponse.fromJson(Map<String, dynamic> json) {
    return ListAssessmentFrameworksResponse(
      frameworkMetadataList: (json['frameworkMetadataList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AssessmentFrameworkMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final frameworkMetadataList = this.frameworkMetadataList;
    final nextToken = this.nextToken;
    return {
      if (frameworkMetadataList != null)
        'frameworkMetadataList': frameworkMetadataList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssessmentReportsResponse {
  /// The list of assessment reports that the <code>ListAssessmentReports</code>
  /// API returned.
  final List<AssessmentReportMetadata>? assessmentReports;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListAssessmentReportsResponse({
    this.assessmentReports,
    this.nextToken,
  });

  factory ListAssessmentReportsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssessmentReportsResponse(
      assessmentReports: (json['assessmentReports'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AssessmentReportMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentReports = this.assessmentReports;
    final nextToken = this.nextToken;
    return {
      if (assessmentReports != null) 'assessmentReports': assessmentReports,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAssessmentsResponse {
  /// The metadata that the <code>ListAssessments</code> API returns for each
  /// assessment.
  final List<AssessmentMetadataItem>? assessmentMetadata;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListAssessmentsResponse({
    this.assessmentMetadata,
    this.nextToken,
  });

  factory ListAssessmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssessmentsResponse(
      assessmentMetadata: (json['assessmentMetadata'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AssessmentMetadataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentMetadata = this.assessmentMetadata;
    final nextToken = this.nextToken;
    return {
      if (assessmentMetadata != null) 'assessmentMetadata': assessmentMetadata,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListControlDomainInsightsByAssessmentResponse {
  /// The control domain analytics data that the
  /// <code>ListControlDomainInsightsByAssessment</code> API returned.
  final List<ControlDomainInsights>? controlDomainInsights;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListControlDomainInsightsByAssessmentResponse({
    this.controlDomainInsights,
    this.nextToken,
  });

  factory ListControlDomainInsightsByAssessmentResponse.fromJson(
      Map<String, dynamic> json) {
    return ListControlDomainInsightsByAssessmentResponse(
      controlDomainInsights: (json['controlDomainInsights'] as List?)
          ?.whereNotNull()
          .map((e) => ControlDomainInsights.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlDomainInsights = this.controlDomainInsights;
    final nextToken = this.nextToken;
    return {
      if (controlDomainInsights != null)
        'controlDomainInsights': controlDomainInsights,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListControlDomainInsightsResponse {
  /// The control domain analytics data that the
  /// <code>ListControlDomainInsights</code> API returned.
  final List<ControlDomainInsights>? controlDomainInsights;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListControlDomainInsightsResponse({
    this.controlDomainInsights,
    this.nextToken,
  });

  factory ListControlDomainInsightsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListControlDomainInsightsResponse(
      controlDomainInsights: (json['controlDomainInsights'] as List?)
          ?.whereNotNull()
          .map((e) => ControlDomainInsights.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlDomainInsights = this.controlDomainInsights;
    final nextToken = this.nextToken;
    return {
      if (controlDomainInsights != null)
        'controlDomainInsights': controlDomainInsights,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListControlInsightsByControlDomainResponse {
  /// The control analytics data that the
  /// <code>ListControlInsightsByControlDomain</code> API returned.
  final List<ControlInsightsMetadataItem>? controlInsightsMetadata;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListControlInsightsByControlDomainResponse({
    this.controlInsightsMetadata,
    this.nextToken,
  });

  factory ListControlInsightsByControlDomainResponse.fromJson(
      Map<String, dynamic> json) {
    return ListControlInsightsByControlDomainResponse(
      controlInsightsMetadata: (json['controlInsightsMetadata'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ControlInsightsMetadataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlInsightsMetadata = this.controlInsightsMetadata;
    final nextToken = this.nextToken;
    return {
      if (controlInsightsMetadata != null)
        'controlInsightsMetadata': controlInsightsMetadata,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListControlsResponse {
  /// A list of metadata that the <code>ListControls</code> API returns for each
  /// control.
  final List<ControlMetadata>? controlMetadataList;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListControlsResponse({
    this.controlMetadataList,
    this.nextToken,
  });

  factory ListControlsResponse.fromJson(Map<String, dynamic> json) {
    return ListControlsResponse(
      controlMetadataList: (json['controlMetadataList'] as List?)
          ?.whereNotNull()
          .map((e) => ControlMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final controlMetadataList = this.controlMetadataList;
    final nextToken = this.nextToken;
    return {
      if (controlMetadataList != null)
        'controlMetadataList': controlMetadataList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListKeywordsForDataSourceResponse {
  /// The list of keywords for the event mapping source.
  final List<String>? keywords;

  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  ListKeywordsForDataSourceResponse({
    this.keywords,
    this.nextToken,
  });

  factory ListKeywordsForDataSourceResponse.fromJson(
      Map<String, dynamic> json) {
    return ListKeywordsForDataSourceResponse(
      keywords: (json['keywords'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keywords = this.keywords;
    final nextToken = this.nextToken;
    return {
      if (keywords != null) 'keywords': keywords,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNotificationsResponse {
  /// The pagination token that's used to fetch the next set of results.
  final String? nextToken;

  /// The returned list of notifications.
  final List<Notification>? notifications;

  ListNotificationsResponse({
    this.nextToken,
    this.notifications,
  });

  factory ListNotificationsResponse.fromJson(Map<String, dynamic> json) {
    return ListNotificationsResponse(
      nextToken: json['nextToken'] as String?,
      notifications: (json['notifications'] as List?)
          ?.whereNotNull()
          .map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notifications = this.notifications;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (notifications != null) 'notifications': notifications,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags that the <code>ListTagsForResource</code> API returned.
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

/// Evidence that's manually added to a control in Audit Manager.
/// <code>manualEvidence</code> can be one of the following:
/// <code>evidenceFileName</code>, <code>s3ResourcePath</code>, or
/// <code>textResponse</code>.
class ManualEvidence {
  /// The name of the file that's uploaded as manual evidence. This name is
  /// populated using the <code>evidenceFileName</code> value from the <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_GetEvidenceFileUploadUrl.html">
  /// <code>GetEvidenceFileUploadUrl</code> </a> API response.
  final String? evidenceFileName;

  /// The S3 URL of the object that's imported as manual evidence.
  final String? s3ResourcePath;

  /// The plain text response that's entered and saved as manual evidence.
  final String? textResponse;

  ManualEvidence({
    this.evidenceFileName,
    this.s3ResourcePath,
    this.textResponse,
  });

  factory ManualEvidence.fromJson(Map<String, dynamic> json) {
    return ManualEvidence(
      evidenceFileName: json['evidenceFileName'] as String?,
      s3ResourcePath: json['s3ResourcePath'] as String?,
      textResponse: json['textResponse'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evidenceFileName = this.evidenceFileName;
    final s3ResourcePath = this.s3ResourcePath;
    final textResponse = this.textResponse;
    return {
      if (evidenceFileName != null) 'evidenceFileName': evidenceFileName,
      if (s3ResourcePath != null) 's3ResourcePath': s3ResourcePath,
      if (textResponse != null) 'textResponse': textResponse,
    };
  }
}

/// The notification that informs a user of an update in Audit Manager. For
/// example, this includes the notification that's sent when a control set is
/// delegated for review.
class Notification {
  /// The identifier for the assessment.
  final String? assessmentId;

  /// The name of the related assessment.
  final String? assessmentName;

  /// The identifier for the control set.
  final String? controlSetId;

  /// Specifies the name of the control set that the notification is about.
  final String? controlSetName;

  /// The description of the notification.
  final String? description;

  /// The time when the notification was sent.
  final DateTime? eventTime;

  /// The unique identifier for the notification.
  final String? id;

  /// The sender of the notification.
  final String? source;

  Notification({
    this.assessmentId,
    this.assessmentName,
    this.controlSetId,
    this.controlSetName,
    this.description,
    this.eventTime,
    this.id,
    this.source,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      assessmentId: json['assessmentId'] as String?,
      assessmentName: json['assessmentName'] as String?,
      controlSetId: json['controlSetId'] as String?,
      controlSetName: json['controlSetName'] as String?,
      description: json['description'] as String?,
      eventTime: timeStampFromJson(json['eventTime']),
      id: json['id'] as String?,
      source: json['source'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final assessmentName = this.assessmentName;
    final controlSetId = this.controlSetId;
    final controlSetName = this.controlSetName;
    final description = this.description;
    final eventTime = this.eventTime;
    final id = this.id;
    final source = this.source;
    return {
      if (assessmentId != null) 'assessmentId': assessmentId,
      if (assessmentName != null) 'assessmentName': assessmentName,
      if (controlSetId != null) 'controlSetId': controlSetId,
      if (controlSetName != null) 'controlSetName': controlSetName,
      if (description != null) 'description': description,
      if (eventTime != null) 'eventTime': unixTimestampToJson(eventTime),
      if (id != null) 'id': id,
      if (source != null) 'source': source,
    };
  }
}

enum ObjectTypeEnum {
  assessment,
  controlSet,
  control,
  delegation,
  assessmentReport,
}

extension ObjectTypeEnumValueExtension on ObjectTypeEnum {
  String toValue() {
    switch (this) {
      case ObjectTypeEnum.assessment:
        return 'ASSESSMENT';
      case ObjectTypeEnum.controlSet:
        return 'CONTROL_SET';
      case ObjectTypeEnum.control:
        return 'CONTROL';
      case ObjectTypeEnum.delegation:
        return 'DELEGATION';
      case ObjectTypeEnum.assessmentReport:
        return 'ASSESSMENT_REPORT';
    }
  }
}

extension ObjectTypeEnumFromString on String {
  ObjectTypeEnum toObjectTypeEnum() {
    switch (this) {
      case 'ASSESSMENT':
        return ObjectTypeEnum.assessment;
      case 'CONTROL_SET':
        return ObjectTypeEnum.controlSet;
      case 'CONTROL':
        return ObjectTypeEnum.control;
      case 'DELEGATION':
        return ObjectTypeEnum.delegation;
      case 'ASSESSMENT_REPORT':
        return ObjectTypeEnum.assessmentReport;
    }
    throw Exception('$this is not known in enum ObjectTypeEnum');
  }
}

class RegisterAccountResponse {
  /// The status of the account registration request.
  final AccountStatus? status;

  RegisterAccountResponse({
    this.status,
  });

  factory RegisterAccountResponse.fromJson(Map<String, dynamic> json) {
    return RegisterAccountResponse(
      status: (json['status'] as String?)?.toAccountStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

class RegisterOrganizationAdminAccountResponse {
  /// The identifier for the delegated administrator account.
  final String? adminAccountId;

  /// The identifier for the organization.
  final String? organizationId;

  RegisterOrganizationAdminAccountResponse({
    this.adminAccountId,
    this.organizationId,
  });

  factory RegisterOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return RegisterOrganizationAdminAccountResponse(
      adminAccountId: json['adminAccountId'] as String?,
      organizationId: json['organizationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adminAccountId = this.adminAccountId;
    final organizationId = this.organizationId;
    return {
      if (adminAccountId != null) 'adminAccountId': adminAccountId,
      if (organizationId != null) 'organizationId': organizationId,
    };
  }
}

/// A system asset that's evaluated in an Audit Manager assessment.
class Resource {
  /// The Amazon Resource Name (ARN) for the resource.
  final String? arn;

  /// The evaluation status for a resource that was assessed when collecting
  /// compliance check evidence.
  ///
  /// <ul>
  /// <li>
  /// Audit Manager classes the resource as non-compliant if Security Hub reports
  /// a <i>Fail</i> result, or if Config reports a <i>Non-compliant</i> result.
  /// </li>
  /// <li>
  /// Audit Manager classes the resource as compliant if Security Hub reports a
  /// <i>Pass</i> result, or if Config reports a <i>Compliant</i> result.
  /// </li>
  /// <li>
  /// If a compliance check isn't available or applicable, then no compliance
  /// evaluation can be made for that resource. This is the case if a resource
  /// assessment uses Config or Security Hub as the underlying data source type,
  /// but those services aren't enabled. This is also the case if the resource
  /// assessment uses an underlying data source type that doesn't support
  /// compliance checks (such as manual evidence, Amazon Web Services API calls,
  /// or CloudTrail).
  /// </li>
  /// </ul>
  final String? complianceCheck;

  /// The value of the resource.
  final String? value;

  Resource({
    this.arn,
    this.complianceCheck,
    this.value,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      arn: json['arn'] as String?,
      complianceCheck: json['complianceCheck'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final complianceCheck = this.complianceCheck;
    final value = this.value;
    return {
      if (arn != null) 'arn': arn,
      if (complianceCheck != null) 'complianceCheck': complianceCheck,
      if (value != null) 'value': value,
    };
  }
}

/// The wrapper that contains the Audit Manager role information of the current
/// user. This includes the role type and IAM Amazon Resource Name (ARN).
class Role {
  /// The Amazon Resource Name (ARN) of the IAM role.
  final String roleArn;

  /// The type of customer persona.
  /// <note>
  /// In <code>CreateAssessment</code>, <code>roleType</code> can only be
  /// <code>PROCESS_OWNER</code>.
  ///
  /// In <code>UpdateSettings</code>, <code>roleType</code> can only be
  /// <code>PROCESS_OWNER</code>.
  ///
  /// In <code>BatchCreateDelegationByAssessment</code>, <code>roleType</code> can
  /// only be <code>RESOURCE_OWNER</code>.
  /// </note>
  final RoleType roleType;

  Role({
    required this.roleArn,
    required this.roleType,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleArn: json['roleArn'] as String,
      roleType: (json['roleType'] as String).toRoleType(),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final roleType = this.roleType;
    return {
      'roleArn': roleArn,
      'roleType': roleType.toValue(),
    };
  }
}

enum RoleType {
  processOwner,
  resourceOwner,
}

extension RoleTypeValueExtension on RoleType {
  String toValue() {
    switch (this) {
      case RoleType.processOwner:
        return 'PROCESS_OWNER';
      case RoleType.resourceOwner:
        return 'RESOURCE_OWNER';
    }
  }
}

extension RoleTypeFromString on String {
  RoleType toRoleType() {
    switch (this) {
      case 'PROCESS_OWNER':
        return RoleType.processOwner;
      case 'RESOURCE_OWNER':
        return RoleType.resourceOwner;
    }
    throw Exception('$this is not known in enum RoleType');
  }
}

/// The wrapper that contains the Amazon Web Services accounts and services that
/// are in scope for the assessment.
class Scope {
  /// The Amazon Web Services accounts that are included in the scope of the
  /// assessment.
  final List<AWSAccount>? awsAccounts;

  /// The Amazon Web Services services that are included in the scope of the
  /// assessment.
  final List<AWSService>? awsServices;

  Scope({
    this.awsAccounts,
    this.awsServices,
  });

  factory Scope.fromJson(Map<String, dynamic> json) {
    return Scope(
      awsAccounts: (json['awsAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => AWSAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      awsServices: (json['awsServices'] as List?)
          ?.whereNotNull()
          .map((e) => AWSService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccounts = this.awsAccounts;
    final awsServices = this.awsServices;
    return {
      if (awsAccounts != null) 'awsAccounts': awsAccounts,
      if (awsServices != null) 'awsServices': awsServices,
    };
  }
}

/// The metadata that's associated with the Amazon Web Service.
class ServiceMetadata {
  /// The category that the Amazon Web Service belongs to, such as compute,
  /// storage, or database.
  final String? category;

  /// The description of the Amazon Web Service.
  final String? description;

  /// The display name of the Amazon Web Service.
  final String? displayName;

  /// The name of the Amazon Web Service.
  final String? name;

  ServiceMetadata({
    this.category,
    this.description,
    this.displayName,
    this.name,
  });

  factory ServiceMetadata.fromJson(Map<String, dynamic> json) {
    return ServiceMetadata(
      category: json['category'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final description = this.description;
    final displayName = this.displayName;
    final name = this.name;
    return {
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (name != null) 'name': name,
    };
  }
}

enum SettingAttribute {
  all,
  isAwsOrgEnabled,
  snsTopic,
  defaultAssessmentReportsDestination,
  defaultProcessOwners,
  evidenceFinderEnablement,
  deregistrationPolicy,
  defaultExportDestination,
}

extension SettingAttributeValueExtension on SettingAttribute {
  String toValue() {
    switch (this) {
      case SettingAttribute.all:
        return 'ALL';
      case SettingAttribute.isAwsOrgEnabled:
        return 'IS_AWS_ORG_ENABLED';
      case SettingAttribute.snsTopic:
        return 'SNS_TOPIC';
      case SettingAttribute.defaultAssessmentReportsDestination:
        return 'DEFAULT_ASSESSMENT_REPORTS_DESTINATION';
      case SettingAttribute.defaultProcessOwners:
        return 'DEFAULT_PROCESS_OWNERS';
      case SettingAttribute.evidenceFinderEnablement:
        return 'EVIDENCE_FINDER_ENABLEMENT';
      case SettingAttribute.deregistrationPolicy:
        return 'DEREGISTRATION_POLICY';
      case SettingAttribute.defaultExportDestination:
        return 'DEFAULT_EXPORT_DESTINATION';
    }
  }
}

extension SettingAttributeFromString on String {
  SettingAttribute toSettingAttribute() {
    switch (this) {
      case 'ALL':
        return SettingAttribute.all;
      case 'IS_AWS_ORG_ENABLED':
        return SettingAttribute.isAwsOrgEnabled;
      case 'SNS_TOPIC':
        return SettingAttribute.snsTopic;
      case 'DEFAULT_ASSESSMENT_REPORTS_DESTINATION':
        return SettingAttribute.defaultAssessmentReportsDestination;
      case 'DEFAULT_PROCESS_OWNERS':
        return SettingAttribute.defaultProcessOwners;
      case 'EVIDENCE_FINDER_ENABLEMENT':
        return SettingAttribute.evidenceFinderEnablement;
      case 'DEREGISTRATION_POLICY':
        return SettingAttribute.deregistrationPolicy;
      case 'DEFAULT_EXPORT_DESTINATION':
        return SettingAttribute.defaultExportDestination;
    }
    throw Exception('$this is not known in enum SettingAttribute');
  }
}

/// The settings object that holds all supported Audit Manager settings.
class Settings {
  /// The default S3 destination bucket for storing assessment reports.
  final AssessmentReportsDestination? defaultAssessmentReportsDestination;

  /// The default S3 destination bucket for storing evidence finder exports.
  final DefaultExportDestination? defaultExportDestination;

  /// The designated default audit owners.
  final List<Role>? defaultProcessOwners;

  /// The deregistration policy for your Audit Manager data. You can use this
  /// attribute to determine how your data is handled when you deregister Audit
  /// Manager.
  final DeregistrationPolicy? deregistrationPolicy;

  /// The current evidence finder status and event data store details.
  final EvidenceFinderEnablement? evidenceFinderEnablement;

  /// Specifies whether Organizations is enabled.
  final bool? isAwsOrgEnabled;

  /// The KMS key details.
  final String? kmsKey;

  /// The designated Amazon Simple Notification Service (Amazon SNS) topic.
  final String? snsTopic;

  Settings({
    this.defaultAssessmentReportsDestination,
    this.defaultExportDestination,
    this.defaultProcessOwners,
    this.deregistrationPolicy,
    this.evidenceFinderEnablement,
    this.isAwsOrgEnabled,
    this.kmsKey,
    this.snsTopic,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      defaultAssessmentReportsDestination:
          json['defaultAssessmentReportsDestination'] != null
              ? AssessmentReportsDestination.fromJson(
                  json['defaultAssessmentReportsDestination']
                      as Map<String, dynamic>)
              : null,
      defaultExportDestination: json['defaultExportDestination'] != null
          ? DefaultExportDestination.fromJson(
              json['defaultExportDestination'] as Map<String, dynamic>)
          : null,
      defaultProcessOwners: (json['defaultProcessOwners'] as List?)
          ?.whereNotNull()
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      deregistrationPolicy: json['deregistrationPolicy'] != null
          ? DeregistrationPolicy.fromJson(
              json['deregistrationPolicy'] as Map<String, dynamic>)
          : null,
      evidenceFinderEnablement: json['evidenceFinderEnablement'] != null
          ? EvidenceFinderEnablement.fromJson(
              json['evidenceFinderEnablement'] as Map<String, dynamic>)
          : null,
      isAwsOrgEnabled: json['isAwsOrgEnabled'] as bool?,
      kmsKey: json['kmsKey'] as String?,
      snsTopic: json['snsTopic'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultAssessmentReportsDestination =
        this.defaultAssessmentReportsDestination;
    final defaultExportDestination = this.defaultExportDestination;
    final defaultProcessOwners = this.defaultProcessOwners;
    final deregistrationPolicy = this.deregistrationPolicy;
    final evidenceFinderEnablement = this.evidenceFinderEnablement;
    final isAwsOrgEnabled = this.isAwsOrgEnabled;
    final kmsKey = this.kmsKey;
    final snsTopic = this.snsTopic;
    return {
      if (defaultAssessmentReportsDestination != null)
        'defaultAssessmentReportsDestination':
            defaultAssessmentReportsDestination,
      if (defaultExportDestination != null)
        'defaultExportDestination': defaultExportDestination,
      if (defaultProcessOwners != null)
        'defaultProcessOwners': defaultProcessOwners,
      if (deregistrationPolicy != null)
        'deregistrationPolicy': deregistrationPolicy,
      if (evidenceFinderEnablement != null)
        'evidenceFinderEnablement': evidenceFinderEnablement,
      if (isAwsOrgEnabled != null) 'isAwsOrgEnabled': isAwsOrgEnabled,
      if (kmsKey != null) 'kmsKey': kmsKey,
      if (snsTopic != null) 'snsTopic': snsTopic,
    };
  }
}

enum ShareRequestAction {
  accept,
  decline,
  revoke,
}

extension ShareRequestActionValueExtension on ShareRequestAction {
  String toValue() {
    switch (this) {
      case ShareRequestAction.accept:
        return 'ACCEPT';
      case ShareRequestAction.decline:
        return 'DECLINE';
      case ShareRequestAction.revoke:
        return 'REVOKE';
    }
  }
}

extension ShareRequestActionFromString on String {
  ShareRequestAction toShareRequestAction() {
    switch (this) {
      case 'ACCEPT':
        return ShareRequestAction.accept;
      case 'DECLINE':
        return ShareRequestAction.decline;
      case 'REVOKE':
        return ShareRequestAction.revoke;
    }
    throw Exception('$this is not known in enum ShareRequestAction');
  }
}

enum ShareRequestStatus {
  active,
  replicating,
  shared,
  expiring,
  failed,
  expired,
  declined,
  revoked,
}

extension ShareRequestStatusValueExtension on ShareRequestStatus {
  String toValue() {
    switch (this) {
      case ShareRequestStatus.active:
        return 'ACTIVE';
      case ShareRequestStatus.replicating:
        return 'REPLICATING';
      case ShareRequestStatus.shared:
        return 'SHARED';
      case ShareRequestStatus.expiring:
        return 'EXPIRING';
      case ShareRequestStatus.failed:
        return 'FAILED';
      case ShareRequestStatus.expired:
        return 'EXPIRED';
      case ShareRequestStatus.declined:
        return 'DECLINED';
      case ShareRequestStatus.revoked:
        return 'REVOKED';
    }
  }
}

extension ShareRequestStatusFromString on String {
  ShareRequestStatus toShareRequestStatus() {
    switch (this) {
      case 'ACTIVE':
        return ShareRequestStatus.active;
      case 'REPLICATING':
        return ShareRequestStatus.replicating;
      case 'SHARED':
        return ShareRequestStatus.shared;
      case 'EXPIRING':
        return ShareRequestStatus.expiring;
      case 'FAILED':
        return ShareRequestStatus.failed;
      case 'EXPIRED':
        return ShareRequestStatus.expired;
      case 'DECLINED':
        return ShareRequestStatus.declined;
      case 'REVOKED':
        return ShareRequestStatus.revoked;
    }
    throw Exception('$this is not known in enum ShareRequestStatus');
  }
}

enum ShareRequestType {
  sent,
  received,
}

extension ShareRequestTypeValueExtension on ShareRequestType {
  String toValue() {
    switch (this) {
      case ShareRequestType.sent:
        return 'SENT';
      case ShareRequestType.received:
        return 'RECEIVED';
    }
  }
}

extension ShareRequestTypeFromString on String {
  ShareRequestType toShareRequestType() {
    switch (this) {
      case 'SENT':
        return ShareRequestType.sent;
      case 'RECEIVED':
        return ShareRequestType.received;
    }
    throw Exception('$this is not known in enum ShareRequestType');
  }
}

enum SourceFrequency {
  daily,
  weekly,
  monthly,
}

extension SourceFrequencyValueExtension on SourceFrequency {
  String toValue() {
    switch (this) {
      case SourceFrequency.daily:
        return 'DAILY';
      case SourceFrequency.weekly:
        return 'WEEKLY';
      case SourceFrequency.monthly:
        return 'MONTHLY';
    }
  }
}

extension SourceFrequencyFromString on String {
  SourceFrequency toSourceFrequency() {
    switch (this) {
      case 'DAILY':
        return SourceFrequency.daily;
      case 'WEEKLY':
        return SourceFrequency.weekly;
      case 'MONTHLY':
        return SourceFrequency.monthly;
    }
    throw Exception('$this is not known in enum SourceFrequency');
  }
}

/// A keyword that relates to the control data source.
///
/// For manual evidence, this keyword indicates if the manual evidence is a file
/// or text.
///
/// For automated evidence, this keyword identifies a specific CloudTrail event,
/// Config rule, Security Hub control, or Amazon Web Services API name.
///
/// To learn more about the supported keywords that you can use when mapping a
/// control data source, see the following pages in the <i>Audit Manager User
/// Guide</i>:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/control-data-sources-config.html">Config
/// rules supported by Audit Manager</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/control-data-sources-ash.html">Security
/// Hub controls supported by Audit Manager</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/control-data-sources-api.html">API
/// calls supported by Audit Manager</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/control-data-sources-cloudtrail.html">CloudTrail
/// event names supported by Audit Manager</a>
/// </li>
/// </ul>
class SourceKeyword {
  /// The input method for the keyword.
  ///
  /// <ul>
  /// <li>
  /// <code>SELECT_FROM_LIST</code> is used when mapping a data source for
  /// automated evidence.
  ///
  /// <ul>
  /// <li>
  /// When <code>keywordInputType</code> is <code>SELECT_FROM_LIST</code>, a
  /// keyword must be selected to collect automated evidence. For example, this
  /// keyword can be a CloudTrail event name, a rule name for Config, a Security
  /// Hub control, or the name of an Amazon Web Services API call.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>UPLOAD_FILE</code> and <code>INPUT_TEXT</code> are only used when
  /// mapping a data source for manual evidence.
  ///
  /// <ul>
  /// <li>
  /// When <code>keywordInputType</code> is <code>UPLOAD_FILE</code>, a file must
  /// be uploaded as manual evidence.
  /// </li>
  /// <li>
  /// When <code>keywordInputType</code> is <code>INPUT_TEXT</code>, text must be
  /// entered as manual evidence.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final KeywordInputType? keywordInputType;

  /// The value of the keyword that's used when mapping a control data source. For
  /// example, this can be a CloudTrail event name, a rule name for Config, a
  /// Security Hub control, or the name of an Amazon Web Services API call.
  ///
  /// If you’re mapping a data source to a rule in Config, the
  /// <code>keywordValue</code> that you specify depends on the type of rule:
  ///
  /// <ul>
  /// <li>
  /// For <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html">managed
  /// rules</a>, you can use the rule identifier as the <code>keywordValue</code>.
  /// You can find the rule identifier from the <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html">list
  /// of Config managed rules</a>. For some rules, the rule identifier is
  /// different from the rule name. For example, the rule name
  /// <code>restricted-ssh</code> has the following rule identifier:
  /// <code>INCOMING_SSH_DISABLED</code>. Make sure to use the rule identifier,
  /// not the rule name.
  ///
  /// Keyword example for managed rules:
  ///
  /// <ul>
  /// <li>
  /// Managed rule name: <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-acl-prohibited.html">s3-bucket-acl-prohibited</a>
  ///
  /// <code>keywordValue</code>: <code>S3_BUCKET_ACL_PROHIBITED</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_develop-rules.html">custom
  /// rules</a>, you form the <code>keywordValue</code> by adding the
  /// <code>Custom_</code> prefix to the rule name. This prefix distinguishes the
  /// custom rule from a managed rule.
  ///
  /// Keyword example for custom rules:
  ///
  /// <ul>
  /// <li>
  /// Custom rule name: my-custom-config-rule
  ///
  /// <code>keywordValue</code>: <code>Custom_my-custom-config-rule</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For <a
  /// href="https://docs.aws.amazon.com/config/latest/developerguide/service-linked-awsconfig-rules.html">service-linked
  /// rules</a>, you form the <code>keywordValue</code> by adding the
  /// <code>Custom_</code> prefix to the rule name. In addition, you remove the
  /// suffix ID that appears at the end of the rule name.
  ///
  /// Keyword examples for service-linked rules:
  ///
  /// <ul>
  /// <li>
  /// Service-linked rule name: CustomRuleForAccount-conformance-pack-szsm1uv0w
  ///
  /// <code>keywordValue</code>:
  /// <code>Custom_CustomRuleForAccount-conformance-pack</code>
  /// </li>
  /// <li>
  /// Service-linked rule name:
  /// OrgConfigRule-s3-bucket-versioning-enabled-dbgzf8ba
  ///
  /// <code>keywordValue</code>:
  /// <code>Custom_OrgConfigRule-s3-bucket-versioning-enabled</code>
  /// </li>
  /// </ul> </li>
  /// </ul> <important>
  /// The <code>keywordValue</code> is case sensitive. If you enter a value
  /// incorrectly, Audit Manager might not recognize the data source mapping. As a
  /// result, you might not successfully collect evidence from that data source as
  /// intended.
  ///
  /// Keep in mind the following requirements, depending on the data source type
  /// that you're using.
  /// <ol>
  /// <li>
  /// For Config:
  ///
  /// <ul>
  /// <li>
  /// For managed rules, make sure that the <code>keywordValue</code> is the rule
  /// identifier in <code>ALL_CAPS_WITH_UNDERSCORES</code>. For example,
  /// <code>CLOUDWATCH_LOG_GROUP_ENCRYPTED</code>. For accuracy, we recommend that
  /// you reference the list of <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/control-data-sources-config.html">supported
  /// Config managed rules</a>.
  /// </li>
  /// <li>
  /// For custom rules, make sure that the <code>keywordValue</code> has the
  /// <code>Custom_</code> prefix followed by the custom rule name. The format of
  /// the custom rule name itself may vary. For accuracy, we recommend that you
  /// visit the <a href="https://console.aws.amazon.com/config/">Config
  /// console</a> to verify your custom rule name.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Security Hub: The format varies for Security Hub control names. For
  /// accuracy, we recommend that you reference the list of <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/control-data-sources-ash.html">supported
  /// Security Hub controls</a>.
  /// </li>
  /// <li>
  /// For Amazon Web Services API calls: Make sure that the
  /// <code>keywordValue</code> is written as
  /// <code>serviceprefix_ActionName</code>. For example,
  /// <code>iam_ListGroups</code>. For accuracy, we recommend that you reference
  /// the list of <a
  /// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/control-data-sources-api.html">supported
  /// API calls</a>.
  /// </li>
  /// <li>
  /// For CloudTrail: Make sure that the <code>keywordValue</code> is written as
  /// <code>serviceprefix_ActionName</code>. For example,
  /// <code>cloudtrail_StartLogging</code>. For accuracy, we recommend that you
  /// review the Amazon Web Service prefix and action names in the <a
  /// href="https://docs.aws.amazon.com/service-authorization/latest/reference/reference_policies_actions-resources-contextkeys.html">Service
  /// Authorization Reference</a>.
  /// </li> </ol> </important>
  final String? keywordValue;

  SourceKeyword({
    this.keywordInputType,
    this.keywordValue,
  });

  factory SourceKeyword.fromJson(Map<String, dynamic> json) {
    return SourceKeyword(
      keywordInputType:
          (json['keywordInputType'] as String?)?.toKeywordInputType(),
      keywordValue: json['keywordValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keywordInputType = this.keywordInputType;
    final keywordValue = this.keywordValue;
    return {
      if (keywordInputType != null)
        'keywordInputType': keywordInputType.toValue(),
      if (keywordValue != null) 'keywordValue': keywordValue,
    };
  }
}

enum SourceSetUpOption {
  systemControlsMapping,
  proceduralControlsMapping,
}

extension SourceSetUpOptionValueExtension on SourceSetUpOption {
  String toValue() {
    switch (this) {
      case SourceSetUpOption.systemControlsMapping:
        return 'System_Controls_Mapping';
      case SourceSetUpOption.proceduralControlsMapping:
        return 'Procedural_Controls_Mapping';
    }
  }
}

extension SourceSetUpOptionFromString on String {
  SourceSetUpOption toSourceSetUpOption() {
    switch (this) {
      case 'System_Controls_Mapping':
        return SourceSetUpOption.systemControlsMapping;
      case 'Procedural_Controls_Mapping':
        return SourceSetUpOption.proceduralControlsMapping;
    }
    throw Exception('$this is not known in enum SourceSetUpOption');
  }
}

enum SourceType {
  awsCloudtrail,
  awsConfig,
  awsSecurityHub,
  awsApiCall,
  manual,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.awsCloudtrail:
        return 'AWS_Cloudtrail';
      case SourceType.awsConfig:
        return 'AWS_Config';
      case SourceType.awsSecurityHub:
        return 'AWS_Security_Hub';
      case SourceType.awsApiCall:
        return 'AWS_API_Call';
      case SourceType.manual:
        return 'MANUAL';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'AWS_Cloudtrail':
        return SourceType.awsCloudtrail;
      case 'AWS_Config':
        return SourceType.awsConfig;
      case 'AWS_Security_Hub':
        return SourceType.awsSecurityHub;
      case 'AWS_API_Call':
        return SourceType.awsApiCall;
      case 'MANUAL':
        return SourceType.manual;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

class StartAssessmentFrameworkShareResponse {
  /// The share request that's created by the
  /// <code>StartAssessmentFrameworkShare</code> API.
  final AssessmentFrameworkShareRequest? assessmentFrameworkShareRequest;

  StartAssessmentFrameworkShareResponse({
    this.assessmentFrameworkShareRequest,
  });

  factory StartAssessmentFrameworkShareResponse.fromJson(
      Map<String, dynamic> json) {
    return StartAssessmentFrameworkShareResponse(
      assessmentFrameworkShareRequest:
          json['assessmentFrameworkShareRequest'] != null
              ? AssessmentFrameworkShareRequest.fromJson(
                  json['assessmentFrameworkShareRequest']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentFrameworkShareRequest =
        this.assessmentFrameworkShareRequest;
    return {
      if (assessmentFrameworkShareRequest != null)
        'assessmentFrameworkShareRequest': assessmentFrameworkShareRequest,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Short for uniform resource locator. A URL is used as a unique identifier to
/// locate a resource on the internet.
class URL {
  /// The name or word that's used as a hyperlink to the URL.
  final String? hyperlinkName;

  /// The unique identifier for the internet resource.
  final String? link;

  URL({
    this.hyperlinkName,
    this.link,
  });

  factory URL.fromJson(Map<String, dynamic> json) {
    return URL(
      hyperlinkName: json['hyperlinkName'] as String?,
      link: json['link'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hyperlinkName = this.hyperlinkName;
    final link = this.link;
    return {
      if (hyperlinkName != null) 'hyperlinkName': hyperlinkName,
      if (link != null) 'link': link,
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAssessmentControlResponse {
  /// The name of the updated control set that the
  /// <code>UpdateAssessmentControl</code> API returned.
  final AssessmentControl? control;

  UpdateAssessmentControlResponse({
    this.control,
  });

  factory UpdateAssessmentControlResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAssessmentControlResponse(
      control: json['control'] != null
          ? AssessmentControl.fromJson(json['control'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final control = this.control;
    return {
      if (control != null) 'control': control,
    };
  }
}

class UpdateAssessmentControlSetStatusResponse {
  /// The name of the updated control set that the
  /// <code>UpdateAssessmentControlSetStatus</code> API returned.
  final AssessmentControlSet? controlSet;

  UpdateAssessmentControlSetStatusResponse({
    this.controlSet,
  });

  factory UpdateAssessmentControlSetStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAssessmentControlSetStatusResponse(
      controlSet: json['controlSet'] != null
          ? AssessmentControlSet.fromJson(
              json['controlSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final controlSet = this.controlSet;
    return {
      if (controlSet != null) 'controlSet': controlSet,
    };
  }
}

/// A <code>controlSet</code> entity that represents a collection of controls in
/// Audit Manager. This doesn't contain the control set ID.
class UpdateAssessmentFrameworkControlSet {
  /// The list of controls that are contained within the control set.
  final List<CreateAssessmentFrameworkControl> controls;

  /// The name of the control set.
  final String name;

  /// The unique identifier for the control set.
  final String? id;

  UpdateAssessmentFrameworkControlSet({
    required this.controls,
    required this.name,
    this.id,
  });

  Map<String, dynamic> toJson() {
    final controls = this.controls;
    final name = this.name;
    final id = this.id;
    return {
      'controls': controls,
      'name': name,
      if (id != null) 'id': id,
    };
  }
}

class UpdateAssessmentFrameworkResponse {
  /// The name of the framework.
  final Framework? framework;

  UpdateAssessmentFrameworkResponse({
    this.framework,
  });

  factory UpdateAssessmentFrameworkResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAssessmentFrameworkResponse(
      framework: json['framework'] != null
          ? Framework.fromJson(json['framework'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final framework = this.framework;
    return {
      if (framework != null) 'framework': framework,
    };
  }
}

class UpdateAssessmentFrameworkShareResponse {
  /// The updated share request that's returned by the
  /// <code>UpdateAssessmentFrameworkShare</code> operation.
  final AssessmentFrameworkShareRequest? assessmentFrameworkShareRequest;

  UpdateAssessmentFrameworkShareResponse({
    this.assessmentFrameworkShareRequest,
  });

  factory UpdateAssessmentFrameworkShareResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAssessmentFrameworkShareResponse(
      assessmentFrameworkShareRequest:
          json['assessmentFrameworkShareRequest'] != null
              ? AssessmentFrameworkShareRequest.fromJson(
                  json['assessmentFrameworkShareRequest']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentFrameworkShareRequest =
        this.assessmentFrameworkShareRequest;
    return {
      if (assessmentFrameworkShareRequest != null)
        'assessmentFrameworkShareRequest': assessmentFrameworkShareRequest,
    };
  }
}

class UpdateAssessmentResponse {
  /// The response object for the <code>UpdateAssessment</code> API. This is the
  /// name of the updated assessment.
  final Assessment? assessment;

  UpdateAssessmentResponse({
    this.assessment,
  });

  factory UpdateAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAssessmentResponse(
      assessment: json['assessment'] != null
          ? Assessment.fromJson(json['assessment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assessment = this.assessment;
    return {
      if (assessment != null) 'assessment': assessment,
    };
  }
}

class UpdateAssessmentStatusResponse {
  /// The name of the updated assessment that the
  /// <code>UpdateAssessmentStatus</code> API returned.
  final Assessment? assessment;

  UpdateAssessmentStatusResponse({
    this.assessment,
  });

  factory UpdateAssessmentStatusResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAssessmentStatusResponse(
      assessment: json['assessment'] != null
          ? Assessment.fromJson(json['assessment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assessment = this.assessment;
    return {
      if (assessment != null) 'assessment': assessment,
    };
  }
}

class UpdateControlResponse {
  /// The name of the updated control set that the <code>UpdateControl</code> API
  /// returned.
  final Control? control;

  UpdateControlResponse({
    this.control,
  });

  factory UpdateControlResponse.fromJson(Map<String, dynamic> json) {
    return UpdateControlResponse(
      control: json['control'] != null
          ? Control.fromJson(json['control'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final control = this.control;
    return {
      if (control != null) 'control': control,
    };
  }
}

class UpdateSettingsResponse {
  /// The current list of settings.
  final Settings? settings;

  UpdateSettingsResponse({
    this.settings,
  });

  factory UpdateSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSettingsResponse(
      settings: json['settings'] != null
          ? Settings.fromJson(json['settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final settings = this.settings;
    return {
      if (settings != null) 'settings': settings,
    };
  }
}

class ValidateAssessmentReportIntegrityResponse {
  /// The signature algorithm that's used to code sign the assessment report file.
  final String? signatureAlgorithm;

  /// The date and time signature that specifies when the assessment report was
  /// created.
  final String? signatureDateTime;

  /// The unique identifier for the validation signature key.
  final String? signatureKeyId;

  /// Specifies whether the signature key is valid.
  final bool? signatureValid;

  /// Represents any errors that occurred when validating the assessment report.
  final List<String>? validationErrors;

  ValidateAssessmentReportIntegrityResponse({
    this.signatureAlgorithm,
    this.signatureDateTime,
    this.signatureKeyId,
    this.signatureValid,
    this.validationErrors,
  });

  factory ValidateAssessmentReportIntegrityResponse.fromJson(
      Map<String, dynamic> json) {
    return ValidateAssessmentReportIntegrityResponse(
      signatureAlgorithm: json['signatureAlgorithm'] as String?,
      signatureDateTime: json['signatureDateTime'] as String?,
      signatureKeyId: json['signatureKeyId'] as String?,
      signatureValid: json['signatureValid'] as bool?,
      validationErrors: (json['validationErrors'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final signatureAlgorithm = this.signatureAlgorithm;
    final signatureDateTime = this.signatureDateTime;
    final signatureKeyId = this.signatureKeyId;
    final signatureValid = this.signatureValid;
    final validationErrors = this.validationErrors;
    return {
      if (signatureAlgorithm != null) 'signatureAlgorithm': signatureAlgorithm,
      if (signatureDateTime != null) 'signatureDateTime': signatureDateTime,
      if (signatureKeyId != null) 'signatureKeyId': signatureKeyId,
      if (signatureValid != null) 'signatureValid': signatureValid,
      if (validationErrors != null) 'validationErrors': validationErrors,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
