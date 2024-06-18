// ignore_for_file: deprecated_member_use_from_same_package
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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon EventBridge Schema Registry
class Schemas {
  final _s.RestJsonProtocol _protocol;
  Schemas({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'schemas',
            signingName: 'schemas',
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
  /// Parameter [crossAccount] :
  /// Support discovery of schemas in events sent to the bus from another
  /// account. (default: true).
  ///
  /// Parameter [description] :
  /// A description for the discoverer.
  ///
  /// Parameter [tags] :
  /// Tags associated with the resource.
  Future<CreateDiscovererResponse> createDiscoverer({
    required String sourceArn,
    bool? crossAccount,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'SourceArn': sourceArn,
      if (crossAccount != null) 'CrossAccount': crossAccount,
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
    required String registryName,
    String? description,
    Map<String, String>? tags,
  }) async {
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
    required String content,
    required String registryName,
    required String schemaName,
    required Type type,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Content': content,
      'Type': type.value,
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
    required String discovererId,
  }) async {
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
    required String registryName,
  }) async {
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
    String? registryName,
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
    required String registryName,
    required String schemaName,
  }) async {
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
    required String registryName,
    required String schemaName,
    required String schemaVersion,
  }) async {
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
    required String language,
    required String registryName,
    required String schemaName,
    String? schemaVersion,
  }) async {
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
    required String discovererId,
  }) async {
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
    required String registryName,
  }) async {
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
    required String registryName,
    required String schemaName,
    String? schemaVersion,
  }) async {
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
    required String registryName,
    required String schemaName,
    required String type,
    String? schemaVersion,
  }) async {
    final $query = <String, List<String>>{
      'type': [type],
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
    required String language,
    required String registryName,
    required String schemaName,
    String? schemaVersion,
  }) async {
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
    required List<String> events,
    required Type type,
  }) async {
    final $payload = <String, dynamic>{
      'Events': events,
      'Type': type.value,
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
    String? registryName,
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
    String? discovererIdPrefix,
    int? limit,
    String? nextToken,
    String? sourceArnPrefix,
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
    int? limit,
    String? nextToken,
    String? registryNamePrefix,
    String? scope,
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
    required String registryName,
    required String schemaName,
    int? limit,
    String? nextToken,
  }) async {
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
    required String registryName,
    int? limit,
    String? nextToken,
    String? schemaNamePrefix,
  }) async {
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
    required String language,
    required String registryName,
    required String schemaName,
    String? schemaVersion,
  }) async {
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
    required Object policy,
    String? registryName,
    String? revisionId,
  }) async {
    final $query = <String, List<String>>{
      if (registryName != null) 'registryName': [registryName],
    };
    final $payload = <String, dynamic>{
      'Policy': jsonEncode(policy),
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
    required String keywords,
    required String registryName,
    int? limit,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      'keywords': [keywords],
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
    required String discovererId,
  }) async {
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
    required String discovererId,
  }) async {
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
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
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
  /// Parameter [crossAccount] :
  /// Support discovery of schemas in events sent to the bus from another
  /// account. (default: true)
  ///
  /// Parameter [description] :
  /// The description of the discoverer to update.
  Future<UpdateDiscovererResponse> updateDiscoverer({
    required String discovererId,
    bool? crossAccount,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (crossAccount != null) 'CrossAccount': crossAccount,
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
    required String registryName,
    String? description,
  }) async {
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
    required String registryName,
    required String schemaName,
    String? clientTokenId,
    String? content,
    String? description,
    Type? type,
  }) async {
    final $payload = <String, dynamic>{
      'ClientTokenId': clientTokenId ?? _s.generateIdempotencyToken(),
      if (content != null) 'Content': content,
      if (description != null) 'Description': description,
      if (type != null) 'Type': type.value,
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
  createInProgress('CREATE_IN_PROGRESS'),
  createComplete('CREATE_COMPLETE'),
  createFailed('CREATE_FAILED'),
  ;

  final String value;

  const CodeGenerationStatus(this.value);

  static CodeGenerationStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CodeGenerationStatus'));
}

class CreateDiscovererResponse {
  /// The Status if the discoverer will discover schemas from events sent from
  /// another account.
  final bool? crossAccount;

  /// The description of the discoverer.
  final String? description;

  /// The ARN of the discoverer.
  final String? discovererArn;

  /// The ID of the discoverer.
  final String? discovererId;

  /// The ARN of the event bus.
  final String? sourceArn;

  /// The state of the discoverer.
  final DiscovererState? state;

  /// Tags associated with the resource.
  final Map<String, String>? tags;

  CreateDiscovererResponse({
    this.crossAccount,
    this.description,
    this.discovererArn,
    this.discovererId,
    this.sourceArn,
    this.state,
    this.tags,
  });

  factory CreateDiscovererResponse.fromJson(Map<String, dynamic> json) {
    return CreateDiscovererResponse(
      crossAccount: json['CrossAccount'] as bool?,
      description: json['Description'] as String?,
      discovererArn: json['DiscovererArn'] as String?,
      discovererId: json['DiscovererId'] as String?,
      sourceArn: json['SourceArn'] as String?,
      state: (json['State'] as String?)?.let(DiscovererState.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class CreateRegistryResponse {
  /// The description of the registry.
  final String? description;

  /// The ARN of the registry.
  final String? registryArn;

  /// The name of the registry.
  final String? registryName;

  /// Tags associated with the registry.
  final Map<String, String>? tags;

  CreateRegistryResponse({
    this.description,
    this.registryArn,
    this.registryName,
    this.tags,
  });

  factory CreateRegistryResponse.fromJson(Map<String, dynamic> json) {
    return CreateRegistryResponse(
      description: json['Description'] as String?,
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class CreateSchemaResponse {
  /// The description of the schema.
  final String? description;

  /// The date and time that schema was modified.
  final DateTime? lastModified;

  /// The ARN of the schema.
  final String? schemaArn;

  /// The name of the schema.
  final String? schemaName;

  /// The version number of the schema
  final String? schemaVersion;
  final Map<String, String>? tags;

  /// The type of the schema.
  final String? type;

  /// The date the schema version was created.
  final DateTime? versionCreatedDate;

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

  factory CreateSchemaResponse.fromJson(Map<String, dynamic> json) {
    return CreateSchemaResponse(
      description: json['Description'] as String?,
      lastModified: timeStampFromJson(json['LastModified']),
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      schemaVersion: json['SchemaVersion'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: json['Type'] as String?,
      versionCreatedDate: timeStampFromJson(json['VersionCreatedDate']),
    );
  }
}

class DescribeCodeBindingResponse {
  /// The time and date that the code binding was created.
  final DateTime? creationDate;

  /// The date and time that code bindings were modified.
  final DateTime? lastModified;

  /// The version number of the schema.
  final String? schemaVersion;

  /// The current status of code binding generation.
  final CodeGenerationStatus? status;

  DescribeCodeBindingResponse({
    this.creationDate,
    this.lastModified,
    this.schemaVersion,
    this.status,
  });

  factory DescribeCodeBindingResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCodeBindingResponse(
      creationDate: timeStampFromJson(json['CreationDate']),
      lastModified: timeStampFromJson(json['LastModified']),
      schemaVersion: json['SchemaVersion'] as String?,
      status: (json['Status'] as String?)?.let(CodeGenerationStatus.fromString),
    );
  }
}

class DescribeDiscovererResponse {
  /// The Status if the discoverer will discover schemas from events sent from
  /// another account.
  final bool? crossAccount;

  /// The description of the discoverer.
  final String? description;

  /// The ARN of the discoverer.
  final String? discovererArn;

  /// The ID of the discoverer.
  final String? discovererId;

  /// The ARN of the event bus.
  final String? sourceArn;

  /// The state of the discoverer.
  final DiscovererState? state;

  /// Tags associated with the resource.
  final Map<String, String>? tags;

  DescribeDiscovererResponse({
    this.crossAccount,
    this.description,
    this.discovererArn,
    this.discovererId,
    this.sourceArn,
    this.state,
    this.tags,
  });

  factory DescribeDiscovererResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDiscovererResponse(
      crossAccount: json['CrossAccount'] as bool?,
      description: json['Description'] as String?,
      discovererArn: json['DiscovererArn'] as String?,
      discovererId: json['DiscovererId'] as String?,
      sourceArn: json['SourceArn'] as String?,
      state: (json['State'] as String?)?.let(DiscovererState.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class DescribeRegistryResponse {
  /// The description of the registry.
  final String? description;

  /// The ARN of the registry.
  final String? registryArn;

  /// The name of the registry.
  final String? registryName;

  /// Tags associated with the registry.
  final Map<String, String>? tags;

  DescribeRegistryResponse({
    this.description,
    this.registryArn,
    this.registryName,
    this.tags,
  });

  factory DescribeRegistryResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRegistryResponse(
      description: json['Description'] as String?,
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class DescribeSchemaResponse {
  /// The source of the schema definition.
  final String? content;

  /// The description of the schema.
  final String? description;

  /// The date and time that schema was modified.
  final DateTime? lastModified;

  /// The ARN of the schema.
  final String? schemaArn;

  /// The name of the schema.
  final String? schemaName;

  /// The version number of the schema
  final String? schemaVersion;

  /// Tags associated with the resource.
  final Map<String, String>? tags;

  /// The type of the schema.
  final String? type;

  /// The date the schema version was created.
  final DateTime? versionCreatedDate;

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

  factory DescribeSchemaResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSchemaResponse(
      content: json['Content'] as String?,
      description: json['Description'] as String?,
      lastModified: timeStampFromJson(json['LastModified']),
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      schemaVersion: json['SchemaVersion'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: json['Type'] as String?,
      versionCreatedDate: timeStampFromJson(json['VersionCreatedDate']),
    );
  }
}

enum DiscovererState {
  started('STARTED'),
  stopped('STOPPED'),
  ;

  final String value;

  const DiscovererState(this.value);

  static DiscovererState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DiscovererState'));
}

class DiscovererSummary {
  /// The Status if the discoverer will discover schemas from events sent from
  /// another account.
  final bool? crossAccount;

  /// The ARN of the discoverer.
  final String? discovererArn;

  /// The ID of the discoverer.
  final String? discovererId;

  /// The ARN of the event bus.
  final String? sourceArn;

  /// The state of the discoverer.
  final DiscovererState? state;

  /// Tags associated with the resource.
  final Map<String, String>? tags;

  DiscovererSummary({
    this.crossAccount,
    this.discovererArn,
    this.discovererId,
    this.sourceArn,
    this.state,
    this.tags,
  });

  factory DiscovererSummary.fromJson(Map<String, dynamic> json) {
    return DiscovererSummary(
      crossAccount: json['CrossAccount'] as bool?,
      discovererArn: json['DiscovererArn'] as String?,
      discovererId: json['DiscovererId'] as String?,
      sourceArn: json['SourceArn'] as String?,
      state: (json['State'] as String?)?.let(DiscovererState.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class ExportSchemaResponse {
  final String? content;
  final String? schemaArn;
  final String? schemaName;
  final String? schemaVersion;
  final String? type;

  ExportSchemaResponse({
    this.content,
    this.schemaArn,
    this.schemaName,
    this.schemaVersion,
    this.type,
  });

  factory ExportSchemaResponse.fromJson(Map<String, dynamic> json) {
    return ExportSchemaResponse(
      content: json['Content'] as String?,
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      schemaVersion: json['SchemaVersion'] as String?,
      type: json['Type'] as String?,
    );
  }
}

class GetCodeBindingSourceResponse {
  final Uint8List? body;

  GetCodeBindingSourceResponse({
    this.body,
  });
}

class GetDiscoveredSchemaResponse {
  /// The source of the schema definition.
  final String? content;

  GetDiscoveredSchemaResponse({
    this.content,
  });

  factory GetDiscoveredSchemaResponse.fromJson(Map<String, dynamic> json) {
    return GetDiscoveredSchemaResponse(
      content: json['Content'] as String?,
    );
  }
}

class GetResourcePolicyResponse {
  /// The resource-based policy.
  final Object? policy;

  /// The revision ID.
  final String? revisionId;

  GetResourcePolicyResponse({
    this.policy,
    this.revisionId,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policy:
          json['Policy'] == null ? null : jsonDecode(json['Policy'] as String),
      revisionId: json['RevisionId'] as String?,
    );
  }
}

class ListDiscoverersResponse {
  /// An array of DiscovererSummary information.
  final List<DiscovererSummary>? discoverers;

  /// The token that specifies the next page of results to return. To request the
  /// first page, leave NextToken empty. The token will expire in 24 hours, and
  /// cannot be shared with other accounts.
  final String? nextToken;

  ListDiscoverersResponse({
    this.discoverers,
    this.nextToken,
  });

  factory ListDiscoverersResponse.fromJson(Map<String, dynamic> json) {
    return ListDiscoverersResponse(
      discoverers: (json['Discoverers'] as List?)
          ?.nonNulls
          .map((e) => DiscovererSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListRegistriesResponse {
  /// The token that specifies the next page of results to return. To request the
  /// first page, leave NextToken empty. The token will expire in 24 hours, and
  /// cannot be shared with other accounts.
  final String? nextToken;

  /// An array of registry summaries.
  final List<RegistrySummary>? registries;

  ListRegistriesResponse({
    this.nextToken,
    this.registries,
  });

  factory ListRegistriesResponse.fromJson(Map<String, dynamic> json) {
    return ListRegistriesResponse(
      nextToken: json['NextToken'] as String?,
      registries: (json['Registries'] as List?)
          ?.nonNulls
          .map((e) => RegistrySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListSchemaVersionsResponse {
  /// The token that specifies the next page of results to return. To request the
  /// first page, leave NextToken empty. The token will expire in 24 hours, and
  /// cannot be shared with other accounts.
  final String? nextToken;

  /// An array of schema version summaries.
  final List<SchemaVersionSummary>? schemaVersions;

  ListSchemaVersionsResponse({
    this.nextToken,
    this.schemaVersions,
  });

  factory ListSchemaVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSchemaVersionsResponse(
      nextToken: json['NextToken'] as String?,
      schemaVersions: (json['SchemaVersions'] as List?)
          ?.nonNulls
          .map((e) => SchemaVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ListSchemasResponse {
  /// The token that specifies the next page of results to return. To request the
  /// first page, leave NextToken empty. The token will expire in 24 hours, and
  /// cannot be shared with other accounts.
  final String? nextToken;

  /// An array of schema summaries.
  final List<SchemaSummary>? schemas;

  ListSchemasResponse({
    this.nextToken,
    this.schemas,
  });

  factory ListSchemasResponse.fromJson(Map<String, dynamic> json) {
    return ListSchemasResponse(
      nextToken: json['NextToken'] as String?,
      schemas: (json['Schemas'] as List?)
          ?.nonNulls
          .map((e) => SchemaSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
}

class PutCodeBindingResponse {
  /// The time and date that the code binding was created.
  final DateTime? creationDate;

  /// The date and time that code bindings were modified.
  final DateTime? lastModified;

  /// The version number of the schema.
  final String? schemaVersion;

  /// The current status of code binding generation.
  final CodeGenerationStatus? status;

  PutCodeBindingResponse({
    this.creationDate,
    this.lastModified,
    this.schemaVersion,
    this.status,
  });

  factory PutCodeBindingResponse.fromJson(Map<String, dynamic> json) {
    return PutCodeBindingResponse(
      creationDate: timeStampFromJson(json['CreationDate']),
      lastModified: timeStampFromJson(json['LastModified']),
      schemaVersion: json['SchemaVersion'] as String?,
      status: (json['Status'] as String?)?.let(CodeGenerationStatus.fromString),
    );
  }
}

class PutResourcePolicyResponse {
  /// The resource-based policy.
  final Object? policy;

  /// The revision ID of the policy.
  final String? revisionId;

  PutResourcePolicyResponse({
    this.policy,
    this.revisionId,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      policy:
          json['Policy'] == null ? null : jsonDecode(json['Policy'] as String),
      revisionId: json['RevisionId'] as String?,
    );
  }
}

class RegistrySummary {
  /// The ARN of the registry.
  final String? registryArn;

  /// The name of the registry.
  final String? registryName;

  /// Tags associated with the registry.
  final Map<String, String>? tags;

  RegistrySummary({
    this.registryArn,
    this.registryName,
    this.tags,
  });

  factory RegistrySummary.fromJson(Map<String, dynamic> json) {
    return RegistrySummary(
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

/// A summary of schema details.
class SchemaSummary {
  /// The date and time that schema was modified.
  final DateTime? lastModified;

  /// The ARN of the schema.
  final String? schemaArn;

  /// The name of the schema.
  final String? schemaName;

  /// Tags associated with the schema.
  final Map<String, String>? tags;

  /// The number of versions available for the schema.
  final int? versionCount;

  SchemaSummary({
    this.lastModified,
    this.schemaArn,
    this.schemaName,
    this.tags,
    this.versionCount,
  });

  factory SchemaSummary.fromJson(Map<String, dynamic> json) {
    return SchemaSummary(
      lastModified: timeStampFromJson(json['LastModified']),
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      versionCount: json['VersionCount'] as int?,
    );
  }
}

class SchemaVersionSummary {
  /// The ARN of the schema version.
  final String? schemaArn;

  /// The name of the schema.
  final String? schemaName;

  /// The version number of the schema.
  final String? schemaVersion;

  /// The type of schema.
  final Type? type;

  SchemaVersionSummary({
    this.schemaArn,
    this.schemaName,
    this.schemaVersion,
    this.type,
  });

  factory SchemaVersionSummary.fromJson(Map<String, dynamic> json) {
    return SchemaVersionSummary(
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      schemaVersion: json['SchemaVersion'] as String?,
      type: (json['Type'] as String?)?.let(Type.fromString),
    );
  }
}

class SearchSchemaSummary {
  /// The name of the registry.
  final String? registryName;

  /// The ARN of the schema.
  final String? schemaArn;

  /// The name of the schema.
  final String? schemaName;

  /// An array of schema version summaries.
  final List<SearchSchemaVersionSummary>? schemaVersions;

  SearchSchemaSummary({
    this.registryName,
    this.schemaArn,
    this.schemaName,
    this.schemaVersions,
  });

  factory SearchSchemaSummary.fromJson(Map<String, dynamic> json) {
    return SearchSchemaSummary(
      registryName: json['RegistryName'] as String?,
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      schemaVersions: (json['SchemaVersions'] as List?)
          ?.nonNulls
          .map((e) =>
              SearchSchemaVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SearchSchemaVersionSummary {
  /// The date the schema version was created.
  final DateTime? createdDate;

  /// The version number of the schema
  final String? schemaVersion;

  /// The type of schema.
  final Type? type;

  SearchSchemaVersionSummary({
    this.createdDate,
    this.schemaVersion,
    this.type,
  });

  factory SearchSchemaVersionSummary.fromJson(Map<String, dynamic> json) {
    return SearchSchemaVersionSummary(
      createdDate: timeStampFromJson(json['CreatedDate']),
      schemaVersion: json['SchemaVersion'] as String?,
      type: (json['Type'] as String?)?.let(Type.fromString),
    );
  }
}

class SearchSchemasResponse {
  /// The token that specifies the next page of results to return. To request the
  /// first page, leave NextToken empty. The token will expire in 24 hours, and
  /// cannot be shared with other accounts.
  final String? nextToken;

  /// An array of SearchSchemaSummary information.
  final List<SearchSchemaSummary>? schemas;

  SearchSchemasResponse({
    this.nextToken,
    this.schemas,
  });

  factory SearchSchemasResponse.fromJson(Map<String, dynamic> json) {
    return SearchSchemasResponse(
      nextToken: json['NextToken'] as String?,
      schemas: (json['Schemas'] as List?)
          ?.nonNulls
          .map((e) => SearchSchemaSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class StartDiscovererResponse {
  /// The ID of the discoverer.
  final String? discovererId;

  /// The state of the discoverer.
  final DiscovererState? state;

  StartDiscovererResponse({
    this.discovererId,
    this.state,
  });

  factory StartDiscovererResponse.fromJson(Map<String, dynamic> json) {
    return StartDiscovererResponse(
      discovererId: json['DiscovererId'] as String?,
      state: (json['State'] as String?)?.let(DiscovererState.fromString),
    );
  }
}

class StopDiscovererResponse {
  /// The ID of the discoverer.
  final String? discovererId;

  /// The state of the discoverer.
  final DiscovererState? state;

  StopDiscovererResponse({
    this.discovererId,
    this.state,
  });

  factory StopDiscovererResponse.fromJson(Map<String, dynamic> json) {
    return StopDiscovererResponse(
      discovererId: json['DiscovererId'] as String?,
      state: (json['State'] as String?)?.let(DiscovererState.fromString),
    );
  }
}

enum Type {
  openApi3('OpenApi3'),
  jSONSchemaDraft4('JSONSchemaDraft4'),
  ;

  final String value;

  const Type(this.value);

  static Type fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Type'));
}

class UpdateDiscovererResponse {
  /// The Status if the discoverer will discover schemas from events sent from
  /// another account.
  final bool? crossAccount;

  /// The description of the discoverer.
  final String? description;

  /// The ARN of the discoverer.
  final String? discovererArn;

  /// The ID of the discoverer.
  final String? discovererId;

  /// The ARN of the event bus.
  final String? sourceArn;

  /// The state of the discoverer.
  final DiscovererState? state;

  /// Tags associated with the resource.
  final Map<String, String>? tags;

  UpdateDiscovererResponse({
    this.crossAccount,
    this.description,
    this.discovererArn,
    this.discovererId,
    this.sourceArn,
    this.state,
    this.tags,
  });

  factory UpdateDiscovererResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDiscovererResponse(
      crossAccount: json['CrossAccount'] as bool?,
      description: json['Description'] as String?,
      discovererArn: json['DiscovererArn'] as String?,
      discovererId: json['DiscovererId'] as String?,
      sourceArn: json['SourceArn'] as String?,
      state: (json['State'] as String?)?.let(DiscovererState.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class UpdateRegistryResponse {
  /// The description of the registry.
  final String? description;

  /// The ARN of the registry.
  final String? registryArn;

  /// The name of the registry.
  final String? registryName;

  /// Tags associated with the registry.
  final Map<String, String>? tags;

  UpdateRegistryResponse({
    this.description,
    this.registryArn,
    this.registryName,
    this.tags,
  });

  factory UpdateRegistryResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRegistryResponse(
      description: json['Description'] as String?,
      registryArn: json['RegistryArn'] as String?,
      registryName: json['RegistryName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class UpdateSchemaResponse {
  /// The description of the schema.
  final String? description;

  /// The date and time that schema was modified.
  final DateTime? lastModified;

  /// The ARN of the schema.
  final String? schemaArn;

  /// The name of the schema.
  final String? schemaName;

  /// The version number of the schema
  final String? schemaVersion;
  final Map<String, String>? tags;

  /// The type of the schema.
  final String? type;

  /// The date the schema version was created.
  final DateTime? versionCreatedDate;

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

  factory UpdateSchemaResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSchemaResponse(
      description: json['Description'] as String?,
      lastModified: timeStampFromJson(json['LastModified']),
      schemaArn: json['SchemaArn'] as String?,
      schemaName: json['SchemaName'] as String?,
      schemaVersion: json['SchemaVersion'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: json['Type'] as String?,
      versionCreatedDate: timeStampFromJson(json['VersionCreatedDate']),
    );
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class GoneException extends _s.GenericAwsException {
  GoneException({String? type, String? message})
      : super(type: type, code: 'GoneException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
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
