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
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'schemas-2019-12-02.g.dart';

/// AWS EventBridge Schemas
class Schemas {
  final _s.RestJsonProtocol _protocol;
  Schemas({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'schemas',
            signingName: 'schemas',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a discoverer.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceArn] :
  /// The ARN of the event bus.
  ///
  /// Parameter [description] :
  /// A description for the discoverer.
  ///
  /// Parameter [tags] :
  /// Tags associated with the resource.
  Future<CreateDiscovererResponse> createDiscoverer({
    @_s.required String sourceArn,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(sourceArn, 'sourceArn');
    _s.validateStringLength(
      'sourceArn',
      sourceArn,
      20,
      1600,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      'SourceArn': sourceArn,
      if (description != null) 'Description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/discoverers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDiscovererResponse.fromJson(response);
  }

  /// Creates a registry.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [UnauthorizedException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictException].
  ///
  /// Parameter [description] :
  /// A description of the registry to be created.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the registry.
  Future<CreateRegistryResponse> createRegistry({
    @_s.required String registryName,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRegistryResponse.fromJson(response);
  }

  /// Creates a schema definition.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [description] :
  /// A description of the schema.
  ///
  /// Parameter [tags] :
  /// Tags associated with the schema.
  Future<CreateSchemaResponse> createSchema({
    @_s.required String content,
    @_s.required String registryName,
    @_s.required String schemaName,
    @_s.required Type type,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    _s.validateStringLength(
      'content',
      content,
      1,
      100000,
      isRequired: true,
    );
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      'Content': content,
      'Type': type?.toValue() ?? '',
      if (description != null) 'Description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas/name/${Uri.encodeComponent(schemaName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSchemaResponse.fromJson(response);
  }

  /// Deletes a discoverer.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  Future<void> deleteDiscoverer({
    @_s.required String discovererId,
  }) async {
    ArgumentError.checkNotNull(discovererId, 'discovererId');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/discoverers/id/${Uri.encodeComponent(discovererId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Registry.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  Future<void> deleteRegistry({
    @_s.required String registryName,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a schema definition.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  Future<void> deleteSchema({
    @_s.required String registryName,
    @_s.required String schemaName,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas/name/${Uri.encodeComponent(schemaName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete the schema version definition
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  Future<void> deleteSchemaVersion({
    @_s.required String registryName,
    @_s.required String schemaName,
    @_s.required String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    ArgumentError.checkNotNull(schemaVersion, 'schemaVersion');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas/name/${Uri.encodeComponent(schemaName.toString())}/version/${Uri.encodeComponent(schemaVersion.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describe the code binding URI.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  Future<DescribeCodeBindingResponse> describeCodeBinding({
    @_s.required String language,
    @_s.required String registryName,
    @_s.required String schemaName,
    String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(language, 'language');
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    var _query = '';
    _query = '?${[
      if (schemaVersion != null)
        _s.toQueryParam('schemaVersion', schemaVersion),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas/name/${Uri.encodeComponent(schemaName.toString())}/language/${Uri.encodeComponent(language.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCodeBindingResponse.fromJson(response);
  }

  /// Describes the discoverer.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  Future<DescribeDiscovererResponse> describeDiscoverer({
    @_s.required String discovererId,
  }) async {
    ArgumentError.checkNotNull(discovererId, 'discovererId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/discoverers/id/${Uri.encodeComponent(discovererId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDiscovererResponse.fromJson(response);
  }

  /// Describes the registry.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  Future<DescribeRegistryResponse> describeRegistry({
    @_s.required String registryName,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRegistryResponse.fromJson(response);
  }

  /// Retrieve the schema definition.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  Future<DescribeSchemaResponse> describeSchema({
    @_s.required String registryName,
    @_s.required String schemaName,
    String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    var _query = '';
    _query = '?${[
      if (schemaVersion != null)
        _s.toQueryParam('schemaVersion', schemaVersion),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas/name/${Uri.encodeComponent(schemaName.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSchemaResponse.fromJson(response);
  }

  /// Get the code binding source URI.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  Future<GetCodeBindingSourceResponse> getCodeBindingSource({
    @_s.required String language,
    @_s.required String registryName,
    @_s.required String schemaName,
    String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(language, 'language');
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    var _query = '';
    _query = '?${[
      if (schemaVersion != null)
        _s.toQueryParam('schemaVersion', schemaVersion),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas/name/${Uri.encodeComponent(schemaName.toString())}/language/${Uri.encodeComponent(language.toString())}/source$_query',
      exceptionFnMap: _exceptionFns,
    );
    return GetCodeBindingSourceResponse(
      body: await response.stream.toBytes(),
    );
  }

  /// Get the discovered schema that was generated based on sampled events.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [events] :
  /// An array of strings that
  ///
  /// Parameter [type] :
  /// The type of event.
  Future<GetDiscoveredSchemaResponse> getDiscoveredSchema({
    @_s.required List<String> events,
    @_s.required Type type,
  }) async {
    ArgumentError.checkNotNull(events, 'events');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'Events': events,
      'Type': type?.toValue() ?? '',
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/discover',
      exceptionFnMap: _exceptionFns,
    );
    return GetDiscoveredSchemaResponse.fromJson(response);
  }

  /// List the discoverers.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<ListDiscoverersResponse> listDiscoverers({
    String discovererIdPrefix,
    int limit,
    String nextToken,
    String sourceArnPrefix,
  }) async {
    var _query = '';
    _query = '?${[
      if (discovererIdPrefix != null)
        _s.toQueryParam('discovererIdPrefix', discovererIdPrefix),
      if (limit != null) _s.toQueryParam('limit', limit),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
      if (sourceArnPrefix != null)
        _s.toQueryParam('sourceArnPrefix', sourceArnPrefix),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/discoverers$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListDiscoverersResponse.fromJson(response);
  }

  /// List the registries.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<ListRegistriesResponse> listRegistries({
    int limit,
    String nextToken,
    String registryNamePrefix,
    String scope,
  }) async {
    var _query = '';
    _query = '?${[
      if (limit != null) _s.toQueryParam('limit', limit),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
      if (registryNamePrefix != null)
        _s.toQueryParam('registryNamePrefix', registryNamePrefix),
      if (scope != null) _s.toQueryParam('scope', scope),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/registries$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListRegistriesResponse.fromJson(response);
  }

  /// Provides a list of the schema versions and related information.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  Future<ListSchemaVersionsResponse> listSchemaVersions({
    @_s.required String registryName,
    @_s.required String schemaName,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    var _query = '';
    _query = '?${[
      if (limit != null) _s.toQueryParam('limit', limit),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas/name/${Uri.encodeComponent(schemaName.toString())}/versions$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListSchemaVersionsResponse.fromJson(response);
  }

  /// List the schemas.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<ListSchemasResponse> listSchemas({
    @_s.required String registryName,
    int limit,
    String nextToken,
    String schemaNamePrefix,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    var _query = '';
    _query = '?${[
      if (limit != null) _s.toQueryParam('limit', limit),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
      if (schemaNamePrefix != null)
        _s.toQueryParam('schemaNamePrefix', schemaNamePrefix),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListSchemasResponse.fromJson(response);
  }

  /// Get tags for resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<LockServiceLinkedRoleResponse> lockServiceLinkedRole({
    @_s.required String roleArn,
    @_s.required int timeout,
  }) async {
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(timeout, 'timeout');
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      29000,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'RoleArn': roleArn,
      'Timeout': timeout,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/slr-deletion/lock',
      exceptionFnMap: _exceptionFns,
    );
    return LockServiceLinkedRoleResponse.fromJson(response);
  }

  /// Put code binding URI
  ///
  /// May throw [GoneException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  Future<PutCodeBindingResponse> putCodeBinding({
    @_s.required String language,
    @_s.required String registryName,
    @_s.required String schemaName,
    String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(language, 'language');
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    var _query = '';
    _query = '?${[
      if (schemaVersion != null)
        _s.toQueryParam('schemaVersion', schemaVersion),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas/name/${Uri.encodeComponent(schemaName.toString())}/language/${Uri.encodeComponent(language.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return PutCodeBindingResponse.fromJson(response);
  }

  /// Search the schemas
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<SearchSchemasResponse> searchSchemas({
    @_s.required String keywords,
    @_s.required String registryName,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(keywords, 'keywords');
    ArgumentError.checkNotNull(registryName, 'registryName');
    var _query = '';
    _query = '?${[
      if (keywords != null) _s.toQueryParam('keywords', keywords),
      if (limit != null) _s.toQueryParam('limit', limit),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas/search$_query',
      exceptionFnMap: _exceptionFns,
    );
    return SearchSchemasResponse.fromJson(response);
  }

  /// Starts the discoverer
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  Future<StartDiscovererResponse> startDiscoverer({
    @_s.required String discovererId,
  }) async {
    ArgumentError.checkNotNull(discovererId, 'discovererId');
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/discoverers/id/${Uri.encodeComponent(discovererId.toString())}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartDiscovererResponse.fromJson(response);
  }

  /// Stops the discoverer
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  Future<StopDiscovererResponse> stopDiscoverer({
    @_s.required String discovererId,
  }) async {
    ArgumentError.checkNotNull(discovererId, 'discovererId');
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/discoverers/id/${Uri.encodeComponent(discovererId.toString())}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopDiscovererResponse.fromJson(response);
  }

  /// Add tags to a resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<void> unlockServiceLinkedRole({
    @_s.required String roleArn,
  }) async {
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1600,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'RoleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/slr-deletion/unlock',
      exceptionFnMap: _exceptionFns,
    );
    return UnlockServiceLinkedRoleResponse.fromJson(response);
  }

  /// Removes tags from a resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    var _query = '';
    _query = '?${[
      if (tagKeys != null) _s.toQueryParam('tagKeys', tagKeys),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the discoverer
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [description] :
  /// The description of the discoverer to update.
  Future<UpdateDiscovererResponse> updateDiscoverer({
    @_s.required String discovererId,
    String description,
  }) async {
    ArgumentError.checkNotNull(discovererId, 'discovererId');
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/discoverers/id/${Uri.encodeComponent(discovererId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDiscovererResponse.fromJson(response);
  }

  /// Updates a registry.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [description] :
  /// The description of the registry to update.
  Future<UpdateRegistryResponse> updateRegistry({
    @_s.required String registryName,
    String description,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRegistryResponse.fromJson(response);
  }

  /// Updates the schema definition
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [clientTokenId] :
  /// The ID of the client token.
  ///
  /// Parameter [content] :
  /// The source of the schema definition.
  ///
  /// Parameter [description] :
  /// The description of the schema.
  ///
  /// Parameter [type] :
  /// The schema type for the events schema.
  Future<UpdateSchemaResponse> updateSchema({
    @_s.required String registryName,
    @_s.required String schemaName,
    String clientTokenId,
    String content,
    String description,
    Type type,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    _s.validateStringLength(
      'clientTokenId',
      clientTokenId,
      0,
      36,
    );
    _s.validateStringLength(
      'content',
      content,
      1,
      100000,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      if (clientTokenId != null) 'ClientTokenId': clientTokenId,
      if (content != null) 'Content': content,
      if (description != null) 'Description': description,
      if (type != null) 'Type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName.toString())}/schemas/name/${Uri.encodeComponent(schemaName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSchemaResponse.fromJson(response);
  }
}

enum CodeGenerationStatus {
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_COMPLETE')
  createComplete,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDiscovererResponse {
  /// The description of the discoverer.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the discoverer.
  @_s.JsonKey(name: 'DiscovererArn')
  final String discovererArn;

  /// The ID of the discoverer.
  @_s.JsonKey(name: 'DiscovererId')
  final String discovererId;

  /// The ARN of the event bus.
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;

  /// The state of the discoverer.
  @_s.JsonKey(name: 'State')
  final DiscovererState state;

  /// Tags associated with the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateDiscovererResponse({
    this.description,
    this.discovererArn,
    this.discovererId,
    this.sourceArn,
    this.state,
    this.tags,
  });
  factory CreateDiscovererResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDiscovererResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRegistryResponse {
  /// The description of the registry.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the registry.
  @_s.JsonKey(name: 'RegistryArn')
  final String registryArn;

  /// The name of the registry.
  @_s.JsonKey(name: 'RegistryName')
  final String registryName;

  /// Tags associated with the registry.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateRegistryResponse({
    this.description,
    this.registryArn,
    this.registryName,
    this.tags,
  });
  factory CreateRegistryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRegistryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSchemaResponse {
  /// The description of the schema.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The date and time that schema was modified.
  @_s.JsonKey(
      name: 'LastModified', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime lastModified;

  /// The ARN of the schema.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  /// The name of the schema.
  @_s.JsonKey(name: 'SchemaName')
  final String schemaName;

  /// The version number of the schema
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The type of the schema.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The date the schema version was created.
  @_s.JsonKey(
      name: 'VersionCreatedDate',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime versionCreatedDate;

  CreateSchemaResponse({
    this.description,
    this.lastModified,
    this.schemaArn,
    this.schemaName,
    this.schemaVersion,
    this.tags,
    this.type,
    this.versionCreatedDate,
  });
  factory CreateSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCodeBindingResponse {
  /// The time and date that the code binding was created.
  @_s.JsonKey(
      name: 'CreationDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime creationDate;

  /// The date and time that code bindings were modified.
  @_s.JsonKey(
      name: 'LastModified', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime lastModified;

  /// The version number of the schema.
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  /// The current status of code binding generation.
  @_s.JsonKey(name: 'Status')
  final CodeGenerationStatus status;

  DescribeCodeBindingResponse({
    this.creationDate,
    this.lastModified,
    this.schemaVersion,
    this.status,
  });
  factory DescribeCodeBindingResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCodeBindingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDiscovererResponse {
  /// The description of the discoverer.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the discoverer.
  @_s.JsonKey(name: 'DiscovererArn')
  final String discovererArn;

  /// The ID of the discoverer.
  @_s.JsonKey(name: 'DiscovererId')
  final String discovererId;

  /// The ARN of the event bus.
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;

  /// The state of the discoverer.
  @_s.JsonKey(name: 'State')
  final DiscovererState state;

  /// Tags associated with the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribeDiscovererResponse({
    this.description,
    this.discovererArn,
    this.discovererId,
    this.sourceArn,
    this.state,
    this.tags,
  });
  factory DescribeDiscovererResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDiscovererResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRegistryResponse {
  /// The description of the registry.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the registry.
  @_s.JsonKey(name: 'RegistryArn')
  final String registryArn;

  /// The name of the registry.
  @_s.JsonKey(name: 'RegistryName')
  final String registryName;

  /// Tags associated with the registry.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribeRegistryResponse({
    this.description,
    this.registryArn,
    this.registryName,
    this.tags,
  });
  factory DescribeRegistryResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRegistryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSchemaResponse {
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The description of the schema.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The date and time that schema was modified.
  @_s.JsonKey(
      name: 'LastModified', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime lastModified;

  /// The ARN of the schema.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  /// The name of the schema.
  @_s.JsonKey(name: 'SchemaName')
  final String schemaName;

  /// The version number of the schema
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  /// Tags associated with the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The type of the schema.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The date the schema version was created.
  @_s.JsonKey(
      name: 'VersionCreatedDate',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime versionCreatedDate;

  DescribeSchemaResponse({
    this.content,
    this.description,
    this.lastModified,
    this.schemaArn,
    this.schemaName,
    this.schemaVersion,
    this.tags,
    this.type,
    this.versionCreatedDate,
  });
  factory DescribeSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSchemaResponseFromJson(json);
}

enum DiscovererState {
  @_s.JsonValue('STARTED')
  started,
  @_s.JsonValue('STOPPED')
  stopped,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DiscovererSummary {
  /// The ARN of the discoverer.
  @_s.JsonKey(name: 'DiscovererArn')
  final String discovererArn;

  /// The ID of the discoverer.
  @_s.JsonKey(name: 'DiscovererId')
  final String discovererId;

  /// The ARN of the event bus.
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;
  @_s.JsonKey(name: 'State')
  final DiscovererState state;

  /// Tags associated with the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DiscovererSummary({
    this.discovererArn,
    this.discovererId,
    this.sourceArn,
    this.state,
    this.tags,
  });
  factory DiscovererSummary.fromJson(Map<String, dynamic> json) =>
      _$DiscovererSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCodeBindingSourceResponse {
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Body')
  final Uint8List body;

  GetCodeBindingSourceResponse({
    this.body,
  });
  factory GetCodeBindingSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCodeBindingSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDiscoveredSchemaResponse {
  @_s.JsonKey(name: 'Content')
  final String content;

  GetDiscoveredSchemaResponse({
    this.content,
  });
  factory GetDiscoveredSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDiscoveredSchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDiscoverersResponse {
  /// An array of DiscovererSummary information.
  @_s.JsonKey(name: 'Discoverers')
  final List<DiscovererSummary> discoverers;

  /// The token that specifies the next page of results to return. To request the
  /// first page, leave NextToken empty. The token will expire in 24 hours, and
  /// cannot be shared with other accounts.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDiscoverersResponse({
    this.discoverers,
    this.nextToken,
  });
  factory ListDiscoverersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDiscoverersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRegistriesResponse {
  /// The token that specifies the next page of results to return. To request the
  /// first page, leave NextToken empty. The token will expire in 24 hours, and
  /// cannot be shared with other accounts.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of registry summaries.
  @_s.JsonKey(name: 'Registries')
  final List<RegistrySummary> registries;

  ListRegistriesResponse({
    this.nextToken,
    this.registries,
  });
  factory ListRegistriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRegistriesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSchemaVersionsResponse {
  /// The token that specifies the next page of results to return. To request the
  /// first page, leave NextToken empty. The token will expire in 24 hours, and
  /// cannot be shared with other accounts.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of schema version summaries.
  @_s.JsonKey(name: 'SchemaVersions')
  final List<SchemaVersionSummary> schemaVersions;

  ListSchemaVersionsResponse({
    this.nextToken,
    this.schemaVersions,
  });
  factory ListSchemaVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSchemaVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSchemasResponse {
  /// The token that specifies the next page of results to return. To request the
  /// first page, leave NextToken empty. The token will expire in 24 hours, and
  /// cannot be shared with other accounts.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of schema summaries.
  @_s.JsonKey(name: 'Schemas')
  final List<SchemaSummary> schemas;

  ListSchemasResponse({
    this.nextToken,
    this.schemas,
  });
  factory ListSchemasResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSchemasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    @_s.required this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LockServiceLinkedRoleResponse {
  @_s.JsonKey(name: 'CanBeDeleted')
  final bool canBeDeleted;
  @_s.JsonKey(name: 'ReasonOfFailure')
  final String reasonOfFailure;
  @_s.JsonKey(name: 'RelatedResources')
  final List<DiscovererSummary> relatedResources;

  LockServiceLinkedRoleResponse({
    this.canBeDeleted,
    this.reasonOfFailure,
    this.relatedResources,
  });
  factory LockServiceLinkedRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$LockServiceLinkedRoleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutCodeBindingResponse {
  /// The time and date that the code binding was created.
  @_s.JsonKey(
      name: 'CreationDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime creationDate;

  /// The date and time that code bindings were modified.
  @_s.JsonKey(
      name: 'LastModified', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime lastModified;

  /// The version number of the schema.
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  /// The current status of code binding generation.
  @_s.JsonKey(name: 'Status')
  final CodeGenerationStatus status;

  PutCodeBindingResponse({
    this.creationDate,
    this.lastModified,
    this.schemaVersion,
    this.status,
  });
  factory PutCodeBindingResponse.fromJson(Map<String, dynamic> json) =>
      _$PutCodeBindingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegistrySummary {
  /// The ARN of the registry.
  @_s.JsonKey(name: 'RegistryArn')
  final String registryArn;

  /// The name of the registry.
  @_s.JsonKey(name: 'RegistryName')
  final String registryName;

  /// Tags associated with the registry.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  RegistrySummary({
    this.registryArn,
    this.registryName,
    this.tags,
  });
  factory RegistrySummary.fromJson(Map<String, dynamic> json) =>
      _$RegistrySummaryFromJson(json);
}

/// A summary of schema details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SchemaSummary {
  /// The date and time that schema was modified.
  @_s.JsonKey(
      name: 'LastModified', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime lastModified;

  /// The ARN of the schema.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  /// The name of the schema.
  @_s.JsonKey(name: 'SchemaName')
  final String schemaName;

  /// Tags associated with the schema.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The number of versions available for the schema.
  @_s.JsonKey(name: 'VersionCount')
  final int versionCount;

  SchemaSummary({
    this.lastModified,
    this.schemaArn,
    this.schemaName,
    this.tags,
    this.versionCount,
  });
  factory SchemaSummary.fromJson(Map<String, dynamic> json) =>
      _$SchemaSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SchemaVersionSummary {
  /// The ARN of the schema version.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  /// The name of the schema.
  @_s.JsonKey(name: 'SchemaName')
  final String schemaName;

  /// The version number of the schema.
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  SchemaVersionSummary({
    this.schemaArn,
    this.schemaName,
    this.schemaVersion,
  });
  factory SchemaVersionSummary.fromJson(Map<String, dynamic> json) =>
      _$SchemaVersionSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchSchemaSummary {
  /// The name of the registry.
  @_s.JsonKey(name: 'RegistryName')
  final String registryName;

  /// The ARN of the schema.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  /// The name of the schema.
  @_s.JsonKey(name: 'SchemaName')
  final String schemaName;

  /// An array of schema version summaries.
  @_s.JsonKey(name: 'SchemaVersions')
  final List<SearchSchemaVersionSummary> schemaVersions;

  SearchSchemaSummary({
    this.registryName,
    this.schemaArn,
    this.schemaName,
    this.schemaVersions,
  });
  factory SearchSchemaSummary.fromJson(Map<String, dynamic> json) =>
      _$SearchSchemaSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchSchemaVersionSummary {
  @_s.JsonKey(
      name: 'CreatedDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime createdDate;

  /// The version number of the schema
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  SearchSchemaVersionSummary({
    this.createdDate,
    this.schemaVersion,
  });
  factory SearchSchemaVersionSummary.fromJson(Map<String, dynamic> json) =>
      _$SearchSchemaVersionSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchSchemasResponse {
  /// The token that specifies the next page of results to return. To request the
  /// first page, leave NextToken empty. The token will expire in 24 hours, and
  /// cannot be shared with other accounts.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of SearchSchemaSummary information.
  @_s.JsonKey(name: 'Schemas')
  final List<SearchSchemaSummary> schemas;

  SearchSchemasResponse({
    this.nextToken,
    this.schemas,
  });
  factory SearchSchemasResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchSchemasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartDiscovererResponse {
  /// The ID of the discoverer.
  @_s.JsonKey(name: 'DiscovererId')
  final String discovererId;

  /// The state of the discoverer.
  @_s.JsonKey(name: 'State')
  final DiscovererState state;

  StartDiscovererResponse({
    this.discovererId,
    this.state,
  });
  factory StartDiscovererResponse.fromJson(Map<String, dynamic> json) =>
      _$StartDiscovererResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopDiscovererResponse {
  /// The ID of the discoverer.
  @_s.JsonKey(name: 'DiscovererId')
  final String discovererId;

  /// The state of the discoverer.
  @_s.JsonKey(name: 'State')
  final DiscovererState state;

  StopDiscovererResponse({
    this.discovererId,
    this.state,
  });
  factory StopDiscovererResponse.fromJson(Map<String, dynamic> json) =>
      _$StopDiscovererResponseFromJson(json);
}

enum Type {
  @_s.JsonValue('OpenApi3')
  openApi3,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.openApi3:
        return 'OpenApi3';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnlockServiceLinkedRoleResponse {
  UnlockServiceLinkedRoleResponse();
  factory UnlockServiceLinkedRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$UnlockServiceLinkedRoleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDiscovererResponse {
  /// The description of the discoverer.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the discoverer.
  @_s.JsonKey(name: 'DiscovererArn')
  final String discovererArn;

  /// The ID of the discoverer.
  @_s.JsonKey(name: 'DiscovererId')
  final String discovererId;

  /// The ARN of the event bus.
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;

  /// The state of the discoverer.
  @_s.JsonKey(name: 'State')
  final DiscovererState state;

  /// Tags associated with the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  UpdateDiscovererResponse({
    this.description,
    this.discovererArn,
    this.discovererId,
    this.sourceArn,
    this.state,
    this.tags,
  });
  factory UpdateDiscovererResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDiscovererResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRegistryResponse {
  /// The description of the registry.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the registry.
  @_s.JsonKey(name: 'RegistryArn')
  final String registryArn;

  /// The name of the registry.
  @_s.JsonKey(name: 'RegistryName')
  final String registryName;

  /// Tags associated with the registry.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  UpdateRegistryResponse({
    this.description,
    this.registryArn,
    this.registryName,
    this.tags,
  });
  factory UpdateRegistryResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRegistryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSchemaResponse {
  /// The description of the schema.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The date and time that schema was modified.
  @_s.JsonKey(
      name: 'LastModified', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime lastModified;

  /// The ARN of the schema.
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;

  /// The name of the schema.
  @_s.JsonKey(name: 'SchemaName')
  final String schemaName;

  /// The version number of the schema
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The type of the schema.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The date the schema version was created.
  @_s.JsonKey(
      name: 'VersionCreatedDate',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime versionCreatedDate;

  UpdateSchemaResponse({
    this.description,
    this.lastModified,
    this.schemaArn,
    this.schemaName,
    this.schemaVersion,
    this.tags,
    this.type,
    this.versionCreatedDate,
  });
  factory UpdateSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSchemaResponseFromJson(json);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class GoneException extends _s.GenericAwsException {
  GoneException({String type, String message})
      : super(type: type, code: 'GoneException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'GoneException': (type, message) =>
      GoneException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
