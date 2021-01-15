// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-11-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessLogSettings _$AccessLogSettingsFromJson(Map<String, dynamic> json) {
  return AccessLogSettings(
    destinationArn: json['destinationArn'] as String,
    format: json['format'] as String,
  );
}

Map<String, dynamic> _$AccessLogSettingsToJson(AccessLogSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destinationArn', instance.destinationArn);
  writeNotNull('format', instance.format);
  return val;
}

Api _$ApiFromJson(Map<String, dynamic> json) {
  return Api(
    name: json['name'] as String,
    protocolType:
        _$enumDecodeNullable(_$ProtocolTypeEnumMap, json['protocolType']),
    routeSelectionExpression: json['routeSelectionExpression'] as String,
    apiEndpoint: json['apiEndpoint'] as String,
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    apiId: json['apiId'] as String,
    apiKeySelectionExpression: json['apiKeySelectionExpression'] as String,
    corsConfiguration: json['corsConfiguration'] == null
        ? null
        : Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>),
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String,
    disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool,
    disableSchemaValidation: json['disableSchemaValidation'] as bool,
    importInfo: (json['importInfo'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
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

const _$ProtocolTypeEnumMap = {
  ProtocolType.websocket: 'WEBSOCKET',
  ProtocolType.http: 'HTTP',
};

ApiMapping _$ApiMappingFromJson(Map<String, dynamic> json) {
  return ApiMapping(
    apiId: json['apiId'] as String,
    stage: json['stage'] as String,
    apiMappingId: json['apiMappingId'] as String,
    apiMappingKey: json['apiMappingKey'] as String,
  );
}

Authorizer _$AuthorizerFromJson(Map<String, dynamic> json) {
  return Authorizer(
    name: json['name'] as String,
    authorizerCredentialsArn: json['authorizerCredentialsArn'] as String,
    authorizerId: json['authorizerId'] as String,
    authorizerPayloadFormatVersion:
        json['authorizerPayloadFormatVersion'] as String,
    authorizerResultTtlInSeconds: json['authorizerResultTtlInSeconds'] as int,
    authorizerType:
        _$enumDecodeNullable(_$AuthorizerTypeEnumMap, json['authorizerType']),
    authorizerUri: json['authorizerUri'] as String,
    enableSimpleResponses: json['enableSimpleResponses'] as bool,
    identitySource:
        (json['identitySource'] as List)?.map((e) => e as String)?.toList(),
    identityValidationExpression:
        json['identityValidationExpression'] as String,
    jwtConfiguration: json['jwtConfiguration'] == null
        ? null
        : JWTConfiguration.fromJson(
            json['jwtConfiguration'] as Map<String, dynamic>),
  );
}

const _$AuthorizerTypeEnumMap = {
  AuthorizerType.request: 'REQUEST',
  AuthorizerType.jwt: 'JWT',
};

Cors _$CorsFromJson(Map<String, dynamic> json) {
  return Cors(
    allowCredentials: json['allowCredentials'] as bool,
    allowHeaders:
        (json['allowHeaders'] as List)?.map((e) => e as String)?.toList(),
    allowMethods:
        (json['allowMethods'] as List)?.map((e) => e as String)?.toList(),
    allowOrigins:
        (json['allowOrigins'] as List)?.map((e) => e as String)?.toList(),
    exposeHeaders:
        (json['exposeHeaders'] as List)?.map((e) => e as String)?.toList(),
    maxAge: json['maxAge'] as int,
  );
}

Map<String, dynamic> _$CorsToJson(Cors instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allowCredentials', instance.allowCredentials);
  writeNotNull('allowHeaders', instance.allowHeaders);
  writeNotNull('allowMethods', instance.allowMethods);
  writeNotNull('allowOrigins', instance.allowOrigins);
  writeNotNull('exposeHeaders', instance.exposeHeaders);
  writeNotNull('maxAge', instance.maxAge);
  return val;
}

CreateApiMappingResponse _$CreateApiMappingResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApiMappingResponse(
    apiId: json['apiId'] as String,
    apiMappingId: json['apiMappingId'] as String,
    apiMappingKey: json['apiMappingKey'] as String,
    stage: json['stage'] as String,
  );
}

CreateApiResponse _$CreateApiResponseFromJson(Map<String, dynamic> json) {
  return CreateApiResponse(
    apiEndpoint: json['apiEndpoint'] as String,
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    apiId: json['apiId'] as String,
    apiKeySelectionExpression: json['apiKeySelectionExpression'] as String,
    corsConfiguration: json['corsConfiguration'] == null
        ? null
        : Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>),
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String,
    disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool,
    disableSchemaValidation: json['disableSchemaValidation'] as bool,
    importInfo: (json['importInfo'] as List)?.map((e) => e as String)?.toList(),
    name: json['name'] as String,
    protocolType:
        _$enumDecodeNullable(_$ProtocolTypeEnumMap, json['protocolType']),
    routeSelectionExpression: json['routeSelectionExpression'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
  );
}

CreateAuthorizerResponse _$CreateAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAuthorizerResponse(
    authorizerCredentialsArn: json['authorizerCredentialsArn'] as String,
    authorizerId: json['authorizerId'] as String,
    authorizerPayloadFormatVersion:
        json['authorizerPayloadFormatVersion'] as String,
    authorizerResultTtlInSeconds: json['authorizerResultTtlInSeconds'] as int,
    authorizerType:
        _$enumDecodeNullable(_$AuthorizerTypeEnumMap, json['authorizerType']),
    authorizerUri: json['authorizerUri'] as String,
    enableSimpleResponses: json['enableSimpleResponses'] as bool,
    identitySource:
        (json['identitySource'] as List)?.map((e) => e as String)?.toList(),
    identityValidationExpression:
        json['identityValidationExpression'] as String,
    jwtConfiguration: json['jwtConfiguration'] == null
        ? null
        : JWTConfiguration.fromJson(
            json['jwtConfiguration'] as Map<String, dynamic>),
    name: json['name'] as String,
  );
}

CreateDeploymentResponse _$CreateDeploymentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDeploymentResponse(
    autoDeployed: json['autoDeployed'] as bool,
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    deploymentId: json['deploymentId'] as String,
    deploymentStatus: _$enumDecodeNullable(
        _$DeploymentStatusEnumMap, json['deploymentStatus']),
    deploymentStatusMessage: json['deploymentStatusMessage'] as String,
    description: json['description'] as String,
  );
}

