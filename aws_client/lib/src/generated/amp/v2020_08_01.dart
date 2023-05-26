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

/// Amazon Managed Service for Prometheus
class Prometheus {
  final _s.RestJsonProtocol _protocol;
  Prometheus({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Create an alert manager definition.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [data] :
  /// The alert manager definition data.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace in which to create the alert manager definition.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<CreateAlertManagerDefinitionResponse> createAlertManagerDefinition({
    required Uint8List data,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'data': base64Encode(data),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/alertmanager/definition',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAlertManagerDefinitionResponse.fromJson(response);
  }

  /// Create logging configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [logGroupArn] :
  /// The ARN of the CW log group to which the vended log data will be
  /// published.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to vend logs to.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<CreateLoggingConfigurationResponse> createLoggingConfiguration({
    required String logGroupArn,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'logGroupArn': logGroupArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/logging',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLoggingConfigurationResponse.fromJson(response);
  }

  /// Create a rule group namespace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [data] :
  /// The namespace data that define the rule groups.
  ///
  /// Parameter [name] :
  /// The rule groups namespace name.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace in which to create the rule group namespace.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// Optional, user-provided tags for this rule groups namespace.
  Future<CreateRuleGroupsNamespaceResponse> createRuleGroupsNamespace({
    required Uint8List data,
    required String name,
    required String workspaceId,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'data': base64Encode(data),
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/rulegroupsnamespaces',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRuleGroupsNamespaceResponse.fromJson(response);
  }

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
  ///
  /// Parameter [tags] :
  /// Optional, user-provided tags for this workspace.
  Future<CreateWorkspaceResponse> createWorkspace({
    String? alias,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (alias != null) 'alias': alias,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/workspaces',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkspaceResponse.fromJson(response);
  }

  /// Deletes an alert manager definition.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace in which to delete the alert manager definition.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<void> deleteAlertManagerDefinition({
    required String workspaceId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/alertmanager/definition',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete logging configuration.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to vend logs to.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<void> deleteLoggingConfiguration({
    required String workspaceId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/logging',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a rule groups namespace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The rule groups namespace name.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to delete rule group definition.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<void> deleteRuleGroupsNamespace({
    required String name,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/rulegroupsnamespaces/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an AMP workspace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
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

  /// Describes an alert manager definition.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to describe.
  Future<DescribeAlertManagerDefinitionResponse>
      describeAlertManagerDefinition({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/alertmanager/definition',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAlertManagerDefinitionResponse.fromJson(response);
  }

  /// Describes logging configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to vend logs to.
  Future<DescribeLoggingConfigurationResponse> describeLoggingConfiguration({
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/logging',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLoggingConfigurationResponse.fromJson(response);
  }

  /// Describe a rule groups namespace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The rule groups namespace.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to describe.
  Future<DescribeRuleGroupsNamespaceResponse> describeRuleGroupsNamespace({
    required String name,
    required String workspaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/rulegroupsnamespaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRuleGroupsNamespaceResponse.fromJson(response);
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorkspaceResponse.fromJson(response);
  }

  /// Lists rule groups namespaces.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace.
  ///
  /// Parameter [maxResults] :
  /// Maximum results to return in response (default=100, maximum=1000).
  ///
  /// Parameter [name] :
  /// Optional filter for rule groups namespace name. Only the rule groups
  /// namespace that begin with this value will be returned.
  ///
  /// Parameter [nextToken] :
  /// Pagination token to request the next page in a paginated list. This token
  /// is obtained from the output of the previous ListRuleGroupsNamespaces
  /// request.
  Future<ListRuleGroupsNamespacesResponse> listRuleGroupsNamespaces({
    required String workspaceId,
    int? maxResults,
    String? name,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/rulegroupsnamespaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRuleGroupsNamespacesResponse.fromJson(response);
  }

  /// Lists the tags you have assigned to the resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
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

  /// Update an alert manager definition.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [data] :
  /// The alert manager definition data.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace in which to update the alert manager definition.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<PutAlertManagerDefinitionResponse> putAlertManagerDefinition({
    required Uint8List data,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'data': base64Encode(data),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/alertmanager/definition',
      exceptionFnMap: _exceptionFns,
    );
    return PutAlertManagerDefinitionResponse.fromJson(response);
  }

  /// Update a rule groups namespace.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [data] :
  /// The namespace data that define the rule groups.
  ///
  /// Parameter [name] :
  /// The rule groups namespace name.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace in which to update the rule group namespace.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<PutRuleGroupsNamespaceResponse> putRuleGroupsNamespace({
    required Uint8List data,
    required String name,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'data': base64Encode(data),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/workspaces/${Uri.encodeComponent(workspaceId)}/rulegroupsnamespaces/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutRuleGroupsNamespaceResponse.fromJson(response);
  }

  /// Creates tags for the specified resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
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

  /// Deletes tags from the specified resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// One or more tag keys
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

  /// Update logging configuration.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [logGroupArn] :
  /// The ARN of the CW log group to which the vended log data will be
  /// published.
  ///
  /// Parameter [workspaceId] :
  /// The ID of the workspace to vend logs to.
  ///
  /// Parameter [clientToken] :
  /// Optional, unique, case-sensitive, user-provided identifier to ensure the
  /// idempotency of the request.
  Future<UpdateLoggingConfigurationResponse> updateLoggingConfiguration({
    required String logGroupArn,
    required String workspaceId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'logGroupArn': logGroupArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/workspaces/${Uri.encodeComponent(workspaceId)}/logging',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLoggingConfigurationResponse.fromJson(response);
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

/// Represents the properties of an alert manager definition.
class AlertManagerDefinitionDescription {
  /// The time when the alert manager definition was created.
  final DateTime createdAt;

  /// The alert manager definition.
  final Uint8List data;

  /// The time when the alert manager definition was modified.
  final DateTime modifiedAt;

  /// The status of alert manager definition.
  final AlertManagerDefinitionStatus status;

  AlertManagerDefinitionDescription({
    required this.createdAt,
    required this.data,
    required this.modifiedAt,
    required this.status,
  });

  factory AlertManagerDefinitionDescription.fromJson(
      Map<String, dynamic> json) {
    return AlertManagerDefinitionDescription(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      data: _s.decodeUint8List(json['data']! as String),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      status: AlertManagerDefinitionStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final data = this.data;
    final modifiedAt = this.modifiedAt;
    final status = this.status;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'data': base64Encode(data),
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'status': status,
    };
  }
}

/// Represents the status of a definition.
class AlertManagerDefinitionStatus {
  /// Status code of this definition.
  final AlertManagerDefinitionStatusCode statusCode;

  /// The reason for failure if any.
  final String? statusReason;

  AlertManagerDefinitionStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory AlertManagerDefinitionStatus.fromJson(Map<String, dynamic> json) {
    return AlertManagerDefinitionStatus(
      statusCode:
          (json['statusCode'] as String).toAlertManagerDefinitionStatusCode(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// State of an alert manager definition.
enum AlertManagerDefinitionStatusCode {
  creating,
  active,
  updating,
  deleting,
  creationFailed,
  updateFailed,
}

extension AlertManagerDefinitionStatusCodeValueExtension
    on AlertManagerDefinitionStatusCode {
  String toValue() {
    switch (this) {
      case AlertManagerDefinitionStatusCode.creating:
        return 'CREATING';
      case AlertManagerDefinitionStatusCode.active:
        return 'ACTIVE';
      case AlertManagerDefinitionStatusCode.updating:
        return 'UPDATING';
      case AlertManagerDefinitionStatusCode.deleting:
        return 'DELETING';
      case AlertManagerDefinitionStatusCode.creationFailed:
        return 'CREATION_FAILED';
      case AlertManagerDefinitionStatusCode.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension AlertManagerDefinitionStatusCodeFromString on String {
  AlertManagerDefinitionStatusCode toAlertManagerDefinitionStatusCode() {
    switch (this) {
      case 'CREATING':
        return AlertManagerDefinitionStatusCode.creating;
      case 'ACTIVE':
        return AlertManagerDefinitionStatusCode.active;
      case 'UPDATING':
        return AlertManagerDefinitionStatusCode.updating;
      case 'DELETING':
        return AlertManagerDefinitionStatusCode.deleting;
      case 'CREATION_FAILED':
        return AlertManagerDefinitionStatusCode.creationFailed;
      case 'UPDATE_FAILED':
        return AlertManagerDefinitionStatusCode.updateFailed;
    }
    throw Exception(
        '$this is not known in enum AlertManagerDefinitionStatusCode');
  }
}

/// Represents the output of a CreateAlertManagerDefinition operation.
class CreateAlertManagerDefinitionResponse {
  /// The status of alert manager definition.
  final AlertManagerDefinitionStatus status;

  CreateAlertManagerDefinitionResponse({
    required this.status,
  });

  factory CreateAlertManagerDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAlertManagerDefinitionResponse(
      status: AlertManagerDefinitionStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// Represents the output of a CreateLoggingConfiguration operation.
class CreateLoggingConfigurationResponse {
  /// The status of the logging configuration.
  final LoggingConfigurationStatus status;

  CreateLoggingConfigurationResponse({
    required this.status,
  });

  factory CreateLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLoggingConfigurationResponse(
      status: LoggingConfigurationStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// Represents the output of a CreateRuleGroupsNamespace operation.
class CreateRuleGroupsNamespaceResponse {
  /// The Amazon Resource Name (ARN) of this rule groups namespace.
  final String arn;

  /// The rule groups namespace name.
  final String name;

  /// The status of rule groups namespace.
  final RuleGroupsNamespaceStatus status;

  /// The tags of this rule groups namespace.
  final Map<String, String>? tags;

  CreateRuleGroupsNamespaceResponse({
    required this.arn,
    required this.name,
    required this.status,
    this.tags,
  });

  factory CreateRuleGroupsNamespaceResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateRuleGroupsNamespaceResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
      status: RuleGroupsNamespaceStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      'arn': arn,
      'name': name,
      'status': status,
      if (tags != null) 'tags': tags,
    };
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

  /// The tags of this workspace.
  final Map<String, String>? tags;

  CreateWorkspaceResponse({
    required this.arn,
    required this.status,
    required this.workspaceId,
    this.tags,
  });

  factory CreateWorkspaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkspaceResponse(
      arn: json['arn'] as String,
      status: WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
      workspaceId: json['workspaceId'] as String,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final status = this.status;
    final workspaceId = this.workspaceId;
    final tags = this.tags;
    return {
      'arn': arn,
      'status': status,
      'workspaceId': workspaceId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents the output of a DescribeAlertManagerDefinition operation.
class DescribeAlertManagerDefinitionResponse {
  /// The properties of the selected workspace's alert manager definition.
  final AlertManagerDefinitionDescription alertManagerDefinition;

  DescribeAlertManagerDefinitionResponse({
    required this.alertManagerDefinition,
  });

  factory DescribeAlertManagerDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAlertManagerDefinitionResponse(
      alertManagerDefinition: AlertManagerDefinitionDescription.fromJson(
          json['alertManagerDefinition'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final alertManagerDefinition = this.alertManagerDefinition;
    return {
      'alertManagerDefinition': alertManagerDefinition,
    };
  }
}

/// Represents the output of a DescribeLoggingConfiguration operation.
class DescribeLoggingConfigurationResponse {
  /// Metadata object containing information about the logging configuration of a
  /// workspace.
  final LoggingConfigurationMetadata loggingConfiguration;

  DescribeLoggingConfigurationResponse({
    required this.loggingConfiguration,
  });

  factory DescribeLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLoggingConfigurationResponse(
      loggingConfiguration: LoggingConfigurationMetadata.fromJson(
          json['loggingConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfiguration = this.loggingConfiguration;
    return {
      'loggingConfiguration': loggingConfiguration,
    };
  }
}

/// Represents the output of a DescribeRuleGroupsNamespace operation.
class DescribeRuleGroupsNamespaceResponse {
  /// The selected rule groups namespace.
  final RuleGroupsNamespaceDescription ruleGroupsNamespace;

  DescribeRuleGroupsNamespaceResponse({
    required this.ruleGroupsNamespace,
  });

  factory DescribeRuleGroupsNamespaceResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRuleGroupsNamespaceResponse(
      ruleGroupsNamespace: RuleGroupsNamespaceDescription.fromJson(
          json['ruleGroupsNamespace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupsNamespace = this.ruleGroupsNamespace;
    return {
      'ruleGroupsNamespace': ruleGroupsNamespace,
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

/// Represents the output of a ListRuleGroupsNamespaces operation.
class ListRuleGroupsNamespacesResponse {
  /// The list of the selected rule groups namespaces.
  final List<RuleGroupsNamespaceSummary> ruleGroupsNamespaces;

  /// Pagination token to use when requesting the next page in this list.
  final String? nextToken;

  ListRuleGroupsNamespacesResponse({
    required this.ruleGroupsNamespaces,
    this.nextToken,
  });

  factory ListRuleGroupsNamespacesResponse.fromJson(Map<String, dynamic> json) {
    return ListRuleGroupsNamespacesResponse(
      ruleGroupsNamespaces: (json['ruleGroupsNamespaces'] as List)
          .whereNotNull()
          .map((e) =>
              RuleGroupsNamespaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleGroupsNamespaces = this.ruleGroupsNamespaces;
    final nextToken = this.nextToken;
    return {
      'ruleGroupsNamespaces': ruleGroupsNamespaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

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

/// Represents the properties of a logging configuration metadata.
class LoggingConfigurationMetadata {
  /// The time when the logging configuration was created.
  final DateTime createdAt;

  /// The ARN of the CW log group to which the vended log data will be published.
  final String logGroupArn;

  /// The time when the logging configuration was modified.
  final DateTime modifiedAt;

  /// The status of the logging configuration.
  final LoggingConfigurationStatus status;

  /// The workspace where the logging configuration exists.
  final String workspace;

  LoggingConfigurationMetadata({
    required this.createdAt,
    required this.logGroupArn,
    required this.modifiedAt,
    required this.status,
    required this.workspace,
  });

  factory LoggingConfigurationMetadata.fromJson(Map<String, dynamic> json) {
    return LoggingConfigurationMetadata(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      logGroupArn: json['logGroupArn'] as String,
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      status: LoggingConfigurationStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      workspace: json['workspace'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final logGroupArn = this.logGroupArn;
    final modifiedAt = this.modifiedAt;
    final status = this.status;
    final workspace = this.workspace;
    return {
      'createdAt': unixTimestampToJson(createdAt),
      'logGroupArn': logGroupArn,
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'status': status,
      'workspace': workspace,
    };
  }
}

/// Represents the status of a logging configuration.
class LoggingConfigurationStatus {
  /// Status code of the logging configuration.
  final LoggingConfigurationStatusCode statusCode;

  /// The reason for failure if any.
  final String? statusReason;

  LoggingConfigurationStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory LoggingConfigurationStatus.fromJson(Map<String, dynamic> json) {
    return LoggingConfigurationStatus(
      statusCode:
          (json['statusCode'] as String).toLoggingConfigurationStatusCode(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// State of a logging configuration.
enum LoggingConfigurationStatusCode {
  creating,
  active,
  updating,
  deleting,
  creationFailed,
  updateFailed,
}

extension LoggingConfigurationStatusCodeValueExtension
    on LoggingConfigurationStatusCode {
  String toValue() {
    switch (this) {
      case LoggingConfigurationStatusCode.creating:
        return 'CREATING';
      case LoggingConfigurationStatusCode.active:
        return 'ACTIVE';
      case LoggingConfigurationStatusCode.updating:
        return 'UPDATING';
      case LoggingConfigurationStatusCode.deleting:
        return 'DELETING';
      case LoggingConfigurationStatusCode.creationFailed:
        return 'CREATION_FAILED';
      case LoggingConfigurationStatusCode.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension LoggingConfigurationStatusCodeFromString on String {
  LoggingConfigurationStatusCode toLoggingConfigurationStatusCode() {
    switch (this) {
      case 'CREATING':
        return LoggingConfigurationStatusCode.creating;
      case 'ACTIVE':
        return LoggingConfigurationStatusCode.active;
      case 'UPDATING':
        return LoggingConfigurationStatusCode.updating;
      case 'DELETING':
        return LoggingConfigurationStatusCode.deleting;
      case 'CREATION_FAILED':
        return LoggingConfigurationStatusCode.creationFailed;
      case 'UPDATE_FAILED':
        return LoggingConfigurationStatusCode.updateFailed;
    }
    throw Exception(
        '$this is not known in enum LoggingConfigurationStatusCode');
  }
}

/// Represents the output of a PutAlertManagerDefinition operation.
class PutAlertManagerDefinitionResponse {
  /// The status of alert manager definition.
  final AlertManagerDefinitionStatus status;

  PutAlertManagerDefinitionResponse({
    required this.status,
  });

  factory PutAlertManagerDefinitionResponse.fromJson(
      Map<String, dynamic> json) {
    return PutAlertManagerDefinitionResponse(
      status: AlertManagerDefinitionStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
    };
  }
}

/// Represents the output of a PutRuleGroupsNamespace operation.
class PutRuleGroupsNamespaceResponse {
  /// The Amazon Resource Name (ARN) of this rule groups namespace.
  final String arn;

  /// The rule groups namespace name.
  final String name;

  /// The status of rule groups namespace.
  final RuleGroupsNamespaceStatus status;

  /// The tags of this rule groups namespace.
  final Map<String, String>? tags;

  PutRuleGroupsNamespaceResponse({
    required this.arn,
    required this.name,
    required this.status,
    this.tags,
  });

  factory PutRuleGroupsNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return PutRuleGroupsNamespaceResponse(
      arn: json['arn'] as String,
      name: json['name'] as String,
      status: RuleGroupsNamespaceStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      'arn': arn,
      'name': name,
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents a description of the rule groups namespace.
class RuleGroupsNamespaceDescription {
  /// The Amazon Resource Name (ARN) of this rule groups namespace.
  final String arn;

  /// The time when the rule groups namespace was created.
  final DateTime createdAt;

  /// The rule groups namespace data.
  final Uint8List data;

  /// The time when the rule groups namespace was modified.
  final DateTime modifiedAt;

  /// The rule groups namespace name.
  final String name;

  /// The status of rule groups namespace.
  final RuleGroupsNamespaceStatus status;

  /// The tags of this rule groups namespace.
  final Map<String, String>? tags;

  RuleGroupsNamespaceDescription({
    required this.arn,
    required this.createdAt,
    required this.data,
    required this.modifiedAt,
    required this.name,
    required this.status,
    this.tags,
  });

  factory RuleGroupsNamespaceDescription.fromJson(Map<String, dynamic> json) {
    return RuleGroupsNamespaceDescription(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      data: _s.decodeUint8List(json['data']! as String),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      status: RuleGroupsNamespaceStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final data = this.data;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'data': base64Encode(data),
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'name': name,
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents the status of a namespace.
class RuleGroupsNamespaceStatus {
  /// Status code of this namespace.
  final RuleGroupsNamespaceStatusCode statusCode;

  /// The reason for failure if any.
  final String? statusReason;

  RuleGroupsNamespaceStatus({
    required this.statusCode,
    this.statusReason,
  });

  factory RuleGroupsNamespaceStatus.fromJson(Map<String, dynamic> json) {
    return RuleGroupsNamespaceStatus(
      statusCode:
          (json['statusCode'] as String).toRuleGroupsNamespaceStatusCode(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReason = this.statusReason;
    return {
      'statusCode': statusCode.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// State of a namespace.
enum RuleGroupsNamespaceStatusCode {
  creating,
  active,
  updating,
  deleting,
  creationFailed,
  updateFailed,
}

extension RuleGroupsNamespaceStatusCodeValueExtension
    on RuleGroupsNamespaceStatusCode {
  String toValue() {
    switch (this) {
      case RuleGroupsNamespaceStatusCode.creating:
        return 'CREATING';
      case RuleGroupsNamespaceStatusCode.active:
        return 'ACTIVE';
      case RuleGroupsNamespaceStatusCode.updating:
        return 'UPDATING';
      case RuleGroupsNamespaceStatusCode.deleting:
        return 'DELETING';
      case RuleGroupsNamespaceStatusCode.creationFailed:
        return 'CREATION_FAILED';
      case RuleGroupsNamespaceStatusCode.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension RuleGroupsNamespaceStatusCodeFromString on String {
  RuleGroupsNamespaceStatusCode toRuleGroupsNamespaceStatusCode() {
    switch (this) {
      case 'CREATING':
        return RuleGroupsNamespaceStatusCode.creating;
      case 'ACTIVE':
        return RuleGroupsNamespaceStatusCode.active;
      case 'UPDATING':
        return RuleGroupsNamespaceStatusCode.updating;
      case 'DELETING':
        return RuleGroupsNamespaceStatusCode.deleting;
      case 'CREATION_FAILED':
        return RuleGroupsNamespaceStatusCode.creationFailed;
      case 'UPDATE_FAILED':
        return RuleGroupsNamespaceStatusCode.updateFailed;
    }
    throw Exception('$this is not known in enum RuleGroupsNamespaceStatusCode');
  }
}

/// Represents a summary of the rule groups namespace.
class RuleGroupsNamespaceSummary {
  /// The Amazon Resource Name (ARN) of this rule groups namespace.
  final String arn;

  /// The time when the rule groups namespace was created.
  final DateTime createdAt;

  /// The time when the rule groups namespace was modified.
  final DateTime modifiedAt;

  /// The rule groups namespace name.
  final String name;

  /// The status of rule groups namespace.
  final RuleGroupsNamespaceStatus status;

  /// The tags of this rule groups namespace.
  final Map<String, String>? tags;

  RuleGroupsNamespaceSummary({
    required this.arn,
    required this.createdAt,
    required this.modifiedAt,
    required this.name,
    required this.status,
    this.tags,
  });

  factory RuleGroupsNamespaceSummary.fromJson(Map<String, dynamic> json) {
    return RuleGroupsNamespaceSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] as Object),
      name: json['name'] as String,
      status: RuleGroupsNamespaceStatus.fromJson(
          json['status'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'modifiedAt': unixTimestampToJson(modifiedAt),
      'name': name,
      'status': status,
      if (tags != null) 'tags': tags,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents the output of an UpdateLoggingConfiguration operation.
class UpdateLoggingConfigurationResponse {
  /// The status of the logging configuration.
  final LoggingConfigurationStatus status;

  UpdateLoggingConfigurationResponse({
    required this.status,
  });

  factory UpdateLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateLoggingConfigurationResponse(
      status: LoggingConfigurationStatus.fromJson(
          json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status,
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

  /// The tags of this workspace.
  final Map<String, String>? tags;

  WorkspaceDescription({
    required this.arn,
    required this.createdAt,
    required this.status,
    required this.workspaceId,
    this.alias,
    this.prometheusEndpoint,
    this.tags,
  });

  factory WorkspaceDescription.fromJson(Map<String, dynamic> json) {
    return WorkspaceDescription(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      status: WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
      workspaceId: json['workspaceId'] as String,
      alias: json['alias'] as String?,
      prometheusEndpoint: json['prometheusEndpoint'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final status = this.status;
    final workspaceId = this.workspaceId;
    final alias = this.alias;
    final prometheusEndpoint = this.prometheusEndpoint;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'status': status,
      'workspaceId': workspaceId,
      if (alias != null) 'alias': alias,
      if (prometheusEndpoint != null) 'prometheusEndpoint': prometheusEndpoint,
      if (tags != null) 'tags': tags,
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

extension WorkspaceStatusCodeValueExtension on WorkspaceStatusCode {
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

extension WorkspaceStatusCodeFromString on String {
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

  /// The tags of this workspace.
  final Map<String, String>? tags;

  WorkspaceSummary({
    required this.arn,
    required this.createdAt,
    required this.status,
    required this.workspaceId,
    this.alias,
    this.tags,
  });

  factory WorkspaceSummary.fromJson(Map<String, dynamic> json) {
    return WorkspaceSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      status: WorkspaceStatus.fromJson(json['status'] as Map<String, dynamic>),
      workspaceId: json['workspaceId'] as String,
      alias: json['alias'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final status = this.status;
    final workspaceId = this.workspaceId;
    final alias = this.alias;
    final tags = this.tags;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'status': status,
      'workspaceId': workspaceId,
      if (alias != null) 'alias': alias,
      if (tags != null) 'tags': tags,
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
