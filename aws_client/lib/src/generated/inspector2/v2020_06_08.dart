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

/// Amazon Inspector is a vulnerability discovery service that automates
/// continuous scanning for security vulnerabilities within your Amazon EC2,
/// Amazon ECR, and Amazon Web Services Lambda environments.
class Inspector2 {
  final _s.RestJsonProtocol _protocol;
  Inspector2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'inspector2',
            signingName: 'inspector2',
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

  /// Associates an Amazon Web Services account with an Amazon Inspector
  /// delegated administrator. An HTTP 200 response indicates the association
  /// was successfully started, but doesn’t indicate whether it was completed.
  /// You can check if the association completed by using <a
  /// href="https://docs.aws.amazon.com/inspector/v2/APIReference/API_ListMembers.html">ListMembers</a>
  /// for multiple accounts or <a
  /// href="https://docs.aws.amazon.com/inspector/v2/APIReference/API_GetMember.html">GetMembers</a>
  /// for a single account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Retrieves the Amazon Inspector status of multiple Amazon Web Services
  /// accounts within your environment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accountIds] :
  /// The unique identifiers for the Amazon Web Services accounts to retrieve
  /// Amazon Inspector deep inspection activation status for. <pre><code>
  /// &lt;/p&gt; </code></pre>
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      'securityLevel': securityLevel.toValue(),
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

  /// Creates a filter resource using specified filter criteria. When the filter
  /// action is set to <code>SUPPRESS</code> this action creates a suppression
  /// rule.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [BadRequestException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      'action': action.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      'reportFormat': reportFormat.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [reportFormat] :
  /// The output format for the software bill of materials (SBOM) report.
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
      'reportFormat': reportFormat.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Deletes a filter resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
        'resourceTypes': resourceTypes.map((e) => e.toValue()).toList(),
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
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      'resourceTypes': resourceTypes.map((e) => e.toValue()).toList(),
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
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
      if (reportFormat != null) 'reportFormat': reportFormat.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan-result/details/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetCisScanResultDetailsResponse.fromJson(response);
  }

  /// Retrieves setting configurations for Inspector scans.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
      'resourceType': [resourceType.toValue()],
      'scanType': [scanType.toValue()],
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Lists the permissions an account has to configure Amazon Inspector.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (service != null) 'service': service.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (detailLevel != null) 'detailLevel': detailLevel.toValue(),
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cis/scan/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListCisScansResponse.fromJson(response);
  }

  /// Lists coverage details for you environment.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (groupBy != null) 'groupBy': groupBy.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (action != null) 'action': action.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      'aggregationType': aggregationType.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
      'resourceType': resourceType.toValue(),
      'scanType': scanType.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Stops a CIS session. This API is used by the Amazon Inspector SSM plugin
  /// to communicate with the Amazon Inspector service. The Amazon Inspector SSM
  /// plugin calls this API to start a CIS scan session for the scan ID supplied
  /// by the service.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (securityLevel != null) 'securityLevel': securityLevel.toValue(),
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

  /// Updates setting configurations for your Amazon Inspector account. When you
  /// use this API as an Amazon Inspector delegated administrator this updates
  /// the setting for all accounts you manage. Member accounts in an
  /// organization cannot update this setting.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
      'resourceType': resourceType.toValue(),
      'scanType': scanType.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
      if (action != null) 'action': action.toValue(),
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

  /// Updates the Amazon Inspector deep inspection custom paths for your
  /// organization. You must be an Amazon Inspector delegated administrator to
  /// use this API.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Updates the configurations for your Amazon Inspector organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
}

/// An Amazon Web Services account within your environment that Amazon Inspector
/// has been enabled for.
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
      accountId: json['accountId'] as String,
      resourceStatus: ResourceStatus.fromJson(
          json['resourceStatus'] as Map<String, dynamic>),
      status: (json['status'] as String).toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final resourceStatus = this.resourceStatus;
    final status = this.status;
    return {
      'accountId': accountId,
      'resourceStatus': resourceStatus,
      'status': status.toValue(),
    };
  }
}

/// An object that contains details about an aggregation response based on
/// Amazon Web Services accounts.
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
      if (findingType != null) 'findingType': findingType.toValue(),
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

/// An aggregation of findings by Amazon Web Services account ID.
class AccountAggregationResponse {
  /// The Amazon Web Services account ID.
  final String? accountId;

  /// The number of findings by severity.
  final SeverityCounts? severityCounts;

  AccountAggregationResponse({
    this.accountId,
    this.severityCounts,
  });

