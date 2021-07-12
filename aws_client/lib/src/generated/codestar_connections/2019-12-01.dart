// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// This AWS CodeStar Connections API Reference provides descriptions and usage
/// examples of the operations and data types for the AWS CodeStar Connections
/// API. You can use the connections API to work with connections and
/// installations.
class CodeStarConnections {
  final _s.JsonProtocol _protocol;
  CodeStarConnections({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codestar-connections',
            signingName: 'codestar-connections',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a connection that can then be given to other AWS services like
  /// CodePipeline so that it can access third-party code repositories. The
  /// connection is in pending status until the third-party connection handshake
  /// is completed from the console.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceUnavailableException].
  ///
  /// Parameter [connectionName] :
  /// The name of the connection to be created. The name must be unique in the
  /// calling AWS account.
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
    ArgumentError.checkNotNull(connectionName, 'connectionName');
    _s.validateStringLength(
      'connectionName',
      connectionName,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringLength(
      'hostArn',
      hostArn,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.CreateConnection'
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
  /// The name of the host to be created. The name must be unique in the calling
  /// AWS account.
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
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(providerEndpoint, 'providerEndpoint');
    _s.validateStringLength(
      'providerEndpoint',
      providerEndpoint,
      1,
      512,
      isRequired: true,
    );
    ArgumentError.checkNotNull(providerType, 'providerType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.CreateHost'
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
    ArgumentError.checkNotNull(connectionArn, 'connectionArn');
    _s.validateStringLength(
      'connectionArn',
      connectionArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.DeleteConnection'
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
    ArgumentError.checkNotNull(hostArn, 'hostArn');
    _s.validateStringLength(
      'hostArn',
      hostArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.DeleteHost'
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
    ArgumentError.checkNotNull(connectionArn, 'connectionArn');
    _s.validateStringLength(
      'connectionArn',
      connectionArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.GetConnection'
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
    ArgumentError.checkNotNull(hostArn, 'hostArn');
    _s.validateStringLength(
      'hostArn',
      hostArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.GetHost'
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

  /// Lists the connections associated with your account.
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
    _s.validateStringLength(
      'hostArnFilter',
      hostArnFilter,
      0,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.ListConnections'
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.ListHosts'
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.ListTagsForResource'
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.TagResource'
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

  /// Removes tags from an AWS resource.
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.UntagResource'
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
    ArgumentError.checkNotNull(hostArn, 'hostArn');
    _s.validateStringLength(
      'hostArn',
      hostArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'providerEndpoint',
      providerEndpoint,
      1,
      512,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.UpdateHost'
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
}

/// A resource that is used to connect third-party source providers with
/// services like AWS CodePipeline.
///
/// Note: A connection created through CloudFormation, the CLI, or the SDK is in
/// `PENDING` status by default. You can make its status `AVAILABLE` by updating
/// the connection in the console.
class Connection {
  /// The Amazon Resource Name (ARN) of the connection. The ARN is used as the
  /// connection reference when the connection is shared between AWS services.
  /// <note>
  /// The ARN is never reused if the connection is deleted.
  /// </note>
  final String? connectionArn;

  /// The name of the connection. Connection names must be unique in an AWS user
  /// account.
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

extension on ConnectionStatus {
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

extension on String {
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
  /// used as the connection reference when the connection is shared between AWS
  /// services.
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
}

extension on ProviderType {
  String toValue() {
    switch (this) {
      case ProviderType.bitbucket:
        return 'Bitbucket';
      case ProviderType.gitHub:
        return 'GitHub';
      case ProviderType.gitHubEnterpriseServer:
        return 'GitHubEnterpriseServer';
    }
  }
}

extension on String {
  ProviderType toProviderType() {
    switch (this) {
      case 'Bitbucket':
        return ProviderType.bitbucket;
      case 'GitHub':
        return ProviderType.gitHub;
      case 'GitHubEnterpriseServer':
        return ProviderType.gitHubEnterpriseServer;
    }
    throw Exception('$this is not known in enum ProviderType');
  }
}

/// A tag is a key-value pair that is used to manage the resource.
///
/// This tag is available for use by AWS services that support tags.
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

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
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

class UnsupportedOperationException extends _s.GenericAwsException {
  UnsupportedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceUnavailableException': (type, message) =>
      ResourceUnavailableException(type: type, message: message),
  'UnsupportedOperationException': (type, message) =>
      UnsupportedOperationException(type: type, message: message),
};
