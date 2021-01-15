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

part '2019-12-02.g.dart';

/// Amazon EventBridge Schema Registry
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
  /// Parameter [registryName] :
  /// The name of the registry.
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
      requestUri: '/v1/registries/name/${Uri.encodeComponent(registryName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRegistryResponse.fromJson(response);
  }

  /// Creates a schema definition.
  /// <note>
  /// Inactive schemas will be deleted after two years.
  /// </note>
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [content] :
  /// The source of the schema definition.
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema.
  ///
  /// Parameter [type] :
  /// The type of schema.
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
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/name/${Uri.encodeComponent(schemaName)}',
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
  ///
  /// Parameter [discovererId] :
  /// The ID of the discoverer.
  Future<void> deleteDiscoverer({
    @_s.required String discovererId,
  }) async {
    ArgumentError.checkNotNull(discovererId, 'discovererId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/discoverers/id/${Uri.encodeComponent(discovererId)}',
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
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  Future<void> deleteRegistry({
    @_s.required String registryName,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/registries/name/${Uri.encodeComponent(registryName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete the resource-based policy attached to the specified registry.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  Future<void> deleteResourcePolicy({
    String registryName,
  }) async {
    final $query = <String, List<String>>{
      if (registryName != null) 'registryName': [registryName],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/policy',
      queryParams: $query,
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
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema.
  Future<void> deleteSchema({
    @_s.required String registryName,
    @_s.required String schemaName,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/name/${Uri.encodeComponent(schemaName)}',
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
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema.
  ///
  /// Parameter [schemaVersion] :
  /// The version number of the schema
  Future<void> deleteSchemaVersion({
    @_s.required String registryName,
    @_s.required String schemaName,
    @_s.required String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    ArgumentError.checkNotNull(schemaVersion, 'schemaVersion');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/name/${Uri.encodeComponent(schemaName)}/version/${Uri.encodeComponent(schemaVersion)}',
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
  ///
  /// Parameter [language] :
  /// The language of the code binding.
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema.
  ///
  /// Parameter [schemaVersion] :
  /// Specifying this limits the results to only this schema version.
  Future<DescribeCodeBindingResponse> describeCodeBinding({
    @_s.required String language,
    @_s.required String registryName,
    @_s.required String schemaName,
    String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(language, 'language');
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    final $query = <String, List<String>>{
      if (schemaVersion != null) 'schemaVersion': [schemaVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/name/${Uri.encodeComponent(schemaName)}/language/${Uri.encodeComponent(language)}',
      queryParams: $query,
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
  ///
  /// Parameter [discovererId] :
  /// The ID of the discoverer.
  Future<DescribeDiscovererResponse> describeDiscoverer({
    @_s.required String discovererId,
  }) async {
    ArgumentError.checkNotNull(discovererId, 'discovererId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/discoverers/id/${Uri.encodeComponent(discovererId)}',
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
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  Future<DescribeRegistryResponse> describeRegistry({
    @_s.required String registryName,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/registries/name/${Uri.encodeComponent(registryName)}',
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
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema.
  ///
  /// Parameter [schemaVersion] :
  /// Specifying this limits the results to only this schema version.
  Future<DescribeSchemaResponse> describeSchema({
    @_s.required String registryName,
    @_s.required String schemaName,
    String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    final $query = <String, List<String>>{
      if (schemaVersion != null) 'schemaVersion': [schemaVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/name/${Uri.encodeComponent(schemaName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSchemaResponse.fromJson(response);
  }

  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema.
  ///
  /// Parameter [schemaVersion] :
  /// Specifying this limits the results to only this schema version.
  Future<ExportSchemaResponse> exportSchema({
    @_s.required String registryName,
    @_s.required String schemaName,
    @_s.required String type,
    String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    ArgumentError.checkNotNull(type, 'type');
    final $query = <String, List<String>>{
      if (type != null) 'type': [type],
      if (schemaVersion != null) 'schemaVersion': [schemaVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/name/${Uri.encodeComponent(schemaName)}/export',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ExportSchemaResponse.fromJson(response);
  }

  /// Get the code binding source URI.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [language] :
  /// The language of the code binding.
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema.
  ///
  /// Parameter [schemaVersion] :
  /// Specifying this limits the results to only this schema version.
  Future<GetCodeBindingSourceResponse> getCodeBindingSource({
    @_s.required String language,
    @_s.required String registryName,
    @_s.required String schemaName,
    String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(language, 'language');
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    final $query = <String, List<String>>{
      if (schemaVersion != null) 'schemaVersion': [schemaVersion],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/name/${Uri.encodeComponent(schemaName)}/language/${Uri.encodeComponent(language)}/source',
      queryParams: $query,
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
  /// An array of strings where each string is a JSON event. These are the
  /// events that were used to generate the schema. The array includes a single
  /// type of event and has a maximum size of 10 events.
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

  /// Retrieves the resource-based policy attached to a given registry.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    String registryName,
  }) async {
    final $query = <String, List<String>>{
      if (registryName != null) 'registryName': [registryName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyResponse.fromJson(response);
  }

  /// List the discoverers.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [discovererIdPrefix] :
  /// Specifying this limits the results to only those discoverer IDs that start
  /// with the specified prefix.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results to return. To request
  /// the first page, leave NextToken empty. The token will expire in 24 hours,
  /// and cannot be shared with other accounts.
  ///
  /// Parameter [sourceArnPrefix] :
  /// Specifying this limits the results to only those ARNs that start with the
  /// specified prefix.
  Future<ListDiscoverersResponse> listDiscoverers({
    String discovererIdPrefix,
    int limit,
    String nextToken,
    String sourceArnPrefix,
  }) async {
    final $query = <String, List<String>>{
      if (discovererIdPrefix != null)
        'discovererIdPrefix': [discovererIdPrefix],
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sourceArnPrefix != null) 'sourceArnPrefix': [sourceArnPrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/discoverers',
      queryParams: $query,
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
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results to return. To request
  /// the first page, leave NextToken empty. The token will expire in 24 hours,
  /// and cannot be shared with other accounts.
  ///
  /// Parameter [registryNamePrefix] :
  /// Specifying this limits the results to only those registry names that start
  /// with the specified prefix.
  ///
  /// Parameter [scope] :
  /// Can be set to Local or AWS to limit responses to your custom registries,
  /// or the ones provided by AWS.
  Future<ListRegistriesResponse> listRegistries({
    int limit,
    String nextToken,
    String registryNamePrefix,
    String scope,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (registryNamePrefix != null)
        'registryNamePrefix': [registryNamePrefix],
      if (scope != null) 'scope': [scope],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/registries',
      queryParams: $query,
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
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results to return. To request
  /// the first page, leave NextToken empty. The token will expire in 24 hours,
  /// and cannot be shared with other accounts.
  Future<ListSchemaVersionsResponse> listSchemaVersions({
    @_s.required String registryName,
    @_s.required String schemaName,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/name/${Uri.encodeComponent(schemaName)}/versions',
      queryParams: $query,
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
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results to return. To request
  /// the first page, leave NextToken empty. The token will expire in 24 hours,
  /// and cannot be shared with other accounts.
  ///
  /// Parameter [schemaNamePrefix] :
  /// Specifying this limits the results to only those schema names that start
  /// with the specified prefix.
  Future<ListSchemasResponse> listSchemas({
    @_s.required String registryName,
    int limit,
    String nextToken,
    String schemaNamePrefix,
  }) async {
    ArgumentError.checkNotNull(registryName, 'registryName');
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (schemaNamePrefix != null) 'schemaNamePrefix': [schemaNamePrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas',
      queryParams: $query,
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
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
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
  ///
  /// Parameter [language] :
  /// The language of the code binding.
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema.
  ///
  /// Parameter [schemaVersion] :
  /// Specifying this limits the results to only this schema version.
  Future<PutCodeBindingResponse> putCodeBinding({
    @_s.required String language,
    @_s.required String registryName,
    @_s.required String schemaName,
    String schemaVersion,
  }) async {
    ArgumentError.checkNotNull(language, 'language');
    ArgumentError.checkNotNull(registryName, 'registryName');
    ArgumentError.checkNotNull(schemaName, 'schemaName');
    final $query = <String, List<String>>{
      if (schemaVersion != null) 'schemaVersion': [schemaVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/name/${Uri.encodeComponent(schemaName)}/language/${Uri.encodeComponent(language)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutCodeBindingResponse.fromJson(response);
  }

  /// The name of the policy.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [PreconditionFailedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [policy] :
  /// The resource-based policy.
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [revisionId] :
  /// The revision ID of the policy.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    @_s.required String policy,
    String registryName,
    String revisionId,
  }) async {
    ArgumentError.checkNotNull(policy, 'policy');
    final $query = <String, List<String>>{
      if (registryName != null) 'registryName': [registryName],
    };
    final $payload = <String, dynamic>{
      'Policy': policy == null ? null : jsonEncode(policy),
      if (revisionId != null) 'RevisionId': revisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutResourcePolicyResponse.fromJson(response);
  }

  /// Search the schemas
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [keywords] :
  /// Specifying this limits the results to only schemas that include the
  /// provided keywords.
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [nextToken] :
  /// The token that specifies the next page of results to return. To request
  /// the first page, leave NextToken empty. The token will expire in 24 hours,
  /// and cannot be shared with other accounts.
  Future<SearchSchemasResponse> searchSchemas({
    @_s.required String keywords,
    @_s.required String registryName,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(keywords, 'keywords');
    ArgumentError.checkNotNull(registryName, 'registryName');
    final $query = <String, List<String>>{
      if (keywords != null) 'keywords': [keywords],
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/search',
      queryParams: $query,
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
  ///
  /// Parameter [discovererId] :
  /// The ID of the discoverer.
  Future<StartDiscovererResponse> startDiscoverer({
    @_s.required String discovererId,
  }) async {
    ArgumentError.checkNotNull(discovererId, 'discovererId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/v1/discoverers/id/${Uri.encodeComponent(discovererId)}/start',
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
  ///
  /// Parameter [discovererId] :
  /// The ID of the discoverer.
  Future<StopDiscovererResponse> stopDiscoverer({
    @_s.required String discovererId,
  }) async {
    ArgumentError.checkNotNull(discovererId, 'discovererId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/v1/discoverers/id/${Uri.encodeComponent(discovererId)}/stop',
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
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// Tags associated with the resource.
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// Keys of key-value pairs.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
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
  /// Parameter [discovererId] :
  /// The ID of the discoverer.
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
      requestUri: '/v1/discoverers/id/${Uri.encodeComponent(discovererId)}',
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
  /// Parameter [registryName] :
  /// The name of the registry.
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
      requestUri: '/v1/registries/name/${Uri.encodeComponent(registryName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRegistryResponse.fromJson(response);
  }

  /// Updates the schema definition
  /// <note>
  /// Inactive schemas will be deleted after two years.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [registryName] :
  /// The name of the registry.
  ///
  /// Parameter [schemaName] :
  /// The name of the schema.
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
      'ClientTokenId': clientTokenId ?? _s.generateIdempotencyToken(),
      if (content != null) 'Content': content,
      if (description != null) 'Description': description,
      if (type != null) 'Type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/registries/name/${Uri.encodeComponent(registryName)}/schemas/name/${Uri.encodeComponent(schemaName)}',
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'LastModified')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'VersionCreatedDate')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The date and time that code bindings were modified.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'LastModified')
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
  /// The source of the schema definition.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The description of the schema.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The date and time that schema was modified.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'LastModified')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'VersionCreatedDate')
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

  /// The state of the discoverer.
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
class ExportSchemaResponse {
  @_s.JsonKey(name: 'Content')
  final String content;
  @_s.JsonKey(name: 'SchemaArn')
  final String schemaArn;
  @_s.JsonKey(name: 'SchemaName')
  final String schemaName;
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;
  @_s.JsonKey(name: 'Type')
  final String type;

  ExportSchemaResponse({
    this.content,
    this.schemaArn,
    this.schemaName,
    this.schemaVersion,
    this.type,
  });
  factory ExportSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$ExportSchemaResponseFromJson(json);
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
  /// The source of the schema definition.
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
class GetResourcePolicyResponse {
  /// The resource-based policy.
  @_s.JsonKey(name: 'Policy')
  final Object policy;

  /// The revision ID.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  GetResourcePolicyResponse({
    this.policy,
    this.revisionId,
  });
  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResourcePolicyResponseFromJson(json);
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
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutCodeBindingResponse {
  /// The time and date that the code binding was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The date and time that code bindings were modified.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'LastModified')
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
class PutResourcePolicyResponse {
  /// The resource-based policy.
  @_s.JsonKey(name: 'Policy')
  final Object policy;

  /// The revision ID of the policy.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  PutResourcePolicyResponse({
    this.policy,
    this.revisionId,
  });
  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutResourcePolicyResponseFromJson(json);
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'LastModified')
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

  /// The type of schema.
  @_s.JsonKey(name: 'Type')
  final Type type;

  SchemaVersionSummary({
    this.schemaArn,
    this.schemaName,
    this.schemaVersion,
    this.type,
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
  /// The date the schema version was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedDate')
  final DateTime createdDate;

  /// The version number of the schema
  @_s.JsonKey(name: 'SchemaVersion')
  final String schemaVersion;

  /// The type of schema.
  @_s.JsonKey(name: 'Type')
  final Type type;

  SearchSchemaVersionSummary({
    this.createdDate,
    this.schemaVersion,
    this.type,
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
  @_s.JsonValue('JSONSchemaDraft4')
  jSONSchemaDraft4,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.openApi3:
        return 'OpenApi3';
      case Type.jSONSchemaDraft4:
        return 'JSONSchemaDraft4';
    }
    throw Exception('Unknown enum value: $this');
  }
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'LastModified')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'VersionCreatedDate')
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

class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String type, String message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
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
  'PreconditionFailedException': (type, message) =>
      PreconditionFailedException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
