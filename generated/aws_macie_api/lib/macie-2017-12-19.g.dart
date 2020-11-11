// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'macie-2017-12-19.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessDeniedException _$AccessDeniedExceptionFromJson(
    Map<String, dynamic> json) {
  return AccessDeniedException(
    message: json['message'] as String,
    resourceType: json['resourceType'] as String,
  );
}

Map<String, dynamic> _$AssociateMemberAccountRequestToJson(
    AssociateMemberAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('memberAccountId', instance.memberAccountId);
  return val;
}

Map<String, dynamic> _$AssociateS3ResourcesRequestToJson(
    AssociateS3ResourcesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      's3Resources', instance.s3Resources?.map((e) => e?.toJson())?.toList());
  writeNotNull('memberAccountId', instance.memberAccountId);
  return val;
}

AssociateS3ResourcesResult _$AssociateS3ResourcesResultFromJson(
    Map<String, dynamic> json) {
  return AssociateS3ResourcesResult(
    failedS3Resources: (json['failedS3Resources'] as List)
        ?.map((e) => e == null
            ? null
            : FailedS3Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ClassificationType _$ClassificationTypeFromJson(Map<String, dynamic> json) {
  return ClassificationType(
    continuous: _$enumDecodeNullable(
        _$S3ContinuousClassificationTypeEnumMap, json['continuous']),
    oneTime: _$enumDecodeNullable(
        _$S3OneTimeClassificationTypeEnumMap, json['oneTime']),
  );
}

Map<String, dynamic> _$ClassificationTypeToJson(ClassificationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('continuous',
      _$S3ContinuousClassificationTypeEnumMap[instance.continuous]);
  writeNotNull(
      'oneTime', _$S3OneTimeClassificationTypeEnumMap[instance.oneTime]);
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

const _$S3ContinuousClassificationTypeEnumMap = {
  S3ContinuousClassificationType.full: 'FULL',
};

const _$S3OneTimeClassificationTypeEnumMap = {
  S3OneTimeClassificationType.full: 'FULL',
  S3OneTimeClassificationType.none: 'NONE',
};

Map<String, dynamic> _$ClassificationTypeUpdateToJson(
    ClassificationTypeUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('continuous',
      _$S3ContinuousClassificationTypeEnumMap[instance.continuous]);
  writeNotNull(
      'oneTime', _$S3OneTimeClassificationTypeEnumMap[instance.oneTime]);
  return val;
}

Map<String, dynamic> _$DisassociateMemberAccountRequestToJson(
    DisassociateMemberAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('memberAccountId', instance.memberAccountId);
  return val;
}

Map<String, dynamic> _$DisassociateS3ResourcesRequestToJson(
    DisassociateS3ResourcesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('associatedS3Resources',
      instance.associatedS3Resources?.map((e) => e?.toJson())?.toList());
  writeNotNull('memberAccountId', instance.memberAccountId);
  return val;
}

DisassociateS3ResourcesResult _$DisassociateS3ResourcesResultFromJson(
    Map<String, dynamic> json) {
  return DisassociateS3ResourcesResult(
    failedS3Resources: (json['failedS3Resources'] as List)
        ?.map((e) => e == null
            ? null
            : FailedS3Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

FailedS3Resource _$FailedS3ResourceFromJson(Map<String, dynamic> json) {
  return FailedS3Resource(
    errorCode: json['errorCode'] as String,
    errorMessage: json['errorMessage'] as String,
    failedItem: json['failedItem'] == null
        ? null
        : S3Resource.fromJson(json['failedItem'] as Map<String, dynamic>),
  );
}

InternalException _$InternalExceptionFromJson(Map<String, dynamic> json) {
  return InternalException(
    errorCode: json['errorCode'] as String,
    message: json['message'] as String,
  );
}

InvalidInputException _$InvalidInputExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidInputException(
    errorCode: json['errorCode'] as String,
    fieldName: json['fieldName'] as String,
    message: json['message'] as String,
  );
}

LimitExceededException _$LimitExceededExceptionFromJson(
    Map<String, dynamic> json) {
  return LimitExceededException(
    errorCode: json['errorCode'] as String,
    message: json['message'] as String,
    resourceType: json['resourceType'] as String,
  );
}

Map<String, dynamic> _$ListMemberAccountsRequestToJson(
    ListMemberAccountsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

ListMemberAccountsResult _$ListMemberAccountsResultFromJson(
    Map<String, dynamic> json) {
  return ListMemberAccountsResult(
    memberAccounts: (json['memberAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : MemberAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$ListS3ResourcesRequestToJson(
    ListS3ResourcesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('memberAccountId', instance.memberAccountId);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

ListS3ResourcesResult _$ListS3ResourcesResultFromJson(
    Map<String, dynamic> json) {
  return ListS3ResourcesResult(
    nextToken: json['nextToken'] as String,
    s3Resources: (json['s3Resources'] as List)
        ?.map((e) => e == null
            ? null
            : S3ResourceClassification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MemberAccount _$MemberAccountFromJson(Map<String, dynamic> json) {
  return MemberAccount(
    accountId: json['accountId'] as String,
  );
}

S3Resource _$S3ResourceFromJson(Map<String, dynamic> json) {
  return S3Resource(
    bucketName: json['bucketName'] as String,
    prefix: json['prefix'] as String,
  );
}

Map<String, dynamic> _$S3ResourceToJson(S3Resource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('prefix', instance.prefix);
  return val;
}

S3ResourceClassification _$S3ResourceClassificationFromJson(
    Map<String, dynamic> json) {
  return S3ResourceClassification(
    bucketName: json['bucketName'] as String,
    classificationType: json['classificationType'] == null
        ? null
        : ClassificationType.fromJson(
            json['classificationType'] as Map<String, dynamic>),
    prefix: json['prefix'] as String,
  );
}

Map<String, dynamic> _$S3ResourceClassificationToJson(
    S3ResourceClassification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('classificationType', instance.classificationType?.toJson());
  writeNotNull('prefix', instance.prefix);
  return val;
}

Map<String, dynamic> _$S3ResourceClassificationUpdateToJson(
    S3ResourceClassificationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull(
      'classificationTypeUpdate', instance.classificationTypeUpdate?.toJson());
  writeNotNull('prefix', instance.prefix);
  return val;
}

Map<String, dynamic> _$UpdateS3ResourcesRequestToJson(
    UpdateS3ResourcesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3ResourcesUpdate',
      instance.s3ResourcesUpdate?.map((e) => e?.toJson())?.toList());
  writeNotNull('memberAccountId', instance.memberAccountId);
  return val;
}

UpdateS3ResourcesResult _$UpdateS3ResourcesResultFromJson(
    Map<String, dynamic> json) {
  return UpdateS3ResourcesResult(
    failedS3Resources: (json['failedS3Resources'] as List)
        ?.map((e) => e == null
            ? null
            : FailedS3Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