  factory AccountAggregationResponse.fromJson(Map<String, dynamic> json) {
    return AccountAggregationResponse(
      accountId: json['accountId'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final severityCounts = this.severityCounts;
    return {
      if (accountId != null) 'accountId': accountId,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

enum AccountSortBy {
  critical,
  high,
  all,
}

extension AccountSortByValueExtension on AccountSortBy {
  String toValue() {
    switch (this) {
      case AccountSortBy.critical:
        return 'CRITICAL';
      case AccountSortBy.high:
        return 'HIGH';
      case AccountSortBy.all:
        return 'ALL';
    }
  }
}

extension AccountSortByFromString on String {
  AccountSortBy toAccountSortBy() {
    switch (this) {
      case 'CRITICAL':
        return AccountSortBy.critical;
      case 'HIGH':
        return AccountSortBy.high;
      case 'ALL':
        return AccountSortBy.all;
    }
    throw Exception('$this is not known in enum AccountSortBy');
  }
}

/// An object with details the status of an Amazon Web Services account within
/// your Amazon Inspector environment.
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
      accountId: json['accountId'] as String,
      resourceState:
          ResourceState.fromJson(json['resourceState'] as Map<String, dynamic>),
      state: State.fromJson(json['state'] as Map<String, dynamic>),
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

enum AggregationFindingType {
  networkReachability,
  packageVulnerability,
  codeVulnerability,
}

extension AggregationFindingTypeValueExtension on AggregationFindingType {
  String toValue() {
    switch (this) {
      case AggregationFindingType.networkReachability:
        return 'NETWORK_REACHABILITY';
      case AggregationFindingType.packageVulnerability:
        return 'PACKAGE_VULNERABILITY';
      case AggregationFindingType.codeVulnerability:
        return 'CODE_VULNERABILITY';
    }
  }
}

extension AggregationFindingTypeFromString on String {
  AggregationFindingType toAggregationFindingType() {
    switch (this) {
      case 'NETWORK_REACHABILITY':
        return AggregationFindingType.networkReachability;
      case 'PACKAGE_VULNERABILITY':
        return AggregationFindingType.packageVulnerability;
      case 'CODE_VULNERABILITY':
        return AggregationFindingType.codeVulnerability;
    }
    throw Exception('$this is not known in enum AggregationFindingType');
  }
}

/// Contains details about an aggregation request.
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

enum AggregationResourceType {
  awsEc2Instance,
  awsEcrContainerImage,
  awsLambdaFunction,
}

extension AggregationResourceTypeValueExtension on AggregationResourceType {
  String toValue() {
    switch (this) {
      case AggregationResourceType.awsEc2Instance:
        return 'AWS_EC2_INSTANCE';
      case AggregationResourceType.awsEcrContainerImage:
        return 'AWS_ECR_CONTAINER_IMAGE';
      case AggregationResourceType.awsLambdaFunction:
        return 'AWS_LAMBDA_FUNCTION';
    }
  }
}

extension AggregationResourceTypeFromString on String {
  AggregationResourceType toAggregationResourceType() {
    switch (this) {
      case 'AWS_EC2_INSTANCE':
        return AggregationResourceType.awsEc2Instance;
      case 'AWS_ECR_CONTAINER_IMAGE':
        return AggregationResourceType.awsEcrContainerImage;
      case 'AWS_LAMBDA_FUNCTION':
        return AggregationResourceType.awsLambdaFunction;
    }
    throw Exception('$this is not known in enum AggregationResourceType');
  }
}

/// A structure that contains details about the results of an aggregation type.
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

enum AggregationType {
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
}

extension AggregationTypeValueExtension on AggregationType {
  String toValue() {
    switch (this) {
      case AggregationType.findingType:
        return 'FINDING_TYPE';
      case AggregationType.package:
        return 'PACKAGE';
      case AggregationType.title:
        return 'TITLE';
      case AggregationType.repository:
        return 'REPOSITORY';
      case AggregationType.ami:
        return 'AMI';
      case AggregationType.awsEc2Instance:
        return 'AWS_EC2_INSTANCE';
      case AggregationType.awsEcrContainer:
        return 'AWS_ECR_CONTAINER';
      case AggregationType.imageLayer:
        return 'IMAGE_LAYER';
      case AggregationType.account:
        return 'ACCOUNT';
      case AggregationType.awsLambdaFunction:
        return 'AWS_LAMBDA_FUNCTION';
      case AggregationType.lambdaLayer:
        return 'LAMBDA_LAYER';
    }
  }
}

extension AggregationTypeFromString on String {
  AggregationType toAggregationType() {
    switch (this) {
      case 'FINDING_TYPE':
        return AggregationType.findingType;
      case 'PACKAGE':
        return AggregationType.package;
      case 'TITLE':
        return AggregationType.title;
      case 'REPOSITORY':
        return AggregationType.repository;
      case 'AMI':
        return AggregationType.ami;
      case 'AWS_EC2_INSTANCE':
        return AggregationType.awsEc2Instance;
      case 'AWS_ECR_CONTAINER':
        return AggregationType.awsEcrContainer;
      case 'IMAGE_LAYER':
        return AggregationType.imageLayer;
      case 'ACCOUNT':
        return AggregationType.account;
      case 'AWS_LAMBDA_FUNCTION':
        return AggregationType.awsLambdaFunction;
      case 'LAMBDA_LAYER':
        return AggregationType.lambdaLayer;
    }
    throw Exception('$this is not known in enum AggregationType');
  }
}

/// The details that define an aggregation based on Amazon machine images
/// (AMIs).
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

/// A response that contains the results of a finding aggregation by AMI.
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
      ami: json['ami'] as String,
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

enum AmiSortBy {
  critical,
  high,
  all,
  affectedInstances,
}

extension AmiSortByValueExtension on AmiSortBy {
  String toValue() {
    switch (this) {
      case AmiSortBy.critical:
        return 'CRITICAL';
      case AmiSortBy.high:
        return 'HIGH';
      case AmiSortBy.all:
        return 'ALL';
      case AmiSortBy.affectedInstances:
        return 'AFFECTED_INSTANCES';
    }
  }
}

extension AmiSortByFromString on String {
  AmiSortBy toAmiSortBy() {
    switch (this) {
      case 'CRITICAL':
        return AmiSortBy.critical;
      case 'HIGH':
        return AmiSortBy.high;
      case 'ALL':
        return AmiSortBy.all;
      case 'AFFECTED_INSTANCES':
        return AmiSortBy.affectedInstances;
    }
    throw Exception('$this is not known in enum AmiSortBy');
  }
}

enum Architecture {
  x86_64,
  arm64,
}

extension ArchitectureValueExtension on Architecture {
  String toValue() {
    switch (this) {
      case Architecture.x86_64:
        return 'X86_64';
      case Architecture.arm64:
        return 'ARM64';
    }
  }
}

extension ArchitectureFromString on String {
  Architecture toArchitecture() {
    switch (this) {
      case 'X86_64':
        return Architecture.x86_64;
      case 'ARM64':
        return Architecture.arm64;
    }
    throw Exception('$this is not known in enum Architecture');
  }
}

class AssociateMemberResponse {
  /// The Amazon Web Services account ID of the successfully associated member
  /// account.
  final String accountId;

  AssociateMemberResponse({
    required this.accountId,
  });

  factory AssociateMemberResponse.fromJson(Map<String, dynamic> json) {
    return AssociateMemberResponse(
      accountId: json['accountId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// The Amazon Web Services Threat Intel Group (ATIG) details for a specific
/// vulnerability.
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
      targets: (json['targets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ttps: (json['ttps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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

/// Represents which scan types are automatically enabled for new members of
/// your Amazon Inspector organization.
class AutoEnable {
  /// Represents whether Amazon EC2 scans are automatically enabled for new
  /// members of your Amazon Inspector organization.
  final bool ec2;

  /// Represents whether Amazon ECR scans are automatically enabled for new
  /// members of your Amazon Inspector organization.
  final bool ecr;

  /// Represents whether Amazon Web Services Lambda standard scans are
  /// automatically enabled for new members of your Amazon Inspector organization.
  final bool? lambda;

  /// Represents whether Lambda code scans are automatically enabled for new
  /// members of your Amazon Inspector organization. <pre><code> &lt;/p&gt;
  /// </code></pre>
  final bool? lambdaCode;

  AutoEnable({
    required this.ec2,
    required this.ecr,
    this.lambda,
    this.lambdaCode,
  });

  factory AutoEnable.fromJson(Map<String, dynamic> json) {
    return AutoEnable(
      ec2: json['ec2'] as bool,
      ecr: json['ecr'] as bool,
      lambda: json['lambda'] as bool?,
      lambdaCode: json['lambdaCode'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final ec2 = this.ec2;
    final ecr = this.ecr;
    final lambda = this.lambda;
    final lambdaCode = this.lambdaCode;
    return {
      'ec2': ec2,
      'ecr': ecr,
      if (lambda != null) 'lambda': lambda,
      if (lambdaCode != null) 'lambdaCode': lambdaCode,
    };
  }
}

/// Details of the Amazon EC2 instance involved in a finding.
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ipV6Addresses: (json['ipV6Addresses'] as List?)
          ?.whereNotNull()
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

/// An aggregation of information about Amazon ECR containers.
class AwsEcrContainerAggregation {
  /// The architecture of the containers.
  final List<StringFilter>? architectures;

  /// The image SHA values.
  final List<StringFilter>? imageShas;

  /// The image tags.
  final List<StringFilter>? imageTags;

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
    this.repositories,
    this.resourceIds,
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final architectures = this.architectures;
    final imageShas = this.imageShas;
    final imageTags = this.imageTags;
    final repositories = this.repositories;
    final resourceIds = this.resourceIds;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (architectures != null) 'architectures': architectures,
      if (imageShas != null) 'imageShas': imageShas,
      if (imageTags != null) 'imageTags': imageTags,
      if (repositories != null) 'repositories': repositories,
      if (resourceIds != null) 'resourceIds': resourceIds,
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

/// An aggregation of information about Amazon ECR containers.
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
    this.repository,
    this.severityCounts,
  });

  factory AwsEcrContainerAggregationResponse.fromJson(
      Map<String, dynamic> json) {
    return AwsEcrContainerAggregationResponse(
      resourceId: json['resourceId'] as String,
      accountId: json['accountId'] as String?,
      architecture: json['architecture'] as String?,
      imageSha: json['imageSha'] as String?,
      imageTags: (json['imageTags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
    final repository = this.repository;
    final severityCounts = this.severityCounts;
    return {
      'resourceId': resourceId,
      if (accountId != null) 'accountId': accountId,
      if (architecture != null) 'architecture': architecture,
      if (imageSha != null) 'imageSha': imageSha,
      if (imageTags != null) 'imageTags': imageTags,
      if (repository != null) 'repository': repository,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// The image details of the Amazon ECR container image.
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
    this.platform,
    this.pushedAt,
  });

  factory AwsEcrContainerImageDetails.fromJson(Map<String, dynamic> json) {
    return AwsEcrContainerImageDetails(
      imageHash: json['imageHash'] as String,
      registry: json['registry'] as String,
      repositoryName: json['repositoryName'] as String,
      architecture: json['architecture'] as String?,
      author: json['author'] as String?,
      imageTags: (json['imageTags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
    final platform = this.platform;
    final pushedAt = this.pushedAt;
    return {
      'imageHash': imageHash,
      'registry': registry,
      'repositoryName': repositoryName,
      if (architecture != null) 'architecture': architecture,
      if (author != null) 'author': author,
      if (imageTags != null) 'imageTags': imageTags,
      if (platform != null) 'platform': platform,
      if (pushedAt != null) 'pushedAt': unixTimestampToJson(pushedAt),
    };
  }
}

enum AwsEcrContainerSortBy {
  critical,
  high,
  all,
}

extension AwsEcrContainerSortByValueExtension on AwsEcrContainerSortBy {
  String toValue() {
    switch (this) {
      case AwsEcrContainerSortBy.critical:
        return 'CRITICAL';
      case AwsEcrContainerSortBy.high:
        return 'HIGH';
      case AwsEcrContainerSortBy.all:
        return 'ALL';
    }
  }
}

extension AwsEcrContainerSortByFromString on String {
  AwsEcrContainerSortBy toAwsEcrContainerSortBy() {
    switch (this) {
      case 'CRITICAL':
        return AwsEcrContainerSortBy.critical;
      case 'HIGH':
        return AwsEcrContainerSortBy.high;
      case 'ALL':
        return AwsEcrContainerSortBy.all;
    }
    throw Exception('$this is not known in enum AwsEcrContainerSortBy');
  }
}

/// A summary of information about the Amazon Web Services Lambda function.
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
      codeSha256: json['codeSha256'] as String,
      executionRoleArn: json['executionRoleArn'] as String,
      functionName: json['functionName'] as String,
      runtime: (json['runtime'] as String).toRuntime(),
      version: json['version'] as String,
      architectures: (json['architectures'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toArchitecture())
          .toList(),
      lastModifiedAt: timeStampFromJson(json['lastModifiedAt']),
      layers: (json['layers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      packageType: (json['packageType'] as String?)?.toPackageType(),
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
      'runtime': runtime.toValue(),
      'version': version,
      if (architectures != null)
        'architectures': architectures.map((e) => e.toValue()).toList(),
      if (lastModifiedAt != null)
        'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      if (layers != null) 'layers': layers,
      if (packageType != null) 'packageType': packageType.toValue(),
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

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
      accounts: (json['accounts'] as List)
          .whereNotNull()
          .map((e) => AccountState.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedAccounts: (json['failedAccounts'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
          .map((e) => CodeSnippetResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
          .map((e) => FindingDetailsError.fromJson(e as Map<String, dynamic>))
          .toList(),
      findingDetails: (json['findingDetails'] as List?)
          ?.whereNotNull()
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
      accounts: (json['accounts'] as List)
          .whereNotNull()
          .map((e) => FreeTrialAccountInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedAccounts: (json['failedAccounts'] as List)
          .whereNotNull()
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

class BatchGetMemberEc2DeepInspectionStatusResponse {
  /// An array of objects that provide details on the activation status of Amazon
  /// Inspector deep inspection for each of the requested accounts. <pre><code>
  /// &lt;/p&gt; </code></pre>
  final List<MemberAccountEc2DeepInspectionStatusState>? accountIds;

  /// An array of objects that provide details on any accounts that failed to
  /// activate Amazon Inspector deep inspection and why. <pre><code> &lt;/p&gt;
  /// </code></pre>
  final List<FailedMemberAccountEc2DeepInspectionStatusState>? failedAccountIds;

  BatchGetMemberEc2DeepInspectionStatusResponse({
    this.accountIds,
    this.failedAccountIds,
  });

  factory BatchGetMemberEc2DeepInspectionStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetMemberEc2DeepInspectionStatusResponse(
      accountIds: (json['accountIds'] as List?)
          ?.whereNotNull()
          .map((e) => MemberAccountEc2DeepInspectionStatusState.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      failedAccountIds: (json['failedAccountIds'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
          .map((e) => MemberAccountEc2DeepInspectionStatusState.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      failedAccountIds: (json['failedAccountIds'] as List?)
          ?.whereNotNull()
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

class CancelFindingsReportResponse {
  /// The ID of the canceled report.
  final String reportId;

  CancelFindingsReportResponse({
    required this.reportId,
  });

  factory CancelFindingsReportResponse.fromJson(Map<String, dynamic> json) {
    return CancelFindingsReportResponse(
      reportId: json['reportId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final reportId = this.reportId;
    return {
      'reportId': reportId,
    };
  }
}

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

/// A CIS check.
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
      scanArn: json['scanArn'] as String,
      accountId: json['accountId'] as String?,
      checkDescription: json['checkDescription'] as String?,
      checkId: json['checkId'] as String?,
      level: (json['level'] as String?)?.toCisSecurityLevel(),
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
      if (level != null) 'level': level.toValue(),
      if (platform != null) 'platform': platform,
      if (statusCounts != null) 'statusCounts': statusCounts,
      if (title != null) 'title': title,
    };
  }
}

/// The CIS date filter.
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

enum CisFindingStatus {
  passed,
  failed,
  skipped,
}

extension CisFindingStatusValueExtension on CisFindingStatus {
  String toValue() {
    switch (this) {
      case CisFindingStatus.passed:
        return 'PASSED';
      case CisFindingStatus.failed:
        return 'FAILED';
      case CisFindingStatus.skipped:
        return 'SKIPPED';
    }
  }
}

extension CisFindingStatusFromString on String {
  CisFindingStatus toCisFindingStatus() {
    switch (this) {
      case 'PASSED':
        return CisFindingStatus.passed;
      case 'FAILED':
        return CisFindingStatus.failed;
      case 'SKIPPED':
        return CisFindingStatus.skipped;
    }
    throw Exception('$this is not known in enum CisFindingStatus');
  }
}

enum CisFindingStatusComparison {
  equals,
}

extension CisFindingStatusComparisonValueExtension
    on CisFindingStatusComparison {
  String toValue() {
    switch (this) {
      case CisFindingStatusComparison.equals:
        return 'EQUALS';
    }
  }
}

extension CisFindingStatusComparisonFromString on String {
  CisFindingStatusComparison toCisFindingStatusComparison() {
    switch (this) {
      case 'EQUALS':
        return CisFindingStatusComparison.equals;
    }
    throw Exception('$this is not known in enum CisFindingStatusComparison');
  }
}

/// The CIS finding status filter.
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
      'comparison': comparison.toValue(),
      'value': value.toValue(),
    };
  }
}

/// The CIS number filter.
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

enum CisReportFormat {
  pdf,
  csv,
}

extension CisReportFormatValueExtension on CisReportFormat {
  String toValue() {
    switch (this) {
      case CisReportFormat.pdf:
        return 'PDF';
      case CisReportFormat.csv:
        return 'CSV';
    }
  }
}

extension CisReportFormatFromString on String {
  CisReportFormat toCisReportFormat() {
    switch (this) {
      case 'PDF':
        return CisReportFormat.pdf;
      case 'CSV':
        return CisReportFormat.csv;
    }
    throw Exception('$this is not known in enum CisReportFormat');
  }
}

enum CisReportStatus {
  succeeded,
  failed,
  inProgress,
}

extension CisReportStatusValueExtension on CisReportStatus {
  String toValue() {
    switch (this) {
      case CisReportStatus.succeeded:
        return 'SUCCEEDED';
      case CisReportStatus.failed:
        return 'FAILED';
      case CisReportStatus.inProgress:
        return 'IN_PROGRESS';
    }
  }
}

extension CisReportStatusFromString on String {
  CisReportStatus toCisReportStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return CisReportStatus.succeeded;
      case 'FAILED':
        return CisReportStatus.failed;
      case 'IN_PROGRESS':
        return CisReportStatus.inProgress;
    }
    throw Exception('$this is not known in enum CisReportStatus');
  }
}

enum CisResultStatus {
  passed,
  failed,
  skipped,
}

extension CisResultStatusValueExtension on CisResultStatus {
  String toValue() {
    switch (this) {
      case CisResultStatus.passed:
        return 'PASSED';
      case CisResultStatus.failed:
        return 'FAILED';
      case CisResultStatus.skipped:
        return 'SKIPPED';
    }
  }
}

extension CisResultStatusFromString on String {
  CisResultStatus toCisResultStatus() {
    switch (this) {
      case 'PASSED':
        return CisResultStatus.passed;
      case 'FAILED':
        return CisResultStatus.failed;
      case 'SKIPPED':
        return CisResultStatus.skipped;
    }
    throw Exception('$this is not known in enum CisResultStatus');
  }
}

enum CisResultStatusComparison {
  equals,
}

extension CisResultStatusComparisonValueExtension on CisResultStatusComparison {
  String toValue() {
    switch (this) {
      case CisResultStatusComparison.equals:
        return 'EQUALS';
    }
  }
}

extension CisResultStatusComparisonFromString on String {
  CisResultStatusComparison toCisResultStatusComparison() {
    switch (this) {
      case 'EQUALS':
        return CisResultStatusComparison.equals;
    }
    throw Exception('$this is not known in enum CisResultStatusComparison');
  }
}

/// The CIS result status filter.
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
      'comparison': comparison.toValue(),
      'value': value.toValue(),
    };
  }
}

enum CisRuleStatus {
  failed,
  passed,
  notEvaluated,
  informational,
  unknown,
  notApplicable,
  error,
}

extension CisRuleStatusValueExtension on CisRuleStatus {
  String toValue() {
    switch (this) {
      case CisRuleStatus.failed:
        return 'FAILED';
      case CisRuleStatus.passed:
        return 'PASSED';
      case CisRuleStatus.notEvaluated:
        return 'NOT_EVALUATED';
      case CisRuleStatus.informational:
        return 'INFORMATIONAL';
      case CisRuleStatus.unknown:
        return 'UNKNOWN';
      case CisRuleStatus.notApplicable:
        return 'NOT_APPLICABLE';
      case CisRuleStatus.error:
        return 'ERROR';
    }
  }
}

extension CisRuleStatusFromString on String {
  CisRuleStatus toCisRuleStatus() {
    switch (this) {
      case 'FAILED':
        return CisRuleStatus.failed;
      case 'PASSED':
        return CisRuleStatus.passed;
      case 'NOT_EVALUATED':
        return CisRuleStatus.notEvaluated;
      case 'INFORMATIONAL':
        return CisRuleStatus.informational;
      case 'UNKNOWN':
        return CisRuleStatus.unknown;
      case 'NOT_APPLICABLE':
        return CisRuleStatus.notApplicable;
      case 'ERROR':
        return CisRuleStatus.error;
    }
    throw Exception('$this is not known in enum CisRuleStatus');
  }
}

/// The CIS scan.
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
      scanArn: json['scanArn'] as String,
      scanConfigurationArn: json['scanConfigurationArn'] as String,
      failedChecks: json['failedChecks'] as int?,
      scanDate: timeStampFromJson(json['scanDate']),
      scanName: json['scanName'] as String?,
      scheduledBy: json['scheduledBy'] as String?,
      securityLevel: (json['securityLevel'] as String?)?.toCisSecurityLevel(),
      status: (json['status'] as String?)?.toCisScanStatus(),
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
      if (securityLevel != null) 'securityLevel': securityLevel.toValue(),
      if (status != null) 'status': status.toValue(),
      if (targets != null) 'targets': targets,
      if (totalChecks != null) 'totalChecks': totalChecks,
    };
  }
}

/// The CIS scan configuration.
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
      scanConfigurationArn: json['scanConfigurationArn'] as String,
      ownerId: json['ownerId'] as String?,
      scanName: json['scanName'] as String?,
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
      securityLevel: (json['securityLevel'] as String?)?.toCisSecurityLevel(),
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
      if (securityLevel != null) 'securityLevel': securityLevel.toValue(),
      if (tags != null) 'tags': tags,
      if (targets != null) 'targets': targets,
    };
  }
}

enum CisScanConfigurationsSortBy {
  scanName,
  scanConfigurationArn,
}

extension CisScanConfigurationsSortByValueExtension
    on CisScanConfigurationsSortBy {
  String toValue() {
    switch (this) {
      case CisScanConfigurationsSortBy.scanName:
        return 'SCAN_NAME';
      case CisScanConfigurationsSortBy.scanConfigurationArn:
        return 'SCAN_CONFIGURATION_ARN';
    }
  }
}

extension CisScanConfigurationsSortByFromString on String {
  CisScanConfigurationsSortBy toCisScanConfigurationsSortBy() {
    switch (this) {
      case 'SCAN_NAME':
        return CisScanConfigurationsSortBy.scanName;
      case 'SCAN_CONFIGURATION_ARN':
        return CisScanConfigurationsSortBy.scanConfigurationArn;
    }
    throw Exception('$this is not known in enum CisScanConfigurationsSortBy');
  }
}

/// The CIS scan result details.
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
      scanArn: json['scanArn'] as String,
      accountId: json['accountId'] as String?,
      checkDescription: json['checkDescription'] as String?,
      checkId: json['checkId'] as String?,
      findingArn: json['findingArn'] as String?,
      level: (json['level'] as String?)?.toCisSecurityLevel(),
      platform: json['platform'] as String?,
      remediation: json['remediation'] as String?,
      status: (json['status'] as String?)?.toCisFindingStatus(),
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
      if (level != null) 'level': level.toValue(),
      if (platform != null) 'platform': platform,
      if (remediation != null) 'remediation': remediation,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (targetResourceId != null) 'targetResourceId': targetResourceId,
      if (title != null) 'title': title,
    };
  }
}

/// The CIS scan result details filter criteria.
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

enum CisScanResultDetailsSortBy {
  checkId,
  status,
}

extension CisScanResultDetailsSortByValueExtension
    on CisScanResultDetailsSortBy {
  String toValue() {
    switch (this) {
      case CisScanResultDetailsSortBy.checkId:
        return 'CHECK_ID';
      case CisScanResultDetailsSortBy.status:
        return 'STATUS';
    }
  }
}

extension CisScanResultDetailsSortByFromString on String {
  CisScanResultDetailsSortBy toCisScanResultDetailsSortBy() {
    switch (this) {
      case 'CHECK_ID':
        return CisScanResultDetailsSortBy.checkId;
      case 'STATUS':
        return CisScanResultDetailsSortBy.status;
    }
    throw Exception('$this is not known in enum CisScanResultDetailsSortBy');
  }
}

/// The scan results aggregated by checks filter criteria.
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

enum CisScanResultsAggregatedByChecksSortBy {
  checkId,
  title,
  platform,
  failedCounts,
  securityLevel,
}

extension CisScanResultsAggregatedByChecksSortByValueExtension
    on CisScanResultsAggregatedByChecksSortBy {
  String toValue() {
    switch (this) {
      case CisScanResultsAggregatedByChecksSortBy.checkId:
        return 'CHECK_ID';
      case CisScanResultsAggregatedByChecksSortBy.title:
        return 'TITLE';
      case CisScanResultsAggregatedByChecksSortBy.platform:
        return 'PLATFORM';
      case CisScanResultsAggregatedByChecksSortBy.failedCounts:
        return 'FAILED_COUNTS';
      case CisScanResultsAggregatedByChecksSortBy.securityLevel:
        return 'SECURITY_LEVEL';
    }
  }
}

extension CisScanResultsAggregatedByChecksSortByFromString on String {
  CisScanResultsAggregatedByChecksSortBy
      toCisScanResultsAggregatedByChecksSortBy() {
    switch (this) {
      case 'CHECK_ID':
        return CisScanResultsAggregatedByChecksSortBy.checkId;
      case 'TITLE':
        return CisScanResultsAggregatedByChecksSortBy.title;
      case 'PLATFORM':
        return CisScanResultsAggregatedByChecksSortBy.platform;
      case 'FAILED_COUNTS':
        return CisScanResultsAggregatedByChecksSortBy.failedCounts;
      case 'SECURITY_LEVEL':
        return CisScanResultsAggregatedByChecksSortBy.securityLevel;
    }
    throw Exception(
        '$this is not known in enum CisScanResultsAggregatedByChecksSortBy');
  }
}

/// The scan results aggregated by target resource filter criteria.
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

enum CisScanResultsAggregatedByTargetResourceSortBy {
  resourceId,
  failedCounts,
  accountId,
  platform,
  targetStatus,
  targetStatusReason,
}

extension CisScanResultsAggregatedByTargetResourceSortByValueExtension
    on CisScanResultsAggregatedByTargetResourceSortBy {
  String toValue() {
    switch (this) {
      case CisScanResultsAggregatedByTargetResourceSortBy.resourceId:
        return 'RESOURCE_ID';
      case CisScanResultsAggregatedByTargetResourceSortBy.failedCounts:
        return 'FAILED_COUNTS';
      case CisScanResultsAggregatedByTargetResourceSortBy.accountId:
        return 'ACCOUNT_ID';
      case CisScanResultsAggregatedByTargetResourceSortBy.platform:
        return 'PLATFORM';
      case CisScanResultsAggregatedByTargetResourceSortBy.targetStatus:
        return 'TARGET_STATUS';
      case CisScanResultsAggregatedByTargetResourceSortBy.targetStatusReason:
        return 'TARGET_STATUS_REASON';
    }
  }
}

extension CisScanResultsAggregatedByTargetResourceSortByFromString on String {
  CisScanResultsAggregatedByTargetResourceSortBy
      toCisScanResultsAggregatedByTargetResourceSortBy() {
    switch (this) {
      case 'RESOURCE_ID':
        return CisScanResultsAggregatedByTargetResourceSortBy.resourceId;
      case 'FAILED_COUNTS':
        return CisScanResultsAggregatedByTargetResourceSortBy.failedCounts;
      case 'ACCOUNT_ID':
        return CisScanResultsAggregatedByTargetResourceSortBy.accountId;
      case 'PLATFORM':
        return CisScanResultsAggregatedByTargetResourceSortBy.platform;
      case 'TARGET_STATUS':
        return CisScanResultsAggregatedByTargetResourceSortBy.targetStatus;
      case 'TARGET_STATUS_REASON':
        return CisScanResultsAggregatedByTargetResourceSortBy
            .targetStatusReason;
    }
    throw Exception(
        '$this is not known in enum CisScanResultsAggregatedByTargetResourceSortBy');
  }
}

enum CisScanStatus {
  failed,
  completed,
  cancelled,
  inProgress,
}

extension CisScanStatusValueExtension on CisScanStatus {
  String toValue() {
    switch (this) {
      case CisScanStatus.failed:
        return 'FAILED';
      case CisScanStatus.completed:
        return 'COMPLETED';
      case CisScanStatus.cancelled:
        return 'CANCELLED';
      case CisScanStatus.inProgress:
        return 'IN_PROGRESS';
    }
  }
}

extension CisScanStatusFromString on String {
  CisScanStatus toCisScanStatus() {
    switch (this) {
      case 'FAILED':
        return CisScanStatus.failed;
      case 'COMPLETED':
        return CisScanStatus.completed;
      case 'CANCELLED':
        return CisScanStatus.cancelled;
      case 'IN_PROGRESS':
        return CisScanStatus.inProgress;
    }
    throw Exception('$this is not known in enum CisScanStatus');
  }
}

enum CisScanStatusComparison {
  equals,
}

extension CisScanStatusComparisonValueExtension on CisScanStatusComparison {
  String toValue() {
    switch (this) {
      case CisScanStatusComparison.equals:
        return 'EQUALS';
    }
  }
}

extension CisScanStatusComparisonFromString on String {
  CisScanStatusComparison toCisScanStatusComparison() {
    switch (this) {
      case 'EQUALS':
        return CisScanStatusComparison.equals;
    }
    throw Exception('$this is not known in enum CisScanStatusComparison');
  }
}

/// The CIS scan status filter.
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
      'comparison': comparison.toValue(),
      'value': value.toValue(),
    };
  }
}

enum CisSecurityLevel {
  level_1,
  level_2,
}

extension CisSecurityLevelValueExtension on CisSecurityLevel {
  String toValue() {
    switch (this) {
      case CisSecurityLevel.level_1:
        return 'LEVEL_1';
      case CisSecurityLevel.level_2:
        return 'LEVEL_2';
    }
  }
}

extension CisSecurityLevelFromString on String {
  CisSecurityLevel toCisSecurityLevel() {
    switch (this) {
      case 'LEVEL_1':
        return CisSecurityLevel.level_1;
      case 'LEVEL_2':
        return CisSecurityLevel.level_2;
    }
    throw Exception('$this is not known in enum CisSecurityLevel');
  }
}

enum CisSecurityLevelComparison {
  equals,
}

extension CisSecurityLevelComparisonValueExtension
    on CisSecurityLevelComparison {
  String toValue() {
    switch (this) {
      case CisSecurityLevelComparison.equals:
        return 'EQUALS';
    }
  }
}

extension CisSecurityLevelComparisonFromString on String {
  CisSecurityLevelComparison toCisSecurityLevelComparison() {
    switch (this) {
      case 'EQUALS':
        return CisSecurityLevelComparison.equals;
    }
    throw Exception('$this is not known in enum CisSecurityLevelComparison');
  }
}

/// The CIS security level filter. Security level refers to the Benchmark levels
/// that CIS assigns to a profile.
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
      'comparison': comparison.toValue(),
      'value': value.toValue(),
    };
  }
}

/// The CIS session message.
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
      'status': status.toValue(),
    };
  }
}

enum CisSortOrder {
  asc,
  desc,
}

extension CisSortOrderValueExtension on CisSortOrder {
  String toValue() {
    switch (this) {
      case CisSortOrder.asc:
        return 'ASC';
      case CisSortOrder.desc:
        return 'DESC';
    }
  }
}

extension CisSortOrderFromString on String {
  CisSortOrder toCisSortOrder() {
    switch (this) {
      case 'ASC':
        return CisSortOrder.asc;
      case 'DESC':
        return CisSortOrder.desc;
    }
    throw Exception('$this is not known in enum CisSortOrder');
  }
}

enum CisStringComparison {
  equals,
  prefix,
  notEquals,
}

extension CisStringComparisonValueExtension on CisStringComparison {
  String toValue() {
    switch (this) {
      case CisStringComparison.equals:
        return 'EQUALS';
      case CisStringComparison.prefix:
        return 'PREFIX';
      case CisStringComparison.notEquals:
        return 'NOT_EQUALS';
    }
  }
}

extension CisStringComparisonFromString on String {
  CisStringComparison toCisStringComparison() {
    switch (this) {
      case 'EQUALS':
        return CisStringComparison.equals;
      case 'PREFIX':
        return CisStringComparison.prefix;
      case 'NOT_EQUALS':
        return CisStringComparison.notEquals;
    }
    throw Exception('$this is not known in enum CisStringComparison');
  }
}

/// The CIS string filter.
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
      'comparison': comparison.toValue(),
      'value': value,
    };
  }
}

/// The CIS target resource aggregation.
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
      scanArn: json['scanArn'] as String,
      accountId: json['accountId'] as String?,
      platform: json['platform'] as String?,
      statusCounts: json['statusCounts'] != null
          ? StatusCounts.fromJson(json['statusCounts'] as Map<String, dynamic>)
          : null,
      targetResourceId: json['targetResourceId'] as String?,
      targetResourceTags: (json['targetResourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      targetStatus: (json['targetStatus'] as String?)?.toCisTargetStatus(),
      targetStatusReason:
          (json['targetStatusReason'] as String?)?.toCisTargetStatusReason(),
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
      if (targetStatus != null) 'targetStatus': targetStatus.toValue(),
      if (targetStatusReason != null)
        'targetStatusReason': targetStatusReason.toValue(),
    };
  }
}

enum CisTargetStatus {
  timedOut,
  cancelled,
  completed,
}

extension CisTargetStatusValueExtension on CisTargetStatus {
  String toValue() {
    switch (this) {
      case CisTargetStatus.timedOut:
        return 'TIMED_OUT';
      case CisTargetStatus.cancelled:
        return 'CANCELLED';
      case CisTargetStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension CisTargetStatusFromString on String {
  CisTargetStatus toCisTargetStatus() {
    switch (this) {
      case 'TIMED_OUT':
        return CisTargetStatus.timedOut;
      case 'CANCELLED':
        return CisTargetStatus.cancelled;
      case 'COMPLETED':
        return CisTargetStatus.completed;
    }
    throw Exception('$this is not known in enum CisTargetStatus');
  }
}

enum CisTargetStatusComparison {
  equals,
}

extension CisTargetStatusComparisonValueExtension on CisTargetStatusComparison {
  String toValue() {
    switch (this) {
      case CisTargetStatusComparison.equals:
        return 'EQUALS';
    }
  }
}

extension CisTargetStatusComparisonFromString on String {
  CisTargetStatusComparison toCisTargetStatusComparison() {
    switch (this) {
      case 'EQUALS':
        return CisTargetStatusComparison.equals;
    }
    throw Exception('$this is not known in enum CisTargetStatusComparison');
  }
}

/// The CIS target status filter.
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
      'comparison': comparison.toValue(),
      'value': value.toValue(),
    };
  }
}

enum CisTargetStatusReason {
  scanInProgress,
  unsupportedOs,
  ssmUnmanaged,
}

extension CisTargetStatusReasonValueExtension on CisTargetStatusReason {
  String toValue() {
    switch (this) {
      case CisTargetStatusReason.scanInProgress:
        return 'SCAN_IN_PROGRESS';
      case CisTargetStatusReason.unsupportedOs:
        return 'UNSUPPORTED_OS';
      case CisTargetStatusReason.ssmUnmanaged:
        return 'SSM_UNMANAGED';
    }
  }
}

extension CisTargetStatusReasonFromString on String {
  CisTargetStatusReason toCisTargetStatusReason() {
    switch (this) {
      case 'SCAN_IN_PROGRESS':
        return CisTargetStatusReason.scanInProgress;
      case 'UNSUPPORTED_OS':
        return CisTargetStatusReason.unsupportedOs;
      case 'SSM_UNMANAGED':
        return CisTargetStatusReason.ssmUnmanaged;
    }
    throw Exception('$this is not known in enum CisTargetStatusReason');
  }
}

