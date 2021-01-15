// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-09-08.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationDependencySummary _$ApplicationDependencySummaryFromJson(
    Map<String, dynamic> json) {
  return ApplicationDependencySummary(
    applicationId: json['applicationId'] as String,
    semanticVersion: json['semanticVersion'] as String,
  );
}

ApplicationPolicyStatement _$ApplicationPolicyStatementFromJson(
    Map<String, dynamic> json) {
  return ApplicationPolicyStatement(
    actions: (json['actions'] as List)?.map((e) => e as String)?.toList(),
    principals: (json['principals'] as List)?.map((e) => e as String)?.toList(),
    principalOrgIDs:
        (json['principalOrgIDs'] as List)?.map((e) => e as String)?.toList(),
    statementId: json['statementId'] as String,
  );
}

Map<String, dynamic> _$ApplicationPolicyStatementToJson(
    ApplicationPolicyStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('actions', instance.actions);
  writeNotNull('principals', instance.principals);
  writeNotNull('principalOrgIDs', instance.principalOrgIDs);
  writeNotNull('statementId', instance.statementId);
  return val;
}

ApplicationSummary _$ApplicationSummaryFromJson(Map<String, dynamic> json) {
  return ApplicationSummary(
    applicationId: json['applicationId'] as String,
    author: json['author'] as String,
    description: json['description'] as String,
    name: json['name'] as String,
    creationTime: json['creationTime'] as String,
    homePageUrl: json['homePageUrl'] as String,
    labels: (json['labels'] as List)?.map((e) => e as String)?.toList(),
    spdxLicenseId: json['spdxLicenseId'] as String,
  );
}

CreateApplicationResponse _$CreateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationResponse(
    applicationId: json['applicationId'] as String,
    author: json['author'] as String,
    creationTime: json['creationTime'] as String,
    description: json['description'] as String,
    homePageUrl: json['homePageUrl'] as String,
    isVerifiedAuthor: json['isVerifiedAuthor'] as bool,
    labels: (json['labels'] as List)?.map((e) => e as String)?.toList(),
    licenseUrl: json['licenseUrl'] as String,
    name: json['name'] as String,
    readmeUrl: json['readmeUrl'] as String,
    spdxLicenseId: json['spdxLicenseId'] as String,
    verifiedAuthorUrl: json['verifiedAuthorUrl'] as String,
    version: json['version'] == null
        ? null
        : Version.fromJson(json['version'] as Map<String, dynamic>),
  );
}

