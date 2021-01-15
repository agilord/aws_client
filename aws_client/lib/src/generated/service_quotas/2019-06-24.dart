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

part '2019-06-24.g.dart';

/// With Service Quotas, you can view and manage your quotas easily as your AWS
/// workloads grow. Quotas, also referred to as limits, are the maximum number
/// of resources that you can create in your AWS account. For more information,
/// see the <a
/// href="https://docs.aws.amazon.com/servicequotas/latest/userguide/">Service
/// Quotas User Guide</a>.
class ServiceQuotas {
  final _s.JsonProtocol _protocol;
  ServiceQuotas({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'servicequotas',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates your quota request template with your organization. When a new
  /// account is created in your organization, the quota increase requests in
  /// the template are automatically applied to the account. You can add a quota
  /// increase request for any adjustable quota to your template.
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
  /// The AWS Region.
  ///
  /// Parameter [quotaCode] :
  /// The quota identifier.
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
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

  /// Disables your quota request template. After a template is disabled, the
  /// quota increase requests in the template are not applied to new accounts in
  /// your organization. Disabling a quota request template does not apply its
  /// quota increase requests.
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
  /// The quota identifier.
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
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
  /// The ID of the quota increase request.
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
  /// The quota identifier.
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
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
  /// The AWS Region.
  ///
  /// Parameter [quotaCode] :
  /// The quota identifier.
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
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

  /// Lists the default values for the quotas for the specified AWS service. A
  /// default value does not reflect any quota increases.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, if any, make another call with the token returned
  /// from this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAWSDefaultServiceQuotasResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the quota increase requests for the specified service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, if any, make another call with the token returned
  /// from this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
  ///
  /// Parameter [status] :
  /// The status of the quota increase request.
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
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
  /// The quota identifier.
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, if any, make another call with the token returned
  /// from this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [status] :
  /// The status value of the quota increase request.
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
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
  /// The AWS Region.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, if any, make another call with the token returned
  /// from this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
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
        if (awsRegion != null) 'AwsRegion': awsRegion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (serviceCode != null) 'ServiceCode': serviceCode,
      },
    );

