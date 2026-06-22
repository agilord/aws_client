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

import 'v2024_04_23.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Provide APIs to create and manage Amazon Connect Campaigns.
class ConnectCampaignsV2 {
  final _s.RestJsonProtocol _protocol;
  factory ConnectCampaignsV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'connect-campaigns',
    );
    return ConnectCampaignsV2._(
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
  ConnectCampaignsV2._({
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

  /// Creates a campaign for the specified Amazon Connect account. This API is
  /// idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<CreateCampaignResponse> createCampaign({
    required String connectInstanceId,
    required String name,
    ChannelSubtypeConfig? channelSubtypeConfig,
    CommunicationLimitsConfig? communicationLimitsOverride,
    CommunicationTimeConfig? communicationTimeConfig,
    String? connectCampaignFlowArn,
    EntryLimitsConfig? entryLimitsConfig,
    Schedule? schedule,
    Source? source,
    Map<String, String>? tags,
    ExternalCampaignType? type,
  }) async {
    final $payload = <String, dynamic>{
      'connectInstanceId': connectInstanceId,
      'name': name,
      if (channelSubtypeConfig != null)
        'channelSubtypeConfig': channelSubtypeConfig,
      if (communicationLimitsOverride != null)
        'communicationLimitsOverride': communicationLimitsOverride,
      if (communicationTimeConfig != null)
        'communicationTimeConfig': communicationTimeConfig,
      if (connectCampaignFlowArn != null)
        'connectCampaignFlowArn': connectCampaignFlowArn,
      if (entryLimitsConfig != null) 'entryLimitsConfig': entryLimitsConfig,
      if (schedule != null) 'schedule': schedule,
      if (source != null) 'source': source,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/campaigns',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCampaignResponse.fromJson(response);
  }

  /// Deletes a campaign from the specified Amazon Connect account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> deleteCampaign({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the channel subtype config of a campaign. This API is idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> deleteCampaignChannelSubtypeConfig({
    required ChannelSubtype channelSubtype,
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'channelSubtype': [channelSubtype.value],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/campaigns/${Uri.encodeComponent(id)}/channel-subtype-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the communication limits config for a campaign. This API is
  /// idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> deleteCampaignCommunicationLimits({
    required CommunicationLimitsConfigType config,
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'config': [config.value],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/campaigns/${Uri.encodeComponent(id)}/communication-limits',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the communication time config for a campaign. This API is
  /// idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> deleteCampaignCommunicationTime({
    required CommunicationTimeConfigType config,
    required String id,
  }) async {
    final $query = <String, List<String>>{
      'config': [config.value],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/communication-time',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the entry limits config for a campaign. This API is idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> deleteCampaignEntryLimits({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/entry-limits',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a connect instance config from the specified AWS account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> deleteConnectInstanceConfig({
    required String connectInstanceId,
    CampaignDeletionPolicy? campaignDeletionPolicy,
  }) async {
    final $query = <String, List<String>>{
      if (campaignDeletionPolicy != null)
        'campaignDeletionPolicy': [campaignDeletionPolicy.value],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/connect-instance/${Uri.encodeComponent(connectInstanceId)}/config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete the integration for the specified Amazon Connect instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> deleteConnectInstanceIntegration({
    required String connectInstanceId,
    required IntegrationIdentifier integrationIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'integrationIdentifier': integrationIdentifier,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/connect-instance/${Uri.encodeComponent(connectInstanceId)}/integrations/delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete the Connect Campaigns onboarding job for the specified Amazon
  /// Connect instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> deleteInstanceOnboardingJob({
    required String connectInstanceId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/connect-instance/${Uri.encodeComponent(connectInstanceId)}/onboarding',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes the specific campaign.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<DescribeCampaignResponse> describeCampaign({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCampaignResponse.fromJson(response);
  }

  /// Get state of a campaign for the specified Amazon Connect account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetCampaignStateResponse> getCampaignState({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/state',
      exceptionFnMap: _exceptionFns,
    );
    return GetCampaignStateResponse.fromJson(response);
  }

  /// Get state of campaigns for the specified Amazon Connect account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetCampaignStateBatchResponse> getCampaignStateBatch({
    required List<String> campaignIds,
  }) async {
    final $payload = <String, dynamic>{
      'campaignIds': campaignIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/campaigns-state',
      exceptionFnMap: _exceptionFns,
    );
    return GetCampaignStateBatchResponse.fromJson(response);
  }

  /// Get the specific Connect instance config.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<GetConnectInstanceConfigResponse> getConnectInstanceConfig({
    required String connectInstanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/connect-instance/${Uri.encodeComponent(connectInstanceId)}/config',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectInstanceConfigResponse.fromJson(response);
  }

  /// Get the instance communication limits.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<GetInstanceCommunicationLimitsResponse>
      getInstanceCommunicationLimits({
    required String connectInstanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/connect-instance/${Uri.encodeComponent(connectInstanceId)}/communication-limits',
      exceptionFnMap: _exceptionFns,
    );
    return GetInstanceCommunicationLimitsResponse.fromJson(response);
  }

  /// Get the specific instance onboarding job status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<GetInstanceOnboardingJobStatusResponse>
      getInstanceOnboardingJobStatus({
    required String connectInstanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/connect-instance/${Uri.encodeComponent(connectInstanceId)}/onboarding',
      exceptionFnMap: _exceptionFns,
    );
    return GetInstanceOnboardingJobStatusResponse.fromJson(response);
  }

  /// Provides summary information about the campaigns under the specified
  /// Amazon Connect account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  Future<ListCampaignsResponse> listCampaigns({
    CampaignFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/campaigns-summary',
      exceptionFnMap: _exceptionFns,
    );
    return ListCampaignsResponse.fromJson(response);
  }

  /// Provides summary information about the integration under the specified
  /// Connect instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<ListConnectInstanceIntegrationsResponse>
      listConnectInstanceIntegrations({
    required String connectInstanceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/connect-instance/${Uri.encodeComponent(connectInstanceId)}/integrations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectInstanceIntegrationsResponse.fromJson(response);
  }

  /// List tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Pauses a campaign for the specified Amazon Connect account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> pauseCampaign({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/pause',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Put or update the integration for the specified Amazon Connect instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> putConnectInstanceIntegration({
    required String connectInstanceId,
    required IntegrationConfig integrationConfig,
  }) async {
    final $payload = <String, dynamic>{
      'integrationConfig': integrationConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/connect-instance/${Uri.encodeComponent(connectInstanceId)}/integrations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Put the instance communication limits. This API is idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> putInstanceCommunicationLimits({
    required InstanceCommunicationLimitsConfig communicationLimitsConfig,
    required String connectInstanceId,
  }) async {
    final $payload = <String, dynamic>{
      'communicationLimitsConfig': communicationLimitsConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/connect-instance/${Uri.encodeComponent(connectInstanceId)}/communication-limits',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates outbound requests for the specified campaign Amazon Connect
  /// account. This API is idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<PutOutboundRequestBatchResponse> putOutboundRequestBatch({
    required String id,
    required List<OutboundRequest> outboundRequests,
  }) async {
    final $payload = <String, dynamic>{
      'outboundRequests': outboundRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/outbound-requests',
      exceptionFnMap: _exceptionFns,
    );
    return PutOutboundRequestBatchResponse.fromJson(response);
  }

  /// Takes in a list of profile outbound requests to be placed as part of an
  /// outbound campaign. This API is idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<PutProfileOutboundRequestBatchResponse>
      putProfileOutboundRequestBatch({
    required String id,
    required List<ProfileOutboundRequest> profileOutboundRequests,
  }) async {
    final $payload = <String, dynamic>{
      'profileOutboundRequests': profileOutboundRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/campaigns/${Uri.encodeComponent(id)}/profile-outbound-requests',
      exceptionFnMap: _exceptionFns,
    );
    return PutProfileOutboundRequestBatchResponse.fromJson(response);
  }

  /// Stops a campaign for the specified Amazon Connect account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> resumeCampaign({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/resume',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a campaign for the specified Amazon Connect account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> startCampaign({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/start',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Onboard the specific Amazon Connect instance to Connect Campaigns.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<StartInstanceOnboardingJobResponse> startInstanceOnboardingJob({
    required String connectInstanceId,
    required EncryptionConfig encryptionConfig,
  }) async {
    final $payload = <String, dynamic>{
      'encryptionConfig': encryptionConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/connect-instance/${Uri.encodeComponent(connectInstanceId)}/onboarding',
      exceptionFnMap: _exceptionFns,
    );
    return StartInstanceOnboardingJobResponse.fromJson(response);
  }

  /// Stops a campaign for the specified Amazon Connect account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> stopCampaign({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Tag a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> tagResource({
    required String arn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Untag a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<void> untagResource({
    required String arn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/tags/${Uri.encodeComponent(arn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the channel subtype config of a campaign. This API is idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> updateCampaignChannelSubtypeConfig({
    required ChannelSubtypeConfig channelSubtypeConfig,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'channelSubtypeConfig': channelSubtypeConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/campaigns/${Uri.encodeComponent(id)}/channel-subtype-config',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the communication limits config for a campaign. This API is
  /// idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> updateCampaignCommunicationLimits({
    required CommunicationLimitsConfig communicationLimitsOverride,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'communicationLimitsOverride': communicationLimitsOverride,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/campaigns/${Uri.encodeComponent(id)}/communication-limits',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the communication time config for a campaign. This API is
  /// idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> updateCampaignCommunicationTime({
    required CommunicationTimeConfig communicationTimeConfig,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'communicationTimeConfig': communicationTimeConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/communication-time',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the entry limits config for a campaign. This API is idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> updateCampaignEntryLimits({
    required EntryLimitsConfig entryLimitsConfig,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'entryLimitsConfig': entryLimitsConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/entry-limits',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the campaign flow associated with a campaign. This API is
  /// idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> updateCampaignFlowAssociation({
    required String connectCampaignFlowArn,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'connectCampaignFlowArn': connectCampaignFlowArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/flow',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the name of a campaign. This API is idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> updateCampaignName({
    required String id,
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/name',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the schedule for a campaign. This API is idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> updateCampaignSchedule({
    required String id,
    required Schedule schedule,
  }) async {
    final $payload = <String, dynamic>{
      'schedule': schedule,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/schedule',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the campaign source with a campaign. This API is idempotent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<void> updateCampaignSource({
    required String id,
    required Source source,
  }) async {
    final $payload = <String, dynamic>{
      'source': source,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/campaigns/${Uri.encodeComponent(id)}/source',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// The response for Create Campaign API
///
/// @nodoc
class CreateCampaignResponse {
  final String? arn;
  final String? id;
  final Map<String, String>? tags;

  CreateCampaignResponse({
    this.arn,
    this.id,
    this.tags,
  });

  factory CreateCampaignResponse.fromJson(Map<String, dynamic> json) {
    return CreateCampaignResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The response for DescribeCampaign API.
///
/// @nodoc
class DescribeCampaignResponse {
  final Campaign? campaign;

  DescribeCampaignResponse({
    this.campaign,
  });

  factory DescribeCampaignResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCampaignResponse(
      campaign: json['campaign'] != null
          ? Campaign.fromJson(json['campaign'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final campaign = this.campaign;
    return {
      if (campaign != null) 'campaign': campaign,
    };
  }
}

/// The response for GetCampaignState API.
///
/// @nodoc
class GetCampaignStateResponse {
  final CampaignState? state;

  GetCampaignStateResponse({
    this.state,
  });

  factory GetCampaignStateResponse.fromJson(Map<String, dynamic> json) {
    return GetCampaignStateResponse(
      state: (json['state'] as String?)?.let(CampaignState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'state': state.value,
    };
  }
}

/// The response for GetCampaignStateBatch API.
///
/// @nodoc
class GetCampaignStateBatchResponse {
  final List<FailedCampaignStateResponse>? failedRequests;
  final List<SuccessfulCampaignStateResponse>? successfulRequests;

  GetCampaignStateBatchResponse({
    this.failedRequests,
    this.successfulRequests,
  });

  factory GetCampaignStateBatchResponse.fromJson(Map<String, dynamic> json) {
    return GetCampaignStateBatchResponse(
      failedRequests: (json['failedRequests'] as List?)
          ?.nonNulls
          .map((e) =>
              FailedCampaignStateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulRequests: (json['successfulRequests'] as List?)
          ?.nonNulls
          .map((e) => SuccessfulCampaignStateResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRequests = this.failedRequests;
    final successfulRequests = this.successfulRequests;
    return {
      if (failedRequests != null) 'failedRequests': failedRequests,
      if (successfulRequests != null) 'successfulRequests': successfulRequests,
    };
  }
}

/// The response for GetConnectInstanceConfig API.
///
/// @nodoc
class GetConnectInstanceConfigResponse {
  final InstanceConfig? connectInstanceConfig;

  GetConnectInstanceConfigResponse({
    this.connectInstanceConfig,
  });

  factory GetConnectInstanceConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectInstanceConfigResponse(
      connectInstanceConfig: json['connectInstanceConfig'] != null
          ? InstanceConfig.fromJson(
              json['connectInstanceConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectInstanceConfig = this.connectInstanceConfig;
    return {
      if (connectInstanceConfig != null)
        'connectInstanceConfig': connectInstanceConfig,
    };
  }
}

/// The response for GetInstanceCommunicationLimits API.
///
/// @nodoc
class GetInstanceCommunicationLimitsResponse {
  final InstanceCommunicationLimitsConfig? communicationLimitsConfig;

  GetInstanceCommunicationLimitsResponse({
    this.communicationLimitsConfig,
  });

  factory GetInstanceCommunicationLimitsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetInstanceCommunicationLimitsResponse(
      communicationLimitsConfig: json['communicationLimitsConfig'] != null
          ? InstanceCommunicationLimitsConfig.fromJson(
              json['communicationLimitsConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final communicationLimitsConfig = this.communicationLimitsConfig;
    return {
      if (communicationLimitsConfig != null)
        'communicationLimitsConfig': communicationLimitsConfig,
    };
  }
}

/// The response for GetInstanceOnboardingJobStatus API.
///
/// @nodoc
class GetInstanceOnboardingJobStatusResponse {
  final InstanceOnboardingJobStatus? connectInstanceOnboardingJobStatus;

  GetInstanceOnboardingJobStatusResponse({
    this.connectInstanceOnboardingJobStatus,
  });

  factory GetInstanceOnboardingJobStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetInstanceOnboardingJobStatusResponse(
      connectInstanceOnboardingJobStatus:
          json['connectInstanceOnboardingJobStatus'] != null
              ? InstanceOnboardingJobStatus.fromJson(
                  json['connectInstanceOnboardingJobStatus']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectInstanceOnboardingJobStatus =
        this.connectInstanceOnboardingJobStatus;
    return {
      if (connectInstanceOnboardingJobStatus != null)
        'connectInstanceOnboardingJobStatus':
            connectInstanceOnboardingJobStatus,
    };
  }
}

/// The response for ListCampaigns API.
///
/// @nodoc
class ListCampaignsResponse {
  final List<CampaignSummary>? campaignSummaryList;
  final String? nextToken;

  ListCampaignsResponse({
    this.campaignSummaryList,
    this.nextToken,
  });

  factory ListCampaignsResponse.fromJson(Map<String, dynamic> json) {
    return ListCampaignsResponse(
      campaignSummaryList: (json['campaignSummaryList'] as List?)
          ?.nonNulls
          .map((e) => CampaignSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaignSummaryList = this.campaignSummaryList;
    final nextToken = this.nextToken;
    return {
      if (campaignSummaryList != null)
        'campaignSummaryList': campaignSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response for ListConnectInstanceIntegrations API.
///
/// @nodoc
class ListConnectInstanceIntegrationsResponse {
  final List<IntegrationSummary>? integrationSummaryList;
  final String? nextToken;

  ListConnectInstanceIntegrationsResponse({
    this.integrationSummaryList,
    this.nextToken,
  });

  factory ListConnectInstanceIntegrationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListConnectInstanceIntegrationsResponse(
      integrationSummaryList: (json['integrationSummaryList'] as List?)
          ?.nonNulls
          .map((e) => IntegrationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integrationSummaryList = this.integrationSummaryList;
    final nextToken = this.nextToken;
    return {
      if (integrationSummaryList != null)
        'integrationSummaryList': integrationSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The request for ListTagsForResource API.
///
/// @nodoc
class ListTagsForResourceResponse {
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

/// The response for PutOutboundRequestBatch API.
///
/// @nodoc
class PutOutboundRequestBatchResponse {
  final List<FailedRequest>? failedRequests;
  final List<SuccessfulRequest>? successfulRequests;

  PutOutboundRequestBatchResponse({
    this.failedRequests,
    this.successfulRequests,
  });

  factory PutOutboundRequestBatchResponse.fromJson(Map<String, dynamic> json) {
    return PutOutboundRequestBatchResponse(
      failedRequests: (json['failedRequests'] as List?)
          ?.nonNulls
          .map((e) => FailedRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulRequests: (json['successfulRequests'] as List?)
          ?.nonNulls
          .map((e) => SuccessfulRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRequests = this.failedRequests;
    final successfulRequests = this.successfulRequests;
    return {
      if (failedRequests != null) 'failedRequests': failedRequests,
      if (successfulRequests != null) 'successfulRequests': successfulRequests,
    };
  }
}

/// The response for PutProfileOutboundRequestBatch API
///
/// @nodoc
class PutProfileOutboundRequestBatchResponse {
  final List<FailedProfileOutboundRequest>? failedRequests;
  final List<SuccessfulProfileOutboundRequest>? successfulRequests;

  PutProfileOutboundRequestBatchResponse({
    this.failedRequests,
    this.successfulRequests,
  });

  factory PutProfileOutboundRequestBatchResponse.fromJson(
      Map<String, dynamic> json) {
    return PutProfileOutboundRequestBatchResponse(
      failedRequests: (json['failedRequests'] as List?)
          ?.nonNulls
          .map((e) =>
              FailedProfileOutboundRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulRequests: (json['successfulRequests'] as List?)
          ?.nonNulls
          .map((e) => SuccessfulProfileOutboundRequest.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedRequests = this.failedRequests;
    final successfulRequests = this.successfulRequests;
    return {
      if (failedRequests != null) 'failedRequests': failedRequests,
      if (successfulRequests != null) 'successfulRequests': successfulRequests,
    };
  }
}

/// The response for StartInstanceOnboardingJob API.
///
/// @nodoc
class StartInstanceOnboardingJobResponse {
  final InstanceOnboardingJobStatus? connectInstanceOnboardingJobStatus;

  StartInstanceOnboardingJobResponse({
    this.connectInstanceOnboardingJobStatus,
  });

  factory StartInstanceOnboardingJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartInstanceOnboardingJobResponse(
      connectInstanceOnboardingJobStatus:
          json['connectInstanceOnboardingJobStatus'] != null
              ? InstanceOnboardingJobStatus.fromJson(
                  json['connectInstanceOnboardingJobStatus']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectInstanceOnboardingJobStatus =
        this.connectInstanceOnboardingJobStatus;
    return {
      if (connectInstanceOnboardingJobStatus != null)
        'connectInstanceOnboardingJobStatus':
            connectInstanceOnboardingJobStatus,
    };
  }
}

/// Source of the campaign
///
/// @nodoc
class Source {
  final String? customerProfilesSegmentArn;
  final EventTrigger? eventTrigger;

  Source({
    this.customerProfilesSegmentArn,
    this.eventTrigger,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      customerProfilesSegmentArn: json['customerProfilesSegmentArn'] as String?,
      eventTrigger: json['eventTrigger'] != null
          ? EventTrigger.fromJson(json['eventTrigger'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerProfilesSegmentArn = this.customerProfilesSegmentArn;
    final eventTrigger = this.eventTrigger;
    return {
      if (customerProfilesSegmentArn != null)
        'customerProfilesSegmentArn': customerProfilesSegmentArn,
      if (eventTrigger != null) 'eventTrigger': eventTrigger,
    };
  }
}

/// Event trigger of the campaign
///
/// @nodoc
class EventTrigger {
  final String? customerProfilesDomainArn;

  EventTrigger({
    this.customerProfilesDomainArn,
  });

  factory EventTrigger.fromJson(Map<String, dynamic> json) {
    return EventTrigger(
      customerProfilesDomainArn: json['customerProfilesDomainArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customerProfilesDomainArn = this.customerProfilesDomainArn;
    return {
      if (customerProfilesDomainArn != null)
        'customerProfilesDomainArn': customerProfilesDomainArn,
    };
  }
}

/// Campaign schedule
///
/// @nodoc
class Schedule {
  final DateTime endTime;
  final DateTime startTime;
  final String? refreshFrequency;

  Schedule({
    required this.endTime,
    required this.startTime,
    this.refreshFrequency,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      endTime: nonNullableTimeStampFromJson(json['endTime'] ?? 0),
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
      refreshFrequency: json['refreshFrequency'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    final refreshFrequency = this.refreshFrequency;
    return {
      'endTime': iso8601ToJson(endTime),
      'startTime': iso8601ToJson(startTime),
      if (refreshFrequency != null) 'refreshFrequency': refreshFrequency,
    };
  }
}

/// Campaign entry limits config
///
/// @nodoc
class EntryLimitsConfig {
  /// Maximum number of times a participant can enter the campaign. A value of 0
  /// indicates unlimited entries. Values of 1 or greater specify the exact number
  /// of entries allowed.
  final int maxEntryCount;

  /// Minimum time interval that must pass before a participant can enter the
  /// campaign again.
  final String minEntryInterval;

  EntryLimitsConfig({
    required this.maxEntryCount,
    required this.minEntryInterval,
  });

  factory EntryLimitsConfig.fromJson(Map<String, dynamic> json) {
    return EntryLimitsConfig(
      maxEntryCount: (json['maxEntryCount'] as int?) ?? 0,
      minEntryInterval: (json['minEntryInterval'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final maxEntryCount = this.maxEntryCount;
    final minEntryInterval = this.minEntryInterval;
    return {
      'maxEntryCount': maxEntryCount,
      'minEntryInterval': minEntryInterval,
    };
  }
}

/// Campaign communication time config
///
/// @nodoc
class CommunicationTimeConfig {
  final LocalTimeZoneConfig localTimeZoneConfig;
  final TimeWindow? email;
  final TimeWindow? sms;
  final TimeWindow? telephony;
  final TimeWindow? whatsApp;

  CommunicationTimeConfig({
    required this.localTimeZoneConfig,
    this.email,
    this.sms,
    this.telephony,
    this.whatsApp,
  });

  factory CommunicationTimeConfig.fromJson(Map<String, dynamic> json) {
    return CommunicationTimeConfig(
      localTimeZoneConfig: LocalTimeZoneConfig.fromJson(
          (json['localTimeZoneConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      email: json['email'] != null
          ? TimeWindow.fromJson(json['email'] as Map<String, dynamic>)
          : null,
      sms: json['sms'] != null
          ? TimeWindow.fromJson(json['sms'] as Map<String, dynamic>)
          : null,
      telephony: json['telephony'] != null
          ? TimeWindow.fromJson(json['telephony'] as Map<String, dynamic>)
          : null,
      whatsApp: json['whatsApp'] != null
          ? TimeWindow.fromJson(json['whatsApp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final localTimeZoneConfig = this.localTimeZoneConfig;
    final email = this.email;
    final sms = this.sms;
    final telephony = this.telephony;
    final whatsApp = this.whatsApp;
    return {
      'localTimeZoneConfig': localTimeZoneConfig,
      if (email != null) 'email': email,
      if (sms != null) 'sms': sms,
      if (telephony != null) 'telephony': telephony,
      if (whatsApp != null) 'whatsApp': whatsApp,
    };
  }
}

/// Local time zone config
///
/// @nodoc
class LocalTimeZoneConfig {
  final String? defaultTimeZone;
  final List<LocalTimeZoneDetectionType>? localTimeZoneDetection;
  final LocalTimeZoneDetectionScope? localTimeZoneDetectionScope;

  LocalTimeZoneConfig({
    this.defaultTimeZone,
    this.localTimeZoneDetection,
    this.localTimeZoneDetectionScope,
  });

  factory LocalTimeZoneConfig.fromJson(Map<String, dynamic> json) {
    return LocalTimeZoneConfig(
      defaultTimeZone: json['defaultTimeZone'] as String?,
      localTimeZoneDetection: (json['localTimeZoneDetection'] as List?)
          ?.nonNulls
          .map((e) => LocalTimeZoneDetectionType.fromString((e as String)))
          .toList(),
      localTimeZoneDetectionScope:
          (json['localTimeZoneDetectionScope'] as String?)
              ?.let(LocalTimeZoneDetectionScope.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultTimeZone = this.defaultTimeZone;
    final localTimeZoneDetection = this.localTimeZoneDetection;
    final localTimeZoneDetectionScope = this.localTimeZoneDetectionScope;
    return {
      if (defaultTimeZone != null) 'defaultTimeZone': defaultTimeZone,
      if (localTimeZoneDetection != null)
        'localTimeZoneDetection':
            localTimeZoneDetection.map((e) => e.value).toList(),
      if (localTimeZoneDetectionScope != null)
        'localTimeZoneDetectionScope': localTimeZoneDetectionScope.value,
    };
  }
}

/// Time window config
///
/// @nodoc
class TimeWindow {
  final OpenHours openHours;
  final RestrictedPeriods? restrictedPeriods;

  TimeWindow({
    required this.openHours,
    this.restrictedPeriods,
  });

  factory TimeWindow.fromJson(Map<String, dynamic> json) {
    return TimeWindow(
      openHours: OpenHours.fromJson(
          (json['openHours'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      restrictedPeriods: json['restrictedPeriods'] != null
          ? RestrictedPeriods.fromJson(
              json['restrictedPeriods'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final openHours = this.openHours;
    final restrictedPeriods = this.restrictedPeriods;
    return {
      'openHours': openHours,
      if (restrictedPeriods != null) 'restrictedPeriods': restrictedPeriods,
    };
  }
}

/// Open Hours config
///
/// @nodoc
class OpenHours {
  final Map<DayOfWeek, List<TimeRange>>? dailyHours;

  OpenHours({
    this.dailyHours,
  });

  factory OpenHours.fromJson(Map<String, dynamic> json) {
    return OpenHours(
      dailyHours: (json['dailyHours'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              DayOfWeek.fromString(k),
              (e as List)
                  .nonNulls
                  .map((e) => TimeRange.fromJson(e as Map<String, dynamic>))
                  .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final dailyHours = this.dailyHours;
    return {
      if (dailyHours != null)
        'dailyHours': dailyHours.map((k, e) => MapEntry(k.value, e)),
    };
  }
}

/// Restricted period config
///
/// @nodoc
class RestrictedPeriods {
  final List<RestrictedPeriod>? restrictedPeriodList;

  RestrictedPeriods({
    this.restrictedPeriodList,
  });

  factory RestrictedPeriods.fromJson(Map<String, dynamic> json) {
    return RestrictedPeriods(
      restrictedPeriodList: (json['restrictedPeriodList'] as List?)
          ?.nonNulls
          .map((e) => RestrictedPeriod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final restrictedPeriodList = this.restrictedPeriodList;
    return {
      if (restrictedPeriodList != null)
        'restrictedPeriodList': restrictedPeriodList,
    };
  }
}

/// Restricted period
///
/// @nodoc
class RestrictedPeriod {
  final String endDate;
  final String startDate;
  final String? name;

  RestrictedPeriod({
    required this.endDate,
    required this.startDate,
    this.name,
  });

  factory RestrictedPeriod.fromJson(Map<String, dynamic> json) {
    return RestrictedPeriod(
      endDate: (json['endDate'] as String?) ?? '',
      startDate: (json['startDate'] as String?) ?? '',
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endDate = this.endDate;
    final startDate = this.startDate;
    final name = this.name;
    return {
      'endDate': endDate,
      'startDate': startDate,
      if (name != null) 'name': name,
    };
  }
}

/// Day of week enum
///
/// @nodoc
class DayOfWeek {
  static const monday = DayOfWeek._('MONDAY');
  static const tuesday = DayOfWeek._('TUESDAY');
  static const wednesday = DayOfWeek._('WEDNESDAY');
  static const thursday = DayOfWeek._('THURSDAY');
  static const friday = DayOfWeek._('FRIDAY');
  static const saturday = DayOfWeek._('SATURDAY');
  static const sunday = DayOfWeek._('SUNDAY');

  final String value;

  const DayOfWeek._(this.value);

  static const values = [
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  ];

  static DayOfWeek fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DayOfWeek._(value));

  @override
  bool operator ==(other) => other is DayOfWeek && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Time range in 24 hour format
///
/// @nodoc
class TimeRange {
  final String endTime;
  final String startTime;

  TimeRange({
    required this.endTime,
    required this.startTime,
  });

  factory TimeRange.fromJson(Map<String, dynamic> json) {
    return TimeRange(
      endTime: (json['endTime'] as String?) ?? '',
      startTime: (json['startTime'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'endTime': endTime,
      'startTime': startTime,
    };
  }
}

/// Local TimeZone Detection scope.
///
/// @nodoc
class LocalTimeZoneDetectionScope {
  static const primaryOnly = LocalTimeZoneDetectionScope._('PRIMARY_ONLY');
  static const allAvailable = LocalTimeZoneDetectionScope._('ALL_AVAILABLE');

  final String value;

  const LocalTimeZoneDetectionScope._(this.value);

  static const values = [primaryOnly, allAvailable];

  static LocalTimeZoneDetectionScope fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LocalTimeZoneDetectionScope._(value));

  @override
  bool operator ==(other) =>
      other is LocalTimeZoneDetectionScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Local TimeZone Detection method.
///
/// @nodoc
class LocalTimeZoneDetectionType {
  static const zipCode = LocalTimeZoneDetectionType._('ZIP_CODE');
  static const areaCode = LocalTimeZoneDetectionType._('AREA_CODE');

  final String value;

  const LocalTimeZoneDetectionType._(this.value);

  static const values = [zipCode, areaCode];

  static LocalTimeZoneDetectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LocalTimeZoneDetectionType._(value));

  @override
  bool operator ==(other) =>
      other is LocalTimeZoneDetectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Communication limits config
///
/// @nodoc
class CommunicationLimitsConfig {
  final CommunicationLimits? allChannelSubtypes;
  final InstanceLimitsHandling? instanceLimitsHandling;

  CommunicationLimitsConfig({
    this.allChannelSubtypes,
    this.instanceLimitsHandling,
  });

  factory CommunicationLimitsConfig.fromJson(Map<String, dynamic> json) {
    return CommunicationLimitsConfig(
      allChannelSubtypes: json['allChannelSubtypes'] != null
          ? CommunicationLimits.fromJson(
              json['allChannelSubtypes'] as Map<String, dynamic>)
          : null,
      instanceLimitsHandling: (json['instanceLimitsHandling'] as String?)
          ?.let(InstanceLimitsHandling.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final allChannelSubtypes = this.allChannelSubtypes;
    final instanceLimitsHandling = this.instanceLimitsHandling;
    return {
      if (allChannelSubtypes != null) 'allChannelSubtypes': allChannelSubtypes,
      if (instanceLimitsHandling != null)
        'instanceLimitsHandling': instanceLimitsHandling.value,
    };
  }
}

/// Communication limits
///
/// @nodoc
class CommunicationLimits {
  final List<CommunicationLimit>? communicationLimitsList;

  CommunicationLimits({
    this.communicationLimitsList,
  });

  factory CommunicationLimits.fromJson(Map<String, dynamic> json) {
    return CommunicationLimits(
      communicationLimitsList: (json['communicationLimitsList'] as List?)
          ?.nonNulls
          .map((e) => CommunicationLimit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final communicationLimitsList = this.communicationLimitsList;
    return {
      if (communicationLimitsList != null)
        'communicationLimitsList': communicationLimitsList,
    };
  }
}

/// Instance limits handling
///
/// @nodoc
class InstanceLimitsHandling {
  static const optIn = InstanceLimitsHandling._('OPT_IN');
  static const optOut = InstanceLimitsHandling._('OPT_OUT');

  final String value;

  const InstanceLimitsHandling._(this.value);

  static const values = [optIn, optOut];

  static InstanceLimitsHandling fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceLimitsHandling._(value));

  @override
  bool operator ==(other) =>
      other is InstanceLimitsHandling && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Communication Limit
///
/// @nodoc
class CommunicationLimit {
  /// The number of days to consider with regards to this limit.
  final int frequency;

  /// Maximum number of contacts allowed for a given target within the given
  /// frequency.
  final int maxCountPerRecipient;
  final CommunicationLimitTimeUnit unit;

  CommunicationLimit({
    required this.frequency,
    required this.maxCountPerRecipient,
    required this.unit,
  });

  factory CommunicationLimit.fromJson(Map<String, dynamic> json) {
    return CommunicationLimit(
      frequency: (json['frequency'] as int?) ?? 0,
      maxCountPerRecipient: (json['maxCountPerRecipient'] as int?) ?? 0,
      unit: CommunicationLimitTimeUnit.fromString(
          (json['unit'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final frequency = this.frequency;
    final maxCountPerRecipient = this.maxCountPerRecipient;
    final unit = this.unit;
    return {
      'frequency': frequency,
      'maxCountPerRecipient': maxCountPerRecipient,
      'unit': unit.value,
    };
  }
}

/// The communication limit time unit.
///
/// @nodoc
class CommunicationLimitTimeUnit {
  static const day = CommunicationLimitTimeUnit._('DAY');

  final String value;

  const CommunicationLimitTimeUnit._(this.value);

  static const values = [day];

  static CommunicationLimitTimeUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CommunicationLimitTimeUnit._(value));

  @override
  bool operator ==(other) =>
      other is CommunicationLimitTimeUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Campaign Channel Subtype config
///
/// @nodoc
class ChannelSubtypeConfig {
  final EmailChannelSubtypeConfig? email;
  final SmsChannelSubtypeConfig? sms;
  final TelephonyChannelSubtypeConfig? telephony;
  final WhatsAppChannelSubtypeConfig? whatsApp;

  ChannelSubtypeConfig({
    this.email,
    this.sms,
    this.telephony,
    this.whatsApp,
  });

  factory ChannelSubtypeConfig.fromJson(Map<String, dynamic> json) {
    return ChannelSubtypeConfig(
      email: json['email'] != null
          ? EmailChannelSubtypeConfig.fromJson(
              json['email'] as Map<String, dynamic>)
          : null,
      sms: json['sms'] != null
          ? SmsChannelSubtypeConfig.fromJson(
              json['sms'] as Map<String, dynamic>)
          : null,
      telephony: json['telephony'] != null
          ? TelephonyChannelSubtypeConfig.fromJson(
              json['telephony'] as Map<String, dynamic>)
          : null,
      whatsApp: json['whatsApp'] != null
          ? WhatsAppChannelSubtypeConfig.fromJson(
              json['whatsApp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final sms = this.sms;
    final telephony = this.telephony;
    final whatsApp = this.whatsApp;
    return {
      if (email != null) 'email': email,
      if (sms != null) 'sms': sms,
      if (telephony != null) 'telephony': telephony,
      if (whatsApp != null) 'whatsApp': whatsApp,
    };
  }
}

/// Telephony Channel Subtype config
///
/// @nodoc
class TelephonyChannelSubtypeConfig {
  final TelephonyOutboundConfig defaultOutboundConfig;
  final TelephonyOutboundMode outboundMode;
  final double? capacity;
  final String? connectQueueId;

  TelephonyChannelSubtypeConfig({
    required this.defaultOutboundConfig,
    required this.outboundMode,
    this.capacity,
    this.connectQueueId,
  });

  factory TelephonyChannelSubtypeConfig.fromJson(Map<String, dynamic> json) {
    return TelephonyChannelSubtypeConfig(
      defaultOutboundConfig: TelephonyOutboundConfig.fromJson(
          (json['defaultOutboundConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      outboundMode: TelephonyOutboundMode.fromJson(
          (json['outboundMode'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      capacity: _s.parseJsonDouble(json['capacity']),
      connectQueueId: json['connectQueueId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultOutboundConfig = this.defaultOutboundConfig;
    final outboundMode = this.outboundMode;
    final capacity = this.capacity;
    final connectQueueId = this.connectQueueId;
    return {
      'defaultOutboundConfig': defaultOutboundConfig,
      'outboundMode': outboundMode,
      if (capacity != null) 'capacity': _s.encodeJsonDouble(capacity),
      if (connectQueueId != null) 'connectQueueId': connectQueueId,
    };
  }
}

/// SMS Channel Subtype config
///
/// @nodoc
class SmsChannelSubtypeConfig {
  final SmsOutboundConfig defaultOutboundConfig;
  final SmsOutboundMode outboundMode;
  final double? capacity;

  SmsChannelSubtypeConfig({
    required this.defaultOutboundConfig,
    required this.outboundMode,
    this.capacity,
  });

  factory SmsChannelSubtypeConfig.fromJson(Map<String, dynamic> json) {
    return SmsChannelSubtypeConfig(
      defaultOutboundConfig: SmsOutboundConfig.fromJson(
          (json['defaultOutboundConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      outboundMode: SmsOutboundMode.fromJson(
          (json['outboundMode'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      capacity: _s.parseJsonDouble(json['capacity']),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultOutboundConfig = this.defaultOutboundConfig;
    final outboundMode = this.outboundMode;
    final capacity = this.capacity;
    return {
      'defaultOutboundConfig': defaultOutboundConfig,
      'outboundMode': outboundMode,
      if (capacity != null) 'capacity': _s.encodeJsonDouble(capacity),
    };
  }
}

/// Email Channel Subtype config
///
/// @nodoc
class EmailChannelSubtypeConfig {
  final EmailOutboundConfig defaultOutboundConfig;
  final EmailOutboundMode outboundMode;
  final double? capacity;

  EmailChannelSubtypeConfig({
    required this.defaultOutboundConfig,
    required this.outboundMode,
    this.capacity,
  });

  factory EmailChannelSubtypeConfig.fromJson(Map<String, dynamic> json) {
    return EmailChannelSubtypeConfig(
      defaultOutboundConfig: EmailOutboundConfig.fromJson(
          (json['defaultOutboundConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      outboundMode: EmailOutboundMode.fromJson(
          (json['outboundMode'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      capacity: _s.parseJsonDouble(json['capacity']),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultOutboundConfig = this.defaultOutboundConfig;
    final outboundMode = this.outboundMode;
    final capacity = this.capacity;
    return {
      'defaultOutboundConfig': defaultOutboundConfig,
      'outboundMode': outboundMode,
      if (capacity != null) 'capacity': _s.encodeJsonDouble(capacity),
    };
  }
}

/// WhatsApp Channel Subtype config
///
/// @nodoc
class WhatsAppChannelSubtypeConfig {
  final WhatsAppOutboundConfig defaultOutboundConfig;
  final WhatsAppOutboundMode outboundMode;
  final double? capacity;

  WhatsAppChannelSubtypeConfig({
    required this.defaultOutboundConfig,
    required this.outboundMode,
    this.capacity,
  });

  factory WhatsAppChannelSubtypeConfig.fromJson(Map<String, dynamic> json) {
    return WhatsAppChannelSubtypeConfig(
      defaultOutboundConfig: WhatsAppOutboundConfig.fromJson(
          (json['defaultOutboundConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      outboundMode: WhatsAppOutboundMode.fromJson(
          (json['outboundMode'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      capacity: _s.parseJsonDouble(json['capacity']),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultOutboundConfig = this.defaultOutboundConfig;
    final outboundMode = this.outboundMode;
    final capacity = this.capacity;
    return {
      'defaultOutboundConfig': defaultOutboundConfig,
      'outboundMode': outboundMode,
      if (capacity != null) 'capacity': _s.encodeJsonDouble(capacity),
    };
  }
}

/// WhatsApp Outbound Mode
///
/// @nodoc
class WhatsAppOutboundMode {
  final AgentlessConfig? agentless;

  WhatsAppOutboundMode({
    this.agentless,
  });

  factory WhatsAppOutboundMode.fromJson(Map<String, dynamic> json) {
    return WhatsAppOutboundMode(
      agentless: json['agentless'] != null
          ? AgentlessConfig.fromJson(json['agentless'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentless = this.agentless;
    return {
      if (agentless != null) 'agentless': agentless,
    };
  }
}

/// Default WhatsApp Outbound config
///
/// @nodoc
class WhatsAppOutboundConfig {
  final String connectSourcePhoneNumberArn;
  final String wisdomTemplateArn;

  WhatsAppOutboundConfig({
    required this.connectSourcePhoneNumberArn,
    required this.wisdomTemplateArn,
  });

  factory WhatsAppOutboundConfig.fromJson(Map<String, dynamic> json) {
    return WhatsAppOutboundConfig(
      connectSourcePhoneNumberArn:
          (json['connectSourcePhoneNumberArn'] as String?) ?? '',
      wisdomTemplateArn: (json['wisdomTemplateArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connectSourcePhoneNumberArn = this.connectSourcePhoneNumberArn;
    final wisdomTemplateArn = this.wisdomTemplateArn;
    return {
      'connectSourcePhoneNumberArn': connectSourcePhoneNumberArn,
      'wisdomTemplateArn': wisdomTemplateArn,
    };
  }
}

/// Agentless config
///
/// @nodoc
class AgentlessConfig {
  AgentlessConfig();

  factory AgentlessConfig.fromJson(Map<String, dynamic> _) {
    return AgentlessConfig();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Email Outbound Mode
///
/// @nodoc
class EmailOutboundMode {
  final AgentlessConfig? agentless;

  EmailOutboundMode({
    this.agentless,
  });

  factory EmailOutboundMode.fromJson(Map<String, dynamic> json) {
    return EmailOutboundMode(
      agentless: json['agentless'] != null
          ? AgentlessConfig.fromJson(json['agentless'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentless = this.agentless;
    return {
      if (agentless != null) 'agentless': agentless,
    };
  }
}

/// Default Email Outbound config
///
/// @nodoc
class EmailOutboundConfig {
  final String connectSourceEmailAddress;
  final String wisdomTemplateArn;
  final String? sourceEmailAddressDisplayName;

  EmailOutboundConfig({
    required this.connectSourceEmailAddress,
    required this.wisdomTemplateArn,
    this.sourceEmailAddressDisplayName,
  });

  factory EmailOutboundConfig.fromJson(Map<String, dynamic> json) {
    return EmailOutboundConfig(
      connectSourceEmailAddress:
          (json['connectSourceEmailAddress'] as String?) ?? '',
      wisdomTemplateArn: (json['wisdomTemplateArn'] as String?) ?? '',
      sourceEmailAddressDisplayName:
          json['sourceEmailAddressDisplayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectSourceEmailAddress = this.connectSourceEmailAddress;
    final wisdomTemplateArn = this.wisdomTemplateArn;
    final sourceEmailAddressDisplayName = this.sourceEmailAddressDisplayName;
    return {
      'connectSourceEmailAddress': connectSourceEmailAddress,
      'wisdomTemplateArn': wisdomTemplateArn,
      if (sourceEmailAddressDisplayName != null)
        'sourceEmailAddressDisplayName': sourceEmailAddressDisplayName,
    };
  }
}

/// SMS Outbound Mode
///
/// @nodoc
class SmsOutboundMode {
  final AgentlessConfig? agentless;

  SmsOutboundMode({
    this.agentless,
  });

  factory SmsOutboundMode.fromJson(Map<String, dynamic> json) {
    return SmsOutboundMode(
      agentless: json['agentless'] != null
          ? AgentlessConfig.fromJson(json['agentless'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentless = this.agentless;
    return {
      if (agentless != null) 'agentless': agentless,
    };
  }
}

/// Default SMS Outbound config
///
/// @nodoc
class SmsOutboundConfig {
  final String connectSourcePhoneNumberArn;
  final String wisdomTemplateArn;

  SmsOutboundConfig({
    required this.connectSourcePhoneNumberArn,
    required this.wisdomTemplateArn,
  });

  factory SmsOutboundConfig.fromJson(Map<String, dynamic> json) {
    return SmsOutboundConfig(
      connectSourcePhoneNumberArn:
          (json['connectSourcePhoneNumberArn'] as String?) ?? '',
      wisdomTemplateArn: (json['wisdomTemplateArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connectSourcePhoneNumberArn = this.connectSourcePhoneNumberArn;
    final wisdomTemplateArn = this.wisdomTemplateArn;
    return {
      'connectSourcePhoneNumberArn': connectSourcePhoneNumberArn,
      'wisdomTemplateArn': wisdomTemplateArn,
    };
  }
}

/// Telephony Outbound Mode
///
/// @nodoc
class TelephonyOutboundMode {
  final AgentlessConfig? agentless;
  final PredictiveConfig? predictive;
  final PreviewConfig? preview;
  final ProgressiveConfig? progressive;

  TelephonyOutboundMode({
    this.agentless,
    this.predictive,
    this.preview,
    this.progressive,
  });

  factory TelephonyOutboundMode.fromJson(Map<String, dynamic> json) {
    return TelephonyOutboundMode(
      agentless: json['agentless'] != null
          ? AgentlessConfig.fromJson(json['agentless'] as Map<String, dynamic>)
          : null,
      predictive: json['predictive'] != null
          ? PredictiveConfig.fromJson(
              json['predictive'] as Map<String, dynamic>)
          : null,
      preview: json['preview'] != null
          ? PreviewConfig.fromJson(json['preview'] as Map<String, dynamic>)
          : null,
      progressive: json['progressive'] != null
          ? ProgressiveConfig.fromJson(
              json['progressive'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentless = this.agentless;
    final predictive = this.predictive;
    final preview = this.preview;
    final progressive = this.progressive;
    return {
      if (agentless != null) 'agentless': agentless,
      if (predictive != null) 'predictive': predictive,
      if (preview != null) 'preview': preview,
      if (progressive != null) 'progressive': progressive,
    };
  }
}

/// Default Telephony Outbound config
///
/// @nodoc
class TelephonyOutboundConfig {
  final String connectContactFlowId;
  final AnswerMachineDetectionConfig? answerMachineDetectionConfig;
  final String? connectSourcePhoneNumber;
  final int? ringTimeout;

  TelephonyOutboundConfig({
    required this.connectContactFlowId,
    this.answerMachineDetectionConfig,
    this.connectSourcePhoneNumber,
    this.ringTimeout,
  });

  factory TelephonyOutboundConfig.fromJson(Map<String, dynamic> json) {
    return TelephonyOutboundConfig(
      connectContactFlowId: (json['connectContactFlowId'] as String?) ?? '',
      answerMachineDetectionConfig: json['answerMachineDetectionConfig'] != null
          ? AnswerMachineDetectionConfig.fromJson(
              json['answerMachineDetectionConfig'] as Map<String, dynamic>)
          : null,
      connectSourcePhoneNumber: json['connectSourcePhoneNumber'] as String?,
      ringTimeout: json['ringTimeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectContactFlowId = this.connectContactFlowId;
    final answerMachineDetectionConfig = this.answerMachineDetectionConfig;
    final connectSourcePhoneNumber = this.connectSourcePhoneNumber;
    final ringTimeout = this.ringTimeout;
    return {
      'connectContactFlowId': connectContactFlowId,
      if (answerMachineDetectionConfig != null)
        'answerMachineDetectionConfig': answerMachineDetectionConfig,
      if (connectSourcePhoneNumber != null)
        'connectSourcePhoneNumber': connectSourcePhoneNumber,
      if (ringTimeout != null) 'ringTimeout': ringTimeout,
    };
  }
}

/// Answering Machine Detection config
///
/// @nodoc
class AnswerMachineDetectionConfig {
  /// Enable or disable answering machine detection
  final bool enableAnswerMachineDetection;

  /// Enable or disable await answer machine prompt
  final bool? awaitAnswerMachinePrompt;

  AnswerMachineDetectionConfig({
    required this.enableAnswerMachineDetection,
    this.awaitAnswerMachinePrompt,
  });

  factory AnswerMachineDetectionConfig.fromJson(Map<String, dynamic> json) {
    return AnswerMachineDetectionConfig(
      enableAnswerMachineDetection:
          (json['enableAnswerMachineDetection'] as bool?) ?? false,
      awaitAnswerMachinePrompt: json['awaitAnswerMachinePrompt'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableAnswerMachineDetection = this.enableAnswerMachineDetection;
    final awaitAnswerMachinePrompt = this.awaitAnswerMachinePrompt;
    return {
      'enableAnswerMachineDetection': enableAnswerMachineDetection,
      if (awaitAnswerMachinePrompt != null)
        'awaitAnswerMachinePrompt': awaitAnswerMachinePrompt,
    };
  }
}

/// Progressive config
///
/// @nodoc
class ProgressiveConfig {
  final double bandwidthAllocation;

  ProgressiveConfig({
    required this.bandwidthAllocation,
  });

  factory ProgressiveConfig.fromJson(Map<String, dynamic> json) {
    return ProgressiveConfig(
      bandwidthAllocation: _s.parseJsonDouble(json['bandwidthAllocation']) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidthAllocation = this.bandwidthAllocation;
    return {
      'bandwidthAllocation': _s.encodeJsonDouble(bandwidthAllocation),
    };
  }
}

/// Predictive config
///
/// @nodoc
class PredictiveConfig {
  final double bandwidthAllocation;

  PredictiveConfig({
    required this.bandwidthAllocation,
  });

  factory PredictiveConfig.fromJson(Map<String, dynamic> json) {
    return PredictiveConfig(
      bandwidthAllocation: _s.parseJsonDouble(json['bandwidthAllocation']) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidthAllocation = this.bandwidthAllocation;
    return {
      'bandwidthAllocation': _s.encodeJsonDouble(bandwidthAllocation),
    };
  }
}

/// Preview config
///
/// @nodoc
class PreviewConfig {
  final double bandwidthAllocation;
  final TimeoutConfig timeoutConfig;
  final List<AgentAction>? agentActions;

  PreviewConfig({
    required this.bandwidthAllocation,
    required this.timeoutConfig,
    this.agentActions,
  });

  factory PreviewConfig.fromJson(Map<String, dynamic> json) {
    return PreviewConfig(
      bandwidthAllocation: _s.parseJsonDouble(json['bandwidthAllocation']) ?? 0,
      timeoutConfig: TimeoutConfig.fromJson(
          (json['timeoutConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      agentActions: (json['agentActions'] as List?)
          ?.nonNulls
          .map((e) => AgentAction.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidthAllocation = this.bandwidthAllocation;
    final timeoutConfig = this.timeoutConfig;
    final agentActions = this.agentActions;
    return {
      'bandwidthAllocation': _s.encodeJsonDouble(bandwidthAllocation),
      'timeoutConfig': timeoutConfig,
      if (agentActions != null)
        'agentActions': agentActions.map((e) => e.value).toList(),
    };
  }
}

/// Timeout Config for preview contacts.
///
/// @nodoc
class TimeoutConfig {
  final int durationInSeconds;

  TimeoutConfig({
    required this.durationInSeconds,
  });

  factory TimeoutConfig.fromJson(Map<String, dynamic> json) {
    return TimeoutConfig(
      durationInSeconds: (json['durationInSeconds'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    return {
      'durationInSeconds': durationInSeconds,
    };
  }
}

/// Actions that can performed on a contact by an agent
///
/// @nodoc
class AgentAction {
  static const discard = AgentAction._('DISCARD');

  final String value;

  const AgentAction._(this.value);

  static const values = [discard];

  static AgentAction fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AgentAction._(value));

  @override
  bool operator ==(other) => other is AgentAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Instance onboarding job status object
///
/// @nodoc
class InstanceOnboardingJobStatus {
  final String connectInstanceId;
  final InstanceOnboardingJobStatusCode status;
  final InstanceOnboardingJobFailureCode? failureCode;

  InstanceOnboardingJobStatus({
    required this.connectInstanceId,
    required this.status,
    this.failureCode,
  });

  factory InstanceOnboardingJobStatus.fromJson(Map<String, dynamic> json) {
    return InstanceOnboardingJobStatus(
      connectInstanceId: (json['connectInstanceId'] as String?) ?? '',
      status: InstanceOnboardingJobStatusCode.fromString(
          (json['status'] as String?) ?? ''),
      failureCode: (json['failureCode'] as String?)
          ?.let(InstanceOnboardingJobFailureCode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final connectInstanceId = this.connectInstanceId;
    final status = this.status;
    final failureCode = this.failureCode;
    return {
      'connectInstanceId': connectInstanceId,
      'status': status.value,
      if (failureCode != null) 'failureCode': failureCode.value,
    };
  }
}

/// Enumeration of the possible states for instance onboarding job
///
/// @nodoc
class InstanceOnboardingJobStatusCode {
  static const inProgress = InstanceOnboardingJobStatusCode._('IN_PROGRESS');
  static const succeeded = InstanceOnboardingJobStatusCode._('SUCCEEDED');
  static const failed = InstanceOnboardingJobStatusCode._('FAILED');

  final String value;

  const InstanceOnboardingJobStatusCode._(this.value);

  static const values = [inProgress, succeeded, failed];

  static InstanceOnboardingJobStatusCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceOnboardingJobStatusCode._(value));

  @override
  bool operator ==(other) =>
      other is InstanceOnboardingJobStatusCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Enumeration of the possible failure codes for instance onboarding job
///
/// @nodoc
class InstanceOnboardingJobFailureCode {
  static const eventBridgeAccessDenied =
      InstanceOnboardingJobFailureCode._('EVENT_BRIDGE_ACCESS_DENIED');
  static const eventBridgeManagedRuleLimitExceeded =
      InstanceOnboardingJobFailureCode._(
          'EVENT_BRIDGE_MANAGED_RULE_LIMIT_EXCEEDED');
  static const iamAccessDenied =
      InstanceOnboardingJobFailureCode._('IAM_ACCESS_DENIED');
  static const kmsAccessDenied =
      InstanceOnboardingJobFailureCode._('KMS_ACCESS_DENIED');
  static const kmsKeyNotFound =
      InstanceOnboardingJobFailureCode._('KMS_KEY_NOT_FOUND');
  static const internalFailure =
      InstanceOnboardingJobFailureCode._('INTERNAL_FAILURE');

  final String value;

  const InstanceOnboardingJobFailureCode._(this.value);

  static const values = [
    eventBridgeAccessDenied,
    eventBridgeManagedRuleLimitExceeded,
    iamAccessDenied,
    kmsAccessDenied,
    kmsKeyNotFound,
    internalFailure
  ];

  static InstanceOnboardingJobFailureCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceOnboardingJobFailureCode._(value));

  @override
  bool operator ==(other) =>
      other is InstanceOnboardingJobFailureCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Encryption config for Connect Instance. Note that sensitive data will always
/// be encrypted. If disabled, service will perform encryption with its own key.
/// If enabled, a KMS key id needs to be provided and KMS charges will apply.
/// KMS is only type supported
///
/// @nodoc
class EncryptionConfig {
  final bool enabled;
  final EncryptionType? encryptionType;
  final String? keyArn;

  EncryptionConfig({
    required this.enabled,
    this.encryptionType,
    this.keyArn,
  });

  factory EncryptionConfig.fromJson(Map<String, dynamic> json) {
    return EncryptionConfig(
      enabled: (json['enabled'] as bool?) ?? false,
      encryptionType:
          (json['encryptionType'] as String?)?.let(EncryptionType.fromString),
      keyArn: json['keyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final encryptionType = this.encryptionType;
    final keyArn = this.keyArn;
    return {
      'enabled': enabled,
      if (encryptionType != null) 'encryptionType': encryptionType.value,
      if (keyArn != null) 'keyArn': keyArn,
    };
  }
}

/// Server-side encryption type.
///
/// @nodoc
class EncryptionType {
  static const kms = EncryptionType._('KMS');

  final String value;

  const EncryptionType._(this.value);

  static const values = [kms];

  static EncryptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionType._(value));

  @override
  bool operator ==(other) => other is EncryptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Failure details for a profile outbound request
///
/// @nodoc
class FailedProfileOutboundRequest {
  final String? clientToken;
  final ProfileOutboundRequestFailureCode? failureCode;
  final String? id;

  FailedProfileOutboundRequest({
    this.clientToken,
    this.failureCode,
    this.id,
  });

  factory FailedProfileOutboundRequest.fromJson(Map<String, dynamic> json) {
    return FailedProfileOutboundRequest(
      clientToken: json['clientToken'] as String?,
      failureCode: (json['failureCode'] as String?)
          ?.let(ProfileOutboundRequestFailureCode.fromString),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final failureCode = this.failureCode;
    final id = this.id;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (failureCode != null) 'failureCode': failureCode.value,
      if (id != null) 'id': id,
    };
  }
}

/// Predefined code indicating the error that caused the failure
///
/// @nodoc
class ProfileOutboundRequestFailureCode {
  static const unknownError =
      ProfileOutboundRequestFailureCode._('UnknownError');
  static const resourceNotFound =
      ProfileOutboundRequestFailureCode._('ResourceNotFound');
  static const conflict = ProfileOutboundRequestFailureCode._('Conflict');
  static const requestThrottled =
      ProfileOutboundRequestFailureCode._('RequestThrottled');
  static const invalidInput =
      ProfileOutboundRequestFailureCode._('InvalidInput');

  final String value;

  const ProfileOutboundRequestFailureCode._(this.value);

  static const values = [
    unknownError,
    resourceNotFound,
    conflict,
    requestThrottled,
    invalidInput
  ];

  static ProfileOutboundRequestFailureCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProfileOutboundRequestFailureCode._(value));

  @override
  bool operator ==(other) =>
      other is ProfileOutboundRequestFailureCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Success details for a profile outbound request
///
/// @nodoc
class SuccessfulProfileOutboundRequest {
  final String? clientToken;
  final String? id;

  SuccessfulProfileOutboundRequest({
    this.clientToken,
    this.id,
  });

  factory SuccessfulProfileOutboundRequest.fromJson(Map<String, dynamic> json) {
    return SuccessfulProfileOutboundRequest(
      clientToken: json['clientToken'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final id = this.id;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (id != null) 'id': id,
    };
  }
}

/// Information about a profile outbound request
///
/// @nodoc
class ProfileOutboundRequest {
  final String clientToken;
  final String profileId;
  final DateTime? expirationTime;

  ProfileOutboundRequest({
    required this.clientToken,
    required this.profileId,
    this.expirationTime,
  });

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final profileId = this.profileId;
    final expirationTime = this.expirationTime;
    return {
      'clientToken': clientToken,
      'profileId': profileId,
      if (expirationTime != null)
        'expirationTime': iso8601ToJson(expirationTime),
    };
  }
}

/// A failed request identified by the unique client token.
///
/// @nodoc
class FailedRequest {
  final String? clientToken;
  final FailureCode? failureCode;
  final String? id;

  FailedRequest({
    this.clientToken,
    this.failureCode,
    this.id,
  });

  factory FailedRequest.fromJson(Map<String, dynamic> json) {
    return FailedRequest(
      clientToken: json['clientToken'] as String?,
      failureCode:
          (json['failureCode'] as String?)?.let(FailureCode.fromString),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final failureCode = this.failureCode;
    final id = this.id;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (failureCode != null) 'failureCode': failureCode.value,
      if (id != null) 'id': id,
    };
  }
}

/// A predefined code indicating the error that caused the failure.
///
/// @nodoc
class FailureCode {
  static const invalidInput = FailureCode._('InvalidInput');
  static const requestThrottled = FailureCode._('RequestThrottled');
  static const unknownError = FailureCode._('UnknownError');
  static const bufferLimitExceeded = FailureCode._('BufferLimitExceeded');

  final String value;

  const FailureCode._(this.value);

  static const values = [
    invalidInput,
    requestThrottled,
    unknownError,
    bufferLimitExceeded
  ];

  static FailureCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FailureCode._(value));

  @override
  bool operator ==(other) => other is FailureCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A successful request identified by the unique client token.
///
/// @nodoc
class SuccessfulRequest {
  final String? clientToken;
  final String? id;

  SuccessfulRequest({
    this.clientToken,
    this.id,
  });

  factory SuccessfulRequest.fromJson(Map<String, dynamic> json) {
    return SuccessfulRequest(
      clientToken: json['clientToken'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final id = this.id;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (id != null) 'id': id,
    };
  }
}

/// An outbound request for a campaign.
///
/// @nodoc
class OutboundRequest {
  final ChannelSubtypeParameters channelSubtypeParameters;
  final String clientToken;
  final DateTime expirationTime;

  OutboundRequest({
    required this.channelSubtypeParameters,
    required this.clientToken,
    required this.expirationTime,
  });

  Map<String, dynamic> toJson() {
    final channelSubtypeParameters = this.channelSubtypeParameters;
    final clientToken = this.clientToken;
    final expirationTime = this.expirationTime;
    return {
      'channelSubtypeParameters': channelSubtypeParameters,
      'clientToken': clientToken,
      'expirationTime': iso8601ToJson(expirationTime),
    };
  }
}

/// ChannelSubtypeParameters for an outbound request
///
/// @nodoc
class ChannelSubtypeParameters {
  final EmailChannelSubtypeParameters? email;
  final SmsChannelSubtypeParameters? sms;
  final TelephonyChannelSubtypeParameters? telephony;
  final WhatsAppChannelSubtypeParameters? whatsApp;

  ChannelSubtypeParameters({
    this.email,
    this.sms,
    this.telephony,
    this.whatsApp,
  });

  Map<String, dynamic> toJson() {
    final email = this.email;
    final sms = this.sms;
    final telephony = this.telephony;
    final whatsApp = this.whatsApp;
    return {
      if (email != null) 'email': email,
      if (sms != null) 'sms': sms,
      if (telephony != null) 'telephony': telephony,
      if (whatsApp != null) 'whatsApp': whatsApp,
    };
  }
}

/// Parameters for the Telephony Channel Subtype
///
/// @nodoc
class TelephonyChannelSubtypeParameters {
  final Map<String, String> attributes;
  final String destinationPhoneNumber;
  final AnswerMachineDetectionConfig? answerMachineDetectionConfig;
  final String? connectSourcePhoneNumber;
  final int? ringTimeout;

  TelephonyChannelSubtypeParameters({
    required this.attributes,
    required this.destinationPhoneNumber,
    this.answerMachineDetectionConfig,
    this.connectSourcePhoneNumber,
    this.ringTimeout,
  });

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final destinationPhoneNumber = this.destinationPhoneNumber;
    final answerMachineDetectionConfig = this.answerMachineDetectionConfig;
    final connectSourcePhoneNumber = this.connectSourcePhoneNumber;
    final ringTimeout = this.ringTimeout;
    return {
      'attributes': attributes,
      'destinationPhoneNumber': destinationPhoneNumber,
      if (answerMachineDetectionConfig != null)
        'answerMachineDetectionConfig': answerMachineDetectionConfig,
      if (connectSourcePhoneNumber != null)
        'connectSourcePhoneNumber': connectSourcePhoneNumber,
      if (ringTimeout != null) 'ringTimeout': ringTimeout,
    };
  }
}

/// Parameters for the SMS Channel Subtype
///
/// @nodoc
class SmsChannelSubtypeParameters {
  final String destinationPhoneNumber;
  final Map<String, String> templateParameters;
  final String? connectSourcePhoneNumberArn;
  final String? templateArn;

  SmsChannelSubtypeParameters({
    required this.destinationPhoneNumber,
    required this.templateParameters,
    this.connectSourcePhoneNumberArn,
    this.templateArn,
  });

  Map<String, dynamic> toJson() {
    final destinationPhoneNumber = this.destinationPhoneNumber;
    final templateParameters = this.templateParameters;
    final connectSourcePhoneNumberArn = this.connectSourcePhoneNumberArn;
    final templateArn = this.templateArn;
    return {
      'destinationPhoneNumber': destinationPhoneNumber,
      'templateParameters': templateParameters,
      if (connectSourcePhoneNumberArn != null)
        'connectSourcePhoneNumberArn': connectSourcePhoneNumberArn,
      if (templateArn != null) 'templateArn': templateArn,
    };
  }
}

/// Parameters for the Email Channel Subtype
///
/// @nodoc
class EmailChannelSubtypeParameters {
  final String destinationEmailAddress;
  final Map<String, String> templateParameters;
  final String? connectSourceEmailAddress;
  final String? templateArn;

  EmailChannelSubtypeParameters({
    required this.destinationEmailAddress,
    required this.templateParameters,
    this.connectSourceEmailAddress,
    this.templateArn,
  });

  Map<String, dynamic> toJson() {
    final destinationEmailAddress = this.destinationEmailAddress;
    final templateParameters = this.templateParameters;
    final connectSourceEmailAddress = this.connectSourceEmailAddress;
    final templateArn = this.templateArn;
    return {
      'destinationEmailAddress': destinationEmailAddress,
      'templateParameters': templateParameters,
      if (connectSourceEmailAddress != null)
        'connectSourceEmailAddress': connectSourceEmailAddress,
      if (templateArn != null) 'templateArn': templateArn,
    };
  }
}

/// Parameters for the WhatsApp Channel Subtype
///
/// @nodoc
class WhatsAppChannelSubtypeParameters {
  final String destinationPhoneNumber;
  final Map<String, String> templateParameters;
  final String? connectSourcePhoneNumberArn;
  final String? templateArn;

  WhatsAppChannelSubtypeParameters({
    required this.destinationPhoneNumber,
    required this.templateParameters,
    this.connectSourcePhoneNumberArn,
    this.templateArn,
  });

  Map<String, dynamic> toJson() {
    final destinationPhoneNumber = this.destinationPhoneNumber;
    final templateParameters = this.templateParameters;
    final connectSourcePhoneNumberArn = this.connectSourcePhoneNumberArn;
    final templateArn = this.templateArn;
    return {
      'destinationPhoneNumber': destinationPhoneNumber,
      'templateParameters': templateParameters,
      if (connectSourcePhoneNumberArn != null)
        'connectSourcePhoneNumberArn': connectSourcePhoneNumberArn,
      if (templateArn != null) 'templateArn': templateArn,
    };
  }
}

/// Instance Communication limits config
///
/// @nodoc
class InstanceCommunicationLimitsConfig {
  final CommunicationLimits? allChannelSubtypes;

  InstanceCommunicationLimitsConfig({
    this.allChannelSubtypes,
  });

  factory InstanceCommunicationLimitsConfig.fromJson(
      Map<String, dynamic> json) {
    return InstanceCommunicationLimitsConfig(
      allChannelSubtypes: json['allChannelSubtypes'] != null
          ? CommunicationLimits.fromJson(
              json['allChannelSubtypes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final allChannelSubtypes = this.allChannelSubtypes;
    return {
      if (allChannelSubtypes != null) 'allChannelSubtypes': allChannelSubtypes,
    };
  }
}

/// Integration config for Connect Instance
///
/// @nodoc
class IntegrationConfig {
  final CustomerProfilesIntegrationConfig? customerProfiles;
  final LambdaIntegrationConfig? lambda;
  final QConnectIntegrationConfig? qConnect;

  IntegrationConfig({
    this.customerProfiles,
    this.lambda,
    this.qConnect,
  });

  Map<String, dynamic> toJson() {
    final customerProfiles = this.customerProfiles;
    final lambda = this.lambda;
    final qConnect = this.qConnect;
    return {
      if (customerProfiles != null) 'customerProfiles': customerProfiles,
      if (lambda != null) 'lambda': lambda,
      if (qConnect != null) 'qConnect': qConnect,
    };
  }
}

/// Customer Profiles integration config
///
/// @nodoc
class CustomerProfilesIntegrationConfig {
  final String domainArn;
  final Map<EventType, String> objectTypeNames;

  CustomerProfilesIntegrationConfig({
    required this.domainArn,
    required this.objectTypeNames,
  });

  Map<String, dynamic> toJson() {
    final domainArn = this.domainArn;
    final objectTypeNames = this.objectTypeNames;
    return {
      'domainArn': domainArn,
      'objectTypeNames': objectTypeNames.map((k, e) => MapEntry(k.value, e)),
    };
  }
}

/// Q Connect integration config
///
/// @nodoc
class QConnectIntegrationConfig {
  final String knowledgeBaseArn;

  QConnectIntegrationConfig({
    required this.knowledgeBaseArn,
  });

  Map<String, dynamic> toJson() {
    final knowledgeBaseArn = this.knowledgeBaseArn;
    return {
      'knowledgeBaseArn': knowledgeBaseArn,
    };
  }
}

/// Lambda integration config
///
/// @nodoc
class LambdaIntegrationConfig {
  final String functionArn;

  LambdaIntegrationConfig({
    required this.functionArn,
  });

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    return {
      'functionArn': functionArn,
    };
  }
}

/// Enumeration of Customer Profiles event type
///
/// @nodoc
class EventType {
  static const campaignEmail = EventType._('Campaign-Email');
  static const campaignSms = EventType._('Campaign-SMS');
  static const campaignTelephony = EventType._('Campaign-Telephony');
  static const campaignOrchestration = EventType._('Campaign-Orchestration');
  static const campaignWhatsApp = EventType._('Campaign-WhatsApp');

  final String value;

  const EventType._(this.value);

  static const values = [
    campaignEmail,
    campaignSms,
    campaignTelephony,
    campaignOrchestration,
    campaignWhatsApp
  ];

  static EventType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventType._(value));

  @override
  bool operator ==(other) => other is EventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Integration summary for Connect instance.
///
/// @nodoc
class IntegrationSummary {
  final CustomerProfilesIntegrationSummary? customerProfiles;
  final LambdaIntegrationSummary? lambda;
  final QConnectIntegrationSummary? qConnect;

  IntegrationSummary({
    this.customerProfiles,
    this.lambda,
    this.qConnect,
  });

  factory IntegrationSummary.fromJson(Map<String, dynamic> json) {
    return IntegrationSummary(
      customerProfiles: json['customerProfiles'] != null
          ? CustomerProfilesIntegrationSummary.fromJson(
              json['customerProfiles'] as Map<String, dynamic>)
          : null,
      lambda: json['lambda'] != null
          ? LambdaIntegrationSummary.fromJson(
              json['lambda'] as Map<String, dynamic>)
          : null,
      qConnect: json['qConnect'] != null
          ? QConnectIntegrationSummary.fromJson(
              json['qConnect'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerProfiles = this.customerProfiles;
    final lambda = this.lambda;
    final qConnect = this.qConnect;
    return {
      if (customerProfiles != null) 'customerProfiles': customerProfiles,
      if (lambda != null) 'lambda': lambda,
      if (qConnect != null) 'qConnect': qConnect,
    };
  }
}

/// Customer Profiles integration summary
///
/// @nodoc
class CustomerProfilesIntegrationSummary {
  final String domainArn;
  final Map<EventType, String> objectTypeNames;

  CustomerProfilesIntegrationSummary({
    required this.domainArn,
    required this.objectTypeNames,
  });

  factory CustomerProfilesIntegrationSummary.fromJson(
      Map<String, dynamic> json) {
    return CustomerProfilesIntegrationSummary(
      domainArn: (json['domainArn'] as String?) ?? '',
      objectTypeNames: ((json['objectTypeNames'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(EventType.fromString(k), e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final domainArn = this.domainArn;
    final objectTypeNames = this.objectTypeNames;
    return {
      'domainArn': domainArn,
      'objectTypeNames': objectTypeNames.map((k, e) => MapEntry(k.value, e)),
    };
  }
}

/// Q Connect integration summary
///
/// @nodoc
class QConnectIntegrationSummary {
  final String knowledgeBaseArn;

  QConnectIntegrationSummary({
    required this.knowledgeBaseArn,
  });

  factory QConnectIntegrationSummary.fromJson(Map<String, dynamic> json) {
    return QConnectIntegrationSummary(
      knowledgeBaseArn: (json['knowledgeBaseArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseArn = this.knowledgeBaseArn;
    return {
      'knowledgeBaseArn': knowledgeBaseArn,
    };
  }
}

/// Lambda integration summary
///
/// @nodoc
class LambdaIntegrationSummary {
  final String functionArn;

  LambdaIntegrationSummary({
    required this.functionArn,
  });

  factory LambdaIntegrationSummary.fromJson(Map<String, dynamic> json) {
    return LambdaIntegrationSummary(
      functionArn: (json['functionArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    return {
      'functionArn': functionArn,
    };
  }
}

/// An Amazon Connect campaign summary.
///
/// @nodoc
class CampaignSummary {
  final String arn;
  final List<ChannelSubtype> channelSubtypes;
  final String connectInstanceId;
  final String id;
  final String name;
  final String? connectCampaignFlowArn;
  final EntryLimitsConfig? entryLimitsConfig;
  final Schedule? schedule;
  final ExternalCampaignType? type;

  CampaignSummary({
    required this.arn,
    required this.channelSubtypes,
    required this.connectInstanceId,
    required this.id,
    required this.name,
    this.connectCampaignFlowArn,
    this.entryLimitsConfig,
    this.schedule,
    this.type,
  });

  factory CampaignSummary.fromJson(Map<String, dynamic> json) {
    return CampaignSummary(
      arn: (json['arn'] as String?) ?? '',
      channelSubtypes: ((json['channelSubtypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => ChannelSubtype.fromString((e as String)))
          .toList(),
      connectInstanceId: (json['connectInstanceId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      connectCampaignFlowArn: json['connectCampaignFlowArn'] as String?,
      entryLimitsConfig: json['entryLimitsConfig'] != null
          ? EntryLimitsConfig.fromJson(
              json['entryLimitsConfig'] as Map<String, dynamic>)
          : null,
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.let(ExternalCampaignType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelSubtypes = this.channelSubtypes;
    final connectInstanceId = this.connectInstanceId;
    final id = this.id;
    final name = this.name;
    final connectCampaignFlowArn = this.connectCampaignFlowArn;
    final entryLimitsConfig = this.entryLimitsConfig;
    final schedule = this.schedule;
    final type = this.type;
    return {
      'arn': arn,
      'channelSubtypes': channelSubtypes.map((e) => e.value).toList(),
      'connectInstanceId': connectInstanceId,
      'id': id,
      'name': name,
      if (connectCampaignFlowArn != null)
        'connectCampaignFlowArn': connectCampaignFlowArn,
      if (entryLimitsConfig != null) 'entryLimitsConfig': entryLimitsConfig,
      if (schedule != null) 'schedule': schedule,
      if (type != null) 'type': type.value,
    };
  }
}

/// The type of campaign externally exposed in APIs.
///
/// @nodoc
class ExternalCampaignType {
  static const managed = ExternalCampaignType._('MANAGED');
  static const journey = ExternalCampaignType._('JOURNEY');

  final String value;

  const ExternalCampaignType._(this.value);

  static const values = [managed, journey];

  static ExternalCampaignType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExternalCampaignType._(value));

  @override
  bool operator ==(other) =>
      other is ExternalCampaignType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The type of campaign channel subtype.
///
/// @nodoc
class ChannelSubtype {
  static const telephony = ChannelSubtype._('TELEPHONY');
  static const sms = ChannelSubtype._('SMS');
  static const email = ChannelSubtype._('EMAIL');
  static const whatsapp = ChannelSubtype._('WHATSAPP');

  final String value;

  const ChannelSubtype._(this.value);

  static const values = [telephony, sms, email, whatsapp];

  static ChannelSubtype fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChannelSubtype._(value));

  @override
  bool operator ==(other) => other is ChannelSubtype && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filter model by type
///
/// @nodoc
class CampaignFilters {
  final InstanceIdFilter? instanceIdFilter;

  CampaignFilters({
    this.instanceIdFilter,
  });

  Map<String, dynamic> toJson() {
    final instanceIdFilter = this.instanceIdFilter;
    return {
      if (instanceIdFilter != null) 'instanceIdFilter': instanceIdFilter,
    };
  }
}

/// Connect instance identifier filter
///
/// @nodoc
class InstanceIdFilter {
  final InstanceIdFilterOperator operator;
  final String value;

  InstanceIdFilter({
    required this.operator,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final operator = this.operator;
    final value = this.value;
    return {
      'operator': operator.value,
      'value': value,
    };
  }
}

/// Operators for Connect instance identifier filter
///
/// @nodoc
class InstanceIdFilterOperator {
  static const eq = InstanceIdFilterOperator._('Eq');

  final String value;

  const InstanceIdFilterOperator._(this.value);

  static const values = [eq];

  static InstanceIdFilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceIdFilterOperator._(value));

  @override
  bool operator ==(other) =>
      other is InstanceIdFilterOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Instance config object
///
/// @nodoc
class InstanceConfig {
  final String connectInstanceId;
  final EncryptionConfig encryptionConfig;
  final String serviceLinkedRoleArn;

  InstanceConfig({
    required this.connectInstanceId,
    required this.encryptionConfig,
    required this.serviceLinkedRoleArn,
  });

  factory InstanceConfig.fromJson(Map<String, dynamic> json) {
    return InstanceConfig(
      connectInstanceId: (json['connectInstanceId'] as String?) ?? '',
      encryptionConfig: EncryptionConfig.fromJson(
          (json['encryptionConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      serviceLinkedRoleArn: (json['serviceLinkedRoleArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final connectInstanceId = this.connectInstanceId;
    final encryptionConfig = this.encryptionConfig;
    final serviceLinkedRoleArn = this.serviceLinkedRoleArn;
    return {
      'connectInstanceId': connectInstanceId,
      'encryptionConfig': encryptionConfig,
      'serviceLinkedRoleArn': serviceLinkedRoleArn,
    };
  }
}

/// Failed response of campaign state
///
/// @nodoc
class FailedCampaignStateResponse {
  final String? campaignId;
  final GetCampaignStateBatchFailureCode? failureCode;

  FailedCampaignStateResponse({
    this.campaignId,
    this.failureCode,
  });

  factory FailedCampaignStateResponse.fromJson(Map<String, dynamic> json) {
    return FailedCampaignStateResponse(
      campaignId: json['campaignId'] as String?,
      failureCode: (json['failureCode'] as String?)
          ?.let(GetCampaignStateBatchFailureCode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final campaignId = this.campaignId;
    final failureCode = this.failureCode;
    return {
      if (campaignId != null) 'campaignId': campaignId,
      if (failureCode != null) 'failureCode': failureCode.value,
    };
  }
}

/// A predefined code indicating the error that caused the failure in getting
/// state of campaigns
///
/// @nodoc
class GetCampaignStateBatchFailureCode {
  static const resourceNotFound =
      GetCampaignStateBatchFailureCode._('ResourceNotFound');
  static const unknownError =
      GetCampaignStateBatchFailureCode._('UnknownError');

  final String value;

  const GetCampaignStateBatchFailureCode._(this.value);

  static const values = [resourceNotFound, unknownError];

  static GetCampaignStateBatchFailureCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GetCampaignStateBatchFailureCode._(value));

  @override
  bool operator ==(other) =>
      other is GetCampaignStateBatchFailureCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Successful response of campaign state
///
/// @nodoc
class SuccessfulCampaignStateResponse {
  final String? campaignId;
  final CampaignState? state;

  SuccessfulCampaignStateResponse({
    this.campaignId,
    this.state,
  });

  factory SuccessfulCampaignStateResponse.fromJson(Map<String, dynamic> json) {
    return SuccessfulCampaignStateResponse(
      campaignId: json['campaignId'] as String?,
      state: (json['state'] as String?)?.let(CampaignState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final campaignId = this.campaignId;
    final state = this.state;
    return {
      if (campaignId != null) 'campaignId': campaignId,
      if (state != null) 'state': state.value,
    };
  }
}

/// State of a campaign
///
/// @nodoc
class CampaignState {
  static const initialized = CampaignState._('Initialized');
  static const running = CampaignState._('Running');
  static const paused = CampaignState._('Paused');
  static const stopped = CampaignState._('Stopped');
  static const failed = CampaignState._('Failed');
  static const completed = CampaignState._('Completed');

  final String value;

  const CampaignState._(this.value);

  static const values = [
    initialized,
    running,
    paused,
    stopped,
    failed,
    completed
  ];

  static CampaignState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CampaignState._(value));

  @override
  bool operator ==(other) => other is CampaignState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An Amazon Connect campaign.
///
/// @nodoc
class Campaign {
  final String arn;
  final String connectInstanceId;
  final String id;
  final String name;
  final ChannelSubtypeConfig? channelSubtypeConfig;
  final CommunicationLimitsConfig? communicationLimitsOverride;
  final CommunicationTimeConfig? communicationTimeConfig;
  final String? connectCampaignFlowArn;
  final EntryLimitsConfig? entryLimitsConfig;
  final Schedule? schedule;
  final Source? source;
  final Map<String, String>? tags;
  final ExternalCampaignType? type;

  Campaign({
    required this.arn,
    required this.connectInstanceId,
    required this.id,
    required this.name,
    this.channelSubtypeConfig,
    this.communicationLimitsOverride,
    this.communicationTimeConfig,
    this.connectCampaignFlowArn,
    this.entryLimitsConfig,
    this.schedule,
    this.source,
    this.tags,
    this.type,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      arn: (json['arn'] as String?) ?? '',
      connectInstanceId: (json['connectInstanceId'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      channelSubtypeConfig: json['channelSubtypeConfig'] != null
          ? ChannelSubtypeConfig.fromJson(
              json['channelSubtypeConfig'] as Map<String, dynamic>)
          : null,
      communicationLimitsOverride: json['communicationLimitsOverride'] != null
          ? CommunicationLimitsConfig.fromJson(
              json['communicationLimitsOverride'] as Map<String, dynamic>)
          : null,
      communicationTimeConfig: json['communicationTimeConfig'] != null
          ? CommunicationTimeConfig.fromJson(
              json['communicationTimeConfig'] as Map<String, dynamic>)
          : null,
      connectCampaignFlowArn: json['connectCampaignFlowArn'] as String?,
      entryLimitsConfig: json['entryLimitsConfig'] != null
          ? EntryLimitsConfig.fromJson(
              json['entryLimitsConfig'] as Map<String, dynamic>)
          : null,
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
      source: json['source'] != null
          ? Source.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.let(ExternalCampaignType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectInstanceId = this.connectInstanceId;
    final id = this.id;
    final name = this.name;
    final channelSubtypeConfig = this.channelSubtypeConfig;
    final communicationLimitsOverride = this.communicationLimitsOverride;
    final communicationTimeConfig = this.communicationTimeConfig;
    final connectCampaignFlowArn = this.connectCampaignFlowArn;
    final entryLimitsConfig = this.entryLimitsConfig;
    final schedule = this.schedule;
    final source = this.source;
    final tags = this.tags;
    final type = this.type;
    return {
      'arn': arn,
      'connectInstanceId': connectInstanceId,
      'id': id,
      'name': name,
      if (channelSubtypeConfig != null)
        'channelSubtypeConfig': channelSubtypeConfig,
      if (communicationLimitsOverride != null)
        'communicationLimitsOverride': communicationLimitsOverride,
      if (communicationTimeConfig != null)
        'communicationTimeConfig': communicationTimeConfig,
      if (connectCampaignFlowArn != null)
        'connectCampaignFlowArn': connectCampaignFlowArn,
      if (entryLimitsConfig != null) 'entryLimitsConfig': entryLimitsConfig,
      if (schedule != null) 'schedule': schedule,
      if (source != null) 'source': source,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
    };
  }
}

/// Integration identifier for Connect instance
///
/// @nodoc
class IntegrationIdentifier {
  final CustomerProfilesIntegrationIdentifier? customerProfiles;
  final LambdaIntegrationIdentifier? lambda;
  final QConnectIntegrationIdentifier? qConnect;

  IntegrationIdentifier({
    this.customerProfiles,
    this.lambda,
    this.qConnect,
  });

  Map<String, dynamic> toJson() {
    final customerProfiles = this.customerProfiles;
    final lambda = this.lambda;
    final qConnect = this.qConnect;
    return {
      if (customerProfiles != null) 'customerProfiles': customerProfiles,
      if (lambda != null) 'lambda': lambda,
      if (qConnect != null) 'qConnect': qConnect,
    };
  }
}

/// Customer Profiles integration identifier
///
/// @nodoc
class CustomerProfilesIntegrationIdentifier {
  final String domainArn;

  CustomerProfilesIntegrationIdentifier({
    required this.domainArn,
  });

  Map<String, dynamic> toJson() {
    final domainArn = this.domainArn;
    return {
      'domainArn': domainArn,
    };
  }
}

/// Q Connect integration identifier
///
/// @nodoc
class QConnectIntegrationIdentifier {
  final String knowledgeBaseArn;

  QConnectIntegrationIdentifier({
    required this.knowledgeBaseArn,
  });

  Map<String, dynamic> toJson() {
    final knowledgeBaseArn = this.knowledgeBaseArn;
    return {
      'knowledgeBaseArn': knowledgeBaseArn,
    };
  }
}

/// Lambda integration identifier
///
/// @nodoc
class LambdaIntegrationIdentifier {
  final String functionArn;

  LambdaIntegrationIdentifier({
    required this.functionArn,
  });

  Map<String, dynamic> toJson() {
    final functionArn = this.functionArn;
    return {
      'functionArn': functionArn,
    };
  }
}

/// Enumeration of the policies to enact on existing campaigns during instance
/// config deletion
///
/// @nodoc
class CampaignDeletionPolicy {
  static const retainAll = CampaignDeletionPolicy._('RETAIN_ALL');
  static const deleteAll = CampaignDeletionPolicy._('DELETE_ALL');

  final String value;

  const CampaignDeletionPolicy._(this.value);

  static const values = [retainAll, deleteAll];

  static CampaignDeletionPolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CampaignDeletionPolicy._(value));

  @override
  bool operator ==(other) =>
      other is CampaignDeletionPolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The type of campaign communication time config
///
/// @nodoc
class CommunicationTimeConfigType {
  static const telephony = CommunicationTimeConfigType._('TELEPHONY');
  static const sms = CommunicationTimeConfigType._('SMS');
  static const email = CommunicationTimeConfigType._('EMAIL');
  static const whatsapp = CommunicationTimeConfigType._('WHATSAPP');

  final String value;

  const CommunicationTimeConfigType._(this.value);

  static const values = [telephony, sms, email, whatsapp];

  static CommunicationTimeConfigType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CommunicationTimeConfigType._(value));

  @override
  bool operator ==(other) =>
      other is CommunicationTimeConfigType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The type of campaign communication limits config.
///
/// @nodoc
class CommunicationLimitsConfigType {
  static const allChannelSubtypes =
      CommunicationLimitsConfigType._('ALL_CHANNEL_SUBTYPES');

  final String value;

  const CommunicationLimitsConfigType._(this.value);

  static const values = [allChannelSubtypes];

  static CommunicationLimitsConfigType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CommunicationLimitsConfigType._(value));

  @override
  bool operator ==(other) =>
      other is CommunicationLimitsConfigType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
class InvalidCampaignStateException extends _s.GenericAwsException {
  InvalidCampaignStateException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCampaignStateException',
            message: message);
}

/// @nodoc
class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidCampaignStateException': (type, message) =>
      InvalidCampaignStateException(type: type, message: message),
  'InvalidStateException': (type, message) =>
      InvalidStateException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