CreateApplicationVersionResponse _$CreateApplicationVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationVersionResponse(
    applicationId: json['applicationId'] as String,
    creationTime: json['creationTime'] as String,
    parameterDefinitions: (json['parameterDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requiredCapabilities: (json['requiredCapabilities'] as List)
        ?.map((e) => _$enumDecodeNullable(_$CapabilityEnumMap, e))
        ?.toList(),
    resourcesSupported: json['resourcesSupported'] as bool,
    semanticVersion: json['semanticVersion'] as String,
    sourceCodeArchiveUrl: json['sourceCodeArchiveUrl'] as String,
    sourceCodeUrl: json['sourceCodeUrl'] as String,
    templateUrl: json['templateUrl'] as String,
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

const _$CapabilityEnumMap = {
  Capability.capabilityIam: 'CAPABILITY_IAM',
  Capability.capabilityNamedIam: 'CAPABILITY_NAMED_IAM',
  Capability.capabilityAutoExpand: 'CAPABILITY_AUTO_EXPAND',
  Capability.capabilityResourcePolicy: 'CAPABILITY_RESOURCE_POLICY',
};

CreateCloudFormationChangeSetResponse
    _$CreateCloudFormationChangeSetResponseFromJson(Map<String, dynamic> json) {
  return CreateCloudFormationChangeSetResponse(
    applicationId: json['applicationId'] as String,
    changeSetId: json['changeSetId'] as String,
    semanticVersion: json['semanticVersion'] as String,
    stackId: json['stackId'] as String,
  );
}

CreateCloudFormationTemplateResponse
    _$CreateCloudFormationTemplateResponseFromJson(Map<String, dynamic> json) {
  return CreateCloudFormationTemplateResponse(
    applicationId: json['applicationId'] as String,
    creationTime: json['creationTime'] as String,
    expirationTime: json['expirationTime'] as String,
    semanticVersion: json['semanticVersion'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    templateId: json['templateId'] as String,
    templateUrl: json['templateUrl'] as String,
  );
}

const _$StatusEnumMap = {
  Status.preparing: 'PREPARING',
  Status.active: 'ACTIVE',
  Status.expired: 'EXPIRED',
};

GetApplicationPolicyResponse _$GetApplicationPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetApplicationPolicyResponse(
    statements: (json['statements'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationPolicyStatement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetApplicationResponse _$GetApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return GetApplicationResponse(
    applicationId: json['applicationId'] as String,
    author: json['author'] as String,
    creationTime: json['creationTime'] as String,
    description: json['description'] as String,
    homePageUrl: json['homePageUrl'] as String,
    isVerifiedAuthor: json['isVerifiedAuthor'] as bool,
    labels: (json['labels'] as List)?.map((e) => e as String)?.toList(),
    licenseUrl: json['licenseUrl'] as String,
    name: json['name'] as String,
    readmeUrl: json['readmeUrl'] as String,
    spdxLicenseId: json['spdxLicenseId'] as String,
    verifiedAuthorUrl: json['verifiedAuthorUrl'] as String,
    version: json['version'] == null
        ? null
        : Version.fromJson(json['version'] as Map<String, dynamic>),
  );
}

GetCloudFormationTemplateResponse _$GetCloudFormationTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return GetCloudFormationTemplateResponse(
    applicationId: json['applicationId'] as String,
    creationTime: json['creationTime'] as String,
    expirationTime: json['expirationTime'] as String,
    semanticVersion: json['semanticVersion'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    templateId: json['templateId'] as String,
    templateUrl: json['templateUrl'] as String,
  );
}

ListApplicationDependenciesResponse
    _$ListApplicationDependenciesResponseFromJson(Map<String, dynamic> json) {
  return ListApplicationDependenciesResponse(
    dependencies: (json['dependencies'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationDependencySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListApplicationVersionsResponse _$ListApplicationVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListApplicationVersionsResponse(
    nextToken: json['nextToken'] as String,
    versions: (json['versions'] as List)
        ?.map((e) => e == null
            ? null
            : VersionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListApplicationsResponse _$ListApplicationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListApplicationsResponse(
    applications: (json['applications'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ParameterDefinition _$ParameterDefinitionFromJson(Map<String, dynamic> json) {
  return ParameterDefinition(
    name: json['name'] as String,
    referencedByResources: (json['referencedByResources'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    allowedPattern: json['allowedPattern'] as String,
    allowedValues:
        (json['allowedValues'] as List)?.map((e) => e as String)?.toList(),
    constraintDescription: json['constraintDescription'] as String,
    defaultValue: json['defaultValue'] as String,
    description: json['description'] as String,
    maxLength: json['maxLength'] as int,
    maxValue: json['maxValue'] as int,
    minLength: json['minLength'] as int,
    minValue: json['minValue'] as int,
    noEcho: json['noEcho'] as bool,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$ParameterValueToJson(ParameterValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  return val;
}

PutApplicationPolicyResponse _$PutApplicationPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutApplicationPolicyResponse(
    statements: (json['statements'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationPolicyStatement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RollbackConfigurationToJson(
    RollbackConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('monitoringTimeInMinutes', instance.monitoringTimeInMinutes);
  writeNotNull('rollbackTriggers',
      instance.rollbackTriggers?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$RollbackTriggerToJson(RollbackTrigger instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arn', instance.arn);
  writeNotNull('type', instance.type);
  return val;
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

UpdateApplicationResponse _$UpdateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApplicationResponse(
    applicationId: json['applicationId'] as String,
    author: json['author'] as String,
    creationTime: json['creationTime'] as String,
    description: json['description'] as String,
    homePageUrl: json['homePageUrl'] as String,
    isVerifiedAuthor: json['isVerifiedAuthor'] as bool,
    labels: (json['labels'] as List)?.map((e) => e as String)?.toList(),
    licenseUrl: json['licenseUrl'] as String,
    name: json['name'] as String,
    readmeUrl: json['readmeUrl'] as String,
    spdxLicenseId: json['spdxLicenseId'] as String,
    verifiedAuthorUrl: json['verifiedAuthorUrl'] as String,
    version: json['version'] == null
        ? null
        : Version.fromJson(json['version'] as Map<String, dynamic>),
  );
}

Version _$VersionFromJson(Map<String, dynamic> json) {
  return Version(
    applicationId: json['applicationId'] as String,
    creationTime: json['creationTime'] as String,
    parameterDefinitions: (json['parameterDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    requiredCapabilities: (json['requiredCapabilities'] as List)
        ?.map((e) => _$enumDecodeNullable(_$CapabilityEnumMap, e))
        ?.toList(),
    resourcesSupported: json['resourcesSupported'] as bool,
    semanticVersion: json['semanticVersion'] as String,
    templateUrl: json['templateUrl'] as String,
    sourceCodeArchiveUrl: json['sourceCodeArchiveUrl'] as String,
    sourceCodeUrl: json['sourceCodeUrl'] as String,
  );
}

VersionSummary _$VersionSummaryFromJson(Map<String, dynamic> json) {
  return VersionSummary(
    applicationId: json['applicationId'] as String,
    creationTime: json['creationTime'] as String,
    semanticVersion: json['semanticVersion'] as String,
    sourceCodeUrl: json['sourceCodeUrl'] as String,
  );
}
