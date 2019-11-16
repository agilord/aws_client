// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secretsmanager-2017-10-17.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRotateSecretRequest _$CancelRotateSecretRequestFromJson(
    Map<String, dynamic> json) {
  return CancelRotateSecretRequest(
    secretId: json['SecretId'] as String,
  );
}

Map<String, dynamic> _$CancelRotateSecretRequestToJson(
        CancelRotateSecretRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
    };

CancelRotateSecretResponse _$CancelRotateSecretResponseFromJson(
    Map<String, dynamic> json) {
  return CancelRotateSecretResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$CancelRotateSecretResponseToJson(
        CancelRotateSecretResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
      'VersionId': instance.versionId,
    };

CreateSecretRequest _$CreateSecretRequestFromJson(Map<String, dynamic> json) {
  return CreateSecretRequest(
    name: json['Name'] as String,
    clientRequestToken: json['ClientRequestToken'] as String,
    description: json['Description'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    secretBinary:
        const Base64Converter().fromJson(json['SecretBinary'] as String),
    secretString: json['SecretString'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateSecretRequestToJson(
        CreateSecretRequest instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'ClientRequestToken': instance.clientRequestToken,
      'Description': instance.description,
      'KmsKeyId': instance.kmsKeyId,
      'SecretBinary': const Base64Converter().toJson(instance.secretBinary),
      'SecretString': instance.secretString,
      'Tags': instance.tags,
    };

CreateSecretResponse _$CreateSecretResponseFromJson(Map<String, dynamic> json) {
  return CreateSecretResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$CreateSecretResponseToJson(
        CreateSecretResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
      'VersionId': instance.versionId,
    };

DeleteResourcePolicyRequest _$DeleteResourcePolicyRequestFromJson(
    Map<String, dynamic> json) {
  return DeleteResourcePolicyRequest(
    secretId: json['SecretId'] as String,
  );
}

Map<String, dynamic> _$DeleteResourcePolicyRequestToJson(
        DeleteResourcePolicyRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
    };

DeleteResourcePolicyResponse _$DeleteResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResourcePolicyResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$DeleteResourcePolicyResponseToJson(
        DeleteResourcePolicyResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
    };

DeleteSecretRequest _$DeleteSecretRequestFromJson(Map<String, dynamic> json) {
  return DeleteSecretRequest(
    secretId: json['SecretId'] as String,
    recoveryWindowInDays: json['RecoveryWindowInDays'] as int,
    forceDeleteWithoutRecovery: json['ForceDeleteWithoutRecovery'] as bool,
  );
}

Map<String, dynamic> _$DeleteSecretRequestToJson(
        DeleteSecretRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
      'RecoveryWindowInDays': instance.recoveryWindowInDays,
      'ForceDeleteWithoutRecovery': instance.forceDeleteWithoutRecovery,
    };

DeleteSecretResponse _$DeleteSecretResponseFromJson(Map<String, dynamic> json) {
  return DeleteSecretResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
    deletionDate: json['DeletionDate'] as String,
  );
}

Map<String, dynamic> _$DeleteSecretResponseToJson(
        DeleteSecretResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
      'DeletionDate': instance.deletionDate,
    };

DescribeSecretRequest _$DescribeSecretRequestFromJson(
    Map<String, dynamic> json) {
  return DescribeSecretRequest(
    secretId: json['SecretId'] as String,
  );
}

Map<String, dynamic> _$DescribeSecretRequestToJson(
        DescribeSecretRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
    };

DescribeSecretResponse _$DescribeSecretResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSecretResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
    description: json['Description'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    rotationEnabled: json['RotationEnabled'] as bool,
    rotationLambdaARN: json['RotationLambdaARN'] as String,
    rotationRules: json['RotationRules'] == null
        ? null
        : RotationRulesType.fromJson(
            json['RotationRules'] as Map<String, dynamic>),
    lastRotatedDate: json['LastRotatedDate'] as String,
    lastChangedDate: json['LastChangedDate'] as String,
    lastAccessedDate: json['LastAccessedDate'] as String,
    deletedDate: json['DeletedDate'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    versionIdsToStages:
        (json['VersionIdsToStages'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    owningService: json['OwningService'] as String,
  );
}

Map<String, dynamic> _$DescribeSecretResponseToJson(
        DescribeSecretResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
      'Description': instance.description,
      'KmsKeyId': instance.kmsKeyId,
      'RotationEnabled': instance.rotationEnabled,
      'RotationLambdaARN': instance.rotationLambdaARN,
      'RotationRules': instance.rotationRules,
      'LastRotatedDate': instance.lastRotatedDate,
      'LastChangedDate': instance.lastChangedDate,
      'LastAccessedDate': instance.lastAccessedDate,
      'DeletedDate': instance.deletedDate,
      'Tags': instance.tags,
      'VersionIdsToStages': instance.versionIdsToStages,
      'OwningService': instance.owningService,
    };

GetRandomPasswordRequest _$GetRandomPasswordRequestFromJson(
    Map<String, dynamic> json) {
  return GetRandomPasswordRequest(
    passwordLength: json['PasswordLength'] as int,
    excludeCharacters: json['ExcludeCharacters'] as String,
    excludeNumbers: json['ExcludeNumbers'] as bool,
    excludePunctuation: json['ExcludePunctuation'] as bool,
    excludeUppercase: json['ExcludeUppercase'] as bool,
    excludeLowercase: json['ExcludeLowercase'] as bool,
    includeSpace: json['IncludeSpace'] as bool,
    requireEachIncludedType: json['RequireEachIncludedType'] as bool,
  );
}

Map<String, dynamic> _$GetRandomPasswordRequestToJson(
        GetRandomPasswordRequest instance) =>
    <String, dynamic>{
      'PasswordLength': instance.passwordLength,
      'ExcludeCharacters': instance.excludeCharacters,
      'ExcludeNumbers': instance.excludeNumbers,
      'ExcludePunctuation': instance.excludePunctuation,
      'ExcludeUppercase': instance.excludeUppercase,
      'ExcludeLowercase': instance.excludeLowercase,
      'IncludeSpace': instance.includeSpace,
      'RequireEachIncludedType': instance.requireEachIncludedType,
    };

GetRandomPasswordResponse _$GetRandomPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return GetRandomPasswordResponse(
    randomPassword: json['RandomPassword'] as String,
  );
}

Map<String, dynamic> _$GetRandomPasswordResponseToJson(
        GetRandomPasswordResponse instance) =>
    <String, dynamic>{
      'RandomPassword': instance.randomPassword,
    };

GetResourcePolicyRequest _$GetResourcePolicyRequestFromJson(
    Map<String, dynamic> json) {
  return GetResourcePolicyRequest(
    secretId: json['SecretId'] as String,
  );
}

Map<String, dynamic> _$GetResourcePolicyRequestToJson(
        GetResourcePolicyRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
    };

GetResourcePolicyResponse _$GetResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourcePolicyResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
    resourcePolicy: json['ResourcePolicy'] as String,
  );
}

Map<String, dynamic> _$GetResourcePolicyResponseToJson(
        GetResourcePolicyResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
      'ResourcePolicy': instance.resourcePolicy,
    };

GetSecretValueRequest _$GetSecretValueRequestFromJson(
    Map<String, dynamic> json) {
  return GetSecretValueRequest(
    secretId: json['SecretId'] as String,
    versionId: json['VersionId'] as String,
    versionStage: json['VersionStage'] as String,
  );
}

Map<String, dynamic> _$GetSecretValueRequestToJson(
        GetSecretValueRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
      'VersionId': instance.versionId,
      'VersionStage': instance.versionStage,
    };

GetSecretValueResponse _$GetSecretValueResponseFromJson(
    Map<String, dynamic> json) {
  return GetSecretValueResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
    secretBinary:
        const Base64Converter().fromJson(json['SecretBinary'] as String),
    secretString: json['SecretString'] as String,
    versionStages:
        (json['VersionStages'] as List)?.map((e) => e as String)?.toList(),
    createdDate: json['CreatedDate'] as String,
  );
}

Map<String, dynamic> _$GetSecretValueResponseToJson(
        GetSecretValueResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
      'VersionId': instance.versionId,
      'SecretBinary': const Base64Converter().toJson(instance.secretBinary),
      'SecretString': instance.secretString,
      'VersionStages': instance.versionStages,
      'CreatedDate': instance.createdDate,
    };

ListSecretVersionIdsRequest _$ListSecretVersionIdsRequestFromJson(
    Map<String, dynamic> json) {
  return ListSecretVersionIdsRequest(
    secretId: json['SecretId'] as String,
    maxResults: json['MaxResults'] as int,
    nextToken: json['NextToken'] as String,
    includeDeprecated: json['IncludeDeprecated'] as bool,
  );
}

Map<String, dynamic> _$ListSecretVersionIdsRequestToJson(
        ListSecretVersionIdsRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
      'MaxResults': instance.maxResults,
      'NextToken': instance.nextToken,
      'IncludeDeprecated': instance.includeDeprecated,
    };

ListSecretVersionIdsResponse _$ListSecretVersionIdsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSecretVersionIdsResponse(
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : SecretVersionsListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ListSecretVersionIdsResponseToJson(
        ListSecretVersionIdsResponse instance) =>
    <String, dynamic>{
      'Versions': instance.versions,
      'NextToken': instance.nextToken,
      'ARN': instance.aRN,
      'Name': instance.name,
    };

ListSecretsRequest _$ListSecretsRequestFromJson(Map<String, dynamic> json) {
  return ListSecretsRequest(
    maxResults: json['MaxResults'] as int,
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListSecretsRequestToJson(ListSecretsRequest instance) =>
    <String, dynamic>{
      'MaxResults': instance.maxResults,
      'NextToken': instance.nextToken,
    };

ListSecretsResponse _$ListSecretsResponseFromJson(Map<String, dynamic> json) {
  return ListSecretsResponse(
    secretList: (json['SecretList'] as List)
        ?.map((e) => e == null
            ? null
            : SecretListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListSecretsResponseToJson(
        ListSecretsResponse instance) =>
    <String, dynamic>{
      'SecretList': instance.secretList,
      'NextToken': instance.nextToken,
    };

PutResourcePolicyRequest _$PutResourcePolicyRequestFromJson(
    Map<String, dynamic> json) {
  return PutResourcePolicyRequest(
    secretId: json['SecretId'] as String,
    resourcePolicy: json['ResourcePolicy'] as String,
  );
}

Map<String, dynamic> _$PutResourcePolicyRequestToJson(
        PutResourcePolicyRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
      'ResourcePolicy': instance.resourcePolicy,
    };

PutResourcePolicyResponse _$PutResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutResourcePolicyResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$PutResourcePolicyResponseToJson(
        PutResourcePolicyResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
    };

PutSecretValueRequest _$PutSecretValueRequestFromJson(
    Map<String, dynamic> json) {
  return PutSecretValueRequest(
    secretId: json['SecretId'] as String,
    clientRequestToken: json['ClientRequestToken'] as String,
    secretBinary:
        const Base64Converter().fromJson(json['SecretBinary'] as String),
    secretString: json['SecretString'] as String,
    versionStages:
        (json['VersionStages'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PutSecretValueRequestToJson(
        PutSecretValueRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
      'ClientRequestToken': instance.clientRequestToken,
      'SecretBinary': const Base64Converter().toJson(instance.secretBinary),
      'SecretString': instance.secretString,
      'VersionStages': instance.versionStages,
    };

PutSecretValueResponse _$PutSecretValueResponseFromJson(
    Map<String, dynamic> json) {
  return PutSecretValueResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
    versionStages:
        (json['VersionStages'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PutSecretValueResponseToJson(
        PutSecretValueResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
      'VersionId': instance.versionId,
      'VersionStages': instance.versionStages,
    };

RestoreSecretRequest _$RestoreSecretRequestFromJson(Map<String, dynamic> json) {
  return RestoreSecretRequest(
    secretId: json['SecretId'] as String,
  );
}

Map<String, dynamic> _$RestoreSecretRequestToJson(
        RestoreSecretRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
    };

RestoreSecretResponse _$RestoreSecretResponseFromJson(
    Map<String, dynamic> json) {
  return RestoreSecretResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$RestoreSecretResponseToJson(
        RestoreSecretResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
    };

RotateSecretRequest _$RotateSecretRequestFromJson(Map<String, dynamic> json) {
  return RotateSecretRequest(
    secretId: json['SecretId'] as String,
    clientRequestToken: json['ClientRequestToken'] as String,
    rotationLambdaARN: json['RotationLambdaARN'] as String,
    rotationRules: json['RotationRules'] == null
        ? null
        : RotationRulesType.fromJson(
            json['RotationRules'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RotateSecretRequestToJson(
        RotateSecretRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
      'ClientRequestToken': instance.clientRequestToken,
      'RotationLambdaARN': instance.rotationLambdaARN,
      'RotationRules': instance.rotationRules,
    };

RotateSecretResponse _$RotateSecretResponseFromJson(Map<String, dynamic> json) {
  return RotateSecretResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$RotateSecretResponseToJson(
        RotateSecretResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
      'VersionId': instance.versionId,
    };

RotationRulesType _$RotationRulesTypeFromJson(Map<String, dynamic> json) {
  return RotationRulesType(
    automaticallyAfterDays: json['AutomaticallyAfterDays'] as int,
  );
}

Map<String, dynamic> _$RotationRulesTypeToJson(RotationRulesType instance) =>
    <String, dynamic>{
      'AutomaticallyAfterDays': instance.automaticallyAfterDays,
    };

SecretListEntry _$SecretListEntryFromJson(Map<String, dynamic> json) {
  return SecretListEntry(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
    description: json['Description'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    rotationEnabled: json['RotationEnabled'] as bool,
    rotationLambdaARN: json['RotationLambdaARN'] as String,
    rotationRules: json['RotationRules'] == null
        ? null
        : RotationRulesType.fromJson(
            json['RotationRules'] as Map<String, dynamic>),
    lastRotatedDate: json['LastRotatedDate'] as String,
    lastChangedDate: json['LastChangedDate'] as String,
    lastAccessedDate: json['LastAccessedDate'] as String,
    deletedDate: json['DeletedDate'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secretVersionsToStages:
        (json['SecretVersionsToStages'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    owningService: json['OwningService'] as String,
  );
}

Map<String, dynamic> _$SecretListEntryToJson(SecretListEntry instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
      'Description': instance.description,
      'KmsKeyId': instance.kmsKeyId,
      'RotationEnabled': instance.rotationEnabled,
      'RotationLambdaARN': instance.rotationLambdaARN,
      'RotationRules': instance.rotationRules,
      'LastRotatedDate': instance.lastRotatedDate,
      'LastChangedDate': instance.lastChangedDate,
      'LastAccessedDate': instance.lastAccessedDate,
      'DeletedDate': instance.deletedDate,
      'Tags': instance.tags,
      'SecretVersionsToStages': instance.secretVersionsToStages,
      'OwningService': instance.owningService,
    };

SecretVersionsListEntry _$SecretVersionsListEntryFromJson(
    Map<String, dynamic> json) {
  return SecretVersionsListEntry(
    versionId: json['VersionId'] as String,
    versionStages:
        (json['VersionStages'] as List)?.map((e) => e as String)?.toList(),
    lastAccessedDate: json['LastAccessedDate'] as String,
    createdDate: json['CreatedDate'] as String,
  );
}

Map<String, dynamic> _$SecretVersionsListEntryToJson(
        SecretVersionsListEntry instance) =>
    <String, dynamic>{
      'VersionId': instance.versionId,
      'VersionStages': instance.versionStages,
      'LastAccessedDate': instance.lastAccessedDate,
      'CreatedDate': instance.createdDate,
    };

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };

TagResourceRequest _$TagResourceRequestFromJson(Map<String, dynamic> json) {
  return TagResourceRequest(
    secretId: json['SecretId'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
      'Tags': instance.tags,
    };

UntagResourceRequest _$UntagResourceRequestFromJson(Map<String, dynamic> json) {
  return UntagResourceRequest(
    secretId: json['SecretId'] as String,
    tagKeys: (json['TagKeys'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UntagResourceRequestToJson(
        UntagResourceRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
      'TagKeys': instance.tagKeys,
    };

UpdateSecretRequest _$UpdateSecretRequestFromJson(Map<String, dynamic> json) {
  return UpdateSecretRequest(
    secretId: json['SecretId'] as String,
    clientRequestToken: json['ClientRequestToken'] as String,
    description: json['Description'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    secretBinary:
        const Base64Converter().fromJson(json['SecretBinary'] as String),
    secretString: json['SecretString'] as String,
  );
}

Map<String, dynamic> _$UpdateSecretRequestToJson(
        UpdateSecretRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
      'ClientRequestToken': instance.clientRequestToken,
      'Description': instance.description,
      'KmsKeyId': instance.kmsKeyId,
      'SecretBinary': const Base64Converter().toJson(instance.secretBinary),
      'SecretString': instance.secretString,
    };

UpdateSecretResponse _$UpdateSecretResponseFromJson(Map<String, dynamic> json) {
  return UpdateSecretResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$UpdateSecretResponseToJson(
        UpdateSecretResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
      'VersionId': instance.versionId,
    };

UpdateSecretVersionStageRequest _$UpdateSecretVersionStageRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateSecretVersionStageRequest(
    secretId: json['SecretId'] as String,
    versionStage: json['VersionStage'] as String,
    removeFromVersionId: json['RemoveFromVersionId'] as String,
    moveToVersionId: json['MoveToVersionId'] as String,
  );
}

Map<String, dynamic> _$UpdateSecretVersionStageRequestToJson(
        UpdateSecretVersionStageRequest instance) =>
    <String, dynamic>{
      'SecretId': instance.secretId,
      'VersionStage': instance.versionStage,
      'RemoveFromVersionId': instance.removeFromVersionId,
      'MoveToVersionId': instance.moveToVersionId,
    };

UpdateSecretVersionStageResponse _$UpdateSecretVersionStageResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSecretVersionStageResponse(
    aRN: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$UpdateSecretVersionStageResponseToJson(
        UpdateSecretVersionStageResponse instance) =>
    <String, dynamic>{
      'ARN': instance.aRN,
      'Name': instance.name,
    };
