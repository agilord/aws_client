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

/// Amazon Managed Service for Prometheus
class Prometheus {
  final _s.RestJsonProtocol _protocol;
  Prometheus({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    String? alias,
    String? clientToken,
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
    required String workspaceId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateStringLength(
      'workspaceId',
      workspaceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
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
    required String workspaceId,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateStringLength(
      'workspaceId',
      workspaceId,
      1,
      64,
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
    String? alias,
    int? maxResults,
    String? nextToken,
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
    required String workspaceId,
    String? alias,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(workspaceId, 'workspaceId');
    _s.validateStringLength(
      'workspaceId',
      workspaceId,
      1,
      64,
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
class CreateWorkspaceResponse {
  /// The ARN of the workspace that was just created.
  final String arn;

  /// The status of the workspace that was just created (usually CREATING).
  final WorkspaceStatus status;

  /// The generated ID of the workspace that was just created.
  final String workspaceId;

  CreateWorkspaceResponse({
    required this.arn,
    required this.status,
    required this.workspaceId,
  });

  factory CreateWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkspaceResponse(
      arn: json['arn'] as String,
      status: WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
      workspaceId: json['workspaceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final status = this.status;
    final workspaceId = this.workspaceId;
    return {
      'arn': arn,
      'status': status,
      'workspaceId': workspaceId,
    };
  }
}

/// Represents the output of a DescribeWorkspace operation.
class DescribeWorkspaceResponse {
  /// The properties of the selected workspace.
  final WorkspaceDescription workspace;

  DescribeWorkspaceResponse({
    required this.workspace,
  });

  factory DescribeWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWorkspaceResponse(
      workspace: WorkspaceDescription.fromJson(
          json['workspace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workspace = this.workspace;
    return {
      'workspace': workspace,
    };
  }
}

/// Represents the output of a ListWorkspaces operation.
class ListWorkspacesResponse {
  /// The list of existing workspaces, including those undergoing creation or
  /// deletion.
  final List<WorkspaceSummary> workspaces;

  /// Pagination token to use when requesting the next page in this list.
  final String? nextToken;

  ListWorkspacesResponse({
    required this.workspaces,
    this.nextToken,
  });

  factory ListWorkspacesResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkspacesResponse(
      workspaces: (json['workspaces'] as List)
          .whereNotNull()
          .map((e) => WorkspaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workspaces = this.workspaces;
    final nextToken = this.nextToken;
    return {
      'workspaces': workspaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Represents the properties of a workspace.
class WorkspaceDescription {
  /// The Amazon Resource Name (ARN) of this workspace.
  final String arn;

  /// The time when the workspace was created.
  final DateTime createdAt;

  /// The status of this workspace.
  final WorkspaceStatus status;

  /// Unique string identifying this workspace.
  final String workspaceId;

  /// Alias of this workspace.
  final String? alias;

  /// Prometheus endpoint URI.
  final String? prometheusEndpoint;

  WorkspaceDescription({
    required this.arn,
    required this.createdAt,
    required this.status,
    required this.workspaceId,
    this.alias,
    this.prometheusEndpoint,
  });

  factory WorkspaceDescription.fromJson(Map<String, dynamic> json) {
    return WorkspaceDescription(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      status: WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
      workspaceId: json['workspaceId'] as String,
      alias: json['alias'] as String?,
      prometheusEndpoint: json['prometheusEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final status = this.status;
    final workspaceId = this.workspaceId;
    final alias = this.alias;
    final prometheusEndpoint = this.prometheusEndpoint;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'status': status,
      'workspaceId': workspaceId,
      if (alias != null) 'alias': alias,
      if (prometheusEndpoint != null) 'prometheusEndpoint': prometheusEndpoint,
    };
  }
}

/// Represents the status of a workspace.
class WorkspaceStatus {
  /// Status code of this workspace.
  final WorkspaceStatusCode statusCode;

  WorkspaceStatus({
    required this.statusCode,
  });

  factory WorkspaceStatus.fromJson(Map<String, dynamic> json) {
    return WorkspaceStatus(
      statusCode: (json['statusCode'] as String).toWorkspaceStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    return {
      'statusCode': statusCode.toValue(),
    };
  }
}

/// State of a workspace.
enum WorkspaceStatusCode {
  creating,
  active,
  updating,
  deleting,
  creationFailed,
}

extension on WorkspaceStatusCode {
  String toValue() {
    switch (this) {
      case WorkspaceStatusCode.creating:
        return 'CREATING';
      case WorkspaceStatusCode.active:
        return 'ACTIVE';
      case WorkspaceStatusCode.updating:
        return 'UPDATING';
      case WorkspaceStatusCode.deleting:
        return 'DELETING';
      case WorkspaceStatusCode.creationFailed:
        return 'CREATION_FAILED';
    }
  }
}

extension on String {
  WorkspaceStatusCode toWorkspaceStatusCode() {
    switch (this) {
      case 'CREATING':
        return WorkspaceStatusCode.creating;
      case 'ACTIVE':
        return WorkspaceStatusCode.active;
      case 'UPDATING':
        return WorkspaceStatusCode.updating;
      case 'DELETING':
        return WorkspaceStatusCode.deleting;
      case 'CREATION_FAILED':
        return WorkspaceStatusCode.creationFailed;
    }
    throw Exception('$this is not known in enum WorkspaceStatusCode');
  }
}

/// Represents a summary of the properties of a workspace.
class WorkspaceSummary {
  /// The AmazonResourceName of this workspace.
  final String arn;

  /// The time when the workspace was created.
  final DateTime createdAt;

  /// The status of this workspace.
  final WorkspaceStatus status;

  /// Unique string identifying this workspace.
  final String workspaceId;

  /// Alias of this workspace.
  final String? alias;

  WorkspaceSummary({
    required this.arn,
    required this.createdAt,
    required this.status,
    required this.workspaceId,
    this.alias,
  });

  factory WorkspaceSummary.fromJson(Map<String, dynamic> json) {
    return WorkspaceSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      status: WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
      workspaceId: json['workspaceId'] as String,
      alias: json['alias'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final status = this.status;
    final workspaceId = this.workspaceId;
    final alias = this.alias;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'status': status,
      'workspaceId': workspaceId,
      if (alias != null) 'alias': alias,
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
