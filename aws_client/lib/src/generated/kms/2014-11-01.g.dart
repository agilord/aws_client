// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AliasListEntry _$AliasListEntryFromJson(Map<String, dynamic> json) {
  return AliasListEntry(
    aliasArn: json['AliasArn'] as String,
    aliasName: json['AliasName'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedDate']),
    targetKeyId: json['TargetKeyId'] as String,
  );
}

CancelKeyDeletionResponse _$CancelKeyDeletionResponseFromJson(
    Map<String, dynamic> json) {
  return CancelKeyDeletionResponse(
    keyId: json['KeyId'] as String,
  );
}

ConnectCustomKeyStoreResponse _$ConnectCustomKeyStoreResponseFromJson(
    Map<String, dynamic> json) {
  return ConnectCustomKeyStoreResponse();
}

CreateCustomKeyStoreResponse _$CreateCustomKeyStoreResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCustomKeyStoreResponse(
    customKeyStoreId: json['CustomKeyStoreId'] as String,
  );
}

CreateGrantResponse _$CreateGrantResponseFromJson(Map<String, dynamic> json) {
  return CreateGrantResponse(
    grantId: json['GrantId'] as String,
    grantToken: json['GrantToken'] as String,
  );
}

CreateKeyResponse _$CreateKeyResponseFromJson(Map<String, dynamic> json) {
  return CreateKeyResponse(
    keyMetadata: json['KeyMetadata'] == null
        ? null
        : KeyMetadata.fromJson(json['KeyMetadata'] as Map<String, dynamic>),
  );
}

