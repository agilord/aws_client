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

/// Amazon Inspector is a vulnerability discovery service that automates
/// continuous scanning for security vulnerabilities within your Amazon EC2 and
/// Amazon ECR environments.
class Inspector2 {
  final _s.RestJsonProtocol _protocol;
  Inspector2({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// Associates an Amazon Web Services account with an Amazon Inspector
  /// delegated administrator.
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
    ArgumentError.checkNotNull(accountId, 'accountId');
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
    ArgumentError.checkNotNull(accountIds, 'accountIds');
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
    ArgumentError.checkNotNull(reportId, 'reportId');
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

  /// Creates a filter resource using specified filter criteria.
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
    ArgumentError.checkNotNull(action, 'action');
    ArgumentError.checkNotNull(filterCriteria, 'filterCriteria');
    ArgumentError.checkNotNull(name, 'name');
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

  /// Creates a finding report.
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
    ArgumentError.checkNotNull(reportFormat, 'reportFormat');
    ArgumentError.checkNotNull(s3Destination, 's3Destination');
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
    ArgumentError.checkNotNull(arn, 'arn');
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
  /// Services organization
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
    ArgumentError.checkNotNull(
        delegatedAdminAccountId, 'delegatedAdminAccountId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
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
    ArgumentError.checkNotNull(resourceTypes, 'resourceTypes');
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
    ArgumentError.checkNotNull(
        delegatedAdminAccountId, 'delegatedAdminAccountId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
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

  /// Lists the permissions an account has to configure Amazon Inspector.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
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
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
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
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
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
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
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
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
  Future<ListFindingAggregationsResponse> listFindingAggregations({
    required AggregationType aggregationType,
    List<StringFilter>? accountIds,
    AggregationRequest? aggregationRequest,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(aggregationType, 'aggregationType');
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
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
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
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
  /// Parameter [ecrConfiguration] :
  /// Specifies how the ECR automated re-scan will be updated for your
  /// environment.
  Future<void> updateConfiguration({
    required EcrConfiguration ecrConfiguration,
  }) async {
    ArgumentError.checkNotNull(ecrConfiguration, 'ecrConfiguration');
    final $payload = <String, dynamic>{
      'ecrConfiguration': ecrConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/configuration/update',
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
    ArgumentError.checkNotNull(filterArn, 'filterArn');
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
    ArgumentError.checkNotNull(autoEnable, 'autoEnable');
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

  factory AccountAggregation.fromJson(Map<String, dynamic> json) {
    return AccountAggregation(
      findingType: (json['findingType'] as String?)?.toAggregationFindingType(),
      resourceType:
          (json['resourceType'] as String?)?.toAggregationResourceType(),
      sortBy: (json['sortBy'] as String?)?.toAccountSortBy(),
      sortOrder: (json['sortOrder'] as String?)?.toSortOrder(),
    );
  }

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

extension on AccountSortBy {
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

extension on String {
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
/// your Amazon Inspector environment
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
}

extension on AggregationFindingType {
  String toValue() {
    switch (this) {
      case AggregationFindingType.networkReachability:
        return 'NETWORK_REACHABILITY';
      case AggregationFindingType.packageVulnerability:
        return 'PACKAGE_VULNERABILITY';
    }
  }
}

extension on String {
  AggregationFindingType toAggregationFindingType() {
    switch (this) {
      case 'NETWORK_REACHABILITY':
        return AggregationFindingType.networkReachability;
      case 'PACKAGE_VULNERABILITY':
        return AggregationFindingType.packageVulnerability;
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
    this.packageAggregation,
    this.repositoryAggregation,
    this.titleAggregation,
  });

  factory AggregationRequest.fromJson(Map<String, dynamic> json) {
    return AggregationRequest(
      accountAggregation: json['accountAggregation'] != null
          ? AccountAggregation.fromJson(
              json['accountAggregation'] as Map<String, dynamic>)
          : null,
      amiAggregation: json['amiAggregation'] != null
          ? AmiAggregation.fromJson(
              json['amiAggregation'] as Map<String, dynamic>)
          : null,
      awsEcrContainerAggregation: json['awsEcrContainerAggregation'] != null
          ? AwsEcrContainerAggregation.fromJson(
              json['awsEcrContainerAggregation'] as Map<String, dynamic>)
          : null,
      ec2InstanceAggregation: json['ec2InstanceAggregation'] != null
          ? Ec2InstanceAggregation.fromJson(
              json['ec2InstanceAggregation'] as Map<String, dynamic>)
          : null,
      findingTypeAggregation: json['findingTypeAggregation'] != null
          ? FindingTypeAggregation.fromJson(
              json['findingTypeAggregation'] as Map<String, dynamic>)
          : null,
      imageLayerAggregation: json['imageLayerAggregation'] != null
          ? ImageLayerAggregation.fromJson(
              json['imageLayerAggregation'] as Map<String, dynamic>)
          : null,
      packageAggregation: json['packageAggregation'] != null
          ? PackageAggregation.fromJson(
              json['packageAggregation'] as Map<String, dynamic>)
          : null,
      repositoryAggregation: json['repositoryAggregation'] != null
          ? RepositoryAggregation.fromJson(
              json['repositoryAggregation'] as Map<String, dynamic>)
          : null,
      titleAggregation: json['titleAggregation'] != null
          ? TitleAggregation.fromJson(
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
}

extension on AggregationResourceType {
  String toValue() {
    switch (this) {
      case AggregationResourceType.awsEc2Instance:
        return 'AWS_EC2_INSTANCE';
      case AggregationResourceType.awsEcrContainerImage:
        return 'AWS_ECR_CONTAINER_IMAGE';
    }
  }
}

extension on String {
  AggregationResourceType toAggregationResourceType() {
    switch (this) {
      case 'AWS_EC2_INSTANCE':
        return AggregationResourceType.awsEc2Instance;
      case 'AWS_ECR_CONTAINER_IMAGE':
        return AggregationResourceType.awsEcrContainerImage;
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
}

extension on AggregationType {
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
    }
  }
}

extension on String {
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

  factory AmiAggregation.fromJson(Map<String, dynamic> json) {
    return AmiAggregation(
      amis: (json['amis'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      sortBy: (json['sortBy'] as String?)?.toAmiSortBy(),
      sortOrder: (json['sortOrder'] as String?)?.toSortOrder(),
    );
  }

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

  /// The Amazon Web Services account ID that the AMI belongs.
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

extension on AmiSortBy {
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

extension on String {
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

/// Represents which scan types are automatically enabled for new members of
/// your Amazon Inspector organization.
class AutoEnable {
  /// Represents whether Amazon EC2 scans are automatically enabled for new
  /// members of your Amazon Inspector organization.
  final bool ec2;

  /// Represents whether Amazon ECR scans are automatically enabled for new
  /// members of your Amazon Inspector organization.
  final bool ecr;

  AutoEnable({
    required this.ec2,
    required this.ecr,
  });

  factory AutoEnable.fromJson(Map<String, dynamic> json) {
    return AutoEnable(
      ec2: json['ec2'] as bool,
      ecr: json['ecr'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final ec2 = this.ec2;
    final ecr = this.ecr;
    return {
      'ec2': ec2,
      'ecr': ecr,
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

  factory AwsEcrContainerAggregation.fromJson(Map<String, dynamic> json) {
    return AwsEcrContainerAggregation(
      architectures: (json['architectures'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageShas: (json['imageShas'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageTags: (json['imageTags'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      repositories: (json['repositories'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceIds: (json['resourceIds'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      sortBy: (json['sortBy'] as String?)?.toAwsEcrContainerSortBy(),
      sortOrder: (json['sortOrder'] as String?)?.toSortOrder(),
    );
  }

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

  /// The registry the Amazon ECR container image belongs to.
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

extension on AwsEcrContainerSortBy {
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

extension on String {
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

  /// An array of Amazon Web Services resource IDs to return coverage statistics
  /// for.
  final List<CoverageStringFilter>? resourceId;

  /// An array of Amazon Web Services resource types to return coverage statistics
  /// for. The values can be <code>AWS_EC2_INSTANCE</code> or
  /// <code>AWS_ECR_REPOSITORY</code>.
  final List<CoverageStringFilter>? resourceType;

  /// The scan status code to filter on.
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
    this.resourceId,
    this.resourceType,
    this.scanStatusCode,
    this.scanStatusReason,
    this.scanType,
  });

  factory CoverageFilterCriteria.fromJson(Map<String, dynamic> json) {
    return CoverageFilterCriteria(
      accountId: (json['accountId'] as List?)
          ?.whereNotNull()
          .map((e) => CoverageStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ec2InstanceTags: (json['ec2InstanceTags'] as List?)
          ?.whereNotNull()
          .map((e) => CoverageMapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrImageTags: (json['ecrImageTags'] as List?)
          ?.whereNotNull()
          .map((e) => CoverageStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      ecrRepositoryName: (json['ecrRepositoryName'] as List?)
          ?.whereNotNull()
          .map((e) => CoverageStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceId: (json['resourceId'] as List?)
          ?.whereNotNull()
          .map((e) => CoverageStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['resourceType'] as List?)
          ?.whereNotNull()
          .map((e) => CoverageStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      scanStatusCode: (json['scanStatusCode'] as List?)
          ?.whereNotNull()
          .map((e) => CoverageStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      scanStatusReason: (json['scanStatusReason'] as List?)
          ?.whereNotNull()
          .map((e) => CoverageStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      scanType: (json['scanType'] as List?)
          ?.whereNotNull()
          .map((e) => CoverageStringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final ec2InstanceTags = this.ec2InstanceTags;
    final ecrImageTags = this.ecrImageTags;
    final ecrRepositoryName = this.ecrRepositoryName;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final scanStatusCode = this.scanStatusCode;
    final scanStatusReason = this.scanStatusReason;
    final scanType = this.scanType;
    return {
      if (accountId != null) 'accountId': accountId,
      if (ec2InstanceTags != null) 'ec2InstanceTags': ec2InstanceTags,
      if (ecrImageTags != null) 'ecrImageTags': ecrImageTags,
      if (ecrRepositoryName != null) 'ecrRepositoryName': ecrRepositoryName,
      if (resourceId != null) 'resourceId': resourceId,
      if (resourceType != null) 'resourceType': resourceType,
      if (scanStatusCode != null) 'scanStatusCode': scanStatusCode,
      if (scanStatusReason != null) 'scanStatusReason': scanStatusReason,
      if (scanType != null) 'scanType': scanType,
    };
  }
}

enum CoverageMapComparison {
  equals,
}

extension on CoverageMapComparison {
  String toValue() {
    switch (this) {
      case CoverageMapComparison.equals:
        return 'EQUALS';
    }
  }
}

extension on String {
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

  factory CoverageMapFilter.fromJson(Map<String, dynamic> json) {
    return CoverageMapFilter(
      comparison: (json['comparison'] as String).toCoverageMapComparison(),
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

enum CoverageResourceType {
  awsEc2Instance,
  awsEcrContainerImage,
  awsEcrRepository,
}

extension on CoverageResourceType {
  String toValue() {
    switch (this) {
      case CoverageResourceType.awsEc2Instance:
        return 'AWS_EC2_INSTANCE';
      case CoverageResourceType.awsEcrContainerImage:
        return 'AWS_ECR_CONTAINER_IMAGE';
      case CoverageResourceType.awsEcrRepository:
        return 'AWS_ECR_REPOSITORY';
    }
  }
}

extension on String {
  CoverageResourceType toCoverageResourceType() {
    switch (this) {
      case 'AWS_EC2_INSTANCE':
        return CoverageResourceType.awsEc2Instance;
      case 'AWS_ECR_CONTAINER_IMAGE':
        return CoverageResourceType.awsEcrContainerImage;
      case 'AWS_ECR_REPOSITORY':
        return CoverageResourceType.awsEcrRepository;
    }
    throw Exception('$this is not known in enum CoverageResourceType');
  }
}

enum CoverageStringComparison {
  equals,
  notEquals,
}

extension on CoverageStringComparison {
  String toValue() {
    switch (this) {
      case CoverageStringComparison.equals:
        return 'EQUALS';
      case CoverageStringComparison.notEquals:
        return 'NOT_EQUALS';
    }
  }
}

extension on String {
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

  factory CoverageStringFilter.fromJson(Map<String, dynamic> json) {
    return CoverageStringFilter(
      comparison: (json['comparison'] as String).toCoverageStringComparison(),
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

  /// An object that contains details about the metadata.
  final ResourceScanMetadata? resourceMetadata;

  /// The status of the scan covering the resource.
  final ScanStatus? scanStatus;

  CoveredResource({
    required this.accountId,
    required this.resourceId,
    required this.resourceType,
    required this.scanType,
    this.resourceMetadata,
    this.scanStatus,
  });

  factory CoveredResource.fromJson(Map<String, dynamic> json) {
    return CoveredResource(
      accountId: json['accountId'] as String,
      resourceId: json['resourceId'] as String,
      resourceType: (json['resourceType'] as String).toCoverageResourceType(),
      scanType: (json['scanType'] as String).toScanType(),
      resourceMetadata: json['resourceMetadata'] != null
          ? ResourceScanMetadata.fromJson(
              json['resourceMetadata'] as Map<String, dynamic>)
          : null,
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
    final resourceMetadata = this.resourceMetadata;
    final scanStatus = this.scanStatus;
    return {
      'accountId': accountId,
      'resourceId': resourceId,
      'resourceType': resourceType.toValue(),
      'scanType': scanType.toValue(),
      if (resourceMetadata != null) 'resourceMetadata': resourceMetadata,
      if (scanStatus != null) 'scanStatus': scanStatus,
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

enum Currency {
  usd,
}

extension on Currency {
  String toValue() {
    switch (this) {
      case Currency.usd:
        return 'USD';
    }
  }
}

extension on String {
  Currency toCurrency() {
    switch (this) {
      case 'USD':
        return Currency.usd;
    }
    throw Exception('$this is not known in enum Currency');
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

extension on DelegatedAdminStatus {
  String toValue() {
    switch (this) {
      case DelegatedAdminStatus.enabled:
        return 'ENABLED';
      case DelegatedAdminStatus.disableInProgress:
        return 'DISABLE_IN_PROGRESS';
    }
  }
}

extension on String {
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

  /// The prefix of the KMS key used to export findings.
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

  factory Ec2InstanceAggregation.fromJson(Map<String, dynamic> json) {
    return Ec2InstanceAggregation(
      amis: (json['amis'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      instanceIds: (json['instanceIds'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      instanceTags: (json['instanceTags'] as List?)
          ?.whereNotNull()
          .map((e) => MapFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      operatingSystems: (json['operatingSystems'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      sortBy: (json['sortBy'] as String?)?.toEc2InstanceSortBy(),
      sortOrder: (json['sortOrder'] as String?)?.toSortOrder(),
    );
  }

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

  /// The Amazon Web Services account the Amazon EC2 instance belongs to.
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

extension on Ec2InstanceSortBy {
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

extension on String {
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
}

extension on Ec2Platform {
  String toValue() {
    switch (this) {
      case Ec2Platform.windows:
        return 'WINDOWS';
      case Ec2Platform.linux:
        return 'LINUX';
      case Ec2Platform.unknown:
        return 'UNKNOWN';
    }
  }
}

extension on String {
  Ec2Platform toEc2Platform() {
    switch (this) {
      case 'WINDOWS':
        return Ec2Platform.windows;
      case 'LINUX':
        return Ec2Platform.linux;
      case 'UNKNOWN':
        return Ec2Platform.unknown;
    }
    throw Exception('$this is not known in enum Ec2Platform');
  }
}

/// Details about the ECR automated re-scan duration setting for your
/// environment
class EcrConfiguration {
  /// The ECR automated re-scan duration defines how long an ECR image will be
  /// actively scanned by Amazon Inspector. When the number of days since an image
  /// was last pushed exceeds the automated re-scan duration the monitoring state
  /// of that image becomes <code>inactive</code> and all associated findings are
  /// scheduled for closure.
  final EcrRescanDuration rescanDuration;

  EcrConfiguration({
    required this.rescanDuration,
  });

  factory EcrConfiguration.fromJson(Map<String, dynamic> json) {
    return EcrConfiguration(
      rescanDuration: (json['rescanDuration'] as String).toEcrRescanDuration(),
    );
  }

  Map<String, dynamic> toJson() {
    final rescanDuration = this.rescanDuration;
    return {
      'rescanDuration': rescanDuration.toValue(),
    };
  }
}

/// Details about the state of the ECR scans for your environment.
class EcrConfigurationState {
  /// An object that contains details about the state of the ECR automated re-scan
  /// setting.
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
  /// Tags associated with the Amazon ECR image metadata.
  final List<String>? tags;

  EcrContainerImageMetadata({
    this.tags,
  });

  factory EcrContainerImageMetadata.fromJson(Map<String, dynamic> json) {
    return EcrContainerImageMetadata(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
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
}

extension on EcrRescanDuration {
  String toValue() {
    switch (this) {
      case EcrRescanDuration.lifetime:
        return 'LIFETIME';
      case EcrRescanDuration.days_30:
        return 'DAYS_30';
      case EcrRescanDuration.days_180:
        return 'DAYS_180';
    }
  }
}

extension on String {
  EcrRescanDuration toEcrRescanDuration() {
    switch (this) {
      case 'LIFETIME':
        return EcrRescanDuration.lifetime;
      case 'DAYS_30':
        return EcrRescanDuration.days_30;
      case 'DAYS_180':
        return EcrRescanDuration.days_180;
    }
    throw Exception('$this is not known in enum EcrRescanDuration');
  }
}

/// Details about the state of any changes to the ECR automated re-scan duration
/// setting.
class EcrRescanDurationState {
  /// The ECR automated re-scan duration defines how long an ECR image will be
  /// actively scanned by Amazon Inspector. When the number of days since an image
  /// was last pushed exceeds the automated re-scan duration the monitoring state
  /// of that image becomes <code>inactive</code> and all associated findings are
  /// scheduled for closure.
  final EcrRescanDuration? rescanDuration;

  /// The status of changes to the ECR automated re-scan duration.
  final EcrRescanDurationStatus? status;

  /// A timestamp representing when the last time the ECR scan duration setting
  /// was changed.
  final DateTime? updatedAt;

  EcrRescanDurationState({
    this.rescanDuration,
    this.status,
    this.updatedAt,
  });

  factory EcrRescanDurationState.fromJson(Map<String, dynamic> json) {
    return EcrRescanDurationState(
      rescanDuration:
          (json['rescanDuration'] as String?)?.toEcrRescanDuration(),
      status: (json['status'] as String?)?.toEcrRescanDurationStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final rescanDuration = this.rescanDuration;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
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

extension on EcrRescanDurationStatus {
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

extension on String {
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

extension on EcrScanFrequency {
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

extension on String {
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

extension on ErrorCode {
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

extension on String {
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

enum ExternalReportStatus {
  succeeded,
  inProgress,
  cancelled,
  failed,
}

extension on ExternalReportStatus {
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

extension on String {
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

extension on FilterAction {
  String toValue() {
    switch (this) {
      case FilterAction.none:
        return 'NONE';
      case FilterAction.suppress:
        return 'SUPPRESS';
    }
  }
}

extension on String {
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

  /// Details on the finding ARNs used to filter findings.
  final List<StringFilter>? findingArn;

  /// Details on the finding status types used to filter findings.
  final List<StringFilter>? findingStatus;

  /// Details on the finding types used to filter findings.
  final List<StringFilter>? findingType;

  /// Details on the date and time a finding was first seen used to filter
  /// findings.
  final List<DateFilter>? firstObservedAt;

  /// The Amazon Inspector score to filter on.
  final List<NumberFilter>? inspectorScore;

  /// Details on the date and time a finding was last seen used to filter
  /// findings.
  final List<DateFilter>? lastObservedAt;

  /// Details on the ingress source addresses used to filter findings.
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
    this.findingArn,
    this.findingStatus,
    this.findingType,
    this.firstObservedAt,
    this.inspectorScore,
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
      inspectorScore: (json['inspectorScore'] as List?)
          ?.whereNotNull()
          .map((e) => NumberFilter.fromJson(e as Map<String, dynamic>))
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
    final findingArn = this.findingArn;
    final findingStatus = this.findingStatus;
    final findingType = this.findingType;
    final firstObservedAt = this.firstObservedAt;
    final inspectorScore = this.inspectorScore;
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
      if (findingArn != null) 'findingArn': findingArn,
      if (findingStatus != null) 'findingStatus': findingStatus,
      if (findingType != null) 'findingType': findingType,
      if (firstObservedAt != null) 'firstObservedAt': firstObservedAt,
      if (inspectorScore != null) 'inspectorScore': inspectorScore,
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

  /// The date and time that the finding was last observed.
  final DateTime lastObservedAt;

  /// An object that contains the details about how to remediate a finding.
  final Remediation remediation;

  /// Contains information on the resources involved in a finding.
  final List<Resource> resources;

  /// The severity of the finding.
  final Severity severity;

  /// The status of the finding.
  final FindingStatus status;

  /// The type of the finding.
  final FindingType type;

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

enum FindingStatus {
  active,
  suppressed,
  closed,
}

extension on FindingStatus {
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

extension on String {
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
}

extension on FindingType {
  String toValue() {
    switch (this) {
      case FindingType.networkReachability:
        return 'NETWORK_REACHABILITY';
      case FindingType.packageVulnerability:
        return 'PACKAGE_VULNERABILITY';
    }
  }
}

extension on String {
  FindingType toFindingType() {
    switch (this) {
      case 'NETWORK_REACHABILITY':
        return FindingType.networkReachability;
      case 'PACKAGE_VULNERABILITY':
        return FindingType.packageVulnerability;
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

  factory FindingTypeAggregation.fromJson(Map<String, dynamic> json) {
    return FindingTypeAggregation(
      findingType: (json['findingType'] as String?)?.toAggregationFindingType(),
      resourceType:
          (json['resourceType'] as String?)?.toAggregationResourceType(),
      sortBy: (json['sortBy'] as String?)?.toFindingTypeSortBy(),
      sortOrder: (json['sortOrder'] as String?)?.toSortOrder(),
    );
  }

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

extension on FindingTypeSortBy {
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

extension on String {
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

extension on FreeTrialInfoErrorCode {
  String toValue() {
    switch (this) {
      case FreeTrialInfoErrorCode.accessDenied:
        return 'ACCESS_DENIED';
      case FreeTrialInfoErrorCode.internalError:
        return 'INTERNAL_ERROR';
    }
  }
}

extension on String {
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

extension on FreeTrialStatus {
  String toValue() {
    switch (this) {
      case FreeTrialStatus.active:
        return 'ACTIVE';
      case FreeTrialStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension on String {
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
}

extension on FreeTrialType {
  String toValue() {
    switch (this) {
      case FreeTrialType.ec2:
        return 'EC2';
      case FreeTrialType.ecr:
        return 'ECR';
    }
  }
}

extension on String {
  FreeTrialType toFreeTrialType() {
    switch (this) {
      case 'EC2':
        return FreeTrialType.ec2;
      case 'ECR':
        return FreeTrialType.ecr;
    }
    throw Exception('$this is not known in enum FreeTrialType');
  }
}

class GetConfigurationResponse {
  /// Specifies how the ECR automated re-scan duration is currently configured for
  /// your environment.
  final EcrConfigurationState? ecrConfiguration;

  GetConfigurationResponse({
    this.ecrConfiguration,
  });

  factory GetConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetConfigurationResponse(
      ecrConfiguration: json['ecrConfiguration'] != null
          ? EcrConfigurationState.fromJson(
              json['ecrConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ecrConfiguration = this.ecrConfiguration;
    return {
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

enum GroupKey {
  scanStatusCode,
  scanStatusReason,
  accountId,
  resourceType,
  ecrRepositoryName,
}

extension on GroupKey {
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

extension on String {
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

  factory ImageLayerAggregation.fromJson(Map<String, dynamic> json) {
    return ImageLayerAggregation(
      layerHashes: (json['layerHashes'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      repositories: (json['repositories'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceIds: (json['resourceIds'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      sortBy: (json['sortBy'] as String?)?.toImageLayerSortBy(),
      sortOrder: (json['sortOrder'] as String?)?.toSortOrder(),
    );
  }

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

extension on ImageLayerSortBy {
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

extension on String {
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

extension on MapComparison {
  String toValue() {
    switch (this) {
      case MapComparison.equals:
        return 'EQUALS';
    }
  }
}

extension on String {
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

extension on NetworkProtocol {
  String toValue() {
    switch (this) {
      case NetworkProtocol.tcp:
        return 'TCP';
      case NetworkProtocol.udp:
        return 'UDP';
    }
  }
}

extension on String {
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

enum Operation {
  enableScanning,
  disableScanning,
  enableRepository,
  disableRepository,
}

extension on Operation {
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

extension on String {
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

  factory PackageAggregation.fromJson(Map<String, dynamic> json) {
    return PackageAggregation(
      packageNames: (json['packageNames'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      sortBy: (json['sortBy'] as String?)?.toPackageSortBy(),
      sortOrder: (json['sortOrder'] as String?)?.toSortOrder(),
    );
  }

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

  /// An object that contains details on the source layer hash to filter on.
  final StringFilter? sourceLayerHash;

  /// The package version to filter on.
  final StringFilter? version;

  PackageFilter({
    this.architecture,
    this.epoch,
    this.name,
    this.release,
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
    final sourceLayerHash = this.sourceLayerHash;
    final version = this.version;
    return {
      if (architecture != null) 'architecture': architecture,
      if (epoch != null) 'epoch': epoch,
      if (name != null) 'name': name,
      if (release != null) 'release': release,
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
}

extension on PackageManager {
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
    }
  }
}

extension on String {
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
    }
    throw Exception('$this is not known in enum PackageManager');
  }
}

enum PackageSortBy {
  critical,
  high,
  all,
}

extension on PackageSortBy {
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

extension on String {
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

/// Information about a package vulnerability finding.
class PackageVulnerabilityDetails {
  /// The source of the vulnerability information.
  final String source;

  /// The ID given to this vulnerability.
  final String vulnerabilityId;

  /// The packages impacted by this vulnerability.
  final List<VulnerablePackage> vulnerablePackages;

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

  PackageVulnerabilityDetails({
    required this.source,
    required this.vulnerabilityId,
    required this.vulnerablePackages,
    this.cvss,
    this.referenceUrls,
    this.relatedVulnerabilities,
    this.sourceUrl,
    this.vendorCreatedAt,
    this.vendorSeverity,
    this.vendorUpdatedAt,
  });

  factory PackageVulnerabilityDetails.fromJson(Map<String, dynamic> json) {
    return PackageVulnerabilityDetails(
      source: json['source'] as String,
      vulnerabilityId: json['vulnerabilityId'] as String,
      vulnerablePackages: (json['vulnerablePackages'] as List)
          .whereNotNull()
          .map((e) => VulnerablePackage.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final vulnerabilityId = this.vulnerabilityId;
    final vulnerablePackages = this.vulnerablePackages;
    final cvss = this.cvss;
    final referenceUrls = this.referenceUrls;
    final relatedVulnerabilities = this.relatedVulnerabilities;
    final sourceUrl = this.sourceUrl;
    final vendorCreatedAt = this.vendorCreatedAt;
    final vendorSeverity = this.vendorSeverity;
    final vendorUpdatedAt = this.vendorUpdatedAt;
    return {
      'source': source,
      'vulnerabilityId': vulnerabilityId,
      'vulnerablePackages': vulnerablePackages,
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

extension on RelationshipStatus {
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

extension on String {
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

extension on ReportFormat {
  String toValue() {
    switch (this) {
      case ReportFormat.csv:
        return 'CSV';
      case ReportFormat.json:
        return 'JSON';
    }
  }
}

extension on String {
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

extension on ReportingErrorCode {
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

extension on String {
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

  factory RepositoryAggregation.fromJson(Map<String, dynamic> json) {
    return RepositoryAggregation(
      repositories: (json['repositories'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      sortBy: (json['sortBy'] as String?)?.toRepositorySortBy(),
      sortOrder: (json['sortOrder'] as String?)?.toSortOrder(),
    );
  }

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

extension on RepositorySortBy {
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

extension on String {
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

  ResourceDetails({
    this.awsEc2Instance,
    this.awsEcrContainerImage,
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
    );
  }

  Map<String, dynamic> toJson() {
    final awsEc2Instance = this.awsEc2Instance;
    final awsEcrContainerImage = this.awsEcrContainerImage;
    return {
      if (awsEc2Instance != null) 'awsEc2Instance': awsEc2Instance,
      if (awsEcrContainerImage != null)
        'awsEcrContainerImage': awsEcrContainerImage,
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

  ResourceScanMetadata({
    this.ec2,
    this.ecrImage,
    this.ecrRepository,
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
    );
  }

  Map<String, dynamic> toJson() {
    final ec2 = this.ec2;
    final ecrImage = this.ecrImage;
    final ecrRepository = this.ecrRepository;
    return {
      if (ec2 != null) 'ec2': ec2,
      if (ecrImage != null) 'ecrImage': ecrImage,
      if (ecrRepository != null) 'ecrRepository': ecrRepository,
    };
  }
}

enum ResourceScanType {
  ec2,
  ecr,
}

extension on ResourceScanType {
  String toValue() {
    switch (this) {
      case ResourceScanType.ec2:
        return 'EC2';
      case ResourceScanType.ecr:
        return 'ECR';
    }
  }
}

extension on String {
  ResourceScanType toResourceScanType() {
    switch (this) {
      case 'EC2':
        return ResourceScanType.ec2;
      case 'ECR':
        return ResourceScanType.ecr;
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

  ResourceState({
    required this.ec2,
    required this.ecr,
  });

  factory ResourceState.fromJson(Map<String, dynamic> json) {
    return ResourceState(
      ec2: State.fromJson(json['ec2'] as Map<String, dynamic>),
      ecr: State.fromJson(json['ecr'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ec2 = this.ec2;
    final ecr = this.ecr;
    return {
      'ec2': ec2,
      'ecr': ecr,
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

  ResourceStatus({
    required this.ec2,
    required this.ecr,
  });

  factory ResourceStatus.fromJson(Map<String, dynamic> json) {
    return ResourceStatus(
      ec2: (json['ec2'] as String).toStatus(),
      ecr: (json['ecr'] as String).toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final ec2 = this.ec2;
    final ecr = this.ecr;
    return {
      'ec2': ec2.toValue(),
      'ecr': ecr.toValue(),
    };
  }
}

enum ResourceType {
  awsEc2Instance,
  awsEcrContainerImage,
  awsEcrRepository,
}

extension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.awsEc2Instance:
        return 'AWS_EC2_INSTANCE';
      case ResourceType.awsEcrContainerImage:
        return 'AWS_ECR_CONTAINER_IMAGE';
      case ResourceType.awsEcrRepository:
        return 'AWS_ECR_REPOSITORY';
    }
  }
}

extension on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'AWS_EC2_INSTANCE':
        return ResourceType.awsEc2Instance;
      case 'AWS_ECR_CONTAINER_IMAGE':
        return ResourceType.awsEcrContainerImage;
      case 'AWS_ECR_REPOSITORY':
        return ResourceType.awsEcrRepository;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// The status of the scan.
class ScanStatus {
  /// The reason for the scan.
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

extension on ScanStatusCode {
  String toValue() {
    switch (this) {
      case ScanStatusCode.active:
        return 'ACTIVE';
      case ScanStatusCode.inactive:
        return 'INACTIVE';
    }
  }
}

extension on String {
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
}

extension on ScanStatusReason {
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
    }
  }
}

extension on String {
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
    }
    throw Exception('$this is not known in enum ScanStatusReason');
  }
}

enum ScanType {
  network,
  package,
}

extension on ScanType {
  String toValue() {
    switch (this) {
      case ScanType.network:
        return 'NETWORK';
      case ScanType.package:
        return 'PACKAGE';
    }
  }
}

extension on String {
  ScanType toScanType() {
    switch (this) {
      case 'NETWORK':
        return ScanType.network;
      case 'PACKAGE':
        return ScanType.package;
    }
    throw Exception('$this is not known in enum ScanType');
  }
}

enum Service {
  ec2,
  ecr,
}

extension on Service {
  String toValue() {
    switch (this) {
      case Service.ec2:
        return 'EC2';
      case Service.ecr:
        return 'ECR';
    }
  }
}

extension on String {
  Service toService() {
    switch (this) {
      case 'EC2':
        return Service.ec2;
      case 'ECR':
        return Service.ecr;
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

extension on Severity {
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

extension on String {
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

  factory SortCriteria.fromJson(Map<String, dynamic> json) {
    return SortCriteria(
      field: (json['field'] as String).toSortField(),
      sortOrder: (json['sortOrder'] as String).toSortOrder(),
    );
  }

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
}

extension on SortField {
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
    }
  }
}

extension on String {
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
    }
    throw Exception('$this is not known in enum SortField');
  }
}

enum SortOrder {
  asc,
  desc,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.asc:
        return 'ASC';
      case SortOrder.desc:
        return 'DESC';
    }
  }
}

extension on String {
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

extension on Status {
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

extension on String {
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

enum StringComparison {
  equals,
  prefix,
  notEquals,
}

extension on StringComparison {
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

extension on String {
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
  /// The operator to use when comparing values in the filter
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The details that define an aggregation based on finding title.
class TitleAggregation {
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
    this.resourceType,
    this.sortBy,
    this.sortOrder,
    this.titles,
    this.vulnerabilityIds,
  });

  factory TitleAggregation.fromJson(Map<String, dynamic> json) {
    return TitleAggregation(
      resourceType:
          (json['resourceType'] as String?)?.toAggregationResourceType(),
      sortBy: (json['sortBy'] as String?)?.toTitleSortBy(),
      sortOrder: (json['sortOrder'] as String?)?.toSortOrder(),
      titles: (json['titles'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      vulnerabilityIds: (json['vulnerabilityIds'] as List?)
          ?.whereNotNull()
          .map((e) => StringFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    final titles = this.titles;
    final vulnerabilityIds = this.vulnerabilityIds;
    return {
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

extension on TitleSortBy {
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

extension on String {
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

class UpdateConfigurationResponse {
  UpdateConfigurationResponse();

  factory UpdateConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateConfigurationResponse();
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
}

extension on UsageType {
  String toValue() {
    switch (this) {
      case UsageType.ec2InstanceHours:
        return 'EC2_INSTANCE_HOURS';
      case UsageType.ecrInitialScan:
        return 'ECR_INITIAL_SCAN';
      case UsageType.ecrRescan:
        return 'ECR_RESCAN';
    }
  }
}

extension on String {
  UsageType toUsageType() {
    switch (this) {
      case 'EC2_INSTANCE_HOURS':
        return UsageType.ec2InstanceHours;
      case 'ECR_INITIAL_SCAN':
        return UsageType.ecrInitialScan;
      case 'ECR_RESCAN':
        return UsageType.ecrRescan;
    }
    throw Exception('$this is not known in enum UsageType');
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
      if (sourceLayerHash != null) 'sourceLayerHash': sourceLayerHash,
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
