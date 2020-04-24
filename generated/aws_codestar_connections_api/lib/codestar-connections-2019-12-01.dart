// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'codestar-connections-2019-12-01.g.dart';

/// This AWS CodeStar Connections API Reference provides descriptions and usage
/// examples of the operations and data types for the AWS CodeStar Connections
/// API. You can use the Connections API to work with connections and
/// installations.
///
/// <i>Connections</i> are configurations that you use to connect AWS resources
/// to external code repositories. Each connection is a resource that can be
/// given to services such as CodePipeline to connect to a third-party
/// repository such as Bitbucket. For example, you can add the connection in
/// CodePipeline so that it triggers your pipeline when a code change is made to
/// your third-party code repository. Each connection is named and associated
/// with a unique ARN that is used to reference the connection.
///
/// When you create a connection, the console initiates a third-party connection
/// handshake. <i>Installations</i> are the apps that are used to conduct this
/// handshake. For example, the installation for the Bitbucket provider type is
/// the Bitbucket Cloud app. When you create a connection, you can choose an
/// existing installation or create one.
///
/// You can work with connections by calling:
///
/// <ul>
/// <li>
/// <a>CreateConnection</a>, which creates a uniquely named connection that can
/// be referenced by services such as CodePipeline.
/// </li>
/// <li>
/// <a>DeleteConnection</a>, which deletes the specified connection.
/// </li>
/// <li>
/// <a>GetConnection</a>, which returns information about the connection,
/// including the connection status.
/// </li>
/// <li>
/// <a>ListConnections</a>, which lists the connections associated with your
/// account.
/// </li>
/// </ul>
/// For information about how to use AWS CodeStar Connections, see the <a
/// href="https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html">AWS
/// CodePipeline User Guide</a>.
class CodeStarconnections {
  final _s.JsonProtocol _protocol;
  CodeStarconnections({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'codestar-connections',
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
  ///
  /// Parameter [connectionName] :
  /// The name of the connection to be created. The name must be unique in the
  /// calling AWS account.
  ///
  /// Parameter [providerType] :
  /// The name of the external provider where your third-party code repository
  /// is configured. Currently, the valid provider type is Bitbucket.
  Future<CreateConnectionOutput> createConnection({
    @_s.required String connectionName,
    @_s.required ProviderType providerType,
  }) async {
    ArgumentError.checkNotNull(connectionName, 'connectionName');
    _s.validateStringLength(
      'connectionName',
      connectionName,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(providerType, 'providerType');
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
        'ProviderType': providerType,
      },
    );

    return CreateConnectionOutput.fromJson(jsonResponse.body);
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
    @_s.required String connectionArn,
  }) async {
    ArgumentError.checkNotNull(connectionArn, 'connectionArn');
    _s.validateStringLength(
      'connectionArn',
      connectionArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'connectionArn',
      connectionArn,
      r'''arn:aws(-[\w]+)*:.+:.+:[0-9]{12}:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'com.amazonaws.codestar.connections.CodeStar_connections_20191201.DeleteConnection'
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

    return DeleteConnectionOutput.fromJson(jsonResponse.body);
  }

  /// Returns the connection ARN and details such as status, owner, and provider
  /// type.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [connectionArn] :
  /// The Amazon Resource Name (ARN) of a connection.
  Future<GetConnectionOutput> getConnection({
    @_s.required String connectionArn,
  }) async {
    ArgumentError.checkNotNull(connectionArn, 'connectionArn');
    _s.validateStringLength(
      'connectionArn',
      connectionArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'connectionArn',
      connectionArn,
      r'''arn:aws(-[\w]+)*:.+:.+:[0-9]{12}:.+''',
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

  /// Lists the connections associated with your account.
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
    int maxResults,
    String nextToken,
    ProviderType providerTypeFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9=\-\\/]+''',
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
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'ProviderTypeFilter': providerTypeFilter,
      },
    );

    return ListConnectionsOutput.fromJson(jsonResponse.body);
  }
}

/// The configuration that allows a service such as CodePipeline to connect to a
/// third-party code repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Connection {
  /// The Amazon Resource Name (ARN) of the connection. The ARN is used as the
  /// connection reference when the connection is shared between AWS services.
  /// <note>
  /// The ARN is never reused if the connection is deleted.
  /// </note>
  @_s.JsonKey(name: 'ConnectionArn')
  final String connectionArn;

  /// The name of the connection. Connection names must be unique in an AWS user
  /// account.
  @_s.JsonKey(name: 'ConnectionName')
  final String connectionName;

  /// The current status of the connection.
  @_s.JsonKey(name: 'ConnectionStatus')
  final ConnectionStatus connectionStatus;

  /// The name of the external provider where your third-party code repository is
  /// configured. For Bitbucket, this is the account ID of the owner of the
  /// Bitbucket repository.
  @_s.JsonKey(name: 'OwnerAccountId')
  final String ownerAccountId;

  /// The name of the external provider where your third-party code repository is
  /// configured. Currently, the valid provider type is Bitbucket.
  @_s.JsonKey(name: 'ProviderType')
  final ProviderType providerType;

  Connection({
    this.connectionArn,
    this.connectionName,
    this.connectionStatus,
    this.ownerAccountId,
    this.providerType,
  });
  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}

enum ConnectionStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('ERROR')
  error,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConnectionOutput {
  /// The Amazon Resource Name (ARN) of the connection to be created. The ARN is
  /// used as the connection reference when the connection is shared between AWS
  /// services.
  /// <note>
  /// The ARN is never reused if the connection is deleted.
  /// </note>
  @_s.JsonKey(name: 'ConnectionArn')
  final String connectionArn;

  CreateConnectionOutput({
    @_s.required this.connectionArn,
  });
  factory CreateConnectionOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateConnectionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConnectionOutput {
  DeleteConnectionOutput();
  factory DeleteConnectionOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteConnectionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConnectionOutput {
  /// The connection details, such as status, owner, and provider type.
  @_s.JsonKey(name: 'Connection')
  final Connection connection;

  GetConnectionOutput({
    this.connection,
  });
  factory GetConnectionOutput.fromJson(Map<String, dynamic> json) =>
      _$GetConnectionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConnectionsOutput {
  /// A list of connections and the details for each connection, such as status,
  /// owner, and provider type.
  @_s.JsonKey(name: 'Connections')
  final List<Connection> connections;

  /// A token that can be used in the next <code>ListConnections</code> call. To
  /// view all items in the list, continue to call this operation with each
  /// subsequent token until no more <code>nextToken</code> values are returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListConnectionsOutput({
    this.connections,
    this.nextToken,
  });
  factory ListConnectionsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListConnectionsOutputFromJson(json);
}

enum ProviderType {
  @_s.JsonValue('Bitbucket')
  bitbucket,
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
