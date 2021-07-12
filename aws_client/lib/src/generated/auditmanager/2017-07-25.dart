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

/// Welcome to the AWS Audit Manager API reference. This guide is for developers
/// who need detailed information about the AWS Audit Manager API operations,
/// data types, and errors.
///
/// AWS Audit Manager is a service that provides automated evidence collection
/// so that you can continuously audit your AWS usage, and assess the
/// effectiveness of your controls to better manage risk and simplify
/// compliance.
///
/// AWS Audit Manager provides pre-built frameworks that structure and automate
/// assessments for a given compliance standard. Frameworks include a pre-built
/// collection of controls with descriptions and testing procedures, which are
/// grouped according to the requirements of the specified compliance standard
/// or regulation. You can also customize frameworks and controls to support
/// internal audits with unique requirements.
///
/// Use the following links to get started with the AWS Audit Manager API:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_Operations.html">Actions</a>:
/// An alphabetical list of all AWS Audit Manager API operations.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/API_Types.html">Data
/// types</a>: An alphabetical list of all AWS Audit Manager data types.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/CommonParameters.html">Common
/// parameters</a>: Parameters that all Query operations can use.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/APIReference/CommonErrors.html">Common
/// errors</a>: Client and server errors that all operations can return.
/// </li>
/// </ul>
/// If you're new to AWS Audit Manager, we recommend that you review the <a
/// href="https://docs.aws.amazon.com/audit-manager/latest/userguide/what-is.html">
/// AWS Audit Manager User Guide</a>.
class AuditManager {
  final _s.RestJsonProtocol _protocol;
  AuditManager({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// Associates an evidence folder to the specified assessment report in AWS
  /// Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [evidenceFolderId] :
  /// The identifier for the folder in which evidence is stored.
  Future<void> associateAssessmentReportEvidenceFolder({
    required String assessmentId,
    required String evidenceFolderId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(evidenceFolderId, 'evidenceFolderId');
    _s.validateStringLength(
      'evidenceFolderId',
      evidenceFolderId,
      36,
      36,
      isRequired: true,
    );
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

  /// Associates a list of evidence to an assessment report in an AWS Audit
  /// Manager assessment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The unique identifier for the specified assessment.
  ///
  /// Parameter [evidenceFolderId] :
  /// The identifier for the folder in which the evidence is stored.
  ///
  /// Parameter [evidenceIds] :
  /// The list of evidence identifiers.
  Future<BatchAssociateAssessmentReportEvidenceResponse>
      batchAssociateAssessmentReportEvidence({
    required String assessmentId,
    required String evidenceFolderId,
    required List<String> evidenceIds,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(evidenceFolderId, 'evidenceFolderId');
    _s.validateStringLength(
      'evidenceFolderId',
      evidenceFolderId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(evidenceIds, 'evidenceIds');
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

  /// Create a batch of delegations for a specified assessment in AWS Audit
  /// Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [createDelegationRequests] :
  /// The API request to batch create delegations in AWS Audit Manager.
  Future<BatchCreateDelegationByAssessmentResponse>
      batchCreateDelegationByAssessment({
    required String assessmentId,
    required List<CreateDelegationRequest> createDelegationRequests,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        createDelegationRequests, 'createDelegationRequests');
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

  /// Deletes the delegations in the specified AWS Audit Manager assessment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [delegationIds] :
  /// The identifiers for the specified delegations.
  Future<BatchDeleteDelegationByAssessmentResponse>
      batchDeleteDelegationByAssessment({
    required String assessmentId,
    required List<String> delegationIds,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(delegationIds, 'delegationIds');
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

  /// Disassociates a list of evidence from the specified assessment report in
  /// AWS Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [evidenceFolderId] :
  /// The identifier for the folder in which evidence is stored.
  ///
  /// Parameter [evidenceIds] :
  /// The list of evidence identifiers.
  Future<BatchDisassociateAssessmentReportEvidenceResponse>
      batchDisassociateAssessmentReportEvidence({
    required String assessmentId,
    required String evidenceFolderId,
    required List<String> evidenceIds,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(evidenceFolderId, 'evidenceFolderId');
    _s.validateStringLength(
      'evidenceFolderId',
      evidenceFolderId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(evidenceIds, 'evidenceIds');
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

  /// Uploads one or more pieces of evidence to the specified control in the
  /// assessment in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [controlId] :
  /// The identifier for the specified control.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the specified control set.
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
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlId, 'controlId');
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlSetId, 'controlSetId');
    _s.validateStringLength(
      'controlSetId',
      controlSetId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(manualEvidence, 'manualEvidence');
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

  /// Creates an assessment in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentReportsDestination] :
  /// The assessment report storage destination for the specified assessment
  /// that is being created.
  ///
  /// Parameter [frameworkId] :
  /// The identifier for the specified framework.
  ///
  /// Parameter [name] :
  /// The name of the assessment to be created.
  ///
  /// Parameter [roles] :
  /// The list of roles for the specified assessment.
  ///
  /// Parameter [description] :
  /// The optional description of the assessment to be created.
  ///
  /// Parameter [tags] :
  /// The tags associated with the assessment.
  Future<CreateAssessmentResponse> createAssessment({
    required AssessmentReportsDestination assessmentReportsDestination,
    required String frameworkId,
    required String name,
    required List<Role> roles,
    required Scope scope,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(
        assessmentReportsDestination, 'assessmentReportsDestination');
    ArgumentError.checkNotNull(frameworkId, 'frameworkId');
    _s.validateStringLength(
      'frameworkId',
      frameworkId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roles, 'roles');
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
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

  /// Creates a custom framework in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlSets] :
  /// The control sets to be associated with the framework.
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
  /// The tags associated with the framework.
  Future<CreateAssessmentFrameworkResponse> createAssessmentFramework({
    required List<CreateAssessmentFrameworkControlSet> controlSets,
    required String name,
    String? complianceType,
    String? description,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(controlSets, 'controlSets');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      300,
      isRequired: true,
    );
    _s.validateStringLength(
      'complianceType',
      complianceType,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
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
  /// The identifier for the specified assessment.
  ///
  /// Parameter [name] :
  /// The name of the new assessment report.
  ///
  /// Parameter [description] :
  /// The description of the assessment report.
  Future<CreateAssessmentReportResponse> createAssessmentReport({
    required String assessmentId,
    required String name,
    String? description,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      300,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      'name': name,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/assessments/${Uri.encodeComponent(assessmentId)}/reports',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssessmentReportResponse.fromJson(response);
  }

  /// Creates a new custom control in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlMappingSources] :
  /// The data mapping sources for the specified control.
  ///
  /// Parameter [name] :
  /// The name of the control.
  ///
  /// Parameter [actionPlanInstructions] :
  /// The recommended actions to carry out if the control is not fulfilled.
  ///
  /// Parameter [actionPlanTitle] :
  /// The title of the action plan for remediating the control.
  ///
  /// Parameter [description] :
  /// The description of the control.
  ///
  /// Parameter [tags] :
  /// The tags associated with the control.
  ///
  /// Parameter [testingInformation] :
  /// The steps to follow to determine if the control has been satisfied.
  Future<CreateControlResponse> createControl({
    required List<CreateControlMappingSource> controlMappingSources,
    required String name,
    String? actionPlanInstructions,
    String? actionPlanTitle,
    String? description,
    Map<String, String>? tags,
    String? testingInformation,
  }) async {
    ArgumentError.checkNotNull(controlMappingSources, 'controlMappingSources');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      300,
      isRequired: true,
    );
    _s.validateStringLength(
      'actionPlanInstructions',
      actionPlanInstructions,
      0,
      1000,
    );
    _s.validateStringLength(
      'actionPlanTitle',
      actionPlanTitle,
      0,
      300,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'testingInformation',
      testingInformation,
      0,
      1000,
    );
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

  /// Deletes an assessment in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  Future<void> deleteAssessment({
    required String assessmentId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assessments/${Uri.encodeComponent(assessmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a custom framework in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [frameworkId] :
  /// The identifier for the specified framework.
  Future<void> deleteAssessmentFramework({
    required String frameworkId,
  }) async {
    ArgumentError.checkNotNull(frameworkId, 'frameworkId');
    _s.validateStringLength(
      'frameworkId',
      frameworkId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assessmentFrameworks/${Uri.encodeComponent(frameworkId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an assessment report from an assessment in AWS Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [assessmentReportId] :
  /// The unique identifier for the assessment report.
  Future<void> deleteAssessmentReport({
    required String assessmentId,
    required String assessmentReportId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(assessmentReportId, 'assessmentReportId');
    _s.validateStringLength(
      'assessmentReportId',
      assessmentReportId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/reports/${Uri.encodeComponent(assessmentReportId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a custom control in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlId] :
  /// The identifier for the specified control.
  Future<void> deleteControl({
    required String controlId,
  }) async {
    ArgumentError.checkNotNull(controlId, 'controlId');
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/controls/${Uri.encodeComponent(controlId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deregisters an account in AWS Audit Manager.
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

  /// Deregisters the delegated AWS administrator account from the AWS
  /// organization.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [adminAccountId] :
  /// The identifier for the specified administrator account.
  Future<void> deregisterOrganizationAdminAccount({
    String? adminAccountId,
  }) async {
    _s.validateStringLength(
      'adminAccountId',
      adminAccountId,
      12,
      12,
    );
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
  /// AWS Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [evidenceFolderId] :
  /// The identifier for the folder in which evidence is stored.
  Future<void> disassociateAssessmentReportEvidenceFolder({
    required String assessmentId,
    required String evidenceFolderId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(evidenceFolderId, 'evidenceFolderId');
    _s.validateStringLength(
      'evidenceFolderId',
      evidenceFolderId,
      36,
      36,
      isRequired: true,
    );
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

  /// Returns the registration status of an account in AWS Audit Manager.
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

  /// Returns an assessment from AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  Future<GetAssessmentResponse> getAssessment({
    required String assessmentId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assessments/${Uri.encodeComponent(assessmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssessmentResponse.fromJson(response);
  }

  /// Returns a framework from AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [frameworkId] :
  /// The identifier for the specified framework.
  Future<GetAssessmentFrameworkResponse> getAssessmentFramework({
    required String frameworkId,
  }) async {
    ArgumentError.checkNotNull(frameworkId, 'frameworkId');
    _s.validateStringLength(
      'frameworkId',
      frameworkId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/assessmentFrameworks/${Uri.encodeComponent(frameworkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssessmentFrameworkResponse.fromJson(response);
  }

  /// Returns the URL of a specified assessment report in AWS Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [assessmentReportId] :
  /// The identifier for the assessment report.
  Future<GetAssessmentReportUrlResponse> getAssessmentReportUrl({
    required String assessmentId,
    required String assessmentReportId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(assessmentReportId, 'assessmentReportId');
    _s.validateStringLength(
      'assessmentReportId',
      assessmentReportId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/reports/${Uri.encodeComponent(assessmentReportId)}/url',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssessmentReportUrlResponse.fromJson(response);
  }

  /// Returns a list of changelogs from AWS Audit Manager.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [controlId] :
  /// The identifier for the specified control.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the specified control set.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
  Future<GetChangeLogsResponse> getChangeLogs({
    required String assessmentId,
    String? controlId,
    String? controlSetId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
    );
    _s.validateStringLength(
      'controlSetId',
      controlSetId,
      1,
      300,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
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

  /// Returns a control from AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlId] :
  /// The identifier for the specified control.
  Future<GetControlResponse> getControl({
    required String controlId,
  }) async {
    ArgumentError.checkNotNull(controlId, 'controlId');
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/controls/${Uri.encodeComponent(controlId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetControlResponse.fromJson(response);
  }

  /// Returns a list of delegations from an audit owner to a delegate.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
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

  /// Returns evidence from AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the specified control set.
  ///
  /// Parameter [evidenceFolderId] :
  /// The identifier for the folder in which the evidence is stored.
  ///
  /// Parameter [evidenceId] :
  /// The identifier for the evidence.
  Future<GetEvidenceResponse> getEvidence({
    required String assessmentId,
    required String controlSetId,
    required String evidenceFolderId,
    required String evidenceId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlSetId, 'controlSetId');
    _s.validateStringLength(
      'controlSetId',
      controlSetId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(evidenceFolderId, 'evidenceFolderId');
    _s.validateStringLength(
      'evidenceFolderId',
      evidenceFolderId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(evidenceId, 'evidenceId');
    _s.validateStringLength(
      'evidenceId',
      evidenceId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/controlSets/${Uri.encodeComponent(controlSetId)}/evidenceFolders/${Uri.encodeComponent(evidenceFolderId)}/evidence/${Uri.encodeComponent(evidenceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEvidenceResponse.fromJson(response);
  }

  /// Returns all evidence from a specified evidence folder in AWS Audit
  /// Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the control set.
  ///
  /// Parameter [evidenceFolderId] :
  /// The unique identifier for the folder in which the evidence is stored.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
  Future<GetEvidenceByEvidenceFolderResponse> getEvidenceByEvidenceFolder({
    required String assessmentId,
    required String controlSetId,
    required String evidenceFolderId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlSetId, 'controlSetId');
    _s.validateStringLength(
      'controlSetId',
      controlSetId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(evidenceFolderId, 'evidenceFolderId');
    _s.validateStringLength(
      'evidenceFolderId',
      evidenceFolderId,
      36,
      36,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
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

  /// Returns an evidence folder from the specified assessment in AWS Audit
  /// Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the specified control set.
  ///
  /// Parameter [evidenceFolderId] :
  /// The identifier for the folder in which the evidence is stored.
  Future<GetEvidenceFolderResponse> getEvidenceFolder({
    required String assessmentId,
    required String controlSetId,
    required String evidenceFolderId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlSetId, 'controlSetId');
    _s.validateStringLength(
      'controlSetId',
      controlSetId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(evidenceFolderId, 'evidenceFolderId');
    _s.validateStringLength(
      'evidenceFolderId',
      evidenceFolderId,
      36,
      36,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/controlSets/${Uri.encodeComponent(controlSetId)}/evidenceFolders/${Uri.encodeComponent(evidenceFolderId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEvidenceFolderResponse.fromJson(response);
  }

  /// Returns the evidence folders from a specified assessment in AWS Audit
  /// Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
  Future<GetEvidenceFoldersByAssessmentResponse>
      getEvidenceFoldersByAssessment({
    required String assessmentId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
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

  /// Returns a list of evidence folders associated with a specified control of
  /// an assessment in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [controlId] :
  /// The identifier for the specified control.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the specified control set.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
  Future<GetEvidenceFoldersByAssessmentControlResponse>
      getEvidenceFoldersByAssessmentControl({
    required String assessmentId,
    required String controlId,
    required String controlSetId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlId, 'controlId');
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlSetId, 'controlSetId');
    _s.validateStringLength(
      'controlSetId',
      controlSetId,
      1,
      300,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
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

  /// Returns the name of the delegated AWS administrator account for the AWS
  /// organization.
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

  /// Returns a list of the in-scope AWS services for the specified assessment.
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

  /// Returns the settings for the specified AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attribute] :
  /// The list of <code>SettingAttribute</code> enum values.
  Future<GetSettingsResponse> getSettings({
    required SettingAttribute attribute,
  }) async {
    ArgumentError.checkNotNull(attribute, 'attribute');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/settings/${Uri.encodeComponent(attribute.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSettingsResponse.fromJson(response);
  }

  /// Returns a list of the frameworks available in the AWS Audit Manager
  /// framework library.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [frameworkType] :
  /// The type of framework, such as standard or custom.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
  Future<ListAssessmentFrameworksResponse> listAssessmentFrameworks({
    required FrameworkType frameworkType,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(frameworkType, 'frameworkType');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
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

  /// Returns a list of assessment reports created in AWS Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
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

  /// Returns a list of current and past assessments from AWS Audit Manager.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
  Future<ListAssessmentsResponse> listAssessments({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
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
      requestUri: '/assessments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssessmentsResponse.fromJson(response);
  }

  /// Returns a list of controls from AWS Audit Manager.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlType] :
  /// The type of control, such as standard or custom.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
  Future<ListControlsResponse> listControls({
    required ControlType controlType,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(controlType, 'controlType');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
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

  /// Returns a list of keywords that pre-mapped to the specified control data
  /// source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [source] :
  /// The control mapping data source to which the keywords apply.
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
  Future<ListKeywordsForDataSourceResponse> listKeywordsForDataSource({
    required SourceType source,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(source, 'source');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
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

  /// Returns a list of all AWS Audit Manager notifications.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// Represents the maximum number of results per page, or per API request
  /// call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to fetch the next set of results.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
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

  /// Returns a list of tags for the specified resource in AWS Audit Manager.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the specified resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Enables AWS Audit Manager for the specified AWS account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [delegatedAdminAccount] :
  /// The delegated administrator account for AWS Audit Manager.
  ///
  /// Parameter [kmsKey] :
  /// The AWS KMS key details.
  Future<RegisterAccountResponse> registerAccount({
    String? delegatedAdminAccount,
    String? kmsKey,
  }) async {
    _s.validateStringLength(
      'delegatedAdminAccount',
      delegatedAdminAccount,
      12,
      12,
    );
    _s.validateStringLength(
      'kmsKey',
      kmsKey,
      7,
      2048,
    );
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

  /// Enables an AWS account within the organization as the delegated
  /// administrator for AWS Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [adminAccountId] :
  /// The identifier for the specified delegated administrator account.
  Future<RegisterOrganizationAdminAccountResponse>
      registerOrganizationAdminAccount({
    required String adminAccountId,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
    _s.validateStringLength(
      'adminAccountId',
      adminAccountId,
      12,
      12,
      isRequired: true,
    );
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

  /// Tags the specified resource in AWS Audit Manager.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the specified resource.
  ///
  /// Parameter [tags] :
  /// The tags to be associated with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
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

  /// Removes a tag from a resource in AWS Audit Manager.
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
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

  /// Edits an AWS Audit Manager assessment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [scope] :
  /// The scope of the specified assessment.
  ///
  /// Parameter [assessmentDescription] :
  /// The description of the specified assessment.
  ///
  /// Parameter [assessmentName] :
  /// The name of the specified assessment to be updated.
  ///
  /// Parameter [assessmentReportsDestination] :
  /// The assessment report storage destination for the specified assessment
  /// that is being updated.
  ///
  /// Parameter [roles] :
  /// The list of roles for the specified assessment.
  Future<UpdateAssessmentResponse> updateAssessment({
    required String assessmentId,
    required Scope scope,
    String? assessmentDescription,
    String? assessmentName,
    AssessmentReportsDestination? assessmentReportsDestination,
    List<Role>? roles,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'assessmentDescription',
      assessmentDescription,
      0,
      1000,
    );
    _s.validateStringLength(
      'assessmentName',
      assessmentName,
      1,
      300,
    );
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

  /// Updates a control within an assessment in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [controlId] :
  /// The identifier for the specified control.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the specified control set.
  ///
  /// Parameter [commentBody] :
  /// The comment body text for the specified control.
  ///
  /// Parameter [controlStatus] :
  /// The status of the specified control.
  Future<UpdateAssessmentControlResponse> updateAssessmentControl({
    required String assessmentId,
    required String controlId,
    required String controlSetId,
    String? commentBody,
    ControlStatus? controlStatus,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlId, 'controlId');
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlSetId, 'controlSetId');
    _s.validateStringLength(
      'controlSetId',
      controlSetId,
      1,
      300,
      isRequired: true,
    );
    _s.validateStringLength(
      'commentBody',
      commentBody,
      0,
      500,
    );
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

  /// Updates the status of a control set in an AWS Audit Manager assessment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [comment] :
  /// The comment related to the status update.
  ///
  /// Parameter [controlSetId] :
  /// The identifier for the specified control set.
  ///
  /// Parameter [status] :
  /// The status of the control set that is being updated.
  Future<UpdateAssessmentControlSetStatusResponse>
      updateAssessmentControlSetStatus({
    required String assessmentId,
    required String comment,
    required String controlSetId,
    required ControlSetStatus status,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(comment, 'comment');
    _s.validateStringLength(
      'comment',
      comment,
      0,
      350,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlSetId, 'controlSetId');
    _s.validateStringLength(
      'controlSetId',
      controlSetId,
      0,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
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

  /// Updates a custom framework in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlSets] :
  /// The control sets associated with the framework.
  ///
  /// Parameter [frameworkId] :
  /// The identifier for the specified framework.
  ///
  /// Parameter [name] :
  /// The name of the framework to be updated.
  ///
  /// Parameter [complianceType] :
  /// The compliance type that the new custom framework supports, such as CIS or
  /// HIPAA.
  ///
  /// Parameter [description] :
  /// The description of the framework that is to be updated.
  Future<UpdateAssessmentFrameworkResponse> updateAssessmentFramework({
    required List<UpdateAssessmentFrameworkControlSet> controlSets,
    required String frameworkId,
    required String name,
    String? complianceType,
    String? description,
  }) async {
    ArgumentError.checkNotNull(controlSets, 'controlSets');
    ArgumentError.checkNotNull(frameworkId, 'frameworkId');
    _s.validateStringLength(
      'frameworkId',
      frameworkId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      300,
      isRequired: true,
    );
    _s.validateStringLength(
      'complianceType',
      complianceType,
      0,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
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

  /// Updates the status of an assessment in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assessmentId] :
  /// The identifier for the specified assessment.
  ///
  /// Parameter [status] :
  /// The current status of the specified assessment.
  Future<UpdateAssessmentStatusResponse> updateAssessmentStatus({
    required String assessmentId,
    required AssessmentStatus status,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
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

  /// Updates a custom control in AWS Audit Manager.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [controlId] :
  /// The identifier for the specified control.
  ///
  /// Parameter [controlMappingSources] :
  /// The data mapping sources for the specified control.
  ///
  /// Parameter [name] :
  /// The name of the control to be updated.
  ///
  /// Parameter [actionPlanInstructions] :
  /// The recommended actions to carry out if the control is not fulfilled.
  ///
  /// Parameter [actionPlanTitle] :
  /// The title of the action plan for remediating the control.
  ///
  /// Parameter [description] :
  /// The optional description of the control.
  ///
  /// Parameter [testingInformation] :
  /// The steps that to follow to determine if the control has been satisfied.
  Future<UpdateControlResponse> updateControl({
    required String controlId,
    required List<ControlMappingSource> controlMappingSources,
    required String name,
    String? actionPlanInstructions,
    String? actionPlanTitle,
    String? description,
    String? testingInformation,
  }) async {
    ArgumentError.checkNotNull(controlId, 'controlId');
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(controlMappingSources, 'controlMappingSources');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      300,
      isRequired: true,
    );
    _s.validateStringLength(
      'actionPlanInstructions',
      actionPlanInstructions,
      0,
      1000,
    );
    _s.validateStringLength(
      'actionPlanTitle',
      actionPlanTitle,
      0,
      300,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'testingInformation',
      testingInformation,
      0,
      1000,
    );
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

  /// Updates AWS Audit Manager settings for the current user account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [defaultAssessmentReportsDestination] :
  /// The default storage destination for assessment reports.
  ///
  /// Parameter [defaultProcessOwners] :
  /// A list of the default audit owners.
  ///
  /// Parameter [kmsKey] :
  /// The AWS KMS key details.
  ///
  /// Parameter [snsTopic] :
  /// The Amazon Simple Notification Service (Amazon SNS) topic to which AWS
  /// Audit Manager sends notifications.
  Future<UpdateSettingsResponse> updateSettings({
    AssessmentReportsDestination? defaultAssessmentReportsDestination,
    List<Role>? defaultProcessOwners,
    String? kmsKey,
    String? snsTopic,
  }) async {
    _s.validateStringLength(
      'kmsKey',
      kmsKey,
      7,
      2048,
    );
    _s.validateStringLength(
      'snsTopic',
      snsTopic,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      if (defaultAssessmentReportsDestination != null)
        'defaultAssessmentReportsDestination':
            defaultAssessmentReportsDestination,
      if (defaultProcessOwners != null)
        'defaultProcessOwners': defaultProcessOwners,
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

  /// Validates the integrity of an assessment report in AWS Audit Manager.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [s3RelativePath] :
  /// The relative path of the specified Amazon S3 bucket in which the
  /// assessment report is stored.
  Future<ValidateAssessmentReportIntegrityResponse>
      validateAssessmentReportIntegrity({
    required String s3RelativePath,
  }) async {
    ArgumentError.checkNotNull(s3RelativePath, 's3RelativePath');
    _s.validateStringLength(
      's3RelativePath',
      s3RelativePath,
      1,
      1024,
      isRequired: true,
    );
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

/// The wrapper of AWS account details, such as account ID, email address, and
/// so on.
class AWSAccount {
  /// The email address associated with the specified AWS account.
  final String? emailAddress;

  /// The identifier for the specified AWS account.
  final String? id;

  /// The name of the specified AWS account.
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

/// An AWS service such as Amazon S3, AWS CloudTrail, and so on.
class AWSService {
  /// The name of the AWS service.
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

extension on AccountStatus {
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

extension on String {
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

extension on ActionEnum {
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

extension on String {
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

/// An entity that defines the scope of audit evidence collected by AWS Audit
/// Manager. An AWS Audit Manager assessment is an implementation of an AWS
/// Audit Manager framework.
class Assessment {
  /// The Amazon Resource Name (ARN) of the assessment.
  final String? arn;

  /// The AWS account associated with the assessment.
  final AWSAccount? awsAccount;

  /// The framework from which the assessment was created.
  final AssessmentFramework? framework;

  /// The metadata for the specified assessment.
  final AssessmentMetadata? metadata;

  /// The tags associated with the assessment.
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

/// The control entity that represents a standard or custom control used in an
/// AWS Audit Manager assessment.
class AssessmentControl {
  /// The amount of evidence in the assessment report.
  final int? assessmentReportEvidenceCount;

  /// The list of comments attached to the specified control.
  final List<ControlComment>? comments;

  /// The description of the specified control.
  final String? description;

  /// The amount of evidence generated for the control.
  final int? evidenceCount;

  /// The list of data sources for the specified evidence.
  final List<String>? evidenceSources;

  /// The identifier for the specified control.
  final String? id;

  /// The name of the specified control.
  final String? name;

  /// The response of the specified control.
  final ControlResponse? response;

  /// The status of the specified control.
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

/// Represents a set of controls in an AWS Audit Manager assessment.
class AssessmentControlSet {
  /// The list of controls contained with the control set.
  final List<AssessmentControl>? controls;

  /// The delegations associated with the control set.
  final List<Delegation>? delegations;

  /// The description for the control set.
  final String? description;

  /// The identifier of the control set in the assessment. This is the control set
  /// name in a plain string format.
  final String? id;

  /// The total number of evidence objects uploaded manually to the control set.
  final int? manualEvidenceCount;

  /// The roles associated with the control set.
  final List<Role>? roles;

  /// Specifies the current status of the control set.
  final ControlSetStatus? status;

  /// The total number of evidence objects retrieved automatically for the control
  /// set.
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

/// The folder in which AWS Audit Manager stores evidence for an assessment.
class AssessmentEvidenceFolder {
  /// The identifier for the specified assessment.
  final String? assessmentId;

  /// The total count of evidence included in the assessment report.
  final int? assessmentReportSelectionCount;

  /// The name of the user who created the evidence folder.
  final String? author;

  /// The unique identifier for the specified control.
  final String? controlId;

  /// The name of the control.
  final String? controlName;

  /// The identifier for the control set.
  final String? controlSetId;

  /// The AWS service from which the evidence was collected.
  final String? dataSource;

  /// The date when the first evidence was added to the evidence folder.
  final DateTime? date;

  /// The total number of AWS resources assessed to generate the evidence.
  final int? evidenceAwsServiceSourceCount;

  /// The number of evidence that falls under the compliance check category. This
  /// evidence is collected from AWS Config or AWS Security Hub.
  final int? evidenceByTypeComplianceCheckCount;

  /// The total number of issues that were reported directly from AWS Security
  /// Hub, AWS Config, or both.
  final int? evidenceByTypeComplianceCheckIssuesCount;

  /// The number of evidence that falls under the configuration data category.
  /// This evidence is collected from configuration snapshots of other AWS
  /// services such as Amazon EC2, Amazon S3, or IAM.
  final int? evidenceByTypeConfigurationDataCount;

  /// The number of evidence that falls under the manual category. This evidence
  /// is imported manually.
  final int? evidenceByTypeManualCount;

  /// The number of evidence that falls under the user activity category. This
  /// evidence is collected from AWS CloudTrail logs.
  final int? evidenceByTypeUserActivityCount;

  /// The amount of evidence included in the evidence folder.
  final int? evidenceResourcesIncludedCount;

  /// The identifier for the folder in which evidence is stored.
  final String? id;

  /// The name of the specified evidence folder.
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

/// The file used to structure and automate AWS Audit Manager assessments for a
/// given compliance standard.
class AssessmentFramework {
  /// The Amazon Resource Name (ARN) of the specified framework.
  final String? arn;

  /// The control sets associated with the framework.
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

/// The metadata associated with a standard or custom framework.
class AssessmentFrameworkMetadata {
  /// The Amazon Resource Name (ARN) of the framework.
  final String? arn;

  /// The compliance type that the new custom framework supports, such as CIS or
  /// HIPAA.
  final String? complianceType;

  /// The number of control sets associated with the specified framework.
  final int? controlSetsCount;

  /// The number of controls associated with the specified framework.
  final int? controlsCount;

  /// Specifies when the framework was created.
  final DateTime? createdAt;

  /// The description of the specified framework.
  final String? description;

  /// The unique identified for the specified framework.
  final String? id;

  /// Specifies when the framework was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The logo associated with the framework.
  final String? logo;

  /// The name of the specified framework.
  final String? name;

  /// The framework type, such as standard or custom.
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

/// The metadata associated with the specified assessment.
class AssessmentMetadata {
  /// The destination in which evidence reports are stored for the specified
  /// assessment.
  final AssessmentReportsDestination? assessmentReportsDestination;

  /// The name of a compliance standard related to the assessment, such as
  /// PCI-DSS.
  final String? complianceType;

  /// Specifies when the assessment was created.
  final DateTime? creationTime;

  /// The delegations associated with the assessment.
  final List<Delegation>? delegations;

  /// The description of the assessment.
  final String? description;

  /// The unique identifier for the assessment.
  final String? id;

  /// The time of the most recent update.
  final DateTime? lastUpdated;

  /// The name of the assessment.
  final String? name;

  /// The roles associated with the assessment.
  final List<Role>? roles;

  /// The wrapper of AWS accounts and services in scope for the assessment.
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

/// A metadata object associated with an assessment in AWS Audit Manager.
class AssessmentMetadataItem {
  /// The name of the compliance standard related to the assessment, such as
  /// PCI-DSS.
  final String? complianceType;

  /// Specifies when the assessment was created.
  final DateTime? creationTime;

  /// The delegations associated with the assessment.
  final List<Delegation>? delegations;

  /// The unique identifier for the assessment.
  final String? id;

  /// The time of the most recent update.
  final DateTime? lastUpdated;

  /// The name of the assessment.
  final String? name;

  /// The roles associated with the assessment.
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

/// A finalized document generated from an AWS Audit Manager assessment. These
/// reports summarize the relevant evidence collected for your audit, and link
/// to the relevant evidence folders which are named and organized according to
/// the controls specified in your assessment.
class AssessmentReport {
  /// The identifier for the specified assessment.
  final String? assessmentId;

  /// The name of the associated assessment.
  final String? assessmentName;

  /// The name of the user who created the assessment report.
  final String? author;

  /// The identifier for the specified AWS account.
  final String? awsAccountId;

  /// Specifies when the assessment report was created.
  final DateTime? creationTime;

  /// The description of the specified assessment report.
  final String? description;

  /// The unique identifier for the specified assessment report.
  final String? id;

  /// The name given to the assessment report.
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

extension on AssessmentReportDestinationType {
  String toValue() {
    switch (this) {
      case AssessmentReportDestinationType.s3:
        return 'S3';
    }
  }
}

extension on String {
  AssessmentReportDestinationType toAssessmentReportDestinationType() {
    switch (this) {
      case 'S3':
        return AssessmentReportDestinationType.s3;
    }
    throw Exception(
        '$this is not known in enum AssessmentReportDestinationType');
  }
}

/// An error entity for the <code>AssessmentReportEvidence</code> API. This is
/// used to provide more meaningful errors than a simple string message.
class AssessmentReportEvidenceError {
  /// The error code returned by the <code>AssessmentReportEvidence</code> API.
  final String? errorCode;

  /// The error message returned by the <code>AssessmentReportEvidence</code> API.
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

/// The metadata objects associated with the specified assessment report.
class AssessmentReportMetadata {
  /// The unique identifier for the associated assessment.
  final String? assessmentId;

  /// The name of the associated assessment.
  final String? assessmentName;

  /// The name of the user who created the assessment report.
  final String? author;

  /// Specifies when the assessment report was created.
  final DateTime? creationTime;

  /// The description of the specified assessment report.
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

extension on AssessmentReportStatus {
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

extension on String {
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

/// The location in which AWS Audit Manager saves assessment reports for the
/// given assessment.
class AssessmentReportsDestination {
  /// The destination of the assessment report.
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

extension on AssessmentStatus {
  String toValue() {
    switch (this) {
      case AssessmentStatus.active:
        return 'ACTIVE';
      case AssessmentStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension on String {
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
  /// A list of errors returned by the
  /// <code>BatchAssociateAssessmentReportEvidence</code> API.
  final List<AssessmentReportEvidenceError>? errors;

  /// The identifier for the evidence.
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
  /// The API request to batch create delegations in AWS Audit Manager.
  final CreateDelegationRequest? createDelegationRequest;

  /// The error code returned by the
  /// <code>BatchCreateDelegationByAssessment</code> API.
  final String? errorCode;

  /// The error message returned by the
  /// <code>BatchCreateDelegationByAssessment</code> API.
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
  /// The delegations associated with the assessment.
  final List<Delegation>? delegations;

  /// A list of errors returned by the
  /// <code>BatchCreateDelegationByAssessment</code> API.
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
  /// The identifier for the specified delegation.
  final String? delegationId;

  /// The error code returned by the
  /// <code>BatchDeleteDelegationByAssessment</code> API.
  final String? errorCode;

  /// The error message returned by the
  /// <code>BatchDeleteDelegationByAssessment</code> API.
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
  /// A list of errors returned by the
  /// <code>BatchDeleteDelegationByAssessment</code> API.
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
  /// A list of errors returned by the
  /// <code>BatchDisassociateAssessmentReportEvidence</code> API.
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
  /// The error code returned by the
  /// <code>BatchImportEvidenceToAssessmentControl</code> API.
  final String? errorCode;

  /// The error message returned by the
  /// <code>BatchImportEvidenceToAssessmentControl</code> API.
  final String? errorMessage;

  /// Manual evidence that cannot be collected automatically by AWS Audit Manager.
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
  /// A list of errors returned by the
  /// <code>BatchImportEvidenceToAssessmentControl</code> API.
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

/// The record of a change within AWS Audit Manager, such as a modified
/// assessment, a delegated control set, and so on.
class ChangeLog {
  /// The action performed.
  final ActionEnum? action;

  /// The time of creation for the changelog object.
  final DateTime? createdAt;

  /// The IAM user or role that performed the action.
  final String? createdBy;

  /// The name of the changelog object.
  final String? objectName;

  /// The changelog object type, such as an assessment, control, or control set.
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

/// A control in AWS Audit Manager.
class Control {
  /// The recommended actions to carry out if the control is not fulfilled.
  final String? actionPlanInstructions;

  /// The title of the action plan for remediating the control.
  final String? actionPlanTitle;

  /// The Amazon Resource Name (ARN) of the specified control.
  final String? arn;

  /// The data mapping sources for the specified control.
  final List<ControlMappingSource>? controlMappingSources;

  /// The data source that determines from where AWS Audit Manager collects
  /// evidence for the control.
  final String? controlSources;

  /// Specifies when the control was created.
  final DateTime? createdAt;

  /// The IAM user or role that created the control.
  final String? createdBy;

  /// The description of the specified control.
  final String? description;

  /// The unique identifier for the control.
  final String? id;

  /// Specifies when the control was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The IAM user or role that most recently updated the control.
  final String? lastUpdatedBy;

  /// The name of the specified control.
  final String? name;

  /// The tags associated with the control.
  final Map<String, String>? tags;

  /// The steps to follow to determine if the control has been satisfied.
  final String? testingInformation;

  /// The type of control, such as custom or standard.
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

/// A comment posted by a user on a control. This includes the author's name,
/// the comment text, and a timestamp.
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

/// The data source that determines from where AWS Audit Manager collects
/// evidence for the control.
class ControlMappingSource {
  /// The description of the specified source.
  final String? sourceDescription;

  /// The frequency of evidence collection for the specified control mapping
  /// source.
  final SourceFrequency? sourceFrequency;

  /// The unique identifier for the specified source.
  final String? sourceId;
  final SourceKeyword? sourceKeyword;

  /// The name of the specified source.
  final String? sourceName;

  /// The setup option for the data source, which reflects if the evidence
  /// collection is automated or manual.
  final SourceSetUpOption? sourceSetUpOption;

  /// Specifies one of the five types of data sources for evidence collection.
  final SourceType? sourceType;

  /// The instructions for troubleshooting the specified control.
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

/// The metadata associated with the specified standard or custom control.
class ControlMetadata {
  /// The Amazon Resource Name (ARN) of the specified control.
  final String? arn;

  /// The data source that determines from where AWS Audit Manager collects
  /// evidence for the control.
  final String? controlSources;

  /// Specifies when the control was created.
  final DateTime? createdAt;

  /// The unique identifier for the specified control.
  final String? id;

  /// Specifies when the control was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The name of the specified control.
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

extension on ControlResponse {
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

extension on String {
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

/// A set of controls in AWS Audit Manager.
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

extension on ControlSetStatus {
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

extension on String {
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

extension on ControlStatus {
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

extension on String {
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

extension on ControlType {
  String toValue() {
    switch (this) {
      case ControlType.standard:
        return 'Standard';
      case ControlType.custom:
        return 'Custom';
    }
  }
}

extension on String {
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

/// Control entity attributes that uniquely identify an existing control to be
/// added to a framework in AWS Audit Manager.
class CreateAssessmentFrameworkControl {
  /// The unique identifier of the control.
  final String? id;

  CreateAssessmentFrameworkControl({
    this.id,
  });

  factory CreateAssessmentFrameworkControl.fromJson(Map<String, dynamic> json) {
    return CreateAssessmentFrameworkControl(
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
    };
  }
}

/// A <code>controlSet</code> entity that represents a collection of controls in
/// AWS Audit Manager. This does not contain the control set ID.
class CreateAssessmentFrameworkControlSet {
  /// The name of the specified control set.
  final String name;

  /// The list of controls within the control set. This does not contain the
  /// control set ID.
  final List<CreateAssessmentFrameworkControl>? controls;

  CreateAssessmentFrameworkControlSet({
    required this.name,
    this.controls,
  });

  factory CreateAssessmentFrameworkControlSet.fromJson(
      Map<String, dynamic> json) {
    return CreateAssessmentFrameworkControlSet(
      name: json['name'] as String,
      controls: (json['controls'] as List?)
          ?.whereNotNull()
          .map((e) => CreateAssessmentFrameworkControl.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

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
  /// The name of the new framework returned by the
  /// <code>CreateAssessmentFramework</code> API.
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
  /// The new assessment report returned by the
  /// <code>CreateAssessmentReport</code> API.
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

/// Control mapping fields that represent the source for evidence collection,
/// along with related parameters and metadata. This does not contain
/// <code>mappingID</code>.
class CreateControlMappingSource {
  /// The description of the data source that determines from where AWS Audit
  /// Manager collects evidence for the control.
  final String? sourceDescription;

  /// The frequency of evidence collection for the specified control mapping
  /// source.
  final SourceFrequency? sourceFrequency;
  final SourceKeyword? sourceKeyword;

  /// The name of the control mapping data source.
  final String? sourceName;

  /// The setup option for the data source, which reflects if the evidence
  /// collection is automated or manual.
  final SourceSetUpOption? sourceSetUpOption;

  /// Specifies one of the five types of data sources for evidence collection.
  final SourceType? sourceType;

  /// The instructions for troubleshooting the specified control.
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

  factory CreateControlMappingSource.fromJson(Map<String, dynamic> json) {
    return CreateControlMappingSource(
      sourceDescription: json['sourceDescription'] as String?,
      sourceFrequency:
          (json['sourceFrequency'] as String?)?.toSourceFrequency(),
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
  /// The new control returned by the <code>CreateControl</code> API.
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

/// A collection of attributes used to create a delegation for an assessment in
/// AWS Audit Manager.
class CreateDelegationRequest {
  /// A comment related to the delegation request.
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

/// The assignment of a control set to a delegate for review.
class Delegation {
  /// The identifier for the associated assessment.
  final String? assessmentId;

  /// The name of the associated assessment.
  final String? assessmentName;

  /// The comment related to the delegation.
  final String? comment;

  /// The identifier for the associated control set.
  final String? controlSetId;

  /// The IAM user or role that created the delegation.
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

/// The metadata associated with the specified delegation.
class DelegationMetadata {
  /// The unique identifier for the specified assessment.
  final String? assessmentId;

  /// The name of the associated assessment.
  final String? assessmentName;

  /// Specifies the name of the control set delegated for review.
  final String? controlSetName;

  /// Specifies when the delegation was created.
  final DateTime? creationTime;

  /// The unique identifier for the delegation.
  final String? id;

  /// The Amazon Resource Name (ARN) of the IAM role.
  final String? roleArn;

  /// The current status of the delgation.
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

extension on DelegationStatus {
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

extension on String {
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
/// activity triggered by a user, or a system configuration snapshot.
class Evidence {
  /// Specifies whether the evidence is included in the assessment report.
  final String? assessmentReportSelection;

  /// The names and values used by the evidence event, including an attribute name
  /// (such as <code>allowUsersToChangePassword</code>) and value (such as
  /// <code>true</code> or <code>false</code>).
  final Map<String, String>? attributes;

  /// The identifier for the specified AWS account.
  final String? awsAccountId;

  /// The AWS account from which the evidence is collected, and its AWS
  /// organization path.
  final String? awsOrganization;

  /// The evaluation status for evidence that falls under the compliance check
  /// category. For evidence collected from AWS Security Hub, a <i>Pass</i> or
  /// <i>Fail</i> result is shown. For evidence collected from AWS Config, a
  /// <i>Compliant</i> or <i>Noncompliant</i> result is shown.
  final String? complianceCheck;

  /// The data source from which the specified evidence was collected.
  final String? dataSource;

  /// The name of the specified evidence event.
  final String? eventName;

  /// The AWS service from which the evidence is collected.
  final String? eventSource;

  /// The identifier for the specified AWS account.
  final String? evidenceAwsAccountId;

  /// The type of automated evidence.
  final String? evidenceByType;

  /// The identifier for the folder in which the evidence is stored.
  final String? evidenceFolderId;

  /// The unique identifier for the IAM user or role associated with the evidence.
  final String? iamId;

  /// The identifier for the evidence.
  final String? id;

  /// The list of resources assessed to generate the evidence.
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

/// The file used to structure and automate AWS Audit Manager assessments for a
/// given compliance standard.
class Framework {
  /// The Amazon Resource Name (ARN) of the specified framework.
  final String? arn;

  /// The compliance type that the new custom framework supports, such as CIS or
  /// HIPAA.
  final String? complianceType;

  /// The control sets associated with the framework.
  final List<ControlSet>? controlSets;

  /// The sources from which AWS Audit Manager collects evidence for the control.
  final String? controlSources;

  /// Specifies when the framework was created.
  final DateTime? createdAt;

  /// The IAM user or role that created the framework.
  final String? createdBy;

  /// The description of the specified framework.
  final String? description;

  /// The unique identifier for the specified framework.
  final String? id;

  /// Specifies when the framework was most recently updated.
  final DateTime? lastUpdatedAt;

  /// The IAM user or role that most recently updated the framework.
  final String? lastUpdatedBy;

  /// The logo associated with the framework.
  final String? logo;

  /// The name of the specified framework.
  final String? name;

  /// The tags associated with the framework.
  final Map<String, String>? tags;

  /// The framework type, such as custom or standard.
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

/// The metadata of a framework, such as the name, ID, description, and so on.
class FrameworkMetadata {
  /// The compliance standard associated with the framework, such as PCI-DSS or
  /// HIPAA.
  final String? complianceType;

  /// The description of the framework.
  final String? description;

  /// The logo associated with the framework.
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

extension on FrameworkType {
  String toValue() {
    switch (this) {
      case FrameworkType.standard:
        return 'Standard';
      case FrameworkType.custom:
        return 'Custom';
    }
  }
}

extension on String {
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
  /// The status of the specified AWS account.
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
  /// The framework returned by the <code>GetAssessmentFramework</code> API.
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

  /// The pagination token used to fetch the next set of results.
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
  /// The name of the control returned by the <code>GetControl</code> API.
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
  /// The list of delegations returned by the <code>GetDelegations</code> API.
  final List<DelegationMetadata>? delegations;

  /// The pagination token used to fetch the next set of results.
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
  /// The list of evidence returned by the
  /// <code>GetEvidenceByEvidenceFolder</code> API.
  final List<Evidence>? evidence;

  /// The pagination token used to fetch the next set of results.
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

class GetEvidenceFolderResponse {
  /// The folder in which evidence is stored.
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
  /// The list of evidence folders returned by the
  /// <code>GetEvidenceFoldersByAssessmentControl</code> API.
  final List<AssessmentEvidenceFolder>? evidenceFolders;

  /// The pagination token used to fetch the next set of results.
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
  /// The list of evidence folders returned by the
  /// <code>GetEvidenceFoldersByAssessment</code> API.
  final List<AssessmentEvidenceFolder>? evidenceFolders;

  /// The pagination token used to fetch the next set of results.
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
  /// The evidence returned by the <code>GetEvidenceResponse</code> API.
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

class GetOrganizationAdminAccountResponse {
  /// The identifier for the specified administrator account.
  final String? adminAccountId;

  /// The identifier for the specified organization.
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
  /// The metadata associated with the aAWS service.
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
  /// The settings object that holds all supported AWS Audit Manager settings.
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

enum KeywordInputType {
  selectFromList,
}

extension on KeywordInputType {
  String toValue() {
    switch (this) {
      case KeywordInputType.selectFromList:
        return 'SELECT_FROM_LIST';
    }
  }
}

extension on String {
  KeywordInputType toKeywordInputType() {
    switch (this) {
      case 'SELECT_FROM_LIST':
        return KeywordInputType.selectFromList;
    }
    throw Exception('$this is not known in enum KeywordInputType');
  }
}

class ListAssessmentFrameworksResponse {
  /// The list of metadata objects for the specified framework.
  final List<AssessmentFrameworkMetadata>? frameworkMetadataList;

  /// The pagination token used to fetch the next set of results.
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
  /// The list of assessment reports returned by the
  /// <code>ListAssessmentReports</code> API.
  final List<AssessmentReportMetadata>? assessmentReports;

  /// The pagination token used to fetch the next set of results.
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
  /// The metadata associated with the assessment.
  final List<AssessmentMetadataItem>? assessmentMetadata;

  /// The pagination token used to fetch the next set of results.
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

class ListControlsResponse {
  /// The list of control metadata objects returned by the
  /// <code>ListControls</code> API.
  final List<ControlMetadata>? controlMetadataList;

  /// The pagination token used to fetch the next set of results.
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
  /// The list of keywords for the specified event mapping source.
  final List<String>? keywords;

  /// The pagination token used to fetch the next set of results.
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
  /// The pagination token used to fetch the next set of results.
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
  /// The list of tags returned by the <code>ListTagsForResource</code> API.
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

/// Evidence that is uploaded to AWS Audit Manager manually.
class ManualEvidence {
  /// The Amazon S3 URL that points to a manual evidence object.
  final String? s3ResourcePath;

  ManualEvidence({
    this.s3ResourcePath,
  });

  factory ManualEvidence.fromJson(Map<String, dynamic> json) {
    return ManualEvidence(
      s3ResourcePath: json['s3ResourcePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3ResourcePath = this.s3ResourcePath;
    return {
      if (s3ResourcePath != null) 's3ResourcePath': s3ResourcePath,
    };
  }
}

/// The notification used to inform a user of an update in AWS Audit Manager.
/// For example, this includes the notification that is sent when a control set
/// is delegated for review.
class Notification {
  /// The identifier for the specified assessment.
  final String? assessmentId;

  /// The name of the related assessment.
  final String? assessmentName;

  /// The identifier for the specified control set.
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

extension on ObjectTypeEnum {
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

extension on String {
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
  /// The identifier for the specified delegated administrator account.
  final String? adminAccountId;

  /// The identifier for the specified AWS organization.
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

/// A system asset that is evaluated in an AWS Audit Manager assessment.
class Resource {
  /// The Amazon Resource Name (ARN) for the specified resource.
  final String? arn;

  /// The value of the specified resource.
  final String? value;

  Resource({
    this.arn,
    this.value,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      arn: json['arn'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final value = this.value;
    return {
      if (arn != null) 'arn': arn,
      if (value != null) 'value': value,
    };
  }
}

/// The wrapper that contains the AWS Audit Manager role information of the
/// current user, such as the role type and IAM Amazon Resource Name (ARN).
class Role {
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

  Role({
    this.roleArn,
    this.roleType,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleArn: json['roleArn'] as String?,
      roleType: (json['roleType'] as String?)?.toRoleType(),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final roleType = this.roleType;
    return {
      if (roleArn != null) 'roleArn': roleArn,
      if (roleType != null) 'roleType': roleType.toValue(),
    };
  }
}

enum RoleType {
  processOwner,
  resourceOwner,
}

extension on RoleType {
  String toValue() {
    switch (this) {
      case RoleType.processOwner:
        return 'PROCESS_OWNER';
      case RoleType.resourceOwner:
        return 'RESOURCE_OWNER';
    }
  }
}

extension on String {
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

/// The wrapper that contains the AWS accounts and AWS services in scope for the
/// assessment.
class Scope {
  /// The AWS accounts included in the scope of the assessment.
  final List<AWSAccount>? awsAccounts;

  /// The AWS services included in the scope of the assessment.
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

/// The metadata associated with the specified AWS service.
class ServiceMetadata {
  /// The category in which the AWS service belongs, such as compute, storage,
  /// database, and so on.
  final String? category;

  /// The description of the specified AWS service.
  final String? description;

  /// The display name of the AWS service.
  final String? displayName;

  /// The name of the AWS service.
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
}

extension on SettingAttribute {
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
    }
  }
}

extension on String {
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
    }
    throw Exception('$this is not known in enum SettingAttribute');
  }
}

/// The settings object that holds all supported AWS Audit Manager settings.
class Settings {
  /// The default storage destination for assessment reports.
  final AssessmentReportsDestination? defaultAssessmentReportsDestination;

  /// The designated default audit owners.
  final List<Role>? defaultProcessOwners;

  /// Specifies whether AWS Organizations is enabled.
  final bool? isAwsOrgEnabled;

  /// The AWS KMS key details.
  final String? kmsKey;

  /// The designated Amazon Simple Notification Service (Amazon SNS) topic.
  final String? snsTopic;

  Settings({
    this.defaultAssessmentReportsDestination,
    this.defaultProcessOwners,
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
      defaultProcessOwners: (json['defaultProcessOwners'] as List?)
          ?.whereNotNull()
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      isAwsOrgEnabled: json['isAwsOrgEnabled'] as bool?,
      kmsKey: json['kmsKey'] as String?,
      snsTopic: json['snsTopic'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultAssessmentReportsDestination =
        this.defaultAssessmentReportsDestination;
    final defaultProcessOwners = this.defaultProcessOwners;
    final isAwsOrgEnabled = this.isAwsOrgEnabled;
    final kmsKey = this.kmsKey;
    final snsTopic = this.snsTopic;
    return {
      if (defaultAssessmentReportsDestination != null)
        'defaultAssessmentReportsDestination':
            defaultAssessmentReportsDestination,
      if (defaultProcessOwners != null)
        'defaultProcessOwners': defaultProcessOwners,
      if (isAwsOrgEnabled != null) 'isAwsOrgEnabled': isAwsOrgEnabled,
      if (kmsKey != null) 'kmsKey': kmsKey,
      if (snsTopic != null) 'snsTopic': snsTopic,
    };
  }
}

enum SourceFrequency {
  daily,
  weekly,
  monthly,
}

extension on SourceFrequency {
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

extension on String {
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

/// The keyword to search for in AWS CloudTrail logs, AWS Config rules, AWS
/// Security Hub checks, and AWS API names.
class SourceKeyword {
  /// The method of input for the specified keyword.
  final KeywordInputType? keywordInputType;

  /// The value of the keyword used to search AWS CloudTrail logs, AWS Config
  /// rules, AWS Security Hub checks, and AWS API names when mapping a control
  /// data source.
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

extension on SourceSetUpOption {
  String toValue() {
    switch (this) {
      case SourceSetUpOption.systemControlsMapping:
        return 'System_Controls_Mapping';
      case SourceSetUpOption.proceduralControlsMapping:
        return 'Procedural_Controls_Mapping';
    }
  }
}

extension on String {
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

extension on SourceType {
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

extension on String {
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A uniform resource locator, used as a unique identifier to locate a resource
/// on the internet.
class URL {
  /// The name or word used as a hyperlink to the URL.
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
  /// The name of the updated control set returned by the
  /// <code>UpdateAssessmentControl</code> API.
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
  /// The name of the updated control set returned by the
  /// <code>UpdateAssessmentControlSetStatus</code> API.
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
/// AWS Audit Manager. This does not contain the control set ID.
class UpdateAssessmentFrameworkControlSet {
  /// The name of the control set.
  final String name;

  /// The list of controls contained within the control set.
  final List<CreateAssessmentFrameworkControl>? controls;

  /// The unique identifier for the control set.
  final String? id;

  UpdateAssessmentFrameworkControlSet({
    required this.name,
    this.controls,
    this.id,
  });

  factory UpdateAssessmentFrameworkControlSet.fromJson(
      Map<String, dynamic> json) {
    return UpdateAssessmentFrameworkControlSet(
      name: json['name'] as String,
      controls: (json['controls'] as List?)
          ?.whereNotNull()
          .map((e) => CreateAssessmentFrameworkControl.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final controls = this.controls;
    final id = this.id;
    return {
      'name': name,
      if (controls != null) 'controls': controls,
      if (id != null) 'id': id,
    };
  }
}

class UpdateAssessmentFrameworkResponse {
  /// The name of the specified framework.
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

class UpdateAssessmentResponse {
  /// The response object (name of the updated assessment) for the
  /// <code>UpdateAssessmentRequest</code> API.
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
  /// The name of the updated assessment returned by the
  /// <code>UpdateAssessmentStatus</code> API.
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
  /// The name of the updated control set returned by the
  /// <code>UpdateControl</code> API.
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
  /// The signature algorithm used to code sign the assessment report file.
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
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
