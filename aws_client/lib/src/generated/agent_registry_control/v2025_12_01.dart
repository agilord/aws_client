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

import 'v2025_12_01.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// AWS Agent Registry is a managed catalog for publishing and discovering
/// resources such as MCP servers, agents, and agent skills. Agent Registry
/// Control is its control-plane API: use it to create and manage registries and
/// the records they contain, configure discovery and authorization, govern
/// record approval and curation workflows, and manage automatic detection of
/// resources. Data-plane search and MCP invocation operations are provided by
/// the companion Agent Registry API.
class AgentRegistryControl {
  final _s.RestJsonProtocol _protocol;
  factory AgentRegistryControl({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'agent-registry-control',
      signingName: 'agent-registry',
    );
    return AgentRegistryControl._(
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
  AgentRegistryControl._({
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

  /// List the tags on a resource
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tags/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Tag a resource with key-value pairs
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      requestUri:
          '/tags/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove tags from a resource by key
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      requestUri:
          '/tags/${resourceArn.split('/').map(Uri.encodeComponent).join('/')}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a registry record within a registry. A registry record describes a
  /// discoverable resource, such as an MCP server, an agent, an agent skill, or
  /// a custom resource. Creation is asynchronous: the record is returned with
  /// the CREATING status while it is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [descriptors] :
  /// The typed descriptor content for the registry record
  ///
  /// Parameter [name] :
  /// The name of the registry record
  ///
  /// Parameter [recordType] :
  /// The type of the registry record, which determines the descriptor format
  ///
  /// Parameter [registryId] :
  /// The identifier of the registry in which to create the record (ARN or ID)
  ///
  /// Parameter [clientToken] :
  /// Client token for idempotency
  ///
  /// Parameter [description] :
  /// The description of the registry record
  ///
  /// Parameter [displayName] :
  /// The human-readable display name of the registry record
  ///
  /// Parameter [recordVersion] :
  /// The version of the registry record
  ///
  /// Parameter [tags] :
  /// Tags to associate with the registry record
  Future<CreateRegistryRecordResponse> createRegistryRecord({
    required Descriptors descriptors,
    required String name,
    required RecordType recordType,
    required String registryId,
    String? clientToken,
    String? description,
    String? displayName,
    String? recordVersion,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'descriptors': descriptors,
      'name': name,
      'recordType': recordType.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (recordVersion != null) 'recordVersion': recordVersion,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/registries/${Uri.encodeComponent(registryId)}/records',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRegistryRecordResponse.fromJson(response);
  }

  /// Retrieves the details of a registry record
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recordId] :
  /// The identifier of the registry record to retrieve (ARN or ID)
  ///
  /// Parameter [registryId] :
  /// The identifier of the registry containing the record (ARN or ID)
  Future<GetRegistryRecordResponse> getRegistryRecord({
    required String recordId,
    required String registryId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/registries/${Uri.encodeComponent(registryId)}/records/${Uri.encodeComponent(recordId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRegistryRecordResponse.fromJson(response);
  }

  /// Updates a registry record. The update is asynchronous: the record is
  /// returned with the UPDATING status while it is processed. Fields that use
  /// update wrappers follow PATCH semantics: omit the field to leave it
  /// unchanged.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recordId] :
  /// The identifier of the registry record to update (ARN or ID)
  ///
  /// Parameter [registryId] :
  /// The identifier of the registry containing the record (ARN or ID)
  ///
  /// Parameter [description] :
  /// The updated description of the registry record. Omit to leave the
  /// description unchanged; provide an empty wrapper to unset it.
  ///
  /// Parameter [descriptors] :
  /// The updated typed descriptor content for the registry record. Omit to
  /// leave the descriptors unchanged.
  ///
  /// Parameter [displayName] :
  /// The updated display name of the registry record. Omit to leave the display
  /// name unchanged; provide an empty wrapper to unset it.
  ///
  /// Parameter [name] :
  /// The updated name of the registry record. Omit to leave the name unchanged.
  ///
  /// Parameter [recordType] :
  /// The updated type of the registry record. Omit to leave the record type
  /// unchanged.
  ///
  /// Parameter [recordVersion] :
  /// The updated version of the registry record. Omit to leave the version
  /// unchanged.
  ///
  /// Parameter [triggerSynchronization] :
  /// Whether to trigger synchronization of the record's descriptor content from
  /// its source
  Future<UpdateRegistryRecordResponse> updateRegistryRecord({
    required String recordId,
    required String registryId,
    UpdatedDescription? description,
    UpdatedDescriptors? descriptors,
    UpdatedDisplayName? displayName,
    String? name,
    RecordType? recordType,
    String? recordVersion,
    bool? triggerSynchronization,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (descriptors != null) 'descriptors': descriptors,
      if (displayName != null) 'displayName': displayName,
      if (name != null) 'name': name,
      if (recordType != null) 'recordType': recordType.value,
      if (recordVersion != null) 'recordVersion': recordVersion,
      if (triggerSynchronization != null)
        'triggerSynchronization': triggerSynchronization,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/registries/${Uri.encodeComponent(registryId)}/records/${Uri.encodeComponent(recordId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRegistryRecordResponse.fromJson(response);
  }

  /// Deletes a registry record
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recordId] :
  /// The identifier of the registry record to delete (ARN or ID)
  ///
  /// Parameter [registryId] :
  /// The identifier of the registry containing the record (ARN or ID)
  Future<void> deleteRegistryRecord({
    required String recordId,
    required String registryId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/registries/${Uri.encodeComponent(registryId)}/records/${Uri.encodeComponent(recordId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the registry records within a registry, with optional filtering by
  /// name, status, and record type
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registryId] :
  /// The identifier of the registry to list records from (ARN or ID)
  ///
  /// Parameter [filters] :
  /// Filters to apply to the registry record list
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to return
  ///
  /// Parameter [nextToken] :
  /// Token for pagination
  Future<ListRegistryRecordsResponse> listRegistryRecords({
    required String registryId,
    List<RegistryRecordFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/registries/${Uri.encodeComponent(registryId)}/records-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListRegistryRecordsResponse.fromJson(response);
  }

  /// Submits a DRAFT registry record for approval, moving it into the
  /// registry's approval workflow. Depending on the registry's approval
  /// configuration, the record is either auto-approved or set to
  /// PENDING_APPROVAL for a curator to approve or reject.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recordId] :
  /// The identifier of the registry record to submit for approval (ARN or ID)
  ///
  /// Parameter [registryId] :
  /// The identifier of the registry containing the record (ARN or ID)
  Future<SubmitRegistryRecordForApprovalResponse>
      submitRegistryRecordForApproval({
    required String recordId,
    required String registryId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/registries/${Uri.encodeComponent(registryId)}/records/${Uri.encodeComponent(recordId)}/submit-for-approval',
      exceptionFnMap: _exceptionFns,
    );
    return SubmitRegistryRecordForApprovalResponse.fromJson(response);
  }

  /// Updates the status of a registry record as part of the registry's curation
  /// workflow, for example to approve or reject a record that is pending
  /// approval, or to deprecate an approved record so that it is no longer
  /// discoverable
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recordId] :
  /// The identifier of the registry record to update the status of (ARN or ID)
  ///
  /// Parameter [registryId] :
  /// The identifier of the registry containing the record (ARN or ID)
  ///
  /// Parameter [status] :
  /// The target status for the registry record
  ///
  /// Parameter [statusReason] :
  /// The reason for the status change, for example why the record was approved,
  /// rejected, or deprecated
  Future<UpdateRegistryRecordStatusResponse> updateRegistryRecordStatus({
    required String recordId,
    required String registryId,
    required RegistryRecordStatus status,
    required String statusReason,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.value,
      'statusReason': statusReason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/registries/${Uri.encodeComponent(registryId)}/records/${Uri.encodeComponent(recordId)}/status',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRegistryRecordStatusResponse.fromJson(response);
  }

  /// Creates a new registry, a catalog that organizes registry records and
  /// defines their discovery authorization and record approval behavior.
  /// Creation is asynchronous: the registry begins in the CREATING status and
  /// becomes usable once it reaches READY.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the registry
  ///
  /// Parameter [approvalConfiguration] :
  /// Approval configuration for registry records
  ///
  /// Parameter [clientToken] :
  /// Client token for idempotency
  ///
  /// Parameter [description] :
  /// The description of the registry
  ///
  /// Parameter [discoveryConfiguration] :
  /// Discovery configuration for the registry
  ///
  /// Parameter [tags] :
  /// Tags to associate with the registry
  Future<CreateRegistryResponse> createRegistry({
    required String name,
    ApprovalConfiguration? approvalConfiguration,
    String? clientToken,
    String? description,
    DiscoveryConfiguration? discoveryConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (approvalConfiguration != null)
        'approvalConfiguration': approvalConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (discoveryConfiguration != null)
        'discoveryConfiguration': discoveryConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/registries',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRegistryResponse.fromJson(response);
  }

  /// Gets a registry by identifier (ARN or ID)
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registryId] :
  /// The identifier of the registry to retrieve (ARN or ID)
  Future<GetRegistryResponse> getRegistry({
    required String registryId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/registries/${Uri.encodeComponent(registryId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRegistryResponse.fromJson(response);
  }

  /// Updates an existing registry. This operation uses PATCH semantics: specify
  /// only the fields you want to change, and omit the rest to leave them
  /// unchanged. Updates are applied asynchronously and the registry transitions
  /// to the UPDATING status while they are processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registryId] :
  /// The identifier of the registry to update (ARN or ID)
  ///
  /// Parameter [approvalConfiguration] :
  /// The updated approval configuration. The change applies only to records
  /// that move to PENDING_APPROVAL after the update; records already in
  /// PENDING_APPROVAL are unaffected.
  ///
  /// Parameter [description] :
  /// The updated description of the registry
  ///
  /// Parameter [discoveryConfiguration] :
  /// The updated discovery configuration. Changing the discovery authorization
  /// can break existing consumers that rely on the previous authorization type.
  ///
  /// Parameter [name] :
  /// The updated name of the registry
  Future<UpdateRegistryResponse> updateRegistry({
    required String registryId,
    UpdatedApprovalConfiguration? approvalConfiguration,
    UpdatedDescription? description,
    UpdatedDiscoveryConfiguration? discoveryConfiguration,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (approvalConfiguration != null)
        'approvalConfiguration': approvalConfiguration,
      if (description != null) 'description': description,
      if (discoveryConfiguration != null)
        'discoveryConfiguration': discoveryConfiguration,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/registries/${Uri.encodeComponent(registryId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRegistryResponse.fromJson(response);
  }

  /// Deletes a registry. Deletion is asynchronous: the registry transitions to
  /// the DELETING status and is removed along with its registry records.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registryId] :
  /// The identifier of the registry to delete (ARN or ID)
  Future<DeleteRegistryResponse> deleteRegistry({
    required String registryId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/registries/${Uri.encodeComponent(registryId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRegistryResponse.fromJson(response);
  }

  /// Lists the registries in the caller's account and Region, with optional
  /// filtering by status and discovery authorizer type
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Filters to apply to the registry list
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return
  ///
  /// Parameter [nextToken] :
  /// Token for pagination
  Future<ListRegistriesResponse> listRegistries({
    List<RegistryFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/registries-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListRegistriesResponse.fromJson(response);
  }
}

/// @nodoc
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

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response structure for creating a registry record
///
/// @nodoc
class CreateRegistryRecordResponse {
  /// The ARN of the created registry record
  final String recordArn;

  /// The status of the registry record, set to CREATING while the asynchronous
  /// workflow is in progress
  final RegistryRecordStatus status;

  CreateRegistryRecordResponse({
    required this.recordArn,
    required this.status,
  });

  factory CreateRegistryRecordResponse.fromJson(Map<String, dynamic> json) {
    return CreateRegistryRecordResponse(
      recordArn: (json['recordArn'] as String?) ?? '',
      status:
          RegistryRecordStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final recordArn = this.recordArn;
    final status = this.status;
    return {
      'recordArn': recordArn,
      'status': status.value,
    };
  }
}

/// Response structure for retrieving a registry record
///
/// @nodoc
class GetRegistryRecordResponse {
  /// The timestamp when the registry record was created.
  final DateTime createdAt;

  /// The name of the registry record. Names are unique within a registry.
  final String name;

  /// The &amp;ARN; of the registry record.
  final String recordArn;

  /// The unique identifier of the registry record.
  final String recordId;

  /// The type of the registry record, such as MCP, AGENT, SKILL, or CUSTOM.
  final RecordType recordType;

  /// The &amp;ARN; of the parent registry that owns the record.
  final String registryArn;

  /// The lifecycle status of the registry record.
  final RegistryRecordStatus status;

  /// The timestamp when the registry record was last updated.
  final DateTime updatedAt;

  /// A description of the registry record.
  final String? description;

  /// The typed descriptors that define the content of the registry record.
  final Descriptors? descriptors;

  /// The human-readable display name of the registry record.
  final String? displayName;

  /// The version identifier of the registry record.
  final String? recordVersion;

  /// The reason for the current status. Typically populated when the status
  /// indicates a failure state.
  final String? statusReason;

  GetRegistryRecordResponse({
    required this.createdAt,
    required this.name,
    required this.recordArn,
    required this.recordId,
    required this.recordType,
    required this.registryArn,
    required this.status,
    required this.updatedAt,
    this.description,
    this.descriptors,
    this.displayName,
    this.recordVersion,
    this.statusReason,
  });

  factory GetRegistryRecordResponse.fromJson(Map<String, dynamic> json) {
    return GetRegistryRecordResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      recordArn: (json['recordArn'] as String?) ?? '',
      recordId: (json['recordId'] as String?) ?? '',
      recordType: RecordType.fromString((json['recordType'] as String?) ?? ''),
      registryArn: (json['registryArn'] as String?) ?? '',
      status:
          RegistryRecordStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      descriptors: json['descriptors'] != null
          ? Descriptors.fromJson(json['descriptors'] as Map<String, dynamic>)
          : null,
      displayName: json['displayName'] as String?,
      recordVersion: json['recordVersion'] as String?,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final recordArn = this.recordArn;
    final recordId = this.recordId;
    final recordType = this.recordType;
    final registryArn = this.registryArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final descriptors = this.descriptors;
    final displayName = this.displayName;
    final recordVersion = this.recordVersion;
    final statusReason = this.statusReason;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'recordArn': recordArn,
      'recordId': recordId,
      'recordType': recordType.value,
      'registryArn': registryArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (descriptors != null) 'descriptors': descriptors,
      if (displayName != null) 'displayName': displayName,
      if (recordVersion != null) 'recordVersion': recordVersion,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Response structure for updating a registry record
///
/// @nodoc
class UpdateRegistryRecordResponse {
  /// The timestamp when the registry record was created.
  final DateTime createdAt;

  /// The name of the registry record. Names are unique within a registry.
  final String name;

  /// The &amp;ARN; of the registry record.
  final String recordArn;

  /// The unique identifier of the registry record.
  final String recordId;

  /// The type of the registry record, such as MCP, AGENT, SKILL, or CUSTOM.
  final RecordType recordType;

  /// The &amp;ARN; of the parent registry that owns the record.
  final String registryArn;

  /// The lifecycle status of the registry record.
  final RegistryRecordStatus status;

  /// The timestamp when the registry record was last updated.
  final DateTime updatedAt;

  /// A description of the registry record.
  final String? description;

  /// The typed descriptors that define the content of the registry record.
  final Descriptors? descriptors;

  /// The human-readable display name of the registry record.
  final String? displayName;

  /// The version identifier of the registry record.
  final String? recordVersion;

  /// The reason for the current status. Typically populated when the status
  /// indicates a failure state.
  final String? statusReason;

  UpdateRegistryRecordResponse({
    required this.createdAt,
    required this.name,
    required this.recordArn,
    required this.recordId,
    required this.recordType,
    required this.registryArn,
    required this.status,
    required this.updatedAt,
    this.description,
    this.descriptors,
    this.displayName,
    this.recordVersion,
    this.statusReason,
  });

  factory UpdateRegistryRecordResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRegistryRecordResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      recordArn: (json['recordArn'] as String?) ?? '',
      recordId: (json['recordId'] as String?) ?? '',
      recordType: RecordType.fromString((json['recordType'] as String?) ?? ''),
      registryArn: (json['registryArn'] as String?) ?? '',
      status:
          RegistryRecordStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      descriptors: json['descriptors'] != null
          ? Descriptors.fromJson(json['descriptors'] as Map<String, dynamic>)
          : null,
      displayName: json['displayName'] as String?,
      recordVersion: json['recordVersion'] as String?,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final recordArn = this.recordArn;
    final recordId = this.recordId;
    final recordType = this.recordType;
    final registryArn = this.registryArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final descriptors = this.descriptors;
    final displayName = this.displayName;
    final recordVersion = this.recordVersion;
    final statusReason = this.statusReason;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'recordArn': recordArn,
      'recordId': recordId,
      'recordType': recordType.value,
      'registryArn': registryArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (descriptors != null) 'descriptors': descriptors,
      if (displayName != null) 'displayName': displayName,
      if (recordVersion != null) 'recordVersion': recordVersion,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Response structure for deleting a registry record
///
/// @nodoc
class DeleteRegistryRecordResponse {
  DeleteRegistryRecordResponse();

  factory DeleteRegistryRecordResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRegistryRecordResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Response structure for listing registry records
///
/// @nodoc
class ListRegistryRecordsResponse {
  /// List of registry record summaries
  final List<RegistryRecordSummary> registryRecords;

  /// Token for next page of results
  final String? nextToken;

  ListRegistryRecordsResponse({
    required this.registryRecords,
    this.nextToken,
  });

  factory ListRegistryRecordsResponse.fromJson(Map<String, dynamic> json) {
    return ListRegistryRecordsResponse(
      registryRecords: ((json['registryRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => RegistryRecordSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registryRecords = this.registryRecords;
    final nextToken = this.nextToken;
    return {
      'registryRecords': registryRecords,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Response structure for submitting a registry record for approval
///
/// @nodoc
class SubmitRegistryRecordForApprovalResponse {
  /// The ARN of the registry record
  final String recordArn;

  /// The ID of the registry record
  final String recordId;

  /// The ARN of the registry
  final String registryArn;

  /// The resulting status of the registry record
  final RegistryRecordStatus status;

  /// The timestamp when the record was last updated
  final DateTime updatedAt;

  SubmitRegistryRecordForApprovalResponse({
    required this.recordArn,
    required this.recordId,
    required this.registryArn,
    required this.status,
    required this.updatedAt,
  });

  factory SubmitRegistryRecordForApprovalResponse.fromJson(
      Map<String, dynamic> json) {
    return SubmitRegistryRecordForApprovalResponse(
      recordArn: (json['recordArn'] as String?) ?? '',
      recordId: (json['recordId'] as String?) ?? '',
      registryArn: (json['registryArn'] as String?) ?? '',
      status:
          RegistryRecordStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final recordArn = this.recordArn;
    final recordId = this.recordId;
    final registryArn = this.registryArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'recordArn': recordArn,
      'recordId': recordId,
      'registryArn': registryArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Response structure for updating a registry record status
///
/// @nodoc
class UpdateRegistryRecordStatusResponse {
  /// The ARN of the registry record
  final String recordArn;

  /// The ID of the registry record
  final String recordId;

  /// The ARN of the registry
  final String registryArn;

  /// The resulting status of the registry record
  final RegistryRecordStatus status;

  /// The reason for the status change
  final String statusReason;

  /// The timestamp when the record was last updated
  final DateTime updatedAt;

  UpdateRegistryRecordStatusResponse({
    required this.recordArn,
    required this.recordId,
    required this.registryArn,
    required this.status,
    required this.statusReason,
    required this.updatedAt,
  });

  factory UpdateRegistryRecordStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateRegistryRecordStatusResponse(
      recordArn: (json['recordArn'] as String?) ?? '',
      recordId: (json['recordId'] as String?) ?? '',
      registryArn: (json['registryArn'] as String?) ?? '',
      status:
          RegistryRecordStatus.fromString((json['status'] as String?) ?? ''),
      statusReason: (json['statusReason'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final recordArn = this.recordArn;
    final recordId = this.recordId;
    final registryArn = this.registryArn;
    final status = this.status;
    final statusReason = this.statusReason;
    final updatedAt = this.updatedAt;
    return {
      'recordArn': recordArn,
      'recordId': recordId,
      'registryArn': registryArn,
      'status': status.value,
      'statusReason': statusReason,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Response structure for creating a registry
///
/// @nodoc
class CreateRegistryResponse {
  /// The ARN of the created registry
  final String registryArn;

  CreateRegistryResponse({
    required this.registryArn,
  });

  factory CreateRegistryResponse.fromJson(Map<String, dynamic> json) {
    return CreateRegistryResponse(
      registryArn: (json['registryArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final registryArn = this.registryArn;
    return {
      'registryArn': registryArn,
    };
  }
}

/// Response structure for getting a registry
///
/// @nodoc
class GetRegistryResponse {
  /// The timestamp when the registry was created
  final DateTime createdAt;

  /// The name of the registry
  final String name;

  /// The ARN of the registry
  final String registryArn;

  /// The unique identifier of the registry
  final String registryId;

  /// Current status of the registry
  final RegistryStatus status;

  /// The timestamp when the registry was last updated
  final DateTime updatedAt;

  /// Approval configuration for registry records
  final ApprovalConfiguration? approvalConfiguration;

  /// The description of the registry
  final String? description;

  /// Discovery configuration for the registry
  final DiscoveryConfiguration? discoveryConfiguration;

  /// The reason for the current status. Typically populated when the status
  /// indicates a failure state.
  final String? statusReason;

  GetRegistryResponse({
    required this.createdAt,
    required this.name,
    required this.registryArn,
    required this.registryId,
    required this.status,
    required this.updatedAt,
    this.approvalConfiguration,
    this.description,
    this.discoveryConfiguration,
    this.statusReason,
  });

  factory GetRegistryResponse.fromJson(Map<String, dynamic> json) {
    return GetRegistryResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      registryArn: (json['registryArn'] as String?) ?? '',
      registryId: (json['registryId'] as String?) ?? '',
      status: RegistryStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      approvalConfiguration: json['approvalConfiguration'] != null
          ? ApprovalConfiguration.fromJson(
              json['approvalConfiguration'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      discoveryConfiguration: json['discoveryConfiguration'] != null
          ? DiscoveryConfiguration.fromJson(
              json['discoveryConfiguration'] as Map<String, dynamic>)
          : null,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final registryArn = this.registryArn;
    final registryId = this.registryId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final approvalConfiguration = this.approvalConfiguration;
    final description = this.description;
    final discoveryConfiguration = this.discoveryConfiguration;
    final statusReason = this.statusReason;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'registryArn': registryArn,
      'registryId': registryId,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (approvalConfiguration != null)
        'approvalConfiguration': approvalConfiguration,
      if (description != null) 'description': description,
      if (discoveryConfiguration != null)
        'discoveryConfiguration': discoveryConfiguration,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Response structure for updating a registry
///
/// @nodoc
class UpdateRegistryResponse {
  /// The timestamp when the registry was created
  final DateTime createdAt;

  /// The name of the registry
  final String name;

  /// The ARN of the registry
  final String registryArn;

  /// The unique identifier of the registry
  final String registryId;

  /// Current status of the registry
  final RegistryStatus status;

  /// The timestamp when the registry was last updated
  final DateTime updatedAt;

  /// Approval configuration for registry records
  final ApprovalConfiguration? approvalConfiguration;

  /// The description of the registry
  final String? description;

  /// Discovery configuration for the registry
  final DiscoveryConfiguration? discoveryConfiguration;

  /// The reason for the current status. Typically populated when the status
  /// indicates a failure state.
  final String? statusReason;

  UpdateRegistryResponse({
    required this.createdAt,
    required this.name,
    required this.registryArn,
    required this.registryId,
    required this.status,
    required this.updatedAt,
    this.approvalConfiguration,
    this.description,
    this.discoveryConfiguration,
    this.statusReason,
  });

  factory UpdateRegistryResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRegistryResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      registryArn: (json['registryArn'] as String?) ?? '',
      registryId: (json['registryId'] as String?) ?? '',
      status: RegistryStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      approvalConfiguration: json['approvalConfiguration'] != null
          ? ApprovalConfiguration.fromJson(
              json['approvalConfiguration'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      discoveryConfiguration: json['discoveryConfiguration'] != null
          ? DiscoveryConfiguration.fromJson(
              json['discoveryConfiguration'] as Map<String, dynamic>)
          : null,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final registryArn = this.registryArn;
    final registryId = this.registryId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final approvalConfiguration = this.approvalConfiguration;
    final description = this.description;
    final discoveryConfiguration = this.discoveryConfiguration;
    final statusReason = this.statusReason;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'registryArn': registryArn,
      'registryId': registryId,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (approvalConfiguration != null)
        'approvalConfiguration': approvalConfiguration,
      if (description != null) 'description': description,
      if (discoveryConfiguration != null)
        'discoveryConfiguration': discoveryConfiguration,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Response structure for deleting a registry
///
/// @nodoc
class DeleteRegistryResponse {
  /// Current status of the registry, set to DELETING when deletion is initiated
  final RegistryStatus status;

  DeleteRegistryResponse({
    required this.status,
  });

  factory DeleteRegistryResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRegistryResponse(
      status: RegistryStatus.fromString((json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

/// Response structure for listing registries
///
/// @nodoc
class ListRegistriesResponse {
  /// List of registry summaries
  final List<RegistrySummary> registries;

  /// Token for next page of results
  final String? nextToken;

  ListRegistriesResponse({
    required this.registries,
    this.nextToken,
  });

  factory ListRegistriesResponse.fromJson(Map<String, dynamic> json) {
    return ListRegistriesResponse(
      registries: ((json['registries'] as List?) ?? const [])
          .nonNulls
          .map((e) => RegistrySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registries = this.registries;
    final nextToken = this.nextToken;
    return {
      'registries': registries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Registry summary for list operations
///
/// @nodoc
class RegistrySummary {
  /// The timestamp when the registry was created
  final DateTime createdAt;

  /// Registry name
  final String name;

  /// Registry Amazon Resource Name
  final String registryArn;

  /// Unique registry identifier
  final String registryId;

  /// Current status of the registry
  final RegistryStatus status;

  /// The timestamp when the registry was last updated
  final DateTime updatedAt;

  /// Registry description
  final String? description;

  /// Discovery configuration for the registry
  final DiscoveryConfiguration? discoveryConfiguration;

  /// The reason for the current status. Typically populated when the status
  /// indicates a failure state.
  final String? statusReason;

  RegistrySummary({
    required this.createdAt,
    required this.name,
    required this.registryArn,
    required this.registryId,
    required this.status,
    required this.updatedAt,
    this.description,
    this.discoveryConfiguration,
    this.statusReason,
  });

  factory RegistrySummary.fromJson(Map<String, dynamic> json) {
    return RegistrySummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      registryArn: (json['registryArn'] as String?) ?? '',
      registryId: (json['registryId'] as String?) ?? '',
      status: RegistryStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      discoveryConfiguration: json['discoveryConfiguration'] != null
          ? DiscoveryConfiguration.fromJson(
              json['discoveryConfiguration'] as Map<String, dynamic>)
          : null,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final registryArn = this.registryArn;
    final registryId = this.registryId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final discoveryConfiguration = this.discoveryConfiguration;
    final statusReason = this.statusReason;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'registryArn': registryArn,
      'registryId': registryId,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (discoveryConfiguration != null)
        'discoveryConfiguration': discoveryConfiguration,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Discovery configuration for the registry. Controls how consumers are
/// authorized to search the registry and invoke its MCP endpoint.
///
/// @nodoc
class DiscoveryConfiguration {
  /// The authorizer configuration for the registry. Required when authorizerType
  /// is CUSTOM_JWT.
  final AuthorizerConfiguration? authorizerConfiguration;

  /// The type of authorizer that controls how consumers access the registry's
  /// search and MCP invoke operations.
  final RegistryAuthorizerType? authorizerType;

  DiscoveryConfiguration({
    this.authorizerConfiguration,
    this.authorizerType,
  });

  factory DiscoveryConfiguration.fromJson(Map<String, dynamic> json) {
    return DiscoveryConfiguration(
      authorizerConfiguration: json['authorizerConfiguration'] != null
          ? AuthorizerConfiguration.fromJson(
              json['authorizerConfiguration'] as Map<String, dynamic>)
          : null,
      authorizerType: (json['authorizerType'] as String?)
          ?.let(RegistryAuthorizerType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizerConfiguration = this.authorizerConfiguration;
    final authorizerType = this.authorizerType;
    return {
      if (authorizerConfiguration != null)
        'authorizerConfiguration': authorizerConfiguration,
      if (authorizerType != null) 'authorizerType': authorizerType.value,
    };
  }
}

/// @nodoc
class RegistryStatus {
  static const creating = RegistryStatus._('CREATING');
  static const ready = RegistryStatus._('READY');
  static const updating = RegistryStatus._('UPDATING');
  static const createFailed = RegistryStatus._('CREATE_FAILED');
  static const updateFailed = RegistryStatus._('UPDATE_FAILED');
  static const deleting = RegistryStatus._('DELETING');
  static const deleteFailed = RegistryStatus._('DELETE_FAILED');

  final String value;

  const RegistryStatus._(this.value);

  static const values = [
    creating,
    ready,
    updating,
    createFailed,
    updateFailed,
    deleting,
    deleteFailed
  ];

  static RegistryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistryStatus._(value));

  @override
  bool operator ==(other) => other is RegistryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The authorizer configuration for a registry. Exactly one member is set.
///
/// @nodoc
class AuthorizerConfiguration {
  /// Configuration for a custom JWT authorizer.
  final CustomJWTAuthorizerConfiguration? customJWTAuthorizer;

  AuthorizerConfiguration({
    this.customJWTAuthorizer,
  });

  factory AuthorizerConfiguration.fromJson(Map<String, dynamic> json) {
    return AuthorizerConfiguration(
      customJWTAuthorizer: json['customJWTAuthorizer'] != null
          ? CustomJWTAuthorizerConfiguration.fromJson(
              json['customJWTAuthorizer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customJWTAuthorizer = this.customJWTAuthorizer;
    return {
      if (customJWTAuthorizer != null)
        'customJWTAuthorizer': customJWTAuthorizer,
    };
  }
}

/// @nodoc
class RegistryAuthorizerType {
  static const customJwt = RegistryAuthorizerType._('CUSTOM_JWT');
  static const awsIam = RegistryAuthorizerType._('AWS_IAM');

  final String value;

  const RegistryAuthorizerType._(this.value);

  static const values = [customJwt, awsIam];

  static RegistryAuthorizerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistryAuthorizerType._(value));

  @override
  bool operator ==(other) =>
      other is RegistryAuthorizerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for a custom JWT authorizer that validates inbound bearer
/// tokens against an OpenID Connect identity provider.
///
/// @nodoc
class CustomJWTAuthorizerConfiguration {
  /// The OpenID Connect discovery URL used to retrieve the identity provider's
  /// metadata and signing keys.
  final String discoveryUrl;

  /// The audience values accepted during JWT validation. A token is rejected if
  /// none of its audience claims match.
  final List<String>? allowedAudience;

  /// The client identifiers accepted during JWT validation. A token is rejected
  /// if it was not issued to one of these clients.
  final List<String>? allowedClients;

  /// The scopes accepted during JWT validation. A token is rejected if it does
  /// not carry one of these scopes.
  final List<String>? allowedScopes;

  /// Additional custom claim validations applied to the inbound JWT.
  final List<CustomClaimValidationType>? customClaims;

  /// The private endpoint used to reach the identity provider's discovery URL
  /// over a private network path.
  final PrivateEndpoint? privateEndpoint;

  /// Per-domain private endpoint overrides that route specific identity provider
  /// domains through distinct private endpoints.
  final List<PrivateEndpointOverride>? privateEndpointOverrides;

  CustomJWTAuthorizerConfiguration({
    required this.discoveryUrl,
    this.allowedAudience,
    this.allowedClients,
    this.allowedScopes,
    this.customClaims,
    this.privateEndpoint,
    this.privateEndpointOverrides,
  });

  factory CustomJWTAuthorizerConfiguration.fromJson(Map<String, dynamic> json) {
    return CustomJWTAuthorizerConfiguration(
      discoveryUrl: (json['discoveryUrl'] as String?) ?? '',
      allowedAudience: (json['allowedAudience'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowedClients: (json['allowedClients'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowedScopes: (json['allowedScopes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      customClaims: (json['customClaims'] as List?)
          ?.nonNulls
          .map((e) =>
              CustomClaimValidationType.fromJson(e as Map<String, dynamic>))
          .toList(),
      privateEndpoint: json['privateEndpoint'] != null
          ? PrivateEndpoint.fromJson(
              json['privateEndpoint'] as Map<String, dynamic>)
          : null,
      privateEndpointOverrides: (json['privateEndpointOverrides'] as List?)
          ?.nonNulls
          .map((e) =>
              PrivateEndpointOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final discoveryUrl = this.discoveryUrl;
    final allowedAudience = this.allowedAudience;
    final allowedClients = this.allowedClients;
    final allowedScopes = this.allowedScopes;
    final customClaims = this.customClaims;
    final privateEndpoint = this.privateEndpoint;
    final privateEndpointOverrides = this.privateEndpointOverrides;
    return {
      'discoveryUrl': discoveryUrl,
      if (allowedAudience != null) 'allowedAudience': allowedAudience,
      if (allowedClients != null) 'allowedClients': allowedClients,
      if (allowedScopes != null) 'allowedScopes': allowedScopes,
      if (customClaims != null) 'customClaims': customClaims,
      if (privateEndpoint != null) 'privateEndpoint': privateEndpoint,
      if (privateEndpointOverrides != null)
        'privateEndpointOverrides': privateEndpointOverrides,
    };
  }
}

/// A private network endpoint used to reach a resource over a private path.
/// Exactly one member is set.
///
/// @nodoc
class PrivateEndpoint {
  /// A private endpoint backed by a service-managed VPC resource.
  final ManagedVpcResource? managedVpcResource;

  /// A private endpoint backed by a self-managed VPC Lattice resource
  /// configuration.
  final SelfManagedLatticeResource? selfManagedLatticeResource;

  PrivateEndpoint({
    this.managedVpcResource,
    this.selfManagedLatticeResource,
  });

  factory PrivateEndpoint.fromJson(Map<String, dynamic> json) {
    return PrivateEndpoint(
      managedVpcResource: json['managedVpcResource'] != null
          ? ManagedVpcResource.fromJson(
              json['managedVpcResource'] as Map<String, dynamic>)
          : null,
      selfManagedLatticeResource: json['selfManagedLatticeResource'] != null
          ? SelfManagedLatticeResource.fromJson(
              json['selfManagedLatticeResource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final managedVpcResource = this.managedVpcResource;
    final selfManagedLatticeResource = this.selfManagedLatticeResource;
    return {
      if (managedVpcResource != null) 'managedVpcResource': managedVpcResource,
      if (selfManagedLatticeResource != null)
        'selfManagedLatticeResource': selfManagedLatticeResource,
    };
  }
}

/// A mapping of a domain to the private endpoint used to reach it.
///
/// @nodoc
class PrivateEndpointOverride {
  /// The domain name to which this private endpoint override applies.
  final String domain;

  /// The private endpoint used to reach the specified domain.
  final PrivateEndpoint privateEndpoint;

  PrivateEndpointOverride({
    required this.domain,
    required this.privateEndpoint,
  });

  factory PrivateEndpointOverride.fromJson(Map<String, dynamic> json) {
    return PrivateEndpointOverride(
      domain: (json['domain'] as String?) ?? '',
      privateEndpoint: PrivateEndpoint.fromJson(
          (json['privateEndpoint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final privateEndpoint = this.privateEndpoint;
    return {
      'domain': domain,
      'privateEndpoint': privateEndpoint,
    };
  }
}

/// A self-managed private endpoint backed by a VPC Lattice resource
/// configuration. Exactly one member is set.
///
/// @nodoc
class SelfManagedLatticeResource {
  /// The identifier of the VPC Lattice resource configuration, specified as a
  /// resource configuration ID or ARN.
  final String? resourceConfigurationIdentifier;

  SelfManagedLatticeResource({
    this.resourceConfigurationIdentifier,
  });

  factory SelfManagedLatticeResource.fromJson(Map<String, dynamic> json) {
    return SelfManagedLatticeResource(
      resourceConfigurationIdentifier:
          json['resourceConfigurationIdentifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceConfigurationIdentifier =
        this.resourceConfigurationIdentifier;
    return {
      if (resourceConfigurationIdentifier != null)
        'resourceConfigurationIdentifier': resourceConfigurationIdentifier,
    };
  }
}

/// A service-managed private endpoint provisioned within a customer VPC.
///
/// @nodoc
class ManagedVpcResource {
  /// The IP address type used by the private endpoint, either IPV4 or IPV6.
  final EndpointIpAddressType endpointIpAddressType;

  /// The identifiers of the subnets in which the private endpoint network
  /// interfaces are placed.
  final List<String> subnetIds;

  /// The identifier of the VPC in which the private endpoint is provisioned.
  final String vpcIdentifier;

  /// The routing domain used to resolve traffic through the private endpoint.
  final String? routingDomain;

  /// The identifiers of the security groups associated with the private endpoint
  /// network interfaces.
  final List<String>? securityGroupIds;
  final Map<String, String>? tags;

  ManagedVpcResource({
    required this.endpointIpAddressType,
    required this.subnetIds,
    required this.vpcIdentifier,
    this.routingDomain,
    this.securityGroupIds,
    this.tags,
  });

  factory ManagedVpcResource.fromJson(Map<String, dynamic> json) {
    return ManagedVpcResource(
      endpointIpAddressType: EndpointIpAddressType.fromString(
          (json['endpointIpAddressType'] as String?) ?? ''),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcIdentifier: (json['vpcIdentifier'] as String?) ?? '',
      routingDomain: json['routingDomain'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final endpointIpAddressType = this.endpointIpAddressType;
    final subnetIds = this.subnetIds;
    final vpcIdentifier = this.vpcIdentifier;
    final routingDomain = this.routingDomain;
    final securityGroupIds = this.securityGroupIds;
    final tags = this.tags;
    return {
      'endpointIpAddressType': endpointIpAddressType.value,
      'subnetIds': subnetIds,
      'vpcIdentifier': vpcIdentifier,
      if (routingDomain != null) 'routingDomain': routingDomain,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The IP address type used by a private endpoint.
///
/// @nodoc
class EndpointIpAddressType {
  static const ipv4 = EndpointIpAddressType._('IPV4');
  static const ipv6 = EndpointIpAddressType._('IPV6');

  final String value;

  const EndpointIpAddressType._(this.value);

  static const values = [ipv4, ipv6];

  static EndpointIpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EndpointIpAddressType._(value));

  @override
  bool operator ==(other) =>
      other is EndpointIpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A validation rule applied to a single claim of an inbound JWT.
///
/// @nodoc
class CustomClaimValidationType {
  /// The value and match operator used to authorize the claim.
  final AuthorizingClaimMatchValueType authorizingClaimMatchValue;

  /// The name of the claim in the inbound token to validate.
  final String inboundTokenClaimName;

  /// The value type of the claim in the inbound token, either a string or an
  /// array of strings.
  final InboundTokenClaimValueType inboundTokenClaimValueType;

  CustomClaimValidationType({
    required this.authorizingClaimMatchValue,
    required this.inboundTokenClaimName,
    required this.inboundTokenClaimValueType,
  });

  factory CustomClaimValidationType.fromJson(Map<String, dynamic> json) {
    return CustomClaimValidationType(
      authorizingClaimMatchValue: AuthorizingClaimMatchValueType.fromJson(
          (json['authorizingClaimMatchValue'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inboundTokenClaimName: (json['inboundTokenClaimName'] as String?) ?? '',
      inboundTokenClaimValueType: InboundTokenClaimValueType.fromString(
          (json['inboundTokenClaimValueType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizingClaimMatchValue = this.authorizingClaimMatchValue;
    final inboundTokenClaimName = this.inboundTokenClaimName;
    final inboundTokenClaimValueType = this.inboundTokenClaimValueType;
    return {
      'authorizingClaimMatchValue': authorizingClaimMatchValue,
      'inboundTokenClaimName': inboundTokenClaimName,
      'inboundTokenClaimValueType': inboundTokenClaimValueType.value,
    };
  }
}

/// The value type of a claim in an inbound JWT.
///
/// @nodoc
class InboundTokenClaimValueType {
  static const string = InboundTokenClaimValueType._('STRING');
  static const stringArray = InboundTokenClaimValueType._('STRING_ARRAY');

  final String value;

  const InboundTokenClaimValueType._(this.value);

  static const values = [string, stringArray];

  static InboundTokenClaimValueType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InboundTokenClaimValueType._(value));

  @override
  bool operator ==(other) =>
      other is InboundTokenClaimValueType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The value and match operator used to authorize a claim during JWT
/// validation.
///
/// @nodoc
class AuthorizingClaimMatchValueType {
  /// The operator used to compare the claim value against the expected value.
  final ClaimMatchOperatorType claimMatchOperator;

  /// The expected value or values that the claim is compared against.
  final ClaimMatchValueType claimMatchValue;

  AuthorizingClaimMatchValueType({
    required this.claimMatchOperator,
    required this.claimMatchValue,
  });

  factory AuthorizingClaimMatchValueType.fromJson(Map<String, dynamic> json) {
    return AuthorizingClaimMatchValueType(
      claimMatchOperator: ClaimMatchOperatorType.fromString(
          (json['claimMatchOperator'] as String?) ?? ''),
      claimMatchValue: ClaimMatchValueType.fromJson(
          (json['claimMatchValue'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final claimMatchOperator = this.claimMatchOperator;
    final claimMatchValue = this.claimMatchValue;
    return {
      'claimMatchOperator': claimMatchOperator.value,
      'claimMatchValue': claimMatchValue,
    };
  }
}

/// The expected value used to match a claim. Exactly one member is set.
///
/// @nodoc
class ClaimMatchValueType {
  /// A single string value to match the claim against.
  final String? matchValueString;

  /// A list of string values to match the claim against.
  final List<String>? matchValueStringList;

  ClaimMatchValueType({
    this.matchValueString,
    this.matchValueStringList,
  });

  factory ClaimMatchValueType.fromJson(Map<String, dynamic> json) {
    return ClaimMatchValueType(
      matchValueString: json['matchValueString'] as String?,
      matchValueStringList: (json['matchValueStringList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final matchValueString = this.matchValueString;
    final matchValueStringList = this.matchValueStringList;
    return {
      if (matchValueString != null) 'matchValueString': matchValueString,
      if (matchValueStringList != null)
        'matchValueStringList': matchValueStringList,
    };
  }
}

/// The operator used to compare a claim value against the expected value during
/// JWT validation.
///
/// @nodoc
class ClaimMatchOperatorType {
  static const equals = ClaimMatchOperatorType._('EQUALS');
  static const contains = ClaimMatchOperatorType._('CONTAINS');
  static const containsAny = ClaimMatchOperatorType._('CONTAINS_ANY');

  final String value;

  const ClaimMatchOperatorType._(this.value);

  static const values = [equals, contains, containsAny];

  static ClaimMatchOperatorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClaimMatchOperatorType._(value));

  @override
  bool operator ==(other) =>
      other is ClaimMatchOperatorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single filter applied to a ListRegistries request.
///
/// @nodoc
class RegistryFilter {
  /// The attribute to filter on
  final RegistryFilterName name;

  /// The values to match for the attribute
  final List<String> values;

  RegistryFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name.value,
      'values': values,
    };
  }
}

/// @nodoc
class RegistryFilterName {
  static const status = RegistryFilterName._('status');
  static const discoveryConfigurationAuthorizerType =
      RegistryFilterName._('discoveryConfiguration.authorizerType');

  final String value;

  const RegistryFilterName._(this.value);

  static const values = [status, discoveryConfigurationAuthorizerType];

  static RegistryFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistryFilterName._(value));

  @override
  bool operator ==(other) =>
      other is RegistryFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for the registry's record approval workflow. Controls whether
/// records submitted for approval require manual review before they become
/// approved and discoverable, or are auto-approved. When no auto-approval rules
/// are configured, submitted records require manual review.
///
/// @nodoc
class ApprovalConfiguration {
  /// The rules that determine which registry records are automatically approved
  /// on submission. When omitted or empty, submitted records require manual
  /// review.
  final List<AutoApprovalRule>? autoApprovalRules;

  ApprovalConfiguration({
    this.autoApprovalRules,
  });

  factory ApprovalConfiguration.fromJson(Map<String, dynamic> json) {
    return ApprovalConfiguration(
      autoApprovalRules: (json['autoApprovalRules'] as List?)
          ?.nonNulls
          .map((e) => AutoApprovalRule.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoApprovalRules = this.autoApprovalRules;
    return {
      if (autoApprovalRules != null)
        'autoApprovalRules': autoApprovalRules.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class AutoApprovalRule {
  static const approveAll = AutoApprovalRule._('APPROVE_ALL');

  final String value;

  const AutoApprovalRule._(this.value);

  static const values = [approveAll];

  static AutoApprovalRule fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutoApprovalRule._(value));

  @override
  bool operator ==(other) => other is AutoApprovalRule && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Wrapper for updating an optional Description field with PATCH semantics
///
/// @nodoc
class UpdatedDescription {
  final String? optionalValue;

  UpdatedDescription({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The discovery configuration fields to update on a registry. Omit this
/// structure to leave the discovery configuration unchanged.
///
/// @nodoc
class UpdatedDiscoveryConfiguration {
  /// Authorization configuration for the registry, with PATCH semantics
  final UpdatedAuthorizerConfiguration? authorizerConfiguration;

  UpdatedDiscoveryConfiguration({
    this.authorizerConfiguration,
  });

  Map<String, dynamic> toJson() {
    final authorizerConfiguration = this.authorizerConfiguration;
    return {
      if (authorizerConfiguration != null)
        'authorizerConfiguration': authorizerConfiguration,
    };
  }
}

/// A wrapper for updating the approval configuration of a registry. Include
/// this wrapper to replace the approval configuration with the specified value;
/// omit it to leave the approval configuration unchanged.
///
/// @nodoc
class UpdatedApprovalConfiguration {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final ApprovalConfiguration? optionalValue;

  UpdatedApprovalConfiguration({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// Wrapper for updating an optional authorizer configuration with PATCH
/// semantics.
///
/// @nodoc
class UpdatedAuthorizerConfiguration {
  /// The new authorizer configuration to set. Omit to leave the existing
  /// configuration unchanged.
  final AuthorizerConfiguration? optionalValue;

  UpdatedAuthorizerConfiguration({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// Registry record status
///
/// @nodoc
class RegistryRecordStatus {
  static const draft = RegistryRecordStatus._('DRAFT');
  static const pendingApproval = RegistryRecordStatus._('PENDING_APPROVAL');
  static const approved = RegistryRecordStatus._('APPROVED');
  static const rejected = RegistryRecordStatus._('REJECTED');
  static const deprecated = RegistryRecordStatus._('DEPRECATED');
  static const creating = RegistryRecordStatus._('CREATING');
  static const updating = RegistryRecordStatus._('UPDATING');
  static const createFailed = RegistryRecordStatus._('CREATE_FAILED');
  static const updateFailed = RegistryRecordStatus._('UPDATE_FAILED');

  final String value;

  const RegistryRecordStatus._(this.value);

  static const values = [
    draft,
    pendingApproval,
    approved,
    rejected,
    deprecated,
    creating,
    updating,
    createFailed,
    updateFailed
  ];

  static RegistryRecordStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistryRecordStatus._(value));

  @override
  bool operator ==(other) =>
      other is RegistryRecordStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of a registry record returned by list operations. Contains
/// identifying and lifecycle fields but omits descriptor content.
///
/// @nodoc
class RegistryRecordSummary {
  /// The timestamp when the registry record was created.
  final DateTime createdAt;

  /// The name of the registry record. Names are unique within a registry.
  final String name;

  /// The &amp;ARN; of the registry record.
  final String recordArn;

  /// The unique identifier of the registry record.
  final String recordId;

  /// The type of the registry record, such as MCP, AGENT, SKILL, or CUSTOM.
  final RecordType recordType;

  /// The version identifier of the registry record.
  final String recordVersion;

  /// The &amp;ARN; of the parent registry that owns the record.
  final String registryArn;

  /// The lifecycle status of the registry record.
  final RegistryRecordStatus status;

  /// The timestamp when the registry record was last updated.
  final DateTime updatedAt;

  /// A description of the registry record.
  final String? description;

  /// The human-readable display name of the registry record.
  final String? displayName;

  RegistryRecordSummary({
    required this.createdAt,
    required this.name,
    required this.recordArn,
    required this.recordId,
    required this.recordType,
    required this.recordVersion,
    required this.registryArn,
    required this.status,
    required this.updatedAt,
    this.description,
    this.displayName,
  });

  factory RegistryRecordSummary.fromJson(Map<String, dynamic> json) {
    return RegistryRecordSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      recordArn: (json['recordArn'] as String?) ?? '',
      recordId: (json['recordId'] as String?) ?? '',
      recordType: RecordType.fromString((json['recordType'] as String?) ?? ''),
      recordVersion: (json['recordVersion'] as String?) ?? '',
      registryArn: (json['registryArn'] as String?) ?? '',
      status:
          RegistryRecordStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final recordArn = this.recordArn;
    final recordId = this.recordId;
    final recordType = this.recordType;
    final recordVersion = this.recordVersion;
    final registryArn = this.registryArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final displayName = this.displayName;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'recordArn': recordArn,
      'recordId': recordId,
      'recordType': recordType.value,
      'recordVersion': recordVersion,
      'registryArn': registryArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

/// Record type enum for registry record classification
///
/// @nodoc
class RecordType {
  static const mcp = RecordType._('MCP');
  static const agent = RecordType._('AGENT');
  static const custom = RecordType._('CUSTOM');
  static const skill = RecordType._('SKILL');

  final String value;

  const RecordType._(this.value);

  static const values = [mcp, agent, custom, skill];

  static RecordType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RecordType._(value));

  @override
  bool operator ==(other) => other is RecordType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single filter applied to a ListRegistryRecords request.
///
/// @nodoc
class RegistryRecordFilter {
  /// The attribute to filter on
  final RegistryRecordFilterName name;

  /// The values to match for the attribute
  final List<String> values;

  RegistryRecordFilter({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name.value,
      'values': values,
    };
  }
}

/// @nodoc
class RegistryRecordFilterName {
  static const name = RegistryRecordFilterName._('name');
  static const status = RegistryRecordFilterName._('status');
  static const recordType = RegistryRecordFilterName._('recordType');

  final String value;

  const RegistryRecordFilterName._(this.value);

  static const values = [name, status, recordType];

  static RegistryRecordFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistryRecordFilterName._(value));

  @override
  bool operator ==(other) =>
      other is RegistryRecordFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The typed set of descriptors for a registry record. Exactly one descriptor
/// field is populated based on the record type.
///
/// @nodoc
class Descriptors {
  /// The A2A agent card descriptor, populated when the record type is AGENT.
  final A2aAgentCardDescriptor? a2aAgentCard;

  /// The agent skills definition descriptor, populated when the record type is
  /// SKILL.
  final AgentSkillsDefinitionDescriptor? agentSkillsDefinition;

  /// The custom descriptor, populated when the record type is CUSTOM.
  final CustomDescriptor? custom;

  /// The MCP server descriptor, populated when the record type is MCP.
  final McpServerDescriptor? mcpServer;

  Descriptors({
    this.a2aAgentCard,
    this.agentSkillsDefinition,
    this.custom,
    this.mcpServer,
  });

  factory Descriptors.fromJson(Map<String, dynamic> json) {
    return Descriptors(
      a2aAgentCard: json['a2aAgentCard'] != null
          ? A2aAgentCardDescriptor.fromJson(
              json['a2aAgentCard'] as Map<String, dynamic>)
          : null,
      agentSkillsDefinition: json['agentSkillsDefinition'] != null
          ? AgentSkillsDefinitionDescriptor.fromJson(
              json['agentSkillsDefinition'] as Map<String, dynamic>)
          : null,
      custom: json['custom'] != null
          ? CustomDescriptor.fromJson(json['custom'] as Map<String, dynamic>)
          : null,
      mcpServer: json['mcpServer'] != null
          ? McpServerDescriptor.fromJson(
              json['mcpServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final a2aAgentCard = this.a2aAgentCard;
    final agentSkillsDefinition = this.agentSkillsDefinition;
    final custom = this.custom;
    final mcpServer = this.mcpServer;
    return {
      if (a2aAgentCard != null) 'a2aAgentCard': a2aAgentCard,
      if (agentSkillsDefinition != null)
        'agentSkillsDefinition': agentSkillsDefinition,
      if (custom != null) 'custom': custom,
      if (mcpServer != null) 'mcpServer': mcpServer,
    };
  }
}

/// Descriptor that defines the content of an MCP (Model Context Protocol)
/// server registry record, including the server definition and its tool
/// definitions. The content is validated against the MCP protocol schema.
///
/// @nodoc
class McpServerDescriptor {
  /// Additional data associated with the MCP server descriptor, such as tool
  /// definitions.
  final McpServerAdditionalData? additionalData;

  /// The MCP server descriptor content, serialized as descriptor payload data.
  final String? data;

  /// The schema version of the descriptor payload.
  final String? dataSchemaVersion;

  /// The optional source configuration used to synchronize the MCP server
  /// descriptor content.
  final DescriptorSource? source;

  McpServerDescriptor({
    this.additionalData,
    this.data,
    this.dataSchemaVersion,
    this.source,
  });

  factory McpServerDescriptor.fromJson(Map<String, dynamic> json) {
    return McpServerDescriptor(
      additionalData: json['additionalData'] != null
          ? McpServerAdditionalData.fromJson(
              json['additionalData'] as Map<String, dynamic>)
          : null,
      data: json['data'] as String?,
      dataSchemaVersion: json['dataSchemaVersion'] as String?,
      source: json['source'] != null
          ? DescriptorSource.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalData = this.additionalData;
    final data = this.data;
    final dataSchemaVersion = this.dataSchemaVersion;
    final source = this.source;
    return {
      if (additionalData != null) 'additionalData': additionalData,
      if (data != null) 'data': data,
      if (dataSchemaVersion != null) 'dataSchemaVersion': dataSchemaVersion,
      if (source != null) 'source': source,
    };
  }
}

/// Descriptor that defines the content of an A2A (Agent-to-Agent) agent card
/// registry record. The content is validated against the A2A protocol schema.
///
/// @nodoc
class A2aAgentCardDescriptor {
  /// The A2A agent card content, serialized as descriptor payload data.
  final String? data;

  /// The schema version of the descriptor payload.
  final String? dataSchemaVersion;

  /// The optional source configuration used to synchronize the A2A agent card
  /// descriptor content.
  final DescriptorSource? source;

  A2aAgentCardDescriptor({
    this.data,
    this.dataSchemaVersion,
    this.source,
  });

  factory A2aAgentCardDescriptor.fromJson(Map<String, dynamic> json) {
    return A2aAgentCardDescriptor(
      data: json['data'] as String?,
      dataSchemaVersion: json['dataSchemaVersion'] as String?,
      source: json['source'] != null
          ? DescriptorSource.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final dataSchemaVersion = this.dataSchemaVersion;
    final source = this.source;
    return {
      if (data != null) 'data': data,
      if (dataSchemaVersion != null) 'dataSchemaVersion': dataSchemaVersion,
      if (source != null) 'source': source,
    };
  }
}

/// Descriptor that defines an agent skills registry record and its associated
/// content.
///
/// @nodoc
class AgentSkillsDefinitionDescriptor {
  /// Additional data associated with the agent skills definition descriptor.
  final AgentSkillsAdditionalData? additionalData;

  /// The agent skills definition content, serialized as descriptor payload data.
  final String? data;

  /// The schema version of the descriptor payload.
  final String? dataSchemaVersion;

  AgentSkillsDefinitionDescriptor({
    this.additionalData,
    this.data,
    this.dataSchemaVersion,
  });

  factory AgentSkillsDefinitionDescriptor.fromJson(Map<String, dynamic> json) {
    return AgentSkillsDefinitionDescriptor(
      additionalData: json['additionalData'] != null
          ? AgentSkillsAdditionalData.fromJson(
              json['additionalData'] as Map<String, dynamic>)
          : null,
      data: json['data'] as String?,
      dataSchemaVersion: json['dataSchemaVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalData = this.additionalData;
    final data = this.data;
    final dataSchemaVersion = this.dataSchemaVersion;
    return {
      if (additionalData != null) 'additionalData': additionalData,
      if (data != null) 'data': data,
      if (dataSchemaVersion != null) 'dataSchemaVersion': dataSchemaVersion,
    };
  }
}

/// Custom descriptor for user-defined content
///
/// @nodoc
class CustomDescriptor {
  final String? data;

  CustomDescriptor({
    this.data,
  });

  factory CustomDescriptor.fromJson(Map<String, dynamic> json) {
    return CustomDescriptor(
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'data': data,
    };
  }
}

/// Additional data associated with an agent skills definition descriptor.
///
/// @nodoc
class AgentSkillsAdditionalData {
  /// The markdown skill content associated with an agent skills definition.
  final AgentSkillsMdDescriptor? skillMd;

  AgentSkillsAdditionalData({
    this.skillMd,
  });

  factory AgentSkillsAdditionalData.fromJson(Map<String, dynamic> json) {
    return AgentSkillsAdditionalData(
      skillMd: json['skillMd'] != null
          ? AgentSkillsMdDescriptor.fromJson(
              json['skillMd'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final skillMd = this.skillMd;
    return {
      if (skillMd != null) 'skillMd': skillMd,
    };
  }
}

/// Markdown-format descriptor containing an agent skills document.
///
/// @nodoc
class AgentSkillsMdDescriptor {
  /// The agent skills markdown content, serialized as descriptor payload data.
  final String? data;

  /// The schema version of the descriptor payload.
  final String? dataSchemaVersion;

  /// The optional source configuration used to synchronize the agent skills
  /// markdown content.
  final DescriptorSource? source;

  AgentSkillsMdDescriptor({
    this.data,
    this.dataSchemaVersion,
    this.source,
  });

  factory AgentSkillsMdDescriptor.fromJson(Map<String, dynamic> json) {
    return AgentSkillsMdDescriptor(
      data: json['data'] as String?,
      dataSchemaVersion: json['dataSchemaVersion'] as String?,
      source: json['source'] != null
          ? DescriptorSource.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final dataSchemaVersion = this.dataSchemaVersion;
    final source = this.source;
    return {
      if (data != null) 'data': data,
      if (dataSchemaVersion != null) 'dataSchemaVersion': dataSchemaVersion,
      if (source != null) 'source': source,
    };
  }
}

/// The source configuration that defines where descriptor content is retrieved
/// from.
///
/// @nodoc
class DescriptorSource {
  /// URL-based descriptor source, populated when descriptor content is
  /// synchronized from a URL.
  final DescriptorSourceFromUrl? fromUrl;

  DescriptorSource({
    this.fromUrl,
  });

  factory DescriptorSource.fromJson(Map<String, dynamic> json) {
    return DescriptorSource(
      fromUrl: json['fromUrl'] != null
          ? DescriptorSourceFromUrl.fromJson(
              json['fromUrl'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fromUrl = this.fromUrl;
    return {
      if (fromUrl != null) 'fromUrl': fromUrl,
    };
  }
}

/// URL-based descriptor source configuration, with credential provider
/// configurations for authenticated URL retrieval.
///
/// @nodoc
class DescriptorSourceFromUrl {
  /// The URL from which the descriptor content is retrieved.
  final String url;

  /// The credential providers used to authenticate when fetching descriptor
  /// content from the source URL.
  final List<RegistryRecordCredentialProviderConfiguration>?
      credentialProviderConfigurations;

  DescriptorSourceFromUrl({
    required this.url,
    this.credentialProviderConfigurations,
  });

  factory DescriptorSourceFromUrl.fromJson(Map<String, dynamic> json) {
    return DescriptorSourceFromUrl(
      url: (json['url'] as String?) ?? '',
      credentialProviderConfigurations:
          (json['credentialProviderConfigurations'] as List?)
              ?.nonNulls
              .map((e) =>
                  RegistryRecordCredentialProviderConfiguration.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    final credentialProviderConfigurations =
        this.credentialProviderConfigurations;
    return {
      'url': url,
      if (credentialProviderConfigurations != null)
        'credentialProviderConfigurations': credentialProviderConfigurations,
    };
  }
}

/// A credential provider configuration that specifies how to authenticate when
/// fetching descriptor content from a registry record's source URL.
///
/// @nodoc
class RegistryRecordCredentialProviderConfiguration {
  /// The credential provider details corresponding to the specified credential
  /// provider type.
  final RegistryRecordCredentialProviderUnion credentialProvider;

  /// The type of credential provider.
  final RegistryRecordCredentialProviderType credentialProviderType;

  RegistryRecordCredentialProviderConfiguration({
    required this.credentialProvider,
    required this.credentialProviderType,
  });

  factory RegistryRecordCredentialProviderConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RegistryRecordCredentialProviderConfiguration(
      credentialProvider: RegistryRecordCredentialProviderUnion.fromJson(
          (json['credentialProvider'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      credentialProviderType: RegistryRecordCredentialProviderType.fromString(
          (json['credentialProviderType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final credentialProvider = this.credentialProvider;
    final credentialProviderType = this.credentialProviderType;
    return {
      'credentialProvider': credentialProvider,
      'credentialProviderType': credentialProviderType.value,
    };
  }
}

/// @nodoc
class RegistryRecordCredentialProviderType {
  static const oauth = RegistryRecordCredentialProviderType._('OAUTH');
  static const iam = RegistryRecordCredentialProviderType._('IAM');

  final String value;

  const RegistryRecordCredentialProviderType._(this.value);

  static const values = [oauth, iam];

  static RegistryRecordCredentialProviderType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistryRecordCredentialProviderType._(value));

  @override
  bool operator ==(other) =>
      other is RegistryRecordCredentialProviderType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The credential provider details for a registry record. Exactly one member is
/// populated, matching the configured credential provider type.
///
/// @nodoc
class RegistryRecordCredentialProviderUnion {
  /// The IAM role credential provider details.
  final RegistryRecordIamCredentialProvider? iamCredentialProvider;

  /// The OAuth 2.0 credential provider details.
  final RegistryRecordOAuthCredentialProvider? oauthCredentialProvider;

  RegistryRecordCredentialProviderUnion({
    this.iamCredentialProvider,
    this.oauthCredentialProvider,
  });

  factory RegistryRecordCredentialProviderUnion.fromJson(
      Map<String, dynamic> json) {
    return RegistryRecordCredentialProviderUnion(
      iamCredentialProvider: json['iamCredentialProvider'] != null
          ? RegistryRecordIamCredentialProvider.fromJson(
              json['iamCredentialProvider'] as Map<String, dynamic>)
          : null,
      oauthCredentialProvider: json['oauthCredentialProvider'] != null
          ? RegistryRecordOAuthCredentialProvider.fromJson(
              json['oauthCredentialProvider'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iamCredentialProvider = this.iamCredentialProvider;
    final oauthCredentialProvider = this.oauthCredentialProvider;
    return {
      if (iamCredentialProvider != null)
        'iamCredentialProvider': iamCredentialProvider,
      if (oauthCredentialProvider != null)
        'oauthCredentialProvider': oauthCredentialProvider,
    };
  }
}

/// The configuration for an OAuth 2.0 credential provider that authenticates
/// requests to a registry record's source.
///
/// @nodoc
class RegistryRecordOAuthCredentialProvider {
  /// The &amp;ARN; of the OAuth 2.0 credential provider resource in Amazon
  /// Bedrock AgentCore Identity.
  final String providerArn;

  /// Additional parameters to include in the OAuth 2.0 token request.
  final Map<String, String>? customParameters;

  /// The OAuth 2.0 grant type used to obtain access tokens.
  final RegistryRecordOAuthGrantType? grantType;

  /// The OAuth 2.0 scopes to request when obtaining access tokens.
  final List<String>? scopes;

  RegistryRecordOAuthCredentialProvider({
    required this.providerArn,
    this.customParameters,
    this.grantType,
    this.scopes,
  });

  factory RegistryRecordOAuthCredentialProvider.fromJson(
      Map<String, dynamic> json) {
    return RegistryRecordOAuthCredentialProvider(
      providerArn: (json['providerArn'] as String?) ?? '',
      customParameters: (json['customParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      grantType: (json['grantType'] as String?)
          ?.let(RegistryRecordOAuthGrantType.fromString),
      scopes:
          (json['scopes'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final providerArn = this.providerArn;
    final customParameters = this.customParameters;
    final grantType = this.grantType;
    final scopes = this.scopes;
    return {
      'providerArn': providerArn,
      if (customParameters != null) 'customParameters': customParameters,
      if (grantType != null) 'grantType': grantType.value,
      if (scopes != null) 'scopes': scopes,
    };
  }
}

/// The configuration for an IAM role credential provider that signs requests to
/// a registry record's source with AWS Signature Version 4 (SigV4).
///
/// @nodoc
class RegistryRecordIamCredentialProvider {
  /// The AWS Region to use for request signing. If not specified, the Region is
  /// derived from the source URL hostname, falling back to the Region of the
  /// registry.
  final String? region;

  /// The &amp;ARN; of the IAM role to assume for request signing.
  final String? roleArn;

  /// The service name to use for request signing, such as execute-api.
  final String? service;

  RegistryRecordIamCredentialProvider({
    this.region,
    this.roleArn,
    this.service,
  });

  factory RegistryRecordIamCredentialProvider.fromJson(
      Map<String, dynamic> json) {
    return RegistryRecordIamCredentialProvider(
      region: json['region'] as String?,
      roleArn: json['roleArn'] as String?,
      service: json['service'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    final roleArn = this.roleArn;
    final service = this.service;
    return {
      if (region != null) 'region': region,
      if (roleArn != null) 'roleArn': roleArn,
      if (service != null) 'service': service,
    };
  }
}

/// @nodoc
class RegistryRecordOAuthGrantType {
  static const clientCredentials =
      RegistryRecordOAuthGrantType._('CLIENT_CREDENTIALS');

  final String value;

  const RegistryRecordOAuthGrantType._(this.value);

  static const values = [clientCredentials];

  static RegistryRecordOAuthGrantType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistryRecordOAuthGrantType._(value));

  @override
  bool operator ==(other) =>
      other is RegistryRecordOAuthGrantType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Additional data for an MCP server descriptor
///
/// @nodoc
class McpServerAdditionalData {
  final McpToolsDescriptor? tools;

  McpServerAdditionalData({
    this.tools,
  });

  factory McpServerAdditionalData.fromJson(Map<String, dynamic> json) {
    return McpServerAdditionalData(
      tools: json['tools'] != null
          ? McpToolsDescriptor.fromJson(json['tools'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tools = this.tools;
    return {
      if (tools != null) 'tools': tools,
    };
  }
}

/// MCP tools descriptor containing tool definitions
///
/// @nodoc
class McpToolsDescriptor {
  final String? data;
  final String? dataSchemaVersion;

  McpToolsDescriptor({
    this.data,
    this.dataSchemaVersion,
  });

  factory McpToolsDescriptor.fromJson(Map<String, dynamic> json) {
    return McpToolsDescriptor(
      data: json['data'] as String?,
      dataSchemaVersion: json['dataSchemaVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final dataSchemaVersion = this.dataSchemaVersion;
    return {
      if (data != null) 'data': data,
      if (dataSchemaVersion != null) 'dataSchemaVersion': dataSchemaVersion,
    };
  }
}

/// Leaf patch wrapper for a registry record's display name. Omit to leave
/// unchanged; supply an empty object to unset; supply optionalValue to set.
///
/// @nodoc
class UpdatedDisplayName {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final String? optionalValue;

  UpdatedDisplayName({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The top-level descriptors patch wrapper used in UpdateRegistryRecord. Omit
/// to leave the current descriptors unchanged; supply an empty object to clear
/// them; supply optionalValue to apply a per-field patch.
///
/// @nodoc
class UpdatedDescriptors {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final UpdatedDescriptorsFields? optionalValue;

  UpdatedDescriptors({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The patchable descriptor fields applied during an UpdateRegistryRecord call.
/// Each field is independently patchable.
///
/// @nodoc
class UpdatedDescriptorsFields {
  /// The patch for the A2A agent card descriptor.
  final UpdatedA2aAgentCardDescriptor? a2aAgentCard;

  /// The patch for the agent skills definition descriptor.
  final UpdatedAgentSkillsDefinitionDescriptor? agentSkillsDefinition;

  /// The patch for the custom descriptor.
  final UpdatedCustomDescriptor? custom;

  /// The patch for the MCP server descriptor.
  final UpdatedMcpServerDescriptor? mcpServer;

  UpdatedDescriptorsFields({
    this.a2aAgentCard,
    this.agentSkillsDefinition,
    this.custom,
    this.mcpServer,
  });

  Map<String, dynamic> toJson() {
    final a2aAgentCard = this.a2aAgentCard;
    final agentSkillsDefinition = this.agentSkillsDefinition;
    final custom = this.custom;
    final mcpServer = this.mcpServer;
    return {
      if (a2aAgentCard != null) 'a2aAgentCard': a2aAgentCard,
      if (agentSkillsDefinition != null)
        'agentSkillsDefinition': agentSkillsDefinition,
      if (custom != null) 'custom': custom,
      if (mcpServer != null) 'mcpServer': mcpServer,
    };
  }
}

/// The MCP server descriptor patch wrapper. Omit to leave the descriptor
/// unchanged; supply an empty object to remove it; supply optionalValue to
/// patch its fields.
///
/// @nodoc
class UpdatedMcpServerDescriptor {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final UpdatedMcpServerDescriptorFields? optionalValue;

  UpdatedMcpServerDescriptor({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The A2A agent card descriptor patch wrapper. Omit to leave the descriptor
/// unchanged; supply an empty object to remove it; supply optionalValue to
/// patch its fields.
///
/// @nodoc
class UpdatedA2aAgentCardDescriptor {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final UpdatedA2aAgentCardDescriptorFields? optionalValue;

  UpdatedA2aAgentCardDescriptor({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The agent skills definition descriptor patch wrapper. Omit to leave the
/// descriptor unchanged; supply an empty object to remove it; supply
/// optionalValue to patch its fields.
///
/// @nodoc
class UpdatedAgentSkillsDefinitionDescriptor {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final UpdatedAgentSkillsDefinitionDescriptorFields? optionalValue;

  UpdatedAgentSkillsDefinitionDescriptor({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The custom descriptor patch wrapper. Omit to leave the descriptor unchanged;
/// supply an empty object to remove it; supply optionalValue to patch its
/// fields.
///
/// @nodoc
class UpdatedCustomDescriptor {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final UpdatedCustomDescriptorFields? optionalValue;

  UpdatedCustomDescriptor({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The set of custom descriptor fields that can be individually updated.
///
/// @nodoc
class UpdatedCustomDescriptorFields {
  /// The patch for the descriptor's data field.
  final UpdatedDescriptorData? data;

  UpdatedCustomDescriptorFields({
    this.data,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'data': data,
    };
  }
}

/// Leaf patch wrapper for descriptor data. Omit to leave unchanged; supply an
/// empty object to unset; supply optionalValue to set.
///
/// @nodoc
class UpdatedDescriptorData {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final String? optionalValue;

  UpdatedDescriptorData({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The set of agent skills definition descriptor fields that can be
/// individually updated.
///
/// @nodoc
class UpdatedAgentSkillsDefinitionDescriptorFields {
  /// The patch for the descriptor's additional data field.
  final UpdatedAgentSkillsAdditionalData? additionalData;

  /// The patch for the descriptor's data field.
  final UpdatedDescriptorData? data;

  /// The patch for the descriptor's data schema version field.
  final UpdatedDataSchemaVersion? dataSchemaVersion;

  UpdatedAgentSkillsDefinitionDescriptorFields({
    this.additionalData,
    this.data,
    this.dataSchemaVersion,
  });

  Map<String, dynamic> toJson() {
    final additionalData = this.additionalData;
    final data = this.data;
    final dataSchemaVersion = this.dataSchemaVersion;
    return {
      if (additionalData != null) 'additionalData': additionalData,
      if (data != null) 'data': data,
      if (dataSchemaVersion != null) 'dataSchemaVersion': dataSchemaVersion,
    };
  }
}

/// Leaf patch wrapper for a descriptor's data schema version. Omit to leave
/// unchanged; supply an empty object to unset; supply optionalValue to set.
///
/// @nodoc
class UpdatedDataSchemaVersion {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final String? optionalValue;

  UpdatedDataSchemaVersion({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The agent skills additional-data patch wrapper. Omit to leave the additional
/// data unchanged; supply an empty object to remove it; supply optionalValue to
/// patch its fields.
///
/// @nodoc
class UpdatedAgentSkillsAdditionalData {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final UpdatedAgentSkillsAdditionalDataFields? optionalValue;

  UpdatedAgentSkillsAdditionalData({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The set of agent skills additional-data fields that can be individually
/// updated.
///
/// @nodoc
class UpdatedAgentSkillsAdditionalDataFields {
  /// The patch for the agent skills markdown descriptor field.
  final UpdatedAgentSkillsMdDescriptor? skillMd;

  UpdatedAgentSkillsAdditionalDataFields({
    this.skillMd,
  });

  Map<String, dynamic> toJson() {
    final skillMd = this.skillMd;
    return {
      if (skillMd != null) 'skillMd': skillMd,
    };
  }
}

/// The agent skills markdown descriptor patch wrapper. Omit to leave the
/// descriptor unchanged; supply an empty object to remove it; supply
/// optionalValue to patch its fields.
///
/// @nodoc
class UpdatedAgentSkillsMdDescriptor {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final UpdatedAgentSkillsMdDescriptorFields? optionalValue;

  UpdatedAgentSkillsMdDescriptor({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The set of agent skills markdown descriptor fields that can be individually
/// updated.
///
/// @nodoc
class UpdatedAgentSkillsMdDescriptorFields {
  /// The patch for the descriptor's data field.
  final UpdatedDescriptorData? data;

  /// The patch for the descriptor's data schema version field.
  final UpdatedDataSchemaVersion? dataSchemaVersion;

  /// The patch for the descriptor's source field.
  final UpdatedDescriptorSource? source;

  UpdatedAgentSkillsMdDescriptorFields({
    this.data,
    this.dataSchemaVersion,
    this.source,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final dataSchemaVersion = this.dataSchemaVersion;
    final source = this.source;
    return {
      if (data != null) 'data': data,
      if (dataSchemaVersion != null) 'dataSchemaVersion': dataSchemaVersion,
      if (source != null) 'source': source,
    };
  }
}

/// Leaf patch wrapper for a descriptor's source configuration. Omit to leave
/// unchanged; supply an empty object to unset; supply optionalValue to set.
///
/// @nodoc
class UpdatedDescriptorSource {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final DescriptorSource? optionalValue;

  UpdatedDescriptorSource({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The set of A2A agent card descriptor fields that can be individually
/// updated.
///
/// @nodoc
class UpdatedA2aAgentCardDescriptorFields {
  /// The patch for the descriptor's data field.
  final UpdatedDescriptorData? data;

  /// The patch for the descriptor's data schema version field.
  final UpdatedDataSchemaVersion? dataSchemaVersion;

  /// The patch for the descriptor's source field.
  final UpdatedDescriptorSource? source;

  UpdatedA2aAgentCardDescriptorFields({
    this.data,
    this.dataSchemaVersion,
    this.source,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final dataSchemaVersion = this.dataSchemaVersion;
    final source = this.source;
    return {
      if (data != null) 'data': data,
      if (dataSchemaVersion != null) 'dataSchemaVersion': dataSchemaVersion,
      if (source != null) 'source': source,
    };
  }
}

/// The set of MCP server descriptor fields that can be individually updated.
///
/// @nodoc
class UpdatedMcpServerDescriptorFields {
  /// The patch for the descriptor's additional data field.
  final UpdatedMcpServerAdditionalData? additionalData;

  /// The patch for the descriptor's data field.
  final UpdatedDescriptorData? data;

  /// The patch for the descriptor's data schema version field.
  final UpdatedDataSchemaVersion? dataSchemaVersion;

  /// The patch for the descriptor's source field.
  final UpdatedDescriptorSource? source;

  UpdatedMcpServerDescriptorFields({
    this.additionalData,
    this.data,
    this.dataSchemaVersion,
    this.source,
  });

  Map<String, dynamic> toJson() {
    final additionalData = this.additionalData;
    final data = this.data;
    final dataSchemaVersion = this.dataSchemaVersion;
    final source = this.source;
    return {
      if (additionalData != null) 'additionalData': additionalData,
      if (data != null) 'data': data,
      if (dataSchemaVersion != null) 'dataSchemaVersion': dataSchemaVersion,
      if (source != null) 'source': source,
    };
  }
}

/// The MCP server additional-data patch wrapper. Omit to leave the additional
/// data unchanged; supply an empty object to remove it; supply optionalValue to
/// patch its fields.
///
/// @nodoc
class UpdatedMcpServerAdditionalData {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final UpdatedMcpServerAdditionalDataFields? optionalValue;

  UpdatedMcpServerAdditionalData({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The set of MCP server additional-data fields that can be individually
/// updated.
///
/// @nodoc
class UpdatedMcpServerAdditionalDataFields {
  /// The patch for the MCP tools descriptor field.
  final UpdatedMcpToolsDescriptor? tools;

  UpdatedMcpServerAdditionalDataFields({
    this.tools,
  });

  Map<String, dynamic> toJson() {
    final tools = this.tools;
    return {
      if (tools != null) 'tools': tools,
    };
  }
}

/// The MCP tools descriptor patch wrapper. Omit to leave the tools descriptor
/// unchanged; supply an empty object to remove it; supply optionalValue to
/// patch its fields.
///
/// @nodoc
class UpdatedMcpToolsDescriptor {
  /// The value to set for this field. Omit the wrapper to leave the field
  /// unchanged.
  final UpdatedMcpToolsDescriptorFields? optionalValue;

  UpdatedMcpToolsDescriptor({
    this.optionalValue,
  });

  Map<String, dynamic> toJson() {
    final optionalValue = this.optionalValue;
    return {
      if (optionalValue != null) 'optionalValue': optionalValue,
    };
  }
}

/// The set of MCP tools descriptor fields that can be individually updated.
///
/// @nodoc
class UpdatedMcpToolsDescriptorFields {
  /// The patch for the descriptor's data field.
  final UpdatedDescriptorData? data;

  /// The patch for the descriptor's data schema version field.
  final UpdatedDataSchemaVersion? dataSchemaVersion;

  UpdatedMcpToolsDescriptorFields({
    this.data,
    this.dataSchemaVersion,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final dataSchemaVersion = this.dataSchemaVersion;
    return {
      if (data != null) 'data': data,
      if (dataSchemaVersion != null) 'dataSchemaVersion': dataSchemaVersion,
    };
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
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
