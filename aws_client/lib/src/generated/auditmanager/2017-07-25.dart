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

part '2017-07-25.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String assessmentId,
    @_s.required String evidenceFolderId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'evidenceFolderId',
      evidenceFolderId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    return AssociateAssessmentReportEvidenceFolderResponse.fromJson(response);
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
    @_s.required String assessmentId,
    @_s.required String evidenceFolderId,
    @_s.required List<String> evidenceIds,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'evidenceFolderId',
      evidenceFolderId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String assessmentId,
    @_s.required List<CreateDelegationRequest> createDelegationRequests,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String assessmentId,
    @_s.required List<String> delegationIds,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String assessmentId,
    @_s.required String evidenceFolderId,
    @_s.required List<String> evidenceIds,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'evidenceFolderId',
      evidenceFolderId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String assessmentId,
    @_s.required String controlId,
    @_s.required String controlSetId,
    @_s.required List<ManualEvidence> manualEvidence,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'controlId',
      controlId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'controlSetId',
      controlSetId,
      r'''^[\w\W\s\S]*$''',
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
    @_s.required AssessmentReportsDestination assessmentReportsDestination,
    @_s.required String frameworkId,
    @_s.required String name,
    @_s.required List<Role> roles,
    @_s.required Scope scope,
    String description,
    Map<String, String> tags,
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
    _s.validateStringPattern(
      'frameworkId',
      frameworkId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\W\s\S]*$''',
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
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w\W\s\S]*$''',
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
  Future<CreateAssessmentFrameworkResponse> createAssessmentFramework({
    @_s.required List<CreateAssessmentFrameworkControlSet> controlSets,
    @_s.required String name,
    String complianceType,
    String description,
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\W\s\S]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'complianceType',
      complianceType,
      0,
      100,
    );
    _s.validateStringPattern(
      'complianceType',
      complianceType,
      r'''^[\w\W\s\S]*$''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w\W\s\S]*$''',
    );
    final $payload = <String, dynamic>{
      'controlSets': controlSets,
      'name': name,
      if (complianceType != null) 'complianceType': complianceType,
      if (description != null) 'description': description,
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
    @_s.required String assessmentId,
    @_s.required String name,
    String description,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9-_\.]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w\W\s\S]*$''',
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
  /// The data source that determines from where AWS Audit Manager collects
  /// evidence for the control.
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
    @_s.required List<CreateControlMappingSource> controlMappingSources,
    @_s.required String name,
    String actionPlanInstructions,
    String actionPlanTitle,
    String description,
    Map<String, String> tags,
    String testingInformation,
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\W\s\S]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'actionPlanInstructions',
      actionPlanInstructions,
      0,
      1000,
    );
    _s.validateStringPattern(
      'actionPlanInstructions',
      actionPlanInstructions,
      r'''^[\w\W\s\S]*$''',
    );
    _s.validateStringLength(
      'actionPlanTitle',
      actionPlanTitle,
      0,
      300,
    );
    _s.validateStringPattern(
      'actionPlanTitle',
      actionPlanTitle,
      r'''^[\w\W\s\S]*$''',
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w\W\s\S]*$''',
    );
    _s.validateStringLength(
      'testingInformation',
      testingInformation,
      0,
      1000,
    );
    _s.validateStringPattern(
      'testingInformation',
      testingInformation,
      r'''^[\w\W\s\S]*$''',
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
    @_s.required String assessmentId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assessments/${Uri.encodeComponent(assessmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAssessmentResponse.fromJson(response);
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
    @_s.required String frameworkId,
  }) async {
    ArgumentError.checkNotNull(frameworkId, 'frameworkId');
    _s.validateStringLength(
      'frameworkId',
      frameworkId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'frameworkId',
      frameworkId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/assessmentFrameworks/${Uri.encodeComponent(frameworkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAssessmentFrameworkResponse.fromJson(response);
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
    @_s.required String assessmentId,
    @_s.required String assessmentReportId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'assessmentReportId',
      assessmentReportId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/assessments/${Uri.encodeComponent(assessmentId)}/reports/${Uri.encodeComponent(assessmentReportId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAssessmentReportResponse.fromJson(response);
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
    @_s.required String controlId,
  }) async {
    ArgumentError.checkNotNull(controlId, 'controlId');
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'controlId',
      controlId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/controls/${Uri.encodeComponent(controlId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteControlResponse.fromJson(response);
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
    String adminAccountId,
  }) async {
    _s.validateStringLength(
      'adminAccountId',
      adminAccountId,
      12,
      12,
    );
    _s.validateStringPattern(
      'adminAccountId',
      adminAccountId,
      r'''^[0-9]{12}$''',
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
    return DeregisterOrganizationAdminAccountResponse.fromJson(response);
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
    @_s.required String assessmentId,
    @_s.required String evidenceFolderId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'evidenceFolderId',
      evidenceFolderId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    return DisassociateAssessmentReportEvidenceFolderResponse.fromJson(
        response);
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
    @_s.required String assessmentId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String frameworkId,
  }) async {
    ArgumentError.checkNotNull(frameworkId, 'frameworkId');
    _s.validateStringLength(
      'frameworkId',
      frameworkId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'frameworkId',
      frameworkId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String assessmentId,
    @_s.required String assessmentReportId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'assessmentReportId',
      assessmentReportId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String assessmentId,
    String controlId,
    String controlSetId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
    );
    _s.validateStringPattern(
      'controlId',
      controlId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
    );
    _s.validateStringLength(
      'controlSetId',
      controlSetId,
      1,
      300,
    );
    _s.validateStringPattern(
      'controlSetId',
      controlSetId,
      r'''^[\w\W\s\S]*$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
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
    @_s.required String controlId,
  }) async {
    ArgumentError.checkNotNull(controlId, 'controlId');
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'controlId',
      controlId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
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
    @_s.required String assessmentId,
    @_s.required String controlSetId,
    @_s.required String evidenceFolderId,
    @_s.required String evidenceId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'controlSetId',
      controlSetId,
      r'''^[\w\W\s\S]*$''',
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
    _s.validateStringPattern(
      'evidenceFolderId',
      evidenceFolderId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'evidenceId',
      evidenceId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String assessmentId,
    @_s.required String controlSetId,
    @_s.required String evidenceFolderId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'controlSetId',
      controlSetId,
      r'''^[\w\W\s\S]*$''',
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
    _s.validateStringPattern(
      'evidenceFolderId',
      evidenceFolderId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
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
    @_s.required String assessmentId,
    @_s.required String controlSetId,
    @_s.required String evidenceFolderId,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'controlSetId',
      controlSetId,
      r'''^[\w\W\s\S]*$''',
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
    _s.validateStringPattern(
      'evidenceFolderId',
      evidenceFolderId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    @_s.required String assessmentId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
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
    @_s.required String assessmentId,
    @_s.required String controlId,
    @_s.required String controlSetId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'controlId',
      controlId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'controlSetId',
      controlSetId,
      r'''^[\w\W\s\S]*$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
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
    @_s.required SettingAttribute attribute,
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
    @_s.required FrameworkType frameworkType,
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
    );
    final $query = <String, List<String>>{
      if (frameworkType != null) 'frameworkType': [frameworkType.toValue()],
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
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
    @_s.required ControlType controlType,
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
    );
    final $query = <String, List<String>>{
      if (controlType != null) 'controlType': [controlType.toValue()],
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
    @_s.required SourceType source,
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
    );
    final $query = <String, List<String>>{
      if (source != null) 'source': [source.toValue()],
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+\/=]*$''',
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:.*:auditmanager:.*''',
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
    String delegatedAdminAccount,
    String kmsKey,
  }) async {
    _s.validateStringLength(
      'delegatedAdminAccount',
      delegatedAdminAccount,
      12,
      12,
    );
    _s.validateStringPattern(
      'delegatedAdminAccount',
      delegatedAdminAccount,
      r'''^[0-9]{12}$''',
    );
    _s.validateStringLength(
      'kmsKey',
      kmsKey,
      7,
      2048,
    );
    _s.validateStringPattern(
      'kmsKey',
      kmsKey,
      r'''^arn:.*:kms:.*|DEFAULT''',
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
    @_s.required String adminAccountId,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
    _s.validateStringLength(
      'adminAccountId',
      adminAccountId,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'adminAccountId',
      adminAccountId,
      r'''^[0-9]{12}$''',
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:.*:auditmanager:.*''',
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:.*:auditmanager:.*''',
      isRequired: true,
    );
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
    @_s.required String assessmentId,
    @_s.required Scope scope,
    String assessmentDescription,
    String assessmentName,
    AssessmentReportsDestination assessmentReportsDestination,
    List<Role> roles,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scope, 'scope');
    _s.validateStringLength(
      'assessmentDescription',
      assessmentDescription,
      0,
      1000,
    );
    _s.validateStringPattern(
      'assessmentDescription',
      assessmentDescription,
      r'''^[\w\W\s\S]*$''',
    );
    _s.validateStringLength(
      'assessmentName',
      assessmentName,
      1,
      300,
    );
    _s.validateStringPattern(
      'assessmentName',
      assessmentName,
      r'''^[\w\W\s\S]*$''',
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
    @_s.required String assessmentId,
    @_s.required String controlId,
    @_s.required String controlSetId,
    String commentBody,
    ControlStatus controlStatus,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'controlId',
      controlId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'controlSetId',
      controlSetId,
      r'''^[\w\W\s\S]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'commentBody',
      commentBody,
      0,
      500,
    );
    _s.validateStringPattern(
      'commentBody',
      commentBody,
      r'''^[\w\W\s\S]*$''',
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
    @_s.required String assessmentId,
    @_s.required String comment,
    @_s.required String controlSetId,
    @_s.required ControlSetStatus status,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'comment',
      comment,
      r'''^[\w\W\s\S]*$''',
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
    _s.validateStringPattern(
      'controlSetId',
      controlSetId,
      r'''.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    final $payload = <String, dynamic>{
      'comment': comment,
      'status': status?.toValue() ?? '',
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
    @_s.required List<UpdateAssessmentFrameworkControlSet> controlSets,
    @_s.required String frameworkId,
    @_s.required String name,
    String complianceType,
    String description,
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
    _s.validateStringPattern(
      'frameworkId',
      frameworkId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\W\s\S]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'complianceType',
      complianceType,
      0,
      100,
    );
    _s.validateStringPattern(
      'complianceType',
      complianceType,
      r'''^[\w\W\s\S]*$''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w\W\s\S]*$''',
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
    @_s.required String assessmentId,
    @_s.required AssessmentStatus status,
  }) async {
    ArgumentError.checkNotNull(assessmentId, 'assessmentId');
    _s.validateStringLength(
      'assessmentId',
      assessmentId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'assessmentId',
      assessmentId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(status, 'status');
    final $payload = <String, dynamic>{
      'status': status?.toValue() ?? '',
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
  /// The data source that determines from where AWS Audit Manager collects
  /// evidence for the control.
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
    @_s.required String controlId,
    @_s.required List<ControlMappingSource> controlMappingSources,
    @_s.required String name,
    String actionPlanInstructions,
    String actionPlanTitle,
    String description,
    String testingInformation,
  }) async {
    ArgumentError.checkNotNull(controlId, 'controlId');
    _s.validateStringLength(
      'controlId',
      controlId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'controlId',
      controlId,
      r'''^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[\w\W\s\S]*$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'actionPlanInstructions',
      actionPlanInstructions,
      0,
      1000,
    );
    _s.validateStringPattern(
      'actionPlanInstructions',
      actionPlanInstructions,
      r'''^[\w\W\s\S]*$''',
    );
    _s.validateStringLength(
      'actionPlanTitle',
      actionPlanTitle,
      0,
      300,
    );
    _s.validateStringPattern(
      'actionPlanTitle',
      actionPlanTitle,
      r'''^[\w\W\s\S]*$''',
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^[\w\W\s\S]*$''',
    );
    _s.validateStringLength(
      'testingInformation',
      testingInformation,
      0,
      1000,
    );
    _s.validateStringPattern(
      'testingInformation',
      testingInformation,
      r'''^[\w\W\s\S]*$''',
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
    AssessmentReportsDestination defaultAssessmentReportsDestination,
    List<Role> defaultProcessOwners,
    String kmsKey,
    String snsTopic,
  }) async {
    _s.validateStringLength(
      'kmsKey',
      kmsKey,
      7,
      2048,
    );
    _s.validateStringPattern(
      'kmsKey',
      kmsKey,
      r'''^arn:.*:kms:.*|DEFAULT''',
    );
    _s.validateStringLength(
      'snsTopic',
      snsTopic,
      20,
      2048,
    );
    _s.validateStringPattern(
      'snsTopic',
      snsTopic,
      r'''^arn:.*:sns:.*''',
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
    @_s.required String s3RelativePath,
  }) async {
    ArgumentError.checkNotNull(s3RelativePath, 's3RelativePath');
    _s.validateStringLength(
      's3RelativePath',
      s3RelativePath,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      's3RelativePath',
      s3RelativePath,
      r'''^(S|s)3:\/\/[a-zA-Z0-9-_\/.]+$''',
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AWSAccount {
  /// The email address associated with the specified AWS account.
  @_s.JsonKey(name: 'emailAddress')
  final String emailAddress;

  /// The identifier for the specified AWS account.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the specified AWS account.
  @_s.JsonKey(name: 'name')
  final String name;

  AWSAccount({
    this.emailAddress,
    this.id,
    this.name,
  });
  factory AWSAccount.fromJson(Map<String, dynamic> json) =>
      _$AWSAccountFromJson(json);

  Map<String, dynamic> toJson() => _$AWSAccountToJson(this);
}

/// An AWS service such as Amazon S3, AWS CloudTrail, and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AWSService {
  /// The name of the AWS service.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  AWSService({
    this.serviceName,
  });
  factory AWSService.fromJson(Map<String, dynamic> json) =>
      _$AWSServiceFromJson(json);

  Map<String, dynamic> toJson() => _$AWSServiceToJson(this);
}

enum AccountStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('PENDING_ACTIVATION')
  pendingActivation,
}

enum ActionEnum {
  @_s.JsonValue('CREATE')
  create,
  @_s.JsonValue('UPDATE_METADATA')
  updateMetadata,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DELETE')
  delete,
  @_s.JsonValue('UNDER_REVIEW')
  underReview,
  @_s.JsonValue('REVIEWED')
  reviewed,
  @_s.JsonValue('IMPORT_EVIDENCE')
  importEvidence,
}

/// An entity that defines the scope of audit evidence collected by AWS Audit
/// Manager. An AWS Audit Manager assessment is an implementation of an AWS
/// Audit Manager framework.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Assessment {
  /// The Amazon Resource Name (ARN) of the assessment.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The AWS account associated with the assessment.
  @_s.JsonKey(name: 'awsAccount')
  final AWSAccount awsAccount;

  /// The framework from which the assessment was created.
  @_s.JsonKey(name: 'framework')
  final AssessmentFramework framework;

  /// The metadata for the specified assessment.
  @_s.JsonKey(name: 'metadata')
  final AssessmentMetadata metadata;

  /// The tags associated with the assessment.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  Assessment({
    this.arn,
    this.awsAccount,
    this.framework,
    this.metadata,
    this.tags,
  });
  factory Assessment.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFromJson(json);
}

/// The control entity that represents a standard or custom control used in an
/// AWS Audit Manager assessment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssessmentControl {
  /// The amount of evidence in the assessment report.
  @_s.JsonKey(name: 'assessmentReportEvidenceCount')
  final int assessmentReportEvidenceCount;

  /// The list of comments attached to the specified control.
  @_s.JsonKey(name: 'comments')
  final List<ControlComment> comments;

  /// The description of the specified control.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The amount of evidence generated for the control.
  @_s.JsonKey(name: 'evidenceCount')
  final int evidenceCount;

  /// The list of data sources for the specified evidence.
  @_s.JsonKey(name: 'evidenceSources')
  final List<String> evidenceSources;

  /// The identifier for the specified control.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the specified control.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The response of the specified control.
  @_s.JsonKey(name: 'response')
  final ControlResponse response;

  /// The status of the specified control.
  @_s.JsonKey(name: 'status')
  final ControlStatus status;

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
  factory AssessmentControl.fromJson(Map<String, dynamic> json) =>
      _$AssessmentControlFromJson(json);
}

/// Represents a set of controls in an AWS Audit Manager assessment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssessmentControlSet {
  /// The list of controls contained with the control set.
  @_s.JsonKey(name: 'controls')
  final List<AssessmentControl> controls;

  /// The delegations associated with the control set.
  @_s.JsonKey(name: 'delegations')
  final List<Delegation> delegations;

  /// The description for the control set.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The identifier of the control set in the assessment. This is the control set
  /// name in a plain string format.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The total number of evidence objects uploaded manually to the control set.
  @_s.JsonKey(name: 'manualEvidenceCount')
  final int manualEvidenceCount;

  /// The roles associated with the control set.
  @_s.JsonKey(name: 'roles')
  final List<Role> roles;

  /// Specifies the current status of the control set.
  @_s.JsonKey(name: 'status')
  final ControlSetStatus status;

  /// The total number of evidence objects retrieved automatically for the control
  /// set.
  @_s.JsonKey(name: 'systemEvidenceCount')
  final int systemEvidenceCount;

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
  factory AssessmentControlSet.fromJson(Map<String, dynamic> json) =>
      _$AssessmentControlSetFromJson(json);
}

