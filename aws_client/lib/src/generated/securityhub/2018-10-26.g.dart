// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-10-26.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptInvitationResponse _$AcceptInvitationResponseFromJson(
    Map<String, dynamic> json) {
  return AcceptInvitationResponse();
}

Map<String, dynamic> _$AccountDetailsToJson(AccountDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('Email', instance.email);
  return val;
}

ActionTarget _$ActionTargetFromJson(Map<String, dynamic> json) {
  return ActionTarget(
    actionTargetArn: json['ActionTargetArn'] as String,
    description: json['Description'] as String,
    name: json['Name'] as String,
  );
}

AdminAccount _$AdminAccountFromJson(Map<String, dynamic> json) {
  return AdminAccount(
    accountId: json['AccountId'] as String,
    status: _$enumDecodeNullable(_$AdminStatusEnumMap, json['Status']),
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

const _$AdminStatusEnumMap = {
  AdminStatus.enabled: 'ENABLED',
  AdminStatus.disableInProgress: 'DISABLE_IN_PROGRESS',
};

AvailabilityZone _$AvailabilityZoneFromJson(Map<String, dynamic> json) {
  return AvailabilityZone(
    subnetId: json['SubnetId'] as String,
    zoneName: json['ZoneName'] as String,
  );
}

Map<String, dynamic> _$AvailabilityZoneToJson(AvailabilityZone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubnetId', instance.subnetId);
  writeNotNull('ZoneName', instance.zoneName);
  return val;
}

AwsApiGatewayAccessLogSettings _$AwsApiGatewayAccessLogSettingsFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayAccessLogSettings(
    destinationArn: json['DestinationArn'] as String,
    format: json['Format'] as String,
  );
}

Map<String, dynamic> _$AwsApiGatewayAccessLogSettingsToJson(
    AwsApiGatewayAccessLogSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationArn', instance.destinationArn);
  writeNotNull('Format', instance.format);
  return val;
}

AwsApiGatewayCanarySettings _$AwsApiGatewayCanarySettingsFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayCanarySettings(
    deploymentId: json['DeploymentId'] as String,
    percentTraffic: (json['PercentTraffic'] as num)?.toDouble(),
    stageVariableOverrides:
        (json['StageVariableOverrides'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    useStageCache: json['UseStageCache'] as bool,
  );
}

Map<String, dynamic> _$AwsApiGatewayCanarySettingsToJson(
    AwsApiGatewayCanarySettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeploymentId', instance.deploymentId);
  writeNotNull('PercentTraffic', instance.percentTraffic);
  writeNotNull('StageVariableOverrides', instance.stageVariableOverrides);
  writeNotNull('UseStageCache', instance.useStageCache);
  return val;
}

AwsApiGatewayEndpointConfiguration _$AwsApiGatewayEndpointConfigurationFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayEndpointConfiguration(
    types: (json['Types'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AwsApiGatewayEndpointConfigurationToJson(
    AwsApiGatewayEndpointConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Types', instance.types);
  return val;
}

AwsApiGatewayMethodSettings _$AwsApiGatewayMethodSettingsFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayMethodSettings(
    cacheDataEncrypted: json['CacheDataEncrypted'] as bool,
    cacheTtlInSeconds: json['CacheTtlInSeconds'] as int,
    cachingEnabled: json['CachingEnabled'] as bool,
    dataTraceEnabled: json['DataTraceEnabled'] as bool,
    httpMethod: json['HttpMethod'] as String,
    loggingLevel: json['LoggingLevel'] as String,
    metricsEnabled: json['MetricsEnabled'] as bool,
    requireAuthorizationForCacheControl:
        json['RequireAuthorizationForCacheControl'] as bool,
    resourcePath: json['ResourcePath'] as String,
    throttlingBurstLimit: json['ThrottlingBurstLimit'] as int,
    throttlingRateLimit: (json['ThrottlingRateLimit'] as num)?.toDouble(),
    unauthorizedCacheControlHeaderStrategy:
        json['UnauthorizedCacheControlHeaderStrategy'] as String,
  );
}

Map<String, dynamic> _$AwsApiGatewayMethodSettingsToJson(
    AwsApiGatewayMethodSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CacheDataEncrypted', instance.cacheDataEncrypted);
  writeNotNull('CacheTtlInSeconds', instance.cacheTtlInSeconds);
  writeNotNull('CachingEnabled', instance.cachingEnabled);
  writeNotNull('DataTraceEnabled', instance.dataTraceEnabled);
  writeNotNull('HttpMethod', instance.httpMethod);
  writeNotNull('LoggingLevel', instance.loggingLevel);
  writeNotNull('MetricsEnabled', instance.metricsEnabled);
  writeNotNull('RequireAuthorizationForCacheControl',
      instance.requireAuthorizationForCacheControl);
  writeNotNull('ResourcePath', instance.resourcePath);
  writeNotNull('ThrottlingBurstLimit', instance.throttlingBurstLimit);
  writeNotNull('ThrottlingRateLimit', instance.throttlingRateLimit);
  writeNotNull('UnauthorizedCacheControlHeaderStrategy',
      instance.unauthorizedCacheControlHeaderStrategy);
  return val;
}

AwsApiGatewayRestApiDetails _$AwsApiGatewayRestApiDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayRestApiDetails(
    apiKeySource: json['ApiKeySource'] as String,
    binaryMediaTypes:
        (json['BinaryMediaTypes'] as List)?.map((e) => e as String)?.toList(),
    createdDate: json['CreatedDate'] as String,
    description: json['Description'] as String,
    endpointConfiguration: json['EndpointConfiguration'] == null
        ? null
        : AwsApiGatewayEndpointConfiguration.fromJson(
            json['EndpointConfiguration'] as Map<String, dynamic>),
    id: json['Id'] as String,
    minimumCompressionSize: json['MinimumCompressionSize'] as int,
    name: json['Name'] as String,
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$AwsApiGatewayRestApiDetailsToJson(
    AwsApiGatewayRestApiDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApiKeySource', instance.apiKeySource);
  writeNotNull('BinaryMediaTypes', instance.binaryMediaTypes);
  writeNotNull('CreatedDate', instance.createdDate);
  writeNotNull('Description', instance.description);
  writeNotNull(
      'EndpointConfiguration', instance.endpointConfiguration?.toJson());
  writeNotNull('Id', instance.id);
  writeNotNull('MinimumCompressionSize', instance.minimumCompressionSize);
  writeNotNull('Name', instance.name);
  writeNotNull('Version', instance.version);
  return val;
}

AwsApiGatewayStageDetails _$AwsApiGatewayStageDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayStageDetails(
    accessLogSettings: json['AccessLogSettings'] == null
        ? null
        : AwsApiGatewayAccessLogSettings.fromJson(
            json['AccessLogSettings'] as Map<String, dynamic>),
    cacheClusterEnabled: json['CacheClusterEnabled'] as bool,
    cacheClusterSize: json['CacheClusterSize'] as String,
    cacheClusterStatus: json['CacheClusterStatus'] as String,
    canarySettings: json['CanarySettings'] == null
        ? null
        : AwsApiGatewayCanarySettings.fromJson(
            json['CanarySettings'] as Map<String, dynamic>),
    clientCertificateId: json['ClientCertificateId'] as String,
    createdDate: json['CreatedDate'] as String,
    deploymentId: json['DeploymentId'] as String,
    description: json['Description'] as String,
    documentationVersion: json['DocumentationVersion'] as String,
    lastUpdatedDate: json['LastUpdatedDate'] as String,
    methodSettings: (json['MethodSettings'] as List)
        ?.map((e) => e == null
            ? null
            : AwsApiGatewayMethodSettings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stageName: json['StageName'] as String,
    tracingEnabled: json['TracingEnabled'] as bool,
    variables: (json['Variables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    webAclArn: json['WebAclArn'] as String,
  );
}

Map<String, dynamic> _$AwsApiGatewayStageDetailsToJson(
    AwsApiGatewayStageDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessLogSettings', instance.accessLogSettings?.toJson());
  writeNotNull('CacheClusterEnabled', instance.cacheClusterEnabled);
  writeNotNull('CacheClusterSize', instance.cacheClusterSize);
  writeNotNull('CacheClusterStatus', instance.cacheClusterStatus);
  writeNotNull('CanarySettings', instance.canarySettings?.toJson());
  writeNotNull('ClientCertificateId', instance.clientCertificateId);
  writeNotNull('CreatedDate', instance.createdDate);
  writeNotNull('DeploymentId', instance.deploymentId);
  writeNotNull('Description', instance.description);
  writeNotNull('DocumentationVersion', instance.documentationVersion);
  writeNotNull('LastUpdatedDate', instance.lastUpdatedDate);
  writeNotNull('MethodSettings',
      instance.methodSettings?.map((e) => e?.toJson())?.toList());
  writeNotNull('StageName', instance.stageName);
  writeNotNull('TracingEnabled', instance.tracingEnabled);
  writeNotNull('Variables', instance.variables);
  writeNotNull('WebAclArn', instance.webAclArn);
  return val;
}

AwsApiGatewayV2ApiDetails _$AwsApiGatewayV2ApiDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayV2ApiDetails(
    apiEndpoint: json['ApiEndpoint'] as String,
    apiId: json['ApiId'] as String,
    apiKeySelectionExpression: json['ApiKeySelectionExpression'] as String,
    corsConfiguration: json['CorsConfiguration'] == null
        ? null
        : AwsCorsConfiguration.fromJson(
            json['CorsConfiguration'] as Map<String, dynamic>),
    createdDate: json['CreatedDate'] as String,
    description: json['Description'] as String,
    name: json['Name'] as String,
    protocolType: json['ProtocolType'] as String,
    routeSelectionExpression: json['RouteSelectionExpression'] as String,
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$AwsApiGatewayV2ApiDetailsToJson(
    AwsApiGatewayV2ApiDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApiEndpoint', instance.apiEndpoint);
  writeNotNull('ApiId', instance.apiId);
  writeNotNull('ApiKeySelectionExpression', instance.apiKeySelectionExpression);
  writeNotNull('CorsConfiguration', instance.corsConfiguration?.toJson());
  writeNotNull('CreatedDate', instance.createdDate);
  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  writeNotNull('ProtocolType', instance.protocolType);
  writeNotNull('RouteSelectionExpression', instance.routeSelectionExpression);
  writeNotNull('Version', instance.version);
  return val;
}

AwsApiGatewayV2RouteSettings _$AwsApiGatewayV2RouteSettingsFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayV2RouteSettings(
    dataTraceEnabled: json['DataTraceEnabled'] as bool,
    detailedMetricsEnabled: json['DetailedMetricsEnabled'] as bool,
    loggingLevel: json['LoggingLevel'] as String,
    throttlingBurstLimit: json['ThrottlingBurstLimit'] as int,
    throttlingRateLimit: (json['ThrottlingRateLimit'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AwsApiGatewayV2RouteSettingsToJson(
    AwsApiGatewayV2RouteSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataTraceEnabled', instance.dataTraceEnabled);
  writeNotNull('DetailedMetricsEnabled', instance.detailedMetricsEnabled);
  writeNotNull('LoggingLevel', instance.loggingLevel);
  writeNotNull('ThrottlingBurstLimit', instance.throttlingBurstLimit);
  writeNotNull('ThrottlingRateLimit', instance.throttlingRateLimit);
  return val;
}

AwsApiGatewayV2StageDetails _$AwsApiGatewayV2StageDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayV2StageDetails(
    accessLogSettings: json['AccessLogSettings'] == null
        ? null
        : AwsApiGatewayAccessLogSettings.fromJson(
            json['AccessLogSettings'] as Map<String, dynamic>),
    apiGatewayManaged: json['ApiGatewayManaged'] as bool,
    autoDeploy: json['AutoDeploy'] as bool,
    createdDate: json['CreatedDate'] as String,
    defaultRouteSettings: json['DefaultRouteSettings'] == null
        ? null
        : AwsApiGatewayV2RouteSettings.fromJson(
            json['DefaultRouteSettings'] as Map<String, dynamic>),
    deploymentId: json['DeploymentId'] as String,
    description: json['Description'] as String,
    lastDeploymentStatusMessage: json['LastDeploymentStatusMessage'] as String,
    lastUpdatedDate: json['LastUpdatedDate'] as String,
    routeSettings: json['RouteSettings'] == null
        ? null
        : AwsApiGatewayV2RouteSettings.fromJson(
            json['RouteSettings'] as Map<String, dynamic>),
    stageName: json['StageName'] as String,
    stageVariables: (json['StageVariables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$AwsApiGatewayV2StageDetailsToJson(
    AwsApiGatewayV2StageDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessLogSettings', instance.accessLogSettings?.toJson());
  writeNotNull('ApiGatewayManaged', instance.apiGatewayManaged);
  writeNotNull('AutoDeploy', instance.autoDeploy);
  writeNotNull('CreatedDate', instance.createdDate);
  writeNotNull('DefaultRouteSettings', instance.defaultRouteSettings?.toJson());
  writeNotNull('DeploymentId', instance.deploymentId);
  writeNotNull('Description', instance.description);
  writeNotNull(
      'LastDeploymentStatusMessage', instance.lastDeploymentStatusMessage);
  writeNotNull('LastUpdatedDate', instance.lastUpdatedDate);
  writeNotNull('RouteSettings', instance.routeSettings?.toJson());
  writeNotNull('StageName', instance.stageName);
  writeNotNull('StageVariables', instance.stageVariables);
  return val;
}

AwsAutoScalingAutoScalingGroupDetails
    _$AwsAutoScalingAutoScalingGroupDetailsFromJson(Map<String, dynamic> json) {
  return AwsAutoScalingAutoScalingGroupDetails(
    createdTime: json['CreatedTime'] as String,
    healthCheckGracePeriod: json['HealthCheckGracePeriod'] as int,
    healthCheckType: json['HealthCheckType'] as String,
    launchConfigurationName: json['LaunchConfigurationName'] as String,
    loadBalancerNames:
        (json['LoadBalancerNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AwsAutoScalingAutoScalingGroupDetailsToJson(
    AwsAutoScalingAutoScalingGroupDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatedTime', instance.createdTime);
  writeNotNull('HealthCheckGracePeriod', instance.healthCheckGracePeriod);
  writeNotNull('HealthCheckType', instance.healthCheckType);
  writeNotNull('LaunchConfigurationName', instance.launchConfigurationName);
  writeNotNull('LoadBalancerNames', instance.loadBalancerNames);
  return val;
}

AwsCertificateManagerCertificateDetails
    _$AwsCertificateManagerCertificateDetailsFromJson(
        Map<String, dynamic> json) {
  return AwsCertificateManagerCertificateDetails(
    certificateAuthorityArn: json['CertificateAuthorityArn'] as String,
    createdAt: json['CreatedAt'] as String,
    domainName: json['DomainName'] as String,
    domainValidationOptions: (json['DomainValidationOptions'] as List)
        ?.map((e) => e == null
            ? null
            : AwsCertificateManagerCertificateDomainValidationOption.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    extendedKeyUsages: (json['ExtendedKeyUsages'] as List)
        ?.map((e) => e == null
            ? null
            : AwsCertificateManagerCertificateExtendedKeyUsage.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    failureReason: json['FailureReason'] as String,
    importedAt: json['ImportedAt'] as String,
    inUseBy: (json['InUseBy'] as List)?.map((e) => e as String)?.toList(),
    issuedAt: json['IssuedAt'] as String,
    issuer: json['Issuer'] as String,
    keyAlgorithm: json['KeyAlgorithm'] as String,
    keyUsages: (json['KeyUsages'] as List)
        ?.map((e) => e == null
            ? null
            : AwsCertificateManagerCertificateKeyUsage.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    notAfter: json['NotAfter'] as String,
    notBefore: json['NotBefore'] as String,
    options: json['Options'] == null
        ? null
        : AwsCertificateManagerCertificateOptions.fromJson(
            json['Options'] as Map<String, dynamic>),
    renewalEligibility: json['RenewalEligibility'] as String,
    renewalSummary: json['RenewalSummary'] == null
        ? null
        : AwsCertificateManagerCertificateRenewalSummary.fromJson(
            json['RenewalSummary'] as Map<String, dynamic>),
    serial: json['Serial'] as String,
    signatureAlgorithm: json['SignatureAlgorithm'] as String,
    status: json['Status'] as String,
    subject: json['Subject'] as String,
    subjectAlternativeNames: (json['SubjectAlternativeNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$AwsCertificateManagerCertificateDetailsToJson(
    AwsCertificateManagerCertificateDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CertificateAuthorityArn', instance.certificateAuthorityArn);
  writeNotNull('CreatedAt', instance.createdAt);
  writeNotNull('DomainName', instance.domainName);
  writeNotNull('DomainValidationOptions',
      instance.domainValidationOptions?.map((e) => e?.toJson())?.toList());
  writeNotNull('ExtendedKeyUsages',
      instance.extendedKeyUsages?.map((e) => e?.toJson())?.toList());
  writeNotNull('FailureReason', instance.failureReason);
  writeNotNull('ImportedAt', instance.importedAt);
  writeNotNull('InUseBy', instance.inUseBy);
  writeNotNull('IssuedAt', instance.issuedAt);
  writeNotNull('Issuer', instance.issuer);
  writeNotNull('KeyAlgorithm', instance.keyAlgorithm);
  writeNotNull(
      'KeyUsages', instance.keyUsages?.map((e) => e?.toJson())?.toList());
  writeNotNull('NotAfter', instance.notAfter);
  writeNotNull('NotBefore', instance.notBefore);
  writeNotNull('Options', instance.options?.toJson());
  writeNotNull('RenewalEligibility', instance.renewalEligibility);
  writeNotNull('RenewalSummary', instance.renewalSummary?.toJson());
  writeNotNull('Serial', instance.serial);
  writeNotNull('SignatureAlgorithm', instance.signatureAlgorithm);
  writeNotNull('Status', instance.status);
  writeNotNull('Subject', instance.subject);
  writeNotNull('SubjectAlternativeNames', instance.subjectAlternativeNames);
  writeNotNull('Type', instance.type);
  return val;
}

AwsCertificateManagerCertificateDomainValidationOption
    _$AwsCertificateManagerCertificateDomainValidationOptionFromJson(
        Map<String, dynamic> json) {
  return AwsCertificateManagerCertificateDomainValidationOption(
    domainName: json['DomainName'] as String,
    resourceRecord: json['ResourceRecord'] == null
        ? null
        : AwsCertificateManagerCertificateResourceRecord.fromJson(
            json['ResourceRecord'] as Map<String, dynamic>),
    validationDomain: json['ValidationDomain'] as String,
    validationEmails:
        (json['ValidationEmails'] as List)?.map((e) => e as String)?.toList(),
    validationMethod: json['ValidationMethod'] as String,
    validationStatus: json['ValidationStatus'] as String,
  );
}

Map<String, dynamic>
    _$AwsCertificateManagerCertificateDomainValidationOptionToJson(
        AwsCertificateManagerCertificateDomainValidationOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('ResourceRecord', instance.resourceRecord?.toJson());
  writeNotNull('ValidationDomain', instance.validationDomain);
  writeNotNull('ValidationEmails', instance.validationEmails);
  writeNotNull('ValidationMethod', instance.validationMethod);
  writeNotNull('ValidationStatus', instance.validationStatus);
  return val;
}

AwsCertificateManagerCertificateExtendedKeyUsage
    _$AwsCertificateManagerCertificateExtendedKeyUsageFromJson(
        Map<String, dynamic> json) {
  return AwsCertificateManagerCertificateExtendedKeyUsage(
    name: json['Name'] as String,
    oId: json['OId'] as String,
  );
}

Map<String, dynamic> _$AwsCertificateManagerCertificateExtendedKeyUsageToJson(
    AwsCertificateManagerCertificateExtendedKeyUsage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('OId', instance.oId);
  return val;
}

AwsCertificateManagerCertificateKeyUsage
    _$AwsCertificateManagerCertificateKeyUsageFromJson(
        Map<String, dynamic> json) {
  return AwsCertificateManagerCertificateKeyUsage(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$AwsCertificateManagerCertificateKeyUsageToJson(
    AwsCertificateManagerCertificateKeyUsage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

AwsCertificateManagerCertificateOptions
    _$AwsCertificateManagerCertificateOptionsFromJson(
        Map<String, dynamic> json) {
  return AwsCertificateManagerCertificateOptions(
    certificateTransparencyLoggingPreference:
        json['CertificateTransparencyLoggingPreference'] as String,
  );
}

Map<String, dynamic> _$AwsCertificateManagerCertificateOptionsToJson(
    AwsCertificateManagerCertificateOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CertificateTransparencyLoggingPreference',
      instance.certificateTransparencyLoggingPreference);
  return val;
}

AwsCertificateManagerCertificateRenewalSummary
    _$AwsCertificateManagerCertificateRenewalSummaryFromJson(
        Map<String, dynamic> json) {
  return AwsCertificateManagerCertificateRenewalSummary(
    domainValidationOptions: (json['DomainValidationOptions'] as List)
        ?.map((e) => e == null
            ? null
            : AwsCertificateManagerCertificateDomainValidationOption.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    renewalStatus: json['RenewalStatus'] as String,
    renewalStatusReason: json['RenewalStatusReason'] as String,
    updatedAt: json['UpdatedAt'] as String,
  );
}

Map<String, dynamic> _$AwsCertificateManagerCertificateRenewalSummaryToJson(
    AwsCertificateManagerCertificateRenewalSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainValidationOptions',
      instance.domainValidationOptions?.map((e) => e?.toJson())?.toList());
  writeNotNull('RenewalStatus', instance.renewalStatus);
  writeNotNull('RenewalStatusReason', instance.renewalStatusReason);
  writeNotNull('UpdatedAt', instance.updatedAt);
  return val;
}

AwsCertificateManagerCertificateResourceRecord
    _$AwsCertificateManagerCertificateResourceRecordFromJson(
        Map<String, dynamic> json) {
  return AwsCertificateManagerCertificateResourceRecord(
    name: json['Name'] as String,
    type: json['Type'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$AwsCertificateManagerCertificateResourceRecordToJson(
    AwsCertificateManagerCertificateResourceRecord instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Type', instance.type);
  writeNotNull('Value', instance.value);
  return val;
}

AwsCloudFrontDistributionCacheBehavior
    _$AwsCloudFrontDistributionCacheBehaviorFromJson(
        Map<String, dynamic> json) {
  return AwsCloudFrontDistributionCacheBehavior(
    viewerProtocolPolicy: json['ViewerProtocolPolicy'] as String,
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionCacheBehaviorToJson(
    AwsCloudFrontDistributionCacheBehavior instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ViewerProtocolPolicy', instance.viewerProtocolPolicy);
  return val;
}

AwsCloudFrontDistributionCacheBehaviors
    _$AwsCloudFrontDistributionCacheBehaviorsFromJson(
        Map<String, dynamic> json) {
  return AwsCloudFrontDistributionCacheBehaviors(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : AwsCloudFrontDistributionCacheBehavior.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionCacheBehaviorsToJson(
    AwsCloudFrontDistributionCacheBehaviors instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Items', instance.items?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsCloudFrontDistributionDefaultCacheBehavior
    _$AwsCloudFrontDistributionDefaultCacheBehaviorFromJson(
        Map<String, dynamic> json) {
  return AwsCloudFrontDistributionDefaultCacheBehavior(
    viewerProtocolPolicy: json['ViewerProtocolPolicy'] as String,
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionDefaultCacheBehaviorToJson(
    AwsCloudFrontDistributionDefaultCacheBehavior instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ViewerProtocolPolicy', instance.viewerProtocolPolicy);
  return val;
}

AwsCloudFrontDistributionDetails _$AwsCloudFrontDistributionDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsCloudFrontDistributionDetails(
    cacheBehaviors: json['CacheBehaviors'] == null
        ? null
        : AwsCloudFrontDistributionCacheBehaviors.fromJson(
            json['CacheBehaviors'] as Map<String, dynamic>),
    defaultCacheBehavior: json['DefaultCacheBehavior'] == null
        ? null
        : AwsCloudFrontDistributionDefaultCacheBehavior.fromJson(
            json['DefaultCacheBehavior'] as Map<String, dynamic>),
    defaultRootObject: json['DefaultRootObject'] as String,
    domainName: json['DomainName'] as String,
    eTag: json['ETag'] as String,
    lastModifiedTime: json['LastModifiedTime'] as String,
    logging: json['Logging'] == null
        ? null
        : AwsCloudFrontDistributionLogging.fromJson(
            json['Logging'] as Map<String, dynamic>),
    originGroups: json['OriginGroups'] == null
        ? null
        : AwsCloudFrontDistributionOriginGroups.fromJson(
            json['OriginGroups'] as Map<String, dynamic>),
    origins: json['Origins'] == null
        ? null
        : AwsCloudFrontDistributionOrigins.fromJson(
            json['Origins'] as Map<String, dynamic>),
    status: json['Status'] as String,
    webAclId: json['WebAclId'] as String,
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionDetailsToJson(
    AwsCloudFrontDistributionDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CacheBehaviors', instance.cacheBehaviors?.toJson());
  writeNotNull('DefaultCacheBehavior', instance.defaultCacheBehavior?.toJson());
  writeNotNull('DefaultRootObject', instance.defaultRootObject);
  writeNotNull('DomainName', instance.domainName);
  writeNotNull('ETag', instance.eTag);
  writeNotNull('LastModifiedTime', instance.lastModifiedTime);
  writeNotNull('Logging', instance.logging?.toJson());
  writeNotNull('OriginGroups', instance.originGroups?.toJson());
  writeNotNull('Origins', instance.origins?.toJson());
  writeNotNull('Status', instance.status);
  writeNotNull('WebAclId', instance.webAclId);
  return val;
}

AwsCloudFrontDistributionLogging _$AwsCloudFrontDistributionLoggingFromJson(
    Map<String, dynamic> json) {
  return AwsCloudFrontDistributionLogging(
    bucket: json['Bucket'] as String,
    enabled: json['Enabled'] as bool,
    includeCookies: json['IncludeCookies'] as bool,
    prefix: json['Prefix'] as String,
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionLoggingToJson(
    AwsCloudFrontDistributionLogging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('IncludeCookies', instance.includeCookies);
  writeNotNull('Prefix', instance.prefix);
  return val;
}

AwsCloudFrontDistributionOriginGroup
    _$AwsCloudFrontDistributionOriginGroupFromJson(Map<String, dynamic> json) {
  return AwsCloudFrontDistributionOriginGroup(
    failoverCriteria: json['FailoverCriteria'] == null
        ? null
        : AwsCloudFrontDistributionOriginGroupFailover.fromJson(
            json['FailoverCriteria'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionOriginGroupToJson(
    AwsCloudFrontDistributionOriginGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FailoverCriteria', instance.failoverCriteria?.toJson());
  return val;
}

AwsCloudFrontDistributionOriginGroupFailover
    _$AwsCloudFrontDistributionOriginGroupFailoverFromJson(
        Map<String, dynamic> json) {
  return AwsCloudFrontDistributionOriginGroupFailover(
    statusCodes: json['StatusCodes'] == null
        ? null
        : AwsCloudFrontDistributionOriginGroupFailoverStatusCodes.fromJson(
            json['StatusCodes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionOriginGroupFailoverToJson(
    AwsCloudFrontDistributionOriginGroupFailover instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StatusCodes', instance.statusCodes?.toJson());
  return val;
}

AwsCloudFrontDistributionOriginGroupFailoverStatusCodes
    _$AwsCloudFrontDistributionOriginGroupFailoverStatusCodesFromJson(
        Map<String, dynamic> json) {
  return AwsCloudFrontDistributionOriginGroupFailoverStatusCodes(
    items: (json['Items'] as List)?.map((e) => e as int)?.toList(),
    quantity: json['Quantity'] as int,
  );
}

Map<String, dynamic>
    _$AwsCloudFrontDistributionOriginGroupFailoverStatusCodesToJson(
        AwsCloudFrontDistributionOriginGroupFailoverStatusCodes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Items', instance.items);
  writeNotNull('Quantity', instance.quantity);
  return val;
}

AwsCloudFrontDistributionOriginGroups
    _$AwsCloudFrontDistributionOriginGroupsFromJson(Map<String, dynamic> json) {
  return AwsCloudFrontDistributionOriginGroups(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : AwsCloudFrontDistributionOriginGroup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionOriginGroupsToJson(
    AwsCloudFrontDistributionOriginGroups instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Items', instance.items?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsCloudFrontDistributionOriginItem
    _$AwsCloudFrontDistributionOriginItemFromJson(Map<String, dynamic> json) {
  return AwsCloudFrontDistributionOriginItem(
    domainName: json['DomainName'] as String,
    id: json['Id'] as String,
    originPath: json['OriginPath'] as String,
    s3OriginConfig: json['S3OriginConfig'] == null
        ? null
        : AwsCloudFrontDistributionOriginS3OriginConfig.fromJson(
            json['S3OriginConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionOriginItemToJson(
    AwsCloudFrontDistributionOriginItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('Id', instance.id);
  writeNotNull('OriginPath', instance.originPath);
  writeNotNull('S3OriginConfig', instance.s3OriginConfig?.toJson());
  return val;
}

AwsCloudFrontDistributionOriginS3OriginConfig
    _$AwsCloudFrontDistributionOriginS3OriginConfigFromJson(
        Map<String, dynamic> json) {
  return AwsCloudFrontDistributionOriginS3OriginConfig(
    originAccessIdentity: json['OriginAccessIdentity'] as String,
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionOriginS3OriginConfigToJson(
    AwsCloudFrontDistributionOriginS3OriginConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OriginAccessIdentity', instance.originAccessIdentity);
  return val;
}

AwsCloudFrontDistributionOrigins _$AwsCloudFrontDistributionOriginsFromJson(
    Map<String, dynamic> json) {
  return AwsCloudFrontDistributionOrigins(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : AwsCloudFrontDistributionOriginItem.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionOriginsToJson(
    AwsCloudFrontDistributionOrigins instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Items', instance.items?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsCloudTrailTrailDetails _$AwsCloudTrailTrailDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsCloudTrailTrailDetails(
    cloudWatchLogsLogGroupArn: json['CloudWatchLogsLogGroupArn'] as String,
    cloudWatchLogsRoleArn: json['CloudWatchLogsRoleArn'] as String,
    hasCustomEventSelectors: json['HasCustomEventSelectors'] as bool,
    homeRegion: json['HomeRegion'] as String,
    includeGlobalServiceEvents: json['IncludeGlobalServiceEvents'] as bool,
    isMultiRegionTrail: json['IsMultiRegionTrail'] as bool,
    isOrganizationTrail: json['IsOrganizationTrail'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
    logFileValidationEnabled: json['LogFileValidationEnabled'] as bool,
    name: json['Name'] as String,
    s3BucketName: json['S3BucketName'] as String,
    s3KeyPrefix: json['S3KeyPrefix'] as String,
    snsTopicArn: json['SnsTopicArn'] as String,
    snsTopicName: json['SnsTopicName'] as String,
    trailArn: json['TrailArn'] as String,
  );
}

Map<String, dynamic> _$AwsCloudTrailTrailDetailsToJson(
    AwsCloudTrailTrailDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudWatchLogsLogGroupArn', instance.cloudWatchLogsLogGroupArn);
  writeNotNull('CloudWatchLogsRoleArn', instance.cloudWatchLogsRoleArn);
  writeNotNull('HasCustomEventSelectors', instance.hasCustomEventSelectors);
  writeNotNull('HomeRegion', instance.homeRegion);
  writeNotNull(
      'IncludeGlobalServiceEvents', instance.includeGlobalServiceEvents);
  writeNotNull('IsMultiRegionTrail', instance.isMultiRegionTrail);
  writeNotNull('IsOrganizationTrail', instance.isOrganizationTrail);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('LogFileValidationEnabled', instance.logFileValidationEnabled);
  writeNotNull('Name', instance.name);
  writeNotNull('S3BucketName', instance.s3BucketName);
  writeNotNull('S3KeyPrefix', instance.s3KeyPrefix);
  writeNotNull('SnsTopicArn', instance.snsTopicArn);
  writeNotNull('SnsTopicName', instance.snsTopicName);
  writeNotNull('TrailArn', instance.trailArn);
  return val;
}

AwsCodeBuildProjectDetails _$AwsCodeBuildProjectDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsCodeBuildProjectDetails(
    encryptionKey: json['EncryptionKey'] as String,
    environment: json['Environment'] == null
        ? null
        : AwsCodeBuildProjectEnvironment.fromJson(
            json['Environment'] as Map<String, dynamic>),
    name: json['Name'] as String,
    serviceRole: json['ServiceRole'] as String,
    source: json['Source'] == null
        ? null
        : AwsCodeBuildProjectSource.fromJson(
            json['Source'] as Map<String, dynamic>),
    vpcConfig: json['VpcConfig'] == null
        ? null
        : AwsCodeBuildProjectVpcConfig.fromJson(
            json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsCodeBuildProjectDetailsToJson(
    AwsCodeBuildProjectDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EncryptionKey', instance.encryptionKey);
  writeNotNull('Environment', instance.environment?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('ServiceRole', instance.serviceRole);
  writeNotNull('Source', instance.source?.toJson());
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

AwsCodeBuildProjectEnvironment _$AwsCodeBuildProjectEnvironmentFromJson(
    Map<String, dynamic> json) {
  return AwsCodeBuildProjectEnvironment(
    certificate: json['Certificate'] as String,
    imagePullCredentialsType: json['ImagePullCredentialsType'] as String,
    registryCredential: json['RegistryCredential'] == null
        ? null
        : AwsCodeBuildProjectEnvironmentRegistryCredential.fromJson(
            json['RegistryCredential'] as Map<String, dynamic>),
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$AwsCodeBuildProjectEnvironmentToJson(
    AwsCodeBuildProjectEnvironment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Certificate', instance.certificate);
  writeNotNull('ImagePullCredentialsType', instance.imagePullCredentialsType);
  writeNotNull('RegistryCredential', instance.registryCredential?.toJson());
  writeNotNull('Type', instance.type);
  return val;
}

AwsCodeBuildProjectEnvironmentRegistryCredential
    _$AwsCodeBuildProjectEnvironmentRegistryCredentialFromJson(
        Map<String, dynamic> json) {
  return AwsCodeBuildProjectEnvironmentRegistryCredential(
    credential: json['Credential'] as String,
    credentialProvider: json['CredentialProvider'] as String,
  );
}

Map<String, dynamic> _$AwsCodeBuildProjectEnvironmentRegistryCredentialToJson(
    AwsCodeBuildProjectEnvironmentRegistryCredential instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Credential', instance.credential);
  writeNotNull('CredentialProvider', instance.credentialProvider);
  return val;
}

AwsCodeBuildProjectSource _$AwsCodeBuildProjectSourceFromJson(
    Map<String, dynamic> json) {
  return AwsCodeBuildProjectSource(
    gitCloneDepth: json['GitCloneDepth'] as int,
    insecureSsl: json['InsecureSsl'] as bool,
    location: json['Location'] as String,
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$AwsCodeBuildProjectSourceToJson(
    AwsCodeBuildProjectSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GitCloneDepth', instance.gitCloneDepth);
  writeNotNull('InsecureSsl', instance.insecureSsl);
  writeNotNull('Location', instance.location);
  writeNotNull('Type', instance.type);
  return val;
}

AwsCodeBuildProjectVpcConfig _$AwsCodeBuildProjectVpcConfigFromJson(
    Map<String, dynamic> json) {
  return AwsCodeBuildProjectVpcConfig(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnets: (json['Subnets'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsCodeBuildProjectVpcConfigToJson(
    AwsCodeBuildProjectVpcConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('Subnets', instance.subnets);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsCorsConfiguration _$AwsCorsConfigurationFromJson(Map<String, dynamic> json) {
  return AwsCorsConfiguration(
    allowCredentials: json['AllowCredentials'] as bool,
    allowHeaders:
        (json['AllowHeaders'] as List)?.map((e) => e as String)?.toList(),
    allowMethods:
        (json['AllowMethods'] as List)?.map((e) => e as String)?.toList(),
    allowOrigins:
        (json['AllowOrigins'] as List)?.map((e) => e as String)?.toList(),
    exposeHeaders:
        (json['ExposeHeaders'] as List)?.map((e) => e as String)?.toList(),
    maxAge: json['MaxAge'] as int,
  );
}

Map<String, dynamic> _$AwsCorsConfigurationToJson(
    AwsCorsConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowCredentials', instance.allowCredentials);
  writeNotNull('AllowHeaders', instance.allowHeaders);
  writeNotNull('AllowMethods', instance.allowMethods);
  writeNotNull('AllowOrigins', instance.allowOrigins);
  writeNotNull('ExposeHeaders', instance.exposeHeaders);
  writeNotNull('MaxAge', instance.maxAge);
  return val;
}

AwsDynamoDbTableAttributeDefinition
    _$AwsDynamoDbTableAttributeDefinitionFromJson(Map<String, dynamic> json) {
  return AwsDynamoDbTableAttributeDefinition(
    attributeName: json['AttributeName'] as String,
    attributeType: json['AttributeType'] as String,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableAttributeDefinitionToJson(
    AwsDynamoDbTableAttributeDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('AttributeType', instance.attributeType);
  return val;
}

AwsDynamoDbTableBillingModeSummary _$AwsDynamoDbTableBillingModeSummaryFromJson(
    Map<String, dynamic> json) {
  return AwsDynamoDbTableBillingModeSummary(
    billingMode: json['BillingMode'] as String,
    lastUpdateToPayPerRequestDateTime:
        json['LastUpdateToPayPerRequestDateTime'] as String,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableBillingModeSummaryToJson(
    AwsDynamoDbTableBillingModeSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BillingMode', instance.billingMode);
  writeNotNull('LastUpdateToPayPerRequestDateTime',
      instance.lastUpdateToPayPerRequestDateTime);
  return val;
}

AwsDynamoDbTableDetails _$AwsDynamoDbTableDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsDynamoDbTableDetails(
    attributeDefinitions: (json['AttributeDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : AwsDynamoDbTableAttributeDefinition.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    billingModeSummary: json['BillingModeSummary'] == null
        ? null
        : AwsDynamoDbTableBillingModeSummary.fromJson(
            json['BillingModeSummary'] as Map<String, dynamic>),
    creationDateTime: json['CreationDateTime'] as String,
    globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : AwsDynamoDbTableGlobalSecondaryIndex.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    globalTableVersion: json['GlobalTableVersion'] as String,
    itemCount: json['ItemCount'] as int,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : AwsDynamoDbTableKeySchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    latestStreamArn: json['LatestStreamArn'] as String,
    latestStreamLabel: json['LatestStreamLabel'] as String,
    localSecondaryIndexes: (json['LocalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : AwsDynamoDbTableLocalSecondaryIndex.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : AwsDynamoDbTableProvisionedThroughput.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
    replicas: (json['Replicas'] as List)
        ?.map((e) => e == null
            ? null
            : AwsDynamoDbTableReplica.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    restoreSummary: json['RestoreSummary'] == null
        ? null
        : AwsDynamoDbTableRestoreSummary.fromJson(
            json['RestoreSummary'] as Map<String, dynamic>),
    sseDescription: json['SseDescription'] == null
        ? null
        : AwsDynamoDbTableSseDescription.fromJson(
            json['SseDescription'] as Map<String, dynamic>),
    streamSpecification: json['StreamSpecification'] == null
        ? null
        : AwsDynamoDbTableStreamSpecification.fromJson(
            json['StreamSpecification'] as Map<String, dynamic>),
    tableId: json['TableId'] as String,
    tableName: json['TableName'] as String,
    tableSizeBytes: json['TableSizeBytes'] as int,
    tableStatus: json['TableStatus'] as String,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableDetailsToJson(
    AwsDynamoDbTableDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeDefinitions',
      instance.attributeDefinitions?.map((e) => e?.toJson())?.toList());
  writeNotNull('BillingModeSummary', instance.billingModeSummary?.toJson());
  writeNotNull('CreationDateTime', instance.creationDateTime);
  writeNotNull('GlobalSecondaryIndexes',
      instance.globalSecondaryIndexes?.map((e) => e?.toJson())?.toList());
  writeNotNull('GlobalTableVersion', instance.globalTableVersion);
  writeNotNull('ItemCount', instance.itemCount);
  writeNotNull(
      'KeySchema', instance.keySchema?.map((e) => e?.toJson())?.toList());
  writeNotNull('LatestStreamArn', instance.latestStreamArn);
  writeNotNull('LatestStreamLabel', instance.latestStreamLabel);
  writeNotNull('LocalSecondaryIndexes',
      instance.localSecondaryIndexes?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProvisionedThroughput', instance.provisionedThroughput?.toJson());
  writeNotNull(
      'Replicas', instance.replicas?.map((e) => e?.toJson())?.toList());
  writeNotNull('RestoreSummary', instance.restoreSummary?.toJson());
  writeNotNull('SseDescription', instance.sseDescription?.toJson());
  writeNotNull('StreamSpecification', instance.streamSpecification?.toJson());
  writeNotNull('TableId', instance.tableId);
  writeNotNull('TableName', instance.tableName);
  writeNotNull('TableSizeBytes', instance.tableSizeBytes);
  writeNotNull('TableStatus', instance.tableStatus);
  return val;
}

AwsDynamoDbTableGlobalSecondaryIndex
    _$AwsDynamoDbTableGlobalSecondaryIndexFromJson(Map<String, dynamic> json) {
  return AwsDynamoDbTableGlobalSecondaryIndex(
    backfilling: json['Backfilling'] as bool,
    indexArn: json['IndexArn'] as String,
    indexName: json['IndexName'] as String,
    indexSizeBytes: json['IndexSizeBytes'] as int,
    indexStatus: json['IndexStatus'] as String,
    itemCount: json['ItemCount'] as int,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : AwsDynamoDbTableKeySchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projection: json['Projection'] == null
        ? null
        : AwsDynamoDbTableProjection.fromJson(
            json['Projection'] as Map<String, dynamic>),
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : AwsDynamoDbTableProvisionedThroughput.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsDynamoDbTableGlobalSecondaryIndexToJson(
    AwsDynamoDbTableGlobalSecondaryIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Backfilling', instance.backfilling);
  writeNotNull('IndexArn', instance.indexArn);
  writeNotNull('IndexName', instance.indexName);
  writeNotNull('IndexSizeBytes', instance.indexSizeBytes);
  writeNotNull('IndexStatus', instance.indexStatus);
  writeNotNull('ItemCount', instance.itemCount);
  writeNotNull(
      'KeySchema', instance.keySchema?.map((e) => e?.toJson())?.toList());
  writeNotNull('Projection', instance.projection?.toJson());
  writeNotNull(
      'ProvisionedThroughput', instance.provisionedThroughput?.toJson());
  return val;
}

AwsDynamoDbTableKeySchema _$AwsDynamoDbTableKeySchemaFromJson(
    Map<String, dynamic> json) {
  return AwsDynamoDbTableKeySchema(
    attributeName: json['AttributeName'] as String,
    keyType: json['KeyType'] as String,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableKeySchemaToJson(
    AwsDynamoDbTableKeySchema instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('KeyType', instance.keyType);
  return val;
}

AwsDynamoDbTableLocalSecondaryIndex
    _$AwsDynamoDbTableLocalSecondaryIndexFromJson(Map<String, dynamic> json) {
  return AwsDynamoDbTableLocalSecondaryIndex(
    indexArn: json['IndexArn'] as String,
    indexName: json['IndexName'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : AwsDynamoDbTableKeySchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projection: json['Projection'] == null
        ? null
        : AwsDynamoDbTableProjection.fromJson(
            json['Projection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsDynamoDbTableLocalSecondaryIndexToJson(
    AwsDynamoDbTableLocalSecondaryIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexArn', instance.indexArn);
  writeNotNull('IndexName', instance.indexName);
  writeNotNull(
      'KeySchema', instance.keySchema?.map((e) => e?.toJson())?.toList());
  writeNotNull('Projection', instance.projection?.toJson());
  return val;
}

AwsDynamoDbTableProjection _$AwsDynamoDbTableProjectionFromJson(
    Map<String, dynamic> json) {
  return AwsDynamoDbTableProjection(
    nonKeyAttributes:
        (json['NonKeyAttributes'] as List)?.map((e) => e as String)?.toList(),
    projectionType: json['ProjectionType'] as String,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableProjectionToJson(
    AwsDynamoDbTableProjection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NonKeyAttributes', instance.nonKeyAttributes);
  writeNotNull('ProjectionType', instance.projectionType);
  return val;
}

AwsDynamoDbTableProvisionedThroughput
    _$AwsDynamoDbTableProvisionedThroughputFromJson(Map<String, dynamic> json) {
  return AwsDynamoDbTableProvisionedThroughput(
    lastDecreaseDateTime: json['LastDecreaseDateTime'] as String,
    lastIncreaseDateTime: json['LastIncreaseDateTime'] as String,
    numberOfDecreasesToday: json['NumberOfDecreasesToday'] as int,
    readCapacityUnits: json['ReadCapacityUnits'] as int,
    writeCapacityUnits: json['WriteCapacityUnits'] as int,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableProvisionedThroughputToJson(
    AwsDynamoDbTableProvisionedThroughput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LastDecreaseDateTime', instance.lastDecreaseDateTime);
  writeNotNull('LastIncreaseDateTime', instance.lastIncreaseDateTime);
  writeNotNull('NumberOfDecreasesToday', instance.numberOfDecreasesToday);
  writeNotNull('ReadCapacityUnits', instance.readCapacityUnits);
  writeNotNull('WriteCapacityUnits', instance.writeCapacityUnits);
  return val;
}

AwsDynamoDbTableProvisionedThroughputOverride
    _$AwsDynamoDbTableProvisionedThroughputOverrideFromJson(
        Map<String, dynamic> json) {
  return AwsDynamoDbTableProvisionedThroughputOverride(
    readCapacityUnits: json['ReadCapacityUnits'] as int,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableProvisionedThroughputOverrideToJson(
    AwsDynamoDbTableProvisionedThroughputOverride instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReadCapacityUnits', instance.readCapacityUnits);
  return val;
}

AwsDynamoDbTableReplica _$AwsDynamoDbTableReplicaFromJson(
    Map<String, dynamic> json) {
  return AwsDynamoDbTableReplica(
    globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : AwsDynamoDbTableReplicaGlobalSecondaryIndex.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    kmsMasterKeyId: json['KmsMasterKeyId'] as String,
    provisionedThroughputOverride: json['ProvisionedThroughputOverride'] == null
        ? null
        : AwsDynamoDbTableProvisionedThroughputOverride.fromJson(
            json['ProvisionedThroughputOverride'] as Map<String, dynamic>),
    regionName: json['RegionName'] as String,
    replicaStatus: json['ReplicaStatus'] as String,
    replicaStatusDescription: json['ReplicaStatusDescription'] as String,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableReplicaToJson(
    AwsDynamoDbTableReplica instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GlobalSecondaryIndexes',
      instance.globalSecondaryIndexes?.map((e) => e?.toJson())?.toList());
  writeNotNull('KmsMasterKeyId', instance.kmsMasterKeyId);
  writeNotNull('ProvisionedThroughputOverride',
      instance.provisionedThroughputOverride?.toJson());
  writeNotNull('RegionName', instance.regionName);
  writeNotNull('ReplicaStatus', instance.replicaStatus);
  writeNotNull('ReplicaStatusDescription', instance.replicaStatusDescription);
  return val;
}

AwsDynamoDbTableReplicaGlobalSecondaryIndex
    _$AwsDynamoDbTableReplicaGlobalSecondaryIndexFromJson(
        Map<String, dynamic> json) {
  return AwsDynamoDbTableReplicaGlobalSecondaryIndex(
    indexName: json['IndexName'] as String,
    provisionedThroughputOverride: json['ProvisionedThroughputOverride'] == null
        ? null
        : AwsDynamoDbTableProvisionedThroughputOverride.fromJson(
            json['ProvisionedThroughputOverride'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsDynamoDbTableReplicaGlobalSecondaryIndexToJson(
    AwsDynamoDbTableReplicaGlobalSecondaryIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull('ProvisionedThroughputOverride',
      instance.provisionedThroughputOverride?.toJson());
  return val;
}

AwsDynamoDbTableRestoreSummary _$AwsDynamoDbTableRestoreSummaryFromJson(
    Map<String, dynamic> json) {
  return AwsDynamoDbTableRestoreSummary(
    restoreDateTime: json['RestoreDateTime'] as String,
    restoreInProgress: json['RestoreInProgress'] as bool,
    sourceBackupArn: json['SourceBackupArn'] as String,
    sourceTableArn: json['SourceTableArn'] as String,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableRestoreSummaryToJson(
    AwsDynamoDbTableRestoreSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RestoreDateTime', instance.restoreDateTime);
  writeNotNull('RestoreInProgress', instance.restoreInProgress);
  writeNotNull('SourceBackupArn', instance.sourceBackupArn);
  writeNotNull('SourceTableArn', instance.sourceTableArn);
  return val;
}

AwsDynamoDbTableSseDescription _$AwsDynamoDbTableSseDescriptionFromJson(
    Map<String, dynamic> json) {
  return AwsDynamoDbTableSseDescription(
    inaccessibleEncryptionDateTime:
        json['InaccessibleEncryptionDateTime'] as String,
    kmsMasterKeyArn: json['KmsMasterKeyArn'] as String,
    sseType: json['SseType'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableSseDescriptionToJson(
    AwsDynamoDbTableSseDescription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InaccessibleEncryptionDateTime',
      instance.inaccessibleEncryptionDateTime);
  writeNotNull('KmsMasterKeyArn', instance.kmsMasterKeyArn);
  writeNotNull('SseType', instance.sseType);
  writeNotNull('Status', instance.status);
  return val;
}

AwsDynamoDbTableStreamSpecification
    _$AwsDynamoDbTableStreamSpecificationFromJson(Map<String, dynamic> json) {
  return AwsDynamoDbTableStreamSpecification(
    streamEnabled: json['StreamEnabled'] as bool,
    streamViewType: json['StreamViewType'] as String,
  );
}

Map<String, dynamic> _$AwsDynamoDbTableStreamSpecificationToJson(
    AwsDynamoDbTableStreamSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamEnabled', instance.streamEnabled);
  writeNotNull('StreamViewType', instance.streamViewType);
  return val;
}

AwsEc2EipDetails _$AwsEc2EipDetailsFromJson(Map<String, dynamic> json) {
  return AwsEc2EipDetails(
    allocationId: json['AllocationId'] as String,
    associationId: json['AssociationId'] as String,
    domain: json['Domain'] as String,
    instanceId: json['InstanceId'] as String,
    networkBorderGroup: json['NetworkBorderGroup'] as String,
    networkInterfaceId: json['NetworkInterfaceId'] as String,
    networkInterfaceOwnerId: json['NetworkInterfaceOwnerId'] as String,
    privateIpAddress: json['PrivateIpAddress'] as String,
    publicIp: json['PublicIp'] as String,
    publicIpv4Pool: json['PublicIpv4Pool'] as String,
  );
}

Map<String, dynamic> _$AwsEc2EipDetailsToJson(AwsEc2EipDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllocationId', instance.allocationId);
  writeNotNull('AssociationId', instance.associationId);
  writeNotNull('Domain', instance.domain);
  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('NetworkBorderGroup', instance.networkBorderGroup);
  writeNotNull('NetworkInterfaceId', instance.networkInterfaceId);
  writeNotNull('NetworkInterfaceOwnerId', instance.networkInterfaceOwnerId);
  writeNotNull('PrivateIpAddress', instance.privateIpAddress);
  writeNotNull('PublicIp', instance.publicIp);
  writeNotNull('PublicIpv4Pool', instance.publicIpv4Pool);
  return val;
}

AwsEc2InstanceDetails _$AwsEc2InstanceDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsEc2InstanceDetails(
    iamInstanceProfileArn: json['IamInstanceProfileArn'] as String,
    imageId: json['ImageId'] as String,
    ipV4Addresses:
        (json['IpV4Addresses'] as List)?.map((e) => e as String)?.toList(),
    ipV6Addresses:
        (json['IpV6Addresses'] as List)?.map((e) => e as String)?.toList(),
    keyName: json['KeyName'] as String,
    launchedAt: json['LaunchedAt'] as String,
    subnetId: json['SubnetId'] as String,
    type: json['Type'] as String,
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsEc2InstanceDetailsToJson(
    AwsEc2InstanceDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IamInstanceProfileArn', instance.iamInstanceProfileArn);
  writeNotNull('ImageId', instance.imageId);
  writeNotNull('IpV4Addresses', instance.ipV4Addresses);
  writeNotNull('IpV6Addresses', instance.ipV6Addresses);
  writeNotNull('KeyName', instance.keyName);
  writeNotNull('LaunchedAt', instance.launchedAt);
  writeNotNull('SubnetId', instance.subnetId);
  writeNotNull('Type', instance.type);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsEc2NetworkInterfaceAttachment _$AwsEc2NetworkInterfaceAttachmentFromJson(
    Map<String, dynamic> json) {
  return AwsEc2NetworkInterfaceAttachment(
    attachTime: json['AttachTime'] as String,
    attachmentId: json['AttachmentId'] as String,
    deleteOnTermination: json['DeleteOnTermination'] as bool,
    deviceIndex: json['DeviceIndex'] as int,
    instanceId: json['InstanceId'] as String,
    instanceOwnerId: json['InstanceOwnerId'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsEc2NetworkInterfaceAttachmentToJson(
    AwsEc2NetworkInterfaceAttachment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttachTime', instance.attachTime);
  writeNotNull('AttachmentId', instance.attachmentId);
  writeNotNull('DeleteOnTermination', instance.deleteOnTermination);
  writeNotNull('DeviceIndex', instance.deviceIndex);
  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('InstanceOwnerId', instance.instanceOwnerId);
  writeNotNull('Status', instance.status);
  return val;
}

AwsEc2NetworkInterfaceDetails _$AwsEc2NetworkInterfaceDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsEc2NetworkInterfaceDetails(
    attachment: json['Attachment'] == null
        ? null
        : AwsEc2NetworkInterfaceAttachment.fromJson(
            json['Attachment'] as Map<String, dynamic>),
    networkInterfaceId: json['NetworkInterfaceId'] as String,
    securityGroups: (json['SecurityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2NetworkInterfaceSecurityGroup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    sourceDestCheck: json['SourceDestCheck'] as bool,
  );
}

Map<String, dynamic> _$AwsEc2NetworkInterfaceDetailsToJson(
    AwsEc2NetworkInterfaceDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Attachment', instance.attachment?.toJson());
  writeNotNull('NetworkInterfaceId', instance.networkInterfaceId);
  writeNotNull('SecurityGroups',
      instance.securityGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('SourceDestCheck', instance.sourceDestCheck);
  return val;
}

AwsEc2NetworkInterfaceSecurityGroup
    _$AwsEc2NetworkInterfaceSecurityGroupFromJson(Map<String, dynamic> json) {
  return AwsEc2NetworkInterfaceSecurityGroup(
    groupId: json['GroupId'] as String,
    groupName: json['GroupName'] as String,
  );
}

Map<String, dynamic> _$AwsEc2NetworkInterfaceSecurityGroupToJson(
    AwsEc2NetworkInterfaceSecurityGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupId', instance.groupId);
  writeNotNull('GroupName', instance.groupName);
  return val;
}

AwsEc2SecurityGroupDetails _$AwsEc2SecurityGroupDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupDetails(
    groupId: json['GroupId'] as String,
    groupName: json['GroupName'] as String,
    ipPermissions: (json['IpPermissions'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupIpPermission.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    ipPermissionsEgress: (json['IpPermissionsEgress'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupIpPermission.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    ownerId: json['OwnerId'] as String,
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupDetailsToJson(
    AwsEc2SecurityGroupDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupId', instance.groupId);
  writeNotNull('GroupName', instance.groupName);
  writeNotNull('IpPermissions',
      instance.ipPermissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('IpPermissionsEgress',
      instance.ipPermissionsEgress?.map((e) => e?.toJson())?.toList());
  writeNotNull('OwnerId', instance.ownerId);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsEc2SecurityGroupIpPermission _$AwsEc2SecurityGroupIpPermissionFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupIpPermission(
    fromPort: json['FromPort'] as int,
    ipProtocol: json['IpProtocol'] as String,
    ipRanges: (json['IpRanges'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupIpRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ipv6Ranges: (json['Ipv6Ranges'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupIpv6Range.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    prefixListIds: (json['PrefixListIds'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupPrefixListId.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    toPort: json['ToPort'] as int,
    userIdGroupPairs: (json['UserIdGroupPairs'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupUserIdGroupPair.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupIpPermissionToJson(
    AwsEc2SecurityGroupIpPermission instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FromPort', instance.fromPort);
  writeNotNull('IpProtocol', instance.ipProtocol);
  writeNotNull(
      'IpRanges', instance.ipRanges?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Ipv6Ranges', instance.ipv6Ranges?.map((e) => e?.toJson())?.toList());
  writeNotNull('PrefixListIds',
      instance.prefixListIds?.map((e) => e?.toJson())?.toList());
  writeNotNull('ToPort', instance.toPort);
  writeNotNull('UserIdGroupPairs',
      instance.userIdGroupPairs?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsEc2SecurityGroupIpRange _$AwsEc2SecurityGroupIpRangeFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupIpRange(
    cidrIp: json['CidrIp'] as String,
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupIpRangeToJson(
    AwsEc2SecurityGroupIpRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CidrIp', instance.cidrIp);
  return val;
}

AwsEc2SecurityGroupIpv6Range _$AwsEc2SecurityGroupIpv6RangeFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupIpv6Range(
    cidrIpv6: json['CidrIpv6'] as String,
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupIpv6RangeToJson(
    AwsEc2SecurityGroupIpv6Range instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CidrIpv6', instance.cidrIpv6);
  return val;
}

AwsEc2SecurityGroupPrefixListId _$AwsEc2SecurityGroupPrefixListIdFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupPrefixListId(
    prefixListId: json['PrefixListId'] as String,
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupPrefixListIdToJson(
    AwsEc2SecurityGroupPrefixListId instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PrefixListId', instance.prefixListId);
  return val;
}

AwsEc2SecurityGroupUserIdGroupPair _$AwsEc2SecurityGroupUserIdGroupPairFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupUserIdGroupPair(
    groupId: json['GroupId'] as String,
    groupName: json['GroupName'] as String,
    peeringStatus: json['PeeringStatus'] as String,
    userId: json['UserId'] as String,
    vpcId: json['VpcId'] as String,
    vpcPeeringConnectionId: json['VpcPeeringConnectionId'] as String,
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupUserIdGroupPairToJson(
    AwsEc2SecurityGroupUserIdGroupPair instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupId', instance.groupId);
  writeNotNull('GroupName', instance.groupName);
  writeNotNull('PeeringStatus', instance.peeringStatus);
  writeNotNull('UserId', instance.userId);
  writeNotNull('VpcId', instance.vpcId);
  writeNotNull('VpcPeeringConnectionId', instance.vpcPeeringConnectionId);
  return val;
}

AwsEc2VolumeAttachment _$AwsEc2VolumeAttachmentFromJson(
    Map<String, dynamic> json) {
  return AwsEc2VolumeAttachment(
    attachTime: json['AttachTime'] as String,
    deleteOnTermination: json['DeleteOnTermination'] as bool,
    instanceId: json['InstanceId'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsEc2VolumeAttachmentToJson(
    AwsEc2VolumeAttachment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttachTime', instance.attachTime);
  writeNotNull('DeleteOnTermination', instance.deleteOnTermination);
  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('Status', instance.status);
  return val;
}

AwsEc2VolumeDetails _$AwsEc2VolumeDetailsFromJson(Map<String, dynamic> json) {
  return AwsEc2VolumeDetails(
    attachments: (json['Attachments'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2VolumeAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createTime: json['CreateTime'] as String,
    encrypted: json['Encrypted'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
    size: json['Size'] as int,
    snapshotId: json['SnapshotId'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsEc2VolumeDetailsToJson(AwsEc2VolumeDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Attachments', instance.attachments?.map((e) => e?.toJson())?.toList());
  writeNotNull('CreateTime', instance.createTime);
  writeNotNull('Encrypted', instance.encrypted);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('Size', instance.size);
  writeNotNull('SnapshotId', instance.snapshotId);
  writeNotNull('Status', instance.status);
  return val;
}

AwsEc2VpcDetails _$AwsEc2VpcDetailsFromJson(Map<String, dynamic> json) {
  return AwsEc2VpcDetails(
    cidrBlockAssociationSet: (json['CidrBlockAssociationSet'] as List)
        ?.map((e) => e == null
            ? null
            : CidrBlockAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dhcpOptionsId: json['DhcpOptionsId'] as String,
    ipv6CidrBlockAssociationSet: (json['Ipv6CidrBlockAssociationSet'] as List)
        ?.map((e) => e == null
            ? null
            : Ipv6CidrBlockAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    state: json['State'] as String,
  );
}

Map<String, dynamic> _$AwsEc2VpcDetailsToJson(AwsEc2VpcDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CidrBlockAssociationSet',
      instance.cidrBlockAssociationSet?.map((e) => e?.toJson())?.toList());
  writeNotNull('DhcpOptionsId', instance.dhcpOptionsId);
  writeNotNull('Ipv6CidrBlockAssociationSet',
      instance.ipv6CidrBlockAssociationSet?.map((e) => e?.toJson())?.toList());
  writeNotNull('State', instance.state);
  return val;
}

AwsElasticsearchDomainDetails _$AwsElasticsearchDomainDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsElasticsearchDomainDetails(
    accessPolicies: json['AccessPolicies'] as String,
    domainEndpointOptions: json['DomainEndpointOptions'] == null
        ? null
        : AwsElasticsearchDomainDomainEndpointOptions.fromJson(
            json['DomainEndpointOptions'] as Map<String, dynamic>),
    domainId: json['DomainId'] as String,
    domainName: json['DomainName'] as String,
    elasticsearchVersion: json['ElasticsearchVersion'] as String,
    encryptionAtRestOptions: json['EncryptionAtRestOptions'] == null
        ? null
        : AwsElasticsearchDomainEncryptionAtRestOptions.fromJson(
            json['EncryptionAtRestOptions'] as Map<String, dynamic>),
    endpoint: json['Endpoint'] as String,
    endpoints: (json['Endpoints'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    nodeToNodeEncryptionOptions: json['NodeToNodeEncryptionOptions'] == null
        ? null
        : AwsElasticsearchDomainNodeToNodeEncryptionOptions.fromJson(
            json['NodeToNodeEncryptionOptions'] as Map<String, dynamic>),
    vPCOptions: json['VPCOptions'] == null
        ? null
        : AwsElasticsearchDomainVPCOptions.fromJson(
            json['VPCOptions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsElasticsearchDomainDetailsToJson(
    AwsElasticsearchDomainDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessPolicies', instance.accessPolicies);
  writeNotNull(
      'DomainEndpointOptions', instance.domainEndpointOptions?.toJson());
  writeNotNull('DomainId', instance.domainId);
  writeNotNull('DomainName', instance.domainName);
  writeNotNull('ElasticsearchVersion', instance.elasticsearchVersion);
  writeNotNull(
      'EncryptionAtRestOptions', instance.encryptionAtRestOptions?.toJson());
  writeNotNull('Endpoint', instance.endpoint);
  writeNotNull('Endpoints', instance.endpoints);
  writeNotNull('NodeToNodeEncryptionOptions',
      instance.nodeToNodeEncryptionOptions?.toJson());
  writeNotNull('VPCOptions', instance.vPCOptions?.toJson());
  return val;
}

AwsElasticsearchDomainDomainEndpointOptions
    _$AwsElasticsearchDomainDomainEndpointOptionsFromJson(
        Map<String, dynamic> json) {
  return AwsElasticsearchDomainDomainEndpointOptions(
    enforceHTTPS: json['EnforceHTTPS'] as bool,
    tLSSecurityPolicy: json['TLSSecurityPolicy'] as String,
  );
}

Map<String, dynamic> _$AwsElasticsearchDomainDomainEndpointOptionsToJson(
    AwsElasticsearchDomainDomainEndpointOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnforceHTTPS', instance.enforceHTTPS);
  writeNotNull('TLSSecurityPolicy', instance.tLSSecurityPolicy);
  return val;
}

AwsElasticsearchDomainEncryptionAtRestOptions
    _$AwsElasticsearchDomainEncryptionAtRestOptionsFromJson(
        Map<String, dynamic> json) {
  return AwsElasticsearchDomainEncryptionAtRestOptions(
    enabled: json['Enabled'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$AwsElasticsearchDomainEncryptionAtRestOptionsToJson(
    AwsElasticsearchDomainEncryptionAtRestOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

AwsElasticsearchDomainNodeToNodeEncryptionOptions
    _$AwsElasticsearchDomainNodeToNodeEncryptionOptionsFromJson(
        Map<String, dynamic> json) {
  return AwsElasticsearchDomainNodeToNodeEncryptionOptions(
    enabled: json['Enabled'] as bool,
  );
}

Map<String, dynamic> _$AwsElasticsearchDomainNodeToNodeEncryptionOptionsToJson(
    AwsElasticsearchDomainNodeToNodeEncryptionOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

AwsElasticsearchDomainVPCOptions _$AwsElasticsearchDomainVPCOptionsFromJson(
    Map<String, dynamic> json) {
  return AwsElasticsearchDomainVPCOptions(
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vPCId: json['VPCId'] as String,
  );
}

Map<String, dynamic> _$AwsElasticsearchDomainVPCOptionsToJson(
    AwsElasticsearchDomainVPCOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityZones', instance.availabilityZones);
  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  writeNotNull('VPCId', instance.vPCId);
  return val;
}

AwsElbAppCookieStickinessPolicy _$AwsElbAppCookieStickinessPolicyFromJson(
    Map<String, dynamic> json) {
  return AwsElbAppCookieStickinessPolicy(
    cookieName: json['CookieName'] as String,
    policyName: json['PolicyName'] as String,
  );
}

Map<String, dynamic> _$AwsElbAppCookieStickinessPolicyToJson(
    AwsElbAppCookieStickinessPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CookieName', instance.cookieName);
  writeNotNull('PolicyName', instance.policyName);
  return val;
}

AwsElbLbCookieStickinessPolicy _$AwsElbLbCookieStickinessPolicyFromJson(
    Map<String, dynamic> json) {
  return AwsElbLbCookieStickinessPolicy(
    cookieExpirationPeriod: json['CookieExpirationPeriod'] as int,
    policyName: json['PolicyName'] as String,
  );
}

Map<String, dynamic> _$AwsElbLbCookieStickinessPolicyToJson(
    AwsElbLbCookieStickinessPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CookieExpirationPeriod', instance.cookieExpirationPeriod);
  writeNotNull('PolicyName', instance.policyName);
  return val;
}

AwsElbLoadBalancerAccessLog _$AwsElbLoadBalancerAccessLogFromJson(
    Map<String, dynamic> json) {
  return AwsElbLoadBalancerAccessLog(
    emitInterval: json['EmitInterval'] as int,
    enabled: json['Enabled'] as bool,
    s3BucketName: json['S3BucketName'] as String,
    s3BucketPrefix: json['S3BucketPrefix'] as String,
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerAccessLogToJson(
    AwsElbLoadBalancerAccessLog instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EmitInterval', instance.emitInterval);
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('S3BucketName', instance.s3BucketName);
  writeNotNull('S3BucketPrefix', instance.s3BucketPrefix);
  return val;
}

AwsElbLoadBalancerAttributes _$AwsElbLoadBalancerAttributesFromJson(
    Map<String, dynamic> json) {
  return AwsElbLoadBalancerAttributes(
    accessLog: json['AccessLog'] == null
        ? null
        : AwsElbLoadBalancerAccessLog.fromJson(
            json['AccessLog'] as Map<String, dynamic>),
    connectionDraining: json['ConnectionDraining'] == null
        ? null
        : AwsElbLoadBalancerConnectionDraining.fromJson(
            json['ConnectionDraining'] as Map<String, dynamic>),
    connectionSettings: json['ConnectionSettings'] == null
        ? null
        : AwsElbLoadBalancerConnectionSettings.fromJson(
            json['ConnectionSettings'] as Map<String, dynamic>),
    crossZoneLoadBalancing: json['CrossZoneLoadBalancing'] == null
        ? null
        : AwsElbLoadBalancerCrossZoneLoadBalancing.fromJson(
            json['CrossZoneLoadBalancing'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerAttributesToJson(
    AwsElbLoadBalancerAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessLog', instance.accessLog?.toJson());
  writeNotNull('ConnectionDraining', instance.connectionDraining?.toJson());
  writeNotNull('ConnectionSettings', instance.connectionSettings?.toJson());
  writeNotNull(
      'CrossZoneLoadBalancing', instance.crossZoneLoadBalancing?.toJson());
  return val;
}

AwsElbLoadBalancerBackendServerDescription
    _$AwsElbLoadBalancerBackendServerDescriptionFromJson(
        Map<String, dynamic> json) {
  return AwsElbLoadBalancerBackendServerDescription(
    instancePort: json['InstancePort'] as int,
    policyNames:
        (json['PolicyNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerBackendServerDescriptionToJson(
    AwsElbLoadBalancerBackendServerDescription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstancePort', instance.instancePort);
  writeNotNull('PolicyNames', instance.policyNames);
  return val;
}

AwsElbLoadBalancerConnectionDraining
    _$AwsElbLoadBalancerConnectionDrainingFromJson(Map<String, dynamic> json) {
  return AwsElbLoadBalancerConnectionDraining(
    enabled: json['Enabled'] as bool,
    timeout: json['Timeout'] as int,
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerConnectionDrainingToJson(
    AwsElbLoadBalancerConnectionDraining instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('Timeout', instance.timeout);
  return val;
}

AwsElbLoadBalancerConnectionSettings
    _$AwsElbLoadBalancerConnectionSettingsFromJson(Map<String, dynamic> json) {
  return AwsElbLoadBalancerConnectionSettings(
    idleTimeout: json['IdleTimeout'] as int,
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerConnectionSettingsToJson(
    AwsElbLoadBalancerConnectionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdleTimeout', instance.idleTimeout);
  return val;
}

AwsElbLoadBalancerCrossZoneLoadBalancing
    _$AwsElbLoadBalancerCrossZoneLoadBalancingFromJson(
        Map<String, dynamic> json) {
  return AwsElbLoadBalancerCrossZoneLoadBalancing(
    enabled: json['Enabled'] as bool,
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerCrossZoneLoadBalancingToJson(
    AwsElbLoadBalancerCrossZoneLoadBalancing instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

AwsElbLoadBalancerDetails _$AwsElbLoadBalancerDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsElbLoadBalancerDetails(
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    backendServerDescriptions: (json['BackendServerDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : AwsElbLoadBalancerBackendServerDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    canonicalHostedZoneName: json['CanonicalHostedZoneName'] as String,
    canonicalHostedZoneNameID: json['CanonicalHostedZoneNameID'] as String,
    createdTime: json['CreatedTime'] as String,
    dnsName: json['DnsName'] as String,
    healthCheck: json['HealthCheck'] == null
        ? null
        : AwsElbLoadBalancerHealthCheck.fromJson(
            json['HealthCheck'] as Map<String, dynamic>),
    instances: (json['Instances'] as List)
        ?.map((e) => e == null
            ? null
            : AwsElbLoadBalancerInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    listenerDescriptions: (json['ListenerDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : AwsElbLoadBalancerListenerDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    loadBalancerAttributes: json['LoadBalancerAttributes'] == null
        ? null
        : AwsElbLoadBalancerAttributes.fromJson(
            json['LoadBalancerAttributes'] as Map<String, dynamic>),
    loadBalancerName: json['LoadBalancerName'] as String,
    policies: json['Policies'] == null
        ? null
        : AwsElbLoadBalancerPolicies.fromJson(
            json['Policies'] as Map<String, dynamic>),
    scheme: json['Scheme'] as String,
    securityGroups:
        (json['SecurityGroups'] as List)?.map((e) => e as String)?.toList(),
    sourceSecurityGroup: json['SourceSecurityGroup'] == null
        ? null
        : AwsElbLoadBalancerSourceSecurityGroup.fromJson(
            json['SourceSecurityGroup'] as Map<String, dynamic>),
    subnets: (json['Subnets'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerDetailsToJson(
    AwsElbLoadBalancerDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityZones', instance.availabilityZones);
  writeNotNull('BackendServerDescriptions',
      instance.backendServerDescriptions?.map((e) => e?.toJson())?.toList());
  writeNotNull('CanonicalHostedZoneName', instance.canonicalHostedZoneName);
  writeNotNull('CanonicalHostedZoneNameID', instance.canonicalHostedZoneNameID);
  writeNotNull('CreatedTime', instance.createdTime);
  writeNotNull('DnsName', instance.dnsName);
  writeNotNull('HealthCheck', instance.healthCheck?.toJson());
  writeNotNull(
      'Instances', instance.instances?.map((e) => e?.toJson())?.toList());
  writeNotNull('ListenerDescriptions',
      instance.listenerDescriptions?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'LoadBalancerAttributes', instance.loadBalancerAttributes?.toJson());
  writeNotNull('LoadBalancerName', instance.loadBalancerName);
  writeNotNull('Policies', instance.policies?.toJson());
  writeNotNull('Scheme', instance.scheme);
  writeNotNull('SecurityGroups', instance.securityGroups);
  writeNotNull('SourceSecurityGroup', instance.sourceSecurityGroup?.toJson());
  writeNotNull('Subnets', instance.subnets);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsElbLoadBalancerHealthCheck _$AwsElbLoadBalancerHealthCheckFromJson(
    Map<String, dynamic> json) {
  return AwsElbLoadBalancerHealthCheck(
    healthyThreshold: json['HealthyThreshold'] as int,
    interval: json['Interval'] as int,
    target: json['Target'] as String,
    timeout: json['Timeout'] as int,
    unhealthyThreshold: json['UnhealthyThreshold'] as int,
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerHealthCheckToJson(
    AwsElbLoadBalancerHealthCheck instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HealthyThreshold', instance.healthyThreshold);
  writeNotNull('Interval', instance.interval);
  writeNotNull('Target', instance.target);
  writeNotNull('Timeout', instance.timeout);
  writeNotNull('UnhealthyThreshold', instance.unhealthyThreshold);
  return val;
}

AwsElbLoadBalancerInstance _$AwsElbLoadBalancerInstanceFromJson(
    Map<String, dynamic> json) {
  return AwsElbLoadBalancerInstance(
    instanceId: json['InstanceId'] as String,
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerInstanceToJson(
    AwsElbLoadBalancerInstance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceId', instance.instanceId);
  return val;
}

AwsElbLoadBalancerListener _$AwsElbLoadBalancerListenerFromJson(
    Map<String, dynamic> json) {
  return AwsElbLoadBalancerListener(
    instancePort: json['InstancePort'] as int,
    instanceProtocol: json['InstanceProtocol'] as String,
    loadBalancerPort: json['LoadBalancerPort'] as int,
    protocol: json['Protocol'] as String,
    sslCertificateId: json['SslCertificateId'] as String,
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerListenerToJson(
    AwsElbLoadBalancerListener instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstancePort', instance.instancePort);
  writeNotNull('InstanceProtocol', instance.instanceProtocol);
  writeNotNull('LoadBalancerPort', instance.loadBalancerPort);
  writeNotNull('Protocol', instance.protocol);
  writeNotNull('SslCertificateId', instance.sslCertificateId);
  return val;
}

AwsElbLoadBalancerListenerDescription
    _$AwsElbLoadBalancerListenerDescriptionFromJson(Map<String, dynamic> json) {
  return AwsElbLoadBalancerListenerDescription(
    listener: json['Listener'] == null
        ? null
        : AwsElbLoadBalancerListener.fromJson(
            json['Listener'] as Map<String, dynamic>),
    policyNames:
        (json['PolicyNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerListenerDescriptionToJson(
    AwsElbLoadBalancerListenerDescription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Listener', instance.listener?.toJson());
  writeNotNull('PolicyNames', instance.policyNames);
  return val;
}

AwsElbLoadBalancerPolicies _$AwsElbLoadBalancerPoliciesFromJson(
    Map<String, dynamic> json) {
  return AwsElbLoadBalancerPolicies(
    appCookieStickinessPolicies: (json['AppCookieStickinessPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : AwsElbAppCookieStickinessPolicy.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    lbCookieStickinessPolicies: (json['LbCookieStickinessPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : AwsElbLbCookieStickinessPolicy.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    otherPolicies:
        (json['OtherPolicies'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerPoliciesToJson(
    AwsElbLoadBalancerPolicies instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppCookieStickinessPolicies',
      instance.appCookieStickinessPolicies?.map((e) => e?.toJson())?.toList());
  writeNotNull('LbCookieStickinessPolicies',
      instance.lbCookieStickinessPolicies?.map((e) => e?.toJson())?.toList());
  writeNotNull('OtherPolicies', instance.otherPolicies);
  return val;
}

AwsElbLoadBalancerSourceSecurityGroup
    _$AwsElbLoadBalancerSourceSecurityGroupFromJson(Map<String, dynamic> json) {
  return AwsElbLoadBalancerSourceSecurityGroup(
    groupName: json['GroupName'] as String,
    ownerAlias: json['OwnerAlias'] as String,
  );
}

Map<String, dynamic> _$AwsElbLoadBalancerSourceSecurityGroupToJson(
    AwsElbLoadBalancerSourceSecurityGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupName', instance.groupName);
  writeNotNull('OwnerAlias', instance.ownerAlias);
  return val;
}

AwsElbv2LoadBalancerDetails _$AwsElbv2LoadBalancerDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsElbv2LoadBalancerDetails(
    availabilityZones: (json['AvailabilityZones'] as List)
        ?.map((e) => e == null
            ? null
            : AvailabilityZone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    canonicalHostedZoneId: json['CanonicalHostedZoneId'] as String,
    createdTime: json['CreatedTime'] as String,
    dNSName: json['DNSName'] as String,
    ipAddressType: json['IpAddressType'] as String,
    scheme: json['Scheme'] as String,
    securityGroups:
        (json['SecurityGroups'] as List)?.map((e) => e as String)?.toList(),
    state: json['State'] == null
        ? null
        : LoadBalancerState.fromJson(json['State'] as Map<String, dynamic>),
    type: json['Type'] as String,
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsElbv2LoadBalancerDetailsToJson(
    AwsElbv2LoadBalancerDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityZones',
      instance.availabilityZones?.map((e) => e?.toJson())?.toList());
  writeNotNull('CanonicalHostedZoneId', instance.canonicalHostedZoneId);
  writeNotNull('CreatedTime', instance.createdTime);
  writeNotNull('DNSName', instance.dNSName);
  writeNotNull('IpAddressType', instance.ipAddressType);
  writeNotNull('Scheme', instance.scheme);
  writeNotNull('SecurityGroups', instance.securityGroups);
  writeNotNull('State', instance.state?.toJson());
  writeNotNull('Type', instance.type);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsIamAccessKeyDetails _$AwsIamAccessKeyDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsIamAccessKeyDetails(
    accessKeyId: json['AccessKeyId'] as String,
    accountId: json['AccountId'] as String,
    createdAt: json['CreatedAt'] as String,
    principalId: json['PrincipalId'] as String,
    principalName: json['PrincipalName'] as String,
    principalType: json['PrincipalType'] as String,
    sessionContext: json['SessionContext'] == null
        ? null
        : AwsIamAccessKeySessionContext.fromJson(
            json['SessionContext'] as Map<String, dynamic>),
    status:
        _$enumDecodeNullable(_$AwsIamAccessKeyStatusEnumMap, json['Status']),
    userName: json['UserName'] as String,
  );
}

Map<String, dynamic> _$AwsIamAccessKeyDetailsToJson(
    AwsIamAccessKeyDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessKeyId', instance.accessKeyId);
  writeNotNull('AccountId', instance.accountId);
  writeNotNull('CreatedAt', instance.createdAt);
  writeNotNull('PrincipalId', instance.principalId);
  writeNotNull('PrincipalName', instance.principalName);
  writeNotNull('PrincipalType', instance.principalType);
  writeNotNull('SessionContext', instance.sessionContext?.toJson());
  writeNotNull('Status', _$AwsIamAccessKeyStatusEnumMap[instance.status]);
  writeNotNull('UserName', instance.userName);
  return val;
}

const _$AwsIamAccessKeyStatusEnumMap = {
  AwsIamAccessKeyStatus.active: 'Active',
  AwsIamAccessKeyStatus.inactive: 'Inactive',
};

AwsIamAccessKeySessionContext _$AwsIamAccessKeySessionContextFromJson(
    Map<String, dynamic> json) {
  return AwsIamAccessKeySessionContext(
    attributes: json['Attributes'] == null
        ? null
        : AwsIamAccessKeySessionContextAttributes.fromJson(
            json['Attributes'] as Map<String, dynamic>),
    sessionIssuer: json['SessionIssuer'] == null
        ? null
        : AwsIamAccessKeySessionContextSessionIssuer.fromJson(
            json['SessionIssuer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsIamAccessKeySessionContextToJson(
    AwsIamAccessKeySessionContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Attributes', instance.attributes?.toJson());
  writeNotNull('SessionIssuer', instance.sessionIssuer?.toJson());
  return val;
}

AwsIamAccessKeySessionContextAttributes
    _$AwsIamAccessKeySessionContextAttributesFromJson(
        Map<String, dynamic> json) {
  return AwsIamAccessKeySessionContextAttributes(
    creationDate: json['CreationDate'] as String,
    mfaAuthenticated: json['MfaAuthenticated'] as bool,
  );
}

Map<String, dynamic> _$AwsIamAccessKeySessionContextAttributesToJson(
    AwsIamAccessKeySessionContextAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreationDate', instance.creationDate);
  writeNotNull('MfaAuthenticated', instance.mfaAuthenticated);
  return val;
}

AwsIamAccessKeySessionContextSessionIssuer
    _$AwsIamAccessKeySessionContextSessionIssuerFromJson(
        Map<String, dynamic> json) {
  return AwsIamAccessKeySessionContextSessionIssuer(
    accountId: json['AccountId'] as String,
    arn: json['Arn'] as String,
    principalId: json['PrincipalId'] as String,
    type: json['Type'] as String,
    userName: json['UserName'] as String,
  );
}

Map<String, dynamic> _$AwsIamAccessKeySessionContextSessionIssuerToJson(
    AwsIamAccessKeySessionContextSessionIssuer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('Arn', instance.arn);
  writeNotNull('PrincipalId', instance.principalId);
  writeNotNull('Type', instance.type);
  writeNotNull('UserName', instance.userName);
  return val;
}

AwsIamAttachedManagedPolicy _$AwsIamAttachedManagedPolicyFromJson(
    Map<String, dynamic> json) {
  return AwsIamAttachedManagedPolicy(
    policyArn: json['PolicyArn'] as String,
    policyName: json['PolicyName'] as String,
  );
}

Map<String, dynamic> _$AwsIamAttachedManagedPolicyToJson(
    AwsIamAttachedManagedPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyArn', instance.policyArn);
  writeNotNull('PolicyName', instance.policyName);
  return val;
}

AwsIamGroupDetails _$AwsIamGroupDetailsFromJson(Map<String, dynamic> json) {
  return AwsIamGroupDetails(
    attachedManagedPolicies: (json['AttachedManagedPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : AwsIamAttachedManagedPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createDate: json['CreateDate'] as String,
    groupId: json['GroupId'] as String,
    groupName: json['GroupName'] as String,
    groupPolicyList: (json['GroupPolicyList'] as List)
        ?.map((e) => e == null
            ? null
            : AwsIamGroupPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    path: json['Path'] as String,
  );
}

Map<String, dynamic> _$AwsIamGroupDetailsToJson(AwsIamGroupDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttachedManagedPolicies',
      instance.attachedManagedPolicies?.map((e) => e?.toJson())?.toList());
  writeNotNull('CreateDate', instance.createDate);
  writeNotNull('GroupId', instance.groupId);
  writeNotNull('GroupName', instance.groupName);
  writeNotNull('GroupPolicyList',
      instance.groupPolicyList?.map((e) => e?.toJson())?.toList());
  writeNotNull('Path', instance.path);
  return val;
}

AwsIamGroupPolicy _$AwsIamGroupPolicyFromJson(Map<String, dynamic> json) {
  return AwsIamGroupPolicy(
    policyName: json['PolicyName'] as String,
  );
}

Map<String, dynamic> _$AwsIamGroupPolicyToJson(AwsIamGroupPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyName', instance.policyName);
  return val;
}

AwsIamInstanceProfile _$AwsIamInstanceProfileFromJson(
    Map<String, dynamic> json) {
  return AwsIamInstanceProfile(
    arn: json['Arn'] as String,
    createDate: json['CreateDate'] as String,
    instanceProfileId: json['InstanceProfileId'] as String,
    instanceProfileName: json['InstanceProfileName'] as String,
    path: json['Path'] as String,
    roles: (json['Roles'] as List)
        ?.map((e) => e == null
            ? null
            : AwsIamInstanceProfileRole.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsIamInstanceProfileToJson(
    AwsIamInstanceProfile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('CreateDate', instance.createDate);
  writeNotNull('InstanceProfileId', instance.instanceProfileId);
  writeNotNull('InstanceProfileName', instance.instanceProfileName);
  writeNotNull('Path', instance.path);
  writeNotNull('Roles', instance.roles?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsIamInstanceProfileRole _$AwsIamInstanceProfileRoleFromJson(
    Map<String, dynamic> json) {
  return AwsIamInstanceProfileRole(
    arn: json['Arn'] as String,
    assumeRolePolicyDocument: json['AssumeRolePolicyDocument'] as String,
    createDate: json['CreateDate'] as String,
    path: json['Path'] as String,
    roleId: json['RoleId'] as String,
    roleName: json['RoleName'] as String,
  );
}

Map<String, dynamic> _$AwsIamInstanceProfileRoleToJson(
    AwsIamInstanceProfileRole instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('AssumeRolePolicyDocument', instance.assumeRolePolicyDocument);
  writeNotNull('CreateDate', instance.createDate);
  writeNotNull('Path', instance.path);
  writeNotNull('RoleId', instance.roleId);
  writeNotNull('RoleName', instance.roleName);
  return val;
}

AwsIamPermissionsBoundary _$AwsIamPermissionsBoundaryFromJson(
    Map<String, dynamic> json) {
  return AwsIamPermissionsBoundary(
    permissionsBoundaryArn: json['PermissionsBoundaryArn'] as String,
    permissionsBoundaryType: json['PermissionsBoundaryType'] as String,
  );
}

Map<String, dynamic> _$AwsIamPermissionsBoundaryToJson(
    AwsIamPermissionsBoundary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PermissionsBoundaryArn', instance.permissionsBoundaryArn);
  writeNotNull('PermissionsBoundaryType', instance.permissionsBoundaryType);
  return val;
}

AwsIamPolicyDetails _$AwsIamPolicyDetailsFromJson(Map<String, dynamic> json) {
  return AwsIamPolicyDetails(
    attachmentCount: json['AttachmentCount'] as int,
    createDate: json['CreateDate'] as String,
    defaultVersionId: json['DefaultVersionId'] as String,
    description: json['Description'] as String,
    isAttachable: json['IsAttachable'] as bool,
    path: json['Path'] as String,
    permissionsBoundaryUsageCount: json['PermissionsBoundaryUsageCount'] as int,
    policyId: json['PolicyId'] as String,
    policyName: json['PolicyName'] as String,
    policyVersionList: (json['PolicyVersionList'] as List)
        ?.map((e) => e == null
            ? null
            : AwsIamPolicyVersion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    updateDate: json['UpdateDate'] as String,
  );
}

Map<String, dynamic> _$AwsIamPolicyDetailsToJson(AwsIamPolicyDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttachmentCount', instance.attachmentCount);
  writeNotNull('CreateDate', instance.createDate);
  writeNotNull('DefaultVersionId', instance.defaultVersionId);
  writeNotNull('Description', instance.description);
  writeNotNull('IsAttachable', instance.isAttachable);
  writeNotNull('Path', instance.path);
  writeNotNull(
      'PermissionsBoundaryUsageCount', instance.permissionsBoundaryUsageCount);
  writeNotNull('PolicyId', instance.policyId);
  writeNotNull('PolicyName', instance.policyName);
  writeNotNull('PolicyVersionList',
      instance.policyVersionList?.map((e) => e?.toJson())?.toList());
  writeNotNull('UpdateDate', instance.updateDate);
  return val;
}

AwsIamPolicyVersion _$AwsIamPolicyVersionFromJson(Map<String, dynamic> json) {
  return AwsIamPolicyVersion(
    createDate: json['CreateDate'] as String,
    isDefaultVersion: json['IsDefaultVersion'] as bool,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$AwsIamPolicyVersionToJson(AwsIamPolicyVersion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreateDate', instance.createDate);
  writeNotNull('IsDefaultVersion', instance.isDefaultVersion);
  writeNotNull('VersionId', instance.versionId);
  return val;
}

AwsIamRoleDetails _$AwsIamRoleDetailsFromJson(Map<String, dynamic> json) {
  return AwsIamRoleDetails(
    assumeRolePolicyDocument: json['AssumeRolePolicyDocument'] as String,
    attachedManagedPolicies: (json['AttachedManagedPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : AwsIamAttachedManagedPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createDate: json['CreateDate'] as String,
    instanceProfileList: (json['InstanceProfileList'] as List)
        ?.map((e) => e == null
            ? null
            : AwsIamInstanceProfile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    maxSessionDuration: json['MaxSessionDuration'] as int,
    path: json['Path'] as String,
    permissionsBoundary: json['PermissionsBoundary'] == null
        ? null
        : AwsIamPermissionsBoundary.fromJson(
            json['PermissionsBoundary'] as Map<String, dynamic>),
    roleId: json['RoleId'] as String,
    roleName: json['RoleName'] as String,
    rolePolicyList: (json['RolePolicyList'] as List)
        ?.map((e) => e == null
            ? null
            : AwsIamRolePolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsIamRoleDetailsToJson(AwsIamRoleDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssumeRolePolicyDocument', instance.assumeRolePolicyDocument);
  writeNotNull('AttachedManagedPolicies',
      instance.attachedManagedPolicies?.map((e) => e?.toJson())?.toList());
  writeNotNull('CreateDate', instance.createDate);
  writeNotNull('InstanceProfileList',
      instance.instanceProfileList?.map((e) => e?.toJson())?.toList());
  writeNotNull('MaxSessionDuration', instance.maxSessionDuration);
  writeNotNull('Path', instance.path);
  writeNotNull('PermissionsBoundary', instance.permissionsBoundary?.toJson());
  writeNotNull('RoleId', instance.roleId);
  writeNotNull('RoleName', instance.roleName);
  writeNotNull('RolePolicyList',
      instance.rolePolicyList?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsIamRolePolicy _$AwsIamRolePolicyFromJson(Map<String, dynamic> json) {
  return AwsIamRolePolicy(
    policyName: json['PolicyName'] as String,
  );
}

Map<String, dynamic> _$AwsIamRolePolicyToJson(AwsIamRolePolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyName', instance.policyName);
  return val;
}

AwsIamUserDetails _$AwsIamUserDetailsFromJson(Map<String, dynamic> json) {
  return AwsIamUserDetails(
    attachedManagedPolicies: (json['AttachedManagedPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : AwsIamAttachedManagedPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createDate: json['CreateDate'] as String,
    groupList: (json['GroupList'] as List)?.map((e) => e as String)?.toList(),
    path: json['Path'] as String,
    permissionsBoundary: json['PermissionsBoundary'] == null
        ? null
        : AwsIamPermissionsBoundary.fromJson(
            json['PermissionsBoundary'] as Map<String, dynamic>),
    userId: json['UserId'] as String,
    userName: json['UserName'] as String,
    userPolicyList: (json['UserPolicyList'] as List)
        ?.map((e) => e == null
            ? null
            : AwsIamUserPolicy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsIamUserDetailsToJson(AwsIamUserDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttachedManagedPolicies',
      instance.attachedManagedPolicies?.map((e) => e?.toJson())?.toList());
  writeNotNull('CreateDate', instance.createDate);
  writeNotNull('GroupList', instance.groupList);
  writeNotNull('Path', instance.path);
  writeNotNull('PermissionsBoundary', instance.permissionsBoundary?.toJson());
  writeNotNull('UserId', instance.userId);
  writeNotNull('UserName', instance.userName);
  writeNotNull('UserPolicyList',
      instance.userPolicyList?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsIamUserPolicy _$AwsIamUserPolicyFromJson(Map<String, dynamic> json) {
  return AwsIamUserPolicy(
    policyName: json['PolicyName'] as String,
  );
}

Map<String, dynamic> _$AwsIamUserPolicyToJson(AwsIamUserPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyName', instance.policyName);
  return val;
}

AwsKmsKeyDetails _$AwsKmsKeyDetailsFromJson(Map<String, dynamic> json) {
  return AwsKmsKeyDetails(
    awsAccountId: json['AWSAccountId'] as String,
    creationDate: (json['CreationDate'] as num)?.toDouble(),
    description: json['Description'] as String,
    keyId: json['KeyId'] as String,
    keyManager: json['KeyManager'] as String,
    keyState: json['KeyState'] as String,
    origin: json['Origin'] as String,
  );
}

Map<String, dynamic> _$AwsKmsKeyDetailsToJson(AwsKmsKeyDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AWSAccountId', instance.awsAccountId);
  writeNotNull('CreationDate', instance.creationDate);
  writeNotNull('Description', instance.description);
  writeNotNull('KeyId', instance.keyId);
  writeNotNull('KeyManager', instance.keyManager);
  writeNotNull('KeyState', instance.keyState);
  writeNotNull('Origin', instance.origin);
  return val;
}

AwsLambdaFunctionCode _$AwsLambdaFunctionCodeFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionCode(
    s3Bucket: json['S3Bucket'] as String,
    s3Key: json['S3Key'] as String,
    s3ObjectVersion: json['S3ObjectVersion'] as String,
    zipFile: json['ZipFile'] as String,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionCodeToJson(
    AwsLambdaFunctionCode instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Bucket', instance.s3Bucket);
  writeNotNull('S3Key', instance.s3Key);
  writeNotNull('S3ObjectVersion', instance.s3ObjectVersion);
  writeNotNull('ZipFile', instance.zipFile);
  return val;
}

AwsLambdaFunctionDeadLetterConfig _$AwsLambdaFunctionDeadLetterConfigFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionDeadLetterConfig(
    targetArn: json['TargetArn'] as String,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionDeadLetterConfigToJson(
    AwsLambdaFunctionDeadLetterConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetArn', instance.targetArn);
  return val;
}

AwsLambdaFunctionDetails _$AwsLambdaFunctionDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionDetails(
    code: json['Code'] == null
        ? null
        : AwsLambdaFunctionCode.fromJson(json['Code'] as Map<String, dynamic>),
    codeSha256: json['CodeSha256'] as String,
    deadLetterConfig: json['DeadLetterConfig'] == null
        ? null
        : AwsLambdaFunctionDeadLetterConfig.fromJson(
            json['DeadLetterConfig'] as Map<String, dynamic>),
    environment: json['Environment'] == null
        ? null
        : AwsLambdaFunctionEnvironment.fromJson(
            json['Environment'] as Map<String, dynamic>),
    functionName: json['FunctionName'] as String,
    handler: json['Handler'] as String,
    kmsKeyArn: json['KmsKeyArn'] as String,
    lastModified: json['LastModified'] as String,
    layers: (json['Layers'] as List)
        ?.map((e) => e == null
            ? null
            : AwsLambdaFunctionLayer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    masterArn: json['MasterArn'] as String,
    memorySize: json['MemorySize'] as int,
    revisionId: json['RevisionId'] as String,
    role: json['Role'] as String,
    runtime: json['Runtime'] as String,
    timeout: json['Timeout'] as int,
    tracingConfig: json['TracingConfig'] == null
        ? null
        : AwsLambdaFunctionTracingConfig.fromJson(
            json['TracingConfig'] as Map<String, dynamic>),
    version: json['Version'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : AwsLambdaFunctionVpcConfig.fromJson(
            json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsLambdaFunctionDetailsToJson(
    AwsLambdaFunctionDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Code', instance.code?.toJson());
  writeNotNull('CodeSha256', instance.codeSha256);
  writeNotNull('DeadLetterConfig', instance.deadLetterConfig?.toJson());
  writeNotNull('Environment', instance.environment?.toJson());
  writeNotNull('FunctionName', instance.functionName);
  writeNotNull('Handler', instance.handler);
  writeNotNull('KmsKeyArn', instance.kmsKeyArn);
  writeNotNull('LastModified', instance.lastModified);
  writeNotNull('Layers', instance.layers?.map((e) => e?.toJson())?.toList());
  writeNotNull('MasterArn', instance.masterArn);
  writeNotNull('MemorySize', instance.memorySize);
  writeNotNull('RevisionId', instance.revisionId);
  writeNotNull('Role', instance.role);
  writeNotNull('Runtime', instance.runtime);
  writeNotNull('Timeout', instance.timeout);
  writeNotNull('TracingConfig', instance.tracingConfig?.toJson());
  writeNotNull('Version', instance.version);
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

AwsLambdaFunctionEnvironment _$AwsLambdaFunctionEnvironmentFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionEnvironment(
    error: json['Error'] == null
        ? null
        : AwsLambdaFunctionEnvironmentError.fromJson(
            json['Error'] as Map<String, dynamic>),
    variables: (json['Variables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$AwsLambdaFunctionEnvironmentToJson(
    AwsLambdaFunctionEnvironment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Error', instance.error?.toJson());
  writeNotNull('Variables', instance.variables);
  return val;
}

AwsLambdaFunctionEnvironmentError _$AwsLambdaFunctionEnvironmentErrorFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionEnvironmentError(
    errorCode: json['ErrorCode'] as String,
    message: json['Message'] as String,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionEnvironmentErrorToJson(
    AwsLambdaFunctionEnvironmentError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ErrorCode', instance.errorCode);
  writeNotNull('Message', instance.message);
  return val;
}

AwsLambdaFunctionLayer _$AwsLambdaFunctionLayerFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionLayer(
    arn: json['Arn'] as String,
    codeSize: json['CodeSize'] as int,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionLayerToJson(
    AwsLambdaFunctionLayer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('CodeSize', instance.codeSize);
  return val;
}

AwsLambdaFunctionTracingConfig _$AwsLambdaFunctionTracingConfigFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionTracingConfig(
    mode: json['Mode'] as String,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionTracingConfigToJson(
    AwsLambdaFunctionTracingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Mode', instance.mode);
  return val;
}

AwsLambdaFunctionVpcConfig _$AwsLambdaFunctionVpcConfigFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionVpcConfig(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionVpcConfigToJson(
    AwsLambdaFunctionVpcConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsLambdaLayerVersionDetails _$AwsLambdaLayerVersionDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaLayerVersionDetails(
    compatibleRuntimes:
        (json['CompatibleRuntimes'] as List)?.map((e) => e as String)?.toList(),
    createdDate: json['CreatedDate'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$AwsLambdaLayerVersionDetailsToJson(
    AwsLambdaLayerVersionDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CompatibleRuntimes', instance.compatibleRuntimes);
  writeNotNull('CreatedDate', instance.createdDate);
  writeNotNull('Version', instance.version);
  return val;
}

AwsRdsDbClusterAssociatedRole _$AwsRdsDbClusterAssociatedRoleFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbClusterAssociatedRole(
    roleArn: json['RoleArn'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbClusterAssociatedRoleToJson(
    AwsRdsDbClusterAssociatedRole instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('Status', instance.status);
  return val;
}

AwsRdsDbClusterDetails _$AwsRdsDbClusterDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbClusterDetails(
    activityStreamStatus: json['ActivityStreamStatus'] as String,
    allocatedStorage: json['AllocatedStorage'] as int,
    associatedRoles: (json['AssociatedRoles'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbClusterAssociatedRole.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    backupRetentionPeriod: json['BackupRetentionPeriod'] as int,
    clusterCreateTime: json['ClusterCreateTime'] as String,
    copyTagsToSnapshot: json['CopyTagsToSnapshot'] as bool,
    crossAccountClone: json['CrossAccountClone'] as bool,
    customEndpoints:
        (json['CustomEndpoints'] as List)?.map((e) => e as String)?.toList(),
    databaseName: json['DatabaseName'] as String,
    dbClusterIdentifier: json['DbClusterIdentifier'] as String,
    dbClusterMembers: (json['DbClusterMembers'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbClusterMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dbClusterOptionGroupMemberships:
        (json['DbClusterOptionGroupMemberships'] as List)
            ?.map((e) => e == null
                ? null
                : AwsRdsDbClusterOptionGroupMembership.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    dbClusterParameterGroup: json['DbClusterParameterGroup'] as String,
    dbClusterResourceId: json['DbClusterResourceId'] as String,
    dbSubnetGroup: json['DbSubnetGroup'] as String,
    deletionProtection: json['DeletionProtection'] as bool,
    domainMemberships: (json['DomainMemberships'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbDomainMembership.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    enabledCloudWatchLogsExports: (json['EnabledCloudWatchLogsExports'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    endpoint: json['Endpoint'] as String,
    engine: json['Engine'] as String,
    engineMode: json['EngineMode'] as String,
    engineVersion: json['EngineVersion'] as String,
    hostedZoneId: json['HostedZoneId'] as String,
    httpEndpointEnabled: json['HttpEndpointEnabled'] as bool,
    iamDatabaseAuthenticationEnabled:
        json['IamDatabaseAuthenticationEnabled'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
    masterUsername: json['MasterUsername'] as String,
    multiAz: json['MultiAz'] as bool,
    port: json['Port'] as int,
    preferredBackupWindow: json['PreferredBackupWindow'] as String,
    preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String,
    readReplicaIdentifiers: (json['ReadReplicaIdentifiers'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    readerEndpoint: json['ReaderEndpoint'] as String,
    status: json['Status'] as String,
    storageEncrypted: json['StorageEncrypted'] as bool,
    vpcSecurityGroups: (json['VpcSecurityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbInstanceVpcSecurityGroup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsRdsDbClusterDetailsToJson(
    AwsRdsDbClusterDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ActivityStreamStatus', instance.activityStreamStatus);
  writeNotNull('AllocatedStorage', instance.allocatedStorage);
  writeNotNull('AssociatedRoles',
      instance.associatedRoles?.map((e) => e?.toJson())?.toList());
  writeNotNull('AvailabilityZones', instance.availabilityZones);
  writeNotNull('BackupRetentionPeriod', instance.backupRetentionPeriod);
  writeNotNull('ClusterCreateTime', instance.clusterCreateTime);
  writeNotNull('CopyTagsToSnapshot', instance.copyTagsToSnapshot);
  writeNotNull('CrossAccountClone', instance.crossAccountClone);
  writeNotNull('CustomEndpoints', instance.customEndpoints);
  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('DbClusterIdentifier', instance.dbClusterIdentifier);
  writeNotNull('DbClusterMembers',
      instance.dbClusterMembers?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'DbClusterOptionGroupMemberships',
      instance.dbClusterOptionGroupMemberships
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('DbClusterParameterGroup', instance.dbClusterParameterGroup);
  writeNotNull('DbClusterResourceId', instance.dbClusterResourceId);
  writeNotNull('DbSubnetGroup', instance.dbSubnetGroup);
  writeNotNull('DeletionProtection', instance.deletionProtection);
  writeNotNull('DomainMemberships',
      instance.domainMemberships?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'EnabledCloudWatchLogsExports', instance.enabledCloudWatchLogsExports);
  writeNotNull('Endpoint', instance.endpoint);
  writeNotNull('Engine', instance.engine);
  writeNotNull('EngineMode', instance.engineMode);
  writeNotNull('EngineVersion', instance.engineVersion);
  writeNotNull('HostedZoneId', instance.hostedZoneId);
  writeNotNull('HttpEndpointEnabled', instance.httpEndpointEnabled);
  writeNotNull('IamDatabaseAuthenticationEnabled',
      instance.iamDatabaseAuthenticationEnabled);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('MasterUsername', instance.masterUsername);
  writeNotNull('MultiAz', instance.multiAz);
  writeNotNull('Port', instance.port);
  writeNotNull('PreferredBackupWindow', instance.preferredBackupWindow);
  writeNotNull(
      'PreferredMaintenanceWindow', instance.preferredMaintenanceWindow);
  writeNotNull('ReadReplicaIdentifiers', instance.readReplicaIdentifiers);
  writeNotNull('ReaderEndpoint', instance.readerEndpoint);
  writeNotNull('Status', instance.status);
  writeNotNull('StorageEncrypted', instance.storageEncrypted);
  writeNotNull('VpcSecurityGroups',
      instance.vpcSecurityGroups?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsRdsDbClusterMember _$AwsRdsDbClusterMemberFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbClusterMember(
    dbClusterParameterGroupStatus:
        json['DbClusterParameterGroupStatus'] as String,
    dbInstanceIdentifier: json['DbInstanceIdentifier'] as String,
    isClusterWriter: json['IsClusterWriter'] as bool,
    promotionTier: json['PromotionTier'] as int,
  );
}

Map<String, dynamic> _$AwsRdsDbClusterMemberToJson(
    AwsRdsDbClusterMember instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DbClusterParameterGroupStatus', instance.dbClusterParameterGroupStatus);
  writeNotNull('DbInstanceIdentifier', instance.dbInstanceIdentifier);
  writeNotNull('IsClusterWriter', instance.isClusterWriter);
  writeNotNull('PromotionTier', instance.promotionTier);
  return val;
}

AwsRdsDbClusterOptionGroupMembership
    _$AwsRdsDbClusterOptionGroupMembershipFromJson(Map<String, dynamic> json) {
  return AwsRdsDbClusterOptionGroupMembership(
    dbClusterOptionGroupName: json['DbClusterOptionGroupName'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbClusterOptionGroupMembershipToJson(
    AwsRdsDbClusterOptionGroupMembership instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DbClusterOptionGroupName', instance.dbClusterOptionGroupName);
  writeNotNull('Status', instance.status);
  return val;
}

AwsRdsDbClusterSnapshotDetails _$AwsRdsDbClusterSnapshotDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbClusterSnapshotDetails(
    allocatedStorage: json['AllocatedStorage'] as int,
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    clusterCreateTime: json['ClusterCreateTime'] as String,
    dbClusterIdentifier: json['DbClusterIdentifier'] as String,
    dbClusterSnapshotIdentifier: json['DbClusterSnapshotIdentifier'] as String,
    engine: json['Engine'] as String,
    engineVersion: json['EngineVersion'] as String,
    iamDatabaseAuthenticationEnabled:
        json['IamDatabaseAuthenticationEnabled'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
    licenseModel: json['LicenseModel'] as String,
    masterUsername: json['MasterUsername'] as String,
    percentProgress: json['PercentProgress'] as int,
    port: json['Port'] as int,
    snapshotCreateTime: json['SnapshotCreateTime'] as String,
    snapshotType: json['SnapshotType'] as String,
    status: json['Status'] as String,
    storageEncrypted: json['StorageEncrypted'] as bool,
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbClusterSnapshotDetailsToJson(
    AwsRdsDbClusterSnapshotDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllocatedStorage', instance.allocatedStorage);
  writeNotNull('AvailabilityZones', instance.availabilityZones);
  writeNotNull('ClusterCreateTime', instance.clusterCreateTime);
  writeNotNull('DbClusterIdentifier', instance.dbClusterIdentifier);
  writeNotNull(
      'DbClusterSnapshotIdentifier', instance.dbClusterSnapshotIdentifier);
  writeNotNull('Engine', instance.engine);
  writeNotNull('EngineVersion', instance.engineVersion);
  writeNotNull('IamDatabaseAuthenticationEnabled',
      instance.iamDatabaseAuthenticationEnabled);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('LicenseModel', instance.licenseModel);
  writeNotNull('MasterUsername', instance.masterUsername);
  writeNotNull('PercentProgress', instance.percentProgress);
  writeNotNull('Port', instance.port);
  writeNotNull('SnapshotCreateTime', instance.snapshotCreateTime);
  writeNotNull('SnapshotType', instance.snapshotType);
  writeNotNull('Status', instance.status);
  writeNotNull('StorageEncrypted', instance.storageEncrypted);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsRdsDbDomainMembership _$AwsRdsDbDomainMembershipFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbDomainMembership(
    domain: json['Domain'] as String,
    fqdn: json['Fqdn'] as String,
    iamRoleName: json['IamRoleName'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbDomainMembershipToJson(
    AwsRdsDbDomainMembership instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Domain', instance.domain);
  writeNotNull('Fqdn', instance.fqdn);
  writeNotNull('IamRoleName', instance.iamRoleName);
  writeNotNull('Status', instance.status);
  return val;
}

AwsRdsDbInstanceAssociatedRole _$AwsRdsDbInstanceAssociatedRoleFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbInstanceAssociatedRole(
    featureName: json['FeatureName'] as String,
    roleArn: json['RoleArn'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbInstanceAssociatedRoleToJson(
    AwsRdsDbInstanceAssociatedRole instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FeatureName', instance.featureName);
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('Status', instance.status);
  return val;
}

AwsRdsDbInstanceDetails _$AwsRdsDbInstanceDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbInstanceDetails(
    allocatedStorage: json['AllocatedStorage'] as int,
    associatedRoles: (json['AssociatedRoles'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbInstanceAssociatedRole.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    autoMinorVersionUpgrade: json['AutoMinorVersionUpgrade'] as bool,
    availabilityZone: json['AvailabilityZone'] as String,
    backupRetentionPeriod: json['BackupRetentionPeriod'] as int,
    cACertificateIdentifier: json['CACertificateIdentifier'] as String,
    characterSetName: json['CharacterSetName'] as String,
    copyTagsToSnapshot: json['CopyTagsToSnapshot'] as bool,
    dBClusterIdentifier: json['DBClusterIdentifier'] as String,
    dBInstanceClass: json['DBInstanceClass'] as String,
    dBInstanceIdentifier: json['DBInstanceIdentifier'] as String,
    dBName: json['DBName'] as String,
    dbInstancePort: json['DbInstancePort'] as int,
    dbInstanceStatus: json['DbInstanceStatus'] as String,
    dbParameterGroups: (json['DbParameterGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbParameterGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dbSecurityGroups:
        (json['DbSecurityGroups'] as List)?.map((e) => e as String)?.toList(),
    dbSubnetGroup: json['DbSubnetGroup'] == null
        ? null
        : AwsRdsDbSubnetGroup.fromJson(
            json['DbSubnetGroup'] as Map<String, dynamic>),
    dbiResourceId: json['DbiResourceId'] as String,
    deletionProtection: json['DeletionProtection'] as bool,
    domainMemberships: (json['DomainMemberships'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbDomainMembership.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    enabledCloudWatchLogsExports: (json['EnabledCloudWatchLogsExports'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    endpoint: json['Endpoint'] == null
        ? null
        : AwsRdsDbInstanceEndpoint.fromJson(
            json['Endpoint'] as Map<String, dynamic>),
    engine: json['Engine'] as String,
    engineVersion: json['EngineVersion'] as String,
    enhancedMonitoringResourceArn:
        json['EnhancedMonitoringResourceArn'] as String,
    iAMDatabaseAuthenticationEnabled:
        json['IAMDatabaseAuthenticationEnabled'] as bool,
    instanceCreateTime: json['InstanceCreateTime'] as String,
    iops: json['Iops'] as int,
    kmsKeyId: json['KmsKeyId'] as String,
    latestRestorableTime: json['LatestRestorableTime'] as String,
    licenseModel: json['LicenseModel'] as String,
    listenerEndpoint: json['ListenerEndpoint'] == null
        ? null
        : AwsRdsDbInstanceEndpoint.fromJson(
            json['ListenerEndpoint'] as Map<String, dynamic>),
    masterUsername: json['MasterUsername'] as String,
    maxAllocatedStorage: json['MaxAllocatedStorage'] as int,
    monitoringInterval: json['MonitoringInterval'] as int,
    monitoringRoleArn: json['MonitoringRoleArn'] as String,
    multiAz: json['MultiAz'] as bool,
    optionGroupMemberships: (json['OptionGroupMemberships'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbOptionGroupMembership.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pendingModifiedValues: json['PendingModifiedValues'] == null
        ? null
        : AwsRdsDbPendingModifiedValues.fromJson(
            json['PendingModifiedValues'] as Map<String, dynamic>),
    performanceInsightsEnabled: json['PerformanceInsightsEnabled'] as bool,
    performanceInsightsKmsKeyId: json['PerformanceInsightsKmsKeyId'] as String,
    performanceInsightsRetentionPeriod:
        json['PerformanceInsightsRetentionPeriod'] as int,
    preferredBackupWindow: json['PreferredBackupWindow'] as String,
    preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String,
    processorFeatures: (json['ProcessorFeatures'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbProcessorFeature.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    promotionTier: json['PromotionTier'] as int,
    publiclyAccessible: json['PubliclyAccessible'] as bool,
    readReplicaDBClusterIdentifiers:
        (json['ReadReplicaDBClusterIdentifiers'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    readReplicaDBInstanceIdentifiers:
        (json['ReadReplicaDBInstanceIdentifiers'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    readReplicaSourceDBInstanceIdentifier:
        json['ReadReplicaSourceDBInstanceIdentifier'] as String,
    secondaryAvailabilityZone: json['SecondaryAvailabilityZone'] as String,
    statusInfos: (json['StatusInfos'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbStatusInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    storageEncrypted: json['StorageEncrypted'] as bool,
    storageType: json['StorageType'] as String,
    tdeCredentialArn: json['TdeCredentialArn'] as String,
    timezone: json['Timezone'] as String,
    vpcSecurityGroups: (json['VpcSecurityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbInstanceVpcSecurityGroup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsRdsDbInstanceDetailsToJson(
    AwsRdsDbInstanceDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllocatedStorage', instance.allocatedStorage);
  writeNotNull('AssociatedRoles',
      instance.associatedRoles?.map((e) => e?.toJson())?.toList());
  writeNotNull('AutoMinorVersionUpgrade', instance.autoMinorVersionUpgrade);
  writeNotNull('AvailabilityZone', instance.availabilityZone);
  writeNotNull('BackupRetentionPeriod', instance.backupRetentionPeriod);
  writeNotNull('CACertificateIdentifier', instance.cACertificateIdentifier);
  writeNotNull('CharacterSetName', instance.characterSetName);
  writeNotNull('CopyTagsToSnapshot', instance.copyTagsToSnapshot);
  writeNotNull('DBClusterIdentifier', instance.dBClusterIdentifier);
  writeNotNull('DBInstanceClass', instance.dBInstanceClass);
  writeNotNull('DBInstanceIdentifier', instance.dBInstanceIdentifier);
  writeNotNull('DBName', instance.dBName);
  writeNotNull('DbInstancePort', instance.dbInstancePort);
  writeNotNull('DbInstanceStatus', instance.dbInstanceStatus);
  writeNotNull('DbParameterGroups',
      instance.dbParameterGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('DbSecurityGroups', instance.dbSecurityGroups);
  writeNotNull('DbSubnetGroup', instance.dbSubnetGroup?.toJson());
  writeNotNull('DbiResourceId', instance.dbiResourceId);
  writeNotNull('DeletionProtection', instance.deletionProtection);
  writeNotNull('DomainMemberships',
      instance.domainMemberships?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'EnabledCloudWatchLogsExports', instance.enabledCloudWatchLogsExports);
  writeNotNull('Endpoint', instance.endpoint?.toJson());
  writeNotNull('Engine', instance.engine);
  writeNotNull('EngineVersion', instance.engineVersion);
  writeNotNull(
      'EnhancedMonitoringResourceArn', instance.enhancedMonitoringResourceArn);
  writeNotNull('IAMDatabaseAuthenticationEnabled',
      instance.iAMDatabaseAuthenticationEnabled);
  writeNotNull('InstanceCreateTime', instance.instanceCreateTime);
  writeNotNull('Iops', instance.iops);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('LatestRestorableTime', instance.latestRestorableTime);
  writeNotNull('LicenseModel', instance.licenseModel);
  writeNotNull('ListenerEndpoint', instance.listenerEndpoint?.toJson());
  writeNotNull('MasterUsername', instance.masterUsername);
  writeNotNull('MaxAllocatedStorage', instance.maxAllocatedStorage);
  writeNotNull('MonitoringInterval', instance.monitoringInterval);
  writeNotNull('MonitoringRoleArn', instance.monitoringRoleArn);
  writeNotNull('MultiAz', instance.multiAz);
  writeNotNull('OptionGroupMemberships',
      instance.optionGroupMemberships?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'PendingModifiedValues', instance.pendingModifiedValues?.toJson());
  writeNotNull(
      'PerformanceInsightsEnabled', instance.performanceInsightsEnabled);
  writeNotNull(
      'PerformanceInsightsKmsKeyId', instance.performanceInsightsKmsKeyId);
  writeNotNull('PerformanceInsightsRetentionPeriod',
      instance.performanceInsightsRetentionPeriod);
  writeNotNull('PreferredBackupWindow', instance.preferredBackupWindow);
  writeNotNull(
      'PreferredMaintenanceWindow', instance.preferredMaintenanceWindow);
  writeNotNull('ProcessorFeatures',
      instance.processorFeatures?.map((e) => e?.toJson())?.toList());
  writeNotNull('PromotionTier', instance.promotionTier);
  writeNotNull('PubliclyAccessible', instance.publiclyAccessible);
  writeNotNull('ReadReplicaDBClusterIdentifiers',
      instance.readReplicaDBClusterIdentifiers);
  writeNotNull('ReadReplicaDBInstanceIdentifiers',
      instance.readReplicaDBInstanceIdentifiers);
  writeNotNull('ReadReplicaSourceDBInstanceIdentifier',
      instance.readReplicaSourceDBInstanceIdentifier);
  writeNotNull('SecondaryAvailabilityZone', instance.secondaryAvailabilityZone);
  writeNotNull(
      'StatusInfos', instance.statusInfos?.map((e) => e?.toJson())?.toList());
  writeNotNull('StorageEncrypted', instance.storageEncrypted);
  writeNotNull('StorageType', instance.storageType);
  writeNotNull('TdeCredentialArn', instance.tdeCredentialArn);
  writeNotNull('Timezone', instance.timezone);
  writeNotNull('VpcSecurityGroups',
      instance.vpcSecurityGroups?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsRdsDbInstanceEndpoint _$AwsRdsDbInstanceEndpointFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbInstanceEndpoint(
    address: json['Address'] as String,
    hostedZoneId: json['HostedZoneId'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$AwsRdsDbInstanceEndpointToJson(
    AwsRdsDbInstanceEndpoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  writeNotNull('HostedZoneId', instance.hostedZoneId);
  writeNotNull('Port', instance.port);
  return val;
}

AwsRdsDbInstanceVpcSecurityGroup _$AwsRdsDbInstanceVpcSecurityGroupFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbInstanceVpcSecurityGroup(
    status: json['Status'] as String,
    vpcSecurityGroupId: json['VpcSecurityGroupId'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbInstanceVpcSecurityGroupToJson(
    AwsRdsDbInstanceVpcSecurityGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', instance.status);
  writeNotNull('VpcSecurityGroupId', instance.vpcSecurityGroupId);
  return val;
}

AwsRdsDbOptionGroupMembership _$AwsRdsDbOptionGroupMembershipFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbOptionGroupMembership(
    optionGroupName: json['OptionGroupName'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbOptionGroupMembershipToJson(
    AwsRdsDbOptionGroupMembership instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OptionGroupName', instance.optionGroupName);
  writeNotNull('Status', instance.status);
  return val;
}

AwsRdsDbParameterGroup _$AwsRdsDbParameterGroupFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbParameterGroup(
    dbParameterGroupName: json['DbParameterGroupName'] as String,
    parameterApplyStatus: json['ParameterApplyStatus'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbParameterGroupToJson(
    AwsRdsDbParameterGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DbParameterGroupName', instance.dbParameterGroupName);
  writeNotNull('ParameterApplyStatus', instance.parameterApplyStatus);
  return val;
}

AwsRdsDbPendingModifiedValues _$AwsRdsDbPendingModifiedValuesFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbPendingModifiedValues(
    allocatedStorage: json['AllocatedStorage'] as int,
    backupRetentionPeriod: json['BackupRetentionPeriod'] as int,
    caCertificateIdentifier: json['CaCertificateIdentifier'] as String,
    dbInstanceClass: json['DbInstanceClass'] as String,
    dbInstanceIdentifier: json['DbInstanceIdentifier'] as String,
    dbSubnetGroupName: json['DbSubnetGroupName'] as String,
    engineVersion: json['EngineVersion'] as String,
    iops: json['Iops'] as int,
    licenseModel: json['LicenseModel'] as String,
    masterUserPassword: json['MasterUserPassword'] as String,
    multiAZ: json['MultiAZ'] as bool,
    pendingCloudWatchLogsExports: json['PendingCloudWatchLogsExports'] == null
        ? null
        : AwsRdsPendingCloudWatchLogsExports.fromJson(
            json['PendingCloudWatchLogsExports'] as Map<String, dynamic>),
    port: json['Port'] as int,
    processorFeatures: (json['ProcessorFeatures'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbProcessorFeature.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    storageType: json['StorageType'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbPendingModifiedValuesToJson(
    AwsRdsDbPendingModifiedValues instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllocatedStorage', instance.allocatedStorage);
  writeNotNull('BackupRetentionPeriod', instance.backupRetentionPeriod);
  writeNotNull('CaCertificateIdentifier', instance.caCertificateIdentifier);
  writeNotNull('DbInstanceClass', instance.dbInstanceClass);
  writeNotNull('DbInstanceIdentifier', instance.dbInstanceIdentifier);
  writeNotNull('DbSubnetGroupName', instance.dbSubnetGroupName);
  writeNotNull('EngineVersion', instance.engineVersion);
  writeNotNull('Iops', instance.iops);
  writeNotNull('LicenseModel', instance.licenseModel);
  writeNotNull('MasterUserPassword', instance.masterUserPassword);
  writeNotNull('MultiAZ', instance.multiAZ);
  writeNotNull('PendingCloudWatchLogsExports',
      instance.pendingCloudWatchLogsExports?.toJson());
  writeNotNull('Port', instance.port);
  writeNotNull('ProcessorFeatures',
      instance.processorFeatures?.map((e) => e?.toJson())?.toList());
  writeNotNull('StorageType', instance.storageType);
  return val;
}

AwsRdsDbProcessorFeature _$AwsRdsDbProcessorFeatureFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbProcessorFeature(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbProcessorFeatureToJson(
    AwsRdsDbProcessorFeature instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

AwsRdsDbSnapshotDetails _$AwsRdsDbSnapshotDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbSnapshotDetails(
    allocatedStorage: json['AllocatedStorage'] as int,
    availabilityZone: json['AvailabilityZone'] as String,
    dbInstanceIdentifier: json['DbInstanceIdentifier'] as String,
    dbSnapshotIdentifier: json['DbSnapshotIdentifier'] as String,
    dbiResourceId: json['DbiResourceId'] as String,
    encrypted: json['Encrypted'] as bool,
    engine: json['Engine'] as String,
    engineVersion: json['EngineVersion'] as String,
    iamDatabaseAuthenticationEnabled:
        json['IamDatabaseAuthenticationEnabled'] as bool,
    instanceCreateTime: json['InstanceCreateTime'] as String,
    iops: json['Iops'] as int,
    kmsKeyId: json['KmsKeyId'] as String,
    licenseModel: json['LicenseModel'] as String,
    masterUsername: json['MasterUsername'] as String,
    optionGroupName: json['OptionGroupName'] as String,
    percentProgress: json['PercentProgress'] as int,
    port: json['Port'] as int,
    processorFeatures: (json['ProcessorFeatures'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbProcessorFeature.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    snapshotCreateTime: json['SnapshotCreateTime'] as String,
    snapshotType: json['SnapshotType'] as String,
    sourceDbSnapshotIdentifier: json['SourceDbSnapshotIdentifier'] as String,
    sourceRegion: json['SourceRegion'] as String,
    status: json['Status'] as String,
    storageType: json['StorageType'] as String,
    tdeCredentialArn: json['TdeCredentialArn'] as String,
    timezone: json['Timezone'] as String,
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbSnapshotDetailsToJson(
    AwsRdsDbSnapshotDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllocatedStorage', instance.allocatedStorage);
  writeNotNull('AvailabilityZone', instance.availabilityZone);
  writeNotNull('DbInstanceIdentifier', instance.dbInstanceIdentifier);
  writeNotNull('DbSnapshotIdentifier', instance.dbSnapshotIdentifier);
  writeNotNull('DbiResourceId', instance.dbiResourceId);
  writeNotNull('Encrypted', instance.encrypted);
  writeNotNull('Engine', instance.engine);
  writeNotNull('EngineVersion', instance.engineVersion);
  writeNotNull('IamDatabaseAuthenticationEnabled',
      instance.iamDatabaseAuthenticationEnabled);
  writeNotNull('InstanceCreateTime', instance.instanceCreateTime);
  writeNotNull('Iops', instance.iops);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('LicenseModel', instance.licenseModel);
  writeNotNull('MasterUsername', instance.masterUsername);
  writeNotNull('OptionGroupName', instance.optionGroupName);
  writeNotNull('PercentProgress', instance.percentProgress);
  writeNotNull('Port', instance.port);
  writeNotNull('ProcessorFeatures',
      instance.processorFeatures?.map((e) => e?.toJson())?.toList());
  writeNotNull('SnapshotCreateTime', instance.snapshotCreateTime);
  writeNotNull('SnapshotType', instance.snapshotType);
  writeNotNull(
      'SourceDbSnapshotIdentifier', instance.sourceDbSnapshotIdentifier);
  writeNotNull('SourceRegion', instance.sourceRegion);
  writeNotNull('Status', instance.status);
  writeNotNull('StorageType', instance.storageType);
  writeNotNull('TdeCredentialArn', instance.tdeCredentialArn);
  writeNotNull('Timezone', instance.timezone);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsRdsDbStatusInfo _$AwsRdsDbStatusInfoFromJson(Map<String, dynamic> json) {
  return AwsRdsDbStatusInfo(
    message: json['Message'] as String,
    normal: json['Normal'] as bool,
    status: json['Status'] as String,
    statusType: json['StatusType'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbStatusInfoToJson(AwsRdsDbStatusInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Message', instance.message);
  writeNotNull('Normal', instance.normal);
  writeNotNull('Status', instance.status);
  writeNotNull('StatusType', instance.statusType);
  return val;
}

AwsRdsDbSubnetGroup _$AwsRdsDbSubnetGroupFromJson(Map<String, dynamic> json) {
  return AwsRdsDbSubnetGroup(
    dbSubnetGroupArn: json['DbSubnetGroupArn'] as String,
    dbSubnetGroupDescription: json['DbSubnetGroupDescription'] as String,
    dbSubnetGroupName: json['DbSubnetGroupName'] as String,
    subnetGroupStatus: json['SubnetGroupStatus'] as String,
    subnets: (json['Subnets'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbSubnetGroupSubnet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbSubnetGroupToJson(AwsRdsDbSubnetGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DbSubnetGroupArn', instance.dbSubnetGroupArn);
  writeNotNull('DbSubnetGroupDescription', instance.dbSubnetGroupDescription);
  writeNotNull('DbSubnetGroupName', instance.dbSubnetGroupName);
  writeNotNull('SubnetGroupStatus', instance.subnetGroupStatus);
  writeNotNull('Subnets', instance.subnets?.map((e) => e?.toJson())?.toList());
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsRdsDbSubnetGroupSubnet _$AwsRdsDbSubnetGroupSubnetFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbSubnetGroupSubnet(
    subnetAvailabilityZone: json['SubnetAvailabilityZone'] == null
        ? null
        : AwsRdsDbSubnetGroupSubnetAvailabilityZone.fromJson(
            json['SubnetAvailabilityZone'] as Map<String, dynamic>),
    subnetIdentifier: json['SubnetIdentifier'] as String,
    subnetStatus: json['SubnetStatus'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbSubnetGroupSubnetToJson(
    AwsRdsDbSubnetGroupSubnet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'SubnetAvailabilityZone', instance.subnetAvailabilityZone?.toJson());
  writeNotNull('SubnetIdentifier', instance.subnetIdentifier);
  writeNotNull('SubnetStatus', instance.subnetStatus);
  return val;
}

AwsRdsDbSubnetGroupSubnetAvailabilityZone
    _$AwsRdsDbSubnetGroupSubnetAvailabilityZoneFromJson(
        Map<String, dynamic> json) {
  return AwsRdsDbSubnetGroupSubnetAvailabilityZone(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbSubnetGroupSubnetAvailabilityZoneToJson(
    AwsRdsDbSubnetGroupSubnetAvailabilityZone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

AwsRdsPendingCloudWatchLogsExports _$AwsRdsPendingCloudWatchLogsExportsFromJson(
    Map<String, dynamic> json) {
  return AwsRdsPendingCloudWatchLogsExports(
    logTypesToDisable:
        (json['LogTypesToDisable'] as List)?.map((e) => e as String)?.toList(),
    logTypesToEnable:
        (json['LogTypesToEnable'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AwsRdsPendingCloudWatchLogsExportsToJson(
    AwsRdsPendingCloudWatchLogsExports instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LogTypesToDisable', instance.logTypesToDisable);
  writeNotNull('LogTypesToEnable', instance.logTypesToEnable);
  return val;
}

AwsRedshiftClusterClusterNode _$AwsRedshiftClusterClusterNodeFromJson(
    Map<String, dynamic> json) {
  return AwsRedshiftClusterClusterNode(
    nodeRole: json['NodeRole'] as String,
    privateIpAddress: json['PrivateIpAddress'] as String,
    publicIpAddress: json['PublicIpAddress'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterClusterNodeToJson(
    AwsRedshiftClusterClusterNode instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NodeRole', instance.nodeRole);
  writeNotNull('PrivateIpAddress', instance.privateIpAddress);
  writeNotNull('PublicIpAddress', instance.publicIpAddress);
  return val;
}

AwsRedshiftClusterClusterParameterGroup
    _$AwsRedshiftClusterClusterParameterGroupFromJson(
        Map<String, dynamic> json) {
  return AwsRedshiftClusterClusterParameterGroup(
    clusterParameterStatusList: (json['ClusterParameterStatusList'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRedshiftClusterClusterParameterStatus.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    parameterApplyStatus: json['ParameterApplyStatus'] as String,
    parameterGroupName: json['ParameterGroupName'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterClusterParameterGroupToJson(
    AwsRedshiftClusterClusterParameterGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterParameterStatusList',
      instance.clusterParameterStatusList?.map((e) => e?.toJson())?.toList());
  writeNotNull('ParameterApplyStatus', instance.parameterApplyStatus);
  writeNotNull('ParameterGroupName', instance.parameterGroupName);
  return val;
}

AwsRedshiftClusterClusterParameterStatus
    _$AwsRedshiftClusterClusterParameterStatusFromJson(
        Map<String, dynamic> json) {
  return AwsRedshiftClusterClusterParameterStatus(
    parameterApplyErrorDescription:
        json['ParameterApplyErrorDescription'] as String,
    parameterApplyStatus: json['ParameterApplyStatus'] as String,
    parameterName: json['ParameterName'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterClusterParameterStatusToJson(
    AwsRedshiftClusterClusterParameterStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParameterApplyErrorDescription',
      instance.parameterApplyErrorDescription);
  writeNotNull('ParameterApplyStatus', instance.parameterApplyStatus);
  writeNotNull('ParameterName', instance.parameterName);
  return val;
}

AwsRedshiftClusterClusterSecurityGroup
    _$AwsRedshiftClusterClusterSecurityGroupFromJson(
        Map<String, dynamic> json) {
  return AwsRedshiftClusterClusterSecurityGroup(
    clusterSecurityGroupName: json['ClusterSecurityGroupName'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterClusterSecurityGroupToJson(
    AwsRedshiftClusterClusterSecurityGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterSecurityGroupName', instance.clusterSecurityGroupName);
  writeNotNull('Status', instance.status);
  return val;
}

AwsRedshiftClusterClusterSnapshotCopyStatus
    _$AwsRedshiftClusterClusterSnapshotCopyStatusFromJson(
        Map<String, dynamic> json) {
  return AwsRedshiftClusterClusterSnapshotCopyStatus(
    destinationRegion: json['DestinationRegion'] as String,
    manualSnapshotRetentionPeriod: json['ManualSnapshotRetentionPeriod'] as int,
    retentionPeriod: json['RetentionPeriod'] as int,
    snapshotCopyGrantName: json['SnapshotCopyGrantName'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterClusterSnapshotCopyStatusToJson(
    AwsRedshiftClusterClusterSnapshotCopyStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationRegion', instance.destinationRegion);
  writeNotNull(
      'ManualSnapshotRetentionPeriod', instance.manualSnapshotRetentionPeriod);
  writeNotNull('RetentionPeriod', instance.retentionPeriod);
  writeNotNull('SnapshotCopyGrantName', instance.snapshotCopyGrantName);
  return val;
}

AwsRedshiftClusterDeferredMaintenanceWindow
    _$AwsRedshiftClusterDeferredMaintenanceWindowFromJson(
        Map<String, dynamic> json) {
  return AwsRedshiftClusterDeferredMaintenanceWindow(
    deferMaintenanceEndTime: json['DeferMaintenanceEndTime'] as String,
    deferMaintenanceIdentifier: json['DeferMaintenanceIdentifier'] as String,
    deferMaintenanceStartTime: json['DeferMaintenanceStartTime'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterDeferredMaintenanceWindowToJson(
    AwsRedshiftClusterDeferredMaintenanceWindow instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeferMaintenanceEndTime', instance.deferMaintenanceEndTime);
  writeNotNull(
      'DeferMaintenanceIdentifier', instance.deferMaintenanceIdentifier);
  writeNotNull('DeferMaintenanceStartTime', instance.deferMaintenanceStartTime);
  return val;
}

AwsRedshiftClusterDetails _$AwsRedshiftClusterDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsRedshiftClusterDetails(
    allowVersionUpgrade: json['AllowVersionUpgrade'] as bool,
    automatedSnapshotRetentionPeriod:
        json['AutomatedSnapshotRetentionPeriod'] as int,
    availabilityZone: json['AvailabilityZone'] as String,
    clusterAvailabilityStatus: json['ClusterAvailabilityStatus'] as String,
    clusterCreateTime: json['ClusterCreateTime'] as String,
    clusterIdentifier: json['ClusterIdentifier'] as String,
    clusterNodes: (json['ClusterNodes'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRedshiftClusterClusterNode.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    clusterParameterGroups: (json['ClusterParameterGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRedshiftClusterClusterParameterGroup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    clusterPublicKey: json['ClusterPublicKey'] as String,
    clusterRevisionNumber: json['ClusterRevisionNumber'] as String,
    clusterSecurityGroups: (json['ClusterSecurityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRedshiftClusterClusterSecurityGroup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    clusterSnapshotCopyStatus: json['ClusterSnapshotCopyStatus'] == null
        ? null
        : AwsRedshiftClusterClusterSnapshotCopyStatus.fromJson(
            json['ClusterSnapshotCopyStatus'] as Map<String, dynamic>),
    clusterStatus: json['ClusterStatus'] as String,
    clusterSubnetGroupName: json['ClusterSubnetGroupName'] as String,
    clusterVersion: json['ClusterVersion'] as String,
    dBName: json['DBName'] as String,
    deferredMaintenanceWindows: (json['DeferredMaintenanceWindows'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRedshiftClusterDeferredMaintenanceWindow.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    elasticIpStatus: json['ElasticIpStatus'] == null
        ? null
        : AwsRedshiftClusterElasticIpStatus.fromJson(
            json['ElasticIpStatus'] as Map<String, dynamic>),
    elasticResizeNumberOfNodeOptions:
        json['ElasticResizeNumberOfNodeOptions'] as String,
    encrypted: json['Encrypted'] as bool,
    endpoint: json['Endpoint'] == null
        ? null
        : AwsRedshiftClusterEndpoint.fromJson(
            json['Endpoint'] as Map<String, dynamic>),
    enhancedVpcRouting: json['EnhancedVpcRouting'] as bool,
    expectedNextSnapshotScheduleTime:
        json['ExpectedNextSnapshotScheduleTime'] as String,
    expectedNextSnapshotScheduleTimeStatus:
        json['ExpectedNextSnapshotScheduleTimeStatus'] as String,
    hsmStatus: json['HsmStatus'] == null
        ? null
        : AwsRedshiftClusterHsmStatus.fromJson(
            json['HsmStatus'] as Map<String, dynamic>),
    iamRoles: (json['IamRoles'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRedshiftClusterIamRole.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    kmsKeyId: json['KmsKeyId'] as String,
    maintenanceTrackName: json['MaintenanceTrackName'] as String,
    manualSnapshotRetentionPeriod: json['ManualSnapshotRetentionPeriod'] as int,
    masterUsername: json['MasterUsername'] as String,
    nextMaintenanceWindowStartTime:
        json['NextMaintenanceWindowStartTime'] as String,
    nodeType: json['NodeType'] as String,
    numberOfNodes: json['NumberOfNodes'] as int,
    pendingActions:
        (json['PendingActions'] as List)?.map((e) => e as String)?.toList(),
    pendingModifiedValues: json['PendingModifiedValues'] == null
        ? null
        : AwsRedshiftClusterPendingModifiedValues.fromJson(
            json['PendingModifiedValues'] as Map<String, dynamic>),
    preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String,
    publiclyAccessible: json['PubliclyAccessible'] as bool,
    resizeInfo: json['ResizeInfo'] == null
        ? null
        : AwsRedshiftClusterResizeInfo.fromJson(
            json['ResizeInfo'] as Map<String, dynamic>),
    restoreStatus: json['RestoreStatus'] == null
        ? null
        : AwsRedshiftClusterRestoreStatus.fromJson(
            json['RestoreStatus'] as Map<String, dynamic>),
    snapshotScheduleIdentifier: json['SnapshotScheduleIdentifier'] as String,
    snapshotScheduleState: json['SnapshotScheduleState'] as String,
    vpcId: json['VpcId'] as String,
    vpcSecurityGroups: (json['VpcSecurityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRedshiftClusterVpcSecurityGroup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsRedshiftClusterDetailsToJson(
    AwsRedshiftClusterDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowVersionUpgrade', instance.allowVersionUpgrade);
  writeNotNull('AutomatedSnapshotRetentionPeriod',
      instance.automatedSnapshotRetentionPeriod);
  writeNotNull('AvailabilityZone', instance.availabilityZone);
  writeNotNull('ClusterAvailabilityStatus', instance.clusterAvailabilityStatus);
  writeNotNull('ClusterCreateTime', instance.clusterCreateTime);
  writeNotNull('ClusterIdentifier', instance.clusterIdentifier);
  writeNotNull(
      'ClusterNodes', instance.clusterNodes?.map((e) => e?.toJson())?.toList());
  writeNotNull('ClusterParameterGroups',
      instance.clusterParameterGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('ClusterPublicKey', instance.clusterPublicKey);
  writeNotNull('ClusterRevisionNumber', instance.clusterRevisionNumber);
  writeNotNull('ClusterSecurityGroups',
      instance.clusterSecurityGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('ClusterSnapshotCopyStatus',
      instance.clusterSnapshotCopyStatus?.toJson());
  writeNotNull('ClusterStatus', instance.clusterStatus);
  writeNotNull('ClusterSubnetGroupName', instance.clusterSubnetGroupName);
  writeNotNull('ClusterVersion', instance.clusterVersion);
  writeNotNull('DBName', instance.dBName);
  writeNotNull('DeferredMaintenanceWindows',
      instance.deferredMaintenanceWindows?.map((e) => e?.toJson())?.toList());
  writeNotNull('ElasticIpStatus', instance.elasticIpStatus?.toJson());
  writeNotNull('ElasticResizeNumberOfNodeOptions',
      instance.elasticResizeNumberOfNodeOptions);
  writeNotNull('Encrypted', instance.encrypted);
  writeNotNull('Endpoint', instance.endpoint?.toJson());
  writeNotNull('EnhancedVpcRouting', instance.enhancedVpcRouting);
  writeNotNull('ExpectedNextSnapshotScheduleTime',
      instance.expectedNextSnapshotScheduleTime);
  writeNotNull('ExpectedNextSnapshotScheduleTimeStatus',
      instance.expectedNextSnapshotScheduleTimeStatus);
  writeNotNull('HsmStatus', instance.hsmStatus?.toJson());
  writeNotNull(
      'IamRoles', instance.iamRoles?.map((e) => e?.toJson())?.toList());
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('MaintenanceTrackName', instance.maintenanceTrackName);
  writeNotNull(
      'ManualSnapshotRetentionPeriod', instance.manualSnapshotRetentionPeriod);
  writeNotNull('MasterUsername', instance.masterUsername);
  writeNotNull('NextMaintenanceWindowStartTime',
      instance.nextMaintenanceWindowStartTime);
  writeNotNull('NodeType', instance.nodeType);
  writeNotNull('NumberOfNodes', instance.numberOfNodes);
  writeNotNull('PendingActions', instance.pendingActions);
  writeNotNull(
      'PendingModifiedValues', instance.pendingModifiedValues?.toJson());
  writeNotNull(
      'PreferredMaintenanceWindow', instance.preferredMaintenanceWindow);
  writeNotNull('PubliclyAccessible', instance.publiclyAccessible);
  writeNotNull('ResizeInfo', instance.resizeInfo?.toJson());
  writeNotNull('RestoreStatus', instance.restoreStatus?.toJson());
  writeNotNull(
      'SnapshotScheduleIdentifier', instance.snapshotScheduleIdentifier);
  writeNotNull('SnapshotScheduleState', instance.snapshotScheduleState);
  writeNotNull('VpcId', instance.vpcId);
  writeNotNull('VpcSecurityGroups',
      instance.vpcSecurityGroups?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsRedshiftClusterElasticIpStatus _$AwsRedshiftClusterElasticIpStatusFromJson(
    Map<String, dynamic> json) {
  return AwsRedshiftClusterElasticIpStatus(
    elasticIp: json['ElasticIp'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterElasticIpStatusToJson(
    AwsRedshiftClusterElasticIpStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ElasticIp', instance.elasticIp);
  writeNotNull('Status', instance.status);
  return val;
}

AwsRedshiftClusterEndpoint _$AwsRedshiftClusterEndpointFromJson(
    Map<String, dynamic> json) {
  return AwsRedshiftClusterEndpoint(
    address: json['Address'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterEndpointToJson(
    AwsRedshiftClusterEndpoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  writeNotNull('Port', instance.port);
  return val;
}

AwsRedshiftClusterHsmStatus _$AwsRedshiftClusterHsmStatusFromJson(
    Map<String, dynamic> json) {
  return AwsRedshiftClusterHsmStatus(
    hsmClientCertificateIdentifier:
        json['HsmClientCertificateIdentifier'] as String,
    hsmConfigurationIdentifier: json['HsmConfigurationIdentifier'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterHsmStatusToJson(
    AwsRedshiftClusterHsmStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HsmClientCertificateIdentifier',
      instance.hsmClientCertificateIdentifier);
  writeNotNull(
      'HsmConfigurationIdentifier', instance.hsmConfigurationIdentifier);
  writeNotNull('Status', instance.status);
  return val;
}

AwsRedshiftClusterIamRole _$AwsRedshiftClusterIamRoleFromJson(
    Map<String, dynamic> json) {
  return AwsRedshiftClusterIamRole(
    applyStatus: json['ApplyStatus'] as String,
    iamRoleArn: json['IamRoleArn'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterIamRoleToJson(
    AwsRedshiftClusterIamRole instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplyStatus', instance.applyStatus);
  writeNotNull('IamRoleArn', instance.iamRoleArn);
  return val;
}

AwsRedshiftClusterPendingModifiedValues
    _$AwsRedshiftClusterPendingModifiedValuesFromJson(
        Map<String, dynamic> json) {
  return AwsRedshiftClusterPendingModifiedValues(
    automatedSnapshotRetentionPeriod:
        json['AutomatedSnapshotRetentionPeriod'] as int,
    clusterIdentifier: json['ClusterIdentifier'] as String,
    clusterType: json['ClusterType'] as String,
    clusterVersion: json['ClusterVersion'] as String,
    encryptionType: json['EncryptionType'] as String,
    enhancedVpcRouting: json['EnhancedVpcRouting'] as bool,
    maintenanceTrackName: json['MaintenanceTrackName'] as String,
    masterUserPassword: json['MasterUserPassword'] as String,
    nodeType: json['NodeType'] as String,
    numberOfNodes: json['NumberOfNodes'] as int,
    publiclyAccessible: json['PubliclyAccessible'] as bool,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterPendingModifiedValuesToJson(
    AwsRedshiftClusterPendingModifiedValues instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AutomatedSnapshotRetentionPeriod',
      instance.automatedSnapshotRetentionPeriod);
  writeNotNull('ClusterIdentifier', instance.clusterIdentifier);
  writeNotNull('ClusterType', instance.clusterType);
  writeNotNull('ClusterVersion', instance.clusterVersion);
  writeNotNull('EncryptionType', instance.encryptionType);
  writeNotNull('EnhancedVpcRouting', instance.enhancedVpcRouting);
  writeNotNull('MaintenanceTrackName', instance.maintenanceTrackName);
  writeNotNull('MasterUserPassword', instance.masterUserPassword);
  writeNotNull('NodeType', instance.nodeType);
  writeNotNull('NumberOfNodes', instance.numberOfNodes);
  writeNotNull('PubliclyAccessible', instance.publiclyAccessible);
  return val;
}

AwsRedshiftClusterResizeInfo _$AwsRedshiftClusterResizeInfoFromJson(
    Map<String, dynamic> json) {
  return AwsRedshiftClusterResizeInfo(
    allowCancelResize: json['AllowCancelResize'] as bool,
    resizeType: json['ResizeType'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterResizeInfoToJson(
    AwsRedshiftClusterResizeInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowCancelResize', instance.allowCancelResize);
  writeNotNull('ResizeType', instance.resizeType);
  return val;
}

AwsRedshiftClusterRestoreStatus _$AwsRedshiftClusterRestoreStatusFromJson(
    Map<String, dynamic> json) {
  return AwsRedshiftClusterRestoreStatus(
    currentRestoreRateInMegaBytesPerSecond:
        (json['CurrentRestoreRateInMegaBytesPerSecond'] as num)?.toDouble(),
    elapsedTimeInSeconds: json['ElapsedTimeInSeconds'] as int,
    estimatedTimeToCompletionInSeconds:
        json['EstimatedTimeToCompletionInSeconds'] as int,
    progressInMegaBytes: json['ProgressInMegaBytes'] as int,
    snapshotSizeInMegaBytes: json['SnapshotSizeInMegaBytes'] as int,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterRestoreStatusToJson(
    AwsRedshiftClusterRestoreStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CurrentRestoreRateInMegaBytesPerSecond',
      instance.currentRestoreRateInMegaBytesPerSecond);
  writeNotNull('ElapsedTimeInSeconds', instance.elapsedTimeInSeconds);
  writeNotNull('EstimatedTimeToCompletionInSeconds',
      instance.estimatedTimeToCompletionInSeconds);
  writeNotNull('ProgressInMegaBytes', instance.progressInMegaBytes);
  writeNotNull('SnapshotSizeInMegaBytes', instance.snapshotSizeInMegaBytes);
  writeNotNull('Status', instance.status);
  return val;
}

AwsRedshiftClusterVpcSecurityGroup _$AwsRedshiftClusterVpcSecurityGroupFromJson(
    Map<String, dynamic> json) {
  return AwsRedshiftClusterVpcSecurityGroup(
    status: json['Status'] as String,
    vpcSecurityGroupId: json['VpcSecurityGroupId'] as String,
  );
}

Map<String, dynamic> _$AwsRedshiftClusterVpcSecurityGroupToJson(
    AwsRedshiftClusterVpcSecurityGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', instance.status);
  writeNotNull('VpcSecurityGroupId', instance.vpcSecurityGroupId);
  return val;
}

AwsS3BucketDetails _$AwsS3BucketDetailsFromJson(Map<String, dynamic> json) {
  return AwsS3BucketDetails(
    createdAt: json['CreatedAt'] as String,
    ownerId: json['OwnerId'] as String,
    ownerName: json['OwnerName'] as String,
    serverSideEncryptionConfiguration:
        json['ServerSideEncryptionConfiguration'] == null
            ? null
            : AwsS3BucketServerSideEncryptionConfiguration.fromJson(
                json['ServerSideEncryptionConfiguration']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsS3BucketDetailsToJson(AwsS3BucketDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatedAt', instance.createdAt);
  writeNotNull('OwnerId', instance.ownerId);
  writeNotNull('OwnerName', instance.ownerName);
  writeNotNull('ServerSideEncryptionConfiguration',
      instance.serverSideEncryptionConfiguration?.toJson());
  return val;
}

AwsS3BucketServerSideEncryptionByDefault
    _$AwsS3BucketServerSideEncryptionByDefaultFromJson(
        Map<String, dynamic> json) {
  return AwsS3BucketServerSideEncryptionByDefault(
    kMSMasterKeyID: json['KMSMasterKeyID'] as String,
    sSEAlgorithm: json['SSEAlgorithm'] as String,
  );
}

Map<String, dynamic> _$AwsS3BucketServerSideEncryptionByDefaultToJson(
    AwsS3BucketServerSideEncryptionByDefault instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KMSMasterKeyID', instance.kMSMasterKeyID);
  writeNotNull('SSEAlgorithm', instance.sSEAlgorithm);
  return val;
}

AwsS3BucketServerSideEncryptionConfiguration
    _$AwsS3BucketServerSideEncryptionConfigurationFromJson(
        Map<String, dynamic> json) {
  return AwsS3BucketServerSideEncryptionConfiguration(
    rules: (json['Rules'] as List)
        ?.map((e) => e == null
            ? null
            : AwsS3BucketServerSideEncryptionRule.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsS3BucketServerSideEncryptionConfigurationToJson(
    AwsS3BucketServerSideEncryptionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsS3BucketServerSideEncryptionRule
    _$AwsS3BucketServerSideEncryptionRuleFromJson(Map<String, dynamic> json) {
  return AwsS3BucketServerSideEncryptionRule(
    applyServerSideEncryptionByDefault:
        json['ApplyServerSideEncryptionByDefault'] == null
            ? null
            : AwsS3BucketServerSideEncryptionByDefault.fromJson(
                json['ApplyServerSideEncryptionByDefault']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsS3BucketServerSideEncryptionRuleToJson(
    AwsS3BucketServerSideEncryptionRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplyServerSideEncryptionByDefault',
      instance.applyServerSideEncryptionByDefault?.toJson());
  return val;
}

AwsS3ObjectDetails _$AwsS3ObjectDetailsFromJson(Map<String, dynamic> json) {
  return AwsS3ObjectDetails(
    contentType: json['ContentType'] as String,
    eTag: json['ETag'] as String,
    lastModified: json['LastModified'] as String,
    sSEKMSKeyId: json['SSEKMSKeyId'] as String,
    serverSideEncryption: json['ServerSideEncryption'] as String,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$AwsS3ObjectDetailsToJson(AwsS3ObjectDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContentType', instance.contentType);
  writeNotNull('ETag', instance.eTag);
  writeNotNull('LastModified', instance.lastModified);
  writeNotNull('SSEKMSKeyId', instance.sSEKMSKeyId);
  writeNotNull('ServerSideEncryption', instance.serverSideEncryption);
  writeNotNull('VersionId', instance.versionId);
  return val;
}

AwsSecretsManagerSecretDetails _$AwsSecretsManagerSecretDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsSecretsManagerSecretDetails(
    deleted: json['Deleted'] as bool,
    description: json['Description'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    name: json['Name'] as String,
    rotationEnabled: json['RotationEnabled'] as bool,
    rotationLambdaArn: json['RotationLambdaArn'] as String,
    rotationOccurredWithinFrequency:
        json['RotationOccurredWithinFrequency'] as bool,
    rotationRules: json['RotationRules'] == null
        ? null
        : AwsSecretsManagerSecretRotationRules.fromJson(
            json['RotationRules'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsSecretsManagerSecretDetailsToJson(
    AwsSecretsManagerSecretDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Deleted', instance.deleted);
  writeNotNull('Description', instance.description);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('Name', instance.name);
  writeNotNull('RotationEnabled', instance.rotationEnabled);
  writeNotNull('RotationLambdaArn', instance.rotationLambdaArn);
  writeNotNull('RotationOccurredWithinFrequency',
      instance.rotationOccurredWithinFrequency);
  writeNotNull('RotationRules', instance.rotationRules?.toJson());
  return val;
}

AwsSecretsManagerSecretRotationRules
    _$AwsSecretsManagerSecretRotationRulesFromJson(Map<String, dynamic> json) {
  return AwsSecretsManagerSecretRotationRules(
    automaticallyAfterDays: json['AutomaticallyAfterDays'] as int,
  );
}

Map<String, dynamic> _$AwsSecretsManagerSecretRotationRulesToJson(
    AwsSecretsManagerSecretRotationRules instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AutomaticallyAfterDays', instance.automaticallyAfterDays);
  return val;
}

AwsSecurityFinding _$AwsSecurityFindingFromJson(Map<String, dynamic> json) {
  return AwsSecurityFinding(
    awsAccountId: json['AwsAccountId'] as String,
    createdAt: json['CreatedAt'] as String,
    description: json['Description'] as String,
    generatorId: json['GeneratorId'] as String,
    id: json['Id'] as String,
    productArn: json['ProductArn'] as String,
    resources: (json['Resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    schemaVersion: json['SchemaVersion'] as String,
    severity: json['Severity'] == null
        ? null
        : Severity.fromJson(json['Severity'] as Map<String, dynamic>),
    title: json['Title'] as String,
    types: (json['Types'] as List)?.map((e) => e as String)?.toList(),
    updatedAt: json['UpdatedAt'] as String,
    compliance: json['Compliance'] == null
        ? null
        : Compliance.fromJson(json['Compliance'] as Map<String, dynamic>),
    confidence: json['Confidence'] as int,
    criticality: json['Criticality'] as int,
    firstObservedAt: json['FirstObservedAt'] as String,
    lastObservedAt: json['LastObservedAt'] as String,
    malware: (json['Malware'] as List)
        ?.map((e) =>
            e == null ? null : Malware.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    network: json['Network'] == null
        ? null
        : Network.fromJson(json['Network'] as Map<String, dynamic>),
    networkPath: (json['NetworkPath'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkPathComponent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    note: json['Note'] == null
        ? null
        : Note.fromJson(json['Note'] as Map<String, dynamic>),
    patchSummary: json['PatchSummary'] == null
        ? null
        : PatchSummary.fromJson(json['PatchSummary'] as Map<String, dynamic>),
    process: json['Process'] == null
        ? null
        : ProcessDetails.fromJson(json['Process'] as Map<String, dynamic>),
    productFields: (json['ProductFields'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    recordState:
        _$enumDecodeNullable(_$RecordStateEnumMap, json['RecordState']),
    relatedFindings: (json['RelatedFindings'] as List)
        ?.map((e) => e == null
            ? null
            : RelatedFinding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    remediation: json['Remediation'] == null
        ? null
        : Remediation.fromJson(json['Remediation'] as Map<String, dynamic>),
    sourceUrl: json['SourceUrl'] as String,
    threatIntelIndicators: (json['ThreatIntelIndicators'] as List)
        ?.map((e) => e == null
            ? null
            : ThreatIntelIndicator.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userDefinedFields: (json['UserDefinedFields'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    verificationState: _$enumDecodeNullable(
        _$VerificationStateEnumMap, json['VerificationState']),
    vulnerabilities: (json['Vulnerabilities'] as List)
        ?.map((e) => e == null
            ? null
            : Vulnerability.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    workflow: json['Workflow'] == null
        ? null
        : Workflow.fromJson(json['Workflow'] as Map<String, dynamic>),
    workflowState:
        _$enumDecodeNullable(_$WorkflowStateEnumMap, json['WorkflowState']),
  );
}

Map<String, dynamic> _$AwsSecurityFindingToJson(AwsSecurityFinding instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AwsAccountId', instance.awsAccountId);
  writeNotNull('CreatedAt', instance.createdAt);
  writeNotNull('Description', instance.description);
  writeNotNull('GeneratorId', instance.generatorId);
  writeNotNull('Id', instance.id);
  writeNotNull('ProductArn', instance.productArn);
  writeNotNull(
      'Resources', instance.resources?.map((e) => e?.toJson())?.toList());
  writeNotNull('SchemaVersion', instance.schemaVersion);
  writeNotNull('Severity', instance.severity?.toJson());
  writeNotNull('Title', instance.title);
  writeNotNull('Types', instance.types);
  writeNotNull('UpdatedAt', instance.updatedAt);
  writeNotNull('Compliance', instance.compliance?.toJson());
  writeNotNull('Confidence', instance.confidence);
  writeNotNull('Criticality', instance.criticality);
  writeNotNull('FirstObservedAt', instance.firstObservedAt);
  writeNotNull('LastObservedAt', instance.lastObservedAt);
  writeNotNull('Malware', instance.malware?.map((e) => e?.toJson())?.toList());
  writeNotNull('Network', instance.network?.toJson());
  writeNotNull(
      'NetworkPath', instance.networkPath?.map((e) => e?.toJson())?.toList());
  writeNotNull('Note', instance.note?.toJson());
  writeNotNull('PatchSummary', instance.patchSummary?.toJson());
  writeNotNull('Process', instance.process?.toJson());
  writeNotNull('ProductFields', instance.productFields);
  writeNotNull('RecordState', _$RecordStateEnumMap[instance.recordState]);
  writeNotNull('RelatedFindings',
      instance.relatedFindings?.map((e) => e?.toJson())?.toList());
  writeNotNull('Remediation', instance.remediation?.toJson());
  writeNotNull('SourceUrl', instance.sourceUrl);
  writeNotNull('ThreatIntelIndicators',
      instance.threatIntelIndicators?.map((e) => e?.toJson())?.toList());
  writeNotNull('UserDefinedFields', instance.userDefinedFields);
  writeNotNull('VerificationState',
      _$VerificationStateEnumMap[instance.verificationState]);
  writeNotNull('Vulnerabilities',
      instance.vulnerabilities?.map((e) => e?.toJson())?.toList());
  writeNotNull('Workflow', instance.workflow?.toJson());
  writeNotNull('WorkflowState', _$WorkflowStateEnumMap[instance.workflowState]);
  return val;
}

const _$RecordStateEnumMap = {
  RecordState.active: 'ACTIVE',
  RecordState.archived: 'ARCHIVED',
};

const _$VerificationStateEnumMap = {
  VerificationState.unknown: 'UNKNOWN',
  VerificationState.truePositive: 'TRUE_POSITIVE',
  VerificationState.falsePositive: 'FALSE_POSITIVE',
  VerificationState.benignPositive: 'BENIGN_POSITIVE',
};

const _$WorkflowStateEnumMap = {
  WorkflowState.$new: 'NEW',
  WorkflowState.assigned: 'ASSIGNED',
  WorkflowState.inProgress: 'IN_PROGRESS',
  WorkflowState.deferred: 'DEFERRED',
  WorkflowState.resolved: 'RESOLVED',
};

AwsSecurityFindingFilters _$AwsSecurityFindingFiltersFromJson(
    Map<String, dynamic> json) {
  return AwsSecurityFindingFilters(
    awsAccountId: (json['AwsAccountId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    companyName: (json['CompanyName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    complianceStatus: (json['ComplianceStatus'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    confidence: (json['Confidence'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: (json['CreatedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    criticality: (json['Criticality'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: (json['Description'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    firstObservedAt: (json['FirstObservedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    generatorId: (json['GeneratorId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: (json['Id'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    keyword: (json['Keyword'] as List)
        ?.map((e) => e == null
            ? null
            : KeywordFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastObservedAt: (json['LastObservedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    malwareName: (json['MalwareName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    malwarePath: (json['MalwarePath'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    malwareState: (json['MalwareState'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    malwareType: (json['MalwareType'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkDestinationDomain: (json['NetworkDestinationDomain'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkDestinationIpV4: (json['NetworkDestinationIpV4'] as List)
        ?.map((e) =>
            e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkDestinationIpV6: (json['NetworkDestinationIpV6'] as List)
        ?.map((e) =>
            e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkDestinationPort: (json['NetworkDestinationPort'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkDirection: (json['NetworkDirection'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkProtocol: (json['NetworkProtocol'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkSourceDomain: (json['NetworkSourceDomain'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkSourceIpV4: (json['NetworkSourceIpV4'] as List)
        ?.map((e) =>
            e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkSourceIpV6: (json['NetworkSourceIpV6'] as List)
        ?.map((e) =>
            e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkSourceMac: (json['NetworkSourceMac'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkSourcePort: (json['NetworkSourcePort'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    noteText: (json['NoteText'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    noteUpdatedAt: (json['NoteUpdatedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    noteUpdatedBy: (json['NoteUpdatedBy'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processLaunchedAt: (json['ProcessLaunchedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processName: (json['ProcessName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processParentPid: (json['ProcessParentPid'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processPath: (json['ProcessPath'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processPid: (json['ProcessPid'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processTerminatedAt: (json['ProcessTerminatedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productArn: (json['ProductArn'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productFields: (json['ProductFields'] as List)
        ?.map((e) =>
            e == null ? null : MapFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productName: (json['ProductName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recommendationText: (json['RecommendationText'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recordState: (json['RecordState'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    relatedFindingsId: (json['RelatedFindingsId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    relatedFindingsProductArn: (json['RelatedFindingsProductArn'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceIamInstanceProfileArn:
        (json['ResourceAwsEc2InstanceIamInstanceProfileArn'] as List)
            ?.map((e) => e == null
                ? null
                : StringFilter.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    resourceAwsEc2InstanceImageId: (json['ResourceAwsEc2InstanceImageId']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceIpV4Addresses:
        (json['ResourceAwsEc2InstanceIpV4Addresses'] as List)
            ?.map((e) =>
                e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    resourceAwsEc2InstanceIpV6Addresses:
        (json['ResourceAwsEc2InstanceIpV6Addresses'] as List)
            ?.map((e) =>
                e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    resourceAwsEc2InstanceKeyName: (json['ResourceAwsEc2InstanceKeyName']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceLaunchedAt: (json['ResourceAwsEc2InstanceLaunchedAt']
            as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceSubnetId: (json['ResourceAwsEc2InstanceSubnetId']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceType: (json['ResourceAwsEc2InstanceType'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceVpcId: (json['ResourceAwsEc2InstanceVpcId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsIamAccessKeyCreatedAt: (json['ResourceAwsIamAccessKeyCreatedAt']
            as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsIamAccessKeyStatus: (json['ResourceAwsIamAccessKeyStatus']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsIamAccessKeyUserName: (json['ResourceAwsIamAccessKeyUserName']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsS3BucketOwnerId: (json['ResourceAwsS3BucketOwnerId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsS3BucketOwnerName: (json['ResourceAwsS3BucketOwnerName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceContainerImageId: (json['ResourceContainerImageId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceContainerImageName: (json['ResourceContainerImageName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceContainerLaunchedAt: (json['ResourceContainerLaunchedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceContainerName: (json['ResourceContainerName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceDetailsOther: (json['ResourceDetailsOther'] as List)
        ?.map((e) =>
            e == null ? null : MapFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceId: (json['ResourceId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourcePartition: (json['ResourcePartition'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceRegion: (json['ResourceRegion'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceTags: (json['ResourceTags'] as List)
        ?.map((e) =>
            e == null ? null : MapFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceType: (json['ResourceType'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    severityLabel: (json['SeverityLabel'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    severityNormalized: (json['SeverityNormalized'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    severityProduct: (json['SeverityProduct'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceUrl: (json['SourceUrl'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    threatIntelIndicatorCategory: (json['ThreatIntelIndicatorCategory'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    threatIntelIndicatorLastObservedAt:
        (json['ThreatIntelIndicatorLastObservedAt'] as List)
            ?.map((e) => e == null
                ? null
                : DateFilter.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    threatIntelIndicatorSource: (json['ThreatIntelIndicatorSource'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    threatIntelIndicatorSourceUrl: (json['ThreatIntelIndicatorSourceUrl']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    threatIntelIndicatorType: (json['ThreatIntelIndicatorType'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    threatIntelIndicatorValue: (json['ThreatIntelIndicatorValue'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: (json['Title'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: (json['Type'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    updatedAt: (json['UpdatedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userDefinedFields: (json['UserDefinedFields'] as List)
        ?.map((e) =>
            e == null ? null : MapFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    verificationState: (json['VerificationState'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    workflowState: (json['WorkflowState'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    workflowStatus: (json['WorkflowStatus'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsSecurityFindingFiltersToJson(
    AwsSecurityFindingFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AwsAccountId', instance.awsAccountId?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'CompanyName', instance.companyName?.map((e) => e?.toJson())?.toList());
  writeNotNull('ComplianceStatus',
      instance.complianceStatus?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Confidence', instance.confidence?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'CreatedAt', instance.createdAt?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Criticality', instance.criticality?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Description', instance.description?.map((e) => e?.toJson())?.toList());
  writeNotNull('FirstObservedAt',
      instance.firstObservedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'GeneratorId', instance.generatorId?.map((e) => e?.toJson())?.toList());
  writeNotNull('Id', instance.id?.map((e) => e?.toJson())?.toList());
  writeNotNull('Keyword', instance.keyword?.map((e) => e?.toJson())?.toList());
  writeNotNull('LastObservedAt',
      instance.lastObservedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'MalwareName', instance.malwareName?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'MalwarePath', instance.malwarePath?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'MalwareState', instance.malwareState?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'MalwareType', instance.malwareType?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkDestinationDomain',
      instance.networkDestinationDomain?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkDestinationIpV4',
      instance.networkDestinationIpV4?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkDestinationIpV6',
      instance.networkDestinationIpV6?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkDestinationPort',
      instance.networkDestinationPort?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkDirection',
      instance.networkDirection?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkProtocol',
      instance.networkProtocol?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkSourceDomain',
      instance.networkSourceDomain?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkSourceIpV4',
      instance.networkSourceIpV4?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkSourceIpV6',
      instance.networkSourceIpV6?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkSourceMac',
      instance.networkSourceMac?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkSourcePort',
      instance.networkSourcePort?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'NoteText', instance.noteText?.map((e) => e?.toJson())?.toList());
  writeNotNull('NoteUpdatedAt',
      instance.noteUpdatedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull('NoteUpdatedBy',
      instance.noteUpdatedBy?.map((e) => e?.toJson())?.toList());
  writeNotNull('ProcessLaunchedAt',
      instance.processLaunchedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProcessName', instance.processName?.map((e) => e?.toJson())?.toList());
  writeNotNull('ProcessParentPid',
      instance.processParentPid?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProcessPath', instance.processPath?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProcessPid', instance.processPid?.map((e) => e?.toJson())?.toList());
  writeNotNull('ProcessTerminatedAt',
      instance.processTerminatedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProductArn', instance.productArn?.map((e) => e?.toJson())?.toList());
  writeNotNull('ProductFields',
      instance.productFields?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProductName', instance.productName?.map((e) => e?.toJson())?.toList());
  writeNotNull('RecommendationText',
      instance.recommendationText?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'RecordState', instance.recordState?.map((e) => e?.toJson())?.toList());
  writeNotNull('RelatedFindingsId',
      instance.relatedFindingsId?.map((e) => e?.toJson())?.toList());
  writeNotNull('RelatedFindingsProductArn',
      instance.relatedFindingsProductArn?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceIamInstanceProfileArn',
      instance.resourceAwsEc2InstanceIamInstanceProfileArn
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceImageId',
      instance.resourceAwsEc2InstanceImageId
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceIpV4Addresses',
      instance.resourceAwsEc2InstanceIpV4Addresses
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceIpV6Addresses',
      instance.resourceAwsEc2InstanceIpV6Addresses
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceKeyName',
      instance.resourceAwsEc2InstanceKeyName
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceLaunchedAt',
      instance.resourceAwsEc2InstanceLaunchedAt
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceSubnetId',
      instance.resourceAwsEc2InstanceSubnetId
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('ResourceAwsEc2InstanceType',
      instance.resourceAwsEc2InstanceType?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceAwsEc2InstanceVpcId',
      instance.resourceAwsEc2InstanceVpcId?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ResourceAwsIamAccessKeyCreatedAt',
      instance.resourceAwsIamAccessKeyCreatedAt
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsIamAccessKeyStatus',
      instance.resourceAwsIamAccessKeyStatus
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsIamAccessKeyUserName',
      instance.resourceAwsIamAccessKeyUserName
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('ResourceAwsS3BucketOwnerId',
      instance.resourceAwsS3BucketOwnerId?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceAwsS3BucketOwnerName',
      instance.resourceAwsS3BucketOwnerName?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceContainerImageId',
      instance.resourceContainerImageId?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceContainerImageName',
      instance.resourceContainerImageName?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceContainerLaunchedAt',
      instance.resourceContainerLaunchedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceContainerName',
      instance.resourceContainerName?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceDetailsOther',
      instance.resourceDetailsOther?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ResourceId', instance.resourceId?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourcePartition',
      instance.resourcePartition?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceRegion',
      instance.resourceRegion?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ResourceTags', instance.resourceTags?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ResourceType', instance.resourceType?.map((e) => e?.toJson())?.toList());
  writeNotNull('SeverityLabel',
      instance.severityLabel?.map((e) => e?.toJson())?.toList());
  writeNotNull('SeverityNormalized',
      instance.severityNormalized?.map((e) => e?.toJson())?.toList());
  writeNotNull('SeverityProduct',
      instance.severityProduct?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'SourceUrl', instance.sourceUrl?.map((e) => e?.toJson())?.toList());
  writeNotNull('ThreatIntelIndicatorCategory',
      instance.threatIntelIndicatorCategory?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ThreatIntelIndicatorLastObservedAt',
      instance.threatIntelIndicatorLastObservedAt
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('ThreatIntelIndicatorSource',
      instance.threatIntelIndicatorSource?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ThreatIntelIndicatorSourceUrl',
      instance.threatIntelIndicatorSourceUrl
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('ThreatIntelIndicatorType',
      instance.threatIntelIndicatorType?.map((e) => e?.toJson())?.toList());
  writeNotNull('ThreatIntelIndicatorValue',
      instance.threatIntelIndicatorValue?.map((e) => e?.toJson())?.toList());
  writeNotNull('Title', instance.title?.map((e) => e?.toJson())?.toList());
  writeNotNull('Type', instance.type?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'UpdatedAt', instance.updatedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull('UserDefinedFields',
      instance.userDefinedFields?.map((e) => e?.toJson())?.toList());
  writeNotNull('VerificationState',
      instance.verificationState?.map((e) => e?.toJson())?.toList());
  writeNotNull('WorkflowState',
      instance.workflowState?.map((e) => e?.toJson())?.toList());
  writeNotNull('WorkflowStatus',
      instance.workflowStatus?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsSecurityFindingIdentifier _$AwsSecurityFindingIdentifierFromJson(
    Map<String, dynamic> json) {
  return AwsSecurityFindingIdentifier(
    id: json['Id'] as String,
    productArn: json['ProductArn'] as String,
  );
}

Map<String, dynamic> _$AwsSecurityFindingIdentifierToJson(
    AwsSecurityFindingIdentifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('ProductArn', instance.productArn);
  return val;
}

AwsSnsTopicDetails _$AwsSnsTopicDetailsFromJson(Map<String, dynamic> json) {
  return AwsSnsTopicDetails(
    kmsMasterKeyId: json['KmsMasterKeyId'] as String,
    owner: json['Owner'] as String,
    subscription: (json['Subscription'] as List)
        ?.map((e) => e == null
            ? null
            : AwsSnsTopicSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    topicName: json['TopicName'] as String,
  );
}

Map<String, dynamic> _$AwsSnsTopicDetailsToJson(AwsSnsTopicDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsMasterKeyId', instance.kmsMasterKeyId);
  writeNotNull('Owner', instance.owner);
  writeNotNull(
      'Subscription', instance.subscription?.map((e) => e?.toJson())?.toList());
  writeNotNull('TopicName', instance.topicName);
  return val;
}

AwsSnsTopicSubscription _$AwsSnsTopicSubscriptionFromJson(
    Map<String, dynamic> json) {
  return AwsSnsTopicSubscription(
    endpoint: json['Endpoint'] as String,
    protocol: json['Protocol'] as String,
  );
}

Map<String, dynamic> _$AwsSnsTopicSubscriptionToJson(
    AwsSnsTopicSubscription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Endpoint', instance.endpoint);
  writeNotNull('Protocol', instance.protocol);
  return val;
}

AwsSqsQueueDetails _$AwsSqsQueueDetailsFromJson(Map<String, dynamic> json) {
  return AwsSqsQueueDetails(
    deadLetterTargetArn: json['DeadLetterTargetArn'] as String,
    kmsDataKeyReusePeriodSeconds: json['KmsDataKeyReusePeriodSeconds'] as int,
    kmsMasterKeyId: json['KmsMasterKeyId'] as String,
    queueName: json['QueueName'] as String,
  );
}

Map<String, dynamic> _$AwsSqsQueueDetailsToJson(AwsSqsQueueDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeadLetterTargetArn', instance.deadLetterTargetArn);
  writeNotNull(
      'KmsDataKeyReusePeriodSeconds', instance.kmsDataKeyReusePeriodSeconds);
  writeNotNull('KmsMasterKeyId', instance.kmsMasterKeyId);
  writeNotNull('QueueName', instance.queueName);
  return val;
}

AwsWafWebAclDetails _$AwsWafWebAclDetailsFromJson(Map<String, dynamic> json) {
  return AwsWafWebAclDetails(
    defaultAction: json['DefaultAction'] as String,
    name: json['Name'] as String,
    rules: (json['Rules'] as List)
        ?.map((e) => e == null
            ? null
            : AwsWafWebAclRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    webAclId: json['WebAclId'] as String,
  );
}

Map<String, dynamic> _$AwsWafWebAclDetailsToJson(AwsWafWebAclDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultAction', instance.defaultAction);
  writeNotNull('Name', instance.name);
  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  writeNotNull('WebAclId', instance.webAclId);
  return val;
}

AwsWafWebAclRule _$AwsWafWebAclRuleFromJson(Map<String, dynamic> json) {
  return AwsWafWebAclRule(
    action: json['Action'] == null
        ? null
        : WafAction.fromJson(json['Action'] as Map<String, dynamic>),
    excludedRules: (json['ExcludedRules'] as List)
        ?.map((e) => e == null
            ? null
            : WafExcludedRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    overrideAction: json['OverrideAction'] == null
        ? null
        : WafOverrideAction.fromJson(
            json['OverrideAction'] as Map<String, dynamic>),
    priority: json['Priority'] as int,
    ruleId: json['RuleId'] as String,
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$AwsWafWebAclRuleToJson(AwsWafWebAclRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', instance.action?.toJson());
  writeNotNull('ExcludedRules',
      instance.excludedRules?.map((e) => e?.toJson())?.toList());
  writeNotNull('OverrideAction', instance.overrideAction?.toJson());
  writeNotNull('Priority', instance.priority);
  writeNotNull('RuleId', instance.ruleId);
  writeNotNull('Type', instance.type);
  return val;
}

BatchDisableStandardsResponse _$BatchDisableStandardsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDisableStandardsResponse(
    standardsSubscriptions: (json['StandardsSubscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : StandardsSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchEnableStandardsResponse _$BatchEnableStandardsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchEnableStandardsResponse(
    standardsSubscriptions: (json['StandardsSubscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : StandardsSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchImportFindingsResponse _$BatchImportFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchImportFindingsResponse(
    failedCount: json['FailedCount'] as int,
    successCount: json['SuccessCount'] as int,
    failedFindings: (json['FailedFindings'] as List)
        ?.map((e) => e == null
            ? null
            : ImportFindingsError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchUpdateFindingsResponse _$BatchUpdateFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateFindingsResponse(
    processedFindings: (json['ProcessedFindings'] as List)
        ?.map((e) => e == null
            ? null
            : AwsSecurityFindingIdentifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedFindings: (json['UnprocessedFindings'] as List)
        ?.map((e) => e == null
            ? null
            : BatchUpdateFindingsUnprocessedFinding.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchUpdateFindingsUnprocessedFinding
    _$BatchUpdateFindingsUnprocessedFindingFromJson(Map<String, dynamic> json) {
  return BatchUpdateFindingsUnprocessedFinding(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    findingIdentifier: json['FindingIdentifier'] == null
        ? null
        : AwsSecurityFindingIdentifier.fromJson(
            json['FindingIdentifier'] as Map<String, dynamic>),
  );
}

CidrBlockAssociation _$CidrBlockAssociationFromJson(Map<String, dynamic> json) {
  return CidrBlockAssociation(
    associationId: json['AssociationId'] as String,
    cidrBlock: json['CidrBlock'] as String,
    cidrBlockState: json['CidrBlockState'] as String,
  );
}

Map<String, dynamic> _$CidrBlockAssociationToJson(
    CidrBlockAssociation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssociationId', instance.associationId);
  writeNotNull('CidrBlock', instance.cidrBlock);
  writeNotNull('CidrBlockState', instance.cidrBlockState);
  return val;
}

Compliance _$ComplianceFromJson(Map<String, dynamic> json) {
  return Compliance(
    relatedRequirements: (json['RelatedRequirements'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    status: _$enumDecodeNullable(_$ComplianceStatusEnumMap, json['Status']),
    statusReasons: (json['StatusReasons'] as List)
        ?.map((e) =>
            e == null ? null : StatusReason.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ComplianceToJson(Compliance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RelatedRequirements', instance.relatedRequirements);
  writeNotNull('Status', _$ComplianceStatusEnumMap[instance.status]);
  writeNotNull('StatusReasons',
      instance.statusReasons?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ComplianceStatusEnumMap = {
  ComplianceStatus.passed: 'PASSED',
  ComplianceStatus.warning: 'WARNING',
  ComplianceStatus.failed: 'FAILED',
  ComplianceStatus.notAvailable: 'NOT_AVAILABLE',
};

ContainerDetails _$ContainerDetailsFromJson(Map<String, dynamic> json) {
  return ContainerDetails(
    imageId: json['ImageId'] as String,
    imageName: json['ImageName'] as String,
    launchedAt: json['LaunchedAt'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ContainerDetailsToJson(ContainerDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ImageId', instance.imageId);
  writeNotNull('ImageName', instance.imageName);
  writeNotNull('LaunchedAt', instance.launchedAt);
  writeNotNull('Name', instance.name);
  return val;
}

CreateActionTargetResponse _$CreateActionTargetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateActionTargetResponse(
    actionTargetArn: json['ActionTargetArn'] as String,
  );
}

CreateInsightResponse _$CreateInsightResponseFromJson(
    Map<String, dynamic> json) {
  return CreateInsightResponse(
    insightArn: json['InsightArn'] as String,
  );
}

CreateMembersResponse _$CreateMembersResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMembersResponse(
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Cvss _$CvssFromJson(Map<String, dynamic> json) {
  return Cvss(
    baseScore: (json['BaseScore'] as num)?.toDouble(),
    baseVector: json['BaseVector'] as String,
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$CvssToJson(Cvss instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaseScore', instance.baseScore);
  writeNotNull('BaseVector', instance.baseVector);
  writeNotNull('Version', instance.version);
  return val;
}

DateFilter _$DateFilterFromJson(Map<String, dynamic> json) {
  return DateFilter(
    dateRange: json['DateRange'] == null
        ? null
        : DateRange.fromJson(json['DateRange'] as Map<String, dynamic>),
    end: json['End'] as String,
    start: json['Start'] as String,
  );
}

Map<String, dynamic> _$DateFilterToJson(DateFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DateRange', instance.dateRange?.toJson());
  writeNotNull('End', instance.end);
  writeNotNull('Start', instance.start);
  return val;
}

DateRange _$DateRangeFromJson(Map<String, dynamic> json) {
  return DateRange(
    unit: _$enumDecodeNullable(_$DateRangeUnitEnumMap, json['Unit']),
    value: json['Value'] as int,
  );
}

Map<String, dynamic> _$DateRangeToJson(DateRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Unit', _$DateRangeUnitEnumMap[instance.unit]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$DateRangeUnitEnumMap = {
  DateRangeUnit.days: 'DAYS',
};

DeclineInvitationsResponse _$DeclineInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return DeclineInvitationsResponse(
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteActionTargetResponse _$DeleteActionTargetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteActionTargetResponse(
    actionTargetArn: json['ActionTargetArn'] as String,
  );
}

DeleteInsightResponse _$DeleteInsightResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteInsightResponse(
    insightArn: json['InsightArn'] as String,
  );
}

DeleteInvitationsResponse _$DeleteInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteInvitationsResponse(
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteMembersResponse _$DeleteMembersResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteMembersResponse(
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeActionTargetsResponse _$DescribeActionTargetsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeActionTargetsResponse(
    actionTargets: (json['ActionTargets'] as List)
        ?.map((e) =>
            e == null ? null : ActionTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeHubResponse _$DescribeHubResponseFromJson(Map<String, dynamic> json) {
  return DescribeHubResponse(
    autoEnableControls: json['AutoEnableControls'] as bool,
    hubArn: json['HubArn'] as String,
    subscribedAt: json['SubscribedAt'] as String,
  );
}

DescribeOrganizationConfigurationResponse
    _$DescribeOrganizationConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeOrganizationConfigurationResponse(
    autoEnable: json['AutoEnable'] as bool,
    memberAccountLimitReached: json['MemberAccountLimitReached'] as bool,
  );
}

DescribeProductsResponse _$DescribeProductsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProductsResponse(
    products: (json['Products'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeStandardsControlsResponse _$DescribeStandardsControlsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeStandardsControlsResponse(
    controls: (json['Controls'] as List)
        ?.map((e) => e == null
            ? null
            : StandardsControl.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeStandardsResponse _$DescribeStandardsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeStandardsResponse(
    nextToken: json['NextToken'] as String,
    standards: (json['Standards'] as List)
        ?.map((e) =>
            e == null ? null : Standard.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DisableImportFindingsForProductResponse
    _$DisableImportFindingsForProductResponseFromJson(
        Map<String, dynamic> json) {
  return DisableImportFindingsForProductResponse();
}

DisableOrganizationAdminAccountResponse
    _$DisableOrganizationAdminAccountResponseFromJson(
        Map<String, dynamic> json) {
  return DisableOrganizationAdminAccountResponse();
}

DisableSecurityHubResponse _$DisableSecurityHubResponseFromJson(
    Map<String, dynamic> json) {
  return DisableSecurityHubResponse();
}

DisassociateFromMasterAccountResponse
    _$DisassociateFromMasterAccountResponseFromJson(Map<String, dynamic> json) {
  return DisassociateFromMasterAccountResponse();
}

DisassociateMembersResponse _$DisassociateMembersResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateMembersResponse();
}

EnableImportFindingsForProductResponse
    _$EnableImportFindingsForProductResponseFromJson(
        Map<String, dynamic> json) {
  return EnableImportFindingsForProductResponse(
    productSubscriptionArn: json['ProductSubscriptionArn'] as String,
  );
}

EnableOrganizationAdminAccountResponse
    _$EnableOrganizationAdminAccountResponseFromJson(
        Map<String, dynamic> json) {
  return EnableOrganizationAdminAccountResponse();
}

EnableSecurityHubResponse _$EnableSecurityHubResponseFromJson(
    Map<String, dynamic> json) {
  return EnableSecurityHubResponse();
}

GetEnabledStandardsResponse _$GetEnabledStandardsResponseFromJson(
    Map<String, dynamic> json) {
  return GetEnabledStandardsResponse(
    nextToken: json['NextToken'] as String,
    standardsSubscriptions: (json['StandardsSubscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : StandardsSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetFindingsResponse _$GetFindingsResponseFromJson(Map<String, dynamic> json) {
  return GetFindingsResponse(
    findings: (json['Findings'] as List)
        ?.map((e) => e == null
            ? null
            : AwsSecurityFinding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetInsightResultsResponse _$GetInsightResultsResponseFromJson(
    Map<String, dynamic> json) {
  return GetInsightResultsResponse(
    insightResults: json['InsightResults'] == null
        ? null
        : InsightResults.fromJson(
            json['InsightResults'] as Map<String, dynamic>),
  );
}

GetInsightsResponse _$GetInsightsResponseFromJson(Map<String, dynamic> json) {
  return GetInsightsResponse(
    insights: (json['Insights'] as List)
        ?.map((e) =>
            e == null ? null : Insight.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetInvitationsCountResponse _$GetInvitationsCountResponseFromJson(
    Map<String, dynamic> json) {
  return GetInvitationsCountResponse(
    invitationsCount: json['InvitationsCount'] as int,
  );
}

GetMasterAccountResponse _$GetMasterAccountResponseFromJson(
    Map<String, dynamic> json) {
  return GetMasterAccountResponse(
    master: json['Master'] == null
        ? null
        : Invitation.fromJson(json['Master'] as Map<String, dynamic>),
  );
}

GetMembersResponse _$GetMembersResponseFromJson(Map<String, dynamic> json) {
  return GetMembersResponse(
    members: (json['Members'] as List)
        ?.map((e) =>
            e == null ? null : Member.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ImportFindingsError _$ImportFindingsErrorFromJson(Map<String, dynamic> json) {
  return ImportFindingsError(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    id: json['Id'] as String,
  );
}

Insight _$InsightFromJson(Map<String, dynamic> json) {
  return Insight(
    filters: json['Filters'] == null
        ? null
        : AwsSecurityFindingFilters.fromJson(
            json['Filters'] as Map<String, dynamic>),
    groupByAttribute: json['GroupByAttribute'] as String,
    insightArn: json['InsightArn'] as String,
    name: json['Name'] as String,
  );
}

InsightResultValue _$InsightResultValueFromJson(Map<String, dynamic> json) {
  return InsightResultValue(
    count: json['Count'] as int,
    groupByAttributeValue: json['GroupByAttributeValue'] as String,
  );
}

InsightResults _$InsightResultsFromJson(Map<String, dynamic> json) {
  return InsightResults(
    groupByAttribute: json['GroupByAttribute'] as String,
    insightArn: json['InsightArn'] as String,
    resultValues: (json['ResultValues'] as List)
        ?.map((e) => e == null
            ? null
            : InsightResultValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Invitation _$InvitationFromJson(Map<String, dynamic> json) {
  return Invitation(
    accountId: json['AccountId'] as String,
    invitationId: json['InvitationId'] as String,
    invitedAt: const IsoDateTimeConverter().fromJson(json['InvitedAt']),
    memberStatus: json['MemberStatus'] as String,
  );
}

InviteMembersResponse _$InviteMembersResponseFromJson(
    Map<String, dynamic> json) {
  return InviteMembersResponse(
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

IpFilter _$IpFilterFromJson(Map<String, dynamic> json) {
  return IpFilter(
    cidr: json['Cidr'] as String,
  );
}

Map<String, dynamic> _$IpFilterToJson(IpFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cidr', instance.cidr);
  return val;
}

Ipv6CidrBlockAssociation _$Ipv6CidrBlockAssociationFromJson(
    Map<String, dynamic> json) {
  return Ipv6CidrBlockAssociation(
    associationId: json['AssociationId'] as String,
    cidrBlockState: json['CidrBlockState'] as String,
    ipv6CidrBlock: json['Ipv6CidrBlock'] as String,
  );
}

Map<String, dynamic> _$Ipv6CidrBlockAssociationToJson(
    Ipv6CidrBlockAssociation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssociationId', instance.associationId);
  writeNotNull('CidrBlockState', instance.cidrBlockState);
  writeNotNull('Ipv6CidrBlock', instance.ipv6CidrBlock);
  return val;
}

KeywordFilter _$KeywordFilterFromJson(Map<String, dynamic> json) {
  return KeywordFilter(
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$KeywordFilterToJson(KeywordFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', instance.value);
  return val;
}

ListEnabledProductsForImportResponse
    _$ListEnabledProductsForImportResponseFromJson(Map<String, dynamic> json) {
  return ListEnabledProductsForImportResponse(
    nextToken: json['NextToken'] as String,
    productSubscriptions: (json['ProductSubscriptions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

ListInvitationsResponse _$ListInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListInvitationsResponse(
    invitations: (json['Invitations'] as List)
        ?.map((e) =>
            e == null ? null : Invitation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMembersResponse _$ListMembersResponseFromJson(Map<String, dynamic> json) {
  return ListMembersResponse(
    members: (json['Members'] as List)
        ?.map((e) =>
            e == null ? null : Member.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListOrganizationAdminAccountsResponse
    _$ListOrganizationAdminAccountsResponseFromJson(Map<String, dynamic> json) {
  return ListOrganizationAdminAccountsResponse(
    adminAccounts: (json['AdminAccounts'] as List)
        ?.map((e) =>
            e == null ? null : AdminAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

LoadBalancerState _$LoadBalancerStateFromJson(Map<String, dynamic> json) {
  return LoadBalancerState(
    code: json['Code'] as String,
    reason: json['Reason'] as String,
  );
}

Map<String, dynamic> _$LoadBalancerStateToJson(LoadBalancerState instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Code', instance.code);
  writeNotNull('Reason', instance.reason);
  return val;
}

Malware _$MalwareFromJson(Map<String, dynamic> json) {
  return Malware(
    name: json['Name'] as String,
    path: json['Path'] as String,
    state: _$enumDecodeNullable(_$MalwareStateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$MalwareTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$MalwareToJson(Malware instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Path', instance.path);
  writeNotNull('State', _$MalwareStateEnumMap[instance.state]);
  writeNotNull('Type', _$MalwareTypeEnumMap[instance.type]);
  return val;
}

const _$MalwareStateEnumMap = {
  MalwareState.observed: 'OBSERVED',
  MalwareState.removalFailed: 'REMOVAL_FAILED',
  MalwareState.removed: 'REMOVED',
};

const _$MalwareTypeEnumMap = {
  MalwareType.adware: 'ADWARE',
  MalwareType.blendedThreat: 'BLENDED_THREAT',
  MalwareType.botnetAgent: 'BOTNET_AGENT',
  MalwareType.coinMiner: 'COIN_MINER',
  MalwareType.exploitKit: 'EXPLOIT_KIT',
  MalwareType.keylogger: 'KEYLOGGER',
  MalwareType.macro: 'MACRO',
  MalwareType.potentiallyUnwanted: 'POTENTIALLY_UNWANTED',
  MalwareType.spyware: 'SPYWARE',
  MalwareType.ransomware: 'RANSOMWARE',
  MalwareType.remoteAccess: 'REMOTE_ACCESS',
  MalwareType.rootkit: 'ROOTKIT',
  MalwareType.trojan: 'TROJAN',
  MalwareType.virus: 'VIRUS',
  MalwareType.worm: 'WORM',
};

MapFilter _$MapFilterFromJson(Map<String, dynamic> json) {
  return MapFilter(
    comparison:
        _$enumDecodeNullable(_$MapFilterComparisonEnumMap, json['Comparison']),
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$MapFilterToJson(MapFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Comparison', _$MapFilterComparisonEnumMap[instance.comparison]);
  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

const _$MapFilterComparisonEnumMap = {
  MapFilterComparison.equals: 'EQUALS',
  MapFilterComparison.notEquals: 'NOT_EQUALS',
};

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    accountId: json['AccountId'] as String,
    email: json['Email'] as String,
    invitedAt: const IsoDateTimeConverter().fromJson(json['InvitedAt']),
    masterId: json['MasterId'] as String,
    memberStatus: json['MemberStatus'] as String,
    updatedAt: const IsoDateTimeConverter().fromJson(json['UpdatedAt']),
  );
}

Network _$NetworkFromJson(Map<String, dynamic> json) {
  return Network(
    destinationDomain: json['DestinationDomain'] as String,
    destinationIpV4: json['DestinationIpV4'] as String,
    destinationIpV6: json['DestinationIpV6'] as String,
    destinationPort: json['DestinationPort'] as int,
    direction:
        _$enumDecodeNullable(_$NetworkDirectionEnumMap, json['Direction']),
    openPortRange: json['OpenPortRange'] == null
        ? null
        : PortRange.fromJson(json['OpenPortRange'] as Map<String, dynamic>),
    protocol: json['Protocol'] as String,
    sourceDomain: json['SourceDomain'] as String,
    sourceIpV4: json['SourceIpV4'] as String,
    sourceIpV6: json['SourceIpV6'] as String,
    sourceMac: json['SourceMac'] as String,
    sourcePort: json['SourcePort'] as int,
  );
}

Map<String, dynamic> _$NetworkToJson(Network instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationDomain', instance.destinationDomain);
  writeNotNull('DestinationIpV4', instance.destinationIpV4);
  writeNotNull('DestinationIpV6', instance.destinationIpV6);
  writeNotNull('DestinationPort', instance.destinationPort);
  writeNotNull('Direction', _$NetworkDirectionEnumMap[instance.direction]);
  writeNotNull('OpenPortRange', instance.openPortRange?.toJson());
  writeNotNull('Protocol', instance.protocol);
  writeNotNull('SourceDomain', instance.sourceDomain);
  writeNotNull('SourceIpV4', instance.sourceIpV4);
  writeNotNull('SourceIpV6', instance.sourceIpV6);
  writeNotNull('SourceMac', instance.sourceMac);
  writeNotNull('SourcePort', instance.sourcePort);
  return val;
}

const _$NetworkDirectionEnumMap = {
  NetworkDirection.$in: 'IN',
  NetworkDirection.out: 'OUT',
};

NetworkHeader _$NetworkHeaderFromJson(Map<String, dynamic> json) {
  return NetworkHeader(
    destination: json['Destination'] == null
        ? null
        : NetworkPathComponentDetails.fromJson(
            json['Destination'] as Map<String, dynamic>),
    protocol: json['Protocol'] as String,
    source: json['Source'] == null
        ? null
        : NetworkPathComponentDetails.fromJson(
            json['Source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkHeaderToJson(NetworkHeader instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Destination', instance.destination?.toJson());
  writeNotNull('Protocol', instance.protocol);
  writeNotNull('Source', instance.source?.toJson());
  return val;
}

NetworkPathComponent _$NetworkPathComponentFromJson(Map<String, dynamic> json) {
  return NetworkPathComponent(
    componentId: json['ComponentId'] as String,
    componentType: json['ComponentType'] as String,
    egress: json['Egress'] == null
        ? null
        : NetworkHeader.fromJson(json['Egress'] as Map<String, dynamic>),
    ingress: json['Ingress'] == null
        ? null
        : NetworkHeader.fromJson(json['Ingress'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkPathComponentToJson(
    NetworkPathComponent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComponentId', instance.componentId);
  writeNotNull('ComponentType', instance.componentType);
  writeNotNull('Egress', instance.egress?.toJson());
  writeNotNull('Ingress', instance.ingress?.toJson());
  return val;
}

NetworkPathComponentDetails _$NetworkPathComponentDetailsFromJson(
    Map<String, dynamic> json) {
  return NetworkPathComponentDetails(
    address: (json['Address'] as List)?.map((e) => e as String)?.toList(),
    portRanges: (json['PortRanges'] as List)
        ?.map((e) =>
            e == null ? null : PortRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NetworkPathComponentDetailsToJson(
    NetworkPathComponentDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  writeNotNull(
      'PortRanges', instance.portRanges?.map((e) => e?.toJson())?.toList());
  return val;
}

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    text: json['Text'] as String,
    updatedAt: json['UpdatedAt'] as String,
    updatedBy: json['UpdatedBy'] as String,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Text', instance.text);
  writeNotNull('UpdatedAt', instance.updatedAt);
  writeNotNull('UpdatedBy', instance.updatedBy);
  return val;
}

Map<String, dynamic> _$NoteUpdateToJson(NoteUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Text', instance.text);
  writeNotNull('UpdatedBy', instance.updatedBy);
  return val;
}

NumberFilter _$NumberFilterFromJson(Map<String, dynamic> json) {
  return NumberFilter(
    eq: (json['Eq'] as num)?.toDouble(),
    gte: (json['Gte'] as num)?.toDouble(),
    lte: (json['Lte'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$NumberFilterToJson(NumberFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Eq', instance.eq);
  writeNotNull('Gte', instance.gte);
  writeNotNull('Lte', instance.lte);
  return val;
}

PatchSummary _$PatchSummaryFromJson(Map<String, dynamic> json) {
  return PatchSummary(
    id: json['Id'] as String,
    failedCount: json['FailedCount'] as int,
    installedCount: json['InstalledCount'] as int,
    installedOtherCount: json['InstalledOtherCount'] as int,
    installedPendingReboot: json['InstalledPendingReboot'] as int,
    installedRejectedCount: json['InstalledRejectedCount'] as int,
    missingCount: json['MissingCount'] as int,
    operation: json['Operation'] as String,
    operationEndTime: json['OperationEndTime'] as String,
    operationStartTime: json['OperationStartTime'] as String,
    rebootOption: json['RebootOption'] as String,
  );
}

Map<String, dynamic> _$PatchSummaryToJson(PatchSummary instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('FailedCount', instance.failedCount);
  writeNotNull('InstalledCount', instance.installedCount);
  writeNotNull('InstalledOtherCount', instance.installedOtherCount);
  writeNotNull('InstalledPendingReboot', instance.installedPendingReboot);
  writeNotNull('InstalledRejectedCount', instance.installedRejectedCount);
  writeNotNull('MissingCount', instance.missingCount);
  writeNotNull('Operation', instance.operation);
  writeNotNull('OperationEndTime', instance.operationEndTime);
  writeNotNull('OperationStartTime', instance.operationStartTime);
  writeNotNull('RebootOption', instance.rebootOption);
  return val;
}

PortRange _$PortRangeFromJson(Map<String, dynamic> json) {
  return PortRange(
    begin: json['Begin'] as int,
    end: json['End'] as int,
  );
}

Map<String, dynamic> _$PortRangeToJson(PortRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Begin', instance.begin);
  writeNotNull('End', instance.end);
  return val;
}

ProcessDetails _$ProcessDetailsFromJson(Map<String, dynamic> json) {
  return ProcessDetails(
    launchedAt: json['LaunchedAt'] as String,
    name: json['Name'] as String,
    parentPid: json['ParentPid'] as int,
    path: json['Path'] as String,
    pid: json['Pid'] as int,
    terminatedAt: json['TerminatedAt'] as String,
  );
}

Map<String, dynamic> _$ProcessDetailsToJson(ProcessDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LaunchedAt', instance.launchedAt);
  writeNotNull('Name', instance.name);
  writeNotNull('ParentPid', instance.parentPid);
  writeNotNull('Path', instance.path);
  writeNotNull('Pid', instance.pid);
  writeNotNull('TerminatedAt', instance.terminatedAt);
  return val;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    productArn: json['ProductArn'] as String,
    activationUrl: json['ActivationUrl'] as String,
    categories: (json['Categories'] as List)?.map((e) => e as String)?.toList(),
    companyName: json['CompanyName'] as String,
    description: json['Description'] as String,
    integrationTypes: (json['IntegrationTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$IntegrationTypeEnumMap, e))
        ?.toList(),
    marketplaceUrl: json['MarketplaceUrl'] as String,
    productName: json['ProductName'] as String,
    productSubscriptionResourcePolicy:
        json['ProductSubscriptionResourcePolicy'] as String,
  );
}

const _$IntegrationTypeEnumMap = {
  IntegrationType.sendFindingsToSecurityHub: 'SEND_FINDINGS_TO_SECURITY_HUB',
  IntegrationType.receiveFindingsFromSecurityHub:
      'RECEIVE_FINDINGS_FROM_SECURITY_HUB',
};

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) {
  return Recommendation(
    text: json['Text'] as String,
    url: json['Url'] as String,
  );
}

Map<String, dynamic> _$RecommendationToJson(Recommendation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Text', instance.text);
  writeNotNull('Url', instance.url);
  return val;
}

RelatedFinding _$RelatedFindingFromJson(Map<String, dynamic> json) {
  return RelatedFinding(
    id: json['Id'] as String,
    productArn: json['ProductArn'] as String,
  );
}

Map<String, dynamic> _$RelatedFindingToJson(RelatedFinding instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('ProductArn', instance.productArn);
  return val;
}

Remediation _$RemediationFromJson(Map<String, dynamic> json) {
  return Remediation(
    recommendation: json['Recommendation'] == null
        ? null
        : Recommendation.fromJson(
            json['Recommendation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RemediationToJson(Remediation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Recommendation', instance.recommendation?.toJson());
  return val;
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    id: json['Id'] as String,
    type: json['Type'] as String,
    details: json['Details'] == null
        ? null
        : ResourceDetails.fromJson(json['Details'] as Map<String, dynamic>),
    partition: _$enumDecodeNullable(_$PartitionEnumMap, json['Partition']),
    region: json['Region'] as String,
    resourceRole: json['ResourceRole'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Type', instance.type);
  writeNotNull('Details', instance.details?.toJson());
  writeNotNull('Partition', _$PartitionEnumMap[instance.partition]);
  writeNotNull('Region', instance.region);
  writeNotNull('ResourceRole', instance.resourceRole);
  writeNotNull('Tags', instance.tags);
  return val;
}

const _$PartitionEnumMap = {
  Partition.aws: 'aws',
  Partition.awsCn: 'aws-cn',
  Partition.awsUsGov: 'aws-us-gov',
};

ResourceDetails _$ResourceDetailsFromJson(Map<String, dynamic> json) {
  return ResourceDetails(
    awsApiGatewayRestApi: json['AwsApiGatewayRestApi'] == null
        ? null
        : AwsApiGatewayRestApiDetails.fromJson(
            json['AwsApiGatewayRestApi'] as Map<String, dynamic>),
    awsApiGatewayStage: json['AwsApiGatewayStage'] == null
        ? null
        : AwsApiGatewayStageDetails.fromJson(
            json['AwsApiGatewayStage'] as Map<String, dynamic>),
    awsApiGatewayV2Api: json['AwsApiGatewayV2Api'] == null
        ? null
        : AwsApiGatewayV2ApiDetails.fromJson(
            json['AwsApiGatewayV2Api'] as Map<String, dynamic>),
    awsApiGatewayV2Stage: json['AwsApiGatewayV2Stage'] == null
        ? null
        : AwsApiGatewayV2StageDetails.fromJson(
            json['AwsApiGatewayV2Stage'] as Map<String, dynamic>),
    awsAutoScalingAutoScalingGroup:
        json['AwsAutoScalingAutoScalingGroup'] == null
            ? null
            : AwsAutoScalingAutoScalingGroupDetails.fromJson(
                json['AwsAutoScalingAutoScalingGroup'] as Map<String, dynamic>),
    awsCertificateManagerCertificate:
        json['AwsCertificateManagerCertificate'] == null
            ? null
            : AwsCertificateManagerCertificateDetails.fromJson(
                json['AwsCertificateManagerCertificate']
                    as Map<String, dynamic>),
    awsCloudFrontDistribution: json['AwsCloudFrontDistribution'] == null
        ? null
        : AwsCloudFrontDistributionDetails.fromJson(
            json['AwsCloudFrontDistribution'] as Map<String, dynamic>),
    awsCloudTrailTrail: json['AwsCloudTrailTrail'] == null
        ? null
        : AwsCloudTrailTrailDetails.fromJson(
            json['AwsCloudTrailTrail'] as Map<String, dynamic>),
    awsCodeBuildProject: json['AwsCodeBuildProject'] == null
        ? null
        : AwsCodeBuildProjectDetails.fromJson(
            json['AwsCodeBuildProject'] as Map<String, dynamic>),
    awsDynamoDbTable: json['AwsDynamoDbTable'] == null
        ? null
        : AwsDynamoDbTableDetails.fromJson(
            json['AwsDynamoDbTable'] as Map<String, dynamic>),
    awsEc2Eip: json['AwsEc2Eip'] == null
        ? null
        : AwsEc2EipDetails.fromJson(json['AwsEc2Eip'] as Map<String, dynamic>),
    awsEc2Instance: json['AwsEc2Instance'] == null
        ? null
        : AwsEc2InstanceDetails.fromJson(
            json['AwsEc2Instance'] as Map<String, dynamic>),
    awsEc2NetworkInterface: json['AwsEc2NetworkInterface'] == null
        ? null
        : AwsEc2NetworkInterfaceDetails.fromJson(
            json['AwsEc2NetworkInterface'] as Map<String, dynamic>),
    awsEc2SecurityGroup: json['AwsEc2SecurityGroup'] == null
        ? null
        : AwsEc2SecurityGroupDetails.fromJson(
            json['AwsEc2SecurityGroup'] as Map<String, dynamic>),
    awsEc2Volume: json['AwsEc2Volume'] == null
        ? null
        : AwsEc2VolumeDetails.fromJson(
            json['AwsEc2Volume'] as Map<String, dynamic>),
    awsEc2Vpc: json['AwsEc2Vpc'] == null
        ? null
        : AwsEc2VpcDetails.fromJson(json['AwsEc2Vpc'] as Map<String, dynamic>),
    awsElasticsearchDomain: json['AwsElasticsearchDomain'] == null
        ? null
        : AwsElasticsearchDomainDetails.fromJson(
            json['AwsElasticsearchDomain'] as Map<String, dynamic>),
    awsElbLoadBalancer: json['AwsElbLoadBalancer'] == null
        ? null
        : AwsElbLoadBalancerDetails.fromJson(
            json['AwsElbLoadBalancer'] as Map<String, dynamic>),
    awsElbv2LoadBalancer: json['AwsElbv2LoadBalancer'] == null
        ? null
        : AwsElbv2LoadBalancerDetails.fromJson(
            json['AwsElbv2LoadBalancer'] as Map<String, dynamic>),
    awsIamAccessKey: json['AwsIamAccessKey'] == null
        ? null
        : AwsIamAccessKeyDetails.fromJson(
            json['AwsIamAccessKey'] as Map<String, dynamic>),
    awsIamGroup: json['AwsIamGroup'] == null
        ? null
        : AwsIamGroupDetails.fromJson(
            json['AwsIamGroup'] as Map<String, dynamic>),
    awsIamPolicy: json['AwsIamPolicy'] == null
        ? null
        : AwsIamPolicyDetails.fromJson(
            json['AwsIamPolicy'] as Map<String, dynamic>),
    awsIamRole: json['AwsIamRole'] == null
        ? null
        : AwsIamRoleDetails.fromJson(
            json['AwsIamRole'] as Map<String, dynamic>),
    awsIamUser: json['AwsIamUser'] == null
        ? null
        : AwsIamUserDetails.fromJson(
            json['AwsIamUser'] as Map<String, dynamic>),
    awsKmsKey: json['AwsKmsKey'] == null
        ? null
        : AwsKmsKeyDetails.fromJson(json['AwsKmsKey'] as Map<String, dynamic>),
    awsLambdaFunction: json['AwsLambdaFunction'] == null
        ? null
        : AwsLambdaFunctionDetails.fromJson(
            json['AwsLambdaFunction'] as Map<String, dynamic>),
    awsLambdaLayerVersion: json['AwsLambdaLayerVersion'] == null
        ? null
        : AwsLambdaLayerVersionDetails.fromJson(
            json['AwsLambdaLayerVersion'] as Map<String, dynamic>),
    awsRdsDbCluster: json['AwsRdsDbCluster'] == null
        ? null
        : AwsRdsDbClusterDetails.fromJson(
            json['AwsRdsDbCluster'] as Map<String, dynamic>),
    awsRdsDbClusterSnapshot: json['AwsRdsDbClusterSnapshot'] == null
        ? null
        : AwsRdsDbClusterSnapshotDetails.fromJson(
            json['AwsRdsDbClusterSnapshot'] as Map<String, dynamic>),
    awsRdsDbInstance: json['AwsRdsDbInstance'] == null
        ? null
        : AwsRdsDbInstanceDetails.fromJson(
            json['AwsRdsDbInstance'] as Map<String, dynamic>),
    awsRdsDbSnapshot: json['AwsRdsDbSnapshot'] == null
        ? null
        : AwsRdsDbSnapshotDetails.fromJson(
            json['AwsRdsDbSnapshot'] as Map<String, dynamic>),
    awsRedshiftCluster: json['AwsRedshiftCluster'] == null
        ? null
        : AwsRedshiftClusterDetails.fromJson(
            json['AwsRedshiftCluster'] as Map<String, dynamic>),
    awsS3Bucket: json['AwsS3Bucket'] == null
        ? null
        : AwsS3BucketDetails.fromJson(
            json['AwsS3Bucket'] as Map<String, dynamic>),
    awsS3Object: json['AwsS3Object'] == null
        ? null
        : AwsS3ObjectDetails.fromJson(
            json['AwsS3Object'] as Map<String, dynamic>),
    awsSecretsManagerSecret: json['AwsSecretsManagerSecret'] == null
        ? null
        : AwsSecretsManagerSecretDetails.fromJson(
            json['AwsSecretsManagerSecret'] as Map<String, dynamic>),
    awsSnsTopic: json['AwsSnsTopic'] == null
        ? null
        : AwsSnsTopicDetails.fromJson(
            json['AwsSnsTopic'] as Map<String, dynamic>),
    awsSqsQueue: json['AwsSqsQueue'] == null
        ? null
        : AwsSqsQueueDetails.fromJson(
            json['AwsSqsQueue'] as Map<String, dynamic>),
    awsWafWebAcl: json['AwsWafWebAcl'] == null
        ? null
        : AwsWafWebAclDetails.fromJson(
            json['AwsWafWebAcl'] as Map<String, dynamic>),
    container: json['Container'] == null
        ? null
        : ContainerDetails.fromJson(json['Container'] as Map<String, dynamic>),
    other: (json['Other'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ResourceDetailsToJson(ResourceDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AwsApiGatewayRestApi', instance.awsApiGatewayRestApi?.toJson());
  writeNotNull('AwsApiGatewayStage', instance.awsApiGatewayStage?.toJson());
  writeNotNull('AwsApiGatewayV2Api', instance.awsApiGatewayV2Api?.toJson());
  writeNotNull('AwsApiGatewayV2Stage', instance.awsApiGatewayV2Stage?.toJson());
  writeNotNull('AwsAutoScalingAutoScalingGroup',
      instance.awsAutoScalingAutoScalingGroup?.toJson());
  writeNotNull('AwsCertificateManagerCertificate',
      instance.awsCertificateManagerCertificate?.toJson());
  writeNotNull('AwsCloudFrontDistribution',
      instance.awsCloudFrontDistribution?.toJson());
  writeNotNull('AwsCloudTrailTrail', instance.awsCloudTrailTrail?.toJson());
  writeNotNull('AwsCodeBuildProject', instance.awsCodeBuildProject?.toJson());
  writeNotNull('AwsDynamoDbTable', instance.awsDynamoDbTable?.toJson());
  writeNotNull('AwsEc2Eip', instance.awsEc2Eip?.toJson());
  writeNotNull('AwsEc2Instance', instance.awsEc2Instance?.toJson());
  writeNotNull(
      'AwsEc2NetworkInterface', instance.awsEc2NetworkInterface?.toJson());
  writeNotNull('AwsEc2SecurityGroup', instance.awsEc2SecurityGroup?.toJson());
  writeNotNull('AwsEc2Volume', instance.awsEc2Volume?.toJson());
  writeNotNull('AwsEc2Vpc', instance.awsEc2Vpc?.toJson());
  writeNotNull(
      'AwsElasticsearchDomain', instance.awsElasticsearchDomain?.toJson());
  writeNotNull('AwsElbLoadBalancer', instance.awsElbLoadBalancer?.toJson());
  writeNotNull('AwsElbv2LoadBalancer', instance.awsElbv2LoadBalancer?.toJson());
  writeNotNull('AwsIamAccessKey', instance.awsIamAccessKey?.toJson());
  writeNotNull('AwsIamGroup', instance.awsIamGroup?.toJson());
  writeNotNull('AwsIamPolicy', instance.awsIamPolicy?.toJson());
  writeNotNull('AwsIamRole', instance.awsIamRole?.toJson());
  writeNotNull('AwsIamUser', instance.awsIamUser?.toJson());
  writeNotNull('AwsKmsKey', instance.awsKmsKey?.toJson());
  writeNotNull('AwsLambdaFunction', instance.awsLambdaFunction?.toJson());
  writeNotNull(
      'AwsLambdaLayerVersion', instance.awsLambdaLayerVersion?.toJson());
  writeNotNull('AwsRdsDbCluster', instance.awsRdsDbCluster?.toJson());
  writeNotNull(
      'AwsRdsDbClusterSnapshot', instance.awsRdsDbClusterSnapshot?.toJson());
  writeNotNull('AwsRdsDbInstance', instance.awsRdsDbInstance?.toJson());
  writeNotNull('AwsRdsDbSnapshot', instance.awsRdsDbSnapshot?.toJson());
  writeNotNull('AwsRedshiftCluster', instance.awsRedshiftCluster?.toJson());
  writeNotNull('AwsS3Bucket', instance.awsS3Bucket?.toJson());
  writeNotNull('AwsS3Object', instance.awsS3Object?.toJson());
  writeNotNull(
      'AwsSecretsManagerSecret', instance.awsSecretsManagerSecret?.toJson());
  writeNotNull('AwsSnsTopic', instance.awsSnsTopic?.toJson());
  writeNotNull('AwsSqsQueue', instance.awsSqsQueue?.toJson());
  writeNotNull('AwsWafWebAcl', instance.awsWafWebAcl?.toJson());
  writeNotNull('Container', instance.container?.toJson());
  writeNotNull('Other', instance.other);
  return val;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    accountId: json['AccountId'] as String,
    processingResult: json['ProcessingResult'] as String,
  );
}

Severity _$SeverityFromJson(Map<String, dynamic> json) {
  return Severity(
    label: _$enumDecodeNullable(_$SeverityLabelEnumMap, json['Label']),
    normalized: json['Normalized'] as int,
    original: json['Original'] as String,
    product: (json['Product'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SeverityToJson(Severity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Label', _$SeverityLabelEnumMap[instance.label]);
  writeNotNull('Normalized', instance.normalized);
  writeNotNull('Original', instance.original);
  writeNotNull('Product', instance.product);
  return val;
}

const _$SeverityLabelEnumMap = {
  SeverityLabel.informational: 'INFORMATIONAL',
  SeverityLabel.low: 'LOW',
  SeverityLabel.medium: 'MEDIUM',
  SeverityLabel.high: 'HIGH',
  SeverityLabel.critical: 'CRITICAL',
};

Map<String, dynamic> _$SeverityUpdateToJson(SeverityUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Label', _$SeverityLabelEnumMap[instance.label]);
  writeNotNull('Normalized', instance.normalized);
  writeNotNull('Product', instance.product);
  return val;
}

SoftwarePackage _$SoftwarePackageFromJson(Map<String, dynamic> json) {
  return SoftwarePackage(
    architecture: json['Architecture'] as String,
    epoch: json['Epoch'] as String,
    name: json['Name'] as String,
    release: json['Release'] as String,
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$SoftwarePackageToJson(SoftwarePackage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Architecture', instance.architecture);
  writeNotNull('Epoch', instance.epoch);
  writeNotNull('Name', instance.name);
  writeNotNull('Release', instance.release);
  writeNotNull('Version', instance.version);
  return val;
}

Map<String, dynamic> _$SortCriterionToJson(SortCriterion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Field', instance.field);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$SortOrderEnumMap = {
  SortOrder.asc: 'asc',
  SortOrder.desc: 'desc',
};

Standard _$StandardFromJson(Map<String, dynamic> json) {
  return Standard(
    description: json['Description'] as String,
    enabledByDefault: json['EnabledByDefault'] as bool,
    name: json['Name'] as String,
    standardsArn: json['StandardsArn'] as String,
  );
}

StandardsControl _$StandardsControlFromJson(Map<String, dynamic> json) {
  return StandardsControl(
    controlId: json['ControlId'] as String,
    controlStatus:
        _$enumDecodeNullable(_$ControlStatusEnumMap, json['ControlStatus']),
    controlStatusUpdatedAt:
        const IsoDateTimeConverter().fromJson(json['ControlStatusUpdatedAt']),
    description: json['Description'] as String,
    disabledReason: json['DisabledReason'] as String,
    relatedRequirements: (json['RelatedRequirements'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    remediationUrl: json['RemediationUrl'] as String,
    severityRating:
        _$enumDecodeNullable(_$SeverityRatingEnumMap, json['SeverityRating']),
    standardsControlArn: json['StandardsControlArn'] as String,
    title: json['Title'] as String,
  );
}

const _$ControlStatusEnumMap = {
  ControlStatus.enabled: 'ENABLED',
  ControlStatus.disabled: 'DISABLED',
};

const _$SeverityRatingEnumMap = {
  SeverityRating.low: 'LOW',
  SeverityRating.medium: 'MEDIUM',
  SeverityRating.high: 'HIGH',
  SeverityRating.critical: 'CRITICAL',
};

StandardsSubscription _$StandardsSubscriptionFromJson(
    Map<String, dynamic> json) {
  return StandardsSubscription(
    standardsArn: json['StandardsArn'] as String,
    standardsInput: (json['StandardsInput'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    standardsStatus:
        _$enumDecodeNullable(_$StandardsStatusEnumMap, json['StandardsStatus']),
    standardsSubscriptionArn: json['StandardsSubscriptionArn'] as String,
  );
}

const _$StandardsStatusEnumMap = {
  StandardsStatus.pending: 'PENDING',
  StandardsStatus.ready: 'READY',
  StandardsStatus.failed: 'FAILED',
  StandardsStatus.deleting: 'DELETING',
  StandardsStatus.incomplete: 'INCOMPLETE',
};

Map<String, dynamic> _$StandardsSubscriptionRequestToJson(
    StandardsSubscriptionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StandardsArn', instance.standardsArn);
  writeNotNull('StandardsInput', instance.standardsInput);
  return val;
}

StatusReason _$StatusReasonFromJson(Map<String, dynamic> json) {
  return StatusReason(
    reasonCode: json['ReasonCode'] as String,
    description: json['Description'] as String,
  );
}

Map<String, dynamic> _$StatusReasonToJson(StatusReason instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReasonCode', instance.reasonCode);
  writeNotNull('Description', instance.description);
  return val;
}

StringFilter _$StringFilterFromJson(Map<String, dynamic> json) {
  return StringFilter(
    comparison: _$enumDecodeNullable(
        _$StringFilterComparisonEnumMap, json['Comparison']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$StringFilterToJson(StringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Comparison', _$StringFilterComparisonEnumMap[instance.comparison]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$StringFilterComparisonEnumMap = {
  StringFilterComparison.equals: 'EQUALS',
  StringFilterComparison.prefix: 'PREFIX',
  StringFilterComparison.notEquals: 'NOT_EQUALS',
  StringFilterComparison.prefixNotEquals: 'PREFIX_NOT_EQUALS',
};

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

ThreatIntelIndicator _$ThreatIntelIndicatorFromJson(Map<String, dynamic> json) {
  return ThreatIntelIndicator(
    category: _$enumDecodeNullable(
        _$ThreatIntelIndicatorCategoryEnumMap, json['Category']),
    lastObservedAt: json['LastObservedAt'] as String,
    source: json['Source'] as String,
    sourceUrl: json['SourceUrl'] as String,
    type: _$enumDecodeNullable(_$ThreatIntelIndicatorTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$ThreatIntelIndicatorToJson(
    ThreatIntelIndicator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Category', _$ThreatIntelIndicatorCategoryEnumMap[instance.category]);
  writeNotNull('LastObservedAt', instance.lastObservedAt);
  writeNotNull('Source', instance.source);
  writeNotNull('SourceUrl', instance.sourceUrl);
  writeNotNull('Type', _$ThreatIntelIndicatorTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$ThreatIntelIndicatorCategoryEnumMap = {
  ThreatIntelIndicatorCategory.backdoor: 'BACKDOOR',
  ThreatIntelIndicatorCategory.cardStealer: 'CARD_STEALER',
  ThreatIntelIndicatorCategory.commandAndControl: 'COMMAND_AND_CONTROL',
  ThreatIntelIndicatorCategory.dropSite: 'DROP_SITE',
  ThreatIntelIndicatorCategory.exploitSite: 'EXPLOIT_SITE',
  ThreatIntelIndicatorCategory.keylogger: 'KEYLOGGER',
};

const _$ThreatIntelIndicatorTypeEnumMap = {
  ThreatIntelIndicatorType.domain: 'DOMAIN',
  ThreatIntelIndicatorType.emailAddress: 'EMAIL_ADDRESS',
  ThreatIntelIndicatorType.hashMd5: 'HASH_MD5',
  ThreatIntelIndicatorType.hashSha1: 'HASH_SHA1',
  ThreatIntelIndicatorType.hashSha256: 'HASH_SHA256',
  ThreatIntelIndicatorType.hashSha512: 'HASH_SHA512',
  ThreatIntelIndicatorType.ipv4Address: 'IPV4_ADDRESS',
  ThreatIntelIndicatorType.ipv6Address: 'IPV6_ADDRESS',
  ThreatIntelIndicatorType.mutex: 'MUTEX',
  ThreatIntelIndicatorType.process: 'PROCESS',
  ThreatIntelIndicatorType.url: 'URL',
};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateActionTargetResponse _$UpdateActionTargetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateActionTargetResponse();
}

UpdateFindingsResponse _$UpdateFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFindingsResponse();
}

UpdateInsightResponse _$UpdateInsightResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateInsightResponse();
}

UpdateOrganizationConfigurationResponse
    _$UpdateOrganizationConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateOrganizationConfigurationResponse();
}

UpdateSecurityHubConfigurationResponse
    _$UpdateSecurityHubConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateSecurityHubConfigurationResponse();
}

UpdateStandardsControlResponse _$UpdateStandardsControlResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateStandardsControlResponse();
}

Vulnerability _$VulnerabilityFromJson(Map<String, dynamic> json) {
  return Vulnerability(
    id: json['Id'] as String,
    cvss: (json['Cvss'] as List)
        ?.map(
            (e) => e == null ? null : Cvss.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    referenceUrls:
        (json['ReferenceUrls'] as List)?.map((e) => e as String)?.toList(),
    relatedVulnerabilities: (json['RelatedVulnerabilities'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    vendor: json['Vendor'] == null
        ? null
        : VulnerabilityVendor.fromJson(json['Vendor'] as Map<String, dynamic>),
    vulnerablePackages: (json['VulnerablePackages'] as List)
        ?.map((e) => e == null
            ? null
            : SoftwarePackage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VulnerabilityToJson(Vulnerability instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Cvss', instance.cvss?.map((e) => e?.toJson())?.toList());
  writeNotNull('ReferenceUrls', instance.referenceUrls);
  writeNotNull('RelatedVulnerabilities', instance.relatedVulnerabilities);
  writeNotNull('Vendor', instance.vendor?.toJson());
  writeNotNull('VulnerablePackages',
      instance.vulnerablePackages?.map((e) => e?.toJson())?.toList());
  return val;
}

VulnerabilityVendor _$VulnerabilityVendorFromJson(Map<String, dynamic> json) {
  return VulnerabilityVendor(
    name: json['Name'] as String,
    url: json['Url'] as String,
    vendorCreatedAt: json['VendorCreatedAt'] as String,
    vendorSeverity: json['VendorSeverity'] as String,
    vendorUpdatedAt: json['VendorUpdatedAt'] as String,
  );
}

Map<String, dynamic> _$VulnerabilityVendorToJson(VulnerabilityVendor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Url', instance.url);
  writeNotNull('VendorCreatedAt', instance.vendorCreatedAt);
  writeNotNull('VendorSeverity', instance.vendorSeverity);
  writeNotNull('VendorUpdatedAt', instance.vendorUpdatedAt);
  return val;
}

WafAction _$WafActionFromJson(Map<String, dynamic> json) {
  return WafAction(
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$WafActionToJson(WafAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', instance.type);
  return val;
}

WafExcludedRule _$WafExcludedRuleFromJson(Map<String, dynamic> json) {
  return WafExcludedRule(
    ruleId: json['RuleId'] as String,
  );
}

Map<String, dynamic> _$WafExcludedRuleToJson(WafExcludedRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RuleId', instance.ruleId);
  return val;
}

WafOverrideAction _$WafOverrideActionFromJson(Map<String, dynamic> json) {
  return WafOverrideAction(
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$WafOverrideActionToJson(WafOverrideAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', instance.type);
  return val;
}

Workflow _$WorkflowFromJson(Map<String, dynamic> json) {
  return Workflow(
    status: _$enumDecodeNullable(_$WorkflowStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$WorkflowToJson(Workflow instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', _$WorkflowStatusEnumMap[instance.status]);
  return val;
}

const _$WorkflowStatusEnumMap = {
  WorkflowStatus.$new: 'NEW',
  WorkflowStatus.notified: 'NOTIFIED',
  WorkflowStatus.resolved: 'RESOLVED',
  WorkflowStatus.suppressed: 'SUPPRESSED',
};

Map<String, dynamic> _$WorkflowUpdateToJson(WorkflowUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', _$WorkflowStatusEnumMap[instance.status]);
  return val;
}