CustomKeyStoresListEntry _$CustomKeyStoresListEntryFromJson(
    Map<String, dynamic> json) {
  return CustomKeyStoresListEntry(
    cloudHsmClusterId: json['CloudHsmClusterId'] as String,
    connectionErrorCode: _$enumDecodeNullable(
        _$ConnectionErrorCodeTypeEnumMap, json['ConnectionErrorCode']),
    connectionState: _$enumDecodeNullable(
        _$ConnectionStateTypeEnumMap, json['ConnectionState']),
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    customKeyStoreId: json['CustomKeyStoreId'] as String,
    customKeyStoreName: json['CustomKeyStoreName'] as String,
    trustAnchorCertificate: json['TrustAnchorCertificate'] as String,
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

const _$ConnectionErrorCodeTypeEnumMap = {
  ConnectionErrorCodeType.invalidCredentials: 'INVALID_CREDENTIALS',
  ConnectionErrorCodeType.clusterNotFound: 'CLUSTER_NOT_FOUND',
  ConnectionErrorCodeType.networkErrors: 'NETWORK_ERRORS',
  ConnectionErrorCodeType.internalError: 'INTERNAL_ERROR',
  ConnectionErrorCodeType.insufficientCloudhsmHsms:
      'INSUFFICIENT_CLOUDHSM_HSMS',
  ConnectionErrorCodeType.userLockedOut: 'USER_LOCKED_OUT',
  ConnectionErrorCodeType.userNotFound: 'USER_NOT_FOUND',
  ConnectionErrorCodeType.userLoggedIn: 'USER_LOGGED_IN',
  ConnectionErrorCodeType.subnetNotFound: 'SUBNET_NOT_FOUND',
};

const _$ConnectionStateTypeEnumMap = {
  ConnectionStateType.connected: 'CONNECTED',
  ConnectionStateType.connecting: 'CONNECTING',
  ConnectionStateType.failed: 'FAILED',
  ConnectionStateType.disconnected: 'DISCONNECTED',
  ConnectionStateType.disconnecting: 'DISCONNECTING',
};

DecryptResponse _$DecryptResponseFromJson(Map<String, dynamic> json) {
  return DecryptResponse(
    encryptionAlgorithm: _$enumDecodeNullable(
        _$EncryptionAlgorithmSpecEnumMap, json['EncryptionAlgorithm']),
    keyId: json['KeyId'] as String,
    plaintext: const Uint8ListConverter().fromJson(json['Plaintext'] as String),
  );
}

const _$EncryptionAlgorithmSpecEnumMap = {
  EncryptionAlgorithmSpec.symmetricDefault: 'SYMMETRIC_DEFAULT',
  EncryptionAlgorithmSpec.rsaesOaepSha_1: 'RSAES_OAEP_SHA_1',
  EncryptionAlgorithmSpec.rsaesOaepSha_256: 'RSAES_OAEP_SHA_256',
};

DeleteCustomKeyStoreResponse _$DeleteCustomKeyStoreResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCustomKeyStoreResponse();
}

DescribeCustomKeyStoresResponse _$DescribeCustomKeyStoresResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCustomKeyStoresResponse(
    customKeyStores: (json['CustomKeyStores'] as List)
        ?.map((e) => e == null
            ? null
            : CustomKeyStoresListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
    truncated: json['Truncated'] as bool,
  );
}

DescribeKeyResponse _$DescribeKeyResponseFromJson(Map<String, dynamic> json) {
  return DescribeKeyResponse(
    keyMetadata: json['KeyMetadata'] == null
        ? null
        : KeyMetadata.fromJson(json['KeyMetadata'] as Map<String, dynamic>),
  );
}

DisconnectCustomKeyStoreResponse _$DisconnectCustomKeyStoreResponseFromJson(
    Map<String, dynamic> json) {
  return DisconnectCustomKeyStoreResponse();
}

EncryptResponse _$EncryptResponseFromJson(Map<String, dynamic> json) {
  return EncryptResponse(
    ciphertextBlob:
        const Uint8ListConverter().fromJson(json['CiphertextBlob'] as String),
    encryptionAlgorithm: _$enumDecodeNullable(
        _$EncryptionAlgorithmSpecEnumMap, json['EncryptionAlgorithm']),
    keyId: json['KeyId'] as String,
  );
}

GenerateDataKeyPairResponse _$GenerateDataKeyPairResponseFromJson(
    Map<String, dynamic> json) {
  return GenerateDataKeyPairResponse(
    keyId: json['KeyId'] as String,
    keyPairSpec:
        _$enumDecodeNullable(_$DataKeyPairSpecEnumMap, json['KeyPairSpec']),
    privateKeyCiphertextBlob: const Uint8ListConverter()
        .fromJson(json['PrivateKeyCiphertextBlob'] as String),
    privateKeyPlaintext: const Uint8ListConverter()
        .fromJson(json['PrivateKeyPlaintext'] as String),
    publicKey: const Uint8ListConverter().fromJson(json['PublicKey'] as String),
  );
}

const _$DataKeyPairSpecEnumMap = {
  DataKeyPairSpec.rsa_2048: 'RSA_2048',
  DataKeyPairSpec.rsa_3072: 'RSA_3072',
  DataKeyPairSpec.rsa_4096: 'RSA_4096',
  DataKeyPairSpec.eccNistP256: 'ECC_NIST_P256',
  DataKeyPairSpec.eccNistP384: 'ECC_NIST_P384',
  DataKeyPairSpec.eccNistP521: 'ECC_NIST_P521',
  DataKeyPairSpec.eccSecgP256k1: 'ECC_SECG_P256K1',
};

GenerateDataKeyPairWithoutPlaintextResponse
    _$GenerateDataKeyPairWithoutPlaintextResponseFromJson(
        Map<String, dynamic> json) {
  return GenerateDataKeyPairWithoutPlaintextResponse(
    keyId: json['KeyId'] as String,
    keyPairSpec:
        _$enumDecodeNullable(_$DataKeyPairSpecEnumMap, json['KeyPairSpec']),
    privateKeyCiphertextBlob: const Uint8ListConverter()
        .fromJson(json['PrivateKeyCiphertextBlob'] as String),
    publicKey: const Uint8ListConverter().fromJson(json['PublicKey'] as String),
  );
}

GenerateDataKeyResponse _$GenerateDataKeyResponseFromJson(
    Map<String, dynamic> json) {
  return GenerateDataKeyResponse(
    ciphertextBlob:
        const Uint8ListConverter().fromJson(json['CiphertextBlob'] as String),
    keyId: json['KeyId'] as String,
    plaintext: const Uint8ListConverter().fromJson(json['Plaintext'] as String),
  );
}

GenerateDataKeyWithoutPlaintextResponse
    _$GenerateDataKeyWithoutPlaintextResponseFromJson(
        Map<String, dynamic> json) {
  return GenerateDataKeyWithoutPlaintextResponse(
    ciphertextBlob:
        const Uint8ListConverter().fromJson(json['CiphertextBlob'] as String),
    keyId: json['KeyId'] as String,
  );
}

GenerateRandomResponse _$GenerateRandomResponseFromJson(
    Map<String, dynamic> json) {
  return GenerateRandomResponse(
    plaintext: const Uint8ListConverter().fromJson(json['Plaintext'] as String),
  );
}

GetKeyPolicyResponse _$GetKeyPolicyResponseFromJson(Map<String, dynamic> json) {
  return GetKeyPolicyResponse(
    policy: json['Policy'] as String,
  );
}

GetKeyRotationStatusResponse _$GetKeyRotationStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetKeyRotationStatusResponse(
    keyRotationEnabled: json['KeyRotationEnabled'] as bool,
  );
}

