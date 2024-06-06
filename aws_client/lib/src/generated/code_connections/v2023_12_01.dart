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

/// This Amazon Web Services CodeConnections API Reference provides descriptions
/// and usage examples of the operations and data types for the Amazon Web
/// Services CodeConnections API. You can use the connections API to work with
/// connections and installations.
class CodeConnections {
  final _s.JsonProtocol _protocol;
  CodeConnections({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codeconnections',
            signingName: 'codeconnections',
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

  /// Creates a connection that can then be given to other Amazon Web Services
  /// services like CodePipeline so that it can access third-party code
  /// repositories. The connection is in pending status until the third-party
  /// connection handshake is completed from the console.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [connectionName] :
  /// The name of the connection to be created.
  ///
  /// Parameter [hostArn] :
  /// The Amazon Resource Name (ARN) of the host associated with the connection
  /// to be created.
  ///
  /// Parameter [providerType] :
  /// The name of the external provider where your third-party code repository
  /// is configured.
  ///
  /// Parameter [tags] :
  /// The key-value pair to use when tagging the resource.
  Future<CreateConnectionOutput> createConnection({
    required String connectionName,
    String? hostArn,
    ProviderType? providerType,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.CreateConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionName': connectionName,
        if (hostArn != null) 'HostArn': hostArn,
        if (providerType != null) 'ProviderType': providerType.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateConnectionOutput.fromJson(jsonResponse.body);
  }

  /// Creates a resource that represents the infrastructure where a third-party
  /// provider is installed. The host is used when you create connections to an
  /// installed third-party provider type, such as GitHub Enterprise Server. You
  /// create one host for all connections to that provider.
  /// <note>
  /// A host created through the CLI or the SDK is in `PENDING` status by
  /// default. You can make its status `AVAILABLE` by setting up the host in the
  /// console.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  ///
  /// Parameter [name] :
  /// The name of the host to be created.
  ///
  /// Parameter [providerEndpoint] :
  /// The endpoint of the infrastructure to be represented by the host after it
  /// is created.
  ///
  /// Parameter [providerType] :
  /// The name of the installed provider to be associated with your connection.
  /// The host resource represents the infrastructure where your provider type
  /// is installed. The valid provider type is GitHub Enterprise Server.
  ///
  /// Parameter [tags] :
  /// Tags for the host to be created.
  ///
  /// Parameter [vpcConfiguration] :
  /// The VPC configuration to be provisioned for the host. A VPC must be
  /// configured and the infrastructure to be represented by the host must
  /// already be connected to the VPC.
  Future<CreateHostOutput> createHost({
    required String name,
    required String providerEndpoint,
    required ProviderType providerType,
    List<Tag>? tags,
    VpcConfiguration? vpcConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.CreateHost'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'ProviderEndpoint': providerEndpoint,
        'ProviderType': providerType.toValue(),
        if (tags != null) 'Tags': tags,
        if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
      },
    );

    return CreateHostOutput.fromJson(jsonResponse.body);
  }

  /// Creates a link to a specified external Git repository. A repository link
  /// allows Git sync to monitor and sync changes to files in a specified Git
  /// repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [connectionArn] :
  /// The Amazon Resource Name (ARN) of the connection to be associated with the
  /// repository link.
  ///
  /// Parameter [ownerId] :
  /// The owner ID for the repository associated with a specific sync
  /// configuration, such as the owner ID in GitHub.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to be associated with the repository link.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The Amazon Resource Name (ARN) encryption key for the repository to be
  /// associated with the repository link.
  ///
  /// Parameter [tags] :
  /// The tags for the repository to be associated with the repository link.
  Future<CreateRepositoryLinkOutput> createRepositoryLink({
    required String connectionArn,
    required String ownerId,
    required String repositoryName,
    String? encryptionKeyArn,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.CreateRepositoryLink'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionArn': connectionArn,
        'OwnerId': ownerId,
        'RepositoryName': repositoryName,
        if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRepositoryLinkOutput.fromJson(jsonResponse.body);
  }

  /// Creates a sync configuration which allows Amazon Web Services to sync
  /// content from a Git repository to update a specified Amazon Web Services
  /// resource. Parameters for the sync configuration are determined by the sync
  /// type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [branch] :
  /// The branch in the repository from which changes will be synced.
  ///
  /// Parameter [configFile] :
  /// The file name of the configuration file that manages syncing between the
  /// connection and the repository. This configuration file is stored in the
  /// repository.
  ///
  /// Parameter [repositoryLinkId] :
  /// The ID of the repository link created for the connection. A repository
  /// link allows Git sync to monitor and sync changes to files in a specified
  /// Git repository.
  ///
  /// Parameter [resourceName] :
  /// The name of the Amazon Web Services resource (for example, a
  /// CloudFormation stack in the case of CFN_STACK_SYNC) that will be
  /// synchronized from the linked repository.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that grants permission for Amazon Web Services to
  /// use Git sync to update a given Amazon Web Services resource on your
  /// behalf.
  ///
  /// Parameter [syncType] :
  /// The type of sync configuration.
  ///
  /// Parameter [publishDeploymentStatus] :
  /// Whether to enable or disable publishing of deployment status to source
  /// providers.
  ///
  /// Parameter [triggerResourceUpdateOn] :
  /// When to trigger Git sync to begin the stack update.
  Future<CreateSyncConfigurationOutput> createSyncConfiguration({
    required String branch,
    required String configFile,
    required String repositoryLinkId,
    required String resourceName,
    required String roleArn,
    required SyncConfigurationType syncType,
    PublishDeploymentStatus? publishDeploymentStatus,
    TriggerResourceUpdateOn? triggerResourceUpdateOn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.CreateSyncConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Branch': branch,
        'ConfigFile': configFile,
        'RepositoryLinkId': repositoryLinkId,
        'ResourceName': resourceName,
        'RoleArn': roleArn,
        'SyncType': syncType.toValue(),
        if (publishDeploymentStatus != null)
          'PublishDeploymentStatus': publishDeploymentStatus.toValue(),
        if (triggerResourceUpdateOn != null)
          'TriggerResourceUpdateOn': triggerResourceUpdateOn.toValue(),
      },
    );

    return CreateSyncConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// The connection to be deleted.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [connectionArn] :
  /// The Amazon Resource Name (ARN) of the connection to be deleted.
  /// <note>
  /// The ARN is never reused if the connection is deleted.
  /// </note>
  Future<void> deleteConnection({
    required String connectionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.DeleteConnection'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionArn': connectionArn,
      },
    );
  }

  /// The host to be deleted. Before you delete a host, all connections
  /// associated to the host must be deleted.
  /// <note>
  /// A host cannot be deleted if it is in the VPC_CONFIG_INITIALIZING or
  /// VPC_CONFIG_DELETING state.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [hostArn] :
  /// The Amazon Resource Name (ARN) of the host to be deleted.
  Future<void> deleteHost({
    required String hostArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.DeleteHost'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HostArn': hostArn,
      },
    );
  }

  /// Deletes the association between your connection and a specified external
  /// Git repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [SyncConfigurationStillExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnsupportedProviderTypeException].
  ///
  /// Parameter [repositoryLinkId] :
  /// The ID of the repository link to be deleted.
  Future<void> deleteRepositoryLink({
    required String repositoryLinkId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.DeleteRepositoryLink'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RepositoryLinkId': repositoryLinkId,
      },
    );
  }

