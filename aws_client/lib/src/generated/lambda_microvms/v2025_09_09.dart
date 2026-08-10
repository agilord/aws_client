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

import 'v2025_09_09.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Provides APIs to create, manage, and operate AWS Lambda MicroVMs and their
/// associated MicroVM Image environments.
class LambdaMicrovms {
  final _s.RestJsonProtocol _protocol;
  factory LambdaMicrovms({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'lambda',
    );
    return LambdaMicrovms._(
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
  LambdaMicrovms._({
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

  /// Creates a MicroVM image from the specified code artifact and base image.
  /// The build is asynchronous — the image transitions from CREATING to CREATED
  /// on success, or CREATE_FAILED on failure. Use GetMicrovmImage to poll for
  /// completion.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [baseImageArn] :
  /// The ARN of the Lambda-managed base MicroVM image to build upon. Use
  /// ListManagedMicrovmImages to discover available base images.
  ///
  /// Parameter [buildRoleArn] :
  /// The ARN of the IAM role assumed during the image build process. This role
  /// must have permissions to access the code artifact and any required
  /// resources.
  ///
  /// Parameter [codeArtifact] :
  /// The code artifact containing the application code and metadata for the
  /// MicroVM image.
  ///
  /// Parameter [name] :
  /// The name of the MicroVM image. Must be unique within the AWS account.
  ///
  /// Parameter [additionalOsCapabilities] :
  /// Additional OS capabilities granted to the MicroVM runtime environment.
  ///
  /// Parameter [baseImageVersion] :
  /// The specific version of the base MicroVM image to use.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier you provide to ensure the idempotency
  /// of the request. If you retry a request that completed successfully using
  /// the same client token, the operation returns the successful response
  /// without performing any further actions.
  ///
  /// Parameter [cpuConfigurations] :
  /// The list of supported CPU configurations for the MicroVM.
  ///
  /// Parameter [description] :
  /// A description of the MicroVM image.
  ///
  /// Parameter [egressNetworkConnectors] :
  /// The list of egress network connectors available to the MicroVM at runtime.
  ///
  /// Parameter [environmentVariables] :
  /// Environment variables set in the MicroVM runtime environment.
  ///
  /// Parameter [logging] :
  /// The logging configuration for build-time and runtime logs. Specify
  /// {"cloudWatch": {"logGroup": "..."}} to stream logs to a custom CloudWatch
  /// log group, or {"disabled": {}} to turn off logging.
  ///
  /// Parameter [resources] :
  /// The resource requirements for the MicroVM.
  ///
  /// Parameter [tags] :
  /// A set of key-value pairs that you can attach to the resource. Use tags to
  /// categorize resources for cost allocation, access control (ABAC), and
  /// organization.
  Future<CreateMicrovmImageResponse> createMicrovmImage({
    required String baseImageArn,
    required String buildRoleArn,
    required CodeArtifact codeArtifact,
    required String name,
    List<Capability>? additionalOsCapabilities,
    String? baseImageVersion,
    String? clientToken,
    List<CpuConfiguration>? cpuConfigurations,
    String? description,
    List<String>? egressNetworkConnectors,
    Map<String, String>? environmentVariables,
    Hooks? hooks,
    Logging? logging,
    List<Resources>? resources,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'baseImageArn': baseImageArn,
      'buildRoleArn': buildRoleArn,
      'codeArtifact': codeArtifact,
      'name': name,
      if (additionalOsCapabilities != null)
        'additionalOsCapabilities':
            additionalOsCapabilities.map((e) => e.value).toList(),
      if (baseImageVersion != null) 'baseImageVersion': baseImageVersion,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (cpuConfigurations != null) 'cpuConfigurations': cpuConfigurations,
      if (description != null) 'description': description,
      if (egressNetworkConnectors != null)
        'egressNetworkConnectors': egressNetworkConnectors,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (hooks != null) 'hooks': hooks,
      if (logging != null) 'logging': logging,
      if (resources != null) 'resources': resources,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2025-09-09/microvm-images',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMicrovmImageResponse.fromJson(response);
  }

  /// Deletes a MicroVM image. This operation is idempotent; deleting an image
  /// that has already been deleted succeeds without error.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageIdentifier] :
  /// The unique identifier (ARN or ID) of the MicroVM image to delete.
  Future<DeleteMicrovmImageOutput> deleteMicrovmImage({
    required String imageIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2025-09-09/microvm-images/${Uri.encodeComponent(imageIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMicrovmImageOutput.fromJson(response);
  }

  /// Deletes a specific version of a MicroVM image. This operation is
  /// idempotent; deleting a version that has already been deleted succeeds
  /// without error.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageIdentifier] :
  /// The unique identifier (ARN or ID) of the MicroVM image.
  ///
  /// Parameter [imageVersion] :
  /// The version of the MicroVM image to delete.
  Future<DeleteMicrovmImageVersionOutput> deleteMicrovmImageVersion({
    required String imageIdentifier,
    required String imageVersion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2025-09-09/microvm-images/${Uri.encodeComponent(imageIdentifier)}/versions/${Uri.encodeComponent(imageVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMicrovmImageVersionOutput.fromJson(response);
  }

  /// Retrieves the details of a MicroVM image, including its state, versions,
  /// and configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageIdentifier] :
  /// The unique identifier (ARN or ID) of the MicroVM image to retrieve.
  Future<GetMicrovmImageOutput> getMicrovmImage({
    required String imageIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-09-09/microvm-images/${Uri.encodeComponent(imageIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMicrovmImageOutput.fromJson(response);
  }

  /// Retrieves the details of a specific MicroVM image build, including its
  /// state, target architecture, and snapshot information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buildId] :
  /// The unique identifier of the build to retrieve.
  ///
  /// Parameter [imageIdentifier] :
  /// The unique identifier (ARN or ID) of the MicroVM image.
  ///
  /// Parameter [imageVersion] :
  /// The version of the MicroVM image.
  Future<GetMicrovmImageBuildOutput> getMicrovmImageBuild({
    required String buildId,
    required String imageIdentifier,
    required String imageVersion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-09-09/microvm-images/${Uri.encodeComponent(imageIdentifier)}/versions/${Uri.encodeComponent(imageVersion)}/builds/${Uri.encodeComponent(buildId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMicrovmImageBuildOutput.fromJson(response);
  }

  /// Retrieves the details of a specific version of a MicroVM image, including
  /// its configuration, state, and build information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageIdentifier] :
  /// The unique identifier (ARN or ID) of the MicroVM image.
  ///
  /// Parameter [imageVersion] :
  /// The version of the MicroVM image to retrieve.
  Future<GetMicrovmImageVersionOutput> getMicrovmImageVersion({
    required String imageIdentifier,
    required String imageVersion,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-09-09/microvm-images/${Uri.encodeComponent(imageIdentifier)}/versions/${Uri.encodeComponent(imageVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMicrovmImageVersionOutput.fromJson(response);
  }

  /// Lists AWS managed MicroVM images available for use as base images. We
  /// recommend using pagination to ensure that the operation returns quickly
  /// and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous call. Use this token to retrieve the
  /// next page of results.
  Future<ListManagedMicrovmImagesOutput> listManagedMicrovmImages({
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
      requestUri: '/2025-09-09/managed-microvm-images',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedMicrovmImagesOutput.fromJson(response);
  }

  /// Lists versions of a managed MicroVM image. We recommend using pagination
  /// to ensure that the operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageIdentifier] :
  /// The unique identifier (ARN or ID) of the managed MicroVM image to list
  /// versions for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous call. Use this token to retrieve the
  /// next page of results.
  Future<ListManagedMicrovmImageVersionsOutput>
      listManagedMicrovmImageVersions({
    required String imageIdentifier,
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
      requestUri:
          '/2025-09-09/managed-microvm-images/${Uri.encodeComponent(imageIdentifier)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedMicrovmImageVersionsOutput.fromJson(response);
  }

  /// Lists builds for a MicroVM image version with optional filtering by
  /// architecture and chipset. We recommend using pagination to ensure that the
  /// operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageIdentifier] :
  /// The unique identifier (ARN or ID) of the MicroVM image.
  ///
  /// Parameter [imageVersion] :
  /// The version of the MicroVM image to list builds for.
  ///
  /// Parameter [architecture] :
  /// Filters builds by target CPU architecture.
  ///
  /// Parameter [chipset] :
  /// Filters builds by target chipset.
  ///
  /// Parameter [chipsetGeneration] :
  /// Filters builds by target chipset generation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous call. Use this token to retrieve the
  /// next page of results.
  Future<ListMicrovmImageBuildsOutput> listMicrovmImageBuilds({
    required String imageIdentifier,
    required String imageVersion,
    Architecture? architecture,
    Chipset? chipset,
    String? chipsetGeneration,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (architecture != null) 'architecture': [architecture.value],
      if (chipset != null) 'chipset': [chipset.value],
      if (chipsetGeneration != null) 'chipsetGeneration': [chipsetGeneration],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-09-09/microvm-images/${Uri.encodeComponent(imageIdentifier)}/versions/${Uri.encodeComponent(imageVersion)}/builds',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMicrovmImageBuildsOutput.fromJson(response);
  }

  /// Lists MicroVM images in the account with optional name filtering. We
  /// recommend using pagination to ensure that the operation returns quickly
  /// and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nameFilter] :
  /// Filters images whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous call. Use this token to retrieve the
  /// next page of results.
  Future<ListMicrovmImagesResponse> listMicrovmImages({
    int? maxResults,
    String? nameFilter,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameFilter != null) 'nameFilter': [nameFilter],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2025-09-09/microvm-images',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMicrovmImagesResponse.fromJson(response);
  }

  /// Lists versions of a MicroVM image. We recommend using pagination to ensure
  /// that the operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageIdentifier] :
  /// The unique identifier (ARN or ID) of the MicroVM image to list versions
  /// for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous call. Use this token to retrieve the
  /// next page of results.
  Future<ListMicrovmImageVersionsOutput> listMicrovmImageVersions({
    required String imageIdentifier,
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
      requestUri:
          '/2025-09-09/microvm-images/${Uri.encodeComponent(imageIdentifier)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMicrovmImageVersionsOutput.fromJson(response);
  }

  /// Lists the tags associated with a Lambda MicroVM resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resource] :
  /// The ARN of the resource to list tags for.
  Future<ListTagsResponse> listTags({
    required String resource,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-03-31/tags/${Uri.encodeComponent(resource)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsResponse.fromJson(response);
  }

  /// Adds tags to a Lambda MicroVM resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resource] :
  /// The ARN of the resource to tag.
  ///
  /// Parameter [tags] :
  /// The key-value pairs of tags to add to the resource.
  Future<void> tagResource({
    required String resource,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2017-03-31/tags/${Uri.encodeComponent(resource)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a Lambda MicroVM resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resource] :
  /// The ARN of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
  Future<void> untagResource({
    required String resource,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-03-31/tags/${Uri.encodeComponent(resource)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration of a MicroVM image and triggers a new version
  /// build. This operation uses PUT semantics — all required fields
  /// (codeArtifact, baseImageArn, buildRoleArn) must be provided with every
  /// request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [baseImageArn] :
  /// The ARN of the base MicroVM image.
  ///
  /// Parameter [buildRoleArn] :
  /// The ARN of the IAM build role.
  ///
  /// Parameter [codeArtifact] :
  /// The code artifact containing the application code and metadata for the
  /// MicroVM image.
  ///
  /// Parameter [imageIdentifier] :
  /// The unique identifier (ARN or ID) of the MicroVM image to update.
  ///
  /// Parameter [additionalOsCapabilities] :
  /// Additional OS capabilities granted to the MicroVM runtime environment.
  ///
  /// Parameter [baseImageVersion] :
  /// The specific version of the base MicroVM image to use.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [cpuConfigurations] :
  /// The list of supported CPU configurations for the MicroVM.
  ///
  /// Parameter [description] :
  /// The description of the MicroVM image.
  ///
  /// Parameter [egressNetworkConnectors] :
  /// The list of egress network connectors available to the MicroVM at runtime.
  ///
  /// Parameter [environmentVariables] :
  /// Environment variables set in the MicroVM runtime environment.
  ///
  /// Parameter [logging] :
  /// The logging configuration for build-time and runtime logs. Specify
  /// {"cloudWatch": {"logGroup": "..."}} to stream logs to a custom CloudWatch
  /// log group, or {"disabled": {}} to turn off logging.
  ///
  /// Parameter [resources] :
  /// The resource requirements for the MicroVM.
  Future<UpdateMicrovmImageResponse> updateMicrovmImage({
    required String baseImageArn,
    required String buildRoleArn,
    required CodeArtifact codeArtifact,
    required String imageIdentifier,
    List<Capability>? additionalOsCapabilities,
    String? baseImageVersion,
    String? clientToken,
    List<CpuConfiguration>? cpuConfigurations,
    String? description,
    List<String>? egressNetworkConnectors,
    Map<String, String>? environmentVariables,
    Hooks? hooks,
    Logging? logging,
    List<Resources>? resources,
  }) async {
    final $payload = <String, dynamic>{
      'baseImageArn': baseImageArn,
      'buildRoleArn': buildRoleArn,
      'codeArtifact': codeArtifact,
      if (additionalOsCapabilities != null)
        'additionalOsCapabilities':
            additionalOsCapabilities.map((e) => e.value).toList(),
      if (baseImageVersion != null) 'baseImageVersion': baseImageVersion,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (cpuConfigurations != null) 'cpuConfigurations': cpuConfigurations,
      if (description != null) 'description': description,
      if (egressNetworkConnectors != null)
        'egressNetworkConnectors': egressNetworkConnectors,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (hooks != null) 'hooks': hooks,
      if (logging != null) 'logging': logging,
      if (resources != null) 'resources': resources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2025-09-09/microvm-images/${Uri.encodeComponent(imageIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMicrovmImageResponse.fromJson(response);
  }

  /// Updates the status of a specific MicroVM image version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageIdentifier] :
  /// The unique identifier (ARN or ID) of the MicroVM image.
  ///
  /// Parameter [imageVersion] :
  /// The version of the MicroVM image to update.
  ///
  /// Parameter [status] :
  /// The new status to set for the MicroVM image version.
  Future<UpdateMicrovmImageVersionResponse> updateMicrovmImageVersion({
    required String imageIdentifier,
    required String imageVersion,
    required MicrovmImageVersionStatus status,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2025-09-09/microvm-images/${Uri.encodeComponent(imageIdentifier)}/versions/${Uri.encodeComponent(imageVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMicrovmImageVersionResponse.fromJson(response);
  }

  /// Runs a new MicroVM from the specified image. The MicroVM starts in PENDING
  /// state and transitions to RUNNING once provisioning completes. To connect,
  /// generate an authentication token using CreateMicrovmAuthToken.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageIdentifier] :
  /// The identifier (ARN or ID) of the MicroVM image to run.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [egressNetworkConnectors] :
  /// The list of egress network connectors to configure for the MicroVM.
  ///
  /// Parameter [executionRoleArn] :
  /// The ARN of the IAM role to be assumed by the MicroVM during execution.
  ///
  /// Parameter [idlePolicy] :
  /// Configuration to control auto-suspend and auto-resume behavior.
  ///
  /// Parameter [imageVersion] :
  /// The version of the MicroVM image to run.
  ///
  /// Parameter [ingressNetworkConnectors] :
  /// The list of ingress network connectors to configure for the MicroVM.
  ///
  /// Parameter [logging] :
  /// The logging configuration for this MicroVM instance. Specify
  /// {"cloudWatch": {"logGroup": "..."}} to stream application logs to a custom
  /// CloudWatch log group, or {"disabled": {}} to turn off logging.
  ///
  /// Parameter [maximumDurationInSeconds] :
  /// The maximum duration in seconds that the MicroVM can exist before being
  /// terminated by the platform. Valid range: 1–28,800 (8 hours).
  ///
  /// Parameter [runHookPayload] :
  /// Per-MicroVM initialization data delivered as the request body of the /run
  /// lifecycle hook. Use to pass tenant-specific configuration such as session
  /// IDs or secret references. Maximum: 16,384 bytes.
  Future<RunMicrovmResponse> runMicrovm({
    required String imageIdentifier,
    String? clientToken,
    List<String>? egressNetworkConnectors,
    String? executionRoleArn,
    IdlePolicy? idlePolicy,
    String? imageVersion,
    List<String>? ingressNetworkConnectors,
    Logging? logging,
    int? maximumDurationInSeconds,
    String? runHookPayload,
  }) async {
    final $payload = <String, dynamic>{
      'imageIdentifier': imageIdentifier,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (egressNetworkConnectors != null)
        'egressNetworkConnectors': egressNetworkConnectors,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (idlePolicy != null) 'idlePolicy': idlePolicy,
      if (imageVersion != null) 'imageVersion': imageVersion,
      if (ingressNetworkConnectors != null)
        'ingressNetworkConnectors': ingressNetworkConnectors,
      if (logging != null) 'logging': logging,
      if (maximumDurationInSeconds != null)
        'maximumDurationInSeconds': maximumDurationInSeconds,
      if (runHookPayload != null) 'runHookPayload': runHookPayload,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2025-09-09/microvms',
      exceptionFnMap: _exceptionFns,
    );
    return RunMicrovmResponse.fromJson(response);
  }

  /// Retrieves the details of a specific MicroVM, including its state,
  /// endpoint, image information, and configuration. The state field is
  /// eventually consistent — determine readiness by connecting to the endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [microvmIdentifier] :
  /// The ID of the MicroVM to retrieve.
  Future<GetMicrovmResponse> getMicrovm({
    required String microvmIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2025-09-09/microvms/${Uri.encodeComponent(microvmIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMicrovmResponse.fromJson(response);
  }

  /// Terminates a MicroVM. This operation is idempotent; terminating a MicroVM
  /// that has already been terminated succeeds without error.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [microvmIdentifier] :
  /// The ID of the MicroVM to terminate.
  Future<void> terminateMicrovm({
    required String microvmIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2025-09-09/microvms/${Uri.encodeComponent(microvmIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists MicroVMs in the account with optional filtering by image and
  /// version. We recommend using pagination to ensure that the operation
  /// returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageIdentifier] :
  /// Optional filter to list only MicroVMs running the specified image.
  ///
  /// Parameter [imageVersion] :
  /// Optional filter to list only MicroVMs running the specified image version.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous call. Use this token to retrieve the
  /// next page of results.
  Future<ListMicrovmsResponse> listMicrovms({
    String? imageIdentifier,
    String? imageVersion,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (imageIdentifier != null) 'imageIdentifier': [imageIdentifier],
      if (imageVersion != null) 'imageVersion': [imageVersion],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2025-09-09/microvms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMicrovmsResponse.fromJson(response);
  }

  /// Creates an authentication token for accessing a running MicroVM. The token
  /// grants access to the specified ports on the MicroVM endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [allowedPorts] :
  /// The list of port specifications that the authentication token grants
  /// access to on the MicroVM.
  ///
  /// Parameter [expirationInMinutes] :
  /// The duration in minutes before the authentication token expires. Maximum:
  /// 60 minutes.
  ///
  /// Parameter [microvmIdentifier] :
  /// The ID of the MicroVM to create an authentication token for.
  Future<CreateMicrovmAuthTokenResponse> createMicrovmAuthToken({
    required List<PortSpecification> allowedPorts,
    required int expirationInMinutes,
    required String microvmIdentifier,
  }) async {
    _s.validateNumRange(
      'expirationInMinutes',
      expirationInMinutes,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'allowedPorts': allowedPorts,
      'expirationInMinutes': expirationInMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2025-09-09/microvms/${Uri.encodeComponent(microvmIdentifier)}/auth-token',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMicrovmAuthTokenResponse.fromJson(response);
  }

  /// Creates a shell authentication token for interactive shell access to a
  /// running MicroVM. The MicroVM must have been run with the SHELL_INGRESS
  /// network connector attached.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [expirationInMinutes] :
  /// The duration in minutes before the shell authentication token expires.
  ///
  /// Parameter [microvmIdentifier] :
  /// The ID of the MicroVM to create a shell authentication token for.
  Future<CreateMicrovmShellAuthTokenResponse> createMicrovmShellAuthToken({
    required int expirationInMinutes,
    required String microvmIdentifier,
  }) async {
    _s.validateNumRange(
      'expirationInMinutes',
      expirationInMinutes,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'expirationInMinutes': expirationInMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2025-09-09/microvms/${Uri.encodeComponent(microvmIdentifier)}/shell-auth-token',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMicrovmShellAuthTokenResponse.fromJson(response);
  }

  /// Resumes a suspended MicroVM, restoring it to RUNNING state with all state
  /// intact. The MicroVM must be in SUSPENDED state.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [microvmIdentifier] :
  /// The ID of the MicroVM to resume.
  Future<void> resumeMicrovm({
    required String microvmIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2025-09-09/microvms/${Uri.encodeComponent(microvmIdentifier)}/resume',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Suspends a running MicroVM, preserving its full memory and disk state. The
  /// MicroVM transitions through SUSPENDING to SUSPENDED. To restore, call
  /// ResumeMicrovm or send traffic to the endpoint if autoResumeEnabled is
  /// true.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [microvmIdentifier] :
  /// The ID of the MicroVM to suspend.
  Future<void> suspendMicrovm({
    required String microvmIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/2025-09-09/microvms/${Uri.encodeComponent(microvmIdentifier)}/suspend',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class CreateMicrovmImageResponse {
  /// The ARN of the base MicroVM image.
  final String baseImageArn;

  /// The ARN of the IAM build role.
  final String buildRoleArn;

  /// The code artifact containing the application code and metadata for the
  /// MicroVM image.
  final CodeArtifact codeArtifact;

  /// The timestamp when the MicroVM image was created.
  final DateTime createdAt;

  /// The ARN of the created MicroVM image.
  final String imageArn;

  /// The version of the MicroVM image.
  final String imageVersion;

  /// The name of the MicroVM image.
  final String name;

  /// The current state of the MicroVM image.
  final MicrovmImageState state;

  /// Additional OS capabilities granted to the MicroVM runtime environment.
  final List<Capability>? additionalOsCapabilities;

  /// The specific version of the base MicroVM image.
  final String? baseImageVersion;

  /// The list of supported CPU configurations for the MicroVM.
  final List<CpuConfiguration>? cpuConfigurations;

  /// The description of the MicroVM image.
  final String? description;

  /// The list of egress network connectors available to the MicroVM at runtime.
  final List<String>? egressNetworkConnectors;

  /// Environment variables set in the MicroVM runtime environment.
  final Map<String, String>? environmentVariables;
  final Hooks? hooks;

  /// The latest active version of the MicroVM image.
  final String? latestActiveImageVersion;

  /// The latest failed version of the MicroVM image, if any.
  final String? latestFailedImageVersion;

  /// The logging configuration for build-time and runtime logs. Specify
  /// {"cloudWatch": {"logGroup": "..."}} to stream logs to a custom CloudWatch
  /// log group, or {"disabled": {}} to turn off logging.
  final Logging? logging;

  /// The resource requirements for the MicroVM.
  final List<Resources>? resources;

  /// A set of key-value pairs that you can attach to the resource. Use tags to
  /// categorize resources for cost allocation, access control (ABAC), and
  /// organization.
  final Map<String, String>? tags;

  /// The timestamp when the MicroVM image was last updated.
  final DateTime? updatedAt;

  CreateMicrovmImageResponse({
    required this.baseImageArn,
    required this.buildRoleArn,
    required this.codeArtifact,
    required this.createdAt,
    required this.imageArn,
    required this.imageVersion,
    required this.name,
    required this.state,
    this.additionalOsCapabilities,
    this.baseImageVersion,
    this.cpuConfigurations,
    this.description,
    this.egressNetworkConnectors,
    this.environmentVariables,
    this.hooks,
    this.latestActiveImageVersion,
    this.latestFailedImageVersion,
    this.logging,
    this.resources,
    this.tags,
    this.updatedAt,
  });

  factory CreateMicrovmImageResponse.fromJson(Map<String, dynamic> json) {
    return CreateMicrovmImageResponse(
      baseImageArn: (json['baseImageArn'] as String?) ?? '',
      buildRoleArn: (json['buildRoleArn'] as String?) ?? '',
      codeArtifact: CodeArtifact.fromJson(
          (json['codeArtifact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: MicrovmImageState.fromString((json['state'] as String?) ?? ''),
      additionalOsCapabilities: (json['additionalOsCapabilities'] as List?)
          ?.nonNulls
          .map((e) => Capability.fromString((e as String)))
          .toList(),
      baseImageVersion: json['baseImageVersion'] as String?,
      cpuConfigurations: (json['cpuConfigurations'] as List?)
          ?.nonNulls
          .map((e) => CpuConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      egressNetworkConnectors: (json['egressNetworkConnectors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      environmentVariables:
          (json['environmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      hooks: json['hooks'] != null
          ? Hooks.fromJson(json['hooks'] as Map<String, dynamic>)
          : null,
      latestActiveImageVersion: json['latestActiveImageVersion'] as String?,
      latestFailedImageVersion: json['latestFailedImageVersion'] as String?,
      logging: json['logging'] != null
          ? Logging.fromJson(json['logging'] as Map<String, dynamic>)
          : null,
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => Resources.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final baseImageArn = this.baseImageArn;
    final buildRoleArn = this.buildRoleArn;
    final codeArtifact = this.codeArtifact;
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final name = this.name;
    final state = this.state;
    final additionalOsCapabilities = this.additionalOsCapabilities;
    final baseImageVersion = this.baseImageVersion;
    final cpuConfigurations = this.cpuConfigurations;
    final description = this.description;
    final egressNetworkConnectors = this.egressNetworkConnectors;
    final environmentVariables = this.environmentVariables;
    final hooks = this.hooks;
    final latestActiveImageVersion = this.latestActiveImageVersion;
    final latestFailedImageVersion = this.latestFailedImageVersion;
    final logging = this.logging;
    final resources = this.resources;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'baseImageArn': baseImageArn,
      'buildRoleArn': buildRoleArn,
      'codeArtifact': codeArtifact,
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      'name': name,
      'state': state.value,
      if (additionalOsCapabilities != null)
        'additionalOsCapabilities':
            additionalOsCapabilities.map((e) => e.value).toList(),
      if (baseImageVersion != null) 'baseImageVersion': baseImageVersion,
      if (cpuConfigurations != null) 'cpuConfigurations': cpuConfigurations,
      if (description != null) 'description': description,
      if (egressNetworkConnectors != null)
        'egressNetworkConnectors': egressNetworkConnectors,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (hooks != null) 'hooks': hooks,
      if (latestActiveImageVersion != null)
        'latestActiveImageVersion': latestActiveImageVersion,
      if (latestFailedImageVersion != null)
        'latestFailedImageVersion': latestFailedImageVersion,
      if (logging != null) 'logging': logging,
      if (resources != null) 'resources': resources,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class DeleteMicrovmImageOutput {
  /// The identifier of the deleted MicroVM image.
  final String imageIdentifier;

  /// The current state of the MicroVM image after deletion.
  final MicrovmImageState state;

  DeleteMicrovmImageOutput({
    required this.imageIdentifier,
    required this.state,
  });

  factory DeleteMicrovmImageOutput.fromJson(Map<String, dynamic> json) {
    return DeleteMicrovmImageOutput(
      imageIdentifier: (json['imageIdentifier'] as String?) ?? '',
      state: MicrovmImageState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final imageIdentifier = this.imageIdentifier;
    final state = this.state;
    return {
      'imageIdentifier': imageIdentifier,
      'state': state.value,
    };
  }
}

/// @nodoc
class DeleteMicrovmImageVersionOutput {
  /// The identifier of the MicroVM image.
  final String imageIdentifier;

  /// The version that was deleted.
  final String imageVersion;

  /// The current state of the MicroVM image version after deletion.
  final MicrovmImageVersionState state;

  DeleteMicrovmImageVersionOutput({
    required this.imageIdentifier,
    required this.imageVersion,
    required this.state,
  });

  factory DeleteMicrovmImageVersionOutput.fromJson(Map<String, dynamic> json) {
    return DeleteMicrovmImageVersionOutput(
      imageIdentifier: (json['imageIdentifier'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      state:
          MicrovmImageVersionState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final imageIdentifier = this.imageIdentifier;
    final imageVersion = this.imageVersion;
    final state = this.state;
    return {
      'imageIdentifier': imageIdentifier,
      'imageVersion': imageVersion,
      'state': state.value,
    };
  }
}

/// @nodoc
class GetMicrovmImageOutput {
  /// The timestamp when the MicroVM image was created.
  final DateTime createdAt;

  /// The ARN of the MicroVM image.
  final String imageArn;

  /// The name of the MicroVM image.
  final String name;

  /// The current state of the MicroVM image.
  final MicrovmImageState state;

  /// The latest active version of the MicroVM image.
  final String? latestActiveImageVersion;

  /// The latest failed version of the MicroVM image, if any.
  final String? latestFailedImageVersion;

  /// A set of key-value pairs that you can attach to the resource. Use tags to
  /// categorize resources for cost allocation, access control (ABAC), and
  /// organization.
  final Map<String, String>? tags;

  /// The timestamp when the MicroVM image was last updated.
  final DateTime? updatedAt;

  GetMicrovmImageOutput({
    required this.createdAt,
    required this.imageArn,
    required this.name,
    required this.state,
    this.latestActiveImageVersion,
    this.latestFailedImageVersion,
    this.tags,
    this.updatedAt,
  });

  factory GetMicrovmImageOutput.fromJson(Map<String, dynamic> json) {
    return GetMicrovmImageOutput(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: MicrovmImageState.fromString((json['state'] as String?) ?? ''),
      latestActiveImageVersion: json['latestActiveImageVersion'] as String?,
      latestFailedImageVersion: json['latestFailedImageVersion'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final name = this.name;
    final state = this.state;
    final latestActiveImageVersion = this.latestActiveImageVersion;
    final latestFailedImageVersion = this.latestFailedImageVersion;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      'name': name,
      'state': state.value,
      if (latestActiveImageVersion != null)
        'latestActiveImageVersion': latestActiveImageVersion,
      if (latestFailedImageVersion != null)
        'latestFailedImageVersion': latestFailedImageVersion,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class GetMicrovmImageBuildOutput {
  /// The target CPU architecture for the build. Supported value: ARM_64.
  final Architecture architecture;

  /// The build request ID.
  final String buildId;

  /// The current state of the build.
  final BuildState buildState;

  /// The target chipset for the build.
  final Chipset chipset;

  /// The target chipset generation for the build.
  final String chipsetGeneration;

  /// The timestamp when the build was created.
  final DateTime createdAt;

  /// The ARN of the MicroVM image.
  final String imageArn;

  /// The version of the MicroVM image.
  final String imageVersion;

  /// The snapshot build details, including memory and disk snapshot sizes.
  final SnapshotBuild? snapshotBuild;

  /// The reason for the build state, if applicable.
  final String? stateReason;

  GetMicrovmImageBuildOutput({
    required this.architecture,
    required this.buildId,
    required this.buildState,
    required this.chipset,
    required this.chipsetGeneration,
    required this.createdAt,
    required this.imageArn,
    required this.imageVersion,
    this.snapshotBuild,
    this.stateReason,
  });

  factory GetMicrovmImageBuildOutput.fromJson(Map<String, dynamic> json) {
    return GetMicrovmImageBuildOutput(
      architecture:
          Architecture.fromString((json['architecture'] as String?) ?? ''),
      buildId: (json['buildId'] as String?) ?? '',
      buildState: BuildState.fromString((json['buildState'] as String?) ?? ''),
      chipset: Chipset.fromString((json['chipset'] as String?) ?? ''),
      chipsetGeneration: (json['chipsetGeneration'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      snapshotBuild: json['snapshotBuild'] != null
          ? SnapshotBuild.fromJson(
              json['snapshotBuild'] as Map<String, dynamic>)
          : null,
      stateReason: json['stateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final buildId = this.buildId;
    final buildState = this.buildState;
    final chipset = this.chipset;
    final chipsetGeneration = this.chipsetGeneration;
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final snapshotBuild = this.snapshotBuild;
    final stateReason = this.stateReason;
    return {
      'architecture': architecture.value,
      'buildId': buildId,
      'buildState': buildState.value,
      'chipset': chipset.value,
      'chipsetGeneration': chipsetGeneration,
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      if (snapshotBuild != null) 'snapshotBuild': snapshotBuild,
      if (stateReason != null) 'stateReason': stateReason,
    };
  }
}

/// @nodoc
class GetMicrovmImageVersionOutput {
  /// The ARN of the base MicroVM image used.
  final String baseImageArn;

  /// The ARN of the IAM build role.
  final String buildRoleArn;

  /// The code artifact for this version.
  final CodeArtifact codeArtifact;

  /// The timestamp when the version was created.
  final DateTime createdAt;

  /// The ARN of the MicroVM image.
  final String imageArn;

  /// The version of the MicroVM image.
  final String imageVersion;

  /// The current state of the version.
  final MicrovmImageVersionState state;

  /// The availability status of the version: ACTIVE (can be used by RunMicrovm)
  /// or INACTIVE (blocked from launching new MicroVMs).
  final MicrovmImageVersionStatus status;

  /// Additional OS capabilities granted to the MicroVM runtime environment.
  final List<Capability>? additionalOsCapabilities;

  /// The specific version of the base MicroVM image.
  final String? baseImageVersion;

  /// The list of supported CPU configurations for the MicroVM.
  final List<CpuConfiguration>? cpuConfigurations;

  /// The description of the version.
  final String? description;

  /// The list of egress network connectors available to the MicroVM at runtime.
  final List<String>? egressNetworkConnectors;

  /// Environment variables set in the MicroVM runtime environment.
  final Map<String, String>? environmentVariables;
  final Hooks? hooks;

  /// The logging configuration for this version.
  final Logging? logging;

  /// The resource requirements for the MicroVM.
  final List<Resources>? resources;

  /// The reason for the current state. For example, one or more builds failed.
  final String? stateReason;

  /// Key-value pairs associated with the version.
  final Map<String, String>? tags;

  /// The timestamp when the version was last updated.
  final DateTime? updatedAt;

  GetMicrovmImageVersionOutput({
    required this.baseImageArn,
    required this.buildRoleArn,
    required this.codeArtifact,
    required this.createdAt,
    required this.imageArn,
    required this.imageVersion,
    required this.state,
    required this.status,
    this.additionalOsCapabilities,
    this.baseImageVersion,
    this.cpuConfigurations,
    this.description,
    this.egressNetworkConnectors,
    this.environmentVariables,
    this.hooks,
    this.logging,
    this.resources,
    this.stateReason,
    this.tags,
    this.updatedAt,
  });

  factory GetMicrovmImageVersionOutput.fromJson(Map<String, dynamic> json) {
    return GetMicrovmImageVersionOutput(
      baseImageArn: (json['baseImageArn'] as String?) ?? '',
      buildRoleArn: (json['buildRoleArn'] as String?) ?? '',
      codeArtifact: CodeArtifact.fromJson(
          (json['codeArtifact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      state:
          MicrovmImageVersionState.fromString((json['state'] as String?) ?? ''),
      status: MicrovmImageVersionStatus.fromString(
          (json['status'] as String?) ?? ''),
      additionalOsCapabilities: (json['additionalOsCapabilities'] as List?)
          ?.nonNulls
          .map((e) => Capability.fromString((e as String)))
          .toList(),
      baseImageVersion: json['baseImageVersion'] as String?,
      cpuConfigurations: (json['cpuConfigurations'] as List?)
          ?.nonNulls
          .map((e) => CpuConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      egressNetworkConnectors: (json['egressNetworkConnectors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      environmentVariables:
          (json['environmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      hooks: json['hooks'] != null
          ? Hooks.fromJson(json['hooks'] as Map<String, dynamic>)
          : null,
      logging: json['logging'] != null
          ? Logging.fromJson(json['logging'] as Map<String, dynamic>)
          : null,
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => Resources.fromJson(e as Map<String, dynamic>))
          .toList(),
      stateReason: json['stateReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final baseImageArn = this.baseImageArn;
    final buildRoleArn = this.buildRoleArn;
    final codeArtifact = this.codeArtifact;
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final state = this.state;
    final status = this.status;
    final additionalOsCapabilities = this.additionalOsCapabilities;
    final baseImageVersion = this.baseImageVersion;
    final cpuConfigurations = this.cpuConfigurations;
    final description = this.description;
    final egressNetworkConnectors = this.egressNetworkConnectors;
    final environmentVariables = this.environmentVariables;
    final hooks = this.hooks;
    final logging = this.logging;
    final resources = this.resources;
    final stateReason = this.stateReason;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'baseImageArn': baseImageArn,
      'buildRoleArn': buildRoleArn,
      'codeArtifact': codeArtifact,
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      'state': state.value,
      'status': status.value,
      if (additionalOsCapabilities != null)
        'additionalOsCapabilities':
            additionalOsCapabilities.map((e) => e.value).toList(),
      if (baseImageVersion != null) 'baseImageVersion': baseImageVersion,
      if (cpuConfigurations != null) 'cpuConfigurations': cpuConfigurations,
      if (description != null) 'description': description,
      if (egressNetworkConnectors != null)
        'egressNetworkConnectors': egressNetworkConnectors,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (hooks != null) 'hooks': hooks,
      if (logging != null) 'logging': logging,
      if (resources != null) 'resources': resources,
      if (stateReason != null) 'stateReason': stateReason,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class ListManagedMicrovmImagesOutput {
  /// The list of managed MicroVM images.
  final List<ManagedMicrovmImageSummary> items;

  /// The pagination token to use in a subsequent request to retrieve the next
  /// page of results. This value is null when there are no more results to
  /// return.
  final String? nextToken;

  ListManagedMicrovmImagesOutput({
    required this.items,
    this.nextToken,
  });

  factory ListManagedMicrovmImagesOutput.fromJson(Map<String, dynamic> json) {
    return ListManagedMicrovmImagesOutput(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ManagedMicrovmImageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListManagedMicrovmImageVersionsOutput {
  /// The list of managed MicroVM image versions.
  final List<ManagedMicrovmImageVersion> items;

  /// The pagination token to use in a subsequent request to retrieve the next
  /// page of results. This value is null when there are no more results to
  /// return.
  final String? nextToken;

  ListManagedMicrovmImageVersionsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListManagedMicrovmImageVersionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListManagedMicrovmImageVersionsOutput(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ManagedMicrovmImageVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListMicrovmImageBuildsOutput {
  /// The list of MicroVM image builds.
  final List<MicrovmImageBuildSummary> items;

  /// The pagination token to use in a subsequent request to retrieve the next
  /// page of results. This value is null when there are no more results to
  /// return.
  final String? nextToken;

  ListMicrovmImageBuildsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListMicrovmImageBuildsOutput.fromJson(Map<String, dynamic> json) {
    return ListMicrovmImageBuildsOutput(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              MicrovmImageBuildSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListMicrovmImagesResponse {
  /// The list of MicroVM images.
  final List<MicrovmImageSummary> items;

  /// The pagination token to use in a subsequent request to retrieve the next
  /// page of results. This value is null when there are no more results to
  /// return.
  final String? nextToken;

  ListMicrovmImagesResponse({
    required this.items,
    this.nextToken,
  });

  factory ListMicrovmImagesResponse.fromJson(Map<String, dynamic> json) {
    return ListMicrovmImagesResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => MicrovmImageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListMicrovmImageVersionsOutput {
  /// The list of MicroVM image versions.
  final List<MicrovmImageVersionSummary> items;

  /// The pagination token to use in a subsequent request to retrieve the next
  /// page of results. This value is null when there are no more results to
  /// return.
  final String? nextToken;

  ListMicrovmImageVersionsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListMicrovmImageVersionsOutput.fromJson(Map<String, dynamic> json) {
    return ListMicrovmImageVersionsOutput(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              MicrovmImageVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsResponse {
  /// The key-value pairs of tags associated with the resource.
  final Map<String, String>? tags;

  ListTagsResponse({
    this.tags,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class UpdateMicrovmImageResponse {
  /// The ARN of the base MicroVM image.
  final String baseImageArn;

  /// The ARN of the IAM build role.
  final String buildRoleArn;

  /// The code artifact containing the application code and metadata for the
  /// MicroVM image.
  final CodeArtifact codeArtifact;

  /// The timestamp when the MicroVM image was created.
  final DateTime createdAt;

  /// The ARN of the MicroVM image.
  final String imageArn;

  /// The version of the MicroVM image.
  final String imageVersion;

  /// The name of the MicroVM image.
  final String name;

  /// The current state of the MicroVM image.
  final MicrovmImageState state;

  /// The timestamp when the MicroVM image was last updated.
  final DateTime updatedAt;

  /// Additional OS capabilities granted to the MicroVM runtime environment.
  final List<Capability>? additionalOsCapabilities;

  /// The specific version of the base MicroVM image.
  final String? baseImageVersion;

  /// The list of supported CPU configurations for the MicroVM.
  final List<CpuConfiguration>? cpuConfigurations;

  /// The description of the MicroVM image.
  final String? description;

  /// The list of egress network connectors available to the MicroVM at runtime.
  final List<String>? egressNetworkConnectors;

  /// Environment variables set in the MicroVM runtime environment.
  final Map<String, String>? environmentVariables;
  final Hooks? hooks;

  /// The latest active version of the MicroVM image.
  final String? latestActiveImageVersion;

  /// The latest failed version of the MicroVM image, if any.
  final String? latestFailedImageVersion;

  /// The logging configuration for build-time and runtime logs. Specify
  /// {"cloudWatch": {"logGroup": "..."}} to stream logs to a custom CloudWatch
  /// log group, or {"disabled": {}} to turn off logging.
  final Logging? logging;

  /// The resource requirements for the MicroVM.
  final List<Resources>? resources;

  UpdateMicrovmImageResponse({
    required this.baseImageArn,
    required this.buildRoleArn,
    required this.codeArtifact,
    required this.createdAt,
    required this.imageArn,
    required this.imageVersion,
    required this.name,
    required this.state,
    required this.updatedAt,
    this.additionalOsCapabilities,
    this.baseImageVersion,
    this.cpuConfigurations,
    this.description,
    this.egressNetworkConnectors,
    this.environmentVariables,
    this.hooks,
    this.latestActiveImageVersion,
    this.latestFailedImageVersion,
    this.logging,
    this.resources,
  });

  factory UpdateMicrovmImageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMicrovmImageResponse(
      baseImageArn: (json['baseImageArn'] as String?) ?? '',
      buildRoleArn: (json['buildRoleArn'] as String?) ?? '',
      codeArtifact: CodeArtifact.fromJson(
          (json['codeArtifact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: MicrovmImageState.fromString((json['state'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      additionalOsCapabilities: (json['additionalOsCapabilities'] as List?)
          ?.nonNulls
          .map((e) => Capability.fromString((e as String)))
          .toList(),
      baseImageVersion: json['baseImageVersion'] as String?,
      cpuConfigurations: (json['cpuConfigurations'] as List?)
          ?.nonNulls
          .map((e) => CpuConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      egressNetworkConnectors: (json['egressNetworkConnectors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      environmentVariables:
          (json['environmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      hooks: json['hooks'] != null
          ? Hooks.fromJson(json['hooks'] as Map<String, dynamic>)
          : null,
      latestActiveImageVersion: json['latestActiveImageVersion'] as String?,
      latestFailedImageVersion: json['latestFailedImageVersion'] as String?,
      logging: json['logging'] != null
          ? Logging.fromJson(json['logging'] as Map<String, dynamic>)
          : null,
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => Resources.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final baseImageArn = this.baseImageArn;
    final buildRoleArn = this.buildRoleArn;
    final codeArtifact = this.codeArtifact;
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final name = this.name;
    final state = this.state;
    final updatedAt = this.updatedAt;
    final additionalOsCapabilities = this.additionalOsCapabilities;
    final baseImageVersion = this.baseImageVersion;
    final cpuConfigurations = this.cpuConfigurations;
    final description = this.description;
    final egressNetworkConnectors = this.egressNetworkConnectors;
    final environmentVariables = this.environmentVariables;
    final hooks = this.hooks;
    final latestActiveImageVersion = this.latestActiveImageVersion;
    final latestFailedImageVersion = this.latestFailedImageVersion;
    final logging = this.logging;
    final resources = this.resources;
    return {
      'baseImageArn': baseImageArn,
      'buildRoleArn': buildRoleArn,
      'codeArtifact': codeArtifact,
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      'name': name,
      'state': state.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (additionalOsCapabilities != null)
        'additionalOsCapabilities':
            additionalOsCapabilities.map((e) => e.value).toList(),
      if (baseImageVersion != null) 'baseImageVersion': baseImageVersion,
      if (cpuConfigurations != null) 'cpuConfigurations': cpuConfigurations,
      if (description != null) 'description': description,
      if (egressNetworkConnectors != null)
        'egressNetworkConnectors': egressNetworkConnectors,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (hooks != null) 'hooks': hooks,
      if (latestActiveImageVersion != null)
        'latestActiveImageVersion': latestActiveImageVersion,
      if (latestFailedImageVersion != null)
        'latestFailedImageVersion': latestFailedImageVersion,
      if (logging != null) 'logging': logging,
      if (resources != null) 'resources': resources,
    };
  }
}

/// @nodoc
class UpdateMicrovmImageVersionResponse {
  /// The ARN of the base MicroVM image used.
  final String baseImageArn;

  /// The ARN of the IAM build role.
  final String buildRoleArn;

  /// The code artifact for this version.
  final CodeArtifact codeArtifact;

  /// The timestamp when the version was created.
  final DateTime createdAt;

  /// The ARN of the MicroVM image.
  final String imageArn;

  /// The version of the MicroVM image.
  final String imageVersion;

  /// The current state of the version.
  final MicrovmImageVersionState state;

  /// The availability status of the version: ACTIVE (can be used by RunMicrovm)
  /// or INACTIVE (blocked from launching new MicroVMs).
  final MicrovmImageVersionStatus status;

  /// Additional OS capabilities granted to the MicroVM runtime environment.
  final List<Capability>? additionalOsCapabilities;

  /// The specific version of the base MicroVM image.
  final String? baseImageVersion;

  /// The list of supported CPU configurations for the MicroVM.
  final List<CpuConfiguration>? cpuConfigurations;

  /// The description of the version.
  final String? description;

  /// The list of egress network connectors available to the MicroVM at runtime.
  final List<String>? egressNetworkConnectors;

  /// Environment variables set in the MicroVM runtime environment.
  final Map<String, String>? environmentVariables;
  final Hooks? hooks;

  /// The logging configuration for this version.
  final Logging? logging;

  /// The resource requirements for the MicroVM.
  final List<Resources>? resources;

  /// The reason for the current state. For example, one or more builds failed.
  final String? stateReason;

  /// Key-value pairs associated with the version.
  final Map<String, String>? tags;

  /// The timestamp when the version was last updated.
  final DateTime? updatedAt;

  UpdateMicrovmImageVersionResponse({
    required this.baseImageArn,
    required this.buildRoleArn,
    required this.codeArtifact,
    required this.createdAt,
    required this.imageArn,
    required this.imageVersion,
    required this.state,
    required this.status,
    this.additionalOsCapabilities,
    this.baseImageVersion,
    this.cpuConfigurations,
    this.description,
    this.egressNetworkConnectors,
    this.environmentVariables,
    this.hooks,
    this.logging,
    this.resources,
    this.stateReason,
    this.tags,
    this.updatedAt,
  });

  factory UpdateMicrovmImageVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateMicrovmImageVersionResponse(
      baseImageArn: (json['baseImageArn'] as String?) ?? '',
      buildRoleArn: (json['buildRoleArn'] as String?) ?? '',
      codeArtifact: CodeArtifact.fromJson(
          (json['codeArtifact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      state:
          MicrovmImageVersionState.fromString((json['state'] as String?) ?? ''),
      status: MicrovmImageVersionStatus.fromString(
          (json['status'] as String?) ?? ''),
      additionalOsCapabilities: (json['additionalOsCapabilities'] as List?)
          ?.nonNulls
          .map((e) => Capability.fromString((e as String)))
          .toList(),
      baseImageVersion: json['baseImageVersion'] as String?,
      cpuConfigurations: (json['cpuConfigurations'] as List?)
          ?.nonNulls
          .map((e) => CpuConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      egressNetworkConnectors: (json['egressNetworkConnectors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      environmentVariables:
          (json['environmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      hooks: json['hooks'] != null
          ? Hooks.fromJson(json['hooks'] as Map<String, dynamic>)
          : null,
      logging: json['logging'] != null
          ? Logging.fromJson(json['logging'] as Map<String, dynamic>)
          : null,
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => Resources.fromJson(e as Map<String, dynamic>))
          .toList(),
      stateReason: json['stateReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final baseImageArn = this.baseImageArn;
    final buildRoleArn = this.buildRoleArn;
    final codeArtifact = this.codeArtifact;
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final state = this.state;
    final status = this.status;
    final additionalOsCapabilities = this.additionalOsCapabilities;
    final baseImageVersion = this.baseImageVersion;
    final cpuConfigurations = this.cpuConfigurations;
    final description = this.description;
    final egressNetworkConnectors = this.egressNetworkConnectors;
    final environmentVariables = this.environmentVariables;
    final hooks = this.hooks;
    final logging = this.logging;
    final resources = this.resources;
    final stateReason = this.stateReason;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'baseImageArn': baseImageArn,
      'buildRoleArn': buildRoleArn,
      'codeArtifact': codeArtifact,
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      'state': state.value,
      'status': status.value,
      if (additionalOsCapabilities != null)
        'additionalOsCapabilities':
            additionalOsCapabilities.map((e) => e.value).toList(),
      if (baseImageVersion != null) 'baseImageVersion': baseImageVersion,
      if (cpuConfigurations != null) 'cpuConfigurations': cpuConfigurations,
      if (description != null) 'description': description,
      if (egressNetworkConnectors != null)
        'egressNetworkConnectors': egressNetworkConnectors,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (hooks != null) 'hooks': hooks,
      if (logging != null) 'logging': logging,
      if (resources != null) 'resources': resources,
      if (stateReason != null) 'stateReason': stateReason,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// @nodoc
class RunMicrovmResponse {
  /// The HTTPS endpoint URL for communicating with the MicroVM. Include a valid
  /// authentication token in the X-aws-proxy-auth header when sending requests.
  final String endpoint;

  /// The ARN of the MicroVM image used to run this MicroVM.
  final String imageArn;

  /// The version of the MicroVM image used to run this MicroVM.
  final String imageVersion;

  /// The maximum duration in seconds that the MicroVM can exist.
  final int maximumDurationInSeconds;

  /// The unique identifier of the MicroVM.
  final String microvmId;

  /// The timestamp when the MicroVM first started.
  final DateTime startedAt;

  /// The current lifecycle state of the MicroVM.
  final MicrovmState state;

  /// The list of egress network connectors configured for the MicroVM.
  final List<String>? egressNetworkConnectors;

  /// The ARN of the IAM execution role assumed by the MicroVM.
  final String? executionRoleArn;

  /// The idle policy configuration of the MicroVM.
  final IdlePolicy? idlePolicy;

  /// The list of ingress network connectors configured for the MicroVM.
  final List<String>? ingressNetworkConnectors;

  /// The reason for why the MicroVM is in the current state.
  final String? stateReason;

  /// The timestamp when the MicroVM terminated.
  final DateTime? terminatedAt;

  RunMicrovmResponse({
    required this.endpoint,
    required this.imageArn,
    required this.imageVersion,
    required this.maximumDurationInSeconds,
    required this.microvmId,
    required this.startedAt,
    required this.state,
    this.egressNetworkConnectors,
    this.executionRoleArn,
    this.idlePolicy,
    this.ingressNetworkConnectors,
    this.stateReason,
    this.terminatedAt,
  });

  factory RunMicrovmResponse.fromJson(Map<String, dynamic> json) {
    return RunMicrovmResponse(
      endpoint: (json['endpoint'] as String?) ?? '',
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      maximumDurationInSeconds: (json['maximumDurationInSeconds'] as int?) ?? 0,
      microvmId: (json['microvmId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      state: MicrovmState.fromString((json['state'] as String?) ?? ''),
      egressNetworkConnectors: (json['egressNetworkConnectors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      executionRoleArn: json['executionRoleArn'] as String?,
      idlePolicy: json['idlePolicy'] != null
          ? IdlePolicy.fromJson(json['idlePolicy'] as Map<String, dynamic>)
          : null,
      ingressNetworkConnectors: (json['ingressNetworkConnectors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stateReason: json['stateReason'] as String?,
      terminatedAt: timeStampFromJson(json['terminatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final maximumDurationInSeconds = this.maximumDurationInSeconds;
    final microvmId = this.microvmId;
    final startedAt = this.startedAt;
    final state = this.state;
    final egressNetworkConnectors = this.egressNetworkConnectors;
    final executionRoleArn = this.executionRoleArn;
    final idlePolicy = this.idlePolicy;
    final ingressNetworkConnectors = this.ingressNetworkConnectors;
    final stateReason = this.stateReason;
    final terminatedAt = this.terminatedAt;
    return {
      'endpoint': endpoint,
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      'maximumDurationInSeconds': maximumDurationInSeconds,
      'microvmId': microvmId,
      'startedAt': unixTimestampToJson(startedAt),
      'state': state.value,
      if (egressNetworkConnectors != null)
        'egressNetworkConnectors': egressNetworkConnectors,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (idlePolicy != null) 'idlePolicy': idlePolicy,
      if (ingressNetworkConnectors != null)
        'ingressNetworkConnectors': ingressNetworkConnectors,
      if (stateReason != null) 'stateReason': stateReason,
      if (terminatedAt != null)
        'terminatedAt': unixTimestampToJson(terminatedAt),
    };
  }
}

/// @nodoc
class GetMicrovmResponse {
  /// The HTTPS endpoint URL for communicating with the MicroVM. Include a valid
  /// authentication token in the X-aws-proxy-auth header when sending requests.
  final String endpoint;

  /// The ARN of the MicroVM image used to run this MicroVM.
  final String imageArn;

  /// The version of the MicroVM image used to run this MicroVM.
  final String imageVersion;

  /// The maximum duration in seconds that the MicroVM can exist before being
  /// terminated by the platform.
  final int maximumDurationInSeconds;

  /// The unique identifier of the MicroVM.
  final String microvmId;

  /// The timestamp when the MicroVM first started.
  final DateTime startedAt;

  /// The current lifecycle state of the MicroVM.
  final MicrovmState state;

  /// The list of egress network connectors configured for the MicroVM.
  final List<String>? egressNetworkConnectors;

  /// The ARN of the IAM execution role assumed by the MicroVM.
  final String? executionRoleArn;

  /// The idle policy configuration of the MicroVM, controlling auto-suspend and
  /// auto-resume behavior.
  final IdlePolicy? idlePolicy;

  /// The list of ingress network connectors configured for the MicroVM.
  final List<String>? ingressNetworkConnectors;

  /// The reason for why the MicroVM is in the current state.
  final String? stateReason;

  /// The timestamp when the MicroVM terminated.
  final DateTime? terminatedAt;

  GetMicrovmResponse({
    required this.endpoint,
    required this.imageArn,
    required this.imageVersion,
    required this.maximumDurationInSeconds,
    required this.microvmId,
    required this.startedAt,
    required this.state,
    this.egressNetworkConnectors,
    this.executionRoleArn,
    this.idlePolicy,
    this.ingressNetworkConnectors,
    this.stateReason,
    this.terminatedAt,
  });

  factory GetMicrovmResponse.fromJson(Map<String, dynamic> json) {
    return GetMicrovmResponse(
      endpoint: (json['endpoint'] as String?) ?? '',
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      maximumDurationInSeconds: (json['maximumDurationInSeconds'] as int?) ?? 0,
      microvmId: (json['microvmId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      state: MicrovmState.fromString((json['state'] as String?) ?? ''),
      egressNetworkConnectors: (json['egressNetworkConnectors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      executionRoleArn: json['executionRoleArn'] as String?,
      idlePolicy: json['idlePolicy'] != null
          ? IdlePolicy.fromJson(json['idlePolicy'] as Map<String, dynamic>)
          : null,
      ingressNetworkConnectors: (json['ingressNetworkConnectors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      stateReason: json['stateReason'] as String?,
      terminatedAt: timeStampFromJson(json['terminatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final maximumDurationInSeconds = this.maximumDurationInSeconds;
    final microvmId = this.microvmId;
    final startedAt = this.startedAt;
    final state = this.state;
    final egressNetworkConnectors = this.egressNetworkConnectors;
    final executionRoleArn = this.executionRoleArn;
    final idlePolicy = this.idlePolicy;
    final ingressNetworkConnectors = this.ingressNetworkConnectors;
    final stateReason = this.stateReason;
    final terminatedAt = this.terminatedAt;
    return {
      'endpoint': endpoint,
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      'maximumDurationInSeconds': maximumDurationInSeconds,
      'microvmId': microvmId,
      'startedAt': unixTimestampToJson(startedAt),
      'state': state.value,
      if (egressNetworkConnectors != null)
        'egressNetworkConnectors': egressNetworkConnectors,
      if (executionRoleArn != null) 'executionRoleArn': executionRoleArn,
      if (idlePolicy != null) 'idlePolicy': idlePolicy,
      if (ingressNetworkConnectors != null)
        'ingressNetworkConnectors': ingressNetworkConnectors,
      if (stateReason != null) 'stateReason': stateReason,
      if (terminatedAt != null)
        'terminatedAt': unixTimestampToJson(terminatedAt),
    };
  }
}

/// @nodoc
class TerminateMicrovmResponse {
  TerminateMicrovmResponse();

  factory TerminateMicrovmResponse.fromJson(Map<String, dynamic> _) {
    return TerminateMicrovmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListMicrovmsResponse {
  /// The list of MicroVMs.
  final List<MicrovmItem> items;

  /// The pagination token to use in a subsequent request to retrieve the next
  /// page of results. This value is null when there are no more results to
  /// return.
  final String? nextToken;

  ListMicrovmsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListMicrovmsResponse.fromJson(Map<String, dynamic> json) {
    return ListMicrovmsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => MicrovmItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateMicrovmAuthTokenResponse {
  /// A map containing the authentication token. Use the value at key
  /// "X-aws-proxy-auth" as the header value when connecting to the MicroVM
  /// endpoint.
  final Map<String, String> authToken;

  CreateMicrovmAuthTokenResponse({
    required this.authToken,
  });

  factory CreateMicrovmAuthTokenResponse.fromJson(Map<String, dynamic> json) {
    return CreateMicrovmAuthTokenResponse(
      authToken: ((json['authToken'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final authToken = this.authToken;
    return {
      'authToken': authToken,
    };
  }
}

/// @nodoc
class CreateMicrovmShellAuthTokenResponse {
  /// The generated shell authentication token key-value pairs for accessing the
  /// MicroVM.
  final Map<String, String> authToken;

  CreateMicrovmShellAuthTokenResponse({
    required this.authToken,
  });

  factory CreateMicrovmShellAuthTokenResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMicrovmShellAuthTokenResponse(
      authToken: ((json['authToken'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final authToken = this.authToken;
    return {
      'authToken': authToken,
    };
  }
}

/// @nodoc
class ResumeMicrovmResponse {
  ResumeMicrovmResponse();

  factory ResumeMicrovmResponse.fromJson(Map<String, dynamic> _) {
    return ResumeMicrovmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class SuspendMicrovmResponse {
  SuspendMicrovmResponse();

  factory SuspendMicrovmResponse.fromJson(Map<String, dynamic> _) {
    return SuspendMicrovmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies which ports are accessible on a MicroVM. Only one of the port
/// specification options can be set.
///
/// @nodoc
class PortSpecification {
  /// Indicates that all ports are accessible.
  final Unit? allPorts;

  /// A single port number.
  final int? port;

  /// A range of ports.
  final PortRange? range;

  PortSpecification({
    this.allPorts,
    this.port,
    this.range,
  });

  Map<String, dynamic> toJson() {
    final allPorts = this.allPorts;
    final port = this.port;
    final range = this.range;
    return {
      if (allPorts != null) 'allPorts': allPorts,
      if (port != null) 'port': port,
      if (range != null) 'range': range,
    };
  }
}

/// Specifies a range of ports.
///
/// @nodoc
class PortRange {
  /// The ending port number of the range.
  final int endPort;

  /// The starting port number of the range.
  final int startPort;

  PortRange({
    required this.endPort,
    required this.startPort,
  });

  Map<String, dynamic> toJson() {
    final endPort = this.endPort;
    final startPort = this.startPort;
    return {
      'endPort': endPort,
      'startPort': startPort,
    };
  }
}

/// Contains summary information about a MicroVM instance.
///
/// @nodoc
class MicrovmItem {
  /// The ARN of the MicroVM image used to run this MicroVM.
  final String imageArn;

  /// The version of the MicroVM image used to run this MicroVM.
  final String imageVersion;

  /// The unique identifier of the MicroVM.
  final String microvmId;

  /// The timestamp when the MicroVM started.
  final DateTime startedAt;

  /// The current lifecycle state of the MicroVM.
  final MicrovmState state;

  MicrovmItem({
    required this.imageArn,
    required this.imageVersion,
    required this.microvmId,
    required this.startedAt,
    required this.state,
  });

  factory MicrovmItem.fromJson(Map<String, dynamic> json) {
    return MicrovmItem(
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      microvmId: (json['microvmId'] as String?) ?? '',
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] ?? 0),
      state: MicrovmState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final microvmId = this.microvmId;
    final startedAt = this.startedAt;
    final state = this.state;
    return {
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      'microvmId': microvmId,
      'startedAt': unixTimestampToJson(startedAt),
      'state': state.value,
    };
  }
}

/// The lifecycle state of a MicroVm.
///
/// @nodoc
class MicrovmState {
  static const pending = MicrovmState._('PENDING');
  static const running = MicrovmState._('RUNNING');
  static const suspending = MicrovmState._('SUSPENDING');
  static const suspended = MicrovmState._('SUSPENDED');
  static const terminating = MicrovmState._('TERMINATING');
  static const terminated = MicrovmState._('TERMINATED');

  final String value;

  const MicrovmState._(this.value);

  static const values = [
    pending,
    running,
    suspending,
    suspended,
    terminating,
    terminated
  ];

  static MicrovmState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MicrovmState._(value));

  @override
  bool operator ==(other) => other is MicrovmState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration that controls MicroVM auto-suspend and auto-resume behavior.
/// Idle time is measured by inbound traffic through the MicroVM proxy endpoint
/// — if no requests arrive within the configured duration, the MicroVM is
/// suspended.
///
/// @nodoc
class IdlePolicy {
  /// Indicates whether the MicroVM automatically resumes when it receives a
  /// request while suspended.
  final bool autoResumeEnabled;

  /// The maximum time in seconds that a MicroVM can remain idle before it is
  /// automatically suspended.
  final int maxIdleDurationSeconds;

  /// The maximum time in seconds that a MicroVM can remain suspended before it is
  /// automatically terminated.
  final int suspendedDurationSeconds;

  IdlePolicy({
    required this.autoResumeEnabled,
    required this.maxIdleDurationSeconds,
    required this.suspendedDurationSeconds,
  });

  factory IdlePolicy.fromJson(Map<String, dynamic> json) {
    return IdlePolicy(
      autoResumeEnabled: (json['autoResumeEnabled'] as bool?) ?? false,
      maxIdleDurationSeconds: (json['maxIdleDurationSeconds'] as int?) ?? 0,
      suspendedDurationSeconds: (json['suspendedDurationSeconds'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final autoResumeEnabled = this.autoResumeEnabled;
    final maxIdleDurationSeconds = this.maxIdleDurationSeconds;
    final suspendedDurationSeconds = this.suspendedDurationSeconds;
    return {
      'autoResumeEnabled': autoResumeEnabled,
      'maxIdleDurationSeconds': maxIdleDurationSeconds,
      'suspendedDurationSeconds': suspendedDurationSeconds,
    };
  }
}

/// Configuration for MicroVM logging output. Specify exactly one: cloudWatch to
/// enable CloudWatch logging, or disabled to turn off logging.
///
/// @nodoc
class Logging {
  /// Configuration for sending logs to Amazon CloudWatch Logs.
  final CloudWatchLogging? cloudWatch;

  /// Specifies that logging is disabled.
  final LoggingDisabled? disabled;

  Logging({
    this.cloudWatch,
    this.disabled,
  });

  factory Logging.fromJson(Map<String, dynamic> json) {
    return Logging(
      cloudWatch: json['cloudWatch'] != null
          ? CloudWatchLogging.fromJson(
              json['cloudWatch'] as Map<String, dynamic>)
          : null,
      disabled: json['disabled'] != null
          ? LoggingDisabled.fromJson(json['disabled'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatch = this.cloudWatch;
    final disabled = this.disabled;
    return {
      if (cloudWatch != null) 'cloudWatch': cloudWatch,
      if (disabled != null) 'disabled': disabled,
    };
  }
}

/// Specifies that logging is disabled for the MicroVM.
///
/// @nodoc
class LoggingDisabled {
  LoggingDisabled();

  factory LoggingDisabled.fromJson(Map<String, dynamic> _) {
    return LoggingDisabled();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configuration for Amazon CloudWatch Logs logging.
///
/// @nodoc
class CloudWatchLogging {
  /// The name of the CloudWatch Logs log group to send logs to.
  final String? logGroup;

  /// The name of the CloudWatch Logs log stream within the log group.
  final String? logStream;

  CloudWatchLogging({
    this.logGroup,
    this.logStream,
  });

  factory CloudWatchLogging.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogging(
      logGroup: json['logGroup'] as String?,
      logStream: json['logStream'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroup = this.logGroup;
    final logStream = this.logStream;
    return {
      if (logGroup != null) 'logGroup': logGroup,
      if (logStream != null) 'logStream': logStream,
    };
  }
}

/// Contains the location of the code artifact for a MicroVM image.
///
/// @nodoc
class CodeArtifact {
  /// The URI of the code artifact, such as an Amazon S3 path or Amazon ECR image
  /// URI.
  final String? uri;

  CodeArtifact({
    this.uri,
  });

  factory CodeArtifact.fromJson(Map<String, dynamic> json) {
    return CodeArtifact(
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      if (uri != null) 'uri': uri,
    };
  }
}

/// Lifecycle hook configuration for MicroVMs and MicroVM images.
///
/// @nodoc
class Hooks {
  /// The lifecycle hooks for MicroVM events.
  final MicrovmHooks? microvmHooks;

  /// The hooks for MicroVM image build events.
  final MicrovmImageHooks? microvmImageHooks;

  /// The port number on which the hooks listener runs.
  final int? port;

  Hooks({
    this.microvmHooks,
    this.microvmImageHooks,
    this.port,
  });

  factory Hooks.fromJson(Map<String, dynamic> json) {
    return Hooks(
      microvmHooks: json['microvmHooks'] != null
          ? MicrovmHooks.fromJson(json['microvmHooks'] as Map<String, dynamic>)
          : null,
      microvmImageHooks: json['microvmImageHooks'] != null
          ? MicrovmImageHooks.fromJson(
              json['microvmImageHooks'] as Map<String, dynamic>)
          : null,
      port: json['port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final microvmHooks = this.microvmHooks;
    final microvmImageHooks = this.microvmImageHooks;
    final port = this.port;
    return {
      if (microvmHooks != null) 'microvmHooks': microvmHooks,
      if (microvmImageHooks != null) 'microvmImageHooks': microvmImageHooks,
      if (port != null) 'port': port,
    };
  }
}

/// @nodoc
class MicrovmImageVersionState {
  static const pending = MicrovmImageVersionState._('PENDING');
  static const inProgress = MicrovmImageVersionState._('IN_PROGRESS');
  static const successful = MicrovmImageVersionState._('SUCCESSFUL');
  static const failed = MicrovmImageVersionState._('FAILED');
  static const deleting = MicrovmImageVersionState._('DELETING');
  static const deleted = MicrovmImageVersionState._('DELETED');
  static const deleteFailed = MicrovmImageVersionState._('DELETE_FAILED');

  final String value;

  const MicrovmImageVersionState._(this.value);

  static const values = [
    pending,
    inProgress,
    successful,
    failed,
    deleting,
    deleted,
    deleteFailed
  ];

  static MicrovmImageVersionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MicrovmImageVersionState._(value));

  @override
  bool operator ==(other) =>
      other is MicrovmImageVersionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MicrovmImageVersionStatus {
  static const active = MicrovmImageVersionStatus._('ACTIVE');
  static const inactive = MicrovmImageVersionStatus._('INACTIVE');

  final String value;

  const MicrovmImageVersionStatus._(this.value);

  static const values = [active, inactive];

  static MicrovmImageVersionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MicrovmImageVersionStatus._(value));

  @override
  bool operator ==(other) =>
      other is MicrovmImageVersionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for lifecycle hooks invoked during MicroVM events such as run,
/// resume, suspend, and terminate.
///
/// @nodoc
class MicrovmHooks {
  /// The path of the hook invoked when the MicroVM resumes from a suspended
  /// state.
  final HookState? resume;

  /// The maximum time in seconds for the resume hook to complete.
  final int? resumeTimeoutInSeconds;

  /// The path of the hook invoked when the MicroVM starts running.
  final HookState? run;

  /// The maximum time in seconds for the run hook to complete.
  final int? runTimeoutInSeconds;

  /// The path of the hook invoked when the MicroVM is suspended.
  final HookState? suspend;

  /// The maximum time in seconds for the suspend hook to complete.
  final int? suspendTimeoutInSeconds;

  /// The path of the hook invoked when the MicroVM is terminated.
  final HookState? terminate;

  /// The maximum time in seconds for the terminate hook to complete.
  final int? terminateTimeoutInSeconds;

  MicrovmHooks({
    this.resume,
    this.resumeTimeoutInSeconds,
    this.run,
    this.runTimeoutInSeconds,
    this.suspend,
    this.suspendTimeoutInSeconds,
    this.terminate,
    this.terminateTimeoutInSeconds,
  });

  factory MicrovmHooks.fromJson(Map<String, dynamic> json) {
    return MicrovmHooks(
      resume: (json['resume'] as String?)?.let(HookState.fromString),
      resumeTimeoutInSeconds: json['resumeTimeoutInSeconds'] as int?,
      run: (json['run'] as String?)?.let(HookState.fromString),
      runTimeoutInSeconds: json['runTimeoutInSeconds'] as int?,
      suspend: (json['suspend'] as String?)?.let(HookState.fromString),
      suspendTimeoutInSeconds: json['suspendTimeoutInSeconds'] as int?,
      terminate: (json['terminate'] as String?)?.let(HookState.fromString),
      terminateTimeoutInSeconds: json['terminateTimeoutInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final resume = this.resume;
    final resumeTimeoutInSeconds = this.resumeTimeoutInSeconds;
    final run = this.run;
    final runTimeoutInSeconds = this.runTimeoutInSeconds;
    final suspend = this.suspend;
    final suspendTimeoutInSeconds = this.suspendTimeoutInSeconds;
    final terminate = this.terminate;
    final terminateTimeoutInSeconds = this.terminateTimeoutInSeconds;
    return {
      if (resume != null) 'resume': resume.value,
      if (resumeTimeoutInSeconds != null)
        'resumeTimeoutInSeconds': resumeTimeoutInSeconds,
      if (run != null) 'run': run.value,
      if (runTimeoutInSeconds != null)
        'runTimeoutInSeconds': runTimeoutInSeconds,
      if (suspend != null) 'suspend': suspend.value,
      if (suspendTimeoutInSeconds != null)
        'suspendTimeoutInSeconds': suspendTimeoutInSeconds,
      if (terminate != null) 'terminate': terminate.value,
      if (terminateTimeoutInSeconds != null)
        'terminateTimeoutInSeconds': terminateTimeoutInSeconds,
    };
  }
}

/// Configuration for hooks invoked during MicroVM image build events such as
/// ready and validate.
///
/// @nodoc
class MicrovmImageHooks {
  /// The path of the hook invoked when the MicroVM image build is ready.
  final HookState? ready;

  /// The maximum time in seconds for the ready hook to complete.
  final int? readyTimeoutInSeconds;

  /// The path of the hook invoked to validate the MicroVM image build.
  final HookState? validate;

  /// The maximum time in seconds for the validate hook to complete.
  final int? validateTimeoutInSeconds;

  MicrovmImageHooks({
    this.ready,
    this.readyTimeoutInSeconds,
    this.validate,
    this.validateTimeoutInSeconds,
  });

  factory MicrovmImageHooks.fromJson(Map<String, dynamic> json) {
    return MicrovmImageHooks(
      ready: (json['ready'] as String?)?.let(HookState.fromString),
      readyTimeoutInSeconds: json['readyTimeoutInSeconds'] as int?,
      validate: (json['validate'] as String?)?.let(HookState.fromString),
      validateTimeoutInSeconds: json['validateTimeoutInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final ready = this.ready;
    final readyTimeoutInSeconds = this.readyTimeoutInSeconds;
    final validate = this.validate;
    final validateTimeoutInSeconds = this.validateTimeoutInSeconds;
    return {
      if (ready != null) 'ready': ready.value,
      if (readyTimeoutInSeconds != null)
        'readyTimeoutInSeconds': readyTimeoutInSeconds,
      if (validate != null) 'validate': validate.value,
      if (validateTimeoutInSeconds != null)
        'validateTimeoutInSeconds': validateTimeoutInSeconds,
    };
  }
}

/// Whether invocation hooks are enabled or disabled on a MicroVm.
///
/// @nodoc
class HookState {
  static const disabled = HookState._('DISABLED');
  static const enabled = HookState._('ENABLED');

  final String value;

  const HookState._(this.value);

  static const values = [disabled, enabled];

  static HookState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => HookState._(value));

  @override
  bool operator ==(other) => other is HookState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Capability granted to the application when booted
///
/// @nodoc
class Capability {
  static const all = Capability._('ALL');

  final String value;

  const Capability._(this.value);

  static const values = [all];

  static Capability fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Capability._(value));

  @override
  bool operator ==(other) => other is Capability && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Resource requirements for a MicroVM.
///
/// @nodoc
class Resources {
  /// The minimum amount of memory in MiB to allocate to the MicroVM.
  final int minimumMemoryInMiB;

  Resources({
    required this.minimumMemoryInMiB,
  });

  factory Resources.fromJson(Map<String, dynamic> json) {
    return Resources(
      minimumMemoryInMiB: (json['minimumMemoryInMiB'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final minimumMemoryInMiB = this.minimumMemoryInMiB;
    return {
      'minimumMemoryInMiB': minimumMemoryInMiB,
    };
  }
}

/// Configuration for the CPU architecture of a MicroVM.
///
/// @nodoc
class CpuConfiguration {
  /// The CPU architecture.
  final Architecture architecture;

  CpuConfiguration({
    required this.architecture,
  });

  factory CpuConfiguration.fromJson(Map<String, dynamic> json) {
    return CpuConfiguration(
      architecture:
          Architecture.fromString((json['architecture'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    return {
      'architecture': architecture.value,
    };
  }
}

/// @nodoc
class Architecture {
  static const arm_64 = Architecture._('ARM_64');

  final String value;

  const Architecture._(this.value);

  static const values = [arm_64];

  static Architecture fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Architecture._(value));

  @override
  bool operator ==(other) => other is Architecture && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MicrovmImageState {
  static const creating = MicrovmImageState._('CREATING');
  static const created = MicrovmImageState._('CREATED');
  static const createFailed = MicrovmImageState._('CREATE_FAILED');
  static const updating = MicrovmImageState._('UPDATING');
  static const updated = MicrovmImageState._('UPDATED');
  static const updateFailed = MicrovmImageState._('UPDATE_FAILED');
  static const deleting = MicrovmImageState._('DELETING');
  static const deleteFailed = MicrovmImageState._('DELETE_FAILED');
  static const deleted = MicrovmImageState._('DELETED');

  final String value;

  const MicrovmImageState._(this.value);

  static const values = [
    creating,
    created,
    createFailed,
    updating,
    updated,
    updateFailed,
    deleting,
    deleteFailed,
    deleted
  ];

  static MicrovmImageState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MicrovmImageState._(value));

  @override
  bool operator ==(other) => other is MicrovmImageState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains summary information about a version of a MicroVM image.
///
/// @nodoc
class MicrovmImageVersionSummary {
  /// The ARN of the base MicroVM image used.
  final String baseImageArn;

  /// The ARN of the IAM build role.
  final String buildRoleArn;

  /// The code artifact for this version.
  final CodeArtifact codeArtifact;

  /// The timestamp when the version was created.
  final DateTime createdAt;

  /// The ARN of the MicroVM image.
  final String imageArn;

  /// The version of the MicroVM image.
  final String imageVersion;

  /// The current state of the version.
  final MicrovmImageVersionState state;

  /// The availability status of the version: ACTIVE (can be used by RunMicrovm)
  /// or INACTIVE (blocked from launching new MicroVMs).
  final MicrovmImageVersionStatus status;

  /// Additional OS capabilities granted to the MicroVM runtime environment.
  final List<Capability>? additionalOsCapabilities;

  /// The specific version of the base MicroVM image.
  final String? baseImageVersion;

  /// The list of supported CPU configurations for the MicroVM.
  final List<CpuConfiguration>? cpuConfigurations;

  /// The description of the version.
  final String? description;

  /// The list of egress network connectors available to the MicroVM at runtime.
  final List<String>? egressNetworkConnectors;

  /// Environment variables set in the MicroVM runtime environment.
  final Map<String, String>? environmentVariables;
  final Hooks? hooks;

  /// The logging configuration for this version.
  final Logging? logging;

  /// The resource requirements for the MicroVM.
  final List<Resources>? resources;

  /// The reason for the current state. For example, one or more builds failed.
  final String? stateReason;

  /// Key-value pairs associated with the version.
  final Map<String, String>? tags;

  /// The timestamp when the version was last updated.
  final DateTime? updatedAt;

  MicrovmImageVersionSummary({
    required this.baseImageArn,
    required this.buildRoleArn,
    required this.codeArtifact,
    required this.createdAt,
    required this.imageArn,
    required this.imageVersion,
    required this.state,
    required this.status,
    this.additionalOsCapabilities,
    this.baseImageVersion,
    this.cpuConfigurations,
    this.description,
    this.egressNetworkConnectors,
    this.environmentVariables,
    this.hooks,
    this.logging,
    this.resources,
    this.stateReason,
    this.tags,
    this.updatedAt,
  });

  factory MicrovmImageVersionSummary.fromJson(Map<String, dynamic> json) {
    return MicrovmImageVersionSummary(
      baseImageArn: (json['baseImageArn'] as String?) ?? '',
      buildRoleArn: (json['buildRoleArn'] as String?) ?? '',
      codeArtifact: CodeArtifact.fromJson(
          (json['codeArtifact'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      state:
          MicrovmImageVersionState.fromString((json['state'] as String?) ?? ''),
      status: MicrovmImageVersionStatus.fromString(
          (json['status'] as String?) ?? ''),
      additionalOsCapabilities: (json['additionalOsCapabilities'] as List?)
          ?.nonNulls
          .map((e) => Capability.fromString((e as String)))
          .toList(),
      baseImageVersion: json['baseImageVersion'] as String?,
      cpuConfigurations: (json['cpuConfigurations'] as List?)
          ?.nonNulls
          .map((e) => CpuConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      egressNetworkConnectors: (json['egressNetworkConnectors'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      environmentVariables:
          (json['environmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      hooks: json['hooks'] != null
          ? Hooks.fromJson(json['hooks'] as Map<String, dynamic>)
          : null,
      logging: json['logging'] != null
          ? Logging.fromJson(json['logging'] as Map<String, dynamic>)
          : null,
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => Resources.fromJson(e as Map<String, dynamic>))
          .toList(),
      stateReason: json['stateReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final baseImageArn = this.baseImageArn;
    final buildRoleArn = this.buildRoleArn;
    final codeArtifact = this.codeArtifact;
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final state = this.state;
    final status = this.status;
    final additionalOsCapabilities = this.additionalOsCapabilities;
    final baseImageVersion = this.baseImageVersion;
    final cpuConfigurations = this.cpuConfigurations;
    final description = this.description;
    final egressNetworkConnectors = this.egressNetworkConnectors;
    final environmentVariables = this.environmentVariables;
    final hooks = this.hooks;
    final logging = this.logging;
    final resources = this.resources;
    final stateReason = this.stateReason;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'baseImageArn': baseImageArn,
      'buildRoleArn': buildRoleArn,
      'codeArtifact': codeArtifact,
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      'state': state.value,
      'status': status.value,
      if (additionalOsCapabilities != null)
        'additionalOsCapabilities':
            additionalOsCapabilities.map((e) => e.value).toList(),
      if (baseImageVersion != null) 'baseImageVersion': baseImageVersion,
      if (cpuConfigurations != null) 'cpuConfigurations': cpuConfigurations,
      if (description != null) 'description': description,
      if (egressNetworkConnectors != null)
        'egressNetworkConnectors': egressNetworkConnectors,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (hooks != null) 'hooks': hooks,
      if (logging != null) 'logging': logging,
      if (resources != null) 'resources': resources,
      if (stateReason != null) 'stateReason': stateReason,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Contains summary information about a MicroVM image.
///
/// @nodoc
class MicrovmImageSummary {
  /// The timestamp when the MicroVM image was created.
  final DateTime createdAt;

  /// The ARN of the MicroVM image.
  final String imageArn;

  /// The name of the MicroVM image.
  final String name;

  /// The current state of the MicroVM image.
  final MicrovmImageState state;

  /// The latest active version of the MicroVM image.
  final String? latestActiveImageVersion;

  /// The latest failed version of the MicroVM image, if any.
  final String? latestFailedImageVersion;

  MicrovmImageSummary({
    required this.createdAt,
    required this.imageArn,
    required this.name,
    required this.state,
    this.latestActiveImageVersion,
    this.latestFailedImageVersion,
  });

  factory MicrovmImageSummary.fromJson(Map<String, dynamic> json) {
    return MicrovmImageSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: MicrovmImageState.fromString((json['state'] as String?) ?? ''),
      latestActiveImageVersion: json['latestActiveImageVersion'] as String?,
      latestFailedImageVersion: json['latestFailedImageVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final name = this.name;
    final state = this.state;
    final latestActiveImageVersion = this.latestActiveImageVersion;
    final latestFailedImageVersion = this.latestFailedImageVersion;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      'name': name,
      'state': state.value,
      if (latestActiveImageVersion != null)
        'latestActiveImageVersion': latestActiveImageVersion,
      if (latestFailedImageVersion != null)
        'latestFailedImageVersion': latestFailedImageVersion,
    };
  }
}

/// Contains summary information about a MicroVM image build.
///
/// @nodoc
class MicrovmImageBuildSummary {
  /// The target CPU architecture for the build. Supported value: ARM_64.
  final Architecture architecture;

  /// The build request ID.
  final String buildId;

  /// The current state of the build.
  final BuildState buildState;

  /// The target chipset for the build.
  final Chipset chipset;

  /// The target chipset generation for the build.
  final String chipsetGeneration;

  /// The timestamp when the build was created.
  final DateTime createdAt;

  /// The ARN of the MicroVM image.
  final String imageArn;

  /// The version of the MicroVM image.
  final String imageVersion;

  /// The reason for the build state, if applicable.
  final String? stateReason;

  MicrovmImageBuildSummary({
    required this.architecture,
    required this.buildId,
    required this.buildState,
    required this.chipset,
    required this.chipsetGeneration,
    required this.createdAt,
    required this.imageArn,
    required this.imageVersion,
    this.stateReason,
  });

  factory MicrovmImageBuildSummary.fromJson(Map<String, dynamic> json) {
    return MicrovmImageBuildSummary(
      architecture:
          Architecture.fromString((json['architecture'] as String?) ?? ''),
      buildId: (json['buildId'] as String?) ?? '',
      buildState: BuildState.fromString((json['buildState'] as String?) ?? ''),
      chipset: Chipset.fromString((json['chipset'] as String?) ?? ''),
      chipsetGeneration: (json['chipsetGeneration'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      stateReason: json['stateReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final buildId = this.buildId;
    final buildState = this.buildState;
    final chipset = this.chipset;
    final chipsetGeneration = this.chipsetGeneration;
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final stateReason = this.stateReason;
    return {
      'architecture': architecture.value,
      'buildId': buildId,
      'buildState': buildState.value,
      'chipset': chipset.value,
      'chipsetGeneration': chipsetGeneration,
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      if (stateReason != null) 'stateReason': stateReason,
    };
  }
}

/// @nodoc
class BuildState {
  static const pending = BuildState._('PENDING');
  static const inProgress = BuildState._('IN_PROGRESS');
  static const successful = BuildState._('SUCCESSFUL');
  static const failed = BuildState._('FAILED');

  final String value;

  const BuildState._(this.value);

  static const values = [pending, inProgress, successful, failed];

  static BuildState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BuildState._(value));

  @override
  bool operator ==(other) => other is BuildState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Chipset {
  static const graviton = Chipset._('GRAVITON');

  final String value;

  const Chipset._(this.value);

  static const values = [graviton];

  static Chipset fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Chipset._(value));

  @override
  bool operator ==(other) => other is Chipset && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains version information for a managed MicroVM image.
///
/// @nodoc
class ManagedMicrovmImageVersion {
  /// The timestamp when the version was created.
  final DateTime createdAt;

  /// The ARN of the managed MicroVM image.
  final String imageArn;

  /// The version of the managed MicroVM image.
  final String imageVersion;

  /// The timestamp when the version was last updated.
  final DateTime? updatedAt;

  ManagedMicrovmImageVersion({
    required this.createdAt,
    required this.imageArn,
    required this.imageVersion,
    this.updatedAt,
  });

  factory ManagedMicrovmImageVersion.fromJson(Map<String, dynamic> json) {
    return ManagedMicrovmImageVersion(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      imageVersion: (json['imageVersion'] as String?) ?? '',
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final imageVersion = this.imageVersion;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      'imageVersion': imageVersion,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Contains summary information about a managed MicroVM image.
///
/// @nodoc
class ManagedMicrovmImageSummary {
  /// The timestamp when the managed MicroVM image was created.
  final DateTime createdAt;

  /// The ARN of the managed MicroVM image.
  final String imageArn;

  /// The timestamp when the managed MicroVM image was last updated.
  final DateTime? updatedAt;

  ManagedMicrovmImageSummary({
    required this.createdAt,
    required this.imageArn,
    this.updatedAt,
  });

  factory ManagedMicrovmImageSummary.fromJson(Map<String, dynamic> json) {
    return ManagedMicrovmImageSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      imageArn: (json['imageArn'] as String?) ?? '',
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final imageArn = this.imageArn;
    final updatedAt = this.updatedAt;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'imageArn': imageArn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Contains size information about a MicroVM image snapshot build.
///
/// @nodoc
class SnapshotBuild {
  /// The size of the installed code in bytes.
  final int? codeInstallSizeInBytes;

  /// The size of the disk snapshot in bytes.
  final int? diskSnapshotSizeInBytes;

  /// The size of the memory snapshot in bytes.
  final int? memorySnapshotSizeInBytes;

  SnapshotBuild({
    this.codeInstallSizeInBytes,
    this.diskSnapshotSizeInBytes,
    this.memorySnapshotSizeInBytes,
  });

  factory SnapshotBuild.fromJson(Map<String, dynamic> json) {
    return SnapshotBuild(
      codeInstallSizeInBytes: json['codeInstallSizeInBytes'] as int?,
      diskSnapshotSizeInBytes: json['diskSnapshotSizeInBytes'] as int?,
      memorySnapshotSizeInBytes: json['memorySnapshotSizeInBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeInstallSizeInBytes = this.codeInstallSizeInBytes;
    final diskSnapshotSizeInBytes = this.diskSnapshotSizeInBytes;
    final memorySnapshotSizeInBytes = this.memorySnapshotSizeInBytes;
    return {
      if (codeInstallSizeInBytes != null)
        'codeInstallSizeInBytes': codeInstallSizeInBytes,
      if (diskSnapshotSizeInBytes != null)
        'diskSnapshotSizeInBytes': diskSnapshotSizeInBytes,
      if (memorySnapshotSizeInBytes != null)
        'memorySnapshotSizeInBytes': memorySnapshotSizeInBytes,
    };
  }
}

/// @nodoc
class Unit {
  Unit();

  Map<String, dynamic> toJson() {
    return {};
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
class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

/// @nodoc
class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
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
class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
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
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
