// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appsync-2017-07-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalAuthenticationProvider _$AdditionalAuthenticationProviderFromJson(
    Map<String, dynamic> json) {
  return AdditionalAuthenticationProvider(
    authenticationType: _$enumDecodeNullable(
        _$AuthenticationTypeEnumMap, json['authenticationType']),
    openIDConnectConfig: json['openIDConnectConfig'] == null
        ? null
        : OpenIDConnectConfig.fromJson(
            json['openIDConnectConfig'] as Map<String, dynamic>),
    userPoolConfig: json['userPoolConfig'] == null
        ? null
        : CognitoUserPoolConfig.fromJson(
            json['userPoolConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AdditionalAuthenticationProviderToJson(
    AdditionalAuthenticationProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('openIDConnectConfig', instance.openIDConnectConfig?.toJson());
  writeNotNull('userPoolConfig', instance.userPoolConfig?.toJson());
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AuthenticationTypeEnumMap = {
  AuthenticationType.apiKey: 'API_KEY',
  AuthenticationType.awsIam: 'AWS_IAM',
  AuthenticationType.amazonCognitoUserPools: 'AMAZON_COGNITO_USER_POOLS',
  AuthenticationType.openidConnect: 'OPENID_CONNECT',
};

ApiCache _$ApiCacheFromJson(Map<String, dynamic> json) {
  return ApiCache(
    apiCachingBehavior: _$enumDecodeNullable(
        _$ApiCachingBehaviorEnumMap, json['apiCachingBehavior']),
    atRestEncryptionEnabled: json['atRestEncryptionEnabled'] as bool,
    status: _$enumDecodeNullable(_$ApiCacheStatusEnumMap, json['status']),
    transitEncryptionEnabled: json['transitEncryptionEnabled'] as bool,
    ttl: json['ttl'] as int,
    type: _$enumDecodeNullable(_$ApiCacheTypeEnumMap, json['type']),
  );
}

const _$ApiCachingBehaviorEnumMap = {
  ApiCachingBehavior.fullRequestCaching: 'FULL_REQUEST_CACHING',
  ApiCachingBehavior.perResolverCaching: 'PER_RESOLVER_CACHING',
};

const _$ApiCacheStatusEnumMap = {
  ApiCacheStatus.available: 'AVAILABLE',
  ApiCacheStatus.creating: 'CREATING',
  ApiCacheStatus.deleting: 'DELETING',
  ApiCacheStatus.modifying: 'MODIFYING',
  ApiCacheStatus.failed: 'FAILED',
};

const _$ApiCacheTypeEnumMap = {
  ApiCacheType.t2Small: 'T2_SMALL',
  ApiCacheType.t2Medium: 'T2_MEDIUM',
  ApiCacheType.r4Large: 'R4_LARGE',
  ApiCacheType.r4Xlarge: 'R4_XLARGE',
  ApiCacheType.r4_2xlarge: 'R4_2XLARGE',
  ApiCacheType.r4_4xlarge: 'R4_4XLARGE',
  ApiCacheType.r4_8xlarge: 'R4_8XLARGE',
};

ApiKey _$ApiKeyFromJson(Map<String, dynamic> json) {
  return ApiKey(
    description: json['description'] as String,
    expires: json['expires'] as int,
    id: json['id'] as String,
  );
}

AuthorizationConfig _$AuthorizationConfigFromJson(Map<String, dynamic> json) {
  return AuthorizationConfig(
    authorizationType: _$enumDecodeNullable(
        _$AuthorizationTypeEnumMap, json['authorizationType']),
    awsIamConfig: json['awsIamConfig'] == null
        ? null
        : AwsIamConfig.fromJson(json['awsIamConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthorizationConfigToJson(AuthorizationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authorizationType',
      _$AuthorizationTypeEnumMap[instance.authorizationType]);
  writeNotNull('awsIamConfig', instance.awsIamConfig?.toJson());
  return val;
}

const _$AuthorizationTypeEnumMap = {
  AuthorizationType.awsIam: 'AWS_IAM',
};

AwsIamConfig _$AwsIamConfigFromJson(Map<String, dynamic> json) {
  return AwsIamConfig(
    signingRegion: json['signingRegion'] as String,
    signingServiceName: json['signingServiceName'] as String,
  );
}

Map<String, dynamic> _$AwsIamConfigToJson(AwsIamConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('signingRegion', instance.signingRegion);
  writeNotNull('signingServiceName', instance.signingServiceName);
  return val;
}

CachingConfig _$CachingConfigFromJson(Map<String, dynamic> json) {
  return CachingConfig(
    cachingKeys:
        (json['cachingKeys'] as List)?.map((e) => e as String)?.toList(),
    ttl: json['ttl'] as int,
  );
}

Map<String, dynamic> _$CachingConfigToJson(CachingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cachingKeys', instance.cachingKeys);
  writeNotNull('ttl', instance.ttl);
  return val;
}

CognitoUserPoolConfig _$CognitoUserPoolConfigFromJson(
    Map<String, dynamic> json) {
  return CognitoUserPoolConfig(
    awsRegion: json['awsRegion'] as String,
    userPoolId: json['userPoolId'] as String,
    appIdClientRegex: json['appIdClientRegex'] as String,
  );
}

Map<String, dynamic> _$CognitoUserPoolConfigToJson(
    CognitoUserPoolConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('awsRegion', instance.awsRegion);
  writeNotNull('userPoolId', instance.userPoolId);
  writeNotNull('appIdClientRegex', instance.appIdClientRegex);
  return val;
}

Map<String, dynamic> _$CreateApiCacheRequestToJson(
    CreateApiCacheRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiCachingBehavior',
      _$ApiCachingBehaviorEnumMap[instance.apiCachingBehavior]);
  writeNotNull('ttl', instance.ttl);
  writeNotNull('type', _$ApiCacheTypeEnumMap[instance.type]);
  writeNotNull('atRestEncryptionEnabled', instance.atRestEncryptionEnabled);
  writeNotNull('transitEncryptionEnabled', instance.transitEncryptionEnabled);
  return val;
}

CreateApiCacheResponse _$CreateApiCacheResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApiCacheResponse(
    apiCache: json['apiCache'] == null
        ? null
        : ApiCache.fromJson(json['apiCache'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateApiKeyRequestToJson(CreateApiKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('expires', instance.expires);
  return val;
}

CreateApiKeyResponse _$CreateApiKeyResponseFromJson(Map<String, dynamic> json) {
  return CreateApiKeyResponse(
    apiKey: json['apiKey'] == null
        ? null
        : ApiKey.fromJson(json['apiKey'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateDataSourceRequestToJson(
    CreateDataSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('type', _$DataSourceTypeEnumMap[instance.type]);
  writeNotNull('description', instance.description);
  writeNotNull('dynamodbConfig', instance.dynamodbConfig?.toJson());
  writeNotNull('elasticsearchConfig', instance.elasticsearchConfig?.toJson());
  writeNotNull('httpConfig', instance.httpConfig?.toJson());
  writeNotNull('lambdaConfig', instance.lambdaConfig?.toJson());
  writeNotNull(
      'relationalDatabaseConfig', instance.relationalDatabaseConfig?.toJson());
  writeNotNull('serviceRoleArn', instance.serviceRoleArn);
  return val;
}

const _$DataSourceTypeEnumMap = {
  DataSourceType.awsLambda: 'AWS_LAMBDA',
  DataSourceType.amazonDynamodb: 'AMAZON_DYNAMODB',
  DataSourceType.amazonElasticsearch: 'AMAZON_ELASTICSEARCH',
  DataSourceType.none: 'NONE',
  DataSourceType.http: 'HTTP',
  DataSourceType.relationalDatabase: 'RELATIONAL_DATABASE',
};

CreateDataSourceResponse _$CreateDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDataSourceResponse(
    dataSource: json['dataSource'] == null
        ? null
        : DataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateFunctionRequestToJson(
    CreateFunctionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataSourceName', instance.dataSourceName);
  writeNotNull('functionVersion', instance.functionVersion);
  writeNotNull('name', instance.name);
  writeNotNull('requestMappingTemplate', instance.requestMappingTemplate);
  writeNotNull('description', instance.description);
  writeNotNull('responseMappingTemplate', instance.responseMappingTemplate);
  return val;
}

CreateFunctionResponse _$CreateFunctionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateFunctionResponse(
    functionConfiguration: json['functionConfiguration'] == null
        ? null
        : FunctionConfiguration.fromJson(
            json['functionConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateGraphqlApiRequestToJson(
    CreateGraphqlApiRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('name', instance.name);
  writeNotNull(
      'additionalAuthenticationProviders',
      instance.additionalAuthenticationProviders
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('logConfig', instance.logConfig?.toJson());
  writeNotNull('openIDConnectConfig', instance.openIDConnectConfig?.toJson());
  writeNotNull('tags', instance.tags);
  writeNotNull('userPoolConfig', instance.userPoolConfig?.toJson());
  writeNotNull('xrayEnabled', instance.xrayEnabled);
  return val;
}

CreateGraphqlApiResponse _$CreateGraphqlApiResponseFromJson(
    Map<String, dynamic> json) {
  return CreateGraphqlApiResponse(
    graphqlApi: json['graphqlApi'] == null
        ? null
        : GraphqlApi.fromJson(json['graphqlApi'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateResolverRequestToJson(
    CreateResolverRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fieldName', instance.fieldName);
  writeNotNull('requestMappingTemplate', instance.requestMappingTemplate);
  writeNotNull('cachingConfig', instance.cachingConfig?.toJson());
  writeNotNull('dataSourceName', instance.dataSourceName);
  writeNotNull('kind', _$ResolverKindEnumMap[instance.kind]);
  writeNotNull('pipelineConfig', instance.pipelineConfig?.toJson());
  writeNotNull('responseMappingTemplate', instance.responseMappingTemplate);
  writeNotNull('syncConfig', instance.syncConfig?.toJson());
  return val;
}

const _$ResolverKindEnumMap = {
  ResolverKind.unit: 'UNIT',
  ResolverKind.pipeline: 'PIPELINE',
};

CreateResolverResponse _$CreateResolverResponseFromJson(
    Map<String, dynamic> json) {
  return CreateResolverResponse(
    resolver: json['resolver'] == null
        ? null
        : Resolver.fromJson(json['resolver'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateTypeRequestToJson(CreateTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('definition', instance.definition);
  writeNotNull('format', _$TypeDefinitionFormatEnumMap[instance.format]);
  return val;
}

const _$TypeDefinitionFormatEnumMap = {
  TypeDefinitionFormat.sdl: 'SDL',
  TypeDefinitionFormat.json: 'JSON',
};

CreateTypeResponse _$CreateTypeResponseFromJson(Map<String, dynamic> json) {
  return CreateTypeResponse(
    type: json['type'] == null
        ? null
        : Type.fromJson(json['type'] as Map<String, dynamic>),
  );
}

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return DataSource(
    dataSourceArn: json['dataSourceArn'] as String,
    description: json['description'] as String,
    dynamodbConfig: json['dynamodbConfig'] == null
        ? null
        : DynamodbDataSourceConfig.fromJson(
            json['dynamodbConfig'] as Map<String, dynamic>),
    elasticsearchConfig: json['elasticsearchConfig'] == null
        ? null
        : ElasticsearchDataSourceConfig.fromJson(
            json['elasticsearchConfig'] as Map<String, dynamic>),
    httpConfig: json['httpConfig'] == null
        ? null
        : HttpDataSourceConfig.fromJson(
            json['httpConfig'] as Map<String, dynamic>),
    lambdaConfig: json['lambdaConfig'] == null
        ? null
        : LambdaDataSourceConfig.fromJson(
            json['lambdaConfig'] as Map<String, dynamic>),
    name: json['name'] as String,
    relationalDatabaseConfig: json['relationalDatabaseConfig'] == null
        ? null
        : RelationalDatabaseDataSourceConfig.fromJson(
            json['relationalDatabaseConfig'] as Map<String, dynamic>),
    serviceRoleArn: json['serviceRoleArn'] as String,
    type: _$enumDecodeNullable(_$DataSourceTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$DeleteApiCacheRequestToJson(
        DeleteApiCacheRequest instance) =>
    <String, dynamic>{};

DeleteApiCacheResponse _$DeleteApiCacheResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApiCacheResponse();
}

Map<String, dynamic> _$DeleteApiKeyRequestToJson(
        DeleteApiKeyRequest instance) =>
    <String, dynamic>{};

DeleteApiKeyResponse _$DeleteApiKeyResponseFromJson(Map<String, dynamic> json) {
  return DeleteApiKeyResponse();
}

Map<String, dynamic> _$DeleteDataSourceRequestToJson(
        DeleteDataSourceRequest instance) =>
    <String, dynamic>{};

DeleteDataSourceResponse _$DeleteDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDataSourceResponse();
}

Map<String, dynamic> _$DeleteFunctionRequestToJson(
        DeleteFunctionRequest instance) =>
    <String, dynamic>{};

DeleteFunctionResponse _$DeleteFunctionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFunctionResponse();
}

Map<String, dynamic> _$DeleteGraphqlApiRequestToJson(
        DeleteGraphqlApiRequest instance) =>
    <String, dynamic>{};

DeleteGraphqlApiResponse _$DeleteGraphqlApiResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteGraphqlApiResponse();
}

Map<String, dynamic> _$DeleteResolverRequestToJson(
        DeleteResolverRequest instance) =>
    <String, dynamic>{};

DeleteResolverResponse _$DeleteResolverResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResolverResponse();
}

Map<String, dynamic> _$DeleteTypeRequestToJson(DeleteTypeRequest instance) =>
    <String, dynamic>{};

DeleteTypeResponse _$DeleteTypeResponseFromJson(Map<String, dynamic> json) {
  return DeleteTypeResponse();
}

DeltaSyncConfig _$DeltaSyncConfigFromJson(Map<String, dynamic> json) {
  return DeltaSyncConfig(
    baseTableTTL: json['baseTableTTL'] as int,
    deltaSyncTableName: json['deltaSyncTableName'] as String,
    deltaSyncTableTTL: json['deltaSyncTableTTL'] as int,
  );
}

Map<String, dynamic> _$DeltaSyncConfigToJson(DeltaSyncConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('baseTableTTL', instance.baseTableTTL);
  writeNotNull('deltaSyncTableName', instance.deltaSyncTableName);
  writeNotNull('deltaSyncTableTTL', instance.deltaSyncTableTTL);
  return val;
}

DynamodbDataSourceConfig _$DynamodbDataSourceConfigFromJson(
    Map<String, dynamic> json) {
  return DynamodbDataSourceConfig(
    awsRegion: json['awsRegion'] as String,
    tableName: json['tableName'] as String,
    deltaSyncConfig: json['deltaSyncConfig'] == null
        ? null
        : DeltaSyncConfig.fromJson(
            json['deltaSyncConfig'] as Map<String, dynamic>),
    useCallerCredentials: json['useCallerCredentials'] as bool,
    versioned: json['versioned'] as bool,
  );
}

Map<String, dynamic> _$DynamodbDataSourceConfigToJson(
    DynamodbDataSourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('awsRegion', instance.awsRegion);
  writeNotNull('tableName', instance.tableName);
  writeNotNull('deltaSyncConfig', instance.deltaSyncConfig?.toJson());
  writeNotNull('useCallerCredentials', instance.useCallerCredentials);
  writeNotNull('versioned', instance.versioned);
  return val;
}

ElasticsearchDataSourceConfig _$ElasticsearchDataSourceConfigFromJson(
    Map<String, dynamic> json) {
  return ElasticsearchDataSourceConfig(
    awsRegion: json['awsRegion'] as String,
    endpoint: json['endpoint'] as String,
  );
}

Map<String, dynamic> _$ElasticsearchDataSourceConfigToJson(
    ElasticsearchDataSourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('awsRegion', instance.awsRegion);
  writeNotNull('endpoint', instance.endpoint);
  return val;
}

Map<String, dynamic> _$FlushApiCacheRequestToJson(
        FlushApiCacheRequest instance) =>
    <String, dynamic>{};

FlushApiCacheResponse _$FlushApiCacheResponseFromJson(
    Map<String, dynamic> json) {
  return FlushApiCacheResponse();
}

FunctionConfiguration _$FunctionConfigurationFromJson(
    Map<String, dynamic> json) {
  return FunctionConfiguration(
    dataSourceName: json['dataSourceName'] as String,
    description: json['description'] as String,
    functionArn: json['functionArn'] as String,
    functionId: json['functionId'] as String,
    functionVersion: json['functionVersion'] as String,
    name: json['name'] as String,
    requestMappingTemplate: json['requestMappingTemplate'] as String,
    responseMappingTemplate: json['responseMappingTemplate'] as String,
  );
}

GetApiCacheResponse _$GetApiCacheResponseFromJson(Map<String, dynamic> json) {
  return GetApiCacheResponse(
    apiCache: json['apiCache'] == null
        ? null
        : ApiCache.fromJson(json['apiCache'] as Map<String, dynamic>),
  );
}

GetDataSourceResponse _$GetDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return GetDataSourceResponse(
    dataSource: json['dataSource'] == null
        ? null
        : DataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
  );
}

GetFunctionResponse _$GetFunctionResponseFromJson(Map<String, dynamic> json) {
  return GetFunctionResponse(
    functionConfiguration: json['functionConfiguration'] == null
        ? null
        : FunctionConfiguration.fromJson(
            json['functionConfiguration'] as Map<String, dynamic>),
  );
}

GetGraphqlApiResponse _$GetGraphqlApiResponseFromJson(
    Map<String, dynamic> json) {
  return GetGraphqlApiResponse(
    graphqlApi: json['graphqlApi'] == null
        ? null
        : GraphqlApi.fromJson(json['graphqlApi'] as Map<String, dynamic>),
  );
}

GetIntrospectionSchemaResponse _$GetIntrospectionSchemaResponseFromJson(
    Map<String, dynamic> json) {
  return GetIntrospectionSchemaResponse(
    schema: const Uint8ListConverter().fromJson(json['schema'] as String),
  );
}

GetResolverResponse _$GetResolverResponseFromJson(Map<String, dynamic> json) {
  return GetResolverResponse(
    resolver: json['resolver'] == null
        ? null
        : Resolver.fromJson(json['resolver'] as Map<String, dynamic>),
  );
}

GetSchemaCreationStatusResponse _$GetSchemaCreationStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetSchemaCreationStatusResponse(
    details: json['details'] as String,
    status: _$enumDecodeNullable(_$SchemaStatusEnumMap, json['status']),
  );
}

const _$SchemaStatusEnumMap = {
  SchemaStatus.processing: 'PROCESSING',
  SchemaStatus.active: 'ACTIVE',
  SchemaStatus.deleting: 'DELETING',
  SchemaStatus.failed: 'FAILED',
  SchemaStatus.success: 'SUCCESS',
  SchemaStatus.notApplicable: 'NOT_APPLICABLE',
};

GetTypeResponse _$GetTypeResponseFromJson(Map<String, dynamic> json) {
  return GetTypeResponse(
    type: json['type'] == null
        ? null
        : Type.fromJson(json['type'] as Map<String, dynamic>),
  );
}

GraphqlApi _$GraphqlApiFromJson(Map<String, dynamic> json) {
  return GraphqlApi(
    additionalAuthenticationProviders:
        (json['additionalAuthenticationProviders'] as List)
            ?.map((e) => e == null
                ? null
                : AdditionalAuthenticationProvider.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    apiId: json['apiId'] as String,
    arn: json['arn'] as String,
    authenticationType: _$enumDecodeNullable(
        _$AuthenticationTypeEnumMap, json['authenticationType']),
    logConfig: json['logConfig'] == null
        ? null
        : LogConfig.fromJson(json['logConfig'] as Map<String, dynamic>),
    name: json['name'] as String,
    openIDConnectConfig: json['openIDConnectConfig'] == null
        ? null
        : OpenIDConnectConfig.fromJson(
            json['openIDConnectConfig'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    uris: (json['uris'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    userPoolConfig: json['userPoolConfig'] == null
        ? null
        : UserPoolConfig.fromJson(
            json['userPoolConfig'] as Map<String, dynamic>),
    xrayEnabled: json['xrayEnabled'] as bool,
  );
}

HttpDataSourceConfig _$HttpDataSourceConfigFromJson(Map<String, dynamic> json) {
  return HttpDataSourceConfig(
    authorizationConfig: json['authorizationConfig'] == null
        ? null
        : AuthorizationConfig.fromJson(
            json['authorizationConfig'] as Map<String, dynamic>),
    endpoint: json['endpoint'] as String,
  );
}

Map<String, dynamic> _$HttpDataSourceConfigToJson(
    HttpDataSourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authorizationConfig', instance.authorizationConfig?.toJson());
  writeNotNull('endpoint', instance.endpoint);
  return val;
}

LambdaConflictHandlerConfig _$LambdaConflictHandlerConfigFromJson(
    Map<String, dynamic> json) {
  return LambdaConflictHandlerConfig(
    lambdaConflictHandlerArn: json['lambdaConflictHandlerArn'] as String,
  );
}

Map<String, dynamic> _$LambdaConflictHandlerConfigToJson(
    LambdaConflictHandlerConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lambdaConflictHandlerArn', instance.lambdaConflictHandlerArn);
  return val;
}

LambdaDataSourceConfig _$LambdaDataSourceConfigFromJson(
    Map<String, dynamic> json) {
  return LambdaDataSourceConfig(
    lambdaFunctionArn: json['lambdaFunctionArn'] as String,
  );
}

Map<String, dynamic> _$LambdaDataSourceConfigToJson(
    LambdaDataSourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lambdaFunctionArn', instance.lambdaFunctionArn);
  return val;
}

ListApiKeysResponse _$ListApiKeysResponseFromJson(Map<String, dynamic> json) {
  return ListApiKeysResponse(
    apiKeys: (json['apiKeys'] as List)
        ?.map((e) =>
            e == null ? null : ApiKey.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDataSourcesResponse _$ListDataSourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListDataSourcesResponse(
    dataSources: (json['dataSources'] as List)
        ?.map((e) =>
            e == null ? null : DataSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListFunctionsResponse _$ListFunctionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListFunctionsResponse(
    functions: (json['functions'] as List)
        ?.map((e) => e == null
            ? null
            : FunctionConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListGraphqlApisResponse _$ListGraphqlApisResponseFromJson(
    Map<String, dynamic> json) {
  return ListGraphqlApisResponse(
    graphqlApis: (json['graphqlApis'] as List)
        ?.map((e) =>
            e == null ? null : GraphqlApi.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListResolversByFunctionResponse _$ListResolversByFunctionResponseFromJson(
    Map<String, dynamic> json) {
  return ListResolversByFunctionResponse(
    nextToken: json['nextToken'] as String,
    resolvers: (json['resolvers'] as List)
        ?.map((e) =>
            e == null ? null : Resolver.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListResolversResponse _$ListResolversResponseFromJson(
    Map<String, dynamic> json) {
  return ListResolversResponse(
    nextToken: json['nextToken'] as String,
    resolvers: (json['resolvers'] as List)
        ?.map((e) =>
            e == null ? null : Resolver.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListTypesResponse _$ListTypesResponseFromJson(Map<String, dynamic> json) {
  return ListTypesResponse(
    nextToken: json['nextToken'] as String,
    types: (json['types'] as List)
        ?.map(
            (e) => e == null ? null : Type.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LogConfig _$LogConfigFromJson(Map<String, dynamic> json) {
  return LogConfig(
    cloudWatchLogsRoleArn: json['cloudWatchLogsRoleArn'] as String,
    fieldLogLevel:
        _$enumDecodeNullable(_$FieldLogLevelEnumMap, json['fieldLogLevel']),
    excludeVerboseContent: json['excludeVerboseContent'] as bool,
  );
}

Map<String, dynamic> _$LogConfigToJson(LogConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cloudWatchLogsRoleArn', instance.cloudWatchLogsRoleArn);
  writeNotNull('fieldLogLevel', _$FieldLogLevelEnumMap[instance.fieldLogLevel]);
  writeNotNull('excludeVerboseContent', instance.excludeVerboseContent);
  return val;
}

const _$FieldLogLevelEnumMap = {
  FieldLogLevel.none: 'NONE',
  FieldLogLevel.error: 'ERROR',
  FieldLogLevel.all: 'ALL',
};

OpenIDConnectConfig _$OpenIDConnectConfigFromJson(Map<String, dynamic> json) {
  return OpenIDConnectConfig(
    issuer: json['issuer'] as String,
    authTTL: json['authTTL'] as int,
    clientId: json['clientId'] as String,
    iatTTL: json['iatTTL'] as int,
  );
}

Map<String, dynamic> _$OpenIDConnectConfigToJson(OpenIDConnectConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('issuer', instance.issuer);
  writeNotNull('authTTL', instance.authTTL);
  writeNotNull('clientId', instance.clientId);
  writeNotNull('iatTTL', instance.iatTTL);
  return val;
}

PipelineConfig _$PipelineConfigFromJson(Map<String, dynamic> json) {
  return PipelineConfig(
    functions: (json['functions'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PipelineConfigToJson(PipelineConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('functions', instance.functions);
  return val;
}

RdsHttpEndpointConfig _$RdsHttpEndpointConfigFromJson(
    Map<String, dynamic> json) {
  return RdsHttpEndpointConfig(
    awsRegion: json['awsRegion'] as String,
    awsSecretStoreArn: json['awsSecretStoreArn'] as String,
    databaseName: json['databaseName'] as String,
    dbClusterIdentifier: json['dbClusterIdentifier'] as String,
    schema: json['schema'] as String,
  );
}

Map<String, dynamic> _$RdsHttpEndpointConfigToJson(
    RdsHttpEndpointConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('awsRegion', instance.awsRegion);
  writeNotNull('awsSecretStoreArn', instance.awsSecretStoreArn);
  writeNotNull('databaseName', instance.databaseName);
  writeNotNull('dbClusterIdentifier', instance.dbClusterIdentifier);
  writeNotNull('schema', instance.schema);
  return val;
}

RelationalDatabaseDataSourceConfig _$RelationalDatabaseDataSourceConfigFromJson(
    Map<String, dynamic> json) {
  return RelationalDatabaseDataSourceConfig(
    rdsHttpEndpointConfig: json['rdsHttpEndpointConfig'] == null
        ? null
        : RdsHttpEndpointConfig.fromJson(
            json['rdsHttpEndpointConfig'] as Map<String, dynamic>),
    relationalDatabaseSourceType: _$enumDecodeNullable(
        _$RelationalDatabaseSourceTypeEnumMap,
        json['relationalDatabaseSourceType']),
  );
}

Map<String, dynamic> _$RelationalDatabaseDataSourceConfigToJson(
    RelationalDatabaseDataSourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'rdsHttpEndpointConfig', instance.rdsHttpEndpointConfig?.toJson());
  writeNotNull(
      'relationalDatabaseSourceType',
      _$RelationalDatabaseSourceTypeEnumMap[
          instance.relationalDatabaseSourceType]);
  return val;
}

const _$RelationalDatabaseSourceTypeEnumMap = {
  RelationalDatabaseSourceType.rdsHttpEndpoint: 'RDS_HTTP_ENDPOINT',
};

Resolver _$ResolverFromJson(Map<String, dynamic> json) {
  return Resolver(
    cachingConfig: json['cachingConfig'] == null
        ? null
        : CachingConfig.fromJson(json['cachingConfig'] as Map<String, dynamic>),
    dataSourceName: json['dataSourceName'] as String,
    fieldName: json['fieldName'] as String,
    kind: _$enumDecodeNullable(_$ResolverKindEnumMap, json['kind']),
    pipelineConfig: json['pipelineConfig'] == null
        ? null
        : PipelineConfig.fromJson(
            json['pipelineConfig'] as Map<String, dynamic>),
    requestMappingTemplate: json['requestMappingTemplate'] as String,
    resolverArn: json['resolverArn'] as String,
    responseMappingTemplate: json['responseMappingTemplate'] as String,
    syncConfig: json['syncConfig'] == null
        ? null
        : SyncConfig.fromJson(json['syncConfig'] as Map<String, dynamic>),
    typeName: json['typeName'] as String,
  );
}

Map<String, dynamic> _$StartSchemaCreationRequestToJson(
    StartSchemaCreationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'definition', const Uint8ListConverter().toJson(instance.definition));
  return val;
}

StartSchemaCreationResponse _$StartSchemaCreationResponseFromJson(
    Map<String, dynamic> json) {
  return StartSchemaCreationResponse(
    status: _$enumDecodeNullable(_$SchemaStatusEnumMap, json['status']),
  );
}

SyncConfig _$SyncConfigFromJson(Map<String, dynamic> json) {
  return SyncConfig(
    conflictDetection: _$enumDecodeNullable(
        _$ConflictDetectionTypeEnumMap, json['conflictDetection']),
    conflictHandler: _$enumDecodeNullable(
        _$ConflictHandlerTypeEnumMap, json['conflictHandler']),
    lambdaConflictHandlerConfig: json['lambdaConflictHandlerConfig'] == null
        ? null
        : LambdaConflictHandlerConfig.fromJson(
            json['lambdaConflictHandlerConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SyncConfigToJson(SyncConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('conflictDetection',
      _$ConflictDetectionTypeEnumMap[instance.conflictDetection]);
  writeNotNull('conflictHandler',
      _$ConflictHandlerTypeEnumMap[instance.conflictHandler]);
  writeNotNull('lambdaConflictHandlerConfig',
      instance.lambdaConflictHandlerConfig?.toJson());
  return val;
}

const _$ConflictDetectionTypeEnumMap = {
  ConflictDetectionType.version: 'VERSION',
  ConflictDetectionType.none: 'NONE',
};

const _$ConflictHandlerTypeEnumMap = {
  ConflictHandlerType.optimisticConcurrency: 'OPTIMISTIC_CONCURRENCY',
  ConflictHandlerType.lambda: 'LAMBDA',
  ConflictHandlerType.automerge: 'AUTOMERGE',
  ConflictHandlerType.none: 'NONE',
};

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', instance.tags);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Type _$TypeFromJson(Map<String, dynamic> json) {
  return Type(
    arn: json['arn'] as String,
    definition: json['definition'] as String,
    description: json['description'] as String,
    format: _$enumDecodeNullable(_$TypeDefinitionFormatEnumMap, json['format']),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$UntagResourceRequestToJson(
        UntagResourceRequest instance) =>
    <String, dynamic>{};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UpdateApiCacheRequestToJson(
    UpdateApiCacheRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiCachingBehavior',
      _$ApiCachingBehaviorEnumMap[instance.apiCachingBehavior]);
  writeNotNull('ttl', instance.ttl);
  writeNotNull('type', _$ApiCacheTypeEnumMap[instance.type]);
  return val;
}

UpdateApiCacheResponse _$UpdateApiCacheResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApiCacheResponse(
    apiCache: json['apiCache'] == null
        ? null
        : ApiCache.fromJson(json['apiCache'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateApiKeyRequestToJson(UpdateApiKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('expires', instance.expires);
  return val;
}

UpdateApiKeyResponse _$UpdateApiKeyResponseFromJson(Map<String, dynamic> json) {
  return UpdateApiKeyResponse(
    apiKey: json['apiKey'] == null
        ? null
        : ApiKey.fromJson(json['apiKey'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateDataSourceRequestToJson(
    UpdateDataSourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$DataSourceTypeEnumMap[instance.type]);
  writeNotNull('description', instance.description);
  writeNotNull('dynamodbConfig', instance.dynamodbConfig?.toJson());
  writeNotNull('elasticsearchConfig', instance.elasticsearchConfig?.toJson());
  writeNotNull('httpConfig', instance.httpConfig?.toJson());
  writeNotNull('lambdaConfig', instance.lambdaConfig?.toJson());
  writeNotNull(
      'relationalDatabaseConfig', instance.relationalDatabaseConfig?.toJson());
  writeNotNull('serviceRoleArn', instance.serviceRoleArn);
  return val;
}

UpdateDataSourceResponse _$UpdateDataSourceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDataSourceResponse(
    dataSource: json['dataSource'] == null
        ? null
        : DataSource.fromJson(json['dataSource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateFunctionRequestToJson(
    UpdateFunctionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataSourceName', instance.dataSourceName);
  writeNotNull('functionVersion', instance.functionVersion);
  writeNotNull('name', instance.name);
  writeNotNull('requestMappingTemplate', instance.requestMappingTemplate);
  writeNotNull('description', instance.description);
  writeNotNull('responseMappingTemplate', instance.responseMappingTemplate);
  return val;
}

UpdateFunctionResponse _$UpdateFunctionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFunctionResponse(
    functionConfiguration: json['functionConfiguration'] == null
        ? null
        : FunctionConfiguration.fromJson(
            json['functionConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateGraphqlApiRequestToJson(
    UpdateGraphqlApiRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull(
      'additionalAuthenticationProviders',
      instance.additionalAuthenticationProviders
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('authenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('logConfig', instance.logConfig?.toJson());
  writeNotNull('openIDConnectConfig', instance.openIDConnectConfig?.toJson());
  writeNotNull('userPoolConfig', instance.userPoolConfig?.toJson());
  writeNotNull('xrayEnabled', instance.xrayEnabled);
  return val;
}

UpdateGraphqlApiResponse _$UpdateGraphqlApiResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateGraphqlApiResponse(
    graphqlApi: json['graphqlApi'] == null
        ? null
        : GraphqlApi.fromJson(json['graphqlApi'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateResolverRequestToJson(
    UpdateResolverRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('requestMappingTemplate', instance.requestMappingTemplate);
  writeNotNull('cachingConfig', instance.cachingConfig?.toJson());
  writeNotNull('dataSourceName', instance.dataSourceName);
  writeNotNull('kind', _$ResolverKindEnumMap[instance.kind]);
  writeNotNull('pipelineConfig', instance.pipelineConfig?.toJson());
  writeNotNull('responseMappingTemplate', instance.responseMappingTemplate);
  writeNotNull('syncConfig', instance.syncConfig?.toJson());
  return val;
}

UpdateResolverResponse _$UpdateResolverResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResolverResponse(
    resolver: json['resolver'] == null
        ? null
        : Resolver.fromJson(json['resolver'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateTypeRequestToJson(UpdateTypeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('format', _$TypeDefinitionFormatEnumMap[instance.format]);
  writeNotNull('definition', instance.definition);
  return val;
}

UpdateTypeResponse _$UpdateTypeResponseFromJson(Map<String, dynamic> json) {
  return UpdateTypeResponse(
    type: json['type'] == null
        ? null
        : Type.fromJson(json['type'] as Map<String, dynamic>),
  );
}

UserPoolConfig _$UserPoolConfigFromJson(Map<String, dynamic> json) {
  return UserPoolConfig(
    awsRegion: json['awsRegion'] as String,
    defaultAction:
        _$enumDecodeNullable(_$DefaultActionEnumMap, json['defaultAction']),
    userPoolId: json['userPoolId'] as String,
    appIdClientRegex: json['appIdClientRegex'] as String,
  );
}

Map<String, dynamic> _$UserPoolConfigToJson(UserPoolConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('awsRegion', instance.awsRegion);
  writeNotNull('defaultAction', _$DefaultActionEnumMap[instance.defaultAction]);
  writeNotNull('userPoolId', instance.userPoolId);
  writeNotNull('appIdClientRegex', instance.appIdClientRegex);
  return val;
}

const _$DefaultActionEnumMap = {
  DefaultAction.allow: 'ALLOW',
  DefaultAction.deny: 'DENY',
};