    return ListServiceQuotaIncreaseRequestsInTemplateResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the applied quota values for the specified AWS service. For some
  /// quotas, only the default values are available. If the applied quota value
  /// is not available for a quota, the quota is not retrieved.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NoSuchResourceException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, if any, make another call with the token returned
  /// from this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
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
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListServiceQuotasResponse.fromJson(jsonResponse.body);
  }

  /// Lists the names and codes for the services integrated with Service Quotas.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [IllegalArgumentException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, if any, make another call with the token returned
  /// from this call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
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
  /// AWS CLI command or the <a
  /// href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_ListServiceQuotas.html">ListServiceQuotas</a>
  /// AWS API operation.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''arn:aws(-[\w]+)*:*:.+:[0-9]{12}:.+''',
      isRequired: true,
    );
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
  /// The AWS Region.
  ///
  /// Parameter [desiredValue] :
  /// The new, increased value for the quota.
  ///
  /// Parameter [quotaCode] :
  /// The quota identifier.
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
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
  /// The new, increased value for the quota.
  ///
  /// Parameter [quotaCode] :
  /// The quota identifier.
  ///
  /// Parameter [serviceCode] :
  /// The service identifier.
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
  /// AWS CLI command or the <a
  /// href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_ListServiceQuotas.html">ListServiceQuotas</a>
  /// AWS API operation.
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the resource.
  Future<void> tagResource({
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''arn:aws(-[\w]+)*:*:.+:[0-9]{12}:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
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
  /// AWS CLI command or the <a
  /// href="https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_ListServiceQuotas.html">ListServiceQuotas</a>
  /// AWS API operation.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags that you want to remove from the resource.
  Future<void> untagResource({
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''arn:aws(-[\w]+)*:*:.+:[0-9]{12}:.+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ServiceQuotasV20190624.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
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

/// An error that explains why an action did not succeed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorReason {
  /// Service Quotas returns the following error values:
  ///
  /// <ul>
  /// <li>
  /// <code>DEPENDENCY_ACCESS_DENIED_ERROR</code> - The caller does not have the
  /// required permissions to complete the action. To resolve the error, you must
  /// have permission to access the service or quota.
  /// </li>
  /// <li>
  /// <code>DEPENDENCY_THROTTLING_ERROR</code> - The service is throttling Service
  /// Quotas.
  /// </li>
  /// <li>
  /// <code>DEPENDENCY_SERVICE_ERROR</code> - The service is not available.
  /// </li>
  /// <li>
  /// <code>SERVICE_QUOTA_NOT_AVAILABLE_ERROR</code> - There was an error in
  /// Service Quotas.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ErrorCode')
  final ErrorCode errorCode;

  /// The error message.
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
  /// Information about the quota.
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
  /// The association status. If the status is <code>ASSOCIATED</code>, the quota
  /// increase requests in the template are automatically applied to new accounts
  /// in your organization.
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
  /// Information about the quota increase request.
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
  /// Information about the quota increase request.
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
  /// Information about the quota.
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
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the quotas.
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
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the quota increase requests.
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
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the quota increase requests.
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
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the quota increase requests.
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
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the quotas.
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
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the services.
  @_s.JsonKey(name: 'Services')
  final List<ServiceInfo> services;

  ListServicesResponse({
    this.nextToken,
    this.services,
  });
  factory ListServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListServicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A complex data type that contains zero or more tag elements.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Information about the CloudWatch metric that reflects quota usage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MetricInfo {
  /// The metric dimension. This is a name/value pair that is part of the identity
  /// of a metric.
  @_s.JsonKey(name: 'MetricDimensions')
  final Map<String, String> metricDimensions;

  /// The name of the metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The namespace of the metric.
  @_s.JsonKey(name: 'MetricNamespace')
  final String metricNamespace;

  /// The metric statistic that we recommend you use when determining quota usage.
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
  /// Information about the quota increase request.
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

/// Information about the quota period.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QuotaPeriod {
  /// The time unit.
  @_s.JsonKey(name: 'PeriodUnit')
  final PeriodUnit periodUnit;

  /// The value.
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
  /// Information about the quota increase request.
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

extension on RequestStatus {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a quota increase request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestedServiceQuotaChange {
  /// The case ID.
  @_s.JsonKey(name: 'CaseId')
  final String caseId;

  /// The date and time when the quota increase request was received and the case
  /// ID was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Created')
  final DateTime created;

  /// The new, increased value for the quota.
  @_s.JsonKey(name: 'DesiredValue')
  final double desiredValue;

  /// Indicates whether the quota is global.
  @_s.JsonKey(name: 'GlobalQuota')
  final bool globalQuota;

  /// The unique identifier.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The date and time of the most recent change.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdated')
  final DateTime lastUpdated;

  /// The Amazon Resource Name (ARN) of the quota.
  @_s.JsonKey(name: 'QuotaArn')
  final String quotaArn;

  /// The quota identifier.
  @_s.JsonKey(name: 'QuotaCode')
  final String quotaCode;

  /// The quota name.
  @_s.JsonKey(name: 'QuotaName')
  final String quotaName;

  /// The IAM identity of the requester.
  @_s.JsonKey(name: 'Requester')
  final String requester;

  /// The service identifier.
  @_s.JsonKey(name: 'ServiceCode')
  final String serviceCode;

  /// The service name.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  /// The state of the quota increase request.
  @_s.JsonKey(name: 'Status')
  final RequestStatus status;

  /// The unit of measurement.
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

/// Information about a service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceInfo {
  /// The service identifier.
  @_s.JsonKey(name: 'ServiceCode')
  final String serviceCode;

  /// The service name.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  ServiceInfo({
    this.serviceCode,
    this.serviceName,
  });
  factory ServiceInfo.fromJson(Map<String, dynamic> json) =>
      _$ServiceInfoFromJson(json);
}

/// Information about a quota.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceQuota {
  /// Indicates whether the quota value can be increased.
  @_s.JsonKey(name: 'Adjustable')
  final bool adjustable;

  /// The error code and error reason.
  @_s.JsonKey(name: 'ErrorReason')
  final ErrorReason errorReason;

  /// Indicates whether the quota is global.
  @_s.JsonKey(name: 'GlobalQuota')
  final bool globalQuota;

  /// The period of time.
  @_s.JsonKey(name: 'Period')
  final QuotaPeriod period;

  /// The Amazon Resource Name (ARN) of the quota.
  @_s.JsonKey(name: 'QuotaArn')
  final String quotaArn;

  /// The quota identifier.
  @_s.JsonKey(name: 'QuotaCode')
  final String quotaCode;

  /// The quota name.
  @_s.JsonKey(name: 'QuotaName')
  final String quotaName;

  /// The service identifier.
  @_s.JsonKey(name: 'ServiceCode')
  final String serviceCode;

  /// The service name.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  /// The unit of measurement.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  /// Information about the measurement.
  @_s.JsonKey(name: 'UsageMetric')
  final MetricInfo usageMetric;

  /// The quota value.
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

/// Information about a quota increase request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceQuotaIncreaseRequestInTemplate {
  /// The AWS Region.
  @_s.JsonKey(name: 'AwsRegion')
  final String awsRegion;

  /// The new, increased value of the quota.
  @_s.JsonKey(name: 'DesiredValue')
  final double desiredValue;

  /// Indicates whether the quota is global.
  @_s.JsonKey(name: 'GlobalQuota')
  final bool globalQuota;

  /// The quota identifier.
  @_s.JsonKey(name: 'QuotaCode')
  final String quotaCode;

  /// The quota name.
  @_s.JsonKey(name: 'QuotaName')
  final String quotaName;

  /// The service identifier.
  @_s.JsonKey(name: 'ServiceCode')
  final String serviceCode;

  /// The service name.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  /// The unit of measurement.
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

/// A complex data type that contains a tag key and tag value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A string that contains a tag key. The string length should be between 1 and
  /// 128 characters. Valid characters include a-z, A-Z, 0-9, space, and the
  /// special characters _ - . : / = + @.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// A string that contains an optional tag value. The string length should be
  /// between 0 and 256 characters. Valid characters include a-z, A-Z, 0-9, space,
  /// and the special characters _ - . : / = + @.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
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

class TagPolicyViolationException extends _s.GenericAwsException {
  TagPolicyViolationException({String type, String message})
      : super(
            type: type, code: 'TagPolicyViolationException', message: message);
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

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
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
