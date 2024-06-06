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

/// Provide APIs to create and manage Amazon Connect Campaigns.
class ConnectCampaign {
  final _s.RestJsonProtocol _protocol;
  ConnectCampaign({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'connect-campaigns',
            signingName: 'connect-campaigns',
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

  /// Creates a campaign for the specified Amazon Connect account. This API is
  /// idempotent.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  Future<CreateCampaignResponse> createCampaign({
    required String connectInstanceId,
    required DialerConfig dialerConfig,
    required String name,
    required OutboundCallConfig outboundCallConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'connectInstanceId': connectInstanceId,
      'dialerConfig': dialerConfig,
      'name': name,
      'outboundCallConfig': outboundCallConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/campaigns',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCampaignResponse.fromJson(response);
  }

  /// Deletes a campaign from the specified Amazon Connect account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  Future<void> deleteCampaign({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/campaigns/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a connect instance config from the specified AWS account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidStateException].
  /// May throw [ThrottlingException].
  Future<void> deleteConnectInstanceConfig({
    required String connectInstanceId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/connect-instance/${Uri.encodeComponent(connectInstanceId)}/config',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete the Connect Campaigns onboarding job for the specified Amazon
  /// Connect instance.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidStateException].
  Future<void> deleteInstanceOnboardingJob({
    required String connectInstanceId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/connect-instance/${Uri.encodeComponent(connectInstanceId)}/onboarding',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes the specific campaign.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  Future<DescribeCampaignResponse> describeCampaign({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/campaigns/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCampaignResponse.fromJson(response);
  }

  /// Get state of a campaign for the specified Amazon Connect account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetCampaignStateResponse> getCampaignState({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/campaigns/${Uri.encodeComponent(id)}/state',
      exceptionFnMap: _exceptionFns,
    );
    return GetCampaignStateResponse.fromJson(response);
  }

  /// Get state of campaigns for the specified Amazon Connect account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<GetCampaignStateBatchResponse> getCampaignStateBatch({
    required List<String> campaignIds,
  }) async {
    final $payload = <String, dynamic>{
      'campaignIds': campaignIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/campaigns-state',
      exceptionFnMap: _exceptionFns,
    );
    return GetCampaignStateBatchResponse.fromJson(response);
  }

