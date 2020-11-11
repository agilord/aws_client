// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kms-2014-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AliasListEntry _$AliasListEntryFromJson(Map<String, dynamic> json) {
  return AliasListEntry(
    aliasArn: json['AliasArn'] as String,
    aliasName: json['AliasName'] as String,
    targetKeyId: json['TargetKeyId'] as String,
  );
}

Map<String, dynamic> _$CancelKeyDeletionRequestToJson(
    CancelKeyDeletionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  return val;
}

CancelKeyDeletionResponse _$CancelKeyDeletionResponseFromJson(
    Map<String, dynamic> json) {
  return CancelKeyDeletionResponse(
    keyId: json['KeyId'] as String,
  );
}

Map<String, dynamic> _$ConnectCustomKeyStoreRequestToJson(
    ConnectCustomKeyStoreRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomKeyStoreId', instance.customKeyStoreId);
  return val;
}

ConnectCustomKeyStoreResponse _$ConnectCustomKeyStoreResponseFromJson(
    Map<String, dynamic> json) {
  return ConnectCustomKeyStoreResponse();
}

Map<String, dynamic> _$CreateAliasRequestToJson(CreateAliasRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AliasName', instance.aliasName);
  writeNotNull('TargetKeyId', instance.targetKeyId);
  return val;
}

Map<String, dynamic> _$CreateCustomKeyStoreRequestToJson(
    CreateCustomKeyStoreRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudHsmClusterId', instance.cloudHsmClusterId);
  writeNotNull('CustomKeyStoreName', instance.customKeyStoreName);
  writeNotNull('KeyStorePassword', instance.keyStorePassword);
  writeNotNull('TrustAnchorCertificate', instance.trustAnchorCertificate);
  return val;
}

CreateCustomKeyStoreResponse _$CreateCustomKeyStoreResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCustomKeyStoreResponse(
    customKeyStoreId: json['CustomKeyStoreId'] as String,
  );
}

Map<String, dynamic> _$CreateGrantRequestToJson(CreateGrantRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GranteePrincipal', instance.granteePrincipal);
  writeNotNull('KeyId', instance.keyId);
  writeNotNull('Operations', instance.operations);
  writeNotNull('Constraints', instance.constraints?.toJson());
  writeNotNull('GrantTokens', instance.grantTokens);
  writeNotNull('Name', instance.name);
  writeNotNull('RetiringPrincipal', instance.retiringPrincipal);
  return val;
}

CreateGrantResponse _$CreateGrantResponseFromJson(Map<String, dynamic> json) {
  return CreateGrantResponse(
    grantId: json['GrantId'] as String,
    grantToken: json['GrantToken'] as String,
  );
}

Map<String, dynamic> _$CreateKeyRequestToJson(CreateKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BypassPolicyLockoutSafetyCheck',
      instance.bypassPolicyLockoutSafetyCheck);
  writeNotNull('CustomKeyStoreId', instance.customKeyStoreId);
  writeNotNull('CustomerMasterKeySpec',
      _$CustomerMasterKeySpecEnumMap[instance.customerMasterKeySpec]);
  writeNotNull('Description', instance.description);
  writeNotNull('KeyUsage', _$KeyUsageTypeEnumMap[instance.keyUsage]);
  writeNotNull('Origin', _$OriginTypeEnumMap[instance.origin]);
  writeNotNull('Policy', instance.policy);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
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

const _$OriginTypeEnumMap = {
  OriginType.awsKms: 'AWS_KMS',
  OriginType.external: 'EXTERNAL',
  OriginType.awsCloudhsm: 'AWS_CLOUDHSM',
};

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
    creationDate: unixTimestampFromJson(json['CreationDate']),
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

Map<String, dynamic> _$DecryptRequestToJson(DecryptRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CiphertextBlob',
      const Uint8ListConverter().toJson(instance.ciphertextBlob));
  writeNotNull('EncryptionAlgorithm',
      _$EncryptionAlgorithmSpecEnumMap[instance.encryptionAlgorithm]);
  writeNotNull('EncryptionContext', instance.encryptionContext);
  writeNotNull('GrantTokens', instance.grantTokens);
  writeNotNull('KeyId', instance.keyId);
  return val;
}

