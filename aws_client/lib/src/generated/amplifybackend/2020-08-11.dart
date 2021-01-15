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

part '2020-08-11.g.dart';

/// AWS Amplify Admin API
class AmplifyBackend {
  final _s.RestJsonProtocol _protocol;
  AmplifyBackend({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'amplifybackend',
            signingName: 'amplifybackend',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// This operation clones an existing backend.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [targetEnvironmentName] :
  /// The name of the destination backend environment to be created.
  Future<CloneBackendResponse> cloneBackend({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required String targetEnvironmentName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(targetEnvironmentName, 'targetEnvironmentName');
    final $payload = <String, dynamic>{
      'targetEnvironmentName': targetEnvironmentName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/environments/${Uri.encodeComponent(backendEnvironmentName)}/clone',
      exceptionFnMap: _exceptionFns,
    );
    return CloneBackendResponse.fromJson(response);
  }

  /// This operation creates a backend for an Amplify app. Backends are
  /// automatically created at the time of app creation.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [appName] :
  /// The name of the app.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceConfig] :
  /// The resource configuration for the backend creation request.
  ///
  /// Parameter [resourceName] :
  /// The name of the resource.
  Future<CreateBackendResponse> createBackend({
    @_s.required String appId,
    @_s.required String appName,
    @_s.required String backendEnvironmentName,
    ResourceConfig resourceConfig,
    String resourceName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(appName, 'appName');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    final $payload = <String, dynamic>{
      'appId': appId,
      'appName': appName,
      'backendEnvironmentName': backendEnvironmentName,
      if (resourceConfig != null) 'resourceConfig': resourceConfig,
      if (resourceName != null) 'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backend',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackendResponse.fromJson(response);
  }

  /// Creates a new backend API resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceConfig] :
  /// The resource configuration for this request.
  ///
  /// Parameter [resourceName] :
  /// The name of this resource.
  Future<CreateBackendAPIResponse> createBackendAPI({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required BackendAPIResourceConfig resourceConfig,
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(resourceConfig, 'resourceConfig');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $payload = <String, dynamic>{
      'backendEnvironmentName': backendEnvironmentName,
      'resourceConfig': resourceConfig,
      'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backend/${Uri.encodeComponent(appId)}/api',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackendAPIResponse.fromJson(response);
  }

  /// Creates a new backend authentication resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceConfig] :
  /// The resource configuration for this request object.
  ///
  /// Parameter [resourceName] :
  /// The name of this resource.
  Future<CreateBackendAuthResponse> createBackendAuth({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required CreateBackendAuthResourceConfig resourceConfig,
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(resourceConfig, 'resourceConfig');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $payload = <String, dynamic>{
      'backendEnvironmentName': backendEnvironmentName,
      'resourceConfig': resourceConfig,
      'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backend/${Uri.encodeComponent(appId)}/auth',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackendAuthResponse.fromJson(response);
  }

  /// Creates a config object for a backend.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendManagerAppId] :
  /// The app ID for the backend manager.
  Future<CreateBackendConfigResponse> createBackendConfig({
    @_s.required String appId,
    String backendManagerAppId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    final $payload = <String, dynamic>{
      if (backendManagerAppId != null)
        'backendManagerAppId': backendManagerAppId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backend/${Uri.encodeComponent(appId)}/config',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackendConfigResponse.fromJson(response);
  }

  /// Generates a one-time challenge code to authenticate a user into your
  /// Amplify Admin UI.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  Future<CreateTokenResponse> createToken({
    @_s.required String appId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/backend/${Uri.encodeComponent(appId)}/challenge',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTokenResponse.fromJson(response);
  }

  /// Removes an existing environment from your Amplify project.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  Future<DeleteBackendResponse> deleteBackend({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/environments/${Uri.encodeComponent(backendEnvironmentName)}/remove',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBackendResponse.fromJson(response);
  }

  /// Deletes an existing backend API resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceName] :
  /// The name of this resource.
  ///
  /// Parameter [resourceConfig] :
  /// Defines the resource configuration for the data model in your Amplify
  /// project.
  Future<DeleteBackendAPIResponse> deleteBackendAPI({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required String resourceName,
    BackendAPIResourceConfig resourceConfig,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $payload = <String, dynamic>{
      'resourceName': resourceName,
      if (resourceConfig != null) 'resourceConfig': resourceConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/api/${Uri.encodeComponent(backendEnvironmentName)}/remove',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBackendAPIResponse.fromJson(response);
  }

  /// Deletes an existing backend authentication resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceName] :
  /// The name of this resource.
  Future<DeleteBackendAuthResponse> deleteBackendAuth({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $payload = <String, dynamic>{
      'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/auth/${Uri.encodeComponent(backendEnvironmentName)}/remove',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBackendAuthResponse.fromJson(response);
  }

  /// Deletes the challenge token based on the given appId and sessionId.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  Future<DeleteTokenResponse> deleteToken({
    @_s.required String appId,
    @_s.required String sessionId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/challenge/${Uri.encodeComponent(sessionId)}/remove',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteTokenResponse.fromJson(response);
  }

  /// Generates a model schema for an existing backend API resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceName] :
  /// The name of this resource.
  Future<GenerateBackendAPIModelsResponse> generateBackendAPIModels({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $payload = <String, dynamic>{
      'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/api/${Uri.encodeComponent(backendEnvironmentName)}/generateModels',
      exceptionFnMap: _exceptionFns,
    );
    return GenerateBackendAPIModelsResponse.fromJson(response);
  }

  /// Provides project-level details for your Amplify UI project.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  Future<GetBackendResponse> getBackend({
    @_s.required String appId,
    String backendEnvironmentName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    final $payload = <String, dynamic>{
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backend/${Uri.encodeComponent(appId)}/details',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackendResponse.fromJson(response);
  }

  /// Gets the details for a backend API.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceName] :
  /// The name of this resource.
  ///
  /// Parameter [resourceConfig] :
  /// Defines the resource configuration for the data model in your Amplify
  /// project.
  Future<GetBackendAPIResponse> getBackendAPI({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required String resourceName,
    BackendAPIResourceConfig resourceConfig,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $payload = <String, dynamic>{
      'resourceName': resourceName,
      if (resourceConfig != null) 'resourceConfig': resourceConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/api/${Uri.encodeComponent(backendEnvironmentName)}/details',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackendAPIResponse.fromJson(response);
  }

  /// Generates a model schema for existing backend API resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceName] :
  /// The name of this resource.
  Future<GetBackendAPIModelsResponse> getBackendAPIModels({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $payload = <String, dynamic>{
      'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/api/${Uri.encodeComponent(backendEnvironmentName)}/getModels',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackendAPIModelsResponse.fromJson(response);
  }

  /// Gets backend auth details.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceName] :
  /// The name of this resource.
  Future<GetBackendAuthResponse> getBackendAuth({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $payload = <String, dynamic>{
      'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/auth/${Uri.encodeComponent(backendEnvironmentName)}/details',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackendAuthResponse.fromJson(response);
  }

  /// Returns information about a specific job.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [jobId] :
  /// The ID for the job.
  Future<GetBackendJobResponse> getBackendJob({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(jobId, 'jobId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/job/${Uri.encodeComponent(backendEnvironmentName)}/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackendJobResponse.fromJson(response);
  }

  /// Gets the challenge token based on the given appId and sessionId.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  Future<GetTokenResponse> getToken({
    @_s.required String appId,
    @_s.required String sessionId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/challenge/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTokenResponse.fromJson(response);
  }

  /// Lists the jobs for the backend of an Amplify app.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [jobId] :
  /// The ID for the job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that you want in the response.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [operation] :
  /// Filters the list of response objects to include only those with the
  /// specified operation name.
  ///
  /// Parameter [status] :
  /// Filters the list of response objects to include only those with the
  /// specified status.
  Future<ListBackendJobsResponse> listBackendJobs({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    String jobId,
    int maxResults,
    String nextToken,
    String operation,
    String status,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (jobId != null) 'jobId': jobId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/job/${Uri.encodeComponent(backendEnvironmentName)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListBackendJobsResponse.fromJson(response);
  }

  /// Removes all backend environments from your Amplify project.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [cleanAmplifyApp] :
  /// Cleans up the Amplify Console app if this value is set to true.
  Future<RemoveAllBackendsResponse> removeAllBackends({
    @_s.required String appId,
    bool cleanAmplifyApp,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    final $payload = <String, dynamic>{
      if (cleanAmplifyApp != null) 'cleanAmplifyApp': cleanAmplifyApp,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backend/${Uri.encodeComponent(appId)}/remove',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveAllBackendsResponse.fromJson(response);
  }

  /// Removes the AWS resources that are required to access the Amplify Admin
  /// UI.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  Future<RemoveBackendConfigResponse> removeBackendConfig({
    @_s.required String appId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/backend/${Uri.encodeComponent(appId)}/config/remove',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveBackendConfigResponse.fromJson(response);
  }

  /// Updates an existing backend API resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceName] :
  /// The name of this resource.
  ///
  /// Parameter [resourceConfig] :
  /// Defines the resource configuration for the data model in your Amplify
  /// project.
  Future<UpdateBackendAPIResponse> updateBackendAPI({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required String resourceName,
    BackendAPIResourceConfig resourceConfig,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $payload = <String, dynamic>{
      'resourceName': resourceName,
      if (resourceConfig != null) 'resourceConfig': resourceConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/api/${Uri.encodeComponent(backendEnvironmentName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBackendAPIResponse.fromJson(response);
  }

  /// Updates an existing backend authentication resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [resourceConfig] :
  /// The resource configuration for this request object.
  ///
  /// Parameter [resourceName] :
  /// The name of this resource.
  Future<UpdateBackendAuthResponse> updateBackendAuth({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required UpdateBackendAuthResourceConfig resourceConfig,
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(resourceConfig, 'resourceConfig');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $payload = <String, dynamic>{
      'resourceConfig': resourceConfig,
      'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/auth/${Uri.encodeComponent(backendEnvironmentName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBackendAuthResponse.fromJson(response);
  }

  /// Updates the AWS resources that are required to access the Amplify Admin
  /// UI.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [loginAuthConfig] :
  /// Describes the Amazon Cognito configuration for Admin UI access.
  Future<UpdateBackendConfigResponse> updateBackendConfig({
    @_s.required String appId,
    LoginAuthConfigReqObj loginAuthConfig,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    final $payload = <String, dynamic>{
      if (loginAuthConfig != null) 'loginAuthConfig': loginAuthConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backend/${Uri.encodeComponent(appId)}/config/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBackendConfigResponse.fromJson(response);
  }

  /// Updates a specific job.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  ///
  /// Parameter [backendEnvironmentName] :
  /// The name of the backend environment.
  ///
  /// Parameter [jobId] :
  /// The ID for the job.
  ///
  /// Parameter [operation] :
  /// Filters the list of response objects to include only those with the
  /// specified operation name.
  ///
  /// Parameter [status] :
  /// Filters the list of response objects to include only those with the
  /// specified status.
  Future<UpdateBackendJobResponse> updateBackendJob({
    @_s.required String appId,
    @_s.required String backendEnvironmentName,
    @_s.required String jobId,
    String operation,
    String status,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(
        backendEnvironmentName, 'backendEnvironmentName');
    ArgumentError.checkNotNull(jobId, 'jobId');
    final $payload = <String, dynamic>{
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/job/${Uri.encodeComponent(backendEnvironmentName)}/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBackendJobResponse.fromJson(response);
  }
}

enum AuthResources {
  @_s.JsonValue('USER_POOL_ONLY')
  userPoolOnly,
  @_s.JsonValue('IDENTITY_POOL_AND_USER_POOL')
  identityPoolAndUserPool,
}

/// The authentication settings for accessing provisioned data models in your
/// Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BackendAPIAppSyncAuthSettings {
  /// The Amazon Cognito user pool ID, if Amazon Cognito is used as an
  /// authentication setting to access your data models.
  @_s.JsonKey(name: 'cognitoUserPoolId')
  final String cognitoUserPoolId;

  /// The API key description for API_KEY, if it is used as an authentication
  /// mechanism to access your data models.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The API key expiration time for API_KEY, if it is used as an authentication
  /// mechanism to access your data models.
  @_s.JsonKey(name: 'expirationTime')
  final double expirationTime;

  /// The expiry time for the OpenID authentication mechanism.
  @_s.JsonKey(name: 'openIDAuthTTL')
  final String openIDAuthTTL;

  /// The clientID for openID, if openID is used as an authentication setting to
  /// access your data models.
  @_s.JsonKey(name: 'openIDClientId')
  final String openIDClientId;

  /// The expiry time for the OpenID authentication mechanism.
  @_s.JsonKey(name: 'openIDIatTTL')
  final String openIDIatTTL;

  /// The openID issuer URL, if openID is used as an authentication setting to
  /// access your data models.
  @_s.JsonKey(name: 'openIDIssueURL')
  final String openIDIssueURL;

  /// The openID provider name, if openID is used as an authentication mechanism
  /// to access your data models.
  @_s.JsonKey(name: 'openIDProviderName')
  final String openIDProviderName;

  BackendAPIAppSyncAuthSettings({
    this.cognitoUserPoolId,
    this.description,
    this.expirationTime,
    this.openIDAuthTTL,
    this.openIDClientId,
    this.openIDIatTTL,
    this.openIDIssueURL,
    this.openIDProviderName,
  });
  factory BackendAPIAppSyncAuthSettings.fromJson(Map<String, dynamic> json) =>
      _$BackendAPIAppSyncAuthSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$BackendAPIAppSyncAuthSettingsToJson(this);
}

/// Describes the auth types for your configured data models.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BackendAPIAuthType {
  /// Describes the authentication mode.
  @_s.JsonKey(name: 'mode')
  final Mode mode;

  /// Describes settings for the authentication mode.
  @_s.JsonKey(name: 'settings')
  final BackendAPIAppSyncAuthSettings settings;

  BackendAPIAuthType({
    this.mode,
    this.settings,
  });
  factory BackendAPIAuthType.fromJson(Map<String, dynamic> json) =>
      _$BackendAPIAuthTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BackendAPIAuthTypeToJson(this);
}

/// Describes the conflict resolution configuration for the data model
/// configured in your Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BackendAPIConflictResolution {
  /// The strategy for conflict resolution.
  @_s.JsonKey(name: 'resolutionStrategy')
  final ResolutionStrategy resolutionStrategy;

  BackendAPIConflictResolution({
    this.resolutionStrategy,
  });
  factory BackendAPIConflictResolution.fromJson(Map<String, dynamic> json) =>
      _$BackendAPIConflictResolutionFromJson(json);

  Map<String, dynamic> toJson() => _$BackendAPIConflictResolutionToJson(this);
}

/// The resource configuration for the data model, configured as a part of the
/// Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BackendAPIResourceConfig {
  /// Additional authentication methods used to interact with your data models.
  @_s.JsonKey(name: 'additionalAuthTypes')
  final List<BackendAPIAuthType> additionalAuthTypes;

  /// The API name used to interact with the data model, configured as a part of
  /// the Amplify project.
  @_s.JsonKey(name: 'apiName')
  final String apiName;

  /// The conflict resolution strategy for your data stored in the data models.
  @_s.JsonKey(name: 'conflictResolution')
  final BackendAPIConflictResolution conflictResolution;

  /// The default authentication type for interacting with the configured data
  /// models in your Amplify project.
  @_s.JsonKey(name: 'defaultAuthType')
  final BackendAPIAuthType defaultAuthType;

  /// The service used to provision and interact with the data model.
  @_s.JsonKey(name: 'service')
  final String service;

  /// The definition of the data model in the annotated transform of the GraphQL
  /// schema.
  @_s.JsonKey(name: 'transformSchema')
  final String transformSchema;

  BackendAPIResourceConfig({
    this.additionalAuthTypes,
    this.apiName,
    this.conflictResolution,
    this.defaultAuthType,
    this.service,
    this.transformSchema,
  });
  factory BackendAPIResourceConfig.fromJson(Map<String, dynamic> json) =>
      _$BackendAPIResourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BackendAPIResourceConfigToJson(this);
}

/// Describes third-party social federation configurations for allowing your app
/// users to sign in using OAuth.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BackendAuthSocialProviderConfig {
  /// Describes the client_id that can be obtained from the third-party social
  /// federation provider.
  @_s.JsonKey(name: 'client_id')
  final String clientId;

  /// Describes the client_secret that can be obtained from third-party social
  /// federation providers.
  @_s.JsonKey(name: 'client_secret')
  final String clientSecret;

  BackendAuthSocialProviderConfig({
    this.clientId,
    this.clientSecret,
  });
  factory BackendAuthSocialProviderConfig.fromJson(Map<String, dynamic> json) =>
      _$BackendAuthSocialProviderConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BackendAuthSocialProviderConfigToJson(this);
}

/// The response object for this operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackendJobRespObj {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// The time when the job was created.
  @_s.JsonKey(name: 'createTime')
  final String createTime;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The time when the job was last updated.
  @_s.JsonKey(name: 'updateTime')
  final String updateTime;

  BackendJobRespObj({
    @_s.required this.appId,
    @_s.required this.backendEnvironmentName,
    this.createTime,
    this.error,
    this.jobId,
    this.operation,
    this.status,
    this.updateTime,
  });
  factory BackendJobRespObj.fromJson(Map<String, dynamic> json) =>
      _$BackendJobRespObjFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloneBackendResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  CloneBackendResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory CloneBackendResponse.fromJson(Map<String, dynamic> json) =>
      _$CloneBackendResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackendAPIResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  CreateBackendAPIResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory CreateBackendAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBackendAPIResponseFromJson(json);
}

/// Describes the forgot password policy for authenticating into the Amplify
/// app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateBackendAuthForgotPasswordConfig {
  /// Describes which method to use (either SMS or email) to deliver messages to
  /// app users that want to recover their password.
  @_s.JsonKey(name: 'deliveryMethod')
  final DeliveryMethod deliveryMethod;

  /// The configuration for the email sent when an app user forgets their
  /// password.
  @_s.JsonKey(name: 'emailSettings')
  final EmailSettings emailSettings;

  /// The configuration for the SMS message sent when an app user forgets their
  /// password.
  @_s.JsonKey(name: 'smsSettings')
  final SmsSettings smsSettings;

  CreateBackendAuthForgotPasswordConfig({
    @_s.required this.deliveryMethod,
    this.emailSettings,
    this.smsSettings,
  });
  factory CreateBackendAuthForgotPasswordConfig.fromJson(
          Map<String, dynamic> json) =>
      _$CreateBackendAuthForgotPasswordConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateBackendAuthForgotPasswordConfigToJson(this);
}

/// Describes authorization configurations for the auth resources, configured as
/// a part of your Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateBackendAuthIdentityPoolConfig {
  /// Name of the identity pool used for authorization.
  @_s.JsonKey(name: 'identityPoolName')
  final String identityPoolName;

  /// Set to true or false based on whether you want to enable guest authorization
  /// to your Amplify app.
  @_s.JsonKey(name: 'unauthenticatedLogin')
  final bool unauthenticatedLogin;

  CreateBackendAuthIdentityPoolConfig({
    @_s.required this.identityPoolName,
    @_s.required this.unauthenticatedLogin,
  });
  factory CreateBackendAuthIdentityPoolConfig.fromJson(
          Map<String, dynamic> json) =>
      _$CreateBackendAuthIdentityPoolConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateBackendAuthIdentityPoolConfigToJson(this);
}

/// Describes whether to apply multi-factor authentication (MFA) policies for
/// your Amazon Cognito user pool that's configured as a part of your Amplify
/// project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateBackendAuthMFAConfig {
  /// Describes whether MFA should be [ON, OFF, or OPTIONAL] for authentication in
  /// your Amplify project.
  @_s.JsonKey(name: 'MFAMode')
  final MFAMode mFAMode;

  /// Describes the configuration settings and methods for your Amplify app users
  /// to use MFA.
  @_s.JsonKey(name: 'settings')
  final Settings settings;

  CreateBackendAuthMFAConfig({
    @_s.required this.mFAMode,
    this.settings,
  });
  factory CreateBackendAuthMFAConfig.fromJson(Map<String, dynamic> json) =>
      _$CreateBackendAuthMFAConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBackendAuthMFAConfigToJson(this);
}

/// Creates the OAuth configuration for your Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateBackendAuthOAuthConfig {
  /// The OAuth grant type that you use to allow app users to authenticate from
  /// your Amplify app.
  @_s.JsonKey(name: 'oAuthGrantType')
  final OAuthGrantType oAuthGrantType;

  /// List of OAuth-related flows that allow your app users to authenticate from
  /// your Amplify app.
  @_s.JsonKey(name: 'oAuthScopes')
  final List<OAuthScopesElement> oAuthScopes;

  /// The redirected URI for signing in to your Amplify app.
  @_s.JsonKey(name: 'redirectSignInURIs')
  final List<String> redirectSignInURIs;

  /// Redirect URLs that OAuth uses when a user signs out of an Amplify app.
  @_s.JsonKey(name: 'redirectSignOutURIs')
  final List<String> redirectSignOutURIs;

  /// The domain prefix for your Amplify app.
  @_s.JsonKey(name: 'domainPrefix')
  final String domainPrefix;

  /// The settings for using social identity providers for access to your Amplify
  /// app.
  @_s.JsonKey(name: 'socialProviderSettings')
  final SocialProviderSettings socialProviderSettings;

  CreateBackendAuthOAuthConfig({
    @_s.required this.oAuthGrantType,
    @_s.required this.oAuthScopes,
    @_s.required this.redirectSignInURIs,
    @_s.required this.redirectSignOutURIs,
    this.domainPrefix,
    this.socialProviderSettings,
  });
  factory CreateBackendAuthOAuthConfig.fromJson(Map<String, dynamic> json) =>
      _$CreateBackendAuthOAuthConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBackendAuthOAuthConfigToJson(this);
}

/// The password policy configuration for the backend of your Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateBackendAuthPasswordPolicyConfig {
  /// The minimum length of the password used to access the backend of your
  /// Amplify project.
  @_s.JsonKey(name: 'minimumLength')
  final double minimumLength;

  /// Additional constraints for the password used to access the backend of your
  /// Amplify project.
  @_s.JsonKey(name: 'additionalConstraints')
  final List<AdditionalConstraintsElement> additionalConstraints;

  CreateBackendAuthPasswordPolicyConfig({
    @_s.required this.minimumLength,
    this.additionalConstraints,
  });
  factory CreateBackendAuthPasswordPolicyConfig.fromJson(
          Map<String, dynamic> json) =>
      _$CreateBackendAuthPasswordPolicyConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateBackendAuthPasswordPolicyConfigToJson(this);
}

/// Defines the resource configuration when creating an auth resource in your
/// Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateBackendAuthResourceConfig {
  /// Defines whether you want to configure only authentication or both
  /// authentication and authorization settings.
  @_s.JsonKey(name: 'authResources')
  final AuthResources authResources;

  /// Defines the service name to use when configuring an authentication resource
  /// in your Amplify project.
  @_s.JsonKey(name: 'service')
  final Service service;

  /// Describes the authentication configuration for the Amazon Cognito user pool,
  /// provisioned as a part of the auth resource in your Amplify project.
  @_s.JsonKey(name: 'userPoolConfigs')
  final CreateBackendAuthUserPoolConfig userPoolConfigs;

  /// Describes the authorization configuration for the Amazon Cognito identity
  /// pool, provisioned as a part of the auth resource in your Amplify project.
  @_s.JsonKey(name: 'identityPoolConfigs')
  final CreateBackendAuthIdentityPoolConfig identityPoolConfigs;

  CreateBackendAuthResourceConfig({
    @_s.required this.authResources,
    @_s.required this.service,
    @_s.required this.userPoolConfigs,
    this.identityPoolConfigs,
  });
  factory CreateBackendAuthResourceConfig.fromJson(Map<String, dynamic> json) =>
      _$CreateBackendAuthResourceConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateBackendAuthResourceConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackendAuthResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  CreateBackendAuthResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory CreateBackendAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBackendAuthResponseFromJson(json);
}

/// Describes the Amazon Cognito user pool configuration for the auth resource
/// to be configured for your Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateBackendAuthUserPoolConfig {
  /// The required attributes to sign up new users in the Amazon Cognito user
  /// pool.
  @_s.JsonKey(name: 'requiredSignUpAttributes')
  final List<RequiredSignUpAttributesElement> requiredSignUpAttributes;

  /// Describes the sign-in methods that your Amplify app users to log in using
  /// the Amazon Cognito user pool that's configured as a part of your Amplify
  /// project.
  @_s.JsonKey(name: 'signInMethod')
  final SignInMethod signInMethod;

  /// The Amazon Cognito user pool name.
  @_s.JsonKey(name: 'userPoolName')
  final String userPoolName;

  /// Describes the forgotten password policy for your Amazon Cognito user pool,
  /// configured as a part of your Amplify project.
  @_s.JsonKey(name: 'forgotPassword')
  final CreateBackendAuthForgotPasswordConfig forgotPassword;

  /// Describes whether to apply multi-factor authentication (MFA) policies for
  /// your Amazon Cognito user pool that's configured as a part of your Amplify
  /// project.
  @_s.JsonKey(name: 'mfa')
  final CreateBackendAuthMFAConfig mfa;

  /// Describes the OAuth policy and rules for your Amazon Cognito user pool,
  /// configured as a part of your Amplify project.
  @_s.JsonKey(name: 'oAuth')
  final CreateBackendAuthOAuthConfig oAuth;

  /// Describes the password policy for your Amazon Cognito user pool, configured
  /// as a part of your Amplify project.
  @_s.JsonKey(name: 'passwordPolicy')
  final CreateBackendAuthPasswordPolicyConfig passwordPolicy;

  CreateBackendAuthUserPoolConfig({
    @_s.required this.requiredSignUpAttributes,
    @_s.required this.signInMethod,
    @_s.required this.userPoolName,
    this.forgotPassword,
    this.mfa,
    this.oAuth,
    this.passwordPolicy,
  });
  factory CreateBackendAuthUserPoolConfig.fromJson(Map<String, dynamic> json) =>
      _$CreateBackendAuthUserPoolConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateBackendAuthUserPoolConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackendConfigResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  CreateBackendConfigResponse({
    this.appId,
    this.backendEnvironmentName,
    this.jobId,
    this.status,
  });
  factory CreateBackendConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBackendConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackendResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  CreateBackendResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory CreateBackendResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBackendResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTokenResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// One-time challenge code for authenticating into the Amplify Admin UI.
  @_s.JsonKey(name: 'challengeCode')
  final String challengeCode;

  /// A unique ID provided when creating a new challenge token.
  @_s.JsonKey(name: 'sessionId')
  final String sessionId;

  /// The expiry time for the one-time generated token code.
  @_s.JsonKey(name: 'ttl')
  final String ttl;

  CreateTokenResponse({
    this.appId,
    this.challengeCode,
    this.sessionId,
    this.ttl,
  });
  factory CreateTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTokenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBackendAPIResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  DeleteBackendAPIResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory DeleteBackendAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackendAPIResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBackendAuthResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  DeleteBackendAuthResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory DeleteBackendAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackendAuthResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBackendResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  DeleteBackendResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory DeleteBackendResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackendResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTokenResponse {
  /// Indicates whether the request succeeded or failed.
  @_s.JsonKey(name: 'isSuccess')
  final bool isSuccess;

  DeleteTokenResponse({
    this.isSuccess,
  });
  factory DeleteTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTokenResponseFromJson(json);
}

enum DeliveryMethod {
  @_s.JsonValue('EMAIL')
  email,
  @_s.JsonValue('SMS')
  sms,
}

/// The configuration for the email sent when an app user forgets their
/// password.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmailSettings {
  /// The body of the email.
  @_s.JsonKey(name: 'emailMessage')
  final String emailMessage;

  /// The subject of the email.
  @_s.JsonKey(name: 'emailSubject')
  final String emailSubject;

  EmailSettings({
    this.emailMessage,
    this.emailSubject,
  });
  factory EmailSettings.fromJson(Map<String, dynamic> json) =>
      _$EmailSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$EmailSettingsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenerateBackendAPIModelsResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  GenerateBackendAPIModelsResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory GenerateBackendAPIModelsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GenerateBackendAPIModelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackendAPIModelsResponse {
  /// Stringified JSON of the DataStore model.
  @_s.JsonKey(name: 'models')
  final String models;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final Status status;

  GetBackendAPIModelsResponse({
    this.models,
    this.status,
  });
  factory GetBackendAPIModelsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBackendAPIModelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackendAPIResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The resource configuration for this response object.
  @_s.JsonKey(name: 'resourceConfig')
  final BackendAPIResourceConfig resourceConfig;

  /// The name of this resource.
  @_s.JsonKey(name: 'resourceName')
  final String resourceName;

  GetBackendAPIResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.resourceConfig,
    this.resourceName,
  });
  factory GetBackendAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBackendAPIResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackendAuthResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The resource configuration for authorization requests to the backend of your
  /// Amplify project.
  @_s.JsonKey(name: 'resourceConfig')
  final CreateBackendAuthResourceConfig resourceConfig;

  /// The name of this resource.
  @_s.JsonKey(name: 'resourceName')
  final String resourceName;

  GetBackendAuthResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.resourceConfig,
    this.resourceName,
  });
  factory GetBackendAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBackendAuthResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackendJobResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// The time when the job was created.
  @_s.JsonKey(name: 'createTime')
  final String createTime;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The time when the job was last updated.
  @_s.JsonKey(name: 'updateTime')
  final String updateTime;

  GetBackendJobResponse({
    this.appId,
    this.backendEnvironmentName,
    this.createTime,
    this.error,
    this.jobId,
    this.operation,
    this.status,
    this.updateTime,
  });
  factory GetBackendJobResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBackendJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBackendResponse {
  /// A stringified version of the current configurations for your Amplify
  /// project.
  @_s.JsonKey(name: 'amplifyMetaConfig')
  final String amplifyMetaConfig;

  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the app.
  @_s.JsonKey(name: 'appName')
  final String appName;

  /// A list of backend environments in an array.
  @_s.JsonKey(name: 'backendEnvironmentList')
  final List<String> backendEnvironmentList;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  GetBackendResponse({
    this.amplifyMetaConfig,
    this.appId,
    this.appName,
    this.backendEnvironmentList,
    this.backendEnvironmentName,
    this.error,
  });
  factory GetBackendResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBackendResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTokenResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The one-time challenge code for authenticating into the Amplify Admin UI.
  @_s.JsonKey(name: 'challengeCode')
  final String challengeCode;

  /// A unique ID provided when creating a new challenge token.
  @_s.JsonKey(name: 'sessionId')
  final String sessionId;

  /// The expiry time for the one-time generated token code.
  @_s.JsonKey(name: 'ttl')
  final String ttl;

  GetTokenResponse({
    this.appId,
    this.challengeCode,
    this.sessionId,
    this.ttl,
  });
  factory GetTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTokenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBackendJobsResponse {
  /// An array of jobs and their properties.
  @_s.JsonKey(name: 'jobs')
  final List<BackendJobRespObj> jobs;

  /// The token for the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBackendJobsResponse({
    this.jobs,
    this.nextToken,
  });
  factory ListBackendJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBackendJobsResponseFromJson(json);
}

/// The request object for this operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoginAuthConfigReqObj {
  /// The Amazon Cognito identity pool ID used for Amplify Admin UI login
  /// authorization.
  @_s.JsonKey(name: 'aws_cognito_identity_pool_id')
  final String awsCognitoIdentityPoolId;

  /// The AWS Region for the Amplify Admin UI login.
  @_s.JsonKey(name: 'aws_cognito_region')
  final String awsCognitoRegion;

  /// The Amazon Cognito user pool ID used for Amplify Admin UI login
  /// authentication.
  @_s.JsonKey(name: 'aws_user_pools_id')
  final String awsUserPoolsId;

  /// The web client ID for the Amazon Cognito user pools.
  @_s.JsonKey(name: 'aws_user_pools_web_client_id')
  final String awsUserPoolsWebClientId;

  LoginAuthConfigReqObj({
    this.awsCognitoIdentityPoolId,
    this.awsCognitoRegion,
    this.awsUserPoolsId,
    this.awsUserPoolsWebClientId,
  });
  factory LoginAuthConfigReqObj.fromJson(Map<String, dynamic> json) =>
      _$LoginAuthConfigReqObjFromJson(json);

  Map<String, dynamic> toJson() => _$LoginAuthConfigReqObjToJson(this);
}

enum MFAMode {
  @_s.JsonValue('ON')
  on,
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('OPTIONAL')
  optional,
}

enum Mode {
  @_s.JsonValue('API_KEY')
  apiKey,
  @_s.JsonValue('AWS_IAM')
  awsIam,
  @_s.JsonValue('AMAZON_COGNITO_USER_POOLS')
  amazonCognitoUserPools,
  @_s.JsonValue('OPENID_CONNECT')
  openidConnect,
}

enum OAuthGrantType {
  @_s.JsonValue('CODE')
  code,
  @_s.JsonValue('IMPLICIT')
  implicit,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveAllBackendsResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  RemoveAllBackendsResponse({
    this.appId,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory RemoveAllBackendsResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveAllBackendsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveBackendConfigResponse {
  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  RemoveBackendConfigResponse({
    this.error,
  });
  factory RemoveBackendConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveBackendConfigResponseFromJson(json);
}

enum ResolutionStrategy {
  @_s.JsonValue('OPTIMISTIC_CONCURRENCY')
  optimisticConcurrency,
  @_s.JsonValue('LAMBDA')
  lambda,
  @_s.JsonValue('AUTOMERGE')
  automerge,
  @_s.JsonValue('NONE')
  none,
}

/// Defines the resource configuration for the data model in your Amplify
/// project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ResourceConfig {
  ResourceConfig();
  Map<String, dynamic> toJson() => _$ResourceConfigToJson(this);
}

enum Service {
  @_s.JsonValue('COGNITO')
  cognito,
}

/// The settings of your MFA configuration for the backend of your Amplify
/// project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Settings {
  /// The supported MFA types.
  @_s.JsonKey(name: 'mfaTypes')
  final List<MfaTypesElement> mfaTypes;

  /// The body of the SMS message.
  @_s.JsonKey(name: 'smsMessage')
  final String smsMessage;

  Settings({
    this.mfaTypes,
    this.smsMessage,
  });
  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}

enum SignInMethod {
  @_s.JsonValue('EMAIL')
  email,
  @_s.JsonValue('EMAIL_AND_PHONE_NUMBER')
  emailAndPhoneNumber,
  @_s.JsonValue('PHONE_NUMBER')
  phoneNumber,
  @_s.JsonValue('USERNAME')
  username,
}

/// SMS settings for authentication.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SmsSettings {
  /// The body of the SMS message.
  @_s.JsonKey(name: 'smsMessage')
  final String smsMessage;

  SmsSettings({
    this.smsMessage,
  });
  factory SmsSettings.fromJson(Map<String, dynamic> json) =>
      _$SmsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SmsSettingsToJson(this);
}

/// The settings for using the social identity providers for access to your
/// Amplify app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SocialProviderSettings {
  @_s.JsonKey(name: 'Facebook')
  final BackendAuthSocialProviderConfig facebook;
  @_s.JsonKey(name: 'Google')
  final BackendAuthSocialProviderConfig google;
  @_s.JsonKey(name: 'LoginWithAmazon')
  final BackendAuthSocialProviderConfig loginWithAmazon;

  SocialProviderSettings({
    this.facebook,
    this.google,
    this.loginWithAmazon,
  });
  factory SocialProviderSettings.fromJson(Map<String, dynamic> json) =>
      _$SocialProviderSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SocialProviderSettingsToJson(this);
}

enum Status {
  @_s.JsonValue('LATEST')
  latest,
  @_s.JsonValue('STALE')
  stale,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBackendAPIResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  UpdateBackendAPIResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory UpdateBackendAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBackendAPIResponseFromJson(json);
}

/// Describes the forgot password policy for authenticating into the Amplify
/// app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateBackendAuthForgotPasswordConfig {
  /// Describes which method to use (either SMS or email) to deliver messages to
  /// app users that want to recover their password.
  @_s.JsonKey(name: 'deliveryMethod')
  final DeliveryMethod deliveryMethod;

  /// The configuration for the email sent when an app user forgets their
  /// password.
  @_s.JsonKey(name: 'emailSettings')
  final EmailSettings emailSettings;

  /// The configuration for the SMS message sent when an Amplify app user forgets
  /// their password.
  @_s.JsonKey(name: 'smsSettings')
  final SmsSettings smsSettings;

  UpdateBackendAuthForgotPasswordConfig({
    this.deliveryMethod,
    this.emailSettings,
    this.smsSettings,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateBackendAuthForgotPasswordConfigToJson(this);
}

/// Describes the authorization configuration for the Amazon Cognito identity
/// pool, provisioned as a part of your auth resource in the Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateBackendAuthIdentityPoolConfig {
  /// A Boolean value that you can set to allow or disallow guest-level
  /// authorization into your Amplify app.
  @_s.JsonKey(name: 'unauthenticatedLogin')
  final bool unauthenticatedLogin;

  UpdateBackendAuthIdentityPoolConfig({
    this.unauthenticatedLogin,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateBackendAuthIdentityPoolConfigToJson(this);
}

/// Updates the multi-factor authentication (MFA) configuration for the backend
/// of your Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateBackendAuthMFAConfig {
  /// The MFA mode for the backend of your Amplify project.
  @_s.JsonKey(name: 'MFAMode')
  final MFAMode mFAMode;

  /// The settings of your MFA configuration for the backend of your Amplify
  /// project.
  @_s.JsonKey(name: 'settings')
  final Settings settings;

  UpdateBackendAuthMFAConfig({
    this.mFAMode,
    this.settings,
  });
  Map<String, dynamic> toJson() => _$UpdateBackendAuthMFAConfigToJson(this);
}

/// The OAuth configurations for authenticating users into your Amplify app.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateBackendAuthOAuthConfig {
  /// The Amazon Cognito domain prefix used to create a hosted UI for
  /// authentication.
  @_s.JsonKey(name: 'domainPrefix')
  final String domainPrefix;

  /// The OAuth grant type to allow app users to authenticate from your Amplify
  /// app.
  @_s.JsonKey(name: 'oAuthGrantType')
  final OAuthGrantType oAuthGrantType;

  /// The list of OAuth-related flows that can allow users to authenticate from
  /// your Amplify app.
  @_s.JsonKey(name: 'oAuthScopes')
  final List<OAuthScopesElement> oAuthScopes;

  /// Redirect URLs that OAuth uses when a user signs in to an Amplify app.
  @_s.JsonKey(name: 'redirectSignInURIs')
  final List<String> redirectSignInURIs;

  /// Redirect URLs that OAuth uses when a user signs out of an Amplify app.
  @_s.JsonKey(name: 'redirectSignOutURIs')
  final List<String> redirectSignOutURIs;

  /// Describes third-party social federation configurations for allowing your
  /// users to sign in with OAuth.
  @_s.JsonKey(name: 'socialProviderSettings')
  final SocialProviderSettings socialProviderSettings;

  UpdateBackendAuthOAuthConfig({
    this.domainPrefix,
    this.oAuthGrantType,
    this.oAuthScopes,
    this.redirectSignInURIs,
    this.redirectSignOutURIs,
    this.socialProviderSettings,
  });
  Map<String, dynamic> toJson() => _$UpdateBackendAuthOAuthConfigToJson(this);
}

/// Describes the password policy for your Amazon Cognito user pool that's
/// configured as a part of your Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateBackendAuthPasswordPolicyConfig {
  /// Describes additional constrains on the password requirements to sign in to
  /// the auth resource, configured as a part of your Amplify project.
  @_s.JsonKey(name: 'additionalConstraints')
  final List<AdditionalConstraintsElement> additionalConstraints;

  /// Describes the minimum length of the password required to sign in to the auth
  /// resource, configured as a part of your Amplify project.
  @_s.JsonKey(name: 'minimumLength')
  final double minimumLength;

  UpdateBackendAuthPasswordPolicyConfig({
    this.additionalConstraints,
    this.minimumLength,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateBackendAuthPasswordPolicyConfigToJson(this);
}

/// Defines the resource configuration when updating an authentication resource
/// in your Amplify project.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateBackendAuthResourceConfig {
  /// Defines the service name to use when configuring an authentication resource
  /// in your Amplify project.
  @_s.JsonKey(name: 'authResources')
  final AuthResources authResources;

  /// Defines the service name to use when configuring an authentication resource
  /// in your Amplify project.
  @_s.JsonKey(name: 'service')
  final Service service;

  /// Describes the authentication configuration for the Amazon Cognito user pool,
  /// provisioned as a part of the auth resource in your Amplify project.
  @_s.JsonKey(name: 'userPoolConfigs')
  final UpdateBackendAuthUserPoolConfig userPoolConfigs;

  /// Describes the authorization configuration for the Amazon Cognito identity
  /// pool, provisioned as a part of the auth resource in your Amplify project.
  @_s.JsonKey(name: 'identityPoolConfigs')
  final UpdateBackendAuthIdentityPoolConfig identityPoolConfigs;

  UpdateBackendAuthResourceConfig({
    @_s.required this.authResources,
    @_s.required this.service,
    @_s.required this.userPoolConfigs,
    this.identityPoolConfigs,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateBackendAuthResourceConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBackendAuthResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  UpdateBackendAuthResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });
  factory UpdateBackendAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBackendAuthResponseFromJson(json);
}

/// Describes the Amazon Cognito user pool configuration to configure the
/// authorization resource for your Amplify project on an update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateBackendAuthUserPoolConfig {
  /// Describes the forgot password policy for your Amazon Cognito user pool,
  /// configured as a part of your Amplify project.
  @_s.JsonKey(name: 'forgotPassword')
  final UpdateBackendAuthForgotPasswordConfig forgotPassword;

  /// Describes whether to apply multi-factor authentication (MFA) policies for
  /// your Amazon Cognito user pool that's configured as a part of your Amplify
  /// project.
  @_s.JsonKey(name: 'mfa')
  final UpdateBackendAuthMFAConfig mfa;

  /// Describes the OAuth policy and rules for your Amazon Cognito user pool,
  /// configured as a part of your Amplify project.
  @_s.JsonKey(name: 'oAuth')
  final UpdateBackendAuthOAuthConfig oAuth;

  /// Describes the password policy for your Amazon Cognito user pool, configured
  /// as a part of your Amplify project.
  @_s.JsonKey(name: 'passwordPolicy')
  final UpdateBackendAuthPasswordPolicyConfig passwordPolicy;

  UpdateBackendAuthUserPoolConfig({
    this.forgotPassword,
    this.mfa,
    this.oAuth,
    this.passwordPolicy,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateBackendAuthUserPoolConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBackendConfigResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The app ID for the backend manager.
  @_s.JsonKey(name: 'backendManagerAppId')
  final String backendManagerAppId;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// Describes the Amazon Cognito configurations for the Admin UI auth resource
  /// to log in with.
  @_s.JsonKey(name: 'loginAuthConfig')
  final LoginAuthConfigReqObj loginAuthConfig;

  UpdateBackendConfigResponse({
    this.appId,
    this.backendManagerAppId,
    this.error,
    this.loginAuthConfig,
  });
  factory UpdateBackendConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBackendConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBackendJobResponse {
  /// The app ID.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The name of the backend environment.
  @_s.JsonKey(name: 'backendEnvironmentName')
  final String backendEnvironmentName;

  /// The time when the job was created.
  @_s.JsonKey(name: 'createTime')
  final String createTime;

  /// If the request failed, this is the returned error.
  @_s.JsonKey(name: 'error')
  final String error;

  /// The ID for the job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The name of the operation.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The current status of the request.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The time when the job was last updated.
  @_s.JsonKey(name: 'updateTime')
  final String updateTime;

  UpdateBackendJobResponse({
    this.appId,
    this.backendEnvironmentName,
    this.createTime,
    this.error,
    this.jobId,
    this.operation,
    this.status,
    this.updateTime,
  });
  factory UpdateBackendJobResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBackendJobResponseFromJson(json);
}

enum AdditionalConstraintsElement {
  @_s.JsonValue('REQUIRE_DIGIT')
  requireDigit,
  @_s.JsonValue('REQUIRE_LOWERCASE')
  requireLowercase,
  @_s.JsonValue('REQUIRE_SYMBOL')
  requireSymbol,
  @_s.JsonValue('REQUIRE_UPPERCASE')
  requireUppercase,
}

enum MfaTypesElement {
  @_s.JsonValue('SMS')
  sms,
  @_s.JsonValue('TOTP')
  totp,
}

enum OAuthScopesElement {
  @_s.JsonValue('PHONE')
  phone,
  @_s.JsonValue('EMAIL')
  email,
  @_s.JsonValue('OPENID')
  openid,
  @_s.JsonValue('PROFILE')
  profile,
  @_s.JsonValue('AWS_COGNITO_SIGNIN_USER_ADMIN')
  awsCognitoSigninUserAdmin,
}

enum RequiredSignUpAttributesElement {
  @_s.JsonValue('ADDRESS')
  address,
  @_s.JsonValue('BIRTHDATE')
  birthdate,
  @_s.JsonValue('EMAIL')
  email,
  @_s.JsonValue('FAMILY_NAME')
  familyName,
  @_s.JsonValue('GENDER')
  gender,
  @_s.JsonValue('GIVEN_NAME')
  givenName,
  @_s.JsonValue('LOCALE')
  locale,
  @_s.JsonValue('MIDDLE_NAME')
  middleName,
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('NICKNAME')
  nickname,
  @_s.JsonValue('PHONE_NUMBER')
  phoneNumber,
  @_s.JsonValue('PICTURE')
  picture,
  @_s.JsonValue('PREFERRED_USERNAME')
  preferredUsername,
  @_s.JsonValue('PROFILE')
  profile,
  @_s.JsonValue('UPDATED_AT')
  updatedAt,
  @_s.JsonValue('WEBSITE')
  website,
  @_s.JsonValue('ZONE_INFO')
  zoneInfo,
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class GatewayTimeoutException extends _s.GenericAwsException {
  GatewayTimeoutException({String type, String message})
      : super(type: type, code: 'GatewayTimeoutException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'GatewayTimeoutException': (type, message) =>
      GatewayTimeoutException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