/// The folder in which AWS Audit Manager stores evidence for an assessment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssessmentEvidenceFolder {
  /// The identifier for the specified assessment.
  @_s.JsonKey(name: 'assessmentId')
  final String assessmentId;

  /// The total count of evidence included in the assessment report.
  @_s.JsonKey(name: 'assessmentReportSelectionCount')
  final int assessmentReportSelectionCount;

  /// The name of the user who created the evidence folder.
  @_s.JsonKey(name: 'author')
  final String author;

  /// The unique identifier for the specified control.
  @_s.JsonKey(name: 'controlId')
  final String controlId;

  /// The name of the control.
  @_s.JsonKey(name: 'controlName')
  final String controlName;

  /// The identifier for the control set.
  @_s.JsonKey(name: 'controlSetId')
  final String controlSetId;

  /// The AWS service from which the evidence was collected.
  @_s.JsonKey(name: 'dataSource')
  final String dataSource;

  /// The date when the first evidence was added to the evidence folder.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'date')
  final DateTime date;

  /// The total number of AWS resources assessed to generate the evidence.
  @_s.JsonKey(name: 'evidenceAwsServiceSourceCount')
  final int evidenceAwsServiceSourceCount;

  /// The number of evidence that falls under the compliance check category. This
  /// evidence is collected from AWS Config or AWS Security Hub.
  @_s.JsonKey(name: 'evidenceByTypeComplianceCheckCount')
  final int evidenceByTypeComplianceCheckCount;

  /// The total number of issues that were reported directly from AWS Security
  /// Hub, AWS Config, or both.
  @_s.JsonKey(name: 'evidenceByTypeComplianceCheckIssuesCount')
  final int evidenceByTypeComplianceCheckIssuesCount;

  /// The number of evidence that falls under the configuration data category.
  /// This evidence is collected from configuration snapshots of other AWS
  /// services such as Amazon EC2, Amazon S3, or IAM.
  @_s.JsonKey(name: 'evidenceByTypeConfigurationDataCount')
  final int evidenceByTypeConfigurationDataCount;

  /// The number of evidence that falls under the manual category. This evidence
  /// is imported manually.
  @_s.JsonKey(name: 'evidenceByTypeManualCount')
  final int evidenceByTypeManualCount;

  /// The number of evidence that falls under the user activity category. This
  /// evidence is collected from AWS CloudTrail logs.
  @_s.JsonKey(name: 'evidenceByTypeUserActivityCount')
  final int evidenceByTypeUserActivityCount;

  /// The amount of evidence included in the evidence folder.
  @_s.JsonKey(name: 'evidenceResourcesIncludedCount')
  final int evidenceResourcesIncludedCount;

  /// The identifier for the folder in which evidence is stored.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the specified evidence folder.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The total amount of evidence in the evidence folder.
  @_s.JsonKey(name: 'totalEvidence')
  final int totalEvidence;

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
  factory AssessmentEvidenceFolder.fromJson(Map<String, dynamic> json) =>
      _$AssessmentEvidenceFolderFromJson(json);
}