/// The CIS target status reason filter.
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
      'comparison': comparison.toValue(),
      'value': value.toValue(),
    };
  }
}

/// The CIS targets.
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      targetResourceTags: (json['targetResourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
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

/// The Cybersecurity and Infrastructure Security Agency (CISA) details for a
/// specific vulnerability.
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

/// Contains information on where a code vulnerability is located in your Lambda
/// function.
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
      endLine: json['endLine'] as int,
      fileName: json['fileName'] as String,
      filePath: json['filePath'] as String,
      startLine: json['startLine'] as int,
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

/// Contains information on the lines of code associated with a code snippet.
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
      content: json['content'] as String,
      lineNumber: json['lineNumber'] as int,
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

/// Contains information about any errors encountered while trying to retrieve a
/// code snippet.
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
      errorCode: (json['errorCode'] as String).toCodeSnippetErrorCode(),
      errorMessage: json['errorMessage'] as String,
      findingArn: json['findingArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final findingArn = this.findingArn;
    return {
      'errorCode': errorCode.toValue(),
      'errorMessage': errorMessage,
      'findingArn': findingArn,
    };
  }
}

enum CodeSnippetErrorCode {
  internalError,
  accessDenied,
  codeSnippetNotFound,
  invalidInput,
}

extension CodeSnippetErrorCodeValueExtension on CodeSnippetErrorCode {
  String toValue() {
    switch (this) {
      case CodeSnippetErrorCode.internalError:
        return 'INTERNAL_ERROR';
      case CodeSnippetErrorCode.accessDenied:
        return 'ACCESS_DENIED';
      case CodeSnippetErrorCode.codeSnippetNotFound:
        return 'CODE_SNIPPET_NOT_FOUND';
      case CodeSnippetErrorCode.invalidInput:
        return 'INVALID_INPUT';
    }
  }
}

extension CodeSnippetErrorCodeFromString on String {
  CodeSnippetErrorCode toCodeSnippetErrorCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return CodeSnippetErrorCode.internalError;
      case 'ACCESS_DENIED':
        return CodeSnippetErrorCode.accessDenied;
      case 'CODE_SNIPPET_NOT_FOUND':
        return CodeSnippetErrorCode.codeSnippetNotFound;
      case 'INVALID_INPUT':
        return CodeSnippetErrorCode.invalidInput;
    }
    throw Exception('$this is not known in enum CodeSnippetErrorCode');
  }
}

/// Contains information on a code snippet retrieved by Amazon Inspector from a
/// code vulnerability finding.
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
          ?.whereNotNull()
          .map((e) => CodeLine.fromJson(e as Map<String, dynamic>))
          .toList(),
      endLine: json['endLine'] as int?,
      findingArn: json['findingArn'] as String?,
      startLine: json['startLine'] as int?,
      suggestedFixes: (json['suggestedFixes'] as List?)
          ?.whereNotNull()
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

/// Contains information on the code vulnerability identified in your Lambda
/// function.
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
      cwes: (json['cwes'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      detectorId: json['detectorId'] as String,
      detectorName: json['detectorName'] as String,
      filePath: CodeFilePath.fromJson(json['filePath'] as Map<String, dynamic>),
      detectorTags: (json['detectorTags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      referenceUrls: (json['referenceUrls'] as List?)
          ?.whereNotNull()
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

/// A compute platform.
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

/// a structure that contains information on the count of resources within a
/// group.
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
      groupKey: (json['groupKey'] as String?)?.toGroupKey(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final groupKey = this.groupKey;
    return {
      if (count != null) 'count': count,
      if (groupKey != null) 'groupKey': groupKey.toValue(),
    };
  }
}

/// Contains details of a coverage date filter.
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

/// A structure that identifies filter criteria for
/// <code>GetCoverageStatistics</code>.
class CoverageFilterCriteria {
  /// An array of Amazon Web Services account IDs to return coverage statistics
  /// for.
  final List<CoverageStringFilter>? accountId;

  /// The Amazon EC2 instance tags to filter on.
  final List<CoverageMapFilter>? ec2InstanceTags;

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

  /// An array of Amazon Web Services resource IDs to return coverage statistics
  /// for.
  final List<CoverageStringFilter>? resourceId;

  /// An array of Amazon Web Services resource types to return coverage statistics
  /// for. The values can be <code>AWS_EC2_INSTANCE</code>,
  /// <code>AWS_LAMBDA_FUNCTION</code>, <code>AWS_ECR_CONTAINER_IMAGE</code>,
  /// <code>AWS_ECR_REPOSITORY</code> or <code>AWS_ACCOUNT</code>.
  final List<CoverageStringFilter>? resourceType;

  /// The filter to search for Amazon EC2 instance coverage by scan mode. Valid
  /// values are <code>EC2_SSM_AGENT_BASED</code> and <code>EC2_HYBRID</code>.
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
    this.ec2InstanceTags,
    this.ecrImageTags,
    this.ecrRepositoryName,
    this.imagePulledAt,
    this.lambdaFunctionName,
    this.lambdaFunctionRuntime,
    this.lambdaFunctionTags,
    this.lastScannedAt,
    this.resourceId,
    this.resourceType,
    this.scanMode,
    this.scanStatusCode,
    this.scanStatusReason,
    this.scanType,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final ec2InstanceTags = this.ec2InstanceTags;
    final ecrImageTags = this.ecrImageTags;
    final ecrRepositoryName = this.ecrRepositoryName;
    final imagePulledAt = this.imagePulledAt;
    final lambdaFunctionName = this.lambdaFunctionName;
    final lambdaFunctionRuntime = this.lambdaFunctionRuntime;
    final lambdaFunctionTags = this.lambdaFunctionTags;
    final lastScannedAt = this.lastScannedAt;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final scanMode = this.scanMode;
    final scanStatusCode = this.scanStatusCode;
    final scanStatusReason = this.scanStatusReason;
    final scanType = this.scanType;
    return {
      if (accountId != null) 'accountId': accountId,
      if (ec2InstanceTags != null) 'ec2InstanceTags': ec2InstanceTags,
      if (ecrImageTags != null) 'ecrImageTags': ecrImageTags,
      if (ecrRepositoryName != null) 'ecrRepositoryName': ecrRepositoryName,
      if (imagePulledAt != null) 'imagePulledAt': imagePulledAt,
      if (lambdaFunctionName != null) 'lambdaFunctionName': lambdaFunctionName,
      if (lambdaFunctionRuntime != null)
        'lambdaFunctionRuntime': lambdaFunctionRuntime,
      if (lambdaFunctionTags != null) 'lambdaFunctionTags': lambdaFunctionTags,
      if (lastScannedAt != null) 'lastScannedAt': lastScannedAt,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceType != null) 'resourceType': resourceType,
      if (scanMode != null) 'scanMode': scanMode,
      if (scanStatusCode != null) 'scanStatusCode': scanStatusCode,
      if (scanStatusReason != null) 'scanStatusReason': scanStatusReason,
      if (scanType != null) 'scanType': scanType,
    };
  }
}

enum CoverageMapComparison {
  equals,
}

extension CoverageMapComparisonValueExtension on CoverageMapComparison {
  String toValue() {
    switch (this) {
      case CoverageMapComparison.equals:
        return 'EQUALS';
    }
  }
}

extension CoverageMapComparisonFromString on String {
  CoverageMapComparison toCoverageMapComparison() {
    switch (this) {
      case 'EQUALS':
        return CoverageMapComparison.equals;
    }
    throw Exception('$this is not known in enum CoverageMapComparison');
  }
}

/// Contains details of a coverage map filter.
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
      'comparison': comparison.toValue(),
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

enum CoverageResourceType {
  awsEc2Instance,
  awsEcrContainerImage,
  awsEcrRepository,
  awsLambdaFunction,
}

extension CoverageResourceTypeValueExtension on CoverageResourceType {
  String toValue() {
    switch (this) {
      case CoverageResourceType.awsEc2Instance:
        return 'AWS_EC2_INSTANCE';
      case CoverageResourceType.awsEcrContainerImage:
        return 'AWS_ECR_CONTAINER_IMAGE';
      case CoverageResourceType.awsEcrRepository:
        return 'AWS_ECR_REPOSITORY';
      case CoverageResourceType.awsLambdaFunction:
        return 'AWS_LAMBDA_FUNCTION';
    }
  }
}

extension CoverageResourceTypeFromString on String {
  CoverageResourceType toCoverageResourceType() {
    switch (this) {
      case 'AWS_EC2_INSTANCE':
        return CoverageResourceType.awsEc2Instance;
      case 'AWS_ECR_CONTAINER_IMAGE':
        return CoverageResourceType.awsEcrContainerImage;
      case 'AWS_ECR_REPOSITORY':
        return CoverageResourceType.awsEcrRepository;
      case 'AWS_LAMBDA_FUNCTION':
        return CoverageResourceType.awsLambdaFunction;
    }
    throw Exception('$this is not known in enum CoverageResourceType');
  }
}

enum CoverageStringComparison {
  equals,
  notEquals,
}

extension CoverageStringComparisonValueExtension on CoverageStringComparison {
  String toValue() {
    switch (this) {
      case CoverageStringComparison.equals:
        return 'EQUALS';
      case CoverageStringComparison.notEquals:
        return 'NOT_EQUALS';
    }
  }
}

extension CoverageStringComparisonFromString on String {
  CoverageStringComparison toCoverageStringComparison() {
    switch (this) {
      case 'EQUALS':
        return CoverageStringComparison.equals;
      case 'NOT_EQUALS':
        return CoverageStringComparison.notEquals;
    }
    throw Exception('$this is not known in enum CoverageStringComparison');
  }
}

/// Contains details of a coverage string filter.
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
      'comparison': comparison.toValue(),
      'value': value,
    };
  }
}

/// An object that contains details about a resource covered by Amazon
/// Inspector.
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
      accountId: json['accountId'] as String,
      resourceId: json['resourceId'] as String,
      resourceType: (json['resourceType'] as String).toCoverageResourceType(),
      scanType: (json['scanType'] as String).toScanType(),
      lastScannedAt: timeStampFromJson(json['lastScannedAt']),
      resourceMetadata: json['resourceMetadata'] != null
          ? ResourceScanMetadata.fromJson(
              json['resourceMetadata'] as Map<String, dynamic>)
          : null,
      scanMode: (json['scanMode'] as String?)?.toScanMode(),
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
      'resourceType': resourceType.toValue(),
      'scanType': scanType.toValue(),
      if (lastScannedAt != null)
        'lastScannedAt': unixTimestampToJson(lastScannedAt),
      if (resourceMetadata != null) 'resourceMetadata': resourceMetadata,
      if (scanMode != null) 'scanMode': scanMode.toValue(),
      if (scanStatus != null) 'scanStatus': scanStatus,
    };
  }
}

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

/// Creates CIS targets.
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

class CreateFilterResponse {
  /// The Amazon Resource Number (ARN) of the successfully created filter.
  final String arn;

  CreateFilterResponse({
    required this.arn,
  });

  factory CreateFilterResponse.fromJson(Map<String, dynamic> json) {
    return CreateFilterResponse(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

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

enum Currency {
  usd,
}

extension CurrencyValueExtension on Currency {
  String toValue() {
    switch (this) {
      case Currency.usd:
        return 'USD';
    }
  }
}

extension CurrencyFromString on String {
  Currency toCurrency() {
    switch (this) {
      case 'USD':
        return Currency.usd;
    }
    throw Exception('$this is not known in enum Currency');
  }
}

/// The Common Vulnerability Scoring System (CVSS) version 2 details for the
/// vulnerability.
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
      baseScore: json['baseScore'] as double?,
      scoringVector: json['scoringVector'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseScore = this.baseScore;
    final scoringVector = this.scoringVector;
    return {
      if (baseScore != null) 'baseScore': baseScore,
      if (scoringVector != null) 'scoringVector': scoringVector,
    };
  }
}

/// The Common Vulnerability Scoring System (CVSS) version 3 details for the
/// vulnerability.
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
      baseScore: json['baseScore'] as double?,
      scoringVector: json['scoringVector'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseScore = this.baseScore;
    final scoringVector = this.scoringVector;
    return {
      if (baseScore != null) 'baseScore': baseScore,
      if (scoringVector != null) 'scoringVector': scoringVector,
    };
  }
}

/// The CVSS score for a finding.
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
      baseScore: json['baseScore'] as double,
      scoringVector: json['scoringVector'] as String,
      source: json['source'] as String,
      version: json['version'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final baseScore = this.baseScore;
    final scoringVector = this.scoringVector;
    final source = this.source;
    final version = this.version;
    return {
      'baseScore': baseScore,
      'scoringVector': scoringVector,
      'source': source,
      'version': version,
    };
  }
}

/// Details on adjustments Amazon Inspector made to the CVSS score for a
/// finding.
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
      metric: json['metric'] as String,
      reason: json['reason'] as String,
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

/// Information about the CVSS score.
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
      score: json['score'] as double,
      scoreSource: json['scoreSource'] as String,
      scoringVector: json['scoringVector'] as String,
      version: json['version'] as String,
      adjustments: (json['adjustments'] as List?)
          ?.whereNotNull()
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
      'score': score,
      'scoreSource': scoreSource,
      'scoringVector': scoringVector,
      'version': version,
      if (adjustments != null) 'adjustments': adjustments,
      if (cvssSource != null) 'cvssSource': cvssSource,
    };
  }
}

/// A daily schedule.
class DailySchedule {
  /// The schedule start time.
  final Time startTime;

  DailySchedule({
    required this.startTime,
  });

