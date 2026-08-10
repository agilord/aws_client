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

/// Agent Registry lets callers discover, list, and retrieve approved records
/// published to a registry.
class AgentRegistry {
  final _s.RestJsonProtocol _protocol;
  factory AgentRegistry({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'agent-registry',
    );
    return AgentRegistry._(
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
  AgentRegistry._({
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

  /// Retrieves multiple discoverable registry records by ID from a single
  /// registry. Records that cannot be retrieved are reported individually in
  /// the <code>errors</code> list rather than failing the entire request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [entries] :
  /// The registry-scoped groups of record IDs to retrieve. Currently, you can
  /// specify exactly one entry.
  Future<BatchGetDiscoverableRegistryRecordResponse>
      batchGetDiscoverableRegistryRecord({
    required List<RegistryRecordsEntry> entries,
  }) async {
    final $payload = <String, dynamic>{
      'entries': entries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/discoverable-records-batch',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetDiscoverableRegistryRecordResponse.fromJson(response);
  }

  /// Lists the discoverable registry records in a registry. You can optionally
  /// filter and paginate the results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// The filters to apply to the discoverable registry record list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to return in a single page. Valid values are
  /// 1 through 100.
  ///
  /// Parameter [nextToken] :
  /// The pagination token returned by a previous request. Use this value to
  /// retrieve the next page of results.
  Future<ListDiscoverableRegistryRecordsResponse>
      listDiscoverableRegistryRecords({
    required String registryId,
    List<RegistryRecordFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/registries/${Uri.encodeComponent(registryId)}/discoverable-records-list',
      exceptionFnMap: _exceptionFns,
    );
    return ListDiscoverableRegistryRecordsResponse.fromJson(response);
  }

  /// Searches the discoverable registry records in a registry using a natural
  /// language query. Returns metadata for the matching records ordered by
  /// relevance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [registryIds] :
  /// The registry identifiers to search within. Currently, you must specify
  /// exactly one registry identifier. You can provide either the full Amazon
  /// Web Services Resource Name (ARN) or the registry ID.
  ///
  /// Parameter [searchQuery] :
  /// The natural language query to search for matching registry records.
  ///
  /// Parameter [filters] :
  /// An optional structured JSON metadata filter that narrows the search
  /// results. Supports the field-level operators <code>$eq</code>,
  /// <code>$ne</code>, and <code>$in</code>, and the logical operators
  /// <code>$and</code> and <code>$or</code> on filterable fields.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Valid values are 1 through 20.
  /// The default value is 10.
  Future<SearchDiscoverableRegistryRecordsResponse>
      searchDiscoverableRegistryRecords({
    required List<String> registryIds,
    required String searchQuery,
    Object? filters,
    int? maxResults,
  }) async {
    final $payload = <String, dynamic>{
      'registryIds': registryIds,
      'searchQuery': searchQuery,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/discoverable-records-search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchDiscoverableRegistryRecordsResponse.fromJson(response);
  }
}

/// @nodoc
class BatchGetDiscoverableRegistryRecordResponse {
  /// The per-record errors for records that could not be retrieved. This list is
  /// empty when all requested records were returned.
  final List<BatchGetDiscoverableRegistryRecordError> errors;

  /// The records that were successfully retrieved. Each record correlates to the
  /// request by its <code>recordId</code>.
  final List<RegistryRecordSummary> registryRecords;

  BatchGetDiscoverableRegistryRecordResponse({
    required this.errors,
    required this.registryRecords,
  });

  factory BatchGetDiscoverableRegistryRecordResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetDiscoverableRegistryRecordResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetDiscoverableRegistryRecordError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      registryRecords: ((json['registryRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => RegistryRecordSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final registryRecords = this.registryRecords;
    return {
      'errors': errors,
      'registryRecords': registryRecords,
    };
  }
}

/// @nodoc
class ListDiscoverableRegistryRecordsResponse {
  /// The page of discoverable registry record summaries.
  final List<DiscoverableRegistryRecordSummary> registryRecords;

  /// The pagination token to pass to a subsequent request to retrieve the next
  /// page of results. This field is absent when there are no more results.
  final String? nextToken;

  ListDiscoverableRegistryRecordsResponse({
    required this.registryRecords,
    this.nextToken,
  });

  factory ListDiscoverableRegistryRecordsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDiscoverableRegistryRecordsResponse(
      registryRecords: ((json['registryRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => DiscoverableRegistryRecordSummary.fromJson(
              e as Map<String, dynamic>))
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

/// @nodoc
class SearchDiscoverableRegistryRecordsResponse {
  /// The registry records that match the search query, ordered by relevance.
  final List<RegistryRecordSummary> registryRecords;

  SearchDiscoverableRegistryRecordsResponse({
    required this.registryRecords,
  });

  factory SearchDiscoverableRegistryRecordsResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchDiscoverableRegistryRecordsResponse(
      registryRecords: ((json['registryRecords'] as List?) ?? const [])
          .nonNulls
          .map((e) => RegistryRecordSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final registryRecords = this.registryRecords;
    return {
      'registryRecords': registryRecords,
    };
  }
}

/// Summary information about a registry record, including its descriptors.
///
/// @nodoc
class RegistryRecordSummary {
  final DateTime createdAt;

  /// The protocol-specific descriptors that describe how to connect to and use
  /// the record.
  final Descriptors descriptors;
  final String name;
  final String recordArn;
  final String recordId;
  final RecordType recordType;
  final String recordVersion;
  final String registryArn;
  final RegistryRecordStatus status;
  final DateTime updatedAt;
  final String? description;
  final String? displayName;

  RegistryRecordSummary({
    required this.createdAt,
    required this.descriptors,
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
      descriptors: Descriptors.fromJson(
          (json['descriptors'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
    final descriptors = this.descriptors;
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
      'descriptors': descriptors,
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

/// The protocol-specific descriptors that describe how to connect to and use
/// the registry record.
///
/// @nodoc
class Descriptors {
  final A2aAgentCardDescriptor? a2aAgentCard;
  final AgentSkillsDefinitionDescriptor? agentSkillsDefinition;
  final CustomDescriptor? custom;
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

/// Base mixin for MCP server descriptor content
///
/// @nodoc
class McpServerDescriptor {
  final McpServerAdditionalData? additionalData;
  final String? data;
  final String? dataSchemaVersion;

  /// The source location from which the MCP (Model Context Protocol) server
  /// descriptor content was retrieved.
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

/// Base mixin for A2A agent card descriptor content
///
/// @nodoc
class A2aAgentCardDescriptor {
  final String? data;
  final String? dataSchemaVersion;

  /// The source location from which the A2A (Agent-to-Agent) agent card
  /// descriptor content was retrieved.
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

/// Base mixin for agent skills definition descriptor content
///
/// @nodoc
class AgentSkillsDefinitionDescriptor {
  /// Additional data for the agent skills definition, such as the skills markdown
  /// descriptor.
  final AgentSkillsAdditionalData? additionalData;
  final String? data;
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

/// Additional data for an agent skills definition descriptor.
///
/// @nodoc
class AgentSkillsAdditionalData {
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

/// Base mixin for agent skills markdown descriptor content
///
/// @nodoc
class AgentSkillsMdDescriptor {
  final String? data;
  final String? dataSchemaVersion;

  /// The source location from which the agent skills markdown content was
  /// retrieved.
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

/// The source location from which a descriptor's content was retrieved.
///
/// @nodoc
class DescriptorSource {
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

/// Base mixin for descriptor source from URL
///
/// @nodoc
class DescriptorSourceFromUrl {
  final String url;

  DescriptorSourceFromUrl({
    required this.url,
  });

  factory DescriptorSourceFromUrl.fromJson(Map<String, dynamic> json) {
    return DescriptorSourceFromUrl(
      url: (json['url'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    return {
      'url': url,
    };
  }
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

/// Summary information about a discoverable registry record returned by <code>
/// ListDiscoverableRegistryRecords</code>. This summary does not include
/// descriptors.
///
/// @nodoc
class DiscoverableRegistryRecordSummary {
  final DateTime createdAt;
  final String name;
  final String recordArn;
  final String recordId;
  final RecordType recordType;
  final String recordVersion;
  final String registryArn;
  final RegistryRecordStatus status;
  final DateTime updatedAt;
  final String? description;
  final String? displayName;

  DiscoverableRegistryRecordSummary({
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

  factory DiscoverableRegistryRecordSummary.fromJson(
      Map<String, dynamic> json) {
    return DiscoverableRegistryRecordSummary(
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

/// A single filter applied to a <code>ListDiscoverableRegistryRecords</code>
/// request.
///
/// @nodoc
class RegistryRecordFilter {
  /// The attribute to filter on.
  final RegistryRecordFilterName name;

  /// The values to match for the attribute.
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

/// The attribute to filter registry records on.
///
/// @nodoc
class RegistryRecordFilterName {
  static const recordType = RegistryRecordFilterName._('recordType');
  static const descriptorType = RegistryRecordFilterName._('descriptorType');

  final String value;

  const RegistryRecordFilterName._(this.value);

  static const values = [recordType, descriptorType];

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

/// Describes why a requested record could not be retrieved.
///
/// @nodoc
class BatchGetDiscoverableRegistryRecordError {
  /// The machine-readable reason that the record could not be retrieved.
  final BatchGetDiscoverableRegistryRecordErrorCode errorCode;
  final String recordId;
  final String registryId;

  /// An optional human-readable detail about the error. Do not parse this value
  /// programmatically.
  final String? message;

  BatchGetDiscoverableRegistryRecordError({
    required this.errorCode,
    required this.recordId,
    required this.registryId,
    this.message,
  });

  factory BatchGetDiscoverableRegistryRecordError.fromJson(
      Map<String, dynamic> json) {
    return BatchGetDiscoverableRegistryRecordError(
      errorCode: BatchGetDiscoverableRegistryRecordErrorCode.fromString(
          (json['errorCode'] as String?) ?? ''),
      recordId: (json['recordId'] as String?) ?? '',
      registryId: (json['registryId'] as String?) ?? '',
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final recordId = this.recordId;
    final registryId = this.registryId;
    final message = this.message;
    return {
      'errorCode': errorCode.value,
      'recordId': recordId,
      'registryId': registryId,
      if (message != null) 'message': message,
    };
  }
}

/// @nodoc
class BatchGetDiscoverableRegistryRecordErrorCode {
  static const resourceNotFound =
      BatchGetDiscoverableRegistryRecordErrorCode._('RESOURCE_NOT_FOUND');
  static const accessDenied =
      BatchGetDiscoverableRegistryRecordErrorCode._('ACCESS_DENIED');
  static const internalError =
      BatchGetDiscoverableRegistryRecordErrorCode._('INTERNAL_ERROR');

  final String value;

  const BatchGetDiscoverableRegistryRecordErrorCode._(this.value);

  static const values = [resourceNotFound, accessDenied, internalError];

  static BatchGetDiscoverableRegistryRecordErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BatchGetDiscoverableRegistryRecordErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BatchGetDiscoverableRegistryRecordErrorCode &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Binds one registry to the record IDs requested from it.
///
/// @nodoc
class RegistryRecordsEntry {
  /// The record IDs to retrieve from the registry. You can specify 1 through 100
  /// record IDs.
  final List<String> recordIds;
  final String registryId;

  RegistryRecordsEntry({
    required this.recordIds,
    required this.registryId,
  });

  Map<String, dynamic> toJson() {
    final recordIds = this.recordIds;
    final registryId = this.registryId;
    return {
      'recordIds': recordIds,
      'registryId': registryId,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