/// The file used to structure and automate AWS Audit Manager assessments for a
/// given compliance standard.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssessmentFramework {
  /// The Amazon Resource Name (ARN) of the specified framework.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The control sets associated with the framework.
  @_s.JsonKey(name: 'controlSets')
  final List<AssessmentControlSet> controlSets;

  /// The unique identifier for the framework.
  @_s.JsonKey(name: 'id')
  final String id;
  @_s.JsonKey(name: 'metadata')
  final FrameworkMetadata metadata;

  AssessmentFramework({
    this.arn,
    this.controlSets,
    this.id,
    this.metadata,
  });
  factory AssessmentFramework.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFrameworkFromJson(json);
}

/// The metadata associated with a standard or custom framework.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssessmentFrameworkMetadata {
  /// The compliance type that the new custom framework supports, such as CIS or
  /// HIPAA.
  @_s.JsonKey(name: 'complianceType')
  final String complianceType;

  /// The number of control sets associated with the specified framework.
  @_s.JsonKey(name: 'controlSetsCount')
  final int controlSetsCount;

  /// The number of controls associated with the specified framework.
  @_s.JsonKey(name: 'controlsCount')
  final int controlsCount;

  /// Specifies when the framework was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The description of the specified framework.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identified for the specified framework.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Specifies when the framework was most recently updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The logo associated with the framework.
  @_s.JsonKey(name: 'logo')
  final String logo;

  /// The name of the specified framework.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The framework type, such as standard or custom.
  @_s.JsonKey(name: 'type')
  final FrameworkType type;

  AssessmentFrameworkMetadata({
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
  factory AssessmentFrameworkMetadata.fromJson(Map<String, dynamic> json) =>
      _$AssessmentFrameworkMetadataFromJson(json);
}

/// The metadata associated with the specified assessment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssessmentMetadata {
  /// The destination in which evidence reports are stored for the specified
  /// assessment.
  @_s.JsonKey(name: 'assessmentReportsDestination')
  final AssessmentReportsDestination assessmentReportsDestination;

  /// The name of a compliance standard related to the assessment, such as
  /// PCI-DSS.
  @_s.JsonKey(name: 'complianceType')
  final String complianceType;

  /// Specifies when the assessment was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The delegations associated with the assessment.
  @_s.JsonKey(name: 'delegations')
  final List<Delegation> delegations;

  /// The description of the assessment.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identifier for the assessment.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The time of the most recent update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdated')
  final DateTime lastUpdated;

  /// The name of the assessment.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The roles associated with the assessment.
  @_s.JsonKey(name: 'roles')
  final List<Role> roles;

  /// The wrapper of AWS accounts and services in scope for the assessment.
  @_s.JsonKey(name: 'scope')
  final Scope scope;

  /// The overall status of the assessment.
  @_s.JsonKey(name: 'status')
  final AssessmentStatus status;

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
  factory AssessmentMetadata.fromJson(Map<String, dynamic> json) =>
      _$AssessmentMetadataFromJson(json);
}

/// A metadata object associated with an assessment in AWS Audit Manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssessmentMetadataItem {
  /// The name of the compliance standard related to the assessment, such as
  /// PCI-DSS.
  @_s.JsonKey(name: 'complianceType')
  final String complianceType;

  /// Specifies when the assessment was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The delegations associated with the assessment.
  @_s.JsonKey(name: 'delegations')
  final List<Delegation> delegations;

  /// The unique identifier for the assessment.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The time of the most recent update.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdated')
  final DateTime lastUpdated;

  /// The name of the assessment.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The roles associated with the assessment.
  @_s.JsonKey(name: 'roles')
  final List<Role> roles;

  /// The current status of the assessment.
  @_s.JsonKey(name: 'status')
  final AssessmentStatus status;

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
  factory AssessmentMetadataItem.fromJson(Map<String, dynamic> json) =>
      _$AssessmentMetadataItemFromJson(json);
}

/// A finalized document generated from an AWS Audit Manager assessment. These
/// reports summarize the relevant evidence collected for your audit, and link
/// to the relevant evidence folders which are named and organized according to
/// the controls specified in your assessment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssessmentReport {
  /// The identifier for the specified assessment.
  @_s.JsonKey(name: 'assessmentId')
  final String assessmentId;

  /// The name of the associated assessment.
  @_s.JsonKey(name: 'assessmentName')
  final String assessmentName;

  /// The name of the user who created the assessment report.
  @_s.JsonKey(name: 'author')
  final String author;

  /// The identifier for the specified AWS account.
  @_s.JsonKey(name: 'awsAccountId')
  final String awsAccountId;

  /// Specifies when the assessment report was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The description of the specified assessment report.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identifier for the specified assessment report.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name given to the assessment report.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The current status of the specified assessment report.
  @_s.JsonKey(name: 'status')
  final AssessmentReportStatus status;

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
  factory AssessmentReport.fromJson(Map<String, dynamic> json) =>
      _$AssessmentReportFromJson(json);
}

enum AssessmentReportDestinationType {
  @_s.JsonValue('S3')
  s3,
}

/// An error entity for the <code>AssessmentReportEvidence</code> API. This is
/// used to provide more meaningful errors than a simple string message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssessmentReportEvidenceError {
  /// The error code returned by the <code>AssessmentReportEvidence</code> API.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The error message returned by the <code>AssessmentReportEvidence</code> API.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// The identifier for the evidence.
  @_s.JsonKey(name: 'evidenceId')
  final String evidenceId;

  AssessmentReportEvidenceError({
    this.errorCode,
    this.errorMessage,
    this.evidenceId,
  });
  factory AssessmentReportEvidenceError.fromJson(Map<String, dynamic> json) =>
      _$AssessmentReportEvidenceErrorFromJson(json);
}

