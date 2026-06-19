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

/// The next generation of AWS Resilience Hub is the single location in AWS
/// where you assess and improve the resilience of your critical applications.
/// It helps Site Reliability Engineers (SREs) and development teams proactively
/// reason about resilience at scale — identifying failure modes, discovering
/// hidden dependencies, and report on progress across the enterprise.
class ResiliencehubV2 {
  final _s.RestJsonProtocol _protocol;
  ResiliencehubV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'resiliencehub',
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

  /// Creates a resilience assertion for a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [text] :
  /// The text content of the assertion.
  Future<CreateAssertionResponse> createAssertion({
    required String serviceArn,
    required String text,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'serviceArn': serviceArn,
      'text': text,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/create-assertion',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAssertionResponse.fromJson(response);
  }

  /// Creates an input source for a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  Future<CreateInputSourceResponse> createInputSource({
    required ResourceConfiguration resourceConfiguration,
    required String serviceArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'resourceConfiguration': resourceConfiguration,
      'serviceArn': serviceArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/create-input-source',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInputSourceResponse.fromJson(response);
  }

  /// Creates a resilience policy that defines availability and disaster
  /// recovery requirements.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [availabilitySlo] :
  /// The availability SLO for the resilience policy.
  ///
  /// Parameter [dataRecovery] :
  /// The data recovery targets for the resilience policy.
  ///
  /// Parameter [multiAz] :
  /// The multi-AZ disaster recovery targets for the resilience policy.
  ///
  /// Parameter [multiRegion] :
  /// The multi-Region disaster recovery targets for the resilience policy.
  Future<CreatePolicyResponse> createPolicy({
    required String name,
    AvailabilitySlo? availabilitySlo,
    String? clientToken,
    DataRecoveryTargets? dataRecovery,
    String? description,
    String? kmsKeyId,
    MultiAzTargets? multiAz,
    MultiRegionTargets? multiRegion,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (availabilitySlo != null) 'availabilitySlo': availabilitySlo,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dataRecovery != null) 'dataRecovery': dataRecovery,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (multiAz != null) 'multiAz': multiAz,
      if (multiRegion != null) 'multiRegion': multiRegion,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/create-policy',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePolicyResponse.fromJson(response);
  }

  /// On-demand report creation. Idempotent — duplicate requests with same
  /// clientToken return existing result.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportType] :
  /// The type of report to generate.
  Future<CreateReportResponse> createReport({
    required ReportType reportType,
    required String serviceArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'reportType': reportType.value,
      'serviceArn': serviceArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/create-report',
      exceptionFnMap: _exceptionFns,
    );
    return CreateReportResponse.fromJson(response);
  }

  /// Creates a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [permissionModel] :
  /// The permission model for the service.
  ///
  /// Parameter [regions] :
  /// The AWS Regions where the service operates.
  ///
  /// Parameter [associatedSystems] :
  /// The systems to associate with the service.
  Future<CreateServiceResponse> createService({
    required String name,
    required PermissionModel permissionModel,
    required List<String> regions,
    List<AssociatedSystem>? associatedSystems,
    String? clientToken,
    DependencyDiscoveryInput? dependencyDiscovery,
    String? description,
    String? kmsKeyId,
    String? policyArn,
    ServiceReportConfiguration? reportConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'permissionModel': permissionModel,
      'regions': regions,
      if (associatedSystems != null) 'associatedSystems': associatedSystems,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dependencyDiscovery != null)
        'dependencyDiscovery': dependencyDiscovery.value,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (policyArn != null) 'policyArn': policyArn,
      if (reportConfiguration != null)
        'reportConfiguration': reportConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/create-service',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceResponse.fromJson(response);
  }

