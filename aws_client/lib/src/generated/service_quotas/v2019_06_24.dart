// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// With Service Quotas, you can view and manage your quotas easily as your
/// Amazon Web Services workloads grow. Quotas, also referred to as limits, are
/// the maximum number of resources that you can create in your Amazon Web
/// Services account. For more information, see the <a
/// href="https://docs.aws.amazon.com/servicequotas/latest/userguide/">Service
/// Quotas User Guide</a>.
///
/// You need Amazon Web Services CLI version 2.13.20 or higher to view and
/// manage resource-level quotas such as <code>Instances per domain</code> for
/// Amazon OpenSearch Service.
class ServiceQuotas {
  final _s.JsonProtocol _protocol;
  ServiceQuotas({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'servicequotas',
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

  /// Associates your quota request template with your organization. When a new
  /// Amazon Web Services account is created in your organization, the quota
  /// increase requests in the template are automatically applied to the
  /// account. You can add a quota increase request for any adjustable quota to
  /// your template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [NoAvailableOrganizationException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  /// May throw [ServiceException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [TooManyRequestsException].
  Future<void> associateServiceQuotaTemplate() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.AssociateServiceQuotaTemplate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Creates a Support case for an existing quota increase request. This call
  /// only creates a Support case if the request has a <code>Pending</code>
  /// status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidResourceStateException].
  /// May throw [NoSuchResourceException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [requestId] :
  /// The ID of the pending quota increase request for which you want to open a
  /// Support case.
  Future<void> createSupportCase({
    required String requestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.CreateSupportCase'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequestId': requestId,
      },
    );
  }

  /// Deletes the quota increase request for the specified quota from your quota
  /// request template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoAvailableOrganizationException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [awsRegion] :
  /// Specifies the Amazon Web Services Region for which the request was made.
  ///
  /// Parameter [quotaCode] :
  /// Specifies the quota identifier. To find the quota code for a specific
  /// quota, use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  Future<void> deleteServiceQuotaIncreaseRequestFromTemplate({
    required String awsRegion,
    required String quotaCode,
    required String serviceCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'ServiceQuotasV20190624.DeleteServiceQuotaIncreaseRequestFromTemplate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AwsRegion': awsRegion,
        'QuotaCode': quotaCode,
        'ServiceCode': serviceCode,
      },
    );
  }

  /// Disables your quota request template. After a template is disabled, the
  /// quota increase requests in the template are not applied to new Amazon Web
  /// Services accounts in your organization. Disabling a quota request template
  /// does not apply its quota increase requests.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [NoAvailableOrganizationException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaTemplateNotInUseException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [TooManyRequestsException].
  Future<void> disassociateServiceQuotaTemplate() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.DisassociateServiceQuotaTemplate'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Retrieves the status of the association for the quota request template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [NoAvailableOrganizationException].
  /// May throw [ServiceException].
  /// May throw [ServiceQuotaTemplateNotInUseException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [TooManyRequestsException].
  Future<GetAssociationForServiceQuotaTemplateResponse>
      getAssociationForServiceQuotaTemplate() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'ServiceQuotasV20190624.GetAssociationForServiceQuotaTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAssociationForServiceQuotaTemplateResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves information about your <a
  /// href="https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management.html">Service
  /// Quotas Automatic Management</a> configuration. Automatic Management
  /// monitors your Service Quotas utilization and notifies you before you run
  /// out of your allocated quotas.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  Future<GetAutoManagementConfigurationResponse>
      getAutoManagementConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.GetAutoManagementConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAutoManagementConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the default value for the specified quota. The default value
  /// does not reflect any quota increases.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [quotaCode] :
  /// Specifies the quota identifier. To find the quota code for a specific
  /// quota, use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  Future<GetAWSDefaultServiceQuotaResponse> getAWSDefaultServiceQuota({
    required String quotaCode,
    required String serviceCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.GetAWSDefaultServiceQuota'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QuotaCode': quotaCode,
        'ServiceCode': serviceCode,
      },
    );

    return GetAWSDefaultServiceQuotaResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the quota utilization report for your Amazon Web Services
  /// account. This operation returns paginated results showing your quota usage
  /// across all Amazon Web Services services, sorted by utilization percentage
  /// in descending order (highest utilization first).
  ///
  /// You must first initiate a report using the
  /// <code>StartQuotaUtilizationReport</code> operation. The report generation
  /// process is asynchronous and may take several seconds to complete. Poll
  /// this operation periodically to check the status and retrieve results when
  /// the report is ready.
  ///
  /// Each report contains up to 1,000 quota records per page. Use the
  /// <code>NextToken</code> parameter to retrieve additional pages of results.
  /// Reports are automatically deleted after 15 minutes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [reportId] :
  /// The unique identifier for the quota utilization report. This identifier is
  /// returned by the <code>StartQuotaUtilizationReport</code> operation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page. The default value is
  /// 1,000 and the maximum allowed value is 1,000.
  ///
  /// Parameter [nextToken] :
  /// A token that indicates the next page of results to retrieve. This token is
  /// returned in the response when there are more results available. Omit this
  /// parameter for the first request.
  Future<GetQuotaUtilizationReportResponse> getQuotaUtilizationReport({
    required String reportId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.GetQuotaUtilizationReport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ReportId': reportId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetQuotaUtilizationReportResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the specified quota increase request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [requestId] :
  /// Specifies the ID of the quota increase request.
  Future<GetRequestedServiceQuotaChangeResponse>
      getRequestedServiceQuotaChange({
    required String requestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.GetRequestedServiceQuotaChange'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequestId': requestId,
      },
    );

    return GetRequestedServiceQuotaChangeResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the applied quota value for the specified account-level or
  /// resource-level quota. For some quotas, only the default values are
  /// available. If the applied quota value is not available for a quota, the
  /// quota is not retrieved.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [quotaCode] :
  /// Specifies the quota identifier. To find the quota code for a specific
  /// quota, use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  ///
  /// Parameter [contextId] :
  /// Specifies the resource with an Amazon Resource Name (ARN).
  Future<GetServiceQuotaResponse> getServiceQuota({
    required String quotaCode,
    required String serviceCode,
    String? contextId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.GetServiceQuota'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QuotaCode': quotaCode,
        'ServiceCode': serviceCode,
        if (contextId != null) 'ContextId': contextId,
      },
    );

    return GetServiceQuotaResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the specified quota increase request in your
  /// quota request template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoAvailableOrganizationException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [awsRegion] :
  /// Specifies the Amazon Web Services Region for which you made the request.
  ///
  /// Parameter [quotaCode] :
  /// Specifies the quota identifier. To find the quota code for a specific
  /// quota, use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  Future<GetServiceQuotaIncreaseRequestFromTemplateResponse>
      getServiceQuotaIncreaseRequestFromTemplate({
    required String awsRegion,
    required String quotaCode,
    required String serviceCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'ServiceQuotasV20190624.GetServiceQuotaIncreaseRequestFromTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AwsRegion': awsRegion,
        'QuotaCode': quotaCode,
        'ServiceCode': serviceCode,
      },
    );

    return GetServiceQuotaIncreaseRequestFromTemplateResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the default values for the quotas for the specified Amazon Web
  /// Services service. A default value does not reflect any quota increases.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results that you want included on each
  /// page of the response. If you do not include this parameter, it defaults to
  /// a value appropriate to the operation. If additional items exist beyond
  /// those included in the current response, the <code>NextToken</code>
  /// response element is present and has a value (is not null). Include that
  /// value as the <code>NextToken</code> request parameter in the next call to
  /// the operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// Specifies a value for receiving additional results after you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListAWSDefaultServiceQuotasResponse> listAWSDefaultServiceQuotas({
    required String serviceCode,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.ListAWSDefaultServiceQuotas'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceCode': serviceCode,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAWSDefaultServiceQuotasResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the quota increase requests for the specified Amazon Web
  /// Services service. Filter responses to return quota requests at either the
  /// account level, resource level, or all levels. Responses include any open
  /// or closed requests within 90 days.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results that you want included on each
  /// page of the response. If you do not include this parameter, it defaults to
  /// a value appropriate to the operation. If additional items exist beyond
  /// those included in the current response, the <code>NextToken</code>
  /// response element is present and has a value (is not null). Include that
  /// value as the <code>NextToken</code> request parameter in the next call to
  /// the operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// Specifies a value for receiving additional results after you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  ///
  /// Parameter [quotaRequestedAtLevel] :
  /// Filters the response to return quota requests for the
  /// <code>ACCOUNT</code>, <code>RESOURCE</code>, or <code>ALL</code> levels.
  /// <code>ACCOUNT</code> is the default.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  ///
  /// Parameter [status] :
  /// Specifies that you want to filter the results to only the requests with
  /// the matching status.
  Future<ListRequestedServiceQuotaChangeHistoryResponse>
      listRequestedServiceQuotaChangeHistory({
    int? maxResults,
    String? nextToken,
    AppliedLevelEnum? quotaRequestedAtLevel,
    String? serviceCode,
    RequestStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'ServiceQuotasV20190624.ListRequestedServiceQuotaChangeHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (quotaRequestedAtLevel != null)
          'QuotaRequestedAtLevel': quotaRequestedAtLevel.value,
        if (serviceCode != null) 'ServiceCode': serviceCode,
        if (status != null) 'Status': status.value,
      },
    );

    return ListRequestedServiceQuotaChangeHistoryResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the quota increase requests for the specified quota. Filter
  /// responses to return quota requests at either the account level, resource
  /// level, or all levels.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [quotaCode] :
  /// Specifies the quota identifier. To find the quota code for a specific
  /// quota, use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results that you want included on each
  /// page of the response. If you do not include this parameter, it defaults to
  /// a value appropriate to the operation. If additional items exist beyond
  /// those included in the current response, the <code>NextToken</code>
  /// response element is present and has a value (is not null). Include that
  /// value as the <code>NextToken</code> request parameter in the next call to
  /// the operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// Specifies a value for receiving additional results after you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  ///
  /// Parameter [quotaRequestedAtLevel] :
  /// Filters the response to return quota requests for the
  /// <code>ACCOUNT</code>, <code>RESOURCE</code>, or <code>ALL</code> levels.
  /// <code>ACCOUNT</code> is the default.
  ///
  /// Parameter [status] :
  /// Specifies that you want to filter the results to only the requests with
  /// the matching status.
  Future<ListRequestedServiceQuotaChangeHistoryByQuotaResponse>
      listRequestedServiceQuotaChangeHistoryByQuota({
    required String quotaCode,
    required String serviceCode,
    int? maxResults,
    String? nextToken,
    AppliedLevelEnum? quotaRequestedAtLevel,
    RequestStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'ServiceQuotasV20190624.ListRequestedServiceQuotaChangeHistoryByQuota'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'QuotaCode': quotaCode,
        'ServiceCode': serviceCode,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (quotaRequestedAtLevel != null)
          'QuotaRequestedAtLevel': quotaRequestedAtLevel.value,
        if (status != null) 'Status': status.value,
      },
    );

    return ListRequestedServiceQuotaChangeHistoryByQuotaResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the quota increase requests in the specified quota request template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoAvailableOrganizationException].
  /// May throw [ServiceException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [awsRegion] :
  /// Specifies the Amazon Web Services Region for which you made the request.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results that you want included on each
  /// page of the response. If you do not include this parameter, it defaults to
  /// a value appropriate to the operation. If additional items exist beyond
  /// those included in the current response, the <code>NextToken</code>
  /// response element is present and has a value (is not null). Include that
  /// value as the <code>NextToken</code> request parameter in the next call to
  /// the operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// Specifies a value for receiving additional results after you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  Future<ListServiceQuotaIncreaseRequestsInTemplateResponse>
      listServiceQuotaIncreaseRequestsInTemplate({
    String? awsRegion,
    int? maxResults,
    String? nextToken,
    String? serviceCode,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'ServiceQuotasV20190624.ListServiceQuotaIncreaseRequestsInTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (awsRegion != null) 'AwsRegion': awsRegion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (serviceCode != null) 'ServiceCode': serviceCode,
      },
    );

    return ListServiceQuotaIncreaseRequestsInTemplateResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the applied quota values for the specified Amazon Web Services
  /// service. For some quotas, only the default values are available. If the
  /// applied quota value is not available for a quota, the quota is not
  /// retrieved. Filter responses to return applied quota values at either the
  /// account level, resource level, or all levels.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results that you want included on each
  /// page of the response. If you do not include this parameter, it defaults to
  /// a value appropriate to the operation. If additional items exist beyond
  /// those included in the current response, the <code>NextToken</code>
  /// response element is present and has a value (is not null). Include that
  /// value as the <code>NextToken</code> request parameter in the next call to
  /// the operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// Specifies a value for receiving additional results after you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  ///
  /// Parameter [quotaAppliedAtLevel] :
  /// Filters the response to return applied quota values for the
  /// <code>ACCOUNT</code>, <code>RESOURCE</code>, or <code>ALL</code> levels.
  /// <code>ACCOUNT</code> is the default.
  ///
  /// Parameter [quotaCode] :
  /// Specifies the quota identifier. To find the quota code for a specific
  /// quota, use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  Future<ListServiceQuotasResponse> listServiceQuotas({
    required String serviceCode,
    int? maxResults,
    String? nextToken,
    AppliedLevelEnum? quotaAppliedAtLevel,
    String? quotaCode,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.ListServiceQuotas'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceCode': serviceCode,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (quotaAppliedAtLevel != null)
          'QuotaAppliedAtLevel': quotaAppliedAtLevel.value,
        if (quotaCode != null) 'QuotaCode': quotaCode,
      },
    );

    return ListServiceQuotasResponse.fromJson(jsonResponse.body);
  }

  /// Lists the names and codes for the Amazon Web Services services integrated
  /// with Service Quotas.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// Specifies the maximum number of results that you want included on each
  /// page of the response. If you do not include this parameter, it defaults to
  /// a value appropriate to the operation. If additional items exist beyond
  /// those included in the current response, the <code>NextToken</code>
  /// response element is present and has a value (is not null). Include that
  /// value as the <code>NextToken</code> request parameter in the next call to
  /// the operation to get the next part of the results.
  /// <note>
  /// An API operation can return fewer results than the maximum even when there
  /// are more results available. You should check <code>NextToken</code> after
  /// every operation to ensure that you receive all of the results.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// Specifies a value for receiving additional results after you receive a
  /// <code>NextToken</code> response in a previous request. A
  /// <code>NextToken</code> response indicates that more output is available.
  /// Set this parameter to the value of the previous call's
  /// <code>NextToken</code> response to indicate where the output should
  /// continue from.
  Future<ListServicesResponse> listServices({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.ListServices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListServicesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of the tags assigned to the specified applied quota.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) for the applied quota for which you want to
  /// list tags. You can get this information by using the Service Quotas
  /// console, or by listing the quotas using the <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/service-quotas/list-service-quotas.html">list-service-quotas</a>
  /// CLI command or the <a
  /// href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_ListServiceQuotas.html">ListServiceQuotas</a>
  /// Amazon Web Services API operation.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Adds a quota increase request to your quota request template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoAvailableOrganizationException].
  /// May throw [NoSuchResourceException].
  /// May throw [QuotaExceededException].
  /// May throw [ServiceException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [awsRegion] :
  /// Specifies the Amazon Web Services Region to which the template applies.
  ///
  /// Parameter [desiredValue] :
  /// Specifies the new, increased value for the quota.
  ///
  /// Parameter [quotaCode] :
  /// Specifies the quota identifier. To find the quota code for a specific
  /// quota, use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  Future<PutServiceQuotaIncreaseRequestIntoTemplateResponse>
      putServiceQuotaIncreaseRequestIntoTemplate({
    required String awsRegion,
    required double desiredValue,
    required String quotaCode,
    required String serviceCode,
  }) async {
    _s.validateNumRange(
      'desiredValue',
      desiredValue,
      0,
      10000000000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'ServiceQuotasV20190624.PutServiceQuotaIncreaseRequestIntoTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AwsRegion': awsRegion,
        'DesiredValue': desiredValue,
        'QuotaCode': quotaCode,
        'ServiceCode': serviceCode,
      },
    );

    return PutServiceQuotaIncreaseRequestIntoTemplateResponse.fromJson(
        jsonResponse.body);
  }

  /// Submits a quota increase request for the specified quota at the account or
  /// resource level.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidResourceStateException].
  /// May throw [NoSuchResourceException].
  /// May throw [QuotaExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [desiredValue] :
  /// Specifies the new, increased value for the quota.
  ///
  /// Parameter [quotaCode] :
  /// Specifies the quota identifier. To find the quota code for a specific
  /// quota, use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  ///
  /// Parameter [contextId] :
  /// Specifies the resource with an Amazon Resource Name (ARN).
  ///
  /// Parameter [supportCaseAllowed] :
  /// Specifies if an Amazon Web Services Support case can be opened for the
  /// quota increase request. This parameter is optional.
  ///
  /// By default, this flag is set to <code>True</code> and Amazon Web Services
  /// may create a support case for some quota increase requests. You can set
  /// this flag to <code>False</code> if you do not want a support case created
  /// when you request a quota increase. If you set the flag to
  /// <code>False</code>, Amazon Web Services does not open a support case and
  /// updates the request status to <code>Not approved</code>.
  Future<RequestServiceQuotaIncreaseResponse> requestServiceQuotaIncrease({
    required double desiredValue,
    required String quotaCode,
    required String serviceCode,
    String? contextId,
    bool? supportCaseAllowed,
  }) async {
    _s.validateNumRange(
      'desiredValue',
      desiredValue,
      0,
      10000000000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.RequestServiceQuotaIncrease'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DesiredValue': desiredValue,
        'QuotaCode': quotaCode,
        'ServiceCode': serviceCode,
        if (contextId != null) 'ContextId': contextId,
        if (supportCaseAllowed != null)
          'SupportCaseAllowed': supportCaseAllowed,
      },
    );

    return RequestServiceQuotaIncreaseResponse.fromJson(jsonResponse.body);
  }

  /// Starts <a
  /// href="https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management.html">Service
  /// Quotas Automatic Management</a> for an Amazon Web Services account,
  /// including notification preferences and excluded quotas configurations.
  /// Automatic Management monitors your Service Quotas utilization and notifies
  /// you before you run out of your allocated quotas.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [optInLevel] :
  /// Sets the opt-in level for Automatic Management. Only Amazon Web Services
  /// account level is supported.
  ///
  /// Parameter [optInType] :
  /// Sets the opt-in type for Automatic Management. There are two modes: Notify
  /// only and Notify and Auto-Adjust. Currently, only NotifyOnly is available.
  ///
  /// Parameter [exclusionList] :
  /// List of Amazon Web Services services excluded from Automatic Management.
  /// You won't be notified of Service Quotas utilization for Amazon Web
  /// Services services added to the Automatic Management exclusion list.
  ///
  /// Parameter [notificationArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/notifications/latest/userguide/resource-level-permissions.html#rlp-table">User
  /// Notifications</a> Amazon Resource Name (ARN) for Automatic Management
  /// notifications.
  Future<void> startAutoManagement({
    required OptInLevel optInLevel,
    required OptInType optInType,
    Map<String, List<String>>? exclusionList,
    String? notificationArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.StartAutoManagement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OptInLevel': optInLevel.value,
        'OptInType': optInType.value,
        if (exclusionList != null) 'ExclusionList': exclusionList,
        if (notificationArn != null) 'NotificationArn': notificationArn,
      },
    );
  }

  /// Initiates the generation of a quota utilization report for your Amazon Web
  /// Services account. This asynchronous operation analyzes your quota usage
  /// across all Amazon Web Services services and returns a unique report
  /// identifier that you can use to retrieve the results.
  ///
  /// The report generation process may take several seconds to complete,
  /// depending on the number of quotas in your account. Use the
  /// <code>GetQuotaUtilizationReport</code> operation to check the status and
  /// retrieve the results when the report is ready.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  Future<StartQuotaUtilizationReportResponse>
      startQuotaUtilizationReport() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.StartQuotaUtilizationReport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return StartQuotaUtilizationReportResponse.fromJson(jsonResponse.body);
  }

  /// Stops <a
  /// href="https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management.html">Service
  /// Quotas Automatic Management</a> for an Amazon Web Services account and
  /// removes all associated configurations. Automatic Management monitors your
  /// Service Quotas utilization and notifies you before you run out of your
  /// allocated quotas.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  Future<void> stopAutoManagement() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.StopAutoManagement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Adds tags to the specified applied quota. You can include one or more tags
  /// to add to the quota.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TagPolicyViolationException].
  /// May throw [TooManyRequestsException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) for the applied quota. You can get this
  /// information by using the Service Quotas console, or by listing the quotas
  /// using the <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/service-quotas/list-service-quotas.html">list-service-quotas</a>
  /// CLI command or the <a
  /// href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_ListServiceQuotas.html">ListServiceQuotas</a>
  /// Amazon Web Services API operation.
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Removes tags from the specified applied quota. You can specify one or more
  /// tags to remove.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) for the applied quota that you want to
  /// untag. You can get this information by using the Service Quotas console,
  /// or by listing the quotas using the <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/service-quotas/list-service-quotas.html">list-service-quotas</a>
  /// CLI command or the <a
  /// href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_ListServiceQuotas.html">ListServiceQuotas</a>
  /// Amazon Web Services API operation.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags that you want to remove from the resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates your <a
  /// href="https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management.html">Service
  /// Quotas Automatic Management</a> configuration, including notification
  /// preferences and excluded quotas. Automatic Management monitors your
  /// Service Quotas utilization and notifies you before you run out of your
  /// allocated quotas.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [NoSuchResourceException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [exclusionList] :
  /// List of Amazon Web Services services you want to exclude from Automatic
  /// Management. You won't be notified of Service Quotas utilization for Amazon
  /// Web Services services added to the Automatic Management exclusion list.
  ///
  /// Parameter [notificationArn] :
  /// The <a
  /// href="https://docs.aws.amazon.com/notifications/latest/userguide/resource-level-permissions.html#rlp-table">User
  /// Notifications</a> Amazon Resource Name (ARN) for Automatic Management
  /// notifications you want to update.
  ///
  /// Parameter [optInType] :
  /// Information on the opt-in type for your Automatic Management
  /// configuration. There are two modes: Notify only and Notify and
  /// Auto-Adjust. Currently, only NotifyOnly is available.
  Future<void> updateAutoManagement({
    Map<String, List<String>>? exclusionList,
    String? notificationArn,
    OptInType? optInType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.UpdateAutoManagement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (exclusionList != null) 'ExclusionList': exclusionList,
        if (notificationArn != null) 'NotificationArn': notificationArn,
        if (optInType != null) 'OptInType': optInType.value,
      },
    );
  }
}