  /// Deletes the sync configuration for a specified repository and connection.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceName] :
  /// The name of the Amazon Web Services resource associated with the sync
  /// configuration to be deleted.
  ///
  /// Parameter [syncType] :
  /// The type of sync configuration to be deleted.
  Future<void> deleteSyncConfiguration({
    required String resourceName,
    required SyncConfigurationType syncType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.DeleteSyncConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceName': resourceName,
        'SyncType': syncType.toValue(),
      },
    );
  }

  /// Returns the connection ARN and details such as status, owner, and provider
  /// type.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [connectionArn] :
  /// The Amazon Resource Name (ARN) of a connection.
  Future<GetConnectionOutput> getConnection({
    required String connectionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.GetConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConnectionArn': connectionArn,
      },
    );

    return GetConnectionOutput.fromJson(jsonResponse.body);
  }

  /// Returns the host ARN and details such as status, provider type, endpoint,
  /// and, if applicable, the VPC configuration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [hostArn] :
  /// The Amazon Resource Name (ARN) of the requested host.
  Future<GetHostOutput> getHost({
    required String hostArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.GetHost'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HostArn': hostArn,
      },
    );

    return GetHostOutput.fromJson(jsonResponse.body);
  }

  /// Returns details about a repository link. A repository link allows Git sync
  /// to monitor and sync changes from files in a specified Git repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [repositoryLinkId] :
  /// The ID of the repository link to get.
  Future<GetRepositoryLinkOutput> getRepositoryLink({
    required String repositoryLinkId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.GetRepositoryLink'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RepositoryLinkId': repositoryLinkId,
      },
    );

    return GetRepositoryLinkOutput.fromJson(jsonResponse.body);
  }

  /// Returns details about the sync status for a repository. A repository sync
  /// uses Git sync to push and pull changes from your remote repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [branch] :
  /// The branch of the repository link for the requested repository sync
  /// status.
  ///
  /// Parameter [repositoryLinkId] :
  /// The repository link ID for the requested repository sync status.
  ///
  /// Parameter [syncType] :
  /// The sync type of the requested sync status.
  Future<GetRepositorySyncStatusOutput> getRepositorySyncStatus({
    required String branch,
    required String repositoryLinkId,
    required SyncConfigurationType syncType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.GetRepositorySyncStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Branch': branch,
        'RepositoryLinkId': repositoryLinkId,
        'SyncType': syncType.toValue(),
      },
    );

    return GetRepositorySyncStatusOutput.fromJson(jsonResponse.body);
  }

  /// Returns the status of the sync with the Git repository for a specific
  /// Amazon Web Services resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceName] :
  /// The name of the Amazon Web Services resource for the sync status with the
  /// Git repository.
  ///
  /// Parameter [syncType] :
  /// The sync type for the sync status with the Git repository.
  Future<GetResourceSyncStatusOutput> getResourceSyncStatus({
    required String resourceName,
    required SyncConfigurationType syncType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.GetResourceSyncStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceName': resourceName,
        'SyncType': syncType.toValue(),
      },
    );

    return GetResourceSyncStatusOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of the most recent sync blockers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceName] :
  /// The name of the Amazon Web Services resource currently blocked from
  /// automatically being synced from a Git repository.
  ///
  /// Parameter [syncType] :
  /// The sync type for the sync blocker summary.
  Future<GetSyncBlockerSummaryOutput> getSyncBlockerSummary({
    required String resourceName,
    required SyncConfigurationType syncType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.GetSyncBlockerSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceName': resourceName,
        'SyncType': syncType.toValue(),
      },
    );

    return GetSyncBlockerSummaryOutput.fromJson(jsonResponse.body);
  }

  /// Returns details about a sync configuration, including the sync type and
  /// resource name. A sync configuration allows the configuration to sync (push
  /// and pull) changes from the remote repository for a specified branch in a
  /// Git repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceName] :
  /// The name of the Amazon Web Services resource for the sync configuration
  /// for which you want to retrieve information.
  ///
  /// Parameter [syncType] :
  /// The sync type for the sync configuration for which you want to retrieve
  /// information.
  Future<GetSyncConfigurationOutput> getSyncConfiguration({
    required String resourceName,
    required SyncConfigurationType syncType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.GetSyncConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceName': resourceName,
        'SyncType': syncType.toValue(),
      },
    );

    return GetSyncConfigurationOutput.fromJson(jsonResponse.body);
  }

  /// Lists the connections associated with your account.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [hostArnFilter] :
  /// Filters the list of connections to those associated with a specified host.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token that was returned from the previous <code>ListConnections</code>
  /// call, which can be used to return the next set of connections in the list.
  ///
  /// Parameter [providerTypeFilter] :
  /// Filters the list of connections to those associated with a specified
  /// provider, such as Bitbucket.
  Future<ListConnectionsOutput> listConnections({
    String? hostArnFilter,
    int? maxResults,
    String? nextToken,
    ProviderType? providerTypeFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.ListConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (hostArnFilter != null) 'HostArnFilter': hostArnFilter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (providerTypeFilter != null)
          'ProviderTypeFilter': providerTypeFilter.toValue(),
      },
    );

    return ListConnectionsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the hosts associated with your account.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token that was returned from the previous <code>ListHosts</code> call,
  /// which can be used to return the next set of hosts in the list.
  Future<ListHostsOutput> listHosts({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.ListHosts'
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

    return ListHostsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the repository links created for connections in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<ListRepositoryLinksOutput> listRepositoryLinks({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.ListRepositoryLinks'
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

    return ListRepositoryLinksOutput.fromJson(jsonResponse.body);
  }

  /// Lists the repository sync definitions for repository links in your
  /// account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [repositoryLinkId] :
  /// The ID of the repository link for the sync definition for which you want
  /// to retrieve information.
  ///
  /// Parameter [syncType] :
  /// The sync type of the repository link for the the sync definition for which
  /// you want to retrieve information.
  Future<ListRepositorySyncDefinitionsOutput> listRepositorySyncDefinitions({
    required String repositoryLinkId,
    required SyncConfigurationType syncType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.ListRepositorySyncDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RepositoryLinkId': repositoryLinkId,
        'SyncType': syncType.toValue(),
      },
    );

    return ListRepositorySyncDefinitionsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of sync configurations for a specified repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [repositoryLinkId] :
  /// The ID of the repository link for the requested list of sync
  /// configurations.
  ///
  /// Parameter [syncType] :
  /// The sync type for the requested list of sync configurations.
  ///
  /// Parameter [maxResults] :
  /// A non-zero, non-negative integer used to limit the number of returned
  /// results.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that allows the operation to batch the results of the
  /// operation.
  Future<ListSyncConfigurationsOutput> listSyncConfigurations({
    required String repositoryLinkId,
    required SyncConfigurationType syncType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.ListSyncConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RepositoryLinkId': repositoryLinkId,
        'SyncType': syncType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListSyncConfigurationsOutput.fromJson(jsonResponse.body);
  }

  /// Gets the set of key-value pairs (metadata) that are used to manage the
  /// resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which you want to get
  /// information about tags, if any.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceOutput.fromJson(jsonResponse.body);
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata that
  /// can be used to manage a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which you want to add or
  /// update tags.
  ///
  /// Parameter [tags] :
  /// The tags you want to modify or add to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Removes tags from an Amazon Web Services resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The list of keys for the tags to be removed from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates a specified host with the provided configurations.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  /// May throw [UnsupportedOperationException].
  ///
  /// Parameter [hostArn] :
  /// The Amazon Resource Name (ARN) of the host to be updated.
  ///
  /// Parameter [providerEndpoint] :
  /// The URL or endpoint of the host to be updated.
  ///
  /// Parameter [vpcConfiguration] :
  /// The VPC configuration of the host to be updated. A VPC must be configured
  /// and the infrastructure to be represented by the host must already be
  /// connected to the VPC.
  Future<void> updateHost({
    required String hostArn,
    String? providerEndpoint,
    VpcConfiguration? vpcConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.UpdateHost'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HostArn': hostArn,
        if (providerEndpoint != null) 'ProviderEndpoint': providerEndpoint,
        if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
      },
    );
  }

  /// Updates the association between your connection and a specified external
  /// Git repository. A repository link allows Git sync to monitor and sync
  /// changes to files in a specified Git repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConditionalCheckFailedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UpdateOutOfSyncException].
  ///
  /// Parameter [repositoryLinkId] :
  /// The ID of the repository link to be updated.
  ///
  /// Parameter [connectionArn] :
  /// The Amazon Resource Name (ARN) of the connection for the repository link
  /// to be updated. The updated connection ARN must have the same providerType
  /// (such as GitHub) as the original connection ARN for the repo link.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of the encryption key for the repository
  /// link to be updated.
  Future<UpdateRepositoryLinkOutput> updateRepositoryLink({
    required String repositoryLinkId,
    String? connectionArn,
    String? encryptionKeyArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.UpdateRepositoryLink'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RepositoryLinkId': repositoryLinkId,
        if (connectionArn != null) 'ConnectionArn': connectionArn,
        if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      },
    );

    return UpdateRepositoryLinkOutput.fromJson(jsonResponse.body);
  }

  /// Allows you to update the status of a sync blocker, resolving the blocker
  /// and allowing syncing to continue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RetryLatestCommitFailedException].
  /// May throw [SyncBlockerDoesNotExistException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [id] :
  /// The ID of the sync blocker to be updated.
  ///
  /// Parameter [resolvedReason] :
  /// The reason for resolving the sync blocker.
  ///
  /// Parameter [resourceName] :
  /// The name of the resource for the sync blocker to be updated.
  ///
  /// Parameter [syncType] :
  /// The sync type of the sync blocker to be updated.
  Future<UpdateSyncBlockerOutput> updateSyncBlocker({
    required String id,
    required String resolvedReason,
    required String resourceName,
    required SyncConfigurationType syncType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.UpdateSyncBlocker'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'ResolvedReason': resolvedReason,
        'ResourceName': resourceName,
        'SyncType': syncType.toValue(),
      },
    );

    return UpdateSyncBlockerOutput.fromJson(jsonResponse.body);
  }

  /// Updates the sync configuration for your connection and a specified
  /// external Git repository.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConcurrentModificationException].
  /// May throw [InternalServerException].
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UpdateOutOfSyncException].
  ///
  /// Parameter [resourceName] :
  /// The name of the Amazon Web Services resource for the sync configuration to
  /// be updated.
  ///
  /// Parameter [syncType] :
  /// The sync type for the sync configuration to be updated.
  ///
  /// Parameter [branch] :
  /// The branch for the sync configuration to be updated.
  ///
  /// Parameter [configFile] :
  /// The configuration file for the sync configuration to be updated.
  ///
  /// Parameter [publishDeploymentStatus] :
  /// Whether to enable or disable publishing of deployment status to source
  /// providers.
  ///
  /// Parameter [repositoryLinkId] :
  /// The ID of the repository link for the sync configuration to be updated.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role for the sync configuration to be updated.
  ///
  /// Parameter [triggerResourceUpdateOn] :
  /// When to trigger Git sync to begin the stack update.
  Future<UpdateSyncConfigurationOutput> updateSyncConfiguration({
    required String resourceName,
    required SyncConfigurationType syncType,
    String? branch,
    String? configFile,
    PublishDeploymentStatus? publishDeploymentStatus,
    String? repositoryLinkId,
    String? roleArn,
    TriggerResourceUpdateOn? triggerResourceUpdateOn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codeconnections.CodeConnections_20231201.UpdateSyncConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceName': resourceName,
        'SyncType': syncType.toValue(),
        if (branch != null) 'Branch': branch,
        if (configFile != null) 'ConfigFile': configFile,
        if (publishDeploymentStatus != null)
          'PublishDeploymentStatus': publishDeploymentStatus.toValue(),
        if (repositoryLinkId != null) 'RepositoryLinkId': repositoryLinkId,
        if (roleArn != null) 'RoleArn': roleArn,
        if (triggerResourceUpdateOn != null)
          'TriggerResourceUpdateOn': triggerResourceUpdateOn.toValue(),
      },
    );

    return UpdateSyncConfigurationOutput.fromJson(jsonResponse.body);
  }
}