/// The metadata objects associated with the specified assessment report.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssessmentReportMetadata {
  /// The unique identifier for the associated assessment.
  @_s.JsonKey(name: 'assessmentId')
  final String assessmentId;

  /// The name of the associated assessment.
  @_s.JsonKey(name: 'assessmentName')
  final String assessmentName;

  /// The name of the user who created the assessment report.
  @_s.JsonKey(name: 'author')
  final String author;

  /// Specifies when the assessment report was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The description of the specified assessment report.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identifier for the assessment report.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the assessment report.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The current status of the assessment report.
  @_s.JsonKey(name: 'status')
  final AssessmentReportStatus status;

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
  factory AssessmentReportMetadata.fromJson(Map<String, dynamic> json) =>
      _$AssessmentReportMetadataFromJson(json);
}

enum AssessmentReportStatus {
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('FAILED')
  failed,
}

/// The location in which AWS Audit Manager saves assessment reports for the
/// given assessment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssessmentReportsDestination {
  /// The destination of the assessment report.
  @_s.JsonKey(name: 'destination')
  final String destination;

  /// The destination type, such as Amazon S3.
  @_s.JsonKey(name: 'destinationType')
  final AssessmentReportDestinationType destinationType;

  AssessmentReportsDestination({
    this.destination,
    this.destinationType,
  });
  factory AssessmentReportsDestination.fromJson(Map<String, dynamic> json) =>
      _$AssessmentReportsDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$AssessmentReportsDestinationToJson(this);
}

enum AssessmentStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateAssessmentReportEvidenceFolderResponse {
  AssociateAssessmentReportEvidenceFolderResponse();
  factory AssociateAssessmentReportEvidenceFolderResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateAssessmentReportEvidenceFolderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchAssociateAssessmentReportEvidenceResponse {
  /// A list of errors returned by the
  /// <code>BatchAssociateAssessmentReportEvidence</code> API.
  @_s.JsonKey(name: 'errors')
  final List<AssessmentReportEvidenceError> errors;

  /// The identifier for the evidence.
  @_s.JsonKey(name: 'evidenceIds')
  final List<String> evidenceIds;

  BatchAssociateAssessmentReportEvidenceResponse({
    this.errors,
    this.evidenceIds,
  });
  factory BatchAssociateAssessmentReportEvidenceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchAssociateAssessmentReportEvidenceResponseFromJson(json);
}

/// An error entity for the <code>BatchCreateDelegationByAssessment</code> API.
/// This is used to provide more meaningful errors than a simple string message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCreateDelegationByAssessmentError {
  /// The API request to batch create delegations in AWS Audit Manager.
  @_s.JsonKey(name: 'createDelegationRequest')
  final CreateDelegationRequest createDelegationRequest;

  /// The error code returned by the
  /// <code>BatchCreateDelegationByAssessment</code> API.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The error message returned by the
  /// <code>BatchCreateDelegationByAssessment</code> API.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  BatchCreateDelegationByAssessmentError({
    this.createDelegationRequest,
    this.errorCode,
    this.errorMessage,
  });
  factory BatchCreateDelegationByAssessmentError.fromJson(
          Map<String, dynamic> json) =>
      _$BatchCreateDelegationByAssessmentErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCreateDelegationByAssessmentResponse {
  /// The delegations associated with the assessment.
  @_s.JsonKey(name: 'delegations')
  final List<Delegation> delegations;

  /// A list of errors returned by the
  /// <code>BatchCreateDelegationByAssessment</code> API.
  @_s.JsonKey(name: 'errors')
  final List<BatchCreateDelegationByAssessmentError> errors;

  BatchCreateDelegationByAssessmentResponse({
    this.delegations,
    this.errors,
  });
  factory BatchCreateDelegationByAssessmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchCreateDelegationByAssessmentResponseFromJson(json);
}

/// An error entity for the <code>BatchDeleteDelegationByAssessment</code> API.
/// This is used to provide more meaningful errors than a simple string message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteDelegationByAssessmentError {
  /// The identifier for the specified delegation.
  @_s.JsonKey(name: 'delegationId')
  final String delegationId;

  /// The error code returned by the
  /// <code>BatchDeleteDelegationByAssessment</code> API.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The error message returned by the
  /// <code>BatchDeleteDelegationByAssessment</code> API.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  BatchDeleteDelegationByAssessmentError({
    this.delegationId,
    this.errorCode,
    this.errorMessage,
  });
  factory BatchDeleteDelegationByAssessmentError.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDeleteDelegationByAssessmentErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteDelegationByAssessmentResponse {
  /// A list of errors returned by the
  /// <code>BatchDeleteDelegationByAssessment</code> API.
  @_s.JsonKey(name: 'errors')
  final List<BatchDeleteDelegationByAssessmentError> errors;

  BatchDeleteDelegationByAssessmentResponse({
    this.errors,
  });
  factory BatchDeleteDelegationByAssessmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDeleteDelegationByAssessmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDisassociateAssessmentReportEvidenceResponse {
  /// A list of errors returned by the
  /// <code>BatchDisassociateAssessmentReportEvidence</code> API.
  @_s.JsonKey(name: 'errors')
  final List<AssessmentReportEvidenceError> errors;

  /// The identifier for the evidence.
  @_s.JsonKey(name: 'evidenceIds')
  final List<String> evidenceIds;

  BatchDisassociateAssessmentReportEvidenceResponse({
    this.errors,
    this.evidenceIds,
  });
  factory BatchDisassociateAssessmentReportEvidenceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDisassociateAssessmentReportEvidenceResponseFromJson(json);
}

/// An error entity for the <code>BatchImportEvidenceToAssessmentControl</code>
/// API. This is used to provide more meaningful errors than a simple string
/// message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchImportEvidenceToAssessmentControlError {
  /// The error code returned by the
  /// <code>BatchImportEvidenceToAssessmentControl</code> API.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The error message returned by the
  /// <code>BatchImportEvidenceToAssessmentControlError</code> API.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  /// Manual evidence that cannot be collected automatically by AWS Audit Manager.
  @_s.JsonKey(name: 'manualEvidence')
  final ManualEvidence manualEvidence;

  BatchImportEvidenceToAssessmentControlError({
    this.errorCode,
    this.errorMessage,
    this.manualEvidence,
  });
  factory BatchImportEvidenceToAssessmentControlError.fromJson(
          Map<String, dynamic> json) =>
      _$BatchImportEvidenceToAssessmentControlErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchImportEvidenceToAssessmentControlResponse {
  /// A list of errors returned by the
  /// <code>BatchImportEvidenceToAssessmentControl</code> API.
  @_s.JsonKey(name: 'errors')
  final List<BatchImportEvidenceToAssessmentControlError> errors;

  BatchImportEvidenceToAssessmentControlResponse({
    this.errors,
  });
  factory BatchImportEvidenceToAssessmentControlResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchImportEvidenceToAssessmentControlResponseFromJson(json);
}

/// The record of a change within AWS Audit Manager, such as a modified
/// assessment, a delegated control set, and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChangeLog {
  /// The action performed.
  @_s.JsonKey(name: 'action')
  final ActionEnum action;

  /// The time of creation for the changelog object.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The IAM user or role that performed the action.
  @_s.JsonKey(name: 'createdBy')
  final String createdBy;

  /// The name of the changelog object.
  @_s.JsonKey(name: 'objectName')
  final String objectName;

  /// The changelog object type, such as an assessment, control, or control set.
  @_s.JsonKey(name: 'objectType')
  final ObjectTypeEnum objectType;

  ChangeLog({
    this.action,
    this.createdAt,
    this.createdBy,
    this.objectName,
    this.objectType,
  });
  factory ChangeLog.fromJson(Map<String, dynamic> json) =>
      _$ChangeLogFromJson(json);
}

/// A control in AWS Audit Manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Control {
  /// The recommended actions to carry out if the control is not fulfilled.
  @_s.JsonKey(name: 'actionPlanInstructions')
  final String actionPlanInstructions;

  /// The title of the action plan for remediating the control.
  @_s.JsonKey(name: 'actionPlanTitle')
  final String actionPlanTitle;

  /// The Amazon Resource Name (ARN) of the specified control.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The data mapping sources for the specified control.
  @_s.JsonKey(name: 'controlMappingSources')
  final List<ControlMappingSource> controlMappingSources;

  /// The data mapping sources for the specified control.
  @_s.JsonKey(name: 'controlSources')
  final String controlSources;

  /// Specifies when the control was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The IAM user or role that created the control.
  @_s.JsonKey(name: 'createdBy')
  final String createdBy;

  /// The description of the specified control.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identifier for the control.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Specifies when the control was most recently updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The IAM user or role that most recently updated the control.
  @_s.JsonKey(name: 'lastUpdatedBy')
  final String lastUpdatedBy;

  /// The name of the specified control.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The tags associated with the control.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The steps to follow to determine if the control has been satisfied.
  @_s.JsonKey(name: 'testingInformation')
  final String testingInformation;

  /// The type of control, such as custom or standard.
  @_s.JsonKey(name: 'type')
  final ControlType type;

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
  factory Control.fromJson(Map<String, dynamic> json) =>
      _$ControlFromJson(json);
}