  /// Get the specific Connect instance config.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  Future<GetConnectInstanceConfigResponse> getConnectInstanceConfig({
    required String connectInstanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/connect-instance/${Uri.encodeComponent(connectInstanceId)}/config',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectInstanceConfigResponse.fromJson(response);
  }

  /// Get the specific instance onboarding job status.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  Future<GetInstanceOnboardingJobStatusResponse>
      getInstanceOnboardingJobStatus({
    required String connectInstanceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/connect-instance/${Uri.encodeComponent(connectInstanceId)}/onboarding',
      exceptionFnMap: _exceptionFns,
    );
    return GetInstanceOnboardingJobStatusResponse.fromJson(response);
  }

  /// Provides summary information about the campaigns under the specified
  /// Amazon Connect account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
      requestUri: '/campaigns-summary',
      exceptionFnMap: _exceptionFns,
    );
    return ListCampaignsResponse.fromJson(response);
  }

  /// List tags for a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Pauses a campaign for the specified Amazon Connect account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> pauseCampaign({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/campaigns/${Uri.encodeComponent(id)}/pause',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates dials requests for the specified campaign Amazon Connect account.
  /// This API is idempotent.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<PutDialRequestBatchResponse> putDialRequestBatch({
    required List<DialRequest> dialRequests,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'dialRequests': dialRequests,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/campaigns/${Uri.encodeComponent(id)}/dial-requests',
      exceptionFnMap: _exceptionFns,
    );
    return PutDialRequestBatchResponse.fromJson(response);
  }

  /// Stops a campaign for the specified Amazon Connect account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> resumeCampaign({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/campaigns/${Uri.encodeComponent(id)}/resume',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a campaign for the specified Amazon Connect account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> startCampaign({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/campaigns/${Uri.encodeComponent(id)}/start',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Onboard the specific Amazon Connect instance to Connect Campaigns.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
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
          '/connect-instance/${Uri.encodeComponent(connectInstanceId)}/onboarding',
      exceptionFnMap: _exceptionFns,
    );
    return StartInstanceOnboardingJobResponse.fromJson(response);
  }

  /// Stops a campaign for the specified Amazon Connect account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InvalidCampaignStateException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> stopCampaign({
    required String id,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/campaigns/${Uri.encodeComponent(id)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Tag a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
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
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Untag a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
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
      requestUri: '/tags/${Uri.encodeComponent(arn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the dialer config of a campaign. This API is idempotent.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  Future<void> updateCampaignDialerConfig({
    required DialerConfig dialerConfig,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'dialerConfig': dialerConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/campaigns/${Uri.encodeComponent(id)}/dialer-config',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the name of a campaign. This API is idempotent.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
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
      requestUri: '/campaigns/${Uri.encodeComponent(id)}/name',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the outbound call config of a campaign. This API is idempotent.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  Future<void> updateCampaignOutboundCallConfig({
    required String id,
    AnswerMachineDetectionConfig? answerMachineDetectionConfig,
    String? connectContactFlowId,
    String? connectSourcePhoneNumber,
  }) async {
    final $payload = <String, dynamic>{
      if (answerMachineDetectionConfig != null)
        'answerMachineDetectionConfig': answerMachineDetectionConfig,
      if (connectContactFlowId != null)
        'connectContactFlowId': connectContactFlowId,
      if (connectSourcePhoneNumber != null)
        'connectSourcePhoneNumber': connectSourcePhoneNumber,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/campaigns/${Uri.encodeComponent(id)}/outbound-call-config',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Agentless Dialer config
class AgentlessDialerConfig {
  final double? dialingCapacity;

  AgentlessDialerConfig({
    this.dialingCapacity,
  });

  factory AgentlessDialerConfig.fromJson(Map<String, dynamic> json) {
    return AgentlessDialerConfig(
      dialingCapacity: json['dialingCapacity'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final dialingCapacity = this.dialingCapacity;
    return {
      if (dialingCapacity != null) 'dialingCapacity': dialingCapacity,
    };
  }
}

/// Answering Machine Detection config
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
          json['enableAnswerMachineDetection'] as bool,
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

/// An Amazon Connect campaign.
class Campaign {
  final String arn;
  final String connectInstanceId;
  final DialerConfig dialerConfig;
  final String id;
  final String name;
  final OutboundCallConfig outboundCallConfig;
  final Map<String, String>? tags;

  Campaign({
    required this.arn,
    required this.connectInstanceId,
    required this.dialerConfig,
    required this.id,
    required this.name,
    required this.outboundCallConfig,
    this.tags,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      arn: json['arn'] as String,
      connectInstanceId: json['connectInstanceId'] as String,
      dialerConfig:
          DialerConfig.fromJson(json['dialerConfig'] as Map<String, dynamic>),
      id: json['id'] as String,
      name: json['name'] as String,
      outboundCallConfig: OutboundCallConfig.fromJson(
          json['outboundCallConfig'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectInstanceId = this.connectInstanceId;
    final dialerConfig = this.dialerConfig;
    final id = this.id;
    final name = this.name;
    final outboundCallConfig = this.outboundCallConfig;
    final tags = this.tags;
    return {
      'arn': arn,
      'connectInstanceId': connectInstanceId,
      'dialerConfig': dialerConfig,
      'id': id,
      'name': name,
      'outboundCallConfig': outboundCallConfig,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Filter model by type
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

/// State of a campaign
enum CampaignState {
  initialized,
  running,
  paused,
  stopped,
  failed,
}

extension CampaignStateValueExtension on CampaignState {
  String toValue() {
    switch (this) {
      case CampaignState.initialized:
        return 'Initialized';
      case CampaignState.running:
        return 'Running';
      case CampaignState.paused:
        return 'Paused';
      case CampaignState.stopped:
        return 'Stopped';
      case CampaignState.failed:
        return 'Failed';
    }
  }
}

extension CampaignStateFromString on String {
  CampaignState toCampaignState() {
    switch (this) {
      case 'Initialized':
        return CampaignState.initialized;
      case 'Running':
        return CampaignState.running;
      case 'Paused':
        return CampaignState.paused;
      case 'Stopped':
        return CampaignState.stopped;
      case 'Failed':
        return CampaignState.failed;
    }
    throw Exception('$this is not known in enum CampaignState');
  }
}

/// An Amazon Connect campaign summary.
class CampaignSummary {
  final String arn;
  final String connectInstanceId;
  final String id;
  final String name;

  CampaignSummary({
    required this.arn,
    required this.connectInstanceId,
    required this.id,
    required this.name,
  });

  factory CampaignSummary.fromJson(Map<String, dynamic> json) {
    return CampaignSummary(
      arn: json['arn'] as String,
      connectInstanceId: json['connectInstanceId'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectInstanceId = this.connectInstanceId;
    final id = this.id;
    final name = this.name;
    return {
      'arn': arn,
      'connectInstanceId': connectInstanceId,
      'id': id,
      'name': name,
    };
  }
}

/// The response for Create Campaign API
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

/// DescribeCampaignResponse
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

/// A dial request for a campaign.
class DialRequest {
  final Map<String, String> attributes;
  final String clientToken;
  final DateTime expirationTime;
  final String phoneNumber;

  DialRequest({
    required this.attributes,
    required this.clientToken,
    required this.expirationTime,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final clientToken = this.clientToken;
    final expirationTime = this.expirationTime;
    final phoneNumber = this.phoneNumber;
    return {
      'attributes': attributes,
      'clientToken': clientToken,
      'expirationTime': iso8601ToJson(expirationTime),
      'phoneNumber': phoneNumber,
    };
  }
}

/// The possible types of dialer config parameters
class DialerConfig {
  final AgentlessDialerConfig? agentlessDialerConfig;
  final PredictiveDialerConfig? predictiveDialerConfig;
  final ProgressiveDialerConfig? progressiveDialerConfig;

  DialerConfig({
    this.agentlessDialerConfig,
    this.predictiveDialerConfig,
    this.progressiveDialerConfig,
  });

  factory DialerConfig.fromJson(Map<String, dynamic> json) {
    return DialerConfig(
      agentlessDialerConfig: json['agentlessDialerConfig'] != null
          ? AgentlessDialerConfig.fromJson(
              json['agentlessDialerConfig'] as Map<String, dynamic>)
          : null,
      predictiveDialerConfig: json['predictiveDialerConfig'] != null
          ? PredictiveDialerConfig.fromJson(
              json['predictiveDialerConfig'] as Map<String, dynamic>)
          : null,
      progressiveDialerConfig: json['progressiveDialerConfig'] != null
          ? ProgressiveDialerConfig.fromJson(
              json['progressiveDialerConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agentlessDialerConfig = this.agentlessDialerConfig;
    final predictiveDialerConfig = this.predictiveDialerConfig;
    final progressiveDialerConfig = this.progressiveDialerConfig;
    return {
      if (agentlessDialerConfig != null)
        'agentlessDialerConfig': agentlessDialerConfig,
      if (predictiveDialerConfig != null)
        'predictiveDialerConfig': predictiveDialerConfig,
      if (progressiveDialerConfig != null)
        'progressiveDialerConfig': progressiveDialerConfig,
    };
  }
}

/// Encryption config for Connect Instance. Note that sensitive data will always
/// be encrypted. If disabled, service will perform encryption with its own key.
/// If enabled, a KMS key id needs to be provided and KMS charges will apply.
/// KMS is only type supported
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
      enabled: json['enabled'] as bool,
      encryptionType: (json['encryptionType'] as String?)?.toEncryptionType(),
      keyArn: json['keyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final encryptionType = this.encryptionType;
    final keyArn = this.keyArn;
    return {
      'enabled': enabled,
      if (encryptionType != null) 'encryptionType': encryptionType.toValue(),
      if (keyArn != null) 'keyArn': keyArn,
    };
  }
}

/// Server-side encryption type.
enum EncryptionType {
  kms,
}

extension EncryptionTypeValueExtension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.kms:
        return 'KMS';
    }
  }
}

extension EncryptionTypeFromString on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'KMS':
        return EncryptionType.kms;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

/// Failed response of campaign state
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
          ?.toGetCampaignStateBatchFailureCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final campaignId = this.campaignId;
    final failureCode = this.failureCode;
    return {
      if (campaignId != null) 'campaignId': campaignId,
      if (failureCode != null) 'failureCode': failureCode.toValue(),
    };
  }
}

/// A failed request identified by the unique client token.
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
      failureCode: (json['failureCode'] as String?)?.toFailureCode(),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final failureCode = this.failureCode;
    final id = this.id;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (id != null) 'id': id,
    };
  }
}

/// A predefined code indicating the error that caused the failure.
enum FailureCode {
  invalidInput,
  requestThrottled,
  unknownError,
}

extension FailureCodeValueExtension on FailureCode {
  String toValue() {
    switch (this) {
      case FailureCode.invalidInput:
        return 'InvalidInput';
      case FailureCode.requestThrottled:
        return 'RequestThrottled';
      case FailureCode.unknownError:
        return 'UnknownError';
    }
  }
}

extension FailureCodeFromString on String {
  FailureCode toFailureCode() {
    switch (this) {
      case 'InvalidInput':
        return FailureCode.invalidInput;
      case 'RequestThrottled':
        return FailureCode.requestThrottled;
      case 'UnknownError':
        return FailureCode.unknownError;
    }
    throw Exception('$this is not known in enum FailureCode');
  }
}

/// A predefined code indicating the error that caused the failure in getting
/// state of campaigns
enum GetCampaignStateBatchFailureCode {
  resourceNotFound,
  unknownError,
}

extension GetCampaignStateBatchFailureCodeValueExtension
    on GetCampaignStateBatchFailureCode {
  String toValue() {
    switch (this) {
      case GetCampaignStateBatchFailureCode.resourceNotFound:
        return 'ResourceNotFound';
      case GetCampaignStateBatchFailureCode.unknownError:
        return 'UnknownError';
    }
  }
}

extension GetCampaignStateBatchFailureCodeFromString on String {
  GetCampaignStateBatchFailureCode toGetCampaignStateBatchFailureCode() {
    switch (this) {
      case 'ResourceNotFound':
        return GetCampaignStateBatchFailureCode.resourceNotFound;
      case 'UnknownError':
        return GetCampaignStateBatchFailureCode.unknownError;
    }
    throw Exception(
        '$this is not known in enum GetCampaignStateBatchFailureCode');
  }
}

/// GetCampaignStateBatchResponse
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
          ?.whereNotNull()
          .map((e) =>
              FailedCampaignStateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulRequests: (json['successfulRequests'] as List?)
          ?.whereNotNull()
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

/// GetCampaignStateResponse
class GetCampaignStateResponse {
  final CampaignState? state;

  GetCampaignStateResponse({
    this.state,
  });

  factory GetCampaignStateResponse.fromJson(Map<String, dynamic> json) {
    return GetCampaignStateResponse(
      state: (json['state'] as String?)?.toCampaignState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// GetConnectInstanceConfigResponse
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

/// GetInstanceOnboardingJobStatusResponse
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

/// Instance config object
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
      connectInstanceId: json['connectInstanceId'] as String,
      encryptionConfig: EncryptionConfig.fromJson(
          json['encryptionConfig'] as Map<String, dynamic>),
      serviceLinkedRoleArn: json['serviceLinkedRoleArn'] as String,
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

/// Connect instance identifier filter
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
      'operator': operator.toValue(),
      'value': value,
    };
  }
}

/// Operators for Connect instance identifier filter
enum InstanceIdFilterOperator {
  eq,
}

extension InstanceIdFilterOperatorValueExtension on InstanceIdFilterOperator {
  String toValue() {
    switch (this) {
      case InstanceIdFilterOperator.eq:
        return 'Eq';
    }
  }
}

extension InstanceIdFilterOperatorFromString on String {
  InstanceIdFilterOperator toInstanceIdFilterOperator() {
    switch (this) {
      case 'Eq':
        return InstanceIdFilterOperator.eq;
    }
    throw Exception('$this is not known in enum InstanceIdFilterOperator');
  }
}

/// Enumeration of the possible failure codes for instance onboarding job
enum InstanceOnboardingJobFailureCode {
  eventBridgeAccessDenied,
  eventBridgeManagedRuleLimitExceeded,
  iamAccessDenied,
  kmsAccessDenied,
  kmsKeyNotFound,
  internalFailure,
}

extension InstanceOnboardingJobFailureCodeValueExtension
    on InstanceOnboardingJobFailureCode {
  String toValue() {
    switch (this) {
      case InstanceOnboardingJobFailureCode.eventBridgeAccessDenied:
        return 'EVENT_BRIDGE_ACCESS_DENIED';
      case InstanceOnboardingJobFailureCode.eventBridgeManagedRuleLimitExceeded:
        return 'EVENT_BRIDGE_MANAGED_RULE_LIMIT_EXCEEDED';
      case InstanceOnboardingJobFailureCode.iamAccessDenied:
        return 'IAM_ACCESS_DENIED';
      case InstanceOnboardingJobFailureCode.kmsAccessDenied:
        return 'KMS_ACCESS_DENIED';
      case InstanceOnboardingJobFailureCode.kmsKeyNotFound:
        return 'KMS_KEY_NOT_FOUND';
      case InstanceOnboardingJobFailureCode.internalFailure:
        return 'INTERNAL_FAILURE';
    }
  }
}

extension InstanceOnboardingJobFailureCodeFromString on String {
  InstanceOnboardingJobFailureCode toInstanceOnboardingJobFailureCode() {
    switch (this) {
      case 'EVENT_BRIDGE_ACCESS_DENIED':
        return InstanceOnboardingJobFailureCode.eventBridgeAccessDenied;
      case 'EVENT_BRIDGE_MANAGED_RULE_LIMIT_EXCEEDED':
        return InstanceOnboardingJobFailureCode
            .eventBridgeManagedRuleLimitExceeded;
      case 'IAM_ACCESS_DENIED':
        return InstanceOnboardingJobFailureCode.iamAccessDenied;
      case 'KMS_ACCESS_DENIED':
        return InstanceOnboardingJobFailureCode.kmsAccessDenied;
      case 'KMS_KEY_NOT_FOUND':
        return InstanceOnboardingJobFailureCode.kmsKeyNotFound;
      case 'INTERNAL_FAILURE':
        return InstanceOnboardingJobFailureCode.internalFailure;
    }
    throw Exception(
        '$this is not known in enum InstanceOnboardingJobFailureCode');
  }
}

/// Instance onboarding job status object
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
      connectInstanceId: json['connectInstanceId'] as String,
      status: (json['status'] as String).toInstanceOnboardingJobStatusCode(),
      failureCode: (json['failureCode'] as String?)
          ?.toInstanceOnboardingJobFailureCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectInstanceId = this.connectInstanceId;
    final status = this.status;
    final failureCode = this.failureCode;
    return {
      'connectInstanceId': connectInstanceId,
      'status': status.toValue(),
      if (failureCode != null) 'failureCode': failureCode.toValue(),
    };
  }
}

/// Enumeration of the possible states for instance onboarding job
enum InstanceOnboardingJobStatusCode {
  inProgress,
  succeeded,
  failed,
}

extension InstanceOnboardingJobStatusCodeValueExtension
    on InstanceOnboardingJobStatusCode {
  String toValue() {
    switch (this) {
      case InstanceOnboardingJobStatusCode.inProgress:
        return 'IN_PROGRESS';
      case InstanceOnboardingJobStatusCode.succeeded:
        return 'SUCCEEDED';
      case InstanceOnboardingJobStatusCode.failed:
        return 'FAILED';
    }
  }
}

extension InstanceOnboardingJobStatusCodeFromString on String {
  InstanceOnboardingJobStatusCode toInstanceOnboardingJobStatusCode() {
    switch (this) {
      case 'IN_PROGRESS':
        return InstanceOnboardingJobStatusCode.inProgress;
      case 'SUCCEEDED':
        return InstanceOnboardingJobStatusCode.succeeded;
      case 'FAILED':
        return InstanceOnboardingJobStatusCode.failed;
    }
    throw Exception(
        '$this is not known in enum InstanceOnboardingJobStatusCode');
  }
}

/// ListCampaignsResponse
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
          ?.whereNotNull()
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

/// ListTagsForResponse
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

/// The configuration used for outbound calls.
class OutboundCallConfig {
  final String connectContactFlowId;
  final AnswerMachineDetectionConfig? answerMachineDetectionConfig;
  final String? connectQueueId;
  final String? connectSourcePhoneNumber;

  OutboundCallConfig({
    required this.connectContactFlowId,
    this.answerMachineDetectionConfig,
    this.connectQueueId,
    this.connectSourcePhoneNumber,
  });

  factory OutboundCallConfig.fromJson(Map<String, dynamic> json) {
    return OutboundCallConfig(
      connectContactFlowId: json['connectContactFlowId'] as String,
      answerMachineDetectionConfig: json['answerMachineDetectionConfig'] != null
          ? AnswerMachineDetectionConfig.fromJson(
              json['answerMachineDetectionConfig'] as Map<String, dynamic>)
          : null,
      connectQueueId: json['connectQueueId'] as String?,
      connectSourcePhoneNumber: json['connectSourcePhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectContactFlowId = this.connectContactFlowId;
    final answerMachineDetectionConfig = this.answerMachineDetectionConfig;
    final connectQueueId = this.connectQueueId;
    final connectSourcePhoneNumber = this.connectSourcePhoneNumber;
    return {
      'connectContactFlowId': connectContactFlowId,
      if (answerMachineDetectionConfig != null)
        'answerMachineDetectionConfig': answerMachineDetectionConfig,
      if (connectQueueId != null) 'connectQueueId': connectQueueId,
      if (connectSourcePhoneNumber != null)
        'connectSourcePhoneNumber': connectSourcePhoneNumber,
    };
  }
}

/// Predictive Dialer config
class PredictiveDialerConfig {
  final double bandwidthAllocation;
  final double? dialingCapacity;

  PredictiveDialerConfig({
    required this.bandwidthAllocation,
    this.dialingCapacity,
  });

  factory PredictiveDialerConfig.fromJson(Map<String, dynamic> json) {
    return PredictiveDialerConfig(
      bandwidthAllocation: json['bandwidthAllocation'] as double,
      dialingCapacity: json['dialingCapacity'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidthAllocation = this.bandwidthAllocation;
    final dialingCapacity = this.dialingCapacity;
    return {
      'bandwidthAllocation': bandwidthAllocation,
      if (dialingCapacity != null) 'dialingCapacity': dialingCapacity,
    };
  }
}

/// Progressive Dialer config
class ProgressiveDialerConfig {
  final double bandwidthAllocation;
  final double? dialingCapacity;

  ProgressiveDialerConfig({
    required this.bandwidthAllocation,
    this.dialingCapacity,
  });

  factory ProgressiveDialerConfig.fromJson(Map<String, dynamic> json) {
    return ProgressiveDialerConfig(
      bandwidthAllocation: json['bandwidthAllocation'] as double,
      dialingCapacity: json['dialingCapacity'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidthAllocation = this.bandwidthAllocation;
    final dialingCapacity = this.dialingCapacity;
    return {
      'bandwidthAllocation': bandwidthAllocation,
      if (dialingCapacity != null) 'dialingCapacity': dialingCapacity,
    };
  }
}

/// PutDialRequestBatchResponse
class PutDialRequestBatchResponse {
  final List<FailedRequest>? failedRequests;
  final List<SuccessfulRequest>? successfulRequests;

  PutDialRequestBatchResponse({
    this.failedRequests,
    this.successfulRequests,
  });

  factory PutDialRequestBatchResponse.fromJson(Map<String, dynamic> json) {
    return PutDialRequestBatchResponse(
      failedRequests: (json['failedRequests'] as List?)
          ?.whereNotNull()
          .map((e) => FailedRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      successfulRequests: (json['successfulRequests'] as List?)
          ?.whereNotNull()
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

/// The response for StartInstanceOnboardingJob API.
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

/// Successful response of campaign state
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
      state: (json['state'] as String?)?.toCampaignState(),
    );
  }

  Map<String, dynamic> toJson() {
    final campaignId = this.campaignId;
    final state = this.state;
    return {
      if (campaignId != null) 'campaignId': campaignId,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// A successful request identified by the unique client token.
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidCampaignStateException extends _s.GenericAwsException {
  InvalidCampaignStateException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCampaignStateException',
            message: message);
}

class InvalidStateException extends _s.GenericAwsException {
  InvalidStateException({String? type, String? message})
      : super(type: type, code: 'InvalidStateException', message: message);
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