const _$EncryptionAlgorithmSpecEnumMap = {
  EncryptionAlgorithmSpec.symmetricDefault: 'SYMMETRIC_DEFAULT',
  EncryptionAlgorithmSpec.rsaesOaepSha_1: 'RSAES_OAEP_SHA_1',
  EncryptionAlgorithmSpec.rsaesOaepSha_256: 'RSAES_OAEP_SHA_256',
};

DecryptResponse _$DecryptResponseFromJson(Map<String, dynamic> json) {
  return DecryptResponse(
    encryptionAlgorithm: _$enumDecodeNullable(
        _$EncryptionAlgorithmSpecEnumMap, json['EncryptionAlgorithm']),
    keyId: json['KeyId'] as String,
    plaintext: const Uint8ListConverter().fromJson(json['Plaintext'] as String),
  );
}

Map<String, dynamic> _$DeleteAliasRequestToJson(DeleteAliasRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AliasName', instance.aliasName);
  return val;
}

Map<String, dynamic> _$DeleteCustomKeyStoreRequestToJson(
    DeleteCustomKeyStoreRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomKeyStoreId', instance.customKeyStoreId);
  return val;
}

DeleteCustomKeyStoreResponse _$DeleteCustomKeyStoreResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCustomKeyStoreResponse();
}

Map<String, dynamic> _$DeleteImportedKeyMaterialRequestToJson(
    DeleteImportedKeyMaterialRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  return val;
}

