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

/// <p/>
class GameSparks {
  final _s.RestJsonProtocol _protocol;
  GameSparks({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'gamesparks',
            signingName: 'gamesparks',
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

  /// Creates a new game with an empty configuration. After creating your game,
  /// you can update the configuration using
  /// <code>UpdateGameConfiguration</code> or
  /// <code>ImportGameConfiguration</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [clientToken] :
  /// A client-defined token. With an active client token in the request, this
  /// action is idempotent.
  ///
  /// Parameter [description] :
  /// The description of the game.
  ///
  /// Parameter [tags] :
  /// The list of tags to apply to the game.
  Future<CreateGameResult> createGame({
    required String gameName,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'GameName': gameName,
      if (clientToken != null) 'ClientToken': clientToken,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/game',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGameResult.fromJson(response);
  }

  /// Creates a snapshot of the game configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [description] :
  /// The description of the snapshot.
  Future<CreateSnapshotResult> createSnapshot({
    required String gameName,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/game/${Uri.encodeComponent(gameName)}/snapshot',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSnapshotResult.fromJson(response);
  }

  /// Creates a new stage for stage-by-stage game development and deployment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the role to run the game with. This role
  /// can be a game-defined role or the default role that GameSparks created.
  ///
  /// Parameter [stageName] :
  /// The name of the stage.
  ///
  /// Parameter [clientToken] :
  /// A client-defined token. With an active client token in the request, this
  /// action is idempotent.
  ///
  /// Parameter [description] :
  /// The description of the stage.
  ///
  /// Parameter [tags] :
  /// The list of tags to apply to the stage.
  Future<CreateStageResult> createStage({
    required String gameName,
    required String role,
    required String stageName,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Role': role,
      'StageName': stageName,
      if (clientToken != null) 'ClientToken': clientToken,
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/game/${Uri.encodeComponent(gameName)}/stage',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStageResult.fromJson(response);
  }

  /// Deletes a game.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game to delete.
  Future<void> deleteGame({
    required String gameName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/game/${Uri.encodeComponent(gameName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a stage from a game, along with the associated game runtime.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [stageName] :
  /// The name of the stage to delete.
  Future<void> deleteStage({
    required String gameName,
    required String stageName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/stage/${Uri.encodeComponent(stageName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disconnects a player from the game runtime.
  ///
  /// If a player has multiple connections, this operation attempts to close all
  /// of them.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [playerId] :
  /// The unique identifier representing a player.
  ///
  /// Parameter [stageName] :
  /// The name of the stage.
  Future<DisconnectPlayerResult> disconnectPlayer({
    required String gameName,
    required String playerId,
    required String stageName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/runtime/game/${Uri.encodeComponent(gameName)}/stage/${Uri.encodeComponent(stageName)}/player/${Uri.encodeComponent(playerId)}/disconnect',
      exceptionFnMap: _exceptionFns,
    );
    return DisconnectPlayerResult.fromJson(response);
  }

  /// Exports a game configuration snapshot.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [snapshotId] :
  /// The identifier of the snapshot to export.
  Future<ExportSnapshotResult> exportSnapshot({
    required String gameName,
    required String snapshotId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/snapshot/${Uri.encodeComponent(snapshotId)}/export',
      exceptionFnMap: _exceptionFns,
    );
    return ExportSnapshotResult.fromJson(response);
  }

  /// Gets details about a specified extension.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the extension.
  ///
  /// Parameter [namespace] :
  /// The namespace (qualifier) of the extension.
  Future<GetExtensionResult> getExtension({
    required String name,
    required String namespace,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/extension/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetExtensionResult.fromJson(response);
  }

  /// Gets details about a specified extension version.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [extensionVersion] :
  /// The version of the extension.
  ///
  /// Parameter [name] :
  /// The name of the extension.
  ///
  /// Parameter [namespace] :
  /// The namespace (qualifier) of the extension.
  Future<GetExtensionVersionResult> getExtensionVersion({
    required String extensionVersion,
    required String name,
    required String namespace,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/extension/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/version/${Uri.encodeComponent(extensionVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetExtensionVersionResult.fromJson(response);
  }

  /// Gets details about a game.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  Future<GetGameResult> getGame({
    required String gameName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/game/${Uri.encodeComponent(gameName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGameResult.fromJson(response);
  }

  /// Gets the configuration of the game.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [sections] :
  /// The list of sections to return.
  Future<GetGameConfigurationResult> getGameConfiguration({
    required String gameName,
    List<String>? sections,
  }) async {
    final $query = <String, List<String>>{
      if (sections != null) 'Sections': sections,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/game/${Uri.encodeComponent(gameName)}/configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetGameConfigurationResult.fromJson(response);
  }

  /// Gets details about a job that is generating code for a snapshot.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [jobId] :
  /// The identifier of the code generation job.
  ///
  /// Parameter [snapshotId] :
  /// The identifier of the snapshot for the code generation job.
  Future<GetGeneratedCodeJobResult> getGeneratedCodeJob({
    required String gameName,
    required String jobId,
    required String snapshotId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/snapshot/${Uri.encodeComponent(snapshotId)}/generated-sdk-code-job/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGeneratedCodeJobResult.fromJson(response);
  }

  /// Gets the status of a player's connection to the game runtime.
  ///
  /// It's possible for a single player to have multiple connections to the game
  /// runtime. If a player is not connected, this operation returns an empty
  /// list.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [playerId] :
  /// The unique identifier representing a player.
  ///
  /// Parameter [stageName] :
  /// The name of the stage.
  Future<GetPlayerConnectionStatusResult> getPlayerConnectionStatus({
    required String gameName,
    required String playerId,
    required String stageName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/runtime/game/${Uri.encodeComponent(gameName)}/stage/${Uri.encodeComponent(stageName)}/player/${Uri.encodeComponent(playerId)}/connection',
      exceptionFnMap: _exceptionFns,
    );
    return GetPlayerConnectionStatusResult.fromJson(response);
  }

  /// Gets a copy of the game configuration in a snapshot.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [snapshotId] :
  /// The identifier of the snapshot.
  ///
  /// Parameter [sections] :
  /// The list of game configuration sections to be described.
  Future<GetSnapshotResult> getSnapshot({
    required String gameName,
    required String snapshotId,
    List<String>? sections,
  }) async {
    final $query = <String, List<String>>{
      if (sections != null) 'Sections': sections,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/snapshot/${Uri.encodeComponent(snapshotId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSnapshotResult.fromJson(response);
  }

  /// Gets information about a stage.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [stageName] :
  /// The name of the stage.
  Future<GetStageResult> getStage({
    required String gameName,
    required String stageName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/stage/${Uri.encodeComponent(stageName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStageResult.fromJson(response);
  }

  /// Gets information about a stage deployment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [stageName] :
  /// The name of the stage.
  ///
  /// Parameter [deploymentId] :
  /// The identifier of the stage deployment. <code>StartStageDeployment</code>
  /// returns the identifier that you use here.
  Future<GetStageDeploymentResult> getStageDeployment({
    required String gameName,
    required String stageName,
    String? deploymentId,
  }) async {
    final $query = <String, List<String>>{
      if (deploymentId != null) 'DeploymentId': [deploymentId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/stage/${Uri.encodeComponent(stageName)}/deployment',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetStageDeploymentResult.fromJson(response);
  }

  /// Imports a game configuration.
  ///
  /// This operation replaces the current configuration of the game with the
  /// provided input. This is not a reversible operation. If you want to
  /// preserve the previous configuration, use <code>CreateSnapshot</code> to
  /// make a new snapshot before importing.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [importSource] :
  /// The source used to import configuration sections.
  Future<ImportGameConfigurationResult> importGameConfiguration({
    required String gameName,
    required ImportGameConfigurationSource importSource,
  }) async {
    final $payload = <String, dynamic>{
      'ImportSource': importSource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/game/${Uri.encodeComponent(gameName)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return ImportGameConfigurationResult.fromJson(response);
  }

  /// Gets a paginated list of available versions for the extension.
  ///
  /// Each time an API change is made to an extension, the version is
  /// incremented. The list retrieved by this operation shows the versions that
  /// are currently available.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the extension.
  ///
  /// Parameter [namespace] :
  /// The namespace (qualifier) of the extension.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Use this parameter with NextToken to get results as a set of sequential
  /// pages.
  ///
  /// Parameter [nextToken] :
  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<ListExtensionVersionsResult> listExtensionVersions({
    required String name,
    required String namespace,
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
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/extension/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/version',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListExtensionVersionsResult.fromJson(response);
  }

  /// Gets a paginated list of available extensions.
  ///
  /// Extensions provide features that games can use from scripts.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Use this parameter with NextToken to get results as a set of sequential
  /// pages.
  ///
  /// Parameter [nextToken] :
  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<ListExtensionsResult> listExtensions({
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
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/extension',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListExtensionsResult.fromJson(response);
  }

  /// Gets a paginated list of games.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Use this parameter with NextToken to get results as a set of sequential
  /// pages.
  ///
  /// Parameter [nextToken] :
  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<ListGamesResult> listGames({
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
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/game',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGamesResult.fromJson(response);
  }

  /// Gets a paginated list of code generation jobs for a snapshot.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [snapshotId] :
  /// The identifier of the snapshot.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Use this parameter with NextToken to get results as a set of sequential
  /// pages.
  ///
  /// Parameter [nextToken] :
  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<ListGeneratedCodeJobsResult> listGeneratedCodeJobs({
    required String gameName,
    required String snapshotId,
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
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/snapshot/${Uri.encodeComponent(snapshotId)}/generated-sdk-code-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGeneratedCodeJobsResult.fromJson(response);
  }

  /// Gets a paginated list of snapshot summaries from the game.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Use this parameter with NextToken to get results as a set of sequential
  /// pages.
  ///
  /// Parameter [nextToken] :
  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<ListSnapshotsResult> listSnapshots({
    required String gameName,
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
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/game/${Uri.encodeComponent(gameName)}/snapshot',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSnapshotsResult.fromJson(response);
  }

  /// Gets a paginated list of stage deployment summaries from the game.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [stageName] :
  /// The name of the stage.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Use this parameter with NextToken to get results as a set of sequential
  /// pages.
  ///
  /// Parameter [nextToken] :
  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<ListStageDeploymentsResult> listStageDeployments({
    required String gameName,
    required String stageName,
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
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/stage/${Uri.encodeComponent(stageName)}/deployments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStageDeploymentsResult.fromJson(response);
  }

  /// Gets a paginated list of stage summaries from the game.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Use this parameter with NextToken to get results as a set of sequential
  /// pages.
  ///
  /// Parameter [nextToken] :
  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use the token that is returned with a previous call to this operation. To
  /// start at the beginning of the result set, do not specify a value.
  Future<ListStagesResult> listStages({
    required String gameName,
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
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/game/${Uri.encodeComponent(gameName)}/stage',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStagesResult.fromJson(response);
  }

  /// Lists the tags associated with a GameSparks resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the GameSparks resource.
  Future<ListTagsForResourceResult> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResult.fromJson(response);
  }

  /// Starts an asynchronous process that generates client code for
  /// system-defined and custom messages. The resulting code is collected as a
  /// .zip file and uploaded to a pre-signed Amazon S3 URL.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [generator] :
  /// Properties of the generator to use for the job.
  ///
  /// Parameter [snapshotId] :
  /// The identifier of the snapshot for which to generate code.
  Future<StartGeneratedCodeJobResult> startGeneratedCodeJob({
    required String gameName,
    required Generator generator,
    required String snapshotId,
  }) async {
    final $payload = <String, dynamic>{
      'Generator': generator,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/snapshot/${Uri.encodeComponent(snapshotId)}/generated-sdk-code-job',
      exceptionFnMap: _exceptionFns,
    );
    return StartGeneratedCodeJobResult.fromJson(response);
  }

  /// Deploys a snapshot to the stage and creates a new game runtime.
  ///
  /// After you call this operation, you can check the deployment status by
  /// using <code>GetStageDeployment</code>.
  ///
  /// If there are any players connected to the previous game runtime, then both
  /// runtimes persist. Existing connections to the previous runtime are
  /// maintained. When players disconnect and reconnect, they connect to the new
  /// runtime. After there are no connections to the previous game runtime, it
  /// is deleted.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [snapshotId] :
  /// The identifier of the snapshot to deploy.
  ///
  /// Parameter [stageName] :
  /// The name of the stage to deploy the snapshot onto.
  ///
  /// Parameter [clientToken] :
  /// A client-defined token. With an active client token in the request, this
  /// action is idempotent.
  Future<StartStageDeploymentResult> startStageDeployment({
    required String gameName,
    required String snapshotId,
    required String stageName,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'SnapshotId': snapshotId,
      if (clientToken != null) 'ClientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/stage/${Uri.encodeComponent(stageName)}/deployment',
      exceptionFnMap: _exceptionFns,
    );
    return StartStageDeploymentResult.fromJson(response);
  }

  /// Adds tags to a GameSparks resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to add the tags to.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource.
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a GameSparks resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove the tags from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove.
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates details of the game.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [description] :
  /// The description of the game.
  Future<UpdateGameResult> updateGame({
    required String gameName,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/game/${Uri.encodeComponent(gameName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGameResult.fromJson(response);
  }

  /// Updates one or more sections of the game configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [modifications] :
  /// The list of modifications to make.
  Future<UpdateGameConfigurationResult> updateGameConfiguration({
    required String gameName,
    required List<SectionModification> modifications,
  }) async {
    final $payload = <String, dynamic>{
      'Modifications': modifications,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/game/${Uri.encodeComponent(gameName)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGameConfigurationResult.fromJson(response);
  }

  /// Updates the metadata of a GameSparks snapshot.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [snapshotId] :
  /// The identifier of the snapshot.
  ///
  /// Parameter [description] :
  /// The description of the snapshot.
  Future<UpdateSnapshotResult> updateSnapshot({
    required String gameName,
    required String snapshotId,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/snapshot/${Uri.encodeComponent(snapshotId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSnapshotResult.fromJson(response);
  }

  /// Updates the metadata of a stage.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [gameName] :
  /// The name of the game.
  ///
  /// Parameter [stageName] :
  /// The name of the stage.
  ///
  /// Parameter [description] :
  /// The description of the stage.
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the role to use for the game snapshots
  /// deployed to this stage.
  Future<UpdateStageResult> updateStage({
    required String gameName,
    required String stageName,
    String? description,
    String? role,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (role != null) 'Role': role,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/game/${Uri.encodeComponent(gameName)}/stage/${Uri.encodeComponent(stageName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStageResult.fromJson(response);
  }
}

/// Details about a WebSocket connection.
class Connection {
  /// The date and time when the connection was created.
  final DateTime? created;

  /// The identifier used to indicate a specific WebSocket connection.
  final String? id;

  Connection({
    this.created,
    this.id,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      created: timeStampFromJson(json['Created']),
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final id = this.id;
    return {
      if (created != null) 'Created': iso8601ToJson(created),
      if (id != null) 'Id': id,
    };
  }
}

class CreateGameResult {
  /// Details about the game that was created.
  final GameDetails? game;

  CreateGameResult({
    this.game,
  });

  factory CreateGameResult.fromJson(Map<String, dynamic> json) {
    return CreateGameResult(
      game: json['Game'] != null
          ? GameDetails.fromJson(json['Game'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final game = this.game;
    return {
      if (game != null) 'Game': game,
    };
  }
}

class CreateSnapshotResult {
  /// Properties that provide details of the created snapshot.
  final SnapshotDetails? snapshot;

  CreateSnapshotResult({
    this.snapshot,
  });

  factory CreateSnapshotResult.fromJson(Map<String, dynamic> json) {
    return CreateSnapshotResult(
      snapshot: json['Snapshot'] != null
          ? SnapshotDetails.fromJson(json['Snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class CreateStageResult {
  /// Properties that describe the stage.
  final StageDetails? stage;

  CreateStageResult({
    this.stage,
  });

  factory CreateStageResult.fromJson(Map<String, dynamic> json) {
    return CreateStageResult(
      stage: json['Stage'] != null
          ? StageDetails.fromJson(json['Stage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stage = this.stage;
    return {
      if (stage != null) 'Stage': stage,
    };
  }
}

class DeleteGameResult {
  DeleteGameResult();

  factory DeleteGameResult.fromJson(Map<String, dynamic> _) {
    return DeleteGameResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteStageResult {
  DeleteStageResult();

  factory DeleteStageResult.fromJson(Map<String, dynamic> _) {
    return DeleteStageResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DeploymentAction {
  deploy,
  undeploy,
}

extension DeploymentActionValueExtension on DeploymentAction {
  String toValue() {
    switch (this) {
      case DeploymentAction.deploy:
        return 'DEPLOY';
      case DeploymentAction.undeploy:
        return 'UNDEPLOY';
    }
  }
}

extension DeploymentActionFromString on String {
  DeploymentAction toDeploymentAction() {
    switch (this) {
      case 'DEPLOY':
        return DeploymentAction.deploy;
      case 'UNDEPLOY':
        return DeploymentAction.undeploy;
    }
    throw Exception('$this is not known in enum DeploymentAction');
  }
}

/// The result of the deployment.
class DeploymentResult {
  /// Details about the deployment result.
  final String? message;

  /// The type of deployment result.
  final ResultCode? resultCode;

  DeploymentResult({
    this.message,
    this.resultCode,
  });

  factory DeploymentResult.fromJson(Map<String, dynamic> json) {
    return DeploymentResult(
      message: json['Message'] as String?,
      resultCode: (json['ResultCode'] as String?)?.toResultCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final resultCode = this.resultCode;
    return {
      if (message != null) 'Message': message,
      if (resultCode != null) 'ResultCode': resultCode.toValue(),
    };
  }
}

enum DeploymentState {
  pending,
  inProgress,
  completed,
  failed,
}

extension DeploymentStateValueExtension on DeploymentState {
  String toValue() {
    switch (this) {
      case DeploymentState.pending:
        return 'PENDING';
      case DeploymentState.inProgress:
        return 'IN_PROGRESS';
      case DeploymentState.completed:
        return 'COMPLETED';
      case DeploymentState.failed:
        return 'FAILED';
    }
  }
}

extension DeploymentStateFromString on String {
  DeploymentState toDeploymentState() {
    switch (this) {
      case 'PENDING':
        return DeploymentState.pending;
      case 'IN_PROGRESS':
        return DeploymentState.inProgress;
      case 'COMPLETED':
        return DeploymentState.completed;
      case 'FAILED':
        return DeploymentState.failed;
    }
    throw Exception('$this is not known in enum DeploymentState');
  }
}

class DisconnectPlayerResult {
  /// The list of the connection ids that could not be disconnected.
  final List<String>? disconnectFailures;

  /// The list of the connection ids that were disconnected.
  final List<String>? disconnectSuccesses;

  DisconnectPlayerResult({
    this.disconnectFailures,
    this.disconnectSuccesses,
  });

  factory DisconnectPlayerResult.fromJson(Map<String, dynamic> json) {
    return DisconnectPlayerResult(
      disconnectFailures: (json['DisconnectFailures'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      disconnectSuccesses: (json['DisconnectSuccesses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final disconnectFailures = this.disconnectFailures;
    final disconnectSuccesses = this.disconnectSuccesses;
    return {
      if (disconnectFailures != null) 'DisconnectFailures': disconnectFailures,
      if (disconnectSuccesses != null)
        'DisconnectSuccesses': disconnectSuccesses,
    };
  }
}

/// <p/>
class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ExportSnapshotResult {
  /// The presigned URL for the snapshot data.
  ///
  /// This URL will be available for 10 minutes, and can be used to download the
  /// snapshot content. If the URL expires, a new one can be requested using the
  /// same operation.
  final String? s3Url;

  ExportSnapshotResult({
    this.s3Url,
  });

  factory ExportSnapshotResult.fromJson(Map<String, dynamic> json) {
    return ExportSnapshotResult(
      s3Url: json['S3Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Url = this.s3Url;
    return {
      if (s3Url != null) 'S3Url': s3Url,
    };
  }
}

/// Details about the extension.
class ExtensionDetails {
  /// The description of the extension.
  final String? description;

  /// The name of the extension.
  final String? name;

  /// The namespace (qualifier) of the extension.
  final String? namespace;

  ExtensionDetails({
    this.description,
    this.name,
    this.namespace,
  });

  factory ExtensionDetails.fromJson(Map<String, dynamic> json) {
    return ExtensionDetails(
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      namespace: json['Namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final namespace = this.namespace;
    return {
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (namespace != null) 'Namespace': namespace,
    };
  }
}

/// Details about the extension version.
class ExtensionVersionDetails {
  /// The name of the extension.
  final String? name;

  /// The namespace (qualifier) of the extension.
  final String? namespace;

  /// The model that defines the interface for this extension version.
  final String? schema;

  /// The version of the extension.
  final String? version;

  ExtensionVersionDetails({
    this.name,
    this.namespace,
    this.schema,
    this.version,
  });

  factory ExtensionVersionDetails.fromJson(Map<String, dynamic> json) {
    return ExtensionVersionDetails(
      name: json['Name'] as String?,
      namespace: json['Namespace'] as String?,
      schema: json['Schema'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final namespace = this.namespace;
    final schema = this.schema;
    final version = this.version;
    return {
      if (name != null) 'Name': name,
      if (namespace != null) 'Namespace': namespace,
      if (schema != null) 'Schema': schema,
      if (version != null) 'Version': version,
    };
  }
}

/// Details about the game configuration.
///
/// The game configuration is organized into named sections, where the schema of
/// each section is defined by an extension. The schema for these sections can
/// be retrieved using the <code>GetExtensionVersion</code> operation.
class GameConfigurationDetails {
  /// The date when the game was created.
  final DateTime? created;

  /// The date when the game was last modified.
  final DateTime? lastUpdated;

  /// Configuration data, organized by section name.
  final Map<String, Section>? sections;

  GameConfigurationDetails({
    this.created,
    this.lastUpdated,
    this.sections,
  });

  factory GameConfigurationDetails.fromJson(Map<String, dynamic> json) {
    return GameConfigurationDetails(
      created: timeStampFromJson(json['Created']),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      sections: (json['Sections'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Section.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final lastUpdated = this.lastUpdated;
    final sections = this.sections;
    return {
      if (created != null) 'Created': iso8601ToJson(created),
      if (lastUpdated != null) 'LastUpdated': iso8601ToJson(lastUpdated),
      if (sections != null) 'Sections': sections,
    };
  }
}

/// Details about a game.
class GameDetails {
  /// The Amazon Resource Name (ARN) of this game.
  final String? arn;

  /// The date when the game was created.
  final DateTime? created;

  /// The description of the game.
  final String? description;

  /// Determines if the game can be deleted.
  final bool? enableTerminationProtection;

  /// The date when the game was last modified.
  final DateTime? lastUpdated;

  /// The name of the game.
  final String? name;

  /// The state of the game.
  final GameState? state;

  /// The tags associated with the game.
  final Map<String, String>? tags;

  GameDetails({
    this.arn,
    this.created,
    this.description,
    this.enableTerminationProtection,
    this.lastUpdated,
    this.name,
    this.state,
    this.tags,
  });

  factory GameDetails.fromJson(Map<String, dynamic> json) {
    return GameDetails(
      arn: json['Arn'] as String?,
      created: timeStampFromJson(json['Created']),
      description: json['Description'] as String?,
      enableTerminationProtection: json['EnableTerminationProtection'] as bool?,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toGameState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final created = this.created;
    final description = this.description;
    final enableTerminationProtection = this.enableTerminationProtection;
    final lastUpdated = this.lastUpdated;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (created != null) 'Created': iso8601ToJson(created),
      if (description != null) 'Description': description,
      if (enableTerminationProtection != null)
        'EnableTerminationProtection': enableTerminationProtection,
      if (lastUpdated != null) 'LastUpdated': iso8601ToJson(lastUpdated),
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum GameState {
  active,
  deleting,
}

extension GameStateValueExtension on GameState {
  String toValue() {
    switch (this) {
      case GameState.active:
        return 'ACTIVE';
      case GameState.deleting:
        return 'DELETING';
    }
  }
}

extension GameStateFromString on String {
  GameState toGameState() {
    switch (this) {
      case 'ACTIVE':
        return GameState.active;
      case 'DELETING':
        return GameState.deleting;
    }
    throw Exception('$this is not known in enum GameState');
  }
}

/// The summary of the properties of a game.
class GameSummary {
  /// The description of the game.
  final String? description;

  /// The name of the game.
  final String? name;

  /// The state of the game.
  final GameState? state;

  /// The tags associated with the game.
  final Map<String, String>? tags;

  GameSummary({
    this.description,
    this.name,
    this.state,
    this.tags,
  });

  factory GameSummary.fromJson(Map<String, dynamic> json) {
    return GameSummary(
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toGameState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Details about a generated code job.
class GeneratedCodeJobDetails {
  /// The description of the generated code job.
  final String? description;

  /// The expiration date and time for the download URL.
  ///
  /// The download URL us guaranteed to be available until at least this time.
  final DateTime? expirationTime;

  /// The identifier for the generated code job.
  final String? generatedCodeJobId;

  /// A presigned URL that can be used to download the generated code.
  final String? s3Url;

  /// The status of the generated code job
  final GeneratedCodeJobState? status;

  GeneratedCodeJobDetails({
    this.description,
    this.expirationTime,
    this.generatedCodeJobId,
    this.s3Url,
    this.status,
  });

  factory GeneratedCodeJobDetails.fromJson(Map<String, dynamic> json) {
    return GeneratedCodeJobDetails(
      description: json['Description'] as String?,
      expirationTime: timeStampFromJson(json['ExpirationTime']),
      generatedCodeJobId: json['GeneratedCodeJobId'] as String?,
      s3Url: json['S3Url'] as String?,
      status: (json['Status'] as String?)?.toGeneratedCodeJobState(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final expirationTime = this.expirationTime;
    final generatedCodeJobId = this.generatedCodeJobId;
    final s3Url = this.s3Url;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
      if (expirationTime != null)
        'ExpirationTime': iso8601ToJson(expirationTime),
      if (generatedCodeJobId != null) 'GeneratedCodeJobId': generatedCodeJobId,
      if (s3Url != null) 'S3Url': s3Url,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum GeneratedCodeJobState {
  inProgress,
  completed,
  failed,
  pending,
}

extension GeneratedCodeJobStateValueExtension on GeneratedCodeJobState {
  String toValue() {
    switch (this) {
      case GeneratedCodeJobState.inProgress:
        return 'IN_PROGRESS';
      case GeneratedCodeJobState.completed:
        return 'COMPLETED';
      case GeneratedCodeJobState.failed:
        return 'FAILED';
      case GeneratedCodeJobState.pending:
        return 'PENDING';
    }
  }
}

extension GeneratedCodeJobStateFromString on String {
  GeneratedCodeJobState toGeneratedCodeJobState() {
    switch (this) {
      case 'IN_PROGRESS':
        return GeneratedCodeJobState.inProgress;
      case 'COMPLETED':
        return GeneratedCodeJobState.completed;
      case 'FAILED':
        return GeneratedCodeJobState.failed;
      case 'PENDING':
        return GeneratedCodeJobState.pending;
    }
    throw Exception('$this is not known in enum GeneratedCodeJobState');
  }
}

/// Properties that specify the code generator for a generated code job.
class Generator {
  /// The target version of the GameSparks Game SDK.
  final String? gameSdkVersion;

  /// The programming language for the generated code.
  ///
  /// Not all languages are supported for each platform. For cases where multiple
  /// languages are supported, this parameter specifies the language to be used.
  /// If this value is omitted, the default language for the target platform will
  /// be used.
  final String? language;

  /// The platform that will be used to run the generated code.
  final String? targetPlatform;

  Generator({
    this.gameSdkVersion,
    this.language,
    this.targetPlatform,
  });

  Map<String, dynamic> toJson() {
    final gameSdkVersion = this.gameSdkVersion;
    final language = this.language;
    final targetPlatform = this.targetPlatform;
    return {
      if (gameSdkVersion != null) 'GameSdkVersion': gameSdkVersion,
      if (language != null) 'Language': language,
      if (targetPlatform != null) 'TargetPlatform': targetPlatform,
    };
  }
}

class GetExtensionResult {
  /// Details about the extension.
  final ExtensionDetails? extension;

  GetExtensionResult({
    this.extension,
  });

  factory GetExtensionResult.fromJson(Map<String, dynamic> json) {
    return GetExtensionResult(
      extension: json['Extension'] != null
          ? ExtensionDetails.fromJson(json['Extension'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final extension = this.extension;
    return {
      if (extension != null) 'Extension': extension,
    };
  }
}

class GetExtensionVersionResult {
  /// The version of the extension.
  final ExtensionVersionDetails? extensionVersion;

  GetExtensionVersionResult({
    this.extensionVersion,
  });

  factory GetExtensionVersionResult.fromJson(Map<String, dynamic> json) {
    return GetExtensionVersionResult(
      extensionVersion: json['ExtensionVersion'] != null
          ? ExtensionVersionDetails.fromJson(
              json['ExtensionVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final extensionVersion = this.extensionVersion;
    return {
      if (extensionVersion != null) 'ExtensionVersion': extensionVersion,
    };
  }
}

class GetGameConfigurationResult {
  /// Details about the game configuration.
  final GameConfigurationDetails? gameConfiguration;

  GetGameConfigurationResult({
    this.gameConfiguration,
  });

  factory GetGameConfigurationResult.fromJson(Map<String, dynamic> json) {
    return GetGameConfigurationResult(
      gameConfiguration: json['GameConfiguration'] != null
          ? GameConfigurationDetails.fromJson(
              json['GameConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameConfiguration = this.gameConfiguration;
    return {
      if (gameConfiguration != null) 'GameConfiguration': gameConfiguration,
    };
  }
}

class GetGameResult {
  /// The details of the game.
  final GameDetails? game;

  GetGameResult({
    this.game,
  });

  factory GetGameResult.fromJson(Map<String, dynamic> json) {
    return GetGameResult(
      game: json['Game'] != null
          ? GameDetails.fromJson(json['Game'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final game = this.game;
    return {
      if (game != null) 'Game': game,
    };
  }
}

class GetGeneratedCodeJobResult {
  /// Details about the generated code job.
  final GeneratedCodeJobDetails? generatedCodeJob;

  GetGeneratedCodeJobResult({
    this.generatedCodeJob,
  });

  factory GetGeneratedCodeJobResult.fromJson(Map<String, dynamic> json) {
    return GetGeneratedCodeJobResult(
      generatedCodeJob: json['GeneratedCodeJob'] != null
          ? GeneratedCodeJobDetails.fromJson(
              json['GeneratedCodeJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final generatedCodeJob = this.generatedCodeJob;
    return {
      if (generatedCodeJob != null) 'GeneratedCodeJob': generatedCodeJob,
    };
  }
}

class GetPlayerConnectionStatusResult {
  /// The list of connection ids, one for each connection in use by the player.
  final List<Connection>? connections;

  GetPlayerConnectionStatusResult({
    this.connections,
  });

  factory GetPlayerConnectionStatusResult.fromJson(Map<String, dynamic> json) {
    return GetPlayerConnectionStatusResult(
      connections: (json['Connections'] as List?)
          ?.whereNotNull()
          .map((e) => Connection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    return {
      if (connections != null) 'Connections': connections,
    };
  }
}

class GetSnapshotResult {
  /// Properties that provide details of the snapshot.
  final SnapshotDetails? snapshot;

  GetSnapshotResult({
    this.snapshot,
  });

  factory GetSnapshotResult.fromJson(Map<String, dynamic> json) {
    return GetSnapshotResult(
      snapshot: json['Snapshot'] != null
          ? SnapshotDetails.fromJson(json['Snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class GetStageDeploymentResult {
  /// Properties that provide details of the stage deployment.
  final StageDeploymentDetails? stageDeployment;

  GetStageDeploymentResult({
    this.stageDeployment,
  });

  factory GetStageDeploymentResult.fromJson(Map<String, dynamic> json) {
    return GetStageDeploymentResult(
      stageDeployment: json['StageDeployment'] != null
          ? StageDeploymentDetails.fromJson(
              json['StageDeployment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stageDeployment = this.stageDeployment;
    return {
      if (stageDeployment != null) 'StageDeployment': stageDeployment,
    };
  }
}

class GetStageResult {
  /// Properties that provide details of the stage.
  final StageDetails? stage;

  GetStageResult({
    this.stage,
  });

  factory GetStageResult.fromJson(Map<String, dynamic> json) {
    return GetStageResult(
      stage: json['Stage'] != null
          ? StageDetails.fromJson(json['Stage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stage = this.stage;
    return {
      if (stage != null) 'Stage': stage,
    };
  }
}

class ImportGameConfigurationResult {
  /// Details about the game configuration.
  final GameConfigurationDetails? gameConfiguration;

  ImportGameConfigurationResult({
    this.gameConfiguration,
  });

  factory ImportGameConfigurationResult.fromJson(Map<String, dynamic> json) {
    return ImportGameConfigurationResult(
      gameConfiguration: json['GameConfiguration'] != null
          ? GameConfigurationDetails.fromJson(
              json['GameConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameConfiguration = this.gameConfiguration;
    return {
      if (gameConfiguration != null) 'GameConfiguration': gameConfiguration,
    };
  }
}

/// The source used to import configuration sections.
class ImportGameConfigurationSource {
  /// The JSON string containing the configuration sections.
  final Uint8List file;

  ImportGameConfigurationSource({
    required this.file,
  });

  Map<String, dynamic> toJson() {
    final file = this.file;
    return {
      'File': base64Encode(file),
    };
  }
}

class ListExtensionVersionsResult {
  /// The list of extension versions.
  final List<ExtensionVersionDetails>? extensionVersions;

  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use this value when making the next call to this operation to continue where
  /// the last one finished.
  final String? nextToken;

  ListExtensionVersionsResult({
    this.extensionVersions,
    this.nextToken,
  });

  factory ListExtensionVersionsResult.fromJson(Map<String, dynamic> json) {
    return ListExtensionVersionsResult(
      extensionVersions: (json['ExtensionVersions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ExtensionVersionDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final extensionVersions = this.extensionVersions;
    final nextToken = this.nextToken;
    return {
      if (extensionVersions != null) 'ExtensionVersions': extensionVersions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListExtensionsResult {
  /// The list of extensions.
  final List<ExtensionDetails>? extensions;

  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use this value when making the next call to this operation to continue where
  /// the last one finished.
  final String? nextToken;

  ListExtensionsResult({
    this.extensions,
    this.nextToken,
  });

  factory ListExtensionsResult.fromJson(Map<String, dynamic> json) {
    return ListExtensionsResult(
      extensions: (json['Extensions'] as List?)
          ?.whereNotNull()
          .map((e) => ExtensionDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final extensions = this.extensions;
    final nextToken = this.nextToken;
    return {
      if (extensions != null) 'Extensions': extensions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGamesResult {
  /// The list of games.
  final List<GameSummary>? games;

  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use this value when making the next call to this operation to continue where
  /// the last one finished.
  final String? nextToken;

  ListGamesResult({
    this.games,
    this.nextToken,
  });

  factory ListGamesResult.fromJson(Map<String, dynamic> json) {
    return ListGamesResult(
      games: (json['Games'] as List?)
          ?.whereNotNull()
          .map((e) => GameSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final games = this.games;
    final nextToken = this.nextToken;
    return {
      if (games != null) 'Games': games,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGeneratedCodeJobsResult {
  /// The list of generated code jobs.
  final List<GeneratedCodeJobDetails>? generatedCodeJobs;

  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use this value when making the next call to this operation to continue where
  /// the last one finished.
  final String? nextToken;

  ListGeneratedCodeJobsResult({
    this.generatedCodeJobs,
    this.nextToken,
  });

  factory ListGeneratedCodeJobsResult.fromJson(Map<String, dynamic> json) {
    return ListGeneratedCodeJobsResult(
      generatedCodeJobs: (json['GeneratedCodeJobs'] as List?)
          ?.whereNotNull()
          .map((e) =>
              GeneratedCodeJobDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final generatedCodeJobs = this.generatedCodeJobs;
    final nextToken = this.nextToken;
    return {
      if (generatedCodeJobs != null) 'GeneratedCodeJobs': generatedCodeJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSnapshotsResult {
  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use this value when making the next call to this operation to continue where
  /// the last one finished.
  final String? nextToken;

  /// A list of snapshot summaries. You can use the returned snapshot IDs in the
  /// <code>UpdateSnapshot</code> and <code>GetSnapshot</code> operations.
  final List<SnapshotSummary>? snapshots;

  ListSnapshotsResult({
    this.nextToken,
    this.snapshots,
  });

  factory ListSnapshotsResult.fromJson(Map<String, dynamic> json) {
    return ListSnapshotsResult(
      nextToken: json['NextToken'] as String?,
      snapshots: (json['Snapshots'] as List?)
          ?.whereNotNull()
          .map((e) => SnapshotSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final snapshots = this.snapshots;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (snapshots != null) 'Snapshots': snapshots,
    };
  }
}

class ListStageDeploymentsResult {
  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use this value when making the next call to this operation to continue where
  /// the last one finished.
  final String? nextToken;

  /// A list of stage deployment summaries. You can use the deployment IDs in the
  /// <code>UpdateStageDeployment</code> and <code>GetStageDeployment</code>
  /// actions.
  final List<StageDeploymentSummary>? stageDeployments;

  ListStageDeploymentsResult({
    this.nextToken,
    this.stageDeployments,
  });

  factory ListStageDeploymentsResult.fromJson(Map<String, dynamic> json) {
    return ListStageDeploymentsResult(
      nextToken: json['NextToken'] as String?,
      stageDeployments: (json['StageDeployments'] as List?)
          ?.whereNotNull()
          .map(
              (e) => StageDeploymentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final stageDeployments = this.stageDeployments;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (stageDeployments != null) 'StageDeployments': stageDeployments,
    };
  }
}

class ListStagesResult {
  /// The token that indicates the start of the next sequential page of results.
  ///
  /// Use this value when making the next call to this operation to continue where
  /// the last one finished.
  final String? nextToken;

  /// A list of stage summaries. You can use the stage names in the
  /// <code>UpdateStage</code> and <code>GetStage</code> actions.
  final List<StageSummary>? stages;

  ListStagesResult({
    this.nextToken,
    this.stages,
  });

  factory ListStagesResult.fromJson(Map<String, dynamic> json) {
    return ListStagesResult(
      nextToken: json['NextToken'] as String?,
      stages: (json['Stages'] as List?)
          ?.whereNotNull()
          .map((e) => StageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final stages = this.stages;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (stages != null) 'Stages': stages,
    };
  }
}

class ListTagsForResourceResult {
  /// The tags associated with the resource.
  final Map<String, String>? tags;

  ListTagsForResourceResult({
    this.tags,
  });

  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
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

enum Operation {
  add,
  remove,
  replace,
}

extension OperationValueExtension on Operation {
  String toValue() {
    switch (this) {
      case Operation.add:
        return 'ADD';
      case Operation.remove:
        return 'REMOVE';
      case Operation.replace:
        return 'REPLACE';
    }
  }
}

extension OperationFromString on String {
  Operation toOperation() {
    switch (this) {
      case 'ADD':
        return Operation.add;
      case 'REMOVE':
        return Operation.remove;
      case 'REPLACE':
        return Operation.replace;
    }
    throw Exception('$this is not known in enum Operation');
  }
}

enum ResultCode {
  success,
  invalidRoleFailure,
  unspecifiedFailure,
}

extension ResultCodeValueExtension on ResultCode {
  String toValue() {
    switch (this) {
      case ResultCode.success:
        return 'SUCCESS';
      case ResultCode.invalidRoleFailure:
        return 'INVALID_ROLE_FAILURE';
      case ResultCode.unspecifiedFailure:
        return 'UNSPECIFIED_FAILURE';
    }
  }
}

extension ResultCodeFromString on String {
  ResultCode toResultCode() {
    switch (this) {
      case 'SUCCESS':
        return ResultCode.success;
      case 'INVALID_ROLE_FAILURE':
        return ResultCode.invalidRoleFailure;
      case 'UNSPECIFIED_FAILURE':
        return ResultCode.unspecifiedFailure;
    }
    throw Exception('$this is not known in enum ResultCode');
  }
}

/// The configuration section.
class Section {
  /// The content of a configuration section.
  final Document? attributes;

  /// The name of the section.
  final String? name;

  /// The size, in bytes, of the section contents.
  final int? size;

  Section({
    this.attributes,
    this.name,
    this.size,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      attributes: json['Attributes'] != null
          ? Document.fromJson(json['Attributes'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      size: json['Size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final name = this.name;
    final size = this.size;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (name != null) 'Name': name,
      if (size != null) 'Size': size,
    };
  }
}

/// A single modification to the configuration section.
class SectionModification {
  /// The operation to be performed on a configuration section.
  ///
  /// Content can be added, deleted, or replaced within a section.
  final Operation operation;

  /// The path within the section content to be modified.
  final String path;

  /// The name of the section to be modified.
  final String section;

  /// For add and replace operations, this is the value that will be used.
  ///
  /// This field should be omitted for delete operations.
  final Document? value;

  SectionModification({
    required this.operation,
    required this.path,
    required this.section,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final path = this.path;
    final section = this.section;
    final value = this.value;
    return {
      'Operation': operation.toValue(),
      'Path': path,
      'Section': section,
      if (value != null) 'Value': value,
    };
  }
}

/// Properties that provide details of a snapshot.
class SnapshotDetails {
  /// The timestamp of when the snapshot was created.
  final DateTime? created;

  /// The description of the snapshot.
  final String? description;

  /// The identifier of the snapshot.
  final String? id;

  /// The timestamp of when the snapshot was last updated.
  final DateTime? lastUpdated;

  /// The sections in the snapshot.
  final Map<String, Section>? sections;

  SnapshotDetails({
    this.created,
    this.description,
    this.id,
    this.lastUpdated,
    this.sections,
  });

  factory SnapshotDetails.fromJson(Map<String, dynamic> json) {
    return SnapshotDetails(
      created: timeStampFromJson(json['Created']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      sections: (json['Sections'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Section.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final description = this.description;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final sections = this.sections;
    return {
      if (created != null) 'Created': iso8601ToJson(created),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lastUpdated != null) 'LastUpdated': iso8601ToJson(lastUpdated),
      if (sections != null) 'Sections': sections,
    };
  }
}

/// The summary of the properties of a snapshot.
class SnapshotSummary {
  /// The timestamp of when the snapshot was created.
  final DateTime? created;

  /// The description of the snapshot.
  final String? description;

  /// The identifier of the snapshot.
  final String? id;

  /// Then timestamp of when the snapshot was last updated.
  final DateTime? lastUpdated;

  SnapshotSummary({
    this.created,
    this.description,
    this.id,
    this.lastUpdated,
  });

  factory SnapshotSummary.fromJson(Map<String, dynamic> json) {
    return SnapshotSummary(
      created: timeStampFromJson(json['Created']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final description = this.description;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    return {
      if (created != null) 'Created': iso8601ToJson(created),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (lastUpdated != null) 'LastUpdated': iso8601ToJson(lastUpdated),
    };
  }
}

/// Properties that provide details of a stage deployment.
class StageDeploymentDetails {
  /// The timestamp of when the stage deployment was created.
  final DateTime? created;

  /// The type of action of the stage deployment.
  final DeploymentAction? deploymentAction;

  /// The identifier of the deployment.
  final String? deploymentId;

  /// The result of the deployment.
  final DeploymentResult? deploymentResult;

  /// The state of the deployment.
  final DeploymentState? deploymentState;

  /// The timestamp of when the deployment was last updated.
  final DateTime? lastUpdated;

  /// The identifier of the snapshot associated with the stage deployment.
  final String? snapshotId;

  StageDeploymentDetails({
    this.created,
    this.deploymentAction,
    this.deploymentId,
    this.deploymentResult,
    this.deploymentState,
    this.lastUpdated,
    this.snapshotId,
  });

  factory StageDeploymentDetails.fromJson(Map<String, dynamic> json) {
    return StageDeploymentDetails(
      created: timeStampFromJson(json['Created']),
      deploymentAction:
          (json['DeploymentAction'] as String?)?.toDeploymentAction(),
      deploymentId: json['DeploymentId'] as String?,
      deploymentResult: json['DeploymentResult'] != null
          ? DeploymentResult.fromJson(
              json['DeploymentResult'] as Map<String, dynamic>)
          : null,
      deploymentState:
          (json['DeploymentState'] as String?)?.toDeploymentState(),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      snapshotId: json['SnapshotId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final deploymentAction = this.deploymentAction;
    final deploymentId = this.deploymentId;
    final deploymentResult = this.deploymentResult;
    final deploymentState = this.deploymentState;
    final lastUpdated = this.lastUpdated;
    final snapshotId = this.snapshotId;
    return {
      if (created != null) 'Created': iso8601ToJson(created),
      if (deploymentAction != null)
        'DeploymentAction': deploymentAction.toValue(),
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (deploymentResult != null) 'DeploymentResult': deploymentResult,
      if (deploymentState != null) 'DeploymentState': deploymentState.toValue(),
      if (lastUpdated != null) 'LastUpdated': iso8601ToJson(lastUpdated),
      if (snapshotId != null) 'SnapshotId': snapshotId,
    };
  }
}

/// The summary of the properties of a stage deployment.
class StageDeploymentSummary {
  /// The type of action of the deployment.
  final DeploymentAction? deploymentAction;

  /// The identifier of the deployment.
  final String? deploymentId;

  /// The result of the deployment.
  final DeploymentResult? deploymentResult;

  /// The state of the deployment.
  final DeploymentState? deploymentState;

  /// The timestamp of when the deployment was last updated.
  final DateTime? lastUpdated;

  /// The identifier of the snapshot associated with the stage deployment.
  final String? snapshotId;

  StageDeploymentSummary({
    this.deploymentAction,
    this.deploymentId,
    this.deploymentResult,
    this.deploymentState,
    this.lastUpdated,
    this.snapshotId,
  });

  factory StageDeploymentSummary.fromJson(Map<String, dynamic> json) {
    return StageDeploymentSummary(
      deploymentAction:
          (json['DeploymentAction'] as String?)?.toDeploymentAction(),
      deploymentId: json['DeploymentId'] as String?,
      deploymentResult: json['DeploymentResult'] != null
          ? DeploymentResult.fromJson(
              json['DeploymentResult'] as Map<String, dynamic>)
          : null,
      deploymentState:
          (json['DeploymentState'] as String?)?.toDeploymentState(),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      snapshotId: json['SnapshotId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentAction = this.deploymentAction;
    final deploymentId = this.deploymentId;
    final deploymentResult = this.deploymentResult;
    final deploymentState = this.deploymentState;
    final lastUpdated = this.lastUpdated;
    final snapshotId = this.snapshotId;
    return {
      if (deploymentAction != null)
        'DeploymentAction': deploymentAction.toValue(),
      if (deploymentId != null) 'DeploymentId': deploymentId,
      if (deploymentResult != null) 'DeploymentResult': deploymentResult,
      if (deploymentState != null) 'DeploymentState': deploymentState.toValue(),
      if (lastUpdated != null) 'LastUpdated': iso8601ToJson(lastUpdated),
      if (snapshotId != null) 'SnapshotId': snapshotId,
    };
  }
}

/// Properties that provide details of a stage.
class StageDetails {
  /// The Amazon Resource Name (ARN) of the stage.
  final String? arn;

  /// The timestamp of when the stage was created.
  final DateTime? created;

  /// The description of the stage.
  final String? description;

  /// The game key associated with the stage.
  ///
  /// The game key is a unique identifier that the game client uses to connect to
  /// the GameSparks backend.
  final String? gameKey;

  /// The timestamp of when the stage was last updated.
  final DateTime? lastUpdated;

  /// The Amazon CloudWatch log group for game runtimes deployed to the stage.
  final String? logGroup;

  /// The name of the stage.
  final String? name;

  /// The Amazon Resource Name (ARN) of the role used to run the game runtimes
  /// deployed to the stage.
  final String? role;

  /// The state of the stage.
  final StageState? state;

  /// The tags associated with the stage.
  final Map<String, String>? tags;

  StageDetails({
    this.arn,
    this.created,
    this.description,
    this.gameKey,
    this.lastUpdated,
    this.logGroup,
    this.name,
    this.role,
    this.state,
    this.tags,
  });

  factory StageDetails.fromJson(Map<String, dynamic> json) {
    return StageDetails(
      arn: json['Arn'] as String?,
      created: timeStampFromJson(json['Created']),
      description: json['Description'] as String?,
      gameKey: json['GameKey'] as String?,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      logGroup: json['LogGroup'] as String?,
      name: json['Name'] as String?,
      role: json['Role'] as String?,
      state: (json['State'] as String?)?.toStageState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final created = this.created;
    final description = this.description;
    final gameKey = this.gameKey;
    final lastUpdated = this.lastUpdated;
    final logGroup = this.logGroup;
    final name = this.name;
    final role = this.role;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (created != null) 'Created': iso8601ToJson(created),
      if (description != null) 'Description': description,
      if (gameKey != null) 'GameKey': gameKey,
      if (lastUpdated != null) 'LastUpdated': iso8601ToJson(lastUpdated),
      if (logGroup != null) 'LogGroup': logGroup,
      if (name != null) 'Name': name,
      if (role != null) 'Role': role,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum StageState {
  active,
  deleting,
}

extension StageStateValueExtension on StageState {
  String toValue() {
    switch (this) {
      case StageState.active:
        return 'ACTIVE';
      case StageState.deleting:
        return 'DELETING';
    }
  }
}

extension StageStateFromString on String {
  StageState toStageState() {
    switch (this) {
      case 'ACTIVE':
        return StageState.active;
      case 'DELETING':
        return StageState.deleting;
    }
    throw Exception('$this is not known in enum StageState');
  }
}

/// The summary of the properties of a stage.
class StageSummary {
  /// The description of the stage.
  final String? description;

  /// The game key associated with the stage.
  ///
  /// The game key is a unique identifier that the game client uses to connect to
  /// the GameSparks backend.
  final String? gameKey;

  /// The name of the stage.
  final String? name;

  /// The state of the stage.
  final StageState? state;

  /// The tags associated with the stage.
  final Map<String, String>? tags;

  StageSummary({
    this.description,
    this.gameKey,
    this.name,
    this.state,
    this.tags,
  });

  factory StageSummary.fromJson(Map<String, dynamic> json) {
    return StageSummary(
      description: json['Description'] as String?,
      gameKey: json['GameKey'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toStageState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final gameKey = this.gameKey;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (gameKey != null) 'GameKey': gameKey,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class StartGeneratedCodeJobResult {
  /// The identifier of the code generation job. You can use this identifier in
  /// the <code>GetGeneratedCodeJob</code> operation.
  final String? generatedCodeJobId;

  StartGeneratedCodeJobResult({
    this.generatedCodeJobId,
  });

  factory StartGeneratedCodeJobResult.fromJson(Map<String, dynamic> json) {
    return StartGeneratedCodeJobResult(
      generatedCodeJobId: json['GeneratedCodeJobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final generatedCodeJobId = this.generatedCodeJobId;
    return {
      if (generatedCodeJobId != null) 'GeneratedCodeJobId': generatedCodeJobId,
    };
  }
}

class StartStageDeploymentResult {
  /// Properties that describe the stage deployment.
  final StageDeploymentDetails? stageDeployment;

  StartStageDeploymentResult({
    this.stageDeployment,
  });

  factory StartStageDeploymentResult.fromJson(Map<String, dynamic> json) {
    return StartStageDeploymentResult(
      stageDeployment: json['StageDeployment'] != null
          ? StageDeploymentDetails.fromJson(
              json['StageDeployment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stageDeployment = this.stageDeployment;
    return {
      if (stageDeployment != null) 'StageDeployment': stageDeployment,
    };
  }
}

class TagResourceResult {
  TagResourceResult();

  factory TagResourceResult.fromJson(Map<String, dynamic> _) {
    return TagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResult {
  UntagResourceResult();

  factory UntagResourceResult.fromJson(Map<String, dynamic> _) {
    return UntagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateGameConfigurationResult {
  /// Details about the game configuration.
  final GameConfigurationDetails? gameConfiguration;

  UpdateGameConfigurationResult({
    this.gameConfiguration,
  });

  factory UpdateGameConfigurationResult.fromJson(Map<String, dynamic> json) {
    return UpdateGameConfigurationResult(
      gameConfiguration: json['GameConfiguration'] != null
          ? GameConfigurationDetails.fromJson(
              json['GameConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gameConfiguration = this.gameConfiguration;
    return {
      if (gameConfiguration != null) 'GameConfiguration': gameConfiguration,
    };
  }
}

class UpdateGameResult {
  /// The details of the game.
  final GameDetails? game;

  UpdateGameResult({
    this.game,
  });

  factory UpdateGameResult.fromJson(Map<String, dynamic> json) {
    return UpdateGameResult(
      game: json['Game'] != null
          ? GameDetails.fromJson(json['Game'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final game = this.game;
    return {
      if (game != null) 'Game': game,
    };
  }
}

class UpdateSnapshotResult {
  /// Properties that provide details of the updated snapshot.
  final SnapshotDetails? snapshot;

  UpdateSnapshotResult({
    this.snapshot,
  });

  factory UpdateSnapshotResult.fromJson(Map<String, dynamic> json) {
    return UpdateSnapshotResult(
      snapshot: json['Snapshot'] != null
          ? SnapshotDetails.fromJson(json['Snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class UpdateStageResult {
  /// Properties that provide details of the updated stage.
  final StageDetails? stage;

  UpdateStageResult({
    this.stage,
  });

  factory UpdateStageResult.fromJson(Map<String, dynamic> json) {
    return UpdateStageResult(
      stage: json['Stage'] != null
          ? StageDetails.fromJson(json['Stage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stage = this.stage;
    return {
      if (stage != null) 'Stage': stage,
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
