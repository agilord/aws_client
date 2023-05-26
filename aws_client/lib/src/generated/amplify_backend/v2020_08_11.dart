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

/// AWS Amplify Admin API
class AmplifyBackend {
  final _s.RestJsonProtocol _protocol;
  AmplifyBackend({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'amplifybackend',
            signingName: 'amplifybackend',
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
    required String appId,
    required String backendEnvironmentName,
    required String targetEnvironmentName,
  }) async {
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
  /// The resource configuration for creating a backend.
  ///
  /// Parameter [resourceName] :
  /// The name of the resource.
  Future<CreateBackendResponse> createBackend({
    required String appId,
    required String appName,
    required String backendEnvironmentName,
    ResourceConfig? resourceConfig,
    String? resourceName,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
    required BackendAPIResourceConfig resourceConfig,
    required String resourceName,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
    required CreateBackendAuthResourceConfig resourceConfig,
    required String resourceName,
  }) async {
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
    required String appId,
    String? backendManagerAppId,
  }) async {
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

  /// Creates a backend storage resource.
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
  /// The resource configuration for creating backend storage.
  ///
  /// Parameter [resourceName] :
  /// The name of the storage resource.
  Future<CreateBackendStorageResponse> createBackendStorage({
    required String appId,
    required String backendEnvironmentName,
    required CreateBackendStorageResourceConfig resourceConfig,
    required String resourceName,
  }) async {
    final $payload = <String, dynamic>{
      'backendEnvironmentName': backendEnvironmentName,
      'resourceConfig': resourceConfig,
      'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backend/${Uri.encodeComponent(appId)}/storage',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackendStorageResponse.fromJson(response);
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
    required String appId,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
    required String resourceName,
    BackendAPIResourceConfig? resourceConfig,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
    required String resourceName,
  }) async {
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

  /// Removes the specified backend storage resource.
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
  /// The name of the storage resource.
  ///
  /// Parameter [serviceName] :
  /// The name of the storage service.
  Future<DeleteBackendStorageResponse> deleteBackendStorage({
    required String appId,
    required String backendEnvironmentName,
    required String resourceName,
    required ServiceName serviceName,
  }) async {
    final $payload = <String, dynamic>{
      'resourceName': resourceName,
      'serviceName': serviceName.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/storage/${Uri.encodeComponent(backendEnvironmentName)}/remove',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBackendStorageResponse.fromJson(response);
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
    required String appId,
    required String sessionId,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
    required String resourceName,
  }) async {
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
    required String appId,
    String? backendEnvironmentName,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
    required String resourceName,
    BackendAPIResourceConfig? resourceConfig,
  }) async {
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

  /// Gets a model introspection schema for an existing backend API resource.
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
    required String appId,
    required String backendEnvironmentName,
    required String resourceName,
  }) async {
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

  /// Gets a backend auth details.
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
    required String appId,
    required String backendEnvironmentName,
    required String resourceName,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
    required String jobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/job/${Uri.encodeComponent(backendEnvironmentName)}/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackendJobResponse.fromJson(response);
  }

