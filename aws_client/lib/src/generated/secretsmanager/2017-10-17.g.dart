// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-10-17.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRotateSecretResponse _$CancelRotateSecretResponseFromJson(
    Map<String, dynamic> json) {
  return CancelRotateSecretResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

CreateSecretResponse _$CreateSecretResponseFromJson(Map<String, dynamic> json) {
  return CreateSecretResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

DeleteResourcePolicyResponse _$DeleteResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResourcePolicyResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

DeleteSecretResponse _$DeleteSecretResponseFromJson(Map<String, dynamic> json) {
  return DeleteSecretResponse(
    arn: json['ARN'] as String,
    deletionDate: const UnixDateTimeConverter().fromJson(json['DeletionDate']),
    name: json['Name'] as String,
  );
}

DescribeSecretResponse _$DescribeSecretResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSecretResponse(
    arn: json['ARN'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    deletedDate: const UnixDateTimeConverter().fromJson(json['DeletedDate']),
    description: json['Description'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    lastAccessedDate:
        const UnixDateTimeConverter().fromJson(json['LastAccessedDate']),
    lastChangedDate:
        const UnixDateTimeConverter().fromJson(json['LastChangedDate']),
    lastRotatedDate:
        const UnixDateTimeConverter().fromJson(json['LastRotatedDate']),
    name: json['Name'] as String,
    owningService: json['OwningService'] as String,
    rotationEnabled: json['RotationEnabled'] as bool,
    rotationLambdaARN: json['RotationLambdaARN'] as String,
    rotationRules: json['RotationRules'] == null
        ? null
        : RotationRulesType.fromJson(
            json['RotationRules'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    versionIdsToStages:
        (json['VersionIdsToStages'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', _$FilterNameStringTypeEnumMap[instance.key]);
  writeNotNull('Values', instance.values);
  return val;
}

const _$FilterNameStringTypeEnumMap = {
  FilterNameStringType.description: 'description',
  FilterNameStringType.name: 'name',
  FilterNameStringType.tagKey: 'tag-key',
  FilterNameStringType.tagValue: 'tag-value',
  FilterNameStringType.all: 'all',
};

GetRandomPasswordResponse _$GetRandomPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return GetRandomPasswordResponse(
    randomPassword: json['RandomPassword'] as String,
  );
}

GetResourcePolicyResponse _$GetResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourcePolicyResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    resourcePolicy: json['ResourcePolicy'] as String,
  );
}

GetSecretValueResponse _$GetSecretValueResponseFromJson(
    Map<String, dynamic> json) {
  return GetSecretValueResponse(
    arn: json['ARN'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    name: json['Name'] as String,
    secretBinary:
        const Uint8ListConverter().fromJson(json['SecretBinary'] as String),
    secretString: json['SecretString'] as String,
    versionId: json['VersionId'] as String,
    versionStages:
        (json['VersionStages'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListSecretVersionIdsResponse _$ListSecretVersionIdsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSecretVersionIdsResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    nextToken: json['NextToken'] as String,
    versions: (json['Versions'] as List)
        ?.map((e) => e == null
            ? null
            : SecretVersionsListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSecretsResponse _$ListSecretsResponseFromJson(Map<String, dynamic> json) {
  return ListSecretsResponse(
    nextToken: json['NextToken'] as String,
    secretList: (json['SecretList'] as List)
        ?.map((e) => e == null
            ? null
            : SecretListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutResourcePolicyResponse _$PutResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutResourcePolicyResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

PutSecretValueResponse _$PutSecretValueResponseFromJson(
    Map<String, dynamic> json) {
  return PutSecretValueResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
    versionStages:
        (json['VersionStages'] as List)?.map((e) => e as String)?.toList(),
  );
}

RestoreSecretResponse _$RestoreSecretResponseFromJson(
    Map<String, dynamic> json) {
  return RestoreSecretResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

RotateSecretResponse _$RotateSecretResponseFromJson(Map<String, dynamic> json) {
  return RotateSecretResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

RotationRulesType _$RotationRulesTypeFromJson(Map<String, dynamic> json) {
  return RotationRulesType(
    automaticallyAfterDays: json['AutomaticallyAfterDays'] as int,
  );
}

Map<String, dynamic> _$RotationRulesTypeToJson(RotationRulesType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AutomaticallyAfterDays', instance.automaticallyAfterDays);
  return val;
}

SecretListEntry _$SecretListEntryFromJson(Map<String, dynamic> json) {
  return SecretListEntry(
    arn: json['ARN'] as String,
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    deletedDate: const UnixDateTimeConverter().fromJson(json['DeletedDate']),
    description: json['Description'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    lastAccessedDate:
        const UnixDateTimeConverter().fromJson(json['LastAccessedDate']),
    lastChangedDate:
        const UnixDateTimeConverter().fromJson(json['LastChangedDate']),
    lastRotatedDate:
        const UnixDateTimeConverter().fromJson(json['LastRotatedDate']),
    name: json['Name'] as String,
    owningService: json['OwningService'] as String,
    rotationEnabled: json['RotationEnabled'] as bool,
    rotationLambdaARN: json['RotationLambdaARN'] as String,
    rotationRules: json['RotationRules'] == null
        ? null
        : RotationRulesType.fromJson(
            json['RotationRules'] as Map<String, dynamic>),
    secretVersionsToStages:
        (json['SecretVersionsToStages'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SecretVersionsListEntry _$SecretVersionsListEntryFromJson(
    Map<String, dynamic> json) {
  return SecretVersionsListEntry(
    createdDate: const UnixDateTimeConverter().fromJson(json['CreatedDate']),
    lastAccessedDate:
        const UnixDateTimeConverter().fromJson(json['LastAccessedDate']),
    versionId: json['VersionId'] as String,
    versionStages:
        (json['VersionStages'] as List)?.map((e) => e as String)?.toList(),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

UpdateSecretResponse _$UpdateSecretResponseFromJson(Map<String, dynamic> json) {
  return UpdateSecretResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

UpdateSecretVersionStageResponse _$UpdateSecretVersionStageResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSecretVersionStageResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

ValidateResourcePolicyResponse _$ValidateResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return ValidateResourcePolicyResponse(
    policyValidationPassed: json['PolicyValidationPassed'] as bool,
    validationErrors: (json['ValidationErrors'] as List)
        ?.map((e) => e == null
            ? null
            : ValidationErrorsEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ValidationErrorsEntry _$ValidationErrorsEntryFromJson(
    Map<String, dynamic> json) {
  return ValidationErrorsEntry(
    checkName: json['CheckName'] as String,
    errorMessage: json['ErrorMessage'] as String,
  );
}