GetParametersForImportResponse _$GetParametersForImportResponseFromJson(
    Map<String, dynamic> json) {
  return GetParametersForImportResponse(
    importToken:
        const Uint8ListConverter().fromJson(json['ImportToken'] as String),
    keyId: json['KeyId'] as String,
    parametersValidTo:
        const UnixDateTimeConverter().fromJson(json['ParametersValidTo']),
    publicKey: const Uint8ListConverter().fromJson(json['PublicKey'] as String),
  );
}

GetPublicKeyResponse _$GetPublicKeyResponseFromJson(Map<String, dynamic> json) {
  return GetPublicKeyResponse(
    customerMasterKeySpec: _$enumDecodeNullable(
        _$CustomerMasterKeySpecEnumMap, json['CustomerMasterKeySpec']),
    encryptionAlgorithms: (json['EncryptionAlgorithms'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EncryptionAlgorithmSpecEnumMap, e))
        ?.toList(),
    keyId: json['KeyId'] as String,
    keyUsage: _$enumDecodeNullable(_$KeyUsageTypeEnumMap, json['KeyUsage']),
    publicKey: const Uint8ListConverter().fromJson(json['PublicKey'] as String),
    signingAlgorithms: (json['SigningAlgorithms'] as List)
        ?.map((e) => _$enumDecodeNullable(_$SigningAlgorithmSpecEnumMap, e))
        ?.toList(),
  );
}

const _$CustomerMasterKeySpecEnumMap = {
  CustomerMasterKeySpec.rsa_2048: 'RSA_2048',
  CustomerMasterKeySpec.rsa_3072: 'RSA_3072',
  CustomerMasterKeySpec.rsa_4096: 'RSA_4096',
  CustomerMasterKeySpec.eccNistP256: 'ECC_NIST_P256',
  CustomerMasterKeySpec.eccNistP384: 'ECC_NIST_P384',
  CustomerMasterKeySpec.eccNistP521: 'ECC_NIST_P521',
  CustomerMasterKeySpec.eccSecgP256k1: 'ECC_SECG_P256K1',
  CustomerMasterKeySpec.symmetricDefault: 'SYMMETRIC_DEFAULT',
};

const _$KeyUsageTypeEnumMap = {
  KeyUsageType.signVerify: 'SIGN_VERIFY',
  KeyUsageType.encryptDecrypt: 'ENCRYPT_DECRYPT',
};

const _$SigningAlgorithmSpecEnumMap = {
  SigningAlgorithmSpec.rsassaPssSha_256: 'RSASSA_PSS_SHA_256',
  SigningAlgorithmSpec.rsassaPssSha_384: 'RSASSA_PSS_SHA_384',
  SigningAlgorithmSpec.rsassaPssSha_512: 'RSASSA_PSS_SHA_512',
  SigningAlgorithmSpec.rsassaPkcs1V1_5Sha_256: 'RSASSA_PKCS1_V1_5_SHA_256',
  SigningAlgorithmSpec.rsassaPkcs1V1_5Sha_384: 'RSASSA_PKCS1_V1_5_SHA_384',
  SigningAlgorithmSpec.rsassaPkcs1V1_5Sha_512: 'RSASSA_PKCS1_V1_5_SHA_512',
  SigningAlgorithmSpec.ecdsaSha_256: 'ECDSA_SHA_256',
  SigningAlgorithmSpec.ecdsaSha_384: 'ECDSA_SHA_384',
  SigningAlgorithmSpec.ecdsaSha_512: 'ECDSA_SHA_512',
};

