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

/// With Service Quotas, you can view and manage your quotas easily as your
/// Amazon Web Services workloads grow. Quotas, also referred to as limits, are
/// the maximum number of resources that you can create in your Amazon Web
/// Services account. For more information, see the <a
/// href="https://docs.aws.amazon.com/servicequotas/latest/userguide/">Service
/// Quotas User Guide</a>.
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
  /// May throw [DependencyAccessDeniedException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [OrganizationNotInAllFeaturesModeException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [NoAvailableOrganizationException].
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

  /// Deletes the quota increase request for the specified quota from your quota
  /// request template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ServiceException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [NoAvailableOrganizationException].
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
  /// May throw [DependencyAccessDeniedException].
  /// May throw [ServiceQuotaTemplateNotInUseException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [NoAvailableOrganizationException].
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

  /// Retrieves the default value for the specified quota. The default value
  /// does not reflect any quota increases.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
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

  /// Retrieves the status of the association for the quota request template.
  ///
  /// May throw [DependencyAccessDeniedException].
  /// May throw [ServiceQuotaTemplateNotInUseException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [NoAvailableOrganizationException].
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

  /// Retrieves information about the specified quota increase request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
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

  /// Retrieves the applied quota value for the specified quota. For some
  /// quotas, only the default values are available. If the applied quota value
  /// is not available for a quota, the quota is not retrieved.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
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
  /// Specifies the Amazon Web Services account or resource to which the quota
  /// applies. The value in this field depends on the context scope associated
  /// with the specified service quota.
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
  /// May throw [DependencyAccessDeniedException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [NoAvailableOrganizationException].
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
  /// Service. A default value does not reflect any quota increases.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
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
  /// Service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
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
  ///
  /// Parameter [quotaRequestedAtLevel] :
  /// Specifies at which level within the Amazon Web Services account the quota
  /// request applies to.
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
          'QuotaRequestedAtLevel': quotaRequestedAtLevel.toValue(),
        if (serviceCode != null) 'ServiceCode': serviceCode,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListRequestedServiceQuotaChangeHistoryResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the quota increase requests for the specified quota.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
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
  /// Specifies at which level within the Amazon Web Services account the quota
  /// request applies to.
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
          'QuotaRequestedAtLevel': quotaRequestedAtLevel.toValue(),
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListRequestedServiceQuotaChangeHistoryByQuotaResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the quota increase requests in the specified quota request template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [DependencyAccessDeniedException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [IllegalArgumentException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [NoAvailableOrganizationException].
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

  /// Lists the applied quota values for the specified Amazon Web Service. For
  /// some quotas, only the default values are available. If the applied quota
  /// value is not available for a quota, the quota is not retrieved.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
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
  /// Specifies at which level of granularity that the quota value is applied.
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
          'QuotaAppliedAtLevel': quotaAppliedAtLevel.toValue(),
        if (quotaCode != null) 'QuotaCode': quotaCode,
      },
    );

    return ListServiceQuotasResponse.fromJson(jsonResponse.body);
  }

  /// Lists the names and codes for the Amazon Web Services integrated with
  /// Service Quotas.
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
  /// May throw [TooManyRequestsException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceException].
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
  /// May throw [DependencyAccessDeniedException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [IllegalArgumentException].
  /// May throw [QuotaExceededException].
  /// May throw [NoSuchResourceException].
  /// May throw [AWSServiceAccessNotEnabledException].
  /// May throw [TemplatesNotAvailableInRegionException].
  /// May throw [NoAvailableOrganizationException].
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

  /// Submits a quota increase request for the specified quota.
  ///
  /// May throw [DependencyAccessDeniedException].
  /// May throw [QuotaExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidResourceStateException].
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
  /// Specifies the Amazon Web Services account or resource to which the quota
  /// applies. The value in this field depends on the context scope associated
  /// with the specified service quota.
  Future<RequestServiceQuotaIncreaseResponse> requestServiceQuotaIncrease({
    required double desiredValue,
    required String quotaCode,
    required String serviceCode,
    String? contextId,
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
      },
    );

    return RequestServiceQuotaIncreaseResponse.fromJson(jsonResponse.body);
  }

  /// Adds tags to the specified applied quota. You can include one or more tags
  /// to add to the quota.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [NoSuchResourceException].
  /// May throw [TooManyTagsException].
  /// May throw [TagPolicyViolationException].
  /// May throw [IllegalArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceException].
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
  /// May throw [TooManyRequestsException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceException].
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
}

