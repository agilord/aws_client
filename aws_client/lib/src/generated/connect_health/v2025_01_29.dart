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

import 'v2025_01_29.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Health Agent for healthcare providers and patient engagement
class ConnectHealth {
  final _s.RestJsonProtocol _protocol;
  factory ConnectHealth({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
    bool disableHostPrefix = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'health-agent',
    );
    return ConnectHealth._(
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
        disableHostPrefix: disableHostPrefix,
      ),
    );
  }
  ConnectHealth._({
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

  /// Activates a Subscription to enable billing for a user.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the parent Domain.
  ///
  /// Parameter [subscriptionId] :
  /// The unique identifier of the Subscription.
  Future<ActivateSubscriptionOutput> activateSubscription({
    required String domainId,
    required String subscriptionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/subscriptions/${Uri.encodeComponent(subscriptionId)}/activate',
      exceptionFnMap: _exceptionFns,
    );
    return ActivateSubscriptionOutput.fromJson(response);
  }

  /// Creates a new Domain for managing HealthAgent resources.
  ///
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// The name for the new Domain.
  ///
  /// Parameter [kmsKeyArn] :
  /// The ARN of the KMS key to use for encrypting data in this Domain.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the Domain.
  ///
  /// Parameter [webAppSetupConfiguration] :
  /// Configuration for the Domain web application. Optional, but if provided
  /// all fields are required.
  Future<CreateDomainOutput> createDomain({
    required String name,
    String? kmsKeyArn,
    Map<String, String>? tags,
    CreateWebAppConfiguration? webAppSetupConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
      if (webAppSetupConfiguration != null)
        'webAppSetupConfiguration': webAppSetupConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domain',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainOutput.fromJson(response);
  }

  /// Creates a new Subscription within a Domain for billing and user
  /// management.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the parent Domain.
  Future<CreateSubscriptionOutput> createSubscription({
    required String domainId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/subscriptions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSubscriptionOutput.fromJson(response);
  }

  /// Deactivates a Subscription to stop billing for a user.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the parent Domain.
  ///
  /// Parameter [subscriptionId] :
  /// The unique identifier of the Subscription.
  Future<DeactivateSubscriptionOutput> deactivateSubscription({
    required String domainId,
    required String subscriptionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/subscriptions/${Uri.encodeComponent(subscriptionId)}/deactivate',
      exceptionFnMap: _exceptionFns,
    );
    return DeactivateSubscriptionOutput.fromJson(response);
  }

  /// Deletes a Domain and all associated resources.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domainId] :
  /// The id of the Domain to delete
  Future<DeleteDomainOutput> deleteDomain({
    required String domainId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/domain/${Uri.encodeComponent(domainId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainOutput.fromJson(response);
  }

  /// Retrieves information about a Domain.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [domainId] :
  /// The id of the Domain to get
  Future<GetDomainOutput> getDomain({
    required String domainId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domain/${Uri.encodeComponent(domainId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainOutput.fromJson(response);
  }

  /// Retrieves details about an existing Medical Scribe listening session
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainId] :
  /// The Domain identifier
  ///
  /// Parameter [sessionId] :
  /// The Session identifier
  ///
  /// Parameter [subscriptionId] :
  /// The Subscription identifier
  Future<GetMedicalScribeListeningSessionOutput>
      getMedicalScribeListeningSession({
    required String domainId,
    required String sessionId,
    required String subscriptionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/medical-scribe-stream/domain/${Uri.encodeComponent(domainId)}/subscription/${Uri.encodeComponent(subscriptionId)}/session/${Uri.encodeComponent(sessionId)}',
      hostPrefix: 'streaming.',
      exceptionFnMap: _exceptionFns,
    );
    return GetMedicalScribeListeningSessionOutput.fromJson(response);
  }

  /// Get details of a started patient insights job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// <p/>
  ///
  /// Parameter [jobId] :
  /// <p/>
  Future<GetPatientInsightsJobResponse> getPatientInsightsJob({
    required String domainId,
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domain/${Uri.encodeComponent(domainId)}/patient-insights-job/${Uri.encodeComponent(jobId)}',
      hostPrefix: 'runtime.',
      exceptionFnMap: _exceptionFns,
    );
    return GetPatientInsightsJobResponse.fromJson(response);
  }

  /// Retrieves information about a Subscription.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the parent Domain.
  ///
  /// Parameter [subscriptionId] :
  /// The unique identifier of the Subscription.
  Future<GetSubscriptionOutput> getSubscription({
    required String domainId,
    required String subscriptionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domains/${Uri.encodeComponent(domainId)}/subscriptions/${Uri.encodeComponent(subscriptionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSubscriptionOutput.fromJson(response);
  }

  /// Lists Domains for a given account.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// Token for pagination.
  ///
  /// Parameter [status] :
  /// Filter by Domain status.
  Future<ListDomainsOutput> listDomains({
    int? maxResults,
    String? nextToken,
    DomainStatus? status,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domain',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainsOutput.fromJson(response);
  }

  /// Lists all Subscriptions within a Domain.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The unique identifier of the parent Domain.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// Token for pagination.
  Future<ListSubscriptionsOutput> listSubscriptions({
    required String domainId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domains/${Uri.encodeComponent(domainId)}/subscriptions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubscriptionsOutput.fromJson(response);
  }

  /// Lists the tags associated with the specified resource
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to list tags for
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Starts a new Medical Scribe listening session for real-time audio
  /// transcription
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// The Domain identifier
  ///
  /// Parameter [languageCode] :
  /// The Language Code for the audio in the session
  ///
  /// Parameter [mediaEncoding] :
  /// The encoding for the input audio
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// The sample rate of the input audio
  ///
  /// Parameter [sessionId] :
  /// The Session identifier
  ///
  /// Parameter [subscriptionId] :
  /// The Subscription identifier
  ///
  /// Parameter [inputStream] :
  /// <p/>
  Future<StartMedicalScribeListeningSessionOutput>
      startMedicalScribeListeningSession({
    required String domainId,
    required MedicalScribeLanguageCode languageCode,
    required MedicalScribeMediaEncoding mediaEncoding,
    required int mediaSampleRateHertz,
    required String sessionId,
    required String subscriptionId,
    MedicalScribeInputStream? inputStream,
  }) async {
    _s.validateNumRange(
      'mediaSampleRateHertz',
      mediaSampleRateHertz,
      8000,
      48000,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amzn-medscribe-domain-id': domainId.toString(),
      'x-amzn-medscribe-language-code': languageCode.value,
      'x-amzn-medscribe-media-encoding': mediaEncoding.value,
      'x-amzn-medscribe-sample-rate': mediaSampleRateHertz.toString(),
      'x-amzn-medscribe-session-id': sessionId.toString(),
      'x-amzn-medscribe-subscription-id': subscriptionId.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: inputStream,
      method: 'POST',
      requestUri: '/medical-scribe-stream/',
      headers: headers,
      hostPrefix: 'streaming.',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StartMedicalScribeListeningSessionOutput(
      responseStream: MedicalScribeOutputStream.fromJson($json),
      domainId: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-medscribe-domain-id'),
      languageCode: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-medscribe-language-code')
          ?.let(MedicalScribeLanguageCode.fromString),
      mediaEncoding: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-medscribe-media-encoding')
          ?.let(MedicalScribeMediaEncoding.fromString),
      mediaSampleRateHertz: _s.extractHeaderIntValue(
          response.headers, 'x-amzn-medscribe-sample-rate'),
      requestId:
          _s.extractHeaderStringValue(response.headers, 'x-amzn-request-id'),
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-medscribe-session-id'),
      subscriptionId: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-medscribe-subscription-id'),
    );
  }

  /// Starts a new patient insights job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domainId] :
  /// <p/>
  ///
  /// Parameter [encounterContext] :
  /// <p/>
  ///
  /// Parameter [inputDataConfig] :
  /// <p/>
  ///
  /// Parameter [insightsContext] :
  /// <p/>
  ///
  /// Parameter [outputDataConfig] :
  /// <p/>
  ///
  /// Parameter [patientContext] :
  /// <p/>
  ///
  /// Parameter [userContext] :
  /// <p/>
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<StartPatientInsightsJobResponse> startPatientInsightsJob({
    required String domainId,
    required PatientInsightsEncounterContext encounterContext,
    required InputDataConfig inputDataConfig,
    required InsightsContext insightsContext,
    required OutputDataConfig outputDataConfig,
    required PatientInsightsPatientContext patientContext,
    required UserContext userContext,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'encounterContext': encounterContext,
      'inputDataConfig': inputDataConfig,
      'insightsContext': insightsContext,
      'outputDataConfig': outputDataConfig,
      'patientContext': patientContext,
      'userContext': userContext,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domain/${Uri.encodeComponent(domainId)}/patient-insights-job',
      hostPrefix: 'runtime.',
      exceptionFnMap: _exceptionFns,
    );
    return StartPatientInsightsJobResponse.fromJson(response);
  }

  /// Associates the specified tags with the specified resource
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to tag
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified tags from the specified resource
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to untag
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to remove from the resource
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class ActivateSubscriptionOutput {
  /// <p/>
  final SubscriptionDescription? subscription;

  ActivateSubscriptionOutput({
    this.subscription,
  });

  factory ActivateSubscriptionOutput.fromJson(Map<String, dynamic> json) {
    return ActivateSubscriptionOutput(
      subscription: json['subscription'] != null
          ? SubscriptionDescription.fromJson(
              json['subscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscription = this.subscription;
    return {
      if (subscription != null) 'subscription': subscription,
    };
  }
}

/// This error is thrown when a transient error causes our API to fail.
///
/// @nodoc
class InternalServerException implements _s.AwsException {
  final String? message;

  InternalServerException({
    this.message,
  });

  factory InternalServerException.fromJson(Map<String, dynamic> json) {
    return InternalServerException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// This error is thrown when the client supplies invalid input to the API.
///
/// @nodoc
class ValidationException implements _s.AwsException {
  final String? message;

  ValidationException({
    this.message,
  });

  factory ValidationException.fromJson(Map<String, dynamic> json) {
    return ValidationException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// @nodoc
class CreateDomainOutput {
  /// <p/>
  final String arn;

  /// <p/>
  final DateTime createdAt;

  /// <p/>
  final String domainId;

  /// <p/>
  final String name;

  /// <p/>
  final DomainStatus status;

  /// <p/>
  final EncryptionContext? encryptionContext;

  /// <p/>
  final String? kmsKeyArn;

  /// <p/>
  final WebAppConfiguration? webAppConfiguration;

  /// <p/>
  final String? webAppUrl;

  CreateDomainOutput({
    required this.arn,
    required this.createdAt,
    required this.domainId,
    required this.name,
    required this.status,
    this.encryptionContext,
    this.kmsKeyArn,
    this.webAppConfiguration,
    this.webAppUrl,
  });

  factory CreateDomainOutput.fromJson(Map<String, dynamic> json) {
    return CreateDomainOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      domainId: (json['domainId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: DomainStatus.fromString((json['status'] as String?) ?? ''),
      encryptionContext: json['encryptionContext'] != null
          ? EncryptionContext.fromJson(
              json['encryptionContext'] as Map<String, dynamic>)
          : null,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      webAppConfiguration: json['webAppConfiguration'] != null
          ? WebAppConfiguration.fromJson(
              json['webAppConfiguration'] as Map<String, dynamic>)
          : null,
      webAppUrl: json['webAppUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainId = this.domainId;
    final name = this.name;
    final status = this.status;
    final encryptionContext = this.encryptionContext;
    final kmsKeyArn = this.kmsKeyArn;
    final webAppConfiguration = this.webAppConfiguration;
    final webAppUrl = this.webAppUrl;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'domainId': domainId,
      'name': name,
      'status': status.value,
      if (encryptionContext != null) 'encryptionContext': encryptionContext,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (webAppConfiguration != null)
        'webAppConfiguration': webAppConfiguration,
      if (webAppUrl != null) 'webAppUrl': webAppUrl,
    };
  }
}

/// @nodoc
class CreateSubscriptionOutput {
  /// <p/>
  final String arn;

  /// <p/>
  final DateTime createdAt;

  /// <p/>
  final String domainId;

  /// <p/>
  final DateTime lastUpdatedAt;

  /// <p/>
  final SubscriptionStatus status;

  /// <p/>
  final String subscriptionId;

  /// <p/>
  final DateTime? activatedAt;

  /// <p/>
  final DateTime? deactivatedAt;

  CreateSubscriptionOutput({
    required this.arn,
    required this.createdAt,
    required this.domainId,
    required this.lastUpdatedAt,
    required this.status,
    required this.subscriptionId,
    this.activatedAt,
    this.deactivatedAt,
  });

  factory CreateSubscriptionOutput.fromJson(Map<String, dynamic> json) {
    return CreateSubscriptionOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      domainId: (json['domainId'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      status: SubscriptionStatus.fromString((json['status'] as String?) ?? ''),
      subscriptionId: (json['subscriptionId'] as String?) ?? '',
      activatedAt: timeStampFromJson(json['activatedAt']),
      deactivatedAt: timeStampFromJson(json['deactivatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainId = this.domainId;
    final lastUpdatedAt = this.lastUpdatedAt;
    final status = this.status;
    final subscriptionId = this.subscriptionId;
    final activatedAt = this.activatedAt;
    final deactivatedAt = this.deactivatedAt;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'domainId': domainId,
      'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'status': status.value,
      'subscriptionId': subscriptionId,
      if (activatedAt != null) 'activatedAt': unixTimestampToJson(activatedAt),
      if (deactivatedAt != null)
        'deactivatedAt': unixTimestampToJson(deactivatedAt),
    };
  }
}

/// @nodoc
class DeactivateSubscriptionOutput {
  /// <p/>
  final SubscriptionDescription? subscription;

  DeactivateSubscriptionOutput({
    this.subscription,
  });

  factory DeactivateSubscriptionOutput.fromJson(Map<String, dynamic> json) {
    return DeactivateSubscriptionOutput(
      subscription: json['subscription'] != null
          ? SubscriptionDescription.fromJson(
              json['subscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscription = this.subscription;
    return {
      if (subscription != null) 'subscription': subscription,
    };
  }
}

/// @nodoc
class DeleteDomainOutput {
  /// The ARN of the Domain that was requested for deletion
  final String arn;

  /// The id of the Domain requested for deletion
  final String domainId;

  /// Current status of Domain
  final DomainStatus status;

  DeleteDomainOutput({
    required this.arn,
    required this.domainId,
    required this.status,
  });

  factory DeleteDomainOutput.fromJson(Map<String, dynamic> json) {
    return DeleteDomainOutput(
      arn: (json['arn'] as String?) ?? '',
      domainId: (json['domainId'] as String?) ?? '',
      status: DomainStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final domainId = this.domainId;
    final status = this.status;
    return {
      'arn': arn,
      'domainId': domainId,
      'status': status.value,
    };
  }
}

/// @nodoc
class GetDomainOutput {
  /// <p/>
  final String arn;

  /// <p/>
  final DateTime createdAt;

  /// <p/>
  final String domainId;

  /// <p/>
  final String name;

  /// <p/>
  final DomainStatus status;

  /// <p/>
  final EncryptionContext? encryptionContext;

  /// <p/>
  final String? kmsKeyArn;

  /// Tags associated with the Domain
  final Map<String, String>? tags;

  /// <p/>
  final WebAppConfiguration? webAppConfiguration;

  /// <p/>
  final String? webAppUrl;

  GetDomainOutput({
    required this.arn,
    required this.createdAt,
    required this.domainId,
    required this.name,
    required this.status,
    this.encryptionContext,
    this.kmsKeyArn,
    this.tags,
    this.webAppConfiguration,
    this.webAppUrl,
  });

  factory GetDomainOutput.fromJson(Map<String, dynamic> json) {
    return GetDomainOutput(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      domainId: (json['domainId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: DomainStatus.fromString((json['status'] as String?) ?? ''),
      encryptionContext: json['encryptionContext'] != null
          ? EncryptionContext.fromJson(
              json['encryptionContext'] as Map<String, dynamic>)
          : null,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      webAppConfiguration: json['webAppConfiguration'] != null
          ? WebAppConfiguration.fromJson(
              json['webAppConfiguration'] as Map<String, dynamic>)
          : null,
      webAppUrl: json['webAppUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainId = this.domainId;
    final name = this.name;
    final status = this.status;
    final encryptionContext = this.encryptionContext;
    final kmsKeyArn = this.kmsKeyArn;
    final tags = this.tags;
    final webAppConfiguration = this.webAppConfiguration;
    final webAppUrl = this.webAppUrl;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'domainId': domainId,
      'name': name,
      'status': status.value,
      if (encryptionContext != null) 'encryptionContext': encryptionContext,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
      if (webAppConfiguration != null)
        'webAppConfiguration': webAppConfiguration,
      if (webAppUrl != null) 'webAppUrl': webAppUrl,
    };
  }
}

/// @nodoc
class GetMedicalScribeListeningSessionOutput {
  /// Details about the Medical Scribe listening session
  final MedicalScribeListeningSessionDetails?
      medicalScribeListeningSessionDetails;

  GetMedicalScribeListeningSessionOutput({
    this.medicalScribeListeningSessionDetails,
  });

  factory GetMedicalScribeListeningSessionOutput.fromJson(
      Map<String, dynamic> json) {
    return GetMedicalScribeListeningSessionOutput(
      medicalScribeListeningSessionDetails:
          json['medicalScribeListeningSessionDetails'] != null
              ? MedicalScribeListeningSessionDetails.fromJson(
                  json['medicalScribeListeningSessionDetails']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final medicalScribeListeningSessionDetails =
        this.medicalScribeListeningSessionDetails;
    return {
      if (medicalScribeListeningSessionDetails != null)
        'medicalScribeListeningSessionDetails':
            medicalScribeListeningSessionDetails,
    };
  }
}

/// @nodoc
class GetPatientInsightsJobResponse {
  /// <p/>
  final PatientInsightsEncounterContext encounterContext;

  /// <p/>
  final InputDataConfig inputDataConfig;

  /// <p/>
  final InsightsContext insightsContext;

  /// <p/>
  final String jobArn;

  /// <p/>
  final String jobId;

  /// <p/>
  final JobStatus jobStatus;

  /// <p/>
  final OutputDataConfig outputDataConfig;

  /// <p/>
  final PatientInsightsPatientContext patientContext;

  /// <p/>
  final UserContext userContext;

  /// Date and time the patient insights job was submitted.
  final DateTime? creationTime;

  /// <p/>
  final InsightsOutput? insightsOutput;

  /// Contains information about the status of a job.
  final String? statusDetails;

  /// Date and time the patient insights job was last updated.
  final DateTime? updatedTime;

  GetPatientInsightsJobResponse({
    required this.encounterContext,
    required this.inputDataConfig,
    required this.insightsContext,
    required this.jobArn,
    required this.jobId,
    required this.jobStatus,
    required this.outputDataConfig,
    required this.patientContext,
    required this.userContext,
    this.creationTime,
    this.insightsOutput,
    this.statusDetails,
    this.updatedTime,
  });

  factory GetPatientInsightsJobResponse.fromJson(Map<String, dynamic> json) {
    return GetPatientInsightsJobResponse(
      encounterContext: PatientInsightsEncounterContext.fromJson(
          (json['encounterContext'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inputDataConfig: InputDataConfig.fromJson(
          (json['inputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      insightsContext: InsightsContext.fromJson(
          (json['insightsContext'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      jobStatus: JobStatus.fromString((json['jobStatus'] as String?) ?? ''),
      outputDataConfig: OutputDataConfig.fromJson(
          (json['outputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      patientContext: PatientInsightsPatientContext.fromJson(
          (json['patientContext'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      userContext: UserContext.fromJson(
          (json['userContext'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      creationTime: timeStampFromJson(json['creationTime']),
      insightsOutput: json['insightsOutput'] != null
          ? InsightsOutput.fromJson(
              json['insightsOutput'] as Map<String, dynamic>)
          : null,
      statusDetails: json['statusDetails'] as String?,
      updatedTime: timeStampFromJson(json['updatedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final encounterContext = this.encounterContext;
    final inputDataConfig = this.inputDataConfig;
    final insightsContext = this.insightsContext;
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final outputDataConfig = this.outputDataConfig;
    final patientContext = this.patientContext;
    final userContext = this.userContext;
    final creationTime = this.creationTime;
    final insightsOutput = this.insightsOutput;
    final statusDetails = this.statusDetails;
    final updatedTime = this.updatedTime;
    return {
      'encounterContext': encounterContext,
      'inputDataConfig': inputDataConfig,
      'insightsContext': insightsContext,
      'jobArn': jobArn,
      'jobId': jobId,
      'jobStatus': jobStatus.value,
      'outputDataConfig': outputDataConfig,
      'patientContext': patientContext,
      'userContext': userContext,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (insightsOutput != null) 'insightsOutput': insightsOutput,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (updatedTime != null) 'updatedTime': iso8601ToJson(updatedTime),
    };
  }
}

/// @nodoc
class GetSubscriptionOutput {
  /// <p/>
  final SubscriptionDescription? subscription;

  GetSubscriptionOutput({
    this.subscription,
  });

  factory GetSubscriptionOutput.fromJson(Map<String, dynamic> json) {
    return GetSubscriptionOutput(
      subscription: json['subscription'] != null
          ? SubscriptionDescription.fromJson(
              json['subscription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final subscription = this.subscription;
    return {
      if (subscription != null) 'subscription': subscription,
    };
  }
}

/// @nodoc
class ListDomainsOutput {
  /// List of Domains.
  final List<DomainSummary> domains;

  /// Token for the next page of results.
  final String? nextToken;

  ListDomainsOutput({
    required this.domains,
    this.nextToken,
  });

  factory ListDomainsOutput.fromJson(Map<String, dynamic> json) {
    return ListDomainsOutput(
      domains: ((json['domains'] as List?) ?? const [])
          .nonNulls
          .map((e) => DomainSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domains = this.domains;
    final nextToken = this.nextToken;
    return {
      'domains': domains,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSubscriptionsOutput {
  /// List of Subscriptions.
  final List<SubscriptionDescription> subscriptions;

  /// Token for the next page of results.
  final String? nextToken;

  ListSubscriptionsOutput({
    required this.subscriptions,
    this.nextToken,
  });

  factory ListSubscriptionsOutput.fromJson(Map<String, dynamic> json) {
    return ListSubscriptionsOutput(
      subscriptions: ((json['subscriptions'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              SubscriptionDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptions = this.subscriptions;
    final nextToken = this.nextToken;
    return {
      'subscriptions': subscriptions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceOutput {
  /// The tags associated with the resource
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
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
class StartMedicalScribeListeningSessionOutput {
  /// The Domain identifier
  final String? domainId;

  /// The Language Code for the audio in the session
  final MedicalScribeLanguageCode? languageCode;

  /// The encoding for the input audio
  final MedicalScribeMediaEncoding? mediaEncoding;

  /// The sample rate of the input audio
  final int? mediaSampleRateHertz;

  /// The Request identifier
  final String? requestId;

  /// The output stream containing transcript events
  final MedicalScribeOutputStream? responseStream;

  /// The Session identifier
  final String? sessionId;

  /// The Subscription identifier
  final String? subscriptionId;

  StartMedicalScribeListeningSessionOutput({
    this.domainId,
    this.languageCode,
    this.mediaEncoding,
    this.mediaSampleRateHertz,
    this.requestId,
    this.responseStream,
    this.sessionId,
    this.subscriptionId,
  });

  Map<String, dynamic> toJson() {
    final domainId = this.domainId;
    final languageCode = this.languageCode;
    final mediaEncoding = this.mediaEncoding;
    final mediaSampleRateHertz = this.mediaSampleRateHertz;
    final requestId = this.requestId;
    final responseStream = this.responseStream;
    final sessionId = this.sessionId;
    final subscriptionId = this.subscriptionId;
    return {
      if (responseStream != null) 'responseStream': responseStream,
    };
  }
}

/// @nodoc
class StartPatientInsightsJobResponse {
  /// <p/>
  final String jobArn;

  /// <p/>
  final String jobId;

  /// Date and time the patient insights job was submitted.
  final DateTime? creationTime;

  StartPatientInsightsJobResponse({
    required this.jobArn,
    required this.jobId,
    this.creationTime,
  });

  factory StartPatientInsightsJobResponse.fromJson(Map<String, dynamic> json) {
    return StartPatientInsightsJobResponse(
      jobArn: (json['jobArn'] as String?) ?? '',
      jobId: (json['jobId'] as String?) ?? '',
      creationTime: timeStampFromJson(json['creationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    final jobId = this.jobId;
    final creationTime = this.creationTime;
    return {
      'jobArn': jobArn,
      'jobId': jobId,
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
    };
  }
}

/// Details for a patient
///
/// @nodoc
class PatientInsightsPatientContext {
  /// Unique identifier of the patient
  final String patientId;

  /// Date of birth of the patient.
  final String? dateOfBirth;

  /// Pronouns preferred by the patient.
  final Pronouns? pronouns;

  PatientInsightsPatientContext({
    required this.patientId,
    this.dateOfBirth,
    this.pronouns,
  });

  factory PatientInsightsPatientContext.fromJson(Map<String, dynamic> json) {
    return PatientInsightsPatientContext(
      patientId: (json['patientId'] as String?) ?? '',
      dateOfBirth: json['dateOfBirth'] as String?,
      pronouns: (json['pronouns'] as String?)?.let(Pronouns.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final patientId = this.patientId;
    final dateOfBirth = this.dateOfBirth;
    final pronouns = this.pronouns;
    return {
      'patientId': patientId,
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
      if (pronouns != null) 'pronouns': pronouns.value,
    };
  }
}

/// Details for insights that user wants to generate
///
/// @nodoc
class InsightsContext {
  /// <p/>
  final InsightsType insightsType;

  InsightsContext({
    required this.insightsType,
  });

  factory InsightsContext.fromJson(Map<String, dynamic> json) {
    return InsightsContext(
      insightsType:
          InsightsType.fromString((json['insightsType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final insightsType = this.insightsType;
    return {
      'insightsType': insightsType.value,
    };
  }
}

/// Details for an encounter
///
/// @nodoc
class PatientInsightsEncounterContext {
  /// Chief complaint for the visit
  final String encounterReason;

  PatientInsightsEncounterContext({
    required this.encounterReason,
  });

  factory PatientInsightsEncounterContext.fromJson(Map<String, dynamic> json) {
    return PatientInsightsEncounterContext(
      encounterReason: (json['encounterReason'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final encounterReason = this.encounterReason;
    return {
      'encounterReason': encounterReason,
    };
  }
}

/// Details for user initiating insights job
///
/// @nodoc
class UserContext {
  /// <p/>
  final ProviderRole role;

  /// Unique identifier of the user
  final String userId;

  /// <p/>
  final Specialty? specialty;

  UserContext({
    required this.role,
    required this.userId,
    this.specialty,
  });

  factory UserContext.fromJson(Map<String, dynamic> json) {
    return UserContext(
      role: ProviderRole.fromString((json['role'] as String?) ?? ''),
      userId: (json['userId'] as String?) ?? '',
      specialty: (json['specialty'] as String?)?.let(Specialty.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    final userId = this.userId;
    final specialty = this.specialty;
    return {
      'role': role.value,
      'userId': userId,
      if (specialty != null) 'specialty': specialty.value,
    };
  }
}

/// Configuration details for input patient data
///
/// @nodoc
class InputDataConfig {
  /// FHIR server configuration to retrieve patient data.
  final FHIRServer? fhirServer;

  /// List of S3 sources containing patient data.
  final List<S3Source>? s3Sources;

  InputDataConfig({
    this.fhirServer,
    this.s3Sources,
  });

  factory InputDataConfig.fromJson(Map<String, dynamic> json) {
    return InputDataConfig(
      fhirServer: json['fhirServer'] != null
          ? FHIRServer.fromJson(json['fhirServer'] as Map<String, dynamic>)
          : null,
      s3Sources: (json['s3Sources'] as List?)
          ?.nonNulls
          .map((e) => S3Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fhirServer = this.fhirServer;
    final s3Sources = this.s3Sources;
    return {
      if (fhirServer != null) 'fhirServer': fhirServer,
      if (s3Sources != null) 's3Sources': s3Sources,
    };
  }
}

/// Configuration details for insights output.
///
/// @nodoc
class OutputDataConfig {
  /// S3 URI where the insights output will be stored.
  final String s3OutputPath;

  OutputDataConfig({
    required this.s3OutputPath,
  });

  factory OutputDataConfig.fromJson(Map<String, dynamic> json) {
    return OutputDataConfig(
      s3OutputPath: (json['s3OutputPath'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final s3OutputPath = this.s3OutputPath;
    return {
      's3OutputPath': s3OutputPath,
    };
  }
}

/// FHIR server configuration for input data source
///
/// @nodoc
class FHIRServer {
  /// FHIR server endpoint URL for accessing patient data.
  final String fhirEndpoint;

  /// OAuth token for authenticating with the FHIR server.
  final String? oauthToken;

  FHIRServer({
    required this.fhirEndpoint,
    this.oauthToken,
  });

  factory FHIRServer.fromJson(Map<String, dynamic> json) {
    return FHIRServer(
      fhirEndpoint: (json['fhirEndpoint'] as String?) ?? '',
      oauthToken: json['oauthToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fhirEndpoint = this.fhirEndpoint;
    final oauthToken = this.oauthToken;
    return {
      'fhirEndpoint': fhirEndpoint,
      if (oauthToken != null) 'oauthToken': oauthToken,
    };
  }
}

/// S3 uri for input data source
///
/// @nodoc
class S3Source {
  /// The S3 URI.
  final String uri;

  S3Source({
    required this.uri,
  });

  factory S3Source.fromJson(Map<String, dynamic> json) {
    return S3Source(
      uri: (json['uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'uri': uri,
    };
  }
}

/// @nodoc
class ProviderRole {
  static const clinician = ProviderRole._('CLINICIAN');

  final String value;

  const ProviderRole._(this.value);

  static const values = [clinician];

  static ProviderRole fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ProviderRole._(value));

  @override
  bool operator ==(other) => other is ProviderRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Specialty {
  static const primaryCare = Specialty._('PRIMARY_CARE');

  final String value;

  const Specialty._(this.value);

  static const values = [primaryCare];

  static Specialty fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Specialty._(value));

  @override
  bool operator ==(other) => other is Specialty && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InsightsType {
  static const preVisit = InsightsType._('PRE_VISIT');

  final String value;

  const InsightsType._(this.value);

  static const values = [preVisit];

  static InsightsType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InsightsType._(value));

  @override
  bool operator ==(other) => other is InsightsType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Pronouns {
  static const heHim = Pronouns._('HE_HIM');
  static const sheHer = Pronouns._('SHE_HER');
  static const theyThem = Pronouns._('THEY_THEM');

  final String value;

  const Pronouns._(this.value);

  static const values = [heHim, sheHer, theyThem];

  static Pronouns fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Pronouns._(value));

  @override
  bool operator ==(other) => other is Pronouns && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MedicalScribeLanguageCode {
  static const enUs = MedicalScribeLanguageCode._('en-US');

  final String value;

  const MedicalScribeLanguageCode._(this.value);

  static const values = [enUs];

  static MedicalScribeLanguageCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeLanguageCode._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeLanguageCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MedicalScribeMediaEncoding {
  static const pcm = MedicalScribeMediaEncoding._('pcm');
  static const flac = MedicalScribeMediaEncoding._('flac');

  final String value;

  const MedicalScribeMediaEncoding._(this.value);

  static const values = [pcm, flac];

  static MedicalScribeMediaEncoding fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeMediaEncoding._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeMediaEncoding && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Output stream from Medical Scribe containing transcript events and errors
///
/// @nodoc
class MedicalScribeOutputStream {
  /// <p/>
  final InternalServerException? internalFailureException;

  /// <p/>
  final MedicalScribeTranscriptEvent? transcriptEvent;

  /// <p/>
  final ValidationException? validationException;

  MedicalScribeOutputStream({
    this.internalFailureException,
    this.transcriptEvent,
    this.validationException,
  });

  factory MedicalScribeOutputStream.fromJson(Map<String, dynamic> json) {
    return MedicalScribeOutputStream(
      internalFailureException: json['internalFailureException'] != null
          ? InternalServerException.fromJson(
              json['internalFailureException'] as Map<String, dynamic>)
          : null,
      transcriptEvent: json['transcriptEvent'] != null
          ? MedicalScribeTranscriptEvent.fromJson(
              json['transcriptEvent'] as Map<String, dynamic>)
          : null,
      validationException: json['validationException'] != null
          ? ValidationException.fromJson(
              json['validationException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final internalFailureException = this.internalFailureException;
    final transcriptEvent = this.transcriptEvent;
    final validationException = this.validationException;
    return {
      if (internalFailureException != null)
        'internalFailureException': internalFailureException,
      if (transcriptEvent != null) 'transcriptEvent': transcriptEvent,
      if (validationException != null)
        'validationException': validationException,
    };
  }
}

/// An event containing transcript data from the Medical Scribe stream
///
/// @nodoc
class MedicalScribeTranscriptEvent {
  /// A segment of the transcript
  final MedicalScribeTranscriptSegment? transcriptSegment;

  MedicalScribeTranscriptEvent({
    this.transcriptSegment,
  });

  factory MedicalScribeTranscriptEvent.fromJson(Map<String, dynamic> json) {
    return MedicalScribeTranscriptEvent(
      transcriptSegment: json['transcriptSegment'] != null
          ? MedicalScribeTranscriptSegment.fromJson(
              json['transcriptSegment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transcriptSegment = this.transcriptSegment;
    return {
      if (transcriptSegment != null) 'transcriptSegment': transcriptSegment,
    };
  }
}

/// A segment of transcript text with timing and channel information
///
/// @nodoc
class MedicalScribeTranscriptSegment {
  /// The offset from audio start when the audio for this segment begins
  final double? audioBeginOffset;

  /// The offset from audio start when the audio for this segment ends
  final double? audioEndOffset;

  /// The channel identifier for this segment
  final String? channelId;

  /// The transcript text content
  final String? content;

  /// Indicates whether this is a partial or final transcript
  final bool? isPartial;

  /// The unique identifier for this segment
  final String? segmentId;

  MedicalScribeTranscriptSegment({
    this.audioBeginOffset,
    this.audioEndOffset,
    this.channelId,
    this.content,
    this.isPartial,
    this.segmentId,
  });

  factory MedicalScribeTranscriptSegment.fromJson(Map<String, dynamic> json) {
    return MedicalScribeTranscriptSegment(
      audioBeginOffset: json['audioBeginOffset'] as double?,
      audioEndOffset: json['audioEndOffset'] as double?,
      channelId: json['channelId'] as String?,
      content: json['content'] as String?,
      isPartial: json['isPartial'] as bool?,
      segmentId: json['segmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioBeginOffset = this.audioBeginOffset;
    final audioEndOffset = this.audioEndOffset;
    final channelId = this.channelId;
    final content = this.content;
    final isPartial = this.isPartial;
    final segmentId = this.segmentId;
    return {
      if (audioBeginOffset != null) 'audioBeginOffset': audioBeginOffset,
      if (audioEndOffset != null) 'audioEndOffset': audioEndOffset,
      if (channelId != null) 'channelId': channelId,
      if (content != null) 'content': content,
      if (isPartial != null) 'isPartial': isPartial,
      if (segmentId != null) 'segmentId': segmentId,
    };
  }
}

/// Input stream for Medical Scribe containing audio and configuration events
///
/// @nodoc
class MedicalScribeInputStream {
  /// <p/>
  final MedicalScribeAudioEvent? audioEvent;

  /// <p/>
  final MedicalScribeConfigurationEvent? configurationEvent;

  /// <p/>
  final MedicalScribeSessionControlEvent? sessionControlEvent;

  MedicalScribeInputStream({
    this.audioEvent,
    this.configurationEvent,
    this.sessionControlEvent,
  });

  Map<String, dynamic> toJson() {
    final audioEvent = this.audioEvent;
    final configurationEvent = this.configurationEvent;
    final sessionControlEvent = this.sessionControlEvent;
    return {
      if (audioEvent != null) 'audioEvent': audioEvent,
      if (configurationEvent != null) 'configurationEvent': configurationEvent,
      if (sessionControlEvent != null)
        'sessionControlEvent': sessionControlEvent,
    };
  }
}

/// An event containing audio data for the Medical Scribe stream
///
/// @nodoc
class MedicalScribeAudioEvent {
  /// The audio data chunk
  final Uint8List audioChunk;

  MedicalScribeAudioEvent({
    required this.audioChunk,
  });

  Map<String, dynamic> toJson() {
    final audioChunk = this.audioChunk;
    return {
      'audioChunk': base64Encode(audioChunk),
    };
  }
}

/// An event for controlling the Medical Scribe session
///
/// @nodoc
class MedicalScribeSessionControlEvent {
  /// The type of session control event
  final MedicalScribeSessionControlEventType? type;

  MedicalScribeSessionControlEvent({
    this.type,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type.value,
    };
  }
}

/// An event containing configuration for the Medical Scribe session
///
/// @nodoc
class MedicalScribeConfigurationEvent {
  /// Settings for actions to perform after the stream ends
  final MedicalScribePostStreamActionSettings postStreamActionSettings;

  /// Channel definitions for the audio stream
  final List<MedicalScribeChannelDefinition>? channelDefinitions;

  /// Context information about the clinical encounter
  final EncounterContext? encounterContext;

  MedicalScribeConfigurationEvent({
    required this.postStreamActionSettings,
    this.channelDefinitions,
    this.encounterContext,
  });

  Map<String, dynamic> toJson() {
    final postStreamActionSettings = this.postStreamActionSettings;
    final channelDefinitions = this.channelDefinitions;
    final encounterContext = this.encounterContext;
    return {
      'postStreamActionSettings': postStreamActionSettings,
      if (channelDefinitions != null) 'channelDefinitions': channelDefinitions,
      if (encounterContext != null) 'encounterContext': encounterContext,
    };
  }
}

/// Settings for actions to perform after the audio stream ends
///
/// @nodoc
class MedicalScribePostStreamActionSettings {
  /// Settings for clinical note generation
  final ClinicalNoteGenerationSettings clinicalNoteGenerationSettings;

  /// <p/>
  final String outputS3Uri;

  MedicalScribePostStreamActionSettings({
    required this.clinicalNoteGenerationSettings,
    required this.outputS3Uri,
  });

  Map<String, dynamic> toJson() {
    final clinicalNoteGenerationSettings = this.clinicalNoteGenerationSettings;
    final outputS3Uri = this.outputS3Uri;
    return {
      'clinicalNoteGenerationSettings': clinicalNoteGenerationSettings,
      'outputS3Uri': outputS3Uri,
    };
  }
}

/// Context information about the clinical encounter
///
/// @nodoc
class EncounterContext {
  /// Unstructured context information in markdown format
  final String? unstructuredContext;

  EncounterContext({
    this.unstructuredContext,
  });

  Map<String, dynamic> toJson() {
    final unstructuredContext = this.unstructuredContext;
    return {
      if (unstructuredContext != null)
        'unstructuredContext': unstructuredContext,
    };
  }
}

/// Defines a channel in the audio stream
///
/// @nodoc
class MedicalScribeChannelDefinition {
  /// The channel identifier
  final int channelId;

  /// The role of the participant on this channel
  final MedicalScribeParticipantRole participantRole;

  MedicalScribeChannelDefinition({
    required this.channelId,
    required this.participantRole,
  });

  factory MedicalScribeChannelDefinition.fromJson(Map<String, dynamic> json) {
    return MedicalScribeChannelDefinition(
      channelId: (json['channelId'] as int?) ?? 0,
      participantRole: MedicalScribeParticipantRole.fromString(
          (json['participantRole'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final participantRole = this.participantRole;
    return {
      'channelId': channelId,
      'participantRole': participantRole.value,
    };
  }
}

/// @nodoc
class MedicalScribeParticipantRole {
  static const patient = MedicalScribeParticipantRole._('PATIENT');
  static const clinician = MedicalScribeParticipantRole._('CLINICIAN');

  final String value;

  const MedicalScribeParticipantRole._(this.value);

  static const values = [patient, clinician];

  static MedicalScribeParticipantRole fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeParticipantRole._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeParticipantRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Settings for generating clinical notes from the audio stream
///
/// @nodoc
class ClinicalNoteGenerationSettings {
  /// Settings for the note template to use
  final NoteTemplateSettings noteTemplateSettings;

  ClinicalNoteGenerationSettings({
    required this.noteTemplateSettings,
  });

  Map<String, dynamic> toJson() {
    final noteTemplateSettings = this.noteTemplateSettings;
    return {
      'noteTemplateSettings': noteTemplateSettings,
    };
  }
}

/// Settings for the note template to use for clinical note generation
///
/// @nodoc
class NoteTemplateSettings {
  /// <p/>
  final CustomTemplate? customTemplate;

  /// <p/>
  final ManagedTemplate? managedTemplate;

  NoteTemplateSettings({
    this.customTemplate,
    this.managedTemplate,
  });

  Map<String, dynamic> toJson() {
    final customTemplate = this.customTemplate;
    final managedTemplate = this.managedTemplate;
    return {
      if (customTemplate != null) 'customTemplate': customTemplate,
      if (managedTemplate != null) 'managedTemplate': managedTemplate,
    };
  }
}

/// Configuration for using a managed note template
///
/// @nodoc
class ManagedTemplate {
  /// The type of managed template to use
  final ManagedNoteTemplate templateType;

  ManagedTemplate({
    required this.templateType,
  });

  Map<String, dynamic> toJson() {
    final templateType = this.templateType;
    return {
      'templateType': templateType.value,
    };
  }
}

/// Configuration for using a custom note template with specific instructions
///
/// @nodoc
class CustomTemplate {
  /// Custom instructions for each section of the template
  final List<TemplateSectionInstruction> templateInstructions;

  /// The base template type to customize
  final CustomTemplateBase templateType;

  CustomTemplate({
    required this.templateInstructions,
    required this.templateType,
  });

  Map<String, dynamic> toJson() {
    final templateInstructions = this.templateInstructions;
    final templateType = this.templateType;
    return {
      'templateInstructions': templateInstructions,
      'templateType': templateType.value,
    };
  }
}

/// @nodoc
class CustomTemplateBase {
  static const historyAndPhysical =
      CustomTemplateBase._('HISTORY_AND_PHYSICAL');
  static const girpp = CustomTemplateBase._('GIRPP');
  static const dap = CustomTemplateBase._('DAP');
  static const sirp = CustomTemplateBase._('SIRP');
  static const birp = CustomTemplateBase._('BIRP');
  static const behavioralSoap = CustomTemplateBase._('BEHAVIORAL_SOAP');

  final String value;

  const CustomTemplateBase._(this.value);

  static const values = [
    historyAndPhysical,
    girpp,
    dap,
    sirp,
    birp,
    behavioralSoap
  ];

  static CustomTemplateBase fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomTemplateBase._(value));

  @override
  bool operator ==(other) =>
      other is CustomTemplateBase && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Instructions for generating a specific section of a clinical note
///
/// @nodoc
class TemplateSectionInstruction {
  /// The header for this section of the template
  final String sectionHeader;

  /// The instruction for generating this section
  final String sectionInstruction;

  TemplateSectionInstruction({
    required this.sectionHeader,
    required this.sectionInstruction,
  });

  Map<String, dynamic> toJson() {
    final sectionHeader = this.sectionHeader;
    final sectionInstruction = this.sectionInstruction;
    return {
      'sectionHeader': sectionHeader,
      'sectionInstruction': sectionInstruction,
    };
  }
}

/// @nodoc
class ManagedNoteTemplate {
  static const historyAndPhysical =
      ManagedNoteTemplate._('HISTORY_AND_PHYSICAL');
  static const girpp = ManagedNoteTemplate._('GIRPP');
  static const dap = ManagedNoteTemplate._('DAP');
  static const sirp = ManagedNoteTemplate._('SIRP');
  static const birp = ManagedNoteTemplate._('BIRP');
  static const behavioralSoap = ManagedNoteTemplate._('BEHAVIORAL_SOAP');
  static const physicalSoap = ManagedNoteTemplate._('PHYSICAL_SOAP');

  final String value;

  const ManagedNoteTemplate._(this.value);

  static const values = [
    historyAndPhysical,
    girpp,
    dap,
    sirp,
    birp,
    behavioralSoap,
    physicalSoap
  ];

  static ManagedNoteTemplate fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ManagedNoteTemplate._(value));

  @override
  bool operator ==(other) =>
      other is ManagedNoteTemplate && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MedicalScribeSessionControlEventType {
  static const endOfSession =
      MedicalScribeSessionControlEventType._('END_OF_SESSION');

  final String value;

  const MedicalScribeSessionControlEventType._(this.value);

  static const values = [endOfSession];

  static MedicalScribeSessionControlEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeSessionControlEventType._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeSessionControlEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Complete subscription resource data.
///
/// @nodoc
class SubscriptionDescription {
  /// <p/>
  final String arn;

  /// <p/>
  final DateTime createdAt;

  /// <p/>
  final String domainId;

  /// <p/>
  final DateTime lastUpdatedAt;

  /// <p/>
  final SubscriptionStatus status;

  /// <p/>
  final String subscriptionId;

  /// <p/>
  final DateTime? activatedAt;

  /// <p/>
  final DateTime? deactivatedAt;

  SubscriptionDescription({
    required this.arn,
    required this.createdAt,
    required this.domainId,
    required this.lastUpdatedAt,
    required this.status,
    required this.subscriptionId,
    this.activatedAt,
    this.deactivatedAt,
  });

  factory SubscriptionDescription.fromJson(Map<String, dynamic> json) {
    return SubscriptionDescription(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      domainId: (json['domainId'] as String?) ?? '',
      lastUpdatedAt: nonNullableTimeStampFromJson(json['lastUpdatedAt'] ?? 0),
      status: SubscriptionStatus.fromString((json['status'] as String?) ?? ''),
      subscriptionId: (json['subscriptionId'] as String?) ?? '',
      activatedAt: timeStampFromJson(json['activatedAt']),
      deactivatedAt: timeStampFromJson(json['deactivatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainId = this.domainId;
    final lastUpdatedAt = this.lastUpdatedAt;
    final status = this.status;
    final subscriptionId = this.subscriptionId;
    final activatedAt = this.activatedAt;
    final deactivatedAt = this.deactivatedAt;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'domainId': domainId,
      'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'status': status.value,
      'subscriptionId': subscriptionId,
      if (activatedAt != null) 'activatedAt': unixTimestampToJson(activatedAt),
      if (deactivatedAt != null)
        'deactivatedAt': unixTimestampToJson(deactivatedAt),
    };
  }
}

/// @nodoc
class SubscriptionStatus {
  static const active = SubscriptionStatus._('ACTIVE');
  static const inactive = SubscriptionStatus._('INACTIVE');
  static const deleted = SubscriptionStatus._('DELETED');

  final String value;

  const SubscriptionStatus._(this.value);

  static const values = [active, inactive, deleted];

  static SubscriptionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SubscriptionStatus._(value));

  @override
  bool operator ==(other) =>
      other is SubscriptionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a Domain.
///
/// @nodoc
class DomainSummary {
  /// <p/>
  final String arn;

  /// The timestamp when the Domain was created.
  final DateTime createdAt;

  /// The unique identifier of the Domain.
  final String domainId;

  /// <p/>
  final String name;

  /// <p/>
  final DomainStatus status;

  DomainSummary({
    required this.arn,
    required this.createdAt,
    required this.domainId,
    required this.name,
    required this.status,
  });

  factory DomainSummary.fromJson(Map<String, dynamic> json) {
    return DomainSummary(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      domainId: (json['domainId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: DomainStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainId = this.domainId;
    final name = this.name;
    final status = this.status;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'domainId': domainId,
      'name': name,
      'status': status.value,
    };
  }
}

/// @nodoc
class DomainStatus {
  static const active = DomainStatus._('ACTIVE');
  static const deleting = DomainStatus._('DELETING');
  static const deleted = DomainStatus._('DELETED');

  final String value;

  const DomainStatus._(this.value);

  static const values = [active, deleting, deleted];

  static DomainStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DomainStatus._(value));

  @override
  bool operator ==(other) => other is DomainStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class JobStatus {
  static const submitted = JobStatus._('SUBMITTED');
  static const inProgress = JobStatus._('IN_PROGRESS');
  static const failed = JobStatus._('FAILED');
  static const succeeded = JobStatus._('SUCCEEDED');

  final String value;

  const JobStatus._(this.value);

  static const values = [submitted, inProgress, failed, succeeded];

  static JobStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobStatus._(value));

  @override
  bool operator ==(other) => other is JobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Output of patient insights job
///
/// @nodoc
class InsightsOutput {
  /// <p/>
  final String uri;

  InsightsOutput({
    required this.uri,
  });

  factory InsightsOutput.fromJson(Map<String, dynamic> json) {
    return InsightsOutput(
      uri: (json['uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'uri': uri,
    };
  }
}

/// Detailed information about a Medical Scribe listening session
///
/// @nodoc
class MedicalScribeListeningSessionDetails {
  /// Channel definitions for the audio stream
  final List<MedicalScribeChannelDefinition>? channelDefinitions;

  /// The Domain identifier
  final String? domainId;

  /// Indicates whether encounter context was provided
  final bool? encounterContextProvided;

  /// The Language Code for the audio in the session
  final MedicalScribeLanguageCode? languageCode;

  /// The encoding for the input audio
  final MedicalScribeMediaEncoding? mediaEncoding;

  /// The sample rate of the input audio
  final int? mediaSampleRateHertz;

  /// Results of post-stream actions
  final MedicalScribePostStreamActionsResult? postStreamActionResult;

  /// Settings for post-stream actions
  final MedicalScribePostStreamActionSettingsResponse? postStreamActionSettings;

  /// The Session identifier
  final String? sessionId;

  /// The timestamp when the stream was created
  final DateTime? streamCreationTime;

  /// The timestamp when the stream ended
  final DateTime? streamEndTime;

  /// The current status of the stream
  final MedicalScribeStreamStatus? streamStatus;

  /// The Subscription identifier
  final String? subscriptionId;

  MedicalScribeListeningSessionDetails({
    this.channelDefinitions,
    this.domainId,
    this.encounterContextProvided,
    this.languageCode,
    this.mediaEncoding,
    this.mediaSampleRateHertz,
    this.postStreamActionResult,
    this.postStreamActionSettings,
    this.sessionId,
    this.streamCreationTime,
    this.streamEndTime,
    this.streamStatus,
    this.subscriptionId,
  });

  factory MedicalScribeListeningSessionDetails.fromJson(
      Map<String, dynamic> json) {
    return MedicalScribeListeningSessionDetails(
      channelDefinitions: (json['channelDefinitions'] as List?)
          ?.nonNulls
          .map((e) => MedicalScribeChannelDefinition.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      domainId: json['domainId'] as String?,
      encounterContextProvided: json['encounterContextProvided'] as bool?,
      languageCode: (json['languageCode'] as String?)
          ?.let(MedicalScribeLanguageCode.fromString),
      mediaEncoding: (json['mediaEncoding'] as String?)
          ?.let(MedicalScribeMediaEncoding.fromString),
      mediaSampleRateHertz: json['mediaSampleRateHertz'] as int?,
      postStreamActionResult: json['postStreamActionResult'] != null
          ? MedicalScribePostStreamActionsResult.fromJson(
              json['postStreamActionResult'] as Map<String, dynamic>)
          : null,
      postStreamActionSettings: json['postStreamActionSettings'] != null
          ? MedicalScribePostStreamActionSettingsResponse.fromJson(
              json['postStreamActionSettings'] as Map<String, dynamic>)
          : null,
      sessionId: json['sessionId'] as String?,
      streamCreationTime: timeStampFromJson(json['streamCreationTime']),
      streamEndTime: timeStampFromJson(json['streamEndTime']),
      streamStatus: (json['streamStatus'] as String?)
          ?.let(MedicalScribeStreamStatus.fromString),
      subscriptionId: json['subscriptionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelDefinitions = this.channelDefinitions;
    final domainId = this.domainId;
    final encounterContextProvided = this.encounterContextProvided;
    final languageCode = this.languageCode;
    final mediaEncoding = this.mediaEncoding;
    final mediaSampleRateHertz = this.mediaSampleRateHertz;
    final postStreamActionResult = this.postStreamActionResult;
    final postStreamActionSettings = this.postStreamActionSettings;
    final sessionId = this.sessionId;
    final streamCreationTime = this.streamCreationTime;
    final streamEndTime = this.streamEndTime;
    final streamStatus = this.streamStatus;
    final subscriptionId = this.subscriptionId;
    return {
      if (channelDefinitions != null) 'channelDefinitions': channelDefinitions,
      if (domainId != null) 'domainId': domainId,
      if (encounterContextProvided != null)
        'encounterContextProvided': encounterContextProvided,
      if (languageCode != null) 'languageCode': languageCode.value,
      if (mediaEncoding != null) 'mediaEncoding': mediaEncoding.value,
      if (mediaSampleRateHertz != null)
        'mediaSampleRateHertz': mediaSampleRateHertz,
      if (postStreamActionResult != null)
        'postStreamActionResult': postStreamActionResult,
      if (postStreamActionSettings != null)
        'postStreamActionSettings': postStreamActionSettings,
      if (sessionId != null) 'sessionId': sessionId,
      if (streamCreationTime != null)
        'streamCreationTime': unixTimestampToJson(streamCreationTime),
      if (streamEndTime != null)
        'streamEndTime': unixTimestampToJson(streamEndTime),
      if (streamStatus != null) 'streamStatus': streamStatus.value,
      if (subscriptionId != null) 'subscriptionId': subscriptionId,
    };
  }
}

/// Response containing settings for post-stream actions
///
/// @nodoc
class MedicalScribePostStreamActionSettingsResponse {
  /// Settings for clinical note generation
  final ClinicalNoteGenerationSettingsResponse clinicalNoteGenerationSettings;

  /// <p/>
  final String outputS3Uri;

  MedicalScribePostStreamActionSettingsResponse({
    required this.clinicalNoteGenerationSettings,
    required this.outputS3Uri,
  });

  factory MedicalScribePostStreamActionSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return MedicalScribePostStreamActionSettingsResponse(
      clinicalNoteGenerationSettings:
          ClinicalNoteGenerationSettingsResponse.fromJson(
              (json['clinicalNoteGenerationSettings']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      outputS3Uri: (json['outputS3Uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final clinicalNoteGenerationSettings = this.clinicalNoteGenerationSettings;
    final outputS3Uri = this.outputS3Uri;
    return {
      'clinicalNoteGenerationSettings': clinicalNoteGenerationSettings,
      'outputS3Uri': outputS3Uri,
    };
  }
}

/// Results of post-stream actions performed after the audio stream ended
///
/// @nodoc
class MedicalScribePostStreamActionsResult {
  /// Results of clinical note generation
  final ClinicalNoteGenerationResult? clinicalNoteGenerationResult;

  MedicalScribePostStreamActionsResult({
    this.clinicalNoteGenerationResult,
  });

  factory MedicalScribePostStreamActionsResult.fromJson(
      Map<String, dynamic> json) {
    return MedicalScribePostStreamActionsResult(
      clinicalNoteGenerationResult: json['clinicalNoteGenerationResult'] != null
          ? ClinicalNoteGenerationResult.fromJson(
              json['clinicalNoteGenerationResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clinicalNoteGenerationResult = this.clinicalNoteGenerationResult;
    return {
      if (clinicalNoteGenerationResult != null)
        'clinicalNoteGenerationResult': clinicalNoteGenerationResult,
    };
  }
}

/// @nodoc
class MedicalScribeStreamStatus {
  static const inProgress = MedicalScribeStreamStatus._('IN_PROGRESS');
  static const paused = MedicalScribeStreamStatus._('PAUSED');
  static const failed = MedicalScribeStreamStatus._('FAILED');
  static const completed = MedicalScribeStreamStatus._('COMPLETED');

  final String value;

  const MedicalScribeStreamStatus._(this.value);

  static const values = [inProgress, paused, failed, completed];

  static MedicalScribeStreamStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeStreamStatus._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeStreamStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Results of clinical note generation including note, transcript, and summary
///
/// @nodoc
class ClinicalNoteGenerationResult {
  /// Details about the generated after visit summary
  final ArtifactDetails? afterVisitSummaryResult;

  /// Details about the generated clinical note
  final ArtifactDetails? noteResult;

  /// Details about the generated transcript
  final ArtifactDetails? transcriptResult;

  ClinicalNoteGenerationResult({
    this.afterVisitSummaryResult,
    this.noteResult,
    this.transcriptResult,
  });

  factory ClinicalNoteGenerationResult.fromJson(Map<String, dynamic> json) {
    return ClinicalNoteGenerationResult(
      afterVisitSummaryResult: json['afterVisitSummaryResult'] != null
          ? ArtifactDetails.fromJson(
              json['afterVisitSummaryResult'] as Map<String, dynamic>)
          : null,
      noteResult: json['noteResult'] != null
          ? ArtifactDetails.fromJson(json['noteResult'] as Map<String, dynamic>)
          : null,
      transcriptResult: json['transcriptResult'] != null
          ? ArtifactDetails.fromJson(
              json['transcriptResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final afterVisitSummaryResult = this.afterVisitSummaryResult;
    final noteResult = this.noteResult;
    final transcriptResult = this.transcriptResult;
    return {
      if (afterVisitSummaryResult != null)
        'afterVisitSummaryResult': afterVisitSummaryResult,
      if (noteResult != null) 'noteResult': noteResult,
      if (transcriptResult != null) 'transcriptResult': transcriptResult,
    };
  }
}

/// Details about a generated artifact including location and status
///
/// @nodoc
class ArtifactDetails {
  /// The reason for failure if the artifact generation failed
  final String? failureReason;

  /// <p/>
  final String? outputLocation;

  /// The generation status of the artifact
  final PostStreamArtifactGenerationStatus? status;

  ArtifactDetails({
    this.failureReason,
    this.outputLocation,
    this.status,
  });

  factory ArtifactDetails.fromJson(Map<String, dynamic> json) {
    return ArtifactDetails(
      failureReason: json['failureReason'] as String?,
      outputLocation: json['outputLocation'] as String?,
      status: (json['status'] as String?)
          ?.let(PostStreamArtifactGenerationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final outputLocation = this.outputLocation;
    final status = this.status;
    return {
      if (failureReason != null) 'failureReason': failureReason,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class PostStreamArtifactGenerationStatus {
  static const inProgress = PostStreamArtifactGenerationStatus._('IN_PROGRESS');
  static const failed = PostStreamArtifactGenerationStatus._('FAILED');
  static const completed = PostStreamArtifactGenerationStatus._('COMPLETED');

  final String value;

  const PostStreamArtifactGenerationStatus._(this.value);

  static const values = [inProgress, failed, completed];

  static PostStreamArtifactGenerationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PostStreamArtifactGenerationStatus._(value));

  @override
  bool operator ==(other) =>
      other is PostStreamArtifactGenerationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Response containing settings for clinical note generation
///
/// @nodoc
class ClinicalNoteGenerationSettingsResponse {
  /// Settings for the note template used
  final NoteTemplateSettingsResponse? noteTemplateSettings;

  ClinicalNoteGenerationSettingsResponse({
    this.noteTemplateSettings,
  });

  factory ClinicalNoteGenerationSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return ClinicalNoteGenerationSettingsResponse(
      noteTemplateSettings: json['noteTemplateSettings'] != null
          ? NoteTemplateSettingsResponse.fromJson(
              json['noteTemplateSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final noteTemplateSettings = this.noteTemplateSettings;
    return {
      if (noteTemplateSettings != null)
        'noteTemplateSettings': noteTemplateSettings,
    };
  }
}

/// Response containing note template settings
///
/// @nodoc
class NoteTemplateSettingsResponse {
  /// <p/>
  final CustomTemplateResponse? customTemplate;

  /// <p/>
  final ManagedTemplateResponse? managedTemplate;

  NoteTemplateSettingsResponse({
    this.customTemplate,
    this.managedTemplate,
  });

  factory NoteTemplateSettingsResponse.fromJson(Map<String, dynamic> json) {
    return NoteTemplateSettingsResponse(
      customTemplate: json['customTemplate'] != null
          ? CustomTemplateResponse.fromJson(
              json['customTemplate'] as Map<String, dynamic>)
          : null,
      managedTemplate: json['managedTemplate'] != null
          ? ManagedTemplateResponse.fromJson(
              json['managedTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customTemplate = this.customTemplate;
    final managedTemplate = this.managedTemplate;
    return {
      if (customTemplate != null) 'customTemplate': customTemplate,
      if (managedTemplate != null) 'managedTemplate': managedTemplate,
    };
  }
}

/// Response containing managed template information
///
/// @nodoc
class ManagedTemplateResponse {
  /// The type of managed template used
  final ManagedNoteTemplate? templateType;

  ManagedTemplateResponse({
    this.templateType,
  });

  factory ManagedTemplateResponse.fromJson(Map<String, dynamic> json) {
    return ManagedTemplateResponse(
      templateType: (json['templateType'] as String?)
          ?.let(ManagedNoteTemplate.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final templateType = this.templateType;
    return {
      if (templateType != null) 'templateType': templateType.value,
    };
  }
}

/// Response containing custom template information
///
/// @nodoc
class CustomTemplateResponse {
  /// The base template type that was customized
  final CustomTemplateBase? templateType;

  CustomTemplateResponse({
    this.templateType,
  });

  factory CustomTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CustomTemplateResponse(
      templateType:
          (json['templateType'] as String?)?.let(CustomTemplateBase.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final templateType = this.templateType;
    return {
      if (templateType != null) 'templateType': templateType.value,
    };
  }
}

/// Encryption context for a Domain.
///
/// @nodoc
class EncryptionContext {
  /// The type of encryption key used.
  final EncryptionType encryptionType;

  /// The ARN of the KMS key. Only present when encryptionType is
  /// CUSTOMER_MANAGED_KEY.
  final String? kmsKeyArn;

  EncryptionContext({
    required this.encryptionType,
    this.kmsKeyArn,
  });

  factory EncryptionContext.fromJson(Map<String, dynamic> json) {
    return EncryptionContext(
      encryptionType:
          EncryptionType.fromString((json['encryptionType'] as String?) ?? ''),
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionType = this.encryptionType;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'encryptionType': encryptionType.value,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// Configuration for the Domain web application, including Identity Center
/// settings. If provided, all fields are required.
///
/// @nodoc
class WebAppConfiguration {
  /// ARN of the IAM role used for EHR operations.
  final String ehrRole;

  /// The Identity Center application ID associated with this Domain.
  final String idcApplicationId;

  /// The AWS region where Identity Center is configured.
  final String idcRegion;

  WebAppConfiguration({
    required this.ehrRole,
    required this.idcApplicationId,
    required this.idcRegion,
  });

  factory WebAppConfiguration.fromJson(Map<String, dynamic> json) {
    return WebAppConfiguration(
      ehrRole: (json['ehrRole'] as String?) ?? '',
      idcApplicationId: (json['idcApplicationId'] as String?) ?? '',
      idcRegion: (json['idcRegion'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final ehrRole = this.ehrRole;
    final idcApplicationId = this.idcApplicationId;
    final idcRegion = this.idcRegion;
    return {
      'ehrRole': ehrRole,
      'idcApplicationId': idcApplicationId,
      'idcRegion': idcRegion,
    };
  }
}

/// @nodoc
class EncryptionType {
  static const awsOwnedKey = EncryptionType._('AWS_OWNED_KEY');
  static const customerManagedKey = EncryptionType._('CUSTOMER_MANAGED_KEY');

  final String value;

  const EncryptionType._(this.value);

  static const values = [awsOwnedKey, customerManagedKey];

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

/// Input configuration for creating a web application. Used only in
/// CreateDomain operation input.
///
/// @nodoc
class CreateWebAppConfiguration {
  /// ARN of the IAM role used for EHR operations.
  final String ehrRole;

  /// The Identity Center instance ID to use for creating the application.
  final String idcInstanceId;

  /// The AWS region where Identity Center is configured.
  final String idcRegion;

  CreateWebAppConfiguration({
    required this.ehrRole,
    required this.idcInstanceId,
    required this.idcRegion,
  });

  Map<String, dynamic> toJson() {
    final ehrRole = this.ehrRole;
    final idcInstanceId = this.idcInstanceId;
    final idcRegion = this.idcRegion;
    return {
      'ehrRole': ehrRole,
      'idcInstanceId': idcInstanceId,
      'idcRegion': idcRegion,
    };
  }
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(message: message),
};