enum BlockerStatus {
  active,
  resolved,
}

extension BlockerStatusValueExtension on BlockerStatus {
  String toValue() {
    switch (this) {
      case BlockerStatus.active:
        return 'ACTIVE';
      case BlockerStatus.resolved:
        return 'RESOLVED';
    }
  }
}

extension BlockerStatusFromString on String {
  BlockerStatus toBlockerStatus() {
    switch (this) {
      case 'ACTIVE':
        return BlockerStatus.active;
      case 'RESOLVED':
        return BlockerStatus.resolved;
    }
    throw Exception('$this is not known in enum BlockerStatus');
  }
}

enum BlockerType {
  automated,
}

extension BlockerTypeValueExtension on BlockerType {
  String toValue() {
    switch (this) {
      case BlockerType.automated:
        return 'AUTOMATED';
    }
  }
}

extension BlockerTypeFromString on String {
  BlockerType toBlockerType() {
    switch (this) {
      case 'AUTOMATED':
        return BlockerType.automated;
    }
    throw Exception('$this is not known in enum BlockerType');
  }
}

/// A resource that is used to connect third-party source providers with
/// services like CodePipeline.
///
/// Note: A connection created through CloudFormation, the CLI, or the SDK is in
/// `PENDING` status by default. You can make its status `AVAILABLE` by updating
/// the connection in the console.
class Connection {
  /// The Amazon Resource Name (ARN) of the connection. The ARN is used as the
  /// connection reference when the connection is shared between Amazon Web
  /// Services.
  /// <note>
  /// The ARN is never reused if the connection is deleted.
  /// </note>
  final String? connectionArn;

  /// The name of the connection. Connection names must be unique in an Amazon Web
  /// Services account.
  final String? connectionName;

  /// The current status of the connection.
  final ConnectionStatus? connectionStatus;

  /// The Amazon Resource Name (ARN) of the host associated with the connection.
  final String? hostArn;

  /// The identifier of the external provider where your third-party code
  /// repository is configured. For Bitbucket, this is the account ID of the owner
  /// of the Bitbucket repository.
  final String? ownerAccountId;

  /// The name of the external provider where your third-party code repository is
  /// configured.
  final ProviderType? providerType;