/// A comment posted by a user on a control. This includes the author's name,
/// the comment text, and a timestamp.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ControlComment {
  /// The name of the user who authored the comment.
  @_s.JsonKey(name: 'authorName')
  final String authorName;

  /// The body text of a control comment.
  @_s.JsonKey(name: 'commentBody')
  final String commentBody;

  /// The time when the comment was posted.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'postedDate')
  final DateTime postedDate;

  ControlComment({
    this.authorName,
    this.commentBody,
    this.postedDate,
  });
  factory ControlComment.fromJson(Map<String, dynamic> json) =>
      _$ControlCommentFromJson(json);
}

/// The data source that determines from where AWS Audit Manager collects
/// evidence for the control.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ControlMappingSource {
  /// The description of the specified source.
  @_s.JsonKey(name: 'sourceDescription')
  final String sourceDescription;

  /// The frequency of evidence collection for the specified control mapping
  /// source.
  @_s.JsonKey(name: 'sourceFrequency')
  final SourceFrequency sourceFrequency;

  /// The unique identifier for the specified source.
  @_s.JsonKey(name: 'sourceId')
  final String sourceId;
  @_s.JsonKey(name: 'sourceKeyword')
  final SourceKeyword sourceKeyword;

  /// The name of the specified source.
  @_s.JsonKey(name: 'sourceName')
  final String sourceName;

  /// The setup option for the data source, which reflects if the evidence
  /// collection is automated or manual.
  @_s.JsonKey(name: 'sourceSetUpOption')
  final SourceSetUpOption sourceSetUpOption;

  /// Specifies one of the five types of data sources for evidence collection.
  @_s.JsonKey(name: 'sourceType')
  final SourceType sourceType;

  /// The instructions for troubleshooting the specified control.
  @_s.JsonKey(name: 'troubleshootingText')
  final String troubleshootingText;

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
  factory ControlMappingSource.fromJson(Map<String, dynamic> json) =>
      _$ControlMappingSourceFromJson(json);

  Map<String, dynamic> toJson() => _$ControlMappingSourceToJson(this);
}

/// The metadata associated with the specified standard or custom control.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ControlMetadata {
  /// The Amazon Resource Name (ARN) of the specified control.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The data source that determines from where AWS Audit Manager collects
  /// evidence for the control.
  @_s.JsonKey(name: 'controlSources')
  final String controlSources;

  /// Specifies when the control was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The unique identifier for the specified control.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Specifies when the control was most recently updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the specified control.
  @_s.JsonKey(name: 'name')
  final String name;

  ControlMetadata({
    this.arn,
    this.controlSources,
    this.createdAt,
    this.id,
    this.lastUpdatedAt,
    this.name,
  });
  factory ControlMetadata.fromJson(Map<String, dynamic> json) =>
      _$ControlMetadataFromJson(json);
}

enum ControlResponse {
  @_s.JsonValue('MANUAL')
  manual,
  @_s.JsonValue('AUTOMATE')
  automate,
  @_s.JsonValue('DEFER')
  defer,
  @_s.JsonValue('IGNORE')
  ignore,
}

/// A set of controls in AWS Audit Manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ControlSet {
  /// The list of controls within the control set.
  @_s.JsonKey(name: 'controls')
  final List<Control> controls;

  /// The identifier of the control set in the assessment. This is the control set
  /// name in a plain string format.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the control set.
  @_s.JsonKey(name: 'name')
  final String name;

  ControlSet({
    this.controls,
    this.id,
    this.name,
  });
  factory ControlSet.fromJson(Map<String, dynamic> json) =>
      _$ControlSetFromJson(json);
}

enum ControlSetStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UNDER_REVIEW')
  underReview,
  @_s.JsonValue('REVIEWED')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ControlStatus {
  @_s.JsonValue('UNDER_REVIEW')
  underReview,
  @_s.JsonValue('REVIEWED')
  reviewed,
  @_s.JsonValue('INACTIVE')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ControlType {
  @_s.JsonValue('Standard')
  standard,
  @_s.JsonValue('Custom')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Control entity attributes that uniquely identify an existing control to be
/// added to a framework in AWS Audit Manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateAssessmentFrameworkControl {
  /// The unique identifier of the control.
  @_s.JsonKey(name: 'id')
  final String id;

  CreateAssessmentFrameworkControl({
    this.id,
  });
  Map<String, dynamic> toJson() =>
      _$CreateAssessmentFrameworkControlToJson(this);
}

/// A <code>controlSet</code> entity that represents a collection of controls in
/// AWS Audit Manager. This does not contain the control set ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateAssessmentFrameworkControlSet {
  /// The list of controls within the control set. This does not contain the
  /// control set ID.
  @_s.JsonKey(name: 'controls')
  final List<CreateAssessmentFrameworkControl> controls;

  /// The name of the specified control set.
  @_s.JsonKey(name: 'name')
  final String name;

  CreateAssessmentFrameworkControlSet({
    this.controls,
    this.name,
  });
  Map<String, dynamic> toJson() =>
      _$CreateAssessmentFrameworkControlSetToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAssessmentFrameworkResponse {
  /// The name of the new framework returned by the
  /// <code>CreateAssessmentFramework</code> API.
  @_s.JsonKey(name: 'framework')
  final Framework framework;

  CreateAssessmentFrameworkResponse({
    this.framework,
  });
  factory CreateAssessmentFrameworkResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateAssessmentFrameworkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAssessmentReportResponse {
  /// The new assessment report returned by the
  /// <code>CreateAssessmentReport</code> API.
  @_s.JsonKey(name: 'assessmentReport')
  final AssessmentReport assessmentReport;

  CreateAssessmentReportResponse({
    this.assessmentReport,
  });
  factory CreateAssessmentReportResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAssessmentReportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAssessmentResponse {
  @_s.JsonKey(name: 'assessment')
  final Assessment assessment;

  CreateAssessmentResponse({
    this.assessment,
  });
  factory CreateAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAssessmentResponseFromJson(json);
}

/// Control mapping fields that represent the source for evidence collection,
/// along with related parameters and metadata. This does not contain
/// <code>mappingID</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateControlMappingSource {
  /// The description of the data source that determines from where AWS Audit
  /// Manager collects evidence for the control.
  @_s.JsonKey(name: 'sourceDescription')
  final String sourceDescription;

  /// The frequency of evidence collection for the specified control mapping
  /// source.
  @_s.JsonKey(name: 'sourceFrequency')
  final SourceFrequency sourceFrequency;
  @_s.JsonKey(name: 'sourceKeyword')
  final SourceKeyword sourceKeyword;

  /// The name of the control mapping data source.
  @_s.JsonKey(name: 'sourceName')
  final String sourceName;

  /// The setup option for the data source, which reflects if the evidence
  /// collection is automated or manual.
  @_s.JsonKey(name: 'sourceSetUpOption')
  final SourceSetUpOption sourceSetUpOption;

  /// Specifies one of the five types of data sources for evidence collection.
  @_s.JsonKey(name: 'sourceType')
  final SourceType sourceType;

  /// The instructions for troubleshooting the specified control.
  @_s.JsonKey(name: 'troubleshootingText')
  final String troubleshootingText;

  CreateControlMappingSource({
    this.sourceDescription,
    this.sourceFrequency,
    this.sourceKeyword,
    this.sourceName,
    this.sourceSetUpOption,
    this.sourceType,
    this.troubleshootingText,
  });
  Map<String, dynamic> toJson() => _$CreateControlMappingSourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateControlResponse {
  /// The new control returned by the <code>CreateControl</code> API.
  @_s.JsonKey(name: 'control')
  final Control control;

  CreateControlResponse({
    this.control,
  });
  factory CreateControlResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateControlResponseFromJson(json);
}

/// A collection of attributes used to create a delegation for an assessment in
/// AWS Audit Manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateDelegationRequest {
  /// A comment related to the delegation request.
  @_s.JsonKey(name: 'comment')
  final String comment;

  /// The unique identifier for the control set.
  @_s.JsonKey(name: 'controlSetId')
  final String controlSetId;

  /// The Amazon Resource Name (ARN) of the IAM role.
  @_s.JsonKey(name: 'roleArn')
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
  @_s.JsonKey(name: 'roleType')
  final RoleType roleType;

  CreateDelegationRequest({
    this.comment,
    this.controlSetId,
    this.roleArn,
    this.roleType,
  });
  factory CreateDelegationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateDelegationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateDelegationRequestToJson(this);
}

/// The assignment of a control set to a delegate for review.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Delegation {
  /// The identifier for the associated assessment.
  @_s.JsonKey(name: 'assessmentId')
  final String assessmentId;

  /// The name of the associated assessment.
  @_s.JsonKey(name: 'assessmentName')
  final String assessmentName;

  /// The comment related to the delegation.
  @_s.JsonKey(name: 'comment')
  final String comment;

  /// The identifier for the associated control set.
  @_s.JsonKey(name: 'controlSetId')
  final String controlSetId;

  /// The IAM user or role that created the delegation.
  @_s.JsonKey(name: 'createdBy')
  final String createdBy;

  /// Specifies when the delegation was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The unique identifier for the delegation.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Specifies when the delegation was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdated')
  final DateTime lastUpdated;

  /// The Amazon Resource Name (ARN) of the IAM role.
  @_s.JsonKey(name: 'roleArn')
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
  @_s.JsonKey(name: 'roleType')
  final RoleType roleType;

  /// The status of the delegation.
  @_s.JsonKey(name: 'status')
  final DelegationStatus status;

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
  factory Delegation.fromJson(Map<String, dynamic> json) =>
      _$DelegationFromJson(json);
}

/// The metadata associated with the specified delegation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DelegationMetadata {
  /// The unique identifier for the specified assessment.
  @_s.JsonKey(name: 'assessmentId')
  final String assessmentId;

  /// The name of the associated assessment.
  @_s.JsonKey(name: 'assessmentName')
  final String assessmentName;

  /// Specifies the name of the control set delegated for review.
  @_s.JsonKey(name: 'controlSetName')
  final String controlSetName;

  /// Specifies when the delegation was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The unique identifier for the delegation.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The Amazon Resource Name (ARN) of the IAM role.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The current status of the delgation.
  @_s.JsonKey(name: 'status')
  final DelegationStatus status;

  DelegationMetadata({
    this.assessmentId,
    this.assessmentName,
    this.controlSetName,
    this.creationTime,
    this.id,
    this.roleArn,
    this.status,
  });
  factory DelegationMetadata.fromJson(Map<String, dynamic> json) =>
      _$DelegationMetadataFromJson(json);
}