  factory DailySchedule.fromJson(Map<String, dynamic> json) {
    return DailySchedule(
      startTime: Time.fromJson(json['startTime'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final startTime = this.startTime;
    return {
      'startTime': startTime,
    };
  }
}

/// Contains details on the time range used to filter findings.
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

enum Day {
  sun,
  mon,
  tue,
  wed,
  thu,
  fri,
  sat,
}

extension DayValueExtension on Day {
  String toValue() {
    switch (this) {
      case Day.sun:
        return 'SUN';
      case Day.mon:
        return 'MON';
      case Day.tue:
        return 'TUE';
      case Day.wed:
        return 'WED';
      case Day.thu:
        return 'THU';
      case Day.fri:
        return 'FRI';
      case Day.sat:
        return 'SAT';
    }
  }
}

extension DayFromString on String {
  Day toDay() {
    switch (this) {
      case 'SUN':
        return Day.sun;
      case 'MON':
        return Day.mon;
      case 'TUE':
        return Day.tue;
      case 'WED':
        return Day.wed;
      case 'THU':
        return Day.thu;
      case 'FRI':
        return Day.fri;
      case 'SAT':
        return Day.sat;
    }
    throw Exception('$this is not known in enum Day');
  }
}

/// Details of the Amazon Inspector delegated administrator for your
/// organization.
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
      relationshipStatus:
          (json['relationshipStatus'] as String?)?.toRelationshipStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final relationshipStatus = this.relationshipStatus;
    return {
      if (accountId != null) 'accountId': accountId,
      if (relationshipStatus != null)
        'relationshipStatus': relationshipStatus.toValue(),
    };
  }
}

/// Details of the Amazon Inspector delegated administrator for your
/// organization.
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
      status: (json['status'] as String?)?.toDelegatedAdminStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final status = this.status;
    return {
      if (accountId != null) 'accountId': accountId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum DelegatedAdminStatus {
  enabled,
  disableInProgress,
}

extension DelegatedAdminStatusValueExtension on DelegatedAdminStatus {
  String toValue() {
    switch (this) {
      case DelegatedAdminStatus.enabled:
        return 'ENABLED';
      case DelegatedAdminStatus.disableInProgress:
        return 'DISABLE_IN_PROGRESS';
    }
  }
}

extension DelegatedAdminStatusFromString on String {
  DelegatedAdminStatus toDelegatedAdminStatus() {
    switch (this) {
      case 'ENABLED':
        return DelegatedAdminStatus.enabled;
      case 'DISABLE_IN_PROGRESS':
        return DelegatedAdminStatus.disableInProgress;
    }
    throw Exception('$this is not known in enum DelegatedAdminStatus');
  }
}

class DeleteCisScanConfigurationResponse {
  /// The ARN of the CIS scan configuration.
  final String scanConfigurationArn;

  DeleteCisScanConfigurationResponse({
    required this.scanConfigurationArn,
  });

  factory DeleteCisScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteCisScanConfigurationResponse(
      scanConfigurationArn: json['scanConfigurationArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

class DeleteFilterResponse {
  /// The Amazon Resource Number (ARN) of the filter that has been deleted.
  final String arn;

  DeleteFilterResponse({
    required this.arn,
  });

  factory DeleteFilterResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFilterResponse(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

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

/// Contains details of the Amazon S3 bucket and KMS key used to export
/// findings.
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
      bucketName: json['bucketName'] as String,
      kmsKeyArn: json['kmsKeyArn'] as String,
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
      delegatedAdminAccountId: json['delegatedAdminAccountId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final delegatedAdminAccountId = this.delegatedAdminAccountId;
    return {
      'delegatedAdminAccountId': delegatedAdminAccountId,
    };
  }
}

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
      accounts: (json['accounts'] as List)
          .whereNotNull()
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedAccounts: (json['failedAccounts'] as List?)
          ?.whereNotNull()
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

class DisassociateMemberResponse {
  /// The Amazon Web Services account ID of the successfully disassociated member.
  final String accountId;

  DisassociateMemberResponse({
    required this.accountId,
  });

  factory DisassociateMemberResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateMemberResponse(
      accountId: json['accountId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      'accountId': accountId,
    };
  }
}

/// Enables agent-based scanning, which scans instances that are not managed by
/// SSM.
class Ec2Configuration {
  /// The scan method that is applied to the instance.
  final Ec2ScanMode scanMode;

  Ec2Configuration({
    required this.scanMode,
  });

  Map<String, dynamic> toJson() {
    final scanMode = this.scanMode;
    return {
      'scanMode': scanMode.toValue(),
    };
  }
}

/// Details about the state of the EC2 scan configuration for your environment.
class Ec2ConfigurationState {
  /// An object that contains details about the state of the Amazon EC2 scan mode.
  final Ec2ScanModeState? scanModeState;

  Ec2ConfigurationState({
    this.scanModeState,
  });

  factory Ec2ConfigurationState.fromJson(Map<String, dynamic> json) {
    return Ec2ConfigurationState(
      scanModeState: json['scanModeState'] != null
          ? Ec2ScanModeState.fromJson(
              json['scanModeState'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scanModeState = this.scanModeState;
    return {
      if (scanModeState != null) 'scanModeState': scanModeState,
    };
  }
}

enum Ec2DeepInspectionStatus {
  activated,
  deactivated,
  pending,
  failed,
}

extension Ec2DeepInspectionStatusValueExtension on Ec2DeepInspectionStatus {
  String toValue() {
    switch (this) {
      case Ec2DeepInspectionStatus.activated:
        return 'ACTIVATED';
      case Ec2DeepInspectionStatus.deactivated:
        return 'DEACTIVATED';
      case Ec2DeepInspectionStatus.pending:
        return 'PENDING';
      case Ec2DeepInspectionStatus.failed:
        return 'FAILED';
    }
  }
}

extension Ec2DeepInspectionStatusFromString on String {
  Ec2DeepInspectionStatus toEc2DeepInspectionStatus() {
    switch (this) {
      case 'ACTIVATED':
        return Ec2DeepInspectionStatus.activated;
      case 'DEACTIVATED':
        return Ec2DeepInspectionStatus.deactivated;
      case 'PENDING':
        return Ec2DeepInspectionStatus.pending;
      case 'FAILED':
        return Ec2DeepInspectionStatus.failed;
    }
    throw Exception('$this is not known in enum Ec2DeepInspectionStatus');
  }
}

/// The details that define an aggregation based on Amazon EC2 instances.
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

/// A response that contains the results of a finding aggregation by Amazon EC2
/// instance.
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
      instanceId: json['instanceId'] as String,
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

enum Ec2InstanceSortBy {
  networkFindings,
  critical,
  high,
  all,
}

extension Ec2InstanceSortByValueExtension on Ec2InstanceSortBy {
  String toValue() {
    switch (this) {
      case Ec2InstanceSortBy.networkFindings:
        return 'NETWORK_FINDINGS';
      case Ec2InstanceSortBy.critical:
        return 'CRITICAL';
      case Ec2InstanceSortBy.high:
        return 'HIGH';
      case Ec2InstanceSortBy.all:
        return 'ALL';
    }
  }
}

extension Ec2InstanceSortByFromString on String {
  Ec2InstanceSortBy toEc2InstanceSortBy() {
    switch (this) {
      case 'NETWORK_FINDINGS':
        return Ec2InstanceSortBy.networkFindings;
      case 'CRITICAL':
        return Ec2InstanceSortBy.critical;
      case 'HIGH':
        return Ec2InstanceSortBy.high;
      case 'ALL':
        return Ec2InstanceSortBy.all;
    }
    throw Exception('$this is not known in enum Ec2InstanceSortBy');
  }
}

/// Meta data details of an Amazon EC2 instance.
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
      platform: (json['platform'] as String?)?.toEc2Platform(),
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
      if (platform != null) 'platform': platform.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

enum Ec2Platform {
  windows,
  linux,
  unknown,
  macos,
}

extension Ec2PlatformValueExtension on Ec2Platform {
  String toValue() {
    switch (this) {
      case Ec2Platform.windows:
        return 'WINDOWS';
      case Ec2Platform.linux:
        return 'LINUX';
      case Ec2Platform.unknown:
        return 'UNKNOWN';
      case Ec2Platform.macos:
        return 'MACOS';
    }
  }
}

extension Ec2PlatformFromString on String {
  Ec2Platform toEc2Platform() {
    switch (this) {
      case 'WINDOWS':
        return Ec2Platform.windows;
      case 'LINUX':
        return Ec2Platform.linux;
      case 'UNKNOWN':
        return Ec2Platform.unknown;
      case 'MACOS':
        return Ec2Platform.macos;
    }
    throw Exception('$this is not known in enum Ec2Platform');
  }
}

enum Ec2ScanMode {
  ec2SsmAgentBased,
  ec2Hybrid,
}

extension Ec2ScanModeValueExtension on Ec2ScanMode {
  String toValue() {
    switch (this) {
      case Ec2ScanMode.ec2SsmAgentBased:
        return 'EC2_SSM_AGENT_BASED';
      case Ec2ScanMode.ec2Hybrid:
        return 'EC2_HYBRID';
    }
  }
}

extension Ec2ScanModeFromString on String {
  Ec2ScanMode toEc2ScanMode() {
    switch (this) {
      case 'EC2_SSM_AGENT_BASED':
        return Ec2ScanMode.ec2SsmAgentBased;
      case 'EC2_HYBRID':
        return Ec2ScanMode.ec2Hybrid;
    }
    throw Exception('$this is not known in enum Ec2ScanMode');
  }
}

/// The state of your Amazon EC2 scan mode configuration.
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
      scanMode: (json['scanMode'] as String?)?.toEc2ScanMode(),
      scanModeStatus:
          (json['scanModeStatus'] as String?)?.toEc2ScanModeStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final scanMode = this.scanMode;
    final scanModeStatus = this.scanModeStatus;
    return {
      if (scanMode != null) 'scanMode': scanMode.toValue(),
      if (scanModeStatus != null) 'scanModeStatus': scanModeStatus.toValue(),
    };
  }
}

enum Ec2ScanModeStatus {
  success,
  pending,
}

extension Ec2ScanModeStatusValueExtension on Ec2ScanModeStatus {
  String toValue() {
    switch (this) {
      case Ec2ScanModeStatus.success:
        return 'SUCCESS';
      case Ec2ScanModeStatus.pending:
        return 'PENDING';
    }
  }
}

extension Ec2ScanModeStatusFromString on String {
  Ec2ScanModeStatus toEc2ScanModeStatus() {
    switch (this) {
      case 'SUCCESS':
        return Ec2ScanModeStatus.success;
      case 'PENDING':
        return Ec2ScanModeStatus.pending;
    }
    throw Exception('$this is not known in enum Ec2ScanModeStatus');
  }
}

/// Details about the ECR automated re-scan duration setting for your
/// environment.
class EcrConfiguration {
  /// The rescan duration configured for image push date.
  final EcrRescanDuration rescanDuration;

  /// The rescan duration configured for image pull date.
  final EcrPullDateRescanDuration? pullDateRescanDuration;

  EcrConfiguration({
    required this.rescanDuration,
    this.pullDateRescanDuration,
  });

  Map<String, dynamic> toJson() {
    final rescanDuration = this.rescanDuration;
    final pullDateRescanDuration = this.pullDateRescanDuration;
    return {
      'rescanDuration': rescanDuration.toValue(),
      if (pullDateRescanDuration != null)
        'pullDateRescanDuration': pullDateRescanDuration.toValue(),
    };
  }
}

/// Details about the state of the ECR scans for your environment.
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

/// Information on the Amazon ECR image metadata associated with a finding.
class EcrContainerImageMetadata {
  /// The date an image was last pulled at.
  final DateTime? imagePulledAt;

  /// Tags associated with the Amazon ECR image metadata.
  final List<String>? tags;

  EcrContainerImageMetadata({
    this.imagePulledAt,
    this.tags,
  });

  factory EcrContainerImageMetadata.fromJson(Map<String, dynamic> json) {
    return EcrContainerImageMetadata(
      imagePulledAt: timeStampFromJson(json['imagePulledAt']),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final imagePulledAt = this.imagePulledAt;
    final tags = this.tags;
    return {
      if (imagePulledAt != null)
        'imagePulledAt': unixTimestampToJson(imagePulledAt),
      if (tags != null) 'tags': tags,
    };
  }
}

enum EcrPullDateRescanDuration {
  days_14,
  days_30,
  days_60,
  days_90,
  days_180,
}

extension EcrPullDateRescanDurationValueExtension on EcrPullDateRescanDuration {
  String toValue() {
    switch (this) {
      case EcrPullDateRescanDuration.days_14:
        return 'DAYS_14';
      case EcrPullDateRescanDuration.days_30:
        return 'DAYS_30';
      case EcrPullDateRescanDuration.days_60:
        return 'DAYS_60';
      case EcrPullDateRescanDuration.days_90:
        return 'DAYS_90';
      case EcrPullDateRescanDuration.days_180:
        return 'DAYS_180';
    }
  }
}

extension EcrPullDateRescanDurationFromString on String {
  EcrPullDateRescanDuration toEcrPullDateRescanDuration() {
    switch (this) {
      case 'DAYS_14':
        return EcrPullDateRescanDuration.days_14;
      case 'DAYS_30':
        return EcrPullDateRescanDuration.days_30;
      case 'DAYS_60':
        return EcrPullDateRescanDuration.days_60;
      case 'DAYS_90':
        return EcrPullDateRescanDuration.days_90;
      case 'DAYS_180':
        return EcrPullDateRescanDuration.days_180;
    }
    throw Exception('$this is not known in enum EcrPullDateRescanDuration');
  }
}

/// Information on the Amazon ECR repository metadata associated with a finding.
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
      scanFrequency: (json['scanFrequency'] as String?)?.toEcrScanFrequency(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final scanFrequency = this.scanFrequency;
    return {
      if (name != null) 'name': name,
      if (scanFrequency != null) 'scanFrequency': scanFrequency.toValue(),
    };
  }
}

enum EcrRescanDuration {
  lifetime,
  days_30,
  days_180,
  days_14,
  days_60,
  days_90,
}

extension EcrRescanDurationValueExtension on EcrRescanDuration {
  String toValue() {
    switch (this) {
      case EcrRescanDuration.lifetime:
        return 'LIFETIME';
      case EcrRescanDuration.days_30:
        return 'DAYS_30';
      case EcrRescanDuration.days_180:
        return 'DAYS_180';
      case EcrRescanDuration.days_14:
        return 'DAYS_14';
      case EcrRescanDuration.days_60:
        return 'DAYS_60';
      case EcrRescanDuration.days_90:
        return 'DAYS_90';
    }
  }
}

extension EcrRescanDurationFromString on String {
  EcrRescanDuration toEcrRescanDuration() {
    switch (this) {
      case 'LIFETIME':
        return EcrRescanDuration.lifetime;
      case 'DAYS_30':
        return EcrRescanDuration.days_30;
      case 'DAYS_180':
        return EcrRescanDuration.days_180;
      case 'DAYS_14':
        return EcrRescanDuration.days_14;
      case 'DAYS_60':
        return EcrRescanDuration.days_60;
      case 'DAYS_90':
        return EcrRescanDuration.days_90;
    }
    throw Exception('$this is not known in enum EcrRescanDuration');
  }
}

/// Details about the state of your ECR re-scan duration settings. The ECR
/// re-scan duration defines how long an ECR image will be actively scanned by
/// Amazon Inspector. When the number of days since an image was last pushed
/// exceeds the duration configured for image pull date, and the duration
/// configured for image pull date, the monitoring state of that image becomes
/// <code>inactive</code> and all associated findings are scheduled for closure.
class EcrRescanDurationState {
  /// The rescan duration configured for image pull date.
  final EcrPullDateRescanDuration? pullDateRescanDuration;

  /// The rescan duration configured for image push date. <pre><code> &lt;/p&gt;
  /// </code></pre>
  final EcrRescanDuration? rescanDuration;

  /// The status of changes to the ECR automated re-scan duration.
  final EcrRescanDurationStatus? status;

  /// A timestamp representing when the last time the ECR scan duration setting
  /// was changed.
  final DateTime? updatedAt;

  EcrRescanDurationState({
    this.pullDateRescanDuration,
    this.rescanDuration,
    this.status,
    this.updatedAt,
  });

  factory EcrRescanDurationState.fromJson(Map<String, dynamic> json) {
    return EcrRescanDurationState(
      pullDateRescanDuration: (json['pullDateRescanDuration'] as String?)
          ?.toEcrPullDateRescanDuration(),
      rescanDuration:
          (json['rescanDuration'] as String?)?.toEcrRescanDuration(),
      status: (json['status'] as String?)?.toEcrRescanDurationStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final pullDateRescanDuration = this.pullDateRescanDuration;
    final rescanDuration = this.rescanDuration;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (pullDateRescanDuration != null)
        'pullDateRescanDuration': pullDateRescanDuration.toValue(),
      if (rescanDuration != null) 'rescanDuration': rescanDuration.toValue(),
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum EcrRescanDurationStatus {
  success,
  pending,
  failed,
}

extension EcrRescanDurationStatusValueExtension on EcrRescanDurationStatus {
  String toValue() {
    switch (this) {
      case EcrRescanDurationStatus.success:
        return 'SUCCESS';
      case EcrRescanDurationStatus.pending:
        return 'PENDING';
      case EcrRescanDurationStatus.failed:
        return 'FAILED';
    }
  }
}

extension EcrRescanDurationStatusFromString on String {
  EcrRescanDurationStatus toEcrRescanDurationStatus() {
    switch (this) {
      case 'SUCCESS':
        return EcrRescanDurationStatus.success;
      case 'PENDING':
        return EcrRescanDurationStatus.pending;
      case 'FAILED':
        return EcrRescanDurationStatus.failed;
    }
    throw Exception('$this is not known in enum EcrRescanDurationStatus');
  }
}

enum EcrScanFrequency {
  manual,
  scanOnPush,
  continuousScan,
}

extension EcrScanFrequencyValueExtension on EcrScanFrequency {
  String toValue() {
    switch (this) {
      case EcrScanFrequency.manual:
        return 'MANUAL';
      case EcrScanFrequency.scanOnPush:
        return 'SCAN_ON_PUSH';
      case EcrScanFrequency.continuousScan:
        return 'CONTINUOUS_SCAN';
    }
  }
}

extension EcrScanFrequencyFromString on String {
  EcrScanFrequency toEcrScanFrequency() {
    switch (this) {
      case 'MANUAL':
        return EcrScanFrequency.manual;
      case 'SCAN_ON_PUSH':
        return EcrScanFrequency.scanOnPush;
      case 'CONTINUOUS_SCAN':
        return EcrScanFrequency.continuousScan;
    }
    throw Exception('$this is not known in enum EcrScanFrequency');
  }
}

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
      delegatedAdminAccountId: json['delegatedAdminAccountId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final delegatedAdminAccountId = this.delegatedAdminAccountId;
    return {
      'delegatedAdminAccountId': delegatedAdminAccountId,
    };
  }
}

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
      accounts: (json['accounts'] as List)
          .whereNotNull()
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedAccounts: (json['failedAccounts'] as List?)
          ?.whereNotNull()
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

/// Details about the Exploit Prediction Scoring System (EPSS) score.
class Epss {
  /// The Exploit Prediction Scoring System (EPSS) score.
  final double? score;

  Epss({
    this.score,
  });

  factory Epss.fromJson(Map<String, dynamic> json) {
    return Epss(
      score: json['score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final score = this.score;
    return {
      if (score != null) 'score': score,
    };
  }
}

/// Details about the Exploit Prediction Scoring System (EPSS) score for a
/// finding.
class EpssDetails {
  /// The EPSS score.
  final double? score;

  EpssDetails({
    this.score,
  });

  factory EpssDetails.fromJson(Map<String, dynamic> json) {
    return EpssDetails(
      score: json['score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final score = this.score;
    return {
      if (score != null) 'score': score,
    };
  }
}

enum ErrorCode {
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
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.alreadyEnabled:
        return 'ALREADY_ENABLED';
      case ErrorCode.enableInProgress:
        return 'ENABLE_IN_PROGRESS';
      case ErrorCode.disableInProgress:
        return 'DISABLE_IN_PROGRESS';
      case ErrorCode.suspendInProgress:
        return 'SUSPEND_IN_PROGRESS';
      case ErrorCode.resourceNotFound:
        return 'RESOURCE_NOT_FOUND';
      case ErrorCode.accessDenied:
        return 'ACCESS_DENIED';
      case ErrorCode.internalError:
        return 'INTERNAL_ERROR';
      case ErrorCode.ssmUnavailable:
        return 'SSM_UNAVAILABLE';
      case ErrorCode.ssmThrottled:
        return 'SSM_THROTTLED';
      case ErrorCode.eventbridgeUnavailable:
        return 'EVENTBRIDGE_UNAVAILABLE';
      case ErrorCode.eventbridgeThrottled:
        return 'EVENTBRIDGE_THROTTLED';
      case ErrorCode.resourceScanNotDisabled:
        return 'RESOURCE_SCAN_NOT_DISABLED';
      case ErrorCode.disassociateAllMembers:
        return 'DISASSOCIATE_ALL_MEMBERS';
      case ErrorCode.accountIsIsolated:
        return 'ACCOUNT_IS_ISOLATED';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'ALREADY_ENABLED':
        return ErrorCode.alreadyEnabled;
      case 'ENABLE_IN_PROGRESS':
        return ErrorCode.enableInProgress;
      case 'DISABLE_IN_PROGRESS':
        return ErrorCode.disableInProgress;
      case 'SUSPEND_IN_PROGRESS':
        return ErrorCode.suspendInProgress;
      case 'RESOURCE_NOT_FOUND':
        return ErrorCode.resourceNotFound;
      case 'ACCESS_DENIED':
        return ErrorCode.accessDenied;
      case 'INTERNAL_ERROR':
        return ErrorCode.internalError;
      case 'SSM_UNAVAILABLE':
        return ErrorCode.ssmUnavailable;
      case 'SSM_THROTTLED':
        return ErrorCode.ssmThrottled;
      case 'EVENTBRIDGE_UNAVAILABLE':
        return ErrorCode.eventbridgeUnavailable;
      case 'EVENTBRIDGE_THROTTLED':
        return ErrorCode.eventbridgeThrottled;
      case 'RESOURCE_SCAN_NOT_DISABLED':
        return ErrorCode.resourceScanNotDisabled;
      case 'DISASSOCIATE_ALL_MEMBERS':
        return ErrorCode.disassociateAllMembers;
      case 'ACCOUNT_IS_ISOLATED':
        return ErrorCode.accountIsIsolated;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Details of the evidence for a vulnerability identified in a finding.
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

enum ExploitAvailable {
  yes,
  no,
}

extension ExploitAvailableValueExtension on ExploitAvailable {
  String toValue() {
    switch (this) {
      case ExploitAvailable.yes:
        return 'YES';
      case ExploitAvailable.no:
        return 'NO';
    }
  }
}

extension ExploitAvailableFromString on String {
  ExploitAvailable toExploitAvailable() {
    switch (this) {
      case 'YES':
        return ExploitAvailable.yes;
      case 'NO':
        return ExploitAvailable.no;
    }
    throw Exception('$this is not known in enum ExploitAvailable');
  }
}

/// Contains information on when this exploit was observed.
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

/// The details of an exploit available for a finding discovered in your
/// environment.
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

enum ExternalReportStatus {
  succeeded,
  inProgress,
  cancelled,
  failed,
}

extension ExternalReportStatusValueExtension on ExternalReportStatus {
  String toValue() {
    switch (this) {
      case ExternalReportStatus.succeeded:
        return 'SUCCEEDED';
      case ExternalReportStatus.inProgress:
        return 'IN_PROGRESS';
      case ExternalReportStatus.cancelled:
        return 'CANCELLED';
      case ExternalReportStatus.failed:
        return 'FAILED';
    }
  }
}

extension ExternalReportStatusFromString on String {
  ExternalReportStatus toExternalReportStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return ExternalReportStatus.succeeded;
      case 'IN_PROGRESS':
        return ExternalReportStatus.inProgress;
      case 'CANCELLED':
        return ExternalReportStatus.cancelled;
      case 'FAILED':
        return ExternalReportStatus.failed;
    }
    throw Exception('$this is not known in enum ExternalReportStatus');
  }
}

/// An object with details on why an account failed to enable Amazon Inspector.
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
      accountId: json['accountId'] as String,
      errorCode: (json['errorCode'] as String).toErrorCode(),
      errorMessage: json['errorMessage'] as String,
      resourceStatus: json['resourceStatus'] != null
          ? ResourceStatus.fromJson(
              json['resourceStatus'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toStatus(),
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
      'errorCode': errorCode.toValue(),
      'errorMessage': errorMessage,
      if (resourceStatus != null) 'resourceStatus': resourceStatus,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// An object that contains details about a member account in your organization
/// that failed to activate Amazon Inspector deep inspection.
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
      accountId: json['accountId'] as String,
      ec2ScanStatus: (json['ec2ScanStatus'] as String?)?.toStatus(),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final ec2ScanStatus = this.ec2ScanStatus;
    final errorMessage = this.errorMessage;
    return {
      'accountId': accountId,
      if (ec2ScanStatus != null) 'ec2ScanStatus': ec2ScanStatus.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// Details about a filter.
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
      action: (json['action'] as String).toFilterAction(),
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      criteria:
          FilterCriteria.fromJson(json['criteria'] as Map<String, dynamic>),
      name: json['name'] as String,
      ownerId: json['ownerId'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
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
      'action': action.toValue(),
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

enum FilterAction {
  none,
  suppress,
}

extension FilterActionValueExtension on FilterAction {
  String toValue() {
    switch (this) {
      case FilterAction.none:
        return 'NONE';
      case FilterAction.suppress:
        return 'SUPPRESS';
    }
  }
}

extension FilterActionFromString on String {
  FilterAction toFilterAction() {
    switch (this) {
      case 'NONE':
        return FilterAction.none;
      case 'SUPPRESS':
        return FilterAction.suppress;
    }
    throw Exception('$this is not known in enum FilterAction');
  }
}

/// Details on the criteria used to define the filter.
class FilterCriteria {
  /// Details of the Amazon Web Services account IDs used to filter findings.
  final List<StringFilter>? awsAccountId;

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
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      codeVulnerabilityDetectorName:
          (json['codeVulnerabilityDetectorName'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      codeVulnerabilityDetectorTags:
          (json['codeVulnerabilityDetectorTags'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      codeVulnerabilityFilePath: (json['codeVulnerabilityFilePath'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      componentId: (json['componentId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      componentType: (json['componentType'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceImageId: (json['ec2InstanceImageId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceSubnetId: (json['ec2InstanceSubnetId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceVpcId: (json['ec2InstanceVpcId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageArchitecture: (json['ecrImageArchitecture'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageHash: (json['ecrImageHash'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImagePushedAt: (json['ecrImagePushedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageRegistry: (json['ecrImageRegistry'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageRepositoryName: (json['ecrImageRepositoryName'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageTags: (json['ecrImageTags'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      epssScore: (json['epssScore'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      exploitAvailable: (json['exploitAvailable'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      findingArn: (json['findingArn'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      findingStatus: (json['findingStatus'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      findingType: (json['findingType'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstObservedAt: (json['firstObservedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      fixAvailable: (json['fixAvailable'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      inspectorScore: (json['inspectorScore'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaFunctionExecutionRoleArn:
          (json['lambdaFunctionExecutionRoleArn'] as List?)
              ?.whereNotNull()
              .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      lambdaFunctionLastModifiedAt:
          (json['lambdaFunctionLastModifiedAt'] as List?)
              ?.whereNotNull()
              .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
              .toList(),
      lambdaFunctionLayers: (json['lambdaFunctionLayers'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaFunctionName: (json['lambdaFunctionName'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaFunctionRuntime: (json['lambdaFunctionRuntime'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastObservedAt: (json['lastObservedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      networkProtocol: (json['networkProtocol'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      portRange: (json['portRange'] as List?)
          ?.whereNotNull()
          .map((e) => PortRangeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedVulnerabilities: (json['relatedVulnerabilities'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceId: (json['resourceId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceTags: (json['resourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => MapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['resourceType'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      severity: (json['severity'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: (json['title'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: (json['updatedAt'] as List?)
          ?.whereNotNull()
          .map((e) => DateFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      vendorSeverity: (json['vendorSeverity'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      vulnerabilityId: (json['vulnerabilityId'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      vulnerabilitySource: (json['vulnerabilitySource'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      vulnerablePackages: (json['vulnerablePackages'] as List?)
          ?.whereNotNull()
          .map((e) => PackageFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
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

/// Details about an Amazon Inspector finding.
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
      awsAccountId: json['awsAccountId'] as String,
      description: json['description'] as String,
      findingArn: json['findingArn'] as String,
      firstObservedAt:
          nonNullableTimeStampFromJson(json['firstObservedAt'] as Object),
      lastObservedAt:
          nonNullableTimeStampFromJson(json['lastObservedAt'] as Object),
      remediation:
          Remediation.fromJson(json['remediation'] as Map<String, dynamic>),
      resources: (json['resources'] as List)
          .whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      severity: (json['severity'] as String).toSeverity(),
      status: (json['status'] as String).toFindingStatus(),
      type: (json['type'] as String).toFindingType(),
      codeVulnerabilityDetails: json['codeVulnerabilityDetails'] != null
          ? CodeVulnerabilityDetails.fromJson(
              json['codeVulnerabilityDetails'] as Map<String, dynamic>)
          : null,
      epss: json['epss'] != null
          ? EpssDetails.fromJson(json['epss'] as Map<String, dynamic>)
          : null,
      exploitAvailable:
          (json['exploitAvailable'] as String?)?.toExploitAvailable(),
      exploitabilityDetails: json['exploitabilityDetails'] != null
          ? ExploitabilityDetails.fromJson(
              json['exploitabilityDetails'] as Map<String, dynamic>)
          : null,
      fixAvailable: (json['fixAvailable'] as String?)?.toFixAvailable(),
      inspectorScore: json['inspectorScore'] as double?,
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
      'severity': severity.toValue(),
      'status': status.toValue(),
      'type': type.toValue(),
      if (codeVulnerabilityDetails != null)
        'codeVulnerabilityDetails': codeVulnerabilityDetails,
      if (epss != null) 'epss': epss,
      if (exploitAvailable != null)
        'exploitAvailable': exploitAvailable.toValue(),
      if (exploitabilityDetails != null)
        'exploitabilityDetails': exploitabilityDetails,
      if (fixAvailable != null) 'fixAvailable': fixAvailable.toValue(),
      if (inspectorScore != null) 'inspectorScore': inspectorScore,
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

/// Details of the vulnerability identified in a finding.
class FindingDetail {
  final CisaData? cisaData;

  /// The Common Weakness Enumerations (CWEs) associated with the vulnerability.
  final List<String>? cwes;

  /// The Exploit Prediction Scoring System (EPSS) score of the vulnerability.
  final double? epssScore;

  /// Information on the evidence of the vulnerability.
  final List<Evidence>? evidences;
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
      cwes: (json['cwes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      epssScore: json['epssScore'] as double?,
      evidences: (json['evidences'] as List?)
          ?.whereNotNull()
          .map((e) => Evidence.fromJson(e as Map<String, dynamic>))
          .toList(),
      exploitObserved: json['exploitObserved'] != null
          ? ExploitObserved.fromJson(
              json['exploitObserved'] as Map<String, dynamic>)
          : null,
      findingArn: json['findingArn'] as String?,
      referenceUrls: (json['referenceUrls'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      riskScore: json['riskScore'] as int?,
      tools: (json['tools'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ttps: (json['ttps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
      if (epssScore != null) 'epssScore': epssScore,
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

/// Details about an error encountered when trying to return vulnerability data
/// for a finding.
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
      errorCode: (json['errorCode'] as String).toFindingDetailsErrorCode(),
      errorMessage: json['errorMessage'] as String,
      findingArn: json['findingArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final findingArn = this.findingArn;
    return {
      'errorCode': errorCode.toValue(),
      'errorMessage': errorMessage,
      'findingArn': findingArn,
    };
  }
}

enum FindingDetailsErrorCode {
  internalError,
  accessDenied,
  findingDetailsNotFound,
  invalidInput,
}

extension FindingDetailsErrorCodeValueExtension on FindingDetailsErrorCode {
  String toValue() {
    switch (this) {
      case FindingDetailsErrorCode.internalError:
        return 'INTERNAL_ERROR';
      case FindingDetailsErrorCode.accessDenied:
        return 'ACCESS_DENIED';
      case FindingDetailsErrorCode.findingDetailsNotFound:
        return 'FINDING_DETAILS_NOT_FOUND';
      case FindingDetailsErrorCode.invalidInput:
        return 'INVALID_INPUT';
    }
  }
}

extension FindingDetailsErrorCodeFromString on String {
  FindingDetailsErrorCode toFindingDetailsErrorCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return FindingDetailsErrorCode.internalError;
      case 'ACCESS_DENIED':
        return FindingDetailsErrorCode.accessDenied;
      case 'FINDING_DETAILS_NOT_FOUND':
        return FindingDetailsErrorCode.findingDetailsNotFound;
      case 'INVALID_INPUT':
        return FindingDetailsErrorCode.invalidInput;
    }
    throw Exception('$this is not known in enum FindingDetailsErrorCode');
  }
}

enum FindingStatus {
  active,
  suppressed,
  closed,
}

extension FindingStatusValueExtension on FindingStatus {
  String toValue() {
    switch (this) {
      case FindingStatus.active:
        return 'ACTIVE';
      case FindingStatus.suppressed:
        return 'SUPPRESSED';
      case FindingStatus.closed:
        return 'CLOSED';
    }
  }
}

extension FindingStatusFromString on String {
  FindingStatus toFindingStatus() {
    switch (this) {
      case 'ACTIVE':
        return FindingStatus.active;
      case 'SUPPRESSED':
        return FindingStatus.suppressed;
      case 'CLOSED':
        return FindingStatus.closed;
    }
    throw Exception('$this is not known in enum FindingStatus');
  }
}

enum FindingType {
  networkReachability,
  packageVulnerability,
  codeVulnerability,
}

extension FindingTypeValueExtension on FindingType {
  String toValue() {
    switch (this) {
      case FindingType.networkReachability:
        return 'NETWORK_REACHABILITY';
      case FindingType.packageVulnerability:
        return 'PACKAGE_VULNERABILITY';
      case FindingType.codeVulnerability:
        return 'CODE_VULNERABILITY';
    }
  }
}

extension FindingTypeFromString on String {
  FindingType toFindingType() {
    switch (this) {
      case 'NETWORK_REACHABILITY':
        return FindingType.networkReachability;
      case 'PACKAGE_VULNERABILITY':
        return FindingType.packageVulnerability;
      case 'CODE_VULNERABILITY':
        return FindingType.codeVulnerability;
    }
    throw Exception('$this is not known in enum FindingType');
  }
}

/// The details that define an aggregation based on finding type.
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
      if (findingType != null) 'findingType': findingType.toValue(),
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

/// A response that contains the results of a finding type aggregation.
class FindingTypeAggregationResponse {
  /// The ID of the Amazon Web Services account associated with the findings.
  final String? accountId;

  /// The value to sort results by.
  final SeverityCounts? severityCounts;

  FindingTypeAggregationResponse({
    this.accountId,
    this.severityCounts,
  });

  factory FindingTypeAggregationResponse.fromJson(Map<String, dynamic> json) {
    return FindingTypeAggregationResponse(
      accountId: json['accountId'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final severityCounts = this.severityCounts;
    return {
      if (accountId != null) 'accountId': accountId,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

enum FindingTypeSortBy {
  critical,
  high,
  all,
}

extension FindingTypeSortByValueExtension on FindingTypeSortBy {
  String toValue() {
    switch (this) {
      case FindingTypeSortBy.critical:
        return 'CRITICAL';
      case FindingTypeSortBy.high:
        return 'HIGH';
      case FindingTypeSortBy.all:
        return 'ALL';
    }
  }
}

extension FindingTypeSortByFromString on String {
  FindingTypeSortBy toFindingTypeSortBy() {
    switch (this) {
      case 'CRITICAL':
        return FindingTypeSortBy.critical;
      case 'HIGH':
        return FindingTypeSortBy.high;
      case 'ALL':
        return FindingTypeSortBy.all;
    }
    throw Exception('$this is not known in enum FindingTypeSortBy');
  }
}

enum FixAvailable {
  yes,
  no,
  partial,
}

extension FixAvailableValueExtension on FixAvailable {
  String toValue() {
    switch (this) {
      case FixAvailable.yes:
        return 'YES';
      case FixAvailable.no:
        return 'NO';
      case FixAvailable.partial:
        return 'PARTIAL';
    }
  }
}

extension FixAvailableFromString on String {
  FixAvailable toFixAvailable() {
    switch (this) {
      case 'YES':
        return FixAvailable.yes;
      case 'NO':
        return FixAvailable.no;
      case 'PARTIAL':
        return FixAvailable.partial;
    }
    throw Exception('$this is not known in enum FixAvailable');
  }
}

/// Information about the Amazon Inspector free trial for an account.
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
      accountId: json['accountId'] as String,
      freeTrialInfo: (json['freeTrialInfo'] as List)
          .whereNotNull()
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
      end: nonNullableTimeStampFromJson(json['end'] as Object),
      start: nonNullableTimeStampFromJson(json['start'] as Object),
      status: (json['status'] as String).toFreeTrialStatus(),
      type: (json['type'] as String).toFreeTrialType(),
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
      'status': status.toValue(),
      'type': type.toValue(),
    };
  }
}

/// Information about an error received while accessing free trail data for an
/// account.
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
      accountId: json['accountId'] as String,
      code: (json['code'] as String).toFreeTrialInfoErrorCode(),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final code = this.code;
    final message = this.message;
    return {
      'accountId': accountId,
      'code': code.toValue(),
      'message': message,
    };
  }
}

enum FreeTrialInfoErrorCode {
  accessDenied,
  internalError,
}

extension FreeTrialInfoErrorCodeValueExtension on FreeTrialInfoErrorCode {
  String toValue() {
    switch (this) {
      case FreeTrialInfoErrorCode.accessDenied:
        return 'ACCESS_DENIED';
      case FreeTrialInfoErrorCode.internalError:
        return 'INTERNAL_ERROR';
    }
  }
}

extension FreeTrialInfoErrorCodeFromString on String {
  FreeTrialInfoErrorCode toFreeTrialInfoErrorCode() {
    switch (this) {
      case 'ACCESS_DENIED':
        return FreeTrialInfoErrorCode.accessDenied;
      case 'INTERNAL_ERROR':
        return FreeTrialInfoErrorCode.internalError;
    }
    throw Exception('$this is not known in enum FreeTrialInfoErrorCode');
  }
}

enum FreeTrialStatus {
  active,
  inactive,
}

extension FreeTrialStatusValueExtension on FreeTrialStatus {
  String toValue() {
    switch (this) {
      case FreeTrialStatus.active:
        return 'ACTIVE';
      case FreeTrialStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension FreeTrialStatusFromString on String {
  FreeTrialStatus toFreeTrialStatus() {
    switch (this) {
      case 'ACTIVE':
        return FreeTrialStatus.active;
      case 'INACTIVE':
        return FreeTrialStatus.inactive;
    }
    throw Exception('$this is not known in enum FreeTrialStatus');
  }
}

enum FreeTrialType {
  ec2,
  ecr,
  lambda,
  lambdaCode,
}

extension FreeTrialTypeValueExtension on FreeTrialType {
  String toValue() {
    switch (this) {
      case FreeTrialType.ec2:
        return 'EC2';
      case FreeTrialType.ecr:
        return 'ECR';
      case FreeTrialType.lambda:
        return 'LAMBDA';
      case FreeTrialType.lambdaCode:
        return 'LAMBDA_CODE';
    }
  }
}

extension FreeTrialTypeFromString on String {
  FreeTrialType toFreeTrialType() {
    switch (this) {
      case 'EC2':
        return FreeTrialType.ec2;
      case 'ECR':
        return FreeTrialType.ecr;
      case 'LAMBDA':
        return FreeTrialType.lambda;
      case 'LAMBDA_CODE':
        return FreeTrialType.lambdaCode;
    }
    throw Exception('$this is not known in enum FreeTrialType');
  }
}

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
      status: (json['status'] as String?)?.toCisReportStatus(),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final url = this.url;
    return {
      if (status != null) 'status': status.toValue(),
      if (url != null) 'url': url,
    };
  }
}

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
          ?.whereNotNull()
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      packagePaths: (json['packagePaths'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.toEc2DeepInspectionStatus(),
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
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetEncryptionKeyResponse {
  /// A kms key ID.
  final String kmsKeyId;

  GetEncryptionKeyResponse({
    required this.kmsKeyId,
  });

  factory GetEncryptionKeyResponse.fromJson(Map<String, dynamic> json) {
    return GetEncryptionKeyResponse(
      kmsKeyId: json['kmsKeyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    return {
      'kmsKeyId': kmsKeyId,
    };
  }
}

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
      errorCode: (json['errorCode'] as String?)?.toReportingErrorCode(),
      errorMessage: json['errorMessage'] as String?,
      filterCriteria: json['filterCriteria'] != null
          ? FilterCriteria.fromJson(
              json['filterCriteria'] as Map<String, dynamic>)
          : null,
      reportId: json['reportId'] as String?,
      status: (json['status'] as String?)?.toExternalReportStatus(),
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
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (reportId != null) 'reportId': reportId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

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
      errorCode: (json['errorCode'] as String?)?.toReportingErrorCode(),
      errorMessage: json['errorMessage'] as String?,
      filterCriteria: json['filterCriteria'] != null
          ? ResourceFilterCriteria.fromJson(
              json['filterCriteria'] as Map<String, dynamic>)
          : null,
      format: (json['format'] as String?)?.toSbomReportFormat(),
      reportId: json['reportId'] as String?,
      s3Destination: json['s3Destination'] != null
          ? Destination.fromJson(json['s3Destination'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toExternalReportStatus(),
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
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (format != null) 'format': format.toValue(),
      if (reportId != null) 'reportId': reportId,
      if (s3Destination != null) 's3Destination': s3Destination,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum GroupKey {
  scanStatusCode,
  scanStatusReason,
  accountId,
  resourceType,
  ecrRepositoryName,
}

extension GroupKeyValueExtension on GroupKey {
  String toValue() {
    switch (this) {
      case GroupKey.scanStatusCode:
        return 'SCAN_STATUS_CODE';
      case GroupKey.scanStatusReason:
        return 'SCAN_STATUS_REASON';
      case GroupKey.accountId:
        return 'ACCOUNT_ID';
      case GroupKey.resourceType:
        return 'RESOURCE_TYPE';
      case GroupKey.ecrRepositoryName:
        return 'ECR_REPOSITORY_NAME';
    }
  }
}

extension GroupKeyFromString on String {
  GroupKey toGroupKey() {
    switch (this) {
      case 'SCAN_STATUS_CODE':
        return GroupKey.scanStatusCode;
      case 'SCAN_STATUS_REASON':
        return GroupKey.scanStatusReason;
      case 'ACCOUNT_ID':
        return GroupKey.accountId;
      case 'RESOURCE_TYPE':
        return GroupKey.resourceType;
      case 'ECR_REPOSITORY_NAME':
        return GroupKey.ecrRepositoryName;
    }
    throw Exception('$this is not known in enum GroupKey');
  }
}

/// The details that define an aggregation based on container image layers.
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

/// A response that contains the results of a finding aggregation by image
/// layer.
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
      accountId: json['accountId'] as String,
      layerHash: json['layerHash'] as String,
      repository: json['repository'] as String,
      resourceId: json['resourceId'] as String,
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

enum ImageLayerSortBy {
  critical,
  high,
  all,
}

extension ImageLayerSortByValueExtension on ImageLayerSortBy {
  String toValue() {
    switch (this) {
      case ImageLayerSortBy.critical:
        return 'CRITICAL';
      case ImageLayerSortBy.high:
        return 'HIGH';
      case ImageLayerSortBy.all:
        return 'ALL';
    }
  }
}

extension ImageLayerSortByFromString on String {
  ImageLayerSortBy toImageLayerSortBy() {
    switch (this) {
      case 'CRITICAL':
        return ImageLayerSortBy.critical;
      case 'HIGH':
        return ImageLayerSortBy.high;
      case 'ALL':
        return ImageLayerSortBy.all;
    }
    throw Exception('$this is not known in enum ImageLayerSortBy');
  }
}

/// Information about the Amazon Inspector score given to a finding.
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

/// The details that define a findings aggregation based on Amazon Web Services
/// Lambda functions.
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

/// A response that contains the results of an Amazon Web Services Lambda
/// function finding aggregation.
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
      resourceId: json['resourceId'] as String,
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

/// The Amazon Web Services Lambda function metadata.
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
      layers: (json['layers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      runtime: (json['runtime'] as String?)?.toRuntime(),
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
      if (runtime != null) 'runtime': runtime.toValue(),
    };
  }
}

enum LambdaFunctionSortBy {
  critical,
  high,
  all,
}

extension LambdaFunctionSortByValueExtension on LambdaFunctionSortBy {
  String toValue() {
    switch (this) {
      case LambdaFunctionSortBy.critical:
        return 'CRITICAL';
      case LambdaFunctionSortBy.high:
        return 'HIGH';
      case LambdaFunctionSortBy.all:
        return 'ALL';
    }
  }
}

extension LambdaFunctionSortByFromString on String {
  LambdaFunctionSortBy toLambdaFunctionSortBy() {
    switch (this) {
      case 'CRITICAL':
        return LambdaFunctionSortBy.critical;
      case 'HIGH':
        return LambdaFunctionSortBy.high;
      case 'ALL':
        return LambdaFunctionSortBy.all;
    }
    throw Exception('$this is not known in enum LambdaFunctionSortBy');
  }
}

/// The details that define a findings aggregation based on an Amazon Web
/// Services Lambda function's layers.
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

/// A response that contains the results of an Amazon Web Services Lambda
/// function layer finding aggregation.
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
      accountId: json['accountId'] as String,
      functionName: json['functionName'] as String,
      layerArn: json['layerArn'] as String,
      resourceId: json['resourceId'] as String,
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

enum LambdaLayerSortBy {
  critical,
  high,
  all,
}

extension LambdaLayerSortByValueExtension on LambdaLayerSortBy {
  String toValue() {
    switch (this) {
      case LambdaLayerSortBy.critical:
        return 'CRITICAL';
      case LambdaLayerSortBy.high:
        return 'HIGH';
      case LambdaLayerSortBy.all:
        return 'ALL';
    }
  }
}

extension LambdaLayerSortByFromString on String {
  LambdaLayerSortBy toLambdaLayerSortBy() {
    switch (this) {
      case 'CRITICAL':
        return LambdaLayerSortBy.critical;
      case 'HIGH':
        return LambdaLayerSortBy.high;
      case 'ALL':
        return LambdaLayerSortBy.all;
    }
    throw Exception('$this is not known in enum LambdaLayerSortBy');
  }
}

/// The VPC security groups and subnets that are attached to an Amazon Web
/// Services Lambda function. For more information, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">VPC
/// Settings</a>.
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
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
      permissions: (json['permissions'] as List)
          .whereNotNull()
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

/// A list of CIS scan configurations filter criteria.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

enum ListCisScansDetailLevel {
  organization,
  member,
}

extension ListCisScansDetailLevelValueExtension on ListCisScansDetailLevel {
  String toValue() {
    switch (this) {
      case ListCisScansDetailLevel.organization:
        return 'ORGANIZATION';
      case ListCisScansDetailLevel.member:
        return 'MEMBER';
    }
  }
}

extension ListCisScansDetailLevelFromString on String {
  ListCisScansDetailLevel toListCisScansDetailLevel() {
    switch (this) {
      case 'ORGANIZATION':
        return ListCisScansDetailLevel.organization;
      case 'MEMBER':
        return ListCisScansDetailLevel.member;
    }
    throw Exception('$this is not known in enum ListCisScansDetailLevel');
  }
}

/// A list of CIS scans filter criteria.
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
          ?.whereNotNull()
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

enum ListCisScansSortBy {
  status,
  scheduledBy,
  scanStartDate,
  failedChecks,
}

extension ListCisScansSortByValueExtension on ListCisScansSortBy {
  String toValue() {
    switch (this) {
      case ListCisScansSortBy.status:
        return 'STATUS';
      case ListCisScansSortBy.scheduledBy:
        return 'SCHEDULED_BY';
      case ListCisScansSortBy.scanStartDate:
        return 'SCAN_START_DATE';
      case ListCisScansSortBy.failedChecks:
        return 'FAILED_CHECKS';
    }
  }
}

extension ListCisScansSortByFromString on String {
  ListCisScansSortBy toListCisScansSortBy() {
    switch (this) {
      case 'STATUS':
        return ListCisScansSortBy.status;
      case 'SCHEDULED_BY':
        return ListCisScansSortBy.scheduledBy;
      case 'SCAN_START_DATE':
        return ListCisScansSortBy.scanStartDate;
      case 'FAILED_CHECKS':
        return ListCisScansSortBy.failedChecks;
    }
    throw Exception('$this is not known in enum ListCisScansSortBy');
  }
}

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
          ?.whereNotNull()
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
      totalCounts: json['totalCounts'] as int,
      countsByGroup: (json['countsByGroup'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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
      filters: (json['filters'] as List)
          .whereNotNull()
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
      aggregationType: (json['aggregationType'] as String).toAggregationType(),
      nextToken: json['nextToken'] as String?,
      responses: (json['responses'] as List?)
          ?.whereNotNull()
          .map((e) => AggregationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationType = this.aggregationType;
    final nextToken = this.nextToken;
    final responses = this.responses;
    return {
      'aggregationType': aggregationType.toValue(),
      if (nextToken != null) 'nextToken': nextToken,
      if (responses != null) 'responses': responses,
    };
  }
}

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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

enum MapComparison {
  equals,
}

extension MapComparisonValueExtension on MapComparison {
  String toValue() {
    switch (this) {
      case MapComparison.equals:
        return 'EQUALS';
    }
  }
}

extension MapComparisonFromString on String {
  MapComparison toMapComparison() {
    switch (this) {
      case 'EQUALS':
        return MapComparison.equals;
    }
    throw Exception('$this is not known in enum MapComparison');
  }
}

/// An object that describes details of a map filter.
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
      comparison: (json['comparison'] as String).toMapComparison(),
      key: json['key'] as String,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final key = this.key;
    final value = this.value;
    return {
      'comparison': comparison.toValue(),
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// Details on a member account in your organization.
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
      relationshipStatus:
          (json['relationshipStatus'] as String?)?.toRelationshipStatus(),
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
        'relationshipStatus': relationshipStatus.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// An object that contains details about the status of Amazon Inspector deep
/// inspection for a member account in your organization.
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

/// An object that contains details about the state of Amazon Inspector deep
/// inspection for a member account.
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
      accountId: json['accountId'] as String,
      errorMessage: json['errorMessage'] as String?,
      status: (json['status'] as String?)?.toEc2DeepInspectionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final errorMessage = this.errorMessage;
    final status = this.status;
    return {
      'accountId': accountId,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// A monthly schedule.
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
      day: (json['day'] as String).toDay(),
      startTime: Time.fromJson(json['startTime'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final day = this.day;
    final startTime = this.startTime;
    return {
      'day': day.toValue(),
      'startTime': startTime,
    };
  }
}

/// Information on the network path associated with a finding.
class NetworkPath {
  /// The details on the steps in the network path.
  final List<Step>? steps;

  NetworkPath({
    this.steps,
  });

  factory NetworkPath.fromJson(Map<String, dynamic> json) {
    return NetworkPath(
      steps: (json['steps'] as List?)
          ?.whereNotNull()
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

enum NetworkProtocol {
  tcp,
  udp,
}

extension NetworkProtocolValueExtension on NetworkProtocol {
  String toValue() {
    switch (this) {
      case NetworkProtocol.tcp:
        return 'TCP';
      case NetworkProtocol.udp:
        return 'UDP';
    }
  }
}

extension NetworkProtocolFromString on String {
  NetworkProtocol toNetworkProtocol() {
    switch (this) {
      case 'TCP':
        return NetworkProtocol.tcp;
      case 'UDP':
        return NetworkProtocol.udp;
    }
    throw Exception('$this is not known in enum NetworkProtocol');
  }
}

/// Contains the details of a network reachability finding.
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
      networkPath:
          NetworkPath.fromJson(json['networkPath'] as Map<String, dynamic>),
      openPortRange:
          PortRange.fromJson(json['openPortRange'] as Map<String, dynamic>),
      protocol: (json['protocol'] as String).toNetworkProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final networkPath = this.networkPath;
    final openPortRange = this.openPortRange;
    final protocol = this.protocol;
    return {
      'networkPath': networkPath,
      'openPortRange': openPortRange,
      'protocol': protocol.toValue(),
    };
  }
}

/// An object that describes the details of a number filter.
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
      lowerInclusive: json['lowerInclusive'] as double?,
      upperInclusive: json['upperInclusive'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final lowerInclusive = this.lowerInclusive;
    final upperInclusive = this.upperInclusive;
    return {
      if (lowerInclusive != null) 'lowerInclusive': lowerInclusive,
      if (upperInclusive != null) 'upperInclusive': upperInclusive,
    };
  }
}

/// A one time schedule.
class OneTimeSchedule {
  OneTimeSchedule();

  factory OneTimeSchedule.fromJson(Map<String, dynamic> _) {
    return OneTimeSchedule();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum Operation {
  enableScanning,
  disableScanning,
  enableRepository,
  disableRepository,
}

extension OperationValueExtension on Operation {
  String toValue() {
    switch (this) {
      case Operation.enableScanning:
        return 'ENABLE_SCANNING';
      case Operation.disableScanning:
        return 'DISABLE_SCANNING';
      case Operation.enableRepository:
        return 'ENABLE_REPOSITORY';
      case Operation.disableRepository:
        return 'DISABLE_REPOSITORY';
    }
  }
}

extension OperationFromString on String {
  Operation toOperation() {
    switch (this) {
      case 'ENABLE_SCANNING':
        return Operation.enableScanning;
      case 'DISABLE_SCANNING':
        return Operation.disableScanning;
      case 'ENABLE_REPOSITORY':
        return Operation.enableRepository;
      case 'DISABLE_REPOSITORY':
        return Operation.disableRepository;
    }
    throw Exception('$this is not known in enum Operation');
  }
}

/// The details that define an aggregation based on operating system package
/// type.
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

/// A response that contains the results of a finding aggregation by image
/// layer.
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
      packageName: json['packageName'] as String,
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

/// Contains information on the details of a package filter.
class PackageFilter {
  /// An object that contains details on the package architecture type to filter
  /// on.
  final StringFilter? architecture;

  /// An object that contains details on the package epoch to filter on.
  final NumberFilter? epoch;

  /// An object that contains details on the name of the package to filter on.
  final StringFilter? name;

  /// An object that contains details on the package release to filter on.
  final StringFilter? release;
  final StringFilter? sourceLambdaLayerArn;

  /// An object that contains details on the source layer hash to filter on.
  final StringFilter? sourceLayerHash;

  /// The package version to filter on.
  final StringFilter? version;

  PackageFilter({
    this.architecture,
    this.epoch,
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
    final name = this.name;
    final release = this.release;
    final sourceLambdaLayerArn = this.sourceLambdaLayerArn;
    final sourceLayerHash = this.sourceLayerHash;
    final version = this.version;
    return {
      if (architecture != null) 'architecture': architecture,
      if (epoch != null) 'epoch': epoch,
      if (name != null) 'name': name,
      if (release != null) 'release': release,
      if (sourceLambdaLayerArn != null)
        'sourceLambdaLayerArn': sourceLambdaLayerArn,
      if (sourceLayerHash != null) 'sourceLayerHash': sourceLayerHash,
      if (version != null) 'version': version,
    };
  }
}

enum PackageManager {
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
}

extension PackageManagerValueExtension on PackageManager {
  String toValue() {
    switch (this) {
      case PackageManager.bundler:
        return 'BUNDLER';
      case PackageManager.cargo:
        return 'CARGO';
      case PackageManager.composer:
        return 'COMPOSER';
      case PackageManager.npm:
        return 'NPM';
      case PackageManager.nuget:
        return 'NUGET';
      case PackageManager.pipenv:
        return 'PIPENV';
      case PackageManager.poetry:
        return 'POETRY';
      case PackageManager.yarn:
        return 'YARN';
      case PackageManager.gobinary:
        return 'GOBINARY';
      case PackageManager.gomod:
        return 'GOMOD';
      case PackageManager.jar:
        return 'JAR';
      case PackageManager.os:
        return 'OS';
      case PackageManager.pip:
        return 'PIP';
      case PackageManager.pythonpkg:
        return 'PYTHONPKG';
      case PackageManager.nodepkg:
        return 'NODEPKG';
      case PackageManager.pom:
        return 'POM';
      case PackageManager.gemspec:
        return 'GEMSPEC';
    }
  }
}

extension PackageManagerFromString on String {
  PackageManager toPackageManager() {
    switch (this) {
      case 'BUNDLER':
        return PackageManager.bundler;
      case 'CARGO':
        return PackageManager.cargo;
      case 'COMPOSER':
        return PackageManager.composer;
      case 'NPM':
        return PackageManager.npm;
      case 'NUGET':
        return PackageManager.nuget;
      case 'PIPENV':
        return PackageManager.pipenv;
      case 'POETRY':
        return PackageManager.poetry;
      case 'YARN':
        return PackageManager.yarn;
      case 'GOBINARY':
        return PackageManager.gobinary;
      case 'GOMOD':
        return PackageManager.gomod;
      case 'JAR':
        return PackageManager.jar;
      case 'OS':
        return PackageManager.os;
      case 'PIP':
        return PackageManager.pip;
      case 'PYTHONPKG':
        return PackageManager.pythonpkg;
      case 'NODEPKG':
        return PackageManager.nodepkg;
      case 'POM':
        return PackageManager.pom;
      case 'GEMSPEC':
        return PackageManager.gemspec;
    }
    throw Exception('$this is not known in enum PackageManager');
  }
}

enum PackageSortBy {
  critical,
  high,
  all,
}

extension PackageSortByValueExtension on PackageSortBy {
  String toValue() {
    switch (this) {
      case PackageSortBy.critical:
        return 'CRITICAL';
      case PackageSortBy.high:
        return 'HIGH';
      case PackageSortBy.all:
        return 'ALL';
    }
  }
}

extension PackageSortByFromString on String {
  PackageSortBy toPackageSortBy() {
    switch (this) {
      case 'CRITICAL':
        return PackageSortBy.critical;
      case 'HIGH':
        return PackageSortBy.high;
      case 'ALL':
        return PackageSortBy.all;
    }
    throw Exception('$this is not known in enum PackageSortBy');
  }
}

enum PackageType {
  image,
  zip,
}

extension PackageTypeValueExtension on PackageType {
  String toValue() {
    switch (this) {
      case PackageType.image:
        return 'IMAGE';
      case PackageType.zip:
        return 'ZIP';
    }
  }
}

extension PackageTypeFromString on String {
  PackageType toPackageType() {
    switch (this) {
      case 'IMAGE':
        return PackageType.image;
      case 'ZIP':
        return PackageType.zip;
    }
    throw Exception('$this is not known in enum PackageType');
  }
}

/// Information about a package vulnerability finding.
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
      source: json['source'] as String,
      vulnerabilityId: json['vulnerabilityId'] as String,
      cvss: (json['cvss'] as List?)
          ?.whereNotNull()
          .map((e) => CvssScore.fromJson(e as Map<String, dynamic>))
          .toList(),
      referenceUrls: (json['referenceUrls'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      relatedVulnerabilities: (json['relatedVulnerabilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sourceUrl: json['sourceUrl'] as String?,
      vendorCreatedAt: timeStampFromJson(json['vendorCreatedAt']),
      vendorSeverity: json['vendorSeverity'] as String?,
      vendorUpdatedAt: timeStampFromJson(json['vendorUpdatedAt']),
      vulnerablePackages: (json['vulnerablePackages'] as List?)
          ?.whereNotNull()
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

/// Contains information on the permissions an account has within Amazon
/// Inspector.
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
      operation: (json['operation'] as String).toOperation(),
      service: (json['service'] as String).toService(),
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final service = this.service;
    return {
      'operation': operation.toValue(),
      'service': service.toValue(),
    };
  }
}

/// Details about the port range associated with a finding.
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
      begin: json['begin'] as int,
      end: json['end'] as int,
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

/// An object that describes the details of a port range filter.
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

/// Details about the recommended course of action to remediate the finding.
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

enum RelationshipStatus {
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
  cannotCreateDetectorInOrgMaster,
}

extension RelationshipStatusValueExtension on RelationshipStatus {
  String toValue() {
    switch (this) {
      case RelationshipStatus.created:
        return 'CREATED';
      case RelationshipStatus.invited:
        return 'INVITED';
      case RelationshipStatus.disabled:
        return 'DISABLED';
      case RelationshipStatus.enabled:
        return 'ENABLED';
      case RelationshipStatus.removed:
        return 'REMOVED';
      case RelationshipStatus.resigned:
        return 'RESIGNED';
      case RelationshipStatus.deleted:
        return 'DELETED';
      case RelationshipStatus.emailVerificationInProgress:
        return 'EMAIL_VERIFICATION_IN_PROGRESS';
      case RelationshipStatus.emailVerificationFailed:
        return 'EMAIL_VERIFICATION_FAILED';
      case RelationshipStatus.regionDisabled:
        return 'REGION_DISABLED';
      case RelationshipStatus.accountSuspended:
        return 'ACCOUNT_SUSPENDED';
      case RelationshipStatus.cannotCreateDetectorInOrgMaster:
        return 'CANNOT_CREATE_DETECTOR_IN_ORG_MASTER';
    }
  }
}

extension RelationshipStatusFromString on String {
  RelationshipStatus toRelationshipStatus() {
    switch (this) {
      case 'CREATED':
        return RelationshipStatus.created;
      case 'INVITED':
        return RelationshipStatus.invited;
      case 'DISABLED':
        return RelationshipStatus.disabled;
      case 'ENABLED':
        return RelationshipStatus.enabled;
      case 'REMOVED':
        return RelationshipStatus.removed;
      case 'RESIGNED':
        return RelationshipStatus.resigned;
      case 'DELETED':
        return RelationshipStatus.deleted;
      case 'EMAIL_VERIFICATION_IN_PROGRESS':
        return RelationshipStatus.emailVerificationInProgress;
      case 'EMAIL_VERIFICATION_FAILED':
        return RelationshipStatus.emailVerificationFailed;
      case 'REGION_DISABLED':
        return RelationshipStatus.regionDisabled;
      case 'ACCOUNT_SUSPENDED':
        return RelationshipStatus.accountSuspended;
      case 'CANNOT_CREATE_DETECTOR_IN_ORG_MASTER':
        return RelationshipStatus.cannotCreateDetectorInOrgMaster;
    }
    throw Exception('$this is not known in enum RelationshipStatus');
  }
}

/// Information on how to remediate a finding.
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

enum ReportFormat {
  csv,
  json,
}

extension ReportFormatValueExtension on ReportFormat {
  String toValue() {
    switch (this) {
      case ReportFormat.csv:
        return 'CSV';
      case ReportFormat.json:
        return 'JSON';
    }
  }
}

extension ReportFormatFromString on String {
  ReportFormat toReportFormat() {
    switch (this) {
      case 'CSV':
        return ReportFormat.csv;
      case 'JSON':
        return ReportFormat.json;
    }
    throw Exception('$this is not known in enum ReportFormat');
  }
}

enum ReportingErrorCode {
  internalError,
  invalidPermissions,
  noFindingsFound,
  bucketNotFound,
  incompatibleBucketRegion,
  malformedKmsKey,
}

extension ReportingErrorCodeValueExtension on ReportingErrorCode {
  String toValue() {
    switch (this) {
      case ReportingErrorCode.internalError:
        return 'INTERNAL_ERROR';
      case ReportingErrorCode.invalidPermissions:
        return 'INVALID_PERMISSIONS';
      case ReportingErrorCode.noFindingsFound:
        return 'NO_FINDINGS_FOUND';
      case ReportingErrorCode.bucketNotFound:
        return 'BUCKET_NOT_FOUND';
      case ReportingErrorCode.incompatibleBucketRegion:
        return 'INCOMPATIBLE_BUCKET_REGION';
      case ReportingErrorCode.malformedKmsKey:
        return 'MALFORMED_KMS_KEY';
    }
  }
}

extension ReportingErrorCodeFromString on String {
  ReportingErrorCode toReportingErrorCode() {
    switch (this) {
      case 'INTERNAL_ERROR':
        return ReportingErrorCode.internalError;
      case 'INVALID_PERMISSIONS':
        return ReportingErrorCode.invalidPermissions;
      case 'NO_FINDINGS_FOUND':
        return ReportingErrorCode.noFindingsFound;
      case 'BUCKET_NOT_FOUND':
        return ReportingErrorCode.bucketNotFound;
      case 'INCOMPATIBLE_BUCKET_REGION':
        return ReportingErrorCode.incompatibleBucketRegion;
      case 'MALFORMED_KMS_KEY':
        return ReportingErrorCode.malformedKmsKey;
    }
    throw Exception('$this is not known in enum ReportingErrorCode');
  }
}

/// The details that define an aggregation based on repository.
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
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

/// A response that contains details on the results of a finding aggregation by
/// repository.
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
      repository: json['repository'] as String,
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

enum RepositorySortBy {
  critical,
  high,
  all,
  affectedImages,
}

extension RepositorySortByValueExtension on RepositorySortBy {
  String toValue() {
    switch (this) {
      case RepositorySortBy.critical:
        return 'CRITICAL';
      case RepositorySortBy.high:
        return 'HIGH';
      case RepositorySortBy.all:
        return 'ALL';
      case RepositorySortBy.affectedImages:
        return 'AFFECTED_IMAGES';
    }
  }
}

extension RepositorySortByFromString on String {
  RepositorySortBy toRepositorySortBy() {
    switch (this) {
      case 'CRITICAL':
        return RepositorySortBy.critical;
      case 'HIGH':
        return RepositorySortBy.high;
      case 'ALL':
        return RepositorySortBy.all;
      case 'AFFECTED_IMAGES':
        return RepositorySortBy.affectedImages;
    }
    throw Exception('$this is not known in enum RepositorySortBy');
  }
}

class ResetEncryptionKeyResponse {
  ResetEncryptionKeyResponse();

  factory ResetEncryptionKeyResponse.fromJson(Map<String, dynamic> _) {
    return ResetEncryptionKeyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about the resource involved in a finding.
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
      id: json['id'] as String,
      type: (json['type'] as String).toResourceType(),
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
      'type': type.toValue(),
      if (details != null) 'details': details,
      if (partition != null) 'partition': partition,
      if (region != null) 'region': region,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Contains details about the resource involved in the finding.
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

  ResourceDetails({
    this.awsEc2Instance,
    this.awsEcrContainerImage,
    this.awsLambdaFunction,
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
    );
  }

  Map<String, dynamic> toJson() {
    final awsEc2Instance = this.awsEc2Instance;
    final awsEcrContainerImage = this.awsEcrContainerImage;
    final awsLambdaFunction = this.awsLambdaFunction;
    return {
      if (awsEc2Instance != null) 'awsEc2Instance': awsEc2Instance,
      if (awsEcrContainerImage != null)
        'awsEcrContainerImage': awsEcrContainerImage,
      if (awsLambdaFunction != null) 'awsLambdaFunction': awsLambdaFunction,
    };
  }
}

/// The resource filter criteria for a Software bill of materials (SBOM) report.
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
          ?.whereNotNull()
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceTags: (json['ec2InstanceTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceMapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageTags: (json['ecrImageTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrRepositoryName: (json['ecrRepositoryName'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaFunctionName: (json['lambdaFunctionName'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaFunctionTags: (json['lambdaFunctionTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceMapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceId: (json['resourceId'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['resourceType'] as List?)
          ?.whereNotNull()
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

enum ResourceMapComparison {
  equals,
}

extension ResourceMapComparisonValueExtension on ResourceMapComparison {
  String toValue() {
    switch (this) {
      case ResourceMapComparison.equals:
        return 'EQUALS';
    }
  }
}

extension ResourceMapComparisonFromString on String {
  ResourceMapComparison toResourceMapComparison() {
    switch (this) {
      case 'EQUALS':
        return ResourceMapComparison.equals;
    }
    throw Exception('$this is not known in enum ResourceMapComparison');
  }
}

/// A resource map filter for a software bill of material report.
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
      comparison: (json['comparison'] as String).toResourceMapComparison(),
      key: json['key'] as String,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final key = this.key;
    final value = this.value;
    return {
      'comparison': comparison.toValue(),
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// An object that contains details about the metadata for an Amazon ECR
/// resource.
class ResourceScanMetadata {
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
    this.ec2,
    this.ecrImage,
    this.ecrRepository,
    this.lambdaFunction,
  });

  factory ResourceScanMetadata.fromJson(Map<String, dynamic> json) {
    return ResourceScanMetadata(
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
    final ec2 = this.ec2;
    final ecrImage = this.ecrImage;
    final ecrRepository = this.ecrRepository;
    final lambdaFunction = this.lambdaFunction;
    return {
      if (ec2 != null) 'ec2': ec2,
      if (ecrImage != null) 'ecrImage': ecrImage,
      if (ecrRepository != null) 'ecrRepository': ecrRepository,
      if (lambdaFunction != null) 'lambdaFunction': lambdaFunction,
    };
  }
}

enum ResourceScanType {
  ec2,
  ecr,
  lambda,
  lambdaCode,
}

extension ResourceScanTypeValueExtension on ResourceScanType {
  String toValue() {
    switch (this) {
      case ResourceScanType.ec2:
        return 'EC2';
      case ResourceScanType.ecr:
        return 'ECR';
      case ResourceScanType.lambda:
        return 'LAMBDA';
      case ResourceScanType.lambdaCode:
        return 'LAMBDA_CODE';
    }
  }
}

extension ResourceScanTypeFromString on String {
  ResourceScanType toResourceScanType() {
    switch (this) {
      case 'EC2':
        return ResourceScanType.ec2;
      case 'ECR':
        return ResourceScanType.ecr;
      case 'LAMBDA':
        return ResourceScanType.lambda;
      case 'LAMBDA_CODE':
        return ResourceScanType.lambdaCode;
    }
    throw Exception('$this is not known in enum ResourceScanType');
  }
}

/// Details the state of Amazon Inspector for each resource type Amazon
/// Inspector scans.
class ResourceState {
  /// An object detailing the state of Amazon Inspector scanning for Amazon EC2
  /// resources.
  final State ec2;

  /// An object detailing the state of Amazon Inspector scanning for Amazon ECR
  /// resources.
  final State ecr;
  final State? lambda;
  final State? lambdaCode;

  ResourceState({
    required this.ec2,
    required this.ecr,
    this.lambda,
    this.lambdaCode,
  });

  factory ResourceState.fromJson(Map<String, dynamic> json) {
    return ResourceState(
      ec2: State.fromJson(json['ec2'] as Map<String, dynamic>),
      ecr: State.fromJson(json['ecr'] as Map<String, dynamic>),
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
    final lambda = this.lambda;
    final lambdaCode = this.lambdaCode;
    return {
      'ec2': ec2,
      'ecr': ecr,
      if (lambda != null) 'lambda': lambda,
      if (lambdaCode != null) 'lambdaCode': lambdaCode,
    };
  }
}

/// Details the status of Amazon Inspector for each resource type Amazon
/// Inspector scans.
class ResourceStatus {
  /// The status of Amazon Inspector scanning for Amazon EC2 resources.
  final Status ec2;

  /// The status of Amazon Inspector scanning for Amazon ECR resources.
  final Status ecr;

  /// The status of Amazon Inspector scanning for Amazon Web Services Lambda
  /// function.
  final Status? lambda;

  /// The status of Amazon Inspector scanning for custom application code for
  /// Amazon Web Services Lambda functions.
  final Status? lambdaCode;

  ResourceStatus({
    required this.ec2,
    required this.ecr,
    this.lambda,
    this.lambdaCode,
  });

  factory ResourceStatus.fromJson(Map<String, dynamic> json) {
    return ResourceStatus(
      ec2: (json['ec2'] as String).toStatus(),
      ecr: (json['ecr'] as String).toStatus(),
      lambda: (json['lambda'] as String?)?.toStatus(),
      lambdaCode: (json['lambdaCode'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final ec2 = this.ec2;
    final ecr = this.ecr;
    final lambda = this.lambda;
    final lambdaCode = this.lambdaCode;
    return {
      'ec2': ec2.toValue(),
      'ecr': ecr.toValue(),
      if (lambda != null) 'lambda': lambda.toValue(),
      if (lambdaCode != null) 'lambdaCode': lambdaCode.toValue(),
    };
  }
}

enum ResourceStringComparison {
  equals,
  notEquals,
}

extension ResourceStringComparisonValueExtension on ResourceStringComparison {
  String toValue() {
    switch (this) {
      case ResourceStringComparison.equals:
        return 'EQUALS';
      case ResourceStringComparison.notEquals:
        return 'NOT_EQUALS';
    }
  }
}

extension ResourceStringComparisonFromString on String {
  ResourceStringComparison toResourceStringComparison() {
    switch (this) {
      case 'EQUALS':
        return ResourceStringComparison.equals;
      case 'NOT_EQUALS':
        return ResourceStringComparison.notEquals;
    }
    throw Exception('$this is not known in enum ResourceStringComparison');
  }
}

/// A resource string filter for a software bill of materials report.
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
      comparison: (json['comparison'] as String).toResourceStringComparison(),
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.toValue(),
      'value': value,
    };
  }
}

enum ResourceType {
  awsEc2Instance,
  awsEcrContainerImage,
  awsEcrRepository,
  awsLambdaFunction,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.awsEc2Instance:
        return 'AWS_EC2_INSTANCE';
      case ResourceType.awsEcrContainerImage:
        return 'AWS_ECR_CONTAINER_IMAGE';
      case ResourceType.awsEcrRepository:
        return 'AWS_ECR_REPOSITORY';
      case ResourceType.awsLambdaFunction:
        return 'AWS_LAMBDA_FUNCTION';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'AWS_EC2_INSTANCE':
        return ResourceType.awsEc2Instance;
      case 'AWS_ECR_CONTAINER_IMAGE':
        return ResourceType.awsEcrContainerImage;
      case 'AWS_ECR_REPOSITORY':
        return ResourceType.awsEcrRepository;
      case 'AWS_LAMBDA_FUNCTION':
        return ResourceType.awsLambdaFunction;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

enum Runtime {
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
}

extension RuntimeValueExtension on Runtime {
  String toValue() {
    switch (this) {
      case Runtime.nodejs:
        return 'NODEJS';
      case Runtime.nodejs_12X:
        return 'NODEJS_12_X';
      case Runtime.nodejs_14X:
        return 'NODEJS_14_X';
      case Runtime.nodejs_16X:
        return 'NODEJS_16_X';
      case Runtime.java_8:
        return 'JAVA_8';
      case Runtime.java_8Al2:
        return 'JAVA_8_AL2';
      case Runtime.java_11:
        return 'JAVA_11';
      case Runtime.python_3_7:
        return 'PYTHON_3_7';
      case Runtime.python_3_8:
        return 'PYTHON_3_8';
      case Runtime.python_3_9:
        return 'PYTHON_3_9';
      case Runtime.unsupported:
        return 'UNSUPPORTED';
      case Runtime.nodejs_18X:
        return 'NODEJS_18_X';
      case Runtime.go_1X:
        return 'GO_1_X';
      case Runtime.java_17:
        return 'JAVA_17';
      case Runtime.python_3_10:
        return 'PYTHON_3_10';
    }
  }
}

extension RuntimeFromString on String {
  Runtime toRuntime() {
    switch (this) {
      case 'NODEJS':
        return Runtime.nodejs;
      case 'NODEJS_12_X':
        return Runtime.nodejs_12X;
      case 'NODEJS_14_X':
        return Runtime.nodejs_14X;
      case 'NODEJS_16_X':
        return Runtime.nodejs_16X;
      case 'JAVA_8':
        return Runtime.java_8;
      case 'JAVA_8_AL2':
        return Runtime.java_8Al2;
      case 'JAVA_11':
        return Runtime.java_11;
      case 'PYTHON_3_7':
        return Runtime.python_3_7;
      case 'PYTHON_3_8':
        return Runtime.python_3_8;
      case 'PYTHON_3_9':
        return Runtime.python_3_9;
      case 'UNSUPPORTED':
        return Runtime.unsupported;
      case 'NODEJS_18_X':
        return Runtime.nodejs_18X;
      case 'GO_1_X':
        return Runtime.go_1X;
      case 'JAVA_17':
        return Runtime.java_17;
      case 'PYTHON_3_10':
        return Runtime.python_3_10;
    }
    throw Exception('$this is not known in enum Runtime');
  }
}

enum SbomReportFormat {
  cyclonedx_1_4,
  spdx_2_3,
}

extension SbomReportFormatValueExtension on SbomReportFormat {
  String toValue() {
    switch (this) {
      case SbomReportFormat.cyclonedx_1_4:
        return 'CYCLONEDX_1_4';
      case SbomReportFormat.spdx_2_3:
        return 'SPDX_2_3';
    }
  }
}

extension SbomReportFormatFromString on String {
  SbomReportFormat toSbomReportFormat() {
    switch (this) {
      case 'CYCLONEDX_1_4':
        return SbomReportFormat.cyclonedx_1_4;
      case 'SPDX_2_3':
        return SbomReportFormat.spdx_2_3;
    }
    throw Exception('$this is not known in enum SbomReportFormat');
  }
}

enum ScanMode {
  ec2SsmAgentBased,
  ec2Agentless,
}

extension ScanModeValueExtension on ScanMode {
  String toValue() {
    switch (this) {
      case ScanMode.ec2SsmAgentBased:
        return 'EC2_SSM_AGENT_BASED';
      case ScanMode.ec2Agentless:
        return 'EC2_AGENTLESS';
    }
  }
}

extension ScanModeFromString on String {
  ScanMode toScanMode() {
    switch (this) {
      case 'EC2_SSM_AGENT_BASED':
        return ScanMode.ec2SsmAgentBased;
      case 'EC2_AGENTLESS':
        return ScanMode.ec2Agentless;
    }
    throw Exception('$this is not known in enum ScanMode');
  }
}

/// The status of the scan.
class ScanStatus {
  /// The scan status. Possible return values and descriptions are:
  ///
  /// <code>PENDING_INITIAL_SCAN</code> - This resource has been identified for
  /// scanning, results will be available soon.
  ///
  /// <code>ACCESS_DENIED</code> - Resource access policy restricting Amazon
  /// Inspector access. Please update the IAM policy.
  ///
  /// <code>INTERNAL_ERROR</code> - Amazon Inspector has encountered an internal
  /// error for this resource. Amazon Inspector service will automatically resolve
  /// the issue and resume the scanning. No action required from the user.
  ///
  /// <code>UNMANAGED_EC2_INSTANCE</code> - The EC2 instance is not managed by
  /// SSM, please use the following SSM automation to remediate the issue: <a
  /// href="https://docs.aws.amazon.com/systems-manager-automation-runbooks/latest/userguide/automation-awssupport-troubleshoot-managed-instance.html">https://docs.aws.amazon.com/systems-manager-automation-runbooks/latest/userguide/automation-awssupport-troubleshoot-managed-instance.html</a>.
  /// Once the instance becomes managed by SSM, Inspector will automatically begin
  /// scanning this instance.
  ///
  /// <code>UNSUPPORTED_OS</code> - Amazon Inspector does not support this OS,
  /// architecture, or image manifest type at this time. To see a complete list of
  /// supported operating systems see: <a href="
  /// https://docs.aws.amazon.com/inspector/latest/user/supported.html">https://docs.aws.amazon.com/inspector/latest/user/supported.html</a>.
  ///
  /// <code>SCAN_ELIGIBILITY_EXPIRED</code> - The configured scan duration has
  /// lapsed for this image.
  ///
  /// <code>RESOURCE_TERMINATED</code> - This resource has been terminated. The
  /// findings and coverage associated with this resource are in the process of
  /// being cleaned up.
  ///
  /// <code>SUCCESSFUL</code> - The scan was successful.
  ///
  /// <code>NO_RESOURCES_FOUND</code> - Reserved for future use.
  ///
  /// <code>IMAGE_SIZE_EXCEEDED</code> - Reserved for future use.
  ///
  /// <code>SCAN_FREQUENCY_MANUAL</code> - This image will not be covered by
  /// Amazon Inspector due to the repository scan frequency configuration.
  ///
  /// <code>SCAN_FREQUENCY_SCAN_ON_PUSH </code>- This image will be scanned one
  /// time and will not new findings because of the scan frequency configuration.
  ///
  /// <code>EC2_INSTANCE_STOPPED</code> - This EC2 instance is in a stopped state,
  /// therefore, Amazon Inspector will pause scanning. The existing findings will
  /// continue to exist until the instance is terminated. Once the instance is
  /// re-started, Inspector will automatically start scanning the instance again.
  /// Please note that you will not be charged for this instance while it’s in a
  /// stopped state.
  ///
  /// <code>PENDING_DISABLE</code> - This resource is pending cleanup during
  /// disablement. The customer will not be billed while a resource is in the
  /// pending disable status.
  ///
  /// <code>NO INVENTORY</code> - Amazon Inspector couldn’t find software
  /// application inventory to scan for vulnerabilities. This might be caused due
  /// to required Amazon Inspector associations being deleted or failing to run on
  /// your resource. Please verify the status of
  /// <code>InspectorInventoryCollection-do-not-delete</code> association in the
  /// SSM console for the resource. Additionally, you can verify the instance’s
  /// inventory in the SSM Fleet Manager console.
  ///
  /// <code>STALE_INVENTORY</code> - Amazon Inspector wasn’t able to collect an
  /// updated software application inventory in the last 7 days. Please confirm
  /// the required Amazon Inspector associations still exist and you can still see
  /// an updated inventory in the SSM console.
  ///
  /// <code>EXCLUDED_BY_TAG</code> - This resource was not scanned because it has
  /// been excluded by a tag.
  ///
  /// <code>UNSUPPORTED_RUNTIME</code> - The function was not scanned because it
  /// has an unsupported runtime. To see a complete list of supported runtimes
  /// see: <a href="
  /// https://docs.aws.amazon.com/inspector/latest/user/supported.html">https://docs.aws.amazon.com/inspector/latest/user/supported.html</a>.
  ///
  /// <code>UNSUPPORTED_MEDIA_TYPE </code>- The ECR image has an unsupported media
  /// type.
  ///
  /// <code>UNSUPPORTED_CONFIG_FILE</code> - Reserved for future use.
  ///
  /// <code>DEEP_INSPECTION_PACKAGE_COLLECTION_LIMIT_EXCEEDED</code> - The
  /// instance has exceeded the 5000 package limit for Amazon Inspector Deep
  /// inspection. To resume Deep inspection for this instance you can try to
  /// adjust the custom paths associated with the account.
  ///
  /// <code>DEEP_INSPECTION_DAILY_SSM_INVENTORY_LIMIT_EXCEEDED</code> - The SSM
  /// agent couldn't send inventory to Amazon Inspector because the SSM quota for
  /// Inventory data collected per instance per day has already been reached for
  /// this instance.
  ///
  /// <code>DEEP_INSPECTION_COLLECTION_TIME_LIMIT_EXCEEDED</code> - Amazon
  /// Inspector failed to extract the package inventory because the package
  /// collection time exceeding the maximum threshold of 15 minutes.
  ///
  /// <code>DEEP_INSPECTION_NO_INVENTORY</code> The Amazon Inspector plugin hasn't
  /// yet been able to collect an inventory of packages for this instance. This is
  /// usually the result of a pending scan, however, if this status persists after
  /// 6 hours, use SSM to ensure that the required Amazon Inspector associations
  /// exist and are running for the instance.
  /// <p/>
  final ScanStatusReason reason;

  /// The status code of the scan.
  final ScanStatusCode statusCode;

  ScanStatus({
    required this.reason,
    required this.statusCode,
  });

  factory ScanStatus.fromJson(Map<String, dynamic> json) {
    return ScanStatus(
      reason: (json['reason'] as String).toScanStatusReason(),
      statusCode: (json['statusCode'] as String).toScanStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final statusCode = this.statusCode;
    return {
      'reason': reason.toValue(),
      'statusCode': statusCode.toValue(),
    };
  }
}

enum ScanStatusCode {
  active,
  inactive,
}

extension ScanStatusCodeValueExtension on ScanStatusCode {
  String toValue() {
    switch (this) {
      case ScanStatusCode.active:
        return 'ACTIVE';
      case ScanStatusCode.inactive:
        return 'INACTIVE';
    }
  }
}

extension ScanStatusCodeFromString on String {
  ScanStatusCode toScanStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return ScanStatusCode.active;
      case 'INACTIVE':
        return ScanStatusCode.inactive;
    }
    throw Exception('$this is not known in enum ScanStatusCode');
  }
}

enum ScanStatusReason {
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
}

extension ScanStatusReasonValueExtension on ScanStatusReason {
  String toValue() {
    switch (this) {
      case ScanStatusReason.pendingInitialScan:
        return 'PENDING_INITIAL_SCAN';
      case ScanStatusReason.accessDenied:
        return 'ACCESS_DENIED';
      case ScanStatusReason.internalError:
        return 'INTERNAL_ERROR';
      case ScanStatusReason.unmanagedEc2Instance:
        return 'UNMANAGED_EC2_INSTANCE';
      case ScanStatusReason.unsupportedOs:
        return 'UNSUPPORTED_OS';
      case ScanStatusReason.scanEligibilityExpired:
        return 'SCAN_ELIGIBILITY_EXPIRED';
      case ScanStatusReason.resourceTerminated:
        return 'RESOURCE_TERMINATED';
      case ScanStatusReason.successful:
        return 'SUCCESSFUL';
      case ScanStatusReason.noResourcesFound:
        return 'NO_RESOURCES_FOUND';
      case ScanStatusReason.imageSizeExceeded:
        return 'IMAGE_SIZE_EXCEEDED';
      case ScanStatusReason.scanFrequencyManual:
        return 'SCAN_FREQUENCY_MANUAL';
      case ScanStatusReason.scanFrequencyScanOnPush:
        return 'SCAN_FREQUENCY_SCAN_ON_PUSH';
      case ScanStatusReason.ec2InstanceStopped:
        return 'EC2_INSTANCE_STOPPED';
      case ScanStatusReason.pendingDisable:
        return 'PENDING_DISABLE';
      case ScanStatusReason.noInventory:
        return 'NO_INVENTORY';
      case ScanStatusReason.staleInventory:
        return 'STALE_INVENTORY';
      case ScanStatusReason.excludedByTag:
        return 'EXCLUDED_BY_TAG';
      case ScanStatusReason.unsupportedRuntime:
        return 'UNSUPPORTED_RUNTIME';
      case ScanStatusReason.unsupportedMediaType:
        return 'UNSUPPORTED_MEDIA_TYPE';
      case ScanStatusReason.unsupportedConfigFile:
        return 'UNSUPPORTED_CONFIG_FILE';
      case ScanStatusReason.deepInspectionPackageCollectionLimitExceeded:
        return 'DEEP_INSPECTION_PACKAGE_COLLECTION_LIMIT_EXCEEDED';
      case ScanStatusReason.deepInspectionDailySsmInventoryLimitExceeded:
        return 'DEEP_INSPECTION_DAILY_SSM_INVENTORY_LIMIT_EXCEEDED';
      case ScanStatusReason.deepInspectionCollectionTimeLimitExceeded:
        return 'DEEP_INSPECTION_COLLECTION_TIME_LIMIT_EXCEEDED';
      case ScanStatusReason.deepInspectionNoInventory:
        return 'DEEP_INSPECTION_NO_INVENTORY';
    }
  }
}

extension ScanStatusReasonFromString on String {
  ScanStatusReason toScanStatusReason() {
    switch (this) {
      case 'PENDING_INITIAL_SCAN':
        return ScanStatusReason.pendingInitialScan;
      case 'ACCESS_DENIED':
        return ScanStatusReason.accessDenied;
      case 'INTERNAL_ERROR':
        return ScanStatusReason.internalError;
      case 'UNMANAGED_EC2_INSTANCE':
        return ScanStatusReason.unmanagedEc2Instance;
      case 'UNSUPPORTED_OS':
        return ScanStatusReason.unsupportedOs;
      case 'SCAN_ELIGIBILITY_EXPIRED':
        return ScanStatusReason.scanEligibilityExpired;
      case 'RESOURCE_TERMINATED':
        return ScanStatusReason.resourceTerminated;
      case 'SUCCESSFUL':
        return ScanStatusReason.successful;
      case 'NO_RESOURCES_FOUND':
        return ScanStatusReason.noResourcesFound;
      case 'IMAGE_SIZE_EXCEEDED':
        return ScanStatusReason.imageSizeExceeded;
      case 'SCAN_FREQUENCY_MANUAL':
        return ScanStatusReason.scanFrequencyManual;
      case 'SCAN_FREQUENCY_SCAN_ON_PUSH':
        return ScanStatusReason.scanFrequencyScanOnPush;
      case 'EC2_INSTANCE_STOPPED':
        return ScanStatusReason.ec2InstanceStopped;
      case 'PENDING_DISABLE':
        return ScanStatusReason.pendingDisable;
      case 'NO_INVENTORY':
        return ScanStatusReason.noInventory;
      case 'STALE_INVENTORY':
        return ScanStatusReason.staleInventory;
      case 'EXCLUDED_BY_TAG':
        return ScanStatusReason.excludedByTag;
      case 'UNSUPPORTED_RUNTIME':
        return ScanStatusReason.unsupportedRuntime;
      case 'UNSUPPORTED_MEDIA_TYPE':
        return ScanStatusReason.unsupportedMediaType;
      case 'UNSUPPORTED_CONFIG_FILE':
        return ScanStatusReason.unsupportedConfigFile;
      case 'DEEP_INSPECTION_PACKAGE_COLLECTION_LIMIT_EXCEEDED':
        return ScanStatusReason.deepInspectionPackageCollectionLimitExceeded;
      case 'DEEP_INSPECTION_DAILY_SSM_INVENTORY_LIMIT_EXCEEDED':
        return ScanStatusReason.deepInspectionDailySsmInventoryLimitExceeded;
      case 'DEEP_INSPECTION_COLLECTION_TIME_LIMIT_EXCEEDED':
        return ScanStatusReason.deepInspectionCollectionTimeLimitExceeded;
      case 'DEEP_INSPECTION_NO_INVENTORY':
        return ScanStatusReason.deepInspectionNoInventory;
    }
    throw Exception('$this is not known in enum ScanStatusReason');
  }
}

enum ScanType {
  network,
  package,
  code,
}

extension ScanTypeValueExtension on ScanType {
  String toValue() {
    switch (this) {
      case ScanType.network:
        return 'NETWORK';
      case ScanType.package:
        return 'PACKAGE';
      case ScanType.code:
        return 'CODE';
    }
  }
}

extension ScanTypeFromString on String {
  ScanType toScanType() {
    switch (this) {
      case 'NETWORK':
        return ScanType.network;
      case 'PACKAGE':
        return ScanType.package;
      case 'CODE':
        return ScanType.code;
    }
    throw Exception('$this is not known in enum ScanType');
  }
}

/// A schedule.
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

/// Details on the criteria used to define the filter for a vulnerability
/// search.
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
      vulnerabilities: (json['vulnerabilities'] as List)
          .whereNotNull()
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

class SendCisSessionHealthResponse {
  SendCisSessionHealthResponse();

  factory SendCisSessionHealthResponse.fromJson(Map<String, dynamic> _) {
    return SendCisSessionHealthResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class SendCisSessionTelemetryResponse {
  SendCisSessionTelemetryResponse();

  factory SendCisSessionTelemetryResponse.fromJson(Map<String, dynamic> _) {
    return SendCisSessionTelemetryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum Service {
  ec2,
  ecr,
  lambda,
}

extension ServiceValueExtension on Service {
  String toValue() {
    switch (this) {
      case Service.ec2:
        return 'EC2';
      case Service.ecr:
        return 'ECR';
      case Service.lambda:
        return 'LAMBDA';
    }
  }
}

extension ServiceFromString on String {
  Service toService() {
    switch (this) {
      case 'EC2':
        return Service.ec2;
      case 'ECR':
        return Service.ecr;
      case 'LAMBDA':
        return Service.lambda;
    }
    throw Exception('$this is not known in enum Service');
  }
}

enum Severity {
  informational,
  low,
  medium,
  high,
  critical,
  untriaged,
}

extension SeverityValueExtension on Severity {
  String toValue() {
    switch (this) {
      case Severity.informational:
        return 'INFORMATIONAL';
      case Severity.low:
        return 'LOW';
      case Severity.medium:
        return 'MEDIUM';
      case Severity.high:
        return 'HIGH';
      case Severity.critical:
        return 'CRITICAL';
      case Severity.untriaged:
        return 'UNTRIAGED';
    }
  }
}

extension SeverityFromString on String {
  Severity toSeverity() {
    switch (this) {
      case 'INFORMATIONAL':
        return Severity.informational;
      case 'LOW':
        return Severity.low;
      case 'MEDIUM':
        return Severity.medium;
      case 'HIGH':
        return Severity.high;
      case 'CRITICAL':
        return Severity.critical;
      case 'UNTRIAGED':
        return Severity.untriaged;
    }
    throw Exception('$this is not known in enum Severity');
  }
}

/// An object that contains the counts of aggregated finding per severity.
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

/// Details about the criteria used to sort finding results.
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
      'field': field.toValue(),
      'sortOrder': sortOrder.toValue(),
    };
  }
}

enum SortField {
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
  epssScore,
}

extension SortFieldValueExtension on SortField {
  String toValue() {
    switch (this) {
      case SortField.awsAccountId:
        return 'AWS_ACCOUNT_ID';
      case SortField.findingType:
        return 'FINDING_TYPE';
      case SortField.severity:
        return 'SEVERITY';
      case SortField.firstObservedAt:
        return 'FIRST_OBSERVED_AT';
      case SortField.lastObservedAt:
        return 'LAST_OBSERVED_AT';
      case SortField.findingStatus:
        return 'FINDING_STATUS';
      case SortField.resourceType:
        return 'RESOURCE_TYPE';
      case SortField.ecrImagePushedAt:
        return 'ECR_IMAGE_PUSHED_AT';
      case SortField.ecrImageRepositoryName:
        return 'ECR_IMAGE_REPOSITORY_NAME';
      case SortField.ecrImageRegistry:
        return 'ECR_IMAGE_REGISTRY';
      case SortField.networkProtocol:
        return 'NETWORK_PROTOCOL';
      case SortField.componentType:
        return 'COMPONENT_TYPE';
      case SortField.vulnerabilityId:
        return 'VULNERABILITY_ID';
      case SortField.vulnerabilitySource:
        return 'VULNERABILITY_SOURCE';
      case SortField.inspectorScore:
        return 'INSPECTOR_SCORE';
      case SortField.vendorSeverity:
        return 'VENDOR_SEVERITY';
      case SortField.epssScore:
        return 'EPSS_SCORE';
    }
  }
}

extension SortFieldFromString on String {
  SortField toSortField() {
    switch (this) {
      case 'AWS_ACCOUNT_ID':
        return SortField.awsAccountId;
      case 'FINDING_TYPE':
        return SortField.findingType;
      case 'SEVERITY':
        return SortField.severity;
      case 'FIRST_OBSERVED_AT':
        return SortField.firstObservedAt;
      case 'LAST_OBSERVED_AT':
        return SortField.lastObservedAt;
      case 'FINDING_STATUS':
        return SortField.findingStatus;
      case 'RESOURCE_TYPE':
        return SortField.resourceType;
      case 'ECR_IMAGE_PUSHED_AT':
        return SortField.ecrImagePushedAt;
      case 'ECR_IMAGE_REPOSITORY_NAME':
        return SortField.ecrImageRepositoryName;
      case 'ECR_IMAGE_REGISTRY':
        return SortField.ecrImageRegistry;
      case 'NETWORK_PROTOCOL':
        return SortField.networkProtocol;
      case 'COMPONENT_TYPE':
        return SortField.componentType;
      case 'VULNERABILITY_ID':
        return SortField.vulnerabilityId;
      case 'VULNERABILITY_SOURCE':
        return SortField.vulnerabilitySource;
      case 'INSPECTOR_SCORE':
        return SortField.inspectorScore;
      case 'VENDOR_SEVERITY':
        return SortField.vendorSeverity;
      case 'EPSS_SCORE':
        return SortField.epssScore;
    }
    throw Exception('$this is not known in enum SortField');
  }
}

enum SortOrder {
  asc,
  desc,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.asc:
        return 'ASC';
      case SortOrder.desc:
        return 'DESC';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASC':
        return SortOrder.asc;
      case 'DESC':
        return SortOrder.desc;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// The start CIS session message.
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

class StartCisSessionResponse {
  StartCisSessionResponse();

  factory StartCisSessionResponse.fromJson(Map<String, dynamic> _) {
    return StartCisSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object that described the state of Amazon Inspector scans for an account.
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
      errorCode: (json['errorCode'] as String).toErrorCode(),
      errorMessage: json['errorMessage'] as String,
      status: (json['status'] as String).toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final status = this.status;
    return {
      'errorCode': errorCode.toValue(),
      'errorMessage': errorMessage,
      'status': status.toValue(),
    };
  }
}

enum Status {
  enabling,
  enabled,
  disabling,
  disabled,
  suspending,
  suspended,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.enabling:
        return 'ENABLING';
      case Status.enabled:
        return 'ENABLED';
      case Status.disabling:
        return 'DISABLING';
      case Status.disabled:
        return 'DISABLED';
      case Status.suspending:
        return 'SUSPENDING';
      case Status.suspended:
        return 'SUSPENDED';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'ENABLING':
        return Status.enabling;
      case 'ENABLED':
        return Status.enabled;
      case 'DISABLING':
        return Status.disabling;
      case 'DISABLED':
        return Status.disabled;
      case 'SUSPENDING':
        return Status.suspending;
      case 'SUSPENDED':
        return Status.suspended;
    }
    throw Exception('$this is not known in enum Status');
  }
}

/// The status counts.
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

/// Details about the step associated with a finding.
class Step {
  /// The component ID.
  final String componentId;

  /// The component type.
  final String componentType;

  Step({
    required this.componentId,
    required this.componentType,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    return Step(
      componentId: json['componentId'] as String,
      componentType: json['componentType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final componentId = this.componentId;
    final componentType = this.componentType;
    return {
      'componentId': componentId,
      'componentType': componentType,
    };
  }
}

/// The stop CIS message progress.
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

/// The stop CIS session message.
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
      'status': status.toValue(),
      if (benchmarkProfile != null) 'benchmarkProfile': benchmarkProfile,
      if (benchmarkVersion != null) 'benchmarkVersion': benchmarkVersion,
      if (computePlatform != null) 'computePlatform': computePlatform,
      if (reason != null) 'reason': reason,
    };
  }
}

class StopCisSessionResponse {
  StopCisSessionResponse();

  factory StopCisSessionResponse.fromJson(Map<String, dynamic> _) {
    return StopCisSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum StopCisSessionStatus {
  success,
  failed,
  interrupted,
  unsupportedOs,
}

extension StopCisSessionStatusValueExtension on StopCisSessionStatus {
  String toValue() {
    switch (this) {
      case StopCisSessionStatus.success:
        return 'SUCCESS';
      case StopCisSessionStatus.failed:
        return 'FAILED';
      case StopCisSessionStatus.interrupted:
        return 'INTERRUPTED';
      case StopCisSessionStatus.unsupportedOs:
        return 'UNSUPPORTED_OS';
    }
  }
}

extension StopCisSessionStatusFromString on String {
  StopCisSessionStatus toStopCisSessionStatus() {
    switch (this) {
      case 'SUCCESS':
        return StopCisSessionStatus.success;
      case 'FAILED':
        return StopCisSessionStatus.failed;
      case 'INTERRUPTED':
        return StopCisSessionStatus.interrupted;
      case 'UNSUPPORTED_OS':
        return StopCisSessionStatus.unsupportedOs;
    }
    throw Exception('$this is not known in enum StopCisSessionStatus');
  }
}

enum StringComparison {
  equals,
  prefix,
  notEquals,
}

extension StringComparisonValueExtension on StringComparison {
  String toValue() {
    switch (this) {
      case StringComparison.equals:
        return 'EQUALS';
      case StringComparison.prefix:
        return 'PREFIX';
      case StringComparison.notEquals:
        return 'NOT_EQUALS';
    }
  }
}

extension StringComparisonFromString on String {
  StringComparison toStringComparison() {
    switch (this) {
      case 'EQUALS':
        return StringComparison.equals;
      case 'PREFIX':
        return StringComparison.prefix;
      case 'NOT_EQUALS':
        return StringComparison.notEquals;
    }
    throw Exception('$this is not known in enum StringComparison');
  }
}

/// An object that describes the details of a string filter.
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
      comparison: (json['comparison'] as String).toStringComparison(),
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final comparison = this.comparison;
    final value = this.value;
    return {
      'comparison': comparison.toValue(),
      'value': value,
    };
  }
}

/// A suggested fix for a vulnerability in your Lambda function code.
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

enum TagComparison {
  equals,
}

extension TagComparisonValueExtension on TagComparison {
  String toValue() {
    switch (this) {
      case TagComparison.equals:
        return 'EQUALS';
    }
  }
}

extension TagComparisonFromString on String {
  TagComparison toTagComparison() {
    switch (this) {
      case 'EQUALS':
        return TagComparison.equals;
    }
    throw Exception('$this is not known in enum TagComparison');
  }
}

/// The tag filter.
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
      'comparison': comparison.toValue(),
      'key': key,
      'value': value,
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

/// The time.
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
      timeOfDay: json['timeOfDay'] as String,
      timezone: json['timezone'] as String,
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

/// The details that define an aggregation based on finding title.
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
      if (findingType != null) 'findingType': findingType.toValue(),
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
      if (titles != null) 'titles': titles,
      if (vulnerabilityIds != null) 'vulnerabilityIds': vulnerabilityIds,
    };
  }
}

/// A response that contains details on the results of a finding aggregation by
/// title.
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
      title: json['title'] as String,
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

enum TitleSortBy {
  critical,
  high,
  all,
}

extension TitleSortByValueExtension on TitleSortBy {
  String toValue() {
    switch (this) {
      case TitleSortBy.critical:
        return 'CRITICAL';
      case TitleSortBy.high:
        return 'HIGH';
      case TitleSortBy.all:
        return 'ALL';
    }
  }
}

extension TitleSortByFromString on String {
  TitleSortBy toTitleSortBy() {
    switch (this) {
      case 'CRITICAL':
        return TitleSortBy.critical;
      case 'HIGH':
        return TitleSortBy.high;
      case 'ALL':
        return TitleSortBy.all;
    }
    throw Exception('$this is not known in enum TitleSortBy');
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

class UpdateCisScanConfigurationResponse {
  /// The CIS scan configuration ARN.
  final String scanConfigurationArn;

  UpdateCisScanConfigurationResponse({
    required this.scanConfigurationArn,
  });

  factory UpdateCisScanConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCisScanConfigurationResponse(
      scanConfigurationArn: json['scanConfigurationArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final scanConfigurationArn = this.scanConfigurationArn;
    return {
      'scanConfigurationArn': scanConfigurationArn,
    };
  }
}

/// Updates CIS targets.
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

class UpdateConfigurationResponse {
  UpdateConfigurationResponse();

  factory UpdateConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      packagePaths: (json['packagePaths'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.toEc2DeepInspectionStatus(),
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
      if (status != null) 'status': status.toValue(),
    };
  }
}

class UpdateEncryptionKeyResponse {
  UpdateEncryptionKeyResponse();

  factory UpdateEncryptionKeyResponse.fromJson(Map<String, dynamic> _) {
    return UpdateEncryptionKeyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateFilterResponse {
  /// The Amazon Resource Number (ARN) of the successfully updated filter.
  final String arn;

  UpdateFilterResponse({
    required this.arn,
  });

  factory UpdateFilterResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFilterResponse(
      arn: json['arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

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
      autoEnable:
          AutoEnable.fromJson(json['autoEnable'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    return {
      'autoEnable': autoEnable,
    };
  }
}

/// Contains usage information about the cost of Amazon Inspector operation.
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
      currency: (json['currency'] as String?)?.toCurrency(),
      estimatedMonthlyCost: json['estimatedMonthlyCost'] as double?,
      total: json['total'] as double?,
      type: (json['type'] as String?)?.toUsageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final estimatedMonthlyCost = this.estimatedMonthlyCost;
    final total = this.total;
    final type = this.type;
    return {
      if (currency != null) 'currency': currency.toValue(),
      if (estimatedMonthlyCost != null)
        'estimatedMonthlyCost': estimatedMonthlyCost,
      if (total != null) 'total': total,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// The total of usage for an account ID.
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
          ?.whereNotNull()
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

enum UsageType {
  ec2InstanceHours,
  ecrInitialScan,
  ecrRescan,
  lambdaFunctionHours,
  lambdaFunctionCodeHours,
}

extension UsageTypeValueExtension on UsageType {
  String toValue() {
    switch (this) {
      case UsageType.ec2InstanceHours:
        return 'EC2_INSTANCE_HOURS';
      case UsageType.ecrInitialScan:
        return 'ECR_INITIAL_SCAN';
      case UsageType.ecrRescan:
        return 'ECR_RESCAN';
      case UsageType.lambdaFunctionHours:
        return 'LAMBDA_FUNCTION_HOURS';
      case UsageType.lambdaFunctionCodeHours:
        return 'LAMBDA_FUNCTION_CODE_HOURS';
    }
  }
}

extension UsageTypeFromString on String {
  UsageType toUsageType() {
    switch (this) {
      case 'EC2_INSTANCE_HOURS':
        return UsageType.ec2InstanceHours;
      case 'ECR_INITIAL_SCAN':
        return UsageType.ecrInitialScan;
      case 'ECR_RESCAN':
        return UsageType.ecrRescan;
      case 'LAMBDA_FUNCTION_HOURS':
        return UsageType.lambdaFunctionHours;
      case 'LAMBDA_FUNCTION_CODE_HOURS':
        return UsageType.lambdaFunctionCodeHours;
    }
    throw Exception('$this is not known in enum UsageType');
  }
}

/// Contains details about a specific vulnerability Amazon Inspector can detect.
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
      id: json['id'] as String,
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
      cwes: (json['cwes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      detectionPlatforms: (json['detectionPlatforms'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      relatedVulnerabilities: (json['relatedVulnerabilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      source: (json['source'] as String?)?.toVulnerabilitySource(),
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
      if (cwes != null) 'cwes': cwes,
      if (description != null) 'description': description,
      if (detectionPlatforms != null) 'detectionPlatforms': detectionPlatforms,
      if (epss != null) 'epss': epss,
      if (exploitObserved != null) 'exploitObserved': exploitObserved,
      if (referenceUrls != null) 'referenceUrls': referenceUrls,
      if (relatedVulnerabilities != null)
        'relatedVulnerabilities': relatedVulnerabilities,
      if (source != null) 'source': source.toValue(),
      if (sourceUrl != null) 'sourceUrl': sourceUrl,
      if (vendorCreatedAt != null)
        'vendorCreatedAt': unixTimestampToJson(vendorCreatedAt),
      if (vendorSeverity != null) 'vendorSeverity': vendorSeverity,
      if (vendorUpdatedAt != null)
        'vendorUpdatedAt': unixTimestampToJson(vendorUpdatedAt),
    };
  }
}

enum VulnerabilitySource {
  nvd,
}

extension VulnerabilitySourceValueExtension on VulnerabilitySource {
  String toValue() {
    switch (this) {
      case VulnerabilitySource.nvd:
        return 'NVD';
    }
  }
}

extension VulnerabilitySourceFromString on String {
  VulnerabilitySource toVulnerabilitySource() {
    switch (this) {
      case 'NVD':
        return VulnerabilitySource.nvd;
    }
    throw Exception('$this is not known in enum VulnerabilitySource');
  }
}

/// Information on the vulnerable package identified by a finding.
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
      name: json['name'] as String,
      version: json['version'] as String,
      arch: json['arch'] as String?,
      epoch: json['epoch'] as int?,
      filePath: json['filePath'] as String?,
      fixedInVersion: json['fixedInVersion'] as String?,
      packageManager: (json['packageManager'] as String?)?.toPackageManager(),
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
      if (packageManager != null) 'packageManager': packageManager.toValue(),
      if (release != null) 'release': release,
      if (remediation != null) 'remediation': remediation,
      if (sourceLambdaLayerArn != null)
        'sourceLambdaLayerArn': sourceLambdaLayerArn,
      if (sourceLayerHash != null) 'sourceLayerHash': sourceLayerHash,
    };
  }
}

/// A weekly schedule.
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
      days: (json['days'] as List)
          .whereNotNull()
          .map((e) => (e as String).toDay())
          .toList(),
      startTime: Time.fromJson(json['startTime'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final days = this.days;
    final startTime = this.startTime;
    return {
      'days': days.map((e) => e.toValue()).toList(),
      'startTime': startTime,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
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