  Connection({
    this.connectionArn,
    this.connectionName,
    this.connectionStatus,
    this.hostArn,
    this.ownerAccountId,
    this.providerType,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      connectionArn: json['ConnectionArn'] as String?,
      connectionName: json['ConnectionName'] as String?,
      connectionStatus:
          (json['ConnectionStatus'] as String?)?.toConnectionStatus(),
      hostArn: json['HostArn'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      providerType: (json['ProviderType'] as String?)?.toProviderType(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final connectionName = this.connectionName;
    final connectionStatus = this.connectionStatus;
    final hostArn = this.hostArn;
    final ownerAccountId = this.ownerAccountId;
    final providerType = this.providerType;
    return {
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionName != null) 'ConnectionName': connectionName,
      if (connectionStatus != null)
        'ConnectionStatus': connectionStatus.toValue(),
      if (hostArn != null) 'HostArn': hostArn,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (providerType != null) 'ProviderType': providerType.toValue(),
    };
  }
}

enum ConnectionStatus {
  pending,
  available,
  error,
}

extension ConnectionStatusValueExtension on ConnectionStatus {
  String toValue() {
    switch (this) {
      case ConnectionStatus.pending:
        return 'PENDING';
      case ConnectionStatus.available:
        return 'AVAILABLE';
      case ConnectionStatus.error:
        return 'ERROR';
    }
  }
}

extension ConnectionStatusFromString on String {
  ConnectionStatus toConnectionStatus() {
    switch (this) {
      case 'PENDING':
        return ConnectionStatus.pending;
      case 'AVAILABLE':
        return ConnectionStatus.available;
      case 'ERROR':
        return ConnectionStatus.error;
    }
    throw Exception('$this is not known in enum ConnectionStatus');
  }
}

class CreateConnectionOutput {
  /// The Amazon Resource Name (ARN) of the connection to be created. The ARN is
  /// used as the connection reference when the connection is shared between
  /// Amazon Web Services services.
  /// <note>
  /// The ARN is never reused if the connection is deleted.
  /// </note>
  final String connectionArn;

  /// Specifies the tags applied to the resource.
  final List<Tag>? tags;

  CreateConnectionOutput({
    required this.connectionArn,
    this.tags,
  });

  factory CreateConnectionOutput.fromJson(Map<String, dynamic> json) {
    return CreateConnectionOutput(
      connectionArn: json['ConnectionArn'] as String,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final tags = this.tags;
    return {
      'ConnectionArn': connectionArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateHostOutput {
  /// The Amazon Resource Name (ARN) of the host to be created.
  final String? hostArn;

  /// Tags for the created host.
  final List<Tag>? tags;

  CreateHostOutput({
    this.hostArn,
    this.tags,
  });

  factory CreateHostOutput.fromJson(Map<String, dynamic> json) {
    return CreateHostOutput(
      hostArn: json['HostArn'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final hostArn = this.hostArn;
    final tags = this.tags;
    return {
      if (hostArn != null) 'HostArn': hostArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateRepositoryLinkOutput {
  /// The returned information about the created repository link.
  final RepositoryLinkInfo repositoryLinkInfo;

  CreateRepositoryLinkOutput({
    required this.repositoryLinkInfo,
  });

  factory CreateRepositoryLinkOutput.fromJson(Map<String, dynamic> json) {
    return CreateRepositoryLinkOutput(
      repositoryLinkInfo: RepositoryLinkInfo.fromJson(
          json['RepositoryLinkInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryLinkInfo = this.repositoryLinkInfo;
    return {
      'RepositoryLinkInfo': repositoryLinkInfo,
    };
  }
}

class CreateSyncConfigurationOutput {
  /// The created sync configuration for the connection. A sync configuration
  /// allows Amazon Web Services to sync content from a Git repository to update a
  /// specified Amazon Web Services resource.
  final SyncConfiguration syncConfiguration;

  CreateSyncConfigurationOutput({
    required this.syncConfiguration,
  });

  factory CreateSyncConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return CreateSyncConfigurationOutput(
      syncConfiguration: SyncConfiguration.fromJson(
          json['SyncConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final syncConfiguration = this.syncConfiguration;
    return {
      'SyncConfiguration': syncConfiguration,
    };
  }
}

class DeleteConnectionOutput {
  DeleteConnectionOutput();

  factory DeleteConnectionOutput.fromJson(Map<String, dynamic> _) {
    return DeleteConnectionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteHostOutput {
  DeleteHostOutput();

  factory DeleteHostOutput.fromJson(Map<String, dynamic> _) {
    return DeleteHostOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRepositoryLinkOutput {
  DeleteRepositoryLinkOutput();

  factory DeleteRepositoryLinkOutput.fromJson(Map<String, dynamic> _) {
    return DeleteRepositoryLinkOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSyncConfigurationOutput {
  DeleteSyncConfigurationOutput();

  factory DeleteSyncConfigurationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteSyncConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetConnectionOutput {
  /// The connection details, such as status, owner, and provider type.
  final Connection? connection;

  GetConnectionOutput({
    this.connection,
  });

  factory GetConnectionOutput.fromJson(Map<String, dynamic> json) {
    return GetConnectionOutput(
      connection: json['Connection'] != null
          ? Connection.fromJson(json['Connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'Connection': connection,
    };
  }
}

class GetHostOutput {
  /// The name of the requested host.
  final String? name;

  /// The endpoint of the infrastructure represented by the requested host.
  final String? providerEndpoint;

  /// The provider type of the requested host, such as GitHub Enterprise Server.
  final ProviderType? providerType;

  /// The status of the requested host.
  final String? status;

  /// The VPC configuration of the requested host.
  final VpcConfiguration? vpcConfiguration;

  GetHostOutput({
    this.name,
    this.providerEndpoint,
    this.providerType,
    this.status,
    this.vpcConfiguration,
  });

  factory GetHostOutput.fromJson(Map<String, dynamic> json) {
    return GetHostOutput(
      name: json['Name'] as String?,
      providerEndpoint: json['ProviderEndpoint'] as String?,
      providerType: (json['ProviderType'] as String?)?.toProviderType(),
      status: json['Status'] as String?,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final providerEndpoint = this.providerEndpoint;
    final providerType = this.providerType;
    final status = this.status;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (name != null) 'Name': name,
      if (providerEndpoint != null) 'ProviderEndpoint': providerEndpoint,
      if (providerType != null) 'ProviderType': providerType.toValue(),
      if (status != null) 'Status': status,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

class GetRepositoryLinkOutput {
  /// The information returned for a specified repository link.
  final RepositoryLinkInfo repositoryLinkInfo;

  GetRepositoryLinkOutput({
    required this.repositoryLinkInfo,
  });

  factory GetRepositoryLinkOutput.fromJson(Map<String, dynamic> json) {
    return GetRepositoryLinkOutput(
      repositoryLinkInfo: RepositoryLinkInfo.fromJson(
          json['RepositoryLinkInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryLinkInfo = this.repositoryLinkInfo;
    return {
      'RepositoryLinkInfo': repositoryLinkInfo,
    };
  }
}

class GetRepositorySyncStatusOutput {
  /// The status of the latest sync returned for a specified repository and
  /// branch.
  final RepositorySyncAttempt latestSync;

  GetRepositorySyncStatusOutput({
    required this.latestSync,
  });

  factory GetRepositorySyncStatusOutput.fromJson(Map<String, dynamic> json) {
    return GetRepositorySyncStatusOutput(
      latestSync: RepositorySyncAttempt.fromJson(
          json['LatestSync'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final latestSync = this.latestSync;
    return {
      'LatestSync': latestSync,
    };
  }
}

class GetResourceSyncStatusOutput {
  /// The latest sync for the sync status with the Git repository, whether
  /// successful or not.
  final ResourceSyncAttempt latestSync;

  /// The desired state of the Amazon Web Services resource for the sync status
  /// with the Git repository.
  final Revision? desiredState;

  /// The latest successful sync for the sync status with the Git repository.
  final ResourceSyncAttempt? latestSuccessfulSync;

  GetResourceSyncStatusOutput({
    required this.latestSync,
    this.desiredState,
    this.latestSuccessfulSync,
  });

  factory GetResourceSyncStatusOutput.fromJson(Map<String, dynamic> json) {
    return GetResourceSyncStatusOutput(
      latestSync: ResourceSyncAttempt.fromJson(
          json['LatestSync'] as Map<String, dynamic>),
      desiredState: json['DesiredState'] != null
          ? Revision.fromJson(json['DesiredState'] as Map<String, dynamic>)
          : null,
      latestSuccessfulSync: json['LatestSuccessfulSync'] != null
          ? ResourceSyncAttempt.fromJson(
              json['LatestSuccessfulSync'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final latestSync = this.latestSync;
    final desiredState = this.desiredState;
    final latestSuccessfulSync = this.latestSuccessfulSync;
    return {
      'LatestSync': latestSync,
      if (desiredState != null) 'DesiredState': desiredState,
      if (latestSuccessfulSync != null)
        'LatestSuccessfulSync': latestSuccessfulSync,
    };
  }
}

class GetSyncBlockerSummaryOutput {
  /// The list of sync blockers for a specified resource.
  final SyncBlockerSummary syncBlockerSummary;

  GetSyncBlockerSummaryOutput({
    required this.syncBlockerSummary,
  });

  factory GetSyncBlockerSummaryOutput.fromJson(Map<String, dynamic> json) {
    return GetSyncBlockerSummaryOutput(
      syncBlockerSummary: SyncBlockerSummary.fromJson(
          json['SyncBlockerSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final syncBlockerSummary = this.syncBlockerSummary;
    return {
      'SyncBlockerSummary': syncBlockerSummary,
    };
  }
}

class GetSyncConfigurationOutput {
  /// The details about the sync configuration for which you want to retrieve
  /// information.
  final SyncConfiguration syncConfiguration;

  GetSyncConfigurationOutput({
    required this.syncConfiguration,
  });

  factory GetSyncConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return GetSyncConfigurationOutput(
      syncConfiguration: SyncConfiguration.fromJson(
          json['SyncConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final syncConfiguration = this.syncConfiguration;
    return {
      'SyncConfiguration': syncConfiguration,
    };
  }
}

/// A resource that represents the infrastructure where a third-party provider
/// is installed. The host is used when you create connections to an installed
/// third-party provider type, such as GitHub Enterprise Server. You create one
/// host for all connections to that provider.
/// <note>
/// A host created through the CLI or the SDK is in `PENDING` status by default.
/// You can make its status `AVAILABLE` by setting up the host in the console.
/// </note>
class Host {
  /// The Amazon Resource Name (ARN) of the host.
  final String? hostArn;

  /// The name of the host.
  final String? name;

  /// The endpoint of the infrastructure where your provider type is installed.
  final String? providerEndpoint;

  /// The name of the installed provider to be associated with your connection.
  /// The host resource represents the infrastructure where your provider type is
  /// installed. The valid provider type is GitHub Enterprise Server.
  final ProviderType? providerType;

  /// The status of the host, such as PENDING, AVAILABLE, VPC_CONFIG_DELETING,
  /// VPC_CONFIG_INITIALIZING, and VPC_CONFIG_FAILED_INITIALIZATION.
  final String? status;

  /// The status description for the host.
  final String? statusMessage;

  /// The VPC configuration provisioned for the host.
  final VpcConfiguration? vpcConfiguration;

  Host({
    this.hostArn,
    this.name,
    this.providerEndpoint,
    this.providerType,
    this.status,
    this.statusMessage,
    this.vpcConfiguration,
  });

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
      hostArn: json['HostArn'] as String?,
      name: json['Name'] as String?,
      providerEndpoint: json['ProviderEndpoint'] as String?,
      providerType: (json['ProviderType'] as String?)?.toProviderType(),
      status: json['Status'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hostArn = this.hostArn;
    final name = this.name;
    final providerEndpoint = this.providerEndpoint;
    final providerType = this.providerType;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (hostArn != null) 'HostArn': hostArn,
      if (name != null) 'Name': name,
      if (providerEndpoint != null) 'ProviderEndpoint': providerEndpoint,
      if (providerType != null) 'ProviderType': providerType.toValue(),
      if (status != null) 'Status': status,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

class ListConnectionsOutput {
  /// A list of connections and the details for each connection, such as status,
  /// owner, and provider type.
  final List<Connection>? connections;

  /// A token that can be used in the next <code>ListConnections</code> call. To
  /// view all items in the list, continue to call this operation with each
  /// subsequent token until no more <code>nextToken</code> values are returned.
  final String? nextToken;

  ListConnectionsOutput({
    this.connections,
    this.nextToken,
  });

  factory ListConnectionsOutput.fromJson(Map<String, dynamic> json) {
    return ListConnectionsOutput(
      connections: (json['Connections'] as List?)
          ?.whereNotNull()
          .map((e) => Connection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    final nextToken = this.nextToken;
    return {
      if (connections != null) 'Connections': connections,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListHostsOutput {
  /// A list of hosts and the details for each host, such as status, endpoint, and
  /// provider type.
  final List<Host>? hosts;

  /// A token that can be used in the next <code>ListHosts</code> call. To view
  /// all items in the list, continue to call this operation with each subsequent
  /// token until no more <code>nextToken</code> values are returned.
  final String? nextToken;

  ListHostsOutput({
    this.hosts,
    this.nextToken,
  });

  factory ListHostsOutput.fromJson(Map<String, dynamic> json) {
    return ListHostsOutput(
      hosts: (json['Hosts'] as List?)
          ?.whereNotNull()
          .map((e) => Host.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hosts = this.hosts;
    final nextToken = this.nextToken;
    return {
      if (hosts != null) 'Hosts': hosts,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRepositoryLinksOutput {
  /// Lists the repository links called by the list repository links operation.
  final List<RepositoryLinkInfo> repositoryLinks;

  /// An enumeration token that allows the operation to batch the results of the
  /// operation.
  final String? nextToken;

  ListRepositoryLinksOutput({
    required this.repositoryLinks,
    this.nextToken,
  });

  factory ListRepositoryLinksOutput.fromJson(Map<String, dynamic> json) {
    return ListRepositoryLinksOutput(
      repositoryLinks: (json['RepositoryLinks'] as List)
          .whereNotNull()
          .map((e) => RepositoryLinkInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryLinks = this.repositoryLinks;
    final nextToken = this.nextToken;
    return {
      'RepositoryLinks': repositoryLinks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRepositorySyncDefinitionsOutput {
  /// The list of repository sync definitions returned by the request. A
  /// <code>RepositorySyncDefinition</code> is a mapping from a repository branch
  /// to all the Amazon Web Services resources that are being synced from that
  /// branch.
  final List<RepositorySyncDefinition> repositorySyncDefinitions;

  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  final String? nextToken;

  ListRepositorySyncDefinitionsOutput({
    required this.repositorySyncDefinitions,
    this.nextToken,
  });

  factory ListRepositorySyncDefinitionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListRepositorySyncDefinitionsOutput(
      repositorySyncDefinitions: (json['RepositorySyncDefinitions'] as List)
          .whereNotNull()
          .map((e) =>
              RepositorySyncDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final repositorySyncDefinitions = this.repositorySyncDefinitions;
    final nextToken = this.nextToken;
    return {
      'RepositorySyncDefinitions': repositorySyncDefinitions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSyncConfigurationsOutput {
  /// The list of repository sync definitions returned by the request.
  final List<SyncConfiguration> syncConfigurations;

  /// An enumeration token that allows the operation to batch the next results of
  /// the operation.
  final String? nextToken;

  ListSyncConfigurationsOutput({
    required this.syncConfigurations,
    this.nextToken,
  });

  factory ListSyncConfigurationsOutput.fromJson(Map<String, dynamic> json) {
    return ListSyncConfigurationsOutput(
      syncConfigurations: (json['SyncConfigurations'] as List)
          .whereNotNull()
          .map((e) => SyncConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final syncConfigurations = this.syncConfigurations;
    final nextToken = this.nextToken;
    return {
      'SyncConfigurations': syncConfigurations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceOutput {
  /// A list of tag key and value pairs associated with the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceOutput({
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum ProviderType {
  bitbucket,
  gitHub,
  gitHubEnterpriseServer,
  gitLab,
  gitLabSelfManaged,
}

extension ProviderTypeValueExtension on ProviderType {
  String toValue() {
    switch (this) {
      case ProviderType.bitbucket:
        return 'Bitbucket';
      case ProviderType.gitHub:
        return 'GitHub';
      case ProviderType.gitHubEnterpriseServer:
        return 'GitHubEnterpriseServer';
      case ProviderType.gitLab:
        return 'GitLab';
      case ProviderType.gitLabSelfManaged:
        return 'GitLabSelfManaged';
    }
  }
}

extension ProviderTypeFromString on String {
  ProviderType toProviderType() {
    switch (this) {
      case 'Bitbucket':
        return ProviderType.bitbucket;
      case 'GitHub':
        return ProviderType.gitHub;
      case 'GitHubEnterpriseServer':
        return ProviderType.gitHubEnterpriseServer;
      case 'GitLab':
        return ProviderType.gitLab;
      case 'GitLabSelfManaged':
        return ProviderType.gitLabSelfManaged;
    }
    throw Exception('$this is not known in enum ProviderType');
  }
}

enum PublishDeploymentStatus {
  enabled,
  disabled,
}

extension PublishDeploymentStatusValueExtension on PublishDeploymentStatus {
  String toValue() {
    switch (this) {
      case PublishDeploymentStatus.enabled:
        return 'ENABLED';
      case PublishDeploymentStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension PublishDeploymentStatusFromString on String {
  PublishDeploymentStatus toPublishDeploymentStatus() {
    switch (this) {
      case 'ENABLED':
        return PublishDeploymentStatus.enabled;
      case 'DISABLED':
        return PublishDeploymentStatus.disabled;
    }
    throw Exception('$this is not known in enum PublishDeploymentStatus');
  }
}

/// Information about the repository link resource, such as the repository link
/// ARN, the associated connection ARN, encryption key ARN, and owner ID.
class RepositoryLinkInfo {
  /// The Amazon Resource Name (ARN) of the connection associated with the
  /// repository link.
  final String connectionArn;

  /// The owner ID for the repository associated with the repository link, such as
  /// the owner ID in GitHub.
  final String ownerId;

  /// The provider type for the connection, such as GitHub, associated with the
  /// repository link.
  final ProviderType providerType;

  /// The Amazon Resource Name (ARN) of the repository link.
  final String repositoryLinkArn;

  /// The ID of the repository link.
  final String repositoryLinkId;

  /// The name of the repository associated with the repository link.
  final String repositoryName;

  /// The Amazon Resource Name (ARN) of the encryption key for the repository
  /// associated with the repository link.
  final String? encryptionKeyArn;

  RepositoryLinkInfo({
    required this.connectionArn,
    required this.ownerId,
    required this.providerType,
    required this.repositoryLinkArn,
    required this.repositoryLinkId,
    required this.repositoryName,
    this.encryptionKeyArn,
  });

  factory RepositoryLinkInfo.fromJson(Map<String, dynamic> json) {
    return RepositoryLinkInfo(
      connectionArn: json['ConnectionArn'] as String,
      ownerId: json['OwnerId'] as String,
      providerType: (json['ProviderType'] as String).toProviderType(),
      repositoryLinkArn: json['RepositoryLinkArn'] as String,
      repositoryLinkId: json['RepositoryLinkId'] as String,
      repositoryName: json['RepositoryName'] as String,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionArn = this.connectionArn;
    final ownerId = this.ownerId;
    final providerType = this.providerType;
    final repositoryLinkArn = this.repositoryLinkArn;
    final repositoryLinkId = this.repositoryLinkId;
    final repositoryName = this.repositoryName;
    final encryptionKeyArn = this.encryptionKeyArn;
    return {
      'ConnectionArn': connectionArn,
      'OwnerId': ownerId,
      'ProviderType': providerType.toValue(),
      'RepositoryLinkArn': repositoryLinkArn,
      'RepositoryLinkId': repositoryLinkId,
      'RepositoryName': repositoryName,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
    };
  }
}

/// Information about a repository sync attempt for a repository with a sync
/// configuration.
class RepositorySyncAttempt {
  /// The events associated with a specific sync attempt.
  final List<RepositorySyncEvent> events;

  /// The start time of a specific sync attempt.
  final DateTime startedAt;

  /// The status of a specific sync attempt. The following are valid statuses:
  ///
  /// <ul>
  /// <li>
  /// INITIATED - A repository sync attempt has been created and will begin soon.
  /// </li>
  /// <li>
  /// IN_PROGRESS - A repository sync attempt has started and work is being done
  /// to reconcile the branch.
  /// </li>
  /// <li>
  /// SUCCEEDED - The repository sync attempt has completed successfully.
  /// </li>
  /// <li>
  /// FAILED - The repository sync attempt has failed.
  /// </li>
  /// <li>
  /// QUEUED - The repository sync attempt didn't execute and was queued.
  /// </li>
  /// </ul>
  final RepositorySyncStatus status;

  RepositorySyncAttempt({
    required this.events,
    required this.startedAt,
    required this.status,
  });

  factory RepositorySyncAttempt.fromJson(Map<String, dynamic> json) {
    return RepositorySyncAttempt(
      events: (json['Events'] as List)
          .whereNotNull()
          .map((e) => RepositorySyncEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      startedAt: nonNullableTimeStampFromJson(json['StartedAt'] as Object),
      status: (json['Status'] as String).toRepositorySyncStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final startedAt = this.startedAt;
    final status = this.status;
    return {
      'Events': events,
      'StartedAt': unixTimestampToJson(startedAt),
      'Status': status.toValue(),
    };
  }
}

/// The definition for a repository with a sync configuration.
class RepositorySyncDefinition {
  /// The branch specified for a repository sync definition.
  final String branch;

  /// The configuration file for a repository sync definition. This value comes
  /// from creating or updating the <code>config-file</code> field of a
  /// <code>sync-configuration</code>.
  final String directory;

  /// The parent resource specified for a repository sync definition.
  final String parent;

  /// The target resource specified for a repository sync definition. In some
  /// cases, such as CFN_STACK_SYNC, the parent and target resource are the same.
  final String target;

  RepositorySyncDefinition({
    required this.branch,
    required this.directory,
    required this.parent,
    required this.target,
  });

  factory RepositorySyncDefinition.fromJson(Map<String, dynamic> json) {
    return RepositorySyncDefinition(
      branch: json['Branch'] as String,
      directory: json['Directory'] as String,
      parent: json['Parent'] as String,
      target: json['Target'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    final directory = this.directory;
    final parent = this.parent;
    final target = this.target;
    return {
      'Branch': branch,
      'Directory': directory,
      'Parent': parent,
      'Target': target,
    };
  }
}

/// Information about a repository sync event.
class RepositorySyncEvent {
  /// A description of a repository sync event.
  final String event;

  /// The time that a repository sync event occurred.
  final DateTime time;

  /// The event type for a repository sync event.
  final String type;

  /// The ID for a repository sync event.
  final String? externalId;

  RepositorySyncEvent({
    required this.event,
    required this.time,
    required this.type,
    this.externalId,
  });

  factory RepositorySyncEvent.fromJson(Map<String, dynamic> json) {
    return RepositorySyncEvent(
      event: json['Event'] as String,
      time: nonNullableTimeStampFromJson(json['Time'] as Object),
      type: json['Type'] as String,
      externalId: json['ExternalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final time = this.time;
    final type = this.type;
    final externalId = this.externalId;
    return {
      'Event': event,
      'Time': unixTimestampToJson(time),
      'Type': type,
      if (externalId != null) 'ExternalId': externalId,
    };
  }
}

enum RepositorySyncStatus {
  failed,
  initiated,
  inProgress,
  succeeded,
  queued,
}

extension RepositorySyncStatusValueExtension on RepositorySyncStatus {
  String toValue() {
    switch (this) {
      case RepositorySyncStatus.failed:
        return 'FAILED';
      case RepositorySyncStatus.initiated:
        return 'INITIATED';
      case RepositorySyncStatus.inProgress:
        return 'IN_PROGRESS';
      case RepositorySyncStatus.succeeded:
        return 'SUCCEEDED';
      case RepositorySyncStatus.queued:
        return 'QUEUED';
    }
  }
}

extension RepositorySyncStatusFromString on String {
  RepositorySyncStatus toRepositorySyncStatus() {
    switch (this) {
      case 'FAILED':
        return RepositorySyncStatus.failed;
      case 'INITIATED':
        return RepositorySyncStatus.initiated;
      case 'IN_PROGRESS':
        return RepositorySyncStatus.inProgress;
      case 'SUCCEEDED':
        return RepositorySyncStatus.succeeded;
      case 'QUEUED':
        return RepositorySyncStatus.queued;
    }
    throw Exception('$this is not known in enum RepositorySyncStatus');
  }
}

/// Information about a resource sync attempt.
class ResourceSyncAttempt {
  /// The events related to a resource sync attempt.
  final List<ResourceSyncEvent> events;

  /// The current state of the resource as defined in the resource's
  /// <code>config-file</code> in the linked repository.
  final Revision initialRevision;

  /// The start time for a resource sync attempt.
  final DateTime startedAt;

  /// The status for a resource sync attempt. The follow are valid statuses:
  ///
  /// <ul>
  /// <li>
  /// SYNC-INITIATED - A resource sync attempt has been created and will begin
  /// soon.
  /// </li>
  /// <li>
  /// SYNCING - Syncing has started and work is being done to reconcile state.
  /// </li>
  /// <li>
  /// SYNCED - Syncing has completed successfully.
  /// </li>
  /// <li>
  /// SYNC_FAILED - A resource sync attempt has failed.
  /// </li>
  /// </ul>
  final ResourceSyncStatus status;

  /// The name of the Amazon Web Services resource that is attempted to be
  /// synchronized.
  final String target;

  /// The desired state of the resource as defined in the resource's
  /// <code>config-file</code> in the linked repository. Git sync attempts to
  /// update the resource to this state.
  final Revision targetRevision;

  ResourceSyncAttempt({
    required this.events,
    required this.initialRevision,
    required this.startedAt,
    required this.status,
    required this.target,
    required this.targetRevision,
  });

  factory ResourceSyncAttempt.fromJson(Map<String, dynamic> json) {
    return ResourceSyncAttempt(
      events: (json['Events'] as List)
          .whereNotNull()
          .map((e) => ResourceSyncEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      initialRevision:
          Revision.fromJson(json['InitialRevision'] as Map<String, dynamic>),
      startedAt: nonNullableTimeStampFromJson(json['StartedAt'] as Object),
      status: (json['Status'] as String).toResourceSyncStatus(),
      target: json['Target'] as String,
      targetRevision:
          Revision.fromJson(json['TargetRevision'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final initialRevision = this.initialRevision;
    final startedAt = this.startedAt;
    final status = this.status;
    final target = this.target;
    final targetRevision = this.targetRevision;
    return {
      'Events': events,
      'InitialRevision': initialRevision,
      'StartedAt': unixTimestampToJson(startedAt),
      'Status': status.toValue(),
      'Target': target,
      'TargetRevision': targetRevision,
    };
  }
}

/// Information about a resource sync event for the resource associated with a
/// sync configuration.
class ResourceSyncEvent {
  /// The event for a resource sync event.
  final String event;

  /// The time that a resource sync event occurred.
  final DateTime time;

  /// The type of resource sync event.
  final String type;

  /// The ID for a resource sync event.
  final String? externalId;

  ResourceSyncEvent({
    required this.event,
    required this.time,
    required this.type,
    this.externalId,
  });

  factory ResourceSyncEvent.fromJson(Map<String, dynamic> json) {
    return ResourceSyncEvent(
      event: json['Event'] as String,
      time: nonNullableTimeStampFromJson(json['Time'] as Object),
      type: json['Type'] as String,
      externalId: json['ExternalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final time = this.time;
    final type = this.type;
    final externalId = this.externalId;
    return {
      'Event': event,
      'Time': unixTimestampToJson(time),
      'Type': type,
      if (externalId != null) 'ExternalId': externalId,
    };
  }
}

enum ResourceSyncStatus {
  failed,
  initiated,
  inProgress,
  succeeded,
}

extension ResourceSyncStatusValueExtension on ResourceSyncStatus {
  String toValue() {
    switch (this) {
      case ResourceSyncStatus.failed:
        return 'FAILED';
      case ResourceSyncStatus.initiated:
        return 'INITIATED';
      case ResourceSyncStatus.inProgress:
        return 'IN_PROGRESS';
      case ResourceSyncStatus.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension ResourceSyncStatusFromString on String {
  ResourceSyncStatus toResourceSyncStatus() {
    switch (this) {
      case 'FAILED':
        return ResourceSyncStatus.failed;
      case 'INITIATED':
        return ResourceSyncStatus.initiated;
      case 'IN_PROGRESS':
        return ResourceSyncStatus.inProgress;
      case 'SUCCEEDED':
        return ResourceSyncStatus.succeeded;
    }
    throw Exception('$this is not known in enum ResourceSyncStatus');
  }
}

/// Information about the revision for a specific sync event, such as the
/// branch, owner ID, and name of the repository.
class Revision {
  /// The branch name for a specific revision.
  final String branch;

  /// The directory, if any, for a specific revision.
  final String directory;

  /// The owner ID for a specific revision, such as the GitHub owner ID for a
  /// GitHub repository.
  final String ownerId;

  /// The provider type for a revision, such as GitHub.
  final ProviderType providerType;

  /// The repository name for a specific revision.
  final String repositoryName;

  /// The SHA, such as the commit ID, for a specific revision.
  final String sha;

  Revision({
    required this.branch,
    required this.directory,
    required this.ownerId,
    required this.providerType,
    required this.repositoryName,
    required this.sha,
  });

  factory Revision.fromJson(Map<String, dynamic> json) {
    return Revision(
      branch: json['Branch'] as String,
      directory: json['Directory'] as String,
      ownerId: json['OwnerId'] as String,
      providerType: (json['ProviderType'] as String).toProviderType(),
      repositoryName: json['RepositoryName'] as String,
      sha: json['Sha'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    final directory = this.directory;
    final ownerId = this.ownerId;
    final providerType = this.providerType;
    final repositoryName = this.repositoryName;
    final sha = this.sha;
    return {
      'Branch': branch,
      'Directory': directory,
      'OwnerId': ownerId,
      'ProviderType': providerType.toValue(),
      'RepositoryName': repositoryName,
      'Sha': sha,
    };
  }
}

/// Information about a blocker for a sync event.
class SyncBlocker {
  /// The creation time for a specific sync blocker.
  final DateTime createdAt;

  /// The provided reason for a specific sync blocker.
  final String createdReason;

  /// The ID for a specific sync blocker.
  final String id;

  /// The status for a specific sync blocker.
  final BlockerStatus status;

  /// The sync blocker type.
  final BlockerType type;

  /// The contexts for a specific sync blocker.
  final List<SyncBlockerContext>? contexts;

  /// The time that a specific sync blocker was resolved.
  final DateTime? resolvedAt;

  /// The resolved reason for a specific sync blocker.
  final String? resolvedReason;

  SyncBlocker({
    required this.createdAt,
    required this.createdReason,
    required this.id,
    required this.status,
    required this.type,
    this.contexts,
    this.resolvedAt,
    this.resolvedReason,
  });

  factory SyncBlocker.fromJson(Map<String, dynamic> json) {
    return SyncBlocker(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      createdReason: json['CreatedReason'] as String,
      id: json['Id'] as String,
      status: (json['Status'] as String).toBlockerStatus(),
      type: (json['Type'] as String).toBlockerType(),
      contexts: (json['Contexts'] as List?)
          ?.whereNotNull()
          .map((e) => SyncBlockerContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolvedAt: timeStampFromJson(json['ResolvedAt']),
      resolvedReason: json['ResolvedReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdReason = this.createdReason;
    final id = this.id;
    final status = this.status;
    final type = this.type;
    final contexts = this.contexts;
    final resolvedAt = this.resolvedAt;
    final resolvedReason = this.resolvedReason;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'CreatedReason': createdReason,
      'Id': id,
      'Status': status.toValue(),
      'Type': type.toValue(),
      if (contexts != null) 'Contexts': contexts,
      if (resolvedAt != null) 'ResolvedAt': unixTimestampToJson(resolvedAt),
      if (resolvedReason != null) 'ResolvedReason': resolvedReason,
    };
  }
}

/// The context for a specific sync blocker.
class SyncBlockerContext {
  /// The key provided for a context key-value pair for a specific sync blocker.
  final String key;

  /// The value provided for a context key-value pair for a specific sync blocker.
  final String value;

  SyncBlockerContext({
    required this.key,
    required this.value,
  });

  factory SyncBlockerContext.fromJson(Map<String, dynamic> json) {
    return SyncBlockerContext(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// A summary for sync blockers.
class SyncBlockerSummary {
  /// The resource name for sync blocker summary.
  final String resourceName;

  /// The latest events for a sync blocker summary.
  final List<SyncBlocker>? latestBlockers;

  /// The parent resource name for a sync blocker summary.
  final String? parentResourceName;

  SyncBlockerSummary({
    required this.resourceName,
    this.latestBlockers,
    this.parentResourceName,
  });

  factory SyncBlockerSummary.fromJson(Map<String, dynamic> json) {
    return SyncBlockerSummary(
      resourceName: json['ResourceName'] as String,
      latestBlockers: (json['LatestBlockers'] as List?)
          ?.whereNotNull()
          .map((e) => SyncBlocker.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentResourceName: json['ParentResourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceName = this.resourceName;
    final latestBlockers = this.latestBlockers;
    final parentResourceName = this.parentResourceName;
    return {
      'ResourceName': resourceName,
      if (latestBlockers != null) 'LatestBlockers': latestBlockers,
      if (parentResourceName != null) 'ParentResourceName': parentResourceName,
    };
  }
}

/// Information, such as repository, branch, provider, and resource names for a
/// specific sync configuration.
class SyncConfiguration {
  /// The branch associated with a specific sync configuration.
  final String branch;

  /// The owner ID for the repository associated with a specific sync
  /// configuration, such as the owner ID in GitHub.
  final String ownerId;

  /// The connection provider type associated with a specific sync configuration,
  /// such as GitHub.
  final ProviderType providerType;

  /// The ID of the repository link associated with a specific sync configuration.
  final String repositoryLinkId;

  /// The name of the repository associated with a specific sync configuration.
  final String repositoryName;

  /// The name of the connection resource associated with a specific sync
  /// configuration.
  final String resourceName;

  /// The Amazon Resource Name (ARN) of the IAM role associated with a specific
  /// sync configuration.
  final String roleArn;

  /// The type of sync for a specific sync configuration.
  final SyncConfigurationType syncType;

  /// The file path to the configuration file associated with a specific sync
  /// configuration. The path should point to an actual file in the sync
  /// configurations linked repository.
  final String? configFile;

  /// Whether to enable or disable publishing of deployment status to source
  /// providers.
  final PublishDeploymentStatus? publishDeploymentStatus;

  /// When to trigger Git sync to begin the stack update.
  final TriggerResourceUpdateOn? triggerResourceUpdateOn;

  SyncConfiguration({
    required this.branch,
    required this.ownerId,
    required this.providerType,
    required this.repositoryLinkId,
    required this.repositoryName,
    required this.resourceName,
    required this.roleArn,
    required this.syncType,
    this.configFile,
    this.publishDeploymentStatus,
    this.triggerResourceUpdateOn,
  });

  factory SyncConfiguration.fromJson(Map<String, dynamic> json) {
    return SyncConfiguration(
      branch: json['Branch'] as String,
      ownerId: json['OwnerId'] as String,
      providerType: (json['ProviderType'] as String).toProviderType(),
      repositoryLinkId: json['RepositoryLinkId'] as String,
      repositoryName: json['RepositoryName'] as String,
      resourceName: json['ResourceName'] as String,
      roleArn: json['RoleArn'] as String,
      syncType: (json['SyncType'] as String).toSyncConfigurationType(),
      configFile: json['ConfigFile'] as String?,
      publishDeploymentStatus: (json['PublishDeploymentStatus'] as String?)
          ?.toPublishDeploymentStatus(),
      triggerResourceUpdateOn: (json['TriggerResourceUpdateOn'] as String?)
          ?.toTriggerResourceUpdateOn(),
    );
  }

  Map<String, dynamic> toJson() {
    final branch = this.branch;
    final ownerId = this.ownerId;
    final providerType = this.providerType;
    final repositoryLinkId = this.repositoryLinkId;
    final repositoryName = this.repositoryName;
    final resourceName = this.resourceName;
    final roleArn = this.roleArn;
    final syncType = this.syncType;
    final configFile = this.configFile;
    final publishDeploymentStatus = this.publishDeploymentStatus;
    final triggerResourceUpdateOn = this.triggerResourceUpdateOn;
    return {
      'Branch': branch,
      'OwnerId': ownerId,
      'ProviderType': providerType.toValue(),
      'RepositoryLinkId': repositoryLinkId,
      'RepositoryName': repositoryName,
      'ResourceName': resourceName,
      'RoleArn': roleArn,
      'SyncType': syncType.toValue(),
      if (configFile != null) 'ConfigFile': configFile,
      if (publishDeploymentStatus != null)
        'PublishDeploymentStatus': publishDeploymentStatus.toValue(),
      if (triggerResourceUpdateOn != null)
        'TriggerResourceUpdateOn': triggerResourceUpdateOn.toValue(),
    };
  }
}

enum SyncConfigurationType {
  cfnStackSync,
}

extension SyncConfigurationTypeValueExtension on SyncConfigurationType {
  String toValue() {
    switch (this) {
      case SyncConfigurationType.cfnStackSync:
        return 'CFN_STACK_SYNC';
    }
  }
}

extension SyncConfigurationTypeFromString on String {
  SyncConfigurationType toSyncConfigurationType() {
    switch (this) {
      case 'CFN_STACK_SYNC':
        return SyncConfigurationType.cfnStackSync;
    }
    throw Exception('$this is not known in enum SyncConfigurationType');
  }
}

/// A tag is a key-value pair that is used to manage the resource.
///
/// This tag is available for use by Amazon Web Services services that support
/// tags.
class Tag {
  /// The tag's key.
  final String key;

  /// The tag's value.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TriggerResourceUpdateOn {
  anyChange,
  fileChange,
}

extension TriggerResourceUpdateOnValueExtension on TriggerResourceUpdateOn {
  String toValue() {
    switch (this) {
      case TriggerResourceUpdateOn.anyChange:
        return 'ANY_CHANGE';
      case TriggerResourceUpdateOn.fileChange:
        return 'FILE_CHANGE';
    }
  }
}

extension TriggerResourceUpdateOnFromString on String {
  TriggerResourceUpdateOn toTriggerResourceUpdateOn() {
    switch (this) {
      case 'ANY_CHANGE':
        return TriggerResourceUpdateOn.anyChange;
      case 'FILE_CHANGE':
        return TriggerResourceUpdateOn.fileChange;
    }
    throw Exception('$this is not known in enum TriggerResourceUpdateOn');
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateHostOutput {
  UpdateHostOutput();

  factory UpdateHostOutput.fromJson(Map<String, dynamic> _) {
    return UpdateHostOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateRepositoryLinkOutput {
  /// Information about the repository link to be updated.
  final RepositoryLinkInfo repositoryLinkInfo;

  UpdateRepositoryLinkOutput({
    required this.repositoryLinkInfo,
  });

  factory UpdateRepositoryLinkOutput.fromJson(Map<String, dynamic> json) {
    return UpdateRepositoryLinkOutput(
      repositoryLinkInfo: RepositoryLinkInfo.fromJson(
          json['RepositoryLinkInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryLinkInfo = this.repositoryLinkInfo;
    return {
      'RepositoryLinkInfo': repositoryLinkInfo,
    };
  }
}

class UpdateSyncBlockerOutput {
  /// The resource name for the sync blocker.
  final String resourceName;

  /// Information about the sync blocker to be updated.
  final SyncBlocker syncBlocker;

  /// The parent resource name for the sync blocker.
  final String? parentResourceName;

  UpdateSyncBlockerOutput({
    required this.resourceName,
    required this.syncBlocker,
    this.parentResourceName,
  });

  factory UpdateSyncBlockerOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSyncBlockerOutput(
      resourceName: json['ResourceName'] as String,
      syncBlocker:
          SyncBlocker.fromJson(json['SyncBlocker'] as Map<String, dynamic>),
      parentResourceName: json['ParentResourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceName = this.resourceName;
    final syncBlocker = this.syncBlocker;
    final parentResourceName = this.parentResourceName;
    return {
      'ResourceName': resourceName,
      'SyncBlocker': syncBlocker,
      if (parentResourceName != null) 'ParentResourceName': parentResourceName,
    };
  }
}

class UpdateSyncConfigurationOutput {
  /// The information returned for the sync configuration to be updated.
  final SyncConfiguration syncConfiguration;

  UpdateSyncConfigurationOutput({
    required this.syncConfiguration,
  });

  factory UpdateSyncConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSyncConfigurationOutput(
      syncConfiguration: SyncConfiguration.fromJson(
          json['SyncConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final syncConfiguration = this.syncConfiguration;
    return {
      'SyncConfiguration': syncConfiguration,
    };
  }
}

/// The VPC configuration provisioned for the host.
class VpcConfiguration {
  /// The ID of the security group or security groups associated with the Amazon
  /// VPC connected to the infrastructure where your provider type is installed.
  final List<String> securityGroupIds;

  /// The ID of the subnet or subnets associated with the Amazon VPC connected to
  /// the infrastructure where your provider type is installed.
  final List<String> subnetIds;

  /// The ID of the Amazon VPC connected to the infrastructure where your provider
  /// type is installed.
  final String vpcId;

  /// The value of the Transport Layer Security (TLS) certificate associated with
  /// the infrastructure where your provider type is installed.
  final String? tlsCertificate;

  VpcConfiguration({
    required this.securityGroupIds,
    required this.subnetIds,
    required this.vpcId,
    this.tlsCertificate,
  });

  factory VpcConfiguration.fromJson(Map<String, dynamic> json) {
    return VpcConfiguration(
      securityGroupIds: (json['SecurityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String,
      tlsCertificate: json['TlsCertificate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final tlsCertificate = this.tlsCertificate;
    return {
      'SecurityGroupIds': securityGroupIds,
      'SubnetIds': subnetIds,
      'VpcId': vpcId,
      if (tlsCertificate != null) 'TlsCertificate': tlsCertificate,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConditionalCheckFailedException extends _s.GenericAwsException {
  ConditionalCheckFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'ConditionalCheckFailedException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class RetryLatestCommitFailedException extends _s.GenericAwsException {
  RetryLatestCommitFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'RetryLatestCommitFailedException',
            message: message);
}

class SyncBlockerDoesNotExistException extends _s.GenericAwsException {
  SyncBlockerDoesNotExistException({String? type, String? message})
      : super(
            type: type,
            code: 'SyncBlockerDoesNotExistException',
            message: message);
}

class SyncConfigurationStillExistsException extends _s.GenericAwsException {
  SyncConfigurationStillExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'SyncConfigurationStillExistsException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

class UnsupportedProviderTypeException extends _s.GenericAwsException {
  UnsupportedProviderTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedProviderTypeException',
            message: message);
}

class UpdateOutOfSyncException extends _s.GenericAwsException {
  UpdateOutOfSyncException({String? type, String? message})
      : super(type: type, code: 'UpdateOutOfSyncException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConditionalCheckFailedException': (type, message) =>
      ConditionalCheckFailedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceUnavailableException': (type, message) =>
      ResourceUnavailableException(type: type, message: message),
  'RetryLatestCommitFailedException': (type, message) =>
      RetryLatestCommitFailedException(type: type, message: message),
  'SyncBlockerDoesNotExistException': (type, message) =>
      SyncBlockerDoesNotExistException(type: type, message: message),
  'SyncConfigurationStillExistsException': (type, message) =>
      SyncConfigurationStillExistsException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
  'UnsupportedProviderTypeException': (type, message) =>
      UnsupportedProviderTypeException(type: type, message: message),
  'UpdateOutOfSyncException': (type, message) =>
      UpdateOutOfSyncException(type: type, message: message),
};
