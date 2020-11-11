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
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'appsync-2017-07-25.g.dart';

/// AWS AppSync provides API actions for creating and interacting with data
/// sources using GraphQL from your application.
class AppSync {
  final _s.RestJsonProtocol _protocol;
  AppSync({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'appsync',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a cache for the GraphQL API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiCachingBehavior] :
  /// Caching behavior.
  ///
  /// <ul>
  /// <li>
  /// <b>FULL_REQUEST_CACHING</b>: All requests are fully cached.
  /// </li>
  /// <li>
  /// <b>PER_RESOLVER_CACHING</b>: Individual resovlers that you specify are
  /// cached.
  /// </li>
  /// </ul>
  ///
  /// Parameter [apiId] :
  /// The GraphQL API Id.
  ///
  /// Parameter [ttl] :
  /// TTL in seconds for cache entries.
  ///
  /// Valid values are between 1 and 3600 seconds.
  ///
  /// Parameter [type] :
  /// The cache instance type.
  ///
  /// <ul>
  /// <li>
  /// <b>T2_SMALL</b>: A t2.small instance type.
  /// </li>
  /// <li>
  /// <b>T2_MEDIUM</b>: A t2.medium instance type.
  /// </li>
  /// <li>
  /// <b>R4_LARGE</b>: A r4.large instance type.
  /// </li>
  /// <li>
  /// <b>R4_XLARGE</b>: A r4.xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_2XLARGE</b>: A r4.2xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_4XLARGE</b>: A r4.4xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_8XLARGE</b>: A r4.8xlarge instance type.
  /// </li>
  /// </ul>
  ///
  /// Parameter [atRestEncryptionEnabled] :
  /// At rest encryption flag for cache. This setting cannot be updated after
  /// creation.
  ///
  /// Parameter [transitEncryptionEnabled] :
  /// Transit encryption flag when connecting to cache. This setting cannot be
  /// updated after creation.
  Future<CreateApiCacheResponse> createApiCache({
    @_s.required ApiCachingBehavior apiCachingBehavior,
    @_s.required String apiId,
    @_s.required int ttl,
    @_s.required ApiCacheType type,
    bool atRestEncryptionEnabled,
    bool transitEncryptionEnabled,
  }) async {
    ArgumentError.checkNotNull(apiCachingBehavior, 'apiCachingBehavior');
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(ttl, 'ttl');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = CreateApiCacheRequest(
      apiCachingBehavior: apiCachingBehavior,
      apiId: apiId,
      ttl: ttl,
      type: type,
      atRestEncryptionEnabled: atRestEncryptionEnabled,
      transitEncryptionEnabled: transitEncryptionEnabled,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId.toString())}/ApiCaches',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApiCacheResponse.fromJson(response);
  }

  /// Creates a unique key that you can distribute to clients who are executing
  /// your API.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ApiKeyLimitExceededException].
  /// May throw [ApiKeyValidityOutOfBoundsException].
  ///
  /// Parameter [apiId] :
  /// The ID for your GraphQL API.
  ///
  /// Parameter [description] :
  /// A description of the purpose of the API key.
  ///
  /// Parameter [expires] :
  /// The time from creation time after which the API key expires. The date is
  /// represented as seconds since the epoch, rounded down to the nearest hour.
  /// The default value for this parameter is 7 days from creation time. For
  /// more information, see .
  Future<CreateApiKeyResponse> createApiKey({
    @_s.required String apiId,
    String description,
    int expires,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $payload = CreateApiKeyRequest(
      apiId: apiId,
      description: description,
      expires: expires,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId.toString())}/apikeys',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApiKeyResponse.fromJson(response);
  }