const _$DeploymentStatusEnumMap = {
  DeploymentStatus.pending: 'PENDING',
  DeploymentStatus.failed: 'FAILED',
  DeploymentStatus.deployed: 'DEPLOYED',
};

CreateDomainNameResponse _$CreateDomainNameResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDomainNameResponse(
    apiMappingSelectionExpression:
        json['apiMappingSelectionExpression'] as String,
    domainName: json['domainName'] as String,
    domainNameConfigurations: (json['domainNameConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mutualTlsAuthentication: json['mutualTlsAuthentication'] == null
        ? null
        : MutualTlsAuthentication.fromJson(
            json['mutualTlsAuthentication'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreateIntegrationResult _$CreateIntegrationResultFromJson(
    Map<String, dynamic> json) {
  return CreateIntegrationResult(
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    connectionId: json['connectionId'] as String,
    connectionType:
        _$enumDecodeNullable(_$ConnectionTypeEnumMap, json['connectionType']),
    contentHandlingStrategy: _$enumDecodeNullable(
        _$ContentHandlingStrategyEnumMap, json['contentHandlingStrategy']),
    credentialsArn: json['credentialsArn'] as String,
    description: json['description'] as String,
    integrationId: json['integrationId'] as String,
    integrationMethod: json['integrationMethod'] as String,
    integrationResponseSelectionExpression:
        json['integrationResponseSelectionExpression'] as String,
    integrationSubtype: json['integrationSubtype'] as String,
    integrationType:
        _$enumDecodeNullable(_$IntegrationTypeEnumMap, json['integrationType']),
    integrationUri: json['integrationUri'] as String,
    passthroughBehavior: _$enumDecodeNullable(
        _$PassthroughBehaviorEnumMap, json['passthroughBehavior']),
    payloadFormatVersion: json['payloadFormatVersion'] as String,
    requestParameters: (json['requestParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    requestTemplates: (json['requestTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(k, e as String),
          )),
    ),
    templateSelectionExpression: json['templateSelectionExpression'] as String,
    timeoutInMillis: json['timeoutInMillis'] as int,
    tlsConfig: json['tlsConfig'] == null
        ? null
        : TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>),
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
  IntegrationType.aws: 'AWS',
  IntegrationType.http: 'HTTP',
  IntegrationType.mock: 'MOCK',
  IntegrationType.httpProxy: 'HTTP_PROXY',
  IntegrationType.awsProxy: 'AWS_PROXY',
};

const _$PassthroughBehaviorEnumMap = {
  PassthroughBehavior.whenNoMatch: 'WHEN_NO_MATCH',
  PassthroughBehavior.never: 'NEVER',
  PassthroughBehavior.whenNoTemplates: 'WHEN_NO_TEMPLATES',
};

CreateIntegrationResponseResponse _$CreateIntegrationResponseResponseFromJson(
    Map<String, dynamic> json) {
  return CreateIntegrationResponseResponse(
    contentHandlingStrategy: _$enumDecodeNullable(
        _$ContentHandlingStrategyEnumMap, json['contentHandlingStrategy']),
    integrationResponseId: json['integrationResponseId'] as String,
    integrationResponseKey: json['integrationResponseKey'] as String,
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseTemplates: (json['responseTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    templateSelectionExpression: json['templateSelectionExpression'] as String,
  );
}

CreateModelResponse _$CreateModelResponseFromJson(Map<String, dynamic> json) {
  return CreateModelResponse(
    contentType: json['contentType'] as String,
    description: json['description'] as String,
    modelId: json['modelId'] as String,
    name: json['name'] as String,
    schema: json['schema'] as String,
  );
}

CreateRouteResult _$CreateRouteResultFromJson(Map<String, dynamic> json) {
  return CreateRouteResult(
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    apiKeyRequired: json['apiKeyRequired'] as bool,
    authorizationScopes: (json['authorizationScopes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    authorizationType: _$enumDecodeNullable(
        _$AuthorizationTypeEnumMap, json['authorizationType']),
    authorizerId: json['authorizerId'] as String,
    modelSelectionExpression: json['modelSelectionExpression'] as String,
    operationName: json['operationName'] as String,
    requestModels: (json['requestModels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    requestParameters: (json['requestParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ParameterConstraints.fromJson(e as Map<String, dynamic>)),
    ),
    routeId: json['routeId'] as String,
    routeKey: json['routeKey'] as String,
    routeResponseSelectionExpression:
        json['routeResponseSelectionExpression'] as String,
    target: json['target'] as String,
  );
}

const _$AuthorizationTypeEnumMap = {
  AuthorizationType.none: 'NONE',
  AuthorizationType.awsIam: 'AWS_IAM',
  AuthorizationType.custom: 'CUSTOM',
  AuthorizationType.jwt: 'JWT',
};

CreateRouteResponseResponse _$CreateRouteResponseResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRouteResponseResponse(
    modelSelectionExpression: json['modelSelectionExpression'] as String,
    responseModels: (json['responseModels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ParameterConstraints.fromJson(e as Map<String, dynamic>)),
    ),
    routeResponseId: json['routeResponseId'] as String,
    routeResponseKey: json['routeResponseKey'] as String,
  );
}

CreateStageResponse _$CreateStageResponseFromJson(Map<String, dynamic> json) {
  return CreateStageResponse(
    accessLogSettings: json['accessLogSettings'] == null
        ? null
        : AccessLogSettings.fromJson(
            json['accessLogSettings'] as Map<String, dynamic>),
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    autoDeploy: json['autoDeploy'] as bool,
    clientCertificateId: json['clientCertificateId'] as String,
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    defaultRouteSettings: json['defaultRouteSettings'] == null
        ? null
        : RouteSettings.fromJson(
            json['defaultRouteSettings'] as Map<String, dynamic>),
    deploymentId: json['deploymentId'] as String,
    description: json['description'] as String,
    lastDeploymentStatusMessage: json['lastDeploymentStatusMessage'] as String,
    lastUpdatedDate:
        const IsoDateTimeConverter().fromJson(json['lastUpdatedDate']),
    routeSettings: (json['routeSettings'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : RouteSettings.fromJson(e as Map<String, dynamic>)),
    ),
    stageName: json['stageName'] as String,
    stageVariables: (json['stageVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreateVpcLinkResponse _$CreateVpcLinkResponseFromJson(
    Map<String, dynamic> json) {
  return CreateVpcLinkResponse(
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    name: json['name'] as String,
    securityGroupIds:
        (json['securityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['subnetIds'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    vpcLinkId: json['vpcLinkId'] as String,
    vpcLinkStatus:
        _$enumDecodeNullable(_$VpcLinkStatusEnumMap, json['vpcLinkStatus']),
    vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String,
    vpcLinkVersion:
        _$enumDecodeNullable(_$VpcLinkVersionEnumMap, json['vpcLinkVersion']),
  );
}

const _$VpcLinkStatusEnumMap = {
  VpcLinkStatus.pending: 'PENDING',
  VpcLinkStatus.available: 'AVAILABLE',
  VpcLinkStatus.deleting: 'DELETING',
  VpcLinkStatus.failed: 'FAILED',
  VpcLinkStatus.inactive: 'INACTIVE',
};

const _$VpcLinkVersionEnumMap = {
  VpcLinkVersion.v2: 'V2',
};

DeleteVpcLinkResponse _$DeleteVpcLinkResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteVpcLinkResponse();
}

Deployment _$DeploymentFromJson(Map<String, dynamic> json) {
  return Deployment(
    autoDeployed: json['autoDeployed'] as bool,
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    deploymentId: json['deploymentId'] as String,
    deploymentStatus: _$enumDecodeNullable(
        _$DeploymentStatusEnumMap, json['deploymentStatus']),
    deploymentStatusMessage: json['deploymentStatusMessage'] as String,
    description: json['description'] as String,
  );
}

DomainName _$DomainNameFromJson(Map<String, dynamic> json) {
  return DomainName(
    domainName: json['domainName'] as String,
    apiMappingSelectionExpression:
        json['apiMappingSelectionExpression'] as String,
    domainNameConfigurations: (json['domainNameConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mutualTlsAuthentication: json['mutualTlsAuthentication'] == null
        ? null
        : MutualTlsAuthentication.fromJson(
            json['mutualTlsAuthentication'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DomainNameConfiguration _$DomainNameConfigurationFromJson(
    Map<String, dynamic> json) {
  return DomainNameConfiguration(
    apiGatewayDomainName: json['apiGatewayDomainName'] as String,
    certificateArn: json['certificateArn'] as String,
    certificateName: json['certificateName'] as String,
    certificateUploadDate:
        const IsoDateTimeConverter().fromJson(json['certificateUploadDate']),
    domainNameStatus: _$enumDecodeNullable(
        _$DomainNameStatusEnumMap, json['domainNameStatus']),
    domainNameStatusMessage: json['domainNameStatusMessage'] as String,
    endpointType:
        _$enumDecodeNullable(_$EndpointTypeEnumMap, json['endpointType']),
    hostedZoneId: json['hostedZoneId'] as String,
    securityPolicy:
        _$enumDecodeNullable(_$SecurityPolicyEnumMap, json['securityPolicy']),
  );
}

Map<String, dynamic> _$DomainNameConfigurationToJson(
    DomainNameConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiGatewayDomainName', instance.apiGatewayDomainName);
  writeNotNull('certificateArn', instance.certificateArn);
  writeNotNull('certificateName', instance.certificateName);
  writeNotNull('certificateUploadDate',
      const IsoDateTimeConverter().toJson(instance.certificateUploadDate));
  writeNotNull(
      'domainNameStatus', _$DomainNameStatusEnumMap[instance.domainNameStatus]);
  writeNotNull('domainNameStatusMessage', instance.domainNameStatusMessage);
  writeNotNull('endpointType', _$EndpointTypeEnumMap[instance.endpointType]);
  writeNotNull('hostedZoneId', instance.hostedZoneId);
  writeNotNull(
      'securityPolicy', _$SecurityPolicyEnumMap[instance.securityPolicy]);
  return val;
}

const _$DomainNameStatusEnumMap = {
  DomainNameStatus.available: 'AVAILABLE',
  DomainNameStatus.updating: 'UPDATING',
};

const _$EndpointTypeEnumMap = {
  EndpointType.regional: 'REGIONAL',
  EndpointType.edge: 'EDGE',
};

const _$SecurityPolicyEnumMap = {
  SecurityPolicy.tls_1_0: 'TLS_1_0',
  SecurityPolicy.tls_1_2: 'TLS_1_2',
};

ExportApiResponse _$ExportApiResponseFromJson(Map<String, dynamic> json) {
  return ExportApiResponse(
    body: const Uint8ListConverter().fromJson(json['body'] as String),
  );
}

GetApiMappingResponse _$GetApiMappingResponseFromJson(
    Map<String, dynamic> json) {
  return GetApiMappingResponse(
    apiId: json['apiId'] as String,
    apiMappingId: json['apiMappingId'] as String,
    apiMappingKey: json['apiMappingKey'] as String,
    stage: json['stage'] as String,
  );
}

GetApiMappingsResponse _$GetApiMappingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetApiMappingsResponse(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : ApiMapping.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetApiResponse _$GetApiResponseFromJson(Map<String, dynamic> json) {
  return GetApiResponse(
    apiEndpoint: json['apiEndpoint'] as String,
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    apiId: json['apiId'] as String,
    apiKeySelectionExpression: json['apiKeySelectionExpression'] as String,
    corsConfiguration: json['corsConfiguration'] == null
        ? null
        : Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>),
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String,
    disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool,
    disableSchemaValidation: json['disableSchemaValidation'] as bool,
    importInfo: (json['importInfo'] as List)?.map((e) => e as String)?.toList(),
    name: json['name'] as String,
    protocolType:
        _$enumDecodeNullable(_$ProtocolTypeEnumMap, json['protocolType']),
    routeSelectionExpression: json['routeSelectionExpression'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
  );
}

GetApisResponse _$GetApisResponseFromJson(Map<String, dynamic> json) {
  return GetApisResponse(
    items: (json['items'] as List)
        ?.map((e) => e == null ? null : Api.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetAuthorizerResponse _$GetAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return GetAuthorizerResponse(
    authorizerCredentialsArn: json['authorizerCredentialsArn'] as String,
    authorizerId: json['authorizerId'] as String,
    authorizerPayloadFormatVersion:
        json['authorizerPayloadFormatVersion'] as String,
    authorizerResultTtlInSeconds: json['authorizerResultTtlInSeconds'] as int,
    authorizerType:
        _$enumDecodeNullable(_$AuthorizerTypeEnumMap, json['authorizerType']),
    authorizerUri: json['authorizerUri'] as String,
    enableSimpleResponses: json['enableSimpleResponses'] as bool,
    identitySource:
        (json['identitySource'] as List)?.map((e) => e as String)?.toList(),
    identityValidationExpression:
        json['identityValidationExpression'] as String,
    jwtConfiguration: json['jwtConfiguration'] == null
        ? null
        : JWTConfiguration.fromJson(
            json['jwtConfiguration'] as Map<String, dynamic>),
    name: json['name'] as String,
  );
}

GetAuthorizersResponse _$GetAuthorizersResponseFromJson(
    Map<String, dynamic> json) {
  return GetAuthorizersResponse(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : Authorizer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetDeploymentResponse _$GetDeploymentResponseFromJson(
    Map<String, dynamic> json) {
  return GetDeploymentResponse(
    autoDeployed: json['autoDeployed'] as bool,
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    deploymentId: json['deploymentId'] as String,
    deploymentStatus: _$enumDecodeNullable(
        _$DeploymentStatusEnumMap, json['deploymentStatus']),
    deploymentStatusMessage: json['deploymentStatusMessage'] as String,
    description: json['description'] as String,
  );
}

GetDeploymentsResponse _$GetDeploymentsResponseFromJson(
    Map<String, dynamic> json) {
  return GetDeploymentsResponse(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : Deployment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetDomainNameResponse _$GetDomainNameResponseFromJson(
    Map<String, dynamic> json) {
  return GetDomainNameResponse(
    apiMappingSelectionExpression:
        json['apiMappingSelectionExpression'] as String,
    domainName: json['domainName'] as String,
    domainNameConfigurations: (json['domainNameConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mutualTlsAuthentication: json['mutualTlsAuthentication'] == null
        ? null
        : MutualTlsAuthentication.fromJson(
            json['mutualTlsAuthentication'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetDomainNamesResponse _$GetDomainNamesResponseFromJson(
    Map<String, dynamic> json) {
  return GetDomainNamesResponse(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : DomainName.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetIntegrationResult _$GetIntegrationResultFromJson(Map<String, dynamic> json) {
  return GetIntegrationResult(
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    connectionId: json['connectionId'] as String,
    connectionType:
        _$enumDecodeNullable(_$ConnectionTypeEnumMap, json['connectionType']),
    contentHandlingStrategy: _$enumDecodeNullable(
        _$ContentHandlingStrategyEnumMap, json['contentHandlingStrategy']),
    credentialsArn: json['credentialsArn'] as String,
    description: json['description'] as String,
    integrationId: json['integrationId'] as String,
    integrationMethod: json['integrationMethod'] as String,
    integrationResponseSelectionExpression:
        json['integrationResponseSelectionExpression'] as String,
    integrationSubtype: json['integrationSubtype'] as String,
    integrationType:
        _$enumDecodeNullable(_$IntegrationTypeEnumMap, json['integrationType']),
    integrationUri: json['integrationUri'] as String,
    passthroughBehavior: _$enumDecodeNullable(
        _$PassthroughBehaviorEnumMap, json['passthroughBehavior']),
    payloadFormatVersion: json['payloadFormatVersion'] as String,
    requestParameters: (json['requestParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    requestTemplates: (json['requestTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(k, e as String),
          )),
    ),
    templateSelectionExpression: json['templateSelectionExpression'] as String,
    timeoutInMillis: json['timeoutInMillis'] as int,
    tlsConfig: json['tlsConfig'] == null
        ? null
        : TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>),
  );
}

GetIntegrationResponseResponse _$GetIntegrationResponseResponseFromJson(
    Map<String, dynamic> json) {
  return GetIntegrationResponseResponse(
    contentHandlingStrategy: _$enumDecodeNullable(
        _$ContentHandlingStrategyEnumMap, json['contentHandlingStrategy']),
    integrationResponseId: json['integrationResponseId'] as String,
    integrationResponseKey: json['integrationResponseKey'] as String,
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseTemplates: (json['responseTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    templateSelectionExpression: json['templateSelectionExpression'] as String,
  );
}

GetIntegrationResponsesResponse _$GetIntegrationResponsesResponseFromJson(
    Map<String, dynamic> json) {
  return GetIntegrationResponsesResponse(
    items: (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : IntegrationResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetIntegrationsResponse _$GetIntegrationsResponseFromJson(
    Map<String, dynamic> json) {
  return GetIntegrationsResponse(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : Integration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetModelResponse _$GetModelResponseFromJson(Map<String, dynamic> json) {
  return GetModelResponse(
    contentType: json['contentType'] as String,
    description: json['description'] as String,
    modelId: json['modelId'] as String,
    name: json['name'] as String,
    schema: json['schema'] as String,
  );
}

GetModelTemplateResponse _$GetModelTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return GetModelTemplateResponse(
    value: json['value'] as String,
  );
}

GetModelsResponse _$GetModelsResponseFromJson(Map<String, dynamic> json) {
  return GetModelsResponse(
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Model.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetRouteResult _$GetRouteResultFromJson(Map<String, dynamic> json) {
  return GetRouteResult(
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    apiKeyRequired: json['apiKeyRequired'] as bool,
    authorizationScopes: (json['authorizationScopes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    authorizationType: _$enumDecodeNullable(
        _$AuthorizationTypeEnumMap, json['authorizationType']),
    authorizerId: json['authorizerId'] as String,
    modelSelectionExpression: json['modelSelectionExpression'] as String,
    operationName: json['operationName'] as String,
    requestModels: (json['requestModels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    requestParameters: (json['requestParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ParameterConstraints.fromJson(e as Map<String, dynamic>)),
    ),
    routeId: json['routeId'] as String,
    routeKey: json['routeKey'] as String,
    routeResponseSelectionExpression:
        json['routeResponseSelectionExpression'] as String,
    target: json['target'] as String,
  );
}

GetRouteResponseResponse _$GetRouteResponseResponseFromJson(
    Map<String, dynamic> json) {
  return GetRouteResponseResponse(
    modelSelectionExpression: json['modelSelectionExpression'] as String,
    responseModels: (json['responseModels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ParameterConstraints.fromJson(e as Map<String, dynamic>)),
    ),
    routeResponseId: json['routeResponseId'] as String,
    routeResponseKey: json['routeResponseKey'] as String,
  );
}

GetRouteResponsesResponse _$GetRouteResponsesResponseFromJson(
    Map<String, dynamic> json) {
  return GetRouteResponsesResponse(
    items: (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : RouteResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetRoutesResponse _$GetRoutesResponseFromJson(Map<String, dynamic> json) {
  return GetRoutesResponse(
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Route.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetStageResponse _$GetStageResponseFromJson(Map<String, dynamic> json) {
  return GetStageResponse(
    accessLogSettings: json['accessLogSettings'] == null
        ? null
        : AccessLogSettings.fromJson(
            json['accessLogSettings'] as Map<String, dynamic>),
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    autoDeploy: json['autoDeploy'] as bool,
    clientCertificateId: json['clientCertificateId'] as String,
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    defaultRouteSettings: json['defaultRouteSettings'] == null
        ? null
        : RouteSettings.fromJson(
            json['defaultRouteSettings'] as Map<String, dynamic>),
    deploymentId: json['deploymentId'] as String,
    description: json['description'] as String,
    lastDeploymentStatusMessage: json['lastDeploymentStatusMessage'] as String,
    lastUpdatedDate:
        const IsoDateTimeConverter().fromJson(json['lastUpdatedDate']),
    routeSettings: (json['routeSettings'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : RouteSettings.fromJson(e as Map<String, dynamic>)),
    ),
    stageName: json['stageName'] as String,
    stageVariables: (json['stageVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetStagesResponse _$GetStagesResponseFromJson(Map<String, dynamic> json) {
  return GetStagesResponse(
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Stage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetTagsResponse _$GetTagsResponseFromJson(Map<String, dynamic> json) {
  return GetTagsResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetVpcLinkResponse _$GetVpcLinkResponseFromJson(Map<String, dynamic> json) {
  return GetVpcLinkResponse(
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    name: json['name'] as String,
    securityGroupIds:
        (json['securityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['subnetIds'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    vpcLinkId: json['vpcLinkId'] as String,
    vpcLinkStatus:
        _$enumDecodeNullable(_$VpcLinkStatusEnumMap, json['vpcLinkStatus']),
    vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String,
    vpcLinkVersion:
        _$enumDecodeNullable(_$VpcLinkVersionEnumMap, json['vpcLinkVersion']),
  );
}

GetVpcLinksResponse _$GetVpcLinksResponseFromJson(Map<String, dynamic> json) {
  return GetVpcLinksResponse(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : VpcLink.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ImportApiResponse _$ImportApiResponseFromJson(Map<String, dynamic> json) {
  return ImportApiResponse(
    apiEndpoint: json['apiEndpoint'] as String,
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    apiId: json['apiId'] as String,
    apiKeySelectionExpression: json['apiKeySelectionExpression'] as String,
    corsConfiguration: json['corsConfiguration'] == null
        ? null
        : Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>),
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String,
    disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool,
    disableSchemaValidation: json['disableSchemaValidation'] as bool,
    importInfo: (json['importInfo'] as List)?.map((e) => e as String)?.toList(),
    name: json['name'] as String,
    protocolType:
        _$enumDecodeNullable(_$ProtocolTypeEnumMap, json['protocolType']),
    routeSelectionExpression: json['routeSelectionExpression'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
  );
}

Integration _$IntegrationFromJson(Map<String, dynamic> json) {
  return Integration(
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    connectionId: json['connectionId'] as String,
    connectionType:
        _$enumDecodeNullable(_$ConnectionTypeEnumMap, json['connectionType']),
    contentHandlingStrategy: _$enumDecodeNullable(
        _$ContentHandlingStrategyEnumMap, json['contentHandlingStrategy']),
    credentialsArn: json['credentialsArn'] as String,
    description: json['description'] as String,
    integrationId: json['integrationId'] as String,
    integrationMethod: json['integrationMethod'] as String,
    integrationResponseSelectionExpression:
        json['integrationResponseSelectionExpression'] as String,
    integrationSubtype: json['integrationSubtype'] as String,
    integrationType:
        _$enumDecodeNullable(_$IntegrationTypeEnumMap, json['integrationType']),
    integrationUri: json['integrationUri'] as String,
    passthroughBehavior: _$enumDecodeNullable(
        _$PassthroughBehaviorEnumMap, json['passthroughBehavior']),
    payloadFormatVersion: json['payloadFormatVersion'] as String,
    requestParameters: (json['requestParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    requestTemplates: (json['requestTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(k, e as String),
          )),
    ),
    templateSelectionExpression: json['templateSelectionExpression'] as String,
    timeoutInMillis: json['timeoutInMillis'] as int,
    tlsConfig: json['tlsConfig'] == null
        ? null
        : TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>),
  );
}

IntegrationResponse _$IntegrationResponseFromJson(Map<String, dynamic> json) {
  return IntegrationResponse(
    integrationResponseKey: json['integrationResponseKey'] as String,
    contentHandlingStrategy: _$enumDecodeNullable(
        _$ContentHandlingStrategyEnumMap, json['contentHandlingStrategy']),
    integrationResponseId: json['integrationResponseId'] as String,
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseTemplates: (json['responseTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    templateSelectionExpression: json['templateSelectionExpression'] as String,
  );
}

JWTConfiguration _$JWTConfigurationFromJson(Map<String, dynamic> json) {
  return JWTConfiguration(
    audience: (json['audience'] as List)?.map((e) => e as String)?.toList(),
    issuer: json['issuer'] as String,
  );
}

Map<String, dynamic> _$JWTConfigurationToJson(JWTConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('audience', instance.audience);
  writeNotNull('issuer', instance.issuer);
  return val;
}

Model _$ModelFromJson(Map<String, dynamic> json) {
  return Model(
    name: json['name'] as String,
    contentType: json['contentType'] as String,
    description: json['description'] as String,
    modelId: json['modelId'] as String,
    schema: json['schema'] as String,
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

ParameterConstraints _$ParameterConstraintsFromJson(Map<String, dynamic> json) {
  return ParameterConstraints(
    required: json['required'] as bool,
  );
}

Map<String, dynamic> _$ParameterConstraintsToJson(
    ParameterConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('required', instance.required);
  return val;
}

ReimportApiResponse _$ReimportApiResponseFromJson(Map<String, dynamic> json) {
  return ReimportApiResponse(
    apiEndpoint: json['apiEndpoint'] as String,
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    apiId: json['apiId'] as String,
    apiKeySelectionExpression: json['apiKeySelectionExpression'] as String,
    corsConfiguration: json['corsConfiguration'] == null
        ? null
        : Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>),
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String,
    disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool,
    disableSchemaValidation: json['disableSchemaValidation'] as bool,
    importInfo: (json['importInfo'] as List)?.map((e) => e as String)?.toList(),
    name: json['name'] as String,
    protocolType:
        _$enumDecodeNullable(_$ProtocolTypeEnumMap, json['protocolType']),
    routeSelectionExpression: json['routeSelectionExpression'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
  );
}

Route _$RouteFromJson(Map<String, dynamic> json) {
  return Route(
    routeKey: json['routeKey'] as String,
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    apiKeyRequired: json['apiKeyRequired'] as bool,
    authorizationScopes: (json['authorizationScopes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    authorizationType: _$enumDecodeNullable(
        _$AuthorizationTypeEnumMap, json['authorizationType']),
    authorizerId: json['authorizerId'] as String,
    modelSelectionExpression: json['modelSelectionExpression'] as String,
    operationName: json['operationName'] as String,
    requestModels: (json['requestModels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    requestParameters: (json['requestParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ParameterConstraints.fromJson(e as Map<String, dynamic>)),
    ),
    routeId: json['routeId'] as String,
    routeResponseSelectionExpression:
        json['routeResponseSelectionExpression'] as String,
    target: json['target'] as String,
  );
}

RouteResponse _$RouteResponseFromJson(Map<String, dynamic> json) {
  return RouteResponse(
    routeResponseKey: json['routeResponseKey'] as String,
    modelSelectionExpression: json['modelSelectionExpression'] as String,
    responseModels: (json['responseModels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ParameterConstraints.fromJson(e as Map<String, dynamic>)),
    ),
    routeResponseId: json['routeResponseId'] as String,
  );
}

RouteSettings _$RouteSettingsFromJson(Map<String, dynamic> json) {
  return RouteSettings(
    dataTraceEnabled: json['dataTraceEnabled'] as bool,
    detailedMetricsEnabled: json['detailedMetricsEnabled'] as bool,
    loggingLevel:
        _$enumDecodeNullable(_$LoggingLevelEnumMap, json['loggingLevel']),
    throttlingBurstLimit: json['throttlingBurstLimit'] as int,
    throttlingRateLimit: (json['throttlingRateLimit'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RouteSettingsToJson(RouteSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataTraceEnabled', instance.dataTraceEnabled);
  writeNotNull('detailedMetricsEnabled', instance.detailedMetricsEnabled);
  writeNotNull('loggingLevel', _$LoggingLevelEnumMap[instance.loggingLevel]);
  writeNotNull('throttlingBurstLimit', instance.throttlingBurstLimit);
  writeNotNull('throttlingRateLimit', instance.throttlingRateLimit);
  return val;
}

const _$LoggingLevelEnumMap = {
  LoggingLevel.error: 'ERROR',
  LoggingLevel.info: 'INFO',
  LoggingLevel.off: 'OFF',
};

Stage _$StageFromJson(Map<String, dynamic> json) {
  return Stage(
    stageName: json['stageName'] as String,
    accessLogSettings: json['accessLogSettings'] == null
        ? null
        : AccessLogSettings.fromJson(
            json['accessLogSettings'] as Map<String, dynamic>),
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    autoDeploy: json['autoDeploy'] as bool,
    clientCertificateId: json['clientCertificateId'] as String,
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    defaultRouteSettings: json['defaultRouteSettings'] == null
        ? null
        : RouteSettings.fromJson(
            json['defaultRouteSettings'] as Map<String, dynamic>),
    deploymentId: json['deploymentId'] as String,
    description: json['description'] as String,
    lastDeploymentStatusMessage: json['lastDeploymentStatusMessage'] as String,
    lastUpdatedDate:
        const IsoDateTimeConverter().fromJson(json['lastUpdatedDate']),
    routeSettings: (json['routeSettings'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : RouteSettings.fromJson(e as Map<String, dynamic>)),
    ),
    stageVariables: (json['stageVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TlsConfig _$TlsConfigFromJson(Map<String, dynamic> json) {
  return TlsConfig(
    serverNameToVerify: json['serverNameToVerify'] as String,
  );
}

Map<String, dynamic> _$TlsConfigInputToJson(TlsConfigInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('serverNameToVerify', instance.serverNameToVerify);
  return val;
}

UpdateApiMappingResponse _$UpdateApiMappingResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApiMappingResponse(
    apiId: json['apiId'] as String,
    apiMappingId: json['apiMappingId'] as String,
    apiMappingKey: json['apiMappingKey'] as String,
    stage: json['stage'] as String,
  );
}

UpdateApiResponse _$UpdateApiResponseFromJson(Map<String, dynamic> json) {
  return UpdateApiResponse(
    apiEndpoint: json['apiEndpoint'] as String,
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    apiId: json['apiId'] as String,
    apiKeySelectionExpression: json['apiKeySelectionExpression'] as String,
    corsConfiguration: json['corsConfiguration'] == null
        ? null
        : Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>),
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    description: json['description'] as String,
    disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool,
    disableSchemaValidation: json['disableSchemaValidation'] as bool,
    importInfo: (json['importInfo'] as List)?.map((e) => e as String)?.toList(),
    name: json['name'] as String,
    protocolType:
        _$enumDecodeNullable(_$ProtocolTypeEnumMap, json['protocolType']),
    routeSelectionExpression: json['routeSelectionExpression'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    version: json['version'] as String,
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
  );
}

UpdateAuthorizerResponse _$UpdateAuthorizerResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAuthorizerResponse(
    authorizerCredentialsArn: json['authorizerCredentialsArn'] as String,
    authorizerId: json['authorizerId'] as String,
    authorizerPayloadFormatVersion:
        json['authorizerPayloadFormatVersion'] as String,
    authorizerResultTtlInSeconds: json['authorizerResultTtlInSeconds'] as int,
    authorizerType:
        _$enumDecodeNullable(_$AuthorizerTypeEnumMap, json['authorizerType']),
    authorizerUri: json['authorizerUri'] as String,
    enableSimpleResponses: json['enableSimpleResponses'] as bool,
    identitySource:
        (json['identitySource'] as List)?.map((e) => e as String)?.toList(),
    identityValidationExpression:
        json['identityValidationExpression'] as String,
    jwtConfiguration: json['jwtConfiguration'] == null
        ? null
        : JWTConfiguration.fromJson(
            json['jwtConfiguration'] as Map<String, dynamic>),
    name: json['name'] as String,
  );
}

UpdateDeploymentResponse _$UpdateDeploymentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDeploymentResponse(
    autoDeployed: json['autoDeployed'] as bool,
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    deploymentId: json['deploymentId'] as String,
    deploymentStatus: _$enumDecodeNullable(
        _$DeploymentStatusEnumMap, json['deploymentStatus']),
    deploymentStatusMessage: json['deploymentStatusMessage'] as String,
    description: json['description'] as String,
  );
}

UpdateDomainNameResponse _$UpdateDomainNameResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDomainNameResponse(
    apiMappingSelectionExpression:
        json['apiMappingSelectionExpression'] as String,
    domainName: json['domainName'] as String,
    domainNameConfigurations: (json['domainNameConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mutualTlsAuthentication: json['mutualTlsAuthentication'] == null
        ? null
        : MutualTlsAuthentication.fromJson(
            json['mutualTlsAuthentication'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

UpdateIntegrationResult _$UpdateIntegrationResultFromJson(
    Map<String, dynamic> json) {
  return UpdateIntegrationResult(
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    connectionId: json['connectionId'] as String,
    connectionType:
        _$enumDecodeNullable(_$ConnectionTypeEnumMap, json['connectionType']),
    contentHandlingStrategy: _$enumDecodeNullable(
        _$ContentHandlingStrategyEnumMap, json['contentHandlingStrategy']),
    credentialsArn: json['credentialsArn'] as String,
    description: json['description'] as String,
    integrationId: json['integrationId'] as String,
    integrationMethod: json['integrationMethod'] as String,
    integrationResponseSelectionExpression:
        json['integrationResponseSelectionExpression'] as String,
    integrationSubtype: json['integrationSubtype'] as String,
    integrationType:
        _$enumDecodeNullable(_$IntegrationTypeEnumMap, json['integrationType']),
    integrationUri: json['integrationUri'] as String,
    passthroughBehavior: _$enumDecodeNullable(
        _$PassthroughBehaviorEnumMap, json['passthroughBehavior']),
    payloadFormatVersion: json['payloadFormatVersion'] as String,
    requestParameters: (json['requestParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    requestTemplates: (json['requestTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(k, e as String),
          )),
    ),
    templateSelectionExpression: json['templateSelectionExpression'] as String,
    timeoutInMillis: json['timeoutInMillis'] as int,
    tlsConfig: json['tlsConfig'] == null
        ? null
        : TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>),
  );
}

UpdateIntegrationResponseResponse _$UpdateIntegrationResponseResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateIntegrationResponseResponse(
    contentHandlingStrategy: _$enumDecodeNullable(
        _$ContentHandlingStrategyEnumMap, json['contentHandlingStrategy']),
    integrationResponseId: json['integrationResponseId'] as String,
    integrationResponseKey: json['integrationResponseKey'] as String,
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseTemplates: (json['responseTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    templateSelectionExpression: json['templateSelectionExpression'] as String,
  );
}

UpdateModelResponse _$UpdateModelResponseFromJson(Map<String, dynamic> json) {
  return UpdateModelResponse(
    contentType: json['contentType'] as String,
    description: json['description'] as String,
    modelId: json['modelId'] as String,
    name: json['name'] as String,
    schema: json['schema'] as String,
  );
}

UpdateRouteResult _$UpdateRouteResultFromJson(Map<String, dynamic> json) {
  return UpdateRouteResult(
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    apiKeyRequired: json['apiKeyRequired'] as bool,
    authorizationScopes: (json['authorizationScopes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    authorizationType: _$enumDecodeNullable(
        _$AuthorizationTypeEnumMap, json['authorizationType']),
    authorizerId: json['authorizerId'] as String,
    modelSelectionExpression: json['modelSelectionExpression'] as String,
    operationName: json['operationName'] as String,
    requestModels: (json['requestModels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    requestParameters: (json['requestParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ParameterConstraints.fromJson(e as Map<String, dynamic>)),
    ),
    routeId: json['routeId'] as String,
    routeKey: json['routeKey'] as String,
    routeResponseSelectionExpression:
        json['routeResponseSelectionExpression'] as String,
    target: json['target'] as String,
  );
}

UpdateRouteResponseResponse _$UpdateRouteResponseResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRouteResponseResponse(
    modelSelectionExpression: json['modelSelectionExpression'] as String,
    responseModels: (json['responseModels'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    responseParameters:
        (json['responseParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ParameterConstraints.fromJson(e as Map<String, dynamic>)),
    ),
    routeResponseId: json['routeResponseId'] as String,
    routeResponseKey: json['routeResponseKey'] as String,
  );
}

UpdateStageResponse _$UpdateStageResponseFromJson(Map<String, dynamic> json) {
  return UpdateStageResponse(
    accessLogSettings: json['accessLogSettings'] == null
        ? null
        : AccessLogSettings.fromJson(
            json['accessLogSettings'] as Map<String, dynamic>),
    apiGatewayManaged: json['apiGatewayManaged'] as bool,
    autoDeploy: json['autoDeploy'] as bool,
    clientCertificateId: json['clientCertificateId'] as String,
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    defaultRouteSettings: json['defaultRouteSettings'] == null
        ? null
        : RouteSettings.fromJson(
            json['defaultRouteSettings'] as Map<String, dynamic>),
    deploymentId: json['deploymentId'] as String,
    description: json['description'] as String,
    lastDeploymentStatusMessage: json['lastDeploymentStatusMessage'] as String,
    lastUpdatedDate:
        const IsoDateTimeConverter().fromJson(json['lastUpdatedDate']),
    routeSettings: (json['routeSettings'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : RouteSettings.fromJson(e as Map<String, dynamic>)),
    ),
    stageName: json['stageName'] as String,
    stageVariables: (json['stageVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

UpdateVpcLinkResponse _$UpdateVpcLinkResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateVpcLinkResponse(
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    name: json['name'] as String,
    securityGroupIds:
        (json['securityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['subnetIds'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    vpcLinkId: json['vpcLinkId'] as String,
    vpcLinkStatus:
        _$enumDecodeNullable(_$VpcLinkStatusEnumMap, json['vpcLinkStatus']),
    vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String,
    vpcLinkVersion:
        _$enumDecodeNullable(_$VpcLinkVersionEnumMap, json['vpcLinkVersion']),
  );
}

VpcLink _$VpcLinkFromJson(Map<String, dynamic> json) {
  return VpcLink(
    name: json['name'] as String,
    securityGroupIds:
        (json['securityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['subnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcLinkId: json['vpcLinkId'] as String,
    createdDate: const IsoDateTimeConverter().fromJson(json['createdDate']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    vpcLinkStatus:
        _$enumDecodeNullable(_$VpcLinkStatusEnumMap, json['vpcLinkStatus']),
    vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String,
    vpcLinkVersion:
        _$enumDecodeNullable(_$VpcLinkVersionEnumMap, json['vpcLinkVersion']),
  );
}