GrantConstraints _$GrantConstraintsFromJson(Map<String, dynamic> json) {
  return GrantConstraints(
    encryptionContextEquals:
        (json['EncryptionContextEquals'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    encryptionContextSubset:
        (json['EncryptionContextSubset'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$GrantConstraintsToJson(GrantConstraints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EncryptionContextEquals', instance.encryptionContextEquals);
  writeNotNull('EncryptionContextSubset', instance.encryptionContextSubset);
  return val;
}

GrantListEntry _$GrantListEntryFromJson(Map<String, dynamic> json) {
  return GrantListEntry(
    constraints: json['Constraints'] == null
        ? null
        : GrantConstraints.fromJson(
            json['Constraints'] as Map<String, dynamic>),
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    grantId: json['GrantId'] as String,
    granteePrincipal: json['GranteePrincipal'] as String,
    issuingAccount: json['IssuingAccount'] as String,
    keyId: json['KeyId'] as String,
    name: json['Name'] as String,
    operations: (json['Operations'] as List)
        ?.map((e) => _$enumDecodeNullable(_$GrantOperationEnumMap, e))
        ?.toList(),
    retiringPrincipal: json['RetiringPrincipal'] as String,
  );
}

const _$GrantOperationEnumMap = {
  GrantOperation.decrypt: 'Decrypt',
  GrantOperation.encrypt: 'Encrypt',
  GrantOperation.generateDataKey: 'GenerateDataKey',
  GrantOperation.generateDataKeyWithoutPlaintext:
      'GenerateDataKeyWithoutPlaintext',
  GrantOperation.reEncryptFrom: 'ReEncryptFrom',
  GrantOperation.reEncryptTo: 'ReEncryptTo',
  GrantOperation.sign: 'Sign',
  GrantOperation.verify: 'Verify',
  GrantOperation.getPublicKey: 'GetPublicKey',
  GrantOperation.createGrant: 'CreateGrant',
  GrantOperation.retireGrant: 'RetireGrant',
  GrantOperation.describeKey: 'DescribeKey',
  GrantOperation.generateDataKeyPair: 'GenerateDataKeyPair',
  GrantOperation.generateDataKeyPairWithoutPlaintext:
      'GenerateDataKeyPairWithoutPlaintext',
};

ImportKeyMaterialResponse _$ImportKeyMaterialResponseFromJson(
    Map<String, dynamic> json) {
  return ImportKeyMaterialResponse();
}

KeyListEntry _$KeyListEntryFromJson(Map<String, dynamic> json) {
  return KeyListEntry(
    keyArn: json['KeyArn'] as String,
    keyId: json['KeyId'] as String,
  );
}

KeyMetadata _$KeyMetadataFromJson(Map<String, dynamic> json) {
  return KeyMetadata(
    keyId: json['KeyId'] as String,
    awsAccountId: json['AWSAccountId'] as String,
    arn: json['Arn'] as String,
    cloudHsmClusterId: json['CloudHsmClusterId'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    customKeyStoreId: json['CustomKeyStoreId'] as String,
    customerMasterKeySpec: _$enumDecodeNullable(
        _$CustomerMasterKeySpecEnumMap, json['CustomerMasterKeySpec']),
    deletionDate: const UnixDateTimeConverter().fromJson(json['DeletionDate']),
    description: json['Description'] as String,
    enabled: json['Enabled'] as bool,
    encryptionAlgorithms: (json['EncryptionAlgorithms'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EncryptionAlgorithmSpecEnumMap, e))
        ?.toList(),
    expirationModel: _$enumDecodeNullable(
        _$ExpirationModelTypeEnumMap, json['ExpirationModel']),
    keyManager:
        _$enumDecodeNullable(_$KeyManagerTypeEnumMap, json['KeyManager']),
    keyState: _$enumDecodeNullable(_$KeyStateEnumMap, json['KeyState']),
    keyUsage: _$enumDecodeNullable(_$KeyUsageTypeEnumMap, json['KeyUsage']),
    origin: _$enumDecodeNullable(_$OriginTypeEnumMap, json['Origin']),
    signingAlgorithms: (json['SigningAlgorithms'] as List)
        ?.map((e) => _$enumDecodeNullable(_$SigningAlgorithmSpecEnumMap, e))
        ?.toList(),
    validTo: const UnixDateTimeConverter().fromJson(json['ValidTo']),
  );
}

const _$ExpirationModelTypeEnumMap = {
  ExpirationModelType.keyMaterialExpires: 'KEY_MATERIAL_EXPIRES',
  ExpirationModelType.keyMaterialDoesNotExpire: 'KEY_MATERIAL_DOES_NOT_EXPIRE',
};

const _$KeyManagerTypeEnumMap = {
  KeyManagerType.aws: 'AWS',
  KeyManagerType.customer: 'CUSTOMER',
};

const _$KeyStateEnumMap = {
  KeyState.enabled: 'Enabled',
  KeyState.disabled: 'Disabled',
  KeyState.pendingDeletion: 'PendingDeletion',
  KeyState.pendingImport: 'PendingImport',
  KeyState.unavailable: 'Unavailable',
};

const _$OriginTypeEnumMap = {
  OriginType.awsKms: 'AWS_KMS',
  OriginType.external: 'EXTERNAL',
  OriginType.awsCloudhsm: 'AWS_CLOUDHSM',
};

ListAliasesResponse _$ListAliasesResponseFromJson(Map<String, dynamic> json) {
  return ListAliasesResponse(
    aliases: (json['Aliases'] as List)
        ?.map((e) => e == null
            ? null
            : AliasListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
    truncated: json['Truncated'] as bool,
  );
}

ListGrantsResponse _$ListGrantsResponseFromJson(Map<String, dynamic> json) {
  return ListGrantsResponse(
    grants: (json['Grants'] as List)
        ?.map((e) => e == null
            ? null
            : GrantListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
    truncated: json['Truncated'] as bool,
  );
}

ListKeyPoliciesResponse _$ListKeyPoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return ListKeyPoliciesResponse(
    nextMarker: json['NextMarker'] as String,
    policyNames:
        (json['PolicyNames'] as List)?.map((e) => e as String)?.toList(),
    truncated: json['Truncated'] as bool,
  );
}

ListKeysResponse _$ListKeysResponseFromJson(Map<String, dynamic> json) {
  return ListKeysResponse(
    keys: (json['Keys'] as List)
        ?.map((e) =>
            e == null ? null : KeyListEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
    truncated: json['Truncated'] as bool,
  );
}

ListResourceTagsResponse _$ListResourceTagsResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourceTagsResponse(
    nextMarker: json['NextMarker'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    truncated: json['Truncated'] as bool,
  );
}

ReEncryptResponse _$ReEncryptResponseFromJson(Map<String, dynamic> json) {
  return ReEncryptResponse(
    ciphertextBlob:
        const Uint8ListConverter().fromJson(json['CiphertextBlob'] as String),
    destinationEncryptionAlgorithm: _$enumDecodeNullable(
        _$EncryptionAlgorithmSpecEnumMap,
        json['DestinationEncryptionAlgorithm']),
    keyId: json['KeyId'] as String,
    sourceEncryptionAlgorithm: _$enumDecodeNullable(
        _$EncryptionAlgorithmSpecEnumMap, json['SourceEncryptionAlgorithm']),
    sourceKeyId: json['SourceKeyId'] as String,
  );
}

ScheduleKeyDeletionResponse _$ScheduleKeyDeletionResponseFromJson(
    Map<String, dynamic> json) {
  return ScheduleKeyDeletionResponse(
    deletionDate: const UnixDateTimeConverter().fromJson(json['DeletionDate']),
    keyId: json['KeyId'] as String,
  );
}

SignResponse _$SignResponseFromJson(Map<String, dynamic> json) {
  return SignResponse(
    keyId: json['KeyId'] as String,
    signature: const Uint8ListConverter().fromJson(json['Signature'] as String),
    signingAlgorithm: _$enumDecodeNullable(
        _$SigningAlgorithmSpecEnumMap, json['SigningAlgorithm']),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    tagKey: json['TagKey'] as String,
    tagValue: json['TagValue'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TagKey', instance.tagKey);
  writeNotNull('TagValue', instance.tagValue);
  return val;
}

UpdateCustomKeyStoreResponse _$UpdateCustomKeyStoreResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateCustomKeyStoreResponse();
}

VerifyResponse _$VerifyResponseFromJson(Map<String, dynamic> json) {
  return VerifyResponse(
    keyId: json['KeyId'] as String,
    signatureValid: json['SignatureValid'] as bool,
    signingAlgorithm: _$enumDecodeNullable(
        _$SigningAlgorithmSpecEnumMap, json['SigningAlgorithm']),
  );
}
