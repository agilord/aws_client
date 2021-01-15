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

part '2020-08-01.g.dart';

/// Amazon Managed Service for Prometheus
class Prometheus {
  final _s.RestJsonProtocol _protocol;
  Prometheus({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'aps',
            signingName: 'aps',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new AMP workspace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [alias] :
  /// An optional user-assigned alias for this workspace. This alias is for user
  /// reference and does not need to be unique.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<CreateWorkspaceResponse> createWorkspace({
    String alias,
    String clientToken,
  }) async {
    _s.validateStringLength(
      'alias',
      alias,
      1,
      100,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''[!-~]+''',
    );
    final $payload = <String, dynamic>{
      if (alias != null) 'alias': alias,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkspaceResponse.fromJson(response);
  }

  /// Deletes an AMP workspace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to delete.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<void> deleteWorkspace({
    @_s.required String workspaceId,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateStringLength(
      'workspaceId',
      workspaceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workspaceId',
      workspaceId,
      r'''[0-9A-Za-z][-.0-9A-Z_a-z]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''[!-~]+''',
    );
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes an existing AMP workspace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to describe.
  Future<DescribeWorkspaceResponse> describeWorkspace({
    @_s.required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateStringLength(
      'workspaceId',
      workspaceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workspaceId',
      workspaceId,
      r'''[0-9A-Za-z][-.0-9A-Z_a-z]*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorkspaceResponse.fromJson(response);
  }

  /// Lists all AMP workspaces, including workspaces being created or deleted.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [alias] :
  /// Optional filter for workspace alias. Only the workspaces with aliases that
  /// begin with this value will be returned.
  ///
  /// Parameter [maxResults] :
  /// Maximum results to return in response (default=100, maximum=1000).
  ///
  /// Parameter [nextToken] :
  /// Pagination token to request the next page in a paginated list. This token
  /// is obtained from the output of the previous ListWorkspaces request.
  Future<ListWorkspacesResponse> listWorkspaces({
    String alias,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'alias',
      alias,
      1,
      100,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (alias != null) 'alias': [alias],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkspacesResponse.fromJson(response);
  }

  /// Updates an AMP workspace alias.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace being updated.
  ///
  /// Parameter [alias] :
  /// The new alias of the workspace.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<void> updateWorkspaceAlias({
    @_s.required String workspaceId,
    String alias,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateStringLength(
      'workspaceId',
      workspaceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'workspaceId',
      workspaceId,
      r'''[0-9A-Za-z][-.0-9A-Z_a-z]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'alias',
      alias,
      1,
      100,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''[!-~]+''',
    );
    final $payload = <String, dynamic>{
      if (alias != null) 'alias': alias,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/alias',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Represents the output of a CreateWorkspace operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWorkspaceResponse {
  /// The ARN of the workspace that was just created.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The status of the workspace that was just created (usually CREATING).
  @_s.JsonKey(name: 'status')
  final WorkspaceStatus status;

  /// The generated ID of the workspace that was just created.
  @_s.JsonKey(name: 'workspaceId')
  final String workspaceId;

  CreateWorkspaceResponse({
    @_s.required this.arn,
    @_s.required this.status,
    @_s.required this.workspaceId,
  });
  factory CreateWorkspaceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateWorkspaceResponseFromJson(json);
}

/// Represents the output of a DescribeWorkspace operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkspaceResponse {
  /// The properties of the selected workspace.
  @_s.JsonKey(name: 'workspace')
  final WorkspaceDescription workspace;

  DescribeWorkspaceResponse({
    @_s.required this.workspace,
  });
  factory DescribeWorkspaceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeWorkspaceResponseFromJson(json);
}

/// Represents the output of a ListWorkspaces operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWorkspacesResponse {
  /// The list of existing workspaces, including those undergoing creation or
  /// deletion.
  @_s.JsonKey(name: 'workspaces')
  final List<WorkspaceSummary> workspaces;

  /// Pagination token to use when requesting the next page in this list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListWorkspacesResponse({
    @_s.required this.workspaces,
    this.nextToken,
  });
  factory ListWorkspacesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListWorkspacesResponseFromJson(json);
}

/// Represents the properties of a workspace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkspaceDescription {
  /// The Amazon Resource Name (ARN) of this workspace.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time when the workspace was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The status of this workspace.
  @_s.JsonKey(name: 'status')
  final WorkspaceStatus status;

  /// Unique string identifying this workspace.
  @_s.JsonKey(name: 'workspaceId')
  final String workspaceId;

  /// Alias of this workspace.
  @_s.JsonKey(name: 'alias')
  final String alias;

  /// Prometheus endpoint URI.
  @_s.JsonKey(name: 'prometheusEndpoint')
  final String prometheusEndpoint;

  WorkspaceDescription({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.status,
    @_s.required this.workspaceId,
    this.alias,
    this.prometheusEndpoint,
  });
  factory WorkspaceDescription.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDescriptionFromJson(json);
}

/// Represents the status of a workspace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkspaceStatus {
  /// Status code of this workspace.
  @_s.JsonKey(name: 'statusCode')
  final WorkspaceStatusCode statusCode;

  WorkspaceStatus({
    @_s.required this.statusCode,
  });
  factory WorkspaceStatus.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceStatusFromJson(json);
}

/// State of a workspace.
enum WorkspaceStatusCode {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('CREATION_FAILED')
  creationFailed,
}

/// Represents a summary of the properties of a workspace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorkspaceSummary {
  /// The AmazonResourceName of this workspace.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time when the workspace was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The status of this workspace.
  @_s.JsonKey(name: 'status')
  final WorkspaceStatus status;

  /// Unique string identifying this workspace.
  @_s.JsonKey(name: 'workspaceId')
  final String workspaceId;

  /// Alias of this workspace.
  @_s.JsonKey(name: 'alias')
  final String alias;

  WorkspaceSummary({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.status,
    @_s.required this.workspaceId,
    this.alias,
  });
  factory WorkspaceSummary.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceSummaryFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
