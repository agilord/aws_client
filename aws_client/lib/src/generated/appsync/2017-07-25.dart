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

/// AWS AppSync provides API actions for creating and interacting with data
/// sources using GraphQL from your application.
class AppSync {
  final _s.RestJsonProtocol _protocol;
  AppSync({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'appsync',
            signingName: 'appsync',
          ),
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
  /// <b>PER_RESOLVER_CACHING</b>: Individual resolvers that you specify are
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
  /// The cache instance type. Valid values are
  ///
  /// <ul>
  /// <li>
  /// <code>SMALL</code>
  /// </li>
  /// <li>
  /// <code>MEDIUM</code>
  /// </li>
  /// <li>
  /// <code>LARGE</code>
  /// </li>
  /// <li>
  /// <code>XLARGE</code>
  /// </li>
  /// <li>
  /// <code>LARGE_2X</code>
  /// </li>
  /// <li>
  /// <code>LARGE_4X</code>
  /// </li>
  /// <li>
  /// <code>LARGE_8X</code> (not available in all regions)
  /// </li>
  /// <li>
  /// <code>LARGE_12X</code>
  /// </li>
  /// </ul>
  /// Historically, instance types were identified by an EC2-style value. As of
  /// July 2020, this is deprecated, and the generic identifiers above should be
  /// used.
  ///
  /// The following legacy instance types are available, but their use is
  /// discouraged:
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
    required ApiCachingBehavior apiCachingBehavior,
    required String apiId,
    required int ttl,
    required ApiCacheType type,
    bool? atRestEncryptionEnabled,
    bool? transitEncryptionEnabled,
  }) async {
    ArgumentError.checkNotNull(apiCachingBehavior, 'apiCachingBehavior');
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(ttl, 'ttl');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'apiCachingBehavior': apiCachingBehavior.toValue(),
      'ttl': ttl,
      'type': type.toValue(),
      if (atRestEncryptionEnabled != null)
        'atRestEncryptionEnabled': atRestEncryptionEnabled,
      if (transitEncryptionEnabled != null)
        'transitEncryptionEnabled': transitEncryptionEnabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/ApiCaches',
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
    required String apiId,
    String? description,
    int? expires,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (expires != null) 'expires': expires,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/apikeys',
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
    required String apiId,
    required String name,
    required DataSourceType type,
    String? description,
    DynamodbDataSourceConfig? dynamodbConfig,
    ElasticsearchDataSourceConfig? elasticsearchConfig,
    HttpDataSourceConfig? httpConfig,
    LambdaDataSourceConfig? lambdaConfig,
    RelationalDatabaseDataSourceConfig? relationalDatabaseConfig,
    String? serviceRoleArn,
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
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'name': name,
      'type': type.toValue(),
      if (description != null) 'description': description,
      if (dynamodbConfig != null) 'dynamodbConfig': dynamodbConfig,
      if (elasticsearchConfig != null)
        'elasticsearchConfig': elasticsearchConfig,
      if (httpConfig != null) 'httpConfig': httpConfig,
      if (lambdaConfig != null) 'lambdaConfig': lambdaConfig,
      if (relationalDatabaseConfig != null)
        'relationalDatabaseConfig': relationalDatabaseConfig,
      if (serviceRoleArn != null) 'serviceRoleArn': serviceRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/datasources',
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
  /// Parameter [description] :
  /// The <code>Function</code> description.
  ///
  /// Parameter [requestMappingTemplate] :
  /// The <code>Function</code> request mapping template. Functions support only
  /// the 2018-05-29 version of the request mapping template.
  ///
  /// Parameter [responseMappingTemplate] :
  /// The <code>Function</code> response mapping template.
  Future<CreateFunctionResponse> createFunction({
    required String apiId,
    required String dataSourceName,
    required String functionVersion,
    required String name,
    String? description,
    String? requestMappingTemplate,
    String? responseMappingTemplate,
    SyncConfig? syncConfig,
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
    ArgumentError.checkNotNull(functionVersion, 'functionVersion');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringLength(
      'requestMappingTemplate',
      requestMappingTemplate,
      1,
      65536,
    );
    _s.validateStringLength(
      'responseMappingTemplate',
      responseMappingTemplate,
      1,
      65536,
    );
    final $payload = <String, dynamic>{
      'dataSourceName': dataSourceName,
      'functionVersion': functionVersion,
      'name': name,
      if (description != null) 'description': description,
      if (requestMappingTemplate != null)
        'requestMappingTemplate': requestMappingTemplate,
      if (responseMappingTemplate != null)
        'responseMappingTemplate': responseMappingTemplate,
      if (syncConfig != null) 'syncConfig': syncConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/functions',
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
    required AuthenticationType authenticationType,
    required String name,
    List<AdditionalAuthenticationProvider>? additionalAuthenticationProviders,
    LogConfig? logConfig,
    OpenIDConnectConfig? openIDConnectConfig,
    Map<String, String>? tags,
    UserPoolConfig? userPoolConfig,
    bool? xrayEnabled,
  }) async {
    ArgumentError.checkNotNull(authenticationType, 'authenticationType');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'authenticationType': authenticationType.toValue(),
      'name': name,
      if (additionalAuthenticationProviders != null)
        'additionalAuthenticationProviders': additionalAuthenticationProviders,
      if (logConfig != null) 'logConfig': logConfig,
      if (openIDConnectConfig != null)
        'openIDConnectConfig': openIDConnectConfig,
      if (tags != null) 'tags': tags,
      if (userPoolConfig != null) 'userPoolConfig': userPoolConfig,
      if (xrayEnabled != null) 'xrayEnabled': xrayEnabled,
    };
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
  /// Parameter [requestMappingTemplate] :
  /// The mapping template to be used for requests.
  ///
  /// A resolver uses a request mapping template to convert a GraphQL expression
  /// into a format that a data source can understand. Mapping templates are
  /// written in Apache Velocity Template Language (VTL).
  ///
  /// VTL request mapping templates are optional when using a Lambda data
  /// source. For all other data sources, VTL request and response mapping
  /// templates are required.
  ///
  /// Parameter [responseMappingTemplate] :
  /// The mapping template to be used for responses from the data source.
  ///
  /// Parameter [syncConfig] :
  /// The <code>SyncConfig</code> for a resolver attached to a versioned
  /// datasource.
  Future<CreateResolverResponse> createResolver({
    required String apiId,
    required String fieldName,
    required String typeName,
    CachingConfig? cachingConfig,
    String? dataSourceName,
    ResolverKind? kind,
    PipelineConfig? pipelineConfig,
    String? requestMappingTemplate,
    String? responseMappingTemplate,
    SyncConfig? syncConfig,
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
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringLength(
      'dataSourceName',
      dataSourceName,
      1,
      65536,
    );
    _s.validateStringLength(
      'requestMappingTemplate',
      requestMappingTemplate,
      1,
      65536,
    );
    _s.validateStringLength(
      'responseMappingTemplate',
      responseMappingTemplate,
      1,
      65536,
    );
    final $payload = <String, dynamic>{
      'fieldName': fieldName,
      if (cachingConfig != null) 'cachingConfig': cachingConfig,
      if (dataSourceName != null) 'dataSourceName': dataSourceName,
      if (kind != null) 'kind': kind.toValue(),
      if (pipelineConfig != null) 'pipelineConfig': pipelineConfig,
      if (requestMappingTemplate != null)
        'requestMappingTemplate': requestMappingTemplate,
      if (responseMappingTemplate != null)
        'responseMappingTemplate': responseMappingTemplate,
      if (syncConfig != null) 'syncConfig': syncConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/types/${Uri.encodeComponent(typeName)}/resolvers',
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
    required String apiId,
    required String definition,
    required TypeDefinitionFormat format,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(definition, 'definition');
    ArgumentError.checkNotNull(format, 'format');
    final $payload = <String, dynamic>{
      'definition': definition,
      'format': format.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/types',
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
    required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/ApiCaches',
      exceptionFnMap: _exceptionFns,
    );
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
    required String apiId,
    required String id,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/apikeys/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String apiId,
    required String name,
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/datasources/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String apiId,
    required String functionId,
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/functions/${Uri.encodeComponent(functionId)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String apiId,
    required String fieldName,
    required String typeName,
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
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/types/${Uri.encodeComponent(typeName)}/resolvers/${Uri.encodeComponent(fieldName)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String apiId,
    required String typeName,
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/types/${Uri.encodeComponent(typeName)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/FlushCache',
      exceptionFnMap: _exceptionFns,
    );
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
    required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/ApiCaches',
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
    required String apiId,
    required String name,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/datasources/${Uri.encodeComponent(name)}',
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
    required String apiId,
    required String functionId,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/functions/${Uri.encodeComponent(functionId)}',
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
    required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}',
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
    required String apiId,
    required OutputType format,
    bool? includeDirectives,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(format, 'format');
    final $query = <String, List<String>>{
      'format': [format.toValue()],
      if (includeDirectives != null)
        'includeDirectives': [includeDirectives.toString()],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/schema',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetIntrospectionSchemaResponse(
      schema: await response.stream.toBytes(),
    );
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
    required String apiId,
    required String fieldName,
    required String typeName,
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
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/types/${Uri.encodeComponent(typeName)}/resolvers/${Uri.encodeComponent(fieldName)}',
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
    required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/schemacreation',
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
    required String apiId,
    required TypeDefinitionFormat format,
    required String typeName,
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
    final $query = <String, List<String>>{
      'format': [format.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/types/${Uri.encodeComponent(typeName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTypeResponse.fromJson(response);
  }

  /// Lists the API keys for a given API.
  /// <note>
  /// API keys are deleted automatically 60 days after they expire. However,
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
    required String apiId,
    int? maxResults,
    String? nextToken,
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
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/apikeys',
      queryParams: $query,
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
    required String apiId,
    int? maxResults,
    String? nextToken,
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
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/datasources',
      queryParams: $query,
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
    required String apiId,
    int? maxResults,
    String? nextToken,
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
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/functions',
      queryParams: $query,
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
    int? maxResults,
    String? nextToken,
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
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis',
      queryParams: $query,
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
    required String apiId,
    required String typeName,
    int? maxResults,
    String? nextToken,
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
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/types/${Uri.encodeComponent(typeName)}/resolvers',
      queryParams: $query,
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
    required String apiId,
    required String functionId,
    int? maxResults,
    String? nextToken,
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
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/functions/${Uri.encodeComponent(functionId)}/resolvers',
      queryParams: $query,
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
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      70,
      75,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
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
    required String apiId,
    required TypeDefinitionFormat format,
    int? maxResults,
    String? nextToken,
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
    final $query = <String, List<String>>{
      'format': [format.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/types',
      queryParams: $query,
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
    required String apiId,
    required Uint8List definition,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(definition, 'definition');
    final $payload = <String, dynamic>{
      'definition': base64Encode(definition),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/schemacreation',
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
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      70,
      75,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      70,
      75,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
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
  /// <b>PER_RESOLVER_CACHING</b>: Individual resolvers that you specify are
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
  /// The cache instance type. Valid values are
  ///
  /// <ul>
  /// <li>
  /// <code>SMALL</code>
  /// </li>
  /// <li>
  /// <code>MEDIUM</code>
  /// </li>
  /// <li>
  /// <code>LARGE</code>
  /// </li>
  /// <li>
  /// <code>XLARGE</code>
  /// </li>
  /// <li>
  /// <code>LARGE_2X</code>
  /// </li>
  /// <li>
  /// <code>LARGE_4X</code>
  /// </li>
  /// <li>
  /// <code>LARGE_8X</code> (not available in all regions)
  /// </li>
  /// <li>
  /// <code>LARGE_12X</code>
  /// </li>
  /// </ul>
  /// Historically, instance types were identified by an EC2-style value. As of
  /// July 2020, this is deprecated, and the generic identifiers above should be
  /// used.
  ///
  /// The following legacy instance types are available, but their use is
  /// discouraged:
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
    required ApiCachingBehavior apiCachingBehavior,
    required String apiId,
    required int ttl,
    required ApiCacheType type,
  }) async {
    ArgumentError.checkNotNull(apiCachingBehavior, 'apiCachingBehavior');
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(ttl, 'ttl');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'apiCachingBehavior': apiCachingBehavior.toValue(),
      'ttl': ttl,
      'type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}/ApiCaches/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApiCacheResponse.fromJson(response);
  }

  /// Updates an API key. The key can be updated while it is not deleted.
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
    required String apiId,
    required String id,
    String? description,
    int? expires,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(id, 'id');
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (expires != null) 'expires': expires,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/apikeys/${Uri.encodeComponent(id)}',
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
    required String apiId,
    required String name,
    required DataSourceType type,
    String? description,
    DynamodbDataSourceConfig? dynamodbConfig,
    ElasticsearchDataSourceConfig? elasticsearchConfig,
    HttpDataSourceConfig? httpConfig,
    LambdaDataSourceConfig? lambdaConfig,
    RelationalDatabaseDataSourceConfig? relationalDatabaseConfig,
    String? serviceRoleArn,
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
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'type': type.toValue(),
      if (description != null) 'description': description,
      if (dynamodbConfig != null) 'dynamodbConfig': dynamodbConfig,
      if (elasticsearchConfig != null)
        'elasticsearchConfig': elasticsearchConfig,
      if (httpConfig != null) 'httpConfig': httpConfig,
      if (lambdaConfig != null) 'lambdaConfig': lambdaConfig,
      if (relationalDatabaseConfig != null)
        'relationalDatabaseConfig': relationalDatabaseConfig,
      if (serviceRoleArn != null) 'serviceRoleArn': serviceRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/datasources/${Uri.encodeComponent(name)}',
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
  /// Parameter [description] :
  /// The <code>Function</code> description.
  ///
  /// Parameter [requestMappingTemplate] :
  /// The <code>Function</code> request mapping template. Functions support only
  /// the 2018-05-29 version of the request mapping template.
  ///
  /// Parameter [responseMappingTemplate] :
  /// The <code>Function</code> request mapping template.
  Future<UpdateFunctionResponse> updateFunction({
    required String apiId,
    required String dataSourceName,
    required String functionId,
    required String functionVersion,
    required String name,
    String? description,
    String? requestMappingTemplate,
    String? responseMappingTemplate,
    SyncConfig? syncConfig,
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
    ArgumentError.checkNotNull(functionId, 'functionId');
    _s.validateStringLength(
      'functionId',
      functionId,
      1,
      65536,
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
    _s.validateStringLength(
      'requestMappingTemplate',
      requestMappingTemplate,
      1,
      65536,
    );
    _s.validateStringLength(
      'responseMappingTemplate',
      responseMappingTemplate,
      1,
      65536,
    );
    final $payload = <String, dynamic>{
      'dataSourceName': dataSourceName,
      'functionVersion': functionVersion,
      'name': name,
      if (description != null) 'description': description,
      if (requestMappingTemplate != null)
        'requestMappingTemplate': requestMappingTemplate,
      if (responseMappingTemplate != null)
        'responseMappingTemplate': responseMappingTemplate,
      if (syncConfig != null) 'syncConfig': syncConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/functions/${Uri.encodeComponent(functionId)}',
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
    required String apiId,
    required String name,
    List<AdditionalAuthenticationProvider>? additionalAuthenticationProviders,
    AuthenticationType? authenticationType,
    LogConfig? logConfig,
    OpenIDConnectConfig? openIDConnectConfig,
    UserPoolConfig? userPoolConfig,
    bool? xrayEnabled,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'name': name,
      if (additionalAuthenticationProviders != null)
        'additionalAuthenticationProviders': additionalAuthenticationProviders,
      if (authenticationType != null)
        'authenticationType': authenticationType.toValue(),
      if (logConfig != null) 'logConfig': logConfig,
      if (openIDConnectConfig != null)
        'openIDConnectConfig': openIDConnectConfig,
      if (userPoolConfig != null) 'userPoolConfig': userPoolConfig,
      if (xrayEnabled != null) 'xrayEnabled': xrayEnabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/apis/${Uri.encodeComponent(apiId)}',
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
  /// Parameter [requestMappingTemplate] :
  /// The new request mapping template.
  ///
  /// A resolver uses a request mapping template to convert a GraphQL expression
  /// into a format that a data source can understand. Mapping templates are
  /// written in Apache Velocity Template Language (VTL).
  ///
  /// VTL request mapping templates are optional when using a Lambda data
  /// source. For all other data sources, VTL request and response mapping
  /// templates are required.
  ///
  /// Parameter [responseMappingTemplate] :
  /// The new response mapping template.
  ///
  /// Parameter [syncConfig] :
  /// The <code>SyncConfig</code> for a resolver attached to a versioned
  /// datasource.
  Future<UpdateResolverResponse> updateResolver({
    required String apiId,
    required String fieldName,
    required String typeName,
    CachingConfig? cachingConfig,
    String? dataSourceName,
    ResolverKind? kind,
    PipelineConfig? pipelineConfig,
    String? requestMappingTemplate,
    String? responseMappingTemplate,
    SyncConfig? syncConfig,
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
    ArgumentError.checkNotNull(typeName, 'typeName');
    _s.validateStringLength(
      'typeName',
      typeName,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringLength(
      'dataSourceName',
      dataSourceName,
      1,
      65536,
    );
    _s.validateStringLength(
      'requestMappingTemplate',
      requestMappingTemplate,
      1,
      65536,
    );
    _s.validateStringLength(
      'responseMappingTemplate',
      responseMappingTemplate,
      1,
      65536,
    );
    final $payload = <String, dynamic>{
      if (cachingConfig != null) 'cachingConfig': cachingConfig,
      if (dataSourceName != null) 'dataSourceName': dataSourceName,
      if (kind != null) 'kind': kind.toValue(),
      if (pipelineConfig != null) 'pipelineConfig': pipelineConfig,
      if (requestMappingTemplate != null)
        'requestMappingTemplate': requestMappingTemplate,
      if (responseMappingTemplate != null)
        'responseMappingTemplate': responseMappingTemplate,
      if (syncConfig != null) 'syncConfig': syncConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/types/${Uri.encodeComponent(typeName)}/resolvers/${Uri.encodeComponent(fieldName)}',
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
    required String apiId,
    required TypeDefinitionFormat format,
    required String typeName,
    String? definition,
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
    final $payload = <String, dynamic>{
      'format': format.toValue(),
      if (definition != null) 'definition': definition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/apis/${Uri.encodeComponent(apiId)}/types/${Uri.encodeComponent(typeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTypeResponse.fromJson(response);
  }
}

/// Describes an additional authentication provider.
class AdditionalAuthenticationProvider {
  /// The authentication type: API key, AWS IAM, OIDC, or Amazon Cognito user
  /// pools.
  final AuthenticationType? authenticationType;

  /// The OpenID Connect configuration.
  final OpenIDConnectConfig? openIDConnectConfig;

  /// The Amazon Cognito user pool configuration.
  final CognitoUserPoolConfig? userPoolConfig;

  AdditionalAuthenticationProvider({
    this.authenticationType,
    this.openIDConnectConfig,
    this.userPoolConfig,
  });

  factory AdditionalAuthenticationProvider.fromJson(Map<String, dynamic> json) {
    return AdditionalAuthenticationProvider(
      authenticationType:
          (json['authenticationType'] as String?)?.toAuthenticationType(),
      openIDConnectConfig: json['openIDConnectConfig'] != null
          ? OpenIDConnectConfig.fromJson(
              json['openIDConnectConfig'] as Map<String, dynamic>)
          : null,
      userPoolConfig: json['userPoolConfig'] != null
          ? CognitoUserPoolConfig.fromJson(
              json['userPoolConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationType = this.authenticationType;
    final openIDConnectConfig = this.openIDConnectConfig;
    final userPoolConfig = this.userPoolConfig;
    return {
      if (authenticationType != null)
        'authenticationType': authenticationType.toValue(),
      if (openIDConnectConfig != null)
        'openIDConnectConfig': openIDConnectConfig,
      if (userPoolConfig != null) 'userPoolConfig': userPoolConfig,
    };
  }
}

/// The <code>ApiCache</code> object.
class ApiCache {
  /// Caching behavior.
  ///
  /// <ul>
  /// <li>
  /// <b>FULL_REQUEST_CACHING</b>: All requests are fully cached.
  /// </li>
  /// <li>
  /// <b>PER_RESOLVER_CACHING</b>: Individual resolvers that you specify are
  /// cached.
  /// </li>
  /// </ul>
  final ApiCachingBehavior? apiCachingBehavior;

  /// At rest encryption flag for cache. This setting cannot be updated after
  /// creation.
  final bool? atRestEncryptionEnabled;

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
  final ApiCacheStatus? status;

  /// Transit encryption flag when connecting to cache. This setting cannot be
  /// updated after creation.
  final bool? transitEncryptionEnabled;

  /// TTL in seconds for cache entries.
  ///
  /// Valid values are between 1 and 3600 seconds.
  final int? ttl;

  /// The cache instance type. Valid values are
  ///
  /// <ul>
  /// <li>
  /// <code>SMALL</code>
  /// </li>
  /// <li>
  /// <code>MEDIUM</code>
  /// </li>
  /// <li>
  /// <code>LARGE</code>
  /// </li>
  /// <li>
  /// <code>XLARGE</code>
  /// </li>
  /// <li>
  /// <code>LARGE_2X</code>
  /// </li>
  /// <li>
  /// <code>LARGE_4X</code>
  /// </li>
  /// <li>
  /// <code>LARGE_8X</code> (not available in all regions)
  /// </li>
  /// <li>
  /// <code>LARGE_12X</code>
  /// </li>
  /// </ul>
  /// Historically, instance types were identified by an EC2-style value. As of
  /// July 2020, this is deprecated, and the generic identifiers above should be
  /// used.
  ///
  /// The following legacy instance types are available, but their use is
  /// discouraged:
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
  final ApiCacheType? type;

  ApiCache({
    this.apiCachingBehavior,
    this.atRestEncryptionEnabled,
    this.status,
    this.transitEncryptionEnabled,
    this.ttl,
    this.type,
  });

  factory ApiCache.fromJson(Map<String, dynamic> json) {
    return ApiCache(
      apiCachingBehavior:
          (json['apiCachingBehavior'] as String?)?.toApiCachingBehavior(),
      atRestEncryptionEnabled: json['atRestEncryptionEnabled'] as bool?,
      status: (json['status'] as String?)?.toApiCacheStatus(),
      transitEncryptionEnabled: json['transitEncryptionEnabled'] as bool?,
      ttl: json['ttl'] as int?,
      type: (json['type'] as String?)?.toApiCacheType(),
    );
  }

  Map<String, dynamic> toJson() {
    final apiCachingBehavior = this.apiCachingBehavior;
    final atRestEncryptionEnabled = this.atRestEncryptionEnabled;
    final status = this.status;
    final transitEncryptionEnabled = this.transitEncryptionEnabled;
    final ttl = this.ttl;
    final type = this.type;
    return {
      if (apiCachingBehavior != null)
        'apiCachingBehavior': apiCachingBehavior.toValue(),
      if (atRestEncryptionEnabled != null)
        'atRestEncryptionEnabled': atRestEncryptionEnabled,
      if (status != null) 'status': status.toValue(),
      if (transitEncryptionEnabled != null)
        'transitEncryptionEnabled': transitEncryptionEnabled,
      if (ttl != null) 'ttl': ttl,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum ApiCacheStatus {
  available,
  creating,
  deleting,
  modifying,
  failed,
}

extension on ApiCacheStatus {
  String toValue() {
    switch (this) {
      case ApiCacheStatus.available:
        return 'AVAILABLE';
      case ApiCacheStatus.creating:
        return 'CREATING';
      case ApiCacheStatus.deleting:
        return 'DELETING';
      case ApiCacheStatus.modifying:
        return 'MODIFYING';
      case ApiCacheStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  ApiCacheStatus toApiCacheStatus() {
    switch (this) {
      case 'AVAILABLE':
        return ApiCacheStatus.available;
      case 'CREATING':
        return ApiCacheStatus.creating;
      case 'DELETING':
        return ApiCacheStatus.deleting;
      case 'MODIFYING':
        return ApiCacheStatus.modifying;
      case 'FAILED':
        return ApiCacheStatus.failed;
    }
    throw Exception('$this is not known in enum ApiCacheStatus');
  }
}

enum ApiCacheType {
  t2Small,
  t2Medium,
  r4Large,
  r4Xlarge,
  r4_2xlarge,
  r4_4xlarge,
  r4_8xlarge,
  small,
  medium,
  large,
  xlarge,
  large_2x,
  large_4x,
  large_8x,
  large_12x,
}

extension on ApiCacheType {
  String toValue() {
    switch (this) {
      case ApiCacheType.t2Small:
        return 'T2_SMALL';
      case ApiCacheType.t2Medium:
        return 'T2_MEDIUM';
      case ApiCacheType.r4Large:
        return 'R4_LARGE';
      case ApiCacheType.r4Xlarge:
        return 'R4_XLARGE';
      case ApiCacheType.r4_2xlarge:
        return 'R4_2XLARGE';
      case ApiCacheType.r4_4xlarge:
        return 'R4_4XLARGE';
      case ApiCacheType.r4_8xlarge:
        return 'R4_8XLARGE';
      case ApiCacheType.small:
        return 'SMALL';
      case ApiCacheType.medium:
        return 'MEDIUM';
      case ApiCacheType.large:
        return 'LARGE';
      case ApiCacheType.xlarge:
        return 'XLARGE';
      case ApiCacheType.large_2x:
        return 'LARGE_2X';
      case ApiCacheType.large_4x:
        return 'LARGE_4X';
      case ApiCacheType.large_8x:
        return 'LARGE_8X';
      case ApiCacheType.large_12x:
        return 'LARGE_12X';
    }
  }
}

extension on String {
  ApiCacheType toApiCacheType() {
    switch (this) {
      case 'T2_SMALL':
        return ApiCacheType.t2Small;
      case 'T2_MEDIUM':
        return ApiCacheType.t2Medium;
      case 'R4_LARGE':
        return ApiCacheType.r4Large;
      case 'R4_XLARGE':
        return ApiCacheType.r4Xlarge;
      case 'R4_2XLARGE':
        return ApiCacheType.r4_2xlarge;
      case 'R4_4XLARGE':
        return ApiCacheType.r4_4xlarge;
      case 'R4_8XLARGE':
        return ApiCacheType.r4_8xlarge;
      case 'SMALL':
        return ApiCacheType.small;
      case 'MEDIUM':
        return ApiCacheType.medium;
      case 'LARGE':
        return ApiCacheType.large;
      case 'XLARGE':
        return ApiCacheType.xlarge;
      case 'LARGE_2X':
        return ApiCacheType.large_2x;
      case 'LARGE_4X':
        return ApiCacheType.large_4x;
      case 'LARGE_8X':
        return ApiCacheType.large_8x;
      case 'LARGE_12X':
        return ApiCacheType.large_12x;
    }
    throw Exception('$this is not known in enum ApiCacheType');
  }
}

enum ApiCachingBehavior {
  fullRequestCaching,
  perResolverCaching,
}

extension on ApiCachingBehavior {
  String toValue() {
    switch (this) {
      case ApiCachingBehavior.fullRequestCaching:
        return 'FULL_REQUEST_CACHING';
      case ApiCachingBehavior.perResolverCaching:
        return 'PER_RESOLVER_CACHING';
    }
  }
}

extension on String {
  ApiCachingBehavior toApiCachingBehavior() {
    switch (this) {
      case 'FULL_REQUEST_CACHING':
        return ApiCachingBehavior.fullRequestCaching;
      case 'PER_RESOLVER_CACHING':
        return ApiCachingBehavior.perResolverCaching;
    }
    throw Exception('$this is not known in enum ApiCachingBehavior');
  }
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
/// <code>ListApiKeys</code> returns the expiration time and deletion time in
/// seconds.
/// </li>
/// <li>
/// <code>CreateApiKey</code> returns the expiration time and deletion time in
/// seconds and accepts a user-provided expiration time in seconds.
/// </li>
/// <li>
/// <code>UpdateApiKey</code> returns the expiration time and and deletion time
/// in seconds and accepts a user-provided expiration time in seconds. Expired
/// API keys are kept for 60 days after the expiration time. Key expiration time
/// can be updated while the key is not deleted.
/// </li>
/// <li>
/// <code>DeleteApiKey</code> deletes the item from the table.
/// </li>
/// <li>
/// Expiration is stored in Amazon DynamoDB as seconds. After the expiration
/// time, using the key to authenticate will fail. But the key can be reinstated
/// before deletion.
/// </li>
/// <li>
/// Deletion is stored in Amazon DynamoDB as seconds. The key will be deleted
/// after deletion time.
/// </li>
/// </ul>
class ApiKey {
  /// The time after which the API key is deleted. The date is represented as
  /// seconds since the epoch, rounded down to the nearest hour.
  final int? deletes;

  /// A description of the purpose of the API key.
  final String? description;

  /// The time after which the API key expires. The date is represented as seconds
  /// since the epoch, rounded down to the nearest hour.
  final int? expires;

  /// The API key ID.
  final String? id;

  ApiKey({
    this.deletes,
    this.description,
    this.expires,
    this.id,
  });

  factory ApiKey.fromJson(Map<String, dynamic> json) {
    return ApiKey(
      deletes: json['deletes'] as int?,
      description: json['description'] as String?,
      expires: json['expires'] as int?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deletes = this.deletes;
    final description = this.description;
    final expires = this.expires;
    final id = this.id;
    return {
      if (deletes != null) 'deletes': deletes,
      if (description != null) 'description': description,
      if (expires != null) 'expires': expires,
      if (id != null) 'id': id,
    };
  }
}

enum AuthenticationType {
  apiKey,
  awsIam,
  amazonCognitoUserPools,
  openidConnect,
}

extension on AuthenticationType {
  String toValue() {
    switch (this) {
      case AuthenticationType.apiKey:
        return 'API_KEY';
      case AuthenticationType.awsIam:
        return 'AWS_IAM';
      case AuthenticationType.amazonCognitoUserPools:
        return 'AMAZON_COGNITO_USER_POOLS';
      case AuthenticationType.openidConnect:
        return 'OPENID_CONNECT';
    }
  }
}

extension on String {
  AuthenticationType toAuthenticationType() {
    switch (this) {
      case 'API_KEY':
        return AuthenticationType.apiKey;
      case 'AWS_IAM':
        return AuthenticationType.awsIam;
      case 'AMAZON_COGNITO_USER_POOLS':
        return AuthenticationType.amazonCognitoUserPools;
      case 'OPENID_CONNECT':
        return AuthenticationType.openidConnect;
    }
    throw Exception('$this is not known in enum AuthenticationType');
  }
}

/// The authorization config in case the HTTP endpoint requires authorization.
class AuthorizationConfig {
  /// The authorization type required by the HTTP endpoint.
  ///
  /// <ul>
  /// <li>
  /// <b>AWS_IAM</b>: The authorization type is Sigv4.
  /// </li>
  /// </ul>
  final AuthorizationType authorizationType;

  /// The AWS IAM settings.
  final AwsIamConfig? awsIamConfig;

  AuthorizationConfig({
    required this.authorizationType,
    this.awsIamConfig,
  });

  factory AuthorizationConfig.fromJson(Map<String, dynamic> json) {
    return AuthorizationConfig(
      authorizationType:
          (json['authorizationType'] as String).toAuthorizationType(),
      awsIamConfig: json['awsIamConfig'] != null
          ? AwsIamConfig.fromJson(json['awsIamConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationType = this.authorizationType;
    final awsIamConfig = this.awsIamConfig;
    return {
      'authorizationType': authorizationType.toValue(),
      if (awsIamConfig != null) 'awsIamConfig': awsIamConfig,
    };
  }
}

enum AuthorizationType {
  awsIam,
}

extension on AuthorizationType {
  String toValue() {
    switch (this) {
      case AuthorizationType.awsIam:
        return 'AWS_IAM';
    }
  }
}

extension on String {
  AuthorizationType toAuthorizationType() {
    switch (this) {
      case 'AWS_IAM':
        return AuthorizationType.awsIam;
    }
    throw Exception('$this is not known in enum AuthorizationType');
  }
}

/// The AWS IAM configuration.
class AwsIamConfig {
  /// The signing region for AWS IAM authorization.
  final String? signingRegion;

  /// The signing service name for AWS IAM authorization.
  final String? signingServiceName;

  AwsIamConfig({
    this.signingRegion,
    this.signingServiceName,
  });

  factory AwsIamConfig.fromJson(Map<String, dynamic> json) {
    return AwsIamConfig(
      signingRegion: json['signingRegion'] as String?,
      signingServiceName: json['signingServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final signingRegion = this.signingRegion;
    final signingServiceName = this.signingServiceName;
    return {
      if (signingRegion != null) 'signingRegion': signingRegion,
      if (signingServiceName != null) 'signingServiceName': signingServiceName,
    };
  }
}

/// The caching configuration for a resolver that has caching enabled.
class CachingConfig {
  /// The caching keys for a resolver that has caching enabled.
  ///
  /// Valid values are entries from the <code>$context.arguments</code>,
  /// <code>$context.source</code>, and <code>$context.identity</code> maps.
  final List<String>? cachingKeys;

  /// The TTL in seconds for a resolver that has caching enabled.
  ///
  /// Valid values are between 1 and 3600 seconds.
  final int? ttl;

  CachingConfig({
    this.cachingKeys,
    this.ttl,
  });

  factory CachingConfig.fromJson(Map<String, dynamic> json) {
    return CachingConfig(
      cachingKeys: (json['cachingKeys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ttl: json['ttl'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cachingKeys = this.cachingKeys;
    final ttl = this.ttl;
    return {
      if (cachingKeys != null) 'cachingKeys': cachingKeys,
      if (ttl != null) 'ttl': ttl,
    };
  }
}

/// Describes an Amazon Cognito user pool configuration.
class CognitoUserPoolConfig {
  /// The AWS Region in which the user pool was created.
  final String awsRegion;

  /// The user pool ID.
  final String userPoolId;

  /// A regular expression for validating the incoming Amazon Cognito user pool
  /// app client ID.
  final String? appIdClientRegex;

  CognitoUserPoolConfig({
    required this.awsRegion,
    required this.userPoolId,
    this.appIdClientRegex,
  });

  factory CognitoUserPoolConfig.fromJson(Map<String, dynamic> json) {
    return CognitoUserPoolConfig(
      awsRegion: json['awsRegion'] as String,
      userPoolId: json['userPoolId'] as String,
      appIdClientRegex: json['appIdClientRegex'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final userPoolId = this.userPoolId;
    final appIdClientRegex = this.appIdClientRegex;
    return {
      'awsRegion': awsRegion,
      'userPoolId': userPoolId,
      if (appIdClientRegex != null) 'appIdClientRegex': appIdClientRegex,
    };
  }
}

enum ConflictDetectionType {
  version,
  none,
}

extension on ConflictDetectionType {
  String toValue() {
    switch (this) {
      case ConflictDetectionType.version:
        return 'VERSION';
      case ConflictDetectionType.none:
        return 'NONE';
    }
  }
}

extension on String {
  ConflictDetectionType toConflictDetectionType() {
    switch (this) {
      case 'VERSION':
        return ConflictDetectionType.version;
      case 'NONE':
        return ConflictDetectionType.none;
    }
    throw Exception('$this is not known in enum ConflictDetectionType');
  }
}

enum ConflictHandlerType {
  optimisticConcurrency,
  lambda,
  automerge,
  none,
}

extension on ConflictHandlerType {
  String toValue() {
    switch (this) {
      case ConflictHandlerType.optimisticConcurrency:
        return 'OPTIMISTIC_CONCURRENCY';
      case ConflictHandlerType.lambda:
        return 'LAMBDA';
      case ConflictHandlerType.automerge:
        return 'AUTOMERGE';
      case ConflictHandlerType.none:
        return 'NONE';
    }
  }
}

extension on String {
  ConflictHandlerType toConflictHandlerType() {
    switch (this) {
      case 'OPTIMISTIC_CONCURRENCY':
        return ConflictHandlerType.optimisticConcurrency;
      case 'LAMBDA':
        return ConflictHandlerType.lambda;
      case 'AUTOMERGE':
        return ConflictHandlerType.automerge;
      case 'NONE':
        return ConflictHandlerType.none;
    }
    throw Exception('$this is not known in enum ConflictHandlerType');
  }
}

/// Represents the output of a <code>CreateApiCache</code> operation.
class CreateApiCacheResponse {
  /// The <code>ApiCache</code> object.
  final ApiCache? apiCache;

  CreateApiCacheResponse({
    this.apiCache,
  });

  factory CreateApiCacheResponse.fromJson(Map<String, dynamic> json) {
    return CreateApiCacheResponse(
      apiCache: json['apiCache'] != null
          ? ApiCache.fromJson(json['apiCache'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCache = this.apiCache;
    return {
      if (apiCache != null) 'apiCache': apiCache,
    };
  }
}

class CreateApiKeyResponse {
  /// The API key.
  final ApiKey? apiKey;

  CreateApiKeyResponse({
    this.apiKey,
  });

  factory CreateApiKeyResponse.fromJson(Map<String, dynamic> json) {
    return CreateApiKeyResponse(
      apiKey: json['apiKey'] != null
          ? ApiKey.fromJson(json['apiKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    return {
      if (apiKey != null) 'apiKey': apiKey,
    };
  }
}

class CreateDataSourceResponse {
  /// The <code>DataSource</code> object.
  final DataSource? dataSource;

  CreateDataSourceResponse({
    this.dataSource,
  });

  factory CreateDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataSourceResponse(
      dataSource: json['dataSource'] != null
          ? DataSource.fromJson(json['dataSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    return {
      if (dataSource != null) 'dataSource': dataSource,
    };
  }
}

class CreateFunctionResponse {
  /// The <code>Function</code> object.
  final FunctionConfiguration? functionConfiguration;

  CreateFunctionResponse({
    this.functionConfiguration,
  });

  factory CreateFunctionResponse.fromJson(Map<String, dynamic> json) {
    return CreateFunctionResponse(
      functionConfiguration: json['functionConfiguration'] != null
          ? FunctionConfiguration.fromJson(
              json['functionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final functionConfiguration = this.functionConfiguration;
    return {
      if (functionConfiguration != null)
        'functionConfiguration': functionConfiguration,
    };
  }
}

class CreateGraphqlApiResponse {
  /// The <code>GraphqlApi</code>.
  final GraphqlApi? graphqlApi;

  CreateGraphqlApiResponse({
    this.graphqlApi,
  });

  factory CreateGraphqlApiResponse.fromJson(Map<String, dynamic> json) {
    return CreateGraphqlApiResponse(
      graphqlApi: json['graphqlApi'] != null
          ? GraphqlApi.fromJson(json['graphqlApi'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final graphqlApi = this.graphqlApi;
    return {
      if (graphqlApi != null) 'graphqlApi': graphqlApi,
    };
  }
}

class CreateResolverResponse {
  /// The <code>Resolver</code> object.
  final Resolver? resolver;

  CreateResolverResponse({
    this.resolver,
  });

  factory CreateResolverResponse.fromJson(Map<String, dynamic> json) {
    return CreateResolverResponse(
      resolver: json['resolver'] != null
          ? Resolver.fromJson(json['resolver'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resolver = this.resolver;
    return {
      if (resolver != null) 'resolver': resolver,
    };
  }
}

class CreateTypeResponse {
  /// The <code>Type</code> object.
  final Type? type;

  CreateTypeResponse({
    this.type,
  });

  factory CreateTypeResponse.fromJson(Map<String, dynamic> json) {
    return CreateTypeResponse(
      type: json['type'] != null
          ? Type.fromJson(json['type'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type,
    };
  }
}

/// Describes a data source.
class DataSource {
  /// The data source ARN.
  final String? dataSourceArn;

  /// The description of the data source.
  final String? description;

  /// Amazon DynamoDB settings.
  final DynamodbDataSourceConfig? dynamodbConfig;

  /// Amazon Elasticsearch Service settings.
  final ElasticsearchDataSourceConfig? elasticsearchConfig;

  /// HTTP endpoint settings.
  final HttpDataSourceConfig? httpConfig;

  /// AWS Lambda settings.
  final LambdaDataSourceConfig? lambdaConfig;

  /// The name of the data source.
  final String? name;

  /// Relational database settings.
  final RelationalDatabaseDataSourceConfig? relationalDatabaseConfig;

  /// The AWS IAM service role ARN for the data source. The system assumes this
  /// role when accessing the data source.
  final String? serviceRoleArn;

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
  final DataSourceType? type;

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

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      dataSourceArn: json['dataSourceArn'] as String?,
      description: json['description'] as String?,
      dynamodbConfig: json['dynamodbConfig'] != null
          ? DynamodbDataSourceConfig.fromJson(
              json['dynamodbConfig'] as Map<String, dynamic>)
          : null,
      elasticsearchConfig: json['elasticsearchConfig'] != null
          ? ElasticsearchDataSourceConfig.fromJson(
              json['elasticsearchConfig'] as Map<String, dynamic>)
          : null,
      httpConfig: json['httpConfig'] != null
          ? HttpDataSourceConfig.fromJson(
              json['httpConfig'] as Map<String, dynamic>)
          : null,
      lambdaConfig: json['lambdaConfig'] != null
          ? LambdaDataSourceConfig.fromJson(
              json['lambdaConfig'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      relationalDatabaseConfig: json['relationalDatabaseConfig'] != null
          ? RelationalDatabaseDataSourceConfig.fromJson(
              json['relationalDatabaseConfig'] as Map<String, dynamic>)
          : null,
      serviceRoleArn: json['serviceRoleArn'] as String?,
      type: (json['type'] as String?)?.toDataSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceArn = this.dataSourceArn;
    final description = this.description;
    final dynamodbConfig = this.dynamodbConfig;
    final elasticsearchConfig = this.elasticsearchConfig;
    final httpConfig = this.httpConfig;
    final lambdaConfig = this.lambdaConfig;
    final name = this.name;
    final relationalDatabaseConfig = this.relationalDatabaseConfig;
    final serviceRoleArn = this.serviceRoleArn;
    final type = this.type;
    return {
      if (dataSourceArn != null) 'dataSourceArn': dataSourceArn,
      if (description != null) 'description': description,
      if (dynamodbConfig != null) 'dynamodbConfig': dynamodbConfig,
      if (elasticsearchConfig != null)
        'elasticsearchConfig': elasticsearchConfig,
      if (httpConfig != null) 'httpConfig': httpConfig,
      if (lambdaConfig != null) 'lambdaConfig': lambdaConfig,
      if (name != null) 'name': name,
      if (relationalDatabaseConfig != null)
        'relationalDatabaseConfig': relationalDatabaseConfig,
      if (serviceRoleArn != null) 'serviceRoleArn': serviceRoleArn,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum DataSourceType {
  awsLambda,
  amazonDynamodb,
  amazonElasticsearch,
  none,
  http,
  relationalDatabase,
}

extension on DataSourceType {
  String toValue() {
    switch (this) {
      case DataSourceType.awsLambda:
        return 'AWS_LAMBDA';
      case DataSourceType.amazonDynamodb:
        return 'AMAZON_DYNAMODB';
      case DataSourceType.amazonElasticsearch:
        return 'AMAZON_ELASTICSEARCH';
      case DataSourceType.none:
        return 'NONE';
      case DataSourceType.http:
        return 'HTTP';
      case DataSourceType.relationalDatabase:
        return 'RELATIONAL_DATABASE';
    }
  }
}

extension on String {
  DataSourceType toDataSourceType() {
    switch (this) {
      case 'AWS_LAMBDA':
        return DataSourceType.awsLambda;
      case 'AMAZON_DYNAMODB':
        return DataSourceType.amazonDynamodb;
      case 'AMAZON_ELASTICSEARCH':
        return DataSourceType.amazonElasticsearch;
      case 'NONE':
        return DataSourceType.none;
      case 'HTTP':
        return DataSourceType.http;
      case 'RELATIONAL_DATABASE':
        return DataSourceType.relationalDatabase;
    }
    throw Exception('$this is not known in enum DataSourceType');
  }
}

enum DefaultAction {
  allow,
  deny,
}

extension on DefaultAction {
  String toValue() {
    switch (this) {
      case DefaultAction.allow:
        return 'ALLOW';
      case DefaultAction.deny:
        return 'DENY';
    }
  }
}

extension on String {
  DefaultAction toDefaultAction() {
    switch (this) {
      case 'ALLOW':
        return DefaultAction.allow;
      case 'DENY':
        return DefaultAction.deny;
    }
    throw Exception('$this is not known in enum DefaultAction');
  }
}

/// Represents the output of a <code>DeleteApiCache</code> operation.
class DeleteApiCacheResponse {
  DeleteApiCacheResponse();

  factory DeleteApiCacheResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApiCacheResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteApiKeyResponse {
  DeleteApiKeyResponse();

  factory DeleteApiKeyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApiKeyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDataSourceResponse {
  DeleteDataSourceResponse();

  factory DeleteDataSourceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDataSourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFunctionResponse {
  DeleteFunctionResponse();

  factory DeleteFunctionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFunctionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteGraphqlApiResponse {
  DeleteGraphqlApiResponse();

  factory DeleteGraphqlApiResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGraphqlApiResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteResolverResponse {
  DeleteResolverResponse();

  factory DeleteResolverResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResolverResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTypeResponse {
  DeleteTypeResponse();

  factory DeleteTypeResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTypeResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes a Delta Sync configuration.
class DeltaSyncConfig {
  /// The number of minutes an Item is stored in the datasource.
  final int? baseTableTTL;

  /// The Delta Sync table name.
  final String? deltaSyncTableName;

  /// The number of minutes a Delta Sync log entry is stored in the Delta Sync
  /// table.
  final int? deltaSyncTableTTL;

  DeltaSyncConfig({
    this.baseTableTTL,
    this.deltaSyncTableName,
    this.deltaSyncTableTTL,
  });

  factory DeltaSyncConfig.fromJson(Map<String, dynamic> json) {
    return DeltaSyncConfig(
      baseTableTTL: json['baseTableTTL'] as int?,
      deltaSyncTableName: json['deltaSyncTableName'] as String?,
      deltaSyncTableTTL: json['deltaSyncTableTTL'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseTableTTL = this.baseTableTTL;
    final deltaSyncTableName = this.deltaSyncTableName;
    final deltaSyncTableTTL = this.deltaSyncTableTTL;
    return {
      if (baseTableTTL != null) 'baseTableTTL': baseTableTTL,
      if (deltaSyncTableName != null) 'deltaSyncTableName': deltaSyncTableName,
      if (deltaSyncTableTTL != null) 'deltaSyncTableTTL': deltaSyncTableTTL,
    };
  }
}

/// Describes an Amazon DynamoDB data source configuration.
class DynamodbDataSourceConfig {
  /// The AWS Region.
  final String awsRegion;

  /// The table name.
  final String tableName;

  /// The <code>DeltaSyncConfig</code> for a versioned datasource.
  final DeltaSyncConfig? deltaSyncConfig;

  /// Set to TRUE to use Amazon Cognito credentials with this data source.
  final bool? useCallerCredentials;

  /// Set to TRUE to use Conflict Detection and Resolution with this data source.
  final bool? versioned;

  DynamodbDataSourceConfig({
    required this.awsRegion,
    required this.tableName,
    this.deltaSyncConfig,
    this.useCallerCredentials,
    this.versioned,
  });

  factory DynamodbDataSourceConfig.fromJson(Map<String, dynamic> json) {
    return DynamodbDataSourceConfig(
      awsRegion: json['awsRegion'] as String,
      tableName: json['tableName'] as String,
      deltaSyncConfig: json['deltaSyncConfig'] != null
          ? DeltaSyncConfig.fromJson(
              json['deltaSyncConfig'] as Map<String, dynamic>)
          : null,
      useCallerCredentials: json['useCallerCredentials'] as bool?,
      versioned: json['versioned'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final tableName = this.tableName;
    final deltaSyncConfig = this.deltaSyncConfig;
    final useCallerCredentials = this.useCallerCredentials;
    final versioned = this.versioned;
    return {
      'awsRegion': awsRegion,
      'tableName': tableName,
      if (deltaSyncConfig != null) 'deltaSyncConfig': deltaSyncConfig,
      if (useCallerCredentials != null)
        'useCallerCredentials': useCallerCredentials,
      if (versioned != null) 'versioned': versioned,
    };
  }
}

/// Describes an Elasticsearch data source configuration.
class ElasticsearchDataSourceConfig {
  /// The AWS Region.
  final String awsRegion;

  /// The endpoint.
  final String endpoint;

  ElasticsearchDataSourceConfig({
    required this.awsRegion,
    required this.endpoint,
  });

  factory ElasticsearchDataSourceConfig.fromJson(Map<String, dynamic> json) {
    return ElasticsearchDataSourceConfig(
      awsRegion: json['awsRegion'] as String,
      endpoint: json['endpoint'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final endpoint = this.endpoint;
    return {
      'awsRegion': awsRegion,
      'endpoint': endpoint,
    };
  }
}

enum FieldLogLevel {
  none,
  error,
  all,
}

extension on FieldLogLevel {
  String toValue() {
    switch (this) {
      case FieldLogLevel.none:
        return 'NONE';
      case FieldLogLevel.error:
        return 'ERROR';
      case FieldLogLevel.all:
        return 'ALL';
    }
  }
}

extension on String {
  FieldLogLevel toFieldLogLevel() {
    switch (this) {
      case 'NONE':
        return FieldLogLevel.none;
      case 'ERROR':
        return FieldLogLevel.error;
      case 'ALL':
        return FieldLogLevel.all;
    }
    throw Exception('$this is not known in enum FieldLogLevel');
  }
}

/// Represents the output of a <code>FlushApiCache</code> operation.
class FlushApiCacheResponse {
  FlushApiCacheResponse();

  factory FlushApiCacheResponse.fromJson(Map<String, dynamic> _) {
    return FlushApiCacheResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A function is a reusable entity. Multiple functions can be used to compose
/// the resolver logic.
class FunctionConfiguration {
  /// The name of the <code>DataSource</code>.
  final String? dataSourceName;

  /// The <code>Function</code> description.
  final String? description;

  /// The ARN of the <code>Function</code> object.
  final String? functionArn;

  /// A unique ID representing the <code>Function</code> object.
  final String? functionId;

  /// The version of the request mapping template. Currently only the 2018-05-29
  /// version of the template is supported.
  final String? functionVersion;

  /// The name of the <code>Function</code> object.
  final String? name;

  /// The <code>Function</code> request mapping template. Functions support only
  /// the 2018-05-29 version of the request mapping template.
  final String? requestMappingTemplate;

  /// The <code>Function</code> response mapping template.
  final String? responseMappingTemplate;
  final SyncConfig? syncConfig;

  FunctionConfiguration({
    this.dataSourceName,
    this.description,
    this.functionArn,
    this.functionId,
    this.functionVersion,
    this.name,
    this.requestMappingTemplate,
    this.responseMappingTemplate,
    this.syncConfig,
  });

  factory FunctionConfiguration.fromJson(Map<String, dynamic> json) {
    return FunctionConfiguration(
      dataSourceName: json['dataSourceName'] as String?,
      description: json['description'] as String?,
      functionArn: json['functionArn'] as String?,
      functionId: json['functionId'] as String?,
      functionVersion: json['functionVersion'] as String?,
      name: json['name'] as String?,
      requestMappingTemplate: json['requestMappingTemplate'] as String?,
      responseMappingTemplate: json['responseMappingTemplate'] as String?,
      syncConfig: json['syncConfig'] != null
          ? SyncConfig.fromJson(json['syncConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceName = this.dataSourceName;
    final description = this.description;
    final functionArn = this.functionArn;
    final functionId = this.functionId;
    final functionVersion = this.functionVersion;
    final name = this.name;
    final requestMappingTemplate = this.requestMappingTemplate;
    final responseMappingTemplate = this.responseMappingTemplate;
    final syncConfig = this.syncConfig;
    return {
      if (dataSourceName != null) 'dataSourceName': dataSourceName,
      if (description != null) 'description': description,
      if (functionArn != null) 'functionArn': functionArn,
      if (functionId != null) 'functionId': functionId,
      if (functionVersion != null) 'functionVersion': functionVersion,
      if (name != null) 'name': name,
      if (requestMappingTemplate != null)
        'requestMappingTemplate': requestMappingTemplate,
      if (responseMappingTemplate != null)
        'responseMappingTemplate': responseMappingTemplate,
      if (syncConfig != null) 'syncConfig': syncConfig,
    };
  }
}

/// Represents the output of a <code>GetApiCache</code> operation.
class GetApiCacheResponse {
  /// The <code>ApiCache</code> object.
  final ApiCache? apiCache;

  GetApiCacheResponse({
    this.apiCache,
  });

  factory GetApiCacheResponse.fromJson(Map<String, dynamic> json) {
    return GetApiCacheResponse(
      apiCache: json['apiCache'] != null
          ? ApiCache.fromJson(json['apiCache'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCache = this.apiCache;
    return {
      if (apiCache != null) 'apiCache': apiCache,
    };
  }
}

class GetDataSourceResponse {
  /// The <code>DataSource</code> object.
  final DataSource? dataSource;

  GetDataSourceResponse({
    this.dataSource,
  });

  factory GetDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return GetDataSourceResponse(
      dataSource: json['dataSource'] != null
          ? DataSource.fromJson(json['dataSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    return {
      if (dataSource != null) 'dataSource': dataSource,
    };
  }
}

class GetFunctionResponse {
  /// The <code>Function</code> object.
  final FunctionConfiguration? functionConfiguration;

  GetFunctionResponse({
    this.functionConfiguration,
  });

  factory GetFunctionResponse.fromJson(Map<String, dynamic> json) {
    return GetFunctionResponse(
      functionConfiguration: json['functionConfiguration'] != null
          ? FunctionConfiguration.fromJson(
              json['functionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final functionConfiguration = this.functionConfiguration;
    return {
      if (functionConfiguration != null)
        'functionConfiguration': functionConfiguration,
    };
  }
}

class GetGraphqlApiResponse {
  /// The <code>GraphqlApi</code> object.
  final GraphqlApi? graphqlApi;

  GetGraphqlApiResponse({
    this.graphqlApi,
  });

  factory GetGraphqlApiResponse.fromJson(Map<String, dynamic> json) {
    return GetGraphqlApiResponse(
      graphqlApi: json['graphqlApi'] != null
          ? GraphqlApi.fromJson(json['graphqlApi'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final graphqlApi = this.graphqlApi;
    return {
      if (graphqlApi != null) 'graphqlApi': graphqlApi,
    };
  }
}

class GetIntrospectionSchemaResponse {
  /// The schema, in GraphQL Schema Definition Language (SDL) format.
  ///
  /// For more information, see the <a
  /// href="http://graphql.org/learn/schema/">GraphQL SDL documentation</a>.
  final Uint8List? schema;

  GetIntrospectionSchemaResponse({
    this.schema,
  });

  factory GetIntrospectionSchemaResponse.fromJson(Map<String, dynamic> json) {
    return GetIntrospectionSchemaResponse(
      schema: _s.decodeNullableUint8List(json['schema'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final schema = this.schema;
    return {
      if (schema != null) 'schema': base64Encode(schema),
    };
  }
}

class GetResolverResponse {
  /// The <code>Resolver</code> object.
  final Resolver? resolver;

  GetResolverResponse({
    this.resolver,
  });

  factory GetResolverResponse.fromJson(Map<String, dynamic> json) {
    return GetResolverResponse(
      resolver: json['resolver'] != null
          ? Resolver.fromJson(json['resolver'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resolver = this.resolver;
    return {
      if (resolver != null) 'resolver': resolver,
    };
  }
}

class GetSchemaCreationStatusResponse {
  /// Detailed information about the status of the schema creation operation.
  final String? details;

  /// The current state of the schema (PROCESSING, FAILED, SUCCESS, or
  /// NOT_APPLICABLE). When the schema is in the ACTIVE state, you can add data.
  final SchemaStatus? status;

  GetSchemaCreationStatusResponse({
    this.details,
    this.status,
  });

  factory GetSchemaCreationStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetSchemaCreationStatusResponse(
      details: json['details'] as String?,
      status: (json['status'] as String?)?.toSchemaStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final status = this.status;
    return {
      if (details != null) 'details': details,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class GetTypeResponse {
  /// The <code>Type</code> object.
  final Type? type;

  GetTypeResponse({
    this.type,
  });

  factory GetTypeResponse.fromJson(Map<String, dynamic> json) {
    return GetTypeResponse(
      type: json['type'] != null
          ? Type.fromJson(json['type'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type,
    };
  }
}

/// Describes a GraphQL API.
class GraphqlApi {
  /// A list of additional authentication providers for the
  /// <code>GraphqlApi</code> API.
  final List<AdditionalAuthenticationProvider>?
      additionalAuthenticationProviders;

  /// The API ID.
  final String? apiId;

  /// The ARN.
  final String? arn;

  /// The authentication type.
  final AuthenticationType? authenticationType;

  /// The Amazon CloudWatch Logs configuration.
  final LogConfig? logConfig;

  /// The API name.
  final String? name;

  /// The OpenID Connect configuration.
  final OpenIDConnectConfig? openIDConnectConfig;

  /// The tags.
  final Map<String, String>? tags;

  /// The URIs.
  final Map<String, String>? uris;

  /// The Amazon Cognito user pool configuration.
  final UserPoolConfig? userPoolConfig;

  /// The ARN of the AWS Web Application Firewall (WAF) ACL associated with this
  /// <code>GraphqlApi</code>, if one exists.
  final String? wafWebAclArn;

  /// A flag representing whether X-Ray tracing is enabled for this
  /// <code>GraphqlApi</code>.
  final bool? xrayEnabled;

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
    this.wafWebAclArn,
    this.xrayEnabled,
  });

  factory GraphqlApi.fromJson(Map<String, dynamic> json) {
    return GraphqlApi(
      additionalAuthenticationProviders:
          (json['additionalAuthenticationProviders'] as List?)
              ?.whereNotNull()
              .map((e) => AdditionalAuthenticationProvider.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      apiId: json['apiId'] as String?,
      arn: json['arn'] as String?,
      authenticationType:
          (json['authenticationType'] as String?)?.toAuthenticationType(),
      logConfig: json['logConfig'] != null
          ? LogConfig.fromJson(json['logConfig'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      openIDConnectConfig: json['openIDConnectConfig'] != null
          ? OpenIDConnectConfig.fromJson(
              json['openIDConnectConfig'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uris: (json['uris'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      userPoolConfig: json['userPoolConfig'] != null
          ? UserPoolConfig.fromJson(
              json['userPoolConfig'] as Map<String, dynamic>)
          : null,
      wafWebAclArn: json['wafWebAclArn'] as String?,
      xrayEnabled: json['xrayEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalAuthenticationProviders =
        this.additionalAuthenticationProviders;
    final apiId = this.apiId;
    final arn = this.arn;
    final authenticationType = this.authenticationType;
    final logConfig = this.logConfig;
    final name = this.name;
    final openIDConnectConfig = this.openIDConnectConfig;
    final tags = this.tags;
    final uris = this.uris;
    final userPoolConfig = this.userPoolConfig;
    final wafWebAclArn = this.wafWebAclArn;
    final xrayEnabled = this.xrayEnabled;
    return {
      if (additionalAuthenticationProviders != null)
        'additionalAuthenticationProviders': additionalAuthenticationProviders,
      if (apiId != null) 'apiId': apiId,
      if (arn != null) 'arn': arn,
      if (authenticationType != null)
        'authenticationType': authenticationType.toValue(),
      if (logConfig != null) 'logConfig': logConfig,
      if (name != null) 'name': name,
      if (openIDConnectConfig != null)
        'openIDConnectConfig': openIDConnectConfig,
      if (tags != null) 'tags': tags,
      if (uris != null) 'uris': uris,
      if (userPoolConfig != null) 'userPoolConfig': userPoolConfig,
      if (wafWebAclArn != null) 'wafWebAclArn': wafWebAclArn,
      if (xrayEnabled != null) 'xrayEnabled': xrayEnabled,
    };
  }
}

/// Describes an HTTP data source configuration.
class HttpDataSourceConfig {
  /// The authorization config in case the HTTP endpoint requires authorization.
  final AuthorizationConfig? authorizationConfig;

  /// The HTTP URL endpoint. You can either specify the domain name or IP, and
  /// port combination, and the URL scheme must be HTTP or HTTPS. If the port is
  /// not specified, AWS AppSync uses the default port 80 for the HTTP endpoint
  /// and port 443 for HTTPS endpoints.
  final String? endpoint;

  HttpDataSourceConfig({
    this.authorizationConfig,
    this.endpoint,
  });

  factory HttpDataSourceConfig.fromJson(Map<String, dynamic> json) {
    return HttpDataSourceConfig(
      authorizationConfig: json['authorizationConfig'] != null
          ? AuthorizationConfig.fromJson(
              json['authorizationConfig'] as Map<String, dynamic>)
          : null,
      endpoint: json['endpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationConfig = this.authorizationConfig;
    final endpoint = this.endpoint;
    return {
      if (authorizationConfig != null)
        'authorizationConfig': authorizationConfig,
      if (endpoint != null) 'endpoint': endpoint,
    };
  }
}

/// The <code>LambdaConflictHandlerConfig</code> object when configuring LAMBDA
/// as the Conflict Handler.
class LambdaConflictHandlerConfig {
  /// The Arn for the Lambda function to use as the Conflict Handler.
  final String? lambdaConflictHandlerArn;

  LambdaConflictHandlerConfig({
    this.lambdaConflictHandlerArn,
  });

  factory LambdaConflictHandlerConfig.fromJson(Map<String, dynamic> json) {
    return LambdaConflictHandlerConfig(
      lambdaConflictHandlerArn: json['lambdaConflictHandlerArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaConflictHandlerArn = this.lambdaConflictHandlerArn;
    return {
      if (lambdaConflictHandlerArn != null)
        'lambdaConflictHandlerArn': lambdaConflictHandlerArn,
    };
  }
}

/// Describes an AWS Lambda data source configuration.
class LambdaDataSourceConfig {
  /// The ARN for the Lambda function.
  final String lambdaFunctionArn;

  LambdaDataSourceConfig({
    required this.lambdaFunctionArn,
  });

  factory LambdaDataSourceConfig.fromJson(Map<String, dynamic> json) {
    return LambdaDataSourceConfig(
      lambdaFunctionArn: json['lambdaFunctionArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaFunctionArn = this.lambdaFunctionArn;
    return {
      'lambdaFunctionArn': lambdaFunctionArn,
    };
  }
}

class ListApiKeysResponse {
  /// The <code>ApiKey</code> objects.
  final List<ApiKey>? apiKeys;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  final String? nextToken;

  ListApiKeysResponse({
    this.apiKeys,
    this.nextToken,
  });

  factory ListApiKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListApiKeysResponse(
      apiKeys: (json['apiKeys'] as List?)
          ?.whereNotNull()
          .map((e) => ApiKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiKeys = this.apiKeys;
    final nextToken = this.nextToken;
    return {
      if (apiKeys != null) 'apiKeys': apiKeys,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDataSourcesResponse {
  /// The <code>DataSource</code> objects.
  final List<DataSource>? dataSources;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  final String? nextToken;

  ListDataSourcesResponse({
    this.dataSources,
    this.nextToken,
  });

  factory ListDataSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSourcesResponse(
      dataSources: (json['dataSources'] as List?)
          ?.whereNotNull()
          .map((e) => DataSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSources = this.dataSources;
    final nextToken = this.nextToken;
    return {
      if (dataSources != null) 'dataSources': dataSources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFunctionsResponse {
  /// A list of <code>Function</code> objects.
  final List<FunctionConfiguration>? functions;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String? nextToken;

  ListFunctionsResponse({
    this.functions,
    this.nextToken,
  });

  factory ListFunctionsResponse.fromJson(Map<String, dynamic> json) {
    return ListFunctionsResponse(
      functions: (json['functions'] as List?)
          ?.whereNotNull()
          .map((e) => FunctionConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functions = this.functions;
    final nextToken = this.nextToken;
    return {
      if (functions != null) 'functions': functions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListGraphqlApisResponse {
  /// The <code>GraphqlApi</code> objects.
  final List<GraphqlApi>? graphqlApis;

  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  final String? nextToken;

  ListGraphqlApisResponse({
    this.graphqlApis,
    this.nextToken,
  });

  factory ListGraphqlApisResponse.fromJson(Map<String, dynamic> json) {
    return ListGraphqlApisResponse(
      graphqlApis: (json['graphqlApis'] as List?)
          ?.whereNotNull()
          .map((e) => GraphqlApi.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final graphqlApis = this.graphqlApis;
    final nextToken = this.nextToken;
    return {
      if (graphqlApis != null) 'graphqlApis': graphqlApis,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListResolversByFunctionResponse {
  /// An identifier that can be used to return the next set of items in the list.
  final String? nextToken;

  /// The list of resolvers.
  final List<Resolver>? resolvers;

  ListResolversByFunctionResponse({
    this.nextToken,
    this.resolvers,
  });

  factory ListResolversByFunctionResponse.fromJson(Map<String, dynamic> json) {
    return ListResolversByFunctionResponse(
      nextToken: json['nextToken'] as String?,
      resolvers: (json['resolvers'] as List?)
          ?.whereNotNull()
          .map((e) => Resolver.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resolvers = this.resolvers;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resolvers != null) 'resolvers': resolvers,
    };
  }
}

class ListResolversResponse {
  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  final String? nextToken;

  /// The <code>Resolver</code> objects.
  final List<Resolver>? resolvers;

  ListResolversResponse({
    this.nextToken,
    this.resolvers,
  });

  factory ListResolversResponse.fromJson(Map<String, dynamic> json) {
    return ListResolversResponse(
      nextToken: json['nextToken'] as String?,
      resolvers: (json['resolvers'] as List?)
          ?.whereNotNull()
          .map((e) => Resolver.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resolvers = this.resolvers;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resolvers != null) 'resolvers': resolvers,
    };
  }
}

class ListTagsForResourceResponse {
  /// A <code>TagMap</code> object.
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

class ListTypesResponse {
  /// An identifier to be passed in the next request to this operation to return
  /// the next set of items in the list.
  final String? nextToken;

  /// The <code>Type</code> objects.
  final List<Type>? types;

  ListTypesResponse({
    this.nextToken,
    this.types,
  });

  factory ListTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListTypesResponse(
      nextToken: json['nextToken'] as String?,
      types: (json['types'] as List?)
          ?.whereNotNull()
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final types = this.types;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (types != null) 'types': types,
    };
  }
}

/// The CloudWatch Logs configuration.
class LogConfig {
  /// The service role that AWS AppSync will assume to publish to Amazon
  /// CloudWatch logs in your account.
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
  final FieldLogLevel fieldLogLevel;

  /// Set to TRUE to exclude sections that contain information such as headers,
  /// context, and evaluated mapping templates, regardless of logging level.
  final bool? excludeVerboseContent;

  LogConfig({
    required this.cloudWatchLogsRoleArn,
    required this.fieldLogLevel,
    this.excludeVerboseContent,
  });

  factory LogConfig.fromJson(Map<String, dynamic> json) {
    return LogConfig(
      cloudWatchLogsRoleArn: json['cloudWatchLogsRoleArn'] as String,
      fieldLogLevel: (json['fieldLogLevel'] as String).toFieldLogLevel(),
      excludeVerboseContent: json['excludeVerboseContent'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsRoleArn = this.cloudWatchLogsRoleArn;
    final fieldLogLevel = this.fieldLogLevel;
    final excludeVerboseContent = this.excludeVerboseContent;
    return {
      'cloudWatchLogsRoleArn': cloudWatchLogsRoleArn,
      'fieldLogLevel': fieldLogLevel.toValue(),
      if (excludeVerboseContent != null)
        'excludeVerboseContent': excludeVerboseContent,
    };
  }
}

/// Describes an OpenID Connect configuration.
class OpenIDConnectConfig {
  /// The issuer for the OpenID Connect configuration. The issuer returned by
  /// discovery must exactly match the value of <code>iss</code> in the ID token.
  final String issuer;

  /// The number of milliseconds a token is valid after being authenticated.
  final int? authTTL;

  /// The client identifier of the Relying party at the OpenID identity provider.
  /// This identifier is typically obtained when the Relying party is registered
  /// with the OpenID identity provider. You can specify a regular expression so
  /// the AWS AppSync can validate against multiple client identifiers at a time.
  final String? clientId;

  /// The number of milliseconds a token is valid after being issued to a user.
  final int? iatTTL;

  OpenIDConnectConfig({
    required this.issuer,
    this.authTTL,
    this.clientId,
    this.iatTTL,
  });

  factory OpenIDConnectConfig.fromJson(Map<String, dynamic> json) {
    return OpenIDConnectConfig(
      issuer: json['issuer'] as String,
      authTTL: json['authTTL'] as int?,
      clientId: json['clientId'] as String?,
      iatTTL: json['iatTTL'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final issuer = this.issuer;
    final authTTL = this.authTTL;
    final clientId = this.clientId;
    final iatTTL = this.iatTTL;
    return {
      'issuer': issuer,
      if (authTTL != null) 'authTTL': authTTL,
      if (clientId != null) 'clientId': clientId,
      if (iatTTL != null) 'iatTTL': iatTTL,
    };
  }
}

enum OutputType {
  sdl,
  json,
}

extension on OutputType {
  String toValue() {
    switch (this) {
      case OutputType.sdl:
        return 'SDL';
      case OutputType.json:
        return 'JSON';
    }
  }
}

extension on String {
  OutputType toOutputType() {
    switch (this) {
      case 'SDL':
        return OutputType.sdl;
      case 'JSON':
        return OutputType.json;
    }
    throw Exception('$this is not known in enum OutputType');
  }
}

/// The pipeline configuration for a resolver of kind <code>PIPELINE</code>.
class PipelineConfig {
  /// A list of <code>Function</code> objects.
  final List<String>? functions;

  PipelineConfig({
    this.functions,
  });

  factory PipelineConfig.fromJson(Map<String, dynamic> json) {
    return PipelineConfig(
      functions: (json['functions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final functions = this.functions;
    return {
      if (functions != null) 'functions': functions,
    };
  }
}

/// The Amazon RDS HTTP endpoint configuration.
class RdsHttpEndpointConfig {
  /// AWS Region for RDS HTTP endpoint.
  final String? awsRegion;

  /// AWS secret store ARN for database credentials.
  final String? awsSecretStoreArn;

  /// Logical database name.
  final String? databaseName;

  /// Amazon RDS cluster ARN.
  final String? dbClusterIdentifier;

  /// Logical schema name.
  final String? schema;

  RdsHttpEndpointConfig({
    this.awsRegion,
    this.awsSecretStoreArn,
    this.databaseName,
    this.dbClusterIdentifier,
    this.schema,
  });

  factory RdsHttpEndpointConfig.fromJson(Map<String, dynamic> json) {
    return RdsHttpEndpointConfig(
      awsRegion: json['awsRegion'] as String?,
      awsSecretStoreArn: json['awsSecretStoreArn'] as String?,
      databaseName: json['databaseName'] as String?,
      dbClusterIdentifier: json['dbClusterIdentifier'] as String?,
      schema: json['schema'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final awsSecretStoreArn = this.awsSecretStoreArn;
    final databaseName = this.databaseName;
    final dbClusterIdentifier = this.dbClusterIdentifier;
    final schema = this.schema;
    return {
      if (awsRegion != null) 'awsRegion': awsRegion,
      if (awsSecretStoreArn != null) 'awsSecretStoreArn': awsSecretStoreArn,
      if (databaseName != null) 'databaseName': databaseName,
      if (dbClusterIdentifier != null)
        'dbClusterIdentifier': dbClusterIdentifier,
      if (schema != null) 'schema': schema,
    };
  }
}

/// Describes a relational database data source configuration.
class RelationalDatabaseDataSourceConfig {
  /// Amazon RDS HTTP endpoint settings.
  final RdsHttpEndpointConfig? rdsHttpEndpointConfig;

  /// Source type for the relational database.
  ///
  /// <ul>
  /// <li>
  /// <b>RDS_HTTP_ENDPOINT</b>: The relational database source type is an Amazon
  /// RDS HTTP endpoint.
  /// </li>
  /// </ul>
  final RelationalDatabaseSourceType? relationalDatabaseSourceType;

  RelationalDatabaseDataSourceConfig({
    this.rdsHttpEndpointConfig,
    this.relationalDatabaseSourceType,
  });

  factory RelationalDatabaseDataSourceConfig.fromJson(
      Map<String, dynamic> json) {
    return RelationalDatabaseDataSourceConfig(
      rdsHttpEndpointConfig: json['rdsHttpEndpointConfig'] != null
          ? RdsHttpEndpointConfig.fromJson(
              json['rdsHttpEndpointConfig'] as Map<String, dynamic>)
          : null,
      relationalDatabaseSourceType:
          (json['relationalDatabaseSourceType'] as String?)
              ?.toRelationalDatabaseSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final rdsHttpEndpointConfig = this.rdsHttpEndpointConfig;
    final relationalDatabaseSourceType = this.relationalDatabaseSourceType;
    return {
      if (rdsHttpEndpointConfig != null)
        'rdsHttpEndpointConfig': rdsHttpEndpointConfig,
      if (relationalDatabaseSourceType != null)
        'relationalDatabaseSourceType': relationalDatabaseSourceType.toValue(),
    };
  }
}

enum RelationalDatabaseSourceType {
  rdsHttpEndpoint,
}

extension on RelationalDatabaseSourceType {
  String toValue() {
    switch (this) {
      case RelationalDatabaseSourceType.rdsHttpEndpoint:
        return 'RDS_HTTP_ENDPOINT';
    }
  }
}

extension on String {
  RelationalDatabaseSourceType toRelationalDatabaseSourceType() {
    switch (this) {
      case 'RDS_HTTP_ENDPOINT':
        return RelationalDatabaseSourceType.rdsHttpEndpoint;
    }
    throw Exception('$this is not known in enum RelationalDatabaseSourceType');
  }
}

/// Describes a resolver.
class Resolver {
  /// The caching configuration for the resolver.
  final CachingConfig? cachingConfig;

  /// The resolver data source name.
  final String? dataSourceName;

  /// The resolver field name.
  final String? fieldName;

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
  final ResolverKind? kind;

  /// The <code>PipelineConfig</code>.
  final PipelineConfig? pipelineConfig;

  /// The request mapping template.
  final String? requestMappingTemplate;

  /// The resolver ARN.
  final String? resolverArn;

  /// The response mapping template.
  final String? responseMappingTemplate;

  /// The <code>SyncConfig</code> for a resolver attached to a versioned
  /// datasource.
  final SyncConfig? syncConfig;

  /// The resolver type name.
  final String? typeName;

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

  factory Resolver.fromJson(Map<String, dynamic> json) {
    return Resolver(
      cachingConfig: json['cachingConfig'] != null
          ? CachingConfig.fromJson(
              json['cachingConfig'] as Map<String, dynamic>)
          : null,
      dataSourceName: json['dataSourceName'] as String?,
      fieldName: json['fieldName'] as String?,
      kind: (json['kind'] as String?)?.toResolverKind(),
      pipelineConfig: json['pipelineConfig'] != null
          ? PipelineConfig.fromJson(
              json['pipelineConfig'] as Map<String, dynamic>)
          : null,
      requestMappingTemplate: json['requestMappingTemplate'] as String?,
      resolverArn: json['resolverArn'] as String?,
      responseMappingTemplate: json['responseMappingTemplate'] as String?,
      syncConfig: json['syncConfig'] != null
          ? SyncConfig.fromJson(json['syncConfig'] as Map<String, dynamic>)
          : null,
      typeName: json['typeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cachingConfig = this.cachingConfig;
    final dataSourceName = this.dataSourceName;
    final fieldName = this.fieldName;
    final kind = this.kind;
    final pipelineConfig = this.pipelineConfig;
    final requestMappingTemplate = this.requestMappingTemplate;
    final resolverArn = this.resolverArn;
    final responseMappingTemplate = this.responseMappingTemplate;
    final syncConfig = this.syncConfig;
    final typeName = this.typeName;
    return {
      if (cachingConfig != null) 'cachingConfig': cachingConfig,
      if (dataSourceName != null) 'dataSourceName': dataSourceName,
      if (fieldName != null) 'fieldName': fieldName,
      if (kind != null) 'kind': kind.toValue(),
      if (pipelineConfig != null) 'pipelineConfig': pipelineConfig,
      if (requestMappingTemplate != null)
        'requestMappingTemplate': requestMappingTemplate,
      if (resolverArn != null) 'resolverArn': resolverArn,
      if (responseMappingTemplate != null)
        'responseMappingTemplate': responseMappingTemplate,
      if (syncConfig != null) 'syncConfig': syncConfig,
      if (typeName != null) 'typeName': typeName,
    };
  }
}

enum ResolverKind {
  unit,
  pipeline,
}

extension on ResolverKind {
  String toValue() {
    switch (this) {
      case ResolverKind.unit:
        return 'UNIT';
      case ResolverKind.pipeline:
        return 'PIPELINE';
    }
  }
}

extension on String {
  ResolverKind toResolverKind() {
    switch (this) {
      case 'UNIT':
        return ResolverKind.unit;
      case 'PIPELINE':
        return ResolverKind.pipeline;
    }
    throw Exception('$this is not known in enum ResolverKind');
  }
}

enum SchemaStatus {
  processing,
  active,
  deleting,
  failed,
  success,
  notApplicable,
}

extension on SchemaStatus {
  String toValue() {
    switch (this) {
      case SchemaStatus.processing:
        return 'PROCESSING';
      case SchemaStatus.active:
        return 'ACTIVE';
      case SchemaStatus.deleting:
        return 'DELETING';
      case SchemaStatus.failed:
        return 'FAILED';
      case SchemaStatus.success:
        return 'SUCCESS';
      case SchemaStatus.notApplicable:
        return 'NOT_APPLICABLE';
    }
  }
}

extension on String {
  SchemaStatus toSchemaStatus() {
    switch (this) {
      case 'PROCESSING':
        return SchemaStatus.processing;
      case 'ACTIVE':
        return SchemaStatus.active;
      case 'DELETING':
        return SchemaStatus.deleting;
      case 'FAILED':
        return SchemaStatus.failed;
      case 'SUCCESS':
        return SchemaStatus.success;
      case 'NOT_APPLICABLE':
        return SchemaStatus.notApplicable;
    }
    throw Exception('$this is not known in enum SchemaStatus');
  }
}

class StartSchemaCreationResponse {
  /// The current state of the schema (PROCESSING, FAILED, SUCCESS, or
  /// NOT_APPLICABLE). When the schema is in the ACTIVE state, you can add data.
  final SchemaStatus? status;

  StartSchemaCreationResponse({
    this.status,
  });

  factory StartSchemaCreationResponse.fromJson(Map<String, dynamic> json) {
    return StartSchemaCreationResponse(
      status: (json['status'] as String?)?.toSchemaStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Describes a Sync configuration for a resolver.
///
/// Contains information on which Conflict Detection as well as Resolution
/// strategy should be performed when the resolver is invoked.
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
  final ConflictDetectionType? conflictDetection;

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
  final ConflictHandlerType? conflictHandler;

  /// The <code>LambdaConflictHandlerConfig</code> when configuring LAMBDA as the
  /// Conflict Handler.
  final LambdaConflictHandlerConfig? lambdaConflictHandlerConfig;

  SyncConfig({
    this.conflictDetection,
    this.conflictHandler,
    this.lambdaConflictHandlerConfig,
  });

  factory SyncConfig.fromJson(Map<String, dynamic> json) {
    return SyncConfig(
      conflictDetection:
          (json['conflictDetection'] as String?)?.toConflictDetectionType(),
      conflictHandler:
          (json['conflictHandler'] as String?)?.toConflictHandlerType(),
      lambdaConflictHandlerConfig: json['lambdaConflictHandlerConfig'] != null
          ? LambdaConflictHandlerConfig.fromJson(
              json['lambdaConflictHandlerConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final conflictDetection = this.conflictDetection;
    final conflictHandler = this.conflictHandler;
    final lambdaConflictHandlerConfig = this.lambdaConflictHandlerConfig;
    return {
      if (conflictDetection != null)
        'conflictDetection': conflictDetection.toValue(),
      if (conflictHandler != null) 'conflictHandler': conflictHandler.toValue(),
      if (lambdaConflictHandlerConfig != null)
        'lambdaConflictHandlerConfig': lambdaConflictHandlerConfig,
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

/// Describes a type.
class Type {
  /// The type ARN.
  final String? arn;

  /// The type definition.
  final String? definition;

  /// The type description.
  final String? description;

  /// The type format: SDL or JSON.
  final TypeDefinitionFormat? format;

  /// The type name.
  final String? name;

  Type({
    this.arn,
    this.definition,
    this.description,
    this.format,
    this.name,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      arn: json['arn'] as String?,
      definition: json['definition'] as String?,
      description: json['description'] as String?,
      format: (json['format'] as String?)?.toTypeDefinitionFormat(),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final definition = this.definition;
    final description = this.description;
    final format = this.format;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (definition != null) 'definition': definition,
      if (description != null) 'description': description,
      if (format != null) 'format': format.toValue(),
      if (name != null) 'name': name,
    };
  }
}

enum TypeDefinitionFormat {
  sdl,
  json,
}

extension on TypeDefinitionFormat {
  String toValue() {
    switch (this) {
      case TypeDefinitionFormat.sdl:
        return 'SDL';
      case TypeDefinitionFormat.json:
        return 'JSON';
    }
  }
}

extension on String {
  TypeDefinitionFormat toTypeDefinitionFormat() {
    switch (this) {
      case 'SDL':
        return TypeDefinitionFormat.sdl;
      case 'JSON':
        return TypeDefinitionFormat.json;
    }
    throw Exception('$this is not known in enum TypeDefinitionFormat');
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

/// Represents the output of a <code>UpdateApiCache</code> operation.
class UpdateApiCacheResponse {
  /// The <code>ApiCache</code> object.
  final ApiCache? apiCache;

  UpdateApiCacheResponse({
    this.apiCache,
  });

  factory UpdateApiCacheResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApiCacheResponse(
      apiCache: json['apiCache'] != null
          ? ApiCache.fromJson(json['apiCache'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCache = this.apiCache;
    return {
      if (apiCache != null) 'apiCache': apiCache,
    };
  }
}

class UpdateApiKeyResponse {
  /// The API key.
  final ApiKey? apiKey;

  UpdateApiKeyResponse({
    this.apiKey,
  });

  factory UpdateApiKeyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApiKeyResponse(
      apiKey: json['apiKey'] != null
          ? ApiKey.fromJson(json['apiKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    return {
      if (apiKey != null) 'apiKey': apiKey,
    };
  }
}

class UpdateDataSourceResponse {
  /// The updated <code>DataSource</code> object.
  final DataSource? dataSource;

  UpdateDataSourceResponse({
    this.dataSource,
  });

  factory UpdateDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataSourceResponse(
      dataSource: json['dataSource'] != null
          ? DataSource.fromJson(json['dataSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    return {
      if (dataSource != null) 'dataSource': dataSource,
    };
  }
}

class UpdateFunctionResponse {
  /// The <code>Function</code> object.
  final FunctionConfiguration? functionConfiguration;

  UpdateFunctionResponse({
    this.functionConfiguration,
  });

  factory UpdateFunctionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFunctionResponse(
      functionConfiguration: json['functionConfiguration'] != null
          ? FunctionConfiguration.fromJson(
              json['functionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final functionConfiguration = this.functionConfiguration;
    return {
      if (functionConfiguration != null)
        'functionConfiguration': functionConfiguration,
    };
  }
}

class UpdateGraphqlApiResponse {
  /// The updated <code>GraphqlApi</code> object.
  final GraphqlApi? graphqlApi;

  UpdateGraphqlApiResponse({
    this.graphqlApi,
  });

  factory UpdateGraphqlApiResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGraphqlApiResponse(
      graphqlApi: json['graphqlApi'] != null
          ? GraphqlApi.fromJson(json['graphqlApi'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final graphqlApi = this.graphqlApi;
    return {
      if (graphqlApi != null) 'graphqlApi': graphqlApi,
    };
  }
}

class UpdateResolverResponse {
  /// The updated <code>Resolver</code> object.
  final Resolver? resolver;

  UpdateResolverResponse({
    this.resolver,
  });

  factory UpdateResolverResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResolverResponse(
      resolver: json['resolver'] != null
          ? Resolver.fromJson(json['resolver'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resolver = this.resolver;
    return {
      if (resolver != null) 'resolver': resolver,
    };
  }
}

class UpdateTypeResponse {
  /// The updated <code>Type</code> object.
  final Type? type;

  UpdateTypeResponse({
    this.type,
  });

  factory UpdateTypeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateTypeResponse(
      type: json['type'] != null
          ? Type.fromJson(json['type'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      if (type != null) 'type': type,
    };
  }
}

/// Describes an Amazon Cognito user pool configuration.
class UserPoolConfig {
  /// The AWS Region in which the user pool was created.
  final String awsRegion;

  /// The action that you want your GraphQL API to take when a request that uses
  /// Amazon Cognito user pool authentication doesn't match the Amazon Cognito
  /// user pool configuration.
  final DefaultAction defaultAction;

  /// The user pool ID.
  final String userPoolId;

  /// A regular expression for validating the incoming Amazon Cognito user pool
  /// app client ID.
  final String? appIdClientRegex;

  UserPoolConfig({
    required this.awsRegion,
    required this.defaultAction,
    required this.userPoolId,
    this.appIdClientRegex,
  });

  factory UserPoolConfig.fromJson(Map<String, dynamic> json) {
    return UserPoolConfig(
      awsRegion: json['awsRegion'] as String,
      defaultAction: (json['defaultAction'] as String).toDefaultAction(),
      userPoolId: json['userPoolId'] as String,
      appIdClientRegex: json['appIdClientRegex'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final defaultAction = this.defaultAction;
    final userPoolId = this.userPoolId;
    final appIdClientRegex = this.appIdClientRegex;
    return {
      'awsRegion': awsRegion,
      'defaultAction': defaultAction.toValue(),
      'userPoolId': userPoolId,
      if (appIdClientRegex != null) 'appIdClientRegex': appIdClientRegex,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ApiKeyLimitExceededException extends _s.GenericAwsException {
  ApiKeyLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'ApiKeyLimitExceededException', message: message);
}

class ApiKeyValidityOutOfBoundsException extends _s.GenericAwsException {
  ApiKeyValidityOutOfBoundsException({String? type, String? message})
      : super(
            type: type,
            code: 'ApiKeyValidityOutOfBoundsException',
            message: message);
}

class ApiLimitExceededException extends _s.GenericAwsException {
  ApiLimitExceededException({String? type, String? message})
      : super(type: type, code: 'ApiLimitExceededException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class GraphQLSchemaException extends _s.GenericAwsException {
  GraphQLSchemaException({String? type, String? message})
      : super(type: type, code: 'GraphQLSchemaException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
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
