// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'service-quotas-2019-06-24.g.dart';

/// Service Quotas is a web service that you can use to manage many of your AWS
/// service quotas. Quotas, also referred to as limits, are the maximum values
/// for a resource, item, or operation. This guide provide descriptions of the
/// Service Quotas actions that you can call from an API. For the Service Quotas
/// user guide, which explains how to use Service Quotas from the console, see
/// <a
/// href="https://docs.aws.amazon.com/servicequotas/latest/userguide/intro.html">What
/// is Service Quotas</a>.
/// <note>
/// AWS provides SDKs that consist of libraries and sample code for programming
/// languages and platforms (Java, Ruby, .NET, iOS, Android, etc...,). The SDKs
/// provide a convenient way to create programmatic access to Service Quotas and
/// AWS. For information about the AWS SDKs, including how to download and
/// install them, see the <a
/// href="https://docs.aws.amazon.com/aws.amazon.com/tools">Tools for Amazon Web
/// Services</a> page.
/// </note>
class ServiceQuotas {
  final _s.JsonProtocol _protocol;
  ServiceQuotas({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'servicequotas',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates the Service Quotas template with your organization so that when
  /// new accounts are created in your organization, the template submits
  /// increase requests for the specified service quotas. Use the Service Quotas
  /// template to request an increase for any adjustable quota value. After you
  /// define the Service Quotas template, use this operation to associate, or
  /// enable, the template.
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return AssociateServiceQuotaTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Removes a service quota increase request from the Service Quotas template.
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
  /// Specifies the AWS Region for the quota that you want to delete.
  ///
  /// Parameter [quotaCode] :
  /// Specifies the code for the quota that you want to delete.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the code for the service that you want to delete.
  Future<void> deleteServiceQuotaIncreaseRequestFromTemplate({
    @_s.required String awsRegion,
    @_s.required String quotaCode,
    @_s.required String serviceCode,
  }) async {
    ArgumentError.checkNotNull(awsRegion, 'awsRegion');
    _s.validateStringLength(
      'awsRegion',
      awsRegion,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsRegion',
      awsRegion,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(quotaCode, 'quotaCode');
    _s.validateStringLength(
      'quotaCode',
      quotaCode,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'quotaCode',
      quotaCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceCode, 'serviceCode');
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'ServiceQuotasV20190624.DeleteServiceQuotaIncreaseRequestFromTemplate'
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

    return DeleteServiceQuotaIncreaseRequestFromTemplateResponse.fromJson(
        jsonResponse.body);
  }

  /// Disables the Service Quotas template. Once the template is disabled, it
  /// does not request quota increases for new accounts in your organization.
  /// Disabling the quota template does not apply the quota increase requests
  /// from the template.
  ///
  /// <b>Related operations</b>
  ///
  /// <ul>
  /// <li>
  /// To enable the quota template, call <a>AssociateServiceQuotaTemplate</a>.
  /// </li>
  /// <li>
  /// To delete a specific service quota from the template, use
  /// <a>DeleteServiceQuotaIncreaseRequestFromTemplate</a>.
  /// </li>
  /// </ul>
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DisassociateServiceQuotaTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the default service quotas values. The Value returned for each
  /// quota is the AWS default value, even if the quotas have been increased..
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [quotaCode] :
  /// Identifies the service quota you want to select.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service that you want to use.
  Future<GetAWSDefaultServiceQuotaResponse> getAWSDefaultServiceQuota({
    @_s.required String quotaCode,
    @_s.required String serviceCode,
  }) async {
    ArgumentError.checkNotNull(quotaCode, 'quotaCode');
    _s.validateStringLength(
      'quotaCode',
      quotaCode,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'quotaCode',
      quotaCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceCode, 'serviceCode');
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
      isRequired: true,
    );
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

  /// Retrieves the <code>ServiceQuotaTemplateAssociationStatus</code> value
  /// from the service. Use this action to determine if the Service Quota
  /// template is associated, or enabled.
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

  /// Retrieves the details for a particular increase request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [requestId] :
  /// Identifies the quota increase request.
  Future<GetRequestedServiceQuotaChangeResponse>
      getRequestedServiceQuotaChange({
    @_s.required String requestId,
  }) async {
    ArgumentError.checkNotNull(requestId, 'requestId');
    _s.validateStringLength(
      'requestId',
      requestId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'requestId',
      requestId,
      r'''[0-9a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
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

  /// Returns the details for the specified service quota. This operation
  /// provides a different Value than the <code>GetAWSDefaultServiceQuota</code>
  /// operation. This operation returns the applied value for each quota.
  /// <code>GetAWSDefaultServiceQuota</code> returns the default AWS value for
  /// each quota.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [quotaCode] :
  /// Identifies the service quota you want to select.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service that you want to use.
  Future<GetServiceQuotaResponse> getServiceQuota({
    @_s.required String quotaCode,
    @_s.required String serviceCode,
  }) async {
    ArgumentError.checkNotNull(quotaCode, 'quotaCode');
    _s.validateStringLength(
      'quotaCode',
      quotaCode,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'quotaCode',
      quotaCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceCode, 'serviceCode');
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
      isRequired: true,
    );
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
      },
    );

    return GetServiceQuotaResponse.fromJson(jsonResponse.body);
  }

  /// Returns the details of the service quota increase request in your
  /// template.
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
  /// Specifies the AWS Region for the quota that you want to use.
  ///
  /// Parameter [quotaCode] :
  /// Specifies the quota you want.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service that you want to use.
  Future<GetServiceQuotaIncreaseRequestFromTemplateResponse>
      getServiceQuotaIncreaseRequestFromTemplate({
    @_s.required String awsRegion,
    @_s.required String quotaCode,
    @_s.required String serviceCode,
  }) async {
    ArgumentError.checkNotNull(awsRegion, 'awsRegion');
    _s.validateStringLength(
      'awsRegion',
      awsRegion,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsRegion',
      awsRegion,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(quotaCode, 'quotaCode');
    _s.validateStringLength(
      'quotaCode',
      quotaCode,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'quotaCode',
      quotaCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceCode, 'serviceCode');
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
      isRequired: true,
    );
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

  /// Lists all default service quotas for the specified AWS service or all AWS
  /// services. ListAWSDefaultServiceQuotas is similar to
  /// <a>ListServiceQuotas</a> except for the Value object. The Value object
  /// returned by <code>ListAWSDefaultServiceQuotas</code> is the default value
  /// assigned by AWS. This request returns a list of all service quotas for the
  /// specified service. The listing of each you'll see the default values are
  /// the values that AWS provides for the quotas.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter when calling
  /// any of the <code>List*</code> operations. These operations can return an
  /// unexpected list of results, even when there are more results available.
  /// When this happens, the <code>NextToken</code> response parameter contains
  /// a value to pass the next call to the same API to request the next part of
  /// the list.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service that you want to use.
  ///
  /// Parameter [maxResults] :
  /// (Optional) Limits the number of results that you want to include in the
  /// response. If you don't include this parameter, the response defaults to a
  /// value that's specific to the operation. If additional items exist beyond
  /// the specified maximum, the <code>NextToken</code> element is present and
  /// has a value (isn't null). Include that value as the <code>NextToken</code>
  /// request parameter in the call to the operation to get the next part of the
  /// results. You should check <code>NextToken</code> after every operation to
  /// ensure that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Use this parameter in a request if you receive a
  /// <code>NextToken</code> response in a previous request that indicates that
  /// there's more output available. In a subsequent call, set it to the value
  /// of the previous call's <code>NextToken</code> response to indicate where
  /// the output should continue from. If additional items exist beyond the
  /// specified maximum, the <code>NextToken</code> element is present and has a
  /// value (isn't null). Include that value as the <code>NextToken</code>
  /// request parameter in the call to the operation to get the next part of the
  /// results. You should check <code>NextToken</code> after every operation to
  /// ensure that you receive all of the results.
  Future<ListAWSDefaultServiceQuotasResponse> listAWSDefaultServiceQuotas({
    @_s.required String serviceCode,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(serviceCode, 'serviceCode');
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9/+]*={0,2}$''',
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
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListAWSDefaultServiceQuotasResponse.fromJson(jsonResponse.body);
  }

  /// Requests a list of the changes to quotas for a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// (Optional) Limits the number of results that you want to include in the
  /// response. If you don't include this parameter, the response defaults to a
  /// value that's specific to the operation. If additional items exist beyond
  /// the specified maximum, the <code>NextToken</code> element is present and
  /// has a value (isn't null). Include that value as the <code>NextToken</code>
  /// request parameter in the call to the operation to get the next part of the
  /// results. You should check <code>NextToken</code> after every operation to
  /// ensure that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Use this parameter in a request if you receive a
  /// <code>NextToken</code> response in a previous request that indicates that
  /// there's more output available. In a subsequent call, set it to the value
  /// of the previous call's <code>NextToken</code> response to indicate where
  /// the output should continue from.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service that you want to use.
  ///
  /// Parameter [status] :
  /// Specifies the status value of the quota increase request.
  Future<ListRequestedServiceQuotaChangeHistoryResponse>
      listRequestedServiceQuotaChangeHistory({
    int maxResults,
    String nextToken,
    String serviceCode,
    RequestStatus status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9/+]*={0,2}$''',
    );
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
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
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'ServiceCode': serviceCode,
        'Status': status,
      },
    );

    return ListRequestedServiceQuotaChangeHistoryResponse.fromJson(
        jsonResponse.body);
  }

  /// Requests a list of the changes to specific service quotas. This command
  /// provides additional granularity over the
  /// <code>ListRequestedServiceQuotaChangeHistory</code> command. Once a quota
  /// change request has reached <code>CASE_CLOSED, APPROVED,</code> or
  /// <code>DENIED</code>, the history has been kept for 90 days.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [quotaCode] :
  /// Specifies the service quota that you want to use
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service that you want to use.
  ///
  /// Parameter [maxResults] :
  /// (Optional) Limits the number of results that you want to include in the
  /// response. If you don't include this parameter, the response defaults to a
  /// value that's specific to the operation. If additional items exist beyond
  /// the specified maximum, the <code>NextToken</code> element is present and
  /// has a value (isn't null). Include that value as the <code>NextToken</code>
  /// request parameter in the call to the operation to get the next part of the
  /// results. You should check <code>NextToken</code> after every operation to
  /// ensure that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Use this parameter in a request if you receive a
  /// <code>NextToken</code> response in a previous request that indicates that
  /// there's more output available. In a subsequent call, set it to the value
  /// of the previous call's <code>NextToken</code> response to indicate where
  /// the output should continue from.
  ///
  /// Parameter [status] :
  /// Specifies the status value of the quota increase request.
  Future<ListRequestedServiceQuotaChangeHistoryByQuotaResponse>
      listRequestedServiceQuotaChangeHistoryByQuota({
    @_s.required String quotaCode,
    @_s.required String serviceCode,
    int maxResults,
    String nextToken,
    RequestStatus status,
  }) async {
    ArgumentError.checkNotNull(quotaCode, 'quotaCode');
    _s.validateStringLength(
      'quotaCode',
      quotaCode,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'quotaCode',
      quotaCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceCode, 'serviceCode');
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9/+]*={0,2}$''',
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
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'Status': status,
      },
    );

    return ListRequestedServiceQuotaChangeHistoryByQuotaResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a list of the quota increase requests in the template.
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
  /// Specifies the AWS Region for the quota that you want to use.
  ///
  /// Parameter [maxResults] :
  /// (Optional) Limits the number of results that you want to include in the
  /// response. If you don't include this parameter, the response defaults to a
  /// value that's specific to the operation. If additional items exist beyond
  /// the specified maximum, the <code>NextToken</code> element is present and
  /// has a value (isn't null). Include that value as the <code>NextToken</code>
  /// request parameter in the call to the operation to get the next part of the
  /// results. You should check <code>NextToken</code> after every operation to
  /// ensure that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Use this parameter in a request if you receive a
  /// <code>NextToken</code> response in a previous request that indicates that
  /// there's more output available. In a subsequent call, set it to the value
  /// of the previous call's <code>NextToken</code> response to indicate where
  /// the output should continue from.
  ///
  /// Parameter [serviceCode] :
  /// The identifier for a service. When performing an operation, use the
  /// <code>ServiceCode</code> to specify a particular service.
  Future<ListServiceQuotaIncreaseRequestsInTemplateResponse>
      listServiceQuotaIncreaseRequestsInTemplate({
    String awsRegion,
    int maxResults,
    String nextToken,
    String serviceCode,
  }) async {
    _s.validateStringLength(
      'awsRegion',
      awsRegion,
      1,
      64,
    );
    _s.validateStringPattern(
      'awsRegion',
      awsRegion,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9/+]*={0,2}$''',
    );
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
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
        'AwsRegion': awsRegion,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'ServiceCode': serviceCode,
      },
    );

    return ListServiceQuotaIncreaseRequestsInTemplateResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists all service quotas for the specified AWS service. This request
  /// returns a list of the service quotas for the specified service. you'll see
  /// the default values are the values that AWS provides for the quotas.
  /// <note>
  /// Always check the <code>NextToken</code> response parameter when calling
  /// any of the <code>List*</code> operations. These operations can return an
  /// unexpected list of results, even when there are more results available.
  /// When this happens, the <code>NextToken</code> response parameter contains
  /// a value to pass the next call to the same API to request the next part of
  /// the list.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [serviceCode] :
  /// The identifier for a service. When performing an operation, use the
  /// <code>ServiceCode</code> to specify a particular service.
  ///
  /// Parameter [maxResults] :
  /// (Optional) Limits the number of results that you want to include in the
  /// response. If you don't include this parameter, the response defaults to a
  /// value that's specific to the operation. If additional items exist beyond
  /// the specified maximum, the <code>NextToken</code> element is present and
  /// has a value (isn't null). Include that value as the <code>NextToken</code>
  /// request parameter in the call to the operation to get the next part of the
  /// results. You should check <code>NextToken</code> after every operation to
  /// ensure that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Use this parameter in a request if you receive a
  /// <code>NextToken</code> response in a previous request that indicates that
  /// there's more output available. In a subsequent call, set it to the value
  /// of the previous call's <code>NextToken</code> response to indicate where
  /// the output should continue from.
  Future<ListServiceQuotasResponse> listServiceQuotas({
    @_s.required String serviceCode,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(serviceCode, 'serviceCode');
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9/+]*={0,2}$''',
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
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListServiceQuotasResponse.fromJson(jsonResponse.body);
  }

  /// Lists the AWS services available in Service Quotas. Not all AWS services
  /// are available in Service Quotas. To list the see the list of the service
  /// quotas for a specific service, use <a>ListServiceQuotas</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// (Optional) Limits the number of results that you want to include in the
  /// response. If you don't include this parameter, the response defaults to a
  /// value that's specific to the operation. If additional items exist beyond
  /// the specified maximum, the <code>NextToken</code> element is present and
  /// has a value (isn't null). Include that value as the <code>NextToken</code>
  /// request parameter in the call to the operation to get the next part of the
  /// results. You should check <code>NextToken</code> after every operation to
  /// ensure that you receive all of the results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) Use this parameter in a request if you receive a
  /// <code>NextToken</code> response in a previous request that indicates that
  /// there's more output available. In a subsequent call, set it to the value
  /// of the previous call's <code>NextToken</code> response to indicate where
  /// the output should continue from.
  Future<ListServicesResponse> listServices({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[a-zA-Z0-9/+]*={0,2}$''',
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
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListServicesResponse.fromJson(jsonResponse.body);
  }

  /// Defines and adds a quota to the service quota template. To add a quota to
  /// the template, you must provide the <code>ServiceCode</code>,
  /// <code>QuotaCode</code>, <code>AwsRegion</code>, and
  /// <code>DesiredValue</code>. Once you add a quota to the template, use
  /// <a>ListServiceQuotaIncreaseRequestsInTemplate</a> to see the list of
  /// quotas in the template.
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
  /// Specifies the AWS Region for the quota.
  ///
  /// Parameter [desiredValue] :
  /// Specifies the new, increased value for the quota.
  ///
  /// Parameter [quotaCode] :
  /// Specifies the service quota that you want to use.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service that you want to use.
  Future<PutServiceQuotaIncreaseRequestIntoTemplateResponse>
      putServiceQuotaIncreaseRequestIntoTemplate({
    @_s.required String awsRegion,
    @_s.required double desiredValue,
    @_s.required String quotaCode,
    @_s.required String serviceCode,
  }) async {
    ArgumentError.checkNotNull(awsRegion, 'awsRegion');
    _s.validateStringLength(
      'awsRegion',
      awsRegion,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'awsRegion',
      awsRegion,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(desiredValue, 'desiredValue');
    _s.validateNumRange(
      'desiredValue',
      desiredValue,
      0,
      10000000000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(quotaCode, 'quotaCode');
    _s.validateStringLength(
      'quotaCode',
      quotaCode,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'quotaCode',
      quotaCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceCode, 'serviceCode');
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
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

  /// Retrieves the details of a service quota increase request. The response to
  /// this command provides the details in the
  /// <a>RequestedServiceQuotaChange</a> object.
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
  /// Specifies the value submitted in the service quota increase request.
  ///
  /// Parameter [quotaCode] :
  /// Specifies the service quota that you want to use.
  ///
  /// Parameter [serviceCode] :
  /// Specifies the service that you want to use.
  Future<RequestServiceQuotaIncreaseResponse> requestServiceQuotaIncrease({
    @_s.required double desiredValue,
    @_s.required String quotaCode,
    @_s.required String serviceCode,
  }) async {
    ArgumentError.checkNotNull(desiredValue, 'desiredValue');
    _s.validateNumRange(
      'desiredValue',
      desiredValue,
      0,
      10000000000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(quotaCode, 'quotaCode');
    _s.validateStringLength(
      'quotaCode',
      quotaCode,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'quotaCode',
      quotaCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,128}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceCode, 'serviceCode');
    _s.validateStringLength(
      'serviceCode',
      serviceCode,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceCode',
      serviceCode,
      r'''[a-zA-Z][a-zA-Z0-9-]{1,63}''',
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
      },
    );

    return RequestServiceQuotaIncreaseResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateServiceQuotaTemplateResponse {
  AssociateServiceQuotaTemplateResponse();
  factory AssociateServiceQuotaTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateServiceQuotaTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteServiceQuotaIncreaseRequestFromTemplateResponse {
  DeleteServiceQuotaIncreaseRequestFromTemplateResponse();
  factory DeleteServiceQuotaIncreaseRequestFromTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteServiceQuotaIncreaseRequestFromTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateServiceQuotaTemplateResponse {
  DisassociateServiceQuotaTemplateResponse();
  factory DisassociateServiceQuotaTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateServiceQuotaTemplateResponseFromJson(json);
}

enum ErrorCode {
  @_s.JsonValue('DEPENDENCY_ACCESS_DENIED_ERROR')
  dependencyAccessDeniedError,
  @_s.JsonValue('DEPENDENCY_THROTTLING_ERROR')
  dependencyThrottlingError,
  @_s.JsonValue('DEPENDENCY_SERVICE_ERROR')
  dependencyServiceError,
  @_s.JsonValue('SERVICE_QUOTA_NOT_AVAILABLE_ERROR')
  serviceQuotaNotAvailableError,
}

/// Returns an error that explains why the action did not succeed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorReason {
  /// Service Quotas returns the following error values.
  ///
  /// <code>DEPENDENCY_ACCESS_DENIED_ERROR</code> is returned when the caller does
  /// not have permission to call the service or service quota. To resolve the
  /// error, you need permission to access the service or service quota.
  ///
  /// <code>DEPENDENCY_THROTTLING_ERROR</code> is returned when the service being
  /// called is throttling Service Quotas.
  ///
  /// <code>DEPENDENCY_SERVICE_ERROR</code> is returned when the service being
  /// called has availability issues.
  ///
  /// <code>SERVICE_QUOTA_NOT_AVAILABLE_ERROR</code> is returned when there was an
  /// error in Service Quotas.
  @_s.JsonKey(name: 'ErrorCode')
  final ErrorCode errorCode;

  /// The error message that provides more detail.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  ErrorReason({
    this.errorCode,
    this.errorMessage,
  });
  factory ErrorReason.fromJson(Map<String, dynamic> json) =>
      _$ErrorReasonFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAWSDefaultServiceQuotaResponse {
  /// Returns the <a>ServiceQuota</a> object which contains all values for a
  /// quota.
  @_s.JsonKey(name: 'Quota')
  final ServiceQuota quota;

  GetAWSDefaultServiceQuotaResponse({
    this.quota,
  });
  factory GetAWSDefaultServiceQuotaResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAWSDefaultServiceQuotaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAssociationForServiceQuotaTemplateResponse {
  /// Specifies whether the template is <code>ASSOCIATED</code> or
  /// <code>DISASSOCIATED</code>. If the template is <code>ASSOCIATED</code>, then
  /// it requests service quota increases for all new accounts created in your
  /// organization.
  @_s.JsonKey(name: 'ServiceQuotaTemplateAssociationStatus')
  final ServiceQuotaTemplateAssociationStatus
      serviceQuotaTemplateAssociationStatus;

  GetAssociationForServiceQuotaTemplateResponse({
    this.serviceQuotaTemplateAssociationStatus,
  });
  factory GetAssociationForServiceQuotaTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAssociationForServiceQuotaTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRequestedServiceQuotaChangeResponse {
  /// Returns the <code>RequestedServiceQuotaChange</code> object for the specific
  /// increase request.
  @_s.JsonKey(name: 'RequestedQuota')
  final RequestedServiceQuotaChange requestedQuota;

  GetRequestedServiceQuotaChangeResponse({
    this.requestedQuota,
  });
  factory GetRequestedServiceQuotaChangeResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetRequestedServiceQuotaChangeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServiceQuotaIncreaseRequestFromTemplateResponse {
  /// This object contains the details about the quota increase request.
  @_s.JsonKey(name: 'ServiceQuotaIncreaseRequestInTemplate')
  final ServiceQuotaIncreaseRequestInTemplate
      serviceQuotaIncreaseRequestInTemplate;

  GetServiceQuotaIncreaseRequestFromTemplateResponse({
    this.serviceQuotaIncreaseRequestInTemplate,
  });
  factory GetServiceQuotaIncreaseRequestFromTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetServiceQuotaIncreaseRequestFromTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServiceQuotaResponse {
  /// Returns the <a>ServiceQuota</a> object which contains all values for a
  /// quota.
  @_s.JsonKey(name: 'Quota')
  final ServiceQuota quota;

  GetServiceQuotaResponse({
    this.quota,
  });
  factory GetServiceQuotaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServiceQuotaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAWSDefaultServiceQuotasResponse {
  /// (Optional) Use this parameter in a request if you receive a
  /// <code>NextToken</code> response in a previous request that indicates that
  /// there's more output available. In a subsequent call, set it to the value of
  /// the previous call's <code>NextToken</code> response to indicate where the
  /// output should continue from.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of the quotas in the account with the AWS default values.
  @_s.JsonKey(name: 'Quotas')
  final List<ServiceQuota> quotas;

  ListAWSDefaultServiceQuotasResponse({
    this.nextToken,
    this.quotas,
  });
  factory ListAWSDefaultServiceQuotasResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAWSDefaultServiceQuotasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRequestedServiceQuotaChangeHistoryByQuotaResponse {
  /// If present in the response, this value indicates there's more output
  /// available that what's included in the current response. This can occur even
  /// when the response includes no values at all, such as when you ask for a
  /// filtered view of a very long list. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to continue processing and get the next part of the output. You
  /// should repeat this until the <code>NextToken</code> response element comes
  /// back empty (as <code>null</code>).
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a list of service quota requests.
  @_s.JsonKey(name: 'RequestedQuotas')
  final List<RequestedServiceQuotaChange> requestedQuotas;

  ListRequestedServiceQuotaChangeHistoryByQuotaResponse({
    this.nextToken,
    this.requestedQuotas,
  });
  factory ListRequestedServiceQuotaChangeHistoryByQuotaResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListRequestedServiceQuotaChangeHistoryByQuotaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRequestedServiceQuotaChangeHistoryResponse {
  /// If present in the response, this value indicates there's more output
  /// available that what's included in the current response. This can occur even
  /// when the response includes no values at all, such as when you ask for a
  /// filtered view of a very long list. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to continue processing and get the next part of the output. You
  /// should repeat this until the <code>NextToken</code> response element comes
  /// back empty (as <code>null</code>).
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a list of service quota requests.
  @_s.JsonKey(name: 'RequestedQuotas')
  final List<RequestedServiceQuotaChange> requestedQuotas;

  ListRequestedServiceQuotaChangeHistoryResponse({
    this.nextToken,
    this.requestedQuotas,
  });
  factory ListRequestedServiceQuotaChangeHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListRequestedServiceQuotaChangeHistoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListServiceQuotaIncreaseRequestsInTemplateResponse {
  /// If present in the response, this value indicates there's more output
  /// available that what's included in the current response. This can occur even
  /// when the response includes no values at all, such as when you ask for a
  /// filtered view of a very long list. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to continue processing and get the next part of the output. You
  /// should repeat this until the <code>NextToken</code> response element comes
  /// back empty (as <code>null</code>).
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns the list of values of the quota increase request in the template.
  @_s.JsonKey(name: 'ServiceQuotaIncreaseRequestInTemplateList')
  final List<ServiceQuotaIncreaseRequestInTemplate>
      serviceQuotaIncreaseRequestInTemplateList;

  ListServiceQuotaIncreaseRequestsInTemplateResponse({
    this.nextToken,
    this.serviceQuotaIncreaseRequestInTemplateList,
  });
  factory ListServiceQuotaIncreaseRequestsInTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListServiceQuotaIncreaseRequestsInTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListServiceQuotasResponse {
  /// If present in the response, this value indicates there's more output
  /// available that what's included in the current response. This can occur even
  /// when the response includes no values at all, such as when you ask for a
  /// filtered view of a very long list. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to continue processing and get the next part of the output. You
  /// should repeat this until the <code>NextToken</code> response element comes
  /// back empty (as <code>null</code>).
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The response information for a quota lists all attribute information for the
  /// quota.
  @_s.JsonKey(name: 'Quotas')
  final List<ServiceQuota> quotas;

  ListServiceQuotasResponse({
    this.nextToken,
    this.quotas,
  });
  factory ListServiceQuotasResponse.fromJson(Map<String, dynamic> json) =>
      _$ListServiceQuotasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListServicesResponse {
  /// If present in the response, this value indicates there's more output
  /// available that what's included in the current response. This can occur even
  /// when the response includes no values at all, such as when you ask for a
  /// filtered view of a very long list. Use this value in the
  /// <code>NextToken</code> request parameter in a subsequent call to the
  /// operation to continue processing and get the next part of the output. You
  /// should repeat this until the <code>NextToken</code> response element comes
  /// back empty (as <code>null</code>).
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Returns a list of services.
  @_s.JsonKey(name: 'Services')
  final List<ServiceInfo> services;

  ListServicesResponse({
    this.nextToken,
    this.services,
  });
  factory ListServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListServicesResponseFromJson(json);
}

/// A structure that uses CloudWatch metrics to gather data about the service
/// quota.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MetricInfo {
  /// A dimension is a name/value pair that is part of the identity of a metric.
  /// Every metric has specific characteristics that describe it, and you can
  /// think of dimensions as categories for those characteristics. These
  /// dimensions are part of the CloudWatch Metric Identity that measures usage
  /// against a particular service quota.
  @_s.JsonKey(name: 'MetricDimensions')
  final Map<String, String> metricDimensions;

  /// The name of the CloudWatch metric that measures usage of a service quota.
  /// This is a required field.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The namespace of the metric. The namespace is a container for CloudWatch
  /// metrics. You can specify a name for the namespace when you create a metric.
  @_s.JsonKey(name: 'MetricNamespace')
  final String metricNamespace;

  /// Statistics are metric data aggregations over specified periods of time. This
  /// is the recommended statistic to use when comparing usage in the CloudWatch
  /// Metric against your Service Quota.
  @_s.JsonKey(name: 'MetricStatisticRecommendation')
  final String metricStatisticRecommendation;

  MetricInfo({
    this.metricDimensions,
    this.metricName,
    this.metricNamespace,
    this.metricStatisticRecommendation,
  });
  factory MetricInfo.fromJson(Map<String, dynamic> json) =>
      _$MetricInfoFromJson(json);
}

enum PeriodUnit {
  @_s.JsonValue('MICROSECOND')
  microsecond,
  @_s.JsonValue('MILLISECOND')
  millisecond,
  @_s.JsonValue('SECOND')
  second,
  @_s.JsonValue('MINUTE')
  minute,
  @_s.JsonValue('HOUR')
  hour,
  @_s.JsonValue('DAY')
  day,
  @_s.JsonValue('WEEK')
  week,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutServiceQuotaIncreaseRequestIntoTemplateResponse {
  /// A structure that contains information about one service quota increase
  /// request.
  @_s.JsonKey(name: 'ServiceQuotaIncreaseRequestInTemplate')
  final ServiceQuotaIncreaseRequestInTemplate
      serviceQuotaIncreaseRequestInTemplate;

  PutServiceQuotaIncreaseRequestIntoTemplateResponse({
    this.serviceQuotaIncreaseRequestInTemplate,
  });
  factory PutServiceQuotaIncreaseRequestIntoTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutServiceQuotaIncreaseRequestIntoTemplateResponseFromJson(json);
}

/// A structure that contains information about the quota period.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QuotaPeriod {
  /// The time unit of a period.
  @_s.JsonKey(name: 'PeriodUnit')
  final PeriodUnit periodUnit;

  /// The value of a period.
  @_s.JsonKey(name: 'PeriodValue')
  final int periodValue;

  QuotaPeriod({
    this.periodUnit,
    this.periodValue,
  });
  factory QuotaPeriod.fromJson(Map<String, dynamic> json) =>
      _$QuotaPeriodFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestServiceQuotaIncreaseResponse {
  /// Returns a list of service quota requests.
  @_s.JsonKey(name: 'RequestedQuota')
  final RequestedServiceQuotaChange requestedQuota;

  RequestServiceQuotaIncreaseResponse({
    this.requestedQuota,
  });
  factory RequestServiceQuotaIncreaseResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RequestServiceQuotaIncreaseResponseFromJson(json);
}

enum RequestStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('CASE_OPENED')
  caseOpened,
  @_s.JsonValue('APPROVED')
  approved,
  @_s.JsonValue('DENIED')
  denied,
  @_s.JsonValue('CASE_CLOSED')
  caseClosed,
}

/// A structure that contains information about a requested change for a quota.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestedServiceQuotaChange {
  /// The case Id for the service quota increase request.
  @_s.JsonKey(name: 'CaseId')
  final String caseId;

  /// The date and time when the service quota increase request was received and
  /// the case Id was created.
  @_s.JsonKey(name: 'Created', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime created;

  /// New increased value for the service quota.
  @_s.JsonKey(name: 'DesiredValue')
  final double desiredValue;

  /// Identifies if the quota is global.
  @_s.JsonKey(name: 'GlobalQuota')
  final bool globalQuota;

  /// The unique identifier of a requested service quota change.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The date and time of the most recent change in the service quota increase
  /// request.
  @_s.JsonKey(name: 'LastUpdated', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastUpdated;

  /// The Amazon Resource Name (ARN) of the service quota.
  @_s.JsonKey(name: 'QuotaArn')
  final String quotaArn;

  /// Specifies the service quota that you want to use.
  @_s.JsonKey(name: 'QuotaCode')
  final String quotaCode;

  /// Name of the service quota.
  @_s.JsonKey(name: 'QuotaName')
  final String quotaName;

  /// The IAM identity who submitted the service quota increase request.
  @_s.JsonKey(name: 'Requester')
  final String requester;

  /// Specifies the service that you want to use.
  @_s.JsonKey(name: 'ServiceCode')
  final String serviceCode;

  /// The name of the AWS service specified in the increase request.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  /// State of the service quota increase request.
  @_s.JsonKey(name: 'Status')
  final RequestStatus status;

  /// Specifies the unit used for the quota.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  RequestedServiceQuotaChange({
    this.caseId,
    this.created,
    this.desiredValue,
    this.globalQuota,
    this.id,
    this.lastUpdated,
    this.quotaArn,
    this.quotaCode,
    this.quotaName,
    this.requester,
    this.serviceCode,
    this.serviceName,
    this.status,
    this.unit,
  });
  factory RequestedServiceQuotaChange.fromJson(Map<String, dynamic> json) =>
      _$RequestedServiceQuotaChangeFromJson(json);
}

/// A structure that contains the <code>ServiceName</code> and
/// <code>ServiceCode</code>. It does not include all details of the service
/// quota. To get those values, use the <a>ListServiceQuotas</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceInfo {
  /// Specifies the service that you want to use.
  @_s.JsonKey(name: 'ServiceCode')
  final String serviceCode;

  /// The name of the AWS service specified in the increase request.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  ServiceInfo({
    this.serviceCode,
    this.serviceName,
  });
  factory ServiceInfo.fromJson(Map<String, dynamic> json) =>
      _$ServiceInfoFromJson(json);
}

/// A structure that contains the full set of details that define the service
/// quota.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceQuota {
  /// Specifies if the quota value can be increased.
  @_s.JsonKey(name: 'Adjustable')
  final bool adjustable;

  /// Specifies the <code>ErrorCode</code> and <code>ErrorMessage</code> when
  /// success isn't achieved.
  @_s.JsonKey(name: 'ErrorReason')
  final ErrorReason errorReason;

  /// Specifies if the quota is global.
  @_s.JsonKey(name: 'GlobalQuota')
  final bool globalQuota;

  /// Identifies the unit and value of how time is measured.
  @_s.JsonKey(name: 'Period')
  final QuotaPeriod period;

  /// The Amazon Resource Name (ARN) of the service quota.
  @_s.JsonKey(name: 'QuotaArn')
  final String quotaArn;

  /// The code identifier for the service quota specified.
  @_s.JsonKey(name: 'QuotaCode')
  final String quotaCode;

  /// The name identifier of the service quota.
  @_s.JsonKey(name: 'QuotaName')
  final String quotaName;

  /// Specifies the service that you want to use.
  @_s.JsonKey(name: 'ServiceCode')
  final String serviceCode;

  /// The name of the AWS service specified in the increase request.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  /// The unit of measurement for the value of the service quota.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  /// Specifies the details about the measurement.
  @_s.JsonKey(name: 'UsageMetric')
  final MetricInfo usageMetric;

  /// The value of service quota.
  @_s.JsonKey(name: 'Value')
  final double value;

  ServiceQuota({
    this.adjustable,
    this.errorReason,
    this.globalQuota,
    this.period,
    this.quotaArn,
    this.quotaCode,
    this.quotaName,
    this.serviceCode,
    this.serviceName,
    this.unit,
    this.usageMetric,
    this.value,
  });
  factory ServiceQuota.fromJson(Map<String, dynamic> json) =>
      _$ServiceQuotaFromJson(json);
}

/// A structure that contains information about one service quota increase
/// request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceQuotaIncreaseRequestInTemplate {
  /// The AWS Region where the increase request occurs.
  @_s.JsonKey(name: 'AwsRegion')
  final String awsRegion;

  /// Identifies the new, increased value of the service quota in the increase
  /// request.
  @_s.JsonKey(name: 'DesiredValue')
  final double desiredValue;

  /// Specifies if the quota is a global quota.
  @_s.JsonKey(name: 'GlobalQuota')
  final bool globalQuota;

  /// The code identifier for the service quota specified in the increase request.
  @_s.JsonKey(name: 'QuotaCode')
  final String quotaCode;

  /// The name of the service quota in the increase request.
  @_s.JsonKey(name: 'QuotaName')
  final String quotaName;

  /// The code identifier for the AWS service specified in the increase request.
  @_s.JsonKey(name: 'ServiceCode')
  final String serviceCode;

  /// The name of the AWS service specified in the increase request.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  /// The unit of measure for the increase request.
  @_s.JsonKey(name: 'Unit')
  final String unit;

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
          Map<String, dynamic> json) =>
      _$ServiceQuotaIncreaseRequestInTemplateFromJson(json);
}

enum ServiceQuotaTemplateAssociationStatus {
  @_s.JsonValue('ASSOCIATED')
  associated,
  @_s.JsonValue('DISASSOCIATED')
  disassociated,
}

class AWSServiceAccessNotEnabledException extends _s.GenericAwsException {
  AWSServiceAccessNotEnabledException({String type, String message})
      : super(
            type: type,
            code: 'AWSServiceAccessNotEnabledException',
            message: message);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class DependencyAccessDeniedException extends _s.GenericAwsException {
  DependencyAccessDeniedException({String type, String message})
      : super(
            type: type,
            code: 'DependencyAccessDeniedException',
            message: message);
}

class IllegalArgumentException extends _s.GenericAwsException {
  IllegalArgumentException({String type, String message})
      : super(type: type, code: 'IllegalArgumentException', message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String type, String message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class InvalidResourceStateException extends _s.GenericAwsException {
  InvalidResourceStateException({String type, String message})
      : super(
            type: type,
            code: 'InvalidResourceStateException',
            message: message);
}

class NoAvailableOrganizationException extends _s.GenericAwsException {
  NoAvailableOrganizationException({String type, String message})
      : super(
            type: type,
            code: 'NoAvailableOrganizationException',
            message: message);
}

class NoSuchResourceException extends _s.GenericAwsException {
  NoSuchResourceException({String type, String message})
      : super(type: type, code: 'NoSuchResourceException', message: message);
}

class OrganizationNotInAllFeaturesModeException extends _s.GenericAwsException {
  OrganizationNotInAllFeaturesModeException({String type, String message})
      : super(
            type: type,
            code: 'OrganizationNotInAllFeaturesModeException',
            message: message);
}

class QuotaExceededException extends _s.GenericAwsException {
  QuotaExceededException({String type, String message})
      : super(type: type, code: 'QuotaExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String type, String message})
      : super(type: type, code: 'ServiceException', message: message);
}

class ServiceQuotaTemplateNotInUseException extends _s.GenericAwsException {
  ServiceQuotaTemplateNotInUseException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaTemplateNotInUseException',
            message: message);
}

class TemplatesNotAvailableInRegionException extends _s.GenericAwsException {
  TemplatesNotAvailableInRegionException({String type, String message})
      : super(
            type: type,
            code: 'TemplatesNotAvailableInRegionException',
            message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
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
  'TemplatesNotAvailableInRegionException': (type, message) =>
      TemplatesNotAvailableInRegionException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