class AssociateServiceQuotaTemplateResponse {
  AssociateServiceQuotaTemplateResponse();

  factory AssociateServiceQuotaTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateServiceQuotaTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateSupportCaseResponse {
  CreateSupportCaseResponse();

  factory CreateSupportCaseResponse.fromJson(Map<String, dynamic> _) {
    return CreateSupportCaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteServiceQuotaIncreaseRequestFromTemplateResponse {
  DeleteServiceQuotaIncreaseRequestFromTemplateResponse();

  factory DeleteServiceQuotaIncreaseRequestFromTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteServiceQuotaIncreaseRequestFromTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateServiceQuotaTemplateResponse {
  DisassociateServiceQuotaTemplateResponse();

  factory DisassociateServiceQuotaTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateServiceQuotaTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetAssociationForServiceQuotaTemplateResponse {
  /// The association status. If the status is <code>ASSOCIATED</code>, the quota
  /// increase requests in the template are automatically applied to new Amazon
  /// Web Services accounts in your organization.
  final ServiceQuotaTemplateAssociationStatus?
      serviceQuotaTemplateAssociationStatus;

  GetAssociationForServiceQuotaTemplateResponse({
    this.serviceQuotaTemplateAssociationStatus,
  });

  factory GetAssociationForServiceQuotaTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAssociationForServiceQuotaTemplateResponse(
      serviceQuotaTemplateAssociationStatus:
          (json['ServiceQuotaTemplateAssociationStatus'] as String?)
              ?.let(ServiceQuotaTemplateAssociationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceQuotaTemplateAssociationStatus =
        this.serviceQuotaTemplateAssociationStatus;
    return {
      if (serviceQuotaTemplateAssociationStatus != null)
        'ServiceQuotaTemplateAssociationStatus':
            serviceQuotaTemplateAssociationStatus.value,
    };
  }
}

class GetAutoManagementConfigurationResponse {
  /// List of Amazon Web Services services excluded from Automatic Management. You
  /// won't be notified of Service Quotas utilization for Amazon Web Services
  /// services added to the Automatic Management exclusion list.
  final Map<String, List<QuotaInfo>>? exclusionList;

  /// The <a
  /// href="https://docs.aws.amazon.com/notifications/latest/userguide/resource-level-permissions.html#rlp-table">User
  /// Notifications</a> Amazon Resource Name (ARN) for Automatic Management
  /// notifications.
  final String? notificationArn;

  /// Information on the opt-in level for Automatic Management. Only Amazon Web
  /// Services account level is supported.
  final OptInLevel? optInLevel;

  /// Status on whether Automatic Management is started or stopped.
  final OptInStatus? optInStatus;

  /// Information on the opt-in type for Automatic Management. There are two
  /// modes: Notify only and Notify and Auto-Adjust. Currently, only NotifyOnly is
  /// available.
  final OptInType? optInType;

  GetAutoManagementConfigurationResponse({
    this.exclusionList,
    this.notificationArn,
    this.optInLevel,
    this.optInStatus,
    this.optInType,
  });

  factory GetAutoManagementConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAutoManagementConfigurationResponse(
      exclusionList: (json['ExclusionList'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) => QuotaInfo.fromJson(e as Map<String, dynamic>))
                  .toList())),
      notificationArn: json['NotificationArn'] as String?,
      optInLevel: (json['OptInLevel'] as String?)?.let(OptInLevel.fromString),
      optInStatus:
          (json['OptInStatus'] as String?)?.let(OptInStatus.fromString),
      optInType: (json['OptInType'] as String?)?.let(OptInType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final exclusionList = this.exclusionList;
    final notificationArn = this.notificationArn;
    final optInLevel = this.optInLevel;
    final optInStatus = this.optInStatus;
    final optInType = this.optInType;
    return {
      if (exclusionList != null) 'ExclusionList': exclusionList,
      if (notificationArn != null) 'NotificationArn': notificationArn,
      if (optInLevel != null) 'OptInLevel': optInLevel.value,
      if (optInStatus != null) 'OptInStatus': optInStatus.value,
      if (optInType != null) 'OptInType': optInType.value,
    };
  }
}

class GetAWSDefaultServiceQuotaResponse {
  /// Information about the quota.
  final ServiceQuota? quota;

  GetAWSDefaultServiceQuotaResponse({
    this.quota,
  });

  factory GetAWSDefaultServiceQuotaResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAWSDefaultServiceQuotaResponse(
      quota: json['Quota'] != null
          ? ServiceQuota.fromJson(json['Quota'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final quota = this.quota;
    return {
      if (quota != null) 'Quota': quota,
    };
  }
}

class GetQuotaUtilizationReportResponse {
  /// An error code indicating the reason for failure when the report status is
  /// <code>FAILED</code>. This field is only present when the status is
  /// <code>FAILED</code>.
  final String? errorCode;

  /// A detailed error message describing the failure when the report status is
  /// <code>FAILED</code>. This field is only present when the status is
  /// <code>FAILED</code>.
  final String? errorMessage;

  /// The timestamp when the report was generated, in ISO 8601 format.
  final DateTime? generatedAt;

  /// A token that indicates more results are available. Include this token in the
  /// next request to retrieve the next page of results. If this field is not
  /// present, you have retrieved all available results.
  final String? nextToken;

  /// A list of quota utilization records, sorted by utilization percentage in
  /// descending order. Each record includes the quota code, service code, service
  /// name, quota name, namespace, utilization percentage, default value, applied
  /// value, and whether the quota is adjustable. Up to 1,000 records are returned
  /// per page.
  final List<QuotaUtilizationInfo>? quotas;

  /// The unique identifier for the quota utilization report.
  final String? reportId;

  /// The current status of the report generation. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> - The report generation is in progress. Retry this
  /// operation after a few seconds.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> - The report is being processed. Continue polling
  /// until the status changes to <code>COMPLETED</code>.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code> - The report is ready and quota utilization data is
  /// available in the response.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The report generation failed. Check the
  /// <code>ErrorCode</code> and <code>ErrorMessage</code> fields for details.
  /// </li>
  /// </ul>
  final ReportStatus? status;

  /// The total number of quotas included in the report across all pages.
  final int? totalCount;

  GetQuotaUtilizationReportResponse({
    this.errorCode,
    this.errorMessage,
    this.generatedAt,
    this.nextToken,
    this.quotas,
    this.reportId,
    this.status,
    this.totalCount,
  });

  factory GetQuotaUtilizationReportResponse.fromJson(
      Map<String, dynamic> json) {
    return GetQuotaUtilizationReportResponse(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      generatedAt: timeStampFromJson(json['GeneratedAt']),
      nextToken: json['NextToken'] as String?,
      quotas: (json['Quotas'] as List?)
          ?.nonNulls
          .map((e) => QuotaUtilizationInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      reportId: json['ReportId'] as String?,
      status: (json['Status'] as String?)?.let(ReportStatus.fromString),
      totalCount: json['TotalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final generatedAt = this.generatedAt;
    final nextToken = this.nextToken;
    final quotas = this.quotas;
    final reportId = this.reportId;
    final status = this.status;
    final totalCount = this.totalCount;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (generatedAt != null) 'GeneratedAt': unixTimestampToJson(generatedAt),
      if (nextToken != null) 'NextToken': nextToken,
      if (quotas != null) 'Quotas': quotas,
      if (reportId != null) 'ReportId': reportId,
      if (status != null) 'Status': status.value,
      if (totalCount != null) 'TotalCount': totalCount,
    };
  }
}

class GetRequestedServiceQuotaChangeResponse {
  /// Information about the quota increase request.
  final RequestedServiceQuotaChange? requestedQuota;

  GetRequestedServiceQuotaChangeResponse({
    this.requestedQuota,
  });

  factory GetRequestedServiceQuotaChangeResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRequestedServiceQuotaChangeResponse(
      requestedQuota: json['RequestedQuota'] != null
          ? RequestedServiceQuotaChange.fromJson(
              json['RequestedQuota'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestedQuota = this.requestedQuota;
    return {
      if (requestedQuota != null) 'RequestedQuota': requestedQuota,
    };
  }
}

class GetServiceQuotaResponse {
  /// Information about the quota.
  final ServiceQuota? quota;

  GetServiceQuotaResponse({
    this.quota,
  });

  factory GetServiceQuotaResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceQuotaResponse(
      quota: json['Quota'] != null
          ? ServiceQuota.fromJson(json['Quota'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final quota = this.quota;
    return {
      if (quota != null) 'Quota': quota,
    };
  }
}

class GetServiceQuotaIncreaseRequestFromTemplateResponse {
  /// Information about the quota increase request.
  final ServiceQuotaIncreaseRequestInTemplate?
      serviceQuotaIncreaseRequestInTemplate;

  GetServiceQuotaIncreaseRequestFromTemplateResponse({
    this.serviceQuotaIncreaseRequestInTemplate,
  });

  factory GetServiceQuotaIncreaseRequestFromTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return GetServiceQuotaIncreaseRequestFromTemplateResponse(
      serviceQuotaIncreaseRequestInTemplate:
          json['ServiceQuotaIncreaseRequestInTemplate'] != null
              ? ServiceQuotaIncreaseRequestInTemplate.fromJson(
                  json['ServiceQuotaIncreaseRequestInTemplate']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceQuotaIncreaseRequestInTemplate =
        this.serviceQuotaIncreaseRequestInTemplate;
    return {
      if (serviceQuotaIncreaseRequestInTemplate != null)
        'ServiceQuotaIncreaseRequestInTemplate':
            serviceQuotaIncreaseRequestInTemplate,
    };
  }
}

class ListAWSDefaultServiceQuotasResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  final String? nextToken;

  /// Information about the quotas.
  final List<ServiceQuota>? quotas;

  ListAWSDefaultServiceQuotasResponse({
    this.nextToken,
    this.quotas,
  });

  factory ListAWSDefaultServiceQuotasResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAWSDefaultServiceQuotasResponse(
      nextToken: json['NextToken'] as String?,
      quotas: (json['Quotas'] as List?)
          ?.nonNulls
          .map((e) => ServiceQuota.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final quotas = this.quotas;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (quotas != null) 'Quotas': quotas,
    };
  }
}

class ListRequestedServiceQuotaChangeHistoryResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  final String? nextToken;

  /// Information about the quota increase requests.
  final List<RequestedServiceQuotaChange>? requestedQuotas;

  ListRequestedServiceQuotaChangeHistoryResponse({
    this.nextToken,
    this.requestedQuotas,
  });

  factory ListRequestedServiceQuotaChangeHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRequestedServiceQuotaChangeHistoryResponse(
      nextToken: json['NextToken'] as String?,
      requestedQuotas: (json['RequestedQuotas'] as List?)
          ?.nonNulls
          .map((e) =>
              RequestedServiceQuotaChange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final requestedQuotas = this.requestedQuotas;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (requestedQuotas != null) 'RequestedQuotas': requestedQuotas,
    };
  }
}

class ListRequestedServiceQuotaChangeHistoryByQuotaResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  final String? nextToken;

  /// Information about the quota increase requests.
  final List<RequestedServiceQuotaChange>? requestedQuotas;

  ListRequestedServiceQuotaChangeHistoryByQuotaResponse({
    this.nextToken,
    this.requestedQuotas,
  });

  factory ListRequestedServiceQuotaChangeHistoryByQuotaResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRequestedServiceQuotaChangeHistoryByQuotaResponse(
      nextToken: json['NextToken'] as String?,
      requestedQuotas: (json['RequestedQuotas'] as List?)
          ?.nonNulls
          .map((e) =>
              RequestedServiceQuotaChange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final requestedQuotas = this.requestedQuotas;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (requestedQuotas != null) 'RequestedQuotas': requestedQuotas,
    };
  }
}

class ListServiceQuotaIncreaseRequestsInTemplateResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  final String? nextToken;

  /// Information about the quota increase requests.
  final List<ServiceQuotaIncreaseRequestInTemplate>?
      serviceQuotaIncreaseRequestInTemplateList;

  ListServiceQuotaIncreaseRequestsInTemplateResponse({
    this.nextToken,
    this.serviceQuotaIncreaseRequestInTemplateList,
  });

  factory ListServiceQuotaIncreaseRequestsInTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return ListServiceQuotaIncreaseRequestsInTemplateResponse(
      nextToken: json['NextToken'] as String?,
      serviceQuotaIncreaseRequestInTemplateList:
          (json['ServiceQuotaIncreaseRequestInTemplateList'] as List?)
              ?.nonNulls
              .map((e) => ServiceQuotaIncreaseRequestInTemplate.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serviceQuotaIncreaseRequestInTemplateList =
        this.serviceQuotaIncreaseRequestInTemplateList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (serviceQuotaIncreaseRequestInTemplateList != null)
        'ServiceQuotaIncreaseRequestInTemplateList':
            serviceQuotaIncreaseRequestInTemplateList,
    };
  }
}

class ListServiceQuotasResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  final String? nextToken;

  /// Information about the quotas.
  final List<ServiceQuota>? quotas;

  ListServiceQuotasResponse({
    this.nextToken,
    this.quotas,
  });

  factory ListServiceQuotasResponse.fromJson(Map<String, dynamic> json) {
    return ListServiceQuotasResponse(
      nextToken: json['NextToken'] as String?,
      quotas: (json['Quotas'] as List?)
          ?.nonNulls
          .map((e) => ServiceQuota.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final quotas = this.quotas;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (quotas != null) 'Quotas': quotas,
    };
  }
}

class ListServicesResponse {
  /// If present, indicates that more output is available than is included in the
  /// current response. Use this value in the <code>NextToken</code> request
  /// parameter in a subsequent call to the operation to get the next part of the
  /// output. You should repeat this until the <code>NextToken</code> response
  /// element comes back as <code>null</code>.
  final String? nextToken;

  /// The list of the Amazon Web Services service names and service codes.
  final List<ServiceInfo>? services;

  ListServicesResponse({
    this.nextToken,
    this.services,
  });

  factory ListServicesResponse.fromJson(Map<String, dynamic> json) {
    return ListServicesResponse(
      nextToken: json['NextToken'] as String?,
      services: (json['Services'] as List?)
          ?.nonNulls
          .map((e) => ServiceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final services = this.services;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (services != null) 'Services': services,
    };
  }
}

class ListTagsForResourceResponse {
  /// A complex data type that contains zero or more tag elements.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class PutServiceQuotaIncreaseRequestIntoTemplateResponse {
  /// Information about the quota increase request.
  final ServiceQuotaIncreaseRequestInTemplate?
      serviceQuotaIncreaseRequestInTemplate;

  PutServiceQuotaIncreaseRequestIntoTemplateResponse({
    this.serviceQuotaIncreaseRequestInTemplate,
  });

  factory PutServiceQuotaIncreaseRequestIntoTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return PutServiceQuotaIncreaseRequestIntoTemplateResponse(
      serviceQuotaIncreaseRequestInTemplate:
          json['ServiceQuotaIncreaseRequestInTemplate'] != null
              ? ServiceQuotaIncreaseRequestInTemplate.fromJson(
                  json['ServiceQuotaIncreaseRequestInTemplate']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceQuotaIncreaseRequestInTemplate =
        this.serviceQuotaIncreaseRequestInTemplate;
    return {
      if (serviceQuotaIncreaseRequestInTemplate != null)
        'ServiceQuotaIncreaseRequestInTemplate':
            serviceQuotaIncreaseRequestInTemplate,
    };
  }
}

class RequestServiceQuotaIncreaseResponse {
  /// Information about the quota increase request.
  final RequestedServiceQuotaChange? requestedQuota;

  RequestServiceQuotaIncreaseResponse({
    this.requestedQuota,
  });

  factory RequestServiceQuotaIncreaseResponse.fromJson(
      Map<String, dynamic> json) {
    return RequestServiceQuotaIncreaseResponse(
      requestedQuota: json['RequestedQuota'] != null
          ? RequestedServiceQuotaChange.fromJson(
              json['RequestedQuota'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requestedQuota = this.requestedQuota;
    return {
      if (requestedQuota != null) 'RequestedQuota': requestedQuota,
    };
  }
}

class StartAutoManagementResponse {
  StartAutoManagementResponse();

  factory StartAutoManagementResponse.fromJson(Map<String, dynamic> _) {
    return StartAutoManagementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartQuotaUtilizationReportResponse {
  /// An optional message providing additional information about the report
  /// generation status. This field may contain details about the report
  /// initiation or indicate if an existing recent report is being reused.
  final String? message;

  /// A unique identifier for the quota utilization report. Use this identifier
  /// with the <code>GetQuotaUtilizationReport</code> operation to retrieve the
  /// report results.
  final String? reportId;

  /// The current status of the report generation. The status will be
  /// <code>PENDING</code> when the report is first initiated.
  final ReportStatus? status;

  StartQuotaUtilizationReportResponse({
    this.message,
    this.reportId,
    this.status,
  });

  factory StartQuotaUtilizationReportResponse.fromJson(
      Map<String, dynamic> json) {
    return StartQuotaUtilizationReportResponse(
      message: json['Message'] as String?,
      reportId: json['ReportId'] as String?,
      status: (json['Status'] as String?)?.let(ReportStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final reportId = this.reportId;
    final status = this.status;
    return {
      if (message != null) 'Message': message,
      if (reportId != null) 'ReportId': reportId,
      if (status != null) 'Status': status.value,
    };
  }
}

class StopAutoManagementResponse {
  StopAutoManagementResponse();

  factory StopAutoManagementResponse.fromJson(Map<String, dynamic> _) {
    return StopAutoManagementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAutoManagementResponse {
  UpdateAutoManagementResponse();

  factory UpdateAutoManagementResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAutoManagementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class OptInType {
  static const notifyOnly = OptInType._('NotifyOnly');
  static const notifyAndAdjust = OptInType._('NotifyAndAdjust');

  final String value;

  const OptInType._(this.value);

  static const values = [notifyOnly, notifyAndAdjust];

  static OptInType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OptInType._(value));

  @override
  bool operator ==(other) => other is OptInType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A complex data type that contains a tag key and tag value.
class Tag {
  /// A string that contains a tag key. The string length should be between 1 and
  /// 128 characters. Valid characters include a-z, A-Z, 0-9, space, and the
  /// special characters _ - . : / = + @.
  final String key;

  /// A string that contains an optional tag value. The string length should be
  /// between 0 and 256 characters. Valid characters include a-z, A-Z, 0-9, space,
  /// and the special characters _ - . : / = + @.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

class ReportStatus {
  static const pending = ReportStatus._('PENDING');
  static const inProgress = ReportStatus._('IN_PROGRESS');
  static const completed = ReportStatus._('COMPLETED');
  static const failed = ReportStatus._('FAILED');

  final String value;

  const ReportStatus._(this.value);

  static const values = [pending, inProgress, completed, failed];

  static ReportStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReportStatus._(value));

  @override
  bool operator ==(other) => other is ReportStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class OptInLevel {
  static const account = OptInLevel._('ACCOUNT');

  final String value;

  const OptInLevel._(this.value);

  static const values = [account];

  static OptInLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OptInLevel._(value));

  @override
  bool operator ==(other) => other is OptInLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a quota increase request.
class RequestedServiceQuotaChange {
  /// The case ID.
  final String? caseId;

  /// The date and time when the quota increase request was received and the case
  /// ID was created.
  final DateTime? created;

  /// The new, increased value for the quota.
  final double? desiredValue;

  /// Indicates whether the quota is global.
  final bool? globalQuota;

  /// The unique identifier.
  final String? id;

  /// The date and time of the most recent change.
  final DateTime? lastUpdated;

  /// The Amazon Resource Name (ARN) of the quota.
  final String? quotaArn;

  /// Specifies the quota identifier. To find the quota code for a specific quota,
  /// use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  final String? quotaCode;

  /// The context for this service quota.
  final QuotaContextInfo? quotaContext;

  /// Specifies the quota name.
  final String? quotaName;

  /// Filters the response to return quota requests for the <code>ACCOUNT</code>,
  /// <code>RESOURCE</code>, or <code>ALL</code> levels. <code>ACCOUNT</code> is
  /// the default.
  final AppliedLevelEnum? quotaRequestedAtLevel;

  /// The type of quota increase request. Possible values include:
  ///
  /// <ul>
  /// <li>
  /// <code>AutomaticManagement</code> - The request was automatically created by
  /// Service Quotas Automatic Management when quota utilization approached the
  /// limit.
  /// </li>
  /// </ul>
  /// If this field is not present, the request was manually created by a user.
  final RequestType? requestType;

  /// The IAM identity of the requester.
  final String? requester;

  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  final String? serviceCode;

  /// Specifies the service name.
  final String? serviceName;

  /// The state of the quota increase request.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>: The quota increase request is under review by Amazon
  /// Web Services.
  /// </li>
  /// <li>
  /// <code>CASE_OPENED</code>: Service Quotas opened a support case to process
  /// the quota increase request. Follow-up on the support case for more
  /// information.
  /// </li>
  /// <li>
  /// <code>APPROVED</code>: The quota increase request is approved.
  /// </li>
  /// <li>
  /// <code>DENIED</code>: The quota increase request can't be approved by Service
  /// Quotas. Contact Amazon Web Services Support for more details.
  /// </li>
  /// <li>
  /// <code>NOT APPROVED</code>: The quota increase request can't be approved by
  /// Service Quotas. Contact Amazon Web Services Support for more details.
  /// </li>
  /// <li>
  /// <code>CASE_CLOSED</code>: The support case associated with this quota
  /// increase request was closed. Check the support case correspondence for the
  /// outcome of your quota request.
  /// </li>
  /// <li>
  /// <code>INVALID_REQUEST</code>: Service Quotas couldn't process your
  /// resource-level quota increase request because the Amazon Resource Name (ARN)
  /// specified as part of the <code>ContextId</code> is invalid.
  /// </li>
  /// </ul>
  final RequestStatus? status;

  /// The unit of measurement.
  final String? unit;

  RequestedServiceQuotaChange({
    this.caseId,
    this.created,
    this.desiredValue,
    this.globalQuota,
    this.id,
    this.lastUpdated,
    this.quotaArn,
    this.quotaCode,
    this.quotaContext,
    this.quotaName,
    this.quotaRequestedAtLevel,
    this.requestType,
    this.requester,
    this.serviceCode,
    this.serviceName,
    this.status,
    this.unit,
  });

  factory RequestedServiceQuotaChange.fromJson(Map<String, dynamic> json) {
    return RequestedServiceQuotaChange(
      caseId: json['CaseId'] as String?,
      created: timeStampFromJson(json['Created']),
      desiredValue: json['DesiredValue'] as double?,
      globalQuota: json['GlobalQuota'] as bool?,
      id: json['Id'] as String?,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      quotaArn: json['QuotaArn'] as String?,
      quotaCode: json['QuotaCode'] as String?,
      quotaContext: json['QuotaContext'] != null
          ? QuotaContextInfo.fromJson(
              json['QuotaContext'] as Map<String, dynamic>)
          : null,
      quotaName: json['QuotaName'] as String?,
      quotaRequestedAtLevel: (json['QuotaRequestedAtLevel'] as String?)
          ?.let(AppliedLevelEnum.fromString),
      requestType:
          (json['RequestType'] as String?)?.let(RequestType.fromString),
      requester: json['Requester'] as String?,
      serviceCode: json['ServiceCode'] as String?,
      serviceName: json['ServiceName'] as String?,
      status: (json['Status'] as String?)?.let(RequestStatus.fromString),
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final caseId = this.caseId;
    final created = this.created;
    final desiredValue = this.desiredValue;
    final globalQuota = this.globalQuota;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final quotaArn = this.quotaArn;
    final quotaCode = this.quotaCode;
    final quotaContext = this.quotaContext;
    final quotaName = this.quotaName;
    final quotaRequestedAtLevel = this.quotaRequestedAtLevel;
    final requestType = this.requestType;
    final requester = this.requester;
    final serviceCode = this.serviceCode;
    final serviceName = this.serviceName;
    final status = this.status;
    final unit = this.unit;
    return {
      if (caseId != null) 'CaseId': caseId,
      if (created != null) 'Created': unixTimestampToJson(created),
      if (desiredValue != null) 'DesiredValue': desiredValue,
      if (globalQuota != null) 'GlobalQuota': globalQuota,
      if (id != null) 'Id': id,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (quotaArn != null) 'QuotaArn': quotaArn,
      if (quotaCode != null) 'QuotaCode': quotaCode,
      if (quotaContext != null) 'QuotaContext': quotaContext,
      if (quotaName != null) 'QuotaName': quotaName,
      if (quotaRequestedAtLevel != null)
        'QuotaRequestedAtLevel': quotaRequestedAtLevel.value,
      if (requestType != null) 'RequestType': requestType.value,
      if (requester != null) 'Requester': requester,
      if (serviceCode != null) 'ServiceCode': serviceCode,
      if (serviceName != null) 'ServiceName': serviceName,
      if (status != null) 'Status': status.value,
      if (unit != null) 'Unit': unit,
    };
  }
}

class RequestType {
  static const automaticManagement = RequestType._('AutomaticManagement');

  final String value;

  const RequestType._(this.value);

  static const values = [automaticManagement];

  static RequestType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RequestType._(value));

  @override
  bool operator ==(other) => other is RequestType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class RequestStatus {
  static const pending = RequestStatus._('PENDING');
  static const caseOpened = RequestStatus._('CASE_OPENED');
  static const approved = RequestStatus._('APPROVED');
  static const denied = RequestStatus._('DENIED');
  static const caseClosed = RequestStatus._('CASE_CLOSED');
  static const notApproved = RequestStatus._('NOT_APPROVED');
  static const invalidRequest = RequestStatus._('INVALID_REQUEST');

  final String value;

  const RequestStatus._(this.value);

  static const values = [
    pending,
    caseOpened,
    approved,
    denied,
    caseClosed,
    notApproved,
    invalidRequest
  ];

  static RequestStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RequestStatus._(value));

  @override
  bool operator ==(other) => other is RequestStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AppliedLevelEnum {
  static const account = AppliedLevelEnum._('ACCOUNT');
  static const resource = AppliedLevelEnum._('RESOURCE');
  static const all = AppliedLevelEnum._('ALL');

  final String value;

  const AppliedLevelEnum._(this.value);

  static const values = [account, resource, all];

  static AppliedLevelEnum fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AppliedLevelEnum._(value));

  @override
  bool operator ==(other) => other is AppliedLevelEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that describes the context for a resource-level quota. For
/// resource-level quotas, such as <code>Instances per OpenSearch Service
/// Domain</code>, you can apply the quota value at the resource-level for each
/// OpenSearch Service Domain in your Amazon Web Services account. Together the
/// attributes of this structure help you understand how the quota is
/// implemented by Amazon Web Services and how you can manage it. For quotas
/// such as <code>Amazon OpenSearch Service Domains</code> which can be managed
/// at the account-level for each Amazon Web Services Region, the
/// <code>QuotaContext</code> field is absent. See the attribute descriptions
/// below to further understand how to use them.
class QuotaContextInfo {
  /// Specifies the resource, or resources, to which the quota applies. The value
  /// for this field is either an Amazon Resource Name (ARN) or *. If the value is
  /// an ARN, the quota value applies to that resource. If the value is *, then
  /// the quota value applies to all resources listed in the
  /// <code>ContextScopeType</code> field. The quota value applies to all
  /// resources for which you haven’t previously applied a quota value, and any
  /// new resources you create in your Amazon Web Services account.
  final String? contextId;

  /// Specifies the scope to which the quota value is applied. If the scope is
  /// <code>RESOURCE</code>, the quota value is applied to each resource in the
  /// Amazon Web Services account. If the scope is <code>ACCOUNT</code>, the quota
  /// value is applied to the Amazon Web Services account.
  final QuotaContextScope? contextScope;

  /// Specifies the resource type to which the quota can be applied.
  final String? contextScopeType;

  QuotaContextInfo({
    this.contextId,
    this.contextScope,
    this.contextScopeType,
  });

  factory QuotaContextInfo.fromJson(Map<String, dynamic> json) {
    return QuotaContextInfo(
      contextId: json['ContextId'] as String?,
      contextScope:
          (json['ContextScope'] as String?)?.let(QuotaContextScope.fromString),
      contextScopeType: json['ContextScopeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contextId = this.contextId;
    final contextScope = this.contextScope;
    final contextScopeType = this.contextScopeType;
    return {
      if (contextId != null) 'ContextId': contextId,
      if (contextScope != null) 'ContextScope': contextScope.value,
      if (contextScopeType != null) 'ContextScopeType': contextScopeType,
    };
  }
}

class QuotaContextScope {
  static const resource = QuotaContextScope._('RESOURCE');
  static const account = QuotaContextScope._('ACCOUNT');

  final String value;

  const QuotaContextScope._(this.value);

  static const values = [resource, account];

  static QuotaContextScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QuotaContextScope._(value));

  @override
  bool operator ==(other) => other is QuotaContextScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a quota increase request.
class ServiceQuotaIncreaseRequestInTemplate {
  /// The Amazon Web Services Region.
  final String? awsRegion;

  /// The new, increased value of the quota.
  final double? desiredValue;

  /// Indicates whether the quota is global.
  final bool? globalQuota;

  /// Specifies the quota identifier. To find the quota code for a specific quota,
  /// use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  final String? quotaCode;

  /// Specifies the quota name.
  final String? quotaName;

  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  final String? serviceCode;

  /// Specifies the service name.
  final String? serviceName;

  /// The unit of measurement.
  final String? unit;

  ServiceQuotaIncreaseRequestInTemplate({
    this.awsRegion,
    this.desiredValue,
    this.globalQuota,
    this.quotaCode,
    this.quotaName,
    this.serviceCode,
    this.serviceName,
    this.unit,
  });

  factory ServiceQuotaIncreaseRequestInTemplate.fromJson(
      Map<String, dynamic> json) {
    return ServiceQuotaIncreaseRequestInTemplate(
      awsRegion: json['AwsRegion'] as String?,
      desiredValue: json['DesiredValue'] as double?,
      globalQuota: json['GlobalQuota'] as bool?,
      quotaCode: json['QuotaCode'] as String?,
      quotaName: json['QuotaName'] as String?,
      serviceCode: json['ServiceCode'] as String?,
      serviceName: json['ServiceName'] as String?,
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final desiredValue = this.desiredValue;
    final globalQuota = this.globalQuota;
    final quotaCode = this.quotaCode;
    final quotaName = this.quotaName;
    final serviceCode = this.serviceCode;
    final serviceName = this.serviceName;
    final unit = this.unit;
    return {
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (desiredValue != null) 'DesiredValue': desiredValue,
      if (globalQuota != null) 'GlobalQuota': globalQuota,
      if (quotaCode != null) 'QuotaCode': quotaCode,
      if (quotaName != null) 'QuotaName': quotaName,
      if (serviceCode != null) 'ServiceCode': serviceCode,
      if (serviceName != null) 'ServiceName': serviceName,
      if (unit != null) 'Unit': unit,
    };
  }
}

/// Information about an Amazon Web Services service.
class ServiceInfo {
  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  final String? serviceCode;

  /// Specifies the service name.
  final String? serviceName;

  ServiceInfo({
    this.serviceCode,
    this.serviceName,
  });

  factory ServiceInfo.fromJson(Map<String, dynamic> json) {
    return ServiceInfo(
      serviceCode: json['ServiceCode'] as String?,
      serviceName: json['ServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceCode = this.serviceCode;
    final serviceName = this.serviceName;
    return {
      if (serviceCode != null) 'ServiceCode': serviceCode,
      if (serviceName != null) 'ServiceName': serviceName,
    };
  }
}

/// Information about a quota.
class ServiceQuota {
  /// Indicates whether the quota value can be increased.
  final bool? adjustable;

  /// The quota description.
  final String? description;

  /// The error code and error reason.
  final ErrorReason? errorReason;

  /// Indicates whether the quota is global.
  final bool? globalQuota;

  /// The period of time.
  final QuotaPeriod? period;

  /// Filters the response to return applied quota values for the
  /// <code>ACCOUNT</code>, <code>RESOURCE</code>, or <code>ALL</code> levels.
  /// <code>ACCOUNT</code> is the default.
  final AppliedLevelEnum? quotaAppliedAtLevel;

  /// The Amazon Resource Name (ARN) of the quota.
  final String? quotaArn;

  /// Specifies the quota identifier. To find the quota code for a specific quota,
  /// use the <a>ListServiceQuotas</a> operation, and look for the
  /// <code>QuotaCode</code> response in the output for the quota you want.
  final String? quotaCode;

  /// The context for this service quota.
  final QuotaContextInfo? quotaContext;

  /// Specifies the quota name.
  final String? quotaName;

  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  final String? serviceCode;

  /// Specifies the service name.
  final String? serviceName;

  /// The unit of measurement.
  final String? unit;

  /// Information about the measurement.
  final MetricInfo? usageMetric;

  /// The quota value.
  final double? value;

  ServiceQuota({
    this.adjustable,
    this.description,
    this.errorReason,
    this.globalQuota,
    this.period,
    this.quotaAppliedAtLevel,
    this.quotaArn,
    this.quotaCode,
    this.quotaContext,
    this.quotaName,
    this.serviceCode,
    this.serviceName,
    this.unit,
    this.usageMetric,
    this.value,
  });

  factory ServiceQuota.fromJson(Map<String, dynamic> json) {
    return ServiceQuota(
      adjustable: json['Adjustable'] as bool?,
      description: json['Description'] as String?,
      errorReason: json['ErrorReason'] != null
          ? ErrorReason.fromJson(json['ErrorReason'] as Map<String, dynamic>)
          : null,
      globalQuota: json['GlobalQuota'] as bool?,
      period: json['Period'] != null
          ? QuotaPeriod.fromJson(json['Period'] as Map<String, dynamic>)
          : null,
      quotaAppliedAtLevel: (json['QuotaAppliedAtLevel'] as String?)
          ?.let(AppliedLevelEnum.fromString),
      quotaArn: json['QuotaArn'] as String?,
      quotaCode: json['QuotaCode'] as String?,
      quotaContext: json['QuotaContext'] != null
          ? QuotaContextInfo.fromJson(
              json['QuotaContext'] as Map<String, dynamic>)
          : null,
      quotaName: json['QuotaName'] as String?,
      serviceCode: json['ServiceCode'] as String?,
      serviceName: json['ServiceName'] as String?,
      unit: json['Unit'] as String?,
      usageMetric: json['UsageMetric'] != null
          ? MetricInfo.fromJson(json['UsageMetric'] as Map<String, dynamic>)
          : null,
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final adjustable = this.adjustable;
    final description = this.description;
    final errorReason = this.errorReason;
    final globalQuota = this.globalQuota;
    final period = this.period;
    final quotaAppliedAtLevel = this.quotaAppliedAtLevel;
    final quotaArn = this.quotaArn;
    final quotaCode = this.quotaCode;
    final quotaContext = this.quotaContext;
    final quotaName = this.quotaName;
    final serviceCode = this.serviceCode;
    final serviceName = this.serviceName;
    final unit = this.unit;
    final usageMetric = this.usageMetric;
    final value = this.value;
    return {
      if (adjustable != null) 'Adjustable': adjustable,
      if (description != null) 'Description': description,
      if (errorReason != null) 'ErrorReason': errorReason,
      if (globalQuota != null) 'GlobalQuota': globalQuota,
      if (period != null) 'Period': period,
      if (quotaAppliedAtLevel != null)
        'QuotaAppliedAtLevel': quotaAppliedAtLevel.value,
      if (quotaArn != null) 'QuotaArn': quotaArn,
      if (quotaCode != null) 'QuotaCode': quotaCode,
      if (quotaContext != null) 'QuotaContext': quotaContext,
      if (quotaName != null) 'QuotaName': quotaName,
      if (serviceCode != null) 'ServiceCode': serviceCode,
      if (serviceName != null) 'ServiceName': serviceName,
      if (unit != null) 'Unit': unit,
      if (usageMetric != null) 'UsageMetric': usageMetric,
      if (value != null) 'Value': value,
    };
  }
}

/// Information about the CloudWatch metric that reflects quota usage.
class MetricInfo {
  /// The metric dimension. This is a name/value pair that is part of the identity
  /// of a metric.
  final Map<String, String>? metricDimensions;

  /// The name of the metric.
  final String? metricName;

  /// The namespace of the metric.
  final String? metricNamespace;

  /// The metric statistic that we recommend you use when determining quota usage.
  final String? metricStatisticRecommendation;

  MetricInfo({
    this.metricDimensions,
    this.metricName,
    this.metricNamespace,
    this.metricStatisticRecommendation,
  });

  factory MetricInfo.fromJson(Map<String, dynamic> json) {
    return MetricInfo(
      metricDimensions: (json['MetricDimensions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      metricName: json['MetricName'] as String?,
      metricNamespace: json['MetricNamespace'] as String?,
      metricStatisticRecommendation:
          json['MetricStatisticRecommendation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDimensions = this.metricDimensions;
    final metricName = this.metricName;
    final metricNamespace = this.metricNamespace;
    final metricStatisticRecommendation = this.metricStatisticRecommendation;
    return {
      if (metricDimensions != null) 'MetricDimensions': metricDimensions,
      if (metricName != null) 'MetricName': metricName,
      if (metricNamespace != null) 'MetricNamespace': metricNamespace,
      if (metricStatisticRecommendation != null)
        'MetricStatisticRecommendation': metricStatisticRecommendation,
    };
  }
}

/// Information about the quota period.
class QuotaPeriod {
  /// The time unit.
  final PeriodUnit? periodUnit;

  /// The value associated with the reported <code>PeriodUnit</code>.
  final int? periodValue;

  QuotaPeriod({
    this.periodUnit,
    this.periodValue,
  });

  factory QuotaPeriod.fromJson(Map<String, dynamic> json) {
    return QuotaPeriod(
      periodUnit: (json['PeriodUnit'] as String?)?.let(PeriodUnit.fromString),
      periodValue: json['PeriodValue'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final periodUnit = this.periodUnit;
    final periodValue = this.periodValue;
    return {
      if (periodUnit != null) 'PeriodUnit': periodUnit.value,
      if (periodValue != null) 'PeriodValue': periodValue,
    };
  }
}

/// An error that explains why an action did not succeed.
class ErrorReason {
  /// Service Quotas returns the following error values:
  ///
  /// <ul>
  /// <li>
  /// <code>DEPENDENCY_ACCESS_DENIED_ERROR</code> - The caller does not have the
  /// required permissions to complete the action. To resolve the error, you must
  /// have permission to access the Amazon Web Services service or quota.
  /// </li>
  /// <li>
  /// <code>DEPENDENCY_THROTTLING_ERROR</code> - The Amazon Web Services service
  /// is throttling Service Quotas.
  /// </li>
  /// <li>
  /// <code>DEPENDENCY_SERVICE_ERROR</code> - The Amazon Web Services service is
  /// not available.
  /// </li>
  /// <li>
  /// <code>SERVICE_QUOTA_NOT_AVAILABLE_ERROR</code> - There was an error in
  /// Service Quotas.
  /// </li>
  /// </ul>
  final ErrorCode? errorCode;

  /// The error message.
  final String? errorMessage;

  ErrorReason({
    this.errorCode,
    this.errorMessage,
  });

  factory ErrorReason.fromJson(Map<String, dynamic> json) {
    return ErrorReason(
      errorCode: (json['ErrorCode'] as String?)?.let(ErrorCode.fromString),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.value,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

class ErrorCode {
  static const dependencyAccessDeniedError =
      ErrorCode._('DEPENDENCY_ACCESS_DENIED_ERROR');
  static const dependencyThrottlingError =
      ErrorCode._('DEPENDENCY_THROTTLING_ERROR');
  static const dependencyServiceError = ErrorCode._('DEPENDENCY_SERVICE_ERROR');
  static const serviceQuotaNotAvailableError =
      ErrorCode._('SERVICE_QUOTA_NOT_AVAILABLE_ERROR');

  final String value;

  const ErrorCode._(this.value);

  static const values = [
    dependencyAccessDeniedError,
    dependencyThrottlingError,
    dependencyServiceError,
    serviceQuotaNotAvailableError
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

class PeriodUnit {
  static const microsecond = PeriodUnit._('MICROSECOND');
  static const millisecond = PeriodUnit._('MILLISECOND');
  static const second = PeriodUnit._('SECOND');
  static const minute = PeriodUnit._('MINUTE');
  static const hour = PeriodUnit._('HOUR');
  static const day = PeriodUnit._('DAY');
  static const week = PeriodUnit._('WEEK');

  final String value;

  const PeriodUnit._(this.value);

  static const values = [
    microsecond,
    millisecond,
    second,
    minute,
    hour,
    day,
    week
  ];

  static PeriodUnit fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PeriodUnit._(value));

  @override
  bool operator ==(other) => other is PeriodUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a quota's utilization, including the quota code, service
/// information, current usage, and applied limits.
class QuotaUtilizationInfo {
  /// Indicates whether the quota value can be increased.
  final bool? adjustable;

  /// The applied value of the quota, which may be higher than the default value
  /// if a quota increase has been requested and approved.
  final double? appliedValue;

  /// The default value of the quota.
  final double? defaultValue;

  /// The namespace of the metric used to track quota usage.
  final String? namespace;

  /// The quota identifier.
  final String? quotaCode;

  /// The quota name.
  final String? quotaName;

  /// The service identifier.
  final String? serviceCode;

  /// The service name.
  final String? serviceName;

  /// The utilization percentage of the quota, calculated as (current usage /
  /// applied value) × 100. Values range from 0.0 to 100.0 or higher if usage
  /// exceeds the quota limit.
  final double? utilization;

  QuotaUtilizationInfo({
    this.adjustable,
    this.appliedValue,
    this.defaultValue,
    this.namespace,
    this.quotaCode,
    this.quotaName,
    this.serviceCode,
    this.serviceName,
    this.utilization,
  });

  factory QuotaUtilizationInfo.fromJson(Map<String, dynamic> json) {
    return QuotaUtilizationInfo(
      adjustable: json['Adjustable'] as bool?,
      appliedValue: json['AppliedValue'] as double?,
      defaultValue: json['DefaultValue'] as double?,
      namespace: json['Namespace'] as String?,
      quotaCode: json['QuotaCode'] as String?,
      quotaName: json['QuotaName'] as String?,
      serviceCode: json['ServiceCode'] as String?,
      serviceName: json['ServiceName'] as String?,
      utilization: json['Utilization'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final adjustable = this.adjustable;
    final appliedValue = this.appliedValue;
    final defaultValue = this.defaultValue;
    final namespace = this.namespace;
    final quotaCode = this.quotaCode;
    final quotaName = this.quotaName;
    final serviceCode = this.serviceCode;
    final serviceName = this.serviceName;
    final utilization = this.utilization;
    return {
      if (adjustable != null) 'Adjustable': adjustable,
      if (appliedValue != null) 'AppliedValue': appliedValue,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (namespace != null) 'Namespace': namespace,
      if (quotaCode != null) 'QuotaCode': quotaCode,
      if (quotaName != null) 'QuotaName': quotaName,
      if (serviceCode != null) 'ServiceCode': serviceCode,
      if (serviceName != null) 'ServiceName': serviceName,
      if (utilization != null) 'Utilization': utilization,
    };
  }
}

class OptInStatus {
  static const enabled = OptInStatus._('ENABLED');
  static const disabled = OptInStatus._('DISABLED');

  final String value;

  const OptInStatus._(this.value);

  static const values = [enabled, disabled];

  static OptInStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OptInStatus._(value));

  @override
  bool operator ==(other) => other is OptInStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information on your Service Quotas for <a
/// href="https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management.html">Service
/// Quotas Automatic Management</a>. Automatic Management monitors your Service
/// Quotas utilization and notifies you before you run out of your allocated
/// quotas.
class QuotaInfo {
  /// The Service Quotas code for the Amazon Web Services service monitored with
  /// Automatic Management.
  final String? quotaCode;

  /// The Service Quotas name for the Amazon Web Services service monitored with
  /// Automatic Management.
  final String? quotaName;

  QuotaInfo({
    this.quotaCode,
    this.quotaName,
  });

  factory QuotaInfo.fromJson(Map<String, dynamic> json) {
    return QuotaInfo(
      quotaCode: json['QuotaCode'] as String?,
      quotaName: json['QuotaName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final quotaCode = this.quotaCode;
    final quotaName = this.quotaName;
    return {
      if (quotaCode != null) 'QuotaCode': quotaCode,
      if (quotaName != null) 'QuotaName': quotaName,
    };
  }
}

class ServiceQuotaTemplateAssociationStatus {
  static const associated =
      ServiceQuotaTemplateAssociationStatus._('ASSOCIATED');
  static const disassociated =
      ServiceQuotaTemplateAssociationStatus._('DISASSOCIATED');

  final String value;

  const ServiceQuotaTemplateAssociationStatus._(this.value);

  static const values = [associated, disassociated];

  static ServiceQuotaTemplateAssociationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceQuotaTemplateAssociationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ServiceQuotaTemplateAssociationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AWSServiceAccessNotEnabledException extends _s.GenericAwsException {
  AWSServiceAccessNotEnabledException({String? type, String? message})
      : super(
            type: type,
            code: 'AWSServiceAccessNotEnabledException',
            message: message);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class DependencyAccessDeniedException extends _s.GenericAwsException {
  DependencyAccessDeniedException({String? type, String? message})
      : super(
            type: type,
            code: 'DependencyAccessDeniedException',
            message: message);
}

class IllegalArgumentException extends _s.GenericAwsException {
  IllegalArgumentException({String? type, String? message})
      : super(type: type, code: 'IllegalArgumentException', message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class InvalidResourceStateException extends _s.GenericAwsException {
  InvalidResourceStateException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidResourceStateException',
            message: message);
}

class NoAvailableOrganizationException extends _s.GenericAwsException {
  NoAvailableOrganizationException({String? type, String? message})
      : super(
            type: type,
            code: 'NoAvailableOrganizationException',
            message: message);
}

class NoSuchResourceException extends _s.GenericAwsException {
  NoSuchResourceException({String? type, String? message})
      : super(type: type, code: 'NoSuchResourceException', message: message);
}

class OrganizationNotInAllFeaturesModeException extends _s.GenericAwsException {
  OrganizationNotInAllFeaturesModeException({String? type, String? message})
      : super(
            type: type,
            code: 'OrganizationNotInAllFeaturesModeException',
            message: message);
}

class QuotaExceededException extends _s.GenericAwsException {
  QuotaExceededException({String? type, String? message})
      : super(type: type, code: 'QuotaExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
}

class ServiceQuotaTemplateNotInUseException extends _s.GenericAwsException {
  ServiceQuotaTemplateNotInUseException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaTemplateNotInUseException',
            message: message);
}

class TagPolicyViolationException extends _s.GenericAwsException {
  TagPolicyViolationException({String? type, String? message})
      : super(
            type: type, code: 'TagPolicyViolationException', message: message);
}

class TemplatesNotAvailableInRegionException extends _s.GenericAwsException {
  TemplatesNotAvailableInRegionException({String? type, String? message})
      : super(
            type: type,
            code: 'TemplatesNotAvailableInRegionException',
            message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AWSServiceAccessNotEnabledException': (type, message) =>
      AWSServiceAccessNotEnabledException(type: type, message: message),
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'DependencyAccessDeniedException': (type, message) =>
      DependencyAccessDeniedException(type: type, message: message),
  'IllegalArgumentException': (type, message) =>
      IllegalArgumentException(type: type, message: message),
  'InvalidPaginationTokenException': (type, message) =>
      InvalidPaginationTokenException(type: type, message: message),
  'InvalidResourceStateException': (type, message) =>
      InvalidResourceStateException(type: type, message: message),
  'NoAvailableOrganizationException': (type, message) =>
      NoAvailableOrganizationException(type: type, message: message),
  'NoSuchResourceException': (type, message) =>
      NoSuchResourceException(type: type, message: message),
  'OrganizationNotInAllFeaturesModeException': (type, message) =>
      OrganizationNotInAllFeaturesModeException(type: type, message: message),
  'QuotaExceededException': (type, message) =>
      QuotaExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'ServiceQuotaTemplateNotInUseException': (type, message) =>
      ServiceQuotaTemplateNotInUseException(type: type, message: message),
  'TagPolicyViolationException': (type, message) =>
      TagPolicyViolationException(type: type, message: message),
  'TemplatesNotAvailableInRegionException': (type, message) =>
      TemplatesNotAvailableInRegionException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