  /// Creates a service function within a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [criticality] :
  /// The criticality level of the service function.
  Future<CreateServiceFunctionResponse> createServiceFunction({
    required ServiceFunctionCriticality criticality,
    required String name,
    required String serviceArn,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'criticality': criticality.value,
      'name': name,
      'serviceArn': serviceArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/create-service-function',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceFunctionResponse.fromJson(response);
  }

  /// Associates resources with a service function.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resources] :
  /// The list of resources to associate with the service function.
  ///
  /// Parameter [serviceFunctionId] :
  /// The identifier of the service function to associate resources with.
  Future<CreateServiceFunctionResourcesResponse>
      createServiceFunctionResources({
    required List<String> resources,
    required String serviceArn,
    required String serviceFunctionId,
  }) async {
    final $payload = <String, dynamic>{
      'resources': resources,
      'serviceArn': serviceArn,
      'serviceFunctionId': serviceFunctionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/create-service-function-resources',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceFunctionResourcesResponse.fromJson(response);
  }

  /// Creates a system that represents a logical grouping of services.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sharingEnabled] :
  /// Indicates whether cross-account sharing is enabled for the system.
  Future<CreateSystemResponse> createSystem({
    required String name,
    String? clientToken,
    String? description,
    String? kmsKeyId,
    bool? sharingEnabled,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (sharingEnabled != null) 'sharingEnabled': sharingEnabled,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/create-system',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSystemResponse.fromJson(response);
  }

  /// Creates a user journey within a system.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  Future<CreateUserJourneyResponse> createUserJourney({
    required String name,
    required String systemArn,
    String? clientToken,
    String? description,
    String? policyArn,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'systemArn': systemArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (policyArn != null) 'policyArn': policyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/create-user-journey',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserJourneyResponse.fromJson(response);
  }

  /// Deletes a resilience assertion from a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assertionId] :
  /// The unique identifier of the assertion to delete.
  Future<DeleteAssertionResponse> deleteAssertion({
    required String assertionId,
    required String serviceArn,
  }) async {
    final $payload = <String, dynamic>{
      'assertionId': assertionId,
      'serviceArn': serviceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/delete-assertion',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAssertionResponse.fromJson(response);
  }

  /// Deletes an input source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputSourceId] :
  /// The identifier of the input source to delete.
  Future<DeleteInputSourceResponse> deleteInputSource({
    required String inputSourceId,
    required String serviceArn,
  }) async {
    final $payload = <String, dynamic>{
      'inputSourceId': inputSourceId,
      'serviceArn': serviceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/delete-input-source',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInputSourceResponse.fromJson(response);
  }

  /// Deletes a resilience policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<DeletePolicyResponse> deletePolicy({
    required String policyArn,
  }) async {
    final $payload = <String, dynamic>{
      'policyArn': policyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/delete-policy',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePolicyResponse.fromJson(response);
  }

  /// Deletes a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<DeleteServiceResponse> deleteService({
    required String serviceArn,
  }) async {
    final $payload = <String, dynamic>{
      'serviceArn': serviceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/delete-service',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteServiceResponse.fromJson(response);
  }

  /// Deletes a service function.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceFunctionId] :
  /// The identifier of the service function to delete.
  Future<DeleteServiceFunctionResponse> deleteServiceFunction({
    required String serviceArn,
    required String serviceFunctionId,
  }) async {
    final $payload = <String, dynamic>{
      'serviceArn': serviceArn,
      'serviceFunctionId': serviceFunctionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/delete-function',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteServiceFunctionResponse.fromJson(response);
  }

  /// Removes resources from a service function.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resources] :
  /// The list of resources to remove from the service function.
  ///
  /// Parameter [serviceFunctionId] :
  /// The identifier of the service function to remove resources from.
  Future<DeleteServiceFunctionResourcesResponse>
      deleteServiceFunctionResources({
    required List<String> resources,
    required String serviceArn,
    required String serviceFunctionId,
  }) async {
    final $payload = <String, dynamic>{
      'resources': resources,
      'serviceArn': serviceArn,
      'serviceFunctionId': serviceFunctionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/delete-service-function-resources',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteServiceFunctionResourcesResponse.fromJson(response);
  }

  /// Deletes a system.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<DeleteSystemResponse> deleteSystem({
    required String systemArn,
  }) async {
    final $payload = <String, dynamic>{
      'systemArn': systemArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/delete-system',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSystemResponse.fromJson(response);
  }

  /// Deletes a user journey.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userJourneyId] :
  /// The identifier of the user journey to delete.
  Future<DeleteUserJourneyResponse> deleteUserJourney({
    required String systemArn,
    required String userJourneyId,
  }) async {
    final $payload = <String, dynamic>{
      'systemArn': systemArn,
      'userJourneyId': userJourneyId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/delete-user-journey',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteUserJourneyResponse.fromJson(response);
  }

  /// Retrieves a finding by findingId.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [findingId] :
  /// The unique identifier of the finding to retrieve.
  Future<GetFailureModeFindingResponse> getFailureModeFinding({
    required String findingId,
    required String serviceArn,
  }) async {
    final $query = <String, List<String>>{
      'findingId': [findingId],
      'serviceArn': [serviceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/get-failure-mode-finding',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFailureModeFindingResponse.fromJson(response);
  }

  /// Retrieves a resilience policy by ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<GetPolicyResponse> getPolicy({
    required String policyArn,
  }) async {
    final $query = <String, List<String>>{
      'policyArn': [policyArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/get-policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyResponse.fromJson(response);
  }

  /// Retrieves a service by ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<GetServiceResponse> getService({
    required String serviceArn,
  }) async {
    final $query = <String, List<String>>{
      'serviceArn': [serviceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/get-service',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceResponse.fromJson(response);
  }

  /// Retrieves a system by ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<GetSystemResponse> getSystem({
    required String systemArn,
  }) async {
    final $query = <String, List<String>>{
      'systemArn': [systemArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/get-system',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSystemResponse.fromJson(response);
  }

  /// Retrieves a user journey.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userJourneyId] :
  /// The identifier of the user journey to retrieve.
  Future<GetUserJourneyResponse> getUserJourney({
    required String systemArn,
    required String userJourneyId,
  }) async {
    final $query = <String, List<String>>{
      'systemArn': [systemArn],
      'userJourneyId': [userJourneyId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/get-user-journey',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetUserJourneyResponse.fromJson(response);
  }

  /// Imports a V1 app into the V2 resource model, creating a service with the
  /// same name.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [associatedSystems] :
  /// The systems to associate with the imported service.
  ///
  /// Parameter [skipManuallyAddedResources] :
  /// Whether to skip manually added resources during import.
  Future<ImportAppResponse> importApp({
    required String v1AppArn,
    List<AssociatedSystem>? associatedSystems,
    String? clientToken,
    String? kmsKeyId,
    String? policyArn,
    bool? skipManuallyAddedResources,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'v1AppArn': v1AppArn,
      if (associatedSystems != null) 'associatedSystems': associatedSystems,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (policyArn != null) 'policyArn': policyArn,
      if (skipManuallyAddedResources != null)
        'skipManuallyAddedResources': skipManuallyAddedResources,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/import-app',
      exceptionFnMap: _exceptionFns,
    );
    return ImportAppResponse.fromJson(response);
  }

  /// Imports a V1 policy into V2, mapping RTO/RPO values from V1 scenarios.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [availabilitySlo] :
  /// The availability SLO to set on the imported policy.
  ///
  /// Parameter [multiAzDisasterRecoveryApproach] :
  /// The multi-AZ disaster recovery approach for the imported policy.
  ///
  /// Parameter [multiRegionDisasterRecoveryApproach] :
  /// The multi-Region disaster recovery approach for the imported policy.
  Future<ImportPolicyResponse> importPolicy({
    required String v1PolicyArn,
    AvailabilitySlo? availabilitySlo,
    String? clientToken,
    String? kmsKeyId,
    MultiAzDisasterRecoveryApproach? multiAzDisasterRecoveryApproach,
    MultiRegionDisasterRecoveryApproach? multiRegionDisasterRecoveryApproach,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'v1PolicyArn': v1PolicyArn,
      if (availabilitySlo != null) 'availabilitySlo': availabilitySlo,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (multiAzDisasterRecoveryApproach != null)
        'multiAzDisasterRecoveryApproach':
            multiAzDisasterRecoveryApproach.value,
      if (multiRegionDisasterRecoveryApproach != null)
        'multiRegionDisasterRecoveryApproach':
            multiRegionDisasterRecoveryApproach.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/import-policy',
      exceptionFnMap: _exceptionFns,
    );
    return ImportPolicyResponse.fromJson(response);
  }

  /// Lists resilience assertions for a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [source] :
  /// Filter assertions by source type.
  Future<ListAssertionsResponse> listAssertions({
    required String serviceArn,
    int? maxResults,
    String? nextToken,
    AssertionSource? source,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'serviceArn': [serviceArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (source != null) 'source': [source.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-assertions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssertionsResponse.fromJson(response);
  }

  /// Lists dependencies discovered for services.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [queryRangeEndTime] :
  /// The end time for the dependency query range.
  ///
  /// Parameter [queryRangeGranularity] :
  /// The granularity for the dependency query range.
  ///
  /// Parameter [queryRangeStartTime] :
  /// The start time for the dependency query range.
  Future<ListDependenciesResponse> listDependencies({
    int? maxResults,
    String? nextToken,
    DateTime? queryRangeEndTime,
    QueryGranularity? queryRangeGranularity,
    DateTime? queryRangeStartTime,
    String? serviceArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (queryRangeEndTime != null)
        'queryRangeEndTime': [_s.iso8601ToJson(queryRangeEndTime).toString()],
      if (queryRangeGranularity != null)
        'queryRangeGranularity': [queryRangeGranularity.value],
      if (queryRangeStartTime != null)
        'queryRangeStartTime': [
          _s.iso8601ToJson(queryRangeStartTime).toString()
        ],
      if (serviceArn != null) 'serviceArn': [serviceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-dependencies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDependenciesResponse.fromJson(response);
  }

  /// Lists failure mode assessments.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<ListFailureModeAssessmentsResponse> listFailureModeAssessments({
    required String serviceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'serviceArn': [serviceArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-failure-mode-assessments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFailureModeAssessmentsResponse.fromJson(response);
  }

  /// List findings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [failureCategory] :
  /// Filter findings by failure category.
  ///
  /// Parameter [severity] :
  /// Filter findings by severity.
  ///
  /// Parameter [status] :
  /// Filter findings by status.
  Future<ListFailureModeFindingsResponse> listFailureModeFindings({
    required String serviceArn,
    FailureCategory? failureCategory,
    int? maxResults,
    String? nextToken,
    FindingSeverity? severity,
    FindingStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'serviceArn': [serviceArn],
      if (failureCategory != null) 'failureCategory': [failureCategory.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (severity != null) 'severity': [severity.value],
      if (status != null) 'status': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-failure-mode-findings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFailureModeFindingsResponse.fromJson(response);
  }

  /// Lists input sources for a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [type] :
  /// Filter input sources by type.
  Future<ListInputSourcesResponse> listInputSources({
    required String serviceArn,
    int? maxResults,
    String? nextToken,
    InputSourceType? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'serviceArn': [serviceArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (type != null) 'type': [type.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-input-sources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInputSourcesResponse.fromJson(response);
  }

  /// Lists resilience policies.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  Future<ListPoliciesResponse> listPolicies({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPoliciesResponse.fromJson(response);
  }

  /// List reports for a service, or all reports owned by the account if
  /// serviceArn is not provided.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [reportType] :
  /// Filter reports by type.
  ///
  /// Parameter [serviceArn] :
  /// Optional. If not provided, lists all reports owned by the account.
  Future<ListReportsResponse> listReports({
    int? maxResults,
    String? nextToken,
    ReportType? reportType,
    String? serviceArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (reportType != null) 'reportType': [reportType.value],
      if (serviceArn != null) 'serviceArn': [serviceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-reports',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReportsResponse.fromJson(response);
  }

  /// List resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [awsRegion] :
  /// Filter resources by AWS Region.
  ///
  /// Parameter [serviceFunctionId] :
  /// Filter resources by service function identifier.
  Future<ListResourcesResponse> listResources({
    required String serviceArn,
    String? awsRegion,
    int? maxResults,
    String? nextToken,
    String? serviceFunctionId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'serviceArn': [serviceArn],
      if (awsRegion != null) 'awsRegion': [awsRegion],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (serviceFunctionId != null) 'serviceFunctionId': [serviceFunctionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResourcesResponse.fromJson(response);
  }

  /// Lists events for a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The end time for filtering events.
  ///
  /// Parameter [eventTypes] :
  /// Filter events by type.
  ///
  /// Parameter [startTime] :
  /// The start time for filtering events.
  Future<ListServiceEventsResponse> listServiceEvents({
    required String serviceArn,
    DateTime? endTime,
    List<ServiceEventType>? eventTypes,
    int? maxResults,
    String? nextToken,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'serviceArn': [serviceArn],
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (eventTypes != null)
        'eventTypes': eventTypes.map((e) => e.value).toList(),
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-service-events',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceEventsResponse.fromJson(response);
  }

  /// Lists service functions for a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<ListServiceFunctionsResponse> listServiceFunctions({
    required String serviceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'serviceArn': [serviceArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-functions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceFunctionsResponse.fromJson(response);
  }

  /// Lists services.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// Filter services by AWS account ID.
  ///
  /// Parameter [assessmentStatus] :
  /// Filter services by assessment status.
  ///
  /// Parameter [ouId] :
  /// Filter services by organizational unit (OU) identifier.
  ///
  /// Parameter [userJourneyId] :
  /// Filter services by user journey identifier.
  Future<ListServicesResponse> listServices({
    String? accountId,
    AssessmentStatus? assessmentStatus,
    int? maxResults,
    String? nextToken,
    String? ouId,
    String? policyArn,
    String? systemArn,
    String? userJourneyId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (accountId != null) 'accountId': [accountId],
      if (assessmentStatus != null)
        'assessmentStatus': [assessmentStatus.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (ouId != null) 'ouId': [ouId],
      if (policyArn != null) 'policyArn': [policyArn],
      if (systemArn != null) 'systemArn': [systemArn],
      if (userJourneyId != null) 'userJourneyId': [userJourneyId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-services',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServicesResponse.fromJson(response);
  }

  /// Lists topology edges for a service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  Future<ListServiceTopologyEdgesResponse> listServiceTopologyEdges({
    required String serviceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'serviceArn': [serviceArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-service-topology-edges',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServiceTopologyEdgesResponse.fromJson(response);
  }

  /// Lists events for a system.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The end time for filtering events.
  ///
  /// Parameter [eventTypes] :
  /// Filter events by type.
  ///
  /// Parameter [startTime] :
  /// The start time for filtering events.
  Future<ListSystemEventsResponse> listSystemEvents({
    required String systemArn,
    DateTime? endTime,
    List<SystemEventType>? eventTypes,
    int? maxResults,
    String? nextToken,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'systemArn': [systemArn],
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (eventTypes != null)
        'eventTypes': eventTypes.map((e) => e.value).toList(),
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-system-events',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSystemEventsResponse.fromJson(response);
  }

  /// Lists systems.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ouId] :
  /// Filter systems by organizational unit (OU) identifier.
  Future<ListSystemsResponse> listSystems({
    int? maxResults,
    String? nextToken,
    String? ouId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (ouId != null) 'ouId': [ouId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-systems',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSystemsResponse.fromJson(response);
  }

  /// Lists the tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists user journeys for a system.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  Future<ListUserJourneysResponse> listUserJourneys({
    required String systemArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'systemArn': [systemArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/list-user-journeys',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUserJourneysResponse.fromJson(response);
  }

  /// Start a failure mode assessment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<StartFailureModeAssessmentResponse> startFailureModeAssessment({
    required String serviceArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'serviceArn': serviceArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/start-failure-mode-assessment',
      exceptionFnMap: _exceptionFns,
    );
    return StartFailureModeAssessmentResponse.fromJson(response);
  }

  /// Adds tags to a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      requestUri: '/v2/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      requestUri: '/v2/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a resilience assertion.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assertionId] :
  /// The unique identifier of the assertion to update.
  ///
  /// Parameter [text] :
  /// The updated text content of the assertion.
  Future<UpdateAssertionResponse> updateAssertion({
    required String assertionId,
    required String serviceArn,
    String? text,
  }) async {
    final $payload = <String, dynamic>{
      'assertionId': assertionId,
      'serviceArn': serviceArn,
      if (text != null) 'text': text,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/update-assertion',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAssertionResponse.fromJson(response);
  }

  /// Updates a dependency classification.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dependencyId] :
  /// The identifier of the dependency to update.
  ///
  /// Parameter [comment] :
  /// A comment about the dependency.
  ///
  /// Parameter [criticality] :
  /// The updated criticality level of the dependency.
  Future<UpdateDependencyResponse> updateDependency({
    required String dependencyId,
    required String serviceArn,
    String? comment,
    DependencyCriticality? criticality,
  }) async {
    final $payload = <String, dynamic>{
      'dependencyId': dependencyId,
      'serviceArn': serviceArn,
      if (comment != null) 'comment': comment,
      if (criticality != null) 'criticality': criticality.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/update-dependency',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDependencyResponse.fromJson(response);
  }

  /// Updates an existing finding.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [findingId] :
  /// The identifier of the finding to update.
  ///
  /// Parameter [status] :
  /// The new status for the finding.
  ///
  /// Parameter [comment] :
  /// A comment about the finding update.
  Future<UpdateFailureModeFindingResponse> updateFailureModeFinding({
    required String findingId,
    required String serviceArn,
    required FindingStatus status,
    String? comment,
  }) async {
    final $payload = <String, dynamic>{
      'findingId': findingId,
      'serviceArn': serviceArn,
      'status': status.value,
      if (comment != null) 'comment': comment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/update-failure-mode-finding',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFailureModeFindingResponse.fromJson(response);
  }

  /// Updates an existing resilience policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [availabilitySlo] :
  /// The updated availability SLO for the policy.
  ///
  /// Parameter [dataRecovery] :
  /// The updated data recovery targets for the policy.
  ///
  /// Parameter [multiAz] :
  /// The updated multi-AZ disaster recovery targets for the policy.
  ///
  /// Parameter [multiRegion] :
  /// The updated multi-Region disaster recovery targets for the policy.
  Future<UpdatePolicyResponse> updatePolicy({
    required String policyArn,
    AvailabilitySlo? availabilitySlo,
    DataRecoveryTargets? dataRecovery,
    String? description,
    MultiAzTargets? multiAz,
    MultiRegionTargets? multiRegion,
  }) async {
    final $payload = <String, dynamic>{
      'policyArn': policyArn,
      if (availabilitySlo != null) 'availabilitySlo': availabilitySlo,
      if (dataRecovery != null) 'dataRecovery': dataRecovery,
      if (description != null) 'description': description,
      if (multiAz != null) 'multiAz': multiAz,
      if (multiRegion != null) 'multiRegion': multiRegion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/update-policy',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePolicyResponse.fromJson(response);
  }

  /// Updates an existing service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [associatedSystems] :
  /// The updated systems to associate with the service.
  ///
  /// Parameter [permissionModel] :
  /// The updated permission model for the service.
  ///
  /// Parameter [regions] :
  /// The updated AWS Regions where the service operates.
  Future<UpdateServiceResponse> updateService({
    required String serviceArn,
    List<AssociatedSystem>? associatedSystems,
    DependencyDiscoveryInput? dependencyDiscovery,
    String? description,
    PermissionModel? permissionModel,
    String? policyArn,
    List<String>? regions,
    ServiceReportConfiguration? reportConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'serviceArn': serviceArn,
      if (associatedSystems != null) 'associatedSystems': associatedSystems,
      if (dependencyDiscovery != null)
        'dependencyDiscovery': dependencyDiscovery.value,
      if (description != null) 'description': description,
      if (permissionModel != null) 'permissionModel': permissionModel,
      if (policyArn != null) 'policyArn': policyArn,
      if (regions != null) 'regions': regions,
      if (reportConfiguration != null)
        'reportConfiguration': reportConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/update-service',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateServiceResponse.fromJson(response);
  }

  /// Updates a service function.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [serviceFunctionId] :
  /// The identifier of the service function to update.
  ///
  /// Parameter [criticality] :
  /// The updated criticality level of the service function.
  Future<UpdateServiceFunctionResponse> updateServiceFunction({
    required String serviceArn,
    required String serviceFunctionId,
    ServiceFunctionCriticality? criticality,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'serviceArn': serviceArn,
      'serviceFunctionId': serviceFunctionId,
      if (criticality != null) 'criticality': criticality.value,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/update-function',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateServiceFunctionResponse.fromJson(response);
  }

  /// Updates an existing system.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sharingEnabled] :
  /// Whether cross-account sharing is enabled for the system.
  Future<UpdateSystemResponse> updateSystem({
    required String systemArn,
    String? description,
    bool? sharingEnabled,
  }) async {
    final $payload = <String, dynamic>{
      'systemArn': systemArn,
      if (description != null) 'description': description,
      if (sharingEnabled != null) 'sharingEnabled': sharingEnabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/update-system',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSystemResponse.fromJson(response);
  }

  /// Updates an existing user journey.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [userJourneyId] :
  /// The identifier of the user journey to update.
  Future<UpdateUserJourneyResponse> updateUserJourney({
    required String systemArn,
    required String userJourneyId,
    String? description,
    String? name,
    String? policyArn,
  }) async {
    final $payload = <String, dynamic>{
      'systemArn': systemArn,
      'userJourneyId': userJourneyId,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (policyArn != null) 'policyArn': policyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/update-user-journey',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserJourneyResponse.fromJson(response);
  }
}

/// @nodoc
class CreateAssertionResponse {
  /// The created assertion.
  final Assertion assertion;

  CreateAssertionResponse({
    required this.assertion,
  });

  factory CreateAssertionResponse.fromJson(Map<String, dynamic> json) {
    return CreateAssertionResponse(
      assertion: Assertion.fromJson(
          (json['assertion'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final assertion = this.assertion;
    return {
      'assertion': assertion,
    };
  }
}

/// @nodoc
class CreateInputSourceResponse {
  /// The unique identifier assigned to the created input source.
  final String inputSourceId;
  final String serviceArn;

  CreateInputSourceResponse({
    required this.inputSourceId,
    required this.serviceArn,
  });

  factory CreateInputSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateInputSourceResponse(
      inputSourceId: (json['inputSourceId'] as String?) ?? '',
      serviceArn: (json['serviceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceId = this.inputSourceId;
    final serviceArn = this.serviceArn;
    return {
      'inputSourceId': inputSourceId,
      'serviceArn': serviceArn,
    };
  }
}

/// @nodoc
class CreatePolicyResponse {
  /// The created resilience policy.
  final Policy policy;

  CreatePolicyResponse({
    required this.policy,
  });

  factory CreatePolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreatePolicyResponse(
      policy: Policy.fromJson((json['policy'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      'policy': policy,
    };
  }
}

/// @nodoc
class CreateReportResponse {
  /// The result of the report generation request.
  final ReportGenerationResult reportGenerationResult;

  CreateReportResponse({
    required this.reportGenerationResult,
  });

  factory CreateReportResponse.fromJson(Map<String, dynamic> json) {
    return CreateReportResponse(
      reportGenerationResult: ReportGenerationResult.fromJson(
          (json['reportGenerationResult'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final reportGenerationResult = this.reportGenerationResult;
    return {
      'reportGenerationResult': reportGenerationResult,
    };
  }
}

/// @nodoc
class CreateServiceResponse {
  /// The created service.
  final Service service;

  CreateServiceResponse({
    required this.service,
  });

  factory CreateServiceResponse.fromJson(Map<String, dynamic> json) {
    return CreateServiceResponse(
      service: Service.fromJson((json['service'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      'service': service,
    };
  }
}

/// @nodoc
class CreateServiceFunctionResponse {
  /// The created service function.
  final ServiceFunction serviceFunction;

  CreateServiceFunctionResponse({
    required this.serviceFunction,
  });

  factory CreateServiceFunctionResponse.fromJson(Map<String, dynamic> json) {
    return CreateServiceFunctionResponse(
      serviceFunction: ServiceFunction.fromJson(
          (json['serviceFunction'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceFunction = this.serviceFunction;
    return {
      'serviceFunction': serviceFunction,
    };
  }
}

/// @nodoc
class CreateServiceFunctionResourcesResponse {
  /// The list of resources that were associated.
  final List<String>? resources;
  final String? serviceArn;

  /// The identifier of the service function.
  final String? serviceFunctionId;

  CreateServiceFunctionResourcesResponse({
    this.resources,
    this.serviceArn,
    this.serviceFunctionId,
  });

  factory CreateServiceFunctionResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateServiceFunctionResourcesResponse(
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      serviceArn: json['serviceArn'] as String?,
      serviceFunctionId: json['serviceFunctionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resources = this.resources;
    final serviceArn = this.serviceArn;
    final serviceFunctionId = this.serviceFunctionId;
    return {
      if (resources != null) 'resources': resources,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceFunctionId != null) 'serviceFunctionId': serviceFunctionId,
    };
  }
}

/// @nodoc
class CreateSystemResponse {
  /// The created system.
  final System system;

  CreateSystemResponse({
    required this.system,
  });

  factory CreateSystemResponse.fromJson(Map<String, dynamic> json) {
    return CreateSystemResponse(
      system: System.fromJson((json['system'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final system = this.system;
    return {
      'system': system,
    };
  }
}

/// @nodoc
class CreateUserJourneyResponse {
  /// The created user journey.
  final UserJourney userJourney;

  CreateUserJourneyResponse({
    required this.userJourney,
  });

  factory CreateUserJourneyResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserJourneyResponse(
      userJourney: UserJourney.fromJson(
          (json['userJourney'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final userJourney = this.userJourney;
    return {
      'userJourney': userJourney,
    };
  }
}

/// @nodoc
class DeleteAssertionResponse {
  /// The unique identifier of the deleted assertion.
  final String? assertionId;

  DeleteAssertionResponse({
    this.assertionId,
  });

  factory DeleteAssertionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAssertionResponse(
      assertionId: json['assertionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assertionId = this.assertionId;
    return {
      if (assertionId != null) 'assertionId': assertionId,
    };
  }
}

/// @nodoc
class DeleteInputSourceResponse {
  /// The identifier of the deleted input source.
  final String inputSourceId;
  final String serviceArn;

  DeleteInputSourceResponse({
    required this.inputSourceId,
    required this.serviceArn,
  });

  factory DeleteInputSourceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteInputSourceResponse(
      inputSourceId: (json['inputSourceId'] as String?) ?? '',
      serviceArn: (json['serviceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceId = this.inputSourceId;
    final serviceArn = this.serviceArn;
    return {
      'inputSourceId': inputSourceId,
      'serviceArn': serviceArn,
    };
  }
}

/// @nodoc
class DeletePolicyResponse {
  final String policyArn;

  DeletePolicyResponse({
    required this.policyArn,
  });

  factory DeletePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeletePolicyResponse(
      policyArn: (json['policyArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    return {
      'policyArn': policyArn,
    };
  }
}

/// @nodoc
class DeleteServiceResponse {
  final String serviceArn;

  DeleteServiceResponse({
    required this.serviceArn,
  });

  factory DeleteServiceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteServiceResponse(
      serviceArn: (json['serviceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final serviceArn = this.serviceArn;
    return {
      'serviceArn': serviceArn,
    };
  }
}

/// @nodoc
class DeleteServiceFunctionResponse {
  /// The identifier of the deleted service function.
  final String? serviceFunctionId;

  DeleteServiceFunctionResponse({
    this.serviceFunctionId,
  });

  factory DeleteServiceFunctionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteServiceFunctionResponse(
      serviceFunctionId: json['serviceFunctionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceFunctionId = this.serviceFunctionId;
    return {
      if (serviceFunctionId != null) 'serviceFunctionId': serviceFunctionId,
    };
  }
}

/// @nodoc
class DeleteServiceFunctionResourcesResponse {
  /// The list of resources that were removed.
  final List<String>? resources;
  final String? serviceArn;

  /// The identifier of the service function.
  final String? serviceFunctionId;

  DeleteServiceFunctionResourcesResponse({
    this.resources,
    this.serviceArn,
    this.serviceFunctionId,
  });

  factory DeleteServiceFunctionResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteServiceFunctionResourcesResponse(
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      serviceArn: json['serviceArn'] as String?,
      serviceFunctionId: json['serviceFunctionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resources = this.resources;
    final serviceArn = this.serviceArn;
    final serviceFunctionId = this.serviceFunctionId;
    return {
      if (resources != null) 'resources': resources,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceFunctionId != null) 'serviceFunctionId': serviceFunctionId,
    };
  }
}

/// @nodoc
class DeleteSystemResponse {
  final String systemArn;

  DeleteSystemResponse({
    required this.systemArn,
  });

  factory DeleteSystemResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSystemResponse(
      systemArn: (json['systemArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final systemArn = this.systemArn;
    return {
      'systemArn': systemArn,
    };
  }
}

/// @nodoc
class DeleteUserJourneyResponse {
  /// The identifier of the deleted user journey.
  final String userJourneyId;

  DeleteUserJourneyResponse({
    required this.userJourneyId,
  });

  factory DeleteUserJourneyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteUserJourneyResponse(
      userJourneyId: (json['userJourneyId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final userJourneyId = this.userJourneyId;
    return {
      'userJourneyId': userJourneyId,
    };
  }
}

/// @nodoc
class GetFailureModeFindingResponse {
  /// The requested finding.
  final Finding? finding;

  GetFailureModeFindingResponse({
    this.finding,
  });

  factory GetFailureModeFindingResponse.fromJson(Map<String, dynamic> json) {
    return GetFailureModeFindingResponse(
      finding: json['finding'] != null
          ? Finding.fromJson(json['finding'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final finding = this.finding;
    return {
      if (finding != null) 'finding': finding,
    };
  }
}

/// @nodoc
class GetPolicyResponse {
  /// The requested resilience policy.
  final Policy policy;

  GetPolicyResponse({
    required this.policy,
  });

  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetPolicyResponse(
      policy: Policy.fromJson((json['policy'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      'policy': policy,
    };
  }
}

/// @nodoc
class GetServiceResponse {
  /// The requested service.
  final Service service;

  GetServiceResponse({
    required this.service,
  });

  factory GetServiceResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceResponse(
      service: Service.fromJson((json['service'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      'service': service,
    };
  }
}

/// @nodoc
class GetSystemResponse {
  /// The requested system.
  final System system;

  GetSystemResponse({
    required this.system,
  });

  factory GetSystemResponse.fromJson(Map<String, dynamic> json) {
    return GetSystemResponse(
      system: System.fromJson((json['system'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final system = this.system;
    return {
      'system': system,
    };
  }
}

/// @nodoc
class GetUserJourneyResponse {
  /// The requested user journey.
  final UserJourney userJourney;

  GetUserJourneyResponse({
    required this.userJourney,
  });

  factory GetUserJourneyResponse.fromJson(Map<String, dynamic> json) {
    return GetUserJourneyResponse(
      userJourney: UserJourney.fromJson(
          (json['userJourney'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final userJourney = this.userJourney;
    return {
      'userJourney': userJourney,
    };
  }
}

/// @nodoc
class ImportAppResponse {
  /// The imported service.
  final Service service;

  ImportAppResponse({
    required this.service,
  });

  factory ImportAppResponse.fromJson(Map<String, dynamic> json) {
    return ImportAppResponse(
      service: Service.fromJson((json['service'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      'service': service,
    };
  }
}

/// @nodoc
class ImportPolicyResponse {
  /// The imported policy.
  final Policy policy;

  ImportPolicyResponse({
    required this.policy,
  });

  factory ImportPolicyResponse.fromJson(Map<String, dynamic> json) {
    return ImportPolicyResponse(
      policy: Policy.fromJson((json['policy'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      'policy': policy,
    };
  }
}

/// @nodoc
class ListAssertionsResponse {
  /// The list of assertions.
  final List<Assertion> assertions;
  final String? nextToken;

  ListAssertionsResponse({
    required this.assertions,
    this.nextToken,
  });

  factory ListAssertionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAssertionsResponse(
      assertions: ((json['assertions'] as List?) ?? const [])
          .nonNulls
          .map((e) => Assertion.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assertions = this.assertions;
    final nextToken = this.nextToken;
    return {
      'assertions': assertions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListDependenciesResponse {
  /// The list of dependency summaries.
  final List<DependencySummary> dependencySummaries;
  final String? nextToken;

  ListDependenciesResponse({
    required this.dependencySummaries,
    this.nextToken,
  });

  factory ListDependenciesResponse.fromJson(Map<String, dynamic> json) {
    return ListDependenciesResponse(
      dependencySummaries: ((json['dependencySummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => DependencySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dependencySummaries = this.dependencySummaries;
    final nextToken = this.nextToken;
    return {
      'dependencySummaries': dependencySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListFailureModeAssessmentsResponse {
  /// The list of assessment summaries.
  final List<AssessmentSummary> assessmentSummaries;
  final String? nextToken;

  ListFailureModeAssessmentsResponse({
    required this.assessmentSummaries,
    this.nextToken,
  });

  factory ListFailureModeAssessmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFailureModeAssessmentsResponse(
      assessmentSummaries: ((json['assessmentSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => AssessmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentSummaries = this.assessmentSummaries;
    final nextToken = this.nextToken;
    return {
      'assessmentSummaries': assessmentSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListFailureModeFindingsResponse {
  /// The list of finding summaries.
  final List<FindingSummary> findingsSummary;
  final String? nextToken;

  ListFailureModeFindingsResponse({
    required this.findingsSummary,
    this.nextToken,
  });

  factory ListFailureModeFindingsResponse.fromJson(Map<String, dynamic> json) {
    return ListFailureModeFindingsResponse(
      findingsSummary: ((json['findingsSummary'] as List?) ?? const [])
          .nonNulls
          .map((e) => FindingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findingsSummary = this.findingsSummary;
    final nextToken = this.nextToken;
    return {
      'findingsSummary': findingsSummary,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListInputSourcesResponse {
  /// The list of input source summaries.
  final List<InputSourceSummary> inputSourceSummaries;
  final String? nextToken;

  ListInputSourcesResponse({
    required this.inputSourceSummaries,
    this.nextToken,
  });

  factory ListInputSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListInputSourcesResponse(
      inputSourceSummaries: ((json['inputSourceSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => InputSourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceSummaries = this.inputSourceSummaries;
    final nextToken = this.nextToken;
    return {
      'inputSourceSummaries': inputSourceSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListPoliciesResponse {
  /// The list of policy summaries.
  final List<PolicySummary> policySummaries;
  final String? nextToken;

  ListPoliciesResponse({
    required this.policySummaries,
    this.nextToken,
  });

  factory ListPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListPoliciesResponse(
      policySummaries: ((json['policySummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => PolicySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policySummaries = this.policySummaries;
    final nextToken = this.nextToken;
    return {
      'policySummaries': policySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListReportsResponse {
  /// The list of report generation results.
  final List<ReportGenerationResult> reportGenerationResults;
  final String? nextToken;

  ListReportsResponse({
    required this.reportGenerationResults,
    this.nextToken,
  });

  factory ListReportsResponse.fromJson(Map<String, dynamic> json) {
    return ListReportsResponse(
      reportGenerationResults: ((json['reportGenerationResults'] as List?) ??
              const [])
          .nonNulls
          .map(
              (e) => ReportGenerationResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportGenerationResults = this.reportGenerationResults;
    final nextToken = this.nextToken;
    return {
      'reportGenerationResults': reportGenerationResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListResourcesResponse {
  final String? nextToken;

  /// The service function identifier for the returned resources.
  final String? serviceFunctionId;

  /// The list of service resources.
  final List<ServiceResource>? serviceResources;

  ListResourcesResponse({
    this.nextToken,
    this.serviceFunctionId,
    this.serviceResources,
  });

  factory ListResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListResourcesResponse(
      nextToken: json['nextToken'] as String?,
      serviceFunctionId: json['serviceFunctionId'] as String?,
      serviceResources: (json['serviceResources'] as List?)
          ?.nonNulls
          .map((e) => ServiceResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serviceFunctionId = this.serviceFunctionId;
    final serviceResources = this.serviceResources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (serviceFunctionId != null) 'serviceFunctionId': serviceFunctionId,
      if (serviceResources != null) 'serviceResources': serviceResources,
    };
  }
}

/// @nodoc
class ListServiceEventsResponse {
  /// The list of service events.
  final List<ServiceEvent> events;
  final String? nextToken;

  ListServiceEventsResponse({
    required this.events,
    this.nextToken,
  });

  factory ListServiceEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListServiceEventsResponse(
      events: ((json['events'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      'events': events,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListServiceFunctionsResponse {
  /// The list of service functions.
  final List<ServiceFunction> serviceFunctions;
  final String? nextToken;

  ListServiceFunctionsResponse({
    required this.serviceFunctions,
    this.nextToken,
  });

  factory ListServiceFunctionsResponse.fromJson(Map<String, dynamic> json) {
    return ListServiceFunctionsResponse(
      serviceFunctions: ((json['serviceFunctions'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceFunction.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceFunctions = this.serviceFunctions;
    final nextToken = this.nextToken;
    return {
      'serviceFunctions': serviceFunctions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListServicesResponse {
  /// The list of service summaries.
  final List<ServiceSummary> serviceSummaries;
  final String? nextToken;

  ListServicesResponse({
    required this.serviceSummaries,
    this.nextToken,
  });

  factory ListServicesResponse.fromJson(Map<String, dynamic> json) {
    return ListServicesResponse(
      serviceSummaries: ((json['serviceSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ServiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceSummaries = this.serviceSummaries;
    final nextToken = this.nextToken;
    return {
      'serviceSummaries': serviceSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListServiceTopologyEdgesResponse {
  final String? nextToken;

  /// The list of service topology edge summaries.
  final List<ServiceTopologyEdgeSummary>? serviceTopologyEdgeSummaries;

  ListServiceTopologyEdgesResponse({
    this.nextToken,
    this.serviceTopologyEdgeSummaries,
  });

  factory ListServiceTopologyEdgesResponse.fromJson(Map<String, dynamic> json) {
    return ListServiceTopologyEdgesResponse(
      nextToken: json['nextToken'] as String?,
      serviceTopologyEdgeSummaries: (json['serviceTopologyEdgeSummaries']
              as List?)
          ?.nonNulls
          .map((e) =>
              ServiceTopologyEdgeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serviceTopologyEdgeSummaries = this.serviceTopologyEdgeSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (serviceTopologyEdgeSummaries != null)
        'serviceTopologyEdgeSummaries': serviceTopologyEdgeSummaries,
    };
  }
}

/// @nodoc
class ListSystemEventsResponse {
  /// The list of system events.
  final List<SystemEvent> events;
  final String? nextToken;

  ListSystemEventsResponse({
    required this.events,
    this.nextToken,
  });

  factory ListSystemEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListSystemEventsResponse(
      events: ((json['events'] as List?) ?? const [])
          .nonNulls
          .map((e) => SystemEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      'events': events,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSystemsResponse {
  /// The list of system summaries.
  final List<SystemSummary> systemSummaries;
  final String? nextToken;

  ListSystemsResponse({
    required this.systemSummaries,
    this.nextToken,
  });

  factory ListSystemsResponse.fromJson(Map<String, dynamic> json) {
    return ListSystemsResponse(
      systemSummaries: ((json['systemSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => SystemSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final systemSummaries = this.systemSummaries;
    final nextToken = this.nextToken;
    return {
      'systemSummaries': systemSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

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

/// @nodoc
class ListUserJourneysResponse {
  /// The list of user journey summaries.
  final List<UserJourneySummary> userJourneySummaries;
  final String? nextToken;

  ListUserJourneysResponse({
    required this.userJourneySummaries,
    this.nextToken,
  });

  factory ListUserJourneysResponse.fromJson(Map<String, dynamic> json) {
    return ListUserJourneysResponse(
      userJourneySummaries: ((json['userJourneySummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => UserJourneySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userJourneySummaries = this.userJourneySummaries;
    final nextToken = this.nextToken;
    return {
      'userJourneySummaries': userJourneySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StartFailureModeAssessmentResponse {
  /// The unique identifier of the started assessment.
  final String? assessmentId;

  /// The status of the started assessment.
  final AssessmentStatus? assessmentStatus;
  final String? serviceArn;

  /// The timestamp when the assessment started.
  final DateTime? startedAt;

  StartFailureModeAssessmentResponse({
    this.assessmentId,
    this.assessmentStatus,
    this.serviceArn,
    this.startedAt,
  });

  factory StartFailureModeAssessmentResponse.fromJson(
      Map<String, dynamic> json) {
    return StartFailureModeAssessmentResponse(
      assessmentId: json['assessmentId'] as String?,
      assessmentStatus: (json['assessmentStatus'] as String?)
          ?.let(AssessmentStatus.fromString),
      serviceArn: json['serviceArn'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final assessmentStatus = this.assessmentStatus;
    final serviceArn = this.serviceArn;
    final startedAt = this.startedAt;
    return {
      if (assessmentId != null) 'assessmentId': assessmentId,
      if (assessmentStatus != null) 'assessmentStatus': assessmentStatus.value,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (startedAt != null) 'startedAt': unixTimestampToJson(startedAt),
    };
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
class UpdateAssertionResponse {
  /// The updated assertion.
  final Assertion assertion;

  UpdateAssertionResponse({
    required this.assertion,
  });

  factory UpdateAssertionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAssertionResponse(
      assertion: Assertion.fromJson(
          (json['assertion'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final assertion = this.assertion;
    return {
      'assertion': assertion,
    };
  }
}

/// @nodoc
class UpdateDependencyResponse {
  /// The criticality level of the dependency.
  final DependencyCriticality criticality;

  /// The identifier of the updated dependency.
  final String dependencyId;

  /// The name of the updated dependency.
  final String dependencyName;

  /// The location of the dependency.
  final String location;

  /// The timestamp when the dependency was updated.
  final DateTime updatedAt;

  /// The comment about the dependency.
  final String? comment;

  /// The provider of the dependency.
  final String? provider;

  UpdateDependencyResponse({
    required this.criticality,
    required this.dependencyId,
    required this.dependencyName,
    required this.location,
    required this.updatedAt,
    this.comment,
    this.provider,
  });

  factory UpdateDependencyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDependencyResponse(
      criticality: DependencyCriticality.fromString(
          (json['criticality'] as String?) ?? ''),
      dependencyId: (json['dependencyId'] as String?) ?? '',
      dependencyName: (json['dependencyName'] as String?) ?? '',
      location: (json['location'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      comment: json['comment'] as String?,
      provider: json['provider'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final criticality = this.criticality;
    final dependencyId = this.dependencyId;
    final dependencyName = this.dependencyName;
    final location = this.location;
    final updatedAt = this.updatedAt;
    final comment = this.comment;
    final provider = this.provider;
    return {
      'criticality': criticality.value,
      'dependencyId': dependencyId,
      'dependencyName': dependencyName,
      'location': location,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (comment != null) 'comment': comment,
      if (provider != null) 'provider': provider,
    };
  }
}

/// @nodoc
class UpdateFailureModeFindingResponse {
  /// The updated finding.
  final Finding? finding;

  UpdateFailureModeFindingResponse({
    this.finding,
  });

  factory UpdateFailureModeFindingResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFailureModeFindingResponse(
      finding: json['finding'] != null
          ? Finding.fromJson(json['finding'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final finding = this.finding;
    return {
      if (finding != null) 'finding': finding,
    };
  }
}

/// @nodoc
class UpdatePolicyResponse {
  /// The updated policy.
  final Policy policy;

  UpdatePolicyResponse({
    required this.policy,
  });

  factory UpdatePolicyResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePolicyResponse(
      policy: Policy.fromJson((json['policy'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      'policy': policy,
    };
  }
}

/// @nodoc
class UpdateServiceResponse {
  /// The updated service.
  final Service service;

  UpdateServiceResponse({
    required this.service,
  });

  factory UpdateServiceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServiceResponse(
      service: Service.fromJson((json['service'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final service = this.service;
    return {
      'service': service,
    };
  }
}

/// @nodoc
class UpdateServiceFunctionResponse {
  /// The updated service function.
  final ServiceFunction serviceFunction;

  UpdateServiceFunctionResponse({
    required this.serviceFunction,
  });

  factory UpdateServiceFunctionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServiceFunctionResponse(
      serviceFunction: ServiceFunction.fromJson(
          (json['serviceFunction'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceFunction = this.serviceFunction;
    return {
      'serviceFunction': serviceFunction,
    };
  }
}

/// @nodoc
class UpdateSystemResponse {
  /// The updated system.
  final System system;

  UpdateSystemResponse({
    required this.system,
  });

  factory UpdateSystemResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSystemResponse(
      system: System.fromJson((json['system'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final system = this.system;
    return {
      'system': system,
    };
  }
}

/// @nodoc
class UpdateUserJourneyResponse {
  /// The updated user journey.
  final UserJourney userJourney;

  UpdateUserJourneyResponse({
    required this.userJourney,
  });

  factory UpdateUserJourneyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserJourneyResponse(
      userJourney: UserJourney.fromJson(
          (json['userJourney'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final userJourney = this.userJourney;
    return {
      'userJourney': userJourney,
    };
  }
}

/// Represents a user journey that defines a critical path through a system.
///
/// @nodoc
class UserJourney {
  final String name;

  /// The unique identifier of the user journey.
  final String userJourneyId;

  /// The timestamp when the user journey was created.
  final DateTime? createdAt;
  final String? description;
  final String? policyArn;

  /// The timestamp when the user journey was last updated.
  final DateTime? updatedAt;

  UserJourney({
    required this.name,
    required this.userJourneyId,
    this.createdAt,
    this.description,
    this.policyArn,
    this.updatedAt,
  });

  factory UserJourney.fromJson(Map<String, dynamic> json) {
    return UserJourney(
      name: (json['name'] as String?) ?? '',
      userJourneyId: (json['userJourneyId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      policyArn: json['policyArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final userJourneyId = this.userJourneyId;
    final createdAt = this.createdAt;
    final description = this.description;
    final policyArn = this.policyArn;
    final updatedAt = this.updatedAt;
    return {
      'name': name,
      'userJourneyId': userJourneyId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (policyArn != null) 'policyArn': policyArn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Represents a system in Resilience Hub. A system is a logical grouping of
/// services.
///
/// @nodoc
class System {
  final String name;
  final String systemArn;
  final String systemId;

  /// The timestamp when the system was created.
  final DateTime? createdAt;
  final String? description;
  final String? kmsKeyId;

  /// The AWS Organizations identifier for the system.
  final String? organizationId;

  /// The organizational unit (OU) identifier for the system.
  final String? ouId;

  /// Indicates whether cross-account sharing is enabled.
  final bool? sharingEnabled;
  final Map<String, String>? tags;

  /// The timestamp when the system was last updated.
  final DateTime? updatedAt;

  System({
    required this.name,
    required this.systemArn,
    required this.systemId,
    this.createdAt,
    this.description,
    this.kmsKeyId,
    this.organizationId,
    this.ouId,
    this.sharingEnabled,
    this.tags,
    this.updatedAt,
  });

  factory System.fromJson(Map<String, dynamic> json) {
    return System(
      name: (json['name'] as String?) ?? '',
      systemArn: (json['systemArn'] as String?) ?? '',
      systemId: (json['systemId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      organizationId: json['organizationId'] as String?,
      ouId: json['ouId'] as String?,
      sharingEnabled: json['sharingEnabled'] as bool?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final systemArn = this.systemArn;
    final systemId = this.systemId;
    final createdAt = this.createdAt;
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final organizationId = this.organizationId;
    final ouId = this.ouId;
    final sharingEnabled = this.sharingEnabled;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'name': name,
      'systemArn': systemArn,
      'systemId': systemId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (organizationId != null) 'organizationId': organizationId,
      if (ouId != null) 'ouId': ouId,
      if (sharingEnabled != null) 'sharingEnabled': sharingEnabled,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Represents a logical component of a service.
///
/// @nodoc
class ServiceFunction {
  /// The criticality level of the service function.
  final ServiceFunctionCriticality criticality;
  final String name;
  final String serviceArn;

  /// The unique identifier of the service function.
  final String serviceFunctionId;

  /// The timestamp when the service function was created.
  final DateTime? createdAt;
  final String? description;

  /// The number of resources associated with the service function.
  final int? resourceCount;

  /// The source of the service function.
  final ServiceFunctionSource? source;

  /// The timestamp when the service function was last updated.
  final DateTime? updatedAt;

  ServiceFunction({
    required this.criticality,
    required this.name,
    required this.serviceArn,
    required this.serviceFunctionId,
    this.createdAt,
    this.description,
    this.resourceCount,
    this.source,
    this.updatedAt,
  });

  factory ServiceFunction.fromJson(Map<String, dynamic> json) {
    return ServiceFunction(
      criticality: ServiceFunctionCriticality.fromString(
          (json['criticality'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      serviceArn: (json['serviceArn'] as String?) ?? '',
      serviceFunctionId: (json['serviceFunctionId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      resourceCount: json['resourceCount'] as int?,
      source:
          (json['source'] as String?)?.let(ServiceFunctionSource.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final criticality = this.criticality;
    final name = this.name;
    final serviceArn = this.serviceArn;
    final serviceFunctionId = this.serviceFunctionId;
    final createdAt = this.createdAt;
    final description = this.description;
    final resourceCount = this.resourceCount;
    final source = this.source;
    final updatedAt = this.updatedAt;
    return {
      'criticality': criticality.value,
      'name': name,
      'serviceArn': serviceArn,
      'serviceFunctionId': serviceFunctionId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (resourceCount != null) 'resourceCount': resourceCount,
      if (source != null) 'source': source.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class ServiceFunctionCriticality {
  static const primary = ServiceFunctionCriticality._('PRIMARY');
  static const supplemental = ServiceFunctionCriticality._('SUPPLEMENTAL');

  final String value;

  const ServiceFunctionCriticality._(this.value);

  static const values = [primary, supplemental];

  static ServiceFunctionCriticality fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceFunctionCriticality._(value));

  @override
  bool operator ==(other) =>
      other is ServiceFunctionCriticality && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ServiceFunctionSource {
  static const aiGenerated = ServiceFunctionSource._('AI_GENERATED');
  static const user = ServiceFunctionSource._('USER');

  final String value;

  const ServiceFunctionSource._(this.value);

  static const values = [aiGenerated, user];

  static ServiceFunctionSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceFunctionSource._(value));

  @override
  bool operator ==(other) =>
      other is ServiceFunctionSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a service in Resilience Hub. A service is the primary unit of
/// resilience assessment.
///
/// @nodoc
class Service {
  final String name;
  final String serviceArn;

  /// The AWS account ID that owns the service.
  final String? accountId;

  /// The achievability status of the service's resilience targets.
  final Achievability? achievability;

  /// The current assessment status of the service.
  final AssessmentStatus? assessmentStatus;

  /// The systems associated with the service.
  final List<AssociatedSystem>? associatedSystems;

  /// The timestamp when the service was created.
  final DateTime? createdAt;

  /// The dependency discovery configuration for the service.
  final DependencyDiscoveryConfig? dependencyDiscovery;
  final String? description;

  /// The effective policy values for the service.
  final EffectivePolicyValues? effectivePolicyValues;

  /// The estimated cost of running an assessment on the service.
  final AssessmentCost? estimatedAssessmentCost;
  final String? kmsKeyId;

  /// The number of open findings for the service.
  final int? openFindingsCount;

  /// The AWS Organizations identifier for the service.
  final String? organizationId;

  /// The organizational unit (OU) identifier for the service.
  final String? ouId;

  /// The permission model for the service.
  final PermissionModel? permissionModel;
  final String? policyArn;

  /// The AWS Regions where the service operates.
  final List<String>? regions;
  final ServiceReportConfiguration? reportConfiguration;

  /// Indicates whether the assessment should be rerun.
  final bool? rerunAssessment;

  /// The number of resolved findings for the service.
  final int? resolvedFindingsCount;

  /// The resource discovery status for the service.
  final ResourceDiscoveryStatus? resourceDiscovery;
  final Map<String, String>? tags;

  /// The timestamp when the service was last updated.
  final DateTime? updatedAt;

  Service({
    required this.name,
    required this.serviceArn,
    this.accountId,
    this.achievability,
    this.assessmentStatus,
    this.associatedSystems,
    this.createdAt,
    this.dependencyDiscovery,
    this.description,
    this.effectivePolicyValues,
    this.estimatedAssessmentCost,
    this.kmsKeyId,
    this.openFindingsCount,
    this.organizationId,
    this.ouId,
    this.permissionModel,
    this.policyArn,
    this.regions,
    this.reportConfiguration,
    this.rerunAssessment,
    this.resolvedFindingsCount,
    this.resourceDiscovery,
    this.tags,
    this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      name: (json['name'] as String?) ?? '',
      serviceArn: (json['serviceArn'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      achievability: json['achievability'] != null
          ? Achievability.fromJson(
              json['achievability'] as Map<String, dynamic>)
          : null,
      assessmentStatus: (json['assessmentStatus'] as String?)
          ?.let(AssessmentStatus.fromString),
      associatedSystems: (json['associatedSystems'] as List?)
          ?.nonNulls
          .map((e) => AssociatedSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      dependencyDiscovery: json['dependencyDiscovery'] != null
          ? DependencyDiscoveryConfig.fromJson(
              json['dependencyDiscovery'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      effectivePolicyValues: json['effectivePolicyValues'] != null
          ? EffectivePolicyValues.fromJson(
              json['effectivePolicyValues'] as Map<String, dynamic>)
          : null,
      estimatedAssessmentCost: json['estimatedAssessmentCost'] != null
          ? AssessmentCost.fromJson(
              json['estimatedAssessmentCost'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['kmsKeyId'] as String?,
      openFindingsCount: json['openFindingsCount'] as int?,
      organizationId: json['organizationId'] as String?,
      ouId: json['ouId'] as String?,
      permissionModel: json['permissionModel'] != null
          ? PermissionModel.fromJson(
              json['permissionModel'] as Map<String, dynamic>)
          : null,
      policyArn: json['policyArn'] as String?,
      regions:
          (json['regions'] as List?)?.nonNulls.map((e) => e as String).toList(),
      reportConfiguration: json['reportConfiguration'] != null
          ? ServiceReportConfiguration.fromJson(
              json['reportConfiguration'] as Map<String, dynamic>)
          : null,
      rerunAssessment: json['rerunAssessment'] as bool?,
      resolvedFindingsCount: json['resolvedFindingsCount'] as int?,
      resourceDiscovery: json['resourceDiscovery'] != null
          ? ResourceDiscoveryStatus.fromJson(
              json['resourceDiscovery'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final serviceArn = this.serviceArn;
    final accountId = this.accountId;
    final achievability = this.achievability;
    final assessmentStatus = this.assessmentStatus;
    final associatedSystems = this.associatedSystems;
    final createdAt = this.createdAt;
    final dependencyDiscovery = this.dependencyDiscovery;
    final description = this.description;
    final effectivePolicyValues = this.effectivePolicyValues;
    final estimatedAssessmentCost = this.estimatedAssessmentCost;
    final kmsKeyId = this.kmsKeyId;
    final openFindingsCount = this.openFindingsCount;
    final organizationId = this.organizationId;
    final ouId = this.ouId;
    final permissionModel = this.permissionModel;
    final policyArn = this.policyArn;
    final regions = this.regions;
    final reportConfiguration = this.reportConfiguration;
    final rerunAssessment = this.rerunAssessment;
    final resolvedFindingsCount = this.resolvedFindingsCount;
    final resourceDiscovery = this.resourceDiscovery;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'name': name,
      'serviceArn': serviceArn,
      if (accountId != null) 'accountId': accountId,
      if (achievability != null) 'achievability': achievability,
      if (assessmentStatus != null) 'assessmentStatus': assessmentStatus.value,
      if (associatedSystems != null) 'associatedSystems': associatedSystems,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dependencyDiscovery != null)
        'dependencyDiscovery': dependencyDiscovery,
      if (description != null) 'description': description,
      if (effectivePolicyValues != null)
        'effectivePolicyValues': effectivePolicyValues,
      if (estimatedAssessmentCost != null)
        'estimatedAssessmentCost': estimatedAssessmentCost,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (openFindingsCount != null) 'openFindingsCount': openFindingsCount,
      if (organizationId != null) 'organizationId': organizationId,
      if (ouId != null) 'ouId': ouId,
      if (permissionModel != null) 'permissionModel': permissionModel,
      if (policyArn != null) 'policyArn': policyArn,
      if (regions != null) 'regions': regions,
      if (reportConfiguration != null)
        'reportConfiguration': reportConfiguration,
      if (rerunAssessment != null) 'rerunAssessment': rerunAssessment,
      if (resolvedFindingsCount != null)
        'resolvedFindingsCount': resolvedFindingsCount,
      if (resourceDiscovery != null) 'resourceDiscovery': resourceDiscovery,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Defines the permission model for a service.
///
/// @nodoc
class PermissionModel {
  final String invokerRoleName;

  /// The list of cross-account IAM role ARNs.
  final List<CrossAccountRole>? crossAccountRoles;

  PermissionModel({
    required this.invokerRoleName,
    this.crossAccountRoles,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) {
    return PermissionModel(
      invokerRoleName: (json['invokerRoleName'] as String?) ?? '',
      crossAccountRoles: (json['crossAccountRoles'] as List?)
          ?.nonNulls
          .map((e) => CrossAccountRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final invokerRoleName = this.invokerRoleName;
    final crossAccountRoles = this.crossAccountRoles;
    return {
      'invokerRoleName': invokerRoleName,
      if (crossAccountRoles != null) 'crossAccountRoles': crossAccountRoles,
    };
  }
}

/// Configuration for dependency discovery on a service.
///
/// @nodoc
class DependencyDiscoveryConfig {
  /// The current status of dependency discovery.
  final DependencyDiscoveryStatus status;

  /// The timestamp when dependency discovery was last updated.
  final DateTime? updatedAt;

  DependencyDiscoveryConfig({
    required this.status,
    this.updatedAt,
  });

  factory DependencyDiscoveryConfig.fromJson(Map<String, dynamic> json) {
    return DependencyDiscoveryConfig(
      status: DependencyDiscoveryStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Contains the effective resilience policy values for a service.
///
/// @nodoc
class EffectivePolicyValues {
  /// The effective availability SLO value for the service.
  final SloSource? availabilitySlo;

  /// The effective data recovery time between backups value for the service.
  final TargetSource? dataRecoveryTimeBetweenBackups;

  /// The effective multi-AZ disaster recovery approach for the service.
  final DisasterRecoverySource? multiAzDrApproach;

  /// The effective multi-AZ RPO value for the service, in minutes.
  final TargetSource? multiAzRpo;

  /// The effective multi-AZ RTO value for the service, in minutes.
  final TargetSource? multiAzRto;

  /// The effective multi-Region disaster recovery approach for the service.
  final DisasterRecoverySource? multiRegionDrApproach;

  /// The effective multi-Region RPO value for the service, in minutes.
  final TargetSource? multiRegionRpo;

  /// The effective multi-Region RTO value for the service, in minutes.
  final TargetSource? multiRegionRto;

  EffectivePolicyValues({
    this.availabilitySlo,
    this.dataRecoveryTimeBetweenBackups,
    this.multiAzDrApproach,
    this.multiAzRpo,
    this.multiAzRto,
    this.multiRegionDrApproach,
    this.multiRegionRpo,
    this.multiRegionRto,
  });

  factory EffectivePolicyValues.fromJson(Map<String, dynamic> json) {
    return EffectivePolicyValues(
      availabilitySlo: json['availabilitySlo'] != null
          ? SloSource.fromJson(json['availabilitySlo'] as Map<String, dynamic>)
          : null,
      dataRecoveryTimeBetweenBackups: json['dataRecoveryTimeBetweenBackups'] !=
              null
          ? TargetSource.fromJson(
              json['dataRecoveryTimeBetweenBackups'] as Map<String, dynamic>)
          : null,
      multiAzDrApproach: json['multiAzDrApproach'] != null
          ? DisasterRecoverySource.fromJson(
              json['multiAzDrApproach'] as Map<String, dynamic>)
          : null,
      multiAzRpo: json['multiAzRpo'] != null
          ? TargetSource.fromJson(json['multiAzRpo'] as Map<String, dynamic>)
          : null,
      multiAzRto: json['multiAzRto'] != null
          ? TargetSource.fromJson(json['multiAzRto'] as Map<String, dynamic>)
          : null,
      multiRegionDrApproach: json['multiRegionDrApproach'] != null
          ? DisasterRecoverySource.fromJson(
              json['multiRegionDrApproach'] as Map<String, dynamic>)
          : null,
      multiRegionRpo: json['multiRegionRpo'] != null
          ? TargetSource.fromJson(
              json['multiRegionRpo'] as Map<String, dynamic>)
          : null,
      multiRegionRto: json['multiRegionRto'] != null
          ? TargetSource.fromJson(
              json['multiRegionRto'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilitySlo = this.availabilitySlo;
    final dataRecoveryTimeBetweenBackups = this.dataRecoveryTimeBetweenBackups;
    final multiAzDrApproach = this.multiAzDrApproach;
    final multiAzRpo = this.multiAzRpo;
    final multiAzRto = this.multiAzRto;
    final multiRegionDrApproach = this.multiRegionDrApproach;
    final multiRegionRpo = this.multiRegionRpo;
    final multiRegionRto = this.multiRegionRto;
    return {
      if (availabilitySlo != null) 'availabilitySlo': availabilitySlo,
      if (dataRecoveryTimeBetweenBackups != null)
        'dataRecoveryTimeBetweenBackups': dataRecoveryTimeBetweenBackups,
      if (multiAzDrApproach != null) 'multiAzDrApproach': multiAzDrApproach,
      if (multiAzRpo != null) 'multiAzRpo': multiAzRpo,
      if (multiAzRto != null) 'multiAzRto': multiAzRto,
      if (multiRegionDrApproach != null)
        'multiRegionDrApproach': multiRegionDrApproach,
      if (multiRegionRpo != null) 'multiRegionRpo': multiRegionRpo,
      if (multiRegionRto != null) 'multiRegionRto': multiRegionRto,
    };
  }
}

/// Describes the achievability status of a service's resilience targets based
/// on the most recent assessment.
///
/// @nodoc
class Achievability {
  /// The achievability status of the availability SLO target for the service.
  final AchievabilityStatus? availabilitySlo;

  /// The achievability status of the multi-AZ RTO and RPO targets for the
  /// service.
  final AchievabilityStatus? multiAzRtoRpo;

  /// The achievability status of the multi-Region RTO and RPO targets for the
  /// service.
  final AchievabilityStatus? multiRegionRtoRpo;

  Achievability({
    this.availabilitySlo,
    this.multiAzRtoRpo,
    this.multiRegionRtoRpo,
  });

  factory Achievability.fromJson(Map<String, dynamic> json) {
    return Achievability(
      availabilitySlo: (json['availabilitySlo'] as String?)
          ?.let(AchievabilityStatus.fromString),
      multiAzRtoRpo: (json['multiAzRtoRpo'] as String?)
          ?.let(AchievabilityStatus.fromString),
      multiRegionRtoRpo: (json['multiRegionRtoRpo'] as String?)
          ?.let(AchievabilityStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilitySlo = this.availabilitySlo;
    final multiAzRtoRpo = this.multiAzRtoRpo;
    final multiRegionRtoRpo = this.multiRegionRtoRpo;
    return {
      if (availabilitySlo != null) 'availabilitySlo': availabilitySlo.value,
      if (multiAzRtoRpo != null) 'multiAzRtoRpo': multiAzRtoRpo.value,
      if (multiRegionRtoRpo != null)
        'multiRegionRtoRpo': multiRegionRtoRpo.value,
    };
  }
}

/// Configuration for automatic report generation on a Service.
///
/// @nodoc
class ServiceReportConfiguration {
  /// Output destinations for generated reports.
  final List<ReportOutputConfiguration> reportOutputs;

  ServiceReportConfiguration({
    required this.reportOutputs,
  });

  factory ServiceReportConfiguration.fromJson(Map<String, dynamic> json) {
    return ServiceReportConfiguration(
      reportOutputs: ((json['reportOutputs'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ReportOutputConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final reportOutputs = this.reportOutputs;
    return {
      'reportOutputs': reportOutputs,
    };
  }
}

/// Represents the cost of running a failure mode assessment.
///
/// @nodoc
class AssessmentCost {
  /// The cost amount for the assessment.
  final double? amount;

  /// The currency of the assessment cost.
  final CostCurrency? currency;

  AssessmentCost({
    this.amount,
    this.currency,
  });

  factory AssessmentCost.fromJson(Map<String, dynamic> json) {
    return AssessmentCost(
      amount: json['amount'] as double?,
      currency: (json['currency'] as String?)?.let(CostCurrency.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final currency = this.currency;
    return {
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency.value,
    };
  }
}

/// Contains the status of resource discovery for a service.
///
/// @nodoc
class ResourceDiscoveryStatus {
  /// The error code if resource discovery failed.
  final ResourceDiscoveryErrorCode? errorCode;

  /// A message describing the error if resource discovery failed.
  final String? errorMessage;

  /// The timestamp of the last resource discovery run.
  final DateTime? lastRunAt;

  /// The current status of resource discovery.
  final ResourceDiscoveryRunStatus? status;

  ResourceDiscoveryStatus({
    this.errorCode,
    this.errorMessage,
    this.lastRunAt,
    this.status,
  });

  factory ResourceDiscoveryStatus.fromJson(Map<String, dynamic> json) {
    return ResourceDiscoveryStatus(
      errorCode: (json['errorCode'] as String?)
          ?.let(ResourceDiscoveryErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      lastRunAt: timeStampFromJson(json['lastRunAt']),
      status: (json['status'] as String?)
          ?.let(ResourceDiscoveryRunStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final lastRunAt = this.lastRunAt;
    final status = this.status;
    return {
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (lastRunAt != null) 'lastRunAt': unixTimestampToJson(lastRunAt),
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class AssessmentStatus {
  static const notStarted = AssessmentStatus._('NOT_STARTED');
  static const pending = AssessmentStatus._('PENDING');
  static const inProgress = AssessmentStatus._('IN_PROGRESS');
  static const failed = AssessmentStatus._('FAILED');
  static const success = AssessmentStatus._('SUCCESS');

  final String value;

  const AssessmentStatus._(this.value);

  static const values = [notStarted, pending, inProgress, failed, success];

  static AssessmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssessmentStatus._(value));

  @override
  bool operator ==(other) => other is AssessmentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResourceDiscoveryRunStatus {
  static const running = ResourceDiscoveryRunStatus._('RUNNING');
  static const succeeded = ResourceDiscoveryRunStatus._('SUCCEEDED');
  static const failed = ResourceDiscoveryRunStatus._('FAILED');
  static const completedWithFailures =
      ResourceDiscoveryRunStatus._('COMPLETED_WITH_FAILURES');
  static const notStarted = ResourceDiscoveryRunStatus._('NOT_STARTED');

  final String value;

  const ResourceDiscoveryRunStatus._(this.value);

  static const values = [
    running,
    succeeded,
    failed,
    completedWithFailures,
    notStarted
  ];

  static ResourceDiscoveryRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceDiscoveryRunStatus._(value));

  @override
  bool operator ==(other) =>
      other is ResourceDiscoveryRunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResourceDiscoveryErrorCode {
  static const invalidPermissions =
      ResourceDiscoveryErrorCode._('INVALID_PERMISSIONS');
  static const stackNotFound = ResourceDiscoveryErrorCode._('STACK_NOT_FOUND');
  static const clusterNotFound =
      ResourceDiscoveryErrorCode._('CLUSTER_NOT_FOUND');
  static const stateFileNotFound =
      ResourceDiscoveryErrorCode._('STATE_FILE_NOT_FOUND');
  static const accessDenied = ResourceDiscoveryErrorCode._('ACCESS_DENIED');
  static const unsupportedCluster =
      ResourceDiscoveryErrorCode._('UNSUPPORTED_CLUSTER');
  static const internalError = ResourceDiscoveryErrorCode._('INTERNAL_ERROR');

  final String value;

  const ResourceDiscoveryErrorCode._(this.value);

  static const values = [
    invalidPermissions,
    stackNotFound,
    clusterNotFound,
    stateFileNotFound,
    accessDenied,
    unsupportedCluster,
    internalError
  ];

  static ResourceDiscoveryErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceDiscoveryErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is ResourceDiscoveryErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CostCurrency {
  static const usd = CostCurrency._('USD');

  final String value;

  const CostCurrency._(this.value);

  static const values = [usd];

  static CostCurrency fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CostCurrency._(value));

  @override
  bool operator ==(other) => other is CostCurrency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for a report output destination.
///
/// @nodoc
class ReportOutputConfiguration {
  final S3ReportOutputConfiguration? s3;

  ReportOutputConfiguration({
    this.s3,
  });

  factory ReportOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return ReportOutputConfiguration(
      s3: json['s3'] != null
          ? S3ReportOutputConfiguration.fromJson(
              json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 's3': s3,
    };
  }
}

/// S3 configuration for report output.
///
/// @nodoc
class S3ReportOutputConfiguration {
  /// Account ID of the bucket owner for cross-account access verification.
  final String bucketOwner;

  /// S3 bucket path where reports will be written (e.g.,
  /// my-bucket/ngrh-reports/).
  final String bucketPath;

  S3ReportOutputConfiguration({
    required this.bucketOwner,
    required this.bucketPath,
  });

  factory S3ReportOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return S3ReportOutputConfiguration(
      bucketOwner: (json['bucketOwner'] as String?) ?? '',
      bucketPath: (json['bucketPath'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bucketOwner = this.bucketOwner;
    final bucketPath = this.bucketPath;
    return {
      'bucketOwner': bucketOwner,
      'bucketPath': bucketPath,
    };
  }
}

/// @nodoc
class AchievabilityStatus {
  static const achievable = AchievabilityStatus._('ACHIEVABLE');
  static const notAchievable = AchievabilityStatus._('NOT_ACHIEVABLE');

  final String value;

  const AchievabilityStatus._(this.value);

  static const values = [achievable, notAchievable];

  static AchievabilityStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AchievabilityStatus._(value));

  @override
  bool operator ==(other) =>
      other is AchievabilityStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the effective availability SLO value and its source.
///
/// @nodoc
class SloSource {
  final String? policyName;

  /// Indicates whether the value comes from the service's own account or a
  /// cross-account policy.
  final PolicyValueSource? source;

  /// The availability SLO percentage value.
  final double? value;

  SloSource({
    this.policyName,
    this.source,
    this.value,
  });

  factory SloSource.fromJson(Map<String, dynamic> json) {
    return SloSource(
      policyName: json['policyName'] as String?,
      source: (json['source'] as String?)?.let(PolicyValueSource.fromString),
      value: json['value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final source = this.source;
    final value = this.value;
    return {
      if (policyName != null) 'policyName': policyName,
      if (source != null) 'source': source.value,
      if (value != null) 'value': value,
    };
  }
}

/// Contains an effective RTO or RPO value and its source.
///
/// @nodoc
class TargetSource {
  final String? policyName;

  /// Indicates whether the value comes from the service's own account or a
  /// cross-account policy.
  final PolicyValueSource? source;

  /// The RTO or RPO value in minutes.
  final int? value;

  TargetSource({
    this.policyName,
    this.source,
    this.value,
  });

  factory TargetSource.fromJson(Map<String, dynamic> json) {
    return TargetSource(
      policyName: json['policyName'] as String?,
      source: (json['source'] as String?)?.let(PolicyValueSource.fromString),
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final source = this.source;
    final value = this.value;
    return {
      if (policyName != null) 'policyName': policyName,
      if (source != null) 'source': source.value,
      if (value != null) 'value': value,
    };
  }
}

/// Contains the effective disaster recovery approach value for a service.
///
/// @nodoc
class DisasterRecoverySource {
  final String? policyName;

  /// Indicates whether the value comes from the service's own account or a
  /// cross-account policy.
  final PolicyValueSource? source;

  /// The disaster recovery approach value.
  final String? value;

  DisasterRecoverySource({
    this.policyName,
    this.source,
    this.value,
  });

  factory DisasterRecoverySource.fromJson(Map<String, dynamic> json) {
    return DisasterRecoverySource(
      policyName: json['policyName'] as String?,
      source: (json['source'] as String?)?.let(PolicyValueSource.fromString),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyName = this.policyName;
    final source = this.source;
    final value = this.value;
    return {
      if (policyName != null) 'policyName': policyName,
      if (source != null) 'source': source.value,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class PolicyValueSource {
  static const self = PolicyValueSource._('SELF');
  static const crossAccount = PolicyValueSource._('CROSS_ACCOUNT');

  final String value;

  const PolicyValueSource._(this.value);

  static const values = [self, crossAccount];

  static PolicyValueSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PolicyValueSource._(value));

  @override
  bool operator ==(other) => other is PolicyValueSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DependencyDiscoveryStatus {
  static const enabled = DependencyDiscoveryStatus._('ENABLED');
  static const initializing = DependencyDiscoveryStatus._('INITIALIZING');
  static const disabled = DependencyDiscoveryStatus._('DISABLED');

  final String value;

  const DependencyDiscoveryStatus._(this.value);

  static const values = [enabled, initializing, disabled];

  static DependencyDiscoveryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DependencyDiscoveryStatus._(value));

  @override
  bool operator ==(other) =>
      other is DependencyDiscoveryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies a cross-account IAM role ARN and optional external ID.
///
/// @nodoc
class CrossAccountRole {
  final String crossAccountRoleArn;

  /// The external ID used for assuming the cross-account role.
  final String? externalId;

  CrossAccountRole({
    required this.crossAccountRoleArn,
    this.externalId,
  });

  factory CrossAccountRole.fromJson(Map<String, dynamic> json) {
    return CrossAccountRole(
      crossAccountRoleArn: (json['crossAccountRoleArn'] as String?) ?? '',
      externalId: json['externalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final crossAccountRoleArn = this.crossAccountRoleArn;
    final externalId = this.externalId;
    return {
      'crossAccountRoleArn': crossAccountRoleArn,
      if (externalId != null) 'externalId': externalId,
    };
  }
}

/// Represents a system associated with a service.
///
/// @nodoc
class AssociatedSystem {
  final String systemArn;
  final String? systemName;

  /// The list of user journey identifiers that associate this system with the
  /// service.
  final List<String>? userJourneyIds;

  AssociatedSystem({
    required this.systemArn,
    this.systemName,
    this.userJourneyIds,
  });

  factory AssociatedSystem.fromJson(Map<String, dynamic> json) {
    return AssociatedSystem(
      systemArn: (json['systemArn'] as String?) ?? '',
      systemName: json['systemName'] as String?,
      userJourneyIds: (json['userJourneyIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final systemArn = this.systemArn;
    final systemName = this.systemName;
    final userJourneyIds = this.userJourneyIds;
    return {
      'systemArn': systemArn,
      if (systemName != null) 'systemName': systemName,
      if (userJourneyIds != null) 'userJourneyIds': userJourneyIds,
    };
  }
}

/// Caller-settable values for dependency discovery. INITIALIZING is
/// system-managed.
///
/// @nodoc
class DependencyDiscoveryInput {
  static const enabled = DependencyDiscoveryInput._('ENABLED');
  static const disabled = DependencyDiscoveryInput._('DISABLED');

  final String value;

  const DependencyDiscoveryInput._(this.value);

  static const values = [enabled, disabled];

  static DependencyDiscoveryInput fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DependencyDiscoveryInput._(value));

  @override
  bool operator ==(other) =>
      other is DependencyDiscoveryInput && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a resilience policy that defines availability and disaster
/// recovery requirements.
///
/// @nodoc
class Policy {
  final String name;
  final String policyArn;

  /// The number of services associated with this policy.
  final int? associatedServiceCount;

  /// The availability SLO defined in the policy.
  final AvailabilitySlo? availabilitySlo;

  /// The timestamp when the policy was created.
  final DateTime? createdAt;

  /// The data recovery targets defined in the policy.
  final DataRecoveryTargets? dataRecovery;
  final String? description;
  final String? kmsKeyId;

  /// The multi-AZ disaster recovery targets defined in the policy.
  final MultiAzTargets? multiAz;

  /// The multi-Region disaster recovery targets defined in the policy.
  final MultiRegionTargets? multiRegion;
  final Map<String, String>? tags;

  /// The timestamp when the policy was last updated.
  final DateTime? updatedAt;

  Policy({
    required this.name,
    required this.policyArn,
    this.associatedServiceCount,
    this.availabilitySlo,
    this.createdAt,
    this.dataRecovery,
    this.description,
    this.kmsKeyId,
    this.multiAz,
    this.multiRegion,
    this.tags,
    this.updatedAt,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      name: (json['name'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
      associatedServiceCount: json['associatedServiceCount'] as int?,
      availabilitySlo: json['availabilitySlo'] != null
          ? AvailabilitySlo.fromJson(
              json['availabilitySlo'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      dataRecovery: json['dataRecovery'] != null
          ? DataRecoveryTargets.fromJson(
              json['dataRecovery'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      multiAz: json['multiAz'] != null
          ? MultiAzTargets.fromJson(json['multiAz'] as Map<String, dynamic>)
          : null,
      multiRegion: json['multiRegion'] != null
          ? MultiRegionTargets.fromJson(
              json['multiRegion'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final policyArn = this.policyArn;
    final associatedServiceCount = this.associatedServiceCount;
    final availabilitySlo = this.availabilitySlo;
    final createdAt = this.createdAt;
    final dataRecovery = this.dataRecovery;
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final multiAz = this.multiAz;
    final multiRegion = this.multiRegion;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'name': name,
      'policyArn': policyArn,
      if (associatedServiceCount != null)
        'associatedServiceCount': associatedServiceCount,
      if (availabilitySlo != null) 'availabilitySlo': availabilitySlo,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dataRecovery != null) 'dataRecovery': dataRecovery,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (multiAz != null) 'multiAz': multiAz,
      if (multiRegion != null) 'multiRegion': multiRegion,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Defines the availability service level objective (SLO) for a resilience
/// policy.
///
/// @nodoc
class AvailabilitySlo {
  /// The target availability percentage, expressed as a value between 0 and 100.
  final double? target;

  AvailabilitySlo({
    this.target,
  });

  factory AvailabilitySlo.fromJson(Map<String, dynamic> json) {
    return AvailabilitySlo(
      target: json['target'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final target = this.target;
    return {
      if (target != null) 'target': target,
    };
  }
}

/// Defines the multi-AZ disaster recovery targets for a resilience policy.
///
/// @nodoc
class MultiAzTargets {
  /// The disaster recovery approach for multi-AZ.
  final MultiAzDisasterRecoveryApproach? disasterRecoveryApproach;

  /// The recovery point objective (RPO) target for multi-AZ, in minutes.
  final int? rpoInMinutes;

  /// The recovery time objective (RTO) target for multi-AZ, in minutes.
  final int? rtoInMinutes;

  MultiAzTargets({
    this.disasterRecoveryApproach,
    this.rpoInMinutes,
    this.rtoInMinutes,
  });

  factory MultiAzTargets.fromJson(Map<String, dynamic> json) {
    return MultiAzTargets(
      disasterRecoveryApproach: (json['disasterRecoveryApproach'] as String?)
          ?.let(MultiAzDisasterRecoveryApproach.fromString),
      rpoInMinutes: json['rpoInMinutes'] as int?,
      rtoInMinutes: json['rtoInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final disasterRecoveryApproach = this.disasterRecoveryApproach;
    final rpoInMinutes = this.rpoInMinutes;
    final rtoInMinutes = this.rtoInMinutes;
    return {
      if (disasterRecoveryApproach != null)
        'disasterRecoveryApproach': disasterRecoveryApproach.value,
      if (rpoInMinutes != null) 'rpoInMinutes': rpoInMinutes,
      if (rtoInMinutes != null) 'rtoInMinutes': rtoInMinutes,
    };
  }
}

/// Defines the multi-Region disaster recovery targets for a resilience policy.
///
/// @nodoc
class MultiRegionTargets {
  /// The disaster recovery approach for multi-Region.
  final MultiRegionDisasterRecoveryApproach? disasterRecoveryApproach;

  /// The recovery point objective (RPO) target for multi-Region, in minutes.
  final int? rpoInMinutes;

  /// The recovery time objective (RTO) target for multi-Region, in minutes.
  final int? rtoInMinutes;

  MultiRegionTargets({
    this.disasterRecoveryApproach,
    this.rpoInMinutes,
    this.rtoInMinutes,
  });

  factory MultiRegionTargets.fromJson(Map<String, dynamic> json) {
    return MultiRegionTargets(
      disasterRecoveryApproach: (json['disasterRecoveryApproach'] as String?)
          ?.let(MultiRegionDisasterRecoveryApproach.fromString),
      rpoInMinutes: json['rpoInMinutes'] as int?,
      rtoInMinutes: json['rtoInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final disasterRecoveryApproach = this.disasterRecoveryApproach;
    final rpoInMinutes = this.rpoInMinutes;
    final rtoInMinutes = this.rtoInMinutes;
    return {
      if (disasterRecoveryApproach != null)
        'disasterRecoveryApproach': disasterRecoveryApproach.value,
      if (rpoInMinutes != null) 'rpoInMinutes': rpoInMinutes,
      if (rtoInMinutes != null) 'rtoInMinutes': rtoInMinutes,
    };
  }
}

/// Defines data recovery targets for a resilience policy.
///
/// @nodoc
class DataRecoveryTargets {
  /// The target time between backups, in minutes.
  final int? timeBetweenBackupsInMinutes;

  DataRecoveryTargets({
    this.timeBetweenBackupsInMinutes,
  });

  factory DataRecoveryTargets.fromJson(Map<String, dynamic> json) {
    return DataRecoveryTargets(
      timeBetweenBackupsInMinutes: json['timeBetweenBackupsInMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeBetweenBackupsInMinutes = this.timeBetweenBackupsInMinutes;
    return {
      if (timeBetweenBackupsInMinutes != null)
        'timeBetweenBackupsInMinutes': timeBetweenBackupsInMinutes,
    };
  }
}

/// @nodoc
class MultiRegionDisasterRecoveryApproach {
  static const activeActive =
      MultiRegionDisasterRecoveryApproach._('ACTIVE_ACTIVE');
  static const hotStandby =
      MultiRegionDisasterRecoveryApproach._('HOT_STANDBY');
  static const warmStandby =
      MultiRegionDisasterRecoveryApproach._('WARM_STANDBY');
  static const pilotLight =
      MultiRegionDisasterRecoveryApproach._('PILOT_LIGHT');
  static const backupAndRestore =
      MultiRegionDisasterRecoveryApproach._('BACKUP_AND_RESTORE');

  final String value;

  const MultiRegionDisasterRecoveryApproach._(this.value);

  static const values = [
    activeActive,
    hotStandby,
    warmStandby,
    pilotLight,
    backupAndRestore
  ];

  static MultiRegionDisasterRecoveryApproach fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MultiRegionDisasterRecoveryApproach._(value));

  @override
  bool operator ==(other) =>
      other is MultiRegionDisasterRecoveryApproach && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MultiAzDisasterRecoveryApproach {
  static const activeActive =
      MultiAzDisasterRecoveryApproach._('ACTIVE_ACTIVE');
  static const hotStandby = MultiAzDisasterRecoveryApproach._('HOT_STANDBY');
  static const warmStandby = MultiAzDisasterRecoveryApproach._('WARM_STANDBY');
  static const pilotLight = MultiAzDisasterRecoveryApproach._('PILOT_LIGHT');
  static const backupAndRestore =
      MultiAzDisasterRecoveryApproach._('BACKUP_AND_RESTORE');

  final String value;

  const MultiAzDisasterRecoveryApproach._(this.value);

  static const values = [
    activeActive,
    hotStandby,
    warmStandby,
    pilotLight,
    backupAndRestore
  ];

  static MultiAzDisasterRecoveryApproach fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MultiAzDisasterRecoveryApproach._(value));

  @override
  bool operator ==(other) =>
      other is MultiAzDisasterRecoveryApproach && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a resilience finding from a failure mode assessment.
///
/// @nodoc
class Finding {
  /// A user-provided comment about the finding.
  final String? comment;
  final String? description;

  /// The failure category of the finding.
  final FailureCategory? failureCategory;

  /// The unique identifier of the finding.
  final String? findingId;

  /// Infrastructure and code recommendations to address the finding.
  final List<InfrastructureAndCodeRecommendation>?
      infrastructureAndCodeRecommendations;

  /// The name of the finding.
  final String? name;

  /// Observability recommendations to address the finding.
  final List<ObservabilityRecommendation>? observabilityRecommendations;

  /// The policy component associated with the finding.
  final PolicyComponent? policyComponent;

  /// The reasoning behind the finding.
  final String? reasoning;

  /// The service functions associated with the finding.
  final List<String>? serviceFunctions;

  /// The severity of the finding.
  final FindingSeverity? severity;

  /// The current status of the finding.
  final FindingStatus? status;

  /// Testing recommendations to address the finding.
  final List<TestingRecommendation>? testingRecommendations;

  /// The timestamp when the finding was last updated.
  final DateTime? updatedAt;

  Finding({
    this.comment,
    this.description,
    this.failureCategory,
    this.findingId,
    this.infrastructureAndCodeRecommendations,
    this.name,
    this.observabilityRecommendations,
    this.policyComponent,
    this.reasoning,
    this.serviceFunctions,
    this.severity,
    this.status,
    this.testingRecommendations,
    this.updatedAt,
  });

  factory Finding.fromJson(Map<String, dynamic> json) {
    return Finding(
      comment: json['comment'] as String?,
      description: json['description'] as String?,
      failureCategory:
          (json['failureCategory'] as String?)?.let(FailureCategory.fromString),
      findingId: json['findingId'] as String?,
      infrastructureAndCodeRecommendations:
          (json['infrastructureAndCodeRecommendations'] as List?)
              ?.nonNulls
              .map((e) => InfrastructureAndCodeRecommendation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      name: json['name'] as String?,
      observabilityRecommendations: (json['observabilityRecommendations']
              as List?)
          ?.nonNulls
          .map((e) =>
              ObservabilityRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      policyComponent:
          (json['policyComponent'] as String?)?.let(PolicyComponent.fromString),
      reasoning: json['reasoning'] as String?,
      serviceFunctions: (json['serviceFunctions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      severity: (json['severity'] as String?)?.let(FindingSeverity.fromString),
      status: (json['status'] as String?)?.let(FindingStatus.fromString),
      testingRecommendations: (json['testingRecommendations'] as List?)
          ?.nonNulls
          .map((e) => TestingRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final description = this.description;
    final failureCategory = this.failureCategory;
    final findingId = this.findingId;
    final infrastructureAndCodeRecommendations =
        this.infrastructureAndCodeRecommendations;
    final name = this.name;
    final observabilityRecommendations = this.observabilityRecommendations;
    final policyComponent = this.policyComponent;
    final reasoning = this.reasoning;
    final serviceFunctions = this.serviceFunctions;
    final severity = this.severity;
    final status = this.status;
    final testingRecommendations = this.testingRecommendations;
    final updatedAt = this.updatedAt;
    return {
      if (comment != null) 'comment': comment,
      if (description != null) 'description': description,
      if (failureCategory != null) 'failureCategory': failureCategory.value,
      if (findingId != null) 'findingId': findingId,
      if (infrastructureAndCodeRecommendations != null)
        'infrastructureAndCodeRecommendations':
            infrastructureAndCodeRecommendations,
      if (name != null) 'name': name,
      if (observabilityRecommendations != null)
        'observabilityRecommendations': observabilityRecommendations,
      if (policyComponent != null) 'policyComponent': policyComponent.value,
      if (reasoning != null) 'reasoning': reasoning,
      if (serviceFunctions != null) 'serviceFunctions': serviceFunctions,
      if (severity != null) 'severity': severity.value,
      if (status != null) 'status': status.value,
      if (testingRecommendations != null)
        'testingRecommendations': testingRecommendations,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class FailureCategory {
  static const sharedFate = FailureCategory._('SHARED_FATE');
  static const excessiveLoad = FailureCategory._('EXCESSIVE_LOAD');
  static const excessiveLatency = FailureCategory._('EXCESSIVE_LATENCY');
  static const misconfigurationAndBugs =
      FailureCategory._('MISCONFIGURATION_AND_BUGS');
  static const singlePointOfFailure =
      FailureCategory._('SINGLE_POINT_OF_FAILURE');

  final String value;

  const FailureCategory._(this.value);

  static const values = [
    sharedFate,
    excessiveLoad,
    excessiveLatency,
    misconfigurationAndBugs,
    singlePointOfFailure
  ];

  static FailureCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FailureCategory._(value));

  @override
  bool operator ==(other) => other is FailureCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FindingStatus {
  static const open = FindingStatus._('OPEN');
  static const resolved = FindingStatus._('RESOLVED');
  static const irrelevant = FindingStatus._('IRRELEVANT');

  final String value;

  const FindingStatus._(this.value);

  static const values = [open, resolved, irrelevant];

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

/// @nodoc
class FindingSeverity {
  static const low = FindingSeverity._('LOW');
  static const medium = FindingSeverity._('MEDIUM');
  static const high = FindingSeverity._('HIGH');

  final String value;

  const FindingSeverity._(this.value);

  static const values = [low, medium, high];

  static FindingSeverity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FindingSeverity._(value));

  @override
  bool operator ==(other) => other is FindingSeverity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PolicyComponent {
  static const availabilitySlo = PolicyComponent._('AVAILABILITY_SLO');
  static const multiAzDisasterRecovery =
      PolicyComponent._('MULTI_AZ_DISASTER_RECOVERY');
  static const multiRegionDisasterRecovery =
      PolicyComponent._('MULTI_REGION_DISASTER_RECOVERY');
  static const dataRecovery = PolicyComponent._('DATA_RECOVERY');

  final String value;

  const PolicyComponent._(this.value);

  static const values = [
    availabilitySlo,
    multiAzDisasterRecovery,
    multiRegionDisasterRecovery,
    dataRecovery
  ];

  static PolicyComponent fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PolicyComponent._(value));

  @override
  bool operator ==(other) => other is PolicyComponent && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A testing recommendation to address a finding.
///
/// @nodoc
class TestingRecommendation {
  /// The list of suggested testing changes.
  final List<String>? suggestedChanges;

  TestingRecommendation({
    this.suggestedChanges,
  });

  factory TestingRecommendation.fromJson(Map<String, dynamic> json) {
    return TestingRecommendation(
      suggestedChanges: (json['suggestedChanges'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final suggestedChanges = this.suggestedChanges;
    return {
      if (suggestedChanges != null) 'suggestedChanges': suggestedChanges,
    };
  }
}

/// An observability recommendation to address a finding.
///
/// @nodoc
class ObservabilityRecommendation {
  /// The list of suggested observability changes.
  final List<String>? suggestedChanges;

  ObservabilityRecommendation({
    this.suggestedChanges,
  });

  factory ObservabilityRecommendation.fromJson(Map<String, dynamic> json) {
    return ObservabilityRecommendation(
      suggestedChanges: (json['suggestedChanges'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final suggestedChanges = this.suggestedChanges;
    return {
      if (suggestedChanges != null) 'suggestedChanges': suggestedChanges,
    };
  }
}

/// An infrastructure and code recommendation to address a finding.
///
/// @nodoc
class InfrastructureAndCodeRecommendation {
  /// The list of suggested changes.
  final List<String>? suggestedChanges;

  InfrastructureAndCodeRecommendation({
    this.suggestedChanges,
  });

  factory InfrastructureAndCodeRecommendation.fromJson(
      Map<String, dynamic> json) {
    return InfrastructureAndCodeRecommendation(
      suggestedChanges: (json['suggestedChanges'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final suggestedChanges = this.suggestedChanges;
    return {
      if (suggestedChanges != null) 'suggestedChanges': suggestedChanges,
    };
  }
}

/// @nodoc
class DependencyCriticality {
  static const hard = DependencyCriticality._('HARD');
  static const soft = DependencyCriticality._('SOFT');
  static const unknown = DependencyCriticality._('UNKNOWN');

  final String value;

  const DependencyCriticality._(this.value);

  static const values = [hard, soft, unknown];

  static DependencyCriticality fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DependencyCriticality._(value));

  @override
  bool operator ==(other) =>
      other is DependencyCriticality && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a resilience assertion for a service.
///
/// @nodoc
class Assertion {
  /// The unique identifier of the assertion.
  final String assertionId;
  final String serviceArn;

  /// The source of the assertion, indicating whether it was AI-generated or
  /// created by a user.
  final AssertionSource source;

  /// The text content of the assertion.
  final String text;

  /// The timestamp when the assertion was created.
  final DateTime? createdAt;

  /// The timestamp when the assertion was last updated.
  final DateTime? updatedAt;

  Assertion({
    required this.assertionId,
    required this.serviceArn,
    required this.source,
    required this.text,
    this.createdAt,
    this.updatedAt,
  });

  factory Assertion.fromJson(Map<String, dynamic> json) {
    return Assertion(
      assertionId: (json['assertionId'] as String?) ?? '',
      serviceArn: (json['serviceArn'] as String?) ?? '',
      source: AssertionSource.fromString((json['source'] as String?) ?? ''),
      text: (json['text'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final assertionId = this.assertionId;
    final serviceArn = this.serviceArn;
    final source = this.source;
    final text = this.text;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    return {
      'assertionId': assertionId,
      'serviceArn': serviceArn,
      'source': source.value,
      'text': text,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class AssertionSource {
  static const aiGenerated = AssertionSource._('AI_GENERATED');
  static const user = AssertionSource._('USER');

  final String value;

  const AssertionSource._(this.value);

  static const values = [aiGenerated, user];

  static AssertionSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssertionSource._(value));

  @override
  bool operator ==(other) => other is AssertionSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a user journey.
///
/// @nodoc
class UserJourneySummary {
  final String name;

  /// The unique identifier of the user journey.
  final String userJourneyId;

  /// The timestamp when the user journey was created.
  final DateTime? createdAt;

  /// The timestamp when the user journey was last updated.
  final DateTime? updatedAt;

  UserJourneySummary({
    required this.name,
    required this.userJourneyId,
    this.createdAt,
    this.updatedAt,
  });

  factory UserJourneySummary.fromJson(Map<String, dynamic> json) {
    return UserJourneySummary(
      name: (json['name'] as String?) ?? '',
      userJourneyId: (json['userJourneyId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final userJourneyId = this.userJourneyId;
    final createdAt = this.createdAt;
    final updatedAt = this.updatedAt;
    return {
      'name': name,
      'userJourneyId': userJourneyId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Contains summary information about a system.
///
/// @nodoc
class SystemSummary {
  final String name;
  final String systemId;

  /// The timestamp when the system was created.
  final DateTime? createdAt;

  /// Displayed only if caller has access.
  final String? organizationId;

  /// Displayed only if caller has access.
  final String? ouId;

  /// The number of services in the system.
  final int? servicesCount;
  final String? systemArn;

  /// The timestamp when the system was last updated.
  final DateTime? updatedAt;

  /// The number of user journeys in the system.
  final int? userJourneysCount;

  SystemSummary({
    required this.name,
    required this.systemId,
    this.createdAt,
    this.organizationId,
    this.ouId,
    this.servicesCount,
    this.systemArn,
    this.updatedAt,
    this.userJourneysCount,
  });

  factory SystemSummary.fromJson(Map<String, dynamic> json) {
    return SystemSummary(
      name: (json['name'] as String?) ?? '',
      systemId: (json['systemId'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      organizationId: json['organizationId'] as String?,
      ouId: json['ouId'] as String?,
      servicesCount: json['servicesCount'] as int?,
      systemArn: json['systemArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      userJourneysCount: json['userJourneysCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final systemId = this.systemId;
    final createdAt = this.createdAt;
    final organizationId = this.organizationId;
    final ouId = this.ouId;
    final servicesCount = this.servicesCount;
    final systemArn = this.systemArn;
    final updatedAt = this.updatedAt;
    final userJourneysCount = this.userJourneysCount;
    return {
      'name': name,
      'systemId': systemId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (organizationId != null) 'organizationId': organizationId,
      if (ouId != null) 'ouId': ouId,
      if (servicesCount != null) 'servicesCount': servicesCount,
      if (systemArn != null) 'systemArn': systemArn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (userJourneysCount != null) 'userJourneysCount': userJourneysCount,
    };
  }
}

/// Represents an event in the system event log.
///
/// @nodoc
class SystemEvent {
  /// The actor that triggered the event.
  final EventActor actor;

  /// The details of the event.
  final SystemEventDetails eventDetails;

  /// The unique identifier of the event.
  final String eventId;

  /// The type of the event.
  final SystemEventType eventType;
  final String systemArn;

  /// The timestamp of the event.
  final DateTime timestamp;

  SystemEvent({
    required this.actor,
    required this.eventDetails,
    required this.eventId,
    required this.eventType,
    required this.systemArn,
    required this.timestamp,
  });

  factory SystemEvent.fromJson(Map<String, dynamic> json) {
    return SystemEvent(
      actor: EventActor.fromJson((json['actor'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      eventDetails: SystemEventDetails.fromJson(
          (json['eventDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      eventId: (json['eventId'] as String?) ?? '',
      eventType:
          SystemEventType.fromString((json['eventType'] as String?) ?? ''),
      systemArn: (json['systemArn'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final actor = this.actor;
    final eventDetails = this.eventDetails;
    final eventId = this.eventId;
    final eventType = this.eventType;
    final systemArn = this.systemArn;
    final timestamp = this.timestamp;
    return {
      'actor': actor,
      'eventDetails': eventDetails,
      'eventId': eventId,
      'eventType': eventType.value,
      'systemArn': systemArn,
      'timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// @nodoc
class SystemEventType {
  static const systemCreated = SystemEventType._('SYSTEM_CREATED');
  static const systemDeleted = SystemEventType._('SYSTEM_DELETED');
  static const systemUserJourneyCreated =
      SystemEventType._('SYSTEM_USER_JOURNEY_CREATED');
  static const systemUserJourneyUpdated =
      SystemEventType._('SYSTEM_USER_JOURNEY_UPDATED');
  static const systemUserJourneyDeleted =
      SystemEventType._('SYSTEM_USER_JOURNEY_DELETED');
  static const systemServiceAssociated =
      SystemEventType._('SYSTEM_SERVICE_ASSOCIATED');
  static const systemServiceDisassociated =
      SystemEventType._('SYSTEM_SERVICE_DISASSOCIATED');
  static const systemPolicyAssociated =
      SystemEventType._('SYSTEM_POLICY_ASSOCIATED');
  static const systemPolicyDisassociated =
      SystemEventType._('SYSTEM_POLICY_DISASSOCIATED');

  final String value;

  const SystemEventType._(this.value);

  static const values = [
    systemCreated,
    systemDeleted,
    systemUserJourneyCreated,
    systemUserJourneyUpdated,
    systemUserJourneyDeleted,
    systemServiceAssociated,
    systemServiceDisassociated,
    systemPolicyAssociated,
    systemPolicyDisassociated
  ];

  static SystemEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SystemEventType._(value));

  @override
  bool operator ==(other) => other is SystemEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Identifies the actor that triggered an event.
///
/// @nodoc
class EventActor {
  /// The principal ID of the actor.
  final String principalId;

  /// The type of actor, either USER or SYSTEM.
  final ActorType type;

  /// The AWS account ID of the actor.
  final String? accountId;

  /// The user name of the actor.
  final String? userName;

  EventActor({
    required this.principalId,
    required this.type,
    this.accountId,
    this.userName,
  });

  factory EventActor.fromJson(Map<String, dynamic> json) {
    return EventActor(
      principalId: (json['principalId'] as String?) ?? '',
      type: ActorType.fromString((json['type'] as String?) ?? ''),
      accountId: json['accountId'] as String?,
      userName: json['userName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final principalId = this.principalId;
    final type = this.type;
    final accountId = this.accountId;
    final userName = this.userName;
    return {
      'principalId': principalId,
      'type': type.value,
      if (accountId != null) 'accountId': accountId,
      if (userName != null) 'userName': userName,
    };
  }
}

/// Contains the details of a system event.
///
/// @nodoc
class SystemEventDetails {
  /// The description of the event.
  final String description;

  /// The title of the event.
  final String title;
  final SystemEventMetadata? eventMetadata;

  SystemEventDetails({
    required this.description,
    required this.title,
    this.eventMetadata,
  });

  factory SystemEventDetails.fromJson(Map<String, dynamic> json) {
    return SystemEventDetails(
      description: (json['description'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      eventMetadata: json['eventMetadata'] != null
          ? SystemEventMetadata.fromJson(
              json['eventMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final title = this.title;
    final eventMetadata = this.eventMetadata;
    return {
      'description': description,
      'title': title,
      if (eventMetadata != null) 'eventMetadata': eventMetadata,
    };
  }
}

/// Type-specific metadata for each system event type.
///
/// @nodoc
class SystemEventMetadata {
  /// Metadata for a system created event.
  final SystemCreatedMetadata? systemCreated;

  /// Metadata for a system deleted event.
  final SystemDeletedMetadata? systemDeleted;

  /// Metadata for a system policy associated event.
  final SystemPolicyAssociatedMetadata? systemPolicyAssociated;

  /// Metadata for a system policy disassociated event.
  final SystemPolicyDisassociatedMetadata? systemPolicyDisassociated;

  /// Metadata for a system service associated event.
  final SystemServiceAssociatedMetadata? systemServiceAssociated;

  /// Metadata for a system service disassociated event.
  final SystemServiceDisassociatedMetadata? systemServiceDisassociated;

  /// Metadata for a system user journey created event.
  final SystemUserJourneyCreatedMetadata? systemUserJourneyCreated;

  /// Metadata for a system user journey deleted event.
  final SystemUserJourneyDeletedMetadata? systemUserJourneyDeleted;

  /// Metadata for a system user journey updated event.
  final SystemUserJourneyUpdatedMetadata? systemUserJourneyUpdated;

  SystemEventMetadata({
    this.systemCreated,
    this.systemDeleted,
    this.systemPolicyAssociated,
    this.systemPolicyDisassociated,
    this.systemServiceAssociated,
    this.systemServiceDisassociated,
    this.systemUserJourneyCreated,
    this.systemUserJourneyDeleted,
    this.systemUserJourneyUpdated,
  });

  factory SystemEventMetadata.fromJson(Map<String, dynamic> json) {
    return SystemEventMetadata(
      systemCreated: json['systemCreated'] != null
          ? SystemCreatedMetadata.fromJson(
              json['systemCreated'] as Map<String, dynamic>)
          : null,
      systemDeleted: json['systemDeleted'] != null
          ? SystemDeletedMetadata.fromJson(
              json['systemDeleted'] as Map<String, dynamic>)
          : null,
      systemPolicyAssociated: json['systemPolicyAssociated'] != null
          ? SystemPolicyAssociatedMetadata.fromJson(
              json['systemPolicyAssociated'] as Map<String, dynamic>)
          : null,
      systemPolicyDisassociated: json['systemPolicyDisassociated'] != null
          ? SystemPolicyDisassociatedMetadata.fromJson(
              json['systemPolicyDisassociated'] as Map<String, dynamic>)
          : null,
      systemServiceAssociated: json['systemServiceAssociated'] != null
          ? SystemServiceAssociatedMetadata.fromJson(
              json['systemServiceAssociated'] as Map<String, dynamic>)
          : null,
      systemServiceDisassociated: json['systemServiceDisassociated'] != null
          ? SystemServiceDisassociatedMetadata.fromJson(
              json['systemServiceDisassociated'] as Map<String, dynamic>)
          : null,
      systemUserJourneyCreated: json['systemUserJourneyCreated'] != null
          ? SystemUserJourneyCreatedMetadata.fromJson(
              json['systemUserJourneyCreated'] as Map<String, dynamic>)
          : null,
      systemUserJourneyDeleted: json['systemUserJourneyDeleted'] != null
          ? SystemUserJourneyDeletedMetadata.fromJson(
              json['systemUserJourneyDeleted'] as Map<String, dynamic>)
          : null,
      systemUserJourneyUpdated: json['systemUserJourneyUpdated'] != null
          ? SystemUserJourneyUpdatedMetadata.fromJson(
              json['systemUserJourneyUpdated'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final systemCreated = this.systemCreated;
    final systemDeleted = this.systemDeleted;
    final systemPolicyAssociated = this.systemPolicyAssociated;
    final systemPolicyDisassociated = this.systemPolicyDisassociated;
    final systemServiceAssociated = this.systemServiceAssociated;
    final systemServiceDisassociated = this.systemServiceDisassociated;
    final systemUserJourneyCreated = this.systemUserJourneyCreated;
    final systemUserJourneyDeleted = this.systemUserJourneyDeleted;
    final systemUserJourneyUpdated = this.systemUserJourneyUpdated;
    return {
      if (systemCreated != null) 'systemCreated': systemCreated,
      if (systemDeleted != null) 'systemDeleted': systemDeleted,
      if (systemPolicyAssociated != null)
        'systemPolicyAssociated': systemPolicyAssociated,
      if (systemPolicyDisassociated != null)
        'systemPolicyDisassociated': systemPolicyDisassociated,
      if (systemServiceAssociated != null)
        'systemServiceAssociated': systemServiceAssociated,
      if (systemServiceDisassociated != null)
        'systemServiceDisassociated': systemServiceDisassociated,
      if (systemUserJourneyCreated != null)
        'systemUserJourneyCreated': systemUserJourneyCreated,
      if (systemUserJourneyDeleted != null)
        'systemUserJourneyDeleted': systemUserJourneyDeleted,
      if (systemUserJourneyUpdated != null)
        'systemUserJourneyUpdated': systemUserJourneyUpdated,
    };
  }
}

/// Metadata for a system created event.
///
/// @nodoc
class SystemCreatedMetadata {
  SystemCreatedMetadata();

  factory SystemCreatedMetadata.fromJson(Map<String, dynamic> _) {
    return SystemCreatedMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Metadata for a system deleted event.
///
/// @nodoc
class SystemDeletedMetadata {
  SystemDeletedMetadata();

  factory SystemDeletedMetadata.fromJson(Map<String, dynamic> _) {
    return SystemDeletedMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Metadata for a system user journey created event.
///
/// @nodoc
class SystemUserJourneyCreatedMetadata {
  /// The services associated with the created user journey.
  final List<ServiceReference>? associatedServices;

  /// The name of the created user journey.
  final String? userJourneyName;

  SystemUserJourneyCreatedMetadata({
    this.associatedServices,
    this.userJourneyName,
  });

  factory SystemUserJourneyCreatedMetadata.fromJson(Map<String, dynamic> json) {
    return SystemUserJourneyCreatedMetadata(
      associatedServices: (json['associatedServices'] as List?)
          ?.nonNulls
          .map((e) => ServiceReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      userJourneyName: json['userJourneyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedServices = this.associatedServices;
    final userJourneyName = this.userJourneyName;
    return {
      if (associatedServices != null) 'associatedServices': associatedServices,
      if (userJourneyName != null) 'userJourneyName': userJourneyName,
    };
  }
}

/// Metadata for a system user journey updated event.
///
/// @nodoc
class SystemUserJourneyUpdatedMetadata {
  /// The changes made to the user journey.
  final UserJourneyChanges? changes;

  /// The name of the updated user journey.
  final String? userJourneyName;

  SystemUserJourneyUpdatedMetadata({
    this.changes,
    this.userJourneyName,
  });

  factory SystemUserJourneyUpdatedMetadata.fromJson(Map<String, dynamic> json) {
    return SystemUserJourneyUpdatedMetadata(
      changes: json['changes'] != null
          ? UserJourneyChanges.fromJson(json['changes'] as Map<String, dynamic>)
          : null,
      userJourneyName: json['userJourneyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changes = this.changes;
    final userJourneyName = this.userJourneyName;
    return {
      if (changes != null) 'changes': changes,
      if (userJourneyName != null) 'userJourneyName': userJourneyName,
    };
  }
}

/// Metadata for a system user journey deleted event.
///
/// @nodoc
class SystemUserJourneyDeletedMetadata {
  /// The services that were associated at the time of deletion.
  final List<ServiceReference>? associatedServicesAtDeletion;

  /// The name of the deleted user journey.
  final String? userJourneyName;

  SystemUserJourneyDeletedMetadata({
    this.associatedServicesAtDeletion,
    this.userJourneyName,
  });

  factory SystemUserJourneyDeletedMetadata.fromJson(Map<String, dynamic> json) {
    return SystemUserJourneyDeletedMetadata(
      associatedServicesAtDeletion:
          (json['associatedServicesAtDeletion'] as List?)
              ?.nonNulls
              .map((e) => ServiceReference.fromJson(e as Map<String, dynamic>))
              .toList(),
      userJourneyName: json['userJourneyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedServicesAtDeletion = this.associatedServicesAtDeletion;
    final userJourneyName = this.userJourneyName;
    return {
      if (associatedServicesAtDeletion != null)
        'associatedServicesAtDeletion': associatedServicesAtDeletion,
      if (userJourneyName != null) 'userJourneyName': userJourneyName,
    };
  }
}

/// Metadata for a system service associated event.
///
/// @nodoc
class SystemServiceAssociatedMetadata {
  final String? serviceArn;

  /// The name of the associated service.
  final String? serviceName;

  /// The user journeys linking the service to the system.
  final List<String>? userJourneys;

  SystemServiceAssociatedMetadata({
    this.serviceArn,
    this.serviceName,
    this.userJourneys,
  });

  factory SystemServiceAssociatedMetadata.fromJson(Map<String, dynamic> json) {
    return SystemServiceAssociatedMetadata(
      serviceArn: json['serviceArn'] as String?,
      serviceName: json['serviceName'] as String?,
      userJourneys: (json['userJourneys'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceArn = this.serviceArn;
    final serviceName = this.serviceName;
    final userJourneys = this.userJourneys;
    return {
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceName != null) 'serviceName': serviceName,
      if (userJourneys != null) 'userJourneys': userJourneys,
    };
  }
}

/// Metadata for a system service disassociated event.
///
/// @nodoc
class SystemServiceDisassociatedMetadata {
  /// A comment about the disassociation.
  final String? comment;
  final String? serviceArn;

  /// The name of the disassociated service.
  final String? serviceName;

  /// The user journeys affected by the disassociation.
  final List<String>? userJourneysAffected;

  SystemServiceDisassociatedMetadata({
    this.comment,
    this.serviceArn,
    this.serviceName,
    this.userJourneysAffected,
  });

  factory SystemServiceDisassociatedMetadata.fromJson(
      Map<String, dynamic> json) {
    return SystemServiceDisassociatedMetadata(
      comment: json['comment'] as String?,
      serviceArn: json['serviceArn'] as String?,
      serviceName: json['serviceName'] as String?,
      userJourneysAffected: (json['userJourneysAffected'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final serviceArn = this.serviceArn;
    final serviceName = this.serviceName;
    final userJourneysAffected = this.userJourneysAffected;
    return {
      if (comment != null) 'comment': comment,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (serviceName != null) 'serviceName': serviceName,
      if (userJourneysAffected != null)
        'userJourneysAffected': userJourneysAffected,
    };
  }
}

/// Metadata for a system policy associated event.
///
/// @nodoc
class SystemPolicyAssociatedMetadata {
  final String? policyArn;

  /// The name of the associated policy.
  final String? policyName;

  SystemPolicyAssociatedMetadata({
    this.policyArn,
    this.policyName,
  });

  factory SystemPolicyAssociatedMetadata.fromJson(Map<String, dynamic> json) {
    return SystemPolicyAssociatedMetadata(
      policyArn: json['policyArn'] as String?,
      policyName: json['policyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final policyName = this.policyName;
    return {
      if (policyArn != null) 'policyArn': policyArn,
      if (policyName != null) 'policyName': policyName,
    };
  }
}

/// Metadata for a system policy disassociated event.
///
/// @nodoc
class SystemPolicyDisassociatedMetadata {
  final String? policyArn;

  /// The name of the disassociated policy.
  final String? policyName;

  SystemPolicyDisassociatedMetadata({
    this.policyArn,
    this.policyName,
  });

  factory SystemPolicyDisassociatedMetadata.fromJson(
      Map<String, dynamic> json) {
    return SystemPolicyDisassociatedMetadata(
      policyArn: json['policyArn'] as String?,
      policyName: json['policyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final policyName = this.policyName;
    return {
      if (policyArn != null) 'policyArn': policyArn,
      if (policyName != null) 'policyName': policyName,
    };
  }
}

/// A reference to a service by ID and name.
///
/// @nodoc
class ServiceReference {
  /// The identifier of the referenced service.
  final String? serviceId;

  /// The name of the referenced service.
  final String? serviceName;

  ServiceReference({
    this.serviceId,
    this.serviceName,
  });

  factory ServiceReference.fromJson(Map<String, dynamic> json) {
    return ServiceReference(
      serviceId: json['serviceId'] as String?,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceId = this.serviceId;
    final serviceName = this.serviceName;
    return {
      if (serviceId != null) 'serviceId': serviceId,
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

/// Describes changes made to a user journey.
///
/// @nodoc
class UserJourneyChanges {
  /// Changes to the services associated with the user journey.
  final ServiceReferenceChanges? associatedServices;

  /// Changes to the user journey description.
  final StringChange? journeyDescription;

  UserJourneyChanges({
    this.associatedServices,
    this.journeyDescription,
  });

  factory UserJourneyChanges.fromJson(Map<String, dynamic> json) {
    return UserJourneyChanges(
      associatedServices: json['associatedServices'] != null
          ? ServiceReferenceChanges.fromJson(
              json['associatedServices'] as Map<String, dynamic>)
          : null,
      journeyDescription: json['journeyDescription'] != null
          ? StringChange.fromJson(
              json['journeyDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedServices = this.associatedServices;
    final journeyDescription = this.journeyDescription;
    return {
      if (associatedServices != null) 'associatedServices': associatedServices,
      if (journeyDescription != null) 'journeyDescription': journeyDescription,
    };
  }
}

/// Describes a change from one string value to another.
///
/// @nodoc
class StringChange {
  /// The new value.
  final String? newValue;

  /// The old value.
  final String? oldValue;

  StringChange({
    this.newValue,
    this.oldValue,
  });

  factory StringChange.fromJson(Map<String, dynamic> json) {
    return StringChange(
      newValue: json['newValue'] as String?,
      oldValue: json['oldValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final newValue = this.newValue;
    final oldValue = this.oldValue;
    return {
      if (newValue != null) 'newValue': newValue,
      if (oldValue != null) 'oldValue': oldValue,
    };
  }
}

/// Describes changes to service references.
///
/// @nodoc
class ServiceReferenceChanges {
  /// The list of service references that were added.
  final List<ServiceReference>? added;

  /// The list of service references that were removed.
  final List<ServiceReference>? removed;

  ServiceReferenceChanges({
    this.added,
    this.removed,
  });

  factory ServiceReferenceChanges.fromJson(Map<String, dynamic> json) {
    return ServiceReferenceChanges(
      added: (json['added'] as List?)
          ?.nonNulls
          .map((e) => ServiceReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      removed: (json['removed'] as List?)
          ?.nonNulls
          .map((e) => ServiceReference.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final added = this.added;
    final removed = this.removed;
    return {
      if (added != null) 'added': added,
      if (removed != null) 'removed': removed,
    };
  }
}

/// @nodoc
class ActorType {
  static const user = ActorType._('USER');
  static const system = ActorType._('SYSTEM');

  final String value;

  const ActorType._(this.value);

  static const values = [user, system];

  static ActorType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ActorType._(value));

  @override
  bool operator ==(other) => other is ActorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a service topology edge.
///
/// @nodoc
class ServiceTopologyEdgeSummary {
  /// The identifier of the destination resource.
  final String destinationResourceIdentifier;

  /// The identifier of the source resource.
  final String sourceResourceIdentifier;

  /// The properties of the topology edge.
  final List<EdgePropertySummary>? properties;

  ServiceTopologyEdgeSummary({
    required this.destinationResourceIdentifier,
    required this.sourceResourceIdentifier,
    this.properties,
  });

  factory ServiceTopologyEdgeSummary.fromJson(Map<String, dynamic> json) {
    return ServiceTopologyEdgeSummary(
      destinationResourceIdentifier:
          (json['destinationResourceIdentifier'] as String?) ?? '',
      sourceResourceIdentifier:
          (json['sourceResourceIdentifier'] as String?) ?? '',
      properties: (json['properties'] as List?)
          ?.nonNulls
          .map((e) => EdgePropertySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationResourceIdentifier = this.destinationResourceIdentifier;
    final sourceResourceIdentifier = this.sourceResourceIdentifier;
    final properties = this.properties;
    return {
      'destinationResourceIdentifier': destinationResourceIdentifier,
      'sourceResourceIdentifier': sourceResourceIdentifier,
      if (properties != null) 'properties': properties,
    };
  }
}

/// Contains property information for a service topology edge.
///
/// @nodoc
class EdgePropertySummary {
  /// Human-readable relationship description. Only present for LLM-inferred
  /// edges.
  final String? label;

  /// The topology type of the edge.
  final TopologyType? topologyType;

  EdgePropertySummary({
    this.label,
    this.topologyType,
  });

  factory EdgePropertySummary.fromJson(Map<String, dynamic> json) {
    return EdgePropertySummary(
      label: json['label'] as String?,
      topologyType:
          (json['topologyType'] as String?)?.let(TopologyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final label = this.label;
    final topologyType = this.topologyType;
    return {
      if (label != null) 'label': label,
      if (topologyType != null) 'topologyType': topologyType.value,
    };
  }
}

/// @nodoc
class TopologyType {
  static const containment = TopologyType._('CONTAINMENT');
  static const dataFlow = TopologyType._('DATA_FLOW');
  static const observability = TopologyType._('OBSERVABILITY');
  static const permissions = TopologyType._('PERMISSIONS');

  final String value;

  const TopologyType._(this.value);

  static const values = [containment, dataFlow, observability, permissions];

  static TopologyType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TopologyType._(value));

  @override
  bool operator ==(other) => other is TopologyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a service.
///
/// @nodoc
class ServiceSummary {
  final String name;
  final String serviceArn;

  /// Displayed only if caller has access.
  final String? accountId;

  /// The achievability status of the service's resilience targets.
  final Achievability? achievability;

  /// The current assessment status of the service.
  final AssessmentStatus? assessmentStatus;

  /// The systems associated with the service.
  final List<AssociatedSystem>? associatedSystems;

  /// The timestamp when the service was created.
  final DateTime? createdAt;

  /// The dependency discovery configuration.
  final DependencyDiscoveryConfig? dependencyDiscovery;

  /// The number of open findings.
  final int? openFindingsCount;

  /// Displayed only if caller has access.
  final String? organizationId;

  /// Displayed only if caller has access.
  final String? ouId;
  final String? policyArn;

  /// The AWS Regions where the service operates.
  final List<String>? regions;

  /// The number of resolved findings.
  final int? resolvedFindingsCount;

  /// The timestamp when the service was last updated.
  final DateTime? updatedAt;

  ServiceSummary({
    required this.name,
    required this.serviceArn,
    this.accountId,
    this.achievability,
    this.assessmentStatus,
    this.associatedSystems,
    this.createdAt,
    this.dependencyDiscovery,
    this.openFindingsCount,
    this.organizationId,
    this.ouId,
    this.policyArn,
    this.regions,
    this.resolvedFindingsCount,
    this.updatedAt,
  });

  factory ServiceSummary.fromJson(Map<String, dynamic> json) {
    return ServiceSummary(
      name: (json['name'] as String?) ?? '',
      serviceArn: (json['serviceArn'] as String?) ?? '',
      accountId: json['accountId'] as String?,
      achievability: json['achievability'] != null
          ? Achievability.fromJson(
              json['achievability'] as Map<String, dynamic>)
          : null,
      assessmentStatus: (json['assessmentStatus'] as String?)
          ?.let(AssessmentStatus.fromString),
      associatedSystems: (json['associatedSystems'] as List?)
          ?.nonNulls
          .map((e) => AssociatedSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      dependencyDiscovery: json['dependencyDiscovery'] != null
          ? DependencyDiscoveryConfig.fromJson(
              json['dependencyDiscovery'] as Map<String, dynamic>)
          : null,
      openFindingsCount: json['openFindingsCount'] as int?,
      organizationId: json['organizationId'] as String?,
      ouId: json['ouId'] as String?,
      policyArn: json['policyArn'] as String?,
      regions:
          (json['regions'] as List?)?.nonNulls.map((e) => e as String).toList(),
      resolvedFindingsCount: json['resolvedFindingsCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final serviceArn = this.serviceArn;
    final accountId = this.accountId;
    final achievability = this.achievability;
    final assessmentStatus = this.assessmentStatus;
    final associatedSystems = this.associatedSystems;
    final createdAt = this.createdAt;
    final dependencyDiscovery = this.dependencyDiscovery;
    final openFindingsCount = this.openFindingsCount;
    final organizationId = this.organizationId;
    final ouId = this.ouId;
    final policyArn = this.policyArn;
    final regions = this.regions;
    final resolvedFindingsCount = this.resolvedFindingsCount;
    final updatedAt = this.updatedAt;
    return {
      'name': name,
      'serviceArn': serviceArn,
      if (accountId != null) 'accountId': accountId,
      if (achievability != null) 'achievability': achievability,
      if (assessmentStatus != null) 'assessmentStatus': assessmentStatus.value,
      if (associatedSystems != null) 'associatedSystems': associatedSystems,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dependencyDiscovery != null)
        'dependencyDiscovery': dependencyDiscovery,
      if (openFindingsCount != null) 'openFindingsCount': openFindingsCount,
      if (organizationId != null) 'organizationId': organizationId,
      if (ouId != null) 'ouId': ouId,
      if (policyArn != null) 'policyArn': policyArn,
      if (regions != null) 'regions': regions,
      if (resolvedFindingsCount != null)
        'resolvedFindingsCount': resolvedFindingsCount,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Represents an event in the service event log.
///
/// @nodoc
class ServiceEvent {
  /// The actor that triggered the event.
  final EventActor actor;

  /// The details of the event.
  final ServiceEventDetails eventDetails;

  /// The unique identifier of the event.
  final String eventId;

  /// The type of the event.
  final ServiceEventType eventType;
  final String serviceArn;

  /// The timestamp of the event.
  final DateTime timestamp;

  ServiceEvent({
    required this.actor,
    required this.eventDetails,
    required this.eventId,
    required this.eventType,
    required this.serviceArn,
    required this.timestamp,
  });

  factory ServiceEvent.fromJson(Map<String, dynamic> json) {
    return ServiceEvent(
      actor: EventActor.fromJson((json['actor'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      eventDetails: ServiceEventDetails.fromJson(
          (json['eventDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      eventId: (json['eventId'] as String?) ?? '',
      eventType:
          ServiceEventType.fromString((json['eventType'] as String?) ?? ''),
      serviceArn: (json['serviceArn'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final actor = this.actor;
    final eventDetails = this.eventDetails;
    final eventId = this.eventId;
    final eventType = this.eventType;
    final serviceArn = this.serviceArn;
    final timestamp = this.timestamp;
    return {
      'actor': actor,
      'eventDetails': eventDetails,
      'eventId': eventId,
      'eventType': eventType.value,
      'serviceArn': serviceArn,
      'timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// @nodoc
class ServiceEventType {
  static const serviceCreated = ServiceEventType._('SERVICE_CREATED');
  static const serviceDeleted = ServiceEventType._('SERVICE_DELETED');
  static const serviceSystemAssociated =
      ServiceEventType._('SERVICE_SYSTEM_ASSOCIATED');
  static const serviceSystemDisassociated =
      ServiceEventType._('SERVICE_SYSTEM_DISASSOCIATED');
  static const serviceResourcesAssociated =
      ServiceEventType._('SERVICE_RESOURCES_ASSOCIATED');
  static const serviceResourcesDisassociated =
      ServiceEventType._('SERVICE_RESOURCES_DISASSOCIATED');
  static const serviceWorkflowUpdated =
      ServiceEventType._('SERVICE_WORKFLOW_UPDATED');
  static const serviceInputSourcesUpdated =
      ServiceEventType._('SERVICE_INPUT_SOURCES_UPDATED');
  static const servicePolicyAssociated =
      ServiceEventType._('SERVICE_POLICY_ASSOCIATED');
  static const servicePolicyDisassociated =
      ServiceEventType._('SERVICE_POLICY_DISASSOCIATED');
  static const serviceFunctionCreated =
      ServiceEventType._('SERVICE_FUNCTION_CREATED');
  static const serviceFunctionUpdated =
      ServiceEventType._('SERVICE_FUNCTION_UPDATED');
  static const serviceFunctionDeleted =
      ServiceEventType._('SERVICE_FUNCTION_DELETED');
  static const serviceFunctionResourcesAdded =
      ServiceEventType._('SERVICE_FUNCTION_RESOURCES_ADDED');
  static const serviceFunctionResourcesRemoved =
      ServiceEventType._('SERVICE_FUNCTION_RESOURCES_REMOVED');
  static const serviceAchievabilityUpdated =
      ServiceEventType._('SERVICE_ACHIEVABILITY_UPDATED');
  static const assertionCreated = ServiceEventType._('ASSERTION_CREATED');
  static const assertionUpdated = ServiceEventType._('ASSERTION_UPDATED');
  static const assertionDeleted = ServiceEventType._('ASSERTION_DELETED');

  final String value;

  const ServiceEventType._(this.value);

  static const values = [
    serviceCreated,
    serviceDeleted,
    serviceSystemAssociated,
    serviceSystemDisassociated,
    serviceResourcesAssociated,
    serviceResourcesDisassociated,
    serviceWorkflowUpdated,
    serviceInputSourcesUpdated,
    servicePolicyAssociated,
    servicePolicyDisassociated,
    serviceFunctionCreated,
    serviceFunctionUpdated,
    serviceFunctionDeleted,
    serviceFunctionResourcesAdded,
    serviceFunctionResourcesRemoved,
    serviceAchievabilityUpdated,
    assertionCreated,
    assertionUpdated,
    assertionDeleted
  ];

  static ServiceEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ServiceEventType._(value));

  @override
  bool operator ==(other) => other is ServiceEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the details of a service event.
///
/// @nodoc
class ServiceEventDetails {
  /// The description of the event.
  final String description;

  /// The title of the event.
  final String title;
  final ServiceEventMetadata? eventMetadata;

  ServiceEventDetails({
    required this.description,
    required this.title,
    this.eventMetadata,
  });

  factory ServiceEventDetails.fromJson(Map<String, dynamic> json) {
    return ServiceEventDetails(
      description: (json['description'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      eventMetadata: json['eventMetadata'] != null
          ? ServiceEventMetadata.fromJson(
              json['eventMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final title = this.title;
    final eventMetadata = this.eventMetadata;
    return {
      'description': description,
      'title': title,
      if (eventMetadata != null) 'eventMetadata': eventMetadata,
    };
  }
}

/// Type-specific metadata for each service event type.
///
/// @nodoc
class ServiceEventMetadata {
  /// Metadata for an assertion created event.
  final AssertionCreatedMetadata? assertionCreated;

  /// Metadata for an assertion deleted event.
  final AssertionDeletedMetadata? assertionDeleted;

  /// Metadata for an assertion updated event.
  final AssertionUpdatedMetadata? assertionUpdated;

  /// Metadata for a service achievability updated event.
  final ServiceAchievabilityUpdatedMetadata? serviceAchievabilityUpdated;

  /// Metadata for a service created event.
  final ServiceCreatedMetadata? serviceCreated;

  /// Metadata for a service deleted event.
  final ServiceDeletedMetadata? serviceDeleted;

  /// Metadata for a service function created event.
  final ServiceFunctionCreatedMetadata? serviceFunctionCreated;

  /// Metadata for a service function deleted event.
  final ServiceFunctionDeletedMetadata? serviceFunctionDeleted;

  /// Metadata for a service function resources added event.
  final ServiceFunctionResourcesAddedMetadata? serviceFunctionResourcesAdded;

  /// Metadata for a service function resources removed event.
  final ServiceFunctionResourcesRemovedMetadata?
      serviceFunctionResourcesRemoved;

  /// Metadata for a service function updated event.
  final ServiceFunctionUpdatedMetadata? serviceFunctionUpdated;

  /// Metadata for a service input sources updated event.
  final ServiceInputSourcesUpdatedMetadata? serviceInputSourcesUpdated;

  /// Metadata for a service policy associated event.
  final ServicePolicyAssociatedMetadata? servicePolicyAssociated;

  /// Metadata for a service policy disassociated event.
  final ServicePolicyDisassociatedMetadata? servicePolicyDisassociated;

  /// Metadata for a service resources associated event.
  final ServiceResourcesAssociatedMetadata? serviceResourcesAssociated;

  /// Metadata for a service resources disassociated event.
  final ServiceResourcesDisassociatedMetadata? serviceResourcesDisassociated;

  /// Metadata for a service system associated event.
  final ServiceSystemAssociatedMetadata? serviceSystemAssociated;

  /// Metadata for a service system disassociated event.
  final ServiceSystemDisassociatedMetadata? serviceSystemDisassociated;

  /// Metadata for a service workflow updated event.
  final ServiceWorkflowUpdatedMetadata? serviceWorkflowUpdated;

  ServiceEventMetadata({
    this.assertionCreated,
    this.assertionDeleted,
    this.assertionUpdated,
    this.serviceAchievabilityUpdated,
    this.serviceCreated,
    this.serviceDeleted,
    this.serviceFunctionCreated,
    this.serviceFunctionDeleted,
    this.serviceFunctionResourcesAdded,
    this.serviceFunctionResourcesRemoved,
    this.serviceFunctionUpdated,
    this.serviceInputSourcesUpdated,
    this.servicePolicyAssociated,
    this.servicePolicyDisassociated,
    this.serviceResourcesAssociated,
    this.serviceResourcesDisassociated,
    this.serviceSystemAssociated,
    this.serviceSystemDisassociated,
    this.serviceWorkflowUpdated,
  });

  factory ServiceEventMetadata.fromJson(Map<String, dynamic> json) {
    return ServiceEventMetadata(
      assertionCreated: json['assertionCreated'] != null
          ? AssertionCreatedMetadata.fromJson(
              json['assertionCreated'] as Map<String, dynamic>)
          : null,
      assertionDeleted: json['assertionDeleted'] != null
          ? AssertionDeletedMetadata.fromJson(
              json['assertionDeleted'] as Map<String, dynamic>)
          : null,
      assertionUpdated: json['assertionUpdated'] != null
          ? AssertionUpdatedMetadata.fromJson(
              json['assertionUpdated'] as Map<String, dynamic>)
          : null,
      serviceAchievabilityUpdated: json['serviceAchievabilityUpdated'] != null
          ? ServiceAchievabilityUpdatedMetadata.fromJson(
              json['serviceAchievabilityUpdated'] as Map<String, dynamic>)
          : null,
      serviceCreated: json['serviceCreated'] != null
          ? ServiceCreatedMetadata.fromJson(
              json['serviceCreated'] as Map<String, dynamic>)
          : null,
      serviceDeleted: json['serviceDeleted'] != null
          ? ServiceDeletedMetadata.fromJson(
              json['serviceDeleted'] as Map<String, dynamic>)
          : null,
      serviceFunctionCreated: json['serviceFunctionCreated'] != null
          ? ServiceFunctionCreatedMetadata.fromJson(
              json['serviceFunctionCreated'] as Map<String, dynamic>)
          : null,
      serviceFunctionDeleted: json['serviceFunctionDeleted'] != null
          ? ServiceFunctionDeletedMetadata.fromJson(
              json['serviceFunctionDeleted'] as Map<String, dynamic>)
          : null,
      serviceFunctionResourcesAdded:
          json['serviceFunctionResourcesAdded'] != null
              ? ServiceFunctionResourcesAddedMetadata.fromJson(
                  json['serviceFunctionResourcesAdded'] as Map<String, dynamic>)
              : null,
      serviceFunctionResourcesRemoved:
          json['serviceFunctionResourcesRemoved'] != null
              ? ServiceFunctionResourcesRemovedMetadata.fromJson(
                  json['serviceFunctionResourcesRemoved']
                      as Map<String, dynamic>)
              : null,
      serviceFunctionUpdated: json['serviceFunctionUpdated'] != null
          ? ServiceFunctionUpdatedMetadata.fromJson(
              json['serviceFunctionUpdated'] as Map<String, dynamic>)
          : null,
      serviceInputSourcesUpdated: json['serviceInputSourcesUpdated'] != null
          ? ServiceInputSourcesUpdatedMetadata.fromJson(
              json['serviceInputSourcesUpdated'] as Map<String, dynamic>)
          : null,
      servicePolicyAssociated: json['servicePolicyAssociated'] != null
          ? ServicePolicyAssociatedMetadata.fromJson(
              json['servicePolicyAssociated'] as Map<String, dynamic>)
          : null,
      servicePolicyDisassociated: json['servicePolicyDisassociated'] != null
          ? ServicePolicyDisassociatedMetadata.fromJson(
              json['servicePolicyDisassociated'] as Map<String, dynamic>)
          : null,
      serviceResourcesAssociated: json['serviceResourcesAssociated'] != null
          ? ServiceResourcesAssociatedMetadata.fromJson(
              json['serviceResourcesAssociated'] as Map<String, dynamic>)
          : null,
      serviceResourcesDisassociated:
          json['serviceResourcesDisassociated'] != null
              ? ServiceResourcesDisassociatedMetadata.fromJson(
                  json['serviceResourcesDisassociated'] as Map<String, dynamic>)
              : null,
      serviceSystemAssociated: json['serviceSystemAssociated'] != null
          ? ServiceSystemAssociatedMetadata.fromJson(
              json['serviceSystemAssociated'] as Map<String, dynamic>)
          : null,
      serviceSystemDisassociated: json['serviceSystemDisassociated'] != null
          ? ServiceSystemDisassociatedMetadata.fromJson(
              json['serviceSystemDisassociated'] as Map<String, dynamic>)
          : null,
      serviceWorkflowUpdated: json['serviceWorkflowUpdated'] != null
          ? ServiceWorkflowUpdatedMetadata.fromJson(
              json['serviceWorkflowUpdated'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assertionCreated = this.assertionCreated;
    final assertionDeleted = this.assertionDeleted;
    final assertionUpdated = this.assertionUpdated;
    final serviceAchievabilityUpdated = this.serviceAchievabilityUpdated;
    final serviceCreated = this.serviceCreated;
    final serviceDeleted = this.serviceDeleted;
    final serviceFunctionCreated = this.serviceFunctionCreated;
    final serviceFunctionDeleted = this.serviceFunctionDeleted;
    final serviceFunctionResourcesAdded = this.serviceFunctionResourcesAdded;
    final serviceFunctionResourcesRemoved =
        this.serviceFunctionResourcesRemoved;
    final serviceFunctionUpdated = this.serviceFunctionUpdated;
    final serviceInputSourcesUpdated = this.serviceInputSourcesUpdated;
    final servicePolicyAssociated = this.servicePolicyAssociated;
    final servicePolicyDisassociated = this.servicePolicyDisassociated;
    final serviceResourcesAssociated = this.serviceResourcesAssociated;
    final serviceResourcesDisassociated = this.serviceResourcesDisassociated;
    final serviceSystemAssociated = this.serviceSystemAssociated;
    final serviceSystemDisassociated = this.serviceSystemDisassociated;
    final serviceWorkflowUpdated = this.serviceWorkflowUpdated;
    return {
      if (assertionCreated != null) 'assertionCreated': assertionCreated,
      if (assertionDeleted != null) 'assertionDeleted': assertionDeleted,
      if (assertionUpdated != null) 'assertionUpdated': assertionUpdated,
      if (serviceAchievabilityUpdated != null)
        'serviceAchievabilityUpdated': serviceAchievabilityUpdated,
      if (serviceCreated != null) 'serviceCreated': serviceCreated,
      if (serviceDeleted != null) 'serviceDeleted': serviceDeleted,
      if (serviceFunctionCreated != null)
        'serviceFunctionCreated': serviceFunctionCreated,
      if (serviceFunctionDeleted != null)
        'serviceFunctionDeleted': serviceFunctionDeleted,
      if (serviceFunctionResourcesAdded != null)
        'serviceFunctionResourcesAdded': serviceFunctionResourcesAdded,
      if (serviceFunctionResourcesRemoved != null)
        'serviceFunctionResourcesRemoved': serviceFunctionResourcesRemoved,
      if (serviceFunctionUpdated != null)
        'serviceFunctionUpdated': serviceFunctionUpdated,
      if (serviceInputSourcesUpdated != null)
        'serviceInputSourcesUpdated': serviceInputSourcesUpdated,
      if (servicePolicyAssociated != null)
        'servicePolicyAssociated': servicePolicyAssociated,
      if (servicePolicyDisassociated != null)
        'servicePolicyDisassociated': servicePolicyDisassociated,
      if (serviceResourcesAssociated != null)
        'serviceResourcesAssociated': serviceResourcesAssociated,
      if (serviceResourcesDisassociated != null)
        'serviceResourcesDisassociated': serviceResourcesDisassociated,
      if (serviceSystemAssociated != null)
        'serviceSystemAssociated': serviceSystemAssociated,
      if (serviceSystemDisassociated != null)
        'serviceSystemDisassociated': serviceSystemDisassociated,
      if (serviceWorkflowUpdated != null)
        'serviceWorkflowUpdated': serviceWorkflowUpdated,
    };
  }
}

/// Metadata for a service created event.
///
/// @nodoc
class ServiceCreatedMetadata {
  ServiceCreatedMetadata();

  factory ServiceCreatedMetadata.fromJson(Map<String, dynamic> _) {
    return ServiceCreatedMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Metadata for a service deleted event.
///
/// @nodoc
class ServiceDeletedMetadata {
  ServiceDeletedMetadata();

  factory ServiceDeletedMetadata.fromJson(Map<String, dynamic> _) {
    return ServiceDeletedMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Metadata for a service system associated event.
///
/// @nodoc
class ServiceSystemAssociatedMetadata {
  final String? systemArn;

  /// The name of the associated system.
  final String? systemName;

  ServiceSystemAssociatedMetadata({
    this.systemArn,
    this.systemName,
  });

  factory ServiceSystemAssociatedMetadata.fromJson(Map<String, dynamic> json) {
    return ServiceSystemAssociatedMetadata(
      systemArn: json['systemArn'] as String?,
      systemName: json['systemName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final systemArn = this.systemArn;
    final systemName = this.systemName;
    return {
      if (systemArn != null) 'systemArn': systemArn,
      if (systemName != null) 'systemName': systemName,
    };
  }
}

/// Metadata for a service system disassociated event.
///
/// @nodoc
class ServiceSystemDisassociatedMetadata {
  final String? systemArn;

  /// The identifier of the disassociated system.
  final String? systemId;

  /// The name of the disassociated system.
  final String? systemName;

  ServiceSystemDisassociatedMetadata({
    this.systemArn,
    this.systemId,
    this.systemName,
  });

  factory ServiceSystemDisassociatedMetadata.fromJson(
      Map<String, dynamic> json) {
    return ServiceSystemDisassociatedMetadata(
      systemArn: json['systemArn'] as String?,
      systemId: json['systemId'] as String?,
      systemName: json['systemName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final systemArn = this.systemArn;
    final systemId = this.systemId;
    final systemName = this.systemName;
    return {
      if (systemArn != null) 'systemArn': systemArn,
      if (systemId != null) 'systemId': systemId,
      if (systemName != null) 'systemName': systemName,
    };
  }
}

/// Metadata for a service resources associated event.
///
/// @nodoc
class ServiceResourcesAssociatedMetadata {
  /// The number of resources associated.
  final int? resourceCount;

  /// The types of resources associated.
  final List<String>? resourceTypes;

  ServiceResourcesAssociatedMetadata({
    this.resourceCount,
    this.resourceTypes,
  });

  factory ServiceResourcesAssociatedMetadata.fromJson(
      Map<String, dynamic> json) {
    return ServiceResourcesAssociatedMetadata(
      resourceCount: json['resourceCount'] as int?,
      resourceTypes: (json['resourceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceCount = this.resourceCount;
    final resourceTypes = this.resourceTypes;
    return {
      if (resourceCount != null) 'resourceCount': resourceCount,
      if (resourceTypes != null) 'resourceTypes': resourceTypes,
    };
  }
}

/// Metadata for a service resources disassociated event.
///
/// @nodoc
class ServiceResourcesDisassociatedMetadata {
  /// The number of resources disassociated.
  final int? resourceCount;

  /// The types of resources disassociated.
  final List<String>? resourceTypes;

  ServiceResourcesDisassociatedMetadata({
    this.resourceCount,
    this.resourceTypes,
  });

  factory ServiceResourcesDisassociatedMetadata.fromJson(
      Map<String, dynamic> json) {
    return ServiceResourcesDisassociatedMetadata(
      resourceCount: json['resourceCount'] as int?,
      resourceTypes: (json['resourceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceCount = this.resourceCount;
    final resourceTypes = this.resourceTypes;
    return {
      if (resourceCount != null) 'resourceCount': resourceCount,
      if (resourceTypes != null) 'resourceTypes': resourceTypes,
    };
  }
}

/// Metadata for a service workflow updated event.
///
/// @nodoc
class ServiceWorkflowUpdatedMetadata {
  /// The identifier of the service function.
  final String? serviceFunctionId;

  /// The name of the service function.
  final String? serviceFunctionName;

  ServiceWorkflowUpdatedMetadata({
    this.serviceFunctionId,
    this.serviceFunctionName,
  });

  factory ServiceWorkflowUpdatedMetadata.fromJson(Map<String, dynamic> json) {
    return ServiceWorkflowUpdatedMetadata(
      serviceFunctionId: json['serviceFunctionId'] as String?,
      serviceFunctionName: json['serviceFunctionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceFunctionId = this.serviceFunctionId;
    final serviceFunctionName = this.serviceFunctionName;
    return {
      if (serviceFunctionId != null) 'serviceFunctionId': serviceFunctionId,
      if (serviceFunctionName != null)
        'serviceFunctionName': serviceFunctionName,
    };
  }
}

/// Metadata for a service input sources updated event.
///
/// @nodoc
class ServiceInputSourcesUpdatedMetadata {
  ServiceInputSourcesUpdatedMetadata();

  factory ServiceInputSourcesUpdatedMetadata.fromJson(Map<String, dynamic> _) {
    return ServiceInputSourcesUpdatedMetadata();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Metadata for a service policy associated event.
///
/// @nodoc
class ServicePolicyAssociatedMetadata {
  final String? policyArn;

  /// The name of the associated policy.
  final String? policyName;

  ServicePolicyAssociatedMetadata({
    this.policyArn,
    this.policyName,
  });

  factory ServicePolicyAssociatedMetadata.fromJson(Map<String, dynamic> json) {
    return ServicePolicyAssociatedMetadata(
      policyArn: json['policyArn'] as String?,
      policyName: json['policyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final policyName = this.policyName;
    return {
      if (policyArn != null) 'policyArn': policyArn,
      if (policyName != null) 'policyName': policyName,
    };
  }
}

/// Metadata for a service policy disassociated event.
///
/// @nodoc
class ServicePolicyDisassociatedMetadata {
  final String? policyArn;

  /// The name of the disassociated policy.
  final String? policyName;

  ServicePolicyDisassociatedMetadata({
    this.policyArn,
    this.policyName,
  });

  factory ServicePolicyDisassociatedMetadata.fromJson(
      Map<String, dynamic> json) {
    return ServicePolicyDisassociatedMetadata(
      policyArn: json['policyArn'] as String?,
      policyName: json['policyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final policyName = this.policyName;
    return {
      if (policyArn != null) 'policyArn': policyArn,
      if (policyName != null) 'policyName': policyName,
    };
  }
}

/// Metadata for a service function created event.
///
/// @nodoc
class ServiceFunctionCreatedMetadata {
  /// The identifier of the created service function.
  final String? serviceFunctionId;

  /// The name of the created service function.
  final String? serviceFunctionName;

  ServiceFunctionCreatedMetadata({
    this.serviceFunctionId,
    this.serviceFunctionName,
  });

  factory ServiceFunctionCreatedMetadata.fromJson(Map<String, dynamic> json) {
    return ServiceFunctionCreatedMetadata(
      serviceFunctionId: json['serviceFunctionId'] as String?,
      serviceFunctionName: json['serviceFunctionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceFunctionId = this.serviceFunctionId;
    final serviceFunctionName = this.serviceFunctionName;
    return {
      if (serviceFunctionId != null) 'serviceFunctionId': serviceFunctionId,
      if (serviceFunctionName != null)
        'serviceFunctionName': serviceFunctionName,
    };
  }
}

/// Metadata for a service function updated event.
///
/// @nodoc
class ServiceFunctionUpdatedMetadata {
  /// The list of resource ARNs that were added.
  final List<String>? resourcesAdded;

  /// The list of resource ARNs that were removed.
  final List<String>? resourcesRemoved;

  /// The identifier of the service function.
  final String? serviceFunctionId;

  /// The name of the service function.
  final String? serviceFunctionName;

  ServiceFunctionUpdatedMetadata({
    this.resourcesAdded,
    this.resourcesRemoved,
    this.serviceFunctionId,
    this.serviceFunctionName,
  });

  factory ServiceFunctionUpdatedMetadata.fromJson(Map<String, dynamic> json) {
    return ServiceFunctionUpdatedMetadata(
      resourcesAdded: (json['resourcesAdded'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      resourcesRemoved: (json['resourcesRemoved'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      serviceFunctionId: json['serviceFunctionId'] as String?,
      serviceFunctionName: json['serviceFunctionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcesAdded = this.resourcesAdded;
    final resourcesRemoved = this.resourcesRemoved;
    final serviceFunctionId = this.serviceFunctionId;
    final serviceFunctionName = this.serviceFunctionName;
    return {
      if (resourcesAdded != null) 'resourcesAdded': resourcesAdded,
      if (resourcesRemoved != null) 'resourcesRemoved': resourcesRemoved,
      if (serviceFunctionId != null) 'serviceFunctionId': serviceFunctionId,
      if (serviceFunctionName != null)
        'serviceFunctionName': serviceFunctionName,
    };
  }
}

/// Metadata for a service function deleted event.
///
/// @nodoc
class ServiceFunctionDeletedMetadata {
  /// The identifier of the deleted service function.
  final String? serviceFunctionId;

  /// The name of the deleted service function.
  final String? serviceFunctionName;

  ServiceFunctionDeletedMetadata({
    this.serviceFunctionId,
    this.serviceFunctionName,
  });

  factory ServiceFunctionDeletedMetadata.fromJson(Map<String, dynamic> json) {
    return ServiceFunctionDeletedMetadata(
      serviceFunctionId: json['serviceFunctionId'] as String?,
      serviceFunctionName: json['serviceFunctionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceFunctionId = this.serviceFunctionId;
    final serviceFunctionName = this.serviceFunctionName;
    return {
      if (serviceFunctionId != null) 'serviceFunctionId': serviceFunctionId,
      if (serviceFunctionName != null)
        'serviceFunctionName': serviceFunctionName,
    };
  }
}

/// Metadata for a service function resources added event.
///
/// @nodoc
class ServiceFunctionResourcesAddedMetadata {
  /// The list of resource ARNs that were added.
  final List<String>? resourcesAdded;

  /// The identifier of the service function.
  final String? serviceFunctionId;

  /// The name of the service function.
  final String? serviceFunctionName;

  ServiceFunctionResourcesAddedMetadata({
    this.resourcesAdded,
    this.serviceFunctionId,
    this.serviceFunctionName,
  });

  factory ServiceFunctionResourcesAddedMetadata.fromJson(
      Map<String, dynamic> json) {
    return ServiceFunctionResourcesAddedMetadata(
      resourcesAdded: (json['resourcesAdded'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      serviceFunctionId: json['serviceFunctionId'] as String?,
      serviceFunctionName: json['serviceFunctionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcesAdded = this.resourcesAdded;
    final serviceFunctionId = this.serviceFunctionId;
    final serviceFunctionName = this.serviceFunctionName;
    return {
      if (resourcesAdded != null) 'resourcesAdded': resourcesAdded,
      if (serviceFunctionId != null) 'serviceFunctionId': serviceFunctionId,
      if (serviceFunctionName != null)
        'serviceFunctionName': serviceFunctionName,
    };
  }
}

/// Metadata for a service function resources removed event.
///
/// @nodoc
class ServiceFunctionResourcesRemovedMetadata {
  /// The list of resource ARNs that were removed.
  final List<String>? resourcesRemoved;

  /// The identifier of the service function.
  final String? serviceFunctionId;

  /// The name of the service function.
  final String? serviceFunctionName;

  ServiceFunctionResourcesRemovedMetadata({
    this.resourcesRemoved,
    this.serviceFunctionId,
    this.serviceFunctionName,
  });

  factory ServiceFunctionResourcesRemovedMetadata.fromJson(
      Map<String, dynamic> json) {
    return ServiceFunctionResourcesRemovedMetadata(
      resourcesRemoved: (json['resourcesRemoved'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      serviceFunctionId: json['serviceFunctionId'] as String?,
      serviceFunctionName: json['serviceFunctionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcesRemoved = this.resourcesRemoved;
    final serviceFunctionId = this.serviceFunctionId;
    final serviceFunctionName = this.serviceFunctionName;
    return {
      if (resourcesRemoved != null) 'resourcesRemoved': resourcesRemoved,
      if (serviceFunctionId != null) 'serviceFunctionId': serviceFunctionId,
      if (serviceFunctionName != null)
        'serviceFunctionName': serviceFunctionName,
    };
  }
}

/// Metadata for a service achievability updated event.
///
/// @nodoc
class ServiceAchievabilityUpdatedMetadata {
  /// The assessment identifier that triggered the update.
  final String? assessmentId;

  /// The updated achievability status of the availability SLO.
  final String? availabilitySlo;

  /// The updated achievability status of the multi-AZ RTO and RPO targets.
  final String? multiAzRtoRpo;

  /// The updated achievability status of the multi-Region RTO and RPO targets.
  final String? multiRegionRtoRpo;

  ServiceAchievabilityUpdatedMetadata({
    this.assessmentId,
    this.availabilitySlo,
    this.multiAzRtoRpo,
    this.multiRegionRtoRpo,
  });

  factory ServiceAchievabilityUpdatedMetadata.fromJson(
      Map<String, dynamic> json) {
    return ServiceAchievabilityUpdatedMetadata(
      assessmentId: json['assessmentId'] as String?,
      availabilitySlo: json['availabilitySlo'] as String?,
      multiAzRtoRpo: json['multiAzRtoRpo'] as String?,
      multiRegionRtoRpo: json['multiRegionRtoRpo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final availabilitySlo = this.availabilitySlo;
    final multiAzRtoRpo = this.multiAzRtoRpo;
    final multiRegionRtoRpo = this.multiRegionRtoRpo;
    return {
      if (assessmentId != null) 'assessmentId': assessmentId,
      if (availabilitySlo != null) 'availabilitySlo': availabilitySlo,
      if (multiAzRtoRpo != null) 'multiAzRtoRpo': multiAzRtoRpo,
      if (multiRegionRtoRpo != null) 'multiRegionRtoRpo': multiRegionRtoRpo,
    };
  }
}

/// Metadata for an assertion created event.
///
/// @nodoc
class AssertionCreatedMetadata {
  /// The unique identifier of the created assertion.
  final String? assertionId;

  /// The name of the created assertion.
  final String? assertionName;

  AssertionCreatedMetadata({
    this.assertionId,
    this.assertionName,
  });

  factory AssertionCreatedMetadata.fromJson(Map<String, dynamic> json) {
    return AssertionCreatedMetadata(
      assertionId: json['assertionId'] as String?,
      assertionName: json['assertionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assertionId = this.assertionId;
    final assertionName = this.assertionName;
    return {
      if (assertionId != null) 'assertionId': assertionId,
      if (assertionName != null) 'assertionName': assertionName,
    };
  }
}

/// Metadata for an assertion updated event.
///
/// @nodoc
class AssertionUpdatedMetadata {
  /// The unique identifier of the updated assertion.
  final String? assertionId;

  /// The name of the updated assertion.
  final String? assertionName;

  AssertionUpdatedMetadata({
    this.assertionId,
    this.assertionName,
  });

  factory AssertionUpdatedMetadata.fromJson(Map<String, dynamic> json) {
    return AssertionUpdatedMetadata(
      assertionId: json['assertionId'] as String?,
      assertionName: json['assertionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assertionId = this.assertionId;
    final assertionName = this.assertionName;
    return {
      if (assertionId != null) 'assertionId': assertionId,
      if (assertionName != null) 'assertionName': assertionName,
    };
  }
}

/// Metadata for an assertion deleted event.
///
/// @nodoc
class AssertionDeletedMetadata {
  /// The unique identifier of the deleted assertion.
  final String? assertionId;

  /// The name of the deleted assertion.
  final String? assertionName;

  AssertionDeletedMetadata({
    this.assertionId,
    this.assertionName,
  });

  factory AssertionDeletedMetadata.fromJson(Map<String, dynamic> json) {
    return AssertionDeletedMetadata(
      assertionId: json['assertionId'] as String?,
      assertionName: json['assertionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assertionId = this.assertionId;
    final assertionName = this.assertionName;
    return {
      if (assertionId != null) 'assertionId': assertionId,
      if (assertionName != null) 'assertionName': assertionName,
    };
  }
}

/// Represents a resource associated with a service.
///
/// @nodoc
class ServiceResource {
  /// The resource details.
  final Resource resource;

  /// The identifier of the resource.
  final String resourceIdentifier;

  /// The input source that discovered the resource.
  final InputSource? inputSource;

  ServiceResource({
    required this.resource,
    required this.resourceIdentifier,
    this.inputSource,
  });

  factory ServiceResource.fromJson(Map<String, dynamic> json) {
    return ServiceResource(
      resource: Resource.fromJson((json['resource'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      resourceIdentifier: (json['resourceIdentifier'] as String?) ?? '',
      inputSource: json['inputSource'] != null
          ? InputSource.fromJson(json['inputSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final resourceIdentifier = this.resourceIdentifier;
    final inputSource = this.inputSource;
    return {
      'resource': resource,
      'resourceIdentifier': resourceIdentifier,
      if (inputSource != null) 'inputSource': inputSource,
    };
  }
}

/// Identifies an input source by its identifier and type.
///
/// @nodoc
class InputSource {
  /// The identifier of the input source.
  final String identifier;

  /// The type of the input source.
  final InputSourceType type;

  InputSource({
    required this.identifier,
    required this.type,
  });

  factory InputSource.fromJson(Map<String, dynamic> json) {
    return InputSource(
      identifier: (json['identifier'] as String?) ?? '',
      type: InputSourceType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final type = this.type;
    return {
      'identifier': identifier,
      'type': type.value,
    };
  }
}

/// Represents an AWS resource discovered by Resilience Hub.
///
/// @nodoc
class Resource {
  /// The identifier of the resource.
  final String identifier;

  /// The AWS account ID that owns the resource.
  final String? awsAccountId;

  /// The AWS Region where the resource is located.
  final String? awsRegion;

  /// The type of the resource.
  final String? resourceType;

  Resource({
    required this.identifier,
    this.awsAccountId,
    this.awsRegion,
    this.resourceType,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      identifier: (json['identifier'] as String?) ?? '',
      awsAccountId: json['awsAccountId'] as String?,
      awsRegion: json['awsRegion'] as String?,
      resourceType: json['resourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final awsAccountId = this.awsAccountId;
    final awsRegion = this.awsRegion;
    final resourceType = this.resourceType;
    return {
      'identifier': identifier,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsRegion != null) 'awsRegion': awsRegion,
      if (resourceType != null) 'resourceType': resourceType,
    };
  }
}

/// @nodoc
class InputSourceType {
  static const cfnStack = InputSourceType._('CFN_STACK');
  static const tags = InputSourceType._('TAGS');
  static const eks = InputSourceType._('EKS');
  static const terraform = InputSourceType._('TERRAFORM');
  static const designFile = InputSourceType._('DESIGN_FILE');
  static const monitoring = InputSourceType._('MONITORING');

  final String value;

  const InputSourceType._(this.value);

  static const values = [
    cfnStack,
    tags,
    eks,
    terraform,
    designFile,
    monitoring
  ];

  static InputSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InputSourceType._(value));

  @override
  bool operator ==(other) => other is InputSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Result of a report generation attempt.
///
/// @nodoc
class ReportGenerationResult {
  /// The type of the generated report.
  final ReportType reportType;

  /// The status of the report generation.
  final ReportGenerationStatus status;

  /// Present for FAILURE_MODE reports.
  final String? assessmentId;

  /// The timestamp when the report was created.
  final DateTime? createdAt;

  /// Present when status is SUCCEEDED or FAILED.
  final ReportOutput? reportOutput;

  /// The service this report was generated for.
  final String? serviceArn;

  ReportGenerationResult({
    required this.reportType,
    required this.status,
    this.assessmentId,
    this.createdAt,
    this.reportOutput,
    this.serviceArn,
  });

  factory ReportGenerationResult.fromJson(Map<String, dynamic> json) {
    return ReportGenerationResult(
      reportType: ReportType.fromString((json['reportType'] as String?) ?? ''),
      status:
          ReportGenerationStatus.fromString((json['status'] as String?) ?? ''),
      assessmentId: json['assessmentId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      reportOutput: json['reportOutput'] != null
          ? ReportOutput.fromJson(json['reportOutput'] as Map<String, dynamic>)
          : null,
      serviceArn: json['serviceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportType = this.reportType;
    final status = this.status;
    final assessmentId = this.assessmentId;
    final createdAt = this.createdAt;
    final reportOutput = this.reportOutput;
    final serviceArn = this.serviceArn;
    return {
      'reportType': reportType.value,
      'status': status.value,
      if (assessmentId != null) 'assessmentId': assessmentId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (reportOutput != null) 'reportOutput': reportOutput,
      if (serviceArn != null) 'serviceArn': serviceArn,
    };
  }
}

/// @nodoc
class ReportType {
  static const failureMode = ReportType._('FAILURE_MODE');

  final String value;

  const ReportType._(this.value);

  static const values = [failureMode];

  static ReportType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReportType._(value));

  @override
  bool operator ==(other) => other is ReportType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Status of report generation.
///
/// @nodoc
class ReportGenerationStatus {
  static const pending = ReportGenerationStatus._('PENDING');
  static const succeeded = ReportGenerationStatus._('SUCCEEDED');
  static const failed = ReportGenerationStatus._('FAILED');

  final String value;

  const ReportGenerationStatus._(this.value);

  static const values = [pending, succeeded, failed];

  static ReportGenerationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReportGenerationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ReportGenerationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Union of possible report outputs.
///
/// @nodoc
class ReportOutput {
  /// Details when report generation failed.
  final FailedReportOutput? failedReportOutput;

  /// The S3 location where the report was written.
  final S3ReportOutput? s3ReportOutput;

  ReportOutput({
    this.failedReportOutput,
    this.s3ReportOutput,
  });

  factory ReportOutput.fromJson(Map<String, dynamic> json) {
    return ReportOutput(
      failedReportOutput: json['failedReportOutput'] != null
          ? FailedReportOutput.fromJson(
              json['failedReportOutput'] as Map<String, dynamic>)
          : null,
      s3ReportOutput: json['s3ReportOutput'] != null
          ? S3ReportOutput.fromJson(
              json['s3ReportOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failedReportOutput = this.failedReportOutput;
    final s3ReportOutput = this.s3ReportOutput;
    return {
      if (failedReportOutput != null) 'failedReportOutput': failedReportOutput,
      if (s3ReportOutput != null) 's3ReportOutput': s3ReportOutput,
    };
  }
}

/// S3 location where report was written.
///
/// @nodoc
class S3ReportOutput {
  /// The S3 object key for the generated report.
  final String s3ObjectKey;

  S3ReportOutput({
    required this.s3ObjectKey,
  });

  factory S3ReportOutput.fromJson(Map<String, dynamic> json) {
    return S3ReportOutput(
      s3ObjectKey: (json['s3ObjectKey'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final s3ObjectKey = this.s3ObjectKey;
    return {
      's3ObjectKey': s3ObjectKey,
    };
  }
}

/// Details when report generation failed.
///
/// @nodoc
class FailedReportOutput {
  /// The error code describing why the report generation failed.
  final ReportGenerationErrorCode errorCode;

  /// The error message describing why the report generation failed.
  final String? errorMessage;

  FailedReportOutput({
    required this.errorCode,
    this.errorMessage,
  });

  factory FailedReportOutput.fromJson(Map<String, dynamic> json) {
    return FailedReportOutput(
      errorCode: ReportGenerationErrorCode.fromString(
          (json['errorCode'] as String?) ?? ''),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// Error codes for failed report generation.
///
/// @nodoc
class ReportGenerationErrorCode {
  static const insufficientPermissions =
      ReportGenerationErrorCode._('INSUFFICIENT_PERMISSIONS');
  static const configurationError =
      ReportGenerationErrorCode._('CONFIGURATION_ERROR');
  static const internalError = ReportGenerationErrorCode._('INTERNAL_ERROR');

  final String value;

  const ReportGenerationErrorCode._(this.value);

  static const values = [
    insufficientPermissions,
    configurationError,
    internalError
  ];

  static ReportGenerationErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReportGenerationErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is ReportGenerationErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a resilience policy.
///
/// @nodoc
class PolicySummary {
  final String name;
  final String policyArn;

  /// The number of services associated with this policy.
  final int? associatedServiceCount;

  /// The availability SLO defined in the policy.
  final AvailabilitySlo? availabilitySlo;

  /// The timestamp when the policy was created.
  final DateTime? createdAt;

  /// The data recovery targets defined in the policy.
  final DataRecoveryTargets? dataRecovery;

  /// The multi-AZ disaster recovery targets defined in the policy.
  final MultiAzTargets? multiAz;

  /// The multi-Region disaster recovery targets defined in the policy.
  final MultiRegionTargets? multiRegion;

  /// The timestamp when the policy was last updated.
  final DateTime? updatedAt;

  PolicySummary({
    required this.name,
    required this.policyArn,
    this.associatedServiceCount,
    this.availabilitySlo,
    this.createdAt,
    this.dataRecovery,
    this.multiAz,
    this.multiRegion,
    this.updatedAt,
  });

  factory PolicySummary.fromJson(Map<String, dynamic> json) {
    return PolicySummary(
      name: (json['name'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
      associatedServiceCount: json['associatedServiceCount'] as int?,
      availabilitySlo: json['availabilitySlo'] != null
          ? AvailabilitySlo.fromJson(
              json['availabilitySlo'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      dataRecovery: json['dataRecovery'] != null
          ? DataRecoveryTargets.fromJson(
              json['dataRecovery'] as Map<String, dynamic>)
          : null,
      multiAz: json['multiAz'] != null
          ? MultiAzTargets.fromJson(json['multiAz'] as Map<String, dynamic>)
          : null,
      multiRegion: json['multiRegion'] != null
          ? MultiRegionTargets.fromJson(
              json['multiRegion'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final policyArn = this.policyArn;
    final associatedServiceCount = this.associatedServiceCount;
    final availabilitySlo = this.availabilitySlo;
    final createdAt = this.createdAt;
    final dataRecovery = this.dataRecovery;
    final multiAz = this.multiAz;
    final multiRegion = this.multiRegion;
    final updatedAt = this.updatedAt;
    return {
      'name': name,
      'policyArn': policyArn,
      if (associatedServiceCount != null)
        'associatedServiceCount': associatedServiceCount,
      if (availabilitySlo != null) 'availabilitySlo': availabilitySlo,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dataRecovery != null) 'dataRecovery': dataRecovery,
      if (multiAz != null) 'multiAz': multiAz,
      if (multiRegion != null) 'multiRegion': multiRegion,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Contains summary information about an input source for a service.
///
/// @nodoc
class InputSourceSummary {
  /// The unique identifier of the input source.
  final String inputSourceId;
  final String? cfnStackArn;

  /// The timestamp when the input source was created.
  final DateTime? createdAt;
  final String? designFileS3Url;

  /// The Amazon EKS configuration, if this input source uses EKS.
  final EksSource? eks;

  /// The resource tags used for discovery, if this input source uses tags.
  final List<ResourceTag>? resourceTags;
  final String? tfStateFileUrl;

  /// The type of the input source.
  final InputSourceType? type;

  InputSourceSummary({
    required this.inputSourceId,
    this.cfnStackArn,
    this.createdAt,
    this.designFileS3Url,
    this.eks,
    this.resourceTags,
    this.tfStateFileUrl,
    this.type,
  });

  factory InputSourceSummary.fromJson(Map<String, dynamic> json) {
    return InputSourceSummary(
      inputSourceId: (json['inputSourceId'] as String?) ?? '',
      cfnStackArn: json['cfnStackArn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      designFileS3Url: json['designFileS3Url'] as String?,
      eks: json['eks'] != null
          ? EksSource.fromJson(json['eks'] as Map<String, dynamic>)
          : null,
      resourceTags: (json['resourceTags'] as List?)
          ?.nonNulls
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      tfStateFileUrl: json['tfStateFileUrl'] as String?,
      type: (json['type'] as String?)?.let(InputSourceType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final inputSourceId = this.inputSourceId;
    final cfnStackArn = this.cfnStackArn;
    final createdAt = this.createdAt;
    final designFileS3Url = this.designFileS3Url;
    final eks = this.eks;
    final resourceTags = this.resourceTags;
    final tfStateFileUrl = this.tfStateFileUrl;
    final type = this.type;
    return {
      'inputSourceId': inputSourceId,
      if (cfnStackArn != null) 'cfnStackArn': cfnStackArn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (designFileS3Url != null) 'designFileS3Url': designFileS3Url,
      if (eks != null) 'eks': eks,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (tfStateFileUrl != null) 'tfStateFileUrl': tfStateFileUrl,
      if (type != null) 'type': type.value,
    };
  }
}

/// Defines an Amazon EKS cluster and its namespaces as an input source for
/// resource discovery.
///
/// @nodoc
class EksSource {
  final String clusterArn;

  /// The list of Kubernetes namespaces within the EKS cluster.
  final List<String> namespaces;

  EksSource({
    required this.clusterArn,
    required this.namespaces,
  });

  factory EksSource.fromJson(Map<String, dynamic> json) {
    return EksSource(
      clusterArn: (json['clusterArn'] as String?) ?? '',
      namespaces: ((json['namespaces'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterArn = this.clusterArn;
    final namespaces = this.namespaces;
    return {
      'clusterArn': clusterArn,
      'namespaces': namespaces,
    };
  }
}

/// A tag key-value pair used for resource discovery.
///
/// @nodoc
class ResourceTag {
  final String key;

  /// The list of tag values.
  final List<String> values;

  ResourceTag({
    required this.key,
    required this.values,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      key: (json['key'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'key': key,
      'values': values,
    };
  }
}

/// Contains summary information about a finding.
///
/// @nodoc
class FindingSummary {
  final String? description;

  /// The failure category of the finding.
  final FailureCategory? failureCategory;

  /// The unique identifier of the finding.
  final String? findingId;

  /// The name of the finding.
  final String? name;

  /// The policy component associated with the finding.
  final PolicyComponent? policyComponent;
  final String? serviceArn;

  /// The severity of the finding.
  final FindingSeverity? severity;

  /// The current status of the finding.
  final FindingStatus? status;

  /// The timestamp when the finding was last updated.
  final DateTime? updatedAt;

  FindingSummary({
    this.description,
    this.failureCategory,
    this.findingId,
    this.name,
    this.policyComponent,
    this.serviceArn,
    this.severity,
    this.status,
    this.updatedAt,
  });

  factory FindingSummary.fromJson(Map<String, dynamic> json) {
    return FindingSummary(
      description: json['description'] as String?,
      failureCategory:
          (json['failureCategory'] as String?)?.let(FailureCategory.fromString),
      findingId: json['findingId'] as String?,
      name: json['name'] as String?,
      policyComponent:
          (json['policyComponent'] as String?)?.let(PolicyComponent.fromString),
      serviceArn: json['serviceArn'] as String?,
      severity: (json['severity'] as String?)?.let(FindingSeverity.fromString),
      status: (json['status'] as String?)?.let(FindingStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final failureCategory = this.failureCategory;
    final findingId = this.findingId;
    final name = this.name;
    final policyComponent = this.policyComponent;
    final serviceArn = this.serviceArn;
    final severity = this.severity;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (description != null) 'description': description,
      if (failureCategory != null) 'failureCategory': failureCategory.value,
      if (findingId != null) 'findingId': findingId,
      if (name != null) 'name': name,
      if (policyComponent != null) 'policyComponent': policyComponent.value,
      if (serviceArn != null) 'serviceArn': serviceArn,
      if (severity != null) 'severity': severity.value,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Contains summary information about a failure mode assessment.
///
/// @nodoc
class AssessmentSummary {
  /// The unique identifier of the assessment.
  final String assessmentId;
  final String serviceArn;

  /// The achievability results from the assessment.
  final Achievability? achievability;

  /// The cost of the assessment.
  final AssessmentCost? assessmentCost;

  /// The current status of the assessment.
  final AssessmentStatus? assessmentStatus;

  /// The current step of the assessment process.
  final AssessmentStep? assessmentStep;

  /// The number of billable assessment units consumed by the assessment.
  final int? billableAssessmentUnitCount;

  /// The timestamp when the assessment ended.
  final DateTime? endedAt;

  /// The error code if the assessment failed.
  final AssessmentErrorCode? errorCode;

  /// A message describing the error if the assessment failed.
  final String? errorMessage;

  /// The timestamp when the assessment started.
  final DateTime? startedAt;

  /// The total number of findings generated by the assessment.
  final int? totalFindings;

  AssessmentSummary({
    required this.assessmentId,
    required this.serviceArn,
    this.achievability,
    this.assessmentCost,
    this.assessmentStatus,
    this.assessmentStep,
    this.billableAssessmentUnitCount,
    this.endedAt,
    this.errorCode,
    this.errorMessage,
    this.startedAt,
    this.totalFindings,
  });

  factory AssessmentSummary.fromJson(Map<String, dynamic> json) {
    return AssessmentSummary(
      assessmentId: (json['assessmentId'] as String?) ?? '',
      serviceArn: (json['serviceArn'] as String?) ?? '',
      achievability: json['achievability'] != null
          ? Achievability.fromJson(
              json['achievability'] as Map<String, dynamic>)
          : null,
      assessmentCost: json['assessmentCost'] != null
          ? AssessmentCost.fromJson(
              json['assessmentCost'] as Map<String, dynamic>)
          : null,
      assessmentStatus: (json['assessmentStatus'] as String?)
          ?.let(AssessmentStatus.fromString),
      assessmentStep:
          (json['assessmentStep'] as String?)?.let(AssessmentStep.fromString),
      billableAssessmentUnitCount: json['billableAssessmentUnitCount'] as int?,
      endedAt: timeStampFromJson(json['endedAt']),
      errorCode:
          (json['errorCode'] as String?)?.let(AssessmentErrorCode.fromString),
      errorMessage: json['errorMessage'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      totalFindings: json['totalFindings'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentId = this.assessmentId;
    final serviceArn = this.serviceArn;
    final achievability = this.achievability;
    final assessmentCost = this.assessmentCost;
    final assessmentStatus = this.assessmentStatus;
    final assessmentStep = this.assessmentStep;
    final billableAssessmentUnitCount = this.billableAssessmentUnitCount;
    final endedAt = this.endedAt;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final startedAt = this.startedAt;
    final totalFindings = this.totalFindings;
    return {
      'assessmentId': assessmentId,
      'serviceArn': serviceArn,
      if (achievability != null) 'achievability': achievability,
      if (assessmentCost != null) 'assessmentCost': assessmentCost,
      if (assessmentStatus != null) 'assessmentStatus': assessmentStatus.value,
      if (assessmentStep != null) 'assessmentStep': assessmentStep.value,
      if (billableAssessmentUnitCount != null)
        'billableAssessmentUnitCount': billableAssessmentUnitCount,
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (errorCode != null) 'errorCode': errorCode.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (startedAt != null) 'startedAt': unixTimestampToJson(startedAt),
      if (totalFindings != null) 'totalFindings': totalFindings,
    };
  }
}

/// @nodoc
class AssessmentStep {
  static const topologyEnhancement = AssessmentStep._('TOPOLOGY_ENHANCEMENT');
  static const serviceFunctionGeneration =
      AssessmentStep._('SERVICE_FUNCTION_GENERATION');
  static const resilienceAssessment = AssessmentStep._('RESILIENCE_ASSESSMENT');

  final String value;

  const AssessmentStep._(this.value);

  static const values = [
    topologyEnhancement,
    serviceFunctionGeneration,
    resilienceAssessment
  ];

  static AssessmentStep fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssessmentStep._(value));

  @override
  bool operator ==(other) => other is AssessmentStep && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AssessmentErrorCode {
  static const invalidPermissions =
      AssessmentErrorCode._('INVALID_PERMISSIONS');
  static const cmkAccessDenied = AssessmentErrorCode._('CMK_ACCESS_DENIED');
  static const agentError = AssessmentErrorCode._('AGENT_ERROR');
  static const internalError = AssessmentErrorCode._('INTERNAL_ERROR');
  static const designFileAccessDenied =
      AssessmentErrorCode._('DESIGN_FILE_ACCESS_DENIED');

  final String value;

  const AssessmentErrorCode._(this.value);

  static const values = [
    invalidPermissions,
    cmkAccessDenied,
    agentError,
    internalError,
    designFileAccessDenied
  ];

  static AssessmentErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AssessmentErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is AssessmentErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a discovered dependency.
///
/// @nodoc
class DependencySummary {
  /// The criticality level of the dependency.
  final DependencyCriticality criticality;

  /// The unique identifier of the dependency.
  final String dependencyId;

  /// The name of the dependency.
  final String dependencyName;

  /// The DNS name associated with the dependency.
  final String dnsName;

  /// The timestamp when the dependency was last detected.
  final DateTime lastDetectedTime;

  /// The location of the dependency.
  final String location;

  /// The query range data for the dependency.
  final QueryRange queryRange;
  final String serviceArn;

  /// The source Regions from which the dependency was detected.
  final List<String> sourceRegions;

  /// A user-provided comment about the dependency.
  final String? comment;

  /// The provider of the dependency.
  final String? provider;

  DependencySummary({
    required this.criticality,
    required this.dependencyId,
    required this.dependencyName,
    required this.dnsName,
    required this.lastDetectedTime,
    required this.location,
    required this.queryRange,
    required this.serviceArn,
    required this.sourceRegions,
    this.comment,
    this.provider,
  });

  factory DependencySummary.fromJson(Map<String, dynamic> json) {
    return DependencySummary(
      criticality: DependencyCriticality.fromString(
          (json['criticality'] as String?) ?? ''),
      dependencyId: (json['dependencyId'] as String?) ?? '',
      dependencyName: (json['dependencyName'] as String?) ?? '',
      dnsName: (json['dnsName'] as String?) ?? '',
      lastDetectedTime:
          nonNullableTimeStampFromJson(json['lastDetectedTime'] ?? 0),
      location: (json['location'] as String?) ?? '',
      queryRange: QueryRange.fromJson(
          (json['queryRange'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      serviceArn: (json['serviceArn'] as String?) ?? '',
      sourceRegions: ((json['sourceRegions'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      comment: json['comment'] as String?,
      provider: json['provider'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final criticality = this.criticality;
    final dependencyId = this.dependencyId;
    final dependencyName = this.dependencyName;
    final dnsName = this.dnsName;
    final lastDetectedTime = this.lastDetectedTime;
    final location = this.location;
    final queryRange = this.queryRange;
    final serviceArn = this.serviceArn;
    final sourceRegions = this.sourceRegions;
    final comment = this.comment;
    final provider = this.provider;
    return {
      'criticality': criticality.value,
      'dependencyId': dependencyId,
      'dependencyName': dependencyName,
      'dnsName': dnsName,
      'lastDetectedTime': unixTimestampToJson(lastDetectedTime),
      'location': location,
      'queryRange': queryRange,
      'serviceArn': serviceArn,
      'sourceRegions': sourceRegions,
      if (comment != null) 'comment': comment,
      if (provider != null) 'provider': provider,
    };
  }
}

/// Defines a time range for dependency query data.
///
/// @nodoc
class QueryRange {
  /// The data points within the query range.
  final List<QueryDataPoint> dataPoints;

  /// The end time of the query range.
  final DateTime endTime;

  /// The granularity of the query range data points.
  final QueryGranularity granularity;

  /// The start time of the query range.
  final DateTime startTime;

  QueryRange({
    required this.dataPoints,
    required this.endTime,
    required this.granularity,
    required this.startTime,
  });

  factory QueryRange.fromJson(Map<String, dynamic> json) {
    return QueryRange(
      dataPoints: ((json['dataPoints'] as List?) ?? const [])
          .nonNulls
          .map((e) => QueryDataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTime: nonNullableTimeStampFromJson(json['endTime'] ?? 0),
      granularity:
          QueryGranularity.fromString((json['granularity'] as String?) ?? ''),
      startTime: nonNullableTimeStampFromJson(json['startTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final dataPoints = this.dataPoints;
    final endTime = this.endTime;
    final granularity = this.granularity;
    final startTime = this.startTime;
    return {
      'dataPoints': dataPoints,
      'endTime': unixTimestampToJson(endTime),
      'granularity': granularity.value,
      'startTime': unixTimestampToJson(startTime),
    };
  }
}

/// @nodoc
class QueryGranularity {
  static const hourly = QueryGranularity._('HOURLY');
  static const daily = QueryGranularity._('DAILY');

  final String value;

  const QueryGranularity._(this.value);

  static const values = [hourly, daily];

  static QueryGranularity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryGranularity._(value));

  @override
  bool operator ==(other) => other is QueryGranularity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A data point in a dependency query range.
///
/// @nodoc
class QueryDataPoint {
  /// The number of queries at this data point.
  final int queryCount;

  /// The timestamp of the data point.
  final DateTime timestamp;

  QueryDataPoint({
    required this.queryCount,
    required this.timestamp,
  });

  factory QueryDataPoint.fromJson(Map<String, dynamic> json) {
    return QueryDataPoint(
      queryCount: (json['queryCount'] as int?) ?? 0,
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final queryCount = this.queryCount;
    final timestamp = this.timestamp;
    return {
      'queryCount': queryCount,
      'timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// Resource configuration for an input source. Provide exactly one field.
///
/// @nodoc
class ResourceConfiguration {
  final String? cfnStackArn;
  final String? designFileS3Url;

  /// The Amazon EKS configuration for resource discovery.
  final EksSource? eks;

  /// The resource tags for tag-based resource discovery.
  final List<ResourceTag>? resourceTags;
  final String? tfStateFileUrl;

  ResourceConfiguration({
    this.cfnStackArn,
    this.designFileS3Url,
    this.eks,
    this.resourceTags,
    this.tfStateFileUrl,
  });

  Map<String, dynamic> toJson() {
    final cfnStackArn = this.cfnStackArn;
    final designFileS3Url = this.designFileS3Url;
    final eks = this.eks;
    final resourceTags = this.resourceTags;
    final tfStateFileUrl = this.tfStateFileUrl;
    return {
      if (cfnStackArn != null) 'cfnStackArn': cfnStackArn,
      if (designFileS3Url != null) 'designFileS3Url': designFileS3Url,
      if (eks != null) 'eks': eks,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (tfStateFileUrl != null) 'tfStateFileUrl': tfStateFileUrl,
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
