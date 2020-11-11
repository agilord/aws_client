// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secretsmanager-2017-10-17.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CancelRotateSecretRequestToJson(
    CancelRotateSecretRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  return val;
}

CancelRotateSecretResponse _$CancelRotateSecretResponseFromJson(
    Map<String, dynamic> json) {
  return CancelRotateSecretResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$CreateSecretRequestToJson(CreateSecretRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('ClientRequestToken', instance.clientRequestToken);
  writeNotNull('Description', instance.description);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull(
      'SecretBinary', const Uint8ListConverter().toJson(instance.secretBinary));
  writeNotNull('SecretString', instance.secretString);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateSecretResponse _$CreateSecretResponseFromJson(Map<String, dynamic> json) {
  return CreateSecretResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$DeleteResourcePolicyRequestToJson(
    DeleteResourcePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  return val;
}

DeleteResourcePolicyResponse _$DeleteResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteResourcePolicyResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$DeleteSecretRequestToJson(DeleteSecretRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  writeNotNull(
      'ForceDeleteWithoutRecovery', instance.forceDeleteWithoutRecovery);
  writeNotNull('RecoveryWindowInDays', instance.recoveryWindowInDays);
  return val;
}

DeleteSecretResponse _$DeleteSecretResponseFromJson(Map<String, dynamic> json) {
  return DeleteSecretResponse(
    arn: json['ARN'] as String,
    deletionDate: unixTimestampFromJson(json['DeletionDate']),
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$DescribeSecretRequestToJson(
    DescribeSecretRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  return val;
}

DescribeSecretResponse _$DescribeSecretResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSecretResponse(
    arn: json['ARN'] as String,
    deletedDate: unixTimestampFromJson(json['DeletedDate']),
    description: json['Description'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    lastAccessedDate: unixTimestampFromJson(json['LastAccessedDate']),
    lastChangedDate: unixTimestampFromJson(json['LastChangedDate']),
    lastRotatedDate: unixTimestampFromJson(json['LastRotatedDate']),
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

Map<String, dynamic> _$GetRandomPasswordRequestToJson(
    GetRandomPasswordRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExcludeCharacters', instance.excludeCharacters);
  writeNotNull('ExcludeLowercase', instance.excludeLowercase);
  writeNotNull('ExcludeNumbers', instance.excludeNumbers);
  writeNotNull('ExcludePunctuation', instance.excludePunctuation);
  writeNotNull('ExcludeUppercase', instance.excludeUppercase);
  writeNotNull('IncludeSpace', instance.includeSpace);
  writeNotNull('PasswordLength', instance.passwordLength);
  writeNotNull('RequireEachIncludedType', instance.requireEachIncludedType);
  return val;
}

GetRandomPasswordResponse _$GetRandomPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return GetRandomPasswordResponse(
    randomPassword: json['RandomPassword'] as String,
  );
}

Map<String, dynamic> _$GetResourcePolicyRequestToJson(
    GetResourcePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  return val;
}

GetResourcePolicyResponse _$GetResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourcePolicyResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    resourcePolicy: json['ResourcePolicy'] as String,
  );
}

Map<String, dynamic> _$GetSecretValueRequestToJson(
    GetSecretValueRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  writeNotNull('VersionId', instance.versionId);
  writeNotNull('VersionStage', instance.versionStage);
  return val;
}

GetSecretValueResponse _$GetSecretValueResponseFromJson(
    Map<String, dynamic> json) {
  return GetSecretValueResponse(
    arn: json['ARN'] as String,
    createdDate: unixTimestampFromJson(json['CreatedDate']),
    name: json['Name'] as String,
    secretBinary:
        const Uint8ListConverter().fromJson(json['SecretBinary'] as String),
    secretString: json['SecretString'] as String,
    versionId: json['VersionId'] as String,
    versionStages:
        (json['VersionStages'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ListSecretVersionIdsRequestToJson(
    ListSecretVersionIdsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  writeNotNull('IncludeDeprecated', instance.includeDeprecated);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListSecretsRequestToJson(ListSecretsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$PutResourcePolicyRequestToJson(
    PutResourcePolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourcePolicy', instance.resourcePolicy);
  writeNotNull('SecretId', instance.secretId);
  return val;
}

PutResourcePolicyResponse _$PutResourcePolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutResourcePolicyResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$PutSecretValueRequestToJson(
    PutSecretValueRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  writeNotNull('ClientRequestToken', instance.clientRequestToken);
  writeNotNull(
      'SecretBinary', const Uint8ListConverter().toJson(instance.secretBinary));
  writeNotNull('SecretString', instance.secretString);
  writeNotNull('VersionStages', instance.versionStages);
  return val;
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

Map<String, dynamic> _$RestoreSecretRequestToJson(
    RestoreSecretRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  return val;
}

RestoreSecretResponse _$RestoreSecretResponseFromJson(
    Map<String, dynamic> json) {
  return RestoreSecretResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$RotateSecretRequestToJson(RotateSecretRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  writeNotNull('ClientRequestToken', instance.clientRequestToken);
  writeNotNull('RotationLambdaARN', instance.rotationLambdaARN);
  writeNotNull('RotationRules', instance.rotationRules?.toJson());
  return val;
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
    deletedDate: unixTimestampFromJson(json['DeletedDate']),
    description: json['Description'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    lastAccessedDate: unixTimestampFromJson(json['LastAccessedDate']),
    lastChangedDate: unixTimestampFromJson(json['LastChangedDate']),
    lastRotatedDate: unixTimestampFromJson(json['LastRotatedDate']),
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
    createdDate: unixTimestampFromJson(json['CreatedDate']),
    lastAccessedDate: unixTimestampFromJson(json['LastAccessedDate']),
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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

Map<String, dynamic> _$UpdateSecretRequestToJson(UpdateSecretRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  writeNotNull('ClientRequestToken', instance.clientRequestToken);
  writeNotNull('Description', instance.description);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull(
      'SecretBinary', const Uint8ListConverter().toJson(instance.secretBinary));
  writeNotNull('SecretString', instance.secretString);
  return val;
}

UpdateSecretResponse _$UpdateSecretResponseFromJson(Map<String, dynamic> json) {
  return UpdateSecretResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$UpdateSecretVersionStageRequestToJson(
    UpdateSecretVersionStageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretId', instance.secretId);
  writeNotNull('VersionStage', instance.versionStage);
  writeNotNull('MoveToVersionId', instance.moveToVersionId);
  writeNotNull('RemoveFromVersionId', instance.removeFromVersionId);
  return val;
}

UpdateSecretVersionStageResponse _$UpdateSecretVersionStageResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSecretVersionStageResponse(
    arn: json['ARN'] as String,
    name: json['Name'] as String,
  );
}