enum DelegationStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('UNDER_REVIEW')
  underReview,
  @_s.JsonValue('COMPLETE')
  complete,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAssessmentFrameworkResponse {
  DeleteAssessmentFrameworkResponse();
  factory DeleteAssessmentFrameworkResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteAssessmentFrameworkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAssessmentReportResponse {
  DeleteAssessmentReportResponse();
  factory DeleteAssessmentReportResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAssessmentReportResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAssessmentResponse {
  DeleteAssessmentResponse();
  factory DeleteAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAssessmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteControlResponse {
  DeleteControlResponse();
  factory DeleteControlResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteControlResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterAccountResponse {
  /// The registration status of the account.
  @_s.JsonKey(name: 'status')
  final AccountStatus status;

  DeregisterAccountResponse({
    this.status,
  });
  factory DeregisterAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$DeregisterAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterOrganizationAdminAccountResponse {
  DeregisterOrganizationAdminAccountResponse();
  factory DeregisterOrganizationAdminAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeregisterOrganizationAdminAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateAssessmentReportEvidenceFolderResponse {
  DisassociateAssessmentReportEvidenceFolderResponse();
  factory DisassociateAssessmentReportEvidenceFolderResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateAssessmentReportEvidenceFolderResponseFromJson(json);
}

/// A record that contains the information needed to demonstrate compliance with
/// the requirements specified by a control. Examples of evidence include change
/// activity triggered by a user, or a system configuration snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Evidence {
  /// Specifies whether the evidence is inclded in the assessment report.
  @_s.JsonKey(name: 'assessmentReportSelection')
  final String assessmentReportSelection;

  /// The names and values used by the evidence event, including an attribute name
  /// (such as <code>allowUsersToChangePassword</code>) and value (such as
  /// <code>true</code> or <code>false</code>).
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;

  /// The identifier for the specified AWS account.
  @_s.JsonKey(name: 'awsAccountId')
  final String awsAccountId;

  /// The AWS account from which the evidence is collected, and its AWS
  /// organization path.
  @_s.JsonKey(name: 'awsOrganization')
  final String awsOrganization;

  /// The evaluation status for evidence that falls under the compliance check
  /// category. For evidence collected from AWS Security Hub, a <i>Pass</i> or
  /// <i>Fail</i> result is shown. For evidence collected from AWS Config, a
  /// <i>Compliant</i> or <i>Noncompliant</i> result is shown.
  @_s.JsonKey(name: 'complianceCheck')
  final String complianceCheck;

  /// The data source from which the specified evidence was collected.
  @_s.JsonKey(name: 'dataSource')
  final String dataSource;

  /// The name of the specified evidence event.
  @_s.JsonKey(name: 'eventName')
  final String eventName;

  /// The AWS service from which the evidence is collected.
  @_s.JsonKey(name: 'eventSource')
  final String eventSource;

  /// The identifier for the specified AWS account.
  @_s.JsonKey(name: 'evidenceAwsAccountId')
  final String evidenceAwsAccountId;

  /// The type of automated evidence.
  @_s.JsonKey(name: 'evidenceByType')
  final String evidenceByType;

  /// The identifier for the folder in which the evidence is stored.
  @_s.JsonKey(name: 'evidenceFolderId')
  final String evidenceFolderId;

  /// The unique identifier for the IAM user or role associated with the evidence.
  @_s.JsonKey(name: 'iamId')
  final String iamId;

  /// The identifier for the evidence.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The list of resources assessed to generate the evidence.
  @_s.JsonKey(name: 'resourcesIncluded')
  final List<Resource> resourcesIncluded;

  /// The timestamp that represents when the evidence was collected.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'time')
  final DateTime time;

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
  factory Evidence.fromJson(Map<String, dynamic> json) =>
      _$EvidenceFromJson(json);
}

/// The file used to structure and automate AWS Audit Manager assessments for a
/// given compliance standard.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Framework {
  /// The Amazon Resource Name (ARN) of the specified framework.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The compliance type that the new custom framework supports, such as CIS or
  /// HIPAA.
  @_s.JsonKey(name: 'complianceType')
  final String complianceType;

  /// The control sets associated with the framework.
  @_s.JsonKey(name: 'controlSets')
  final List<ControlSet> controlSets;

  /// The sources from which AWS Audit Manager collects evidence for the control.
  @_s.JsonKey(name: 'controlSources')
  final String controlSources;

  /// Specifies when the framework was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The IAM user or role that created the framework.
  @_s.JsonKey(name: 'createdBy')
  final String createdBy;

  /// The description of the specified framework.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The unique identifier for the specified framework.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Specifies when the framework was most recently updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The IAM user or role that most recently updated the framework.
  @_s.JsonKey(name: 'lastUpdatedBy')
  final String lastUpdatedBy;

  /// The logo associated with the framework.
  @_s.JsonKey(name: 'logo')
  final String logo;

  /// The name of the specified framework.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The framework type, such as custom or standard.
  @_s.JsonKey(name: 'type')
  final FrameworkType type;

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
    this.type,
  });
  factory Framework.fromJson(Map<String, dynamic> json) =>
      _$FrameworkFromJson(json);
}

/// The metadata of a framework, such as the name, ID, description, and so on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FrameworkMetadata {
  /// The compliance standard associated with the framework, such as PCI-DSS or
  /// HIPAA.
  @_s.JsonKey(name: 'complianceType')
  final String complianceType;

  /// The description of the framework.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The logo associated with the framework.
  @_s.JsonKey(name: 'logo')
  final String logo;

  /// The name of the framework.
  @_s.JsonKey(name: 'name')
  final String name;

  FrameworkMetadata({
    this.complianceType,
    this.description,
    this.logo,
    this.name,
  });
  factory FrameworkMetadata.fromJson(Map<String, dynamic> json) =>
      _$FrameworkMetadataFromJson(json);
}

enum FrameworkType {
  @_s.JsonValue('Standard')
  standard,
  @_s.JsonValue('Custom')
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAccountStatusResponse {
  /// The status of the specified AWS account.
  @_s.JsonKey(name: 'status')
  final AccountStatus status;

  GetAccountStatusResponse({
    this.status,
  });
  factory GetAccountStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAssessmentFrameworkResponse {
  /// The framework returned by the <code>GetAssessmentFramework</code> API.
  @_s.JsonKey(name: 'framework')
  final Framework framework;

  GetAssessmentFrameworkResponse({
    this.framework,
  });
  factory GetAssessmentFrameworkResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAssessmentFrameworkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAssessmentReportUrlResponse {
  @_s.JsonKey(name: 'preSignedUrl')
  final URL preSignedUrl;

  GetAssessmentReportUrlResponse({
    this.preSignedUrl,
  });
  factory GetAssessmentReportUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAssessmentReportUrlResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAssessmentResponse {
  @_s.JsonKey(name: 'assessment')
  final Assessment assessment;

  GetAssessmentResponse({
    this.assessment,
  });
  factory GetAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAssessmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetChangeLogsResponse {
  /// The list of user activity for the control.
  @_s.JsonKey(name: 'changeLogs')
  final List<ChangeLog> changeLogs;

  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetChangeLogsResponse({
    this.changeLogs,
    this.nextToken,
  });
  factory GetChangeLogsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetChangeLogsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetControlResponse {
  /// The name of the control returned by the <code>GetControl</code> API.
  @_s.JsonKey(name: 'control')
  final Control control;

  GetControlResponse({
    this.control,
  });
  factory GetControlResponse.fromJson(Map<String, dynamic> json) =>
      _$GetControlResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDelegationsResponse {
  /// The list of delegations returned by the <code>GetDelegations</code> API.
  @_s.JsonKey(name: 'delegations')
  final List<DelegationMetadata> delegations;

  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetDelegationsResponse({
    this.delegations,
    this.nextToken,
  });
  factory GetDelegationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDelegationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEvidenceByEvidenceFolderResponse {
  /// The list of evidence returned by the
  /// <code>GetEvidenceByEvidenceFolder</code> API.
  @_s.JsonKey(name: 'evidence')
  final List<Evidence> evidence;

  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetEvidenceByEvidenceFolderResponse({
    this.evidence,
    this.nextToken,
  });
  factory GetEvidenceByEvidenceFolderResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetEvidenceByEvidenceFolderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEvidenceFolderResponse {
  /// The folder in which evidence is stored.
  @_s.JsonKey(name: 'evidenceFolder')
  final AssessmentEvidenceFolder evidenceFolder;

  GetEvidenceFolderResponse({
    this.evidenceFolder,
  });
  factory GetEvidenceFolderResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEvidenceFolderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEvidenceFoldersByAssessmentControlResponse {
  /// The list of evidence folders returned by the
  /// <code>GetEvidenceFoldersByAssessmentControl</code> API.
  @_s.JsonKey(name: 'evidenceFolders')
  final List<AssessmentEvidenceFolder> evidenceFolders;

  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetEvidenceFoldersByAssessmentControlResponse({
    this.evidenceFolders,
    this.nextToken,
  });
  factory GetEvidenceFoldersByAssessmentControlResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetEvidenceFoldersByAssessmentControlResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEvidenceFoldersByAssessmentResponse {
  /// The list of evidence folders returned by the
  /// <code>GetEvidenceFoldersByAssessment</code> API.
  @_s.JsonKey(name: 'evidenceFolders')
  final List<AssessmentEvidenceFolder> evidenceFolders;

  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetEvidenceFoldersByAssessmentResponse({
    this.evidenceFolders,
    this.nextToken,
  });
  factory GetEvidenceFoldersByAssessmentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetEvidenceFoldersByAssessmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEvidenceResponse {
  /// The evidence returned by the <code>GetEvidenceResponse</code> API.
  @_s.JsonKey(name: 'evidence')
  final Evidence evidence;

  GetEvidenceResponse({
    this.evidence,
  });
  factory GetEvidenceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEvidenceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOrganizationAdminAccountResponse {
  /// The identifier for the specified administrator account.
  @_s.JsonKey(name: 'adminAccountId')
  final String adminAccountId;

  /// The identifier for the specified organization.
  @_s.JsonKey(name: 'organizationId')
  final String organizationId;

  GetOrganizationAdminAccountResponse({
    this.adminAccountId,
    this.organizationId,
  });
  factory GetOrganizationAdminAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetOrganizationAdminAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServicesInScopeResponse {
  /// The metadata associated with the aAWS service.
  @_s.JsonKey(name: 'serviceMetadata')
  final List<ServiceMetadata> serviceMetadata;

  GetServicesInScopeResponse({
    this.serviceMetadata,
  });
  factory GetServicesInScopeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServicesInScopeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSettingsResponse {
  /// The settings object that holds all supported AWS Audit Manager settings.
  @_s.JsonKey(name: 'settings')
  final Settings settings;

  GetSettingsResponse({
    this.settings,
  });
  factory GetSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSettingsResponseFromJson(json);
}

enum KeywordInputType {
  @_s.JsonValue('SELECT_FROM_LIST')
  selectFromList,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssessmentFrameworksResponse {
  /// The list of metadata objects for the specified framework.
  @_s.JsonKey(name: 'frameworkMetadataList')
  final List<AssessmentFrameworkMetadata> frameworkMetadataList;

  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAssessmentFrameworksResponse({
    this.frameworkMetadataList,
    this.nextToken,
  });
  factory ListAssessmentFrameworksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAssessmentFrameworksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssessmentReportsResponse {
  /// The list of assessment reports returned by the
  /// <code>ListAssessmentReports</code> API.
  @_s.JsonKey(name: 'assessmentReports')
  final List<AssessmentReportMetadata> assessmentReports;

  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAssessmentReportsResponse({
    this.assessmentReports,
    this.nextToken,
  });
  factory ListAssessmentReportsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAssessmentReportsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAssessmentsResponse {
  /// The metadata associated with the assessment.
  @_s.JsonKey(name: 'assessmentMetadata')
  final List<AssessmentMetadataItem> assessmentMetadata;

  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAssessmentsResponse({
    this.assessmentMetadata,
    this.nextToken,
  });
  factory ListAssessmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAssessmentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListControlsResponse {
  /// The list of control metadata objects returned by the
  /// <code>ListControls</code> API.
  @_s.JsonKey(name: 'controlMetadataList')
  final List<ControlMetadata> controlMetadataList;

  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListControlsResponse({
    this.controlMetadataList,
    this.nextToken,
  });
  factory ListControlsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListControlsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListKeywordsForDataSourceResponse {
  /// The list of keywords for the specified event mapping source.
  @_s.JsonKey(name: 'keywords')
  final List<String> keywords;

  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListKeywordsForDataSourceResponse({
    this.keywords,
    this.nextToken,
  });
  factory ListKeywordsForDataSourceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListKeywordsForDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNotificationsResponse {
  /// The pagination token used to fetch the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The returned list of notifications.
  @_s.JsonKey(name: 'notifications')
  final List<Notification> notifications;

  ListNotificationsResponse({
    this.nextToken,
    this.notifications,
  });
  factory ListNotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNotificationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The list of tags returned by the <code>ListTagsForResource</code> API.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Evidence that is uploaded to AWS Audit Manager manually.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ManualEvidence {
  /// The Amazon S3 URL that points to a manual evidence object.
  @_s.JsonKey(name: 's3ResourcePath')
  final String s3ResourcePath;

  ManualEvidence({
    this.s3ResourcePath,
  });
  factory ManualEvidence.fromJson(Map<String, dynamic> json) =>
      _$ManualEvidenceFromJson(json);

  Map<String, dynamic> toJson() => _$ManualEvidenceToJson(this);
}

/// The notification used to inform a user of an update in AWS Audit Manager.
/// For example, this includes the notification that is sent when a control set
/// is delegated for review.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Notification {
  /// The identifier for the specified assessment.
  @_s.JsonKey(name: 'assessmentId')
  final String assessmentId;

  /// The name of the related assessment.
  @_s.JsonKey(name: 'assessmentName')
  final String assessmentName;

  /// The identifier for the specified control set.
  @_s.JsonKey(name: 'controlSetId')
  final String controlSetId;

  /// Specifies the name of the control set that the notification is about.
  @_s.JsonKey(name: 'controlSetName')
  final String controlSetName;

  /// The description of the notification.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The time when the notification was sent.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'eventTime')
  final DateTime eventTime;

  /// The unique identifier for the notification.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The sender of the notification.
  @_s.JsonKey(name: 'source')
  final String source;

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
  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

enum ObjectTypeEnum {
  @_s.JsonValue('ASSESSMENT')
  assessment,
  @_s.JsonValue('CONTROL_SET')
  controlSet,
  @_s.JsonValue('CONTROL')
  control,
  @_s.JsonValue('DELEGATION')
  delegation,
  @_s.JsonValue('ASSESSMENT_REPORT')
  assessmentReport,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterAccountResponse {
  /// The status of the account registration request.
  @_s.JsonKey(name: 'status')
  final AccountStatus status;

  RegisterAccountResponse({
    this.status,
  });
  factory RegisterAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterOrganizationAdminAccountResponse {
  /// The identifier for the specified delegated administrator account.
  @_s.JsonKey(name: 'adminAccountId')
  final String adminAccountId;

  /// The identifier for the specified AWS organization.
  @_s.JsonKey(name: 'organizationId')
  final String organizationId;

  RegisterOrganizationAdminAccountResponse({
    this.adminAccountId,
    this.organizationId,
  });
  factory RegisterOrganizationAdminAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterOrganizationAdminAccountResponseFromJson(json);
}

/// A system asset that is evaluated in an AWS Audit Manager assessment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Resource {
  /// The Amazon Resource Name (ARN) for the specified resource.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The value of the specified resource.
  @_s.JsonKey(name: 'value')
  final String value;

  Resource({
    this.arn,
    this.value,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

/// The wrapper that contains AWS Audit Manager role information, such as the
/// role type and IAM Amazon Resource Name (ARN).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Role {
  /// The Amazon Resource Name (ARN) of the IAM role.
  @_s.JsonKey(name: 'roleArn')
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
  @_s.JsonKey(name: 'roleType')
  final RoleType roleType;

  Role({
    this.roleArn,
    this.roleType,
  });
  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

enum RoleType {
  @_s.JsonValue('PROCESS_OWNER')
  processOwner,
  @_s.JsonValue('RESOURCE_OWNER')
  resourceOwner,
}

/// The wrapper that contains the AWS accounts and AWS services in scope for the
/// assessment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scope {
  /// The AWS accounts included in the scope of the assessment.
  @_s.JsonKey(name: 'awsAccounts')
  final List<AWSAccount> awsAccounts;

  /// The AWS services included in the scope of the assessment.
  @_s.JsonKey(name: 'awsServices')
  final List<AWSService> awsServices;

  Scope({
    this.awsAccounts,
    this.awsServices,
  });
  factory Scope.fromJson(Map<String, dynamic> json) => _$ScopeFromJson(json);

  Map<String, dynamic> toJson() => _$ScopeToJson(this);
}

/// The metadata associated with the specified AWS service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceMetadata {
  /// The category in which the AWS service belongs, such as compute, storage,
  /// database, and so on.
  @_s.JsonKey(name: 'category')
  final String category;

  /// The description of the specified AWS service.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The display name of the AWS service.
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The name of the AWS service.
  @_s.JsonKey(name: 'name')
  final String name;

  ServiceMetadata({
    this.category,
    this.description,
    this.displayName,
    this.name,
  });
  factory ServiceMetadata.fromJson(Map<String, dynamic> json) =>
      _$ServiceMetadataFromJson(json);
}

enum SettingAttribute {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('IS_AWS_ORG_ENABLED')
  isAwsOrgEnabled,
  @_s.JsonValue('SNS_TOPIC')
  snsTopic,
  @_s.JsonValue('DEFAULT_ASSESSMENT_REPORTS_DESTINATION')
  defaultAssessmentReportsDestination,
  @_s.JsonValue('DEFAULT_PROCESS_OWNERS')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// The settings object that holds all supported AWS Audit Manager settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Settings {
  /// The default storage destination for assessment reports.
  @_s.JsonKey(name: 'defaultAssessmentReportsDestination')
  final AssessmentReportsDestination defaultAssessmentReportsDestination;

  /// The designated default audit owners.
  @_s.JsonKey(name: 'defaultProcessOwners')
  final List<Role> defaultProcessOwners;

  /// Specifies whether AWS Organizations is enabled.
  @_s.JsonKey(name: 'isAwsOrgEnabled')
  final bool isAwsOrgEnabled;

  /// The AWS KMS key details.
  @_s.JsonKey(name: 'kmsKey')
  final String kmsKey;

  /// The designated Amazon Simple Notification Service (Amazon SNS) topic.
  @_s.JsonKey(name: 'snsTopic')
  final String snsTopic;

  Settings({
    this.defaultAssessmentReportsDestination,
    this.defaultProcessOwners,
    this.isAwsOrgEnabled,
    this.kmsKey,
    this.snsTopic,
  });
  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

enum SourceFrequency {
  @_s.JsonValue('DAILY')
  daily,
  @_s.JsonValue('WEEKLY')
  weekly,
  @_s.JsonValue('MONTHLY')
  monthly,
}

/// The keyword to search for in AWS CloudTrail logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SourceKeyword {
  /// The method of input for the specified keyword.
  @_s.JsonKey(name: 'keywordInputType')
  final KeywordInputType keywordInputType;

  /// The value of the keyword used to search AWS CloudTrail logs when mapping a
  /// control data source.
  @_s.JsonKey(name: 'keywordValue')
  final String keywordValue;

  SourceKeyword({
    this.keywordInputType,
    this.keywordValue,
  });
  factory SourceKeyword.fromJson(Map<String, dynamic> json) =>
      _$SourceKeywordFromJson(json);

  Map<String, dynamic> toJson() => _$SourceKeywordToJson(this);
}

enum SourceSetUpOption {
  @_s.JsonValue('System_Controls_Mapping')
  systemControlsMapping,
  @_s.JsonValue('Procedural_Controls_Mapping')
  proceduralControlsMapping,
}

enum SourceType {
  @_s.JsonValue('AWS_Cloudtrail')
  awsCloudtrail,
  @_s.JsonValue('AWS_Config')
  awsConfig,
  @_s.JsonValue('AWS_Security_Hub')
  awsSecurityHub,
  @_s.JsonValue('AWS_API_Call')
  awsApiCall,
  @_s.JsonValue('MANUAL')
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
    throw Exception('Unknown enum value: $this');
  }
}

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

/// A uniform resource locator, used as a unique identifier to locate a resource
/// on the internet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class URL {
  /// The name or word used as a hyperlink to the URL.
  @_s.JsonKey(name: 'hyperlinkName')
  final String hyperlinkName;

  /// The unique identifier for the internet resource.
  @_s.JsonKey(name: 'link')
  final String link;

  URL({
    this.hyperlinkName,
    this.link,
  });
  factory URL.fromJson(Map<String, dynamic> json) => _$URLFromJson(json);
}

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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAssessmentControlResponse {
  /// The name of the updated control set returned by the
  /// <code>UpdateAssessmentControl</code> API.
  @_s.JsonKey(name: 'control')
  final AssessmentControl control;

  UpdateAssessmentControlResponse({
    this.control,
  });
  factory UpdateAssessmentControlResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssessmentControlResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAssessmentControlSetStatusResponse {
  /// The name of the updated control set returned by the
  /// <code>UpdateAssessmentControlSetStatus</code> API.
  @_s.JsonKey(name: 'controlSet')
  final AssessmentControlSet controlSet;

  UpdateAssessmentControlSetStatusResponse({
    this.controlSet,
  });
  factory UpdateAssessmentControlSetStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateAssessmentControlSetStatusResponseFromJson(json);
}

/// A <code>controlSet</code> entity that represents a collection of controls in
/// AWS Audit Manager. This does not contain the control set ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateAssessmentFrameworkControlSet {
  /// The list of controls contained within the control set.
  @_s.JsonKey(name: 'controls')
  final List<CreateAssessmentFrameworkControl> controls;

  /// The unique identifier for the control set.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the control set.
  @_s.JsonKey(name: 'name')
  final String name;

  UpdateAssessmentFrameworkControlSet({
    this.controls,
    this.id,
    this.name,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateAssessmentFrameworkControlSetToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAssessmentFrameworkResponse {
  /// The name of the specified framework.
  @_s.JsonKey(name: 'framework')
  final Framework framework;

  UpdateAssessmentFrameworkResponse({
    this.framework,
  });
  factory UpdateAssessmentFrameworkResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateAssessmentFrameworkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAssessmentResponse {
  /// The response object (name of the updated assessment) for the
  /// <code>UpdateAssessmentRequest</code> API.
  @_s.JsonKey(name: 'assessment')
  final Assessment assessment;

  UpdateAssessmentResponse({
    this.assessment,
  });
  factory UpdateAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssessmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAssessmentStatusResponse {
  /// The name of the updated assessment returned by the
  /// <code>UpdateAssessmentStatus</code> API.
  @_s.JsonKey(name: 'assessment')
  final Assessment assessment;

  UpdateAssessmentStatusResponse({
    this.assessment,
  });
  factory UpdateAssessmentStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssessmentStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateControlResponse {
  /// The name of the updated control set returned by the
  /// <code>UpdateControl</code> API.
  @_s.JsonKey(name: 'control')
  final Control control;

  UpdateControlResponse({
    this.control,
  });
  factory UpdateControlResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateControlResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSettingsResponse {
  /// The current list of settings.
  @_s.JsonKey(name: 'settings')
  final Settings settings;

  UpdateSettingsResponse({
    this.settings,
  });
  factory UpdateSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidateAssessmentReportIntegrityResponse {
  /// The signature algorithm used to code sign the assessment report file.
  @_s.JsonKey(name: 'signatureAlgorithm')
  final String signatureAlgorithm;

  /// The date and time signature that specifies when the assessment report was
  /// created.
  @_s.JsonKey(name: 'signatureDateTime')
  final String signatureDateTime;

  /// The unique identifier for the validation signature key.
  @_s.JsonKey(name: 'signatureKeyId')
  final String signatureKeyId;

  /// Specifies whether the signature key is valid.
  @_s.JsonKey(name: 'signatureValid')
  final bool signatureValid;

  /// Represents any errors that occurred when validating the assessment report.
  @_s.JsonKey(name: 'validationErrors')
  final List<String> validationErrors;

  ValidateAssessmentReportIntegrityResponse({
    this.signatureAlgorithm,
    this.signatureDateTime,
    this.signatureKeyId,
    this.signatureValid,
    this.validationErrors,
  });
  factory ValidateAssessmentReportIntegrityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ValidateAssessmentReportIntegrityResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