  /// Gets details for a backend storage resource.
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
  /// The name of the storage resource.
  Future<GetBackendStorageResponse> getBackendStorage({
    required String appId,
    required String backendEnvironmentName,
    required String resourceName,
  }) async {
    final $payload = <String, dynamic>{
      'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/storage/${Uri.encodeComponent(backendEnvironmentName)}/details',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackendStorageResponse.fromJson(response);
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
    required String appId,
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/challenge/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTokenResponse.fromJson(response);
  }

  /// Imports an existing backend authentication resource.
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
  /// Parameter [nativeClientId] :
  /// The ID of the Amazon Cognito native client.
  ///
  /// Parameter [userPoolId] :
  /// The ID of the Amazon Cognito user pool.
  ///
  /// Parameter [webClientId] :
  /// The ID of the Amazon Cognito web client.
  ///
  /// Parameter [identityPoolId] :
  /// The ID of the Amazon Cognito identity pool.
  Future<ImportBackendAuthResponse> importBackendAuth({
    required String appId,
    required String backendEnvironmentName,
    required String nativeClientId,
    required String userPoolId,
    required String webClientId,
    String? identityPoolId,
  }) async {
    final $payload = <String, dynamic>{
      'nativeClientId': nativeClientId,
      'userPoolId': userPoolId,
      'webClientId': webClientId,
      if (identityPoolId != null) 'identityPoolId': identityPoolId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/auth/${Uri.encodeComponent(backendEnvironmentName)}/import',
      exceptionFnMap: _exceptionFns,
    );
    return ImportBackendAuthResponse.fromJson(response);
  }

  /// Imports an existing backend storage resource.
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
  /// Parameter [serviceName] :
  /// The name of the storage service.
  ///
  /// Parameter [bucketName] :
  /// The name of the S3 bucket.
  Future<ImportBackendStorageResponse> importBackendStorage({
    required String appId,
    required String backendEnvironmentName,
    required ServiceName serviceName,
    String? bucketName,
  }) async {
    final $payload = <String, dynamic>{
      'serviceName': serviceName.toValue(),
      if (bucketName != null) 'bucketName': bucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/storage/${Uri.encodeComponent(backendEnvironmentName)}/import',
      exceptionFnMap: _exceptionFns,
    );
    return ImportBackendStorageResponse.fromJson(response);
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
    required String appId,
    required String backendEnvironmentName,
    String? jobId,
    int? maxResults,
    String? nextToken,
    String? operation,
    String? status,
  }) async {
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

  /// The list of S3 buckets in your account.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [nextToken] :
  /// Reserved for future use.
  Future<ListS3BucketsResponse> listS3Buckets({
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/s3Buckets',
      exceptionFnMap: _exceptionFns,
    );
    return ListS3BucketsResponse.fromJson(response);
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
    required String appId,
    bool? cleanAmplifyApp,
  }) async {
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

  /// Removes the AWS resources required to access the Amplify Admin UI.
  ///
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [appId] :
  /// The app ID.
  Future<RemoveBackendConfigResponse> removeBackendConfig({
    required String appId,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
    required String resourceName,
    BackendAPIResourceConfig? resourceConfig,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
    required UpdateBackendAuthResourceConfig resourceConfig,
    required String resourceName,
  }) async {
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

  /// Updates the AWS resources required to access the Amplify Admin UI.
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
    required String appId,
    LoginAuthConfigReqObj? loginAuthConfig,
  }) async {
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
    required String appId,
    required String backendEnvironmentName,
    required String jobId,
    String? operation,
    String? status,
  }) async {
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

  /// Updates an existing backend storage resource.
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
  /// The resource configuration for updating backend storage.
  ///
  /// Parameter [resourceName] :
  /// The name of the storage resource.
  Future<UpdateBackendStorageResponse> updateBackendStorage({
    required String appId,
    required String backendEnvironmentName,
    required UpdateBackendStorageResourceConfig resourceConfig,
    required String resourceName,
  }) async {
    final $payload = <String, dynamic>{
      'resourceConfig': resourceConfig,
      'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backend/${Uri.encodeComponent(appId)}/storage/${Uri.encodeComponent(backendEnvironmentName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBackendStorageResponse.fromJson(response);
  }
}

enum AuthResources {
  userPoolOnly,
  identityPoolAndUserPool,
}

extension AuthResourcesValueExtension on AuthResources {
  String toValue() {
    switch (this) {
      case AuthResources.userPoolOnly:
        return 'USER_POOL_ONLY';
      case AuthResources.identityPoolAndUserPool:
        return 'IDENTITY_POOL_AND_USER_POOL';
    }
  }
}

extension AuthResourcesFromString on String {
  AuthResources toAuthResources() {
    switch (this) {
      case 'USER_POOL_ONLY':
        return AuthResources.userPoolOnly;
      case 'IDENTITY_POOL_AND_USER_POOL':
        return AuthResources.identityPoolAndUserPool;
    }
    throw Exception('$this is not known in enum AuthResources');
  }
}

/// The authentication settings for accessing provisioned data models in your
/// Amplify project.
class BackendAPIAppSyncAuthSettings {
  /// The Amazon Cognito user pool ID, if Amazon Cognito was used as an
  /// authentication setting to access your data models.
  final String? cognitoUserPoolId;

  /// The API key description for API_KEY, if it was used as an authentication
  /// mechanism to access your data models.
  final String? description;

  /// The API key expiration time for API_KEY, if it was used as an authentication
  /// mechanism to access your data models.
  final double? expirationTime;

  /// The expiry time for the OpenID authentication mechanism.
  final String? openIDAuthTTL;

  /// The clientID for openID, if openID was used as an authentication setting to
  /// access your data models.
  final String? openIDClientId;

  /// The expiry time for the OpenID authentication mechanism.
  final String? openIDIatTTL;

  /// The openID issuer URL, if openID was used as an authentication setting to
  /// access your data models.
  final String? openIDIssueURL;

  /// The OpenID provider name, if OpenID was used as an authentication mechanism
  /// to access your data models.
  final String? openIDProviderName;

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

  factory BackendAPIAppSyncAuthSettings.fromJson(Map<String, dynamic> json) {
    return BackendAPIAppSyncAuthSettings(
      cognitoUserPoolId: json['cognitoUserPoolId'] as String?,
      description: json['description'] as String?,
      expirationTime: json['expirationTime'] as double?,
      openIDAuthTTL: json['openIDAuthTTL'] as String?,
      openIDClientId: json['openIDClientId'] as String?,
      openIDIatTTL: json['openIDIatTTL'] as String?,
      openIDIssueURL: json['openIDIssueURL'] as String?,
      openIDProviderName: json['openIDProviderName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cognitoUserPoolId = this.cognitoUserPoolId;
    final description = this.description;
    final expirationTime = this.expirationTime;
    final openIDAuthTTL = this.openIDAuthTTL;
    final openIDClientId = this.openIDClientId;
    final openIDIatTTL = this.openIDIatTTL;
    final openIDIssueURL = this.openIDIssueURL;
    final openIDProviderName = this.openIDProviderName;
    return {
      if (cognitoUserPoolId != null) 'cognitoUserPoolId': cognitoUserPoolId,
      if (description != null) 'description': description,
      if (expirationTime != null) 'expirationTime': expirationTime,
      if (openIDAuthTTL != null) 'openIDAuthTTL': openIDAuthTTL,
      if (openIDClientId != null) 'openIDClientId': openIDClientId,
      if (openIDIatTTL != null) 'openIDIatTTL': openIDIatTTL,
      if (openIDIssueURL != null) 'openIDIssueURL': openIDIssueURL,
      if (openIDProviderName != null) 'openIDProviderName': openIDProviderName,
    };
  }
}

/// Describes the auth types for your configured data models.
class BackendAPIAuthType {
  /// Describes the authentication mode.
  final Mode? mode;

  /// Describes settings for the authentication mode.
  final BackendAPIAppSyncAuthSettings? settings;

  BackendAPIAuthType({
    this.mode,
    this.settings,
  });

  factory BackendAPIAuthType.fromJson(Map<String, dynamic> json) {
    return BackendAPIAuthType(
      mode: (json['mode'] as String?)?.toMode(),
      settings: json['settings'] != null
          ? BackendAPIAppSyncAuthSettings.fromJson(
              json['settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final settings = this.settings;
    return {
      if (mode != null) 'mode': mode.toValue(),
      if (settings != null) 'settings': settings,
    };
  }
}

/// Describes the conflict resolution configuration for your data model
/// configured in your Amplify project.
class BackendAPIConflictResolution {
  /// The strategy for conflict resolution.
  final ResolutionStrategy? resolutionStrategy;

  BackendAPIConflictResolution({
    this.resolutionStrategy,
  });

  factory BackendAPIConflictResolution.fromJson(Map<String, dynamic> json) {
    return BackendAPIConflictResolution(
      resolutionStrategy:
          (json['resolutionStrategy'] as String?)?.toResolutionStrategy(),
    );
  }

  Map<String, dynamic> toJson() {
    final resolutionStrategy = this.resolutionStrategy;
    return {
      if (resolutionStrategy != null)
        'resolutionStrategy': resolutionStrategy.toValue(),
    };
  }
}

/// The resource config for the data model, configured as a part of the Amplify
/// project.
class BackendAPIResourceConfig {
  /// Additional authentication methods used to interact with your data models.
  final List<BackendAPIAuthType>? additionalAuthTypes;

  /// The API name used to interact with the data model, configured as a part of
  /// your Amplify project.
  final String? apiName;

  /// The conflict resolution strategy for your data stored in the data models.
  final BackendAPIConflictResolution? conflictResolution;

  /// The default authentication type for interacting with the configured data
  /// models in your Amplify project.
  final BackendAPIAuthType? defaultAuthType;

  /// The service used to provision and interact with the data model.
  final String? service;

  /// The definition of the data model in the annotated transform of the GraphQL
  /// schema.
  final String? transformSchema;

  BackendAPIResourceConfig({
    this.additionalAuthTypes,
    this.apiName,
    this.conflictResolution,
    this.defaultAuthType,
    this.service,
    this.transformSchema,
  });

  factory BackendAPIResourceConfig.fromJson(Map<String, dynamic> json) {
    return BackendAPIResourceConfig(
      additionalAuthTypes: (json['additionalAuthTypes'] as List?)
          ?.whereNotNull()
          .map((e) => BackendAPIAuthType.fromJson(e as Map<String, dynamic>))
          .toList(),
      apiName: json['apiName'] as String?,
      conflictResolution: json['conflictResolution'] != null
          ? BackendAPIConflictResolution.fromJson(
              json['conflictResolution'] as Map<String, dynamic>)
          : null,
      defaultAuthType: json['defaultAuthType'] != null
          ? BackendAPIAuthType.fromJson(
              json['defaultAuthType'] as Map<String, dynamic>)
          : null,
      service: json['service'] as String?,
      transformSchema: json['transformSchema'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalAuthTypes = this.additionalAuthTypes;
    final apiName = this.apiName;
    final conflictResolution = this.conflictResolution;
    final defaultAuthType = this.defaultAuthType;
    final service = this.service;
    final transformSchema = this.transformSchema;
    return {
      if (additionalAuthTypes != null)
        'additionalAuthTypes': additionalAuthTypes,
      if (apiName != null) 'apiName': apiName,
      if (conflictResolution != null) 'conflictResolution': conflictResolution,
      if (defaultAuthType != null) 'defaultAuthType': defaultAuthType,
      if (service != null) 'service': service,
      if (transformSchema != null) 'transformSchema': transformSchema,
    };
  }
}

/// Describes Apple social federation configurations for allowing your app users
/// to sign in using OAuth.
class BackendAuthAppleProviderConfig {
  /// Describes the client_id (also called Services ID) that comes from Apple.
  final String? clientId;

  /// Describes the key_id that comes from Apple.
  final String? keyId;

  /// Describes the private_key that comes from Apple.
  final String? privateKey;

  /// Describes the team_id that comes from Apple.
  final String? teamId;

  BackendAuthAppleProviderConfig({
    this.clientId,
    this.keyId,
    this.privateKey,
    this.teamId,
  });

  factory BackendAuthAppleProviderConfig.fromJson(Map<String, dynamic> json) {
    return BackendAuthAppleProviderConfig(
      clientId: json['client_id'] as String?,
      keyId: json['key_id'] as String?,
      privateKey: json['private_key'] as String?,
      teamId: json['team_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final keyId = this.keyId;
    final privateKey = this.privateKey;
    final teamId = this.teamId;
    return {
      if (clientId != null) 'client_id': clientId,
      if (keyId != null) 'key_id': keyId,
      if (privateKey != null) 'private_key': privateKey,
      if (teamId != null) 'team_id': teamId,
    };
  }
}

/// Describes third-party social federation configurations for allowing your app
/// users to sign in using OAuth.
class BackendAuthSocialProviderConfig {
  /// Describes the client_id, which can be obtained from the third-party social
  /// federation provider.
  final String? clientId;

  /// Describes the client_secret, which can be obtained from third-party social
  /// federation providers.
  final String? clientSecret;

  BackendAuthSocialProviderConfig({
    this.clientId,
    this.clientSecret,
  });

  factory BackendAuthSocialProviderConfig.fromJson(Map<String, dynamic> json) {
    return BackendAuthSocialProviderConfig(
      clientId: json['client_id'] as String?,
      clientSecret: json['client_secret'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    return {
      if (clientId != null) 'client_id': clientId,
      if (clientSecret != null) 'client_secret': clientSecret,
    };
  }
}

/// The response object for this operation.
class BackendJobRespObj {
  /// The app ID.
  final String appId;

  /// The name of the backend environment.
  final String backendEnvironmentName;

  /// The time when the job was created.
  final String? createTime;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  /// The time when the job was last updated.
  final String? updateTime;

  BackendJobRespObj({
    required this.appId,
    required this.backendEnvironmentName,
    this.createTime,
    this.error,
    this.jobId,
    this.operation,
    this.status,
    this.updateTime,
  });

  factory BackendJobRespObj.fromJson(Map<String, dynamic> json) {
    return BackendJobRespObj(
      appId: json['appId'] as String,
      backendEnvironmentName: json['backendEnvironmentName'] as String,
      createTime: json['createTime'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
      updateTime: json['updateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final createTime = this.createTime;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      'appId': appId,
      'backendEnvironmentName': backendEnvironmentName,
      if (createTime != null) 'createTime': createTime,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
      if (updateTime != null) 'updateTime': updateTime,
    };
  }
}

/// Describes the read, write, and delete permissions users have against your
/// storage S3 bucket.
class BackendStoragePermissions {
  /// Lists all authenticated user read, write, and delete permissions for your S3
  /// bucket.
  final List<AuthenticatedElement> authenticated;

  /// Lists all unauthenticated user read, write, and delete permissions for your
  /// S3 bucket.
  final List<UnAuthenticatedElement>? unAuthenticated;

  BackendStoragePermissions({
    required this.authenticated,
    this.unAuthenticated,
  });

  factory BackendStoragePermissions.fromJson(Map<String, dynamic> json) {
    return BackendStoragePermissions(
      authenticated: (json['authenticated'] as List)
          .whereNotNull()
          .map((e) => (e as String).toAuthenticatedElement())
          .toList(),
      unAuthenticated: (json['unAuthenticated'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toUnAuthenticatedElement())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final authenticated = this.authenticated;
    final unAuthenticated = this.unAuthenticated;
    return {
      'authenticated': authenticated.map((e) => e.toValue()).toList(),
      if (unAuthenticated != null)
        'unAuthenticated': unAuthenticated.map((e) => e.toValue()).toList(),
    };
  }
}

class CloneBackendResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  CloneBackendResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory CloneBackendResponse.fromJson(Map<String, dynamic> json) {
    return CloneBackendResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

class CreateBackendAPIResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  CreateBackendAPIResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory CreateBackendAPIResponse.fromJson(Map<String, dynamic> json) {
    return CreateBackendAPIResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

/// <b>(DEPRECATED)</b> Describes the forgot password policy for authenticating
/// into the Amplify app.
class CreateBackendAuthForgotPasswordConfig {
  /// <b>(DEPRECATED)</b> Describes which mode to use (either SMS or email) to
  /// deliver messages to app users who want to recover their password.
  final DeliveryMethod deliveryMethod;

  /// <b>(DEPRECATED)</b> The configuration for the email sent when an app user
  /// forgets their password.
  final EmailSettings? emailSettings;

  /// <b>(DEPRECATED)</b> The configuration for the SMS message sent when an app
  /// user forgets their password.
  final SmsSettings? smsSettings;

  CreateBackendAuthForgotPasswordConfig({
    required this.deliveryMethod,
    this.emailSettings,
    this.smsSettings,
  });

  factory CreateBackendAuthForgotPasswordConfig.fromJson(
      Map<String, dynamic> json) {
    return CreateBackendAuthForgotPasswordConfig(
      deliveryMethod: (json['deliveryMethod'] as String).toDeliveryMethod(),
      emailSettings: json['emailSettings'] != null
          ? EmailSettings.fromJson(
              json['emailSettings'] as Map<String, dynamic>)
          : null,
      smsSettings: json['smsSettings'] != null
          ? SmsSettings.fromJson(json['smsSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryMethod = this.deliveryMethod;
    final emailSettings = this.emailSettings;
    final smsSettings = this.smsSettings;
    return {
      'deliveryMethod': deliveryMethod.toValue(),
      if (emailSettings != null) 'emailSettings': emailSettings,
      if (smsSettings != null) 'smsSettings': smsSettings,
    };
  }
}

/// Describes authorization configurations for the auth resources, configured as
/// a part of your Amplify project.
class CreateBackendAuthIdentityPoolConfig {
  /// Name of the Amazon Cognito identity pool used for authorization.
  final String identityPoolName;

  /// Set to true or false based on whether you want to enable guest authorization
  /// to your Amplify app.
  final bool unauthenticatedLogin;

  CreateBackendAuthIdentityPoolConfig({
    required this.identityPoolName,
    required this.unauthenticatedLogin,
  });

  factory CreateBackendAuthIdentityPoolConfig.fromJson(
      Map<String, dynamic> json) {
    return CreateBackendAuthIdentityPoolConfig(
      identityPoolName: json['identityPoolName'] as String,
      unauthenticatedLogin: json['unauthenticatedLogin'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final identityPoolName = this.identityPoolName;
    final unauthenticatedLogin = this.unauthenticatedLogin;
    return {
      'identityPoolName': identityPoolName,
      'unauthenticatedLogin': unauthenticatedLogin,
    };
  }
}

/// Describes whether to apply multi-factor authentication policies for your
/// Amazon Cognito user pool configured as a part of your Amplify project.
class CreateBackendAuthMFAConfig {
  /// Describes whether MFA should be [ON, OFF, or OPTIONAL] for authentication in
  /// your Amplify project.
  final MFAMode mFAMode;

  /// Describes the configuration settings and methods for your Amplify app users
  /// to use MFA.
  final Settings? settings;

  CreateBackendAuthMFAConfig({
    required this.mFAMode,
    this.settings,
  });

  factory CreateBackendAuthMFAConfig.fromJson(Map<String, dynamic> json) {
    return CreateBackendAuthMFAConfig(
      mFAMode: (json['MFAMode'] as String).toMFAMode(),
      settings: json['settings'] != null
          ? Settings.fromJson(json['settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mFAMode = this.mFAMode;
    final settings = this.settings;
    return {
      'MFAMode': mFAMode.toValue(),
      if (settings != null) 'settings': settings,
    };
  }
}

/// Creates the OAuth configuration for your Amplify project.
class CreateBackendAuthOAuthConfig {
  /// The OAuth grant type that you use to allow app users to authenticate from
  /// your Amplify app.
  final OAuthGrantType oAuthGrantType;

  /// List of OAuth-related flows used to allow your app users to authenticate
  /// from your Amplify app.
  final List<OAuthScopesElement> oAuthScopes;

  /// The redirected URI for signing in to your Amplify app.
  final List<String> redirectSignInURIs;

  /// Redirect URLs that OAuth uses when a user signs out of an Amplify app.
  final List<String> redirectSignOutURIs;

  /// The domain prefix for your Amplify app.
  final String? domainPrefix;

  /// The settings for using social providers to access your Amplify app.
  final SocialProviderSettings? socialProviderSettings;

  CreateBackendAuthOAuthConfig({
    required this.oAuthGrantType,
    required this.oAuthScopes,
    required this.redirectSignInURIs,
    required this.redirectSignOutURIs,
    this.domainPrefix,
    this.socialProviderSettings,
  });

  factory CreateBackendAuthOAuthConfig.fromJson(Map<String, dynamic> json) {
    return CreateBackendAuthOAuthConfig(
      oAuthGrantType: (json['oAuthGrantType'] as String).toOAuthGrantType(),
      oAuthScopes: (json['oAuthScopes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toOAuthScopesElement())
          .toList(),
      redirectSignInURIs: (json['redirectSignInURIs'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      redirectSignOutURIs: (json['redirectSignOutURIs'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      domainPrefix: json['domainPrefix'] as String?,
      socialProviderSettings: json['socialProviderSettings'] != null
          ? SocialProviderSettings.fromJson(
              json['socialProviderSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final oAuthGrantType = this.oAuthGrantType;
    final oAuthScopes = this.oAuthScopes;
    final redirectSignInURIs = this.redirectSignInURIs;
    final redirectSignOutURIs = this.redirectSignOutURIs;
    final domainPrefix = this.domainPrefix;
    final socialProviderSettings = this.socialProviderSettings;
    return {
      'oAuthGrantType': oAuthGrantType.toValue(),
      'oAuthScopes': oAuthScopes.map((e) => e.toValue()).toList(),
      'redirectSignInURIs': redirectSignInURIs,
      'redirectSignOutURIs': redirectSignOutURIs,
      if (domainPrefix != null) 'domainPrefix': domainPrefix,
      if (socialProviderSettings != null)
        'socialProviderSettings': socialProviderSettings,
    };
  }
}

/// The password policy configuration for the backend to your Amplify project.
class CreateBackendAuthPasswordPolicyConfig {
  /// The minimum length of the password used to access the backend of your
  /// Amplify project.
  final double minimumLength;

  /// Additional constraints for the password used to access the backend of your
  /// Amplify project.
  final List<AdditionalConstraintsElement>? additionalConstraints;

  CreateBackendAuthPasswordPolicyConfig({
    required this.minimumLength,
    this.additionalConstraints,
  });

  factory CreateBackendAuthPasswordPolicyConfig.fromJson(
      Map<String, dynamic> json) {
    return CreateBackendAuthPasswordPolicyConfig(
      minimumLength: json['minimumLength'] as double,
      additionalConstraints: (json['additionalConstraints'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAdditionalConstraintsElement())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final minimumLength = this.minimumLength;
    final additionalConstraints = this.additionalConstraints;
    return {
      'minimumLength': minimumLength,
      if (additionalConstraints != null)
        'additionalConstraints':
            additionalConstraints.map((e) => e.toValue()).toList(),
    };
  }
}

/// Defines the resource configuration when creating an auth resource in your
/// Amplify project.
class CreateBackendAuthResourceConfig {
  /// Defines whether you want to configure only authentication or both
  /// authentication and authorization settings.
  final AuthResources authResources;

  /// Defines the service name to use when configuring an authentication resource
  /// in your Amplify project.
  final Service service;

  /// Describes authentication configuration for the Amazon Cognito user pool,
  /// provisioned as a part of your auth resource in the Amplify project.
  final CreateBackendAuthUserPoolConfig userPoolConfigs;

  /// Describes the authorization configuration for the Amazon Cognito identity
  /// pool, provisioned as a part of your auth resource in the Amplify project.
  final CreateBackendAuthIdentityPoolConfig? identityPoolConfigs;

  CreateBackendAuthResourceConfig({
    required this.authResources,
    required this.service,
    required this.userPoolConfigs,
    this.identityPoolConfigs,
  });

  factory CreateBackendAuthResourceConfig.fromJson(Map<String, dynamic> json) {
    return CreateBackendAuthResourceConfig(
      authResources: (json['authResources'] as String).toAuthResources(),
      service: (json['service'] as String).toService(),
      userPoolConfigs: CreateBackendAuthUserPoolConfig.fromJson(
          json['userPoolConfigs'] as Map<String, dynamic>),
      identityPoolConfigs: json['identityPoolConfigs'] != null
          ? CreateBackendAuthIdentityPoolConfig.fromJson(
              json['identityPoolConfigs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authResources = this.authResources;
    final service = this.service;
    final userPoolConfigs = this.userPoolConfigs;
    final identityPoolConfigs = this.identityPoolConfigs;
    return {
      'authResources': authResources.toValue(),
      'service': service.toValue(),
      'userPoolConfigs': userPoolConfigs,
      if (identityPoolConfigs != null)
        'identityPoolConfigs': identityPoolConfigs,
    };
  }
}

class CreateBackendAuthResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  CreateBackendAuthResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory CreateBackendAuthResponse.fromJson(Map<String, dynamic> json) {
    return CreateBackendAuthResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

/// Describes the Amazon Cognito user pool configuration for the auth resource
/// to be configured for your Amplify project.
class CreateBackendAuthUserPoolConfig {
  /// The required attributes to sign up new users in the user pool.
  final List<RequiredSignUpAttributesElement> requiredSignUpAttributes;

  /// Describes the sign-in methods that your Amplify app users use to log in
  /// using the Amazon Cognito user pool, configured as a part of your Amplify
  /// project.
  final SignInMethod signInMethod;

  /// The Amazon Cognito user pool name.
  final String userPoolName;

  /// <b>(DEPRECATED)</b> Describes the forgotten password policy for your Amazon
  /// Cognito user pool, configured as a part of your Amplify project.
  final CreateBackendAuthForgotPasswordConfig? forgotPassword;

  /// Describes whether to apply multi-factor authentication policies for your
  /// Amazon Cognito user pool configured as a part of your Amplify project.
  final CreateBackendAuthMFAConfig? mfa;

  /// Describes the OAuth policy and rules for your Amazon Cognito user pool,
  /// configured as a part of your Amplify project.
  final CreateBackendAuthOAuthConfig? oAuth;

  /// Describes the password policy for your Amazon Cognito user pool, configured
  /// as a part of your Amplify project.
  final CreateBackendAuthPasswordPolicyConfig? passwordPolicy;

  /// Describes the email or SMS verification message for your Amazon Cognito user
  /// pool, configured as a part of your Amplify project.
  final CreateBackendAuthVerificationMessageConfig? verificationMessage;

  CreateBackendAuthUserPoolConfig({
    required this.requiredSignUpAttributes,
    required this.signInMethod,
    required this.userPoolName,
    this.forgotPassword,
    this.mfa,
    this.oAuth,
    this.passwordPolicy,
    this.verificationMessage,
  });

  factory CreateBackendAuthUserPoolConfig.fromJson(Map<String, dynamic> json) {
    return CreateBackendAuthUserPoolConfig(
      requiredSignUpAttributes: (json['requiredSignUpAttributes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toRequiredSignUpAttributesElement())
          .toList(),
      signInMethod: (json['signInMethod'] as String).toSignInMethod(),
      userPoolName: json['userPoolName'] as String,
      forgotPassword: json['forgotPassword'] != null
          ? CreateBackendAuthForgotPasswordConfig.fromJson(
              json['forgotPassword'] as Map<String, dynamic>)
          : null,
      mfa: json['mfa'] != null
          ? CreateBackendAuthMFAConfig.fromJson(
              json['mfa'] as Map<String, dynamic>)
          : null,
      oAuth: json['oAuth'] != null
          ? CreateBackendAuthOAuthConfig.fromJson(
              json['oAuth'] as Map<String, dynamic>)
          : null,
      passwordPolicy: json['passwordPolicy'] != null
          ? CreateBackendAuthPasswordPolicyConfig.fromJson(
              json['passwordPolicy'] as Map<String, dynamic>)
          : null,
      verificationMessage: json['verificationMessage'] != null
          ? CreateBackendAuthVerificationMessageConfig.fromJson(
              json['verificationMessage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final requiredSignUpAttributes = this.requiredSignUpAttributes;
    final signInMethod = this.signInMethod;
    final userPoolName = this.userPoolName;
    final forgotPassword = this.forgotPassword;
    final mfa = this.mfa;
    final oAuth = this.oAuth;
    final passwordPolicy = this.passwordPolicy;
    final verificationMessage = this.verificationMessage;
    return {
      'requiredSignUpAttributes':
          requiredSignUpAttributes.map((e) => e.toValue()).toList(),
      'signInMethod': signInMethod.toValue(),
      'userPoolName': userPoolName,
      if (forgotPassword != null) 'forgotPassword': forgotPassword,
      if (mfa != null) 'mfa': mfa,
      if (oAuth != null) 'oAuth': oAuth,
      if (passwordPolicy != null) 'passwordPolicy': passwordPolicy,
      if (verificationMessage != null)
        'verificationMessage': verificationMessage,
    };
  }
}

/// Creates an email or SMS verification message for the auth resource
/// configured for your Amplify project.
class CreateBackendAuthVerificationMessageConfig {
  /// The type of verification message to send.
  final DeliveryMethod deliveryMethod;

  /// The settings for the email message.
  final EmailSettings? emailSettings;

  /// The settings for the SMS message.
  final SmsSettings? smsSettings;

  CreateBackendAuthVerificationMessageConfig({
    required this.deliveryMethod,
    this.emailSettings,
    this.smsSettings,
  });

  factory CreateBackendAuthVerificationMessageConfig.fromJson(
      Map<String, dynamic> json) {
    return CreateBackendAuthVerificationMessageConfig(
      deliveryMethod: (json['deliveryMethod'] as String).toDeliveryMethod(),
      emailSettings: json['emailSettings'] != null
          ? EmailSettings.fromJson(
              json['emailSettings'] as Map<String, dynamic>)
          : null,
      smsSettings: json['smsSettings'] != null
          ? SmsSettings.fromJson(json['smsSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryMethod = this.deliveryMethod;
    final emailSettings = this.emailSettings;
    final smsSettings = this.smsSettings;
    return {
      'deliveryMethod': deliveryMethod.toValue(),
      if (emailSettings != null) 'emailSettings': emailSettings,
      if (smsSettings != null) 'smsSettings': smsSettings,
    };
  }
}

class CreateBackendConfigResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// The ID for the job.
  final String? jobId;

  /// The current status of the request.
  final String? status;

  CreateBackendConfigResponse({
    this.appId,
    this.backendEnvironmentName,
    this.jobId,
    this.status,
  });

  factory CreateBackendConfigResponse.fromJson(Map<String, dynamic> json) {
    return CreateBackendConfigResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      jobId: json['jobId'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final jobId = this.jobId;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (jobId != null) 'jobId': jobId,
      if (status != null) 'status': status,
    };
  }
}

class CreateBackendResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  CreateBackendResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory CreateBackendResponse.fromJson(Map<String, dynamic> json) {
    return CreateBackendResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

/// The resource configuration for creating backend storage.
class CreateBackendStorageResourceConfig {
  /// The authorization configuration for the storage S3 bucket.
  final BackendStoragePermissions permissions;

  /// The name of the storage service.
  final ServiceName serviceName;

  /// The name of the S3 bucket.
  final String? bucketName;

  CreateBackendStorageResourceConfig({
    required this.permissions,
    required this.serviceName,
    this.bucketName,
  });

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    final serviceName = this.serviceName;
    final bucketName = this.bucketName;
    return {
      'permissions': permissions,
      'serviceName': serviceName.toValue(),
      if (bucketName != null) 'bucketName': bucketName,
    };
  }
}

class CreateBackendStorageResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// The ID for the job.
  final String? jobId;

  /// The current status of the request.
  final String? status;

  CreateBackendStorageResponse({
    this.appId,
    this.backendEnvironmentName,
    this.jobId,
    this.status,
  });

  factory CreateBackendStorageResponse.fromJson(Map<String, dynamic> json) {
    return CreateBackendStorageResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      jobId: json['jobId'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final jobId = this.jobId;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (jobId != null) 'jobId': jobId,
      if (status != null) 'status': status,
    };
  }
}

class CreateTokenResponse {
  /// The app ID.
  final String? appId;

  /// One-time challenge code for authenticating into the Amplify Admin UI.
  final String? challengeCode;

  /// A unique ID provided when creating a new challenge token.
  final String? sessionId;

  /// The expiry time for the one-time generated token code.
  final String? ttl;

  CreateTokenResponse({
    this.appId,
    this.challengeCode,
    this.sessionId,
    this.ttl,
  });

  factory CreateTokenResponse.fromJson(Map<String, dynamic> json) {
    return CreateTokenResponse(
      appId: json['appId'] as String?,
      challengeCode: json['challengeCode'] as String?,
      sessionId: json['sessionId'] as String?,
      ttl: json['ttl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final challengeCode = this.challengeCode;
    final sessionId = this.sessionId;
    final ttl = this.ttl;
    return {
      if (appId != null) 'appId': appId,
      if (challengeCode != null) 'challengeCode': challengeCode,
      if (sessionId != null) 'sessionId': sessionId,
      if (ttl != null) 'ttl': ttl,
    };
  }
}

class DeleteBackendAPIResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  DeleteBackendAPIResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory DeleteBackendAPIResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBackendAPIResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

class DeleteBackendAuthResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  DeleteBackendAuthResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory DeleteBackendAuthResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBackendAuthResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

class DeleteBackendResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  DeleteBackendResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory DeleteBackendResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBackendResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

class DeleteBackendStorageResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// The ID for the job.
  final String? jobId;

  /// The current status of the request.
  final String? status;

  DeleteBackendStorageResponse({
    this.appId,
    this.backendEnvironmentName,
    this.jobId,
    this.status,
  });

  factory DeleteBackendStorageResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBackendStorageResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      jobId: json['jobId'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final jobId = this.jobId;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (jobId != null) 'jobId': jobId,
      if (status != null) 'status': status,
    };
  }
}

class DeleteTokenResponse {
  /// Indicates whether the request succeeded or failed.
  final bool? isSuccess;

  DeleteTokenResponse({
    this.isSuccess,
  });

  factory DeleteTokenResponse.fromJson(Map<String, dynamic> json) {
    return DeleteTokenResponse(
      isSuccess: json['isSuccess'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final isSuccess = this.isSuccess;
    return {
      if (isSuccess != null) 'isSuccess': isSuccess,
    };
  }
}

/// The type of verification message to send.
enum DeliveryMethod {
  email,
  sms,
}

extension DeliveryMethodValueExtension on DeliveryMethod {
  String toValue() {
    switch (this) {
      case DeliveryMethod.email:
        return 'EMAIL';
      case DeliveryMethod.sms:
        return 'SMS';
    }
  }
}

extension DeliveryMethodFromString on String {
  DeliveryMethod toDeliveryMethod() {
    switch (this) {
      case 'EMAIL':
        return DeliveryMethod.email;
      case 'SMS':
        return DeliveryMethod.sms;
    }
    throw Exception('$this is not known in enum DeliveryMethod');
  }
}

/// The configuration for the email sent when an app user forgets their
/// password.
class EmailSettings {
  /// The contents of the email message.
  final String? emailMessage;

  /// The contents of the subject line of the email message.
  final String? emailSubject;

  EmailSettings({
    this.emailMessage,
    this.emailSubject,
  });

  factory EmailSettings.fromJson(Map<String, dynamic> json) {
    return EmailSettings(
      emailMessage: json['emailMessage'] as String?,
      emailSubject: json['emailSubject'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final emailMessage = this.emailMessage;
    final emailSubject = this.emailSubject;
    return {
      if (emailMessage != null) 'emailMessage': emailMessage,
      if (emailSubject != null) 'emailSubject': emailSubject,
    };
  }
}

class GenerateBackendAPIModelsResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  GenerateBackendAPIModelsResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory GenerateBackendAPIModelsResponse.fromJson(Map<String, dynamic> json) {
    return GenerateBackendAPIModelsResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

class GetBackendAPIModelsResponse {
  /// Stringified JSON of the model introspection schema for an existing backend
  /// API resource.
  final String? modelIntrospectionSchema;

  /// Stringified JSON of the datastore model.
  final String? models;

  /// The current status of the request.
  final Status? status;

  GetBackendAPIModelsResponse({
    this.modelIntrospectionSchema,
    this.models,
    this.status,
  });

  factory GetBackendAPIModelsResponse.fromJson(Map<String, dynamic> json) {
    return GetBackendAPIModelsResponse(
      modelIntrospectionSchema: json['modelIntrospectionSchema'] as String?,
      models: json['models'] as String?,
      status: (json['status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelIntrospectionSchema = this.modelIntrospectionSchema;
    final models = this.models;
    final status = this.status;
    return {
      if (modelIntrospectionSchema != null)
        'modelIntrospectionSchema': modelIntrospectionSchema,
      if (models != null) 'models': models,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetBackendAPIResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The resource configuration for this response object.
  final BackendAPIResourceConfig? resourceConfig;

  /// The name of this resource.
  final String? resourceName;

  GetBackendAPIResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.resourceConfig,
    this.resourceName,
  });

  factory GetBackendAPIResponse.fromJson(Map<String, dynamic> json) {
    return GetBackendAPIResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      resourceConfig: json['resourceConfig'] != null
          ? BackendAPIResourceConfig.fromJson(
              json['resourceConfig'] as Map<String, dynamic>)
          : null,
      resourceName: json['resourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final resourceConfig = this.resourceConfig;
    final resourceName = this.resourceName;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (resourceConfig != null) 'resourceConfig': resourceConfig,
      if (resourceName != null) 'resourceName': resourceName,
    };
  }
}

class GetBackendAuthResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The resource configuration for authorization requests to the backend of your
  /// Amplify project.
  final CreateBackendAuthResourceConfig? resourceConfig;

  /// The name of this resource.
  final String? resourceName;

  GetBackendAuthResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.resourceConfig,
    this.resourceName,
  });

  factory GetBackendAuthResponse.fromJson(Map<String, dynamic> json) {
    return GetBackendAuthResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      resourceConfig: json['resourceConfig'] != null
          ? CreateBackendAuthResourceConfig.fromJson(
              json['resourceConfig'] as Map<String, dynamic>)
          : null,
      resourceName: json['resourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final resourceConfig = this.resourceConfig;
    final resourceName = this.resourceName;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (resourceConfig != null) 'resourceConfig': resourceConfig,
      if (resourceName != null) 'resourceName': resourceName,
    };
  }
}

class GetBackendJobResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// The time when the job was created.
  final String? createTime;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  /// The time when the job was last updated.
  final String? updateTime;

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

  factory GetBackendJobResponse.fromJson(Map<String, dynamic> json) {
    return GetBackendJobResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      createTime: json['createTime'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
      updateTime: json['updateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final createTime = this.createTime;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (createTime != null) 'createTime': createTime,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
      if (updateTime != null) 'updateTime': updateTime,
    };
  }
}

class GetBackendResponse {
  /// A stringified version of the cli.json file for your Amplify project.
  final String? amplifyFeatureFlags;

  /// A stringified version of the current configs for your Amplify project.
  final String? amplifyMetaConfig;

  /// The app ID.
  final String? appId;

  /// The name of the app.
  final String? appName;

  /// A list of backend environments in an array.
  final List<String>? backendEnvironmentList;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request failed, this is the returned error.
  final String? error;

  GetBackendResponse({
    this.amplifyFeatureFlags,
    this.amplifyMetaConfig,
    this.appId,
    this.appName,
    this.backendEnvironmentList,
    this.backendEnvironmentName,
    this.error,
  });

  factory GetBackendResponse.fromJson(Map<String, dynamic> json) {
    return GetBackendResponse(
      amplifyFeatureFlags: json['amplifyFeatureFlags'] as String?,
      amplifyMetaConfig: json['amplifyMetaConfig'] as String?,
      appId: json['appId'] as String?,
      appName: json['appName'] as String?,
      backendEnvironmentList: (json['backendEnvironmentList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amplifyFeatureFlags = this.amplifyFeatureFlags;
    final amplifyMetaConfig = this.amplifyMetaConfig;
    final appId = this.appId;
    final appName = this.appName;
    final backendEnvironmentList = this.backendEnvironmentList;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    return {
      if (amplifyFeatureFlags != null)
        'amplifyFeatureFlags': amplifyFeatureFlags,
      if (amplifyMetaConfig != null) 'amplifyMetaConfig': amplifyMetaConfig,
      if (appId != null) 'appId': appId,
      if (appName != null) 'appName': appName,
      if (backendEnvironmentList != null)
        'backendEnvironmentList': backendEnvironmentList,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
    };
  }
}

/// The details for a backend storage resource.
class GetBackendStorageResourceConfig {
  /// Returns True if the storage resource has been imported.
  final bool imported;

  /// The name of the storage service.
  final ServiceName serviceName;

  /// The name of the S3 bucket.
  final String? bucketName;

  /// The authorization configuration for the storage S3 bucket.
  final BackendStoragePermissions? permissions;

  GetBackendStorageResourceConfig({
    required this.imported,
    required this.serviceName,
    this.bucketName,
    this.permissions,
  });

  factory GetBackendStorageResourceConfig.fromJson(Map<String, dynamic> json) {
    return GetBackendStorageResourceConfig(
      imported: json['imported'] as bool,
      serviceName: (json['serviceName'] as String).toServiceName(),
      bucketName: json['bucketName'] as String?,
      permissions: json['permissions'] != null
          ? BackendStoragePermissions.fromJson(
              json['permissions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imported = this.imported;
    final serviceName = this.serviceName;
    final bucketName = this.bucketName;
    final permissions = this.permissions;
    return {
      'imported': imported,
      'serviceName': serviceName.toValue(),
      if (bucketName != null) 'bucketName': bucketName,
      if (permissions != null) 'permissions': permissions,
    };
  }
}

class GetBackendStorageResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// The resource configuration for the backend storage resource.
  final GetBackendStorageResourceConfig? resourceConfig;

  /// The name of the storage resource.
  final String? resourceName;

  GetBackendStorageResponse({
    this.appId,
    this.backendEnvironmentName,
    this.resourceConfig,
    this.resourceName,
  });

  factory GetBackendStorageResponse.fromJson(Map<String, dynamic> json) {
    return GetBackendStorageResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      resourceConfig: json['resourceConfig'] != null
          ? GetBackendStorageResourceConfig.fromJson(
              json['resourceConfig'] as Map<String, dynamic>)
          : null,
      resourceName: json['resourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final resourceConfig = this.resourceConfig;
    final resourceName = this.resourceName;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (resourceConfig != null) 'resourceConfig': resourceConfig,
      if (resourceName != null) 'resourceName': resourceName,
    };
  }
}

class GetTokenResponse {
  /// The app ID.
  final String? appId;

  /// The one-time challenge code for authenticating into the Amplify Admin UI.
  final String? challengeCode;

  /// A unique ID provided when creating a new challenge token.
  final String? sessionId;

  /// The expiry time for the one-time generated token code.
  final String? ttl;

  GetTokenResponse({
    this.appId,
    this.challengeCode,
    this.sessionId,
    this.ttl,
  });

  factory GetTokenResponse.fromJson(Map<String, dynamic> json) {
    return GetTokenResponse(
      appId: json['appId'] as String?,
      challengeCode: json['challengeCode'] as String?,
      sessionId: json['sessionId'] as String?,
      ttl: json['ttl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final challengeCode = this.challengeCode;
    final sessionId = this.sessionId;
    final ttl = this.ttl;
    return {
      if (appId != null) 'appId': appId,
      if (challengeCode != null) 'challengeCode': challengeCode,
      if (sessionId != null) 'sessionId': sessionId,
      if (ttl != null) 'ttl': ttl,
    };
  }
}

class ImportBackendAuthResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  ImportBackendAuthResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory ImportBackendAuthResponse.fromJson(Map<String, dynamic> json) {
    return ImportBackendAuthResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

class ImportBackendStorageResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// The ID for the job.
  final String? jobId;

  /// The current status of the request.
  final String? status;

  ImportBackendStorageResponse({
    this.appId,
    this.backendEnvironmentName,
    this.jobId,
    this.status,
  });

  factory ImportBackendStorageResponse.fromJson(Map<String, dynamic> json) {
    return ImportBackendStorageResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      jobId: json['jobId'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final jobId = this.jobId;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (jobId != null) 'jobId': jobId,
      if (status != null) 'status': status,
    };
  }
}

class ListBackendJobsResponse {
  /// An array of jobs and their properties.
  final List<BackendJobRespObj>? jobs;

  /// The token for the next set of results.
  final String? nextToken;

  ListBackendJobsResponse({
    this.jobs,
    this.nextToken,
  });

  factory ListBackendJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListBackendJobsResponse(
      jobs: (json['jobs'] as List?)
          ?.whereNotNull()
          .map((e) => BackendJobRespObj.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      if (jobs != null) 'jobs': jobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListS3BucketsResponse {
  /// The list of S3 buckets.
  final List<S3BucketInfo>? buckets;

  /// Reserved for future use.
  final String? nextToken;

  ListS3BucketsResponse({
    this.buckets,
    this.nextToken,
  });

  factory ListS3BucketsResponse.fromJson(Map<String, dynamic> json) {
    return ListS3BucketsResponse(
      buckets: (json['buckets'] as List?)
          ?.whereNotNull()
          .map((e) => S3BucketInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final buckets = this.buckets;
    final nextToken = this.nextToken;
    return {
      if (buckets != null) 'buckets': buckets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The request object for this operation.
class LoginAuthConfigReqObj {
  /// The Amazon Cognito identity pool ID used for the Amplify Admin UI login
  /// authorization.
  final String? awsCognitoIdentityPoolId;

  /// The AWS Region for the Amplify Admin UI login.
  final String? awsCognitoRegion;

  /// The Amazon Cognito user pool ID used for Amplify Admin UI login
  /// authentication.
  final String? awsUserPoolsId;

  /// The web client ID for the Amazon Cognito user pools.
  final String? awsUserPoolsWebClientId;

  LoginAuthConfigReqObj({
    this.awsCognitoIdentityPoolId,
    this.awsCognitoRegion,
    this.awsUserPoolsId,
    this.awsUserPoolsWebClientId,
  });

  factory LoginAuthConfigReqObj.fromJson(Map<String, dynamic> json) {
    return LoginAuthConfigReqObj(
      awsCognitoIdentityPoolId: json['aws_cognito_identity_pool_id'] as String?,
      awsCognitoRegion: json['aws_cognito_region'] as String?,
      awsUserPoolsId: json['aws_user_pools_id'] as String?,
      awsUserPoolsWebClientId: json['aws_user_pools_web_client_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsCognitoIdentityPoolId = this.awsCognitoIdentityPoolId;
    final awsCognitoRegion = this.awsCognitoRegion;
    final awsUserPoolsId = this.awsUserPoolsId;
    final awsUserPoolsWebClientId = this.awsUserPoolsWebClientId;
    return {
      if (awsCognitoIdentityPoolId != null)
        'aws_cognito_identity_pool_id': awsCognitoIdentityPoolId,
      if (awsCognitoRegion != null) 'aws_cognito_region': awsCognitoRegion,
      if (awsUserPoolsId != null) 'aws_user_pools_id': awsUserPoolsId,
      if (awsUserPoolsWebClientId != null)
        'aws_user_pools_web_client_id': awsUserPoolsWebClientId,
    };
  }
}

enum MFAMode {
  on,
  off,
  optional,
}

extension MFAModeValueExtension on MFAMode {
  String toValue() {
    switch (this) {
      case MFAMode.on:
        return 'ON';
      case MFAMode.off:
        return 'OFF';
      case MFAMode.optional:
        return 'OPTIONAL';
    }
  }
}

extension MFAModeFromString on String {
  MFAMode toMFAMode() {
    switch (this) {
      case 'ON':
        return MFAMode.on;
      case 'OFF':
        return MFAMode.off;
      case 'OPTIONAL':
        return MFAMode.optional;
    }
    throw Exception('$this is not known in enum MFAMode');
  }
}

enum Mode {
  apiKey,
  awsIam,
  amazonCognitoUserPools,
  openidConnect,
}

extension ModeValueExtension on Mode {
  String toValue() {
    switch (this) {
      case Mode.apiKey:
        return 'API_KEY';
      case Mode.awsIam:
        return 'AWS_IAM';
      case Mode.amazonCognitoUserPools:
        return 'AMAZON_COGNITO_USER_POOLS';
      case Mode.openidConnect:
        return 'OPENID_CONNECT';
    }
  }
}

extension ModeFromString on String {
  Mode toMode() {
    switch (this) {
      case 'API_KEY':
        return Mode.apiKey;
      case 'AWS_IAM':
        return Mode.awsIam;
      case 'AMAZON_COGNITO_USER_POOLS':
        return Mode.amazonCognitoUserPools;
      case 'OPENID_CONNECT':
        return Mode.openidConnect;
    }
    throw Exception('$this is not known in enum Mode');
  }
}

enum OAuthGrantType {
  code,
  implicit,
}

extension OAuthGrantTypeValueExtension on OAuthGrantType {
  String toValue() {
    switch (this) {
      case OAuthGrantType.code:
        return 'CODE';
      case OAuthGrantType.implicit:
        return 'IMPLICIT';
    }
  }
}

extension OAuthGrantTypeFromString on String {
  OAuthGrantType toOAuthGrantType() {
    switch (this) {
      case 'CODE':
        return OAuthGrantType.code;
      case 'IMPLICIT':
        return OAuthGrantType.implicit;
    }
    throw Exception('$this is not known in enum OAuthGrantType');
  }
}

class RemoveAllBackendsResponse {
  /// The app ID.
  final String? appId;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  RemoveAllBackendsResponse({
    this.appId,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory RemoveAllBackendsResponse.fromJson(Map<String, dynamic> json) {
    return RemoveAllBackendsResponse(
      appId: json['appId'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

class RemoveBackendConfigResponse {
  /// If the request fails, this error is returned.
  final String? error;

  RemoveBackendConfigResponse({
    this.error,
  });

  factory RemoveBackendConfigResponse.fromJson(Map<String, dynamic> json) {
    return RemoveBackendConfigResponse(
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    return {
      if (error != null) 'error': error,
    };
  }
}

enum ResolutionStrategy {
  optimisticConcurrency,
  lambda,
  automerge,
  none,
}

extension ResolutionStrategyValueExtension on ResolutionStrategy {
  String toValue() {
    switch (this) {
      case ResolutionStrategy.optimisticConcurrency:
        return 'OPTIMISTIC_CONCURRENCY';
      case ResolutionStrategy.lambda:
        return 'LAMBDA';
      case ResolutionStrategy.automerge:
        return 'AUTOMERGE';
      case ResolutionStrategy.none:
        return 'NONE';
    }
  }
}

extension ResolutionStrategyFromString on String {
  ResolutionStrategy toResolutionStrategy() {
    switch (this) {
      case 'OPTIMISTIC_CONCURRENCY':
        return ResolutionStrategy.optimisticConcurrency;
      case 'LAMBDA':
        return ResolutionStrategy.lambda;
      case 'AUTOMERGE':
        return ResolutionStrategy.automerge;
      case 'NONE':
        return ResolutionStrategy.none;
    }
    throw Exception('$this is not known in enum ResolutionStrategy');
  }
}

/// Defines the resource configuration for the data model in your Amplify
/// project.
class ResourceConfig {
  ResourceConfig();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the metadata of the S3 bucket.
class S3BucketInfo {
  /// The creation date of the S3 bucket.
  final String? creationDate;

  /// The name of the S3 bucket.
  final String? name;

  S3BucketInfo({
    this.creationDate,
    this.name,
  });

  factory S3BucketInfo.fromJson(Map<String, dynamic> json) {
    return S3BucketInfo(
      creationDate: json['creationDate'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final name = this.name;
    return {
      if (creationDate != null) 'creationDate': creationDate,
      if (name != null) 'name': name,
    };
  }
}

enum Service {
  cognito,
}

extension ServiceValueExtension on Service {
  String toValue() {
    switch (this) {
      case Service.cognito:
        return 'COGNITO';
    }
  }
}

extension ServiceFromString on String {
  Service toService() {
    switch (this) {
      case 'COGNITO':
        return Service.cognito;
    }
    throw Exception('$this is not known in enum Service');
  }
}

enum ServiceName {
  s3,
}

extension ServiceNameValueExtension on ServiceName {
  String toValue() {
    switch (this) {
      case ServiceName.s3:
        return 'S3';
    }
  }
}

extension ServiceNameFromString on String {
  ServiceName toServiceName() {
    switch (this) {
      case 'S3':
        return ServiceName.s3;
    }
    throw Exception('$this is not known in enum ServiceName');
  }
}

/// The settings of your MFA configuration for the backend of your Amplify
/// project.
class Settings {
  /// The supported MFA types.
  final List<MfaTypesElement>? mfaTypes;

  /// The body of the SMS message.
  final String? smsMessage;

  Settings({
    this.mfaTypes,
    this.smsMessage,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      mfaTypes: (json['mfaTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toMfaTypesElement())
          .toList(),
      smsMessage: json['smsMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mfaTypes = this.mfaTypes;
    final smsMessage = this.smsMessage;
    return {
      if (mfaTypes != null)
        'mfaTypes': mfaTypes.map((e) => e.toValue()).toList(),
      if (smsMessage != null) 'smsMessage': smsMessage,
    };
  }
}

enum SignInMethod {
  email,
  emailAndPhoneNumber,
  phoneNumber,
  username,
}

extension SignInMethodValueExtension on SignInMethod {
  String toValue() {
    switch (this) {
      case SignInMethod.email:
        return 'EMAIL';
      case SignInMethod.emailAndPhoneNumber:
        return 'EMAIL_AND_PHONE_NUMBER';
      case SignInMethod.phoneNumber:
        return 'PHONE_NUMBER';
      case SignInMethod.username:
        return 'USERNAME';
    }
  }
}

extension SignInMethodFromString on String {
  SignInMethod toSignInMethod() {
    switch (this) {
      case 'EMAIL':
        return SignInMethod.email;
      case 'EMAIL_AND_PHONE_NUMBER':
        return SignInMethod.emailAndPhoneNumber;
      case 'PHONE_NUMBER':
        return SignInMethod.phoneNumber;
      case 'USERNAME':
        return SignInMethod.username;
    }
    throw Exception('$this is not known in enum SignInMethod');
  }
}

/// SMS settings for authentication.
class SmsSettings {
  /// The contents of the SMS message.
  final String? smsMessage;

  SmsSettings({
    this.smsMessage,
  });

  factory SmsSettings.fromJson(Map<String, dynamic> json) {
    return SmsSettings(
      smsMessage: json['smsMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final smsMessage = this.smsMessage;
    return {
      if (smsMessage != null) 'smsMessage': smsMessage,
    };
  }
}

/// The settings for using the social identity providers for access to your
/// Amplify app.
class SocialProviderSettings {
  final BackendAuthSocialProviderConfig? facebook;
  final BackendAuthSocialProviderConfig? google;
  final BackendAuthSocialProviderConfig? loginWithAmazon;
  final BackendAuthAppleProviderConfig? signInWithApple;

  SocialProviderSettings({
    this.facebook,
    this.google,
    this.loginWithAmazon,
    this.signInWithApple,
  });

  factory SocialProviderSettings.fromJson(Map<String, dynamic> json) {
    return SocialProviderSettings(
      facebook: json['Facebook'] != null
          ? BackendAuthSocialProviderConfig.fromJson(
              json['Facebook'] as Map<String, dynamic>)
          : null,
      google: json['Google'] != null
          ? BackendAuthSocialProviderConfig.fromJson(
              json['Google'] as Map<String, dynamic>)
          : null,
      loginWithAmazon: json['LoginWithAmazon'] != null
          ? BackendAuthSocialProviderConfig.fromJson(
              json['LoginWithAmazon'] as Map<String, dynamic>)
          : null,
      signInWithApple: json['SignInWithApple'] != null
          ? BackendAuthAppleProviderConfig.fromJson(
              json['SignInWithApple'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final facebook = this.facebook;
    final google = this.google;
    final loginWithAmazon = this.loginWithAmazon;
    final signInWithApple = this.signInWithApple;
    return {
      if (facebook != null) 'Facebook': facebook,
      if (google != null) 'Google': google,
      if (loginWithAmazon != null) 'LoginWithAmazon': loginWithAmazon,
      if (signInWithApple != null) 'SignInWithApple': signInWithApple,
    };
  }
}

enum Status {
  latest,
  stale,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.latest:
        return 'LATEST';
      case Status.stale:
        return 'STALE';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'LATEST':
        return Status.latest;
      case 'STALE':
        return Status.stale;
    }
    throw Exception('$this is not known in enum Status');
  }
}

class UpdateBackendAPIResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  UpdateBackendAPIResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory UpdateBackendAPIResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBackendAPIResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

/// <b>(DEPRECATED)</b> Describes the forgot password policy for authenticating
/// into the Amplify app.
class UpdateBackendAuthForgotPasswordConfig {
  /// <b>(DEPRECATED)</b> Describes which mode to use (either SMS or email) to
  /// deliver messages to app users that want to recover their password.
  final DeliveryMethod? deliveryMethod;

  /// <b>(DEPRECATED)</b> The configuration for the email sent when an app user
  /// forgets their password.
  final EmailSettings? emailSettings;

  /// <b>(DEPRECATED)</b> The configuration for the SMS message sent when an
  /// Amplify app user forgets their password.
  final SmsSettings? smsSettings;

  UpdateBackendAuthForgotPasswordConfig({
    this.deliveryMethod,
    this.emailSettings,
    this.smsSettings,
  });

  Map<String, dynamic> toJson() {
    final deliveryMethod = this.deliveryMethod;
    final emailSettings = this.emailSettings;
    final smsSettings = this.smsSettings;
    return {
      if (deliveryMethod != null) 'deliveryMethod': deliveryMethod.toValue(),
      if (emailSettings != null) 'emailSettings': emailSettings,
      if (smsSettings != null) 'smsSettings': smsSettings,
    };
  }
}

/// Describes the authorization configuration for the Amazon Cognito identity
/// pool, provisioned as a part of your auth resource in the Amplify project.
class UpdateBackendAuthIdentityPoolConfig {
  /// A boolean value that can be set to allow or disallow guest-level
  /// authorization into your Amplify app.
  final bool? unauthenticatedLogin;

  UpdateBackendAuthIdentityPoolConfig({
    this.unauthenticatedLogin,
  });

  Map<String, dynamic> toJson() {
    final unauthenticatedLogin = this.unauthenticatedLogin;
    return {
      if (unauthenticatedLogin != null)
        'unauthenticatedLogin': unauthenticatedLogin,
    };
  }
}

/// Updates the multi-factor authentication (MFA) configuration for the backend
/// of your Amplify project.
class UpdateBackendAuthMFAConfig {
  /// The MFA mode for the backend of your Amplify project.
  final MFAMode? mFAMode;

  /// The settings of your MFA configuration for the backend of your Amplify
  /// project.
  final Settings? settings;

  UpdateBackendAuthMFAConfig({
    this.mFAMode,
    this.settings,
  });

  Map<String, dynamic> toJson() {
    final mFAMode = this.mFAMode;
    final settings = this.settings;
    return {
      if (mFAMode != null) 'MFAMode': mFAMode.toValue(),
      if (settings != null) 'settings': settings,
    };
  }
}

/// The OAuth configurations for authenticating users into your Amplify app.
class UpdateBackendAuthOAuthConfig {
  /// The Amazon Cognito domain prefix used to create a hosted UI for
  /// authentication.
  final String? domainPrefix;

  /// The OAuth grant type to allow app users to authenticate from your Amplify
  /// app.
  final OAuthGrantType? oAuthGrantType;

  /// The list of OAuth-related flows that can allow users to authenticate from
  /// your Amplify app.
  final List<OAuthScopesElement>? oAuthScopes;

  /// Redirect URLs that OAuth uses when a user signs in to an Amplify app.
  final List<String>? redirectSignInURIs;

  /// Redirect URLs that OAuth uses when a user signs out of an Amplify app.
  final List<String>? redirectSignOutURIs;

  /// Describes third-party social federation configurations for allowing your
  /// users to sign in with OAuth.
  final SocialProviderSettings? socialProviderSettings;

  UpdateBackendAuthOAuthConfig({
    this.domainPrefix,
    this.oAuthGrantType,
    this.oAuthScopes,
    this.redirectSignInURIs,
    this.redirectSignOutURIs,
    this.socialProviderSettings,
  });

  Map<String, dynamic> toJson() {
    final domainPrefix = this.domainPrefix;
    final oAuthGrantType = this.oAuthGrantType;
    final oAuthScopes = this.oAuthScopes;
    final redirectSignInURIs = this.redirectSignInURIs;
    final redirectSignOutURIs = this.redirectSignOutURIs;
    final socialProviderSettings = this.socialProviderSettings;
    return {
      if (domainPrefix != null) 'domainPrefix': domainPrefix,
      if (oAuthGrantType != null) 'oAuthGrantType': oAuthGrantType.toValue(),
      if (oAuthScopes != null)
        'oAuthScopes': oAuthScopes.map((e) => e.toValue()).toList(),
      if (redirectSignInURIs != null) 'redirectSignInURIs': redirectSignInURIs,
      if (redirectSignOutURIs != null)
        'redirectSignOutURIs': redirectSignOutURIs,
      if (socialProviderSettings != null)
        'socialProviderSettings': socialProviderSettings,
    };
  }
}

/// Describes the password policy for your Amazon Cognito user pool configured
/// as a part of your Amplify project.
class UpdateBackendAuthPasswordPolicyConfig {
  /// Describes additional constraints on password requirements to sign in to the
  /// auth resource, configured as a part of your Amplify project.
  final List<AdditionalConstraintsElement>? additionalConstraints;

  /// Describes the minimum length of the password required to sign in to the auth
  /// resource, configured as a part of your Amplify project.
  final double? minimumLength;

  UpdateBackendAuthPasswordPolicyConfig({
    this.additionalConstraints,
    this.minimumLength,
  });

  Map<String, dynamic> toJson() {
    final additionalConstraints = this.additionalConstraints;
    final minimumLength = this.minimumLength;
    return {
      if (additionalConstraints != null)
        'additionalConstraints':
            additionalConstraints.map((e) => e.toValue()).toList(),
      if (minimumLength != null) 'minimumLength': minimumLength,
    };
  }
}

/// Defines the resource configuration when updating an authentication resource
/// in your Amplify project.
class UpdateBackendAuthResourceConfig {
  /// Defines the service name to use when configuring an authentication resource
  /// in your Amplify project.
  final AuthResources authResources;

  /// Defines the service name to use when configuring an authentication resource
  /// in your Amplify project.
  final Service service;

  /// Describes the authentication configuration for the Amazon Cognito user pool,
  /// provisioned as a part of your auth resource in the Amplify project.
  final UpdateBackendAuthUserPoolConfig userPoolConfigs;

  /// Describes the authorization configuration for the Amazon Cognito identity
  /// pool, provisioned as a part of your auth resource in the Amplify project.
  final UpdateBackendAuthIdentityPoolConfig? identityPoolConfigs;

  UpdateBackendAuthResourceConfig({
    required this.authResources,
    required this.service,
    required this.userPoolConfigs,
    this.identityPoolConfigs,
  });

  Map<String, dynamic> toJson() {
    final authResources = this.authResources;
    final service = this.service;
    final userPoolConfigs = this.userPoolConfigs;
    final identityPoolConfigs = this.identityPoolConfigs;
    return {
      'authResources': authResources.toValue(),
      'service': service.toValue(),
      'userPoolConfigs': userPoolConfigs,
      if (identityPoolConfigs != null)
        'identityPoolConfigs': identityPoolConfigs,
    };
  }
}

class UpdateBackendAuthResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  UpdateBackendAuthResponse({
    this.appId,
    this.backendEnvironmentName,
    this.error,
    this.jobId,
    this.operation,
    this.status,
  });

  factory UpdateBackendAuthResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBackendAuthResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

/// Describes the Amazon Cognito user pool configuration for the authorization
/// resource to be configured for your Amplify project on an update.
class UpdateBackendAuthUserPoolConfig {
  /// <b>(DEPRECATED)</b> Describes the forgot password policy for your Amazon
  /// Cognito user pool, configured as a part of your Amplify project.
  final UpdateBackendAuthForgotPasswordConfig? forgotPassword;

  /// Describes whether to apply multi-factor authentication policies for your
  /// Amazon Cognito user pool configured as a part of your Amplify project.
  final UpdateBackendAuthMFAConfig? mfa;

  /// Describes the OAuth policy and rules for your Amazon Cognito user pool,
  /// configured as a part of your Amplify project.
  final UpdateBackendAuthOAuthConfig? oAuth;

  /// Describes the password policy for your Amazon Cognito user pool, configured
  /// as a part of your Amplify project.
  final UpdateBackendAuthPasswordPolicyConfig? passwordPolicy;

  /// Describes the email or SMS verification message for your Amazon Cognito user
  /// pool, configured as a part of your Amplify project.
  final UpdateBackendAuthVerificationMessageConfig? verificationMessage;

  UpdateBackendAuthUserPoolConfig({
    this.forgotPassword,
    this.mfa,
    this.oAuth,
    this.passwordPolicy,
    this.verificationMessage,
  });

  Map<String, dynamic> toJson() {
    final forgotPassword = this.forgotPassword;
    final mfa = this.mfa;
    final oAuth = this.oAuth;
    final passwordPolicy = this.passwordPolicy;
    final verificationMessage = this.verificationMessage;
    return {
      if (forgotPassword != null) 'forgotPassword': forgotPassword,
      if (mfa != null) 'mfa': mfa,
      if (oAuth != null) 'oAuth': oAuth,
      if (passwordPolicy != null) 'passwordPolicy': passwordPolicy,
      if (verificationMessage != null)
        'verificationMessage': verificationMessage,
    };
  }
}

/// Updates the configuration of the email or SMS message for the auth resource
/// configured for your Amplify project.
class UpdateBackendAuthVerificationMessageConfig {
  /// The type of verification message to send.
  final DeliveryMethod deliveryMethod;

  /// The settings for the email message.
  final EmailSettings? emailSettings;

  /// The settings for the SMS message.
  final SmsSettings? smsSettings;

  UpdateBackendAuthVerificationMessageConfig({
    required this.deliveryMethod,
    this.emailSettings,
    this.smsSettings,
  });

  Map<String, dynamic> toJson() {
    final deliveryMethod = this.deliveryMethod;
    final emailSettings = this.emailSettings;
    final smsSettings = this.smsSettings;
    return {
      'deliveryMethod': deliveryMethod.toValue(),
      if (emailSettings != null) 'emailSettings': emailSettings,
      if (smsSettings != null) 'smsSettings': smsSettings,
    };
  }
}

class UpdateBackendConfigResponse {
  /// The app ID.
  final String? appId;

  /// The app ID for the backend manager.
  final String? backendManagerAppId;

  /// If the request fails, this error is returned.
  final String? error;

  /// Describes the Amazon Cognito configurations for the Admin UI auth resource
  /// to log in with.
  final LoginAuthConfigReqObj? loginAuthConfig;

  UpdateBackendConfigResponse({
    this.appId,
    this.backendManagerAppId,
    this.error,
    this.loginAuthConfig,
  });

  factory UpdateBackendConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBackendConfigResponse(
      appId: json['appId'] as String?,
      backendManagerAppId: json['backendManagerAppId'] as String?,
      error: json['error'] as String?,
      loginAuthConfig: json['loginAuthConfig'] != null
          ? LoginAuthConfigReqObj.fromJson(
              json['loginAuthConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendManagerAppId = this.backendManagerAppId;
    final error = this.error;
    final loginAuthConfig = this.loginAuthConfig;
    return {
      if (appId != null) 'appId': appId,
      if (backendManagerAppId != null)
        'backendManagerAppId': backendManagerAppId,
      if (error != null) 'error': error,
      if (loginAuthConfig != null) 'loginAuthConfig': loginAuthConfig,
    };
  }
}

class UpdateBackendJobResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// The time when the job was created.
  final String? createTime;

  /// If the request fails, this error is returned.
  final String? error;

  /// The ID for the job.
  final String? jobId;

  /// The name of the operation.
  final String? operation;

  /// The current status of the request.
  final String? status;

  /// The time when the job was last updated.
  final String? updateTime;

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

  factory UpdateBackendJobResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBackendJobResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      createTime: json['createTime'] as String?,
      error: json['error'] as String?,
      jobId: json['jobId'] as String?,
      operation: json['operation'] as String?,
      status: json['status'] as String?,
      updateTime: json['updateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final createTime = this.createTime;
    final error = this.error;
    final jobId = this.jobId;
    final operation = this.operation;
    final status = this.status;
    final updateTime = this.updateTime;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (createTime != null) 'createTime': createTime,
      if (error != null) 'error': error,
      if (jobId != null) 'jobId': jobId,
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
      if (updateTime != null) 'updateTime': updateTime,
    };
  }
}

/// The resource configuration for updating backend storage.
class UpdateBackendStorageResourceConfig {
  /// The authorization configuration for the storage S3 bucket.
  final BackendStoragePermissions permissions;

  /// The name of the storage service.
  final ServiceName serviceName;

  UpdateBackendStorageResourceConfig({
    required this.permissions,
    required this.serviceName,
  });

  Map<String, dynamic> toJson() {
    final permissions = this.permissions;
    final serviceName = this.serviceName;
    return {
      'permissions': permissions,
      'serviceName': serviceName.toValue(),
    };
  }
}

class UpdateBackendStorageResponse {
  /// The app ID.
  final String? appId;

  /// The name of the backend environment.
  final String? backendEnvironmentName;

  /// The ID for the job.
  final String? jobId;

  /// The current status of the request.
  final String? status;

  UpdateBackendStorageResponse({
    this.appId,
    this.backendEnvironmentName,
    this.jobId,
    this.status,
  });

  factory UpdateBackendStorageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBackendStorageResponse(
      appId: json['appId'] as String?,
      backendEnvironmentName: json['backendEnvironmentName'] as String?,
      jobId: json['jobId'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final backendEnvironmentName = this.backendEnvironmentName;
    final jobId = this.jobId;
    final status = this.status;
    return {
      if (appId != null) 'appId': appId,
      if (backendEnvironmentName != null)
        'backendEnvironmentName': backendEnvironmentName,
      if (jobId != null) 'jobId': jobId,
      if (status != null) 'status': status,
    };
  }
}

enum AdditionalConstraintsElement {
  requireDigit,
  requireLowercase,
  requireSymbol,
  requireUppercase,
}

extension AdditionalConstraintsElementValueExtension
    on AdditionalConstraintsElement {
  String toValue() {
    switch (this) {
      case AdditionalConstraintsElement.requireDigit:
        return 'REQUIRE_DIGIT';
      case AdditionalConstraintsElement.requireLowercase:
        return 'REQUIRE_LOWERCASE';
      case AdditionalConstraintsElement.requireSymbol:
        return 'REQUIRE_SYMBOL';
      case AdditionalConstraintsElement.requireUppercase:
        return 'REQUIRE_UPPERCASE';
    }
  }
}

extension AdditionalConstraintsElementFromString on String {
  AdditionalConstraintsElement toAdditionalConstraintsElement() {
    switch (this) {
      case 'REQUIRE_DIGIT':
        return AdditionalConstraintsElement.requireDigit;
      case 'REQUIRE_LOWERCASE':
        return AdditionalConstraintsElement.requireLowercase;
      case 'REQUIRE_SYMBOL':
        return AdditionalConstraintsElement.requireSymbol;
      case 'REQUIRE_UPPERCASE':
        return AdditionalConstraintsElement.requireUppercase;
    }
    throw Exception('$this is not known in enum AdditionalConstraintsElement');
  }
}

enum AuthenticatedElement {
  read,
  createAndUpdate,
  delete,
}

extension AuthenticatedElementValueExtension on AuthenticatedElement {
  String toValue() {
    switch (this) {
      case AuthenticatedElement.read:
        return 'READ';
      case AuthenticatedElement.createAndUpdate:
        return 'CREATE_AND_UPDATE';
      case AuthenticatedElement.delete:
        return 'DELETE';
    }
  }
}

extension AuthenticatedElementFromString on String {
  AuthenticatedElement toAuthenticatedElement() {
    switch (this) {
      case 'READ':
        return AuthenticatedElement.read;
      case 'CREATE_AND_UPDATE':
        return AuthenticatedElement.createAndUpdate;
      case 'DELETE':
        return AuthenticatedElement.delete;
    }
    throw Exception('$this is not known in enum AuthenticatedElement');
  }
}

enum MfaTypesElement {
  sms,
  totp,
}

extension MfaTypesElementValueExtension on MfaTypesElement {
  String toValue() {
    switch (this) {
      case MfaTypesElement.sms:
        return 'SMS';
      case MfaTypesElement.totp:
        return 'TOTP';
    }
  }
}

extension MfaTypesElementFromString on String {
  MfaTypesElement toMfaTypesElement() {
    switch (this) {
      case 'SMS':
        return MfaTypesElement.sms;
      case 'TOTP':
        return MfaTypesElement.totp;
    }
    throw Exception('$this is not known in enum MfaTypesElement');
  }
}

enum OAuthScopesElement {
  phone,
  email,
  openid,
  profile,
  awsCognitoSigninUserAdmin,
}

extension OAuthScopesElementValueExtension on OAuthScopesElement {
  String toValue() {
    switch (this) {
      case OAuthScopesElement.phone:
        return 'PHONE';
      case OAuthScopesElement.email:
        return 'EMAIL';
      case OAuthScopesElement.openid:
        return 'OPENID';
      case OAuthScopesElement.profile:
        return 'PROFILE';
      case OAuthScopesElement.awsCognitoSigninUserAdmin:
        return 'AWS_COGNITO_SIGNIN_USER_ADMIN';
    }
  }
}

extension OAuthScopesElementFromString on String {
  OAuthScopesElement toOAuthScopesElement() {
    switch (this) {
      case 'PHONE':
        return OAuthScopesElement.phone;
      case 'EMAIL':
        return OAuthScopesElement.email;
      case 'OPENID':
        return OAuthScopesElement.openid;
      case 'PROFILE':
        return OAuthScopesElement.profile;
      case 'AWS_COGNITO_SIGNIN_USER_ADMIN':
        return OAuthScopesElement.awsCognitoSigninUserAdmin;
    }
    throw Exception('$this is not known in enum OAuthScopesElement');
  }
}

enum RequiredSignUpAttributesElement {
  address,
  birthdate,
  email,
  familyName,
  gender,
  givenName,
  locale,
  middleName,
  name,
  nickname,
  phoneNumber,
  picture,
  preferredUsername,
  profile,
  updatedAt,
  website,
  zoneInfo,
}

extension RequiredSignUpAttributesElementValueExtension
    on RequiredSignUpAttributesElement {
  String toValue() {
    switch (this) {
      case RequiredSignUpAttributesElement.address:
        return 'ADDRESS';
      case RequiredSignUpAttributesElement.birthdate:
        return 'BIRTHDATE';
      case RequiredSignUpAttributesElement.email:
        return 'EMAIL';
      case RequiredSignUpAttributesElement.familyName:
        return 'FAMILY_NAME';
      case RequiredSignUpAttributesElement.gender:
        return 'GENDER';
      case RequiredSignUpAttributesElement.givenName:
        return 'GIVEN_NAME';
      case RequiredSignUpAttributesElement.locale:
        return 'LOCALE';
      case RequiredSignUpAttributesElement.middleName:
        return 'MIDDLE_NAME';
      case RequiredSignUpAttributesElement.name:
        return 'NAME';
      case RequiredSignUpAttributesElement.nickname:
        return 'NICKNAME';
      case RequiredSignUpAttributesElement.phoneNumber:
        return 'PHONE_NUMBER';
      case RequiredSignUpAttributesElement.picture:
        return 'PICTURE';
      case RequiredSignUpAttributesElement.preferredUsername:
        return 'PREFERRED_USERNAME';
      case RequiredSignUpAttributesElement.profile:
        return 'PROFILE';
      case RequiredSignUpAttributesElement.updatedAt:
        return 'UPDATED_AT';
      case RequiredSignUpAttributesElement.website:
        return 'WEBSITE';
      case RequiredSignUpAttributesElement.zoneInfo:
        return 'ZONE_INFO';
    }
  }
}

extension RequiredSignUpAttributesElementFromString on String {
  RequiredSignUpAttributesElement toRequiredSignUpAttributesElement() {
    switch (this) {
      case 'ADDRESS':
        return RequiredSignUpAttributesElement.address;
      case 'BIRTHDATE':
        return RequiredSignUpAttributesElement.birthdate;
      case 'EMAIL':
        return RequiredSignUpAttributesElement.email;
      case 'FAMILY_NAME':
        return RequiredSignUpAttributesElement.familyName;
      case 'GENDER':
        return RequiredSignUpAttributesElement.gender;
      case 'GIVEN_NAME':
        return RequiredSignUpAttributesElement.givenName;
      case 'LOCALE':
        return RequiredSignUpAttributesElement.locale;
      case 'MIDDLE_NAME':
        return RequiredSignUpAttributesElement.middleName;
      case 'NAME':
        return RequiredSignUpAttributesElement.name;
      case 'NICKNAME':
        return RequiredSignUpAttributesElement.nickname;
      case 'PHONE_NUMBER':
        return RequiredSignUpAttributesElement.phoneNumber;
      case 'PICTURE':
        return RequiredSignUpAttributesElement.picture;
      case 'PREFERRED_USERNAME':
        return RequiredSignUpAttributesElement.preferredUsername;
      case 'PROFILE':
        return RequiredSignUpAttributesElement.profile;
      case 'UPDATED_AT':
        return RequiredSignUpAttributesElement.updatedAt;
      case 'WEBSITE':
        return RequiredSignUpAttributesElement.website;
      case 'ZONE_INFO':
        return RequiredSignUpAttributesElement.zoneInfo;
    }
    throw Exception(
        '$this is not known in enum RequiredSignUpAttributesElement');
  }
}

enum UnAuthenticatedElement {
  read,
  createAndUpdate,
  delete,
}

extension UnAuthenticatedElementValueExtension on UnAuthenticatedElement {
  String toValue() {
    switch (this) {
      case UnAuthenticatedElement.read:
        return 'READ';
      case UnAuthenticatedElement.createAndUpdate:
        return 'CREATE_AND_UPDATE';
      case UnAuthenticatedElement.delete:
        return 'DELETE';
    }
  }
}

extension UnAuthenticatedElementFromString on String {
  UnAuthenticatedElement toUnAuthenticatedElement() {
    switch (this) {
      case 'READ':
        return UnAuthenticatedElement.read;
      case 'CREATE_AND_UPDATE':
        return UnAuthenticatedElement.createAndUpdate;
      case 'DELETE':
        return UnAuthenticatedElement.delete;
    }
    throw Exception('$this is not known in enum UnAuthenticatedElement');
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class GatewayTimeoutException extends _s.GenericAwsException {
  GatewayTimeoutException({String? type, String? message})
      : super(type: type, code: 'GatewayTimeoutException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
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