  /// Creates a <code>DataSource</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID for the GraphQL API for the <code>DataSource</code>.
  ///
  /// Parameter [name] :
  /// A user-supplied name for the <code>DataSource</code>.
  ///
  /// Parameter [type] :
  /// The type of the <code>DataSource</code>.
  ///
  /// Parameter [description] :
  /// A description of the <code>DataSource</code>.
  ///
  /// Parameter [dynamodbConfig] :
  /// Amazon DynamoDB settings.
  ///
  /// Parameter [elasticsearchConfig] :
  /// Amazon Elasticsearch Service settings.
  ///
  /// Parameter [httpConfig] :
  /// HTTP endpoint settings.
  ///
  /// Parameter [lambdaConfig] :
  /// AWS Lambda settings.
  ///
  /// Parameter [relationalDatabaseConfig] :
  /// Relational database settings.
  ///
  /// Parameter [serviceRoleArn] :
  /// The AWS IAM service role ARN for the data source. The system assumes this
  /// role when accessing the data source.
  Future<CreateDataSourceResponse> createDataSource({
    @_s.required String apiId,
    @_s.required String name,
    @_s.required DataSourceType type,
    String description,
    DynamodbDataSourceConfig dynamodbConfig,
    ElasticsearchDataSourceConfig elasticsearchConfig,
    HttpDataSourceConfig httpConfig,
    LambdaDataSourceConfig lambdaConfig,
    RelationalDatabaseDataSourceConfig relationalDatabaseConfig,
    String serviceRoleArn,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final $payload = CreateDataSourceRequest(
      apiId: apiId,
      name: name,
      type: type,
      description: description,
      dynamodbConfig: dynamodbConfig,
      elasticsearchConfig: elasticsearchConfig,
      httpConfig: httpConfig,
      lambdaConfig: lambdaConfig,
      relationalDatabaseConfig: relationalDatabaseConfig,
      serviceRoleArn: serviceRoleArn,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/datasources',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataSourceResponse.fromJson(response);
  }

  /// Creates a <code>Function</code> object.
  ///
  /// A function is a reusable entity. Multiple functions can be used to compose
  /// the resolver logic.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The GraphQL API ID.
  ///
  /// Parameter [dataSourceName] :
  /// The <code>Function</code> <code>DataSource</code> name.
  ///
  /// Parameter [functionVersion] :
  /// The <code>version</code> of the request mapping template. Currently the
  /// supported value is 2018-05-29.
  ///
  /// Parameter [name] :
  /// The <code>Function</code> name. The function name does not have to be
  /// unique.
  ///
  /// Parameter [requestMappingTemplate] :
  /// The <code>Function</code> request mapping template. Functions support only
  /// the 2018-05-29 version of the request mapping template.
  ///
  /// Parameter [description] :
  /// The <code>Function</code> description.
  ///
  /// Parameter [responseMappingTemplate] :
  /// The <code>Function</code> response mapping template.
  Future<CreateFunctionResponse> createFunction({
    @_s.required String apiId,
    @_s.required String dataSourceName,
    @_s.required String functionVersion,
    @_s.required String name,
    @_s.required String requestMappingTemplate,
    String description,
    String responseMappingTemplate,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(dataSourceName, 'dataSourceName');
    _s.validateStringLength(
      'dataSourceName',
      dataSourceName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataSourceName',
      dataSourceName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(functionVersion, 'functionVersion');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        requestMappingTemplate, 'requestMappingTemplate');
    _s.validateStringLength(
      'requestMappingTemplate',
      requestMappingTemplate,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringLength(
      'responseMappingTemplate',
      responseMappingTemplate,
      1,
      65536,
    );
    final $payload = CreateFunctionRequest(
      apiId: apiId,
      dataSourceName: dataSourceName,
      functionVersion: functionVersion,
      name: name,
      requestMappingTemplate: requestMappingTemplate,
      description: description,
      responseMappingTemplate: responseMappingTemplate,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId.toString())}/functions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFunctionResponse.fromJson(response);
  }

  /// Creates a <code>GraphqlApi</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ApiLimitExceededException].
  ///
  /// Parameter [authenticationType] :
  /// The authentication type: API key, AWS IAM, OIDC, or Amazon Cognito user
  /// pools.
  ///
  /// Parameter [name] :
  /// A user-supplied name for the <code>GraphqlApi</code>.
  ///
  /// Parameter [additionalAuthenticationProviders] :
  /// A list of additional authentication providers for the
  /// <code>GraphqlApi</code> API.
  ///
  /// Parameter [logConfig] :
  /// The Amazon CloudWatch Logs configuration.
  ///
  /// Parameter [openIDConnectConfig] :
  /// The OpenID Connect configuration.
  ///
  /// Parameter [tags] :
  /// A <code>TagMap</code> object.
  ///
  /// Parameter [userPoolConfig] :
  /// The Amazon Cognito user pool configuration.
  ///
  /// Parameter [xrayEnabled] :
  /// A flag indicating whether to enable X-Ray tracing for the
  /// <code>GraphqlApi</code>.
  Future<CreateGraphqlApiResponse> createGraphqlApi({
    @_s.required AuthenticationType authenticationType,
    @_s.required String name,
    List<AdditionalAuthenticationProvider> additionalAuthenticationProviders,
    LogConfig logConfig,
    OpenIDConnectConfig openIDConnectConfig,
    Map<String, String> tags,
    UserPoolConfig userPoolConfig,
    bool xrayEnabled,
  }) async {
    ArgumentError.checkNotNull(authenticationType, 'authenticationType');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = CreateGraphqlApiRequest(
      authenticationType: authenticationType,
      name: name,
      additionalAuthenticationProviders: additionalAuthenticationProviders,
      logConfig: logConfig,
      openIDConnectConfig: openIDConnectConfig,
      tags: tags,
      userPoolConfig: userPoolConfig,
      xrayEnabled: xrayEnabled,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGraphqlApiResponse.fromJson(response);
  }

  /// Creates a <code>Resolver</code> object.
  ///
  /// A resolver converts incoming requests into a format that a data source can
  /// understand and converts the data source's responses into GraphQL.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The ID for the GraphQL API for which the resolver is being created.
  ///
  /// Parameter [fieldName] :
  /// The name of the field to attach the resolver to.
  ///
  /// Parameter [requestMappingTemplate] :
  /// The mapping template to be used for requests.
  ///
  /// A resolver uses a request mapping template to convert a GraphQL expression
  /// into a format that a data source can understand. Mapping templates are
  /// written in Apache Velocity Template Language (VTL).
  ///
  /// Parameter [typeName] :
  /// The name of the <code>Type</code>.
  ///
  /// Parameter [cachingConfig] :
  /// The caching configuration for the resolver.
  ///
  /// Parameter [dataSourceName] :
  /// The name of the data source for which the resolver is being created.
  ///
  /// Parameter [kind] :
  /// The resolver type.
  ///
  /// <ul>
  /// <li>
  /// <b>UNIT</b>: A UNIT resolver type. A UNIT resolver is the default resolver
  /// type. A UNIT resolver enables you to execute a GraphQL query against a
  /// single data source.
  /// </li>
  /// <li>
  /// <b>PIPELINE</b>: A PIPELINE resolver type. A PIPELINE resolver enables you
  /// to execute a series of <code>Function</code> in a serial manner. You can
  /// use a pipeline resolver to execute a GraphQL query against multiple data
  /// sources.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pipelineConfig] :
  /// The <code>PipelineConfig</code>.
  ///
  /// Parameter [responseMappingTemplate] :
  /// The mapping template to be used for responses from the data source.
  ///
  /// Parameter [syncConfig] :
  /// The <code>SyncConfig</code> for a resolver attached to a versioned
  /// datasource.
  Future<CreateResolverResponse> createResolver({
    @_s.required String apiId,
    @_s.required String fieldName,
    @_s.required String requestMappingTemplate,
    @_s.required String typeName,
    CachingConfig cachingConfig,
    String dataSourceName,
    ResolverKind kind,
    PipelineConfig pipelineConfig,
    String responseMappingTemplate,
    SyncConfig syncConfig,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(fieldName, 'fieldName');
    _s.validateStringLength(
      'fieldName',
      fieldName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fieldName',
      fieldName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        requestMappingTemplate, 'requestMappingTemplate');
    _s.validateStringLength(
      'requestMappingTemplate',
      requestMappingTemplate,
      1,
      65536,
      isRequired: true,
    );
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'dataSourceName',
      dataSourceName,
      1,
      65536,
    );
    _s.validateStringPattern(
      'dataSourceName',
      dataSourceName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
    );
    _s.validateStringLength(
      'responseMappingTemplate',
      responseMappingTemplate,
      1,
      65536,
    );
    final $payload = CreateResolverRequest(
      apiId: apiId,
      fieldName: fieldName,
      requestMappingTemplate: requestMappingTemplate,
      typeName: typeName,
      cachingConfig: cachingConfig,
      dataSourceName: dataSourceName,
      kind: kind,
      pipelineConfig: pipelineConfig,
      responseMappingTemplate: responseMappingTemplate,
      syncConfig: syncConfig,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/types/${Uri.encodeComponent(typeName.toString())}/resolvers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateResolverResponse.fromJson(response);
  }

  /// Creates a <code>Type</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [definition] :
  /// The type definition, in GraphQL Schema Definition Language (SDL) format.
  ///
  /// For more information, see the <a
  /// href="http://graphql.org/learn/schema/">GraphQL SDL documentation</a>.
  ///
  /// Parameter [format] :
  /// The type format: SDL or JSON.
  Future<CreateTypeResponse> createType({
    @_s.required String apiId,
    @_s.required String definition,
    @_s.required TypeDefinitionFormat format,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(definition, 'definition');
    ArgumentError.checkNotNull(format, 'format');
    final $payload = CreateTypeRequest(
      apiId: apiId,
      definition: definition,
      format: format,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId.toString())}/types',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTypeResponse.fromJson(response);
  }

  /// Deletes an <code>ApiCache</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  Future<void> deleteApiCache({
    @_s.required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $payload = DeleteApiCacheRequest(
      apiId: apiId,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId.toString())}/ApiCaches',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteApiCacheResponse.fromJson(response);
  }

  /// Deletes an API key.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [id] :
  /// The ID for the API key.
  Future<void> deleteApiKey({
    @_s.required String apiId,
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(id, 'id');
    final $payload = DeleteApiKeyRequest(
      apiId: apiId,
      id: id,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/apikeys/${Uri.encodeComponent(id.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteApiKeyResponse.fromJson(response);
  }

  /// Deletes a <code>DataSource</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [name] :
  /// The name of the data source.
  Future<void> deleteDataSource({
    @_s.required String apiId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    final $payload = DeleteDataSourceRequest(
      apiId: apiId,
      name: name,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/datasources/${Uri.encodeComponent(name.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataSourceResponse.fromJson(response);
  }

  /// Deletes a <code>Function</code>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The GraphQL API ID.
  ///
  /// Parameter [functionId] :
  /// The <code>Function</code> ID.
  Future<void> deleteFunction({
    @_s.required String apiId,
    @_s.required String functionId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(functionId, 'functionId');
    _s.validateStringLength(
      'functionId',
      functionId,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionId',
      functionId,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    final $payload = DeleteFunctionRequest(
      apiId: apiId,
      functionId: functionId,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/functions/${Uri.encodeComponent(functionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFunctionResponse.fromJson(response);
  }

  /// Deletes a <code>GraphqlApi</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  Future<void> deleteGraphqlApi({
    @_s.required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $payload = DeleteGraphqlApiRequest(
      apiId: apiId,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGraphqlApiResponse.fromJson(response);
  }

  /// Deletes a <code>Resolver</code> object.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [fieldName] :
  /// The resolver field name.
  ///
  /// Parameter [typeName] :
  /// The name of the resolver type.
  Future<void> deleteResolver({
    @_s.required String apiId,
    @_s.required String fieldName,
    @_s.required String typeName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(fieldName, 'fieldName');
    _s.validateStringLength(
      'fieldName',
      fieldName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fieldName',
      fieldName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    final $payload = DeleteResolverRequest(
      apiId: apiId,
      fieldName: fieldName,
      typeName: typeName,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/types/${Uri.encodeComponent(typeName.toString())}/resolvers/${Uri.encodeComponent(fieldName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResolverResponse.fromJson(response);
  }

  /// Deletes a <code>Type</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [typeName] :
  /// The type name.
  Future<void> deleteType({
    @_s.required String apiId,
    @_s.required String typeName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    final $payload = DeleteTypeRequest(
      apiId: apiId,
      typeName: typeName,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/types/${Uri.encodeComponent(typeName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteTypeResponse.fromJson(response);
  }

  /// Flushes an <code>ApiCache</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  Future<void> flushApiCache({
    @_s.required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $payload = FlushApiCacheRequest(
      apiId: apiId,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/FlushCache',
      exceptionFnMap: _exceptionFns,
    );
    return FlushApiCacheResponse.fromJson(response);
  }

  /// Retrieves an <code>ApiCache</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  Future<GetApiCacheResponse> getApiCache({
    @_s.required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId.toString())}/ApiCaches',
      exceptionFnMap: _exceptionFns,
    );
    return GetApiCacheResponse.fromJson(response);
  }

  /// Retrieves a <code>DataSource</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [name] :
  /// The name of the data source.
  Future<GetDataSourceResponse> getDataSource({
    @_s.required String apiId,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/datasources/${Uri.encodeComponent(name.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataSourceResponse.fromJson(response);
  }

  /// Get a <code>Function</code>.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [apiId] :
  /// The GraphQL API ID.
  ///
  /// Parameter [functionId] :
  /// The <code>Function</code> ID.
  Future<GetFunctionResponse> getFunction({
    @_s.required String apiId,
    @_s.required String functionId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(functionId, 'functionId');
    _s.validateStringLength(
      'functionId',
      functionId,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionId',
      functionId,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/functions/${Uri.encodeComponent(functionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionResponse.fromJson(response);
  }

  /// Retrieves a <code>GraphqlApi</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [apiId] :
  /// The API ID for the GraphQL API.
  Future<GetGraphqlApiResponse> getGraphqlApi({
    @_s.required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetGraphqlApiResponse.fromJson(response);
  }

  /// Retrieves the introspection schema for a GraphQL API.
  ///
  /// May throw [GraphQLSchemaException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [format] :
  /// The schema format: SDL or JSON.
  ///
  /// Parameter [includeDirectives] :
  /// A flag that specifies whether the schema introspection should contain
  /// directives.
  Future<GetIntrospectionSchemaResponse> getIntrospectionSchema({
    @_s.required String apiId,
    @_s.required OutputType format,
    bool includeDirectives,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(format, 'format');
    var _query = '';
    _query = '?${[
      if (format != null) _s.toQueryParam('format', format),
      if (includeDirectives != null)
        _s.toQueryParam('includeDirectives', includeDirectives),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/schema$_query',
      exceptionFnMap: _exceptionFns,
    );
    return GetIntrospectionSchemaResponse.fromJson(
        {...response, 'schema': response});
  }

  /// Retrieves a <code>Resolver</code> object.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [fieldName] :
  /// The resolver field name.
  ///
  /// Parameter [typeName] :
  /// The resolver type name.
  Future<GetResolverResponse> getResolver({
    @_s.required String apiId,
    @_s.required String fieldName,
    @_s.required String typeName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(fieldName, 'fieldName');
    _s.validateStringLength(
      'fieldName',
      fieldName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fieldName',
      fieldName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/types/${Uri.encodeComponent(typeName.toString())}/resolvers/${Uri.encodeComponent(fieldName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResolverResponse.fromJson(response);
  }

  /// Retrieves the current status of a schema creation operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  Future<GetSchemaCreationStatusResponse> getSchemaCreationStatus({
    @_s.required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/schemacreation',
      exceptionFnMap: _exceptionFns,
    );
    return GetSchemaCreationStatusResponse.fromJson(response);
  }

  /// Retrieves a <code>Type</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [format] :
  /// The type format: SDL or JSON.
  ///
  /// Parameter [typeName] :
  /// The type name.
  Future<GetTypeResponse> getType({
    @_s.required String apiId,
    @_s.required TypeDefinitionFormat format,
    @_s.required String typeName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    var _query = '';
    _query = '?${[
      if (format != null) _s.toQueryParam('format', format),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/types/${Uri.encodeComponent(typeName.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return GetTypeResponse.fromJson(response);
  }

  /// Lists the API keys for a given API.
  /// <note>
  /// API keys are deleted automatically sometime after they expire. However,
  /// they may still be included in the response until they have actually been
  /// deleted. You can safely call <code>DeleteApiKey</code> to manually delete
  /// a key before it's automatically deleted.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results you want the request to return.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListApiKeysResponse> listApiKeys({
    @_s.required String apiId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65536,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\\S]+''',
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/apikeys$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListApiKeysResponse.fromJson(response);
  }

  /// Lists the data sources for a given API.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results you want the request to return.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListDataSourcesResponse> listDataSources({
    @_s.required String apiId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65536,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\\S]+''',
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/datasources$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSourcesResponse.fromJson(response);
  }

  /// List multiple functions.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The GraphQL API ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results you want the request to return.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListFunctionsResponse> listFunctions({
    @_s.required String apiId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65536,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\\S]+''',
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/functions$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionsResponse.fromJson(response);
  }

  /// Lists your GraphQL APIs.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results you want the request to return.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListGraphqlApisResponse> listGraphqlApis({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65536,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\\S]+''',
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListGraphqlApisResponse.fromJson(response);
  }

  /// Lists the resolvers for a given API and type.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [typeName] :
  /// The type name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results you want the request to return.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListResolversResponse> listResolvers({
    @_s.required String apiId,
    @_s.required String typeName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65536,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\\S]+''',
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/types/${Uri.encodeComponent(typeName.toString())}/resolvers$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListResolversResponse.fromJson(response);
  }

  /// List the resolvers that are associated with a specific function.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [functionId] :
  /// The Function ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results you want the request to return.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which you can use to return the next set of items in the list.
  Future<ListResolversByFunctionResponse> listResolversByFunction({
    @_s.required String apiId,
    @_s.required String functionId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(functionId, 'functionId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65536,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\\S]+''',
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/functions/${Uri.encodeComponent(functionId.toString())}/resolvers$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListResolversByFunctionResponse.fromJson(response);
  }

  /// Lists the tags for a resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The <code>GraphqlApi</code> ARN.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      70,
      75,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:appsync:[A-Za-z0-9_/.-]{0,63}:\d{12}:apis/[0-9A-Za-z_-]{26}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists the types for a given API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [format] :
  /// The type format: SDL or JSON.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results you want the request to return.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListTypesResponse> listTypes({
    @_s.required String apiId,
    @_s.required TypeDefinitionFormat format,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(format, 'format');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65536,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\\S]+''',
    );
    var _query = '';
    _query = '?${[
      if (format != null) _s.toQueryParam('format', format),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/types$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListTypesResponse.fromJson(response);
  }

  /// Adds a new schema to your GraphQL API.
  ///
  /// This operation is asynchronous. Use to determine when it has completed.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [definition] :
  /// The schema definition, in GraphQL schema language format.
  Future<StartSchemaCreationResponse> startSchemaCreation({
    @_s.required String apiId,
    @_s.required Uint8List definition,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(definition, 'definition');
    final $payload = StartSchemaCreationRequest(
      apiId: apiId,
      definition: definition,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/schemacreation',
      exceptionFnMap: _exceptionFns,
    );
    return StartSchemaCreationResponse.fromJson(response);
  }

  /// Tags a resource with user-supplied tags.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The <code>GraphqlApi</code> ARN.
  ///
  /// Parameter [tags] :
  /// A <code>TagMap</code> object.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      70,
      75,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:appsync:[A-Za-z0-9_/.-]{0,63}:\d{12}:apis/[0-9A-Za-z_-]{26}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = TagResourceRequest(
      resourceArn: resourceArn,
      tags: tags,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Untags a resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The <code>GraphqlApi</code> ARN.
  ///
  /// Parameter [tagKeys] :
  /// A list of <code>TagKey</code> objects.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      70,
      75,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:appsync:[A-Za-z0-9_/.-]{0,63}:\d{12}:apis/[0-9A-Za-z_-]{26}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    var _query = '';
    _query = '?${[
      if (tagKeys != null) _s.toQueryParam('tagKeys', tagKeys),
    ].where((e) => e != null).join('&')}';
    final $payload = UntagResourceRequest(
      resourceArn: resourceArn,
      tagKeys: tagKeys,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/tags/${Uri.encodeComponent(resourceArn.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Updates the cache for the GraphQL API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiCachingBehavior] :
  /// Caching behavior.
  ///
  /// <ul>
  /// <li>
  /// <b>FULL_REQUEST_CACHING</b>: All requests are fully cached.
  /// </li>
  /// <li>
  /// <b>PER_RESOLVER_CACHING</b>: Individual resovlers that you specify are
  /// cached.
  /// </li>
  /// </ul>
  ///
  /// Parameter [apiId] :
  /// The GraphQL API Id.
  ///
  /// Parameter [ttl] :
  /// TTL in seconds for cache entries.
  ///
  /// Valid values are between 1 and 3600 seconds.
  ///
  /// Parameter [type] :
  /// The cache instance type.
  ///
  /// <ul>
  /// <li>
  /// <b>T2_SMALL</b>: A t2.small instance type.
  /// </li>
  /// <li>
  /// <b>T2_MEDIUM</b>: A t2.medium instance type.
  /// </li>
  /// <li>
  /// <b>R4_LARGE</b>: A r4.large instance type.
  /// </li>
  /// <li>
  /// <b>R4_XLARGE</b>: A r4.xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_2XLARGE</b>: A r4.2xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_4XLARGE</b>: A r4.4xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_8XLARGE</b>: A r4.8xlarge instance type.
  /// </li>
  /// </ul>
  Future<UpdateApiCacheResponse> updateApiCache({
    @_s.required ApiCachingBehavior apiCachingBehavior,
    @_s.required String apiId,
    @_s.required int ttl,
    @_s.required ApiCacheType type,
  }) async {
    ArgumentError.checkNotNull(apiCachingBehavior, 'apiCachingBehavior');
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(ttl, 'ttl');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = UpdateApiCacheRequest(
      apiCachingBehavior: apiCachingBehavior,
      apiId: apiId,
      ttl: ttl,
      type: type,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/ApiCaches/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApiCacheResponse.fromJson(response);
  }

  /// Updates an API key.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ApiKeyValidityOutOfBoundsException].
  ///
  /// Parameter [apiId] :
  /// The ID for the GraphQL API.
  ///
  /// Parameter [id] :
  /// The API key ID.
  ///
  /// Parameter [description] :
  /// A description of the purpose of the API key.
  ///
  /// Parameter [expires] :
  /// The time from update time after which the API key expires. The date is
  /// represented as seconds since the epoch. For more information, see .
  Future<UpdateApiKeyResponse> updateApiKey({
    @_s.required String apiId,
    @_s.required String id,
    String description,
    int expires,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(id, 'id');
    final $payload = UpdateApiKeyRequest(
      apiId: apiId,
      id: id,
      description: description,
      expires: expires,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/apikeys/${Uri.encodeComponent(id.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApiKeyResponse.fromJson(response);
  }

  /// Updates a <code>DataSource</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [name] :
  /// The new name for the data source.
  ///
  /// Parameter [type] :
  /// The new data source type.
  ///
  /// Parameter [description] :
  /// The new description for the data source.
  ///
  /// Parameter [dynamodbConfig] :
  /// The new Amazon DynamoDB configuration.
  ///
  /// Parameter [elasticsearchConfig] :
  /// The new Elasticsearch Service configuration.
  ///
  /// Parameter [httpConfig] :
  /// The new HTTP endpoint configuration.
  ///
  /// Parameter [lambdaConfig] :
  /// The new AWS Lambda configuration.
  ///
  /// Parameter [relationalDatabaseConfig] :
  /// The new relational database configuration.
  ///
  /// Parameter [serviceRoleArn] :
  /// The new service role ARN for the data source.
  Future<UpdateDataSourceResponse> updateDataSource({
    @_s.required String apiId,
    @_s.required String name,
    @_s.required DataSourceType type,
    String description,
    DynamodbDataSourceConfig dynamodbConfig,
    ElasticsearchDataSourceConfig elasticsearchConfig,
    HttpDataSourceConfig httpConfig,
    LambdaDataSourceConfig lambdaConfig,
    RelationalDatabaseDataSourceConfig relationalDatabaseConfig,
    String serviceRoleArn,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final $payload = UpdateDataSourceRequest(
      apiId: apiId,
      name: name,
      type: type,
      description: description,
      dynamodbConfig: dynamodbConfig,
      elasticsearchConfig: elasticsearchConfig,
      httpConfig: httpConfig,
      lambdaConfig: lambdaConfig,
      relationalDatabaseConfig: relationalDatabaseConfig,
      serviceRoleArn: serviceRoleArn,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/datasources/${Uri.encodeComponent(name.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataSourceResponse.fromJson(response);
  }

  /// Updates a <code>Function</code> object.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The GraphQL API ID.
  ///
  /// Parameter [dataSourceName] :
  /// The <code>Function</code> <code>DataSource</code> name.
  ///
  /// Parameter [functionId] :
  /// The function ID.
  ///
  /// Parameter [functionVersion] :
  /// The <code>version</code> of the request mapping template. Currently the
  /// supported value is 2018-05-29.
  ///
  /// Parameter [name] :
  /// The <code>Function</code> name.
  ///
  /// Parameter [requestMappingTemplate] :
  /// The <code>Function</code> request mapping template. Functions support only
  /// the 2018-05-29 version of the request mapping template.
  ///
  /// Parameter [description] :
  /// The <code>Function</code> description.
  ///
  /// Parameter [responseMappingTemplate] :
  /// The <code>Function</code> request mapping template.
  Future<UpdateFunctionResponse> updateFunction({
    @_s.required String apiId,
    @_s.required String dataSourceName,
    @_s.required String functionId,
    @_s.required String functionVersion,
    @_s.required String name,
    @_s.required String requestMappingTemplate,
    String description,
    String responseMappingTemplate,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(dataSourceName, 'dataSourceName');
    _s.validateStringLength(
      'dataSourceName',
      dataSourceName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataSourceName',
      dataSourceName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(functionId, 'functionId');
    _s.validateStringLength(
      'functionId',
      functionId,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionId',
      functionId,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(functionVersion, 'functionVersion');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        requestMappingTemplate, 'requestMappingTemplate');
    _s.validateStringLength(
      'requestMappingTemplate',
      requestMappingTemplate,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringLength(
      'responseMappingTemplate',
      responseMappingTemplate,
      1,
      65536,
    );
    final $payload = UpdateFunctionRequest(
      apiId: apiId,
      dataSourceName: dataSourceName,
      functionId: functionId,
      functionVersion: functionVersion,
      name: name,
      requestMappingTemplate: requestMappingTemplate,
      description: description,
      responseMappingTemplate: responseMappingTemplate,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/functions/${Uri.encodeComponent(functionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFunctionResponse.fromJson(response);
  }

  /// Updates a <code>GraphqlApi</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [name] :
  /// The new name for the <code>GraphqlApi</code> object.
  ///
  /// Parameter [additionalAuthenticationProviders] :
  /// A list of additional authentication providers for the
  /// <code>GraphqlApi</code> API.
  ///
  /// Parameter [authenticationType] :
  /// The new authentication type for the <code>GraphqlApi</code> object.
  ///
  /// Parameter [logConfig] :
  /// The Amazon CloudWatch Logs configuration for the <code>GraphqlApi</code>
  /// object.
  ///
  /// Parameter [openIDConnectConfig] :
  /// The OpenID Connect configuration for the <code>GraphqlApi</code> object.
  ///
  /// Parameter [userPoolConfig] :
  /// The new Amazon Cognito user pool configuration for the
  /// <code>GraphqlApi</code> object.
  ///
  /// Parameter [xrayEnabled] :
  /// A flag indicating whether to enable X-Ray tracing for the
  /// <code>GraphqlApi</code>.
  Future<UpdateGraphqlApiResponse> updateGraphqlApi({
    @_s.required String apiId,
    @_s.required String name,
    List<AdditionalAuthenticationProvider> additionalAuthenticationProviders,
    AuthenticationType authenticationType,
    LogConfig logConfig,
    OpenIDConnectConfig openIDConnectConfig,
    UserPoolConfig userPoolConfig,
    bool xrayEnabled,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = UpdateGraphqlApiRequest(
      apiId: apiId,
      name: name,
      additionalAuthenticationProviders: additionalAuthenticationProviders,
      authenticationType: authenticationType,
      logConfig: logConfig,
      openIDConnectConfig: openIDConnectConfig,
      userPoolConfig: userPoolConfig,
      xrayEnabled: xrayEnabled,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGraphqlApiResponse.fromJson(response);
  }

  /// Updates a <code>Resolver</code> object.
  ///
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [fieldName] :
  /// The new field name.
  ///
  /// Parameter [requestMappingTemplate] :
  /// The new request mapping template.
  ///
  /// Parameter [typeName] :
  /// The new type name.
  ///
  /// Parameter [cachingConfig] :
  /// The caching configuration for the resolver.
  ///
  /// Parameter [dataSourceName] :
  /// The new data source name.
  ///
  /// Parameter [kind] :
  /// The resolver type.
  ///
  /// <ul>
  /// <li>
  /// <b>UNIT</b>: A UNIT resolver type. A UNIT resolver is the default resolver
  /// type. A UNIT resolver enables you to execute a GraphQL query against a
  /// single data source.
  /// </li>
  /// <li>
  /// <b>PIPELINE</b>: A PIPELINE resolver type. A PIPELINE resolver enables you
  /// to execute a series of <code>Function</code> in a serial manner. You can
  /// use a pipeline resolver to execute a GraphQL query against multiple data
  /// sources.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pipelineConfig] :
  /// The <code>PipelineConfig</code>.
  ///
  /// Parameter [responseMappingTemplate] :
  /// The new response mapping template.
  ///
  /// Parameter [syncConfig] :
  /// The <code>SyncConfig</code> for a resolver attached to a versioned
  /// datasource.
  Future<UpdateResolverResponse> updateResolver({
    @_s.required String apiId,
    @_s.required String fieldName,
    @_s.required String requestMappingTemplate,
    @_s.required String typeName,
    CachingConfig cachingConfig,
    String dataSourceName,
    ResolverKind kind,
    PipelineConfig pipelineConfig,
    String responseMappingTemplate,
    SyncConfig syncConfig,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(fieldName, 'fieldName');
    _s.validateStringLength(
      'fieldName',
      fieldName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fieldName',
      fieldName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        requestMappingTemplate, 'requestMappingTemplate');
    _s.validateStringLength(
      'requestMappingTemplate',
      requestMappingTemplate,
      1,
      65536,
      isRequired: true,
    );
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'dataSourceName',
      dataSourceName,
      1,
      65536,
    );
    _s.validateStringPattern(
      'dataSourceName',
      dataSourceName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
    );
    _s.validateStringLength(
      'responseMappingTemplate',
      responseMappingTemplate,
      1,
      65536,
    );
    final $payload = UpdateResolverRequest(
      apiId: apiId,
      fieldName: fieldName,
      requestMappingTemplate: requestMappingTemplate,
      typeName: typeName,
      cachingConfig: cachingConfig,
      dataSourceName: dataSourceName,
      kind: kind,
      pipelineConfig: pipelineConfig,
      responseMappingTemplate: responseMappingTemplate,
      syncConfig: syncConfig,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/types/${Uri.encodeComponent(typeName.toString())}/resolvers/${Uri.encodeComponent(fieldName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResolverResponse.fromJson(response);
  }

  /// Updates a <code>Type</code> object.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConcurrentModificationException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [apiId] :
  /// The API ID.
  ///
  /// Parameter [format] :
  /// The new type format: SDL or JSON.
  ///
  /// Parameter [typeName] :
  /// The new type name.
  ///
  /// Parameter [definition] :
  /// The new definition.
  Future<UpdateTypeResponse> updateType({
    @_s.required String apiId,
    @_s.required TypeDefinitionFormat format,
    @_s.required String typeName,
    String definition,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringPattern(
      'typeName',
      typeName,
      r'''[_A-Za-z][_0-9A-Za-z]*''',
      isRequired: true,
    );
    final $payload = UpdateTypeRequest(
      apiId: apiId,
      format: format,
      typeName: typeName,
      definition: definition,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId.toString())}/types/${Uri.encodeComponent(typeName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTypeResponse.fromJson(response);
  }
}

/// Describes an additional authentication provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AdditionalAuthenticationProvider {
  /// The authentication type: API key, AWS IAM, OIDC, or Amazon Cognito user
  /// pools.
  @_s.JsonKey(name: 'authenticationType')
  final AuthenticationType authenticationType;

  /// The OpenID Connect configuration.
  @_s.JsonKey(name: 'openIDConnectConfig')
  final OpenIDConnectConfig openIDConnectConfig;

  /// The Amazon Cognito user pool configuration.
  @_s.JsonKey(name: 'userPoolConfig')
  final CognitoUserPoolConfig userPoolConfig;

  AdditionalAuthenticationProvider({
    this.authenticationType,
    this.openIDConnectConfig,
    this.userPoolConfig,
  });
  factory AdditionalAuthenticationProvider.fromJson(
          Map<String, dynamic> json) =>
      _$AdditionalAuthenticationProviderFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AdditionalAuthenticationProviderToJson(this);
}

/// The <code>ApiCache</code> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApiCache {
  /// Caching behavior.
  ///
  /// <ul>
  /// <li>
  /// <b>FULL_REQUEST_CACHING</b>: All requests are fully cached.
  /// </li>
  /// <li>
  /// <b>PER_RESOLVER_CACHING</b>: Individual resovlers that you specify are
  /// cached.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'apiCachingBehavior')
  final ApiCachingBehavior apiCachingBehavior;

  /// At rest encryption flag for cache. This setting cannot be updated after
  /// creation.
  @_s.JsonKey(name: 'atRestEncryptionEnabled')
  final bool atRestEncryptionEnabled;

  /// The cache instance status.
  ///
  /// <ul>
  /// <li>
  /// <b>AVAILABLE</b>: The instance is available for use.
  /// </li>
  /// <li>
  /// <b>CREATING</b>: The instance is currently creating.
  /// </li>
  /// <li>
  /// <b>DELETING</b>: The instance is currently deleting.
  /// </li>
  /// <li>
  /// <b>MODIFYING</b>: The instance is currently modifying.
  /// </li>
  /// <li>
  /// <b>FAILED</b>: The instance has failed creation.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final ApiCacheStatus status;

  /// Transit encryption flag when connecting to cache. This setting cannot be
  /// updated after creation.
  @_s.JsonKey(name: 'transitEncryptionEnabled')
  final bool transitEncryptionEnabled;

  /// TTL in seconds for cache entries.
  ///
  /// Valid values are between 1 and 3600 seconds.
  @_s.JsonKey(name: 'ttl')
  final int ttl;

  /// The cache instance type.
  ///
  /// <ul>
  /// <li>
  /// <b>T2_SMALL</b>: A t2.small instance type.
  /// </li>
  /// <li>
  /// <b>T2_MEDIUM</b>: A t2.medium instance type.
  /// </li>
  /// <li>
  /// <b>R4_LARGE</b>: A r4.large instance type.
  /// </li>
  /// <li>
  /// <b>R4_XLARGE</b>: A r4.xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_2XLARGE</b>: A r4.2xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_4XLARGE</b>: A r4.4xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_8XLARGE</b>: A r4.8xlarge instance type.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'type')
  final ApiCacheType type;

  ApiCache({
    this.apiCachingBehavior,
    this.atRestEncryptionEnabled,
    this.status,
    this.transitEncryptionEnabled,
    this.ttl,
    this.type,
  });
  factory ApiCache.fromJson(Map<String, dynamic> json) =>
      _$ApiCacheFromJson(json);
}

enum ApiCacheStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('MODIFYING')
  modifying,
  @_s.JsonValue('FAILED')
  failed,
}

enum ApiCacheType {
  @_s.JsonValue('T2_SMALL')
  t2Small,
  @_s.JsonValue('T2_MEDIUM')
  t2Medium,
  @_s.JsonValue('R4_LARGE')
  r4Large,
  @_s.JsonValue('R4_XLARGE')
  r4Xlarge,
  @_s.JsonValue('R4_2XLARGE')
  r4_2xlarge,
  @_s.JsonValue('R4_4XLARGE')
  r4_4xlarge,
  @_s.JsonValue('R4_8XLARGE')
  r4_8xlarge,
}

enum ApiCachingBehavior {
  @_s.JsonValue('FULL_REQUEST_CACHING')
  fullRequestCaching,
  @_s.JsonValue('PER_RESOLVER_CACHING')
  perResolverCaching,
}

/// Describes an API key.
///
/// Customers invoke AWS AppSync GraphQL API operations with API keys as an
/// identity mechanism. There are two key versions:
///
/// <b>da1</b>: This version was introduced at launch in November 2017. These
/// keys always expire after 7 days. Key expiration is managed by Amazon
/// DynamoDB TTL. The keys ceased to be valid after February 21, 2018 and should
/// not be used after that date.
///
/// <ul>
/// <li>
/// <code>ListApiKeys</code> returns the expiration time in milliseconds.
/// </li>
/// <li>
/// <code>CreateApiKey</code> returns the expiration time in milliseconds.
/// </li>
/// <li>
/// <code>UpdateApiKey</code> is not available for this key version.
/// </li>
/// <li>
/// <code>DeleteApiKey</code> deletes the item from the table.
/// </li>
/// <li>
/// Expiration is stored in Amazon DynamoDB as milliseconds. This results in a
/// bug where keys are not automatically deleted because DynamoDB expects the
/// TTL to be stored in seconds. As a one-time action, we will delete these keys
/// from the table after February 21, 2018.
/// </li>
/// </ul>
/// <b>da2</b>: This version was introduced in February 2018 when AppSync added
/// support to extend key expiration.
///
/// <ul>
/// <li>
/// <code>ListApiKeys</code> returns the expiration time in seconds.
/// </li>
/// <li>
/// <code>CreateApiKey</code> returns the expiration time in seconds and accepts
/// a user-provided expiration time in seconds.
/// </li>
/// <li>
/// <code>UpdateApiKey</code> returns the expiration time in seconds and accepts
/// a user-provided expiration time in seconds. Key expiration can only be
/// updated while the key has not expired.
/// </li>
/// <li>
/// <code>DeleteApiKey</code> deletes the item from the table.
/// </li>
/// <li>
/// Expiration is stored in Amazon DynamoDB as seconds.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApiKey {
  /// A description of the purpose of the API key.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The time after which the API key expires. The date is represented as seconds
  /// since the epoch, rounded down to the nearest hour.
  @_s.JsonKey(name: 'expires')
  final int expires;

  /// The API key ID.
  @_s.JsonKey(name: 'id')
  final String id;

  ApiKey({
    this.description,
    this.expires,
    this.id,
  });
  factory ApiKey.fromJson(Map<String, dynamic> json) => _$ApiKeyFromJson(json);
}

enum AuthenticationType {
  @_s.JsonValue('API_KEY')
  apiKey,
  @_s.JsonValue('AWS_IAM')
  awsIam,
  @_s.JsonValue('AMAZON_COGNITO_USER_POOLS')
  amazonCognitoUserPools,
  @_s.JsonValue('OPENID_CONNECT')
  openidConnect,
}

/// The authorization config in case the HTTP endpoint requires authorization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AuthorizationConfig {
  /// The authorization type required by the HTTP endpoint.
  ///
  /// <ul>
  /// <li>
  /// <b>AWS_IAM</b>: The authorization type is Sigv4.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'authorizationType')
  final AuthorizationType authorizationType;

  /// The AWS IAM settings.
  @_s.JsonKey(name: 'awsIamConfig')
  final AwsIamConfig awsIamConfig;

  AuthorizationConfig({
    @_s.required this.authorizationType,
    this.awsIamConfig,
  });
  factory AuthorizationConfig.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationConfigToJson(this);
}

enum AuthorizationType {
  @_s.JsonValue('AWS_IAM')
  awsIam,
}

/// The AWS IAM configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsIamConfig {
  /// The signing region for AWS IAM authorization.
  @_s.JsonKey(name: 'signingRegion')
  final String signingRegion;

  /// The signing service name for AWS IAM authorization.
  @_s.JsonKey(name: 'signingServiceName')
  final String signingServiceName;

  AwsIamConfig({
    this.signingRegion,
    this.signingServiceName,
  });
  factory AwsIamConfig.fromJson(Map<String, dynamic> json) =>
      _$AwsIamConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AwsIamConfigToJson(this);
}

/// The caching configuration for a resolver that has caching enabled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CachingConfig {
  /// The caching keys for a resolver that has caching enabled.
  ///
  /// Valid values are entries from the <code>$context.identity</code> and
  /// <code>$context.arguments</code> maps.
  @_s.JsonKey(name: 'cachingKeys')
  final List<String> cachingKeys;

  /// The TTL in seconds for a resolver that has caching enabled.
  ///
  /// Valid values are between 1 and 3600 seconds.
  @_s.JsonKey(name: 'ttl')
  final int ttl;

  CachingConfig({
    this.cachingKeys,
    this.ttl,
  });
  factory CachingConfig.fromJson(Map<String, dynamic> json) =>
      _$CachingConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CachingConfigToJson(this);
}

/// Describes an Amazon Cognito user pool configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CognitoUserPoolConfig {
  /// The AWS Region in which the user pool was created.
  @_s.JsonKey(name: 'awsRegion')
  final String awsRegion;

  /// The user pool ID.
  @_s.JsonKey(name: 'userPoolId')
  final String userPoolId;

  /// A regular expression for validating the incoming Amazon Cognito user pool
  /// app client ID.
  @_s.JsonKey(name: 'appIdClientRegex')
  final String appIdClientRegex;

  CognitoUserPoolConfig({
    @_s.required this.awsRegion,
    @_s.required this.userPoolId,
    this.appIdClientRegex,
  });
  factory CognitoUserPoolConfig.fromJson(Map<String, dynamic> json) =>
      _$CognitoUserPoolConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CognitoUserPoolConfigToJson(this);
}

enum ConflictDetectionType {
  @_s.JsonValue('VERSION')
  version,
  @_s.JsonValue('NONE')
  none,
}

enum ConflictHandlerType {
  @_s.JsonValue('OPTIMISTIC_CONCURRENCY')
  optimisticConcurrency,
  @_s.JsonValue('LAMBDA')
  lambda,
  @_s.JsonValue('AUTOMERGE')
  automerge,
  @_s.JsonValue('NONE')
  none,
}

/// Represents the input of a <code>CreateApiCache</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateApiCacheRequest {
  /// Caching behavior.
  ///
  /// <ul>
  /// <li>
  /// <b>FULL_REQUEST_CACHING</b>: All requests are fully cached.
  /// </li>
  /// <li>
  /// <b>PER_RESOLVER_CACHING</b>: Individual resovlers that you specify are
  /// cached.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'apiCachingBehavior')
  final ApiCachingBehavior apiCachingBehavior;

  /// The GraphQL API Id.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// TTL in seconds for cache entries.
  ///
  /// Valid values are between 1 and 3600 seconds.
  @_s.JsonKey(name: 'ttl')
  final int ttl;

  /// The cache instance type.
  ///
  /// <ul>
  /// <li>
  /// <b>T2_SMALL</b>: A t2.small instance type.
  /// </li>
  /// <li>
  /// <b>T2_MEDIUM</b>: A t2.medium instance type.
  /// </li>
  /// <li>
  /// <b>R4_LARGE</b>: A r4.large instance type.
  /// </li>
  /// <li>
  /// <b>R4_XLARGE</b>: A r4.xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_2XLARGE</b>: A r4.2xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_4XLARGE</b>: A r4.4xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_8XLARGE</b>: A r4.8xlarge instance type.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'type')
  final ApiCacheType type;

  /// At rest encryption flag for cache. This setting cannot be updated after
  /// creation.
  @_s.JsonKey(name: 'atRestEncryptionEnabled')
  final bool atRestEncryptionEnabled;

  /// Transit encryption flag when connecting to cache. This setting cannot be
  /// updated after creation.
  @_s.JsonKey(name: 'transitEncryptionEnabled')
  final bool transitEncryptionEnabled;

  CreateApiCacheRequest({
    @_s.required this.apiCachingBehavior,
    @_s.required this.apiId,
    @_s.required this.ttl,
    @_s.required this.type,
    this.atRestEncryptionEnabled,
    this.transitEncryptionEnabled,
  });
  Map<String, dynamic> toJson() => _$CreateApiCacheRequestToJson(this);
}

/// Represents the output of a <code>CreateApiCache</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApiCacheResponse {
  /// The <code>ApiCache</code> object.
  @_s.JsonKey(name: 'apiCache')
  final ApiCache apiCache;

  CreateApiCacheResponse({
    this.apiCache,
  });
  factory CreateApiCacheResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateApiCacheResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateApiKeyRequest {
  /// The ID for your GraphQL API.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// A description of the purpose of the API key.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The time from creation time after which the API key expires. The date is
  /// represented as seconds since the epoch, rounded down to the nearest hour.
  /// The default value for this parameter is 7 days from creation time. For more
  /// information, see .
  @_s.JsonKey(name: 'expires')
  final int expires;

  CreateApiKeyRequest({
    @_s.required this.apiId,
    this.description,
    this.expires,
  });
  Map<String, dynamic> toJson() => _$CreateApiKeyRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApiKeyResponse {
  /// The API key.
  @_s.JsonKey(name: 'apiKey')
  final ApiKey apiKey;

  CreateApiKeyResponse({
    this.apiKey,
  });
  factory CreateApiKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateApiKeyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateDataSourceRequest {
  /// The API ID for the GraphQL API for the <code>DataSource</code>.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// A user-supplied name for the <code>DataSource</code>.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of the <code>DataSource</code>.
  @_s.JsonKey(name: 'type')
  final DataSourceType type;

  /// A description of the <code>DataSource</code>.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Amazon DynamoDB settings.
  @_s.JsonKey(name: 'dynamodbConfig')
  final DynamodbDataSourceConfig dynamodbConfig;

  /// Amazon Elasticsearch Service settings.
  @_s.JsonKey(name: 'elasticsearchConfig')
  final ElasticsearchDataSourceConfig elasticsearchConfig;

  /// HTTP endpoint settings.
  @_s.JsonKey(name: 'httpConfig')
  final HttpDataSourceConfig httpConfig;

  /// AWS Lambda settings.
  @_s.JsonKey(name: 'lambdaConfig')
  final LambdaDataSourceConfig lambdaConfig;

  /// Relational database settings.
  @_s.JsonKey(name: 'relationalDatabaseConfig')
  final RelationalDatabaseDataSourceConfig relationalDatabaseConfig;

  /// The AWS IAM service role ARN for the data source. The system assumes this
  /// role when accessing the data source.
  @_s.JsonKey(name: 'serviceRoleArn')
  final String serviceRoleArn;

  CreateDataSourceRequest({
    @_s.required this.apiId,
    @_s.required this.name,
    @_s.required this.type,
    this.description,
    this.dynamodbConfig,
    this.elasticsearchConfig,
    this.httpConfig,
    this.lambdaConfig,
    this.relationalDatabaseConfig,
    this.serviceRoleArn,
  });
  Map<String, dynamic> toJson() => _$CreateDataSourceRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDataSourceResponse {
  /// The <code>DataSource</code> object.
  @_s.JsonKey(name: 'dataSource')
  final DataSource dataSource;

  CreateDataSourceResponse({
    this.dataSource,
  });
  factory CreateDataSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateFunctionRequest {
  /// The GraphQL API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The <code>Function</code> <code>DataSource</code> name.
  @_s.JsonKey(name: 'dataSourceName')
  final String dataSourceName;

  /// The <code>version</code> of the request mapping template. Currently the
  /// supported value is 2018-05-29.
  @_s.JsonKey(name: 'functionVersion')
  final String functionVersion;

  /// The <code>Function</code> name. The function name does not have to be
  /// unique.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The <code>Function</code> request mapping template. Functions support only
  /// the 2018-05-29 version of the request mapping template.
  @_s.JsonKey(name: 'requestMappingTemplate')
  final String requestMappingTemplate;

  /// The <code>Function</code> description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The <code>Function</code> response mapping template.
  @_s.JsonKey(name: 'responseMappingTemplate')
  final String responseMappingTemplate;

  CreateFunctionRequest({
    @_s.required this.apiId,
    @_s.required this.dataSourceName,
    @_s.required this.functionVersion,
    @_s.required this.name,
    @_s.required this.requestMappingTemplate,
    this.description,
    this.responseMappingTemplate,
  });
  Map<String, dynamic> toJson() => _$CreateFunctionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFunctionResponse {
  /// The <code>Function</code> object.
  @_s.JsonKey(name: 'functionConfiguration')
  final FunctionConfiguration functionConfiguration;

  CreateFunctionResponse({
    this.functionConfiguration,
  });
  factory CreateFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFunctionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateGraphqlApiRequest {
  /// The authentication type: API key, AWS IAM, OIDC, or Amazon Cognito user
  /// pools.
  @_s.JsonKey(name: 'authenticationType')
  final AuthenticationType authenticationType;

  /// A user-supplied name for the <code>GraphqlApi</code>.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of additional authentication providers for the
  /// <code>GraphqlApi</code> API.
  @_s.JsonKey(name: 'additionalAuthenticationProviders')
  final List<AdditionalAuthenticationProvider>
      additionalAuthenticationProviders;

  /// The Amazon CloudWatch Logs configuration.
  @_s.JsonKey(name: 'logConfig')
  final LogConfig logConfig;

  /// The OpenID Connect configuration.
  @_s.JsonKey(name: 'openIDConnectConfig')
  final OpenIDConnectConfig openIDConnectConfig;

  /// A <code>TagMap</code> object.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The Amazon Cognito user pool configuration.
  @_s.JsonKey(name: 'userPoolConfig')
  final UserPoolConfig userPoolConfig;

  /// A flag indicating whether to enable X-Ray tracing for the
  /// <code>GraphqlApi</code>.
  @_s.JsonKey(name: 'xrayEnabled')
  final bool xrayEnabled;

  CreateGraphqlApiRequest({
    @_s.required this.authenticationType,
    @_s.required this.name,
    this.additionalAuthenticationProviders,
    this.logConfig,
    this.openIDConnectConfig,
    this.tags,
    this.userPoolConfig,
    this.xrayEnabled,
  });
  Map<String, dynamic> toJson() => _$CreateGraphqlApiRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGraphqlApiResponse {
  /// The <code>GraphqlApi</code>.
  @_s.JsonKey(name: 'graphqlApi')
  final GraphqlApi graphqlApi;

  CreateGraphqlApiResponse({
    this.graphqlApi,
  });
  factory CreateGraphqlApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGraphqlApiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateResolverRequest {
  /// The ID for the GraphQL API for which the resolver is being created.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The name of the field to attach the resolver to.
  @_s.JsonKey(name: 'fieldName')
  final String fieldName;

  /// The mapping template to be used for requests.
  ///
  /// A resolver uses a request mapping template to convert a GraphQL expression
  /// into a format that a data source can understand. Mapping templates are
  /// written in Apache Velocity Template Language (VTL).
  @_s.JsonKey(name: 'requestMappingTemplate')
  final String requestMappingTemplate;

  /// The name of the <code>Type</code>.
  @_s.JsonKey(name: 'typeName', ignore: true)
  final String typeName;

  /// The caching configuration for the resolver.
  @_s.JsonKey(name: 'cachingConfig')
  final CachingConfig cachingConfig;

  /// The name of the data source for which the resolver is being created.
  @_s.JsonKey(name: 'dataSourceName')
  final String dataSourceName;

  /// The resolver type.
  ///
  /// <ul>
  /// <li>
  /// <b>UNIT</b>: A UNIT resolver type. A UNIT resolver is the default resolver
  /// type. A UNIT resolver enables you to execute a GraphQL query against a
  /// single data source.
  /// </li>
  /// <li>
  /// <b>PIPELINE</b>: A PIPELINE resolver type. A PIPELINE resolver enables you
  /// to execute a series of <code>Function</code> in a serial manner. You can use
  /// a pipeline resolver to execute a GraphQL query against multiple data
  /// sources.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'kind')
  final ResolverKind kind;

  /// The <code>PipelineConfig</code>.
  @_s.JsonKey(name: 'pipelineConfig')
  final PipelineConfig pipelineConfig;

  /// The mapping template to be used for responses from the data source.
  @_s.JsonKey(name: 'responseMappingTemplate')
  final String responseMappingTemplate;

  /// The <code>SyncConfig</code> for a resolver attached to a versioned
  /// datasource.
  @_s.JsonKey(name: 'syncConfig')
  final SyncConfig syncConfig;

  CreateResolverRequest({
    @_s.required this.apiId,
    @_s.required this.fieldName,
    @_s.required this.requestMappingTemplate,
    @_s.required this.typeName,
    this.cachingConfig,
    this.dataSourceName,
    this.kind,
    this.pipelineConfig,
    this.responseMappingTemplate,
    this.syncConfig,
  });
  Map<String, dynamic> toJson() => _$CreateResolverRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateResolverResponse {
  /// The <code>Resolver</code> object.
  @_s.JsonKey(name: 'resolver')
  final Resolver resolver;

  CreateResolverResponse({
    this.resolver,
  });
  factory CreateResolverResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateResolverResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateTypeRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The type definition, in GraphQL Schema Definition Language (SDL) format.
  ///
  /// For more information, see the <a
  /// href="http://graphql.org/learn/schema/">GraphQL SDL documentation</a>.
  @_s.JsonKey(name: 'definition')
  final String definition;

  /// The type format: SDL or JSON.
  @_s.JsonKey(name: 'format')
  final TypeDefinitionFormat format;

  CreateTypeRequest({
    @_s.required this.apiId,
    @_s.required this.definition,
    @_s.required this.format,
  });
  Map<String, dynamic> toJson() => _$CreateTypeRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTypeResponse {
  /// The <code>Type</code> object.
  @_s.JsonKey(name: 'type')
  final Type type;

  CreateTypeResponse({
    this.type,
  });
  factory CreateTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTypeResponseFromJson(json);
}

/// Describes a data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSource {
  /// The data source ARN.
  @_s.JsonKey(name: 'dataSourceArn')
  final String dataSourceArn;

  /// The description of the data source.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Amazon DynamoDB settings.
  @_s.JsonKey(name: 'dynamodbConfig')
  final DynamodbDataSourceConfig dynamodbConfig;

  /// Amazon Elasticsearch Service settings.
  @_s.JsonKey(name: 'elasticsearchConfig')
  final ElasticsearchDataSourceConfig elasticsearchConfig;

  /// HTTP endpoint settings.
  @_s.JsonKey(name: 'httpConfig')
  final HttpDataSourceConfig httpConfig;

  /// AWS Lambda settings.
  @_s.JsonKey(name: 'lambdaConfig')
  final LambdaDataSourceConfig lambdaConfig;

  /// The name of the data source.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Relational database settings.
  @_s.JsonKey(name: 'relationalDatabaseConfig')
  final RelationalDatabaseDataSourceConfig relationalDatabaseConfig;

  /// The AWS IAM service role ARN for the data source. The system assumes this
  /// role when accessing the data source.
  @_s.JsonKey(name: 'serviceRoleArn')
  final String serviceRoleArn;

  /// The type of the data source.
  ///
  /// <ul>
  /// <li>
  /// <b>AMAZON_DYNAMODB</b>: The data source is an Amazon DynamoDB table.
  /// </li>
  /// <li>
  /// <b>AMAZON_ELASTICSEARCH</b>: The data source is an Amazon Elasticsearch
  /// Service domain.
  /// </li>
  /// <li>
  /// <b>AWS_LAMBDA</b>: The data source is an AWS Lambda function.
  /// </li>
  /// <li>
  /// <b>NONE</b>: There is no data source. This type is used when you wish to
  /// invoke a GraphQL operation without connecting to a data source, such as
  /// performing data transformation with resolvers or triggering a subscription
  /// to be invoked from a mutation.
  /// </li>
  /// <li>
  /// <b>HTTP</b>: The data source is an HTTP endpoint.
  /// </li>
  /// <li>
  /// <b>RELATIONAL_DATABASE</b>: The data source is a relational database.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'type')
  final DataSourceType type;

  DataSource({
    this.dataSourceArn,
    this.description,
    this.dynamodbConfig,
    this.elasticsearchConfig,
    this.httpConfig,
    this.lambdaConfig,
    this.name,
    this.relationalDatabaseConfig,
    this.serviceRoleArn,
    this.type,
  });
  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);
}

enum DataSourceType {
  @_s.JsonValue('AWS_LAMBDA')
  awsLambda,
  @_s.JsonValue('AMAZON_DYNAMODB')
  amazonDynamodb,
  @_s.JsonValue('AMAZON_ELASTICSEARCH')
  amazonElasticsearch,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('HTTP')
  http,
  @_s.JsonValue('RELATIONAL_DATABASE')
  relationalDatabase,
}

enum DefaultAction {
  @_s.JsonValue('ALLOW')
  allow,
  @_s.JsonValue('DENY')
  deny,
}

/// Represents the input of a <code>DeleteApiCache</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteApiCacheRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  DeleteApiCacheRequest({
    @_s.required this.apiId,
  });
  Map<String, dynamic> toJson() => _$DeleteApiCacheRequestToJson(this);
}

/// Represents the output of a <code>DeleteApiCache</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApiCacheResponse {
  DeleteApiCacheResponse();
  factory DeleteApiCacheResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteApiCacheResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteApiKeyRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The ID for the API key.
  @_s.JsonKey(name: 'id', ignore: true)
  final String id;

  DeleteApiKeyRequest({
    @_s.required this.apiId,
    @_s.required this.id,
  });
  Map<String, dynamic> toJson() => _$DeleteApiKeyRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApiKeyResponse {
  DeleteApiKeyResponse();
  factory DeleteApiKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteApiKeyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteDataSourceRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The name of the data source.
  @_s.JsonKey(name: 'name', ignore: true)
  final String name;

  DeleteDataSourceRequest({
    @_s.required this.apiId,
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$DeleteDataSourceRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDataSourceResponse {
  DeleteDataSourceResponse();
  factory DeleteDataSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteFunctionRequest {
  /// The GraphQL API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The <code>Function</code> ID.
  @_s.JsonKey(name: 'functionId', ignore: true)
  final String functionId;

  DeleteFunctionRequest({
    @_s.required this.apiId,
    @_s.required this.functionId,
  });
  Map<String, dynamic> toJson() => _$DeleteFunctionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFunctionResponse {
  DeleteFunctionResponse();
  factory DeleteFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFunctionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteGraphqlApiRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  DeleteGraphqlApiRequest({
    @_s.required this.apiId,
  });
  Map<String, dynamic> toJson() => _$DeleteGraphqlApiRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGraphqlApiResponse {
  DeleteGraphqlApiResponse();
  factory DeleteGraphqlApiResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteGraphqlApiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteResolverRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The resolver field name.
  @_s.JsonKey(name: 'fieldName', ignore: true)
  final String fieldName;

  /// The name of the resolver type.
  @_s.JsonKey(name: 'typeName', ignore: true)
  final String typeName;

  DeleteResolverRequest({
    @_s.required this.apiId,
    @_s.required this.fieldName,
    @_s.required this.typeName,
  });
  Map<String, dynamic> toJson() => _$DeleteResolverRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResolverResponse {
  DeleteResolverResponse();
  factory DeleteResolverResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResolverResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteTypeRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The type name.
  @_s.JsonKey(name: 'typeName', ignore: true)
  final String typeName;

  DeleteTypeRequest({
    @_s.required this.apiId,
    @_s.required this.typeName,
  });
  Map<String, dynamic> toJson() => _$DeleteTypeRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTypeResponse {
  DeleteTypeResponse();
  factory DeleteTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTypeResponseFromJson(json);
}

/// Describes a Delta Sync configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeltaSyncConfig {
  /// The number of minutes an Item is stored in the datasource.
  @_s.JsonKey(name: 'baseTableTTL')
  final int baseTableTTL;

  /// The Delta Sync table name.
  @_s.JsonKey(name: 'deltaSyncTableName')
  final String deltaSyncTableName;

  /// The number of minutes a Delta Sync log entry is stored in the Delta Sync
  /// table.
  @_s.JsonKey(name: 'deltaSyncTableTTL')
  final int deltaSyncTableTTL;

  DeltaSyncConfig({
    this.baseTableTTL,
    this.deltaSyncTableName,
    this.deltaSyncTableTTL,
  });
  factory DeltaSyncConfig.fromJson(Map<String, dynamic> json) =>
      _$DeltaSyncConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DeltaSyncConfigToJson(this);
}

/// Describes an Amazon DynamoDB data source configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DynamodbDataSourceConfig {
  /// The AWS Region.
  @_s.JsonKey(name: 'awsRegion')
  final String awsRegion;

  /// The table name.
  @_s.JsonKey(name: 'tableName')
  final String tableName;

  /// The <code>DeltaSyncConfig</code> for a versioned datasource.
  @_s.JsonKey(name: 'deltaSyncConfig')
  final DeltaSyncConfig deltaSyncConfig;

  /// Set to TRUE to use Amazon Cognito credentials with this data source.
  @_s.JsonKey(name: 'useCallerCredentials')
  final bool useCallerCredentials;

  /// Set to TRUE to use Conflict Detection and Resolution with this data source.
  @_s.JsonKey(name: 'versioned')
  final bool versioned;

  DynamodbDataSourceConfig({
    @_s.required this.awsRegion,
    @_s.required this.tableName,
    this.deltaSyncConfig,
    this.useCallerCredentials,
    this.versioned,
  });
  factory DynamodbDataSourceConfig.fromJson(Map<String, dynamic> json) =>
      _$DynamodbDataSourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DynamodbDataSourceConfigToJson(this);
}

/// Describes an Elasticsearch data source configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ElasticsearchDataSourceConfig {
  /// The AWS Region.
  @_s.JsonKey(name: 'awsRegion')
  final String awsRegion;

  /// The endpoint.
  @_s.JsonKey(name: 'endpoint')
  final String endpoint;

  ElasticsearchDataSourceConfig({
    @_s.required this.awsRegion,
    @_s.required this.endpoint,
  });
  factory ElasticsearchDataSourceConfig.fromJson(Map<String, dynamic> json) =>
      _$ElasticsearchDataSourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticsearchDataSourceConfigToJson(this);
}

enum FieldLogLevel {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('ALL')
  all,
}

/// Represents the input of a <code>FlushApiCache</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FlushApiCacheRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  FlushApiCacheRequest({
    @_s.required this.apiId,
  });
  Map<String, dynamic> toJson() => _$FlushApiCacheRequestToJson(this);
}

/// Represents the output of a <code>FlushApiCache</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FlushApiCacheResponse {
  FlushApiCacheResponse();
  factory FlushApiCacheResponse.fromJson(Map<String, dynamic> json) =>
      _$FlushApiCacheResponseFromJson(json);
}

/// A function is a reusable entity. Multiple functions can be used to compose
/// the resolver logic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FunctionConfiguration {
  /// The name of the <code>DataSource</code>.
  @_s.JsonKey(name: 'dataSourceName')
  final String dataSourceName;

  /// The <code>Function</code> description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The ARN of the <code>Function</code> object.
  @_s.JsonKey(name: 'functionArn')
  final String functionArn;

  /// A unique ID representing the <code>Function</code> object.
  @_s.JsonKey(name: 'functionId')
  final String functionId;

  /// The version of the request mapping template. Currently only the 2018-05-29
  /// version of the template is supported.
  @_s.JsonKey(name: 'functionVersion')
  final String functionVersion;

  /// The name of the <code>Function</code> object.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The <code>Function</code> request mapping template. Functions support only
  /// the 2018-05-29 version of the request mapping template.
  @_s.JsonKey(name: 'requestMappingTemplate')
  final String requestMappingTemplate;

  /// The <code>Function</code> response mapping template.
  @_s.JsonKey(name: 'responseMappingTemplate')
  final String responseMappingTemplate;

  FunctionConfiguration({
    this.dataSourceName,
    this.description,
    this.functionArn,
    this.functionId,
    this.functionVersion,
    this.name,
    this.requestMappingTemplate,
    this.responseMappingTemplate,
  });
  factory FunctionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$FunctionConfigurationFromJson(json);
}

/// Represents the output of a <code>GetApiCache</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApiCacheResponse {
  /// The <code>ApiCache</code> object.
  @_s.JsonKey(name: 'apiCache')
  final ApiCache apiCache;

  GetApiCacheResponse({
    this.apiCache,
  });
  factory GetApiCacheResponse.fromJson(Map<String, dynamic> json) =>
      _$GetApiCacheResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDataSourceResponse {
  /// The <code>DataSource</code> object.
  @_s.JsonKey(name: 'dataSource')
  final DataSource dataSource;

  GetDataSourceResponse({
    this.dataSource,
  });
  factory GetDataSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFunctionResponse {
  /// The <code>Function</code> object.
  @_s.JsonKey(name: 'functionConfiguration')
  final FunctionConfiguration functionConfiguration;

  GetFunctionResponse({
    this.functionConfiguration,
  });
  factory GetFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFunctionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGraphqlApiResponse {
  /// The <code>GraphqlApi</code> object.
  @_s.JsonKey(name: 'graphqlApi')
  final GraphqlApi graphqlApi;

  GetGraphqlApiResponse({
    this.graphqlApi,
  });
  factory GetGraphqlApiResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGraphqlApiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIntrospectionSchemaResponse {
  /// The schema, in GraphQL Schema Definition Language (SDL) format.
  ///
  /// For more information, see the <a
  /// href="http://graphql.org/learn/schema/">GraphQL SDL documentation</a>.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'schema')
  final Uint8List schema;

  GetIntrospectionSchemaResponse({
    this.schema,
  });
  factory GetIntrospectionSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIntrospectionSchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResolverResponse {
  /// The <code>Resolver</code> object.
  @_s.JsonKey(name: 'resolver')
  final Resolver resolver;

  GetResolverResponse({
    this.resolver,
  });
  factory GetResolverResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResolverResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSchemaCreationStatusResponse {
  /// Detailed information about the status of the schema creation operation.
  @_s.JsonKey(name: 'details')
  final String details;

  /// The current state of the schema (PROCESSING, FAILED, SUCCESS, or
  /// NOT_APPLICABLE). When the schema is in the ACTIVE state, you can add data.
  @_s.JsonKey(name: 'status')
  final SchemaStatus status;

  GetSchemaCreationStatusResponse({
    this.details,
    this.status,
  });
  factory GetSchemaCreationStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSchemaCreationStatusResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTypeResponse {
  /// The <code>Type</code> object.
  @_s.JsonKey(name: 'type')
  final Type type;

  GetTypeResponse({
    this.type,
  });
  factory GetTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTypeResponseFromJson(json);
}

/// Describes a GraphQL API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GraphqlApi {
  /// A list of additional authentication providers for the
  /// <code>GraphqlApi</code> API.
  @_s.JsonKey(name: 'additionalAuthenticationProviders')
  final List<AdditionalAuthenticationProvider>
      additionalAuthenticationProviders;

  /// The API ID.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// The ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The authentication type.
  @_s.JsonKey(name: 'authenticationType')
  final AuthenticationType authenticationType;

  /// The Amazon CloudWatch Logs configuration.
  @_s.JsonKey(name: 'logConfig')
  final LogConfig logConfig;

  /// The API name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The OpenID Connect configuration.
  @_s.JsonKey(name: 'openIDConnectConfig')
  final OpenIDConnectConfig openIDConnectConfig;

  /// The tags.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The URIs.
  @_s.JsonKey(name: 'uris')
  final Map<String, String> uris;

  /// The Amazon Cognito user pool configuration.
  @_s.JsonKey(name: 'userPoolConfig')
  final UserPoolConfig userPoolConfig;

  /// A flag representing whether X-Ray tracing is enabled for this
  /// <code>GraphqlApi</code>.
  @_s.JsonKey(name: 'xrayEnabled')
  final bool xrayEnabled;

  GraphqlApi({
    this.additionalAuthenticationProviders,
    this.apiId,
    this.arn,
    this.authenticationType,
    this.logConfig,
    this.name,
    this.openIDConnectConfig,
    this.tags,
    this.uris,
    this.userPoolConfig,
    this.xrayEnabled,
  });
  factory GraphqlApi.fromJson(Map<String, dynamic> json) =>
      _$GraphqlApiFromJson(json);
}

/// Describes an HTTP data source configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpDataSourceConfig {
  /// The authorization config in case the HTTP endpoint requires authorization.
  @_s.JsonKey(name: 'authorizationConfig')
  final AuthorizationConfig authorizationConfig;

  /// The HTTP URL endpoint. You can either specify the domain name or IP, and
  /// port combination, and the URL scheme must be HTTP or HTTPS. If the port is
  /// not specified, AWS AppSync uses the default port 80 for the HTTP endpoint
  /// and port 443 for HTTPS endpoints.
  @_s.JsonKey(name: 'endpoint')
  final String endpoint;

  HttpDataSourceConfig({
    this.authorizationConfig,
    this.endpoint,
  });
  factory HttpDataSourceConfig.fromJson(Map<String, dynamic> json) =>
      _$HttpDataSourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HttpDataSourceConfigToJson(this);
}

/// The <code>LambdaConflictHandlerConfig</code> object when configuring LAMBDA
/// as the Conflict Handler.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LambdaConflictHandlerConfig {
  /// The Arn for the Lambda function to use as the Conflict Handler.
  @_s.JsonKey(name: 'lambdaConflictHandlerArn')
  final String lambdaConflictHandlerArn;

  LambdaConflictHandlerConfig({
    this.lambdaConflictHandlerArn,
  });
  factory LambdaConflictHandlerConfig.fromJson(Map<String, dynamic> json) =>
      _$LambdaConflictHandlerConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LambdaConflictHandlerConfigToJson(this);
}

/// Describes an AWS Lambda data source configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LambdaDataSourceConfig {
  /// The ARN for the Lambda function.
  @_s.JsonKey(name: 'lambdaFunctionArn')
  final String lambdaFunctionArn;

  LambdaDataSourceConfig({
    @_s.required this.lambdaFunctionArn,
  });
  factory LambdaDataSourceConfig.fromJson(Map<String, dynamic> json) =>
      _$LambdaDataSourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LambdaDataSourceConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListApiKeysResponse {
  /// The <code>ApiKey</code> objects.
  @_s.JsonKey(name: 'apiKeys')
  final List<ApiKey> apiKeys;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListApiKeysResponse({
    this.apiKeys,
    this.nextToken,
  });
  factory ListApiKeysResponse.fromJson(Map<String, dynamic> json) =>
      _$ListApiKeysResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDataSourcesResponse {
  /// The <code>DataSource</code> objects.
  @_s.JsonKey(name: 'dataSources')
  final List<DataSource> dataSources;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDataSourcesResponse({
    this.dataSources,
    this.nextToken,
  });
  factory ListDataSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDataSourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFunctionsResponse {
  /// A list of <code>Function</code> objects.
  @_s.JsonKey(name: 'functions')
  final List<FunctionConfiguration> functions;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFunctionsResponse({
    this.functions,
    this.nextToken,
  });
  factory ListFunctionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFunctionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGraphqlApisResponse {
  /// The <code>GraphqlApi</code> objects.
  @_s.JsonKey(name: 'graphqlApis')
  final List<GraphqlApi> graphqlApis;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListGraphqlApisResponse({
    this.graphqlApis,
    this.nextToken,
  });
  factory ListGraphqlApisResponse.fromJson(Map<String, dynamic> json) =>
      _$ListGraphqlApisResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResolversByFunctionResponse {
  /// An identifier that can be used to return the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of resolvers.
  @_s.JsonKey(name: 'resolvers')
  final List<Resolver> resolvers;

  ListResolversByFunctionResponse({
    this.nextToken,
    this.resolvers,
  });
  factory ListResolversByFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResolversByFunctionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResolversResponse {
  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The <code>Resolver</code> objects.
  @_s.JsonKey(name: 'resolvers')
  final List<Resolver> resolvers;

  ListResolversResponse({
    this.nextToken,
    this.resolvers,
  });
  factory ListResolversResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResolversResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A <code>TagMap</code> object.
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
class ListTypesResponse {
  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The <code>Type</code> objects.
  @_s.JsonKey(name: 'types')
  final List<Type> types;

  ListTypesResponse({
    this.nextToken,
    this.types,
  });
  factory ListTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTypesResponseFromJson(json);
}

/// The CloudWatch Logs configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LogConfig {
  /// The service role that AWS AppSync will assume to publish to Amazon
  /// CloudWatch logs in your account.
  @_s.JsonKey(name: 'cloudWatchLogsRoleArn')
  final String cloudWatchLogsRoleArn;

  /// The field logging level. Values can be NONE, ERROR, or ALL.
  ///
  /// <ul>
  /// <li>
  /// <b>NONE</b>: No field-level logs are captured.
  /// </li>
  /// <li>
  /// <b>ERROR</b>: Logs the following information only for the fields that are in
  /// error:
  ///
  /// <ul>
  /// <li>
  /// The error section in the server response.
  /// </li>
  /// <li>
  /// Field-level errors.
  /// </li>
  /// <li>
  /// The generated request/response functions that got resolved for error fields.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>ALL</b>: The following information is logged for all fields in the query:
  ///
  /// <ul>
  /// <li>
  /// Field-level tracing information.
  /// </li>
  /// <li>
  /// The generated request/response functions that got resolved for each field.
  /// </li>
  /// </ul> </li>
  /// </ul>
  @_s.JsonKey(name: 'fieldLogLevel')
  final FieldLogLevel fieldLogLevel;

  /// Set to TRUE to exclude sections that contain information such as headers,
  /// context, and evaluated mapping templates, regardless of logging level.
  @_s.JsonKey(name: 'excludeVerboseContent')
  final bool excludeVerboseContent;

  LogConfig({
    @_s.required this.cloudWatchLogsRoleArn,
    @_s.required this.fieldLogLevel,
    this.excludeVerboseContent,
  });
  factory LogConfig.fromJson(Map<String, dynamic> json) =>
      _$LogConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LogConfigToJson(this);
}

/// Describes an OpenID Connect configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OpenIDConnectConfig {
  /// The issuer for the OpenID Connect configuration. The issuer returned by
  /// discovery must exactly match the value of <code>iss</code> in the ID token.
  @_s.JsonKey(name: 'issuer')
  final String issuer;

  /// The number of milliseconds a token is valid after being authenticated.
  @_s.JsonKey(name: 'authTTL')
  final int authTTL;

  /// The client identifier of the Relying party at the OpenID identity provider.
  /// This identifier is typically obtained when the Relying party is registered
  /// with the OpenID identity provider. You can specify a regular expression so
  /// the AWS AppSync can validate against multiple client identifiers at a time.
  @_s.JsonKey(name: 'clientId')
  final String clientId;

  /// The number of milliseconds a token is valid after being issued to a user.
  @_s.JsonKey(name: 'iatTTL')
  final int iatTTL;

  OpenIDConnectConfig({
    @_s.required this.issuer,
    this.authTTL,
    this.clientId,
    this.iatTTL,
  });
  factory OpenIDConnectConfig.fromJson(Map<String, dynamic> json) =>
      _$OpenIDConnectConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OpenIDConnectConfigToJson(this);
}

enum OutputType {
  @_s.JsonValue('SDL')
  sdl,
  @_s.JsonValue('JSON')
  json,
}

/// The pipeline configuration for a resolver of kind <code>PIPELINE</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PipelineConfig {
  /// A list of <code>Function</code> objects.
  @_s.JsonKey(name: 'functions')
  final List<String> functions;

  PipelineConfig({
    this.functions,
  });
  factory PipelineConfig.fromJson(Map<String, dynamic> json) =>
      _$PipelineConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PipelineConfigToJson(this);
}

/// The Amazon RDS HTTP endpoint configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RdsHttpEndpointConfig {
  /// AWS Region for RDS HTTP endpoint.
  @_s.JsonKey(name: 'awsRegion')
  final String awsRegion;

  /// AWS secret store ARN for database credentials.
  @_s.JsonKey(name: 'awsSecretStoreArn')
  final String awsSecretStoreArn;

  /// Logical database name.
  @_s.JsonKey(name: 'databaseName')
  final String databaseName;

  /// Amazon RDS cluster identifier.
  @_s.JsonKey(name: 'dbClusterIdentifier')
  final String dbClusterIdentifier;

  /// Logical schema name.
  @_s.JsonKey(name: 'schema')
  final String schema;

  RdsHttpEndpointConfig({
    this.awsRegion,
    this.awsSecretStoreArn,
    this.databaseName,
    this.dbClusterIdentifier,
    this.schema,
  });
  factory RdsHttpEndpointConfig.fromJson(Map<String, dynamic> json) =>
      _$RdsHttpEndpointConfigFromJson(json);

  Map<String, dynamic> toJson() => _$RdsHttpEndpointConfigToJson(this);
}

/// Describes a relational database data source configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RelationalDatabaseDataSourceConfig {
  /// Amazon RDS HTTP endpoint settings.
  @_s.JsonKey(name: 'rdsHttpEndpointConfig')
  final RdsHttpEndpointConfig rdsHttpEndpointConfig;

  /// Source type for the relational database.
  ///
  /// <ul>
  /// <li>
  /// <b>RDS_HTTP_ENDPOINT</b>: The relational database source type is an Amazon
  /// RDS HTTP endpoint.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'relationalDatabaseSourceType')
  final RelationalDatabaseSourceType relationalDatabaseSourceType;

  RelationalDatabaseDataSourceConfig({
    this.rdsHttpEndpointConfig,
    this.relationalDatabaseSourceType,
  });
  factory RelationalDatabaseDataSourceConfig.fromJson(
          Map<String, dynamic> json) =>
      _$RelationalDatabaseDataSourceConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RelationalDatabaseDataSourceConfigToJson(this);
}

enum RelationalDatabaseSourceType {
  @_s.JsonValue('RDS_HTTP_ENDPOINT')
  rdsHttpEndpoint,
}

/// Describes a resolver.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Resolver {
  /// The caching configuration for the resolver.
  @_s.JsonKey(name: 'cachingConfig')
  final CachingConfig cachingConfig;

  /// The resolver data source name.
  @_s.JsonKey(name: 'dataSourceName')
  final String dataSourceName;

  /// The resolver field name.
  @_s.JsonKey(name: 'fieldName')
  final String fieldName;

  /// The resolver type.
  ///
  /// <ul>
  /// <li>
  /// <b>UNIT</b>: A UNIT resolver type. A UNIT resolver is the default resolver
  /// type. A UNIT resolver enables you to execute a GraphQL query against a
  /// single data source.
  /// </li>
  /// <li>
  /// <b>PIPELINE</b>: A PIPELINE resolver type. A PIPELINE resolver enables you
  /// to execute a series of <code>Function</code> in a serial manner. You can use
  /// a pipeline resolver to execute a GraphQL query against multiple data
  /// sources.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'kind')
  final ResolverKind kind;

  /// The <code>PipelineConfig</code>.
  @_s.JsonKey(name: 'pipelineConfig')
  final PipelineConfig pipelineConfig;

  /// The request mapping template.
  @_s.JsonKey(name: 'requestMappingTemplate')
  final String requestMappingTemplate;

  /// The resolver ARN.
  @_s.JsonKey(name: 'resolverArn')
  final String resolverArn;

  /// The response mapping template.
  @_s.JsonKey(name: 'responseMappingTemplate')
  final String responseMappingTemplate;

  /// The <code>SyncConfig</code> for a resolver attached to a versioned
  /// datasource.
  @_s.JsonKey(name: 'syncConfig')
  final SyncConfig syncConfig;

  /// The resolver type name.
  @_s.JsonKey(name: 'typeName')
  final String typeName;

  Resolver({
    this.cachingConfig,
    this.dataSourceName,
    this.fieldName,
    this.kind,
    this.pipelineConfig,
    this.requestMappingTemplate,
    this.resolverArn,
    this.responseMappingTemplate,
    this.syncConfig,
    this.typeName,
  });
  factory Resolver.fromJson(Map<String, dynamic> json) =>
      _$ResolverFromJson(json);
}

enum ResolverKind {
  @_s.JsonValue('UNIT')
  unit,
  @_s.JsonValue('PIPELINE')
  pipeline,
}

enum SchemaStatus {
  @_s.JsonValue('PROCESSING')
  processing,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('NOT_APPLICABLE')
  notApplicable,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartSchemaCreationRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The schema definition, in GraphQL schema language format.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'definition')
  final Uint8List definition;

  StartSchemaCreationRequest({
    @_s.required this.apiId,
    @_s.required this.definition,
  });
  Map<String, dynamic> toJson() => _$StartSchemaCreationRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartSchemaCreationResponse {
  /// The current state of the schema (PROCESSING, FAILED, SUCCESS, or
  /// NOT_APPLICABLE). When the schema is in the ACTIVE state, you can add data.
  @_s.JsonKey(name: 'status')
  final SchemaStatus status;

  StartSchemaCreationResponse({
    this.status,
  });
  factory StartSchemaCreationResponse.fromJson(Map<String, dynamic> json) =>
      _$StartSchemaCreationResponseFromJson(json);
}

/// Describes a Sync configuration for a resolver.
///
/// Contains information on which Conflict Detection as well as Resolution
/// strategy should be performed when the resolver is invoked.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SyncConfig {
  /// The Conflict Detection strategy to use.
  ///
  /// <ul>
  /// <li>
  /// <b>VERSION</b>: Detect conflicts based on object versions for this resolver.
  /// </li>
  /// <li>
  /// <b>NONE</b>: Do not detect conflicts when executing this resolver.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'conflictDetection')
  final ConflictDetectionType conflictDetection;

  /// The Conflict Resolution strategy to perform in the event of a conflict.
  ///
  /// <ul>
  /// <li>
  /// <b>OPTIMISTIC_CONCURRENCY</b>: Resolve conflicts by rejecting mutations when
  /// versions do not match the latest version at the server.
  /// </li>
  /// <li>
  /// <b>AUTOMERGE</b>: Resolve conflicts with the Automerge conflict resolution
  /// strategy.
  /// </li>
  /// <li>
  /// <b>LAMBDA</b>: Resolve conflicts with a Lambda function supplied in the
  /// LambdaConflictHandlerConfig.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'conflictHandler')
  final ConflictHandlerType conflictHandler;

  /// The <code>LambdaConflictHandlerConfig</code> when configuring LAMBDA as the
  /// Conflict Handler.
  @_s.JsonKey(name: 'lambdaConflictHandlerConfig')
  final LambdaConflictHandlerConfig lambdaConflictHandlerConfig;

  SyncConfig({
    this.conflictDetection,
    this.conflictHandler,
    this.lambdaConflictHandlerConfig,
  });
  factory SyncConfig.fromJson(Map<String, dynamic> json) =>
      _$SyncConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SyncConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TagResourceRequest {
  /// The <code>GraphqlApi</code> ARN.
  @_s.JsonKey(name: 'resourceArn', ignore: true)
  final String resourceArn;

  /// A <code>TagMap</code> object.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  TagResourceRequest({
    @_s.required this.resourceArn,
    @_s.required this.tags,
  });
  Map<String, dynamic> toJson() => _$TagResourceRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Describes a type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Type {
  /// The type ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The type definition.
  @_s.JsonKey(name: 'definition')
  final String definition;

  /// The type description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The type format: SDL or JSON.
  @_s.JsonKey(name: 'format')
  final TypeDefinitionFormat format;

  /// The type name.
  @_s.JsonKey(name: 'name')
  final String name;

  Type({
    this.arn,
    this.definition,
    this.description,
    this.format,
    this.name,
  });
  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}

enum TypeDefinitionFormat {
  @_s.JsonValue('SDL')
  sdl,
  @_s.JsonValue('JSON')
  json,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UntagResourceRequest {
  /// The <code>GraphqlApi</code> ARN.
  @_s.JsonKey(name: 'resourceArn', ignore: true)
  final String resourceArn;

  /// A list of <code>TagKey</code> objects.
  @_s.JsonKey(name: 'tagKeys', ignore: true)
  final List<String> tagKeys;

  UntagResourceRequest({
    @_s.required this.resourceArn,
    @_s.required this.tagKeys,
  });
  Map<String, dynamic> toJson() => _$UntagResourceRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// Represents the input of a <code>UpdateApiCache</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateApiCacheRequest {
  /// Caching behavior.
  ///
  /// <ul>
  /// <li>
  /// <b>FULL_REQUEST_CACHING</b>: All requests are fully cached.
  /// </li>
  /// <li>
  /// <b>PER_RESOLVER_CACHING</b>: Individual resovlers that you specify are
  /// cached.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'apiCachingBehavior')
  final ApiCachingBehavior apiCachingBehavior;

  /// The GraphQL API Id.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// TTL in seconds for cache entries.
  ///
  /// Valid values are between 1 and 3600 seconds.
  @_s.JsonKey(name: 'ttl')
  final int ttl;

  /// The cache instance type.
  ///
  /// <ul>
  /// <li>
  /// <b>T2_SMALL</b>: A t2.small instance type.
  /// </li>
  /// <li>
  /// <b>T2_MEDIUM</b>: A t2.medium instance type.
  /// </li>
  /// <li>
  /// <b>R4_LARGE</b>: A r4.large instance type.
  /// </li>
  /// <li>
  /// <b>R4_XLARGE</b>: A r4.xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_2XLARGE</b>: A r4.2xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_4XLARGE</b>: A r4.4xlarge instance type.
  /// </li>
  /// <li>
  /// <b>R4_8XLARGE</b>: A r4.8xlarge instance type.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'type')
  final ApiCacheType type;

  UpdateApiCacheRequest({
    @_s.required this.apiCachingBehavior,
    @_s.required this.apiId,
    @_s.required this.ttl,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$UpdateApiCacheRequestToJson(this);
}

/// Represents the output of a <code>UpdateApiCache</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApiCacheResponse {
  /// The <code>ApiCache</code> object.
  @_s.JsonKey(name: 'apiCache')
  final ApiCache apiCache;

  UpdateApiCacheResponse({
    this.apiCache,
  });
  factory UpdateApiCacheResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApiCacheResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateApiKeyRequest {
  /// The ID for the GraphQL API.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The API key ID.
  @_s.JsonKey(name: 'id', ignore: true)
  final String id;

  /// A description of the purpose of the API key.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The time from update time after which the API key expires. The date is
  /// represented as seconds since the epoch. For more information, see .
  @_s.JsonKey(name: 'expires')
  final int expires;

  UpdateApiKeyRequest({
    @_s.required this.apiId,
    @_s.required this.id,
    this.description,
    this.expires,
  });
  Map<String, dynamic> toJson() => _$UpdateApiKeyRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApiKeyResponse {
  /// The API key.
  @_s.JsonKey(name: 'apiKey')
  final ApiKey apiKey;

  UpdateApiKeyResponse({
    this.apiKey,
  });
  factory UpdateApiKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApiKeyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateDataSourceRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The new name for the data source.
  @_s.JsonKey(name: 'name', ignore: true)
  final String name;

  /// The new data source type.
  @_s.JsonKey(name: 'type')
  final DataSourceType type;

  /// The new description for the data source.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The new Amazon DynamoDB configuration.
  @_s.JsonKey(name: 'dynamodbConfig')
  final DynamodbDataSourceConfig dynamodbConfig;

  /// The new Elasticsearch Service configuration.
  @_s.JsonKey(name: 'elasticsearchConfig')
  final ElasticsearchDataSourceConfig elasticsearchConfig;

  /// The new HTTP endpoint configuration.
  @_s.JsonKey(name: 'httpConfig')
  final HttpDataSourceConfig httpConfig;

  /// The new AWS Lambda configuration.
  @_s.JsonKey(name: 'lambdaConfig')
  final LambdaDataSourceConfig lambdaConfig;

  /// The new relational database configuration.
  @_s.JsonKey(name: 'relationalDatabaseConfig')
  final RelationalDatabaseDataSourceConfig relationalDatabaseConfig;

  /// The new service role ARN for the data source.
  @_s.JsonKey(name: 'serviceRoleArn')
  final String serviceRoleArn;

  UpdateDataSourceRequest({
    @_s.required this.apiId,
    @_s.required this.name,
    @_s.required this.type,
    this.description,
    this.dynamodbConfig,
    this.elasticsearchConfig,
    this.httpConfig,
    this.lambdaConfig,
    this.relationalDatabaseConfig,
    this.serviceRoleArn,
  });
  Map<String, dynamic> toJson() => _$UpdateDataSourceRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDataSourceResponse {
  /// The updated <code>DataSource</code> object.
  @_s.JsonKey(name: 'dataSource')
  final DataSource dataSource;

  UpdateDataSourceResponse({
    this.dataSource,
  });
  factory UpdateDataSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateFunctionRequest {
  /// The GraphQL API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The <code>Function</code> <code>DataSource</code> name.
  @_s.JsonKey(name: 'dataSourceName')
  final String dataSourceName;

  /// The function ID.
  @_s.JsonKey(name: 'functionId', ignore: true)
  final String functionId;

  /// The <code>version</code> of the request mapping template. Currently the
  /// supported value is 2018-05-29.
  @_s.JsonKey(name: 'functionVersion')
  final String functionVersion;

  /// The <code>Function</code> name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The <code>Function</code> request mapping template. Functions support only
  /// the 2018-05-29 version of the request mapping template.
  @_s.JsonKey(name: 'requestMappingTemplate')
  final String requestMappingTemplate;

  /// The <code>Function</code> description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The <code>Function</code> request mapping template.
  @_s.JsonKey(name: 'responseMappingTemplate')
  final String responseMappingTemplate;

  UpdateFunctionRequest({
    @_s.required this.apiId,
    @_s.required this.dataSourceName,
    @_s.required this.functionId,
    @_s.required this.functionVersion,
    @_s.required this.name,
    @_s.required this.requestMappingTemplate,
    this.description,
    this.responseMappingTemplate,
  });
  Map<String, dynamic> toJson() => _$UpdateFunctionRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFunctionResponse {
  /// The <code>Function</code> object.
  @_s.JsonKey(name: 'functionConfiguration')
  final FunctionConfiguration functionConfiguration;

  UpdateFunctionResponse({
    this.functionConfiguration,
  });
  factory UpdateFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFunctionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateGraphqlApiRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The new name for the <code>GraphqlApi</code> object.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of additional authentication providers for the
  /// <code>GraphqlApi</code> API.
  @_s.JsonKey(name: 'additionalAuthenticationProviders')
  final List<AdditionalAuthenticationProvider>
      additionalAuthenticationProviders;

  /// The new authentication type for the <code>GraphqlApi</code> object.
  @_s.JsonKey(name: 'authenticationType')
  final AuthenticationType authenticationType;

  /// The Amazon CloudWatch Logs configuration for the <code>GraphqlApi</code>
  /// object.
  @_s.JsonKey(name: 'logConfig')
  final LogConfig logConfig;

  /// The OpenID Connect configuration for the <code>GraphqlApi</code> object.
  @_s.JsonKey(name: 'openIDConnectConfig')
  final OpenIDConnectConfig openIDConnectConfig;

  /// The new Amazon Cognito user pool configuration for the
  /// <code>GraphqlApi</code> object.
  @_s.JsonKey(name: 'userPoolConfig')
  final UserPoolConfig userPoolConfig;

  /// A flag indicating whether to enable X-Ray tracing for the
  /// <code>GraphqlApi</code>.
  @_s.JsonKey(name: 'xrayEnabled')
  final bool xrayEnabled;

  UpdateGraphqlApiRequest({
    @_s.required this.apiId,
    @_s.required this.name,
    this.additionalAuthenticationProviders,
    this.authenticationType,
    this.logConfig,
    this.openIDConnectConfig,
    this.userPoolConfig,
    this.xrayEnabled,
  });
  Map<String, dynamic> toJson() => _$UpdateGraphqlApiRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGraphqlApiResponse {
  /// The updated <code>GraphqlApi</code> object.
  @_s.JsonKey(name: 'graphqlApi')
  final GraphqlApi graphqlApi;

  UpdateGraphqlApiResponse({
    this.graphqlApi,
  });
  factory UpdateGraphqlApiResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGraphqlApiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateResolverRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The new field name.
  @_s.JsonKey(name: 'fieldName', ignore: true)
  final String fieldName;

  /// The new request mapping template.
  @_s.JsonKey(name: 'requestMappingTemplate')
  final String requestMappingTemplate;

  /// The new type name.
  @_s.JsonKey(name: 'typeName', ignore: true)
  final String typeName;

  /// The caching configuration for the resolver.
  @_s.JsonKey(name: 'cachingConfig')
  final CachingConfig cachingConfig;

  /// The new data source name.
  @_s.JsonKey(name: 'dataSourceName')
  final String dataSourceName;

  /// The resolver type.
  ///
  /// <ul>
  /// <li>
  /// <b>UNIT</b>: A UNIT resolver type. A UNIT resolver is the default resolver
  /// type. A UNIT resolver enables you to execute a GraphQL query against a
  /// single data source.
  /// </li>
  /// <li>
  /// <b>PIPELINE</b>: A PIPELINE resolver type. A PIPELINE resolver enables you
  /// to execute a series of <code>Function</code> in a serial manner. You can use
  /// a pipeline resolver to execute a GraphQL query against multiple data
  /// sources.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'kind')
  final ResolverKind kind;

  /// The <code>PipelineConfig</code>.
  @_s.JsonKey(name: 'pipelineConfig')
  final PipelineConfig pipelineConfig;

  /// The new response mapping template.
  @_s.JsonKey(name: 'responseMappingTemplate')
  final String responseMappingTemplate;

  /// The <code>SyncConfig</code> for a resolver attached to a versioned
  /// datasource.
  @_s.JsonKey(name: 'syncConfig')
  final SyncConfig syncConfig;

  UpdateResolverRequest({
    @_s.required this.apiId,
    @_s.required this.fieldName,
    @_s.required this.requestMappingTemplate,
    @_s.required this.typeName,
    this.cachingConfig,
    this.dataSourceName,
    this.kind,
    this.pipelineConfig,
    this.responseMappingTemplate,
    this.syncConfig,
  });
  Map<String, dynamic> toJson() => _$UpdateResolverRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResolverResponse {
  /// The updated <code>Resolver</code> object.
  @_s.JsonKey(name: 'resolver')
  final Resolver resolver;

  UpdateResolverResponse({
    this.resolver,
  });
  factory UpdateResolverResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResolverResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateTypeRequest {
  /// The API ID.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The new type format: SDL or JSON.
  @_s.JsonKey(name: 'format')
  final TypeDefinitionFormat format;

  /// The new type name.
  @_s.JsonKey(name: 'typeName', ignore: true)
  final String typeName;

  /// The new definition.
  @_s.JsonKey(name: 'definition')
  final String definition;

  UpdateTypeRequest({
    @_s.required this.apiId,
    @_s.required this.format,
    @_s.required this.typeName,
    this.definition,
  });
  Map<String, dynamic> toJson() => _$UpdateTypeRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTypeResponse {
  /// The updated <code>Type</code> object.
  @_s.JsonKey(name: 'type')
  final Type type;

  UpdateTypeResponse({
    this.type,
  });
  factory UpdateTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTypeResponseFromJson(json);
}

/// Describes an Amazon Cognito user pool configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserPoolConfig {
  /// The AWS Region in which the user pool was created.
  @_s.JsonKey(name: 'awsRegion')
  final String awsRegion;

  /// The action that you want your GraphQL API to take when a request that uses
  /// Amazon Cognito user pool authentication doesn't match the Amazon Cognito
  /// user pool configuration.
  @_s.JsonKey(name: 'defaultAction')
  final DefaultAction defaultAction;

  /// The user pool ID.
  @_s.JsonKey(name: 'userPoolId')
  final String userPoolId;

  /// A regular expression for validating the incoming Amazon Cognito user pool
  /// app client ID.
  @_s.JsonKey(name: 'appIdClientRegex')
  final String appIdClientRegex;

  UserPoolConfig({
    @_s.required this.awsRegion,
    @_s.required this.defaultAction,
    @_s.required this.userPoolId,
    this.appIdClientRegex,
  });
  factory UserPoolConfig.fromJson(Map<String, dynamic> json) =>
      _$UserPoolConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UserPoolConfigToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ApiKeyLimitExceededException extends _s.GenericAwsException {
  ApiKeyLimitExceededException({String type, String message})
      : super(
            type: type, code: 'ApiKeyLimitExceededException', message: message);
}

class ApiKeyValidityOutOfBoundsException extends _s.GenericAwsException {
  ApiKeyValidityOutOfBoundsException({String type, String message})
      : super(
            type: type,
            code: 'ApiKeyValidityOutOfBoundsException',
            message: message);
}

class ApiLimitExceededException extends _s.GenericAwsException {
  ApiLimitExceededException({String type, String message})
      : super(type: type, code: 'ApiLimitExceededException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class GraphQLSchemaException extends _s.GenericAwsException {
  GraphQLSchemaException({String type, String message})
      : super(type: type, code: 'GraphQLSchemaException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ApiKeyLimitExceededException': (type, message) =>
      ApiKeyLimitExceededException(type: type, message: message),
  'ApiKeyValidityOutOfBoundsException': (type, message) =>
      ApiKeyValidityOutOfBoundsException(type: type, message: message),
  'ApiLimitExceededException': (type, message) =>
      ApiLimitExceededException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'GraphQLSchemaException': (type, message) =>
      GraphQLSchemaException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