enum AppliedLevelEnum {
  account,
  resource,
  all,
}

extension AppliedLevelEnumValueExtension on AppliedLevelEnum {
  String toValue() {
    switch (this) {
      case AppliedLevelEnum.account:
        return 'ACCOUNT';
      case AppliedLevelEnum.resource:
        return 'RESOURCE';
      case AppliedLevelEnum.all:
        return 'ALL';
    }
  }
}

extension AppliedLevelEnumFromString on String {
  AppliedLevelEnum toAppliedLevelEnum() {
    switch (this) {
      case 'ACCOUNT':
        return AppliedLevelEnum.account;
      case 'RESOURCE':
        return AppliedLevelEnum.resource;
      case 'ALL':
        return AppliedLevelEnum.all;
    }
    throw Exception('$this is not known in enum AppliedLevelEnum');
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

enum ErrorCode {
  dependencyAccessDeniedError,
  dependencyThrottlingError,
  dependencyServiceError,
  serviceQuotaNotAvailableError,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.dependencyAccessDeniedError:
        return 'DEPENDENCY_ACCESS_DENIED_ERROR';
      case ErrorCode.dependencyThrottlingError:
        return 'DEPENDENCY_THROTTLING_ERROR';
      case ErrorCode.dependencyServiceError:
        return 'DEPENDENCY_SERVICE_ERROR';
      case ErrorCode.serviceQuotaNotAvailableError:
        return 'SERVICE_QUOTA_NOT_AVAILABLE_ERROR';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'DEPENDENCY_ACCESS_DENIED_ERROR':
        return ErrorCode.dependencyAccessDeniedError;
      case 'DEPENDENCY_THROTTLING_ERROR':
        return ErrorCode.dependencyThrottlingError;
      case 'DEPENDENCY_SERVICE_ERROR':
        return ErrorCode.dependencyServiceError;
      case 'SERVICE_QUOTA_NOT_AVAILABLE_ERROR':
        return ErrorCode.serviceQuotaNotAvailableError;
    }
    throw Exception('$this is not known in enum ErrorCode');
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
  /// have permission to access the Amazon Web Service or quota.
  /// </li>
  /// <li>
  /// <code>DEPENDENCY_THROTTLING_ERROR</code> - The Amazon Web Service is
  /// throttling Service Quotas.
  /// </li>
  /// <li>
  /// <code>DEPENDENCY_SERVICE_ERROR</code> - The Amazon Web Service is not
  /// available.
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
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
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
              ?.toServiceQuotaTemplateAssociationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceQuotaTemplateAssociationStatus =
        this.serviceQuotaTemplateAssociationStatus;
    return {
      if (serviceQuotaTemplateAssociationStatus != null)
        'ServiceQuotaTemplateAssociationStatus':
            serviceQuotaTemplateAssociationStatus.toValue(),
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
              ?.whereNotNull()
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
          ?.whereNotNull()
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

  /// The list of the Amazon Web Service names and service codes.
  final List<ServiceInfo>? services;

  ListServicesResponse({
    this.nextToken,
    this.services,
  });

  factory ListServicesResponse.fromJson(Map<String, dynamic> json) {
    return ListServicesResponse(
      nextToken: json['NextToken'] as String?,
      services: (json['Services'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
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

enum PeriodUnit {
  microsecond,
  millisecond,
  second,
  minute,
  hour,
  day,
  week,
}

extension PeriodUnitValueExtension on PeriodUnit {
  String toValue() {
    switch (this) {
      case PeriodUnit.microsecond:
        return 'MICROSECOND';
      case PeriodUnit.millisecond:
        return 'MILLISECOND';
      case PeriodUnit.second:
        return 'SECOND';
      case PeriodUnit.minute:
        return 'MINUTE';
      case PeriodUnit.hour:
        return 'HOUR';
      case PeriodUnit.day:
        return 'DAY';
      case PeriodUnit.week:
        return 'WEEK';
    }
  }
}

extension PeriodUnitFromString on String {
  PeriodUnit toPeriodUnit() {
    switch (this) {
      case 'MICROSECOND':
        return PeriodUnit.microsecond;
      case 'MILLISECOND':
        return PeriodUnit.millisecond;
      case 'SECOND':
        return PeriodUnit.second;
      case 'MINUTE':
        return PeriodUnit.minute;
      case 'HOUR':
        return PeriodUnit.hour;
      case 'DAY':
        return PeriodUnit.day;
      case 'WEEK':
        return PeriodUnit.week;
    }
    throw Exception('$this is not known in enum PeriodUnit');
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

/// A structure that describes the context for a service quota. The context
/// identifies what the quota applies to.
class QuotaContextInfo {
  /// Specifies the Amazon Web Services account or resource to which the quota
  /// applies. The value in this field depends on the context scope associated
  /// with the specified service quota.
  final String? contextId;

  /// Specifies whether the quota applies to an Amazon Web Services account, or to
  /// a resource.
  final QuotaContextScope? contextScope;

  /// When the <code>ContextScope</code> is <code>RESOURCE</code>, then this
  /// specifies the resource type of the specified resource.
  final String? contextScopeType;

  QuotaContextInfo({
    this.contextId,
    this.contextScope,
    this.contextScopeType,
  });

  factory QuotaContextInfo.fromJson(Map<String, dynamic> json) {
    return QuotaContextInfo(
      contextId: json['ContextId'] as String?,
      contextScope: (json['ContextScope'] as String?)?.toQuotaContextScope(),
      contextScopeType: json['ContextScopeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contextId = this.contextId;
    final contextScope = this.contextScope;
    final contextScopeType = this.contextScopeType;
    return {
      if (contextId != null) 'ContextId': contextId,
      if (contextScope != null) 'ContextScope': contextScope.toValue(),
      if (contextScopeType != null) 'ContextScopeType': contextScopeType,
    };
  }
}

enum QuotaContextScope {
  resource,
  account,
}

extension QuotaContextScopeValueExtension on QuotaContextScope {
  String toValue() {
    switch (this) {
      case QuotaContextScope.resource:
        return 'RESOURCE';
      case QuotaContextScope.account:
        return 'ACCOUNT';
    }
  }
}

extension QuotaContextScopeFromString on String {
  QuotaContextScope toQuotaContextScope() {
    switch (this) {
      case 'RESOURCE':
        return QuotaContextScope.resource;
      case 'ACCOUNT':
        return QuotaContextScope.account;
    }
    throw Exception('$this is not known in enum QuotaContextScope');
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
      periodUnit: (json['PeriodUnit'] as String?)?.toPeriodUnit(),
      periodValue: json['PeriodValue'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final periodUnit = this.periodUnit;
    final periodValue = this.periodValue;
    return {
      if (periodUnit != null) 'PeriodUnit': periodUnit.toValue(),
      if (periodValue != null) 'PeriodValue': periodValue,
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

enum RequestStatus {
  pending,
  caseOpened,
  approved,
  denied,
  caseClosed,
  notApproved,
  invalidRequest,
}

extension RequestStatusValueExtension on RequestStatus {
  String toValue() {
    switch (this) {
      case RequestStatus.pending:
        return 'PENDING';
      case RequestStatus.caseOpened:
        return 'CASE_OPENED';
      case RequestStatus.approved:
        return 'APPROVED';
      case RequestStatus.denied:
        return 'DENIED';
      case RequestStatus.caseClosed:
        return 'CASE_CLOSED';
      case RequestStatus.notApproved:
        return 'NOT_APPROVED';
      case RequestStatus.invalidRequest:
        return 'INVALID_REQUEST';
    }
  }
}

extension RequestStatusFromString on String {
  RequestStatus toRequestStatus() {
    switch (this) {
      case 'PENDING':
        return RequestStatus.pending;
      case 'CASE_OPENED':
        return RequestStatus.caseOpened;
      case 'APPROVED':
        return RequestStatus.approved;
      case 'DENIED':
        return RequestStatus.denied;
      case 'CASE_CLOSED':
        return RequestStatus.caseClosed;
      case 'NOT_APPROVED':
        return RequestStatus.notApproved;
      case 'INVALID_REQUEST':
        return RequestStatus.invalidRequest;
    }
    throw Exception('$this is not known in enum RequestStatus');
  }
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

  /// Specifies at which level within the Amazon Web Services account the quota
  /// request applies to.
  final AppliedLevelEnum? quotaRequestedAtLevel;

  /// The IAM identity of the requester.
  final String? requester;

  /// Specifies the service identifier. To find the service code value for an
  /// Amazon Web Services service, use the <a>ListServices</a> operation.
  final String? serviceCode;

  /// Specifies the service name.
  final String? serviceName;

  /// The state of the quota increase request.
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
      quotaRequestedAtLevel:
          (json['QuotaRequestedAtLevel'] as String?)?.toAppliedLevelEnum(),
      requester: json['Requester'] as String?,
      serviceCode: json['ServiceCode'] as String?,
      serviceName: json['ServiceName'] as String?,
      status: (json['Status'] as String?)?.toRequestStatus(),
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
        'QuotaRequestedAtLevel': quotaRequestedAtLevel.toValue(),
      if (requester != null) 'Requester': requester,
      if (serviceCode != null) 'ServiceCode': serviceCode,
      if (serviceName != null) 'ServiceName': serviceName,
      if (status != null) 'Status': status.toValue(),
      if (unit != null) 'Unit': unit,
    };
  }
}

/// Information about an Amazon Web Service.
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

  /// The error code and error reason.
  final ErrorReason? errorReason;

  /// Indicates whether the quota is global.
  final bool? globalQuota;

  /// The period of time.
  final QuotaPeriod? period;

  /// Specifies at which level of granularity that the quota value is applied.
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
      errorReason: json['ErrorReason'] != null
          ? ErrorReason.fromJson(json['ErrorReason'] as Map<String, dynamic>)
          : null,
      globalQuota: json['GlobalQuota'] as bool?,
      period: json['Period'] != null
          ? QuotaPeriod.fromJson(json['Period'] as Map<String, dynamic>)
          : null,
      quotaAppliedAtLevel:
          (json['QuotaAppliedAtLevel'] as String?)?.toAppliedLevelEnum(),
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
      if (errorReason != null) 'ErrorReason': errorReason,
      if (globalQuota != null) 'GlobalQuota': globalQuota,
      if (period != null) 'Period': period,
      if (quotaAppliedAtLevel != null)
        'QuotaAppliedAtLevel': quotaAppliedAtLevel.toValue(),
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

enum ServiceQuotaTemplateAssociationStatus {
  associated,
  disassociated,
}

extension ServiceQuotaTemplateAssociationStatusValueExtension
    on ServiceQuotaTemplateAssociationStatus {
  String toValue() {
    switch (this) {
      case ServiceQuotaTemplateAssociationStatus.associated:
        return 'ASSOCIATED';
      case ServiceQuotaTemplateAssociationStatus.disassociated:
        return 'DISASSOCIATED';
    }
  }
}

extension ServiceQuotaTemplateAssociationStatusFromString on String {
  ServiceQuotaTemplateAssociationStatus
      toServiceQuotaTemplateAssociationStatus() {
    switch (this) {
      case 'ASSOCIATED':
        return ServiceQuotaTemplateAssociationStatus.associated;
      case 'DISASSOCIATED':
        return ServiceQuotaTemplateAssociationStatus.disassociated;
    }
    throw Exception(
        '$this is not known in enum ServiceQuotaTemplateAssociationStatus');
  }
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
      key: json['Key'] as String,
      value: json['Value'] as String,
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