Map<String, dynamic> _$DescribeCustomKeyStoresRequestToJson(
    DescribeCustomKeyStoresRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomKeyStoreId', instance.customKeyStoreId);
  writeNotNull('CustomKeyStoreName', instance.customKeyStoreName);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
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

Map<String, dynamic> _$DescribeKeyRequestToJson(DescribeKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('GrantTokens', instance.grantTokens);
  return val;
}

DescribeKeyResponse _$DescribeKeyResponseFromJson(Map<String, dynamic> json) {
  return DescribeKeyResponse(
    keyMetadata: json['KeyMetadata'] == null
        ? null
        : KeyMetadata.fromJson(json['KeyMetadata'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DisableKeyRequestToJson(DisableKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  return val;
}

Map<String, dynamic> _$DisableKeyRotationRequestToJson(
    DisableKeyRotationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  return val;
}

Map<String, dynamic> _$DisconnectCustomKeyStoreRequestToJson(
    DisconnectCustomKeyStoreRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomKeyStoreId', instance.customKeyStoreId);
  return val;
}

DisconnectCustomKeyStoreResponse _$DisconnectCustomKeyStoreResponseFromJson(
    Map<String, dynamic> json) {
  return DisconnectCustomKeyStoreResponse();
}

Map<String, dynamic> _$EnableKeyRequestToJson(EnableKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  return val;
}

Map<String, dynamic> _$EnableKeyRotationRequestToJson(
    EnableKeyRotationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  return val;
}

Map<String, dynamic> _$EncryptRequestToJson(EncryptRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull(
      'Plaintext', const Uint8ListConverter().toJson(instance.plaintext));
  writeNotNull('EncryptionAlgorithm',
      _$EncryptionAlgorithmSpecEnumMap[instance.encryptionAlgorithm]);
  writeNotNull('EncryptionContext', instance.encryptionContext);
  writeNotNull('GrantTokens', instance.grantTokens);
  return val;
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

Map<String, dynamic> _$GenerateDataKeyPairRequestToJson(
    GenerateDataKeyPairRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('KeyPairSpec', _$DataKeyPairSpecEnumMap[instance.keyPairSpec]);
  writeNotNull('EncryptionContext', instance.encryptionContext);
  writeNotNull('GrantTokens', instance.grantTokens);
  return val;
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

Map<String, dynamic> _$GenerateDataKeyPairWithoutPlaintextRequestToJson(
    GenerateDataKeyPairWithoutPlaintextRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('KeyPairSpec', _$DataKeyPairSpecEnumMap[instance.keyPairSpec]);
  writeNotNull('EncryptionContext', instance.encryptionContext);
  writeNotNull('GrantTokens', instance.grantTokens);
  return val;
}

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

Map<String, dynamic> _$GenerateDataKeyRequestToJson(
    GenerateDataKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('EncryptionContext', instance.encryptionContext);
  writeNotNull('GrantTokens', instance.grantTokens);
  writeNotNull('KeySpec', _$DataKeySpecEnumMap[instance.keySpec]);
  writeNotNull('NumberOfBytes', instance.numberOfBytes);
  return val;
}

const _$DataKeySpecEnumMap = {
  DataKeySpec.aes_256: 'AES_256',
  DataKeySpec.aes_128: 'AES_128',
};

GenerateDataKeyResponse _$GenerateDataKeyResponseFromJson(
    Map<String, dynamic> json) {
  return GenerateDataKeyResponse(
    ciphertextBlob:
        const Uint8ListConverter().fromJson(json['CiphertextBlob'] as String),
    keyId: json['KeyId'] as String,
    plaintext: const Uint8ListConverter().fromJson(json['Plaintext'] as String),
  );
}

Map<String, dynamic> _$GenerateDataKeyWithoutPlaintextRequestToJson(
    GenerateDataKeyWithoutPlaintextRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('EncryptionContext', instance.encryptionContext);
  writeNotNull('GrantTokens', instance.grantTokens);
  writeNotNull('KeySpec', _$DataKeySpecEnumMap[instance.keySpec]);
  writeNotNull('NumberOfBytes', instance.numberOfBytes);
  return val;
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

Map<String, dynamic> _$GenerateRandomRequestToJson(
    GenerateRandomRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomKeyStoreId', instance.customKeyStoreId);
  writeNotNull('NumberOfBytes', instance.numberOfBytes);
  return val;
}

GenerateRandomResponse _$GenerateRandomResponseFromJson(
    Map<String, dynamic> json) {
  return GenerateRandomResponse(
    plaintext: const Uint8ListConverter().fromJson(json['Plaintext'] as String),
  );
}

Map<String, dynamic> _$GetKeyPolicyRequestToJson(GetKeyPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('PolicyName', instance.policyName);
  return val;
}

GetKeyPolicyResponse _$GetKeyPolicyResponseFromJson(Map<String, dynamic> json) {
  return GetKeyPolicyResponse(
    policy: json['Policy'] as String,
  );
}

Map<String, dynamic> _$GetKeyRotationStatusRequestToJson(
    GetKeyRotationStatusRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  return val;
}

GetKeyRotationStatusResponse _$GetKeyRotationStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetKeyRotationStatusResponse(
    keyRotationEnabled: json['KeyRotationEnabled'] as bool,
  );
}

Map<String, dynamic> _$GetParametersForImportRequestToJson(
    GetParametersForImportRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull(
      'WrappingAlgorithm', _$AlgorithmSpecEnumMap[instance.wrappingAlgorithm]);
  writeNotNull(
      'WrappingKeySpec', _$WrappingKeySpecEnumMap[instance.wrappingKeySpec]);
  return val;
}

const _$AlgorithmSpecEnumMap = {
  AlgorithmSpec.rsaesPkcs1V1_5: 'RSAES_PKCS1_V1_5',
  AlgorithmSpec.rsaesOaepSha_1: 'RSAES_OAEP_SHA_1',
  AlgorithmSpec.rsaesOaepSha_256: 'RSAES_OAEP_SHA_256',
};

const _$WrappingKeySpecEnumMap = {
  WrappingKeySpec.rsa_2048: 'RSA_2048',
};

GetParametersForImportResponse _$GetParametersForImportResponseFromJson(
    Map<String, dynamic> json) {
  return GetParametersForImportResponse(
    importToken:
        const Uint8ListConverter().fromJson(json['ImportToken'] as String),
    keyId: json['KeyId'] as String,
    parametersValidTo: unixTimestampFromJson(json['ParametersValidTo']),
    publicKey: const Uint8ListConverter().fromJson(json['PublicKey'] as String),
  );
}

Map<String, dynamic> _$GetPublicKeyRequestToJson(GetPublicKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('GrantTokens', instance.grantTokens);
  return val;
}

GetPublicKeyResponse _$GetPublicKeyResponseFromJson(Map<String, dynamic> json) {
  return GetPublicKeyResponse(
    customerMasterKeySpec: _$enumDecodeNullable(
        _$CustomerMasterKeySpecEnumMap, json['CustomerMasterKeySpec']),
    encryptionAlgorithms: (json['EncryptionAlgorithms'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    keyId: json['KeyId'] as String,
    keyUsage: _$enumDecodeNullable(_$KeyUsageTypeEnumMap, json['KeyUsage']),
    publicKey: const Uint8ListConverter().fromJson(json['PublicKey'] as String),
    signingAlgorithms:
        (json['SigningAlgorithms'] as List)?.map((e) => e as String)?.toList(),
  );
}

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
    creationDate: unixTimestampFromJson(json['CreationDate']),
    grantId: json['GrantId'] as String,
    granteePrincipal: json['GranteePrincipal'] as String,
    issuingAccount: json['IssuingAccount'] as String,
    keyId: json['KeyId'] as String,
    name: json['Name'] as String,
    operations: (json['Operations'] as List)?.map((e) => e as String)?.toList(),
    retiringPrincipal: json['RetiringPrincipal'] as String,
  );
}

Map<String, dynamic> _$ImportKeyMaterialRequestToJson(
    ImportKeyMaterialRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EncryptedKeyMaterial',
      const Uint8ListConverter().toJson(instance.encryptedKeyMaterial));
  writeNotNull(
      'ImportToken', const Uint8ListConverter().toJson(instance.importToken));
  writeNotNull('KeyId', instance.keyId);
  writeNotNull('ExpirationModel',
      _$ExpirationModelTypeEnumMap[instance.expirationModel]);
  writeNotNull('ValidTo', unixTimestampToJson(instance.validTo));
  return val;
}

const _$ExpirationModelTypeEnumMap = {
  ExpirationModelType.keyMaterialExpires: 'KEY_MATERIAL_EXPIRES',
  ExpirationModelType.keyMaterialDoesNotExpire: 'KEY_MATERIAL_DOES_NOT_EXPIRE',
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
    creationDate: unixTimestampFromJson(json['CreationDate']),
    customKeyStoreId: json['CustomKeyStoreId'] as String,
    customerMasterKeySpec: _$enumDecodeNullable(
        _$CustomerMasterKeySpecEnumMap, json['CustomerMasterKeySpec']),
    deletionDate: unixTimestampFromJson(json['DeletionDate']),
    description: json['Description'] as String,
    enabled: json['Enabled'] as bool,
    encryptionAlgorithms: (json['EncryptionAlgorithms'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    expirationModel: _$enumDecodeNullable(
        _$ExpirationModelTypeEnumMap, json['ExpirationModel']),
    keyManager:
        _$enumDecodeNullable(_$KeyManagerTypeEnumMap, json['KeyManager']),
    keyState: _$enumDecodeNullable(_$KeyStateEnumMap, json['KeyState']),
    keyUsage: _$enumDecodeNullable(_$KeyUsageTypeEnumMap, json['KeyUsage']),
    origin: _$enumDecodeNullable(_$OriginTypeEnumMap, json['Origin']),
    signingAlgorithms:
        (json['SigningAlgorithms'] as List)?.map((e) => e as String)?.toList(),
    validTo: unixTimestampFromJson(json['ValidTo']),
  );
}

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

Map<String, dynamic> _$ListAliasesRequestToJson(ListAliasesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
}

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

Map<String, dynamic> _$ListGrantsRequestToJson(ListGrantsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
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

Map<String, dynamic> _$ListKeyPoliciesRequestToJson(
    ListKeyPoliciesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
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

Map<String, dynamic> _$ListKeysRequestToJson(ListKeysRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
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

Map<String, dynamic> _$ListResourceTagsRequestToJson(
    ListResourceTagsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
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

Map<String, dynamic> _$ListRetirableGrantsRequestToJson(
    ListRetirableGrantsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RetiringPrincipal', instance.retiringPrincipal);
  writeNotNull('Limit', instance.limit);
  writeNotNull('Marker', instance.marker);
  return val;
}

Map<String, dynamic> _$PutKeyPolicyRequestToJson(PutKeyPolicyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('Policy', instance.policy);
  writeNotNull('PolicyName', instance.policyName);
  writeNotNull('BypassPolicyLockoutSafetyCheck',
      instance.bypassPolicyLockoutSafetyCheck);
  return val;
}

Map<String, dynamic> _$ReEncryptRequestToJson(ReEncryptRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CiphertextBlob',
      const Uint8ListConverter().toJson(instance.ciphertextBlob));
  writeNotNull('DestinationKeyId', instance.destinationKeyId);
  writeNotNull(
      'DestinationEncryptionAlgorithm',
      _$EncryptionAlgorithmSpecEnumMap[
          instance.destinationEncryptionAlgorithm]);
  writeNotNull(
      'DestinationEncryptionContext', instance.destinationEncryptionContext);
  writeNotNull('GrantTokens', instance.grantTokens);
  writeNotNull('SourceEncryptionAlgorithm',
      _$EncryptionAlgorithmSpecEnumMap[instance.sourceEncryptionAlgorithm]);
  writeNotNull('SourceEncryptionContext', instance.sourceEncryptionContext);
  writeNotNull('SourceKeyId', instance.sourceKeyId);
  return val;
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

Map<String, dynamic> _$RetireGrantRequestToJson(RetireGrantRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GrantId', instance.grantId);
  writeNotNull('GrantToken', instance.grantToken);
  writeNotNull('KeyId', instance.keyId);
  return val;
}

Map<String, dynamic> _$RevokeGrantRequestToJson(RevokeGrantRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GrantId', instance.grantId);
  writeNotNull('KeyId', instance.keyId);
  return val;
}

Map<String, dynamic> _$ScheduleKeyDeletionRequestToJson(
    ScheduleKeyDeletionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('PendingWindowInDays', instance.pendingWindowInDays);
  return val;
}

ScheduleKeyDeletionResponse _$ScheduleKeyDeletionResponseFromJson(
    Map<String, dynamic> json) {
  return ScheduleKeyDeletionResponse(
    deletionDate: unixTimestampFromJson(json['DeletionDate']),
    keyId: json['KeyId'] as String,
  );
}

Map<String, dynamic> _$SignRequestToJson(SignRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('Message', const Uint8ListConverter().toJson(instance.message));
  writeNotNull('SigningAlgorithm',
      _$SigningAlgorithmSpecEnumMap[instance.signingAlgorithm]);
  writeNotNull('GrantTokens', instance.grantTokens);
  writeNotNull('MessageType', _$MessageTypeEnumMap[instance.messageType]);
  return val;
}

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

const _$MessageTypeEnumMap = {
  MessageType.raw: 'RAW',
  MessageType.digest: 'DIGEST',
};

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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
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

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

Map<String, dynamic> _$UpdateAliasRequestToJson(UpdateAliasRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AliasName', instance.aliasName);
  writeNotNull('TargetKeyId', instance.targetKeyId);
  return val;
}

Map<String, dynamic> _$UpdateCustomKeyStoreRequestToJson(
    UpdateCustomKeyStoreRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomKeyStoreId', instance.customKeyStoreId);
  writeNotNull('CloudHsmClusterId', instance.cloudHsmClusterId);
  writeNotNull('KeyStorePassword', instance.keyStorePassword);
  writeNotNull('NewCustomKeyStoreName', instance.newCustomKeyStoreName);
  return val;
}

UpdateCustomKeyStoreResponse _$UpdateCustomKeyStoreResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateCustomKeyStoreResponse();
}

Map<String, dynamic> _$UpdateKeyDescriptionRequestToJson(
    UpdateKeyDescriptionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  writeNotNull('KeyId', instance.keyId);
  return val;
}

Map<String, dynamic> _$VerifyRequestToJson(VerifyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyId', instance.keyId);
  writeNotNull('Message', const Uint8ListConverter().toJson(instance.message));
  writeNotNull(
      'Signature', const Uint8ListConverter().toJson(instance.signature));
  writeNotNull('SigningAlgorithm',
      _$SigningAlgorithmSpecEnumMap[instance.signingAlgorithm]);
  writeNotNull('GrantTokens', instance.grantTokens);
  writeNotNull('MessageType', _$MessageTypeEnumMap[instance.messageType]);
  return val;
}

VerifyResponse _$VerifyResponseFromJson(Map<String, dynamic> json) {
  return VerifyResponse(
    keyId: json['KeyId'] as String,
    signatureValid: json['SignatureValid'] as bool,
    signingAlgorithm: _$enumDecodeNullable(
        _$SigningAlgorithmSpecEnumMap, json['SigningAlgorithm']),
  );
}
