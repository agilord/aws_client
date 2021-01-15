// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-07-09.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessLogSettings _$AccessLogSettingsFromJson(Map<String, dynamic> json) {
  return AccessLogSettings(
    destinationArn: json['destinationArn'] as String,
    format: json['format'] as String,
  );
}

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    apiKeyVersion: json['apiKeyVersion'] as String,
    cloudwatchRoleArn: json['cloudwatchRoleArn'] as String,
    features: (json['features'] as List)?.map((e) => e as String)?.toList(),
    throttleSettings: json['throttleSettings'] == null
        ? null
        : ThrottleSettings.fromJson(
            json['throttleSettings'] as Map<String, dynamic>),
  );
}

ApiKey _$ApiKeyFromJson(Map<String, dynamic> json) {
  return ApiKey(
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    customerId: json['customerId'] as String,
    description: json['description'] as String,
    enabled: json['enabled'] as bool,
    id: json['id'] as String,
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    name: json['name'] as String,
    stageKeys: (json['stageKeys'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    value: json['value'] as String,
  );
}

ApiKeyIds _$ApiKeyIdsFromJson(Map<String, dynamic> json) {
  return ApiKeyIds(
    ids: (json['ids'] as List)?.map((e) => e as String)?.toList(),
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
  );
}

ApiKeys _$ApiKeysFromJson(Map<String, dynamic> json) {
  return ApiKeys(
    items: (json['item'] as List)
        ?.map((e) =>
            e == null ? null : ApiKey.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
  );
}

ApiStage _$ApiStageFromJson(Map<String, dynamic> json) {
  return ApiStage(
    apiId: json['apiId'] as String,
    stage: json['stage'] as String,
    throttle: (json['throttle'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ThrottleSettings.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$ApiStageToJson(ApiStage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiId', instance.apiId);
  writeNotNull('stage', instance.stage);
  writeNotNull(
      'throttle', instance.throttle?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

Authorizer _$AuthorizerFromJson(Map<String, dynamic> json) {
  return Authorizer(
    authType: json['authType'] as String,
    authorizerCredentials: json['authorizerCredentials'] as String,
    authorizerResultTtlInSeconds: json['authorizerResultTtlInSeconds'] as int,
    authorizerUri: json['authorizerUri'] as String,
    id: json['id'] as String,
    identitySource: json['identitySource'] as String,
    identityValidationExpression:
        json['identityValidationExpression'] as String,
    name: json['name'] as String,
    providerARNs:
        (json['providerARNs'] as List)?.map((e) => e as String)?.toList(),
    type: _$enumDecodeNullable(_$AuthorizerTypeEnumMap, json['type']),
  );
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

const _$AuthorizerTypeEnumMap = {
  AuthorizerType.token: 'TOKEN',
  AuthorizerType.request: 'REQUEST',
  AuthorizerType.cognitoUserPools: 'COGNITO_USER_POOLS',
};

Authorizers _$AuthorizersFromJson(Map<String, dynamic> json) {
  return Authorizers(
    items: (json['item'] as List)
        ?.map((e) =>
            e == null ? null : Authorizer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

BasePathMapping _$BasePathMappingFromJson(Map<String, dynamic> json) {
  return BasePathMapping(
    basePath: json['basePath'] as String,
    restApiId: json['restApiId'] as String,
    stage: json['stage'] as String,
  );
}

BasePathMappings _$BasePathMappingsFromJson(Map<String, dynamic> json) {
  return BasePathMappings(
    items: (json['item'] as List)
        ?.map((e) => e == null
            ? null
            : BasePathMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

CanarySettings _$CanarySettingsFromJson(Map<String, dynamic> json) {
  return CanarySettings(
    deploymentId: json['deploymentId'] as String,
    percentTraffic: (json['percentTraffic'] as num)?.toDouble(),
    stageVariableOverrides:
        (json['stageVariableOverrides'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    useStageCache: json['useStageCache'] as bool,
  );
}

Map<String, dynamic> _$CanarySettingsToJson(CanarySettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deploymentId', instance.deploymentId);
  writeNotNull('percentTraffic', instance.percentTraffic);
  writeNotNull('stageVariableOverrides', instance.stageVariableOverrides);
  writeNotNull('useStageCache', instance.useStageCache);
  return val;
}

ClientCertificate _$ClientCertificateFromJson(Map<String, dynamic> json) {
  return ClientCertificate(
    clientCertificateId: json['clientCertificateId'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String,
    expirationDate:
        const UnixDateTimeConverter().fromJson(json['expirationDate']),
    pemEncodedCertificate: json['pemEncodedCertificate'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ClientCertificates _$ClientCertificatesFromJson(Map<String, dynamic> json) {
  return ClientCertificates(
    items: (json['item'] as List)
        ?.map((e) => e == null
            ? null
            : ClientCertificate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

Deployment _$DeploymentFromJson(Map<String, dynamic> json) {
  return Deployment(
    apiSummary: (json['apiSummary'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(
                k,
                e == null
                    ? null
                    : MethodSnapshot.fromJson(e as Map<String, dynamic>)),
          )),
    ),
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$DeploymentCanarySettingsToJson(
    DeploymentCanarySettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('percentTraffic', instance.percentTraffic);
  writeNotNull('stageVariableOverrides', instance.stageVariableOverrides);
  writeNotNull('useStageCache', instance.useStageCache);
  return val;
}

Deployments _$DeploymentsFromJson(Map<String, dynamic> json) {
  return Deployments(
    items: (json['item'] as List)
        ?.map((e) =>
            e == null ? null : Deployment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

DocumentationPart _$DocumentationPartFromJson(Map<String, dynamic> json) {
  return DocumentationPart(
    id: json['id'] as String,
    location: json['location'] == null
        ? null
        : DocumentationPartLocation.fromJson(
            json['location'] as Map<String, dynamic>),
    properties: json['properties'] as String,
  );
}

DocumentationPartIds _$DocumentationPartIdsFromJson(Map<String, dynamic> json) {
  return DocumentationPartIds(
    ids: (json['ids'] as List)?.map((e) => e as String)?.toList(),
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
  );
}

DocumentationPartLocation _$DocumentationPartLocationFromJson(
    Map<String, dynamic> json) {
  return DocumentationPartLocation(
    type: _$enumDecodeNullable(_$DocumentationPartTypeEnumMap, json['type']),
    method: json['method'] as String,
    name: json['name'] as String,
    path: json['path'] as String,
    statusCode: json['statusCode'] as String,
  );
}

Map<String, dynamic> _$DocumentationPartLocationToJson(
    DocumentationPartLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$DocumentationPartTypeEnumMap[instance.type]);
  writeNotNull('method', instance.method);
  writeNotNull('name', instance.name);
  writeNotNull('path', instance.path);
  writeNotNull('statusCode', instance.statusCode);
  return val;
}

const _$DocumentationPartTypeEnumMap = {
  DocumentationPartType.api: 'API',
  DocumentationPartType.authorizer: 'AUTHORIZER',
  DocumentationPartType.model: 'MODEL',
  DocumentationPartType.resource: 'RESOURCE',
  DocumentationPartType.method: 'METHOD',
  DocumentationPartType.pathParameter: 'PATH_PARAMETER',
  DocumentationPartType.queryParameter: 'QUERY_PARAMETER',
  DocumentationPartType.requestHeader: 'REQUEST_HEADER',
  DocumentationPartType.requestBody: 'REQUEST_BODY',
  DocumentationPartType.response: 'RESPONSE',
  DocumentationPartType.responseHeader: 'RESPONSE_HEADER',
  DocumentationPartType.responseBody: 'RESPONSE_BODY',
};

DocumentationParts _$DocumentationPartsFromJson(Map<String, dynamic> json) {
  return DocumentationParts(
    items: (json['item'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentationPart.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

DocumentationVersion _$DocumentationVersionFromJson(Map<String, dynamic> json) {
  return DocumentationVersion(
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String,
    version: json['version'] as String,
  );
}

DocumentationVersions _$DocumentationVersionsFromJson(
    Map<String, dynamic> json) {
  return DocumentationVersions(
    items: (json['item'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentationVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

DomainName _$DomainNameFromJson(Map<String, dynamic> json) {
  return DomainName(
    certificateArn: json['certificateArn'] as String,
    certificateName: json['certificateName'] as String,
    certificateUploadDate:
        const UnixDateTimeConverter().fromJson(json['certificateUploadDate']),
    distributionDomainName: json['distributionDomainName'] as String,
    distributionHostedZoneId: json['distributionHostedZoneId'] as String,
    domainName: json['domainName'] as String,
    domainNameStatus: _$enumDecodeNullable(
        _$DomainNameStatusEnumMap, json['domainNameStatus']),
    domainNameStatusMessage: json['domainNameStatusMessage'] as String,
    endpointConfiguration: json['endpointConfiguration'] == null
        ? null
        : EndpointConfiguration.fromJson(
            json['endpointConfiguration'] as Map<String, dynamic>),
    mutualTlsAuthentication: json['mutualTlsAuthentication'] == null
        ? null
        : MutualTlsAuthentication.fromJson(
            json['mutualTlsAuthentication'] as Map<String, dynamic>),
    regionalCertificateArn: json['regionalCertificateArn'] as String,
    regionalCertificateName: json['regionalCertificateName'] as String,
    regionalDomainName: json['regionalDomainName'] as String,
    regionalHostedZoneId: json['regionalHostedZoneId'] as String,
    securityPolicy:
        _$enumDecodeNullable(_$SecurityPolicyEnumMap, json['securityPolicy']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$DomainNameStatusEnumMap = {
  DomainNameStatus.available: 'AVAILABLE',
  DomainNameStatus.updating: 'UPDATING',
  DomainNameStatus.pending: 'PENDING',
};

const _$SecurityPolicyEnumMap = {
  SecurityPolicy.tls_1_0: 'TLS_1_0',
  SecurityPolicy.tls_1_2: 'TLS_1_2',
};

DomainNames _$DomainNamesFromJson(Map<String, dynamic> json) {
  return DomainNames(
    items: (json['item'] as List)
        ?.map((e) =>
            e == null ? null : DomainName.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

EndpointConfiguration _$EndpointConfigurationFromJson(
    Map<String, dynamic> json) {
  return EndpointConfiguration(
    types: (json['types'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EndpointTypeEnumMap, e))
        ?.toList(),
    vpcEndpointIds:
        (json['vpcEndpointIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$EndpointConfigurationToJson(
    EndpointConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'types', instance.types?.map((e) => _$EndpointTypeEnumMap[e])?.toList());
  writeNotNull('vpcEndpointIds', instance.vpcEndpointIds);
  return val;
}

const _$EndpointTypeEnumMap = {
  EndpointType.regional: 'REGIONAL',
  EndpointType.edge: 'EDGE',
  EndpointType.private: 'PRIVATE',
};

ExportResponse _$ExportResponseFromJson(Map<String, dynamic> json) {
  return ExportResponse(
    body: const Uint8ListConverter().fromJson(json['body'] as String),
    contentDisposition: json['Content-Disposition'] as String,
    contentType: json['Content-Type'] as String,
  );
}

GatewayResponse _$GatewayResponseFromJson(Map<String, dynamic> json) {
  return GatewayResponse(
    defaultResponse: json['defaultResponse'] as bool,
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseTemplates: (json['responseTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseType: _$enumDecodeNullable(
        _$GatewayResponseTypeEnumMap, json['responseType']),
    statusCode: json['statusCode'] as String,
  );
}

const _$GatewayResponseTypeEnumMap = {
  GatewayResponseType.default_4xx: 'DEFAULT_4XX',
  GatewayResponseType.default_5xx: 'DEFAULT_5XX',
  GatewayResponseType.resourceNotFound: 'RESOURCE_NOT_FOUND',
  GatewayResponseType.unauthorized: 'UNAUTHORIZED',
  GatewayResponseType.invalidApiKey: 'INVALID_API_KEY',
  GatewayResponseType.accessDenied: 'ACCESS_DENIED',
  GatewayResponseType.authorizerFailure: 'AUTHORIZER_FAILURE',
  GatewayResponseType.authorizerConfigurationError:
      'AUTHORIZER_CONFIGURATION_ERROR',
  GatewayResponseType.invalidSignature: 'INVALID_SIGNATURE',
  GatewayResponseType.expiredToken: 'EXPIRED_TOKEN',
  GatewayResponseType.missingAuthenticationToken:
      'MISSING_AUTHENTICATION_TOKEN',
  GatewayResponseType.integrationFailure: 'INTEGRATION_FAILURE',
  GatewayResponseType.integrationTimeout: 'INTEGRATION_TIMEOUT',
  GatewayResponseType.apiConfigurationError: 'API_CONFIGURATION_ERROR',
  GatewayResponseType.unsupportedMediaType: 'UNSUPPORTED_MEDIA_TYPE',
  GatewayResponseType.badRequestParameters: 'BAD_REQUEST_PARAMETERS',
  GatewayResponseType.badRequestBody: 'BAD_REQUEST_BODY',
  GatewayResponseType.requestTooLarge: 'REQUEST_TOO_LARGE',
  GatewayResponseType.throttled: 'THROTTLED',
  GatewayResponseType.quotaExceeded: 'QUOTA_EXCEEDED',
};

GatewayResponses _$GatewayResponsesFromJson(Map<String, dynamic> json) {
  return GatewayResponses(
    items: (json['item'] as List)
        ?.map((e) => e == null
            ? null
            : GatewayResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

Integration _$IntegrationFromJson(Map<String, dynamic> json) {
  return Integration(
    cacheKeyParameters:
        (json['cacheKeyParameters'] as List)?.map((e) => e as String)?.toList(),
    cacheNamespace: json['cacheNamespace'] as String,
    connectionId: json['connectionId'] as String,
    connectionType:
        _$enumDecodeNullable(_$ConnectionTypeEnumMap, json['connectionType']),
    contentHandling: _$enumDecodeNullable(
        _$ContentHandlingStrategyEnumMap, json['contentHandling']),
    credentials: json['credentials'] as String,
    httpMethod: json['httpMethod'] as String,
    integrationResponses:
        (json['integrationResponses'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : IntegrationResponse.fromJson(e as Map<String, dynamic>)),
    ),
    passthroughBehavior: json['passthroughBehavior'] as String,
    requestParameters: (json['requestParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    requestTemplates: (json['requestTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeoutInMillis: json['timeoutInMillis'] as int,
    tlsConfig: json['tlsConfig'] == null
        ? null
        : TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$IntegrationTypeEnumMap, json['type']),
    uri: json['uri'] as String,
  );
}

const _$ConnectionTypeEnumMap = {
  ConnectionType.internet: 'INTERNET',
  ConnectionType.vpcLink: 'VPC_LINK',
};

const _$ContentHandlingStrategyEnumMap = {
  ContentHandlingStrategy.convertToBinary: 'CONVERT_TO_BINARY',
  ContentHandlingStrategy.convertToText: 'CONVERT_TO_TEXT',
};

const _$IntegrationTypeEnumMap = {
  IntegrationType.http: 'HTTP',
  IntegrationType.aws: 'AWS',
  IntegrationType.mock: 'MOCK',
  IntegrationType.httpProxy: 'HTTP_PROXY',
  IntegrationType.awsProxy: 'AWS_PROXY',
};

IntegrationResponse _$IntegrationResponseFromJson(Map<String, dynamic> json) {
  return IntegrationResponse(
    contentHandling: _$enumDecodeNullable(
        _$ContentHandlingStrategyEnumMap, json['contentHandling']),
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseTemplates: (json['responseTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    selectionPattern: json['selectionPattern'] as String,
    statusCode: json['statusCode'] as String,
  );
}

Method _$MethodFromJson(Map<String, dynamic> json) {
  return Method(
    apiKeyRequired: json['apiKeyRequired'] as bool,
    authorizationScopes: (json['authorizationScopes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    authorizationType: json['authorizationType'] as String,
    authorizerId: json['authorizerId'] as String,
    httpMethod: json['httpMethod'] as String,
    methodIntegration: json['methodIntegration'] == null
        ? null
        : Integration.fromJson(
            json['methodIntegration'] as Map<String, dynamic>),
    methodResponses: (json['methodResponses'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : MethodResponse.fromJson(e as Map<String, dynamic>)),
    ),
    operationName: json['operationName'] as String,
    requestModels: (json['requestModels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    requestParameters: (json['requestParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    ),
    requestValidatorId: json['requestValidatorId'] as String,
  );
}

MethodResponse _$MethodResponseFromJson(Map<String, dynamic> json) {
  return MethodResponse(
    responseModels: (json['responseModels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    ),
    statusCode: json['statusCode'] as String,
  );
}

MethodSetting _$MethodSettingFromJson(Map<String, dynamic> json) {
  return MethodSetting(
    cacheDataEncrypted: json['cacheDataEncrypted'] as bool,
    cacheTtlInSeconds: json['cacheTtlInSeconds'] as int,
    cachingEnabled: json['cachingEnabled'] as bool,
    dataTraceEnabled: json['dataTraceEnabled'] as bool,
    loggingLevel: json['loggingLevel'] as String,
    metricsEnabled: json['metricsEnabled'] as bool,
    requireAuthorizationForCacheControl:
        json['requireAuthorizationForCacheControl'] as bool,
    throttlingBurstLimit: json['throttlingBurstLimit'] as int,
    throttlingRateLimit: (json['throttlingRateLimit'] as num)?.toDouble(),
    unauthorizedCacheControlHeaderStrategy: _$enumDecodeNullable(
        _$UnauthorizedCacheControlHeaderStrategyEnumMap,
        json['unauthorizedCacheControlHeaderStrategy']),
  );
}

const _$UnauthorizedCacheControlHeaderStrategyEnumMap = {
  UnauthorizedCacheControlHeaderStrategy.failWith_403: 'FAIL_WITH_403',
  UnauthorizedCacheControlHeaderStrategy.succeedWithResponseHeader:
      'SUCCEED_WITH_RESPONSE_HEADER',
  UnauthorizedCacheControlHeaderStrategy.succeedWithoutResponseHeader:
      'SUCCEED_WITHOUT_RESPONSE_HEADER',
};

MethodSnapshot _$MethodSnapshotFromJson(Map<String, dynamic> json) {
  return MethodSnapshot(
    apiKeyRequired: json['apiKeyRequired'] as bool,
    authorizationType: json['authorizationType'] as String,
  );
}

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
    contentType: json['contentType'] as String,
    description: json['description'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    schema: json['schema'] as String,
  );
}

Models _$ModelsFromJson(Map<String, dynamic> json) {
  return Models(
    items: (json['item'] as List)
        ?.map(
            (e) => e == null ? null : Model.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

MutualTlsAuthentication _$MutualTlsAuthenticationFromJson(
    Map<String, dynamic> json) {
  return MutualTlsAuthentication(
    truststoreUri: json['truststoreUri'] as String,
    truststoreVersion: json['truststoreVersion'] as String,
    truststoreWarnings:
        (json['truststoreWarnings'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MutualTlsAuthenticationInputToJson(
    MutualTlsAuthenticationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('truststoreUri', instance.truststoreUri);
  writeNotNull('truststoreVersion', instance.truststoreVersion);
  return val;
}

Map<String, dynamic> _$PatchOperationToJson(PatchOperation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('from', instance.from);
  writeNotNull('op', _$OpEnumMap[instance.op]);
  writeNotNull('path', instance.path);
  writeNotNull('value', instance.value);
  return val;
}

const _$OpEnumMap = {
  Op.add: 'add',
  Op.remove: 'remove',
  Op.replace: 'replace',
  Op.move: 'move',
  Op.copy: 'copy',
  Op.test: 'test',
};

QuotaSettings _$QuotaSettingsFromJson(Map<String, dynamic> json) {
  return QuotaSettings(
    limit: json['limit'] as int,
    offset: json['offset'] as int,
    period: _$enumDecodeNullable(_$QuotaPeriodTypeEnumMap, json['period']),
  );
}

Map<String, dynamic> _$QuotaSettingsToJson(QuotaSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('limit', instance.limit);
  writeNotNull('offset', instance.offset);
  writeNotNull('period', _$QuotaPeriodTypeEnumMap[instance.period]);
  return val;
}

const _$QuotaPeriodTypeEnumMap = {
  QuotaPeriodType.day: 'DAY',
  QuotaPeriodType.week: 'WEEK',
  QuotaPeriodType.month: 'MONTH',
};

RequestValidator _$RequestValidatorFromJson(Map<String, dynamic> json) {
  return RequestValidator(
    id: json['id'] as String,
    name: json['name'] as String,
    validateRequestBody: json['validateRequestBody'] as bool,
    validateRequestParameters: json['validateRequestParameters'] as bool,
  );
}

RequestValidators _$RequestValidatorsFromJson(Map<String, dynamic> json) {
  return RequestValidators(
    items: (json['item'] as List)
        ?.map((e) => e == null
            ? null
            : RequestValidator.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    id: json['id'] as String,
    parentId: json['parentId'] as String,
    path: json['path'] as String,
    pathPart: json['pathPart'] as String,
    resourceMethods: (json['resourceMethods'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Method.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Resources _$ResourcesFromJson(Map<String, dynamic> json) {
  return Resources(
    items: (json['item'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

RestApi _$RestApiFromJson(Map<String, dynamic> json) {
  return RestApi(
    apiKeySource:
        _$enumDecodeNullable(_$ApiKeySourceTypeEnumMap, json['apiKeySource']),
    binaryMediaTypes:
        (json['binaryMediaTypes'] as List)?.map((e) => e as String)?.toList(),
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String,
    disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool,
    endpointConfiguration: json['endpointConfiguration'] == null
        ? null
        : EndpointConfiguration.fromJson(
            json['endpointConfiguration'] as Map<String, dynamic>),
    id: json['id'] as String,
    minimumCompressionSize: json['minimumCompressionSize'] as int,
    name: json['name'] as String,
    policy: json['policy'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$ApiKeySourceTypeEnumMap = {
  ApiKeySourceType.header: 'HEADER',
  ApiKeySourceType.authorizer: 'AUTHORIZER',
};

RestApis _$RestApisFromJson(Map<String, dynamic> json) {
  return RestApis(
    items: (json['item'] as List)
        ?.map((e) =>
            e == null ? null : RestApi.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

SdkConfigurationProperty _$SdkConfigurationPropertyFromJson(
    Map<String, dynamic> json) {
  return SdkConfigurationProperty(
    defaultValue: json['defaultValue'] as String,
    description: json['description'] as String,
    friendlyName: json['friendlyName'] as String,
    name: json['name'] as String,
    required: json['required'] as bool,
  );
}

SdkResponse _$SdkResponseFromJson(Map<String, dynamic> json) {
  return SdkResponse(
    body: const Uint8ListConverter().fromJson(json['body'] as String),
    contentDisposition: json['Content-Disposition'] as String,
    contentType: json['Content-Type'] as String,
  );
}

SdkType _$SdkTypeFromJson(Map<String, dynamic> json) {
  return SdkType(
    configurationProperties: (json['configurationProperties'] as List)
        ?.map((e) => e == null
            ? null
            : SdkConfigurationProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
    friendlyName: json['friendlyName'] as String,
    id: json['id'] as String,
  );
}

SdkTypes _$SdkTypesFromJson(Map<String, dynamic> json) {
  return SdkTypes(
    items: (json['item'] as List)
        ?.map((e) =>
            e == null ? null : SdkType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

Stage _$StageFromJson(Map<String, dynamic> json) {
  return Stage(
    accessLogSettings: json['accessLogSettings'] == null
        ? null
        : AccessLogSettings.fromJson(
            json['accessLogSettings'] as Map<String, dynamic>),
    cacheClusterEnabled: json['cacheClusterEnabled'] as bool,
    cacheClusterSize: _$enumDecodeNullable(
        _$CacheClusterSizeEnumMap, json['cacheClusterSize']),
    cacheClusterStatus: _$enumDecodeNullable(
        _$CacheClusterStatusEnumMap, json['cacheClusterStatus']),
    canarySettings: json['canarySettings'] == null
        ? null
        : CanarySettings.fromJson(
            json['canarySettings'] as Map<String, dynamic>),
    clientCertificateId: json['clientCertificateId'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    deploymentId: json['deploymentId'] as String,
    description: json['description'] as String,
    documentationVersion: json['documentationVersion'] as String,
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedDate']),
    methodSettings: (json['methodSettings'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : MethodSetting.fromJson(e as Map<String, dynamic>)),
    ),
    stageName: json['stageName'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tracingEnabled: json['tracingEnabled'] as bool,
    variables: (json['variables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    webAclArn: json['webAclArn'] as String,
  );
}

const _$CacheClusterSizeEnumMap = {
  CacheClusterSize.$0_5: '0.5',
  CacheClusterSize.$1_6: '1.6',
  CacheClusterSize.$6_1: '6.1',
  CacheClusterSize.$13_5: '13.5',
  CacheClusterSize.$28_4: '28.4',
  CacheClusterSize.$58_2: '58.2',
  CacheClusterSize.$118: '118',
  CacheClusterSize.$237: '237',
};

const _$CacheClusterStatusEnumMap = {
  CacheClusterStatus.createInProgress: 'CREATE_IN_PROGRESS',
  CacheClusterStatus.available: 'AVAILABLE',
  CacheClusterStatus.deleteInProgress: 'DELETE_IN_PROGRESS',
  CacheClusterStatus.notAvailable: 'NOT_AVAILABLE',
  CacheClusterStatus.flushInProgress: 'FLUSH_IN_PROGRESS',
};

Map<String, dynamic> _$StageKeyToJson(StageKey instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('restApiId', instance.restApiId);
  writeNotNull('stageName', instance.stageName);
  return val;
}

Stages _$StagesFromJson(Map<String, dynamic> json) {
  return Stages(
    item: (json['item'] as List)
        ?.map(
            (e) => e == null ? null : Stage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Template _$TemplateFromJson(Map<String, dynamic> json) {
  return Template(
    value: json['value'] as String,
  );
}

TestInvokeAuthorizerResponse _$TestInvokeAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return TestInvokeAuthorizerResponse(
    authorization: (json['authorization'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    claims: (json['claims'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    clientStatus: json['clientStatus'] as int,
    latency: json['latency'] as int,
    log: json['log'] as String,
    policy: json['policy'] as String,
    principalId: json['principalId'] as String,
  );
}

TestInvokeMethodResponse _$TestInvokeMethodResponseFromJson(
    Map<String, dynamic> json) {
  return TestInvokeMethodResponse(
    body: json['body'] as String,
    headers: (json['headers'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    latency: json['latency'] as int,
    log: json['log'] as String,
    multiValueHeaders: (json['multiValueHeaders'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    status: json['status'] as int,
  );
}

ThrottleSettings _$ThrottleSettingsFromJson(Map<String, dynamic> json) {
  return ThrottleSettings(
    burstLimit: json['burstLimit'] as int,
    rateLimit: (json['rateLimit'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ThrottleSettingsToJson(ThrottleSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('burstLimit', instance.burstLimit);
  writeNotNull('rateLimit', instance.rateLimit);
  return val;
}

TlsConfig _$TlsConfigFromJson(Map<String, dynamic> json) {
  return TlsConfig(
    insecureSkipVerification: json['insecureSkipVerification'] as bool,
  );
}

Map<String, dynamic> _$TlsConfigToJson(TlsConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('insecureSkipVerification', instance.insecureSkipVerification);
  return val;
}

Usage _$UsageFromJson(Map<String, dynamic> json) {
  return Usage(
    endDate: json['endDate'] as String,
    items: (json['values'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => (e as List)?.map((e) => e as int)?.toList())
              ?.toList()),
    ),
    position: json['position'] as String,
    startDate: json['startDate'] as String,
    usagePlanId: json['usagePlanId'] as String,
  );
}

UsagePlan _$UsagePlanFromJson(Map<String, dynamic> json) {
  return UsagePlan(
    apiStages: (json['apiStages'] as List)
        ?.map((e) =>
            e == null ? null : ApiStage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    productCode: json['productCode'] as String,
    quota: json['quota'] == null
        ? null
        : QuotaSettings.fromJson(json['quota'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    throttle: json['throttle'] == null
        ? null
        : ThrottleSettings.fromJson(json['throttle'] as Map<String, dynamic>),
  );
}

UsagePlanKey _$UsagePlanKeyFromJson(Map<String, dynamic> json) {
  return UsagePlanKey(
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    value: json['value'] as String,
  );
}

UsagePlanKeys _$UsagePlanKeysFromJson(Map<String, dynamic> json) {
  return UsagePlanKeys(
    items: (json['item'] as List)
        ?.map((e) =>
            e == null ? null : UsagePlanKey.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

UsagePlans _$UsagePlansFromJson(Map<String, dynamic> json) {
  return UsagePlans(
    items: (json['item'] as List)
        ?.map((e) =>
            e == null ? null : UsagePlan.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}

VpcLink _$VpcLinkFromJson(Map<String, dynamic> json) {
  return VpcLink(
    description: json['description'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$VpcLinkStatusEnumMap, json['status']),
    statusMessage: json['statusMessage'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    targetArns: (json['targetArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$VpcLinkStatusEnumMap = {
  VpcLinkStatus.available: 'AVAILABLE',
  VpcLinkStatus.pending: 'PENDING',
  VpcLinkStatus.deleting: 'DELETING',
  VpcLinkStatus.failed: 'FAILED',
};

VpcLinks _$VpcLinksFromJson(Map<String, dynamic> json) {
  return VpcLinks(
    items: (json['item'] as List)
        ?.map((e) =>
            e == null ? null : VpcLink.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    position: json['position'] as String,
  );
}
