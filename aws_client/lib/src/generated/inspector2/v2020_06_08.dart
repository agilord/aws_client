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

import 'v2020_06_08.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Inspector is a vulnerability discovery service that automates
/// continuous scanning for security vulnerabilities within your Amazon EC2,
/// Amazon ECR, and Amazon Web Services Lambda environments.
class Inspector2 {
  final _s.RestJsonProtocol _protocol;
  factory Inspector2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'inspector2',
    );
    return Inspector2._(
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
  Inspector2._({
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

  /// Associates an Amazon Web Services account with an Amazon Inspector
  /// delegated administrator. An HTTP 200 response indicates the association
  /// was successfully started, but doesn’t indicate whether it was completed.
  /// You can check if the association completed by using <a
  /// href="https://docs.aws.amazon.com/inspector/v2/APIReference/API_ListMembers.html">ListMembers</a>
  /// for multiple accounts or <a
  /// href="https://docs.aws.amazon.com/inspector/v2/APIReference/API_GetMember.html">GetMembers</a>
  /// for a single account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the member account to be associated.
  Future<AssociateMemberResponse> associateMember({
    required String accountId,
  }) async {
    final $payload = <String, dynamic>{
      'accountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members/associate',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateMemberResponse.fromJson(response);
  }

  /// Associates multiple code repositories with an Amazon Inspector code
  /// security scan configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [associateConfigurationRequests] :
  /// A list of code repositories to associate with the specified scan
  /// configuration.
  Future<BatchAssociateCodeSecurityScanConfigurationResponse>
      batchAssociateCodeSecurityScanConfiguration({
    required List<AssociateConfigurationRequest> associateConfigurationRequests,
  }) async {
    final $payload = <String, dynamic>{
      'associateConfigurationRequests': associateConfigurationRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/scan-configuration/batch/associate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAssociateCodeSecurityScanConfigurationResponse.fromJson(
        response);
  }

  /// Disassociates multiple code repositories from an Amazon Inspector code
  /// security scan configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [disassociateConfigurationRequests] :
  /// A list of code repositories to disassociate from the specified scan
  /// configuration.
  Future<BatchDisassociateCodeSecurityScanConfigurationResponse>
      batchDisassociateCodeSecurityScanConfiguration({
    required List<DisassociateConfigurationRequest>
        disassociateConfigurationRequests,
  }) async {
    final $payload = <String, dynamic>{
      'disassociateConfigurationRequests': disassociateConfigurationRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/scan-configuration/batch/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDisassociateCodeSecurityScanConfigurationResponse.fromJson(
        response);
  }

  /// Retrieves the Amazon Inspector status of multiple Amazon Web Services
  /// accounts within your environment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The 12-digit Amazon Web Services account IDs of the accounts to retrieve
  /// Amazon Inspector status for.
  Future<BatchGetAccountStatusResponse> batchGetAccountStatus({
    List<String>? accountIds,
  }) async {
    final $payload = <String, dynamic>{
      if (accountIds != null) 'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/status/batch/get',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetAccountStatusResponse.fromJson(response);
  }

  /// Retrieves code snippets from findings that Amazon Inspector detected code
  /// vulnerabilities in.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [findingArns] :
  /// An array of finding ARNs for the findings you want to retrieve code
  /// snippets from.
  Future<BatchGetCodeSnippetResponse> batchGetCodeSnippet({
    required List<String> findingArns,
  }) async {
    final $payload = <String, dynamic>{
      'findingArns': findingArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesnippet/batchget',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetCodeSnippetResponse.fromJson(response);
  }

  /// Gets vulnerability details for findings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [findingArns] :
  /// A list of finding ARNs.
  Future<BatchGetFindingDetailsResponse> batchGetFindingDetails({
    required List<String> findingArns,
  }) async {
    final $payload = <String, dynamic>{
      'findingArns': findingArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findings/details/batch/get',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetFindingDetailsResponse.fromJson(response);
  }

  /// Gets free trial status for multiple Amazon Web Services accounts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The account IDs to get free trial status for.
  Future<BatchGetFreeTrialInfoResponse> batchGetFreeTrialInfo({
    required List<String> accountIds,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/freetrialinfo/batchget',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetFreeTrialInfoResponse.fromJson(response);
  }

  /// Retrieves Amazon Inspector deep inspection activation status of multiple
  /// member accounts within your organization. You must be the delegated
  /// administrator of an organization in Amazon Inspector to use this API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The unique identifiers for the Amazon Web Services accounts to retrieve
  /// Amazon Inspector deep inspection activation status for.
  Future<BatchGetMemberEc2DeepInspectionStatusResponse>
      batchGetMemberEc2DeepInspectionStatus({
    List<String>? accountIds,
  }) async {
    final $payload = <String, dynamic>{
      if (accountIds != null) 'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ec2deepinspectionstatus/member/batch/get',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetMemberEc2DeepInspectionStatusResponse.fromJson(response);
  }

  /// Activates or deactivates Amazon Inspector deep inspection for the provided
  /// member accounts in your organization. You must be the delegated
  /// administrator of an organization in Amazon Inspector to use this API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The unique identifiers for the Amazon Web Services accounts to change
  /// Amazon Inspector deep inspection status for.
  Future<BatchUpdateMemberEc2DeepInspectionStatusResponse>
      batchUpdateMemberEc2DeepInspectionStatus({
    required List<MemberAccountEc2DeepInspectionStatus> accountIds,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ec2deepinspectionstatus/member/batch/update',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateMemberEc2DeepInspectionStatusResponse.fromJson(response);
  }

  /// Cancels the given findings report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportId] :
  /// The ID of the report to be canceled.
  Future<CancelFindingsReportResponse> cancelFindingsReport({
    required String reportId,
  }) async {
    final $payload = <String, dynamic>{
      'reportId': reportId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/reporting/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelFindingsReportResponse.fromJson(response);
  }

  /// Cancels a software bill of materials (SBOM) report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportId] :
  /// The report ID of the SBOM export to cancel.
  Future<CancelSbomExportResponse> cancelSbomExport({
    required String reportId,
  }) async {
    final $payload = <String, dynamic>{
      'reportId': reportId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sbomexport/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelSbomExportResponse.fromJson(response);
  }

  /// Creates a CIS scan configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scanName] :
  /// The scan name for the CIS scan configuration.
  ///
  /// Parameter [schedule] :
  /// The schedule for the CIS scan configuration.
  ///
  /// Parameter [securityLevel] :
  /// The security level for the CIS scan configuration. Security level refers
  /// to the Benchmark levels that CIS assigns to a profile.
  ///
  /// Parameter [targets] :
  /// The targets for the CIS scan configuration.
  ///
  /// Parameter [tags] :
  /// The tags for the CIS scan configuration.
  Future<CreateCisScanConfigurationResponse> createCisScanConfiguration({
    required String scanName,
    required Schedule schedule,
    required CisSecurityLevel securityLevel,
    required CreateCisTargets targets,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'scanName': scanName,
      'schedule': schedule,
      'securityLevel': securityLevel.value,
      'targets': targets,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan-configuration/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCisScanConfigurationResponse.fromJson(response);
  }

  /// Creates a code security integration with a source code repository
  /// provider.
  ///
  /// After calling the <code>CreateCodeSecurityIntegration</code> operation,
  /// you complete authentication and authorization with your provider. Next you
  /// call the <code>UpdateCodeSecurityIntegration</code> operation to provide
  /// the <code>details</code> to complete the integration setup
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the code security integration.
  ///
  /// Parameter [type] :
  /// The type of repository provider for the integration.
  ///
  /// Parameter [details] :
  /// The integration details specific to the repository provider type.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the code security integration.
  Future<CreateCodeSecurityIntegrationResponse> createCodeSecurityIntegration({
    required String name,
    required IntegrationType type,
    CreateIntegrationDetail? details,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'type': type.value,
      if (details != null) 'details': details,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/integration/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCodeSecurityIntegrationResponse.fromJson(response);
  }

  /// Creates a scan configuration for code security scanning.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuration] :
  /// The configuration settings for the code security scan.
  ///
  /// Parameter [level] :
  /// The security level for the scan configuration.
  ///
  /// Parameter [name] :
  /// The name of the scan configuration.
  ///
  /// Parameter [scopeSettings] :
  /// The scope settings that define which repositories will be scanned. Include
  /// this parameter to create a default scan configuration. Otherwise Amazon
  /// Inspector creates a general scan configuration.
  ///
  /// A default scan configuration automatically applies to all existing and
  /// future projects imported into Amazon Inspector. Use the
  /// <code>BatchAssociateCodeSecurityScanConfiguration</code> operation to
  /// associate a general scan configuration with projects.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the scan configuration.
  Future<CreateCodeSecurityScanConfigurationResponse>
      createCodeSecurityScanConfiguration({
    required CodeSecurityScanConfiguration configuration,
    required ConfigurationLevel level,
    required String name,
    ScopeSettings? scopeSettings,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'level': level.value,
      'name': name,
      if (scopeSettings != null) 'scopeSettings': scopeSettings,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/scan-configuration/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCodeSecurityScanConfigurationResponse.fromJson(response);
  }

  /// Creates a filter resource using specified filter criteria. When the filter
  /// action is set to <code>SUPPRESS</code> this action creates a suppression
  /// rule.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// Defines the action that is to be applied to the findings that match the
  /// filter.
  ///
  /// Parameter [filterCriteria] :
  /// Defines the criteria to be used in the filter for querying findings.
  ///
  /// Parameter [name] :
  /// The name of the filter. Minimum length of 3. Maximum length of 64. Valid
  /// characters include alphanumeric characters, dot (.), underscore (_), and
  /// dash (-). Spaces are not allowed.
  ///
  /// Parameter [description] :
  /// A description of the filter.
  ///
  /// Parameter [reason] :
  /// The reason for creating the filter.
  ///
  /// Parameter [tags] :
  /// A list of tags for the filter.
  Future<CreateFilterResponse> createFilter({
    required FilterAction action,
    required FilterCriteria filterCriteria,
    required String name,
    String? description,
    String? reason,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'action': action.value,
      'filterCriteria': filterCriteria,
      'name': name,
      if (description != null) 'description': description,
      if (reason != null) 'reason': reason,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/filters/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFilterResponse.fromJson(response);
  }

  /// Creates a finding report. By default only <code>ACTIVE</code> findings are
  /// returned in the report. To see <code>SUPRESSED</code> or
  /// <code>CLOSED</code> findings you must specify a value for the
  /// <code>findingStatus</code> filter criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportFormat] :
  /// The format to generate the report in.
  ///
  /// Parameter [s3Destination] :
  /// The Amazon S3 export destination for the report.
  ///
  /// Parameter [filterCriteria] :
  /// The filter criteria to apply to the results of the finding report.
  Future<CreateFindingsReportResponse> createFindingsReport({
    required ReportFormat reportFormat,
    required Destination s3Destination,
    FilterCriteria? filterCriteria,
  }) async {
    final $payload = <String, dynamic>{
      'reportFormat': reportFormat.value,
      's3Destination': s3Destination,
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/reporting/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFindingsReportResponse.fromJson(response);
  }

  /// Creates a software bill of materials (SBOM) report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportFormat] :
  /// The output format for the software bill of materials (SBOM) report.
  ///
  /// Parameter [s3Destination] :
  /// Contains details of the Amazon S3 bucket and KMS key used to export
  /// findings.
  ///
  /// Parameter [resourceFilterCriteria] :
  /// The resource filter criteria for the software bill of materials (SBOM)
  /// report.
  Future<CreateSbomExportResponse> createSbomExport({
    required SbomReportFormat reportFormat,
    required Destination s3Destination,
    ResourceFilterCriteria? resourceFilterCriteria,
  }) async {
    final $payload = <String, dynamic>{
      'reportFormat': reportFormat.value,
      's3Destination': s3Destination,
      if (resourceFilterCriteria != null)
        'resourceFilterCriteria': resourceFilterCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sbomexport/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSbomExportResponse.fromJson(response);
  }

  /// Deletes a CIS scan configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scanConfigurationArn] :
  /// The ARN of the CIS scan configuration.
  Future<DeleteCisScanConfigurationResponse> deleteCisScanConfiguration({
    required String scanConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'scanConfigurationArn': scanConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan-configuration/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCisScanConfigurationResponse.fromJson(response);
  }

  /// Deletes a code security integration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [integrationArn] :
  /// The Amazon Resource Name (ARN) of the code security integration to delete.
  Future<DeleteCodeSecurityIntegrationResponse> deleteCodeSecurityIntegration({
    required String integrationArn,
  }) async {
    final $payload = <String, dynamic>{
      'integrationArn': integrationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/integration/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCodeSecurityIntegrationResponse.fromJson(response);
  }

  /// Deletes a code security scan configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scanConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the scan configuration to delete.
  Future<DeleteCodeSecurityScanConfigurationResponse>
      deleteCodeSecurityScanConfiguration({
    required String scanConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'scanConfigurationArn': scanConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/scan-configuration/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCodeSecurityScanConfigurationResponse.fromJson(response);
  }

  /// Deletes a filter resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Number (ARN) of the filter to be deleted.
  Future<DeleteFilterResponse> deleteFilter({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/filters/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFilterResponse.fromJson(response);
  }

  /// Describe Amazon Inspector configuration settings for an Amazon Web
  /// Services organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<DescribeOrganizationConfigurationResponse>
      describeOrganizationConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/organizationconfiguration/describe',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOrganizationConfigurationResponse.fromJson(response);
  }

  /// Disables Amazon Inspector scans for one or more Amazon Web Services
  /// accounts. Disabling all scan types in an account disables the Amazon
  /// Inspector service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// An array of account IDs you want to disable Amazon Inspector scans for.
  ///
  /// Parameter [resourceTypes] :
  /// The resource scan types you want to disable.
  Future<DisableResponse> disable({
    List<String>? accountIds,
    List<ResourceScanType>? resourceTypes,
  }) async {
    final $payload = <String, dynamic>{
      if (accountIds != null) 'accountIds': accountIds,
      if (resourceTypes != null)
        'resourceTypes': resourceTypes.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disable',
      exceptionFnMap: _exceptionFns,
    );
    return DisableResponse.fromJson(response);
  }

  /// Disables the Amazon Inspector delegated administrator for your
  /// organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [delegatedAdminAccountId] :
  /// The Amazon Web Services account ID of the current Amazon Inspector
  /// delegated administrator.
  Future<DisableDelegatedAdminAccountResponse> disableDelegatedAdminAccount({
    required String delegatedAdminAccountId,
  }) async {
    final $payload = <String, dynamic>{
      'delegatedAdminAccountId': delegatedAdminAccountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delegatedadminaccounts/disable',
      exceptionFnMap: _exceptionFns,
    );
    return DisableDelegatedAdminAccountResponse.fromJson(response);
  }

  /// Disassociates a member account from an Amazon Inspector delegated
  /// administrator.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the member account to disassociate.
  Future<DisassociateMemberResponse> disassociateMember({
    required String accountId,
  }) async {
    final $payload = <String, dynamic>{
      'accountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateMemberResponse.fromJson(response);
  }

  /// Enables Amazon Inspector scans for one or more Amazon Web Services
  /// accounts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceTypes] :
  /// The resource scan types you want to enable.
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs you want to enable Amazon Inspector scans for.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the request.
  Future<EnableResponse> enable({
    required List<ResourceScanType> resourceTypes,
    List<String>? accountIds,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'resourceTypes': resourceTypes.map((e) => e.value).toList(),
      if (accountIds != null) 'accountIds': accountIds,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/enable',
      exceptionFnMap: _exceptionFns,
    );
    return EnableResponse.fromJson(response);
  }

  /// Enables the Amazon Inspector delegated administrator for your
  /// Organizations organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [delegatedAdminAccountId] :
  /// The Amazon Web Services account ID of the Amazon Inspector delegated
  /// administrator.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the request.
  Future<EnableDelegatedAdminAccountResponse> enableDelegatedAdminAccount({
    required String delegatedAdminAccountId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'delegatedAdminAccountId': delegatedAdminAccountId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delegatedadminaccounts/enable',
      exceptionFnMap: _exceptionFns,
    );
    return EnableDelegatedAdminAccountResponse.fromJson(response);
  }

  /// Retrieves a CIS scan report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scanArn] :
  /// The scan ARN.
  ///
  /// Parameter [reportFormat] :
  /// The format of the report. Valid values are <code>PDF</code> and
  /// <code>CSV</code>. If no value is specified, the report format defaults to
  /// <code>PDF</code>.
  ///
  /// Parameter [targetAccounts] :
  /// The target accounts.
  Future<GetCisScanReportResponse> getCisScanReport({
    required String scanArn,
    CisReportFormat? reportFormat,
    List<String>? targetAccounts,
  }) async {
    final $payload = <String, dynamic>{
      'scanArn': scanArn,
      if (reportFormat != null) 'reportFormat': reportFormat.value,
      if (targetAccounts != null) 'targetAccounts': targetAccounts,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan/report/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetCisScanReportResponse.fromJson(response);
  }

  /// Retrieves CIS scan result details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The account ID.
  ///
  /// Parameter [scanArn] :
  /// The scan ARN.
  ///
  /// Parameter [targetResourceId] :
  /// The target resource ID.
  ///
  /// Parameter [filterCriteria] :
  /// The filter criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of CIS scan result details to be returned in a single
  /// page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request that's used to retrieve the
  /// next page of results.
  ///
  /// Parameter [sortBy] :
  /// The sort by order.
  ///
  /// Parameter [sortOrder] :
  /// The sort order.
  Future<GetCisScanResultDetailsResponse> getCisScanResultDetails({
    required String accountId,
    required String scanArn,
    required String targetResourceId,
    CisScanResultDetailsFilterCriteria? filterCriteria,
    int? maxResults,
    String? nextToken,
    CisScanResultDetailsSortBy? sortBy,
    CisSortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'accountId': accountId,
      'scanArn': scanArn,
      'targetResourceId': targetResourceId,
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan-result/details/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetCisScanResultDetailsResponse.fromJson(response);
  }

  /// Returns a list of clusters and metadata associated with an image.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filter] :
  /// The resource Id for the Amazon ECR image.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned in a single page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request used to retrieve the next
  /// page of results.
  Future<GetClustersForImageResponse> getClustersForImage({
    required ClusterForImageFilterCriteria filter,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'filter': filter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cluster/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetClustersForImageResponse.fromJson(response);
  }

  /// Retrieves information about a code security integration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [integrationArn] :
  /// The Amazon Resource Name (ARN) of the code security integration to
  /// retrieve.
  ///
  /// Parameter [tags] :
  /// The tags associated with the code security integration.
  Future<GetCodeSecurityIntegrationResponse> getCodeSecurityIntegration({
    required String integrationArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'integrationArn': integrationArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/integration/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetCodeSecurityIntegrationResponse.fromJson(response);
  }

  /// Retrieves information about a specific code security scan.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resource] :
  /// The resource identifier for the code repository that was scanned.
  ///
  /// Parameter [scanId] :
  /// The unique identifier of the scan to retrieve.
  Future<GetCodeSecurityScanResponse> getCodeSecurityScan({
    required CodeSecurityResource resource,
    required String scanId,
  }) async {
    final $payload = <String, dynamic>{
      'resource': resource,
      'scanId': scanId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/scan/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetCodeSecurityScanResponse.fromJson(response);
  }

  /// Retrieves information about a code security scan configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scanConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the scan configuration to retrieve.
  Future<GetCodeSecurityScanConfigurationResponse>
      getCodeSecurityScanConfiguration({
    required String scanConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'scanConfigurationArn': scanConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/scan-configuration/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetCodeSecurityScanConfigurationResponse.fromJson(response);
  }

  /// Retrieves setting configurations for Inspector scans.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  Future<GetConfigurationResponse> getConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/configuration/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfigurationResponse.fromJson(response);
  }

  /// Retrieves information about the Amazon Inspector delegated administrator
  /// for your organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetDelegatedAdminAccountResponse> getDelegatedAdminAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/delegatedadminaccounts/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetDelegatedAdminAccountResponse.fromJson(response);
  }

  /// Retrieves the activation status of Amazon Inspector deep inspection and
  /// custom paths associated with your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  Future<GetEc2DeepInspectionConfigurationResponse>
      getEc2DeepInspectionConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/ec2deepinspectionconfiguration/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetEc2DeepInspectionConfigurationResponse.fromJson(response);
  }

  /// Gets an encryption key.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceType] :
  /// The resource type the key encrypts.
  ///
  /// Parameter [scanType] :
  /// The scan type the key encrypts.
  Future<GetEncryptionKeyResponse> getEncryptionKey({
    required ResourceType resourceType,
    required ScanType scanType,
  }) async {
    final $query = <String, List<String>>{
      'resourceType': [resourceType.value],
      'scanType': [scanType.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/encryptionkey/get',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetEncryptionKeyResponse.fromJson(response);
  }

  /// Gets the status of a findings report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportId] :
  /// The ID of the report to retrieve the status of.
  Future<GetFindingsReportStatusResponse> getFindingsReportStatus({
    String? reportId,
  }) async {
    final $payload = <String, dynamic>{
      if (reportId != null) 'reportId': reportId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/reporting/status/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingsReportStatusResponse.fromJson(response);
  }

  /// Gets member information for your organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID of the member account to retrieve
  /// information on.
  Future<GetMemberResponse> getMember({
    required String accountId,
  }) async {
    final $payload = <String, dynamic>{
      'accountId': accountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetMemberResponse.fromJson(response);
  }

  /// Gets details of a software bill of materials (SBOM) report.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportId] :
  /// The report ID of the SBOM export to get details for.
  Future<GetSbomExportResponse> getSbomExport({
    required String reportId,
  }) async {
    final $payload = <String, dynamic>{
      'reportId': reportId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sbomexport/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetSbomExportResponse.fromJson(response);
  }

  /// Lists the permissions an account has to configure Amazon Inspector. If the
  /// account is a member account or standalone account with resources managed
  /// by an Organizations policy, the operation returns fewer permissions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results the response can return. If your request
  /// would return more than the maximum the response will return a
  /// <code>nextToken</code> value, use this value when you call the action
  /// again to get the remaining results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. If your response returns more than the <code>maxResults</code>
  /// maximum value it will also return a <code>nextToken</code> value. For
  /// subsequent calls, use the NextToken value returned from the previous
  /// request to continue listing results after the first page.
  ///
  /// Parameter [service] :
  /// The service scan type to check permissions for.
  Future<ListAccountPermissionsResponse> listAccountPermissions({
    int? maxResults,
    String? nextToken,
    Service? service,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (service != null) 'service': service.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accountpermissions/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListAccountPermissionsResponse.fromJson(response);
  }

  /// Lists CIS scan configurations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterCriteria] :
  /// The CIS scan configuration filter criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of CIS scan configurations to be returned in a single
  /// page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request that's used to retrieve the
  /// next page of results.
  ///
  /// Parameter [sortBy] :
  /// The CIS scan configuration sort by order.
  ///
  /// Parameter [sortOrder] :
  /// The CIS scan configuration sort order order.
  Future<ListCisScanConfigurationsResponse> listCisScanConfigurations({
    ListCisScanConfigurationsFilterCriteria? filterCriteria,
    int? maxResults,
    String? nextToken,
    CisScanConfigurationsSortBy? sortBy,
    CisSortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan-configuration/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListCisScanConfigurationsResponse.fromJson(response);
  }

  /// Lists scan results aggregated by checks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scanArn] :
  /// The scan ARN.
  ///
  /// Parameter [filterCriteria] :
  /// The filter criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of scan results aggregated by checks to be returned in
  /// a single page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request that's used to retrieve the
  /// next page of results.
  ///
  /// Parameter [sortBy] :
  /// The sort by order.
  ///
  /// Parameter [sortOrder] :
  /// The sort order.
  Future<ListCisScanResultsAggregatedByChecksResponse>
      listCisScanResultsAggregatedByChecks({
    required String scanArn,
    CisScanResultsAggregatedByChecksFilterCriteria? filterCriteria,
    int? maxResults,
    String? nextToken,
    CisScanResultsAggregatedByChecksSortBy? sortBy,
    CisSortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'scanArn': scanArn,
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan-result/check/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListCisScanResultsAggregatedByChecksResponse.fromJson(response);
  }

  /// Lists scan results aggregated by a target resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scanArn] :
  /// The scan ARN.
  ///
  /// Parameter [filterCriteria] :
  /// The filter criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of scan results aggregated by a target resource to be
  /// returned in a single page of results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request that's used to retrieve the
  /// next page of results.
  ///
  /// Parameter [sortBy] :
  /// The sort by order.
  ///
  /// Parameter [sortOrder] :
  /// The sort order.
  Future<ListCisScanResultsAggregatedByTargetResourceResponse>
      listCisScanResultsAggregatedByTargetResource({
    required String scanArn,
    CisScanResultsAggregatedByTargetResourceFilterCriteria? filterCriteria,
    int? maxResults,
    String? nextToken,
    CisScanResultsAggregatedByTargetResourceSortBy? sortBy,
    CisSortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'scanArn': scanArn,
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan-result/resource/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListCisScanResultsAggregatedByTargetResourceResponse.fromJson(
        response);
  }

  /// Returns a CIS scan list.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [detailLevel] :
  /// The detail applied to the CIS scan.
  ///
  /// Parameter [filterCriteria] :
  /// The CIS scan filter criteria.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request that's used to retrieve the
  /// next page of results.
  ///
  /// Parameter [sortBy] :
  /// The CIS scans sort by order.
  ///
  /// Parameter [sortOrder] :
  /// The CIS scans sort order.
  Future<ListCisScansResponse> listCisScans({
    ListCisScansDetailLevel? detailLevel,
    ListCisScansFilterCriteria? filterCriteria,
    int? maxResults,
    String? nextToken,
    ListCisScansSortBy? sortBy,
    CisSortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (detailLevel != null) 'detailLevel': detailLevel.value,
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListCisScansResponse.fromJson(response);
  }

  /// Lists all code security integrations in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the NextToken value returned from the previous
  /// request to continue listing results after the first page.
  Future<ListCodeSecurityIntegrationsResponse> listCodeSecurityIntegrations({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/codesecurity/integration/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCodeSecurityIntegrationsResponse.fromJson(response);
  }

  /// Lists the associations between code repositories and Amazon Inspector code
  /// security scan configurations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scanConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the scan configuration to list
  /// associations for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If your request
  /// would return more than the maximum the response will return a
  /// <code>nextToken</code> value, use this value when you call the action
  /// again to get the remaining results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
  Future<ListCodeSecurityScanConfigurationAssociationsResponse>
      listCodeSecurityScanConfigurationAssociations({
    required String scanConfigurationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      'scanConfigurationArn': scanConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/scan-configuration/associations/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCodeSecurityScanConfigurationAssociationsResponse.fromJson(
        response);
  }

  /// Lists all code security scan configurations in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request. For
  /// subsequent calls, use the NextToken value returned from the previous
  /// request to continue listing results after the first page.
  Future<ListCodeSecurityScanConfigurationsResponse>
      listCodeSecurityScanConfigurations({
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/codesecurity/scan-configuration/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCodeSecurityScanConfigurationsResponse.fromJson(response);
  }

  /// Lists coverage details for your environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterCriteria] :
  /// An object that contains details on the filters to apply to the coverage
  /// data for your environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results the response can return. If your request
  /// would return more than the maximum the response will return a
  /// <code>nextToken</code> value, use this value when you call the action
  /// again to get the remaining results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. If your response returns more than the <code>maxResults</code>
  /// maximum value it will also return a <code>nextToken</code> value. For
  /// subsequent calls, use the <code>nextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  Future<ListCoverageResponse> listCoverage({
    CoverageFilterCriteria? filterCriteria,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $payload = <String, dynamic>{
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/coverage/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListCoverageResponse.fromJson(response);
  }

  /// Lists Amazon Inspector coverage statistics for your environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterCriteria] :
  /// An object that contains details on the filters to apply to the coverage
  /// data for your environment.
  ///
  /// Parameter [groupBy] :
  /// The value to group the results by.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
  Future<ListCoverageStatisticsResponse> listCoverageStatistics({
    CoverageFilterCriteria? filterCriteria,
    GroupKey? groupBy,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (groupBy != null) 'groupBy': groupBy.value,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/coverage/statistics/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListCoverageStatisticsResponse.fromJson(response);
  }

  /// Lists information about the Amazon Inspector delegated administrator of
  /// your organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results the response can return. If your request
  /// would return more than the maximum the response will return a
  /// <code>nextToken</code> value, use this value when you call the action
  /// again to get the remaining results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. If your response returns more than the <code>maxResults</code>
  /// maximum value it will also return a <code>nextToken</code> value. For
  /// subsequent calls, use the <code>nextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  Future<ListDelegatedAdminAccountsResponse> listDelegatedAdminAccounts({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      5,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delegatedadminaccounts/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListDelegatedAdminAccountsResponse.fromJson(response);
  }

  /// Lists the filters associated with your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [action] :
  /// The action the filter applies to matched findings.
  ///
  /// Parameter [arns] :
  /// The Amazon resource number (ARN) of the filter.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results the response can return. If your request
  /// would return more than the maximum the response will return a
  /// <code>nextToken</code> value, use this value when you call the action
  /// again to get the remaining results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. If your response returns more than the <code>maxResults</code>
  /// maximum value it will also return a <code>nextToken</code> value. For
  /// subsequent calls, use the <code>nextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  Future<ListFiltersResponse> listFilters({
    FilterAction? action,
    List<String>? arns,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (action != null) 'action': action.value,
      if (arns != null) 'arns': arns,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/filters/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListFiltersResponse.fromJson(response);
  }

  /// Lists aggregated finding data for your environment based on specific
  /// criteria.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aggregationType] :
  /// The type of the aggregation request.
  ///
  /// Parameter [accountIds] :
  /// The Amazon Web Services account IDs to retrieve finding aggregation data
  /// for.
  ///
  /// Parameter [aggregationRequest] :
  /// Details of the aggregation request that is used to filter your aggregation
  /// results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results the response can return. If your request
  /// would return more than the maximum the response will return a
  /// <code>nextToken</code> value, use this value when you call the action
  /// again to get the remaining results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. If your response returns more than the <code>maxResults</code>
  /// maximum value it will also return a <code>nextToken</code> value. For
  /// subsequent calls, use the <code>nextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  Future<ListFindingAggregationsResponse> listFindingAggregations({
    required AggregationType aggregationType,
    List<StringFilter>? accountIds,
    AggregationRequest? aggregationRequest,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'aggregationType': aggregationType.value,
      if (accountIds != null) 'accountIds': accountIds,
      if (aggregationRequest != null) 'aggregationRequest': aggregationRequest,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findings/aggregation/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingAggregationsResponse.fromJson(response);
  }

  /// Lists findings for your environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterCriteria] :
  /// Details on the filters to apply to your finding results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results the response can return. If your request
  /// would return more than the maximum the response will return a
  /// <code>nextToken</code> value, use this value when you call the action
  /// again to get the remaining results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. If your response returns more than the <code>maxResults</code>
  /// maximum value it will also return a <code>nextToken</code> value. For
  /// subsequent calls, use the <code>nextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  ///
  /// Parameter [sortCriteria] :
  /// Details on the sort criteria to apply to your finding results.
  Future<ListFindingsResponse> listFindings({
    FilterCriteria? filterCriteria,
    int? maxResults,
    String? nextToken,
    SortCriteria? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/findings/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingsResponse.fromJson(response);
  }

  /// List members associated with the Amazon Inspector delegated administrator
  /// for your organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results the response can return. If your request
  /// would return more than the maximum the response will return a
  /// <code>nextToken</code> value, use this value when you call the action
  /// again to get the remaining results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. If your response returns more than the <code>maxResults</code>
  /// maximum value it will also return a <code>nextToken</code> value. For
  /// subsequent calls, use the <code>nextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  ///
  /// Parameter [onlyAssociated] :
  /// Specifies whether to list only currently associated members if
  /// <code>True</code> or to list all members within the organization if
  /// <code>False</code>.
  Future<ListMembersResponse> listMembers({
    int? maxResults,
    String? nextToken,
    bool? onlyAssociated,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (onlyAssociated != null) 'onlyAssociated': onlyAssociated,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/members/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListMembersResponse.fromJson(response);
  }

  /// Lists all tags attached to a given resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon resource number (ARN) of the resource to list tags of.
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

  /// Lists the Amazon Inspector usage totals over the last 30 days.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// The Amazon Web Services account IDs to retrieve usage totals for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results the response can return. If your request
  /// would return more than the maximum the response will return a
  /// <code>nextToken</code> value, use this value when you call the action
  /// again to get the remaining results.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. If your response returns more than the <code>maxResults</code>
  /// maximum value it will also return a <code>nextToken</code> value. For
  /// subsequent calls, use the <code>nextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  Future<ListUsageTotalsResponse> listUsageTotals({
    List<String>? accountIds,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (accountIds != null) 'accountIds': accountIds,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/usage/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListUsageTotalsResponse.fromJson(response);
  }

  /// Resets an encryption key. After the key is reset your resources will be
  /// encrypted by an Amazon Web Services owned key.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceType] :
  /// The resource type the key encrypts.
  ///
  /// Parameter [scanType] :
  /// The scan type the key encrypts.
  Future<void> resetEncryptionKey({
    required ResourceType resourceType,
    required ScanType scanType,
  }) async {
    final $payload = <String, dynamic>{
      'resourceType': resourceType.value,
      'scanType': scanType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/encryptionkey/reset',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists Amazon Inspector coverage details for a specific vulnerability.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterCriteria] :
  /// The criteria used to filter the results of a vulnerability search.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
  Future<SearchVulnerabilitiesResponse> searchVulnerabilities({
    required SearchVulnerabilitiesFilterCriteria filterCriteria,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'filterCriteria': filterCriteria,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/vulnerabilities/search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchVulnerabilitiesResponse.fromJson(response);
  }

  /// Sends a CIS session health. This API is used by the Amazon Inspector SSM
  /// plugin to communicate with the Amazon Inspector service. The Amazon
  /// Inspector SSM plugin calls this API to start a CIS scan session for the
  /// scan ID supplied by the service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scanJobId] :
  /// A unique identifier for the scan job.
  ///
  /// Parameter [sessionToken] :
  /// The unique token that identifies the CIS session.
  Future<void> sendCisSessionHealth({
    required String scanJobId,
    required String sessionToken,
  }) async {
    final $payload = <String, dynamic>{
      'scanJobId': scanJobId,
      'sessionToken': sessionToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/cissession/health/send',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sends a CIS session telemetry. This API is used by the Amazon Inspector
  /// SSM plugin to communicate with the Amazon Inspector service. The Amazon
  /// Inspector SSM plugin calls this API to start a CIS scan session for the
  /// scan ID supplied by the service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [messages] :
  /// The CIS session telemetry messages.
  ///
  /// Parameter [scanJobId] :
  /// A unique identifier for the scan job.
  ///
  /// Parameter [sessionToken] :
  /// The unique token that identifies the CIS session.
  Future<void> sendCisSessionTelemetry({
    required List<CisSessionMessage> messages,
    required String scanJobId,
    required String sessionToken,
  }) async {
    final $payload = <String, dynamic>{
      'messages': messages,
      'scanJobId': scanJobId,
      'sessionToken': sessionToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/cissession/telemetry/send',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a CIS session. This API is used by the Amazon Inspector SSM plugin
  /// to communicate with the Amazon Inspector service. The Amazon Inspector SSM
  /// plugin calls this API to start a CIS scan session for the scan ID supplied
  /// by the service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [message] :
  /// The start CIS session message.
  ///
  /// Parameter [scanJobId] :
  /// A unique identifier for the scan job.
  Future<void> startCisSession({
    required StartCisSessionMessage message,
    required String scanJobId,
  }) async {
    final $payload = <String, dynamic>{
      'message': message,
      'scanJobId': scanJobId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/cissession/start',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Initiates a code security scan on a specified repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resource] :
  /// The resource identifier for the code repository to scan.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<StartCodeSecurityScanResponse> startCodeSecurityScan({
    required CodeSecurityResource resource,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'resource': resource,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/scan/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartCodeSecurityScanResponse.fromJson(response);
  }

  /// Stops a CIS session. This API is used by the Amazon Inspector SSM plugin
  /// to communicate with the Amazon Inspector service. The Amazon Inspector SSM
  /// plugin calls this API to stop a CIS scan session for the scan ID supplied
  /// by the service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [message] :
  /// The stop CIS session message.
  ///
  /// Parameter [scanJobId] :
  /// A unique identifier for the scan job.
  ///
  /// Parameter [sessionToken] :
  /// The unique token that identifies the CIS session.
  Future<void> stopCisSession({
    required StopCisSessionMessage message,
    required String scanJobId,
    required String sessionToken,
  }) async {
    final $payload = <String, dynamic>{
      'message': message,
      'scanJobId': scanJobId,
      'sessionToken': sessionToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/cissession/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds tags to a resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to apply a tag to.
  ///
  /// Parameter [tags] :
  /// The tags to be added to a resource.
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to remove from the resource.
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

  /// Updates a CIS scan configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scanConfigurationArn] :
  /// The CIS scan configuration ARN.
  ///
  /// Parameter [scanName] :
  /// The scan name for the CIS scan configuration.
  ///
  /// Parameter [schedule] :
  /// The schedule for the CIS scan configuration.
  ///
  /// Parameter [securityLevel] :
  /// The security level for the CIS scan configuration. Security level refers
  /// to the Benchmark levels that CIS assigns to a profile.
  ///
  /// Parameter [targets] :
  /// The targets for the CIS scan configuration.
  Future<UpdateCisScanConfigurationResponse> updateCisScanConfiguration({
    required String scanConfigurationArn,
    String? scanName,
    Schedule? schedule,
    CisSecurityLevel? securityLevel,
    UpdateCisTargets? targets,
  }) async {
    final $payload = <String, dynamic>{
      'scanConfigurationArn': scanConfigurationArn,
      if (scanName != null) 'scanName': scanName,
      if (schedule != null) 'schedule': schedule,
      if (securityLevel != null) 'securityLevel': securityLevel.value,
      if (targets != null) 'targets': targets,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan-configuration/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCisScanConfigurationResponse.fromJson(response);
  }

  /// Updates an existing code security integration.
  ///
  /// After calling the <code>CreateCodeSecurityIntegration</code> operation,
  /// you complete authentication and authorization with your provider. Next you
  /// call the <code>UpdateCodeSecurityIntegration</code> operation to provide
  /// the <code>details</code> to complete the integration setup
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [details] :
  /// The updated integration details specific to the repository provider type.
  ///
  /// Parameter [integrationArn] :
  /// The Amazon Resource Name (ARN) of the code security integration to update.
  Future<UpdateCodeSecurityIntegrationResponse> updateCodeSecurityIntegration({
    required UpdateIntegrationDetails details,
    required String integrationArn,
  }) async {
    final $payload = <String, dynamic>{
      'details': details,
      'integrationArn': integrationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/integration/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCodeSecurityIntegrationResponse.fromJson(response);
  }

  /// Updates an existing code security scan configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configuration] :
  /// The updated configuration settings for the code security scan.
  ///
  /// Parameter [scanConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the scan configuration to update.
  Future<UpdateCodeSecurityScanConfigurationResponse>
      updateCodeSecurityScanConfiguration({
    required CodeSecurityScanConfiguration configuration,
    required String scanConfigurationArn,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'scanConfigurationArn': scanConfigurationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/codesecurity/scan-configuration/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCodeSecurityScanConfigurationResponse.fromJson(response);
  }

  /// Updates setting configurations for your Amazon Inspector account. When you
  /// use this API as an Amazon Inspector delegated administrator this updates
  /// the setting for all accounts you manage. Member accounts in an
  /// organization cannot update this setting.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ec2Configuration] :
  /// Specifies how the Amazon EC2 automated scan will be updated for your
  /// environment.
  ///
  /// Parameter [ecrConfiguration] :
  /// Specifies how the ECR automated re-scan will be updated for your
  /// environment.
  Future<void> updateConfiguration({
    Ec2Configuration? ec2Configuration,
    EcrConfiguration? ecrConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (ec2Configuration != null) 'ec2Configuration': ec2Configuration,
      if (ecrConfiguration != null) 'ecrConfiguration': ecrConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configuration/update',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Activates, deactivates Amazon Inspector deep inspection, or updates custom
  /// paths for your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [activateDeepInspection] :
  /// Specify <code>TRUE</code> to activate Amazon Inspector deep inspection in
  /// your account, or <code>FALSE</code> to deactivate. Member accounts in an
  /// organization cannot deactivate deep inspection, instead the delegated
  /// administrator for the organization can deactivate a member account using
  /// <a
  /// href="https://docs.aws.amazon.com/inspector/v2/APIReference/API_BatchUpdateMemberEc2DeepInspectionStatus.html">BatchUpdateMemberEc2DeepInspectionStatus</a>.
  ///
  /// Parameter [packagePaths] :
  /// The Amazon Inspector deep inspection custom paths you are adding for your
  /// account.
  Future<UpdateEc2DeepInspectionConfigurationResponse>
      updateEc2DeepInspectionConfiguration({
    bool? activateDeepInspection,
    List<String>? packagePaths,
  }) async {
    final $payload = <String, dynamic>{
      if (activateDeepInspection != null)
        'activateDeepInspection': activateDeepInspection,
      if (packagePaths != null) 'packagePaths': packagePaths,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ec2deepinspectionconfiguration/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEc2DeepInspectionConfigurationResponse.fromJson(response);
  }

  /// Updates an encryption key. A <code>ResourceNotFoundException</code> means
  /// that an Amazon Web Services owned key is being used for encryption.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [kmsKeyId] :
  /// A KMS key ID for the encryption key.
  ///
  /// Parameter [resourceType] :
  /// The resource type for the encryption key.
  ///
  /// Parameter [scanType] :
  /// The scan type for the encryption key.
  Future<void> updateEncryptionKey({
    required String kmsKeyId,
    required ResourceType resourceType,
    required ScanType scanType,
  }) async {
    final $payload = <String, dynamic>{
      'kmsKeyId': kmsKeyId,
      'resourceType': resourceType.value,
      'scanType': scanType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/encryptionkey/update',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Specifies the action that is to be applied to the findings that match the
  /// filter.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterArn] :
  /// The Amazon Resource Number (ARN) of the filter to update.
  ///
  /// Parameter [action] :
  /// Specifies the action that is to be applied to the findings that match the
  /// filter.
  ///
  /// Parameter [description] :
  /// A description of the filter.
  ///
  /// Parameter [filterCriteria] :
  /// Defines the criteria to be update in the filter.
  ///
  /// Parameter [name] :
  /// The name of the filter.
  ///
  /// Parameter [reason] :
  /// The reason the filter was updated.
  Future<UpdateFilterResponse> updateFilter({
    required String filterArn,
    FilterAction? action,
    String? description,
    FilterCriteria? filterCriteria,
    String? name,
    String? reason,
  }) async {
    final $payload = <String, dynamic>{
      'filterArn': filterArn,
      if (action != null) 'action': action.value,
      if (description != null) 'description': description,
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (name != null) 'name': name,
      if (reason != null) 'reason': reason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/filters/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFilterResponse.fromJson(response);
  }

  /// Updates the configurations for your Amazon Inspector organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [autoEnable] :
  /// Defines which scan types are enabled automatically for new members of your
  /// Amazon Inspector organization.
  Future<UpdateOrganizationConfigurationResponse>
      updateOrganizationConfiguration({
    required AutoEnable autoEnable,
  }) async {
    final $payload = <String, dynamic>{
      'autoEnable': autoEnable,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organizationconfiguration/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateOrganizationConfigurationResponse.fromJson(response);
  }

  /// Updates the Amazon Inspector deep inspection custom paths for your
  /// organization. You must be an Amazon Inspector delegated administrator to
  /// use this API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [orgPackagePaths] :
  /// The Amazon Inspector deep inspection custom paths you are adding for your
  /// organization.
  Future<void> updateOrgEc2DeepInspectionConfiguration({
    required List<String> orgPackagePaths,
  }) async {
    final $payload = <String, dynamic>{
      'orgPackagePaths': orgPackagePaths,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ec2deepinspectionconfiguration/org/update',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class AssociateMemberResponse {
  /// The Amazon Web Services account ID of the successfully associated member
  /// account.
  final String accountId;

  AssociateMemberResponse({
    required this.accountId,
  });

  factory AssociateMemberResponse.fromJson(Map<String, dynamic> json) {
    return AssociateMemberResponse(
      accountId: (json['accountId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// @nodoc
class BatchAssociateCodeSecurityScanConfigurationResponse {
  /// Details of any code repositories that failed to be associated with the scan
  /// configuration.
  final List<FailedAssociationResult>? failedAssociations;

  /// Details of code repositories that were successfully associated with the scan
  /// configuration.
  final List<SuccessfulAssociationResult>? successfulAssociations;

  BatchAssociateCodeSecurityScanConfigurationResponse({
    this.failedAssociations,
    this.successfulAssociations,
  });

  factory BatchAssociateCodeSecurityScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchAssociateCodeSecurityScanConfigurationResponse(
      failedAssociations: (json['failedAssociations'] as List?)
          ?.nonNulls
          .map((e) =>
              FailedAssociationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulAssociations: (json['successfulAssociations'] as List?)
          ?.nonNulls
          .map((e) =>
              SuccessfulAssociationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedAssociations = this.failedAssociations;
    final successfulAssociations = this.successfulAssociations;
    return {
      if (failedAssociations != null) 'failedAssociations': failedAssociations,
      if (successfulAssociations != null)
        'successfulAssociations': successfulAssociations,
    };
  }
}

/// @nodoc
class BatchDisassociateCodeSecurityScanConfigurationResponse {
  /// Details of any code repositories that failed to be disassociated from the
  /// scan configuration.
  final List<FailedAssociationResult>? failedAssociations;

  /// Details of code repositories that were successfully disassociated from the
  /// scan configuration.
  final List<SuccessfulAssociationResult>? successfulAssociations;

  BatchDisassociateCodeSecurityScanConfigurationResponse({
    this.failedAssociations,
    this.successfulAssociations,
  });

  factory BatchDisassociateCodeSecurityScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDisassociateCodeSecurityScanConfigurationResponse(
      failedAssociations: (json['failedAssociations'] as List?)
          ?.nonNulls
          .map((e) =>
              FailedAssociationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulAssociations: (json['successfulAssociations'] as List?)
          ?.nonNulls
          .map((e) =>
              SuccessfulAssociationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedAssociations = this.failedAssociations;
    final successfulAssociations = this.successfulAssociations;
    return {
      if (failedAssociations != null) 'failedAssociations': failedAssociations,
      if (successfulAssociations != null)
        'successfulAssociations': successfulAssociations,
    };
  }
}

/// @nodoc
class BatchGetAccountStatusResponse {
  /// An array of objects that provide details on the status of Amazon Inspector
  /// for each of the requested accounts.
  final List<AccountState> accounts;

  /// An array of objects detailing any accounts that failed to enable Amazon
  /// Inspector and why.
  final List<FailedAccount>? failedAccounts;

  BatchGetAccountStatusResponse({
    required this.accounts,
    this.failedAccounts,
  });

  factory BatchGetAccountStatusResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetAccountStatusResponse(
      accounts: ((json['accounts'] as List?) ?? const [])
          .nonNulls
          .map((e) => AccountState.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedAccounts: (json['failedAccounts'] as List?)
          ?.nonNulls
          .map((e) => FailedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final failedAccounts = this.failedAccounts;
    return {
      'accounts': accounts,
      if (failedAccounts != null) 'failedAccounts': failedAccounts,
    };
  }
}

/// @nodoc
class BatchGetCodeSnippetResponse {
  /// The retrieved code snippets associated with the provided finding ARNs.
  final List<CodeSnippetResult>? codeSnippetResults;

  /// Any errors Amazon Inspector encountered while trying to retrieve the
  /// requested code snippets.
  final List<CodeSnippetError>? errors;

  BatchGetCodeSnippetResponse({
    this.codeSnippetResults,
    this.errors,
  });

  factory BatchGetCodeSnippetResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetCodeSnippetResponse(
      codeSnippetResults: (json['codeSnippetResults'] as List?)
          ?.nonNulls
          .map((e) => CodeSnippetResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => CodeSnippetError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final codeSnippetResults = this.codeSnippetResults;
    final errors = this.errors;
    return {
      if (codeSnippetResults != null) 'codeSnippetResults': codeSnippetResults,
      if (errors != null) 'errors': errors,
    };
  }
}

/// @nodoc
class BatchGetFindingDetailsResponse {
  /// Error information for findings that details could not be returned for.
  final List<FindingDetailsError>? errors;

  /// A finding's vulnerability details.
  final List<FindingDetail>? findingDetails;

  BatchGetFindingDetailsResponse({
    this.errors,
    this.findingDetails,
  });

  factory BatchGetFindingDetailsResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetFindingDetailsResponse(
      errors: (json['errors'] as List?)
          ?.nonNulls
          .map((e) => FindingDetailsError.fromJson(e as Map<String, dynamic>))
          .toList(),
      findingDetails: (json['findingDetails'] as List?)
          ?.nonNulls
          .map((e) => FindingDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final findingDetails = this.findingDetails;
    return {
      if (errors != null) 'errors': errors,
      if (findingDetails != null) 'findingDetails': findingDetails,
    };
  }
}

/// @nodoc
class BatchGetFreeTrialInfoResponse {
  /// An array of objects that provide Amazon Inspector free trial details for
  /// each of the requested accounts.
  final List<FreeTrialAccountInfo> accounts;

  /// An array of objects detailing any accounts that free trial data could not be
  /// returned for.
  final List<FreeTrialInfoError> failedAccounts;

  BatchGetFreeTrialInfoResponse({
    required this.accounts,
    required this.failedAccounts,
  });

  factory BatchGetFreeTrialInfoResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetFreeTrialInfoResponse(
      accounts: ((json['accounts'] as List?) ?? const [])
          .nonNulls
          .map((e) => FreeTrialAccountInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedAccounts: ((json['failedAccounts'] as List?) ?? const [])
          .nonNulls
          .map((e) => FreeTrialInfoError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final failedAccounts = this.failedAccounts;
    return {
      'accounts': accounts,
      'failedAccounts': failedAccounts,
    };
  }
}

/// @nodoc
class BatchGetMemberEc2DeepInspectionStatusResponse {
  /// An array of objects that provide details on the activation status of Amazon
  /// Inspector deep inspection for each of the requested accounts.
  final List<MemberAccountEc2DeepInspectionStatusState>? accountIds;

  /// An array of objects that provide details on any accounts that failed to
  /// activate Amazon Inspector deep inspection and why.
  final List<FailedMemberAccountEc2DeepInspectionStatusState>? failedAccountIds;

  BatchGetMemberEc2DeepInspectionStatusResponse({
    this.accountIds,
    this.failedAccountIds,
  });

  factory BatchGetMemberEc2DeepInspectionStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetMemberEc2DeepInspectionStatusResponse(
      accountIds: (json['accountIds'] as List?)
          ?.nonNulls
          .map((e) => MemberAccountEc2DeepInspectionStatusState.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      failedAccountIds: (json['failedAccountIds'] as List?)
          ?.nonNulls
          .map((e) => FailedMemberAccountEc2DeepInspectionStatusState.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final failedAccountIds = this.failedAccountIds;
    return {
      if (accountIds != null) 'accountIds': accountIds,
      if (failedAccountIds != null) 'failedAccountIds': failedAccountIds,
    };
  }
}

/// @nodoc
class BatchUpdateMemberEc2DeepInspectionStatusResponse {
  /// An array of objects that provide details for each of the accounts that
  /// Amazon Inspector deep inspection status was successfully changed for.
  final List<MemberAccountEc2DeepInspectionStatusState>? accountIds;

  /// An array of objects that provide details for each of the accounts that
  /// Amazon Inspector deep inspection status could not be successfully changed
  /// for.
  final List<FailedMemberAccountEc2DeepInspectionStatusState>? failedAccountIds;

  BatchUpdateMemberEc2DeepInspectionStatusResponse({
    this.accountIds,
    this.failedAccountIds,
  });

  factory BatchUpdateMemberEc2DeepInspectionStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateMemberEc2DeepInspectionStatusResponse(
      accountIds: (json['accountIds'] as List?)
          ?.nonNulls
          .map((e) => MemberAccountEc2DeepInspectionStatusState.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      failedAccountIds: (json['failedAccountIds'] as List?)
          ?.nonNulls
          .map((e) => FailedMemberAccountEc2DeepInspectionStatusState.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final failedAccountIds = this.failedAccountIds;
    return {
      if (accountIds != null) 'accountIds': accountIds,
      if (failedAccountIds != null) 'failedAccountIds': failedAccountIds,
    };
  }
}

/// @nodoc
class CancelFindingsReportResponse {
  /// The ID of the canceled report.
  final String reportId;

  CancelFindingsReportResponse({
    required this.reportId,
  });

  factory CancelFindingsReportResponse.fromJson(Map<String, dynamic> json) {
    return CancelFindingsReportResponse(
      reportId: (json['reportId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final reportId = this.reportId;
    return {
      'reportId': reportId,
    };
  }
}

/// @nodoc
class CancelSbomExportResponse {
  /// The report ID of the canceled SBOM export.
  final String? reportId;

  CancelSbomExportResponse({
    this.reportId,
  });

  factory CancelSbomExportResponse.fromJson(Map<String, dynamic> json) {
    return CancelSbomExportResponse(
      reportId: json['reportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportId = this.reportId;
    return {
      if (reportId != null) 'reportId': reportId,
    };
  }
}

/// @nodoc
class CreateCisScanConfigurationResponse {
  /// The scan configuration ARN for the CIS scan configuration.
  final String? scanConfigurationArn;

  CreateCisScanConfigurationResponse({
    this.scanConfigurationArn,
  });

  factory CreateCisScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCisScanConfigurationResponse(
      scanConfigurationArn: json['scanConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      if (scanConfigurationArn != null)
        'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

/// @nodoc
class CreateCodeSecurityIntegrationResponse {
  /// The Amazon Resource Name (ARN) of the created code security integration.
  final String integrationArn;

  /// The current status of the code security integration.
  final IntegrationStatus status;

  /// The URL used to authorize the integration with the repository provider.
  final String? authorizationUrl;

  CreateCodeSecurityIntegrationResponse({
    required this.integrationArn,
    required this.status,
    this.authorizationUrl,
  });

  factory CreateCodeSecurityIntegrationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCodeSecurityIntegrationResponse(
      integrationArn: (json['integrationArn'] as String?) ?? '',
      status: IntegrationStatus.fromString((json['status'] as String?) ?? ''),
      authorizationUrl: json['authorizationUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integrationArn = this.integrationArn;
    final status = this.status;
    final authorizationUrl = this.authorizationUrl;
    return {
      'integrationArn': integrationArn,
      'status': status.value,
      if (authorizationUrl != null) 'authorizationUrl': authorizationUrl,
    };
  }
}

/// @nodoc
class CreateCodeSecurityScanConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the created scan configuration.
  final String scanConfigurationArn;

  CreateCodeSecurityScanConfigurationResponse({
    required this.scanConfigurationArn,
  });

  factory CreateCodeSecurityScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCodeSecurityScanConfigurationResponse(
      scanConfigurationArn: (json['scanConfigurationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

/// @nodoc
class CreateFilterResponse {
  /// The Amazon Resource Number (ARN) of the successfully created filter.
  final String arn;

  CreateFilterResponse({
    required this.arn,
  });

  factory CreateFilterResponse.fromJson(Map<String, dynamic> json) {
    return CreateFilterResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class CreateFindingsReportResponse {
  /// The ID of the report.
  final String? reportId;

  CreateFindingsReportResponse({
    this.reportId,
  });

  factory CreateFindingsReportResponse.fromJson(Map<String, dynamic> json) {
    return CreateFindingsReportResponse(
      reportId: json['reportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportId = this.reportId;
    return {
      if (reportId != null) 'reportId': reportId,
    };
  }
}

/// @nodoc
class CreateSbomExportResponse {
  /// The report ID for the software bill of materials (SBOM) report.
  final String? reportId;

  CreateSbomExportResponse({
    this.reportId,
  });

  factory CreateSbomExportResponse.fromJson(Map<String, dynamic> json) {
    return CreateSbomExportResponse(
      reportId: json['reportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportId = this.reportId;
    return {
      if (reportId != null) 'reportId': reportId,
    };
  }
}

/// @nodoc
class DeleteCisScanConfigurationResponse {
  /// The ARN of the CIS scan configuration.
  final String scanConfigurationArn;

  DeleteCisScanConfigurationResponse({
    required this.scanConfigurationArn,
  });

  factory DeleteCisScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteCisScanConfigurationResponse(
      scanConfigurationArn: (json['scanConfigurationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

/// @nodoc
class DeleteCodeSecurityIntegrationResponse {
  /// The Amazon Resource Name (ARN) of the deleted code security integration.
  final String? integrationArn;

  DeleteCodeSecurityIntegrationResponse({
    this.integrationArn,
  });

  factory DeleteCodeSecurityIntegrationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteCodeSecurityIntegrationResponse(
      integrationArn: json['integrationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integrationArn = this.integrationArn;
    return {
      if (integrationArn != null) 'integrationArn': integrationArn,
    };
  }
}

/// @nodoc
class DeleteCodeSecurityScanConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the deleted scan configuration.
  final String? scanConfigurationArn;

  DeleteCodeSecurityScanConfigurationResponse({
    this.scanConfigurationArn,
  });

  factory DeleteCodeSecurityScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteCodeSecurityScanConfigurationResponse(
      scanConfigurationArn: json['scanConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      if (scanConfigurationArn != null)
        'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

/// @nodoc
class DeleteFilterResponse {
  /// The Amazon Resource Number (ARN) of the filter that has been deleted.
  final String arn;

  DeleteFilterResponse({
    required this.arn,
  });

  factory DeleteFilterResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFilterResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class DescribeOrganizationConfigurationResponse {
  /// The scan types are automatically enabled for new members of your
  /// organization.
  final AutoEnable? autoEnable;

  /// Represents whether your organization has reached the maximum Amazon Web
  /// Services account limit for Amazon Inspector.
  final bool? maxAccountLimitReached;

  DescribeOrganizationConfigurationResponse({
    this.autoEnable,
    this.maxAccountLimitReached,
  });

  factory DescribeOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationConfigurationResponse(
      autoEnable: json['autoEnable'] != null
          ? AutoEnable.fromJson(json['autoEnable'] as Map<String, dynamic>)
          : null,
      maxAccountLimitReached: json['maxAccountLimitReached'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    final maxAccountLimitReached = this.maxAccountLimitReached;
    return {
      if (autoEnable != null) 'autoEnable': autoEnable,
      if (maxAccountLimitReached != null)
        'maxAccountLimitReached': maxAccountLimitReached,
    };
  }
}

/// @nodoc
class DisableResponse {
  /// Information on the accounts that have had Amazon Inspector scans
  /// successfully disabled. Details are provided for each account.
  final List<Account> accounts;

  /// Information on any accounts for which Amazon Inspector scans could not be
  /// disabled. Details are provided for each account.
  final List<FailedAccount>? failedAccounts;

  DisableResponse({
    required this.accounts,
    this.failedAccounts,
  });

  factory DisableResponse.fromJson(Map<String, dynamic> json) {
    return DisableResponse(
      accounts: ((json['accounts'] as List?) ?? const [])
          .nonNulls
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedAccounts: (json['failedAccounts'] as List?)
          ?.nonNulls
          .map((e) => FailedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final failedAccounts = this.failedAccounts;
    return {
      'accounts': accounts,
      if (failedAccounts != null) 'failedAccounts': failedAccounts,
    };
  }
}

/// @nodoc
class DisableDelegatedAdminAccountResponse {
  /// The Amazon Web Services account ID of the successfully disabled delegated
  /// administrator.
  final String delegatedAdminAccountId;

  DisableDelegatedAdminAccountResponse({
    required this.delegatedAdminAccountId,
  });

  factory DisableDelegatedAdminAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return DisableDelegatedAdminAccountResponse(
      delegatedAdminAccountId:
          (json['delegatedAdminAccountId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final delegatedAdminAccountId = this.delegatedAdminAccountId;
    return {
      'delegatedAdminAccountId': delegatedAdminAccountId,
    };
  }
}

/// @nodoc
class DisassociateMemberResponse {
  /// The Amazon Web Services account ID of the successfully disassociated member.
  final String accountId;

  DisassociateMemberResponse({
    required this.accountId,
  });

  factory DisassociateMemberResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateMemberResponse(
      accountId: (json['accountId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// @nodoc
class EnableResponse {
  /// Information on the accounts that have had Amazon Inspector scans
  /// successfully enabled. Details are provided for each account.
  final List<Account> accounts;

  /// Information on any accounts for which Amazon Inspector scans could not be
  /// enabled. Details are provided for each account.
  final List<FailedAccount>? failedAccounts;

  EnableResponse({
    required this.accounts,
    this.failedAccounts,
  });

  factory EnableResponse.fromJson(Map<String, dynamic> json) {
    return EnableResponse(
      accounts: ((json['accounts'] as List?) ?? const [])
          .nonNulls
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedAccounts: (json['failedAccounts'] as List?)
          ?.nonNulls
          .map((e) => FailedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final failedAccounts = this.failedAccounts;
    return {
      'accounts': accounts,
      if (failedAccounts != null) 'failedAccounts': failedAccounts,
    };
  }
}

/// @nodoc
class EnableDelegatedAdminAccountResponse {
  /// The Amazon Web Services account ID of the successfully Amazon Inspector
  /// delegated administrator.
  final String delegatedAdminAccountId;

  EnableDelegatedAdminAccountResponse({
    required this.delegatedAdminAccountId,
  });

  factory EnableDelegatedAdminAccountResponse.fromJson(
      Map<String, dynamic> json) {
    return EnableDelegatedAdminAccountResponse(
      delegatedAdminAccountId:
          (json['delegatedAdminAccountId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final delegatedAdminAccountId = this.delegatedAdminAccountId;
    return {
      'delegatedAdminAccountId': delegatedAdminAccountId,
    };
  }
}

/// @nodoc
class GetCisScanReportResponse {
  /// The status.
  final CisReportStatus? status;

  /// The URL where a PDF or CSV of the CIS scan report can be downloaded.
  final String? url;

  GetCisScanReportResponse({
    this.status,
    this.url,
  });

  factory GetCisScanReportResponse.fromJson(Map<String, dynamic> json) {
    return GetCisScanReportResponse(
      status: (json['status'] as String?)?.let(CisReportStatus.fromString),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final url = this.url;
    return {
      if (status != null) 'status': status.value,
      if (url != null) 'url': url,
    };
  }
}

/// @nodoc
class GetCisScanResultDetailsResponse {
  /// The pagination token from a previous request that's used to retrieve the
  /// next page of results.
  final String? nextToken;

  /// The scan result details.
  final List<CisScanResultDetails>? scanResultDetails;

  GetCisScanResultDetailsResponse({
    this.nextToken,
    this.scanResultDetails,
  });

  factory GetCisScanResultDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetCisScanResultDetailsResponse(
      nextToken: json['nextToken'] as String?,
      scanResultDetails: (json['scanResultDetails'] as List?)
          ?.nonNulls
          .map((e) => CisScanResultDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scanResultDetails = this.scanResultDetails;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (scanResultDetails != null) 'scanResultDetails': scanResultDetails,
    };
  }
}

/// @nodoc
class GetClustersForImageResponse {
  /// A unit of work inside of a cluster, which can include metadata about the
  /// cluster.
  final List<ClusterInformation> cluster;

  /// The pagination token from a previous request used to retrieve the next page
  /// of results.
  final String? nextToken;

  GetClustersForImageResponse({
    required this.cluster,
    this.nextToken,
  });

  factory GetClustersForImageResponse.fromJson(Map<String, dynamic> json) {
    return GetClustersForImageResponse(
      cluster: ((json['cluster'] as List?) ?? const [])
          .nonNulls
          .map((e) => ClusterInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cluster = this.cluster;
    final nextToken = this.nextToken;
    return {
      'cluster': cluster,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetCodeSecurityIntegrationResponse {
  /// The timestamp when the code security integration was created.
  final DateTime createdOn;

  /// The Amazon Resource Name (ARN) of the code security integration.
  final String integrationArn;

  /// The timestamp when the code security integration was last updated.
  final DateTime lastUpdateOn;

  /// The name of the code security integration.
  final String name;

  /// The current status of the code security integration.
  final IntegrationStatus status;

  /// The reason for the current status of the code security integration.
  final String statusReason;

  /// The type of repository provider for the integration.
  final IntegrationType type;

  /// The URL used to authorize the integration with the repository provider. This
  /// is only returned if reauthorization is required to fix a connection issue.
  /// Otherwise, it is null.
  final String? authorizationUrl;

  /// The tags associated with the code security integration.
  final Map<String, String>? tags;

  GetCodeSecurityIntegrationResponse({
    required this.createdOn,
    required this.integrationArn,
    required this.lastUpdateOn,
    required this.name,
    required this.status,
    required this.statusReason,
    required this.type,
    this.authorizationUrl,
    this.tags,
  });

  factory GetCodeSecurityIntegrationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCodeSecurityIntegrationResponse(
      createdOn: nonNullableTimeStampFromJson(json['createdOn'] ?? 0),
      integrationArn: (json['integrationArn'] as String?) ?? '',
      lastUpdateOn: nonNullableTimeStampFromJson(json['lastUpdateOn'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: IntegrationStatus.fromString((json['status'] as String?) ?? ''),
      statusReason: (json['statusReason'] as String?) ?? '',
      type: IntegrationType.fromString((json['type'] as String?) ?? ''),
      authorizationUrl: json['authorizationUrl'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdOn = this.createdOn;
    final integrationArn = this.integrationArn;
    final lastUpdateOn = this.lastUpdateOn;
    final name = this.name;
    final status = this.status;
    final statusReason = this.statusReason;
    final type = this.type;
    final authorizationUrl = this.authorizationUrl;
    final tags = this.tags;
    return {
      'createdOn': unixTimestampToJson(createdOn),
      'integrationArn': integrationArn,
      'lastUpdateOn': unixTimestampToJson(lastUpdateOn),
      'name': name,
      'status': status.value,
      'statusReason': statusReason,
      'type': type.value,
      if (authorizationUrl != null) 'authorizationUrl': authorizationUrl,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetCodeSecurityScanResponse {
  /// The Amazon Web Services account ID associated with the scan.
  final String? accountId;

  /// The timestamp when the scan was created.
  final DateTime? createdAt;

  /// The identifier of the last commit that was scanned. This is only returned if
  /// the scan was successful or skipped.
  final String? lastCommitId;

  /// The resource identifier for the code repository that was scanned.
  final CodeSecurityResource? resource;

  /// The unique identifier of the scan.
  final String? scanId;

  /// The current status of the scan.
  final CodeScanStatus? status;

  /// The reason for the current status of the scan.
  final String? statusReason;

  /// The timestamp when the scan was last updated.
  final DateTime? updatedAt;

  GetCodeSecurityScanResponse({
    this.accountId,
    this.createdAt,
    this.lastCommitId,
    this.resource,
    this.scanId,
    this.status,
    this.statusReason,
    this.updatedAt,
  });

  factory GetCodeSecurityScanResponse.fromJson(Map<String, dynamic> json) {
    return GetCodeSecurityScanResponse(
      accountId: json['accountId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      lastCommitId: json['lastCommitId'] as String?,
      resource: json['resource'] != null
          ? CodeSecurityResource.fromJson(
              json['resource'] as Map<String, dynamic>)
          : null,
      scanId: json['scanId'] as String?,
      status: (json['status'] as String?)?.let(CodeScanStatus.fromString),
      statusReason: json['statusReason'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final createdAt = this.createdAt;
    final lastCommitId = this.lastCommitId;
    final resource = this.resource;
    final scanId = this.scanId;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    return {
      if (accountId != null) 'accountId': accountId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastCommitId != null) 'lastCommitId': lastCommitId,
      if (resource != null) 'resource': resource,
      if (scanId != null) 'scanId': scanId,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class GetCodeSecurityScanConfigurationResponse {
  /// The configuration settings for the code security scan.
  final CodeSecurityScanConfiguration? configuration;

  /// The timestamp when the scan configuration was created.
  final DateTime? createdAt;

  /// The timestamp when the scan configuration was last updated.
  final DateTime? lastUpdatedAt;

  /// The security level for the scan configuration.
  final ConfigurationLevel? level;

  /// The name of the scan configuration.
  final String? name;

  /// The Amazon Resource Name (ARN) of the scan configuration.
  final String? scanConfigurationArn;

  /// The scope settings that define which repositories will be scanned. If the
  /// <code>ScopeSetting</code> parameter is <code>ALL</code> the scan
  /// configuration applies to all existing and future projects imported into
  /// Amazon Inspector.
  final ScopeSettings? scopeSettings;

  /// The tags associated with the scan configuration.
  final Map<String, String>? tags;

  GetCodeSecurityScanConfigurationResponse({
    this.configuration,
    this.createdAt,
    this.lastUpdatedAt,
    this.level,
    this.name,
    this.scanConfigurationArn,
    this.scopeSettings,
    this.tags,
  });

  factory GetCodeSecurityScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCodeSecurityScanConfigurationResponse(
      configuration: json['configuration'] != null
          ? CodeSecurityScanConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      level: (json['level'] as String?)?.let(ConfigurationLevel.fromString),
      name: json['name'] as String?,
      scanConfigurationArn: json['scanConfigurationArn'] as String?,
      scopeSettings: json['scopeSettings'] != null
          ? ScopeSettings.fromJson(
              json['scopeSettings'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final level = this.level;
    final name = this.name;
    final scanConfigurationArn = this.scanConfigurationArn;
    final scopeSettings = this.scopeSettings;
    final tags = this.tags;
    return {
      if (configuration != null) 'configuration': configuration,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (level != null) 'level': level.value,
      if (name != null) 'name': name,
      if (scanConfigurationArn != null)
        'scanConfigurationArn': scanConfigurationArn,
      if (scopeSettings != null) 'scopeSettings': scopeSettings,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetConfigurationResponse {
  /// Specifies how the Amazon EC2 automated scan mode is currently configured for
  /// your environment.
  final Ec2ConfigurationState? ec2Configuration;

  /// Specifies how the ECR automated re-scan duration is currently configured for
  /// your environment.
  final EcrConfigurationState? ecrConfiguration;

  GetConfigurationResponse({
    this.ec2Configuration,
    this.ecrConfiguration,
  });

  factory GetConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetConfigurationResponse(
      ec2Configuration: json['ec2Configuration'] != null
          ? Ec2ConfigurationState.fromJson(
              json['ec2Configuration'] as Map<String, dynamic>)
          : null,
      ecrConfiguration: json['ecrConfiguration'] != null
          ? EcrConfigurationState.fromJson(
              json['ecrConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ec2Configuration = this.ec2Configuration;
    final ecrConfiguration = this.ecrConfiguration;
    return {
      if (ec2Configuration != null) 'ec2Configuration': ec2Configuration,
      if (ecrConfiguration != null) 'ecrConfiguration': ecrConfiguration,
    };
  }
}

/// @nodoc
class GetDelegatedAdminAccountResponse {
  /// The Amazon Web Services account ID of the Amazon Inspector delegated
  /// administrator.
  final DelegatedAdmin? delegatedAdmin;

  GetDelegatedAdminAccountResponse({
    this.delegatedAdmin,
  });

  factory GetDelegatedAdminAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetDelegatedAdminAccountResponse(
      delegatedAdmin: json['delegatedAdmin'] != null
          ? DelegatedAdmin.fromJson(
              json['delegatedAdmin'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final delegatedAdmin = this.delegatedAdmin;
    return {
      if (delegatedAdmin != null) 'delegatedAdmin': delegatedAdmin,
    };
  }
}

/// @nodoc
class GetEc2DeepInspectionConfigurationResponse {
  /// An error message explaining why Amazon Inspector deep inspection
  /// configurations could not be retrieved for your account.
  final String? errorMessage;

  /// The Amazon Inspector deep inspection custom paths for your organization.
  final List<String>? orgPackagePaths;

  /// The Amazon Inspector deep inspection custom paths for your account.
  final List<String>? packagePaths;

  /// The activation status of Amazon Inspector deep inspection in your account.
  final Ec2DeepInspectionStatus? status;

  GetEc2DeepInspectionConfigurationResponse({
    this.errorMessage,
    this.orgPackagePaths,
    this.packagePaths,
    this.status,
  });

  factory GetEc2DeepInspectionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEc2DeepInspectionConfigurationResponse(
      errorMessage: json['errorMessage'] as String?,
      orgPackagePaths: (json['orgPackagePaths'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      packagePaths: (json['packagePaths'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status:
          (json['status'] as String?)?.let(Ec2DeepInspectionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final orgPackagePaths = this.orgPackagePaths;
    final packagePaths = this.packagePaths;
    final status = this.status;
    return {
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (orgPackagePaths != null) 'orgPackagePaths': orgPackagePaths,
      if (packagePaths != null) 'packagePaths': packagePaths,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class GetEncryptionKeyResponse {
  /// A kms key ID.
  final String kmsKeyId;

  GetEncryptionKeyResponse({
    required this.kmsKeyId,
  });

  factory GetEncryptionKeyResponse.fromJson(Map<String, dynamic> json) {
    return GetEncryptionKeyResponse(
      kmsKeyId: (json['kmsKeyId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    return {
      'kmsKeyId': kmsKeyId,
    };
  }
}

/// @nodoc
class GetFindingsReportStatusResponse {
  /// The destination of the report.
  final Destination? destination;

  /// The error code of the report.
  final ReportingErrorCode? errorCode;

  /// The error message of the report.
  final String? errorMessage;

  /// The filter criteria associated with the report.
  final FilterCriteria? filterCriteria;

  /// The ID of the report.
  final String? reportId;

  /// The status of the report.
  final ExternalReportStatus? status;

  GetFindingsReportStatusResponse({
    this.destination,
    this.errorCode,
    this.errorMessage,
    this.filterCriteria,
    this.reportId,
    this.status,
  });

  factory GetFindingsReportStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetFindingsReportStatusResponse(
      destination: json['destination'] != null
          ? Destination.fromJson(json['destination'] as Map<String, dynamic>)
          : null,
      errorCode:
          (json['errorCode'] as String?)?.let(ReportingErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      filterCriteria: json['filterCriteria'] != null
          ? FilterCriteria.fromJson(
              json['filterCriteria'] as Map<String, dynamic>)
          : null,
      reportId: json['reportId'] as String?,
      status: (json['status'] as String?)?.let(ExternalReportStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final filterCriteria = this.filterCriteria;
    final reportId = this.reportId;
    final status = this.status;
    return {
      if (destination != null) 'destination': destination,
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (reportId != null) 'reportId': reportId,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class GetMemberResponse {
  /// Details of the retrieved member account.
  final Member? member;

  GetMemberResponse({
    this.member,
  });

  factory GetMemberResponse.fromJson(Map<String, dynamic> json) {
    return GetMemberResponse(
      member: json['member'] != null
          ? Member.fromJson(json['member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final member = this.member;
    return {
      if (member != null) 'member': member,
    };
  }
}

/// @nodoc
class GetSbomExportResponse {
  /// An error code.
  final ReportingErrorCode? errorCode;

  /// An error message.
  final String? errorMessage;

  /// Contains details about the resource filter criteria used for the software
  /// bill of materials (SBOM) report.
  final ResourceFilterCriteria? filterCriteria;

  /// The format of the software bill of materials (SBOM) report.
  final SbomReportFormat? format;

  /// The report ID of the software bill of materials (SBOM) report.
  final String? reportId;

  /// Contains details of the Amazon S3 bucket and KMS key used to export findings
  final Destination? s3Destination;

  /// The status of the software bill of materials (SBOM) report.
  final ExternalReportStatus? status;

  GetSbomExportResponse({
    this.errorCode,
    this.errorMessage,
    this.filterCriteria,
    this.format,
    this.reportId,
    this.s3Destination,
    this.status,
  });

  factory GetSbomExportResponse.fromJson(Map<String, dynamic> json) {
    return GetSbomExportResponse(
      errorCode:
          (json['errorCode'] as String?)?.let(ReportingErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      filterCriteria: json['filterCriteria'] != null
          ? ResourceFilterCriteria.fromJson(
              json['filterCriteria'] as Map<String, dynamic>)
          : null,
      format: (json['format'] as String?)?.let(SbomReportFormat.fromString),
      reportId: json['reportId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? Destination.fromJson(json['s3Destination'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(ExternalReportStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final filterCriteria = this.filterCriteria;
    final format = this.format;
    final reportId = this.reportId;
    final s3Destination = this.s3Destination;
    final status = this.status;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (format != null) 'format': format.value,
      if (reportId != null) 'reportId': reportId,
      if (s3Destination != null) 's3Destination': s3Destination,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class ListAccountPermissionsResponse {
  /// Contains details on the permissions an account has to configure Amazon
  /// Inspector.
  final List<Permission> permissions;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  final String? nextToken;

  ListAccountPermissionsResponse({
    required this.permissions,
    this.nextToken,
  });

  factory ListAccountPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAccountPermissionsResponse(
      permissions: ((json['permissions'] as List?) ?? const [])
          .nonNulls
          .map((e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    final nextToken = this.nextToken;
    return {
      'permissions': permissions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCisScanConfigurationsResponse {
  /// The pagination token from a previous request that's used to retrieve the
  /// next page of results.
  final String? nextToken;

  /// The CIS scan configuration scan configurations.
  final List<CisScanConfiguration>? scanConfigurations;

  ListCisScanConfigurationsResponse({
    this.nextToken,
    this.scanConfigurations,
  });

  factory ListCisScanConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCisScanConfigurationsResponse(
      nextToken: json['nextToken'] as String?,
      scanConfigurations: (json['scanConfigurations'] as List?)
          ?.nonNulls
          .map((e) => CisScanConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scanConfigurations = this.scanConfigurations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (scanConfigurations != null) 'scanConfigurations': scanConfigurations,
    };
  }
}

/// @nodoc
class ListCisScanResultsAggregatedByChecksResponse {
  /// The check aggregations.
  final List<CisCheckAggregation>? checkAggregations;

  /// The pagination token from a previous request that's used to retrieve the
  /// next page of results.
  final String? nextToken;

  ListCisScanResultsAggregatedByChecksResponse({
    this.checkAggregations,
    this.nextToken,
  });

  factory ListCisScanResultsAggregatedByChecksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCisScanResultsAggregatedByChecksResponse(
      checkAggregations: (json['checkAggregations'] as List?)
          ?.nonNulls
          .map((e) => CisCheckAggregation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checkAggregations = this.checkAggregations;
    final nextToken = this.nextToken;
    return {
      if (checkAggregations != null) 'checkAggregations': checkAggregations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCisScanResultsAggregatedByTargetResourceResponse {
  /// The pagination token from a previous request that's used to retrieve the
  /// next page of results.
  final String? nextToken;

  /// The resource aggregations.
  final List<CisTargetResourceAggregation>? targetResourceAggregations;

  ListCisScanResultsAggregatedByTargetResourceResponse({
    this.nextToken,
    this.targetResourceAggregations,
  });

  factory ListCisScanResultsAggregatedByTargetResourceResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCisScanResultsAggregatedByTargetResourceResponse(
      nextToken: json['nextToken'] as String?,
      targetResourceAggregations: (json['targetResourceAggregations'] as List?)
          ?.nonNulls
          .map((e) =>
              CisTargetResourceAggregation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final targetResourceAggregations = this.targetResourceAggregations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (targetResourceAggregations != null)
        'targetResourceAggregations': targetResourceAggregations,
    };
  }
}

/// @nodoc
class ListCisScansResponse {
  /// The pagination token from a previous request that's used to retrieve the
  /// next page of results.
  final String? nextToken;

  /// The CIS scans.
  final List<CisScan>? scans;

  ListCisScansResponse({
    this.nextToken,
    this.scans,
  });

  factory ListCisScansResponse.fromJson(Map<String, dynamic> json) {
    return ListCisScansResponse(
      nextToken: json['nextToken'] as String?,
      scans: (json['scans'] as List?)
          ?.nonNulls
          .map((e) => CisScan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scans = this.scans;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (scans != null) 'scans': scans,
    };
  }
}

/// @nodoc
class ListCodeSecurityIntegrationsResponse {
  /// A list of code security integration summaries.
  final List<CodeSecurityIntegrationSummary>? integrations;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the NextToken value returned from the previous request to
  /// continue listing results after the first page.
  final String? nextToken;

  ListCodeSecurityIntegrationsResponse({
    this.integrations,
    this.nextToken,
  });

  factory ListCodeSecurityIntegrationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCodeSecurityIntegrationsResponse(
      integrations: (json['integrations'] as List?)
          ?.nonNulls
          .map((e) => CodeSecurityIntegrationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integrations = this.integrations;
    final nextToken = this.nextToken;
    return {
      if (integrations != null) 'integrations': integrations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCodeSecurityScanConfigurationAssociationsResponse {
  /// A list of associations between code repositories and scan configurations.
  final List<CodeSecurityScanConfigurationAssociationSummary>? associations;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  final String? nextToken;

  ListCodeSecurityScanConfigurationAssociationsResponse({
    this.associations,
    this.nextToken,
  });

  factory ListCodeSecurityScanConfigurationAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCodeSecurityScanConfigurationAssociationsResponse(
      associations: (json['associations'] as List?)
          ?.nonNulls
          .map((e) => CodeSecurityScanConfigurationAssociationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    final nextToken = this.nextToken;
    return {
      if (associations != null) 'associations': associations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCodeSecurityScanConfigurationsResponse {
  /// A list of code security scan configuration summaries.
  final List<CodeSecurityScanConfigurationSummary>? configurations;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request. For subsequent
  /// calls, use the NextToken value returned from the previous request to
  /// continue listing results after the first page.
  final String? nextToken;

  ListCodeSecurityScanConfigurationsResponse({
    this.configurations,
    this.nextToken,
  });

  factory ListCodeSecurityScanConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCodeSecurityScanConfigurationsResponse(
      configurations: (json['configurations'] as List?)
          ?.nonNulls
          .map((e) => CodeSecurityScanConfigurationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurations = this.configurations;
    final nextToken = this.nextToken;
    return {
      if (configurations != null) 'configurations': configurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCoverageResponse {
  /// An object that contains details on the covered resources in your
  /// environment.
  final List<CoveredResource>? coveredResources;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  final String? nextToken;

  ListCoverageResponse({
    this.coveredResources,
    this.nextToken,
  });

  factory ListCoverageResponse.fromJson(Map<String, dynamic> json) {
    return ListCoverageResponse(
      coveredResources: (json['coveredResources'] as List?)
          ?.nonNulls
          .map((e) => CoveredResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coveredResources = this.coveredResources;
    final nextToken = this.nextToken;
    return {
      if (coveredResources != null) 'coveredResources': coveredResources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListCoverageStatisticsResponse {
  /// The total number for all groups.
  final int totalCounts;

  /// An array with the number for each group.
  final List<Counts>? countsByGroup;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  final String? nextToken;

  ListCoverageStatisticsResponse({
    required this.totalCounts,
    this.countsByGroup,
    this.nextToken,
  });

  factory ListCoverageStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return ListCoverageStatisticsResponse(
      totalCounts: (json['totalCounts'] as int?) ?? 0,
      countsByGroup: (json['countsByGroup'] as List?)
          ?.nonNulls
          .map((e) => Counts.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final totalCounts = this.totalCounts;
    final countsByGroup = this.countsByGroup;
    final nextToken = this.nextToken;
    return {
      'totalCounts': totalCounts,
      if (countsByGroup != null) 'countsByGroup': countsByGroup,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListDelegatedAdminAccountsResponse {
  /// Details of the Amazon Inspector delegated administrator of your
  /// organization.
  final List<DelegatedAdminAccount>? delegatedAdminAccounts;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  final String? nextToken;

  ListDelegatedAdminAccountsResponse({
    this.delegatedAdminAccounts,
    this.nextToken,
  });

  factory ListDelegatedAdminAccountsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDelegatedAdminAccountsResponse(
      delegatedAdminAccounts: (json['delegatedAdminAccounts'] as List?)
          ?.nonNulls
          .map((e) => DelegatedAdminAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final delegatedAdminAccounts = this.delegatedAdminAccounts;
    final nextToken = this.nextToken;
    return {
      if (delegatedAdminAccounts != null)
        'delegatedAdminAccounts': delegatedAdminAccounts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListFiltersResponse {
  /// Contains details on the filters associated with your account.
  final List<Filter> filters;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  final String? nextToken;

  ListFiltersResponse({
    required this.filters,
    this.nextToken,
  });

  factory ListFiltersResponse.fromJson(Map<String, dynamic> json) {
    return ListFiltersResponse(
      filters: ((json['filters'] as List?) ?? const [])
          .nonNulls
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final nextToken = this.nextToken;
    return {
      'filters': filters,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListFindingAggregationsResponse {
  /// The type of aggregation to perform.
  final AggregationType aggregationType;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  final String? nextToken;

  /// Objects that contain the results of an aggregation operation.
  final List<AggregationResponse>? responses;

  ListFindingAggregationsResponse({
    required this.aggregationType,
    this.nextToken,
    this.responses,
  });

  factory ListFindingAggregationsResponse.fromJson(Map<String, dynamic> json) {
    return ListFindingAggregationsResponse(
      aggregationType: AggregationType.fromString(
          (json['aggregationType'] as String?) ?? ''),
      nextToken: json['nextToken'] as String?,
      responses: (json['responses'] as List?)
          ?.nonNulls
          .map((e) => AggregationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationType = this.aggregationType;
    final nextToken = this.nextToken;
    final responses = this.responses;
    return {
      'aggregationType': aggregationType.value,
      if (nextToken != null) 'nextToken': nextToken,
      if (responses != null) 'responses': responses,
    };
  }
}

/// @nodoc
class ListFindingsResponse {
  /// Contains details on the findings in your environment.
  final List<Finding>? findings;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  final String? nextToken;

  ListFindingsResponse({
    this.findings,
    this.nextToken,
  });

  factory ListFindingsResponse.fromJson(Map<String, dynamic> json) {
    return ListFindingsResponse(
      findings: (json['findings'] as List?)
          ?.nonNulls
          .map((e) => Finding.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    final nextToken = this.nextToken;
    return {
      if (findings != null) 'findings': findings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListMembersResponse {
  /// An object that contains details for each member account.
  final List<Member>? members;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  ListMembersResponse({
    this.members,
    this.nextToken,
  });

  factory ListMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListMembersResponse(
      members: (json['members'] as List?)
          ?.nonNulls
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      if (members != null) 'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags associated with the resource.
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

/// @nodoc
class ListUsageTotalsResponse {
  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  /// An object with details on the total usage for the requested account.
  final List<UsageTotal>? totals;

  ListUsageTotalsResponse({
    this.nextToken,
    this.totals,
  });

  factory ListUsageTotalsResponse.fromJson(Map<String, dynamic> json) {
    return ListUsageTotalsResponse(
      nextToken: json['nextToken'] as String?,
      totals: (json['totals'] as List?)
          ?.nonNulls
          .map((e) => UsageTotal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final totals = this.totals;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (totals != null) 'totals': totals,
    };
  }
}

/// @nodoc
class ResetEncryptionKeyResponse {
  ResetEncryptionKeyResponse();

  factory ResetEncryptionKeyResponse.fromJson(Map<String, dynamic> _) {
    return ResetEncryptionKeyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class SearchVulnerabilitiesResponse {
  /// Details about the listed vulnerability.
  final List<Vulnerability> vulnerabilities;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  SearchVulnerabilitiesResponse({
    required this.vulnerabilities,
    this.nextToken,
  });

  factory SearchVulnerabilitiesResponse.fromJson(Map<String, dynamic> json) {
    return SearchVulnerabilitiesResponse(
      vulnerabilities: ((json['vulnerabilities'] as List?) ?? const [])
          .nonNulls
          .map((e) => Vulnerability.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vulnerabilities = this.vulnerabilities;
    final nextToken = this.nextToken;
    return {
      'vulnerabilities': vulnerabilities,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class SendCisSessionHealthResponse {
  SendCisSessionHealthResponse();

  factory SendCisSessionHealthResponse.fromJson(Map<String, dynamic> _) {
    return SendCisSessionHealthResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class SendCisSessionTelemetryResponse {
  SendCisSessionTelemetryResponse();

  factory SendCisSessionTelemetryResponse.fromJson(Map<String, dynamic> _) {
    return SendCisSessionTelemetryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StartCisSessionResponse {
  StartCisSessionResponse();

  factory StartCisSessionResponse.fromJson(Map<String, dynamic> _) {
    return StartCisSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StartCodeSecurityScanResponse {
  /// The unique identifier of the initiated scan.
  final String? scanId;

  /// The current status of the initiated scan.
  final CodeScanStatus? status;

  StartCodeSecurityScanResponse({
    this.scanId,
    this.status,
  });

  factory StartCodeSecurityScanResponse.fromJson(Map<String, dynamic> json) {
    return StartCodeSecurityScanResponse(
      scanId: json['scanId'] as String?,
      status: (json['status'] as String?)?.let(CodeScanStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final scanId = this.scanId;
    final status = this.status;
    return {
      if (scanId != null) 'scanId': scanId,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class StopCisSessionResponse {
  StopCisSessionResponse();

  factory StopCisSessionResponse.fromJson(Map<String, dynamic> _) {
    return StopCisSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateCisScanConfigurationResponse {
  /// The CIS scan configuration ARN.
  final String scanConfigurationArn;

  UpdateCisScanConfigurationResponse({
    required this.scanConfigurationArn,
  });

  factory UpdateCisScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCisScanConfigurationResponse(
      scanConfigurationArn: (json['scanConfigurationArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

/// @nodoc
class UpdateCodeSecurityIntegrationResponse {
  /// The Amazon Resource Name (ARN) of the updated code security integration.
  final String integrationArn;

  /// The current status of the updated code security integration.
  final IntegrationStatus status;

  UpdateCodeSecurityIntegrationResponse({
    required this.integrationArn,
    required this.status,
  });

  factory UpdateCodeSecurityIntegrationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCodeSecurityIntegrationResponse(
      integrationArn: (json['integrationArn'] as String?) ?? '',
      status: IntegrationStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final integrationArn = this.integrationArn;
    final status = this.status;
    return {
      'integrationArn': integrationArn,
      'status': status.value,
    };
  }
}

/// @nodoc
class UpdateCodeSecurityScanConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the updated scan configuration.
  final String? scanConfigurationArn;

  UpdateCodeSecurityScanConfigurationResponse({
    this.scanConfigurationArn,
  });

  factory UpdateCodeSecurityScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCodeSecurityScanConfigurationResponse(
      scanConfigurationArn: json['scanConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      if (scanConfigurationArn != null)
        'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

/// @nodoc
class UpdateConfigurationResponse {
  UpdateConfigurationResponse();

  factory UpdateConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateEc2DeepInspectionConfigurationResponse {
  /// An error message explaining why new Amazon Inspector deep inspection custom
  /// paths could not be added.
  final String? errorMessage;

  /// The current Amazon Inspector deep inspection custom paths for the
  /// organization.
  final List<String>? orgPackagePaths;

  /// The current Amazon Inspector deep inspection custom paths for your account.
  final List<String>? packagePaths;

  /// The status of Amazon Inspector deep inspection in your account.
  final Ec2DeepInspectionStatus? status;

  UpdateEc2DeepInspectionConfigurationResponse({
    this.errorMessage,
    this.orgPackagePaths,
    this.packagePaths,
    this.status,
  });

  factory UpdateEc2DeepInspectionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateEc2DeepInspectionConfigurationResponse(
      errorMessage: json['errorMessage'] as String?,
      orgPackagePaths: (json['orgPackagePaths'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      packagePaths: (json['packagePaths'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status:
          (json['status'] as String?)?.let(Ec2DeepInspectionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final orgPackagePaths = this.orgPackagePaths;
    final packagePaths = this.packagePaths;
    final status = this.status;
    return {
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (orgPackagePaths != null) 'orgPackagePaths': orgPackagePaths,
      if (packagePaths != null) 'packagePaths': packagePaths,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class UpdateEncryptionKeyResponse {
  UpdateEncryptionKeyResponse();

  factory UpdateEncryptionKeyResponse.fromJson(Map<String, dynamic> _) {
    return UpdateEncryptionKeyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateFilterResponse {
  /// The Amazon Resource Number (ARN) of the successfully updated filter.
  final String arn;

  UpdateFilterResponse({
    required this.arn,
  });

  factory UpdateFilterResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFilterResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class UpdateOrganizationConfigurationResponse {
  /// The updated status of scan types automatically enabled for new members of
  /// your Amazon Inspector organization.
  final AutoEnable autoEnable;

  UpdateOrganizationConfigurationResponse({
    required this.autoEnable,
  });

  factory UpdateOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateOrganizationConfigurationResponse(
      autoEnable: AutoEnable.fromJson(
          (json['autoEnable'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    return {
      'autoEnable': autoEnable,
    };
  }
}

/// @nodoc
class UpdateOrgEc2DeepInspectionConfigurationResponse {
  UpdateOrgEc2DeepInspectionConfigurationResponse();

  factory UpdateOrgEc2DeepInspectionConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateOrgEc2DeepInspectionConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents which scan types are automatically enabled for new members of
/// your Amazon Inspector organization.
///
/// @nodoc
class AutoEnable {
  /// Represents whether Amazon EC2 scans are automatically enabled for new
  /// members of your Amazon Inspector organization.
  final bool ec2;

  /// Represents whether Amazon ECR scans are automatically enabled for new
  /// members of your Amazon Inspector organization.
  final bool ecr;

  /// Represents whether code repository scans are automatically enabled for new
  /// members of your Amazon Inspector organization.
  final bool? codeRepository;

  /// Represents whether Amazon Web Services Lambda standard scans are
  /// automatically enabled for new members of your Amazon Inspector organization.
  final bool? lambda;

  /// Represents whether Lambda code scans are automatically enabled for new
  /// members of your Amazon Inspector organization.
  final bool? lambdaCode;

  AutoEnable({
    required this.ec2,
    required this.ecr,
    this.codeRepository,
    this.lambda,
    this.lambdaCode,
  });

  factory AutoEnable.fromJson(Map<String, dynamic> json) {
    return AutoEnable(
      ec2: (json['ec2'] as bool?) ?? false,
      ecr: (json['ecr'] as bool?) ?? false,
      codeRepository: json['codeRepository'] as bool?,
      lambda: json['lambda'] as bool?,
      lambdaCode: json['lambdaCode'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final ec2 = this.ec2;
    final ecr = this.ecr;
    final codeRepository = this.codeRepository;
    final lambda = this.lambda;
    final lambdaCode = this.lambdaCode;
    return {
      'ec2': ec2,
      'ecr': ecr,
      if (codeRepository != null) 'codeRepository': codeRepository,
      if (lambda != null) 'lambda': lambda,
      if (lambdaCode != null) 'lambdaCode': lambdaCode,
    };
  }
}

/// @nodoc
class FilterAction {
  static const none = FilterAction._('NONE');
  static const suppress = FilterAction._('SUPPRESS');

  final String value;

  const FilterAction._(this.value);

  static const values = [none, suppress];

  static FilterAction fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FilterAction._(value));

  @override
  bool operator ==(other) => other is FilterAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details on the criteria used to define the filter.
///
/// @nodoc
class FilterCriteria {
  /// Details of the Amazon Web Services account IDs used to filter findings.
  final List<StringFilter>? awsAccountId;

  /// Filter criteria for findings based on the project name in a code repository.
  final List<StringFilter>? codeRepositoryProjectName;

  /// Filter criteria for findings based on the repository provider type (such as
  /// GitHub, GitLab, etc.).
  final List<StringFilter>? codeRepositoryProviderType;

  /// The name of the detector used to identify a code vulnerability in a Lambda
  /// function used to filter findings.
  final List<StringFilter>? codeVulnerabilityDetectorName;

  /// The detector type tag associated with the vulnerability used to filter
  /// findings. Detector tags group related vulnerabilities by common themes or
  /// tactics. For a list of available tags by programming language, see <a
  /// href="https://docs.aws.amazon.com/codeguru/detector-library/java/tags/">Java
  /// tags</a>, or <a
  /// href="https://docs.aws.amazon.com/codeguru/detector-library/python/tags/">Python
  /// tags</a>.
  final List<StringFilter>? codeVulnerabilityDetectorTags;

  /// The file path to the file in a Lambda function that contains a code
  /// vulnerability used to filter findings.
  final List<StringFilter>? codeVulnerabilityFilePath;

  /// Details of the component IDs used to filter findings.
  final List<StringFilter>? componentId;

  /// Details of the component types used to filter findings.
  final List<StringFilter>? componentType;

  /// Details of the Amazon EC2 instance image IDs used to filter findings.
  final List<StringFilter>? ec2InstanceImageId;

  /// Details of the Amazon EC2 instance subnet IDs used to filter findings.
  final List<StringFilter>? ec2InstanceSubnetId;

  /// Details of the Amazon EC2 instance VPC IDs used to filter findings.
  final List<StringFilter>? ec2InstanceVpcId;

  /// Details of the Amazon ECR image architecture types used to filter findings.
  final List<StringFilter>? ecrImageArchitecture;

  /// Details of the Amazon ECR image hashes used to filter findings.
  final List<StringFilter>? ecrImageHash;

  /// Filter criteria indicating when details for an Amazon ECR image include when
  /// an Amazon ECR image is in use.
  final List<NumberFilter>? ecrImageInUseCount;

  /// Filter criteria indicating when an Amazon ECR image was last used in an
  /// Amazon ECS cluster task or Amazon EKS cluster pod.
  final List<DateFilter>? ecrImageLastInUseAt;

  /// Details on the Amazon ECR image push date and time used to filter findings.
  final List<DateFilter>? ecrImagePushedAt;

  /// Details on the Amazon ECR registry used to filter findings.
  final List<StringFilter>? ecrImageRegistry;

  /// Details on the name of the Amazon ECR repository used to filter findings.
  final List<StringFilter>? ecrImageRepositoryName;

  /// The tags attached to the Amazon ECR container image.
  final List<StringFilter>? ecrImageTags;

  /// The EPSS score used to filter findings.
  final List<NumberFilter>? epssScore;

  /// Filters the list of Amazon Web Services Lambda findings by the availability
  /// of exploits.
  final List<StringFilter>? exploitAvailable;

  /// Details on the finding ARNs used to filter findings.
  final List<StringFilter>? findingArn;

  /// Details on the finding status types used to filter findings.
  final List<StringFilter>? findingStatus;

  /// Details on the finding types used to filter findings.
  final List<StringFilter>? findingType;

  /// Details on the date and time a finding was first seen used to filter
  /// findings.
  final List<DateFilter>? firstObservedAt;

  /// Details on whether a fix is available through a version update. This value
  /// can be <code>YES</code>, <code>NO</code>, or <code>PARTIAL</code>. A
  /// <code>PARTIAL</code> fix means that some, but not all, of the packages
  /// identified in the finding have fixes available through updated versions.
  final List<StringFilter>? fixAvailable;

  /// The Amazon Inspector score to filter on.
  final List<NumberFilter>? inspectorScore;

  /// Filters the list of Amazon Web Services Lambda functions by execution role.
  final List<StringFilter>? lambdaFunctionExecutionRoleArn;

  /// Filters the list of Amazon Web Services Lambda functions by the date and
  /// time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>
  final List<DateFilter>? lambdaFunctionLastModifiedAt;

  /// Filters the list of Amazon Web Services Lambda functions by the function's
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">
  /// layers</a>. A Lambda function can have up to five layers.
  final List<StringFilter>? lambdaFunctionLayers;

  /// Filters the list of Amazon Web Services Lambda functions by the name of the
  /// function.
  final List<StringFilter>? lambdaFunctionName;

  /// Filters the list of Amazon Web Services Lambda functions by the runtime
  /// environment for the Lambda function.
  final List<StringFilter>? lambdaFunctionRuntime;

  /// Details on the date and time a finding was last seen used to filter
  /// findings.
  final List<DateFilter>? lastObservedAt;

  /// Details on network protocol used to filter findings.
  final List<StringFilter>? networkProtocol;

  /// Details on the port ranges used to filter findings.
  final List<PortRangeFilter>? portRange;

  /// Details on the related vulnerabilities used to filter findings.
  final List<StringFilter>? relatedVulnerabilities;

  /// Details on the resource IDs used to filter findings.
  final List<StringFilter>? resourceId;

  /// Details on the resource tags used to filter findings.
  final List<MapFilter>? resourceTags;

  /// Details on the resource types used to filter findings.
  final List<StringFilter>? resourceType;

  /// Details on the severity used to filter findings.
  final List<StringFilter>? severity;

  /// Details on the finding title used to filter findings.
  final List<StringFilter>? title;

  /// Details on the date and time a finding was last updated at used to filter
  /// findings.
  final List<DateFilter>? updatedAt;

  /// Details on the vendor severity used to filter findings.
  final List<StringFilter>? vendorSeverity;

  /// Details on the vulnerability ID used to filter findings.
  final List<StringFilter>? vulnerabilityId;

  /// Details on the vulnerability type used to filter findings.
  final List<StringFilter>? vulnerabilitySource;

  /// Details on the vulnerable packages used to filter findings.
  final List<PackageFilter>? vulnerablePackages;

  FilterCriteria({
    this.awsAccountId,
    this.codeRepositoryProjectName,
    this.codeRepositoryProviderType,
    this.codeVulnerabilityDetectorName,
    this.codeVulnerabilityDetectorTags,
    this.codeVulnerabilityFilePath,
    this.componentId,
    this.componentType,
    this.ec2InstanceImageId,
    this.ec2InstanceSubnetId,
    this.ec2InstanceVpcId,
    this.ecrImageArchitecture,
    this.ecrImageHash,
    this.ecrImageInUseCount,
    this.ecrImageLastInUseAt,
    this.ecrImagePushedAt,
    this.ecrImageRegistry,
    this.ecrImageRepositoryName,
    this.ecrImageTags,
    this.epssScore,
    this.exploitAvailable,
    this.findingArn,
    this.findingStatus,
    this.findingType,
    this.firstObservedAt,
    this.fixAvailable,
    this.inspectorScore,
    this.lambdaFunctionExecutionRoleArn,
    this.lambdaFunctionLastModifiedAt,
    this.lambdaFunctionLayers,
    this.lambdaFunctionName,
    this.lambdaFunctionRuntime,
    this.lastObservedAt,
    this.networkProtocol,
    this.portRange,
    this.relatedVulnerabilities,
    this.resourceId,
    this.resourceTags,
    this.resourceType,
    this.severity,
    this.title,
    this.updatedAt,
    this.vendorSeverity,
    this.vulnerabilityId,
    this.vulnerabilitySource,
    this.vulnerablePackages,
  });

  factory FilterCriteria.fromJson(Map<String, dynamic> json) {
    return FilterCriteria(
      awsAccountId: (json['awsAccountId'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      codeRepositoryProjectName: (json['codeRepositoryProjectName'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      codeRepositoryProviderType: (json['codeRepositoryProviderType'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      codeVulnerabilityDetectorName:
          (json['codeVulnerabilityDetectorName'] as List?)
              ?.nonNulls
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      codeVulnerabilityDetectorTags:
          (json['codeVulnerabilityDetectorTags'] as List?)
              ?.nonNulls
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      codeVulnerabilityFilePath: (json['codeVulnerabilityFilePath'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      componentId: (json['componentId'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      componentType: (json['componentType'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceImageId: (json['ec2InstanceImageId'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceSubnetId: (json['ec2InstanceSubnetId'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceVpcId: (json['ec2InstanceVpcId'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageArchitecture: (json['ecrImageArchitecture'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageHash: (json['ecrImageHash'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageInUseCount: (json['ecrImageInUseCount'] as List?)
          ?.nonNulls
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageLastInUseAt: (json['ecrImageLastInUseAt'] as List?)
          ?.nonNulls
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImagePushedAt: (json['ecrImagePushedAt'] as List?)
          ?.nonNulls
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageRegistry: (json['ecrImageRegistry'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageRepositoryName: (json['ecrImageRepositoryName'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageTags: (json['ecrImageTags'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      epssScore: (json['epssScore'] as List?)
          ?.nonNulls
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      exploitAvailable: (json['exploitAvailable'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      findingArn: (json['findingArn'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      findingStatus: (json['findingStatus'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      findingType: (json['findingType'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstObservedAt: (json['firstObservedAt'] as List?)
          ?.nonNulls
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      fixAvailable: (json['fixAvailable'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      inspectorScore: (json['inspectorScore'] as List?)
          ?.nonNulls
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaFunctionExecutionRoleArn:
          (json['lambdaFunctionExecutionRoleArn'] as List?)
              ?.nonNulls
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      lambdaFunctionLastModifiedAt:
          (json['lambdaFunctionLastModifiedAt'] as List?)
              ?.nonNulls
              .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      lambdaFunctionLayers: (json['lambdaFunctionLayers'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaFunctionName: (json['lambdaFunctionName'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaFunctionRuntime: (json['lambdaFunctionRuntime'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastObservedAt: (json['lastObservedAt'] as List?)
          ?.nonNulls
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkProtocol: (json['networkProtocol'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      portRange: (json['portRange'] as List?)
          ?.nonNulls
          .map((e) => PortRangeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedVulnerabilities: (json['relatedVulnerabilities'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceId: (json['resourceId'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceTags: (json['resourceTags'] as List?)
          ?.nonNulls
          .map((e) => MapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['resourceType'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      severity: (json['severity'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: (json['title'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: (json['updatedAt'] as List?)
          ?.nonNulls
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      vendorSeverity: (json['vendorSeverity'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      vulnerabilityId: (json['vulnerabilityId'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      vulnerabilitySource: (json['vulnerabilitySource'] as List?)
          ?.nonNulls
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      vulnerablePackages: (json['vulnerablePackages'] as List?)
          ?.nonNulls
          .map((e) => PackageFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final codeRepositoryProjectName = this.codeRepositoryProjectName;
    final codeRepositoryProviderType = this.codeRepositoryProviderType;
    final codeVulnerabilityDetectorName = this.codeVulnerabilityDetectorName;
    final codeVulnerabilityDetectorTags = this.codeVulnerabilityDetectorTags;
    final codeVulnerabilityFilePath = this.codeVulnerabilityFilePath;
    final componentId = this.componentId;
    final componentType = this.componentType;
    final ec2InstanceImageId = this.ec2InstanceImageId;
    final ec2InstanceSubnetId = this.ec2InstanceSubnetId;
    final ec2InstanceVpcId = this.ec2InstanceVpcId;
    final ecrImageArchitecture = this.ecrImageArchitecture;
    final ecrImageHash = this.ecrImageHash;
    final ecrImageInUseCount = this.ecrImageInUseCount;
    final ecrImageLastInUseAt = this.ecrImageLastInUseAt;
    final ecrImagePushedAt = this.ecrImagePushedAt;
    final ecrImageRegistry = this.ecrImageRegistry;
    final ecrImageRepositoryName = this.ecrImageRepositoryName;
    final ecrImageTags = this.ecrImageTags;
    final epssScore = this.epssScore;
    final exploitAvailable = this.exploitAvailable;
    final findingArn = this.findingArn;
    final findingStatus = this.findingStatus;
    final findingType = this.findingType;
    final firstObservedAt = this.firstObservedAt;
    final fixAvailable = this.fixAvailable;
    final inspectorScore = this.inspectorScore;
    final lambdaFunctionExecutionRoleArn = this.lambdaFunctionExecutionRoleArn;
    final lambdaFunctionLastModifiedAt = this.lambdaFunctionLastModifiedAt;
    final lambdaFunctionLayers = this.lambdaFunctionLayers;
    final lambdaFunctionName = this.lambdaFunctionName;
    final lambdaFunctionRuntime = this.lambdaFunctionRuntime;
    final lastObservedAt = this.lastObservedAt;
    final networkProtocol = this.networkProtocol;
    final portRange = this.portRange;
    final relatedVulnerabilities = this.relatedVulnerabilities;
    final resourceId = this.resourceId;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final severity = this.severity;
    final title = this.title;
    final updatedAt = this.updatedAt;
    final vendorSeverity = this.vendorSeverity;
    final vulnerabilityId = this.vulnerabilityId;
    final vulnerabilitySource = this.vulnerabilitySource;
    final vulnerablePackages = this.vulnerablePackages;
    return {
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (codeRepositoryProjectName != null)
        'codeRepositoryProjectName': codeRepositoryProjectName,
      if (codeRepositoryProviderType != null)
        'codeRepositoryProviderType': codeRepositoryProviderType,
      if (codeVulnerabilityDetectorName != null)
        'codeVulnerabilityDetectorName': codeVulnerabilityDetectorName,
      if (codeVulnerabilityDetectorTags != null)
        'codeVulnerabilityDetectorTags': codeVulnerabilityDetectorTags,
      if (codeVulnerabilityFilePath != null)
        'codeVulnerabilityFilePath': codeVulnerabilityFilePath,
      if (componentId != null) 'componentId': componentId,
      if (componentType != null) 'componentType': componentType,
      if (ec2InstanceImageId != null) 'ec2InstanceImageId': ec2InstanceImageId,
      if (ec2InstanceSubnetId != null)
        'ec2InstanceSubnetId': ec2InstanceSubnetId,
      if (ec2InstanceVpcId != null) 'ec2InstanceVpcId': ec2InstanceVpcId,
      if (ecrImageArchitecture != null)
        'ecrImageArchitecture': ecrImageArchitecture,
      if (ecrImageHash != null) 'ecrImageHash': ecrImageHash,
      if (ecrImageInUseCount != null) 'ecrImageInUseCount': ecrImageInUseCount,
      if (ecrImageLastInUseAt != null)
        'ecrImageLastInUseAt': ecrImageLastInUseAt,
      if (ecrImagePushedAt != null) 'ecrImagePushedAt': ecrImagePushedAt,
      if (ecrImageRegistry != null) 'ecrImageRegistry': ecrImageRegistry,
      if (ecrImageRepositoryName != null)
        'ecrImageRepositoryName': ecrImageRepositoryName,
      if (ecrImageTags != null) 'ecrImageTags': ecrImageTags,
      if (epssScore != null) 'epssScore': epssScore,
      if (exploitAvailable != null) 'exploitAvailable': exploitAvailable,
      if (findingArn != null) 'findingArn': findingArn,
      if (findingStatus != null) 'findingStatus': findingStatus,
      if (findingType != null) 'findingType': findingType,
      if (firstObservedAt != null) 'firstObservedAt': firstObservedAt,
      if (fixAvailable != null) 'fixAvailable': fixAvailable,
      if (inspectorScore != null) 'inspectorScore': inspectorScore,
      if (lambdaFunctionExecutionRoleArn != null)
        'lambdaFunctionExecutionRoleArn': lambdaFunctionExecutionRoleArn,
      if (lambdaFunctionLastModifiedAt != null)
        'lambdaFunctionLastModifiedAt': lambdaFunctionLastModifiedAt,
      if (lambdaFunctionLayers != null)
        'lambdaFunctionLayers': lambdaFunctionLayers,
      if (lambdaFunctionName != null) 'lambdaFunctionName': lambdaFunctionName,
      if (lambdaFunctionRuntime != null)
        'lambdaFunctionRuntime': lambdaFunctionRuntime,
      if (lastObservedAt != null) 'lastObservedAt': lastObservedAt,
      if (networkProtocol != null) 'networkProtocol': networkProtocol,
      if (portRange != null) 'portRange': portRange,
      if (relatedVulnerabilities != null)
        'relatedVulnerabilities': relatedVulnerabilities,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (resourceType != null) 'resourceType': resourceType,
      if (severity != null) 'severity': severity,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': updatedAt,
      if (vendorSeverity != null) 'vendorSeverity': vendorSeverity,
      if (vulnerabilityId != null) 'vulnerabilityId': vulnerabilityId,
      if (vulnerabilitySource != null)
        'vulnerabilitySource': vulnerabilitySource,
      if (vulnerablePackages != null) 'vulnerablePackages': vulnerablePackages,
    };
  }
}

/// Contains information on the details of a package filter.
///
/// @nodoc
class PackageFilter {
  /// An object that contains details on the package architecture type to filter
  /// on.
  final StringFilter? architecture;

  /// An object that contains details on the package epoch to filter on.
  final NumberFilter? epoch;

  /// An object that contains details on the package file path to filter on.
  final StringFilter? filePath;

  /// An object that contains details on the name of the package to filter on.
  final StringFilter? name;

  /// An object that contains details on the package release to filter on.
  final StringFilter? release;

  /// An object that describes the details of a string filter.
  final StringFilter? sourceLambdaLayerArn;

  /// An object that contains details on the source layer hash to filter on.
  final StringFilter? sourceLayerHash;

  /// The package version to filter on.
  final StringFilter? version;

  PackageFilter({
    this.architecture,
    this.epoch,
    this.filePath,
    this.name,
    this.release,
    this.sourceLambdaLayerArn,
    this.sourceLayerHash,
    this.version,
  });

  factory PackageFilter.fromJson(Map<String, dynamic> json) {
    return PackageFilter(
      architecture: json['architecture'] != null
          ? StringFilter.fromJson(json['architecture'] as Map<String, dynamic>)
          : null,
      epoch: json['epoch'] != null
          ? NumberFilter.fromJson(json['epoch'] as Map<String, dynamic>)
          : null,
      filePath: json['filePath'] != null
          ? StringFilter.fromJson(json['filePath'] as Map<String, dynamic>)
          : null,
      name: json['name'] != null
          ? StringFilter.fromJson(json['name'] as Map<String, dynamic>)
          : null,
      release: json['release'] != null
          ? StringFilter.fromJson(json['release'] as Map<String, dynamic>)
          : null,
      sourceLambdaLayerArn: json['sourceLambdaLayerArn'] != null
          ? StringFilter.fromJson(
              json['sourceLambdaLayerArn'] as Map<String, dynamic>)
          : null,
      sourceLayerHash: json['sourceLayerHash'] != null
          ? StringFilter.fromJson(
              json['sourceLayerHash'] as Map<String, dynamic>)
          : null,
      version: json['version'] != null
          ? StringFilter.fromJson(json['version'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final epoch = this.epoch;
    final filePath = this.filePath;
    final name = this.name;
    final release = this.release;
    final sourceLambdaLayerArn = this.sourceLambdaLayerArn;
    final sourceLayerHash = this.sourceLayerHash;
    final version = this.version;
    return {
      if (architecture != null) 'architecture': architecture,
      if (epoch != null) 'epoch': epoch,
      if (filePath != null) 'filePath': filePath,
      if (name != null) 'name': name,
      if (release != null) 'release': release,
      if (sourceLambdaLayerArn != null)
        'sourceLambdaLayerArn': sourceLambdaLayerArn,
      if (sourceLayerHash != null) 'sourceLayerHash': sourceLayerHash,
      if (version != null) 'version': version,
    };
  }
}

/// An object that describes the details of a string filter.
///
/// @nodoc
class StringFilter {
  /// The operator to use when comparing values in the filter.
  final StringComparison comparison;

  /// The value to filter on.
  final String value;

  StringFilter({
    required this.comparison,
    required this.value,
  });

  factory StringFilter.fromJson(Map<String, dynamic> json) {
    return StringFilter(
      comparison:
          StringComparison.fromString((json['comparison'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'value': value,
    };
  }
}

/// An object that describes the details of a number filter.
///
/// @nodoc
class NumberFilter {
  /// The lowest number to be included in the filter.
  final double? lowerInclusive;

  /// The highest number to be included in the filter.
  final double? upperInclusive;

  NumberFilter({
    this.lowerInclusive,
    this.upperInclusive,
  });

  factory NumberFilter.fromJson(Map<String, dynamic> json) {
    return NumberFilter(
      lowerInclusive: _s.parseJsonDouble(json['lowerInclusive']),
      upperInclusive: _s.parseJsonDouble(json['upperInclusive']),
    );
  }

  Map<String, dynamic> toJson() {
    final lowerInclusive = this.lowerInclusive;
    final upperInclusive = this.upperInclusive;
    return {
      if (lowerInclusive != null)
        'lowerInclusive': _s.encodeJsonDouble(lowerInclusive),
      if (upperInclusive != null)
        'upperInclusive': _s.encodeJsonDouble(upperInclusive),
    };
  }
}

/// @nodoc
class StringComparison {
  static const equals = StringComparison._('EQUALS');
  static const prefix = StringComparison._('PREFIX');
  static const notEquals = StringComparison._('NOT_EQUALS');

  final String value;

  const StringComparison._(this.value);

  static const values = [equals, prefix, notEquals];

  static StringComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StringComparison._(value));

  @override
  bool operator ==(other) => other is StringComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that describes the details of a port range filter.
///
/// @nodoc
class PortRangeFilter {
  /// The port number the port range begins at.
  final int? beginInclusive;

  /// The port number the port range ends at.
  final int? endInclusive;

  PortRangeFilter({
    this.beginInclusive,
    this.endInclusive,
  });

  factory PortRangeFilter.fromJson(Map<String, dynamic> json) {
    return PortRangeFilter(
      beginInclusive: json['beginInclusive'] as int?,
      endInclusive: json['endInclusive'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginInclusive = this.beginInclusive;
    final endInclusive = this.endInclusive;
    return {
      if (beginInclusive != null) 'beginInclusive': beginInclusive,
      if (endInclusive != null) 'endInclusive': endInclusive,
    };
  }
}

/// An object that describes details of a map filter.
///
/// @nodoc
class MapFilter {
  /// The operator to use when comparing values in the filter.
  final MapComparison comparison;

  /// The tag key used in the filter.
  final String key;

  /// The tag value used in the filter.
  final String? value;

  MapFilter({
    required this.comparison,
    required this.key,
    this.value,
  });

  factory MapFilter.fromJson(Map<String, dynamic> json) {
    return MapFilter(
      comparison:
          MapComparison.fromString((json['comparison'] as String?) ?? ''),
      key: (json['key'] as String?) ?? '',
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final key = this.key;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class MapComparison {
  static const equals = MapComparison._('EQUALS');

  final String value;

  const MapComparison._(this.value);

  static const values = [equals];

  static MapComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MapComparison._(value));

  @override
  bool operator ==(other) => other is MapComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details on the time range used to filter findings.
///
/// @nodoc
class DateFilter {
  /// A timestamp representing the end of the time period filtered on.
  final DateTime? endInclusive;

  /// A timestamp representing the start of the time period filtered on.
  final DateTime? startInclusive;

  DateFilter({
    this.endInclusive,
    this.startInclusive,
  });

  factory DateFilter.fromJson(Map<String, dynamic> json) {
    return DateFilter(
      endInclusive: timeStampFromJson(json['endInclusive']),
      startInclusive: timeStampFromJson(json['startInclusive']),
    );
  }

  Map<String, dynamic> toJson() {
    final endInclusive = this.endInclusive;
    final startInclusive = this.startInclusive;
    return {
      if (endInclusive != null)
        'endInclusive': unixTimestampToJson(endInclusive),
      if (startInclusive != null)
        'startInclusive': unixTimestampToJson(startInclusive),
    };
  }
}

/// @nodoc
class ScanType {
  static const network = ScanType._('NETWORK');
  static const package = ScanType._('PACKAGE');
  static const code = ScanType._('CODE');

  final String value;

  const ScanType._(this.value);

  static const values = [network, package, code];

  static ScanType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScanType._(value));

  @override
  bool operator ==(other) => other is ScanType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResourceType {
  static const awsEc2Instance = ResourceType._('AWS_EC2_INSTANCE');
  static const awsEcrContainerImage = ResourceType._('AWS_ECR_CONTAINER_IMAGE');
  static const awsEcrRepository = ResourceType._('AWS_ECR_REPOSITORY');
  static const awsLambdaFunction = ResourceType._('AWS_LAMBDA_FUNCTION');
  static const codeRepository = ResourceType._('CODE_REPOSITORY');

  final String value;

  const ResourceType._(this.value);

  static const values = [
    awsEc2Instance,
    awsEcrContainerImage,
    awsEcrRepository,
    awsLambdaFunction,
    codeRepository
  ];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Ec2DeepInspectionStatus {
  static const activated = Ec2DeepInspectionStatus._('ACTIVATED');
  static const deactivated = Ec2DeepInspectionStatus._('DEACTIVATED');
  static const pending = Ec2DeepInspectionStatus._('PENDING');
  static const failed = Ec2DeepInspectionStatus._('FAILED');

  final String value;

  const Ec2DeepInspectionStatus._(this.value);

  static const values = [activated, deactivated, pending, failed];

  static Ec2DeepInspectionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => Ec2DeepInspectionStatus._(value));

  @override
  bool operator ==(other) =>
      other is Ec2DeepInspectionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the ECR automated re-scan duration setting for your
/// environment.
///
/// @nodoc
class EcrConfiguration {
  /// The rescan duration configured for image push date.
  final EcrRescanDuration rescanDuration;

  /// The rescan duration configured for image pull date.
  final EcrPullDateRescanDuration? pullDateRescanDuration;

  /// The pull date for the re-scan mode.
  final EcrPullDateRescanMode? pullDateRescanMode;

  EcrConfiguration({
    required this.rescanDuration,
    this.pullDateRescanDuration,
    this.pullDateRescanMode,
  });

  Map<String, dynamic> toJson() {
    final rescanDuration = this.rescanDuration;
    final pullDateRescanDuration = this.pullDateRescanDuration;
    final pullDateRescanMode = this.pullDateRescanMode;
    return {
      'rescanDuration': rescanDuration.value,
      if (pullDateRescanDuration != null)
        'pullDateRescanDuration': pullDateRescanDuration.value,
      if (pullDateRescanMode != null)
        'pullDateRescanMode': pullDateRescanMode.value,
    };
  }
}

/// Enables agent-based scanning, which scans instances that are not managed by
/// SSM.
///
/// @nodoc
class Ec2Configuration {
  /// The scan method that is applied to the instance.
  final Ec2ScanMode scanMode;

  /// Whether to activate Amazon Inspector VM scanner for Amazon EC2 scanning.
  final bool? activateVMScanner;

  Ec2Configuration({
    required this.scanMode,
    this.activateVMScanner,
  });

  Map<String, dynamic> toJson() {
    final scanMode = this.scanMode;
    final activateVMScanner = this.activateVMScanner;
    return {
      'scanMode': scanMode.value,
      if (activateVMScanner != null) 'activateVMScanner': activateVMScanner,
    };
  }
}

/// @nodoc
class Ec2ScanMode {
  static const ec2SsmAgentBased = Ec2ScanMode._('EC2_SSM_AGENT_BASED');
  static const ec2Hybrid = Ec2ScanMode._('EC2_HYBRID');

  final String value;

  const Ec2ScanMode._(this.value);

  static const values = [ec2SsmAgentBased, ec2Hybrid];

  static Ec2ScanMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Ec2ScanMode._(value));

  @override
  bool operator ==(other) => other is Ec2ScanMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EcrRescanDuration {
  static const lifetime = EcrRescanDuration._('LIFETIME');
  static const days_30 = EcrRescanDuration._('DAYS_30');
  static const days_180 = EcrRescanDuration._('DAYS_180');
  static const days_14 = EcrRescanDuration._('DAYS_14');
  static const days_60 = EcrRescanDuration._('DAYS_60');
  static const days_90 = EcrRescanDuration._('DAYS_90');

  final String value;

  const EcrRescanDuration._(this.value);

  static const values = [
    lifetime,
    days_30,
    days_180,
    days_14,
    days_60,
    days_90
  ];

  static EcrRescanDuration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EcrRescanDuration._(value));

  @override
  bool operator ==(other) => other is EcrRescanDuration && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EcrPullDateRescanDuration {
  static const days_14 = EcrPullDateRescanDuration._('DAYS_14');
  static const days_30 = EcrPullDateRescanDuration._('DAYS_30');
  static const days_60 = EcrPullDateRescanDuration._('DAYS_60');
  static const days_90 = EcrPullDateRescanDuration._('DAYS_90');
  static const days_180 = EcrPullDateRescanDuration._('DAYS_180');

  final String value;

  const EcrPullDateRescanDuration._(this.value);

  static const values = [days_14, days_30, days_60, days_90, days_180];

  static EcrPullDateRescanDuration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EcrPullDateRescanDuration._(value));

  @override
  bool operator ==(other) =>
      other is EcrPullDateRescanDuration && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EcrPullDateRescanMode {
  static const lastPullDate = EcrPullDateRescanMode._('LAST_PULL_DATE');
  static const lastInUseAt = EcrPullDateRescanMode._('LAST_IN_USE_AT');

  final String value;

  const EcrPullDateRescanMode._(this.value);

  static const values = [lastPullDate, lastInUseAt];

  static EcrPullDateRescanMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EcrPullDateRescanMode._(value));

  @override
  bool operator ==(other) =>
      other is EcrPullDateRescanMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the configuration settings for code security scans.
///
/// @nodoc
class CodeSecurityScanConfiguration {
  /// The categories of security rules to be applied during the scan.
  final List<RuleSetCategory> ruleSetCategories;

  /// Configuration settings for continuous integration scans that run
  /// automatically when code changes are made.
  final ContinuousIntegrationScanConfiguration?
      continuousIntegrationScanConfiguration;

  /// Configuration settings for periodic scans that run on a scheduled basis.
  final PeriodicScanConfiguration? periodicScanConfiguration;

  CodeSecurityScanConfiguration({
    required this.ruleSetCategories,
    this.continuousIntegrationScanConfiguration,
    this.periodicScanConfiguration,
  });

  factory CodeSecurityScanConfiguration.fromJson(Map<String, dynamic> json) {
    return CodeSecurityScanConfiguration(
      ruleSetCategories: ((json['ruleSetCategories'] as List?) ?? const [])
          .nonNulls
          .map((e) => RuleSetCategory.fromString((e as String)))
          .toList(),
      continuousIntegrationScanConfiguration:
          json['continuousIntegrationScanConfiguration'] != null
              ? ContinuousIntegrationScanConfiguration.fromJson(
                  json['continuousIntegrationScanConfiguration']
                      as Map<String, dynamic>)
              : null,
      periodicScanConfiguration: json['periodicScanConfiguration'] != null
          ? PeriodicScanConfiguration.fromJson(
              json['periodicScanConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleSetCategories = this.ruleSetCategories;
    final continuousIntegrationScanConfiguration =
        this.continuousIntegrationScanConfiguration;
    final periodicScanConfiguration = this.periodicScanConfiguration;
    return {
      'ruleSetCategories': ruleSetCategories.map((e) => e.value).toList(),
      if (continuousIntegrationScanConfiguration != null)
        'continuousIntegrationScanConfiguration':
            continuousIntegrationScanConfiguration,
      if (periodicScanConfiguration != null)
        'periodicScanConfiguration': periodicScanConfiguration,
    };
  }
}

/// Configuration settings for periodic scans that run on a scheduled basis.
///
/// @nodoc
class PeriodicScanConfiguration {
  /// The frequency at which periodic scans are performed (such as weekly or
  /// monthly).
  ///
  /// If you don't provide the <code>frequencyExpression</code> Amazon Inspector
  /// chooses day for the scan to run. If you provide the
  /// <code>frequencyExpression</code>, the schedule must match the specified
  /// <code>frequency</code>.
  final PeriodicScanFrequency? frequency;

  /// The schedule expression for periodic scans, in cron format.
  final String? frequencyExpression;

  PeriodicScanConfiguration({
    this.frequency,
    this.frequencyExpression,
  });

  factory PeriodicScanConfiguration.fromJson(Map<String, dynamic> json) {
    return PeriodicScanConfiguration(
      frequency:
          (json['frequency'] as String?)?.let(PeriodicScanFrequency.fromString),
      frequencyExpression: json['frequencyExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final frequency = this.frequency;
    final frequencyExpression = this.frequencyExpression;
    return {
      if (frequency != null) 'frequency': frequency.value,
      if (frequencyExpression != null)
        'frequencyExpression': frequencyExpression,
    };
  }
}

/// Configuration settings for continuous integration scans that run
/// automatically when code changes are made.
///
/// @nodoc
class ContinuousIntegrationScanConfiguration {
  /// The repository events that trigger continuous integration scans, such as
  /// pull requests or commits.
  final List<ContinuousIntegrationScanEvent> supportedEvents;

  ContinuousIntegrationScanConfiguration({
    required this.supportedEvents,
  });

  factory ContinuousIntegrationScanConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ContinuousIntegrationScanConfiguration(
      supportedEvents: ((json['supportedEvents'] as List?) ?? const [])
          .nonNulls
          .map((e) => ContinuousIntegrationScanEvent.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final supportedEvents = this.supportedEvents;
    return {
      'supportedEvents': supportedEvents.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class RuleSetCategory {
  static const sast = RuleSetCategory._('SAST');
  static const iac = RuleSetCategory._('IAC');
  static const sca = RuleSetCategory._('SCA');

  final String value;

  const RuleSetCategory._(this.value);

  static const values = [sast, iac, sca];

  static RuleSetCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleSetCategory._(value));

  @override
  bool operator ==(other) => other is RuleSetCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ContinuousIntegrationScanEvent {
  static const pullRequest = ContinuousIntegrationScanEvent._('PULL_REQUEST');
  static const push = ContinuousIntegrationScanEvent._('PUSH');

  final String value;

  const ContinuousIntegrationScanEvent._(this.value);

  static const values = [pullRequest, push];

  static ContinuousIntegrationScanEvent fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContinuousIntegrationScanEvent._(value));

  @override
  bool operator ==(other) =>
      other is ContinuousIntegrationScanEvent && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PeriodicScanFrequency {
  static const weekly = PeriodicScanFrequency._('WEEKLY');
  static const monthly = PeriodicScanFrequency._('MONTHLY');
  static const never = PeriodicScanFrequency._('NEVER');

  final String value;

  const PeriodicScanFrequency._(this.value);

  static const values = [weekly, monthly, never];

  static PeriodicScanFrequency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PeriodicScanFrequency._(value));

  @override
  bool operator ==(other) =>
      other is PeriodicScanFrequency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IntegrationStatus {
  static const pending = IntegrationStatus._('PENDING');
  static const inProgress = IntegrationStatus._('IN_PROGRESS');
  static const active = IntegrationStatus._('ACTIVE');
  static const inactive = IntegrationStatus._('INACTIVE');
  static const disabling = IntegrationStatus._('DISABLING');

  final String value;

  const IntegrationStatus._(this.value);

  static const values = [pending, inProgress, active, inactive, disabling];

  static IntegrationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IntegrationStatus._(value));

  @override
  bool operator ==(other) => other is IntegrationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details required to update a code security integration with a
/// specific repository provider.
///
/// @nodoc
class UpdateIntegrationDetails {
  /// Details specific to updating an integration with GitHub.
  final UpdateGitHubIntegrationDetail? github;

  /// Details specific to updating an integration with a self-managed GitLab
  /// instance.
  final UpdateGitLabSelfManagedIntegrationDetail? gitlabSelfManaged;

  UpdateIntegrationDetails({
    this.github,
    this.gitlabSelfManaged,
  });

  Map<String, dynamic> toJson() {
    final github = this.github;
    final gitlabSelfManaged = this.gitlabSelfManaged;
    return {
      if (github != null) 'github': github,
      if (gitlabSelfManaged != null) 'gitlabSelfManaged': gitlabSelfManaged,
    };
  }
}

/// Contains details required to update an integration with a self-managed
/// GitLab instance.
///
/// @nodoc
class UpdateGitLabSelfManagedIntegrationDetail {
  /// The authorization code received from the self-managed GitLab instance to
  /// update the integration.
  final String authCode;

  UpdateGitLabSelfManagedIntegrationDetail({
    required this.authCode,
  });

  Map<String, dynamic> toJson() {
    final authCode = this.authCode;
    return {
      'authCode': authCode,
    };
  }
}

/// Contains details required to update an integration with GitHub.
///
/// @nodoc
class UpdateGitHubIntegrationDetail {
  /// The authorization code received from GitHub to update the integration.
  final String code;

  /// The installation ID of the GitHub App associated with the integration.
  final String installationId;

  UpdateGitHubIntegrationDetail({
    required this.code,
    required this.installationId,
  });

  Map<String, dynamic> toJson() {
    final code = this.code;
    final installationId = this.installationId;
    return {
      'code': code,
      'installationId': installationId,
    };
  }
}

/// @nodoc
class CisSecurityLevel {
  static const level_1 = CisSecurityLevel._('LEVEL_1');
  static const level_2 = CisSecurityLevel._('LEVEL_2');

  final String value;

  const CisSecurityLevel._(this.value);

  static const values = [level_1, level_2];

  static CisSecurityLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisSecurityLevel._(value));

  @override
  bool operator ==(other) => other is CisSecurityLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A schedule.
///
/// @nodoc
class Schedule {
  /// The schedule's daily.
  final DailySchedule? daily;

  /// The schedule's monthly.
  final MonthlySchedule? monthly;

  /// The schedule's one time.
  final OneTimeSchedule? oneTime;

  /// The schedule's weekly.
  final WeeklySchedule? weekly;

  Schedule({
    this.daily,
    this.monthly,
    this.oneTime,
    this.weekly,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      daily: json['daily'] != null
          ? DailySchedule.fromJson(json['daily'] as Map<String, dynamic>)
          : null,
      monthly: json['monthly'] != null
          ? MonthlySchedule.fromJson(json['monthly'] as Map<String, dynamic>)
          : null,
      oneTime: json['oneTime'] != null
          ? OneTimeSchedule.fromJson(json['oneTime'] as Map<String, dynamic>)
          : null,
      weekly: json['weekly'] != null
          ? WeeklySchedule.fromJson(json['weekly'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final daily = this.daily;
    final monthly = this.monthly;
    final oneTime = this.oneTime;
    final weekly = this.weekly;
    return {
      if (daily != null) 'daily': daily,
      if (monthly != null) 'monthly': monthly,
      if (oneTime != null) 'oneTime': oneTime,
      if (weekly != null) 'weekly': weekly,
    };
  }
}

/// Updates CIS targets.
///
/// @nodoc
class UpdateCisTargets {
  /// The target account ids.
  final List<String>? accountIds;

  /// The target resource tags.
  final Map<String, List<String>>? targetResourceTags;

  UpdateCisTargets({
    this.accountIds,
    this.targetResourceTags,
  });

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final targetResourceTags = this.targetResourceTags;
    return {
      if (accountIds != null) 'accountIds': accountIds,
      if (targetResourceTags != null) 'targetResourceTags': targetResourceTags,
    };
  }
}

/// A one time schedule.
///
/// @nodoc
class OneTimeSchedule {
  OneTimeSchedule();

  factory OneTimeSchedule.fromJson(Map<String, dynamic> _) {
    return OneTimeSchedule();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A daily schedule.
///
/// @nodoc
class DailySchedule {
  /// The schedule start time.
  final Time startTime;

  DailySchedule({
    required this.startTime,
  });

  factory DailySchedule.fromJson(Map<String, dynamic> json) {
    return DailySchedule(
      startTime: Time.fromJson((json['startTime'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final startTime = this.startTime;
    return {
      'startTime': startTime,
    };
  }
}

/// A weekly schedule.
///
/// @nodoc
class WeeklySchedule {
  /// The weekly schedule's days.
  final List<Day> days;

  /// The weekly schedule's start time.
  final Time startTime;

  WeeklySchedule({
    required this.days,
    required this.startTime,
  });

  factory WeeklySchedule.fromJson(Map<String, dynamic> json) {
    return WeeklySchedule(
      days: ((json['days'] as List?) ?? const [])
          .nonNulls
          .map((e) => Day.fromString((e as String)))
          .toList(),
      startTime: Time.fromJson((json['startTime'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final days = this.days;
    final startTime = this.startTime;
    return {
      'days': days.map((e) => e.value).toList(),
      'startTime': startTime,
    };
  }
}

/// A monthly schedule.
///
/// @nodoc
class MonthlySchedule {
  /// The monthly schedule's day.
  final Day day;

  /// The monthly schedule's start time.
  final Time startTime;

  MonthlySchedule({
    required this.day,
    required this.startTime,
  });

  factory MonthlySchedule.fromJson(Map<String, dynamic> json) {
    return MonthlySchedule(
      day: Day.fromString((json['day'] as String?) ?? ''),
      startTime: Time.fromJson((json['startTime'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final day = this.day;
    final startTime = this.startTime;
    return {
      'day': day.value,
      'startTime': startTime,
    };
  }
}

/// The time.
///
/// @nodoc
class Time {
  /// The time of day in 24-hour format (00:00).
  final String timeOfDay;

  /// The timezone.
  final String timezone;

  Time({
    required this.timeOfDay,
    required this.timezone,
  });

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      timeOfDay: (json['timeOfDay'] as String?) ?? '',
      timezone: (json['timezone'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final timeOfDay = this.timeOfDay;
    final timezone = this.timezone;
    return {
      'timeOfDay': timeOfDay,
      'timezone': timezone,
    };
  }
}

/// @nodoc
class Day {
  static const sun = Day._('SUN');
  static const mon = Day._('MON');
  static const tue = Day._('TUE');
  static const wed = Day._('WED');
  static const thu = Day._('THU');
  static const fri = Day._('FRI');
  static const sat = Day._('SAT');

  final String value;

  const Day._(this.value);

  static const values = [sun, mon, tue, wed, thu, fri, sat];

  static Day fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Day._(value));

  @override
  bool operator ==(other) => other is Day && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The stop CIS session message.
///
/// @nodoc
class StopCisSessionMessage {
  /// The progress of the message.
  final StopCisMessageProgress progress;

  /// The status of the message.
  final StopCisSessionStatus status;

  /// The message benchmark profile.
  final String? benchmarkProfile;

  /// The message benchmark version.
  final String? benchmarkVersion;

  /// The message compute platform.
  final ComputePlatform? computePlatform;

  /// The reason for the message.
  final String? reason;

  StopCisSessionMessage({
    required this.progress,
    required this.status,
    this.benchmarkProfile,
    this.benchmarkVersion,
    this.computePlatform,
    this.reason,
  });

  Map<String, dynamic> toJson() {
    final progress = this.progress;
    final status = this.status;
    final benchmarkProfile = this.benchmarkProfile;
    final benchmarkVersion = this.benchmarkVersion;
    final computePlatform = this.computePlatform;
    final reason = this.reason;
    return {
      'progress': progress,
      'status': status.value,
      if (benchmarkProfile != null) 'benchmarkProfile': benchmarkProfile,
      if (benchmarkVersion != null) 'benchmarkVersion': benchmarkVersion,
      if (computePlatform != null) 'computePlatform': computePlatform,
      if (reason != null) 'reason': reason,
    };
  }
}

/// @nodoc
class StopCisSessionStatus {
  static const success = StopCisSessionStatus._('SUCCESS');
  static const failed = StopCisSessionStatus._('FAILED');
  static const interrupted = StopCisSessionStatus._('INTERRUPTED');
  static const unsupportedOs = StopCisSessionStatus._('UNSUPPORTED_OS');

  final String value;

  const StopCisSessionStatus._(this.value);

  static const values = [success, failed, interrupted, unsupportedOs];

  static StopCisSessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StopCisSessionStatus._(value));

  @override
  bool operator ==(other) =>
      other is StopCisSessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The stop CIS message progress.
///
/// @nodoc
class StopCisMessageProgress {
  /// The progress' error checks.
  final int? errorChecks;

  /// The progress' failed checks.
  final int? failedChecks;

  /// The progress' informational checks.
  final int? informationalChecks;

  /// The progress' not applicable checks.
  final int? notApplicableChecks;

  /// The progress' not evaluated checks.
  final int? notEvaluatedChecks;

  /// The progress' successful checks.
  final int? successfulChecks;

  /// The progress' total checks.
  final int? totalChecks;

  /// The progress' unknown checks.
  final int? unknownChecks;

  StopCisMessageProgress({
    this.errorChecks,
    this.failedChecks,
    this.informationalChecks,
    this.notApplicableChecks,
    this.notEvaluatedChecks,
    this.successfulChecks,
    this.totalChecks,
    this.unknownChecks,
  });

  Map<String, dynamic> toJson() {
    final errorChecks = this.errorChecks;
    final failedChecks = this.failedChecks;
    final informationalChecks = this.informationalChecks;
    final notApplicableChecks = this.notApplicableChecks;
    final notEvaluatedChecks = this.notEvaluatedChecks;
    final successfulChecks = this.successfulChecks;
    final totalChecks = this.totalChecks;
    final unknownChecks = this.unknownChecks;
    return {
      if (errorChecks != null) 'errorChecks': errorChecks,
      if (failedChecks != null) 'failedChecks': failedChecks,
      if (informationalChecks != null)
        'informationalChecks': informationalChecks,
      if (notApplicableChecks != null)
        'notApplicableChecks': notApplicableChecks,
      if (notEvaluatedChecks != null) 'notEvaluatedChecks': notEvaluatedChecks,
      if (successfulChecks != null) 'successfulChecks': successfulChecks,
      if (totalChecks != null) 'totalChecks': totalChecks,
      if (unknownChecks != null) 'unknownChecks': unknownChecks,
    };
  }
}

/// A compute platform.
///
/// @nodoc
class ComputePlatform {
  /// The compute platform product.
  final String? product;

  /// The compute platform vendor.
  final String? vendor;

  /// The compute platform version.
  final String? version;

  ComputePlatform({
    this.product,
    this.vendor,
    this.version,
  });

  Map<String, dynamic> toJson() {
    final product = this.product;
    final vendor = this.vendor;
    final version = this.version;
    return {
      if (product != null) 'product': product,
      if (vendor != null) 'vendor': vendor,
      if (version != null) 'version': version,
    };
  }
}

/// @nodoc
class CodeScanStatus {
  static const inProgress = CodeScanStatus._('IN_PROGRESS');
  static const successful = CodeScanStatus._('SUCCESSFUL');
  static const failed = CodeScanStatus._('FAILED');
  static const skipped = CodeScanStatus._('SKIPPED');

  final String value;

  const CodeScanStatus._(this.value);

  static const values = [inProgress, successful, failed, skipped];

  static CodeScanStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CodeScanStatus._(value));

  @override
  bool operator ==(other) => other is CodeScanStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Identifies a specific resource in a code repository that will be scanned.
///
/// @nodoc
class CodeSecurityResource {
  /// The unique identifier of the project in the code repository.
  final String? projectId;

  CodeSecurityResource({
    this.projectId,
  });

  factory CodeSecurityResource.fromJson(Map<String, dynamic> json) {
    return CodeSecurityResource(
      projectId: json['projectId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final projectId = this.projectId;
    return {
      if (projectId != null) 'projectId': projectId,
    };
  }
}

/// The start CIS session message.
///
/// @nodoc
class StartCisSessionMessage {
  /// The unique token that identifies the CIS session.
  final String sessionToken;

  StartCisSessionMessage({
    required this.sessionToken,
  });

  Map<String, dynamic> toJson() {
    final sessionToken = this.sessionToken;
    return {
      'sessionToken': sessionToken,
    };
  }
}

/// The CIS session message.
///
/// @nodoc
class CisSessionMessage {
  /// The CIS rule details for the CIS session message.
  final Uint8List cisRuleDetails;

  /// The rule ID for the CIS session message.
  final String ruleId;

  /// The status of the CIS session message.
  final CisRuleStatus status;

  CisSessionMessage({
    required this.cisRuleDetails,
    required this.ruleId,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    final cisRuleDetails = this.cisRuleDetails;
    final ruleId = this.ruleId;
    final status = this.status;
    return {
      'cisRuleDetails': base64Encode(cisRuleDetails),
      'ruleId': ruleId,
      'status': status.value,
    };
  }
}

/// @nodoc
class CisRuleStatus {
  static const failed = CisRuleStatus._('FAILED');
  static const passed = CisRuleStatus._('PASSED');
  static const notEvaluated = CisRuleStatus._('NOT_EVALUATED');
  static const informational = CisRuleStatus._('INFORMATIONAL');
  static const unknown = CisRuleStatus._('UNKNOWN');
  static const notApplicable = CisRuleStatus._('NOT_APPLICABLE');
  static const error = CisRuleStatus._('ERROR');

  final String value;

  const CisRuleStatus._(this.value);

  static const values = [
    failed,
    passed,
    notEvaluated,
    informational,
    unknown,
    notApplicable,
    error
  ];

  static CisRuleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisRuleStatus._(value));

  @override
  bool operator ==(other) => other is CisRuleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a specific vulnerability Amazon Inspector can detect.
///
/// @nodoc
class Vulnerability {
  /// The ID for the specific vulnerability.
  final String id;

  /// An object that contains information about the Amazon Web Services Threat
  /// Intel Group (ATIG) details for the vulnerability.
  final AtigData? atigData;

  /// An object that contains the Cybersecurity and Infrastructure Security Agency
  /// (CISA) details for the vulnerability.
  final CisaData? cisaData;

  /// An object that contains the Common Vulnerability Scoring System (CVSS)
  /// Version 2 details for the vulnerability.
  final Cvss2? cvss2;

  /// An object that contains the Common Vulnerability Scoring System (CVSS)
  /// Version 3 details for the vulnerability.
  final Cvss3? cvss3;

  /// An object that contains the Common Vulnerability Scoring System (CVSS)
  /// Version 4 details for the vulnerability.
  final Cvss4? cvss4;

  /// The Common Weakness Enumeration (CWE) associated with the vulnerability.
  final List<String>? cwes;

  /// A description of the vulnerability.
  final String? description;

  /// Platforms that the vulnerability can be detected on.
  final List<String>? detectionPlatforms;

  /// An object that contains the Exploit Prediction Scoring System (EPSS) score
  /// for a vulnerability.
  final Epss? epss;

  /// An object that contains details on when the exploit was observed.
  final ExploitObserved? exploitObserved;

  /// Links to various resources with more information on this vulnerability.
  final List<String>? referenceUrls;

  /// A list of related vulnerabilities.
  final List<String>? relatedVulnerabilities;

  /// The source of the vulnerability information. Possible results are
  /// <code>RHEL</code>, <code>AMAZON_CVE</code>, <code>DEBIAN</code> or
  /// <code>NVD</code>.
  final VulnerabilitySource? source;

  /// A link to the official source material for this vulnerability.
  final String? sourceUrl;

  /// The date and time when the vendor created this vulnerability.
  final DateTime? vendorCreatedAt;

  /// The severity assigned by the vendor.
  final String? vendorSeverity;

  /// The date and time when the vendor last updated this vulnerability.
  final DateTime? vendorUpdatedAt;

  Vulnerability({
    required this.id,
    this.atigData,
    this.cisaData,
    this.cvss2,
    this.cvss3,
    this.cvss4,
    this.cwes,
    this.description,
    this.detectionPlatforms,
    this.epss,
    this.exploitObserved,
    this.referenceUrls,
    this.relatedVulnerabilities,
    this.source,
    this.sourceUrl,
    this.vendorCreatedAt,
    this.vendorSeverity,
    this.vendorUpdatedAt,
  });

  factory Vulnerability.fromJson(Map<String, dynamic> json) {
    return Vulnerability(
      id: (json['id'] as String?) ?? '',
      atigData: json['atigData'] != null
          ? AtigData.fromJson(json['atigData'] as Map<String, dynamic>)
          : null,
      cisaData: json['cisaData'] != null
          ? CisaData.fromJson(json['cisaData'] as Map<String, dynamic>)
          : null,
      cvss2: json['cvss2'] != null
          ? Cvss2.fromJson(json['cvss2'] as Map<String, dynamic>)
          : null,
      cvss3: json['cvss3'] != null
          ? Cvss3.fromJson(json['cvss3'] as Map<String, dynamic>)
          : null,
      cvss4: json['cvss4'] != null
          ? Cvss4.fromJson(json['cvss4'] as Map<String, dynamic>)
          : null,
      cwes: (json['cwes'] as List?)?.nonNulls.map((e) => e as String).toList(),
      description: json['description'] as String?,
      detectionPlatforms: (json['detectionPlatforms'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      epss: json['epss'] != null
          ? Epss.fromJson(json['epss'] as Map<String, dynamic>)
          : null,
      exploitObserved: json['exploitObserved'] != null
          ? ExploitObserved.fromJson(
              json['exploitObserved'] as Map<String, dynamic>)
          : null,
      referenceUrls: (json['referenceUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      relatedVulnerabilities: (json['relatedVulnerabilities'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      source: (json['source'] as String?)?.let(VulnerabilitySource.fromString),
      sourceUrl: json['sourceUrl'] as String?,
      vendorCreatedAt: timeStampFromJson(json['vendorCreatedAt']),
      vendorSeverity: json['vendorSeverity'] as String?,
      vendorUpdatedAt: timeStampFromJson(json['vendorUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final atigData = this.atigData;
    final cisaData = this.cisaData;
    final cvss2 = this.cvss2;
    final cvss3 = this.cvss3;
    final cvss4 = this.cvss4;
    final cwes = this.cwes;
    final description = this.description;
    final detectionPlatforms = this.detectionPlatforms;
    final epss = this.epss;
    final exploitObserved = this.exploitObserved;
    final referenceUrls = this.referenceUrls;
    final relatedVulnerabilities = this.relatedVulnerabilities;
    final source = this.source;
    final sourceUrl = this.sourceUrl;
    final vendorCreatedAt = this.vendorCreatedAt;
    final vendorSeverity = this.vendorSeverity;
    final vendorUpdatedAt = this.vendorUpdatedAt;
    return {
      'id': id,
      if (atigData != null) 'atigData': atigData,
      if (cisaData != null) 'cisaData': cisaData,
      if (cvss2 != null) 'cvss2': cvss2,
      if (cvss3 != null) 'cvss3': cvss3,
      if (cvss4 != null) 'cvss4': cvss4,
      if (cwes != null) 'cwes': cwes,
      if (description != null) 'description': description,
      if (detectionPlatforms != null) 'detectionPlatforms': detectionPlatforms,
      if (epss != null) 'epss': epss,
      if (exploitObserved != null) 'exploitObserved': exploitObserved,
      if (referenceUrls != null) 'referenceUrls': referenceUrls,
      if (relatedVulnerabilities != null)
        'relatedVulnerabilities': relatedVulnerabilities,
      if (source != null) 'source': source.value,
      if (sourceUrl != null) 'sourceUrl': sourceUrl,
      if (vendorCreatedAt != null)
        'vendorCreatedAt': unixTimestampToJson(vendorCreatedAt),
      if (vendorSeverity != null) 'vendorSeverity': vendorSeverity,
      if (vendorUpdatedAt != null)
        'vendorUpdatedAt': unixTimestampToJson(vendorUpdatedAt),
    };
  }
}

/// The Cybersecurity and Infrastructure Security Agency (CISA) details for a
/// specific vulnerability.
///
/// @nodoc
class CisaData {
  /// The remediation action recommended by CISA for this vulnerability.
  final String? action;

  /// The date and time CISA added this vulnerability to their catalogue.
  final DateTime? dateAdded;

  /// The date and time CISA expects a fix to have been provided vulnerability.
  final DateTime? dateDue;

  CisaData({
    this.action,
    this.dateAdded,
    this.dateDue,
  });

  factory CisaData.fromJson(Map<String, dynamic> json) {
    return CisaData(
      action: json['action'] as String?,
      dateAdded: timeStampFromJson(json['dateAdded']),
      dateDue: timeStampFromJson(json['dateDue']),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final dateAdded = this.dateAdded;
    final dateDue = this.dateDue;
    return {
      if (action != null) 'action': action,
      if (dateAdded != null) 'dateAdded': unixTimestampToJson(dateAdded),
      if (dateDue != null) 'dateDue': unixTimestampToJson(dateDue),
    };
  }
}

/// @nodoc
class VulnerabilitySource {
  static const nvd = VulnerabilitySource._('NVD');

  final String value;

  const VulnerabilitySource._(this.value);

  static const values = [nvd];

  static VulnerabilitySource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VulnerabilitySource._(value));

  @override
  bool operator ==(other) =>
      other is VulnerabilitySource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon Web Services Threat Intel Group (ATIG) details for a specific
/// vulnerability.
///
/// @nodoc
class AtigData {
  /// The date and time this vulnerability was first observed.
  final DateTime? firstSeen;

  /// The date and time this vulnerability was last observed.
  final DateTime? lastSeen;

  /// The commercial sectors this vulnerability targets.
  final List<String>? targets;

  /// The <a href="https://attack.mitre.org/">MITRE ATT&amp;CK</a> tactics,
  /// techniques, and procedures (TTPs) associated with vulnerability.
  final List<String>? ttps;

  AtigData({
    this.firstSeen,
    this.lastSeen,
    this.targets,
    this.ttps,
  });

  factory AtigData.fromJson(Map<String, dynamic> json) {
    return AtigData(
      firstSeen: timeStampFromJson(json['firstSeen']),
      lastSeen: timeStampFromJson(json['lastSeen']),
      targets:
          (json['targets'] as List?)?.nonNulls.map((e) => e as String).toList(),
      ttps: (json['ttps'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final firstSeen = this.firstSeen;
    final lastSeen = this.lastSeen;
    final targets = this.targets;
    final ttps = this.ttps;
    return {
      if (firstSeen != null) 'firstSeen': unixTimestampToJson(firstSeen),
      if (lastSeen != null) 'lastSeen': unixTimestampToJson(lastSeen),
      if (targets != null) 'targets': targets,
      if (ttps != null) 'ttps': ttps,
    };
  }
}

/// The Common Vulnerability Scoring System (CVSS) version 4 details for the
/// vulnerability.
///
/// @nodoc
class Cvss4 {
  /// The base CVSS v4 score for the vulnerability finding, which rates the
  /// severity of the vulnerability on a scale from 0 to 10.
  final double? baseScore;

  /// The CVSS v4 scoring vector, which contains the metrics and measurements that
  /// were used to calculate the base score.
  final String? scoringVector;

  Cvss4({
    this.baseScore,
    this.scoringVector,
  });

  factory Cvss4.fromJson(Map<String, dynamic> json) {
    return Cvss4(
      baseScore: _s.parseJsonDouble(json['baseScore']),
      scoringVector: json['scoringVector'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseScore = this.baseScore;
    final scoringVector = this.scoringVector;
    return {
      if (baseScore != null) 'baseScore': _s.encodeJsonDouble(baseScore),
      if (scoringVector != null) 'scoringVector': scoringVector,
    };
  }
}

/// The Common Vulnerability Scoring System (CVSS) version 3 details for the
/// vulnerability.
///
/// @nodoc
class Cvss3 {
  /// The CVSS v3 base score for the vulnerability.
  final double? baseScore;

  /// The scoring vector associated with the CVSS v3 score.
  final String? scoringVector;

  Cvss3({
    this.baseScore,
    this.scoringVector,
  });

  factory Cvss3.fromJson(Map<String, dynamic> json) {
    return Cvss3(
      baseScore: _s.parseJsonDouble(json['baseScore']),
      scoringVector: json['scoringVector'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseScore = this.baseScore;
    final scoringVector = this.scoringVector;
    return {
      if (baseScore != null) 'baseScore': _s.encodeJsonDouble(baseScore),
      if (scoringVector != null) 'scoringVector': scoringVector,
    };
  }
}

/// The Common Vulnerability Scoring System (CVSS) version 2 details for the
/// vulnerability.
///
/// @nodoc
class Cvss2 {
  /// The CVSS v2 base score for the vulnerability.
  final double? baseScore;

  /// The scoring vector associated with the CVSS v2 score.
  final String? scoringVector;

  Cvss2({
    this.baseScore,
    this.scoringVector,
  });

  factory Cvss2.fromJson(Map<String, dynamic> json) {
    return Cvss2(
      baseScore: _s.parseJsonDouble(json['baseScore']),
      scoringVector: json['scoringVector'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseScore = this.baseScore;
    final scoringVector = this.scoringVector;
    return {
      if (baseScore != null) 'baseScore': _s.encodeJsonDouble(baseScore),
      if (scoringVector != null) 'scoringVector': scoringVector,
    };
  }
}

/// Contains information on when this exploit was observed.
///
/// @nodoc
class ExploitObserved {
  /// The date an time when the exploit was first seen.
  final DateTime? firstSeen;

  /// The date an time when the exploit was last seen.
  final DateTime? lastSeen;

  ExploitObserved({
    this.firstSeen,
    this.lastSeen,
  });

  factory ExploitObserved.fromJson(Map<String, dynamic> json) {
    return ExploitObserved(
      firstSeen: timeStampFromJson(json['firstSeen']),
      lastSeen: timeStampFromJson(json['lastSeen']),
    );
  }

  Map<String, dynamic> toJson() {
    final firstSeen = this.firstSeen;
    final lastSeen = this.lastSeen;
    return {
      if (firstSeen != null) 'firstSeen': unixTimestampToJson(firstSeen),
      if (lastSeen != null) 'lastSeen': unixTimestampToJson(lastSeen),
    };
  }
}

/// Details about the Exploit Prediction Scoring System (EPSS) score.
///
/// @nodoc
class Epss {
  /// The Exploit Prediction Scoring System (EPSS) score.
  final double? score;

  Epss({
    this.score,
  });

  factory Epss.fromJson(Map<String, dynamic> json) {
    return Epss(
      score: _s.parseJsonDouble(json['score']),
    );
  }

  Map<String, dynamic> toJson() {
    final score = this.score;
    return {
      if (score != null) 'score': _s.encodeJsonDouble(score),
    };
  }
}

/// Details on the criteria used to define the filter for a vulnerability
/// search.
///
/// @nodoc
class SearchVulnerabilitiesFilterCriteria {
  /// The IDs for specific vulnerabilities.
  final List<String> vulnerabilityIds;

  SearchVulnerabilitiesFilterCriteria({
    required this.vulnerabilityIds,
  });

  Map<String, dynamic> toJson() {
    final vulnerabilityIds = this.vulnerabilityIds;
    return {
      'vulnerabilityIds': vulnerabilityIds,
    };
  }
}

/// The total of usage for an account ID.
///
/// @nodoc
class UsageTotal {
  /// The account ID of the account that usage data was retrieved for.
  final String? accountId;

  /// An object representing the total usage for an account.
  final List<Usage>? usage;

  UsageTotal({
    this.accountId,
    this.usage,
  });

  factory UsageTotal.fromJson(Map<String, dynamic> json) {
    return UsageTotal(
      accountId: json['accountId'] as String?,
      usage: (json['usage'] as List?)
          ?.nonNulls
          .map((e) => Usage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final usage = this.usage;
    return {
      if (accountId != null) 'accountId': accountId,
      if (usage != null) 'usage': usage,
    };
  }
}

/// Contains usage information about the cost of Amazon Inspector operation.
///
/// @nodoc
class Usage {
  /// The currency type used when calculating usage data.
  final Currency? currency;

  /// The estimated monthly cost of Amazon Inspector.
  final double? estimatedMonthlyCost;

  /// The total of usage.
  final double? total;

  /// The type scan.
  final UsageType? type;

  Usage({
    this.currency,
    this.estimatedMonthlyCost,
    this.total,
    this.type,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      currency: (json['currency'] as String?)?.let(Currency.fromString),
      estimatedMonthlyCost: _s.parseJsonDouble(json['estimatedMonthlyCost']),
      total: _s.parseJsonDouble(json['total']),
      type: (json['type'] as String?)?.let(UsageType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final estimatedMonthlyCost = this.estimatedMonthlyCost;
    final total = this.total;
    final type = this.type;
    return {
      if (currency != null) 'currency': currency.value,
      if (estimatedMonthlyCost != null)
        'estimatedMonthlyCost': _s.encodeJsonDouble(estimatedMonthlyCost),
      if (total != null) 'total': _s.encodeJsonDouble(total),
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class UsageType {
  static const ec2InstanceHours = UsageType._('EC2_INSTANCE_HOURS');
  static const ecrInitialScan = UsageType._('ECR_INITIAL_SCAN');
  static const ecrRescan = UsageType._('ECR_RESCAN');
  static const lambdaFunctionHours = UsageType._('LAMBDA_FUNCTION_HOURS');
  static const lambdaFunctionCodeHours =
      UsageType._('LAMBDA_FUNCTION_CODE_HOURS');
  static const codeRepositorySast = UsageType._('CODE_REPOSITORY_SAST');
  static const codeRepositoryIac = UsageType._('CODE_REPOSITORY_IAC');
  static const codeRepositorySca = UsageType._('CODE_REPOSITORY_SCA');
  static const ec2AgentlessInstanceHours =
      UsageType._('EC2_AGENTLESS_INSTANCE_HOURS');

  final String value;

  const UsageType._(this.value);

  static const values = [
    ec2InstanceHours,
    ecrInitialScan,
    ecrRescan,
    lambdaFunctionHours,
    lambdaFunctionCodeHours,
    codeRepositorySast,
    codeRepositoryIac,
    codeRepositorySca,
    ec2AgentlessInstanceHours
  ];

  static UsageType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UsageType._(value));

  @override
  bool operator ==(other) => other is UsageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Currency {
  static const usd = Currency._('USD');

  final String value;

  const Currency._(this.value);

  static const values = [usd];

  static Currency fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Currency._(value));

  @override
  bool operator ==(other) => other is Currency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details on a member account in your organization.
///
/// @nodoc
class Member {
  /// The Amazon Web Services account ID of the member account.
  final String? accountId;

  /// The Amazon Web Services account ID of the Amazon Inspector delegated
  /// administrator for this member account.
  final String? delegatedAdminAccountId;

  /// The status of the member account.
  final RelationshipStatus? relationshipStatus;

  /// A timestamp showing when the status of this member was last updated.
  final DateTime? updatedAt;

  Member({
    this.accountId,
    this.delegatedAdminAccountId,
    this.relationshipStatus,
    this.updatedAt,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      accountId: json['accountId'] as String?,
      delegatedAdminAccountId: json['delegatedAdminAccountId'] as String?,
      relationshipStatus: (json['relationshipStatus'] as String?)
          ?.let(RelationshipStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final delegatedAdminAccountId = this.delegatedAdminAccountId;
    final relationshipStatus = this.relationshipStatus;
    final updatedAt = this.updatedAt;
    return {
      if (accountId != null) 'accountId': accountId,
      if (delegatedAdminAccountId != null)
        'delegatedAdminAccountId': delegatedAdminAccountId,
      if (relationshipStatus != null)
        'relationshipStatus': relationshipStatus.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class RelationshipStatus {
  static const created = RelationshipStatus._('CREATED');
  static const invited = RelationshipStatus._('INVITED');
  static const disabled = RelationshipStatus._('DISABLED');
  static const enabled = RelationshipStatus._('ENABLED');
  static const removed = RelationshipStatus._('REMOVED');
  static const resigned = RelationshipStatus._('RESIGNED');
  static const deleted = RelationshipStatus._('DELETED');
  static const emailVerificationInProgress =
      RelationshipStatus._('EMAIL_VERIFICATION_IN_PROGRESS');
  static const emailVerificationFailed =
      RelationshipStatus._('EMAIL_VERIFICATION_FAILED');
  static const regionDisabled = RelationshipStatus._('REGION_DISABLED');
  static const accountSuspended = RelationshipStatus._('ACCOUNT_SUSPENDED');
  static const cannotCreateDetectorInOrgMaster =
      RelationshipStatus._('CANNOT_CREATE_DETECTOR_IN_ORG_MASTER');

  final String value;

  const RelationshipStatus._(this.value);

  static const values = [
    created,
    invited,
    disabled,
    enabled,
    removed,
    resigned,
    deleted,
    emailVerificationInProgress,
    emailVerificationFailed,
    regionDisabled,
    accountSuspended,
    cannotCreateDetectorInOrgMaster
  ];

  static RelationshipStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RelationshipStatus._(value));

  @override
  bool operator ==(other) =>
      other is RelationshipStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about an Amazon Inspector finding.
///
/// @nodoc
class Finding {
  /// The Amazon Web Services account ID associated with the finding.
  final String awsAccountId;

  /// The description of the finding.
  final String description;

  /// The Amazon Resource Number (ARN) of the finding.
  final String findingArn;

  /// The date and time that the finding was first observed.
  final DateTime firstObservedAt;

  /// The date and time the finding was last observed. This timestamp for this
  /// field remains unchanged until a finding is updated.
  final DateTime lastObservedAt;

  /// An object that contains the details about how to remediate a finding.
  final Remediation remediation;

  /// Contains information on the resources involved in a finding. The
  /// <code>resource</code> value determines the valid values for
  /// <code>type</code> in your request. For more information, see <a
  /// href="https://docs.aws.amazon.com/inspector/latest/user/findings-types.html">Finding
  /// types</a> in the Amazon Inspector user guide.
  final List<Resource> resources;

  /// The severity of the finding. <code>UNTRIAGED</code> applies to
  /// <code>PACKAGE_VULNERABILITY</code> type findings that the vendor has not
  /// assigned a severity yet. For more information, see <a
  /// href="https://docs.aws.amazon.com/inspector/latest/user/findings-understanding-severity.html">Severity
  /// levels for findings</a> in the Amazon Inspector user guide.
  final Severity severity;

  /// The status of the finding.
  final FindingStatus status;

  /// The type of the finding. The <code>type</code> value determines the valid
  /// values for <code>resource</code> in your request. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/inspector/latest/user/findings-types.html">Finding
  /// types</a> in the Amazon Inspector user guide.
  final FindingType type;

  /// Details about the code vulnerability identified in a Lambda function used to
  /// filter findings.
  final CodeVulnerabilityDetails? codeVulnerabilityDetails;

  /// The finding's EPSS score.
  final EpssDetails? epss;

  /// If a finding discovered in your environment has an exploit available.
  final ExploitAvailable? exploitAvailable;

  /// The details of an exploit available for a finding discovered in your
  /// environment.
  final ExploitabilityDetails? exploitabilityDetails;

  /// Details on whether a fix is available through a version update. This value
  /// can be <code>YES</code>, <code>NO</code>, or <code>PARTIAL</code>. A
  /// <code>PARTIAL</code> fix means that some, but not all, of the packages
  /// identified in the finding have fixes available through updated versions.
  final FixAvailable? fixAvailable;

  /// The Amazon Inspector score given to the finding.
  final double? inspectorScore;

  /// An object that contains details of the Amazon Inspector score.
  final InspectorScoreDetails? inspectorScoreDetails;

  /// An object that contains the details of a network reachability finding.
  final NetworkReachabilityDetails? networkReachabilityDetails;

  /// An object that contains the details of a package vulnerability finding.
  final PackageVulnerabilityDetails? packageVulnerabilityDetails;

  /// The title of the finding.
  final String? title;

  /// The date and time the finding was last updated at.
  final DateTime? updatedAt;

  Finding({
    required this.awsAccountId,
    required this.description,
    required this.findingArn,
    required this.firstObservedAt,
    required this.lastObservedAt,
    required this.remediation,
    required this.resources,
    required this.severity,
    required this.status,
    required this.type,
    this.codeVulnerabilityDetails,
    this.epss,
    this.exploitAvailable,
    this.exploitabilityDetails,
    this.fixAvailable,
    this.inspectorScore,
    this.inspectorScoreDetails,
    this.networkReachabilityDetails,
    this.packageVulnerabilityDetails,
    this.title,
    this.updatedAt,
  });

  factory Finding.fromJson(Map<String, dynamic> json) {
    return Finding(
      awsAccountId: (json['awsAccountId'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      findingArn: (json['findingArn'] as String?) ?? '',
      firstObservedAt:
          nonNullableTimeStampFromJson(json['firstObservedAt'] ?? 0),
      lastObservedAt: nonNullableTimeStampFromJson(json['lastObservedAt'] ?? 0),
      remediation: Remediation.fromJson(
          (json['remediation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      resources: ((json['resources'] as List?) ?? const [])
          .nonNulls
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      severity: Severity.fromString((json['severity'] as String?) ?? ''),
      status: FindingStatus.fromString((json['status'] as String?) ?? ''),
      type: FindingType.fromString((json['type'] as String?) ?? ''),
      codeVulnerabilityDetails: json['codeVulnerabilityDetails'] != null
          ? CodeVulnerabilityDetails.fromJson(
              json['codeVulnerabilityDetails'] as Map<String, dynamic>)
          : null,
      epss: json['epss'] != null
          ? EpssDetails.fromJson(json['epss'] as Map<String, dynamic>)
          : null,
      exploitAvailable: (json['exploitAvailable'] as String?)
          ?.let(ExploitAvailable.fromString),
      exploitabilityDetails: json['exploitabilityDetails'] != null
          ? ExploitabilityDetails.fromJson(
              json['exploitabilityDetails'] as Map<String, dynamic>)
          : null,
      fixAvailable:
          (json['fixAvailable'] as String?)?.let(FixAvailable.fromString),
      inspectorScore: _s.parseJsonDouble(json['inspectorScore']),
      inspectorScoreDetails: json['inspectorScoreDetails'] != null
          ? InspectorScoreDetails.fromJson(
              json['inspectorScoreDetails'] as Map<String, dynamic>)
          : null,
      networkReachabilityDetails: json['networkReachabilityDetails'] != null
          ? NetworkReachabilityDetails.fromJson(
              json['networkReachabilityDetails'] as Map<String, dynamic>)
          : null,
      packageVulnerabilityDetails: json['packageVulnerabilityDetails'] != null
          ? PackageVulnerabilityDetails.fromJson(
              json['packageVulnerabilityDetails'] as Map<String, dynamic>)
          : null,
      title: json['title'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final description = this.description;
    final findingArn = this.findingArn;
    final firstObservedAt = this.firstObservedAt;
    final lastObservedAt = this.lastObservedAt;
    final remediation = this.remediation;
    final resources = this.resources;
    final severity = this.severity;
    final status = this.status;
    final type = this.type;
    final codeVulnerabilityDetails = this.codeVulnerabilityDetails;
    final epss = this.epss;
    final exploitAvailable = this.exploitAvailable;
    final exploitabilityDetails = this.exploitabilityDetails;
    final fixAvailable = this.fixAvailable;
    final inspectorScore = this.inspectorScore;
    final inspectorScoreDetails = this.inspectorScoreDetails;
    final networkReachabilityDetails = this.networkReachabilityDetails;
    final packageVulnerabilityDetails = this.packageVulnerabilityDetails;
    final title = this.title;
    final updatedAt = this.updatedAt;
    return {
      'awsAccountId': awsAccountId,
      'description': description,
      'findingArn': findingArn,
      'firstObservedAt': unixTimestampToJson(firstObservedAt),
      'lastObservedAt': unixTimestampToJson(lastObservedAt),
      'remediation': remediation,
      'resources': resources,
      'severity': severity.value,
      'status': status.value,
      'type': type.value,
      if (codeVulnerabilityDetails != null)
        'codeVulnerabilityDetails': codeVulnerabilityDetails,
      if (epss != null) 'epss': epss,
      if (exploitAvailable != null) 'exploitAvailable': exploitAvailable.value,
      if (exploitabilityDetails != null)
        'exploitabilityDetails': exploitabilityDetails,
      if (fixAvailable != null) 'fixAvailable': fixAvailable.value,
      if (inspectorScore != null)
        'inspectorScore': _s.encodeJsonDouble(inspectorScore),
      if (inspectorScoreDetails != null)
        'inspectorScoreDetails': inspectorScoreDetails,
      if (networkReachabilityDetails != null)
        'networkReachabilityDetails': networkReachabilityDetails,
      if (packageVulnerabilityDetails != null)
        'packageVulnerabilityDetails': packageVulnerabilityDetails,
      if (title != null) 'title': title,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class FindingType {
  static const networkReachability = FindingType._('NETWORK_REACHABILITY');
  static const packageVulnerability = FindingType._('PACKAGE_VULNERABILITY');
  static const codeVulnerability = FindingType._('CODE_VULNERABILITY');

  final String value;

  const FindingType._(this.value);

  static const values = [
    networkReachability,
    packageVulnerability,
    codeVulnerability
  ];

  static FindingType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FindingType._(value));

  @override
  bool operator ==(other) => other is FindingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information on how to remediate a finding.
///
/// @nodoc
class Remediation {
  /// An object that contains information about the recommended course of action
  /// to remediate the finding.
  final Recommendation? recommendation;

  Remediation({
    this.recommendation,
  });

  factory Remediation.fromJson(Map<String, dynamic> json) {
    return Remediation(
      recommendation: json['recommendation'] != null
          ? Recommendation.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendation = this.recommendation;
    return {
      if (recommendation != null) 'recommendation': recommendation,
    };
  }
}

/// @nodoc
class Severity {
  static const informational = Severity._('INFORMATIONAL');
  static const low = Severity._('LOW');
  static const medium = Severity._('MEDIUM');
  static const high = Severity._('HIGH');
  static const critical = Severity._('CRITICAL');
  static const untriaged = Severity._('UNTRIAGED');

  final String value;

  const Severity._(this.value);

  static const values = [informational, low, medium, high, critical, untriaged];

  static Severity fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Severity._(value));

  @override
  bool operator ==(other) => other is Severity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FindingStatus {
  static const active = FindingStatus._('ACTIVE');
  static const suppressed = FindingStatus._('SUPPRESSED');
  static const closed = FindingStatus._('CLOSED');

  final String value;

  const FindingStatus._(this.value);

  static const values = [active, suppressed, closed];

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

/// Information about the Amazon Inspector score given to a finding.
///
/// @nodoc
class InspectorScoreDetails {
  /// An object that contains details about the CVSS score given to a finding.
  final CvssScoreDetails? adjustedCvss;

  InspectorScoreDetails({
    this.adjustedCvss,
  });

  factory InspectorScoreDetails.fromJson(Map<String, dynamic> json) {
    return InspectorScoreDetails(
      adjustedCvss: json['adjustedCvss'] != null
          ? CvssScoreDetails.fromJson(
              json['adjustedCvss'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final adjustedCvss = this.adjustedCvss;
    return {
      if (adjustedCvss != null) 'adjustedCvss': adjustedCvss,
    };
  }
}

/// Contains the details of a network reachability finding.
///
/// @nodoc
class NetworkReachabilityDetails {
  /// An object that contains details about a network path associated with a
  /// finding.
  final NetworkPath networkPath;

  /// An object that contains details about the open port range associated with a
  /// finding.
  final PortRange openPortRange;

  /// The protocol associated with a finding.
  final NetworkProtocol protocol;

  NetworkReachabilityDetails({
    required this.networkPath,
    required this.openPortRange,
    required this.protocol,
  });

  factory NetworkReachabilityDetails.fromJson(Map<String, dynamic> json) {
    return NetworkReachabilityDetails(
      networkPath: NetworkPath.fromJson(
          (json['networkPath'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      openPortRange: PortRange.fromJson(
          (json['openPortRange'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      protocol: NetworkProtocol.fromString((json['protocol'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final networkPath = this.networkPath;
    final openPortRange = this.openPortRange;
    final protocol = this.protocol;
    return {
      'networkPath': networkPath,
      'openPortRange': openPortRange,
      'protocol': protocol.value,
    };
  }
}

/// Information about a package vulnerability finding.
///
/// @nodoc
class PackageVulnerabilityDetails {
  /// The source of the vulnerability information.
  final String source;

  /// The ID given to this vulnerability.
  final String vulnerabilityId;

  /// An object that contains details about the CVSS score of a finding.
  final List<CvssScore>? cvss;

  /// One or more URLs that contain details about this vulnerability type.
  final List<String>? referenceUrls;

  /// One or more vulnerabilities related to the one identified in this finding.
  final List<String>? relatedVulnerabilities;

  /// A URL to the source of the vulnerability information.
  final String? sourceUrl;

  /// The date and time that this vulnerability was first added to the vendor's
  /// database.
  final DateTime? vendorCreatedAt;

  /// The severity the vendor has given to this vulnerability type.
  final String? vendorSeverity;

  /// The date and time the vendor last updated this vulnerability in their
  /// database.
  final DateTime? vendorUpdatedAt;

  /// The packages impacted by this vulnerability.
  final List<VulnerablePackage>? vulnerablePackages;

  PackageVulnerabilityDetails({
    required this.source,
    required this.vulnerabilityId,
    this.cvss,
    this.referenceUrls,
    this.relatedVulnerabilities,
    this.sourceUrl,
    this.vendorCreatedAt,
    this.vendorSeverity,
    this.vendorUpdatedAt,
    this.vulnerablePackages,
  });

  factory PackageVulnerabilityDetails.fromJson(Map<String, dynamic> json) {
    return PackageVulnerabilityDetails(
      source: (json['source'] as String?) ?? '',
      vulnerabilityId: (json['vulnerabilityId'] as String?) ?? '',
      cvss: (json['cvss'] as List?)
          ?.nonNulls
          .map((e) => CvssScore.fromJson(e as Map<String, dynamic>))
          .toList(),
      referenceUrls: (json['referenceUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      relatedVulnerabilities: (json['relatedVulnerabilities'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      sourceUrl: json['sourceUrl'] as String?,
      vendorCreatedAt: timeStampFromJson(json['vendorCreatedAt']),
      vendorSeverity: json['vendorSeverity'] as String?,
      vendorUpdatedAt: timeStampFromJson(json['vendorUpdatedAt']),
      vulnerablePackages: (json['vulnerablePackages'] as List?)
          ?.nonNulls
          .map((e) => VulnerablePackage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final vulnerabilityId = this.vulnerabilityId;
    final cvss = this.cvss;
    final referenceUrls = this.referenceUrls;
    final relatedVulnerabilities = this.relatedVulnerabilities;
    final sourceUrl = this.sourceUrl;
    final vendorCreatedAt = this.vendorCreatedAt;
    final vendorSeverity = this.vendorSeverity;
    final vendorUpdatedAt = this.vendorUpdatedAt;
    final vulnerablePackages = this.vulnerablePackages;
    return {
      'source': source,
      'vulnerabilityId': vulnerabilityId,
      if (cvss != null) 'cvss': cvss,
      if (referenceUrls != null) 'referenceUrls': referenceUrls,
      if (relatedVulnerabilities != null)
        'relatedVulnerabilities': relatedVulnerabilities,
      if (sourceUrl != null) 'sourceUrl': sourceUrl,
      if (vendorCreatedAt != null)
        'vendorCreatedAt': unixTimestampToJson(vendorCreatedAt),
      if (vendorSeverity != null) 'vendorSeverity': vendorSeverity,
      if (vendorUpdatedAt != null)
        'vendorUpdatedAt': unixTimestampToJson(vendorUpdatedAt),
      if (vulnerablePackages != null) 'vulnerablePackages': vulnerablePackages,
    };
  }
}

/// @nodoc
class FixAvailable {
  static const yes = FixAvailable._('YES');
  static const no = FixAvailable._('NO');
  static const partial = FixAvailable._('PARTIAL');

  final String value;

  const FixAvailable._(this.value);

  static const values = [yes, no, partial];

  static FixAvailable fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FixAvailable._(value));

  @override
  bool operator ==(other) => other is FixAvailable && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ExploitAvailable {
  static const yes = ExploitAvailable._('YES');
  static const no = ExploitAvailable._('NO');

  final String value;

  const ExploitAvailable._(this.value);

  static const values = [yes, no];

  static ExploitAvailable fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExploitAvailable._(value));

  @override
  bool operator ==(other) => other is ExploitAvailable && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of an exploit available for a finding discovered in your
/// environment.
///
/// @nodoc
class ExploitabilityDetails {
  /// The date and time of the last exploit associated with a finding discovered
  /// in your environment.
  final DateTime? lastKnownExploitAt;

  ExploitabilityDetails({
    this.lastKnownExploitAt,
  });

  factory ExploitabilityDetails.fromJson(Map<String, dynamic> json) {
    return ExploitabilityDetails(
      lastKnownExploitAt: timeStampFromJson(json['lastKnownExploitAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final lastKnownExploitAt = this.lastKnownExploitAt;
    return {
      if (lastKnownExploitAt != null)
        'lastKnownExploitAt': unixTimestampToJson(lastKnownExploitAt),
    };
  }
}

/// Contains information on the code vulnerability identified in your Lambda
/// function.
///
/// @nodoc
class CodeVulnerabilityDetails {
  /// The Common Weakness Enumeration (CWE) item associated with the detected
  /// vulnerability.
  final List<String> cwes;

  /// The ID for the Amazon CodeGuru detector associated with the finding. For
  /// more information on detectors see <a
  /// href="https://docs.aws.amazon.com/codeguru/detector-library">Amazon CodeGuru
  /// Detector Library</a>.
  final String detectorId;

  /// The name of the detector used to identify the code vulnerability. For more
  /// information on detectors see <a
  /// href="https://docs.aws.amazon.com/codeguru/detector-library">CodeGuru
  /// Detector Library</a>.
  final String detectorName;

  /// Contains information on where the code vulnerability is located in your
  /// code.
  final CodeFilePath filePath;

  /// The detector tag associated with the vulnerability. Detector tags group
  /// related vulnerabilities by common themes or tactics. For a list of available
  /// tags by programming language, see <a
  /// href="https://docs.aws.amazon.com/codeguru/detector-library/java/tags/">Java
  /// tags</a>, or <a
  /// href="https://docs.aws.amazon.com/codeguru/detector-library/python/tags/">Python
  /// tags</a>.
  final List<String>? detectorTags;

  /// A URL containing supporting documentation about the code vulnerability
  /// detected.
  final List<String>? referenceUrls;

  /// The identifier for a rule that was used to detect the code vulnerability.
  final String? ruleId;

  /// The Amazon Resource Name (ARN) of the Lambda layer that the code
  /// vulnerability was detected in.
  final String? sourceLambdaLayerArn;

  CodeVulnerabilityDetails({
    required this.cwes,
    required this.detectorId,
    required this.detectorName,
    required this.filePath,
    this.detectorTags,
    this.referenceUrls,
    this.ruleId,
    this.sourceLambdaLayerArn,
  });

  factory CodeVulnerabilityDetails.fromJson(Map<String, dynamic> json) {
    return CodeVulnerabilityDetails(
      cwes: ((json['cwes'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      detectorId: (json['detectorId'] as String?) ?? '',
      detectorName: (json['detectorName'] as String?) ?? '',
      filePath: CodeFilePath.fromJson(
          (json['filePath'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      detectorTags: (json['detectorTags'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      referenceUrls: (json['referenceUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ruleId: json['ruleId'] as String?,
      sourceLambdaLayerArn: json['sourceLambdaLayerArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cwes = this.cwes;
    final detectorId = this.detectorId;
    final detectorName = this.detectorName;
    final filePath = this.filePath;
    final detectorTags = this.detectorTags;
    final referenceUrls = this.referenceUrls;
    final ruleId = this.ruleId;
    final sourceLambdaLayerArn = this.sourceLambdaLayerArn;
    return {
      'cwes': cwes,
      'detectorId': detectorId,
      'detectorName': detectorName,
      'filePath': filePath,
      if (detectorTags != null) 'detectorTags': detectorTags,
      if (referenceUrls != null) 'referenceUrls': referenceUrls,
      if (ruleId != null) 'ruleId': ruleId,
      if (sourceLambdaLayerArn != null)
        'sourceLambdaLayerArn': sourceLambdaLayerArn,
    };
  }
}

/// Details about the Exploit Prediction Scoring System (EPSS) score for a
/// finding.
///
/// @nodoc
class EpssDetails {
  /// The EPSS score.
  final double? score;

  EpssDetails({
    this.score,
  });

  factory EpssDetails.fromJson(Map<String, dynamic> json) {
    return EpssDetails(
      score: _s.parseJsonDouble(json['score']),
    );
  }

  Map<String, dynamic> toJson() {
    final score = this.score;
    return {
      if (score != null) 'score': _s.encodeJsonDouble(score),
    };
  }
}

/// Contains information on where a code vulnerability is located in your Lambda
/// function.
///
/// @nodoc
class CodeFilePath {
  /// The line number of the last line of code that a vulnerability was found in.
  final int endLine;

  /// The name of the file the code vulnerability was found in.
  final String fileName;

  /// The file path to the code that a vulnerability was found in.
  final String filePath;

  /// The line number of the first line of code that a vulnerability was found in.
  final int startLine;

  CodeFilePath({
    required this.endLine,
    required this.fileName,
    required this.filePath,
    required this.startLine,
  });

  factory CodeFilePath.fromJson(Map<String, dynamic> json) {
    return CodeFilePath(
      endLine: (json['endLine'] as int?) ?? 0,
      fileName: (json['fileName'] as String?) ?? '',
      filePath: (json['filePath'] as String?) ?? '',
      startLine: (json['startLine'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final endLine = this.endLine;
    final fileName = this.fileName;
    final filePath = this.filePath;
    final startLine = this.startLine;
    return {
      'endLine': endLine,
      'fileName': fileName,
      'filePath': filePath,
      'startLine': startLine,
    };
  }
}

/// The CVSS score for a finding.
///
/// @nodoc
class CvssScore {
  /// The base CVSS score used for the finding.
  final double baseScore;

  /// The vector string of the CVSS score.
  final String scoringVector;

  /// The source of the CVSS score.
  final String source;

  /// The version of CVSS used for the score.
  final String version;

  CvssScore({
    required this.baseScore,
    required this.scoringVector,
    required this.source,
    required this.version,
  });

  factory CvssScore.fromJson(Map<String, dynamic> json) {
    return CvssScore(
      baseScore: _s.parseJsonDouble(json['baseScore']) ?? 0,
      scoringVector: (json['scoringVector'] as String?) ?? '',
      source: (json['source'] as String?) ?? '',
      version: (json['version'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final baseScore = this.baseScore;
    final scoringVector = this.scoringVector;
    final source = this.source;
    final version = this.version;
    return {
      'baseScore': _s.encodeJsonDouble(baseScore),
      'scoringVector': scoringVector,
      'source': source,
      'version': version,
    };
  }
}

/// Information on the vulnerable package identified by a finding.
///
/// @nodoc
class VulnerablePackage {
  /// The name of the vulnerable package.
  final String name;

  /// The version of the vulnerable package.
  final String version;

  /// The architecture of the vulnerable package.
  final String? arch;

  /// The epoch of the vulnerable package.
  final int? epoch;

  /// The file path of the vulnerable package.
  final String? filePath;

  /// The version of the package that contains the vulnerability fix.
  final String? fixedInVersion;

  /// The package manager of the vulnerable package.
  final PackageManager? packageManager;

  /// The release of the vulnerable package.
  final String? release;

  /// The code to run in your environment to update packages with a fix available.
  final String? remediation;

  /// The Amazon Resource Number (ARN) of the Amazon Web Services Lambda function
  /// affected by a finding.
  final String? sourceLambdaLayerArn;

  /// The source layer hash of the vulnerable package.
  final String? sourceLayerHash;

  VulnerablePackage({
    required this.name,
    required this.version,
    this.arch,
    this.epoch,
    this.filePath,
    this.fixedInVersion,
    this.packageManager,
    this.release,
    this.remediation,
    this.sourceLambdaLayerArn,
    this.sourceLayerHash,
  });

  factory VulnerablePackage.fromJson(Map<String, dynamic> json) {
    return VulnerablePackage(
      name: (json['name'] as String?) ?? '',
      version: (json['version'] as String?) ?? '',
      arch: json['arch'] as String?,
      epoch: json['epoch'] as int?,
      filePath: json['filePath'] as String?,
      fixedInVersion: json['fixedInVersion'] as String?,
      packageManager:
          (json['packageManager'] as String?)?.let(PackageManager.fromString),
      release: json['release'] as String?,
      remediation: json['remediation'] as String?,
      sourceLambdaLayerArn: json['sourceLambdaLayerArn'] as String?,
      sourceLayerHash: json['sourceLayerHash'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    final arch = this.arch;
    final epoch = this.epoch;
    final filePath = this.filePath;
    final fixedInVersion = this.fixedInVersion;
    final packageManager = this.packageManager;
    final release = this.release;
    final remediation = this.remediation;
    final sourceLambdaLayerArn = this.sourceLambdaLayerArn;
    final sourceLayerHash = this.sourceLayerHash;
    return {
      'name': name,
      'version': version,
      if (arch != null) 'arch': arch,
      if (epoch != null) 'epoch': epoch,
      if (filePath != null) 'filePath': filePath,
      if (fixedInVersion != null) 'fixedInVersion': fixedInVersion,
      if (packageManager != null) 'packageManager': packageManager.value,
      if (release != null) 'release': release,
      if (remediation != null) 'remediation': remediation,
      if (sourceLambdaLayerArn != null)
        'sourceLambdaLayerArn': sourceLambdaLayerArn,
      if (sourceLayerHash != null) 'sourceLayerHash': sourceLayerHash,
    };
  }
}

/// @nodoc
class PackageManager {
  static const bundler = PackageManager._('BUNDLER');
  static const cargo = PackageManager._('CARGO');
  static const composer = PackageManager._('COMPOSER');
  static const npm = PackageManager._('NPM');
  static const nuget = PackageManager._('NUGET');
  static const pipenv = PackageManager._('PIPENV');
  static const poetry = PackageManager._('POETRY');
  static const yarn = PackageManager._('YARN');
  static const gobinary = PackageManager._('GOBINARY');
  static const gomod = PackageManager._('GOMOD');
  static const jar = PackageManager._('JAR');
  static const os = PackageManager._('OS');
  static const pip = PackageManager._('PIP');
  static const pythonpkg = PackageManager._('PYTHONPKG');
  static const nodepkg = PackageManager._('NODEPKG');
  static const pom = PackageManager._('POM');
  static const gemspec = PackageManager._('GEMSPEC');
  static const dotnetCore = PackageManager._('DOTNET_CORE');

  final String value;

  const PackageManager._(this.value);

  static const values = [
    bundler,
    cargo,
    composer,
    npm,
    nuget,
    pipenv,
    poetry,
    yarn,
    gobinary,
    gomod,
    jar,
    os,
    pip,
    pythonpkg,
    nodepkg,
    pom,
    gemspec,
    dotnetCore
  ];

  static PackageManager fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PackageManager._(value));

  @override
  bool operator ==(other) => other is PackageManager && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the port range associated with a finding.
///
/// @nodoc
class PortRange {
  /// The beginning port in a port range.
  final int begin;

  /// The ending port in a port range.
  final int end;

  PortRange({
    required this.begin,
    required this.end,
  });

  factory PortRange.fromJson(Map<String, dynamic> json) {
    return PortRange(
      begin: (json['begin'] as int?) ?? 0,
      end: (json['end'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final begin = this.begin;
    final end = this.end;
    return {
      'begin': begin,
      'end': end,
    };
  }
}

/// @nodoc
class NetworkProtocol {
  static const tcp = NetworkProtocol._('TCP');
  static const udp = NetworkProtocol._('UDP');

  final String value;

  const NetworkProtocol._(this.value);

  static const values = [tcp, udp];

  static NetworkProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkProtocol._(value));

  @override
  bool operator ==(other) => other is NetworkProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information on the network path associated with a finding.
///
/// @nodoc
class NetworkPath {
  /// The details on the steps in the network path.
  final List<Step>? steps;

  NetworkPath({
    this.steps,
  });

  factory NetworkPath.fromJson(Map<String, dynamic> json) {
    return NetworkPath(
      steps: (json['steps'] as List?)
          ?.nonNulls
          .map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final steps = this.steps;
    return {
      if (steps != null) 'steps': steps,
    };
  }
}

/// Details about the step associated with a finding.
///
/// @nodoc
class Step {
  /// The component ID.
  final String componentId;

  /// The component type.
  final String componentType;

  /// The component ARN. The ARN can be null and is not displayed in the Amazon
  /// Web Services console.
  final String? componentArn;

  Step({
    required this.componentId,
    required this.componentType,
    this.componentArn,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      componentId: (json['componentId'] as String?) ?? '',
      componentType: (json['componentType'] as String?) ?? '',
      componentArn: json['componentArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentId = this.componentId;
    final componentType = this.componentType;
    final componentArn = this.componentArn;
    return {
      'componentId': componentId,
      'componentType': componentType,
      if (componentArn != null) 'componentArn': componentArn,
    };
  }
}

/// Information about the CVSS score.
///
/// @nodoc
class CvssScoreDetails {
  /// The CVSS score.
  final double score;

  /// The source for the CVSS score.
  final String scoreSource;

  /// The vector for the CVSS score.
  final String scoringVector;

  /// The CVSS version used in scoring.
  final String version;

  /// An object that contains details about adjustment Amazon Inspector made to
  /// the CVSS score.
  final List<CvssScoreAdjustment>? adjustments;

  /// The source of the CVSS data.
  final String? cvssSource;

  CvssScoreDetails({
    required this.score,
    required this.scoreSource,
    required this.scoringVector,
    required this.version,
    this.adjustments,
    this.cvssSource,
  });

  factory CvssScoreDetails.fromJson(Map<String, dynamic> json) {
    return CvssScoreDetails(
      score: _s.parseJsonDouble(json['score']) ?? 0,
      scoreSource: (json['scoreSource'] as String?) ?? '',
      scoringVector: (json['scoringVector'] as String?) ?? '',
      version: (json['version'] as String?) ?? '',
      adjustments: (json['adjustments'] as List?)
          ?.nonNulls
          .map((e) => CvssScoreAdjustment.fromJson(e as Map<String, dynamic>))
          .toList(),
      cvssSource: json['cvssSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final score = this.score;
    final scoreSource = this.scoreSource;
    final scoringVector = this.scoringVector;
    final version = this.version;
    final adjustments = this.adjustments;
    final cvssSource = this.cvssSource;
    return {
      'score': _s.encodeJsonDouble(score),
      'scoreSource': scoreSource,
      'scoringVector': scoringVector,
      'version': version,
      if (adjustments != null) 'adjustments': adjustments,
      if (cvssSource != null) 'cvssSource': cvssSource,
    };
  }
}

/// Details on adjustments Amazon Inspector made to the CVSS score for a
/// finding.
///
/// @nodoc
class CvssScoreAdjustment {
  /// The metric used to adjust the CVSS score.
  final String metric;

  /// The reason the CVSS score has been adjustment.
  final String reason;

  CvssScoreAdjustment({
    required this.metric,
    required this.reason,
  });

  factory CvssScoreAdjustment.fromJson(Map<String, dynamic> json) {
    return CvssScoreAdjustment(
      metric: (json['metric'] as String?) ?? '',
      reason: (json['reason'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final reason = this.reason;
    return {
      'metric': metric,
      'reason': reason,
    };
  }
}

/// Details about the resource involved in a finding.
///
/// @nodoc
class Resource {
  /// The ID of the resource.
  final String id;

  /// The type of resource.
  final ResourceType type;

  /// An object that contains details about the resource involved in a finding.
  final ResourceDetails? details;

  /// The partition of the resource.
  final String? partition;

  /// The Amazon Web Services Region the impacted resource is located in.
  final String? region;

  /// The tags attached to the resource.
  final Map<String, String>? tags;

  Resource({
    required this.id,
    required this.type,
    this.details,
    this.partition,
    this.region,
    this.tags,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: (json['id'] as String?) ?? '',
      type: ResourceType.fromString((json['type'] as String?) ?? ''),
      details: json['details'] != null
          ? ResourceDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
      partition: json['partition'] as String?,
      region: json['region'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    final details = this.details;
    final partition = this.partition;
    final region = this.region;
    final tags = this.tags;
    return {
      'id': id,
      'type': type.value,
      if (details != null) 'details': details,
      if (partition != null) 'partition': partition,
      if (region != null) 'region': region,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Contains details about the resource involved in the finding.
///
/// @nodoc
class ResourceDetails {
  /// An object that contains details about the Amazon EC2 instance involved in
  /// the finding.
  final AwsEc2InstanceDetails? awsEc2Instance;

  /// An object that contains details about the Amazon ECR container image
  /// involved in the finding.
  final AwsEcrContainerImageDetails? awsEcrContainerImage;

  /// A summary of the information about an Amazon Web Services Lambda function
  /// affected by a finding.
  final AwsLambdaFunctionDetails? awsLambdaFunction;

  /// Contains details about a code repository resource associated with a finding.
  final CodeRepositoryDetails? codeRepository;

  ResourceDetails({
    this.awsEc2Instance,
    this.awsEcrContainerImage,
    this.awsLambdaFunction,
    this.codeRepository,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      awsEc2Instance: json['awsEc2Instance'] != null
          ? AwsEc2InstanceDetails.fromJson(
              json['awsEc2Instance'] as Map<String, dynamic>)
          : null,
      awsEcrContainerImage: json['awsEcrContainerImage'] != null
          ? AwsEcrContainerImageDetails.fromJson(
              json['awsEcrContainerImage'] as Map<String, dynamic>)
          : null,
      awsLambdaFunction: json['awsLambdaFunction'] != null
          ? AwsLambdaFunctionDetails.fromJson(
              json['awsLambdaFunction'] as Map<String, dynamic>)
          : null,
      codeRepository: json['codeRepository'] != null
          ? CodeRepositoryDetails.fromJson(
              json['codeRepository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsEc2Instance = this.awsEc2Instance;
    final awsEcrContainerImage = this.awsEcrContainerImage;
    final awsLambdaFunction = this.awsLambdaFunction;
    final codeRepository = this.codeRepository;
    return {
      if (awsEc2Instance != null) 'awsEc2Instance': awsEc2Instance,
      if (awsEcrContainerImage != null)
        'awsEcrContainerImage': awsEcrContainerImage,
      if (awsLambdaFunction != null) 'awsLambdaFunction': awsLambdaFunction,
      if (codeRepository != null) 'codeRepository': codeRepository,
    };
  }
}

/// Details of the Amazon EC2 instance involved in a finding.
///
/// @nodoc
class AwsEc2InstanceDetails {
  /// The IAM instance profile ARN of the Amazon EC2 instance.
  final String? iamInstanceProfileArn;

  /// The image ID of the Amazon EC2 instance.
  final String? imageId;

  /// The IPv4 addresses of the Amazon EC2 instance.
  final List<String>? ipV4Addresses;

  /// The IPv6 addresses of the Amazon EC2 instance.
  final List<String>? ipV6Addresses;

  /// The name of the key pair used to launch the Amazon EC2 instance.
  final String? keyName;

  /// The date and time the Amazon EC2 instance was launched at.
  final DateTime? launchedAt;

  /// The platform of the Amazon EC2 instance.
  final String? platform;

  /// The subnet ID of the Amazon EC2 instance.
  final String? subnetId;

  /// The type of the Amazon EC2 instance.
  final String? type;

  /// The VPC ID of the Amazon EC2 instance.
  final String? vpcId;

  AwsEc2InstanceDetails({
    this.iamInstanceProfileArn,
    this.imageId,
    this.ipV4Addresses,
    this.ipV6Addresses,
    this.keyName,
    this.launchedAt,
    this.platform,
    this.subnetId,
    this.type,
    this.vpcId,
  });

  factory AwsEc2InstanceDetails.fromJson(Map<String, dynamic> json) {
    return AwsEc2InstanceDetails(
      iamInstanceProfileArn: json['iamInstanceProfileArn'] as String?,
      imageId: json['imageId'] as String?,
      ipV4Addresses: (json['ipV4Addresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ipV6Addresses: (json['ipV6Addresses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      keyName: json['keyName'] as String?,
      launchedAt: timeStampFromJson(json['launchedAt']),
      platform: json['platform'] as String?,
      subnetId: json['subnetId'] as String?,
      type: json['type'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iamInstanceProfileArn = this.iamInstanceProfileArn;
    final imageId = this.imageId;
    final ipV4Addresses = this.ipV4Addresses;
    final ipV6Addresses = this.ipV6Addresses;
    final keyName = this.keyName;
    final launchedAt = this.launchedAt;
    final platform = this.platform;
    final subnetId = this.subnetId;
    final type = this.type;
    final vpcId = this.vpcId;
    return {
      if (iamInstanceProfileArn != null)
        'iamInstanceProfileArn': iamInstanceProfileArn,
      if (imageId != null) 'imageId': imageId,
      if (ipV4Addresses != null) 'ipV4Addresses': ipV4Addresses,
      if (ipV6Addresses != null) 'ipV6Addresses': ipV6Addresses,
      if (keyName != null) 'keyName': keyName,
      if (launchedAt != null) 'launchedAt': unixTimestampToJson(launchedAt),
      if (platform != null) 'platform': platform,
      if (subnetId != null) 'subnetId': subnetId,
      if (type != null) 'type': type,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// The image details of the Amazon ECR container image.
///
/// @nodoc
class AwsEcrContainerImageDetails {
  /// The image hash of the Amazon ECR container image.
  final String imageHash;

  /// The registry for the Amazon ECR container image.
  final String registry;

  /// The name of the repository the Amazon ECR container image resides in.
  final String repositoryName;

  /// The architecture of the Amazon ECR container image.
  final String? architecture;

  /// The image author of the Amazon ECR container image.
  final String? author;

  /// The image tags attached to the Amazon ECR container image.
  final List<String>? imageTags;

  /// The number of Amazon ECS tasks or Amazon EKS pods where the Amazon ECR
  /// container image is in use.
  final int? inUseCount;

  /// The last time an Amazon ECR image was used in an Amazon ECS task or Amazon
  /// EKS pod.
  final DateTime? lastInUseAt;

  /// The platform of the Amazon ECR container image.
  final String? platform;

  /// The date and time the Amazon ECR container image was pushed.
  final DateTime? pushedAt;

  AwsEcrContainerImageDetails({
    required this.imageHash,
    required this.registry,
    required this.repositoryName,
    this.architecture,
    this.author,
    this.imageTags,
    this.inUseCount,
    this.lastInUseAt,
    this.platform,
    this.pushedAt,
  });

  factory AwsEcrContainerImageDetails.fromJson(Map<String, dynamic> json) {
    return AwsEcrContainerImageDetails(
      imageHash: (json['imageHash'] as String?) ?? '',
      registry: (json['registry'] as String?) ?? '',
      repositoryName: (json['repositoryName'] as String?) ?? '',
      architecture: json['architecture'] as String?,
      author: json['author'] as String?,
      imageTags: (json['imageTags'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      inUseCount: json['inUseCount'] as int?,
      lastInUseAt: timeStampFromJson(json['lastInUseAt']),
      platform: json['platform'] as String?,
      pushedAt: timeStampFromJson(json['pushedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final imageHash = this.imageHash;
    final registry = this.registry;
    final repositoryName = this.repositoryName;
    final architecture = this.architecture;
    final author = this.author;
    final imageTags = this.imageTags;
    final inUseCount = this.inUseCount;
    final lastInUseAt = this.lastInUseAt;
    final platform = this.platform;
    final pushedAt = this.pushedAt;
    return {
      'imageHash': imageHash,
      'registry': registry,
      'repositoryName': repositoryName,
      if (architecture != null) 'architecture': architecture,
      if (author != null) 'author': author,
      if (imageTags != null) 'imageTags': imageTags,
      if (inUseCount != null) 'inUseCount': inUseCount,
      if (lastInUseAt != null) 'lastInUseAt': unixTimestampToJson(lastInUseAt),
      if (platform != null) 'platform': platform,
      if (pushedAt != null) 'pushedAt': unixTimestampToJson(pushedAt),
    };
  }
}

/// A summary of information about the Amazon Web Services Lambda function.
///
/// @nodoc
class AwsLambdaFunctionDetails {
  /// The SHA256 hash of the Amazon Web Services Lambda function's deployment
  /// package.
  final String codeSha256;

  /// The Amazon Web Services Lambda function's execution role.
  final String executionRoleArn;

  /// The name of the Amazon Web Services Lambda function.
  final String functionName;

  /// The runtime environment for the Amazon Web Services Lambda function.
  final Runtime runtime;

  /// The version of the Amazon Web Services Lambda function.
  final String version;

  /// The instruction set architecture that the Amazon Web Services Lambda
  /// function supports. Architecture is a string array with one of the valid
  /// values. The default architecture value is <code>x86_64</code>.
  final List<Architecture>? architectures;

  /// The date and time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>
  final DateTime? lastModifiedAt;

  /// The Amazon Web Services Lambda function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">
  /// layers</a>. A Lambda function can have up to five layers.
  final List<String>? layers;

  /// The type of deployment package. Set to <code>Image</code> for container
  /// image and set <code>Zip</code> for .zip file archive.
  final PackageType? packageType;

  /// The Amazon Web Services Lambda function's networking configuration.
  final LambdaVpcConfig? vpcConfig;

  AwsLambdaFunctionDetails({
    required this.codeSha256,
    required this.executionRoleArn,
    required this.functionName,
    required this.runtime,
    required this.version,
    this.architectures,
    this.lastModifiedAt,
    this.layers,
    this.packageType,
    this.vpcConfig,
  });

  factory AwsLambdaFunctionDetails.fromJson(Map<String, dynamic> json) {
    return AwsLambdaFunctionDetails(
      codeSha256: (json['codeSha256'] as String?) ?? '',
      executionRoleArn: (json['executionRoleArn'] as String?) ?? '',
      functionName: (json['functionName'] as String?) ?? '',
      runtime: Runtime.fromString((json['runtime'] as String?) ?? ''),
      version: (json['version'] as String?) ?? '',
      architectures: (json['architectures'] as List?)
          ?.nonNulls
          .map((e) => Architecture.fromString((e as String)))
          .toList(),
      lastModifiedAt: timeStampFromJson(json['lastModifiedAt']),
      layers:
          (json['layers'] as List?)?.nonNulls.map((e) => e as String).toList(),
      packageType:
          (json['packageType'] as String?)?.let(PackageType.fromString),
      vpcConfig: json['vpcConfig'] != null
          ? LambdaVpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSha256 = this.codeSha256;
    final executionRoleArn = this.executionRoleArn;
    final functionName = this.functionName;
    final runtime = this.runtime;
    final version = this.version;
    final architectures = this.architectures;
    final lastModifiedAt = this.lastModifiedAt;
    final layers = this.layers;
    final packageType = this.packageType;
    final vpcConfig = this.vpcConfig;
    return {
      'codeSha256': codeSha256,
      'executionRoleArn': executionRoleArn,
      'functionName': functionName,
      'runtime': runtime.value,
      'version': version,
      if (architectures != null)
        'architectures': architectures.map((e) => e.value).toList(),
      if (lastModifiedAt != null)
        'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      if (layers != null) 'layers': layers,
      if (packageType != null) 'packageType': packageType.value,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// Contains details about a code repository associated with a finding.
///
/// @nodoc
class CodeRepositoryDetails {
  /// The Amazon Resource Name (ARN) of the code security integration associated
  /// with the repository.
  final String? integrationArn;

  /// The name of the project in the code repository.
  final String? projectName;

  /// The type of repository provider (such as GitHub, GitLab, etc.).
  final CodeRepositoryProviderType? providerType;

  CodeRepositoryDetails({
    this.integrationArn,
    this.projectName,
    this.providerType,
  });

  factory CodeRepositoryDetails.fromJson(Map<String, dynamic> json) {
    return CodeRepositoryDetails(
      integrationArn: json['integrationArn'] as String?,
      projectName: json['projectName'] as String?,
      providerType: (json['providerType'] as String?)
          ?.let(CodeRepositoryProviderType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final integrationArn = this.integrationArn;
    final projectName = this.projectName;
    final providerType = this.providerType;
    return {
      if (integrationArn != null) 'integrationArn': integrationArn,
      if (projectName != null) 'projectName': projectName,
      if (providerType != null) 'providerType': providerType.value,
    };
  }
}

/// @nodoc
class CodeRepositoryProviderType {
  static const github = CodeRepositoryProviderType._('GITHUB');
  static const gitlabSelfManaged =
      CodeRepositoryProviderType._('GITLAB_SELF_MANAGED');

  final String value;

  const CodeRepositoryProviderType._(this.value);

  static const values = [github, gitlabSelfManaged];

  static CodeRepositoryProviderType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CodeRepositoryProviderType._(value));

  @override
  bool operator ==(other) =>
      other is CodeRepositoryProviderType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Runtime {
  static const nodejs = Runtime._('NODEJS');
  static const nodejs_12X = Runtime._('NODEJS_12_X');
  static const nodejs_14X = Runtime._('NODEJS_14_X');
  static const nodejs_16X = Runtime._('NODEJS_16_X');
  static const java_8 = Runtime._('JAVA_8');
  static const java_8Al2 = Runtime._('JAVA_8_AL2');
  static const java_11 = Runtime._('JAVA_11');
  static const python_3_7 = Runtime._('PYTHON_3_7');
  static const python_3_8 = Runtime._('PYTHON_3_8');
  static const python_3_9 = Runtime._('PYTHON_3_9');
  static const unsupported = Runtime._('UNSUPPORTED');
  static const nodejs_18X = Runtime._('NODEJS_18_X');
  static const go_1X = Runtime._('GO_1_X');
  static const java_17 = Runtime._('JAVA_17');
  static const python_3_10 = Runtime._('PYTHON_3_10');
  static const python_3_11 = Runtime._('PYTHON_3_11');
  static const dotnetcore_3_1 = Runtime._('DOTNETCORE_3_1');
  static const dotnet_6 = Runtime._('DOTNET_6');
  static const dotnet_7 = Runtime._('DOTNET_7');
  static const ruby_2_7 = Runtime._('RUBY_2_7');
  static const ruby_3_2 = Runtime._('RUBY_3_2');
  static const dotnet_10 = Runtime._('DOTNET_10');
  static const nodejs_24X = Runtime._('NODEJS_24_X');

  final String value;

  const Runtime._(this.value);

  static const values = [
    nodejs,
    nodejs_12X,
    nodejs_14X,
    nodejs_16X,
    java_8,
    java_8Al2,
    java_11,
    python_3_7,
    python_3_8,
    python_3_9,
    unsupported,
    nodejs_18X,
    go_1X,
    java_17,
    python_3_10,
    python_3_11,
    dotnetcore_3_1,
    dotnet_6,
    dotnet_7,
    ruby_2_7,
    ruby_3_2,
    dotnet_10,
    nodejs_24X
  ];

  static Runtime fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Runtime._(value));

  @override
  bool operator ==(other) => other is Runtime && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The VPC security groups and subnets that are attached to an Amazon Web
/// Services Lambda function. For more information, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">VPC
/// Settings</a>.
///
/// @nodoc
class LambdaVpcConfig {
  /// The VPC security groups and subnets that are attached to an Amazon Web
  /// Services Lambda function. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">VPC
  /// Settings</a>.
  final List<String>? securityGroupIds;

  /// A list of VPC subnet IDs.
  final List<String>? subnetIds;

  /// The ID of the VPC.
  final String? vpcId;

  LambdaVpcConfig({
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory LambdaVpcConfig.fromJson(Map<String, dynamic> json) {
    return LambdaVpcConfig(
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// @nodoc
class PackageType {
  static const image = PackageType._('IMAGE');
  static const zip = PackageType._('ZIP');

  final String value;

  const PackageType._(this.value);

  static const values = [image, zip];

  static PackageType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PackageType._(value));

  @override
  bool operator ==(other) => other is PackageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Architecture {
  static const x86_64 = Architecture._('X86_64');
  static const arm64 = Architecture._('ARM64');

  final String value;

  const Architecture._(this.value);

  static const values = [x86_64, arm64];

  static Architecture fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Architecture._(value));

  @override
  bool operator ==(other) => other is Architecture && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the recommended course of action to remediate the finding.
///
/// @nodoc
class Recommendation {
  /// The URL address to the CVE remediation recommendations.
  final String? url;

  /// The recommended course of action to remediate the finding.
  final String? text;

  Recommendation({
    this.url,
    this.text,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      url: json['Url'] as String?,
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    final text = this.text;
    return {
      if (url != null) 'Url': url,
      if (text != null) 'text': text,
    };
  }
}

/// Details about the criteria used to sort finding results.
///
/// @nodoc
class SortCriteria {
  /// The finding detail field by which results are sorted.
  final SortField field;

  /// The order by which findings are sorted.
  final SortOrder sortOrder;

  SortCriteria({
    required this.field,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final field = this.field;
    final sortOrder = this.sortOrder;
    return {
      'field': field.value,
      'sortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class SortField {
  static const awsAccountId = SortField._('AWS_ACCOUNT_ID');
  static const findingType = SortField._('FINDING_TYPE');
  static const severity = SortField._('SEVERITY');
  static const firstObservedAt = SortField._('FIRST_OBSERVED_AT');
  static const lastObservedAt = SortField._('LAST_OBSERVED_AT');
  static const findingStatus = SortField._('FINDING_STATUS');
  static const resourceType = SortField._('RESOURCE_TYPE');
  static const ecrImagePushedAt = SortField._('ECR_IMAGE_PUSHED_AT');
  static const ecrImageRepositoryName =
      SortField._('ECR_IMAGE_REPOSITORY_NAME');
  static const ecrImageRegistry = SortField._('ECR_IMAGE_REGISTRY');
  static const networkProtocol = SortField._('NETWORK_PROTOCOL');
  static const componentType = SortField._('COMPONENT_TYPE');
  static const vulnerabilityId = SortField._('VULNERABILITY_ID');
  static const vulnerabilitySource = SortField._('VULNERABILITY_SOURCE');
  static const inspectorScore = SortField._('INSPECTOR_SCORE');
  static const vendorSeverity = SortField._('VENDOR_SEVERITY');
  static const epssScore = SortField._('EPSS_SCORE');

  final String value;

  const SortField._(this.value);

  static const values = [
    awsAccountId,
    findingType,
    severity,
    firstObservedAt,
    lastObservedAt,
    findingStatus,
    resourceType,
    ecrImagePushedAt,
    ecrImageRepositoryName,
    ecrImageRegistry,
    networkProtocol,
    componentType,
    vulnerabilityId,
    vulnerabilitySource,
    inspectorScore,
    vendorSeverity,
    epssScore
  ];

  static SortField fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortField._(value));

  @override
  bool operator ==(other) => other is SortField && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SortOrder {
  static const asc = SortOrder._('ASC');
  static const desc = SortOrder._('DESC');

  final String value;

  const SortOrder._(this.value);

  static const values = [asc, desc];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AggregationType {
  static const findingType = AggregationType._('FINDING_TYPE');
  static const package = AggregationType._('PACKAGE');
  static const title = AggregationType._('TITLE');
  static const repository = AggregationType._('REPOSITORY');
  static const ami = AggregationType._('AMI');
  static const awsEc2Instance = AggregationType._('AWS_EC2_INSTANCE');
  static const awsEcrContainer = AggregationType._('AWS_ECR_CONTAINER');
  static const imageLayer = AggregationType._('IMAGE_LAYER');
  static const account = AggregationType._('ACCOUNT');
  static const awsLambdaFunction = AggregationType._('AWS_LAMBDA_FUNCTION');
  static const lambdaLayer = AggregationType._('LAMBDA_LAYER');
  static const codeRepository = AggregationType._('CODE_REPOSITORY');

  final String value;

  const AggregationType._(this.value);

  static const values = [
    findingType,
    package,
    title,
    repository,
    ami,
    awsEc2Instance,
    awsEcrContainer,
    imageLayer,
    account,
    awsLambdaFunction,
    lambdaLayer,
    codeRepository
  ];

  static AggregationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AggregationType._(value));

  @override
  bool operator ==(other) => other is AggregationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains details about the results of an aggregation type.
///
/// @nodoc
class AggregationResponse {
  /// An object that contains details about an aggregation response based on
  /// Amazon Web Services account IDs.
  final AccountAggregationResponse? accountAggregation;

  /// An object that contains details about an aggregation response based on
  /// Amazon Machine Images (AMIs).
  final AmiAggregationResponse? amiAggregation;

  /// An object that contains details about an aggregation response based on
  /// Amazon ECR container images.
  final AwsEcrContainerAggregationResponse? awsEcrContainerAggregation;

  /// An object that contains details about an aggregation response based on code
  /// repositories.
  final CodeRepositoryAggregationResponse? codeRepositoryAggregation;

  /// An object that contains details about an aggregation response based on
  /// Amazon EC2 instances.
  final Ec2InstanceAggregationResponse? ec2InstanceAggregation;

  /// An object that contains details about an aggregation response based on
  /// finding types.
  final FindingTypeAggregationResponse? findingTypeAggregation;

  /// An object that contains details about an aggregation response based on
  /// container image layers.
  final ImageLayerAggregationResponse? imageLayerAggregation;

  /// An aggregation of findings by Amazon Web Services Lambda function.
  final LambdaFunctionAggregationResponse? lambdaFunctionAggregation;

  /// An aggregation of findings by Amazon Web Services Lambda layer.
  final LambdaLayerAggregationResponse? lambdaLayerAggregation;

  /// An object that contains details about an aggregation response based on
  /// operating system package type.
  final PackageAggregationResponse? packageAggregation;

  /// An object that contains details about an aggregation response based on
  /// Amazon ECR repositories.
  final RepositoryAggregationResponse? repositoryAggregation;

  /// An object that contains details about an aggregation response based on
  /// finding title.
  final TitleAggregationResponse? titleAggregation;

  AggregationResponse({
    this.accountAggregation,
    this.amiAggregation,
    this.awsEcrContainerAggregation,
    this.codeRepositoryAggregation,
    this.ec2InstanceAggregation,
    this.findingTypeAggregation,
    this.imageLayerAggregation,
    this.lambdaFunctionAggregation,
    this.lambdaLayerAggregation,
    this.packageAggregation,
    this.repositoryAggregation,
    this.titleAggregation,
  });

  factory AggregationResponse.fromJson(Map<String, dynamic> json) {
    return AggregationResponse(
      accountAggregation: json['accountAggregation'] != null
          ? AccountAggregationResponse.fromJson(
              json['accountAggregation'] as Map<String, dynamic>)
          : null,
      amiAggregation: json['amiAggregation'] != null
          ? AmiAggregationResponse.fromJson(
              json['amiAggregation'] as Map<String, dynamic>)
          : null,
      awsEcrContainerAggregation: json['awsEcrContainerAggregation'] != null
          ? AwsEcrContainerAggregationResponse.fromJson(
              json['awsEcrContainerAggregation'] as Map<String, dynamic>)
          : null,
      codeRepositoryAggregation: json['codeRepositoryAggregation'] != null
          ? CodeRepositoryAggregationResponse.fromJson(
              json['codeRepositoryAggregation'] as Map<String, dynamic>)
          : null,
      ec2InstanceAggregation: json['ec2InstanceAggregation'] != null
          ? Ec2InstanceAggregationResponse.fromJson(
              json['ec2InstanceAggregation'] as Map<String, dynamic>)
          : null,
      findingTypeAggregation: json['findingTypeAggregation'] != null
          ? FindingTypeAggregationResponse.fromJson(
              json['findingTypeAggregation'] as Map<String, dynamic>)
          : null,
      imageLayerAggregation: json['imageLayerAggregation'] != null
          ? ImageLayerAggregationResponse.fromJson(
              json['imageLayerAggregation'] as Map<String, dynamic>)
          : null,
      lambdaFunctionAggregation: json['lambdaFunctionAggregation'] != null
          ? LambdaFunctionAggregationResponse.fromJson(
              json['lambdaFunctionAggregation'] as Map<String, dynamic>)
          : null,
      lambdaLayerAggregation: json['lambdaLayerAggregation'] != null
          ? LambdaLayerAggregationResponse.fromJson(
              json['lambdaLayerAggregation'] as Map<String, dynamic>)
          : null,
      packageAggregation: json['packageAggregation'] != null
          ? PackageAggregationResponse.fromJson(
              json['packageAggregation'] as Map<String, dynamic>)
          : null,
      repositoryAggregation: json['repositoryAggregation'] != null
          ? RepositoryAggregationResponse.fromJson(
              json['repositoryAggregation'] as Map<String, dynamic>)
          : null,
      titleAggregation: json['titleAggregation'] != null
          ? TitleAggregationResponse.fromJson(
              json['titleAggregation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAggregation = this.accountAggregation;
    final amiAggregation = this.amiAggregation;
    final awsEcrContainerAggregation = this.awsEcrContainerAggregation;
    final codeRepositoryAggregation = this.codeRepositoryAggregation;
    final ec2InstanceAggregation = this.ec2InstanceAggregation;
    final findingTypeAggregation = this.findingTypeAggregation;
    final imageLayerAggregation = this.imageLayerAggregation;
    final lambdaFunctionAggregation = this.lambdaFunctionAggregation;
    final lambdaLayerAggregation = this.lambdaLayerAggregation;
    final packageAggregation = this.packageAggregation;
    final repositoryAggregation = this.repositoryAggregation;
    final titleAggregation = this.titleAggregation;
    return {
      if (accountAggregation != null) 'accountAggregation': accountAggregation,
      if (amiAggregation != null) 'amiAggregation': amiAggregation,
      if (awsEcrContainerAggregation != null)
        'awsEcrContainerAggregation': awsEcrContainerAggregation,
      if (codeRepositoryAggregation != null)
        'codeRepositoryAggregation': codeRepositoryAggregation,
      if (ec2InstanceAggregation != null)
        'ec2InstanceAggregation': ec2InstanceAggregation,
      if (findingTypeAggregation != null)
        'findingTypeAggregation': findingTypeAggregation,
      if (imageLayerAggregation != null)
        'imageLayerAggregation': imageLayerAggregation,
      if (lambdaFunctionAggregation != null)
        'lambdaFunctionAggregation': lambdaFunctionAggregation,
      if (lambdaLayerAggregation != null)
        'lambdaLayerAggregation': lambdaLayerAggregation,
      if (packageAggregation != null) 'packageAggregation': packageAggregation,
      if (repositoryAggregation != null)
        'repositoryAggregation': repositoryAggregation,
      if (titleAggregation != null) 'titleAggregation': titleAggregation,
    };
  }
}

/// An aggregation of findings by Amazon Web Services account ID.
///
/// @nodoc
class AccountAggregationResponse {
  /// The Amazon Web Services account ID.
  final String? accountId;

  /// The number of findings that have an exploit available.
  final int? exploitAvailableCount;

  /// Details about the number of fixes.
  final int? fixAvailableCount;

  /// The number of findings by severity.
  final SeverityCounts? severityCounts;

  AccountAggregationResponse({
    this.accountId,
    this.exploitAvailableCount,
    this.fixAvailableCount,
    this.severityCounts,
  });

  factory AccountAggregationResponse.fromJson(Map<String, dynamic> json) {
    return AccountAggregationResponse(
      accountId: json['accountId'] as String?,
      exploitAvailableCount: json['exploitAvailableCount'] as int?,
      fixAvailableCount: json['fixAvailableCount'] as int?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final exploitAvailableCount = this.exploitAvailableCount;
    final fixAvailableCount = this.fixAvailableCount;
    final severityCounts = this.severityCounts;
    return {
      if (accountId != null) 'accountId': accountId,
      if (exploitAvailableCount != null)
        'exploitAvailableCount': exploitAvailableCount,
      if (fixAvailableCount != null) 'fixAvailableCount': fixAvailableCount,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// A response that contains the results of a finding aggregation by AMI.
///
/// @nodoc
class AmiAggregationResponse {
  /// The ID of the AMI that findings were aggregated for.
  final String ami;

  /// The Amazon Web Services account ID for the AMI.
  final String? accountId;

  /// The IDs of Amazon EC2 instances using this AMI.
  final int? affectedInstances;

  /// An object that contains the count of matched findings per severity.
  final SeverityCounts? severityCounts;

  AmiAggregationResponse({
    required this.ami,
    this.accountId,
    this.affectedInstances,
    this.severityCounts,
  });

  factory AmiAggregationResponse.fromJson(Map<String, dynamic> json) {
    return AmiAggregationResponse(
      ami: (json['ami'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      affectedInstances: json['affectedInstances'] as int?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ami = this.ami;
    final accountId = this.accountId;
    final affectedInstances = this.affectedInstances;
    final severityCounts = this.severityCounts;
    return {
      'ami': ami,
      if (accountId != null) 'accountId': accountId,
      if (affectedInstances != null) 'affectedInstances': affectedInstances,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// An aggregation of information about Amazon ECR containers.
///
/// @nodoc
class AwsEcrContainerAggregationResponse {
  /// The resource ID of the container.
  final String resourceId;

  /// The Amazon Web Services account ID of the account that owns the container.
  final String? accountId;

  /// The architecture of the container.
  final String? architecture;

  /// The SHA value of the container image.
  final String? imageSha;

  /// The container image stags.
  final List<String>? imageTags;

  /// The number of Amazon ECS tasks or Amazon EKS pods where the Amazon ECR
  /// container image is in use.
  final int? inUseCount;

  /// The last time an Amazon ECR image was used in an Amazon ECS task or Amazon
  /// EKS pod.
  final DateTime? lastInUseAt;

  /// The container repository.
  final String? repository;

  /// The number of finding by severity.
  final SeverityCounts? severityCounts;

  AwsEcrContainerAggregationResponse({
    required this.resourceId,
    this.accountId,
    this.architecture,
    this.imageSha,
    this.imageTags,
    this.inUseCount,
    this.lastInUseAt,
    this.repository,
    this.severityCounts,
  });

  factory AwsEcrContainerAggregationResponse.fromJson(
      Map<String, dynamic> json) {
    return AwsEcrContainerAggregationResponse(
      resourceId: (json['resourceId'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      architecture: json['architecture'] as String?,
      imageSha: json['imageSha'] as String?,
      imageTags: (json['imageTags'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      inUseCount: json['inUseCount'] as int?,
      lastInUseAt: timeStampFromJson(json['lastInUseAt']),
      repository: json['repository'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final accountId = this.accountId;
    final architecture = this.architecture;
    final imageSha = this.imageSha;
    final imageTags = this.imageTags;
    final inUseCount = this.inUseCount;
    final lastInUseAt = this.lastInUseAt;
    final repository = this.repository;
    final severityCounts = this.severityCounts;
    return {
      'resourceId': resourceId,
      if (accountId != null) 'accountId': accountId,
      if (architecture != null) 'architecture': architecture,
      if (imageSha != null) 'imageSha': imageSha,
      if (imageTags != null) 'imageTags': imageTags,
      if (inUseCount != null) 'inUseCount': inUseCount,
      if (lastInUseAt != null) 'lastInUseAt': unixTimestampToJson(lastInUseAt),
      if (repository != null) 'repository': repository,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// A response that contains the results of a finding aggregation by Amazon EC2
/// instance.
///
/// @nodoc
class Ec2InstanceAggregationResponse {
  /// The Amazon EC2 instance ID.
  final String instanceId;

  /// The Amazon Web Services account for the Amazon EC2 instance.
  final String? accountId;

  /// The Amazon Machine Image (AMI) of the Amazon EC2 instance.
  final String? ami;

  /// The tags attached to the instance.
  final Map<String, String>? instanceTags;

  /// The number of network findings for the Amazon EC2 instance.
  final int? networkFindings;

  /// The operating system of the Amazon EC2 instance.
  final String? operatingSystem;

  /// An object that contains the count of matched findings per severity.
  final SeverityCounts? severityCounts;

  Ec2InstanceAggregationResponse({
    required this.instanceId,
    this.accountId,
    this.ami,
    this.instanceTags,
    this.networkFindings,
    this.operatingSystem,
    this.severityCounts,
  });

  factory Ec2InstanceAggregationResponse.fromJson(Map<String, dynamic> json) {
    return Ec2InstanceAggregationResponse(
      instanceId: (json['instanceId'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      ami: json['ami'] as String?,
      instanceTags: (json['instanceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      networkFindings: json['networkFindings'] as int?,
      operatingSystem: json['operatingSystem'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final accountId = this.accountId;
    final ami = this.ami;
    final instanceTags = this.instanceTags;
    final networkFindings = this.networkFindings;
    final operatingSystem = this.operatingSystem;
    final severityCounts = this.severityCounts;
    return {
      'instanceId': instanceId,
      if (accountId != null) 'accountId': accountId,
      if (ami != null) 'ami': ami,
      if (instanceTags != null) 'instanceTags': instanceTags,
      if (networkFindings != null) 'networkFindings': networkFindings,
      if (operatingSystem != null) 'operatingSystem': operatingSystem,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// A response that contains the results of a finding type aggregation.
///
/// @nodoc
class FindingTypeAggregationResponse {
  /// The ID of the Amazon Web Services account associated with the findings.
  final String? accountId;

  /// The number of findings that have an exploit available.
  final int? exploitAvailableCount;

  /// Details about the number of fixes.
  final int? fixAvailableCount;

  /// The value to sort results by.
  final SeverityCounts? severityCounts;

  FindingTypeAggregationResponse({
    this.accountId,
    this.exploitAvailableCount,
    this.fixAvailableCount,
    this.severityCounts,
  });

  factory FindingTypeAggregationResponse.fromJson(Map<String, dynamic> json) {
    return FindingTypeAggregationResponse(
      accountId: json['accountId'] as String?,
      exploitAvailableCount: json['exploitAvailableCount'] as int?,
      fixAvailableCount: json['fixAvailableCount'] as int?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final exploitAvailableCount = this.exploitAvailableCount;
    final fixAvailableCount = this.fixAvailableCount;
    final severityCounts = this.severityCounts;
    return {
      if (accountId != null) 'accountId': accountId,
      if (exploitAvailableCount != null)
        'exploitAvailableCount': exploitAvailableCount,
      if (fixAvailableCount != null) 'fixAvailableCount': fixAvailableCount,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// A response that contains the results of a finding aggregation by image
/// layer.
///
/// @nodoc
class ImageLayerAggregationResponse {
  /// The ID of the Amazon Web Services account that owns the container image
  /// hosting the layer image.
  final String accountId;

  /// The layer hash.
  final String layerHash;

  /// The repository the layer resides in.
  final String repository;

  /// The resource ID of the container image layer.
  final String resourceId;

  /// An object that represents the count of matched findings per severity.
  final SeverityCounts? severityCounts;

  ImageLayerAggregationResponse({
    required this.accountId,
    required this.layerHash,
    required this.repository,
    required this.resourceId,
    this.severityCounts,
  });

  factory ImageLayerAggregationResponse.fromJson(Map<String, dynamic> json) {
    return ImageLayerAggregationResponse(
      accountId: (json['accountId'] as String?) ?? '',
      layerHash: (json['layerHash'] as String?) ?? '',
      repository: (json['repository'] as String?) ?? '',
      resourceId: (json['resourceId'] as String?) ?? '',
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final layerHash = this.layerHash;
    final repository = this.repository;
    final resourceId = this.resourceId;
    final severityCounts = this.severityCounts;
    return {
      'accountId': accountId,
      'layerHash': layerHash,
      'repository': repository,
      'resourceId': resourceId,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// A response that contains the results of a finding aggregation by image
/// layer.
///
/// @nodoc
class PackageAggregationResponse {
  /// The name of the operating system package.
  final String packageName;

  /// The ID of the Amazon Web Services account associated with the findings.
  final String? accountId;

  /// An object that contains the count of matched findings per severity.
  final SeverityCounts? severityCounts;

  PackageAggregationResponse({
    required this.packageName,
    this.accountId,
    this.severityCounts,
  });

  factory PackageAggregationResponse.fromJson(Map<String, dynamic> json) {
    return PackageAggregationResponse(
      packageName: (json['packageName'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final packageName = this.packageName;
    final accountId = this.accountId;
    final severityCounts = this.severityCounts;
    return {
      'packageName': packageName,
      if (accountId != null) 'accountId': accountId,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// A response that contains details on the results of a finding aggregation by
/// repository.
///
/// @nodoc
class RepositoryAggregationResponse {
  /// The name of the repository associated with the findings.
  final String repository;

  /// The ID of the Amazon Web Services account associated with the findings.
  final String? accountId;

  /// The number of container images impacted by the findings.
  final int? affectedImages;

  /// An object that represent the count of matched findings per severity.
  final SeverityCounts? severityCounts;

  RepositoryAggregationResponse({
    required this.repository,
    this.accountId,
    this.affectedImages,
    this.severityCounts,
  });

  factory RepositoryAggregationResponse.fromJson(Map<String, dynamic> json) {
    return RepositoryAggregationResponse(
      repository: (json['repository'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      affectedImages: json['affectedImages'] as int?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    final accountId = this.accountId;
    final affectedImages = this.affectedImages;
    final severityCounts = this.severityCounts;
    return {
      'repository': repository,
      if (accountId != null) 'accountId': accountId,
      if (affectedImages != null) 'affectedImages': affectedImages,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// A response that contains details on the results of a finding aggregation by
/// title.
///
/// @nodoc
class TitleAggregationResponse {
  /// The title that the findings were aggregated on.
  final String title;

  /// The ID of the Amazon Web Services account associated with the findings.
  final String? accountId;

  /// An object that represent the count of matched findings per severity.
  final SeverityCounts? severityCounts;

  /// The vulnerability ID of the finding.
  final String? vulnerabilityId;

  TitleAggregationResponse({
    required this.title,
    this.accountId,
    this.severityCounts,
    this.vulnerabilityId,
  });

  factory TitleAggregationResponse.fromJson(Map<String, dynamic> json) {
    return TitleAggregationResponse(
      title: (json['title'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
      vulnerabilityId: json['vulnerabilityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final title = this.title;
    final accountId = this.accountId;
    final severityCounts = this.severityCounts;
    final vulnerabilityId = this.vulnerabilityId;
    return {
      'title': title,
      if (accountId != null) 'accountId': accountId,
      if (severityCounts != null) 'severityCounts': severityCounts,
      if (vulnerabilityId != null) 'vulnerabilityId': vulnerabilityId,
    };
  }
}

/// A response that contains the results of an Amazon Web Services Lambda
/// function layer finding aggregation.
///
/// @nodoc
class LambdaLayerAggregationResponse {
  /// The account ID of the Amazon Web Services Lambda function layer.
  final String accountId;

  /// The names of the Amazon Web Services Lambda functions associated with the
  /// layers.
  final String functionName;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services Lambda function
  /// layer.
  final String layerArn;

  /// The Resource ID of the Amazon Web Services Lambda function layer.
  final String resourceId;

  /// An object that contains the counts of aggregated finding per severity.
  final SeverityCounts? severityCounts;

  LambdaLayerAggregationResponse({
    required this.accountId,
    required this.functionName,
    required this.layerArn,
    required this.resourceId,
    this.severityCounts,
  });

  factory LambdaLayerAggregationResponse.fromJson(Map<String, dynamic> json) {
    return LambdaLayerAggregationResponse(
      accountId: (json['accountId'] as String?) ?? '',
      functionName: (json['functionName'] as String?) ?? '',
      layerArn: (json['layerArn'] as String?) ?? '',
      resourceId: (json['resourceId'] as String?) ?? '',
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final functionName = this.functionName;
    final layerArn = this.layerArn;
    final resourceId = this.resourceId;
    final severityCounts = this.severityCounts;
    return {
      'accountId': accountId,
      'functionName': functionName,
      'layerArn': layerArn,
      'resourceId': resourceId,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// A response that contains the results of an Amazon Web Services Lambda
/// function finding aggregation.
///
/// @nodoc
class LambdaFunctionAggregationResponse {
  /// The resource IDs included in the aggregation results.
  final String resourceId;

  /// The ID of the Amazon Web Services account that owns the Amazon Web Services
  /// Lambda function.
  final String? accountId;

  /// The Amazon Web Services Lambda function names included in the aggregation
  /// results.
  final String? functionName;

  /// The tags included in the aggregation results.
  final Map<String, String>? lambdaTags;

  /// The date that the Amazon Web Services Lambda function included in the
  /// aggregation results was last changed.
  final DateTime? lastModifiedAt;

  /// The runtimes included in the aggregation results.
  final String? runtime;

  /// An object that contains the counts of aggregated finding per severity.
  final SeverityCounts? severityCounts;

  LambdaFunctionAggregationResponse({
    required this.resourceId,
    this.accountId,
    this.functionName,
    this.lambdaTags,
    this.lastModifiedAt,
    this.runtime,
    this.severityCounts,
  });

  factory LambdaFunctionAggregationResponse.fromJson(
      Map<String, dynamic> json) {
    return LambdaFunctionAggregationResponse(
      resourceId: (json['resourceId'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      functionName: json['functionName'] as String?,
      lambdaTags: (json['lambdaTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      lastModifiedAt: timeStampFromJson(json['lastModifiedAt']),
      runtime: json['runtime'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final accountId = this.accountId;
    final functionName = this.functionName;
    final lambdaTags = this.lambdaTags;
    final lastModifiedAt = this.lastModifiedAt;
    final runtime = this.runtime;
    final severityCounts = this.severityCounts;
    return {
      'resourceId': resourceId,
      if (accountId != null) 'accountId': accountId,
      if (functionName != null) 'functionName': functionName,
      if (lambdaTags != null) 'lambdaTags': lambdaTags,
      if (lastModifiedAt != null)
        'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      if (runtime != null) 'runtime': runtime,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// A response that contains the results of a finding aggregation by code
/// repository.
///
/// @nodoc
class CodeRepositoryAggregationResponse {
  /// The names of the projects associated with the code repository.
  final String projectNames;

  /// The Amazon Web Services account ID associated with the code repository.
  final String? accountId;

  /// The number of active findings that have an exploit available for the code
  /// repository.
  final int? exploitAvailableActiveFindingsCount;

  /// The number of active findings that have a fix available for the code
  /// repository.
  final int? fixAvailableActiveFindingsCount;

  /// The type of repository provider for the code repository.
  final String? providerType;

  /// The resource ID of the code repository.
  final String? resourceId;
  final SeverityCounts? severityCounts;

  CodeRepositoryAggregationResponse({
    required this.projectNames,
    this.accountId,
    this.exploitAvailableActiveFindingsCount,
    this.fixAvailableActiveFindingsCount,
    this.providerType,
    this.resourceId,
    this.severityCounts,
  });

  factory CodeRepositoryAggregationResponse.fromJson(
      Map<String, dynamic> json) {
    return CodeRepositoryAggregationResponse(
      projectNames: (json['projectNames'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      exploitAvailableActiveFindingsCount:
          json['exploitAvailableActiveFindingsCount'] as int?,
      fixAvailableActiveFindingsCount:
          json['fixAvailableActiveFindingsCount'] as int?,
      providerType: json['providerType'] as String?,
      resourceId: json['resourceId'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final projectNames = this.projectNames;
    final accountId = this.accountId;
    final exploitAvailableActiveFindingsCount =
        this.exploitAvailableActiveFindingsCount;
    final fixAvailableActiveFindingsCount =
        this.fixAvailableActiveFindingsCount;
    final providerType = this.providerType;
    final resourceId = this.resourceId;
    final severityCounts = this.severityCounts;
    return {
      'projectNames': projectNames,
      if (accountId != null) 'accountId': accountId,
      if (exploitAvailableActiveFindingsCount != null)
        'exploitAvailableActiveFindingsCount':
            exploitAvailableActiveFindingsCount,
      if (fixAvailableActiveFindingsCount != null)
        'fixAvailableActiveFindingsCount': fixAvailableActiveFindingsCount,
      if (providerType != null) 'providerType': providerType,
      if (resourceId != null) 'resourceId': resourceId,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// An object that contains the counts of aggregated finding per severity.
///
/// @nodoc
class SeverityCounts {
  /// The total count of findings from all severities.
  final int? all;

  /// The total count of critical severity findings.
  final int? critical;

  /// The total count of high severity findings.
  final int? high;

  /// The total count of medium severity findings.
  final int? medium;

  SeverityCounts({
    this.all,
    this.critical,
    this.high,
    this.medium,
  });

  factory SeverityCounts.fromJson(Map<String, dynamic> json) {
    return SeverityCounts(
      all: json['all'] as int?,
      critical: json['critical'] as int?,
      high: json['high'] as int?,
      medium: json['medium'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final all = this.all;
    final critical = this.critical;
    final high = this.high;
    final medium = this.medium;
    return {
      if (all != null) 'all': all,
      if (critical != null) 'critical': critical,
      if (high != null) 'high': high,
      if (medium != null) 'medium': medium,
    };
  }
}

/// Contains details about an aggregation request.
///
/// @nodoc
class AggregationRequest {
  /// An object that contains details about an aggregation request based on Amazon
  /// Web Services account IDs.
  final AccountAggregation? accountAggregation;

  /// An object that contains details about an aggregation request based on Amazon
  /// Machine Images (AMIs).
  final AmiAggregation? amiAggregation;

  /// An object that contains details about an aggregation request based on Amazon
  /// ECR container images.
  final AwsEcrContainerAggregation? awsEcrContainerAggregation;

  /// An object that contains details about an aggregation request based on code
  /// repositories.
  final CodeRepositoryAggregation? codeRepositoryAggregation;

  /// An object that contains details about an aggregation request based on Amazon
  /// EC2 instances.
  final Ec2InstanceAggregation? ec2InstanceAggregation;

  /// An object that contains details about an aggregation request based on
  /// finding types.
  final FindingTypeAggregation? findingTypeAggregation;

  /// An object that contains details about an aggregation request based on
  /// container image layers.
  final ImageLayerAggregation? imageLayerAggregation;

  /// Returns an object with findings aggregated by Amazon Web Services Lambda
  /// function.
  final LambdaFunctionAggregation? lambdaFunctionAggregation;

  /// Returns an object with findings aggregated by Amazon Web Services Lambda
  /// layer.
  final LambdaLayerAggregation? lambdaLayerAggregation;

  /// An object that contains details about an aggregation request based on
  /// operating system package type.
  final PackageAggregation? packageAggregation;

  /// An object that contains details about an aggregation request based on Amazon
  /// ECR repositories.
  final RepositoryAggregation? repositoryAggregation;

  /// An object that contains details about an aggregation request based on
  /// finding title.
  final TitleAggregation? titleAggregation;

  AggregationRequest({
    this.accountAggregation,
    this.amiAggregation,
    this.awsEcrContainerAggregation,
    this.codeRepositoryAggregation,
    this.ec2InstanceAggregation,
    this.findingTypeAggregation,
    this.imageLayerAggregation,
    this.lambdaFunctionAggregation,
    this.lambdaLayerAggregation,
    this.packageAggregation,
    this.repositoryAggregation,
    this.titleAggregation,
  });

  Map<String, dynamic> toJson() {
    final accountAggregation = this.accountAggregation;
    final amiAggregation = this.amiAggregation;
    final awsEcrContainerAggregation = this.awsEcrContainerAggregation;
    final codeRepositoryAggregation = this.codeRepositoryAggregation;
    final ec2InstanceAggregation = this.ec2InstanceAggregation;
    final findingTypeAggregation = this.findingTypeAggregation;
    final imageLayerAggregation = this.imageLayerAggregation;
    final lambdaFunctionAggregation = this.lambdaFunctionAggregation;
    final lambdaLayerAggregation = this.lambdaLayerAggregation;
    final packageAggregation = this.packageAggregation;
    final repositoryAggregation = this.repositoryAggregation;
    final titleAggregation = this.titleAggregation;
    return {
      if (accountAggregation != null) 'accountAggregation': accountAggregation,
      if (amiAggregation != null) 'amiAggregation': amiAggregation,
      if (awsEcrContainerAggregation != null)
        'awsEcrContainerAggregation': awsEcrContainerAggregation,
      if (codeRepositoryAggregation != null)
        'codeRepositoryAggregation': codeRepositoryAggregation,
      if (ec2InstanceAggregation != null)
        'ec2InstanceAggregation': ec2InstanceAggregation,
      if (findingTypeAggregation != null)
        'findingTypeAggregation': findingTypeAggregation,
      if (imageLayerAggregation != null)
        'imageLayerAggregation': imageLayerAggregation,
      if (lambdaFunctionAggregation != null)
        'lambdaFunctionAggregation': lambdaFunctionAggregation,
      if (lambdaLayerAggregation != null)
        'lambdaLayerAggregation': lambdaLayerAggregation,
      if (packageAggregation != null) 'packageAggregation': packageAggregation,
      if (repositoryAggregation != null)
        'repositoryAggregation': repositoryAggregation,
      if (titleAggregation != null) 'titleAggregation': titleAggregation,
    };
  }
}

/// An object that contains details about an aggregation response based on
/// Amazon Web Services accounts.
///
/// @nodoc
class AccountAggregation {
  /// The type of finding.
  final AggregationFindingType? findingType;

  /// The type of resource.
  final AggregationResourceType? resourceType;

  /// The value to sort by.
  final AccountSortBy? sortBy;

  /// The sort order (ascending or descending).
  final SortOrder? sortOrder;

  AccountAggregation({
    this.findingType,
    this.resourceType,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final findingType = this.findingType;
    final resourceType = this.resourceType;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (findingType != null) 'findingType': findingType.value,
      if (resourceType != null) 'resourceType': resourceType.value,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// The details that define an aggregation based on Amazon machine images
/// (AMIs).
///
/// @nodoc
class AmiAggregation {
  /// The IDs of AMIs to aggregate findings for.
  final List<StringFilter>? amis;

  /// The value to sort results by.
  final AmiSortBy? sortBy;

  /// The order to sort results by.
  final SortOrder? sortOrder;

  AmiAggregation({
    this.amis,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final amis = this.amis;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (amis != null) 'amis': amis,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// An aggregation of information about Amazon ECR containers.
///
/// @nodoc
class AwsEcrContainerAggregation {
  /// The architecture of the containers.
  final List<StringFilter>? architectures;

  /// The image SHA values.
  final List<StringFilter>? imageShas;

  /// The image tags.
  final List<StringFilter>? imageTags;

  /// The number of Amazon ECS tasks or Amazon EKS pods where the Amazon ECR
  /// container image is in use.
  final List<NumberFilter>? inUseCount;

  /// The last time an Amazon ECR image was used in an Amazon ECS task or Amazon
  /// EKS pod.
  final List<DateFilter>? lastInUseAt;

  /// The container repositories.
  final List<StringFilter>? repositories;

  /// The container resource IDs.
  final List<StringFilter>? resourceIds;

  /// The value to sort by.
  final AwsEcrContainerSortBy? sortBy;

  /// The sort order (ascending or descending).
  final SortOrder? sortOrder;

  AwsEcrContainerAggregation({
    this.architectures,
    this.imageShas,
    this.imageTags,
    this.inUseCount,
    this.lastInUseAt,
    this.repositories,
    this.resourceIds,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final architectures = this.architectures;
    final imageShas = this.imageShas;
    final imageTags = this.imageTags;
    final inUseCount = this.inUseCount;
    final lastInUseAt = this.lastInUseAt;
    final repositories = this.repositories;
    final resourceIds = this.resourceIds;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (architectures != null) 'architectures': architectures,
      if (imageShas != null) 'imageShas': imageShas,
      if (imageTags != null) 'imageTags': imageTags,
      if (inUseCount != null) 'inUseCount': inUseCount,
      if (lastInUseAt != null) 'lastInUseAt': lastInUseAt,
      if (repositories != null) 'repositories': repositories,
      if (resourceIds != null) 'resourceIds': resourceIds,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// The details that define an aggregation based on Amazon EC2 instances.
///
/// @nodoc
class Ec2InstanceAggregation {
  /// The AMI IDs associated with the Amazon EC2 instances to aggregate findings
  /// for.
  final List<StringFilter>? amis;

  /// The Amazon EC2 instance IDs to aggregate findings for.
  final List<StringFilter>? instanceIds;

  /// The Amazon EC2 instance tags to aggregate findings for.
  final List<MapFilter>? instanceTags;

  /// The operating system types to aggregate findings for. Valid values must be
  /// uppercase and underscore separated, examples are <code>ORACLE_LINUX_7</code>
  /// and <code>ALPINE_LINUX_3_8</code>.
  final List<StringFilter>? operatingSystems;

  /// The value to sort results by.
  final Ec2InstanceSortBy? sortBy;

  /// The order to sort results by.
  final SortOrder? sortOrder;

  Ec2InstanceAggregation({
    this.amis,
    this.instanceIds,
    this.instanceTags,
    this.operatingSystems,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final amis = this.amis;
    final instanceIds = this.instanceIds;
    final instanceTags = this.instanceTags;
    final operatingSystems = this.operatingSystems;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (amis != null) 'amis': amis,
      if (instanceIds != null) 'instanceIds': instanceIds,
      if (instanceTags != null) 'instanceTags': instanceTags,
      if (operatingSystems != null) 'operatingSystems': operatingSystems,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// The details that define an aggregation based on finding type.
///
/// @nodoc
class FindingTypeAggregation {
  /// The finding type to aggregate.
  final AggregationFindingType? findingType;

  /// The resource type to aggregate.
  final AggregationResourceType? resourceType;

  /// The value to sort results by.
  final FindingTypeSortBy? sortBy;

  /// The order to sort results by.
  final SortOrder? sortOrder;

  FindingTypeAggregation({
    this.findingType,
    this.resourceType,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final findingType = this.findingType;
    final resourceType = this.resourceType;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (findingType != null) 'findingType': findingType.value,
      if (resourceType != null) 'resourceType': resourceType.value,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// The details that define an aggregation based on container image layers.
///
/// @nodoc
class ImageLayerAggregation {
  /// The hashes associated with the layers.
  final List<StringFilter>? layerHashes;

  /// The repository associated with the container image hosting the layers.
  final List<StringFilter>? repositories;

  /// The ID of the container image layer.
  final List<StringFilter>? resourceIds;

  /// The value to sort results by.
  final ImageLayerSortBy? sortBy;

  /// The order to sort results by.
  final SortOrder? sortOrder;

  ImageLayerAggregation({
    this.layerHashes,
    this.repositories,
    this.resourceIds,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final layerHashes = this.layerHashes;
    final repositories = this.repositories;
    final resourceIds = this.resourceIds;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (layerHashes != null) 'layerHashes': layerHashes,
      if (repositories != null) 'repositories': repositories,
      if (resourceIds != null) 'resourceIds': resourceIds,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// The details that define an aggregation based on operating system package
/// type.
///
/// @nodoc
class PackageAggregation {
  /// The names of packages to aggregate findings on.
  final List<StringFilter>? packageNames;

  /// The value to sort results by.
  final PackageSortBy? sortBy;

  /// The order to sort results by.
  final SortOrder? sortOrder;

  PackageAggregation({
    this.packageNames,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final packageNames = this.packageNames;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (packageNames != null) 'packageNames': packageNames,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// The details that define an aggregation based on repository.
///
/// @nodoc
class RepositoryAggregation {
  /// The names of repositories to aggregate findings on.
  final List<StringFilter>? repositories;

  /// The value to sort results by.
  final RepositorySortBy? sortBy;

  /// The order to sort results by.
  final SortOrder? sortOrder;

  RepositoryAggregation({
    this.repositories,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final repositories = this.repositories;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (repositories != null) 'repositories': repositories,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// The details that define an aggregation based on finding title.
///
/// @nodoc
class TitleAggregation {
  /// The type of finding to aggregate on.
  final AggregationFindingType? findingType;

  /// The resource type to aggregate on.
  final AggregationResourceType? resourceType;

  /// The value to sort results by.
  final TitleSortBy? sortBy;

  /// The order to sort results by.
  final SortOrder? sortOrder;

  /// The finding titles to aggregate on.
  final List<StringFilter>? titles;

  /// The vulnerability IDs of the findings.
  final List<StringFilter>? vulnerabilityIds;

  TitleAggregation({
    this.findingType,
    this.resourceType,
    this.sortBy,
    this.sortOrder,
    this.titles,
    this.vulnerabilityIds,
  });

  Map<String, dynamic> toJson() {
    final findingType = this.findingType;
    final resourceType = this.resourceType;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    final titles = this.titles;
    final vulnerabilityIds = this.vulnerabilityIds;
    return {
      if (findingType != null) 'findingType': findingType.value,
      if (resourceType != null) 'resourceType': resourceType.value,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
      if (titles != null) 'titles': titles,
      if (vulnerabilityIds != null) 'vulnerabilityIds': vulnerabilityIds,
    };
  }
}

/// The details that define a findings aggregation based on an Amazon Web
/// Services Lambda function's layers.
///
/// @nodoc
class LambdaLayerAggregation {
  /// The names of the Amazon Web Services Lambda functions associated with the
  /// layers.
  final List<StringFilter>? functionNames;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services Lambda function
  /// layer.
  final List<StringFilter>? layerArns;

  /// The resource IDs for the Amazon Web Services Lambda function layers.
  final List<StringFilter>? resourceIds;

  /// The finding severity to use for sorting the results.
  final LambdaLayerSortBy? sortBy;

  /// The order to use for sorting the results.
  final SortOrder? sortOrder;

  LambdaLayerAggregation({
    this.functionNames,
    this.layerArns,
    this.resourceIds,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final functionNames = this.functionNames;
    final layerArns = this.layerArns;
    final resourceIds = this.resourceIds;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (functionNames != null) 'functionNames': functionNames,
      if (layerArns != null) 'layerArns': layerArns,
      if (resourceIds != null) 'resourceIds': resourceIds,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// The details that define a findings aggregation based on Amazon Web Services
/// Lambda functions.
///
/// @nodoc
class LambdaFunctionAggregation {
  /// The Amazon Web Services Lambda function names to include in the aggregation
  /// results.
  final List<StringFilter>? functionNames;

  /// The tags to include in the aggregation results.
  final List<MapFilter>? functionTags;

  /// The resource IDs to include in the aggregation results.
  final List<StringFilter>? resourceIds;

  /// Returns findings aggregated by Amazon Web Services Lambda function runtime
  /// environments.
  final List<StringFilter>? runtimes;

  /// The finding severity to use for sorting the results.
  final LambdaFunctionSortBy? sortBy;

  /// The order to use for sorting the results.
  final SortOrder? sortOrder;

  LambdaFunctionAggregation({
    this.functionNames,
    this.functionTags,
    this.resourceIds,
    this.runtimes,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final functionNames = this.functionNames;
    final functionTags = this.functionTags;
    final resourceIds = this.resourceIds;
    final runtimes = this.runtimes;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (functionNames != null) 'functionNames': functionNames,
      if (functionTags != null) 'functionTags': functionTags,
      if (resourceIds != null) 'resourceIds': resourceIds,
      if (runtimes != null) 'runtimes': runtimes,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// The details that define an aggregation based on code repositories.
///
/// @nodoc
class CodeRepositoryAggregation {
  /// The project names to include in the aggregation results.
  final List<StringFilter>? projectNames;

  /// The repository provider types to include in the aggregation results.
  final List<StringFilter>? providerTypes;

  /// The resource IDs to include in the aggregation results.
  final List<StringFilter>? resourceIds;

  /// The value to sort results by in the code repository aggregation.
  final CodeRepositorySortBy? sortBy;

  /// The order to sort results by (ascending or descending) in the code
  /// repository aggregation.
  final SortOrder? sortOrder;

  CodeRepositoryAggregation({
    this.projectNames,
    this.providerTypes,
    this.resourceIds,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final projectNames = this.projectNames;
    final providerTypes = this.providerTypes;
    final resourceIds = this.resourceIds;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (projectNames != null) 'projectNames': projectNames,
      if (providerTypes != null) 'providerTypes': providerTypes,
      if (resourceIds != null) 'resourceIds': resourceIds,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

/// @nodoc
class CodeRepositorySortBy {
  static const critical = CodeRepositorySortBy._('CRITICAL');
  static const high = CodeRepositorySortBy._('HIGH');
  static const all = CodeRepositorySortBy._('ALL');

  final String value;

  const CodeRepositorySortBy._(this.value);

  static const values = [critical, high, all];

  static CodeRepositorySortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CodeRepositorySortBy._(value));

  @override
  bool operator ==(other) =>
      other is CodeRepositorySortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LambdaFunctionSortBy {
  static const critical = LambdaFunctionSortBy._('CRITICAL');
  static const high = LambdaFunctionSortBy._('HIGH');
  static const all = LambdaFunctionSortBy._('ALL');

  final String value;

  const LambdaFunctionSortBy._(this.value);

  static const values = [critical, high, all];

  static LambdaFunctionSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LambdaFunctionSortBy._(value));

  @override
  bool operator ==(other) =>
      other is LambdaFunctionSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LambdaLayerSortBy {
  static const critical = LambdaLayerSortBy._('CRITICAL');
  static const high = LambdaLayerSortBy._('HIGH');
  static const all = LambdaLayerSortBy._('ALL');

  final String value;

  const LambdaLayerSortBy._(this.value);

  static const values = [critical, high, all];

  static LambdaLayerSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LambdaLayerSortBy._(value));

  @override
  bool operator ==(other) => other is LambdaLayerSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AggregationResourceType {
  static const awsEc2Instance = AggregationResourceType._('AWS_EC2_INSTANCE');
  static const awsEcrContainerImage =
      AggregationResourceType._('AWS_ECR_CONTAINER_IMAGE');
  static const awsLambdaFunction =
      AggregationResourceType._('AWS_LAMBDA_FUNCTION');
  static const codeRepository = AggregationResourceType._('CODE_REPOSITORY');

  final String value;

  const AggregationResourceType._(this.value);

  static const values = [
    awsEc2Instance,
    awsEcrContainerImage,
    awsLambdaFunction,
    codeRepository
  ];

  static AggregationResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AggregationResourceType._(value));

  @override
  bool operator ==(other) =>
      other is AggregationResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TitleSortBy {
  static const critical = TitleSortBy._('CRITICAL');
  static const high = TitleSortBy._('HIGH');
  static const all = TitleSortBy._('ALL');

  final String value;

  const TitleSortBy._(this.value);

  static const values = [critical, high, all];

  static TitleSortBy fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TitleSortBy._(value));

  @override
  bool operator ==(other) => other is TitleSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AggregationFindingType {
  static const networkReachability =
      AggregationFindingType._('NETWORK_REACHABILITY');
  static const packageVulnerability =
      AggregationFindingType._('PACKAGE_VULNERABILITY');
  static const codeVulnerability =
      AggregationFindingType._('CODE_VULNERABILITY');

  final String value;

  const AggregationFindingType._(this.value);

  static const values = [
    networkReachability,
    packageVulnerability,
    codeVulnerability
  ];

  static AggregationFindingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AggregationFindingType._(value));

  @override
  bool operator ==(other) =>
      other is AggregationFindingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RepositorySortBy {
  static const critical = RepositorySortBy._('CRITICAL');
  static const high = RepositorySortBy._('HIGH');
  static const all = RepositorySortBy._('ALL');
  static const affectedImages = RepositorySortBy._('AFFECTED_IMAGES');

  final String value;

  const RepositorySortBy._(this.value);

  static const values = [critical, high, all, affectedImages];

  static RepositorySortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RepositorySortBy._(value));

  @override
  bool operator ==(other) => other is RepositorySortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PackageSortBy {
  static const critical = PackageSortBy._('CRITICAL');
  static const high = PackageSortBy._('HIGH');
  static const all = PackageSortBy._('ALL');

  final String value;

  const PackageSortBy._(this.value);

  static const values = [critical, high, all];

  static PackageSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PackageSortBy._(value));

  @override
  bool operator ==(other) => other is PackageSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ImageLayerSortBy {
  static const critical = ImageLayerSortBy._('CRITICAL');
  static const high = ImageLayerSortBy._('HIGH');
  static const all = ImageLayerSortBy._('ALL');

  final String value;

  const ImageLayerSortBy._(this.value);

  static const values = [critical, high, all];

  static ImageLayerSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageLayerSortBy._(value));

  @override
  bool operator ==(other) => other is ImageLayerSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FindingTypeSortBy {
  static const critical = FindingTypeSortBy._('CRITICAL');
  static const high = FindingTypeSortBy._('HIGH');
  static const all = FindingTypeSortBy._('ALL');

  final String value;

  const FindingTypeSortBy._(this.value);

  static const values = [critical, high, all];

  static FindingTypeSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FindingTypeSortBy._(value));

  @override
  bool operator ==(other) => other is FindingTypeSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Ec2InstanceSortBy {
  static const networkFindings = Ec2InstanceSortBy._('NETWORK_FINDINGS');
  static const critical = Ec2InstanceSortBy._('CRITICAL');
  static const high = Ec2InstanceSortBy._('HIGH');
  static const all = Ec2InstanceSortBy._('ALL');

  final String value;

  const Ec2InstanceSortBy._(this.value);

  static const values = [networkFindings, critical, high, all];

  static Ec2InstanceSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => Ec2InstanceSortBy._(value));

  @override
  bool operator ==(other) => other is Ec2InstanceSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AwsEcrContainerSortBy {
  static const critical = AwsEcrContainerSortBy._('CRITICAL');
  static const high = AwsEcrContainerSortBy._('HIGH');
  static const all = AwsEcrContainerSortBy._('ALL');

  final String value;

  const AwsEcrContainerSortBy._(this.value);

  static const values = [critical, high, all];

  static AwsEcrContainerSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AwsEcrContainerSortBy._(value));

  @override
  bool operator ==(other) =>
      other is AwsEcrContainerSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AmiSortBy {
  static const critical = AmiSortBy._('CRITICAL');
  static const high = AmiSortBy._('HIGH');
  static const all = AmiSortBy._('ALL');
  static const affectedInstances = AmiSortBy._('AFFECTED_INSTANCES');

  final String value;

  const AmiSortBy._(this.value);

  static const values = [critical, high, all, affectedInstances];

  static AmiSortBy fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AmiSortBy._(value));

  @override
  bool operator ==(other) => other is AmiSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccountSortBy {
  static const critical = AccountSortBy._('CRITICAL');
  static const high = AccountSortBy._('HIGH');
  static const all = AccountSortBy._('ALL');

  final String value;

  const AccountSortBy._(this.value);

  static const values = [critical, high, all];

  static AccountSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccountSortBy._(value));

  @override
  bool operator ==(other) => other is AccountSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a filter.
///
/// @nodoc
class Filter {
  /// The action that is to be applied to the findings that match the filter.
  final FilterAction action;

  /// The Amazon Resource Number (ARN) associated with this filter.
  final String arn;

  /// The date and time this filter was created at.
  final DateTime createdAt;

  /// Details on the filter criteria associated with this filter.
  final FilterCriteria criteria;

  /// The name of the filter.
  final String name;

  /// The Amazon Web Services account ID of the account that created the filter.
  final String ownerId;

  /// The date and time the filter was last updated at.
  final DateTime updatedAt;

  /// A description of the filter.
  final String? description;

  /// The reason for the filter.
  final String? reason;

  /// The tags attached to the filter.
  final Map<String, String>? tags;

  Filter({
    required this.action,
    required this.arn,
    required this.createdAt,
    required this.criteria,
    required this.name,
    required this.ownerId,
    required this.updatedAt,
    this.description,
    this.reason,
    this.tags,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      action: FilterAction.fromString((json['action'] as String?) ?? ''),
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      criteria: FilterCriteria.fromJson(
          (json['criteria'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      name: (json['name'] as String?) ?? '',
      ownerId: (json['ownerId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      reason: json['reason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final criteria = this.criteria;
    final name = this.name;
    final ownerId = this.ownerId;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final reason = this.reason;
    final tags = this.tags;
    return {
      'action': action.value,
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'criteria': criteria,
      'name': name,
      'ownerId': ownerId,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
      if (reason != null) 'reason': reason,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Details of the Amazon Inspector delegated administrator for your
/// organization.
///
/// @nodoc
class DelegatedAdminAccount {
  /// The Amazon Web Services account ID of the Amazon Inspector delegated
  /// administrator for your organization.
  final String? accountId;

  /// The status of the Amazon Inspector delegated administrator.
  final DelegatedAdminStatus? status;

  DelegatedAdminAccount({
    this.accountId,
    this.status,
  });

  factory DelegatedAdminAccount.fromJson(Map<String, dynamic> json) {
    return DelegatedAdminAccount(
      accountId: json['accountId'] as String?,
      status: (json['status'] as String?)?.let(DelegatedAdminStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final status = this.status;
    return {
      if (accountId != null) 'accountId': accountId,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class DelegatedAdminStatus {
  static const enabled = DelegatedAdminStatus._('ENABLED');
  static const disableInProgress =
      DelegatedAdminStatus._('DISABLE_IN_PROGRESS');

  final String value;

  const DelegatedAdminStatus._(this.value);

  static const values = [enabled, disableInProgress];

  static DelegatedAdminStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DelegatedAdminStatus._(value));

  @override
  bool operator ==(other) =>
      other is DelegatedAdminStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// a structure that contains information on the count of resources within a
/// group.
///
/// @nodoc
class Counts {
  /// The number of resources.
  final int? count;

  /// The key associated with this group
  final GroupKey? groupKey;

  Counts({
    this.count,
    this.groupKey,
  });

  factory Counts.fromJson(Map<String, dynamic> json) {
    return Counts(
      count: json['count'] as int?,
      groupKey: (json['groupKey'] as String?)?.let(GroupKey.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final groupKey = this.groupKey;
    return {
      if (count != null) 'count': count,
      if (groupKey != null) 'groupKey': groupKey.value,
    };
  }
}

/// @nodoc
class GroupKey {
  static const scanStatusCode = GroupKey._('SCAN_STATUS_CODE');
  static const scanStatusReason = GroupKey._('SCAN_STATUS_REASON');
  static const accountId = GroupKey._('ACCOUNT_ID');
  static const resourceType = GroupKey._('RESOURCE_TYPE');
  static const ecrRepositoryName = GroupKey._('ECR_REPOSITORY_NAME');

  final String value;

  const GroupKey._(this.value);

  static const values = [
    scanStatusCode,
    scanStatusReason,
    accountId,
    resourceType,
    ecrRepositoryName
  ];

  static GroupKey fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => GroupKey._(value));

  @override
  bool operator ==(other) => other is GroupKey && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that identifies filter criteria for
/// <code>GetCoverageStatistics</code>.
///
/// @nodoc
class CoverageFilterCriteria {
  /// An array of Amazon Web Services account IDs to return coverage statistics
  /// for.
  final List<CoverageStringFilter>? accountId;

  /// Filter criteria for code repositories based on project name.
  final List<CoverageStringFilter>? codeRepositoryProjectName;

  /// Filter criteria for code repositories based on provider type (such as
  /// GitHub, GitLab, etc.).
  final List<CoverageStringFilter>? codeRepositoryProviderType;

  /// Filter criteria for code repositories based on visibility setting (public or
  /// private).
  final List<CoverageStringFilter>? codeRepositoryProviderTypeVisibility;

  /// The Amazon EC2 instance tags to filter on.
  final List<CoverageMapFilter>? ec2InstanceTags;

  /// The number of Amazon ECR images in use.
  final List<CoverageNumberFilter>? ecrImageInUseCount;

  /// The Amazon ECR image that was last in use.
  final List<CoverageDateFilter>? ecrImageLastInUseAt;

  /// The Amazon ECR image tags to filter on.
  final List<CoverageStringFilter>? ecrImageTags;

  /// The Amazon ECR repository name to filter on.
  final List<CoverageStringFilter>? ecrRepositoryName;

  /// The date an image was last pulled at.
  final List<CoverageDateFilter>? imagePulledAt;

  /// Returns coverage statistics for Amazon Web Services Lambda functions
  /// filtered by function names.
  final List<CoverageStringFilter>? lambdaFunctionName;

  /// Returns coverage statistics for Amazon Web Services Lambda functions
  /// filtered by runtime.
  final List<CoverageStringFilter>? lambdaFunctionRuntime;

  /// Returns coverage statistics for Amazon Web Services Lambda functions
  /// filtered by tag.
  final List<CoverageMapFilter>? lambdaFunctionTags;

  /// Filters Amazon Web Services resources based on whether Amazon Inspector has
  /// checked them for vulnerabilities within the specified time range.
  final List<CoverageDateFilter>? lastScannedAt;

  /// Filter criteria for code repositories based on the ID of the last scanned
  /// commit.
  final List<CoverageStringFilter>? lastScannedCommitId;

  /// An array of Amazon Web Services resource IDs to return coverage statistics
  /// for.
  final List<CoverageStringFilter>? resourceId;

  /// An array of Amazon Web Services resource types to return coverage statistics
  /// for. The values can be <code>AWS_EC2_INSTANCE</code>,
  /// <code>AWS_LAMBDA_FUNCTION</code>, <code>AWS_ECR_CONTAINER_IMAGE</code>,
  /// <code>AWS_ECR_REPOSITORY</code> or <code>AWS_ACCOUNT</code>.
  final List<CoverageStringFilter>? resourceType;

  /// The filter to search for Amazon EC2 instance coverage by scan mode. Valid
  /// values are <code>EC2_SSM_AGENT_BASED</code>, <code>EC2_AGENTLESS</code>, and
  /// <code>EC2_INSPECTOR_AGENT_BASED</code>.
  final List<CoverageStringFilter>? scanMode;

  /// The scan status code to filter on. Valid values are:
  /// <code>ValidationException</code>, <code>InternalServerException</code>,
  /// <code>ResourceNotFoundException</code>, <code>BadRequestException</code>,
  /// and <code>ThrottlingException</code>.
  final List<CoverageStringFilter>? scanStatusCode;

  /// The scan status reason to filter on.
  final List<CoverageStringFilter>? scanStatusReason;

  /// An array of Amazon Inspector scan types to return coverage statistics for.
  final List<CoverageStringFilter>? scanType;

  CoverageFilterCriteria({
    this.accountId,
    this.codeRepositoryProjectName,
    this.codeRepositoryProviderType,
    this.codeRepositoryProviderTypeVisibility,
    this.ec2InstanceTags,
    this.ecrImageInUseCount,
    this.ecrImageLastInUseAt,
    this.ecrImageTags,
    this.ecrRepositoryName,
    this.imagePulledAt,
    this.lambdaFunctionName,
    this.lambdaFunctionRuntime,
    this.lambdaFunctionTags,
    this.lastScannedAt,
    this.lastScannedCommitId,
    this.resourceId,
    this.resourceType,
    this.scanMode,
    this.scanStatusCode,
    this.scanStatusReason,
    this.scanType,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final codeRepositoryProjectName = this.codeRepositoryProjectName;
    final codeRepositoryProviderType = this.codeRepositoryProviderType;
    final codeRepositoryProviderTypeVisibility =
        this.codeRepositoryProviderTypeVisibility;
    final ec2InstanceTags = this.ec2InstanceTags;
    final ecrImageInUseCount = this.ecrImageInUseCount;
    final ecrImageLastInUseAt = this.ecrImageLastInUseAt;
    final ecrImageTags = this.ecrImageTags;
    final ecrRepositoryName = this.ecrRepositoryName;
    final imagePulledAt = this.imagePulledAt;
    final lambdaFunctionName = this.lambdaFunctionName;
    final lambdaFunctionRuntime = this.lambdaFunctionRuntime;
    final lambdaFunctionTags = this.lambdaFunctionTags;
    final lastScannedAt = this.lastScannedAt;
    final lastScannedCommitId = this.lastScannedCommitId;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final scanMode = this.scanMode;
    final scanStatusCode = this.scanStatusCode;
    final scanStatusReason = this.scanStatusReason;
    final scanType = this.scanType;
    return {
      if (accountId != null) 'accountId': accountId,
      if (codeRepositoryProjectName != null)
        'codeRepositoryProjectName': codeRepositoryProjectName,
      if (codeRepositoryProviderType != null)
        'codeRepositoryProviderType': codeRepositoryProviderType,
      if (codeRepositoryProviderTypeVisibility != null)
        'codeRepositoryProviderTypeVisibility':
            codeRepositoryProviderTypeVisibility,
      if (ec2InstanceTags != null) 'ec2InstanceTags': ec2InstanceTags,
      if (ecrImageInUseCount != null) 'ecrImageInUseCount': ecrImageInUseCount,
      if (ecrImageLastInUseAt != null)
        'ecrImageLastInUseAt': ecrImageLastInUseAt,
      if (ecrImageTags != null) 'ecrImageTags': ecrImageTags,
      if (ecrRepositoryName != null) 'ecrRepositoryName': ecrRepositoryName,
      if (imagePulledAt != null) 'imagePulledAt': imagePulledAt,
      if (lambdaFunctionName != null) 'lambdaFunctionName': lambdaFunctionName,
      if (lambdaFunctionRuntime != null)
        'lambdaFunctionRuntime': lambdaFunctionRuntime,
      if (lambdaFunctionTags != null) 'lambdaFunctionTags': lambdaFunctionTags,
      if (lastScannedAt != null) 'lastScannedAt': lastScannedAt,
      if (lastScannedCommitId != null)
        'lastScannedCommitId': lastScannedCommitId,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceType != null) 'resourceType': resourceType,
      if (scanMode != null) 'scanMode': scanMode,
      if (scanStatusCode != null) 'scanStatusCode': scanStatusCode,
      if (scanStatusReason != null) 'scanStatusReason': scanStatusReason,
      if (scanType != null) 'scanType': scanType,
    };
  }
}

/// The coverage number to be used in the filter.
///
/// @nodoc
class CoverageNumberFilter {
  /// The lower inclusive for the coverage number.
  final int? lowerInclusive;

  /// The upper inclusive for the coverage number.&gt;
  final int? upperInclusive;

  CoverageNumberFilter({
    this.lowerInclusive,
    this.upperInclusive,
  });

  Map<String, dynamic> toJson() {
    final lowerInclusive = this.lowerInclusive;
    final upperInclusive = this.upperInclusive;
    return {
      if (lowerInclusive != null) 'lowerInclusive': lowerInclusive,
      if (upperInclusive != null) 'upperInclusive': upperInclusive,
    };
  }
}

/// Contains details of a coverage date filter.
///
/// @nodoc
class CoverageDateFilter {
  /// A timestamp representing the end of the time period to filter results by.
  final DateTime? endInclusive;

  /// A timestamp representing the start of the time period to filter results by.
  final DateTime? startInclusive;

  CoverageDateFilter({
    this.endInclusive,
    this.startInclusive,
  });

  Map<String, dynamic> toJson() {
    final endInclusive = this.endInclusive;
    final startInclusive = this.startInclusive;
    return {
      if (endInclusive != null)
        'endInclusive': unixTimestampToJson(endInclusive),
      if (startInclusive != null)
        'startInclusive': unixTimestampToJson(startInclusive),
    };
  }
}

/// Contains details of a coverage map filter.
///
/// @nodoc
class CoverageMapFilter {
  /// The operator to compare coverage on.
  final CoverageMapComparison comparison;

  /// The tag key associated with the coverage map filter.
  final String key;

  /// The tag value associated with the coverage map filter.
  final String? value;

  CoverageMapFilter({
    required this.comparison,
    required this.key,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final key = this.key;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class CoverageMapComparison {
  static const equals = CoverageMapComparison._('EQUALS');

  final String value;

  const CoverageMapComparison._(this.value);

  static const values = [equals];

  static CoverageMapComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CoverageMapComparison._(value));

  @override
  bool operator ==(other) =>
      other is CoverageMapComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details of a coverage string filter.
///
/// @nodoc
class CoverageStringFilter {
  /// The operator to compare strings on.
  final CoverageStringComparison comparison;

  /// The value to compare strings on.
  final String value;

  CoverageStringFilter({
    required this.comparison,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'value': value,
    };
  }
}

/// @nodoc
class CoverageStringComparison {
  static const equals = CoverageStringComparison._('EQUALS');
  static const notEquals = CoverageStringComparison._('NOT_EQUALS');

  final String value;

  const CoverageStringComparison._(this.value);

  static const values = [equals, notEquals];

  static CoverageStringComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CoverageStringComparison._(value));

  @override
  bool operator ==(other) =>
      other is CoverageStringComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that contains details about a resource covered by Amazon
/// Inspector.
///
/// @nodoc
class CoveredResource {
  /// The Amazon Web Services account ID of the covered resource.
  final String accountId;

  /// The ID of the covered resource.
  final String resourceId;

  /// The type of the covered resource.
  final CoverageResourceType resourceType;

  /// The Amazon Inspector scan type covering the resource.
  final ScanType scanType;

  /// The date and time the resource was last checked for vulnerabilities.
  final DateTime? lastScannedAt;

  /// An object that contains details about the metadata.
  final ResourceScanMetadata? resourceMetadata;

  /// The scan method that is applied to the instance.
  final ScanMode? scanMode;

  /// The status of the scan covering the resource.
  final ScanStatus? scanStatus;

  CoveredResource({
    required this.accountId,
    required this.resourceId,
    required this.resourceType,
    required this.scanType,
    this.lastScannedAt,
    this.resourceMetadata,
    this.scanMode,
    this.scanStatus,
  });

  factory CoveredResource.fromJson(Map<String, dynamic> json) {
    return CoveredResource(
      accountId: (json['accountId'] as String?) ?? '',
      resourceId: (json['resourceId'] as String?) ?? '',
      resourceType: CoverageResourceType.fromString(
          (json['resourceType'] as String?) ?? ''),
      scanType: ScanType.fromString((json['scanType'] as String?) ?? ''),
      lastScannedAt: timeStampFromJson(json['lastScannedAt']),
      resourceMetadata: json['resourceMetadata'] != null
          ? ResourceScanMetadata.fromJson(
              json['resourceMetadata'] as Map<String, dynamic>)
          : null,
      scanMode: (json['scanMode'] as String?)?.let(ScanMode.fromString),
      scanStatus: json['scanStatus'] != null
          ? ScanStatus.fromJson(json['scanStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final scanType = this.scanType;
    final lastScannedAt = this.lastScannedAt;
    final resourceMetadata = this.resourceMetadata;
    final scanMode = this.scanMode;
    final scanStatus = this.scanStatus;
    return {
      'accountId': accountId,
      'resourceId': resourceId,
      'resourceType': resourceType.value,
      'scanType': scanType.value,
      if (lastScannedAt != null)
        'lastScannedAt': unixTimestampToJson(lastScannedAt),
      if (resourceMetadata != null) 'resourceMetadata': resourceMetadata,
      if (scanMode != null) 'scanMode': scanMode.value,
      if (scanStatus != null) 'scanStatus': scanStatus,
    };
  }
}

/// @nodoc
class CoverageResourceType {
  static const awsEc2Instance = CoverageResourceType._('AWS_EC2_INSTANCE');
  static const awsEcrContainerImage =
      CoverageResourceType._('AWS_ECR_CONTAINER_IMAGE');
  static const awsEcrRepository = CoverageResourceType._('AWS_ECR_REPOSITORY');
  static const awsLambdaFunction =
      CoverageResourceType._('AWS_LAMBDA_FUNCTION');
  static const codeRepository = CoverageResourceType._('CODE_REPOSITORY');

  final String value;

  const CoverageResourceType._(this.value);

  static const values = [
    awsEc2Instance,
    awsEcrContainerImage,
    awsEcrRepository,
    awsLambdaFunction,
    codeRepository
  ];

  static CoverageResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CoverageResourceType._(value));

  @override
  bool operator ==(other) =>
      other is CoverageResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The status of the scan.
///
/// @nodoc
class ScanStatus {
  /// The scan status. Possible return values and descriptions are:
  ///
  /// <code>ACCESS_DENIED</code> - Resource access policy restricting Amazon
  /// Inspector access. Please update the IAM policy.
  ///
  /// <code>ACCESS_DENIED_TO_ENCRYPTION_KEY</code> - The KMS key policy doesn't
  /// allow Amazon Inspector access. Update the key policy.
  ///
  /// <code>DEEP_INSPECTION_COLLECTION_TIME_LIMIT_EXCEEDED</code> - Amazon
  /// Inspector failed to extract the package inventory because the package
  /// collection time exceeding the maximum threshold of 15 minutes.
  ///
  /// <code>DEEP_INSPECTION_DAILY_SSM_INVENTORY_LIMIT_EXCEEDED</code> - The SSM
  /// agent couldn't send inventory to Amazon Inspector because the SSM quota for
  /// Inventory data collected per instance per day has already been reached for
  /// this instance.
  ///
  /// <code>DEEP_INSPECTION_NO_INVENTORY</code> - The Amazon Inspector plugin
  /// hasn't yet been able to collect an inventory of packages for this instance.
  /// This is usually the result of a pending scan, however, if this status
  /// persists after 6 hours, use SSM to ensure that the required Amazon Inspector
  /// associations exist and are running for the instance.
  ///
  /// <code>DEEP_INSPECTION_PACKAGE_COLLECTION_LIMIT_EXCEEDED</code> - The
  /// instance has exceeded the 5000 package limit for Amazon Inspector Deep
  /// inspection. To resume Deep inspection for this instance you can try to
  /// adjust the custom paths associated with the account.
  ///
  /// <code>EC2_INSTANCE_STOPPED</code> - This EC2 instance is in a stopped state,
  /// therefore, Amazon Inspector will pause scanning. The existing findings will
  /// continue to exist until the instance is terminated. Once the instance is
  /// re-started, Inspector will automatically start scanning the instance again.
  /// Please note that you will not be charged for this instance while it's in a
  /// stopped state.
  ///
  /// <code>EXCLUDED_BY_TAG</code> - This resource was not scanned because it has
  /// been excluded by a tag.
  ///
  /// <code>IMAGE_SIZE_EXCEEDED</code> - Reserved for future use.
  ///
  /// <code>INTEGRATION_CONNNECTION_LOST</code> - Amazon Inspector couldn't
  /// communicate with the source code management platform.
  ///
  /// <code>INTERNAL_ERROR</code> - Amazon Inspector has encountered an internal
  /// error for this resource. Amazon Inspector service will automatically resolve
  /// the issue and resume the scanning. No action required from the user.
  ///
  /// <code>NO_INVENTORY</code> - Amazon Inspector couldn't find software
  /// application inventory to scan for vulnerabilities. This might be caused due
  /// to required Amazon Inspector associations being deleted or failing to run on
  /// your resource. Please verify the status of
  /// <code>InspectorInventoryCollection-do-not-delete</code> association in the
  /// SSM console for the resource. Additionally, you can verify the instance's
  /// inventory in the SSM Fleet Manager console.
  ///
  /// <code>NO_RESOURCES_FOUND</code> - Reserved for future use.
  ///
  /// <code>NO_SCAN_CONFIGURATION_ASSOCIATED</code> - The code repository resource
  /// doesn't have an associated scan configuration.
  ///
  /// <code>PENDING_DISABLE</code> - This resource is pending cleanup during
  /// disablement. The customer will not be billed while a resource is in the
  /// pending disable status.
  ///
  /// <code>PENDING_INITIAL_SCAN</code> - This resource has been identified for
  /// scanning, results will be available soon.
  ///
  /// <code>RESOURCE_TERMINATED</code> - This resource has been terminated. The
  /// findings and coverage associated with this resource are in the process of
  /// being cleaned up.
  ///
  /// <code>SCAN_ELIGIBILITY_EXPIRED</code> - The configured scan duration has
  /// lapsed for this image.
  ///
  /// <code>SCAN_FREQUENCY_MANUAL</code> - This image will not be covered by
  /// Amazon Inspector due to the repository scan frequency configuration.
  ///
  /// <code>SCAN_FREQUENCY_SCAN_ON_PUSH</code> - This image will be scanned one
  /// time and will not new findings because of the scan frequency configuration.
  ///
  /// <code>SCAN_IN_PROGRESS</code> - The resource is currently being scanned.
  ///
  /// <code>STALE_INVENTORY</code> - Amazon Inspector wasn't able to collect an
  /// updated software application inventory in the last 7 days. Please confirm
  /// the required Amazon Inspector associations still exist and you can still see
  /// an updated inventory in the SSM console.
  ///
  /// <code>SUCCESSFUL</code> - The scan was successful.
  ///
  /// <code>UNMANAGED_EC2_INSTANCE</code> - The EC2 instance is not managed by
  /// SSM, please use the following SSM automation to remediate the issue: <a
  /// href="https://docs.aws.amazon.com/systems-manager-automation-runbooks/latest/userguide/automation-awssupport-troubleshoot-managed-instance.html">https://docs.aws.amazon.com/systems-manager-automation-runbooks/latest/userguide/automation-awssupport-troubleshoot-managed-instance.html</a>.
  /// Once the instance becomes managed by SSM, Inspector will automatically begin
  /// scanning this instance.
  ///
  /// <code>UNSUPPORTED_CODE_ARTIFACTS </code> - The function was not scanned
  /// because it has an unsupported code artifacts.
  ///
  /// <code>UNSUPPORTED_CONFIG_FILE</code> - Reserved for future use.
  ///
  /// <code>UNSUPPORTED_LANGUAGE</code> - The scan was unsuccessful because the
  /// repository contains files in an unsupported programming language.
  ///
  /// <code>UNSUPPORTED_MEDIA_TYPE </code>- The ECR image has an unsupported media
  /// type.
  ///
  /// <code>UNSUPPORTED_OS</code> - Amazon Inspector does not support this OS,
  /// architecture, or image manifest type at this time. To see a complete list of
  /// supported operating systems see: <a href="
  /// https://docs.aws.amazon.com/inspector/latest/user/supported.html">https://docs.aws.amazon.com/inspector/latest/user/supported.html</a>.
  ///
  /// <code>UNSUPPORTED_RUNTIME</code> - The function was not scanned because it
  /// has an unsupported runtime. To see a complete list of supported runtimes
  /// see: <a href="
  /// https://docs.aws.amazon.com/inspector/latest/user/supported.html">https://docs.aws.amazon.com/inspector/latest/user/supported.html</a>.
  ///
  /// <code>IMAGE_ARCHIVED</code> - This image has been archived in Amazon ECR and
  /// is no longer available for scanning in Amazon Inspector.
  final ScanStatusReason reason;

  /// The status code of the scan.
  final ScanStatusCode statusCode;

  ScanStatus({
    required this.reason,
    required this.statusCode,
  });

  factory ScanStatus.fromJson(Map<String, dynamic> json) {
    return ScanStatus(
      reason: ScanStatusReason.fromString((json['reason'] as String?) ?? ''),
      statusCode:
          ScanStatusCode.fromString((json['statusCode'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final statusCode = this.statusCode;
    return {
      'reason': reason.value,
      'statusCode': statusCode.value,
    };
  }
}

/// An object that contains details about the metadata for an Amazon ECR
/// resource.
///
/// @nodoc
class ResourceScanMetadata {
  /// Contains metadata about scan coverage for a code repository resource.
  final CodeRepositoryMetadata? codeRepository;

  /// An object that contains metadata details for an Amazon EC2 instance.
  final Ec2Metadata? ec2;

  /// An object that contains details about the container metadata for an Amazon
  /// ECR image.
  final EcrContainerImageMetadata? ecrImage;

  /// An object that contains details about the repository an Amazon ECR image
  /// resides in.
  final EcrRepositoryMetadata? ecrRepository;

  /// An object that contains metadata details for an Amazon Web Services Lambda
  /// function.
  final LambdaFunctionMetadata? lambdaFunction;

  ResourceScanMetadata({
    this.codeRepository,
    this.ec2,
    this.ecrImage,
    this.ecrRepository,
    this.lambdaFunction,
  });

  factory ResourceScanMetadata.fromJson(Map<String, dynamic> json) {
    return ResourceScanMetadata(
      codeRepository: json['codeRepository'] != null
          ? CodeRepositoryMetadata.fromJson(
              json['codeRepository'] as Map<String, dynamic>)
          : null,
      ec2: json['ec2'] != null
          ? Ec2Metadata.fromJson(json['ec2'] as Map<String, dynamic>)
          : null,
      ecrImage: json['ecrImage'] != null
          ? EcrContainerImageMetadata.fromJson(
              json['ecrImage'] as Map<String, dynamic>)
          : null,
      ecrRepository: json['ecrRepository'] != null
          ? EcrRepositoryMetadata.fromJson(
              json['ecrRepository'] as Map<String, dynamic>)
          : null,
      lambdaFunction: json['lambdaFunction'] != null
          ? LambdaFunctionMetadata.fromJson(
              json['lambdaFunction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final codeRepository = this.codeRepository;
    final ec2 = this.ec2;
    final ecrImage = this.ecrImage;
    final ecrRepository = this.ecrRepository;
    final lambdaFunction = this.lambdaFunction;
    return {
      if (codeRepository != null) 'codeRepository': codeRepository,
      if (ec2 != null) 'ec2': ec2,
      if (ecrImage != null) 'ecrImage': ecrImage,
      if (ecrRepository != null) 'ecrRepository': ecrRepository,
      if (lambdaFunction != null) 'lambdaFunction': lambdaFunction,
    };
  }
}

/// @nodoc
class ScanMode {
  static const ec2SsmAgentBased = ScanMode._('EC2_SSM_AGENT_BASED');
  static const ec2Agentless = ScanMode._('EC2_AGENTLESS');
  static const ec2InspectorAgentBased = ScanMode._('EC2_INSPECTOR_AGENT_BASED');

  final String value;

  const ScanMode._(this.value);

  static const values = [
    ec2SsmAgentBased,
    ec2Agentless,
    ec2InspectorAgentBased
  ];

  static ScanMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScanMode._(value));

  @override
  bool operator ==(other) => other is ScanMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information on the Amazon ECR repository metadata associated with a finding.
///
/// @nodoc
class EcrRepositoryMetadata {
  /// The name of the Amazon ECR repository.
  final String? name;

  /// The frequency of scans.
  final EcrScanFrequency? scanFrequency;

  EcrRepositoryMetadata({
    this.name,
    this.scanFrequency,
  });

  factory EcrRepositoryMetadata.fromJson(Map<String, dynamic> json) {
    return EcrRepositoryMetadata(
      name: json['name'] as String?,
      scanFrequency:
          (json['scanFrequency'] as String?)?.let(EcrScanFrequency.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final scanFrequency = this.scanFrequency;
    return {
      if (name != null) 'name': name,
      if (scanFrequency != null) 'scanFrequency': scanFrequency.value,
    };
  }
}

/// Information on the Amazon ECR image metadata associated with a finding.
///
/// @nodoc
class EcrContainerImageMetadata {
  /// The date an image was last pulled at.
  final DateTime? imagePulledAt;

  /// The number of Amazon ECS tasks or Amazon EKS pods where the Amazon ECR
  /// container image is in use.
  final int? inUseCount;

  /// The last time an Amazon ECR image was used in an Amazon ECS task or Amazon
  /// EKS pod.
  final DateTime? lastInUseAt;

  /// Tags associated with the Amazon ECR image metadata.
  final List<String>? tags;

  EcrContainerImageMetadata({
    this.imagePulledAt,
    this.inUseCount,
    this.lastInUseAt,
    this.tags,
  });

  factory EcrContainerImageMetadata.fromJson(Map<String, dynamic> json) {
    return EcrContainerImageMetadata(
      imagePulledAt: timeStampFromJson(json['imagePulledAt']),
      inUseCount: json['inUseCount'] as int?,
      lastInUseAt: timeStampFromJson(json['lastInUseAt']),
      tags: (json['tags'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final imagePulledAt = this.imagePulledAt;
    final inUseCount = this.inUseCount;
    final lastInUseAt = this.lastInUseAt;
    final tags = this.tags;
    return {
      if (imagePulledAt != null)
        'imagePulledAt': unixTimestampToJson(imagePulledAt),
      if (inUseCount != null) 'inUseCount': inUseCount,
      if (lastInUseAt != null) 'lastInUseAt': unixTimestampToJson(lastInUseAt),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Meta data details of an Amazon EC2 instance.
///
/// @nodoc
class Ec2Metadata {
  /// The ID of the Amazon Machine Image (AMI) used to launch the instance.
  final String? amiId;

  /// The platform of the instance.
  final Ec2Platform? platform;

  /// The tags attached to the instance.
  final Map<String, String>? tags;

  Ec2Metadata({
    this.amiId,
    this.platform,
    this.tags,
  });

  factory Ec2Metadata.fromJson(Map<String, dynamic> json) {
    return Ec2Metadata(
      amiId: json['amiId'] as String?,
      platform: (json['platform'] as String?)?.let(Ec2Platform.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final amiId = this.amiId;
    final platform = this.platform;
    final tags = this.tags;
    return {
      if (amiId != null) 'amiId': amiId,
      if (platform != null) 'platform': platform.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The Amazon Web Services Lambda function metadata.
///
/// @nodoc
class LambdaFunctionMetadata {
  /// The name of a function.
  final String? functionName;

  /// The resource tags on an Amazon Web Services Lambda function.
  final Map<String, String>? functionTags;

  /// The layers for an Amazon Web Services Lambda function. A Lambda function can
  /// have up to five layers.
  final List<String>? layers;

  /// An Amazon Web Services Lambda function's runtime.
  final Runtime? runtime;

  LambdaFunctionMetadata({
    this.functionName,
    this.functionTags,
    this.layers,
    this.runtime,
  });

  factory LambdaFunctionMetadata.fromJson(Map<String, dynamic> json) {
    return LambdaFunctionMetadata(
      functionName: json['functionName'] as String?,
      functionTags: (json['functionTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      layers:
          (json['layers'] as List?)?.nonNulls.map((e) => e as String).toList(),
      runtime: (json['runtime'] as String?)?.let(Runtime.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final functionName = this.functionName;
    final functionTags = this.functionTags;
    final layers = this.layers;
    final runtime = this.runtime;
    return {
      if (functionName != null) 'functionName': functionName,
      if (functionTags != null) 'functionTags': functionTags,
      if (layers != null) 'layers': layers,
      if (runtime != null) 'runtime': runtime.value,
    };
  }
}

/// Contains metadata information about a code repository that is being scanned
/// by Amazon Inspector.
///
/// @nodoc
class CodeRepositoryMetadata {
  /// The name of the project in the code repository.
  final String projectName;

  /// The type of repository provider (such as GitHub, GitLab, etc.).
  final String providerType;

  /// The visibility setting of the repository (public or private).
  final String providerTypeVisibility;

  /// The Amazon Resource Name (ARN) of the code security integration associated
  /// with the repository.
  final String? integrationArn;

  /// The ID of the last commit that was scanned in the repository.
  final String? lastScannedCommitId;

  /// Information about on-demand scans performed on the repository.
  final CodeRepositoryOnDemandScan? onDemandScan;

  /// The scan configuration settings applied to the code repository.
  final ProjectCodeSecurityScanConfiguration? scanConfiguration;

  CodeRepositoryMetadata({
    required this.projectName,
    required this.providerType,
    required this.providerTypeVisibility,
    this.integrationArn,
    this.lastScannedCommitId,
    this.onDemandScan,
    this.scanConfiguration,
  });

  factory CodeRepositoryMetadata.fromJson(Map<String, dynamic> json) {
    return CodeRepositoryMetadata(
      projectName: (json['projectName'] as String?) ?? '',
      providerType: (json['providerType'] as String?) ?? '',
      providerTypeVisibility: (json['providerTypeVisibility'] as String?) ?? '',
      integrationArn: json['integrationArn'] as String?,
      lastScannedCommitId: json['lastScannedCommitId'] as String?,
      onDemandScan: json['onDemandScan'] != null
          ? CodeRepositoryOnDemandScan.fromJson(
              json['onDemandScan'] as Map<String, dynamic>)
          : null,
      scanConfiguration: json['scanConfiguration'] != null
          ? ProjectCodeSecurityScanConfiguration.fromJson(
              json['scanConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final projectName = this.projectName;
    final providerType = this.providerType;
    final providerTypeVisibility = this.providerTypeVisibility;
    final integrationArn = this.integrationArn;
    final lastScannedCommitId = this.lastScannedCommitId;
    final onDemandScan = this.onDemandScan;
    final scanConfiguration = this.scanConfiguration;
    return {
      'projectName': projectName,
      'providerType': providerType,
      'providerTypeVisibility': providerTypeVisibility,
      if (integrationArn != null) 'integrationArn': integrationArn,
      if (lastScannedCommitId != null)
        'lastScannedCommitId': lastScannedCommitId,
      if (onDemandScan != null) 'onDemandScan': onDemandScan,
      if (scanConfiguration != null) 'scanConfiguration': scanConfiguration,
    };
  }
}

/// Contains the scan configuration settings applied to a specific project in a
/// code repository.
///
/// @nodoc
class ProjectCodeSecurityScanConfiguration {
  /// The continuous integration scan configurations applied to the project.
  final List<ProjectContinuousIntegrationScanConfiguration>?
      continuousIntegrationScanConfigurations;

  /// The periodic scan configurations applied to the project.
  final List<ProjectPeriodicScanConfiguration>? periodicScanConfigurations;

  ProjectCodeSecurityScanConfiguration({
    this.continuousIntegrationScanConfigurations,
    this.periodicScanConfigurations,
  });

  factory ProjectCodeSecurityScanConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProjectCodeSecurityScanConfiguration(
      continuousIntegrationScanConfigurations:
          (json['continuousIntegrationScanConfigurations'] as List?)
              ?.nonNulls
              .map((e) =>
                  ProjectContinuousIntegrationScanConfiguration.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
      periodicScanConfigurations: (json['periodicScanConfigurations'] as List?)
          ?.nonNulls
          .map((e) => ProjectPeriodicScanConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final continuousIntegrationScanConfigurations =
        this.continuousIntegrationScanConfigurations;
    final periodicScanConfigurations = this.periodicScanConfigurations;
    return {
      if (continuousIntegrationScanConfigurations != null)
        'continuousIntegrationScanConfigurations':
            continuousIntegrationScanConfigurations,
      if (periodicScanConfigurations != null)
        'periodicScanConfigurations': periodicScanConfigurations,
    };
  }
}

/// Contains information about on-demand scans performed on a code repository.
///
/// @nodoc
class CodeRepositoryOnDemandScan {
  /// The timestamp when the last on-demand scan was performed.
  final DateTime? lastScanAt;

  /// The ID of the last commit that was scanned during an on-demand scan.
  final String? lastScannedCommitId;
  final ScanStatus? scanStatus;

  CodeRepositoryOnDemandScan({
    this.lastScanAt,
    this.lastScannedCommitId,
    this.scanStatus,
  });

  factory CodeRepositoryOnDemandScan.fromJson(Map<String, dynamic> json) {
    return CodeRepositoryOnDemandScan(
      lastScanAt: timeStampFromJson(json['lastScanAt']),
      lastScannedCommitId: json['lastScannedCommitId'] as String?,
      scanStatus: json['scanStatus'] != null
          ? ScanStatus.fromJson(json['scanStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lastScanAt = this.lastScanAt;
    final lastScannedCommitId = this.lastScannedCommitId;
    final scanStatus = this.scanStatus;
    return {
      if (lastScanAt != null) 'lastScanAt': unixTimestampToJson(lastScanAt),
      if (lastScannedCommitId != null)
        'lastScannedCommitId': lastScannedCommitId,
      if (scanStatus != null) 'scanStatus': scanStatus,
    };
  }
}

/// Contains the continuous integration scan configuration settings applied to a
/// specific project.
///
/// @nodoc
class ProjectContinuousIntegrationScanConfiguration {
  /// The categories of security rules applied during continuous integration scans
  /// for the project.
  final List<RuleSetCategory>? ruleSetCategories;

  /// The repository event that triggers continuous integration scans for the
  /// project.
  final ContinuousIntegrationScanEvent? supportedEvent;

  ProjectContinuousIntegrationScanConfiguration({
    this.ruleSetCategories,
    this.supportedEvent,
  });

  factory ProjectContinuousIntegrationScanConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ProjectContinuousIntegrationScanConfiguration(
      ruleSetCategories: (json['ruleSetCategories'] as List?)
          ?.nonNulls
          .map((e) => RuleSetCategory.fromString((e as String)))
          .toList(),
      supportedEvent: (json['supportedEvent'] as String?)
          ?.let(ContinuousIntegrationScanEvent.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleSetCategories = this.ruleSetCategories;
    final supportedEvent = this.supportedEvent;
    return {
      if (ruleSetCategories != null)
        'ruleSetCategories': ruleSetCategories.map((e) => e.value).toList(),
      if (supportedEvent != null) 'supportedEvent': supportedEvent.value,
    };
  }
}

/// Contains the periodic scan configuration settings applied to a specific
/// project.
///
/// @nodoc
class ProjectPeriodicScanConfiguration {
  /// The schedule expression for periodic scans, in cron format, applied to the
  /// project.
  final String? frequencyExpression;

  /// The categories of security rules applied during periodic scans for the
  /// project.
  final List<RuleSetCategory>? ruleSetCategories;

  ProjectPeriodicScanConfiguration({
    this.frequencyExpression,
    this.ruleSetCategories,
  });

  factory ProjectPeriodicScanConfiguration.fromJson(Map<String, dynamic> json) {
    return ProjectPeriodicScanConfiguration(
      frequencyExpression: json['frequencyExpression'] as String?,
      ruleSetCategories: (json['ruleSetCategories'] as List?)
          ?.nonNulls
          .map((e) => RuleSetCategory.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final frequencyExpression = this.frequencyExpression;
    final ruleSetCategories = this.ruleSetCategories;
    return {
      if (frequencyExpression != null)
        'frequencyExpression': frequencyExpression,
      if (ruleSetCategories != null)
        'ruleSetCategories': ruleSetCategories.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class Ec2Platform {
  static const windows = Ec2Platform._('WINDOWS');
  static const linux = Ec2Platform._('LINUX');
  static const unknown = Ec2Platform._('UNKNOWN');
  static const macos = Ec2Platform._('MACOS');

  final String value;

  const Ec2Platform._(this.value);

  static const values = [windows, linux, unknown, macos];

  static Ec2Platform fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Ec2Platform._(value));

  @override
  bool operator ==(other) => other is Ec2Platform && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EcrScanFrequency {
  static const manual = EcrScanFrequency._('MANUAL');
  static const scanOnPush = EcrScanFrequency._('SCAN_ON_PUSH');
  static const continuousScan = EcrScanFrequency._('CONTINUOUS_SCAN');

  final String value;

  const EcrScanFrequency._(this.value);

  static const values = [manual, scanOnPush, continuousScan];

  static EcrScanFrequency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EcrScanFrequency._(value));

  @override
  bool operator ==(other) => other is EcrScanFrequency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ScanStatusCode {
  static const active = ScanStatusCode._('ACTIVE');
  static const inactive = ScanStatusCode._('INACTIVE');

  final String value;

  const ScanStatusCode._(this.value);

  static const values = [active, inactive];

  static ScanStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScanStatusCode._(value));

  @override
  bool operator ==(other) => other is ScanStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ScanStatusReason {
  static const pendingInitialScan = ScanStatusReason._('PENDING_INITIAL_SCAN');
  static const accessDenied = ScanStatusReason._('ACCESS_DENIED');
  static const internalError = ScanStatusReason._('INTERNAL_ERROR');
  static const unmanagedEc2Instance =
      ScanStatusReason._('UNMANAGED_EC2_INSTANCE');
  static const unsupportedOs = ScanStatusReason._('UNSUPPORTED_OS');
  static const scanEligibilityExpired =
      ScanStatusReason._('SCAN_ELIGIBILITY_EXPIRED');
  static const resourceTerminated = ScanStatusReason._('RESOURCE_TERMINATED');
  static const successful = ScanStatusReason._('SUCCESSFUL');
  static const noResourcesFound = ScanStatusReason._('NO_RESOURCES_FOUND');
  static const imageSizeExceeded = ScanStatusReason._('IMAGE_SIZE_EXCEEDED');
  static const scanFrequencyManual =
      ScanStatusReason._('SCAN_FREQUENCY_MANUAL');
  static const scanFrequencyScanOnPush =
      ScanStatusReason._('SCAN_FREQUENCY_SCAN_ON_PUSH');
  static const ec2InstanceStopped = ScanStatusReason._('EC2_INSTANCE_STOPPED');
  static const pendingDisable = ScanStatusReason._('PENDING_DISABLE');
  static const noInventory = ScanStatusReason._('NO_INVENTORY');
  static const staleInventory = ScanStatusReason._('STALE_INVENTORY');
  static const excludedByTag = ScanStatusReason._('EXCLUDED_BY_TAG');
  static const unsupportedRuntime = ScanStatusReason._('UNSUPPORTED_RUNTIME');
  static const unsupportedMediaType =
      ScanStatusReason._('UNSUPPORTED_MEDIA_TYPE');
  static const unsupportedConfigFile =
      ScanStatusReason._('UNSUPPORTED_CONFIG_FILE');
  static const deepInspectionPackageCollectionLimitExceeded =
      ScanStatusReason._('DEEP_INSPECTION_PACKAGE_COLLECTION_LIMIT_EXCEEDED');
  static const deepInspectionDailySsmInventoryLimitExceeded =
      ScanStatusReason._('DEEP_INSPECTION_DAILY_SSM_INVENTORY_LIMIT_EXCEEDED');
  static const deepInspectionCollectionTimeLimitExceeded =
      ScanStatusReason._('DEEP_INSPECTION_COLLECTION_TIME_LIMIT_EXCEEDED');
  static const deepInspectionNoInventory =
      ScanStatusReason._('DEEP_INSPECTION_NO_INVENTORY');
  static const agentlessInstanceStorageLimitExceeded =
      ScanStatusReason._('AGENTLESS_INSTANCE_STORAGE_LIMIT_EXCEEDED');
  static const agentlessInstanceCollectionTimeLimitExceeded =
      ScanStatusReason._('AGENTLESS_INSTANCE_COLLECTION_TIME_LIMIT_EXCEEDED');
  static const pendingRevivalScan = ScanStatusReason._('PENDING_REVIVAL_SCAN');
  static const integrationConnectionLost =
      ScanStatusReason._('INTEGRATION_CONNECTION_LOST');
  static const accessDeniedToEncryptionKey =
      ScanStatusReason._('ACCESS_DENIED_TO_ENCRYPTION_KEY');
  static const unsupportedLanguage = ScanStatusReason._('UNSUPPORTED_LANGUAGE');
  static const noScanConfigurationAssociated =
      ScanStatusReason._('NO_SCAN_CONFIGURATION_ASSOCIATED');
  static const scanInProgress = ScanStatusReason._('SCAN_IN_PROGRESS');
  static const imageArchived = ScanStatusReason._('IMAGE_ARCHIVED');
  static const unsupportedCodeArtifacts =
      ScanStatusReason._('UNSUPPORTED_CODE_ARTIFACTS');

  final String value;

  const ScanStatusReason._(this.value);

  static const values = [
    pendingInitialScan,
    accessDenied,
    internalError,
    unmanagedEc2Instance,
    unsupportedOs,
    scanEligibilityExpired,
    resourceTerminated,
    successful,
    noResourcesFound,
    imageSizeExceeded,
    scanFrequencyManual,
    scanFrequencyScanOnPush,
    ec2InstanceStopped,
    pendingDisable,
    noInventory,
    staleInventory,
    excludedByTag,
    unsupportedRuntime,
    unsupportedMediaType,
    unsupportedConfigFile,
    deepInspectionPackageCollectionLimitExceeded,
    deepInspectionDailySsmInventoryLimitExceeded,
    deepInspectionCollectionTimeLimitExceeded,
    deepInspectionNoInventory,
    agentlessInstanceStorageLimitExceeded,
    agentlessInstanceCollectionTimeLimitExceeded,
    pendingRevivalScan,
    integrationConnectionLost,
    accessDeniedToEncryptionKey,
    unsupportedLanguage,
    noScanConfigurationAssociated,
    scanInProgress,
    imageArchived,
    unsupportedCodeArtifacts
  ];

  static ScanStatusReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScanStatusReason._(value));

  @override
  bool operator ==(other) => other is ScanStatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of information about a code security scan configuration.
///
/// @nodoc
class CodeSecurityScanConfigurationSummary {
  /// The name of the scan configuration.
  final String name;

  /// The Amazon Web Services account ID that owns the scan configuration.
  final String ownerAccountId;

  /// The categories of security rules applied during the scan.
  final List<RuleSetCategory> ruleSetCategories;

  /// The Amazon Resource Name (ARN) of the scan configuration.
  final String scanConfigurationArn;

  /// The repository events that trigger continuous integration scans.
  final List<ContinuousIntegrationScanEvent>?
      continuousIntegrationScanSupportedEvents;

  /// The schedule expression for periodic scans, in cron format.
  final String? frequencyExpression;

  /// The frequency at which periodic scans are performed.
  final PeriodicScanFrequency? periodicScanFrequency;

  /// The scope settings that define which repositories will be scanned. If the
  /// <code>ScopeSetting</code> parameter is <code>ALL</code> the scan
  /// configuration applies to all existing and future projects imported into
  /// Amazon Inspector.
  final ScopeSettings? scopeSettings;

  /// The tags associated with the scan configuration.
  final Map<String, String>? tags;

  CodeSecurityScanConfigurationSummary({
    required this.name,
    required this.ownerAccountId,
    required this.ruleSetCategories,
    required this.scanConfigurationArn,
    this.continuousIntegrationScanSupportedEvents,
    this.frequencyExpression,
    this.periodicScanFrequency,
    this.scopeSettings,
    this.tags,
  });

  factory CodeSecurityScanConfigurationSummary.fromJson(
      Map<String, dynamic> json) {
    return CodeSecurityScanConfigurationSummary(
      name: (json['name'] as String?) ?? '',
      ownerAccountId: (json['ownerAccountId'] as String?) ?? '',
      ruleSetCategories: ((json['ruleSetCategories'] as List?) ?? const [])
          .nonNulls
          .map((e) => RuleSetCategory.fromString((e as String)))
          .toList(),
      scanConfigurationArn: (json['scanConfigurationArn'] as String?) ?? '',
      continuousIntegrationScanSupportedEvents: (json[
              'continuousIntegrationScanSupportedEvents'] as List?)
          ?.nonNulls
          .map((e) => ContinuousIntegrationScanEvent.fromString((e as String)))
          .toList(),
      frequencyExpression: json['frequencyExpression'] as String?,
      periodicScanFrequency: (json['periodicScanFrequency'] as String?)
          ?.let(PeriodicScanFrequency.fromString),
      scopeSettings: json['scopeSettings'] != null
          ? ScopeSettings.fromJson(
              json['scopeSettings'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final ruleSetCategories = this.ruleSetCategories;
    final scanConfigurationArn = this.scanConfigurationArn;
    final continuousIntegrationScanSupportedEvents =
        this.continuousIntegrationScanSupportedEvents;
    final frequencyExpression = this.frequencyExpression;
    final periodicScanFrequency = this.periodicScanFrequency;
    final scopeSettings = this.scopeSettings;
    final tags = this.tags;
    return {
      'name': name,
      'ownerAccountId': ownerAccountId,
      'ruleSetCategories': ruleSetCategories.map((e) => e.value).toList(),
      'scanConfigurationArn': scanConfigurationArn,
      if (continuousIntegrationScanSupportedEvents != null)
        'continuousIntegrationScanSupportedEvents':
            continuousIntegrationScanSupportedEvents
                .map((e) => e.value)
                .toList(),
      if (frequencyExpression != null)
        'frequencyExpression': frequencyExpression,
      if (periodicScanFrequency != null)
        'periodicScanFrequency': periodicScanFrequency.value,
      if (scopeSettings != null) 'scopeSettings': scopeSettings,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Defines the scope of repositories to be included in code security scans.
///
/// @nodoc
class ScopeSettings {
  /// The scope of projects to be selected for scanning within the integrated
  /// repositories. Setting the value to <code>ALL</code> applies the scope
  /// settings to all existing and future projects imported into Amazon Inspector.
  final ProjectSelectionScope? projectSelectionScope;

  ScopeSettings({
    this.projectSelectionScope,
  });

  factory ScopeSettings.fromJson(Map<String, dynamic> json) {
    return ScopeSettings(
      projectSelectionScope: (json['projectSelectionScope'] as String?)
          ?.let(ProjectSelectionScope.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final projectSelectionScope = this.projectSelectionScope;
    return {
      if (projectSelectionScope != null)
        'projectSelectionScope': projectSelectionScope.value,
    };
  }
}

/// @nodoc
class ProjectSelectionScope {
  static const all = ProjectSelectionScope._('ALL');

  final String value;

  const ProjectSelectionScope._(this.value);

  static const values = [all];

  static ProjectSelectionScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProjectSelectionScope._(value));

  @override
  bool operator ==(other) =>
      other is ProjectSelectionScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of an association between a code repository and a scan
/// configuration.
///
/// @nodoc
class CodeSecurityScanConfigurationAssociationSummary {
  final CodeSecurityResource? resource;

  CodeSecurityScanConfigurationAssociationSummary({
    this.resource,
  });

  factory CodeSecurityScanConfigurationAssociationSummary.fromJson(
      Map<String, dynamic> json) {
    return CodeSecurityScanConfigurationAssociationSummary(
      resource: json['resource'] != null
          ? CodeSecurityResource.fromJson(
              json['resource'] as Map<String, dynamic>)
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

/// A summary of information about a code security integration.
///
/// @nodoc
class CodeSecurityIntegrationSummary {
  /// The timestamp when the code security integration was created.
  final DateTime createdOn;

  /// The Amazon Resource Name (ARN) of the code security integration.
  final String integrationArn;

  /// The timestamp when the code security integration was last updated.
  final DateTime lastUpdateOn;

  /// The name of the code security integration.
  final String name;

  /// The current status of the code security integration.
  final IntegrationStatus status;

  /// The reason for the current status of the code security integration.
  final String statusReason;

  /// The type of repository provider for the integration.
  final IntegrationType type;

  /// The tags associated with the code security integration.
  final Map<String, String>? tags;

  CodeSecurityIntegrationSummary({
    required this.createdOn,
    required this.integrationArn,
    required this.lastUpdateOn,
    required this.name,
    required this.status,
    required this.statusReason,
    required this.type,
    this.tags,
  });

  factory CodeSecurityIntegrationSummary.fromJson(Map<String, dynamic> json) {
    return CodeSecurityIntegrationSummary(
      createdOn: nonNullableTimeStampFromJson(json['createdOn'] ?? 0),
      integrationArn: (json['integrationArn'] as String?) ?? '',
      lastUpdateOn: nonNullableTimeStampFromJson(json['lastUpdateOn'] ?? 0),
      name: (json['name'] as String?) ?? '',
      status: IntegrationStatus.fromString((json['status'] as String?) ?? ''),
      statusReason: (json['statusReason'] as String?) ?? '',
      type: IntegrationType.fromString((json['type'] as String?) ?? ''),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdOn = this.createdOn;
    final integrationArn = this.integrationArn;
    final lastUpdateOn = this.lastUpdateOn;
    final name = this.name;
    final status = this.status;
    final statusReason = this.statusReason;
    final type = this.type;
    final tags = this.tags;
    return {
      'createdOn': unixTimestampToJson(createdOn),
      'integrationArn': integrationArn,
      'lastUpdateOn': unixTimestampToJson(lastUpdateOn),
      'name': name,
      'status': status.value,
      'statusReason': statusReason,
      'type': type.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class IntegrationType {
  static const gitlabSelfManaged = IntegrationType._('GITLAB_SELF_MANAGED');
  static const github = IntegrationType._('GITHUB');

  final String value;

  const IntegrationType._(this.value);

  static const values = [gitlabSelfManaged, github];

  static IntegrationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IntegrationType._(value));

  @override
  bool operator ==(other) => other is IntegrationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS scan.
///
/// @nodoc
class CisScan {
  /// The CIS scan's ARN.
  final String scanArn;

  /// The CIS scan's configuration ARN.
  final String scanConfigurationArn;

  /// The CIS scan's failed checks.
  final int? failedChecks;

  /// The CIS scan's date.
  final DateTime? scanDate;

  /// The the name of the scan configuration that's associated with this scan.
  final String? scanName;

  /// The account or organization that schedules the CIS scan.
  final String? scheduledBy;

  /// The security level for the CIS scan. Security level refers to the Benchmark
  /// levels that CIS assigns to a profile.
  final CisSecurityLevel? securityLevel;

  /// The CIS scan's status.
  final CisScanStatus? status;

  /// The CIS scan's targets.
  final CisTargets? targets;

  /// The CIS scan's total checks.
  final int? totalChecks;

  CisScan({
    required this.scanArn,
    required this.scanConfigurationArn,
    this.failedChecks,
    this.scanDate,
    this.scanName,
    this.scheduledBy,
    this.securityLevel,
    this.status,
    this.targets,
    this.totalChecks,
  });

  factory CisScan.fromJson(Map<String, dynamic> json) {
    return CisScan(
      scanArn: (json['scanArn'] as String?) ?? '',
      scanConfigurationArn: (json['scanConfigurationArn'] as String?) ?? '',
      failedChecks: json['failedChecks'] as int?,
      scanDate: timeStampFromJson(json['scanDate']),
      scanName: json['scanName'] as String?,
      scheduledBy: json['scheduledBy'] as String?,
      securityLevel:
          (json['securityLevel'] as String?)?.let(CisSecurityLevel.fromString),
      status: (json['status'] as String?)?.let(CisScanStatus.fromString),
      targets: json['targets'] != null
          ? CisTargets.fromJson(json['targets'] as Map<String, dynamic>)
          : null,
      totalChecks: json['totalChecks'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final scanArn = this.scanArn;
    final scanConfigurationArn = this.scanConfigurationArn;
    final failedChecks = this.failedChecks;
    final scanDate = this.scanDate;
    final scanName = this.scanName;
    final scheduledBy = this.scheduledBy;
    final securityLevel = this.securityLevel;
    final status = this.status;
    final targets = this.targets;
    final totalChecks = this.totalChecks;
    return {
      'scanArn': scanArn,
      'scanConfigurationArn': scanConfigurationArn,
      if (failedChecks != null) 'failedChecks': failedChecks,
      if (scanDate != null) 'scanDate': unixTimestampToJson(scanDate),
      if (scanName != null) 'scanName': scanName,
      if (scheduledBy != null) 'scheduledBy': scheduledBy,
      if (securityLevel != null) 'securityLevel': securityLevel.value,
      if (status != null) 'status': status.value,
      if (targets != null) 'targets': targets,
      if (totalChecks != null) 'totalChecks': totalChecks,
    };
  }
}

/// @nodoc
class CisScanStatus {
  static const failed = CisScanStatus._('FAILED');
  static const completed = CisScanStatus._('COMPLETED');
  static const cancelled = CisScanStatus._('CANCELLED');
  static const inProgress = CisScanStatus._('IN_PROGRESS');

  final String value;

  const CisScanStatus._(this.value);

  static const values = [failed, completed, cancelled, inProgress];

  static CisScanStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisScanStatus._(value));

  @override
  bool operator ==(other) => other is CisScanStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS targets.
///
/// @nodoc
class CisTargets {
  /// The CIS target account ids.
  final List<String>? accountIds;

  /// The CIS target resource tags.
  final Map<String, List<String>>? targetResourceTags;

  CisTargets({
    this.accountIds,
    this.targetResourceTags,
  });

  factory CisTargets.fromJson(Map<String, dynamic> json) {
    return CisTargets(
      accountIds: (json['accountIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      targetResourceTags: (json['targetResourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, (e as List).nonNulls.map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final targetResourceTags = this.targetResourceTags;
    return {
      if (accountIds != null) 'accountIds': accountIds,
      if (targetResourceTags != null) 'targetResourceTags': targetResourceTags,
    };
  }
}

/// A list of CIS scans filter criteria.
///
/// @nodoc
class ListCisScansFilterCriteria {
  /// The list of failed checks filters.
  final List<CisNumberFilter>? failedChecksFilters;

  /// The list of scan ARN filters.
  final List<CisStringFilter>? scanArnFilters;

  /// The list of scan at filters.
  final List<CisDateFilter>? scanAtFilters;

  /// The list of scan configuration ARN filters.
  final List<CisStringFilter>? scanConfigurationArnFilters;

  /// The list of scan name filters.
  final List<CisStringFilter>? scanNameFilters;

  /// The list of scan status filters.
  final List<CisScanStatusFilter>? scanStatusFilters;

  /// The list of scheduled by filters.
  final List<CisStringFilter>? scheduledByFilters;

  /// The list of target account ID filters.
  final List<CisStringFilter>? targetAccountIdFilters;

  /// The list of target resource ID filters.
  final List<CisStringFilter>? targetResourceIdFilters;

  /// The list of target resource tag filters.
  final List<TagFilter>? targetResourceTagFilters;

  ListCisScansFilterCriteria({
    this.failedChecksFilters,
    this.scanArnFilters,
    this.scanAtFilters,
    this.scanConfigurationArnFilters,
    this.scanNameFilters,
    this.scanStatusFilters,
    this.scheduledByFilters,
    this.targetAccountIdFilters,
    this.targetResourceIdFilters,
    this.targetResourceTagFilters,
  });

  Map<String, dynamic> toJson() {
    final failedChecksFilters = this.failedChecksFilters;
    final scanArnFilters = this.scanArnFilters;
    final scanAtFilters = this.scanAtFilters;
    final scanConfigurationArnFilters = this.scanConfigurationArnFilters;
    final scanNameFilters = this.scanNameFilters;
    final scanStatusFilters = this.scanStatusFilters;
    final scheduledByFilters = this.scheduledByFilters;
    final targetAccountIdFilters = this.targetAccountIdFilters;
    final targetResourceIdFilters = this.targetResourceIdFilters;
    final targetResourceTagFilters = this.targetResourceTagFilters;
    return {
      if (failedChecksFilters != null)
        'failedChecksFilters': failedChecksFilters,
      if (scanArnFilters != null) 'scanArnFilters': scanArnFilters,
      if (scanAtFilters != null) 'scanAtFilters': scanAtFilters,
      if (scanConfigurationArnFilters != null)
        'scanConfigurationArnFilters': scanConfigurationArnFilters,
      if (scanNameFilters != null) 'scanNameFilters': scanNameFilters,
      if (scanStatusFilters != null) 'scanStatusFilters': scanStatusFilters,
      if (scheduledByFilters != null) 'scheduledByFilters': scheduledByFilters,
      if (targetAccountIdFilters != null)
        'targetAccountIdFilters': targetAccountIdFilters,
      if (targetResourceIdFilters != null)
        'targetResourceIdFilters': targetResourceIdFilters,
      if (targetResourceTagFilters != null)
        'targetResourceTagFilters': targetResourceTagFilters,
    };
  }
}

/// @nodoc
class ListCisScansDetailLevel {
  static const organization = ListCisScansDetailLevel._('ORGANIZATION');
  static const member = ListCisScansDetailLevel._('MEMBER');

  final String value;

  const ListCisScansDetailLevel._(this.value);

  static const values = [organization, member];

  static ListCisScansDetailLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListCisScansDetailLevel._(value));

  @override
  bool operator ==(other) =>
      other is ListCisScansDetailLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ListCisScansSortBy {
  static const status = ListCisScansSortBy._('STATUS');
  static const scheduledBy = ListCisScansSortBy._('SCHEDULED_BY');
  static const scanStartDate = ListCisScansSortBy._('SCAN_START_DATE');
  static const failedChecks = ListCisScansSortBy._('FAILED_CHECKS');

  final String value;

  const ListCisScansSortBy._(this.value);

  static const values = [status, scheduledBy, scanStartDate, failedChecks];

  static ListCisScansSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListCisScansSortBy._(value));

  @override
  bool operator ==(other) =>
      other is ListCisScansSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CisSortOrder {
  static const asc = CisSortOrder._('ASC');
  static const desc = CisSortOrder._('DESC');

  final String value;

  const CisSortOrder._(this.value);

  static const values = [asc, desc];

  static CisSortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CisSortOrder._(value));

  @override
  bool operator ==(other) => other is CisSortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS string filter.
///
/// @nodoc
class CisStringFilter {
  /// The comparison value of the CIS string filter.
  final CisStringComparison comparison;

  /// The value of the CIS string filter.
  final String value;

  CisStringFilter({
    required this.comparison,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'value': value,
    };
  }
}

/// @nodoc
class CisStringComparison {
  static const equals = CisStringComparison._('EQUALS');
  static const prefix = CisStringComparison._('PREFIX');
  static const notEquals = CisStringComparison._('NOT_EQUALS');

  final String value;

  const CisStringComparison._(this.value);

  static const values = [equals, prefix, notEquals];

  static CisStringComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisStringComparison._(value));

  @override
  bool operator ==(other) =>
      other is CisStringComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS number filter.
///
/// @nodoc
class CisNumberFilter {
  /// The CIS number filter's lower inclusive.
  final int? lowerInclusive;

  /// The CIS number filter's upper inclusive.
  final int? upperInclusive;

  CisNumberFilter({
    this.lowerInclusive,
    this.upperInclusive,
  });

  Map<String, dynamic> toJson() {
    final lowerInclusive = this.lowerInclusive;
    final upperInclusive = this.upperInclusive;
    return {
      if (lowerInclusive != null) 'lowerInclusive': lowerInclusive,
      if (upperInclusive != null) 'upperInclusive': upperInclusive,
    };
  }
}

/// The CIS date filter.
///
/// @nodoc
class CisDateFilter {
  /// The CIS date filter's earliest scan start time.
  final DateTime? earliestScanStartTime;

  /// The CIS date filter's latest scan start time.
  final DateTime? latestScanStartTime;

  CisDateFilter({
    this.earliestScanStartTime,
    this.latestScanStartTime,
  });

  Map<String, dynamic> toJson() {
    final earliestScanStartTime = this.earliestScanStartTime;
    final latestScanStartTime = this.latestScanStartTime;
    return {
      if (earliestScanStartTime != null)
        'earliestScanStartTime': unixTimestampToJson(earliestScanStartTime),
      if (latestScanStartTime != null)
        'latestScanStartTime': unixTimestampToJson(latestScanStartTime),
    };
  }
}

/// The CIS scan status filter.
///
/// @nodoc
class CisScanStatusFilter {
  /// The filter comparison value.
  final CisScanStatusComparison comparison;

  /// The filter value.
  final CisScanStatus value;

  CisScanStatusFilter({
    required this.comparison,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'value': value.value,
    };
  }
}

/// @nodoc
class CisScanStatusComparison {
  static const equals = CisScanStatusComparison._('EQUALS');

  final String value;

  const CisScanStatusComparison._(this.value);

  static const values = [equals];

  static CisScanStatusComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisScanStatusComparison._(value));

  @override
  bool operator ==(other) =>
      other is CisScanStatusComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The tag filter.
///
/// @nodoc
class TagFilter {
  /// The tag filter comparison value.
  final TagComparison comparison;

  /// The tag filter key.
  final String key;

  /// The tag filter value.
  final String value;

  TagFilter({
    required this.comparison,
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final key = this.key;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'key': key,
      'value': value,
    };
  }
}

/// @nodoc
class TagComparison {
  static const equals = TagComparison._('EQUALS');

  final String value;

  const TagComparison._(this.value);

  static const values = [equals];

  static TagComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TagComparison._(value));

  @override
  bool operator ==(other) => other is TagComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS target resource aggregation.
///
/// @nodoc
class CisTargetResourceAggregation {
  /// The scan ARN for the CIS target resource.
  final String scanArn;

  /// The account ID for the CIS target resource.
  final String? accountId;

  /// The platform for the CIS target resource.
  final String? platform;

  /// The target resource status counts.
  final StatusCounts? statusCounts;

  /// The ID of the target resource.
  final String? targetResourceId;

  /// The tag for the target resource.
  final Map<String, List<String>>? targetResourceTags;

  /// The status of the target resource.
  final CisTargetStatus? targetStatus;

  /// The reason for the target resource.
  final CisTargetStatusReason? targetStatusReason;

  CisTargetResourceAggregation({
    required this.scanArn,
    this.accountId,
    this.platform,
    this.statusCounts,
    this.targetResourceId,
    this.targetResourceTags,
    this.targetStatus,
    this.targetStatusReason,
  });

  factory CisTargetResourceAggregation.fromJson(Map<String, dynamic> json) {
    return CisTargetResourceAggregation(
      scanArn: (json['scanArn'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      platform: json['platform'] as String?,
      statusCounts: json['statusCounts'] != null
          ? StatusCounts.fromJson(json['statusCounts'] as Map<String, dynamic>)
          : null,
      targetResourceId: json['targetResourceId'] as String?,
      targetResourceTags: (json['targetResourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, (e as List).nonNulls.map((e) => e as String).toList())),
      targetStatus:
          (json['targetStatus'] as String?)?.let(CisTargetStatus.fromString),
      targetStatusReason: (json['targetStatusReason'] as String?)
          ?.let(CisTargetStatusReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final scanArn = this.scanArn;
    final accountId = this.accountId;
    final platform = this.platform;
    final statusCounts = this.statusCounts;
    final targetResourceId = this.targetResourceId;
    final targetResourceTags = this.targetResourceTags;
    final targetStatus = this.targetStatus;
    final targetStatusReason = this.targetStatusReason;
    return {
      'scanArn': scanArn,
      if (accountId != null) 'accountId': accountId,
      if (platform != null) 'platform': platform,
      if (statusCounts != null) 'statusCounts': statusCounts,
      if (targetResourceId != null) 'targetResourceId': targetResourceId,
      if (targetResourceTags != null) 'targetResourceTags': targetResourceTags,
      if (targetStatus != null) 'targetStatus': targetStatus.value,
      if (targetStatusReason != null)
        'targetStatusReason': targetStatusReason.value,
    };
  }
}

/// The status counts.
///
/// @nodoc
class StatusCounts {
  /// The number of checks that failed.
  final int? failed;

  /// The number of checks that passed.
  final int? passed;

  /// The number of checks that were skipped.
  final int? skipped;

  StatusCounts({
    this.failed,
    this.passed,
    this.skipped,
  });

  factory StatusCounts.fromJson(Map<String, dynamic> json) {
    return StatusCounts(
      failed: json['failed'] as int?,
      passed: json['passed'] as int?,
      skipped: json['skipped'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final passed = this.passed;
    final skipped = this.skipped;
    return {
      if (failed != null) 'failed': failed,
      if (passed != null) 'passed': passed,
      if (skipped != null) 'skipped': skipped,
    };
  }
}

/// @nodoc
class CisTargetStatus {
  static const timedOut = CisTargetStatus._('TIMED_OUT');
  static const cancelled = CisTargetStatus._('CANCELLED');
  static const completed = CisTargetStatus._('COMPLETED');

  final String value;

  const CisTargetStatus._(this.value);

  static const values = [timedOut, cancelled, completed];

  static CisTargetStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisTargetStatus._(value));

  @override
  bool operator ==(other) => other is CisTargetStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CisTargetStatusReason {
  static const scanInProgress = CisTargetStatusReason._('SCAN_IN_PROGRESS');
  static const unsupportedOs = CisTargetStatusReason._('UNSUPPORTED_OS');
  static const ssmUnmanaged = CisTargetStatusReason._('SSM_UNMANAGED');

  final String value;

  const CisTargetStatusReason._(this.value);

  static const values = [scanInProgress, unsupportedOs, ssmUnmanaged];

  static CisTargetStatusReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisTargetStatusReason._(value));

  @override
  bool operator ==(other) =>
      other is CisTargetStatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The scan results aggregated by target resource filter criteria.
///
/// @nodoc
class CisScanResultsAggregatedByTargetResourceFilterCriteria {
  /// The criteria's account ID filters.
  final List<CisStringFilter>? accountIdFilters;

  /// The criteria's check ID filters.
  final List<CisStringFilter>? checkIdFilters;

  /// The criteria's failed checks filters.
  final List<CisNumberFilter>? failedChecksFilters;

  /// The criteria's platform filters.
  final List<CisStringFilter>? platformFilters;

  /// The criteria's status filter.
  final List<CisResultStatusFilter>? statusFilters;

  /// The criteria's target resource ID filters.
  final List<CisStringFilter>? targetResourceIdFilters;

  /// The criteria's target resource tag filters.
  final List<TagFilter>? targetResourceTagFilters;

  /// The criteria's target status filters.
  final List<CisTargetStatusFilter>? targetStatusFilters;

  /// The criteria's target status reason filters.
  final List<CisTargetStatusReasonFilter>? targetStatusReasonFilters;

  CisScanResultsAggregatedByTargetResourceFilterCriteria({
    this.accountIdFilters,
    this.checkIdFilters,
    this.failedChecksFilters,
    this.platformFilters,
    this.statusFilters,
    this.targetResourceIdFilters,
    this.targetResourceTagFilters,
    this.targetStatusFilters,
    this.targetStatusReasonFilters,
  });

  Map<String, dynamic> toJson() {
    final accountIdFilters = this.accountIdFilters;
    final checkIdFilters = this.checkIdFilters;
    final failedChecksFilters = this.failedChecksFilters;
    final platformFilters = this.platformFilters;
    final statusFilters = this.statusFilters;
    final targetResourceIdFilters = this.targetResourceIdFilters;
    final targetResourceTagFilters = this.targetResourceTagFilters;
    final targetStatusFilters = this.targetStatusFilters;
    final targetStatusReasonFilters = this.targetStatusReasonFilters;
    return {
      if (accountIdFilters != null) 'accountIdFilters': accountIdFilters,
      if (checkIdFilters != null) 'checkIdFilters': checkIdFilters,
      if (failedChecksFilters != null)
        'failedChecksFilters': failedChecksFilters,
      if (platformFilters != null) 'platformFilters': platformFilters,
      if (statusFilters != null) 'statusFilters': statusFilters,
      if (targetResourceIdFilters != null)
        'targetResourceIdFilters': targetResourceIdFilters,
      if (targetResourceTagFilters != null)
        'targetResourceTagFilters': targetResourceTagFilters,
      if (targetStatusFilters != null)
        'targetStatusFilters': targetStatusFilters,
      if (targetStatusReasonFilters != null)
        'targetStatusReasonFilters': targetStatusReasonFilters,
    };
  }
}

/// @nodoc
class CisScanResultsAggregatedByTargetResourceSortBy {
  static const resourceId =
      CisScanResultsAggregatedByTargetResourceSortBy._('RESOURCE_ID');
  static const failedCounts =
      CisScanResultsAggregatedByTargetResourceSortBy._('FAILED_COUNTS');
  static const accountId =
      CisScanResultsAggregatedByTargetResourceSortBy._('ACCOUNT_ID');
  static const platform =
      CisScanResultsAggregatedByTargetResourceSortBy._('PLATFORM');
  static const targetStatus =
      CisScanResultsAggregatedByTargetResourceSortBy._('TARGET_STATUS');
  static const targetStatusReason =
      CisScanResultsAggregatedByTargetResourceSortBy._('TARGET_STATUS_REASON');

  final String value;

  const CisScanResultsAggregatedByTargetResourceSortBy._(this.value);

  static const values = [
    resourceId,
    failedCounts,
    accountId,
    platform,
    targetStatus,
    targetStatusReason
  ];

  static CisScanResultsAggregatedByTargetResourceSortBy fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              CisScanResultsAggregatedByTargetResourceSortBy._(value));

  @override
  bool operator ==(other) =>
      other is CisScanResultsAggregatedByTargetResourceSortBy &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS target status reason filter.
///
/// @nodoc
class CisTargetStatusReasonFilter {
  /// The comparison value of the CIS target status reason filter.
  final CisTargetStatusComparison comparison;

  /// The value of the CIS target status reason filter.
  final CisTargetStatusReason value;

  CisTargetStatusReasonFilter({
    required this.comparison,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'value': value.value,
    };
  }
}

/// @nodoc
class CisTargetStatusComparison {
  static const equals = CisTargetStatusComparison._('EQUALS');

  final String value;

  const CisTargetStatusComparison._(this.value);

  static const values = [equals];

  static CisTargetStatusComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisTargetStatusComparison._(value));

  @override
  bool operator ==(other) =>
      other is CisTargetStatusComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS target status filter.
///
/// @nodoc
class CisTargetStatusFilter {
  /// The comparison value of the CIS target status filter.
  final CisTargetStatusComparison comparison;

  /// The value of the CIS target status filter.
  final CisTargetStatus value;

  CisTargetStatusFilter({
    required this.comparison,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'value': value.value,
    };
  }
}

/// The CIS result status filter.
///
/// @nodoc
class CisResultStatusFilter {
  /// The comparison value of the CIS result status filter.
  final CisResultStatusComparison comparison;

  /// The value of the CIS result status filter.
  final CisResultStatus value;

  CisResultStatusFilter({
    required this.comparison,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'value': value.value,
    };
  }
}

/// @nodoc
class CisResultStatusComparison {
  static const equals = CisResultStatusComparison._('EQUALS');

  final String value;

  const CisResultStatusComparison._(this.value);

  static const values = [equals];

  static CisResultStatusComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisResultStatusComparison._(value));

  @override
  bool operator ==(other) =>
      other is CisResultStatusComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CisResultStatus {
  static const passed = CisResultStatus._('PASSED');
  static const failed = CisResultStatus._('FAILED');
  static const skipped = CisResultStatus._('SKIPPED');

  final String value;

  const CisResultStatus._(this.value);

  static const values = [passed, failed, skipped];

  static CisResultStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisResultStatus._(value));

  @override
  bool operator ==(other) => other is CisResultStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A CIS check.
///
/// @nodoc
class CisCheckAggregation {
  /// The scan ARN for the CIS check scan ARN.
  final String scanArn;

  /// The account ID for the CIS check.
  final String? accountId;

  /// The description for the CIS check.
  final String? checkDescription;

  /// The check ID for the CIS check.
  final String? checkId;

  /// The CIS check level.
  final CisSecurityLevel? level;

  /// The CIS check platform.
  final String? platform;

  /// The CIS check status counts.
  final StatusCounts? statusCounts;

  /// The CIS check title.
  final String? title;

  CisCheckAggregation({
    required this.scanArn,
    this.accountId,
    this.checkDescription,
    this.checkId,
    this.level,
    this.platform,
    this.statusCounts,
    this.title,
  });

  factory CisCheckAggregation.fromJson(Map<String, dynamic> json) {
    return CisCheckAggregation(
      scanArn: (json['scanArn'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      checkDescription: json['checkDescription'] as String?,
      checkId: json['checkId'] as String?,
      level: (json['level'] as String?)?.let(CisSecurityLevel.fromString),
      platform: json['platform'] as String?,
      statusCounts: json['statusCounts'] != null
          ? StatusCounts.fromJson(json['statusCounts'] as Map<String, dynamic>)
          : null,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scanArn = this.scanArn;
    final accountId = this.accountId;
    final checkDescription = this.checkDescription;
    final checkId = this.checkId;
    final level = this.level;
    final platform = this.platform;
    final statusCounts = this.statusCounts;
    final title = this.title;
    return {
      'scanArn': scanArn,
      if (accountId != null) 'accountId': accountId,
      if (checkDescription != null) 'checkDescription': checkDescription,
      if (checkId != null) 'checkId': checkId,
      if (level != null) 'level': level.value,
      if (platform != null) 'platform': platform,
      if (statusCounts != null) 'statusCounts': statusCounts,
      if (title != null) 'title': title,
    };
  }
}

/// The scan results aggregated by checks filter criteria.
///
/// @nodoc
class CisScanResultsAggregatedByChecksFilterCriteria {
  /// The criteria's account ID filters.
  final List<CisStringFilter>? accountIdFilters;

  /// The criteria's check ID filters.
  final List<CisStringFilter>? checkIdFilters;

  /// The criteria's failed resources filters.
  final List<CisNumberFilter>? failedResourcesFilters;

  /// The criteria's platform filters.
  final List<CisStringFilter>? platformFilters;

  /// The criteria's security level filters.
  final List<CisSecurityLevelFilter>? securityLevelFilters;

  /// The criteria's title filters.
  final List<CisStringFilter>? titleFilters;

  CisScanResultsAggregatedByChecksFilterCriteria({
    this.accountIdFilters,
    this.checkIdFilters,
    this.failedResourcesFilters,
    this.platformFilters,
    this.securityLevelFilters,
    this.titleFilters,
  });

  Map<String, dynamic> toJson() {
    final accountIdFilters = this.accountIdFilters;
    final checkIdFilters = this.checkIdFilters;
    final failedResourcesFilters = this.failedResourcesFilters;
    final platformFilters = this.platformFilters;
    final securityLevelFilters = this.securityLevelFilters;
    final titleFilters = this.titleFilters;
    return {
      if (accountIdFilters != null) 'accountIdFilters': accountIdFilters,
      if (checkIdFilters != null) 'checkIdFilters': checkIdFilters,
      if (failedResourcesFilters != null)
        'failedResourcesFilters': failedResourcesFilters,
      if (platformFilters != null) 'platformFilters': platformFilters,
      if (securityLevelFilters != null)
        'securityLevelFilters': securityLevelFilters,
      if (titleFilters != null) 'titleFilters': titleFilters,
    };
  }
}

/// @nodoc
class CisScanResultsAggregatedByChecksSortBy {
  static const checkId = CisScanResultsAggregatedByChecksSortBy._('CHECK_ID');
  static const title = CisScanResultsAggregatedByChecksSortBy._('TITLE');
  static const platform = CisScanResultsAggregatedByChecksSortBy._('PLATFORM');
  static const failedCounts =
      CisScanResultsAggregatedByChecksSortBy._('FAILED_COUNTS');
  static const securityLevel =
      CisScanResultsAggregatedByChecksSortBy._('SECURITY_LEVEL');

  final String value;

  const CisScanResultsAggregatedByChecksSortBy._(this.value);

  static const values = [checkId, title, platform, failedCounts, securityLevel];

  static CisScanResultsAggregatedByChecksSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisScanResultsAggregatedByChecksSortBy._(value));

  @override
  bool operator ==(other) =>
      other is CisScanResultsAggregatedByChecksSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS security level filter. Security level refers to the Benchmark levels
/// that CIS assigns to a profile.
///
/// @nodoc
class CisSecurityLevelFilter {
  /// The CIS security filter comparison value.
  final CisSecurityLevelComparison comparison;

  /// The CIS security filter value.
  final CisSecurityLevel value;

  CisSecurityLevelFilter({
    required this.comparison,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'value': value.value,
    };
  }
}

/// @nodoc
class CisSecurityLevelComparison {
  static const equals = CisSecurityLevelComparison._('EQUALS');

  final String value;

  const CisSecurityLevelComparison._(this.value);

  static const values = [equals];

  static CisSecurityLevelComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisSecurityLevelComparison._(value));

  @override
  bool operator ==(other) =>
      other is CisSecurityLevelComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS scan configuration.
///
/// @nodoc
class CisScanConfiguration {
  /// The CIS scan configuration's scan configuration ARN.
  final String scanConfigurationArn;

  /// The CIS scan configuration's owner ID.
  final String? ownerId;

  /// The name of the CIS scan configuration.
  final String? scanName;

  /// The CIS scan configuration's schedule.
  final Schedule? schedule;

  /// The CIS scan configuration's security level.
  final CisSecurityLevel? securityLevel;

  /// The CIS scan configuration's tags.
  final Map<String, String>? tags;

  /// The CIS scan configuration's targets.
  final CisTargets? targets;

  CisScanConfiguration({
    required this.scanConfigurationArn,
    this.ownerId,
    this.scanName,
    this.schedule,
    this.securityLevel,
    this.tags,
    this.targets,
  });

  factory CisScanConfiguration.fromJson(Map<String, dynamic> json) {
    return CisScanConfiguration(
      scanConfigurationArn: (json['scanConfigurationArn'] as String?) ?? '',
      ownerId: json['ownerId'] as String?,
      scanName: json['scanName'] as String?,
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
      securityLevel:
          (json['securityLevel'] as String?)?.let(CisSecurityLevel.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targets: json['targets'] != null
          ? CisTargets.fromJson(json['targets'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scanConfigurationArn = this.scanConfigurationArn;
    final ownerId = this.ownerId;
    final scanName = this.scanName;
    final schedule = this.schedule;
    final securityLevel = this.securityLevel;
    final tags = this.tags;
    final targets = this.targets;
    return {
      'scanConfigurationArn': scanConfigurationArn,
      if (ownerId != null) 'ownerId': ownerId,
      if (scanName != null) 'scanName': scanName,
      if (schedule != null) 'schedule': schedule,
      if (securityLevel != null) 'securityLevel': securityLevel.value,
      if (tags != null) 'tags': tags,
      if (targets != null) 'targets': targets,
    };
  }
}

/// A list of CIS scan configurations filter criteria.
///
/// @nodoc
class ListCisScanConfigurationsFilterCriteria {
  /// The list of scan configuration ARN filters.
  final List<CisStringFilter>? scanConfigurationArnFilters;

  /// The list of scan name filters.
  final List<CisStringFilter>? scanNameFilters;

  /// The list of target resource tag filters.
  final List<TagFilter>? targetResourceTagFilters;

  ListCisScanConfigurationsFilterCriteria({
    this.scanConfigurationArnFilters,
    this.scanNameFilters,
    this.targetResourceTagFilters,
  });

  Map<String, dynamic> toJson() {
    final scanConfigurationArnFilters = this.scanConfigurationArnFilters;
    final scanNameFilters = this.scanNameFilters;
    final targetResourceTagFilters = this.targetResourceTagFilters;
    return {
      if (scanConfigurationArnFilters != null)
        'scanConfigurationArnFilters': scanConfigurationArnFilters,
      if (scanNameFilters != null) 'scanNameFilters': scanNameFilters,
      if (targetResourceTagFilters != null)
        'targetResourceTagFilters': targetResourceTagFilters,
    };
  }
}

/// @nodoc
class CisScanConfigurationsSortBy {
  static const scanName = CisScanConfigurationsSortBy._('SCAN_NAME');
  static const scanConfigurationArn =
      CisScanConfigurationsSortBy._('SCAN_CONFIGURATION_ARN');

  final String value;

  const CisScanConfigurationsSortBy._(this.value);

  static const values = [scanName, scanConfigurationArn];

  static CisScanConfigurationsSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisScanConfigurationsSortBy._(value));

  @override
  bool operator ==(other) =>
      other is CisScanConfigurationsSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information on the permissions an account has within Amazon
/// Inspector.
///
/// @nodoc
class Permission {
  /// The operations that can be performed with the given permissions.
  final Operation operation;

  /// The services that the permissions allow an account to perform the given
  /// operations for.
  final Service service;

  Permission({
    required this.operation,
    required this.service,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      operation: Operation.fromString((json['operation'] as String?) ?? ''),
      service: Service.fromString((json['service'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final service = this.service;
    return {
      'operation': operation.value,
      'service': service.value,
    };
  }
}

/// @nodoc
class Service {
  static const ec2 = Service._('EC2');
  static const ecr = Service._('ECR');
  static const lambda = Service._('LAMBDA');

  final String value;

  const Service._(this.value);

  static const values = [ec2, ecr, lambda];

  static Service fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Service._(value));

  @override
  bool operator ==(other) => other is Service && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Operation {
  static const enableScanning = Operation._('ENABLE_SCANNING');
  static const disableScanning = Operation._('DISABLE_SCANNING');
  static const enableRepository = Operation._('ENABLE_REPOSITORY');
  static const disableRepository = Operation._('DISABLE_REPOSITORY');

  final String value;

  const Operation._(this.value);

  static const values = [
    enableScanning,
    disableScanning,
    enableRepository,
    disableRepository
  ];

  static Operation fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Operation._(value));

  @override
  bool operator ==(other) => other is Operation && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SbomReportFormat {
  static const cyclonedx_1_4 = SbomReportFormat._('CYCLONEDX_1_4');
  static const spdx_2_3 = SbomReportFormat._('SPDX_2_3');

  final String value;

  const SbomReportFormat._(this.value);

  static const values = [cyclonedx_1_4, spdx_2_3];

  static SbomReportFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SbomReportFormat._(value));

  @override
  bool operator ==(other) => other is SbomReportFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ExternalReportStatus {
  static const succeeded = ExternalReportStatus._('SUCCEEDED');
  static const inProgress = ExternalReportStatus._('IN_PROGRESS');
  static const cancelled = ExternalReportStatus._('CANCELLED');
  static const failed = ExternalReportStatus._('FAILED');

  final String value;

  const ExternalReportStatus._(this.value);

  static const values = [succeeded, inProgress, cancelled, failed];

  static ExternalReportStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExternalReportStatus._(value));

  @override
  bool operator ==(other) =>
      other is ExternalReportStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReportingErrorCode {
  static const internalError = ReportingErrorCode._('INTERNAL_ERROR');
  static const invalidPermissions = ReportingErrorCode._('INVALID_PERMISSIONS');
  static const noFindingsFound = ReportingErrorCode._('NO_FINDINGS_FOUND');
  static const bucketNotFound = ReportingErrorCode._('BUCKET_NOT_FOUND');
  static const incompatibleBucketRegion =
      ReportingErrorCode._('INCOMPATIBLE_BUCKET_REGION');
  static const malformedKmsKey = ReportingErrorCode._('MALFORMED_KMS_KEY');

  final String value;

  const ReportingErrorCode._(this.value);

  static const values = [
    internalError,
    invalidPermissions,
    noFindingsFound,
    bucketNotFound,
    incompatibleBucketRegion,
    malformedKmsKey
  ];

  static ReportingErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReportingErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is ReportingErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details of the Amazon S3 bucket and KMS key used to export
/// findings.
///
/// @nodoc
class Destination {
  /// The name of the Amazon S3 bucket to export findings to.
  final String bucketName;

  /// The ARN of the KMS key used to encrypt data when exporting findings.
  final String kmsKeyArn;

  /// The prefix that the findings will be written under.
  final String? keyPrefix;

  Destination({
    required this.bucketName,
    required this.kmsKeyArn,
    this.keyPrefix,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      bucketName: (json['bucketName'] as String?) ?? '',
      kmsKeyArn: (json['kmsKeyArn'] as String?) ?? '',
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final kmsKeyArn = this.kmsKeyArn;
    final keyPrefix = this.keyPrefix;
    return {
      'bucketName': bucketName,
      'kmsKeyArn': kmsKeyArn,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// The resource filter criteria for a Software bill of materials (SBOM) report.
///
/// @nodoc
class ResourceFilterCriteria {
  /// The account IDs used as resource filter criteria.
  final List<ResourceStringFilter>? accountId;

  /// The EC2 instance tags used as resource filter criteria.
  final List<ResourceMapFilter>? ec2InstanceTags;

  /// The ECR image tags used as resource filter criteria.
  final List<ResourceStringFilter>? ecrImageTags;

  /// The ECR repository names used as resource filter criteria.
  final List<ResourceStringFilter>? ecrRepositoryName;

  /// The Amazon Web Services Lambda function name used as resource filter
  /// criteria.
  final List<ResourceStringFilter>? lambdaFunctionName;

  /// The Amazon Web Services Lambda function tags used as resource filter
  /// criteria.
  final List<ResourceMapFilter>? lambdaFunctionTags;

  /// The resource IDs used as resource filter criteria.
  final List<ResourceStringFilter>? resourceId;

  /// The resource types used as resource filter criteria.
  final List<ResourceStringFilter>? resourceType;

  ResourceFilterCriteria({
    this.accountId,
    this.ec2InstanceTags,
    this.ecrImageTags,
    this.ecrRepositoryName,
    this.lambdaFunctionName,
    this.lambdaFunctionTags,
    this.resourceId,
    this.resourceType,
  });

  factory ResourceFilterCriteria.fromJson(Map<String, dynamic> json) {
    return ResourceFilterCriteria(
      accountId: (json['accountId'] as List?)
          ?.nonNulls
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceTags: (json['ec2InstanceTags'] as List?)
          ?.nonNulls
          .map((e) => ResourceMapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageTags: (json['ecrImageTags'] as List?)
          ?.nonNulls
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrRepositoryName: (json['ecrRepositoryName'] as List?)
          ?.nonNulls
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaFunctionName: (json['lambdaFunctionName'] as List?)
          ?.nonNulls
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaFunctionTags: (json['lambdaFunctionTags'] as List?)
          ?.nonNulls
          .map((e) => ResourceMapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceId: (json['resourceId'] as List?)
          ?.nonNulls
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['resourceType'] as List?)
          ?.nonNulls
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final ec2InstanceTags = this.ec2InstanceTags;
    final ecrImageTags = this.ecrImageTags;
    final ecrRepositoryName = this.ecrRepositoryName;
    final lambdaFunctionName = this.lambdaFunctionName;
    final lambdaFunctionTags = this.lambdaFunctionTags;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      if (accountId != null) 'accountId': accountId,
      if (ec2InstanceTags != null) 'ec2InstanceTags': ec2InstanceTags,
      if (ecrImageTags != null) 'ecrImageTags': ecrImageTags,
      if (ecrRepositoryName != null) 'ecrRepositoryName': ecrRepositoryName,
      if (lambdaFunctionName != null) 'lambdaFunctionName': lambdaFunctionName,
      if (lambdaFunctionTags != null) 'lambdaFunctionTags': lambdaFunctionTags,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceType != null) 'resourceType': resourceType,
    };
  }
}

/// A resource map filter for a software bill of material report.
///
/// @nodoc
class ResourceMapFilter {
  /// The filter's comparison.
  final ResourceMapComparison comparison;

  /// The filter's key.
  final String key;

  /// The filter's value.
  final String? value;

  ResourceMapFilter({
    required this.comparison,
    required this.key,
    this.value,
  });

  factory ResourceMapFilter.fromJson(Map<String, dynamic> json) {
    return ResourceMapFilter(
      comparison: ResourceMapComparison.fromString(
          (json['comparison'] as String?) ?? ''),
      key: (json['key'] as String?) ?? '',
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final key = this.key;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class ResourceMapComparison {
  static const equals = ResourceMapComparison._('EQUALS');

  final String value;

  const ResourceMapComparison._(this.value);

  static const values = [equals];

  static ResourceMapComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceMapComparison._(value));

  @override
  bool operator ==(other) =>
      other is ResourceMapComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A resource string filter for a software bill of materials report.
///
/// @nodoc
class ResourceStringFilter {
  /// The filter's comparison.
  final ResourceStringComparison comparison;

  /// The filter's value.
  final String value;

  ResourceStringFilter({
    required this.comparison,
    required this.value,
  });

  factory ResourceStringFilter.fromJson(Map<String, dynamic> json) {
    return ResourceStringFilter(
      comparison: ResourceStringComparison.fromString(
          (json['comparison'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'value': value,
    };
  }
}

/// @nodoc
class ResourceStringComparison {
  static const equals = ResourceStringComparison._('EQUALS');
  static const notEquals = ResourceStringComparison._('NOT_EQUALS');

  final String value;

  const ResourceStringComparison._(this.value);

  static const values = [equals, notEquals];

  static ResourceStringComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceStringComparison._(value));

  @override
  bool operator ==(other) =>
      other is ResourceStringComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details of the Amazon Inspector delegated administrator for your
/// organization.
///
/// @nodoc
class DelegatedAdmin {
  /// The Amazon Web Services account ID of the Amazon Inspector delegated
  /// administrator for your organization.
  final String? accountId;

  /// The status of the Amazon Inspector delegated administrator.
  final RelationshipStatus? relationshipStatus;

  DelegatedAdmin({
    this.accountId,
    this.relationshipStatus,
  });

  factory DelegatedAdmin.fromJson(Map<String, dynamic> json) {
    return DelegatedAdmin(
      accountId: json['accountId'] as String?,
      relationshipStatus: (json['relationshipStatus'] as String?)
          ?.let(RelationshipStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final relationshipStatus = this.relationshipStatus;
    return {
      if (accountId != null) 'accountId': accountId,
      if (relationshipStatus != null)
        'relationshipStatus': relationshipStatus.value,
    };
  }
}

/// Details about the state of the ECR scans for your environment.
///
/// @nodoc
class EcrConfigurationState {
  /// An object that contains details about the state of the ECR re-scan settings.
  final EcrRescanDurationState? rescanDurationState;

  EcrConfigurationState({
    this.rescanDurationState,
  });

  factory EcrConfigurationState.fromJson(Map<String, dynamic> json) {
    return EcrConfigurationState(
      rescanDurationState: json['rescanDurationState'] != null
          ? EcrRescanDurationState.fromJson(
              json['rescanDurationState'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rescanDurationState = this.rescanDurationState;
    return {
      if (rescanDurationState != null)
        'rescanDurationState': rescanDurationState,
    };
  }
}

/// Details about the state of the EC2 scan configuration for your environment.
///
/// @nodoc
class Ec2ConfigurationState {
  /// An object that contains details about the state of the Amazon EC2 scan mode.
  final Ec2ScanModeState? scanModeState;

  /// An object that contains details about the state of the Amazon Inspector VM
  /// scanner.
  final VMScannerState? vmScannerState;

  Ec2ConfigurationState({
    this.scanModeState,
    this.vmScannerState,
  });

  factory Ec2ConfigurationState.fromJson(Map<String, dynamic> json) {
    return Ec2ConfigurationState(
      scanModeState: json['scanModeState'] != null
          ? Ec2ScanModeState.fromJson(
              json['scanModeState'] as Map<String, dynamic>)
          : null,
      vmScannerState: json['vmScannerState'] != null
          ? VMScannerState.fromJson(
              json['vmScannerState'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scanModeState = this.scanModeState;
    final vmScannerState = this.vmScannerState;
    return {
      if (scanModeState != null) 'scanModeState': scanModeState,
      if (vmScannerState != null) 'vmScannerState': vmScannerState,
    };
  }
}

/// The state of your Amazon EC2 scan mode configuration.
///
/// @nodoc
class Ec2ScanModeState {
  /// The scan method that is applied to the instance.
  final Ec2ScanMode? scanMode;

  /// The status of the Amazon EC2 scan mode setting.
  final Ec2ScanModeStatus? scanModeStatus;

  Ec2ScanModeState({
    this.scanMode,
    this.scanModeStatus,
  });

  factory Ec2ScanModeState.fromJson(Map<String, dynamic> json) {
    return Ec2ScanModeState(
      scanMode: (json['scanMode'] as String?)?.let(Ec2ScanMode.fromString),
      scanModeStatus: (json['scanModeStatus'] as String?)
          ?.let(Ec2ScanModeStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final scanMode = this.scanMode;
    final scanModeStatus = this.scanModeStatus;
    return {
      if (scanMode != null) 'scanMode': scanMode.value,
      if (scanModeStatus != null) 'scanModeStatus': scanModeStatus.value,
    };
  }
}

/// The state of the Amazon Inspector VM scanner.
///
/// @nodoc
class VMScannerState {
  /// Whether the VM scanner is activated.
  final bool? activated;

  /// The date and time the VM scanner was activated.
  final DateTime? activatedAt;

  /// The status of the VM scanner.
  final VMScannerStatus? status;

  VMScannerState({
    this.activated,
    this.activatedAt,
    this.status,
  });

  factory VMScannerState.fromJson(Map<String, dynamic> json) {
    return VMScannerState(
      activated: json['activated'] as bool?,
      activatedAt: timeStampFromJson(json['activatedAt']),
      status: (json['status'] as String?)?.let(VMScannerStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final activated = this.activated;
    final activatedAt = this.activatedAt;
    final status = this.status;
    return {
      if (activated != null) 'activated': activated,
      if (activatedAt != null) 'activatedAt': unixTimestampToJson(activatedAt),
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class VMScannerStatus {
  static const success = VMScannerStatus._('SUCCESS');
  static const pending = VMScannerStatus._('PENDING');
  static const failed = VMScannerStatus._('FAILED');

  final String value;

  const VMScannerStatus._(this.value);

  static const values = [success, pending, failed];

  static VMScannerStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VMScannerStatus._(value));

  @override
  bool operator ==(other) => other is VMScannerStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Ec2ScanModeStatus {
  static const success = Ec2ScanModeStatus._('SUCCESS');
  static const pending = Ec2ScanModeStatus._('PENDING');

  final String value;

  const Ec2ScanModeStatus._(this.value);

  static const values = [success, pending];

  static Ec2ScanModeStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => Ec2ScanModeStatus._(value));

  @override
  bool operator ==(other) => other is Ec2ScanModeStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the state of your ECR re-scan duration settings. The ECR
/// re-scan duration defines how long an ECR image will be actively scanned by
/// Amazon Inspector. When the number of days since an image was last pushed
/// exceeds the duration configured for image pull date, and the duration
/// configured for image pull date, the monitoring state of that image becomes
/// <code>inactive</code> and all associated findings are scheduled for closure.
///
/// @nodoc
class EcrRescanDurationState {
  /// The rescan duration configured for image pull date.
  final EcrPullDateRescanDuration? pullDateRescanDuration;

  /// The pull date for the re-scan mode.
  final EcrPullDateRescanMode? pullDateRescanMode;

  /// The rescan duration configured for image push date.
  final EcrRescanDuration? rescanDuration;

  /// The status of changes to the ECR automated re-scan duration.
  final EcrRescanDurationStatus? status;

  /// A timestamp representing when the last time the ECR scan duration setting
  /// was changed.
  final DateTime? updatedAt;

  EcrRescanDurationState({
    this.pullDateRescanDuration,
    this.pullDateRescanMode,
    this.rescanDuration,
    this.status,
    this.updatedAt,
  });

  factory EcrRescanDurationState.fromJson(Map<String, dynamic> json) {
    return EcrRescanDurationState(
      pullDateRescanDuration: (json['pullDateRescanDuration'] as String?)
          ?.let(EcrPullDateRescanDuration.fromString),
      pullDateRescanMode: (json['pullDateRescanMode'] as String?)
          ?.let(EcrPullDateRescanMode.fromString),
      rescanDuration: (json['rescanDuration'] as String?)
          ?.let(EcrRescanDuration.fromString),
      status:
          (json['status'] as String?)?.let(EcrRescanDurationStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final pullDateRescanDuration = this.pullDateRescanDuration;
    final pullDateRescanMode = this.pullDateRescanMode;
    final rescanDuration = this.rescanDuration;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (pullDateRescanDuration != null)
        'pullDateRescanDuration': pullDateRescanDuration.value,
      if (pullDateRescanMode != null)
        'pullDateRescanMode': pullDateRescanMode.value,
      if (rescanDuration != null) 'rescanDuration': rescanDuration.value,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class EcrRescanDurationStatus {
  static const success = EcrRescanDurationStatus._('SUCCESS');
  static const pending = EcrRescanDurationStatus._('PENDING');
  static const failed = EcrRescanDurationStatus._('FAILED');

  final String value;

  const EcrRescanDurationStatus._(this.value);

  static const values = [success, pending, failed];

  static EcrRescanDurationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EcrRescanDurationStatus._(value));

  @override
  bool operator ==(other) =>
      other is EcrRescanDurationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConfigurationLevel {
  static const organization = ConfigurationLevel._('ORGANIZATION');
  static const account = ConfigurationLevel._('ACCOUNT');

  final String value;

  const ConfigurationLevel._(this.value);

  static const values = [organization, account];

  static ConfigurationLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationLevel._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the cluster.
///
/// @nodoc
class ClusterInformation {
  /// The cluster ARN.
  final String clusterArn;

  /// Details about the cluster.
  final List<ClusterDetails>? clusterDetails;

  ClusterInformation({
    required this.clusterArn,
    this.clusterDetails,
  });

  factory ClusterInformation.fromJson(Map<String, dynamic> json) {
    return ClusterInformation(
      clusterArn: (json['clusterArn'] as String?) ?? '',
      clusterDetails: (json['clusterDetails'] as List?)
          ?.nonNulls
          .map((e) => ClusterDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final clusterDetails = this.clusterDetails;
    return {
      'clusterArn': clusterArn,
      if (clusterDetails != null) 'clusterDetails': clusterDetails,
    };
  }
}

/// Details about the task or pod in the cluster.
///
/// @nodoc
class ClusterDetails {
  final ClusterMetadata clusterMetadata;

  /// The last timestamp when Amazon Inspector recorded the image in use in the
  /// task or pod in the cluster.
  final DateTime lastInUse;

  /// The number of tasks or pods where an image was running on the cluster.
  final int? runningUnitCount;

  /// The number of tasks or pods where an image was stopped on the cluster in the
  /// last 24 hours.
  final int? stoppedUnitCount;

  ClusterDetails({
    required this.clusterMetadata,
    required this.lastInUse,
    this.runningUnitCount,
    this.stoppedUnitCount,
  });

  factory ClusterDetails.fromJson(Map<String, dynamic> json) {
    return ClusterDetails(
      clusterMetadata: ClusterMetadata.fromJson(
          (json['clusterMetadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      lastInUse: nonNullableTimeStampFromJson(json['lastInUse'] ?? 0),
      runningUnitCount: json['runningUnitCount'] as int?,
      stoppedUnitCount: json['stoppedUnitCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterMetadata = this.clusterMetadata;
    final lastInUse = this.lastInUse;
    final runningUnitCount = this.runningUnitCount;
    final stoppedUnitCount = this.stoppedUnitCount;
    return {
      'clusterMetadata': clusterMetadata,
      'lastInUse': unixTimestampToJson(lastInUse),
      if (runningUnitCount != null) 'runningUnitCount': runningUnitCount,
      if (stoppedUnitCount != null) 'stoppedUnitCount': stoppedUnitCount,
    };
  }
}

/// The metadata for a cluster.
///
/// @nodoc
class ClusterMetadata {
  /// The details for an Amazon ECS cluster in the cluster metadata.
  final AwsEcsMetadataDetails? awsEcsMetadataDetails;

  /// The details for an Amazon EKS cluster in the cluster metadata.
  final AwsEksMetadataDetails? awsEksMetadataDetails;

  ClusterMetadata({
    this.awsEcsMetadataDetails,
    this.awsEksMetadataDetails,
  });

  factory ClusterMetadata.fromJson(Map<String, dynamic> json) {
    return ClusterMetadata(
      awsEcsMetadataDetails: json['awsEcsMetadataDetails'] != null
          ? AwsEcsMetadataDetails.fromJson(
              json['awsEcsMetadataDetails'] as Map<String, dynamic>)
          : null,
      awsEksMetadataDetails: json['awsEksMetadataDetails'] != null
          ? AwsEksMetadataDetails.fromJson(
              json['awsEksMetadataDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsEcsMetadataDetails = this.awsEcsMetadataDetails;
    final awsEksMetadataDetails = this.awsEksMetadataDetails;
    return {
      if (awsEcsMetadataDetails != null)
        'awsEcsMetadataDetails': awsEcsMetadataDetails,
      if (awsEksMetadataDetails != null)
        'awsEksMetadataDetails': awsEksMetadataDetails,
    };
  }
}

/// Metadata about tasks where an image was in use.
///
/// @nodoc
class AwsEcsMetadataDetails {
  /// The details group information for a task in a cluster.
  final String detailsGroup;

  /// The task definition ARN.
  final String taskDefinitionArn;

  AwsEcsMetadataDetails({
    required this.detailsGroup,
    required this.taskDefinitionArn,
  });

  factory AwsEcsMetadataDetails.fromJson(Map<String, dynamic> json) {
    return AwsEcsMetadataDetails(
      detailsGroup: (json['detailsGroup'] as String?) ?? '',
      taskDefinitionArn: (json['taskDefinitionArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final detailsGroup = this.detailsGroup;
    final taskDefinitionArn = this.taskDefinitionArn;
    return {
      'detailsGroup': detailsGroup,
      'taskDefinitionArn': taskDefinitionArn,
    };
  }
}

/// The metadata for an Amazon EKS pod where an Amazon ECR image is in use.
///
/// @nodoc
class AwsEksMetadataDetails {
  /// The namespace for an Amazon EKS cluster.
  final String? namespace;

  /// The list of workloads.
  final List<AwsEksWorkloadInfo>? workloadInfoList;

  AwsEksMetadataDetails({
    this.namespace,
    this.workloadInfoList,
  });

  factory AwsEksMetadataDetails.fromJson(Map<String, dynamic> json) {
    return AwsEksMetadataDetails(
      namespace: json['namespace'] as String?,
      workloadInfoList: (json['workloadInfoList'] as List?)
          ?.nonNulls
          .map((e) => AwsEksWorkloadInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final workloadInfoList = this.workloadInfoList;
    return {
      if (namespace != null) 'namespace': namespace,
      if (workloadInfoList != null) 'workloadInfoList': workloadInfoList,
    };
  }
}

/// Information about the workload.
///
/// @nodoc
class AwsEksWorkloadInfo {
  /// The name of the workload.
  final String name;

  /// The workload type.
  final String type;

  AwsEksWorkloadInfo({
    required this.name,
    required this.type,
  });

  factory AwsEksWorkloadInfo.fromJson(Map<String, dynamic> json) {
    return AwsEksWorkloadInfo(
      name: (json['name'] as String?) ?? '',
      type: (json['type'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type,
    };
  }
}

/// The filter criteria to be used.
///
/// @nodoc
class ClusterForImageFilterCriteria {
  /// The resource Id to be used in the filter criteria.
  final String resourceId;

  ClusterForImageFilterCriteria({
    required this.resourceId,
  });

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    return {
      'resourceId': resourceId,
    };
  }
}

/// The CIS scan result details.
///
/// @nodoc
class CisScanResultDetails {
  /// The CIS scan result details' scan ARN.
  final String scanArn;

  /// The CIS scan result details' account ID.
  final String? accountId;

  /// The account ID that's associated with the CIS scan result details.
  final String? checkDescription;

  /// The CIS scan result details' check ID.
  final String? checkId;

  /// The CIS scan result details' finding ARN.
  final String? findingArn;

  /// The CIS scan result details' level.
  final CisSecurityLevel? level;

  /// The CIS scan result details' platform.
  final String? platform;

  /// The CIS scan result details' remediation.
  final String? remediation;

  /// The CIS scan result details' status.
  final CisFindingStatus? status;

  /// The CIS scan result details' status reason.
  final String? statusReason;

  /// The CIS scan result details' target resource ID.
  final String? targetResourceId;

  /// The CIS scan result details' title.
  final String? title;

  CisScanResultDetails({
    required this.scanArn,
    this.accountId,
    this.checkDescription,
    this.checkId,
    this.findingArn,
    this.level,
    this.platform,
    this.remediation,
    this.status,
    this.statusReason,
    this.targetResourceId,
    this.title,
  });

  factory CisScanResultDetails.fromJson(Map<String, dynamic> json) {
    return CisScanResultDetails(
      scanArn: (json['scanArn'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      checkDescription: json['checkDescription'] as String?,
      checkId: json['checkId'] as String?,
      findingArn: json['findingArn'] as String?,
      level: (json['level'] as String?)?.let(CisSecurityLevel.fromString),
      platform: json['platform'] as String?,
      remediation: json['remediation'] as String?,
      status: (json['status'] as String?)?.let(CisFindingStatus.fromString),
      statusReason: json['statusReason'] as String?,
      targetResourceId: json['targetResourceId'] as String?,
      title: json['title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scanArn = this.scanArn;
    final accountId = this.accountId;
    final checkDescription = this.checkDescription;
    final checkId = this.checkId;
    final findingArn = this.findingArn;
    final level = this.level;
    final platform = this.platform;
    final remediation = this.remediation;
    final status = this.status;
    final statusReason = this.statusReason;
    final targetResourceId = this.targetResourceId;
    final title = this.title;
    return {
      'scanArn': scanArn,
      if (accountId != null) 'accountId': accountId,
      if (checkDescription != null) 'checkDescription': checkDescription,
      if (checkId != null) 'checkId': checkId,
      if (findingArn != null) 'findingArn': findingArn,
      if (level != null) 'level': level.value,
      if (platform != null) 'platform': platform,
      if (remediation != null) 'remediation': remediation,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
      if (targetResourceId != null) 'targetResourceId': targetResourceId,
      if (title != null) 'title': title,
    };
  }
}

/// @nodoc
class CisFindingStatus {
  static const passed = CisFindingStatus._('PASSED');
  static const failed = CisFindingStatus._('FAILED');
  static const skipped = CisFindingStatus._('SKIPPED');

  final String value;

  const CisFindingStatus._(this.value);

  static const values = [passed, failed, skipped];

  static CisFindingStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisFindingStatus._(value));

  @override
  bool operator ==(other) => other is CisFindingStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS scan result details filter criteria.
///
/// @nodoc
class CisScanResultDetailsFilterCriteria {
  /// The criteria's check ID filters.
  final List<CisStringFilter>? checkIdFilters;

  /// The criteria's finding ARN filters.
  final List<CisStringFilter>? findingArnFilters;

  /// The criteria's finding status filters.
  final List<CisFindingStatusFilter>? findingStatusFilters;

  /// The criteria's security level filters. . Security level refers to the
  /// Benchmark levels that CIS assigns to a profile.
  final List<CisSecurityLevelFilter>? securityLevelFilters;

  /// The criteria's title filters.
  final List<CisStringFilter>? titleFilters;

  CisScanResultDetailsFilterCriteria({
    this.checkIdFilters,
    this.findingArnFilters,
    this.findingStatusFilters,
    this.securityLevelFilters,
    this.titleFilters,
  });

  Map<String, dynamic> toJson() {
    final checkIdFilters = this.checkIdFilters;
    final findingArnFilters = this.findingArnFilters;
    final findingStatusFilters = this.findingStatusFilters;
    final securityLevelFilters = this.securityLevelFilters;
    final titleFilters = this.titleFilters;
    return {
      if (checkIdFilters != null) 'checkIdFilters': checkIdFilters,
      if (findingArnFilters != null) 'findingArnFilters': findingArnFilters,
      if (findingStatusFilters != null)
        'findingStatusFilters': findingStatusFilters,
      if (securityLevelFilters != null)
        'securityLevelFilters': securityLevelFilters,
      if (titleFilters != null) 'titleFilters': titleFilters,
    };
  }
}

/// @nodoc
class CisScanResultDetailsSortBy {
  static const checkId = CisScanResultDetailsSortBy._('CHECK_ID');
  static const status = CisScanResultDetailsSortBy._('STATUS');

  final String value;

  const CisScanResultDetailsSortBy._(this.value);

  static const values = [checkId, status];

  static CisScanResultDetailsSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisScanResultDetailsSortBy._(value));

  @override
  bool operator ==(other) =>
      other is CisScanResultDetailsSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The CIS finding status filter.
///
/// @nodoc
class CisFindingStatusFilter {
  /// The comparison value of the CIS finding status filter.
  final CisFindingStatusComparison comparison;

  /// The value of the CIS finding status filter.
  final CisFindingStatus value;

  CisFindingStatusFilter({
    required this.comparison,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.value,
      'value': value.value,
    };
  }
}

/// @nodoc
class CisFindingStatusComparison {
  static const equals = CisFindingStatusComparison._('EQUALS');

  final String value;

  const CisFindingStatusComparison._(this.value);

  static const values = [equals];

  static CisFindingStatusComparison fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisFindingStatusComparison._(value));

  @override
  bool operator ==(other) =>
      other is CisFindingStatusComparison && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CisReportStatus {
  static const succeeded = CisReportStatus._('SUCCEEDED');
  static const failed = CisReportStatus._('FAILED');
  static const inProgress = CisReportStatus._('IN_PROGRESS');

  final String value;

  const CisReportStatus._(this.value);

  static const values = [succeeded, failed, inProgress];

  static CisReportStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisReportStatus._(value));

  @override
  bool operator ==(other) => other is CisReportStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CisReportFormat {
  static const pdf = CisReportFormat._('PDF');
  static const csv = CisReportFormat._('CSV');

  final String value;

  const CisReportFormat._(this.value);

  static const values = [pdf, csv];

  static CisReportFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CisReportFormat._(value));

  @override
  bool operator ==(other) => other is CisReportFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object with details on why an account failed to enable Amazon Inspector.
///
/// @nodoc
class FailedAccount {
  /// The Amazon Web Services account ID.
  final String accountId;

  /// The error code explaining why the account failed to enable Amazon Inspector.
  final ErrorCode errorCode;

  /// The error message received when the account failed to enable Amazon
  /// Inspector.
  final String errorMessage;

  /// An object detailing which resources Amazon Inspector is enabled to scan for
  /// the account.
  final ResourceStatus? resourceStatus;

  /// The status of Amazon Inspector for the account.
  final Status? status;

  FailedAccount({
    required this.accountId,
    required this.errorCode,
    required this.errorMessage,
    this.resourceStatus,
    this.status,
  });

  factory FailedAccount.fromJson(Map<String, dynamic> json) {
    return FailedAccount(
      accountId: (json['accountId'] as String?) ?? '',
      errorCode: ErrorCode.fromString((json['errorCode'] as String?) ?? ''),
      errorMessage: (json['errorMessage'] as String?) ?? '',
      resourceStatus: json['resourceStatus'] != null
          ? ResourceStatus.fromJson(
              json['resourceStatus'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(Status.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final resourceStatus = this.resourceStatus;
    final status = this.status;
    return {
      'accountId': accountId,
      'errorCode': errorCode.value,
      'errorMessage': errorMessage,
      if (resourceStatus != null) 'resourceStatus': resourceStatus,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class Status {
  static const enabling = Status._('ENABLING');
  static const enabled = Status._('ENABLED');
  static const disabling = Status._('DISABLING');
  static const disabled = Status._('DISABLED');
  static const suspending = Status._('SUSPENDING');
  static const suspended = Status._('SUSPENDED');

  final String value;

  const Status._(this.value);

  static const values = [
    enabling,
    enabled,
    disabling,
    disabled,
    suspending,
    suspended
  ];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details the status of Amazon Inspector for each resource type Amazon
/// Inspector scans.
///
/// @nodoc
class ResourceStatus {
  /// The status of Amazon Inspector scanning for Amazon EC2 resources.
  final Status ec2;

  /// The status of Amazon Inspector scanning for Amazon ECR resources.
  final Status ecr;

  /// The status of Amazon Inspector scanning for code repositories.
  final Status? codeRepository;

  /// The status of Amazon Inspector scanning for Amazon Web Services Lambda
  /// function.
  final Status? lambda;

  /// The status of Amazon Inspector scanning for custom application code for
  /// Amazon Web Services Lambda functions.
  final Status? lambdaCode;

  ResourceStatus({
    required this.ec2,
    required this.ecr,
    this.codeRepository,
    this.lambda,
    this.lambdaCode,
  });

  factory ResourceStatus.fromJson(Map<String, dynamic> json) {
    return ResourceStatus(
      ec2: Status.fromString((json['ec2'] as String?) ?? ''),
      ecr: Status.fromString((json['ecr'] as String?) ?? ''),
      codeRepository:
          (json['codeRepository'] as String?)?.let(Status.fromString),
      lambda: (json['lambda'] as String?)?.let(Status.fromString),
      lambdaCode: (json['lambdaCode'] as String?)?.let(Status.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final ec2 = this.ec2;
    final ecr = this.ecr;
    final codeRepository = this.codeRepository;
    final lambda = this.lambda;
    final lambdaCode = this.lambdaCode;
    return {
      'ec2': ec2.value,
      'ecr': ecr.value,
      if (codeRepository != null) 'codeRepository': codeRepository.value,
      if (lambda != null) 'lambda': lambda.value,
      if (lambdaCode != null) 'lambdaCode': lambdaCode.value,
    };
  }
}

/// @nodoc
class ErrorCode {
  static const alreadyEnabled = ErrorCode._('ALREADY_ENABLED');
  static const enableInProgress = ErrorCode._('ENABLE_IN_PROGRESS');
  static const disableInProgress = ErrorCode._('DISABLE_IN_PROGRESS');
  static const suspendInProgress = ErrorCode._('SUSPEND_IN_PROGRESS');
  static const resourceNotFound = ErrorCode._('RESOURCE_NOT_FOUND');
  static const accessDenied = ErrorCode._('ACCESS_DENIED');
  static const internalError = ErrorCode._('INTERNAL_ERROR');
  static const ssmUnavailable = ErrorCode._('SSM_UNAVAILABLE');
  static const ssmThrottled = ErrorCode._('SSM_THROTTLED');
  static const eventbridgeUnavailable = ErrorCode._('EVENTBRIDGE_UNAVAILABLE');
  static const eventbridgeThrottled = ErrorCode._('EVENTBRIDGE_THROTTLED');
  static const resourceScanNotDisabled =
      ErrorCode._('RESOURCE_SCAN_NOT_DISABLED');
  static const disassociateAllMembers = ErrorCode._('DISASSOCIATE_ALL_MEMBERS');
  static const accountIsIsolated = ErrorCode._('ACCOUNT_IS_ISOLATED');
  static const ec2SsmResourceDataSyncLimitExceeded =
      ErrorCode._('EC2_SSM_RESOURCE_DATA_SYNC_LIMIT_EXCEEDED');
  static const ec2SsmAssociationVersionLimitExceeded =
      ErrorCode._('EC2_SSM_ASSOCIATION_VERSION_LIMIT_EXCEEDED');
  static const blockedByOrganizationPolicy =
      ErrorCode._('BLOCKED_BY_ORGANIZATION_POLICY');

  final String value;

  const ErrorCode._(this.value);

  static const values = [
    alreadyEnabled,
    enableInProgress,
    disableInProgress,
    suspendInProgress,
    resourceNotFound,
    accessDenied,
    internalError,
    ssmUnavailable,
    ssmThrottled,
    eventbridgeUnavailable,
    eventbridgeThrottled,
    resourceScanNotDisabled,
    disassociateAllMembers,
    accountIsIsolated,
    ec2SsmResourceDataSyncLimitExceeded,
    ec2SsmAssociationVersionLimitExceeded,
    blockedByOrganizationPolicy
  ];

  static ErrorCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ErrorCode._(value));

  @override
  bool operator ==(other) => other is ErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An Amazon Web Services account within your environment that Amazon Inspector
/// has been enabled for.
///
/// @nodoc
class Account {
  /// The ID of the Amazon Web Services account.
  final String accountId;

  /// Details of the status of Amazon Inspector scans by resource type.
  final ResourceStatus resourceStatus;

  /// The status of Amazon Inspector for the account.
  final Status status;

  Account({
    required this.accountId,
    required this.resourceStatus,
    required this.status,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountId: (json['accountId'] as String?) ?? '',
      resourceStatus: ResourceStatus.fromJson(
          (json['resourceStatus'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: Status.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final resourceStatus = this.resourceStatus;
    final status = this.status;
    return {
      'accountId': accountId,
      'resourceStatus': resourceStatus,
      'status': status.value,
    };
  }
}

/// @nodoc
class ResourceScanType {
  static const ec2 = ResourceScanType._('EC2');
  static const ecr = ResourceScanType._('ECR');
  static const lambda = ResourceScanType._('LAMBDA');
  static const lambdaCode = ResourceScanType._('LAMBDA_CODE');
  static const codeRepository = ResourceScanType._('CODE_REPOSITORY');

  final String value;

  const ResourceScanType._(this.value);

  static const values = [ec2, ecr, lambda, lambdaCode, codeRepository];

  static ResourceScanType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceScanType._(value));

  @override
  bool operator ==(other) => other is ResourceScanType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReportFormat {
  static const csv = ReportFormat._('CSV');
  static const json = ReportFormat._('JSON');

  final String value;

  const ReportFormat._(this.value);

  static const values = [csv, json];

  static ReportFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReportFormat._(value));

  @override
  bool operator ==(other) => other is ReportFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details required to create a code security integration with a
/// specific repository provider.
///
/// @nodoc
class CreateIntegrationDetail {
  /// Details specific to creating an integration with a self-managed GitLab
  /// instance.
  final CreateGitLabSelfManagedIntegrationDetail? gitlabSelfManaged;

  CreateIntegrationDetail({
    this.gitlabSelfManaged,
  });

  Map<String, dynamic> toJson() {
    final gitlabSelfManaged = this.gitlabSelfManaged;
    return {
      if (gitlabSelfManaged != null) 'gitlabSelfManaged': gitlabSelfManaged,
    };
  }
}

/// Contains details required to create an integration with a self-managed
/// GitLab instance.
///
/// @nodoc
class CreateGitLabSelfManagedIntegrationDetail {
  /// The personal access token used to authenticate with the self-managed GitLab
  /// instance.
  final String accessToken;

  /// The URL of the self-managed GitLab instance.
  final String instanceUrl;

  CreateGitLabSelfManagedIntegrationDetail({
    required this.accessToken,
    required this.instanceUrl,
  });

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final instanceUrl = this.instanceUrl;
    return {
      'accessToken': accessToken,
      'instanceUrl': instanceUrl,
    };
  }
}

/// Creates CIS targets.
///
/// @nodoc
class CreateCisTargets {
  /// The CIS target account ids.
  final List<String> accountIds;

  /// The CIS target resource tags.
  final Map<String, List<String>> targetResourceTags;

  CreateCisTargets({
    required this.accountIds,
    required this.targetResourceTags,
  });

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final targetResourceTags = this.targetResourceTags;
    return {
      'accountIds': accountIds,
      'targetResourceTags': targetResourceTags,
    };
  }
}

/// An object that contains details about a member account in your organization
/// that failed to activate Amazon Inspector deep inspection.
///
/// @nodoc
class FailedMemberAccountEc2DeepInspectionStatusState {
  /// The unique identifier for the Amazon Web Services account of the
  /// organization member that failed to activate Amazon Inspector deep
  /// inspection.
  final String accountId;

  /// The status of EC2 scanning in the account that failed to activate Amazon
  /// Inspector deep inspection.
  final Status? ec2ScanStatus;

  /// The error message explaining why the account failed to activate Amazon
  /// Inspector deep inspection.
  final String? errorMessage;

  FailedMemberAccountEc2DeepInspectionStatusState({
    required this.accountId,
    this.ec2ScanStatus,
    this.errorMessage,
  });

  factory FailedMemberAccountEc2DeepInspectionStatusState.fromJson(
      Map<String, dynamic> json) {
    return FailedMemberAccountEc2DeepInspectionStatusState(
      accountId: (json['accountId'] as String?) ?? '',
      ec2ScanStatus: (json['ec2ScanStatus'] as String?)?.let(Status.fromString),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final ec2ScanStatus = this.ec2ScanStatus;
    final errorMessage = this.errorMessage;
    return {
      'accountId': accountId,
      if (ec2ScanStatus != null) 'ec2ScanStatus': ec2ScanStatus.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// An object that contains details about the state of Amazon Inspector deep
/// inspection for a member account.
///
/// @nodoc
class MemberAccountEc2DeepInspectionStatusState {
  /// The unique identifier for the Amazon Web Services account of the
  /// organization member
  final String accountId;

  /// The error message explaining why the account failed to activate Amazon
  /// Inspector deep inspection.
  final String? errorMessage;

  /// The state of Amazon Inspector deep inspection in the member account.
  final Ec2DeepInspectionStatus? status;

  MemberAccountEc2DeepInspectionStatusState({
    required this.accountId,
    this.errorMessage,
    this.status,
  });

  factory MemberAccountEc2DeepInspectionStatusState.fromJson(
      Map<String, dynamic> json) {
    return MemberAccountEc2DeepInspectionStatusState(
      accountId: (json['accountId'] as String?) ?? '',
      errorMessage: json['errorMessage'] as String?,
      status:
          (json['status'] as String?)?.let(Ec2DeepInspectionStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final errorMessage = this.errorMessage;
    final status = this.status;
    return {
      'accountId': accountId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (status != null) 'status': status.value,
    };
  }
}

/// An object that contains details about the status of Amazon Inspector deep
/// inspection for a member account in your organization.
///
/// @nodoc
class MemberAccountEc2DeepInspectionStatus {
  /// The unique identifier for the Amazon Web Services account of the
  /// organization member.
  final String accountId;

  /// Whether Amazon Inspector deep inspection is active in the account. If
  /// <code>TRUE</code> Amazon Inspector deep inspection is active, if
  /// <code>FALSE</code> it is not active.
  final bool activateDeepInspection;

  MemberAccountEc2DeepInspectionStatus({
    required this.accountId,
    required this.activateDeepInspection,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final activateDeepInspection = this.activateDeepInspection;
    return {
      'accountId': accountId,
      'activateDeepInspection': activateDeepInspection,
    };
  }
}

/// Information about an error received while accessing free trail data for an
/// account.
///
/// @nodoc
class FreeTrialInfoError {
  /// The account associated with the Amazon Inspector free trial information.
  final String accountId;

  /// The error code.
  final FreeTrialInfoErrorCode code;

  /// The error message returned.
  final String message;

  FreeTrialInfoError({
    required this.accountId,
    required this.code,
    required this.message,
  });

  factory FreeTrialInfoError.fromJson(Map<String, dynamic> json) {
    return FreeTrialInfoError(
      accountId: (json['accountId'] as String?) ?? '',
      code: FreeTrialInfoErrorCode.fromString((json['code'] as String?) ?? ''),
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final code = this.code;
    final message = this.message;
    return {
      'accountId': accountId,
      'code': code.value,
      'message': message,
    };
  }
}

/// @nodoc
class FreeTrialInfoErrorCode {
  static const accessDenied = FreeTrialInfoErrorCode._('ACCESS_DENIED');
  static const internalError = FreeTrialInfoErrorCode._('INTERNAL_ERROR');

  final String value;

  const FreeTrialInfoErrorCode._(this.value);

  static const values = [accessDenied, internalError];

  static FreeTrialInfoErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FreeTrialInfoErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is FreeTrialInfoErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the Amazon Inspector free trial for an account.
///
/// @nodoc
class FreeTrialAccountInfo {
  /// The account associated with the Amazon Inspector free trial information.
  final String accountId;

  /// Contains information about the Amazon Inspector free trial for an account.
  final List<FreeTrialInfo> freeTrialInfo;

  FreeTrialAccountInfo({
    required this.accountId,
    required this.freeTrialInfo,
  });

  factory FreeTrialAccountInfo.fromJson(Map<String, dynamic> json) {
    return FreeTrialAccountInfo(
      accountId: (json['accountId'] as String?) ?? '',
      freeTrialInfo: ((json['freeTrialInfo'] as List?) ?? const [])
          .nonNulls
          .map((e) => FreeTrialInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final freeTrialInfo = this.freeTrialInfo;
    return {
      'accountId': accountId,
      'freeTrialInfo': freeTrialInfo,
    };
  }
}

/// An object that contains information about the Amazon Inspector free trial
/// for an account.
///
/// @nodoc
class FreeTrialInfo {
  /// The date and time that the Amazon Inspector free trail ends for a given
  /// account.
  final DateTime end;

  /// The date and time that the Amazon Inspector free trail started for a given
  /// account.
  final DateTime start;

  /// The order to sort results by.
  final FreeTrialStatus status;

  /// The type of scan covered by the Amazon Inspector free trail.
  final FreeTrialType type;

  FreeTrialInfo({
    required this.end,
    required this.start,
    required this.status,
    required this.type,
  });

  factory FreeTrialInfo.fromJson(Map<String, dynamic> json) {
    return FreeTrialInfo(
      end: nonNullableTimeStampFromJson(json['end'] ?? 0),
      start: nonNullableTimeStampFromJson(json['start'] ?? 0),
      status: FreeTrialStatus.fromString((json['status'] as String?) ?? ''),
      type: FreeTrialType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    final status = this.status;
    final type = this.type;
    return {
      'end': unixTimestampToJson(end),
      'start': unixTimestampToJson(start),
      'status': status.value,
      'type': type.value,
    };
  }
}

/// @nodoc
class FreeTrialType {
  static const ec2 = FreeTrialType._('EC2');
  static const ecr = FreeTrialType._('ECR');
  static const lambda = FreeTrialType._('LAMBDA');
  static const lambdaCode = FreeTrialType._('LAMBDA_CODE');
  static const codeRepository = FreeTrialType._('CODE_REPOSITORY');

  final String value;

  const FreeTrialType._(this.value);

  static const values = [ec2, ecr, lambda, lambdaCode, codeRepository];

  static FreeTrialType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FreeTrialType._(value));

  @override
  bool operator ==(other) => other is FreeTrialType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FreeTrialStatus {
  static const active = FreeTrialStatus._('ACTIVE');
  static const inactive = FreeTrialStatus._('INACTIVE');

  final String value;

  const FreeTrialStatus._(this.value);

  static const values = [active, inactive];

  static FreeTrialStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FreeTrialStatus._(value));

  @override
  bool operator ==(other) => other is FreeTrialStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about an error encountered when trying to return vulnerability data
/// for a finding.
///
/// @nodoc
class FindingDetailsError {
  /// The error code.
  final FindingDetailsErrorCode errorCode;

  /// The error message.
  final String errorMessage;

  /// The finding ARN that returned an error.
  final String findingArn;

  FindingDetailsError({
    required this.errorCode,
    required this.errorMessage,
    required this.findingArn,
  });

  factory FindingDetailsError.fromJson(Map<String, dynamic> json) {
    return FindingDetailsError(
      errorCode: FindingDetailsErrorCode.fromString(
          (json['errorCode'] as String?) ?? ''),
      errorMessage: (json['errorMessage'] as String?) ?? '',
      findingArn: (json['findingArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final findingArn = this.findingArn;
    return {
      'errorCode': errorCode.value,
      'errorMessage': errorMessage,
      'findingArn': findingArn,
    };
  }
}

/// @nodoc
class FindingDetailsErrorCode {
  static const internalError = FindingDetailsErrorCode._('INTERNAL_ERROR');
  static const accessDenied = FindingDetailsErrorCode._('ACCESS_DENIED');
  static const findingDetailsNotFound =
      FindingDetailsErrorCode._('FINDING_DETAILS_NOT_FOUND');
  static const invalidInput = FindingDetailsErrorCode._('INVALID_INPUT');

  final String value;

  const FindingDetailsErrorCode._(this.value);

  static const values = [
    internalError,
    accessDenied,
    findingDetailsNotFound,
    invalidInput
  ];

  static FindingDetailsErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FindingDetailsErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is FindingDetailsErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details of the vulnerability identified in a finding.
///
/// @nodoc
class FindingDetail {
  /// The Cybersecurity and Infrastructure Security Agency (CISA) details for a
  /// specific vulnerability.
  final CisaData? cisaData;

  /// The Common Weakness Enumerations (CWEs) associated with the vulnerability.
  final List<String>? cwes;

  /// The Exploit Prediction Scoring System (EPSS) score of the vulnerability.
  final double? epssScore;

  /// Information on the evidence of the vulnerability.
  final List<Evidence>? evidences;

  /// Contains information on when this exploit was observed.
  final ExploitObserved? exploitObserved;

  /// The finding ARN that the vulnerability details are associated with.
  final String? findingArn;

  /// The reference URLs for the vulnerability data.
  final List<String>? referenceUrls;

  /// The risk score of the vulnerability.
  final int? riskScore;

  /// The known malware tools or kits that can exploit the vulnerability.
  final List<String>? tools;

  /// The MITRE adversary tactics, techniques, or procedures (TTPs) associated
  /// with the vulnerability.
  final List<String>? ttps;

  FindingDetail({
    this.cisaData,
    this.cwes,
    this.epssScore,
    this.evidences,
    this.exploitObserved,
    this.findingArn,
    this.referenceUrls,
    this.riskScore,
    this.tools,
    this.ttps,
  });

  factory FindingDetail.fromJson(Map<String, dynamic> json) {
    return FindingDetail(
      cisaData: json['cisaData'] != null
          ? CisaData.fromJson(json['cisaData'] as Map<String, dynamic>)
          : null,
      cwes: (json['cwes'] as List?)?.nonNulls.map((e) => e as String).toList(),
      epssScore: _s.parseJsonDouble(json['epssScore']),
      evidences: (json['evidences'] as List?)
          ?.nonNulls
          .map((e) => Evidence.fromJson(e as Map<String, dynamic>))
          .toList(),
      exploitObserved: json['exploitObserved'] != null
          ? ExploitObserved.fromJson(
              json['exploitObserved'] as Map<String, dynamic>)
          : null,
      findingArn: json['findingArn'] as String?,
      referenceUrls: (json['referenceUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      riskScore: json['riskScore'] as int?,
      tools:
          (json['tools'] as List?)?.nonNulls.map((e) => e as String).toList(),
      ttps: (json['ttps'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cisaData = this.cisaData;
    final cwes = this.cwes;
    final epssScore = this.epssScore;
    final evidences = this.evidences;
    final exploitObserved = this.exploitObserved;
    final findingArn = this.findingArn;
    final referenceUrls = this.referenceUrls;
    final riskScore = this.riskScore;
    final tools = this.tools;
    final ttps = this.ttps;
    return {
      if (cisaData != null) 'cisaData': cisaData,
      if (cwes != null) 'cwes': cwes,
      if (epssScore != null) 'epssScore': _s.encodeJsonDouble(epssScore),
      if (evidences != null) 'evidences': evidences,
      if (exploitObserved != null) 'exploitObserved': exploitObserved,
      if (findingArn != null) 'findingArn': findingArn,
      if (referenceUrls != null) 'referenceUrls': referenceUrls,
      if (riskScore != null) 'riskScore': riskScore,
      if (tools != null) 'tools': tools,
      if (ttps != null) 'ttps': ttps,
    };
  }
}

/// Details of the evidence for a vulnerability identified in a finding.
///
/// @nodoc
class Evidence {
  /// The evidence details.
  final String? evidenceDetail;

  /// The evidence rule.
  final String? evidenceRule;

  /// The evidence severity.
  final String? severity;

  Evidence({
    this.evidenceDetail,
    this.evidenceRule,
    this.severity,
  });

  factory Evidence.fromJson(Map<String, dynamic> json) {
    return Evidence(
      evidenceDetail: json['evidenceDetail'] as String?,
      evidenceRule: json['evidenceRule'] as String?,
      severity: json['severity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final evidenceDetail = this.evidenceDetail;
    final evidenceRule = this.evidenceRule;
    final severity = this.severity;
    return {
      if (evidenceDetail != null) 'evidenceDetail': evidenceDetail,
      if (evidenceRule != null) 'evidenceRule': evidenceRule,
      if (severity != null) 'severity': severity,
    };
  }
}

/// Contains information about any errors encountered while trying to retrieve a
/// code snippet.
///
/// @nodoc
class CodeSnippetError {
  /// The error code for the error that prevented a code snippet from being
  /// retrieved.
  final CodeSnippetErrorCode errorCode;

  /// The error message received when Amazon Inspector failed to retrieve a code
  /// snippet.
  final String errorMessage;

  /// The ARN of the finding that a code snippet couldn't be retrieved for.
  final String findingArn;

  CodeSnippetError({
    required this.errorCode,
    required this.errorMessage,
    required this.findingArn,
  });

  factory CodeSnippetError.fromJson(Map<String, dynamic> json) {
    return CodeSnippetError(
      errorCode:
          CodeSnippetErrorCode.fromString((json['errorCode'] as String?) ?? ''),
      errorMessage: (json['errorMessage'] as String?) ?? '',
      findingArn: (json['findingArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final findingArn = this.findingArn;
    return {
      'errorCode': errorCode.value,
      'errorMessage': errorMessage,
      'findingArn': findingArn,
    };
  }
}

/// @nodoc
class CodeSnippetErrorCode {
  static const internalError = CodeSnippetErrorCode._('INTERNAL_ERROR');
  static const accessDenied = CodeSnippetErrorCode._('ACCESS_DENIED');
  static const codeSnippetNotFound =
      CodeSnippetErrorCode._('CODE_SNIPPET_NOT_FOUND');
  static const invalidInput = CodeSnippetErrorCode._('INVALID_INPUT');

  final String value;

  const CodeSnippetErrorCode._(this.value);

  static const values = [
    internalError,
    accessDenied,
    codeSnippetNotFound,
    invalidInput
  ];

  static CodeSnippetErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CodeSnippetErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is CodeSnippetErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information on a code snippet retrieved by Amazon Inspector from a
/// code vulnerability finding.
///
/// @nodoc
class CodeSnippetResult {
  /// Contains information on the retrieved code snippet.
  final List<CodeLine>? codeSnippet;

  /// The line number of the last line of a code snippet.
  final int? endLine;

  /// The ARN of a finding that the code snippet is associated with.
  final String? findingArn;

  /// The line number of the first line of a code snippet.
  final int? startLine;

  /// Details of a suggested code fix.
  final List<SuggestedFix>? suggestedFixes;

  CodeSnippetResult({
    this.codeSnippet,
    this.endLine,
    this.findingArn,
    this.startLine,
    this.suggestedFixes,
  });

  factory CodeSnippetResult.fromJson(Map<String, dynamic> json) {
    return CodeSnippetResult(
      codeSnippet: (json['codeSnippet'] as List?)
          ?.nonNulls
          .map((e) => CodeLine.fromJson(e as Map<String, dynamic>))
          .toList(),
      endLine: json['endLine'] as int?,
      findingArn: json['findingArn'] as String?,
      startLine: json['startLine'] as int?,
      suggestedFixes: (json['suggestedFixes'] as List?)
          ?.nonNulls
          .map((e) => SuggestedFix.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final codeSnippet = this.codeSnippet;
    final endLine = this.endLine;
    final findingArn = this.findingArn;
    final startLine = this.startLine;
    final suggestedFixes = this.suggestedFixes;
    return {
      if (codeSnippet != null) 'codeSnippet': codeSnippet,
      if (endLine != null) 'endLine': endLine,
      if (findingArn != null) 'findingArn': findingArn,
      if (startLine != null) 'startLine': startLine,
      if (suggestedFixes != null) 'suggestedFixes': suggestedFixes,
    };
  }
}

/// A suggested fix for a vulnerability in your Lambda function code.
///
/// @nodoc
class SuggestedFix {
  /// The fix's code.
  final String? code;

  /// The fix's description.
  final String? description;

  SuggestedFix({
    this.code,
    this.description,
  });

  factory SuggestedFix.fromJson(Map<String, dynamic> json) {
    return SuggestedFix(
      code: json['code'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final description = this.description;
    return {
      if (code != null) 'code': code,
      if (description != null) 'description': description,
    };
  }
}

/// Contains information on the lines of code associated with a code snippet.
///
/// @nodoc
class CodeLine {
  /// The content of a line of code
  final String content;

  /// The line number that a section of code is located at.
  final int lineNumber;

  CodeLine({
    required this.content,
    required this.lineNumber,
  });

  factory CodeLine.fromJson(Map<String, dynamic> json) {
    return CodeLine(
      content: (json['content'] as String?) ?? '',
      lineNumber: (json['lineNumber'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final lineNumber = this.lineNumber;
    return {
      'content': content,
      'lineNumber': lineNumber,
    };
  }
}

/// An object with details the status of an Amazon Web Services account within
/// your Amazon Inspector environment.
///
/// @nodoc
class AccountState {
  /// The Amazon Web Services account ID.
  final String accountId;

  /// An object detailing which resources Amazon Inspector is enabled to scan for
  /// the account.
  final ResourceState resourceState;

  /// An object detailing the status of Amazon Inspector for the account.
  final State state;

  AccountState({
    required this.accountId,
    required this.resourceState,
    required this.state,
  });

  factory AccountState.fromJson(Map<String, dynamic> json) {
    return AccountState(
      accountId: (json['accountId'] as String?) ?? '',
      resourceState: ResourceState.fromJson(
          (json['resourceState'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      state: State.fromJson((json['state'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final resourceState = this.resourceState;
    final state = this.state;
    return {
      'accountId': accountId,
      'resourceState': resourceState,
      'state': state,
    };
  }
}

/// An object that described the state of Amazon Inspector scans for an account.
///
/// @nodoc
class State {
  /// The error code explaining why the account failed to enable Amazon Inspector.
  final ErrorCode errorCode;

  /// The error message received when the account failed to enable Amazon
  /// Inspector.
  final String errorMessage;

  /// The status of Amazon Inspector for the account.
  final Status status;

  State({
    required this.errorCode,
    required this.errorMessage,
    required this.status,
  });

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      errorCode: ErrorCode.fromString((json['errorCode'] as String?) ?? ''),
      errorMessage: (json['errorMessage'] as String?) ?? '',
      status: Status.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final status = this.status;
    return {
      'errorCode': errorCode.value,
      'errorMessage': errorMessage,
      'status': status.value,
    };
  }
}

/// Details the state of Amazon Inspector for each resource type Amazon
/// Inspector scans.
///
/// @nodoc
class ResourceState {
  /// An object detailing the state of Amazon Inspector scanning for Amazon EC2
  /// resources.
  final State ec2;

  /// An object detailing the state of Amazon Inspector scanning for Amazon ECR
  /// resources.
  final State ecr;
  final State? codeRepository;

  /// An object that described the state of Amazon Inspector scans for an account.
  final State? lambda;

  /// An object that described the state of Amazon Inspector scans for an account.
  final State? lambdaCode;

  ResourceState({
    required this.ec2,
    required this.ecr,
    this.codeRepository,
    this.lambda,
    this.lambdaCode,
  });

  factory ResourceState.fromJson(Map<String, dynamic> json) {
    return ResourceState(
      ec2: State.fromJson(
          (json['ec2'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
      ecr: State.fromJson(
          (json['ecr'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
      codeRepository: json['codeRepository'] != null
          ? State.fromJson(json['codeRepository'] as Map<String, dynamic>)
          : null,
      lambda: json['lambda'] != null
          ? State.fromJson(json['lambda'] as Map<String, dynamic>)
          : null,
      lambdaCode: json['lambdaCode'] != null
          ? State.fromJson(json['lambdaCode'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ec2 = this.ec2;
    final ecr = this.ecr;
    final codeRepository = this.codeRepository;
    final lambda = this.lambda;
    final lambdaCode = this.lambdaCode;
    return {
      'ec2': ec2,
      'ecr': ecr,
      if (codeRepository != null) 'codeRepository': codeRepository,
      if (lambda != null) 'lambda': lambda,
      if (lambdaCode != null) 'lambdaCode': lambdaCode,
    };
  }
}

/// Details about a successful association or disassociation between a code
/// repository and a scan configuration.
///
/// @nodoc
class SuccessfulAssociationResult {
  final CodeSecurityResource? resource;

  /// The Amazon Resource Name (ARN) of the scan configuration that was
  /// successfully associated or disassociated.
  final String? scanConfigurationArn;

  SuccessfulAssociationResult({
    this.resource,
    this.scanConfigurationArn,
  });

  factory SuccessfulAssociationResult.fromJson(Map<String, dynamic> json) {
    return SuccessfulAssociationResult(
      resource: json['resource'] != null
          ? CodeSecurityResource.fromJson(
              json['resource'] as Map<String, dynamic>)
          : null,
      scanConfigurationArn: json['scanConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      if (resource != null) 'resource': resource,
      if (scanConfigurationArn != null)
        'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

/// Details about a failed attempt to associate or disassociate a code
/// repository with a scan configuration.
///
/// @nodoc
class FailedAssociationResult {
  final CodeSecurityResource? resource;

  /// The Amazon Resource Name (ARN) of the scan configuration that failed to be
  /// associated or disassociated.
  final String? scanConfigurationArn;

  /// The status code indicating why the association or disassociation failed.
  final AssociationResultStatusCode? statusCode;

  /// A message explaining why the association or disassociation failed.
  final String? statusMessage;

  FailedAssociationResult({
    this.resource,
    this.scanConfigurationArn,
    this.statusCode,
    this.statusMessage,
  });

  factory FailedAssociationResult.fromJson(Map<String, dynamic> json) {
    return FailedAssociationResult(
      resource: json['resource'] != null
          ? CodeSecurityResource.fromJson(
              json['resource'] as Map<String, dynamic>)
          : null,
      scanConfigurationArn: json['scanConfigurationArn'] as String?,
      statusCode: (json['statusCode'] as String?)
          ?.let(AssociationResultStatusCode.fromString),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final scanConfigurationArn = this.scanConfigurationArn;
    final statusCode = this.statusCode;
    final statusMessage = this.statusMessage;
    return {
      if (resource != null) 'resource': resource,
      if (scanConfigurationArn != null)
        'scanConfigurationArn': scanConfigurationArn,
      if (statusCode != null) 'statusCode': statusCode.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
class AssociationResultStatusCode {
  static const internalError = AssociationResultStatusCode._('INTERNAL_ERROR');
  static const accessDenied = AssociationResultStatusCode._('ACCESS_DENIED');
  static const scanConfigurationNotFound =
      AssociationResultStatusCode._('SCAN_CONFIGURATION_NOT_FOUND');
  static const invalidInput = AssociationResultStatusCode._('INVALID_INPUT');
  static const resourceNotFound =
      AssociationResultStatusCode._('RESOURCE_NOT_FOUND');
  static const quotaExceeded = AssociationResultStatusCode._('QUOTA_EXCEEDED');

  final String value;

  const AssociationResultStatusCode._(this.value);

  static const values = [
    internalError,
    accessDenied,
    scanConfigurationNotFound,
    invalidInput,
    resourceNotFound,
    quotaExceeded
  ];

  static AssociationResultStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssociationResultStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is AssociationResultStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a request to disassociate a code repository from a
/// scan configuration.
///
/// @nodoc
class DisassociateConfigurationRequest {
  final CodeSecurityResource resource;

  /// The Amazon Resource Name (ARN) of the scan configuration to disassociate
  /// from a code repository.
  final String scanConfigurationArn;

  DisassociateConfigurationRequest({
    required this.resource,
    required this.scanConfigurationArn,
  });

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      'resource': resource,
      'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

/// Contains details about a request to associate a code repository with a scan
/// configuration.
///
/// @nodoc
class AssociateConfigurationRequest {
  final CodeSecurityResource resource;

  /// The Amazon Resource Name (ARN) of the scan configuration.
  final String scanConfigurationArn;

  AssociateConfigurationRequest({
    required this.resource,
    required this.scanConfigurationArn,
  });

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      'resource': resource,
      'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
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
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
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
