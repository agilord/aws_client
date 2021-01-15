// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-01-11.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFacetToObjectResponse _$AddFacetToObjectResponseFromJson(
    Map<String, dynamic> json) {
  return AddFacetToObjectResponse();
}

ApplySchemaResponse _$ApplySchemaResponseFromJson(Map<String, dynamic> json) {
  return ApplySchemaResponse(
    appliedSchemaArn: json['AppliedSchemaArn'] as String,
    directoryArn: json['DirectoryArn'] as String,
  );
}

AttachObjectResponse _$AttachObjectResponseFromJson(Map<String, dynamic> json) {
  return AttachObjectResponse(
    attachedObjectIdentifier: json['AttachedObjectIdentifier'] as String,
  );
}

AttachPolicyResponse _$AttachPolicyResponseFromJson(Map<String, dynamic> json) {
  return AttachPolicyResponse();
}

AttachToIndexResponse _$AttachToIndexResponseFromJson(
    Map<String, dynamic> json) {
  return AttachToIndexResponse(
    attachedObjectIdentifier: json['AttachedObjectIdentifier'] as String,
  );
}

AttachTypedLinkResponse _$AttachTypedLinkResponseFromJson(
    Map<String, dynamic> json) {
  return AttachTypedLinkResponse(
    typedLinkSpecifier: json['TypedLinkSpecifier'] == null
        ? null
        : TypedLinkSpecifier.fromJson(
            json['TypedLinkSpecifier'] as Map<String, dynamic>),
  );
}

AttributeKey _$AttributeKeyFromJson(Map<String, dynamic> json) {
  return AttributeKey(
    facetName: json['FacetName'] as String,
    name: json['Name'] as String,
    schemaArn: json['SchemaArn'] as String,
  );
}

Map<String, dynamic> _$AttributeKeyToJson(AttributeKey instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FacetName', instance.facetName);
  writeNotNull('Name', instance.name);
  writeNotNull('SchemaArn', instance.schemaArn);
  return val;
}

AttributeKeyAndValue _$AttributeKeyAndValueFromJson(Map<String, dynamic> json) {
  return AttributeKeyAndValue(
    key: json['Key'] == null
        ? null
        : AttributeKey.fromJson(json['Key'] as Map<String, dynamic>),
    value: json['Value'] == null
        ? null
        : TypedAttributeValue.fromJson(json['Value'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttributeKeyAndValueToJson(
    AttributeKeyAndValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key?.toJson());
  writeNotNull('Value', instance.value?.toJson());
  return val;
}

AttributeNameAndValue _$AttributeNameAndValueFromJson(
    Map<String, dynamic> json) {
  return AttributeNameAndValue(
    attributeName: json['AttributeName'] as String,
    value: json['Value'] == null
        ? null
        : TypedAttributeValue.fromJson(json['Value'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttributeNameAndValueToJson(
    AttributeNameAndValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('Value', instance.value?.toJson());
  return val;
}

Map<String, dynamic> _$BatchAddFacetToObjectToJson(
    BatchAddFacetToObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectAttributeList',
      instance.objectAttributeList?.map((e) => e?.toJson())?.toList());
  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('SchemaFacet', instance.schemaFacet?.toJson());
  return val;
}

BatchAddFacetToObjectResponse _$BatchAddFacetToObjectResponseFromJson(
    Map<String, dynamic> json) {
  return BatchAddFacetToObjectResponse();
}

Map<String, dynamic> _$BatchAttachObjectToJson(BatchAttachObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChildReference', instance.childReference?.toJson());
  writeNotNull('LinkName', instance.linkName);
  writeNotNull('ParentReference', instance.parentReference?.toJson());
  return val;
}

BatchAttachObjectResponse _$BatchAttachObjectResponseFromJson(
    Map<String, dynamic> json) {
  return BatchAttachObjectResponse(
    attachedObjectIdentifier: json['attachedObjectIdentifier'] as String,
  );
}

Map<String, dynamic> _$BatchAttachPolicyToJson(BatchAttachPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('PolicyReference', instance.policyReference?.toJson());
  return val;
}

BatchAttachPolicyResponse _$BatchAttachPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return BatchAttachPolicyResponse();
}

Map<String, dynamic> _$BatchAttachToIndexToJson(BatchAttachToIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexReference', instance.indexReference?.toJson());
  writeNotNull('TargetReference', instance.targetReference?.toJson());
  return val;
}

BatchAttachToIndexResponse _$BatchAttachToIndexResponseFromJson(
    Map<String, dynamic> json) {
  return BatchAttachToIndexResponse(
    attachedObjectIdentifier: json['AttachedObjectIdentifier'] as String,
  );
}

Map<String, dynamic> _$BatchAttachTypedLinkToJson(
    BatchAttachTypedLink instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Attributes', instance.attributes?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'SourceObjectReference', instance.sourceObjectReference?.toJson());
  writeNotNull(
      'TargetObjectReference', instance.targetObjectReference?.toJson());
  writeNotNull('TypedLinkFacet', instance.typedLinkFacet?.toJson());
  return val;
}

BatchAttachTypedLinkResponse _$BatchAttachTypedLinkResponseFromJson(
    Map<String, dynamic> json) {
  return BatchAttachTypedLinkResponse(
    typedLinkSpecifier: json['TypedLinkSpecifier'] == null
        ? null
        : TypedLinkSpecifier.fromJson(
            json['TypedLinkSpecifier'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BatchCreateIndexToJson(BatchCreateIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IsUnique', instance.isUnique);
  writeNotNull('OrderedIndexedAttributeList',
      instance.orderedIndexedAttributeList?.map((e) => e?.toJson())?.toList());
  writeNotNull('BatchReferenceName', instance.batchReferenceName);
  writeNotNull('LinkName', instance.linkName);
  writeNotNull('ParentReference', instance.parentReference?.toJson());
  return val;
}

BatchCreateIndexResponse _$BatchCreateIndexResponseFromJson(
    Map<String, dynamic> json) {
  return BatchCreateIndexResponse(
    objectIdentifier: json['ObjectIdentifier'] as String,
  );
}

Map<String, dynamic> _$BatchCreateObjectToJson(BatchCreateObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectAttributeList',
      instance.objectAttributeList?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'SchemaFacet', instance.schemaFacet?.map((e) => e?.toJson())?.toList());
  writeNotNull('BatchReferenceName', instance.batchReferenceName);
  writeNotNull('LinkName', instance.linkName);
  writeNotNull('ParentReference', instance.parentReference?.toJson());
  return val;
}

BatchCreateObjectResponse _$BatchCreateObjectResponseFromJson(
    Map<String, dynamic> json) {
  return BatchCreateObjectResponse(
    objectIdentifier: json['ObjectIdentifier'] as String,
  );
}

Map<String, dynamic> _$BatchDeleteObjectToJson(BatchDeleteObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  return val;
}

BatchDeleteObjectResponse _$BatchDeleteObjectResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteObjectResponse();
}

Map<String, dynamic> _$BatchDetachFromIndexToJson(
    BatchDetachFromIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexReference', instance.indexReference?.toJson());
  writeNotNull('TargetReference', instance.targetReference?.toJson());
  return val;
}

BatchDetachFromIndexResponse _$BatchDetachFromIndexResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDetachFromIndexResponse(
    detachedObjectIdentifier: json['DetachedObjectIdentifier'] as String,
  );
}

Map<String, dynamic> _$BatchDetachObjectToJson(BatchDetachObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LinkName', instance.linkName);
  writeNotNull('ParentReference', instance.parentReference?.toJson());
  writeNotNull('BatchReferenceName', instance.batchReferenceName);
  return val;
}

BatchDetachObjectResponse _$BatchDetachObjectResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDetachObjectResponse(
    detachedObjectIdentifier: json['detachedObjectIdentifier'] as String,
  );
}

Map<String, dynamic> _$BatchDetachPolicyToJson(BatchDetachPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('PolicyReference', instance.policyReference?.toJson());
  return val;
}

BatchDetachPolicyResponse _$BatchDetachPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDetachPolicyResponse();
}

Map<String, dynamic> _$BatchDetachTypedLinkToJson(
    BatchDetachTypedLink instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TypedLinkSpecifier', instance.typedLinkSpecifier?.toJson());
  return val;
}

BatchDetachTypedLinkResponse _$BatchDetachTypedLinkResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDetachTypedLinkResponse();
}

Map<String, dynamic> _$BatchGetLinkAttributesToJson(
    BatchGetLinkAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeNames', instance.attributeNames);
  writeNotNull('TypedLinkSpecifier', instance.typedLinkSpecifier?.toJson());
  return val;
}

BatchGetLinkAttributesResponse _$BatchGetLinkAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetLinkAttributesResponse(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchGetObjectAttributesToJson(
    BatchGetObjectAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeNames', instance.attributeNames);
  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('SchemaFacet', instance.schemaFacet?.toJson());
  return val;
}

BatchGetObjectAttributesResponse _$BatchGetObjectAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetObjectAttributesResponse(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchGetObjectInformationToJson(
    BatchGetObjectInformation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  return val;
}

BatchGetObjectInformationResponse _$BatchGetObjectInformationResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetObjectInformationResponse(
    objectIdentifier: json['ObjectIdentifier'] as String,
    schemaFacets: (json['SchemaFacets'] as List)
        ?.map((e) =>
            e == null ? null : SchemaFacet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchListAttachedIndicesToJson(
    BatchListAttachedIndices instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetReference', instance.targetReference?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

BatchListAttachedIndicesResponse _$BatchListAttachedIndicesResponseFromJson(
    Map<String, dynamic> json) {
  return BatchListAttachedIndicesResponse(
    indexAttachments: (json['IndexAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : IndexAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$BatchListIncomingTypedLinksToJson(
    BatchListIncomingTypedLinks instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('FilterAttributeRanges',
      instance.filterAttributeRanges?.map((e) => e?.toJson())?.toList());
  writeNotNull('FilterTypedLink', instance.filterTypedLink?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

BatchListIncomingTypedLinksResponse
    _$BatchListIncomingTypedLinksResponseFromJson(Map<String, dynamic> json) {
  return BatchListIncomingTypedLinksResponse(
    linkSpecifiers: (json['LinkSpecifiers'] as List)
        ?.map((e) => e == null
            ? null
            : TypedLinkSpecifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$BatchListIndexToJson(BatchListIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexReference', instance.indexReference?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('RangesOnIndexedValues',
      instance.rangesOnIndexedValues?.map((e) => e?.toJson())?.toList());
  return val;
}

BatchListIndexResponse _$BatchListIndexResponseFromJson(
    Map<String, dynamic> json) {
  return BatchListIndexResponse(
    indexAttachments: (json['IndexAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : IndexAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$BatchListObjectAttributesToJson(
    BatchListObjectAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('FacetFilter', instance.facetFilter?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

BatchListObjectAttributesResponse _$BatchListObjectAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return BatchListObjectAttributesResponse(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$BatchListObjectChildrenToJson(
    BatchListObjectChildren instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

BatchListObjectChildrenResponse _$BatchListObjectChildrenResponseFromJson(
    Map<String, dynamic> json) {
  return BatchListObjectChildrenResponse(
    children: (json['Children'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$BatchListObjectParentPathsToJson(
    BatchListObjectParentPaths instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

BatchListObjectParentPathsResponse _$BatchListObjectParentPathsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchListObjectParentPathsResponse(
    nextToken: json['NextToken'] as String,
    pathToObjectIdentifiersList: (json['PathToObjectIdentifiersList'] as List)
        ?.map((e) => e == null
            ? null
            : PathToObjectIdentifiers.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchListObjectParentsToJson(
    BatchListObjectParents instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

BatchListObjectParentsResponse _$BatchListObjectParentsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchListObjectParentsResponse(
    nextToken: json['NextToken'] as String,
    parentLinks: (json['ParentLinks'] as List)
        ?.map((e) => e == null
            ? null
            : ObjectIdentifierAndLinkNameTuple.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchListObjectPoliciesToJson(
    BatchListObjectPolicies instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

BatchListObjectPoliciesResponse _$BatchListObjectPoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return BatchListObjectPoliciesResponse(
    attachedPolicyIds:
        (json['AttachedPolicyIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$BatchListOutgoingTypedLinksToJson(
    BatchListOutgoingTypedLinks instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('FilterAttributeRanges',
      instance.filterAttributeRanges?.map((e) => e?.toJson())?.toList());
  writeNotNull('FilterTypedLink', instance.filterTypedLink?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

BatchListOutgoingTypedLinksResponse
    _$BatchListOutgoingTypedLinksResponseFromJson(Map<String, dynamic> json) {
  return BatchListOutgoingTypedLinksResponse(
    nextToken: json['NextToken'] as String,
    typedLinkSpecifiers: (json['TypedLinkSpecifiers'] as List)
        ?.map((e) => e == null
            ? null
            : TypedLinkSpecifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchListPolicyAttachmentsToJson(
    BatchListPolicyAttachments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PolicyReference', instance.policyReference?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

BatchListPolicyAttachmentsResponse _$BatchListPolicyAttachmentsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchListPolicyAttachmentsResponse(
    nextToken: json['NextToken'] as String,
    objectIdentifiers:
        (json['ObjectIdentifiers'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$BatchLookupPolicyToJson(BatchLookupPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

BatchLookupPolicyResponse _$BatchLookupPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return BatchLookupPolicyResponse(
    nextToken: json['NextToken'] as String,
    policyToPathList: (json['PolicyToPathList'] as List)
        ?.map((e) =>
            e == null ? null : PolicyToPath.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchReadException _$BatchReadExceptionFromJson(Map<String, dynamic> json) {
  return BatchReadException(
    message: json['Message'] as String,
    type: _$enumDecodeNullable(_$BatchReadExceptionTypeEnumMap, json['Type']),
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

const _$BatchReadExceptionTypeEnumMap = {
  BatchReadExceptionType.validationException: 'ValidationException',
  BatchReadExceptionType.invalidArnException: 'InvalidArnException',
  BatchReadExceptionType.resourceNotFoundException: 'ResourceNotFoundException',
  BatchReadExceptionType.invalidNextTokenException: 'InvalidNextTokenException',
  BatchReadExceptionType.accessDeniedException: 'AccessDeniedException',
  BatchReadExceptionType.notNodeException: 'NotNodeException',
  BatchReadExceptionType.facetValidationException: 'FacetValidationException',
  BatchReadExceptionType.cannotListParentOfRootException:
      'CannotListParentOfRootException',
  BatchReadExceptionType.notIndexException: 'NotIndexException',
  BatchReadExceptionType.notPolicyException: 'NotPolicyException',
  BatchReadExceptionType.directoryNotEnabledException:
      'DirectoryNotEnabledException',
  BatchReadExceptionType.limitExceededException: 'LimitExceededException',
  BatchReadExceptionType.internalServiceException: 'InternalServiceException',
};

Map<String, dynamic> _$BatchReadOperationToJson(BatchReadOperation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GetLinkAttributes', instance.getLinkAttributes?.toJson());
  writeNotNull('GetObjectAttributes', instance.getObjectAttributes?.toJson());
  writeNotNull('GetObjectInformation', instance.getObjectInformation?.toJson());
  writeNotNull('ListAttachedIndices', instance.listAttachedIndices?.toJson());
  writeNotNull(
      'ListIncomingTypedLinks', instance.listIncomingTypedLinks?.toJson());
  writeNotNull('ListIndex', instance.listIndex?.toJson());
  writeNotNull('ListObjectAttributes', instance.listObjectAttributes?.toJson());
  writeNotNull('ListObjectChildren', instance.listObjectChildren?.toJson());
  writeNotNull(
      'ListObjectParentPaths', instance.listObjectParentPaths?.toJson());
  writeNotNull('ListObjectParents', instance.listObjectParents?.toJson());
  writeNotNull('ListObjectPolicies', instance.listObjectPolicies?.toJson());
  writeNotNull(
      'ListOutgoingTypedLinks', instance.listOutgoingTypedLinks?.toJson());
  writeNotNull(
      'ListPolicyAttachments', instance.listPolicyAttachments?.toJson());
  writeNotNull('LookupPolicy', instance.lookupPolicy?.toJson());
  return val;
}

BatchReadOperationResponse _$BatchReadOperationResponseFromJson(
    Map<String, dynamic> json) {
  return BatchReadOperationResponse(
    exceptionResponse: json['ExceptionResponse'] == null
        ? null
        : BatchReadException.fromJson(
            json['ExceptionResponse'] as Map<String, dynamic>),
    successfulResponse: json['SuccessfulResponse'] == null
        ? null
        : BatchReadSuccessfulResponse.fromJson(
            json['SuccessfulResponse'] as Map<String, dynamic>),
  );
}

BatchReadResponse _$BatchReadResponseFromJson(Map<String, dynamic> json) {
  return BatchReadResponse(
    responses: (json['Responses'] as List)
        ?.map((e) => e == null
            ? null
            : BatchReadOperationResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchReadSuccessfulResponse _$BatchReadSuccessfulResponseFromJson(
    Map<String, dynamic> json) {
  return BatchReadSuccessfulResponse(
    getLinkAttributes: json['GetLinkAttributes'] == null
        ? null
        : BatchGetLinkAttributesResponse.fromJson(
            json['GetLinkAttributes'] as Map<String, dynamic>),
    getObjectAttributes: json['GetObjectAttributes'] == null
        ? null
        : BatchGetObjectAttributesResponse.fromJson(
            json['GetObjectAttributes'] as Map<String, dynamic>),
    getObjectInformation: json['GetObjectInformation'] == null
        ? null
        : BatchGetObjectInformationResponse.fromJson(
            json['GetObjectInformation'] as Map<String, dynamic>),
    listAttachedIndices: json['ListAttachedIndices'] == null
        ? null
        : BatchListAttachedIndicesResponse.fromJson(
            json['ListAttachedIndices'] as Map<String, dynamic>),
    listIncomingTypedLinks: json['ListIncomingTypedLinks'] == null
        ? null
        : BatchListIncomingTypedLinksResponse.fromJson(
            json['ListIncomingTypedLinks'] as Map<String, dynamic>),
    listIndex: json['ListIndex'] == null
        ? null
        : BatchListIndexResponse.fromJson(
            json['ListIndex'] as Map<String, dynamic>),
    listObjectAttributes: json['ListObjectAttributes'] == null
        ? null
        : BatchListObjectAttributesResponse.fromJson(
            json['ListObjectAttributes'] as Map<String, dynamic>),
    listObjectChildren: json['ListObjectChildren'] == null
        ? null
        : BatchListObjectChildrenResponse.fromJson(
            json['ListObjectChildren'] as Map<String, dynamic>),
    listObjectParentPaths: json['ListObjectParentPaths'] == null
        ? null
        : BatchListObjectParentPathsResponse.fromJson(
            json['ListObjectParentPaths'] as Map<String, dynamic>),
    listObjectParents: json['ListObjectParents'] == null
        ? null
        : BatchListObjectParentsResponse.fromJson(
            json['ListObjectParents'] as Map<String, dynamic>),
    listObjectPolicies: json['ListObjectPolicies'] == null
        ? null
        : BatchListObjectPoliciesResponse.fromJson(
            json['ListObjectPolicies'] as Map<String, dynamic>),
    listOutgoingTypedLinks: json['ListOutgoingTypedLinks'] == null
        ? null
        : BatchListOutgoingTypedLinksResponse.fromJson(
            json['ListOutgoingTypedLinks'] as Map<String, dynamic>),
    listPolicyAttachments: json['ListPolicyAttachments'] == null
        ? null
        : BatchListPolicyAttachmentsResponse.fromJson(
            json['ListPolicyAttachments'] as Map<String, dynamic>),
    lookupPolicy: json['LookupPolicy'] == null
        ? null
        : BatchLookupPolicyResponse.fromJson(
            json['LookupPolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BatchRemoveFacetFromObjectToJson(
    BatchRemoveFacetFromObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  writeNotNull('SchemaFacet', instance.schemaFacet?.toJson());
  return val;
}

BatchRemoveFacetFromObjectResponse _$BatchRemoveFacetFromObjectResponseFromJson(
    Map<String, dynamic> json) {
  return BatchRemoveFacetFromObjectResponse();
}

Map<String, dynamic> _$BatchUpdateLinkAttributesToJson(
    BatchUpdateLinkAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeUpdates',
      instance.attributeUpdates?.map((e) => e?.toJson())?.toList());
  writeNotNull('TypedLinkSpecifier', instance.typedLinkSpecifier?.toJson());
  return val;
}

BatchUpdateLinkAttributesResponse _$BatchUpdateLinkAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateLinkAttributesResponse();
}

Map<String, dynamic> _$BatchUpdateObjectAttributesToJson(
    BatchUpdateObjectAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeUpdates',
      instance.attributeUpdates?.map((e) => e?.toJson())?.toList());
  writeNotNull('ObjectReference', instance.objectReference?.toJson());
  return val;
}

BatchUpdateObjectAttributesResponse
    _$BatchUpdateObjectAttributesResponseFromJson(Map<String, dynamic> json) {
  return BatchUpdateObjectAttributesResponse(
    objectIdentifier: json['ObjectIdentifier'] as String,
  );
}

Map<String, dynamic> _$BatchWriteOperationToJson(BatchWriteOperation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddFacetToObject', instance.addFacetToObject?.toJson());
  writeNotNull('AttachObject', instance.attachObject?.toJson());
  writeNotNull('AttachPolicy', instance.attachPolicy?.toJson());
  writeNotNull('AttachToIndex', instance.attachToIndex?.toJson());
  writeNotNull('AttachTypedLink', instance.attachTypedLink?.toJson());
  writeNotNull('CreateIndex', instance.createIndex?.toJson());
  writeNotNull('CreateObject', instance.createObject?.toJson());
  writeNotNull('DeleteObject', instance.deleteObject?.toJson());
  writeNotNull('DetachFromIndex', instance.detachFromIndex?.toJson());
  writeNotNull('DetachObject', instance.detachObject?.toJson());
  writeNotNull('DetachPolicy', instance.detachPolicy?.toJson());
  writeNotNull('DetachTypedLink', instance.detachTypedLink?.toJson());
  writeNotNull(
      'RemoveFacetFromObject', instance.removeFacetFromObject?.toJson());
  writeNotNull('UpdateLinkAttributes', instance.updateLinkAttributes?.toJson());
  writeNotNull(
      'UpdateObjectAttributes', instance.updateObjectAttributes?.toJson());
  return val;
}

BatchWriteOperationResponse _$BatchWriteOperationResponseFromJson(
    Map<String, dynamic> json) {
  return BatchWriteOperationResponse(
    addFacetToObject: json['AddFacetToObject'] == null
        ? null
        : BatchAddFacetToObjectResponse.fromJson(
            json['AddFacetToObject'] as Map<String, dynamic>),
    attachObject: json['AttachObject'] == null
        ? null
        : BatchAttachObjectResponse.fromJson(
            json['AttachObject'] as Map<String, dynamic>),
    attachPolicy: json['AttachPolicy'] == null
        ? null
        : BatchAttachPolicyResponse.fromJson(
            json['AttachPolicy'] as Map<String, dynamic>),
    attachToIndex: json['AttachToIndex'] == null
        ? null
        : BatchAttachToIndexResponse.fromJson(
            json['AttachToIndex'] as Map<String, dynamic>),
    attachTypedLink: json['AttachTypedLink'] == null
        ? null
        : BatchAttachTypedLinkResponse.fromJson(
            json['AttachTypedLink'] as Map<String, dynamic>),
    createIndex: json['CreateIndex'] == null
        ? null
        : BatchCreateIndexResponse.fromJson(
            json['CreateIndex'] as Map<String, dynamic>),
    createObject: json['CreateObject'] == null
        ? null
        : BatchCreateObjectResponse.fromJson(
            json['CreateObject'] as Map<String, dynamic>),
    deleteObject: json['DeleteObject'] == null
        ? null
        : BatchDeleteObjectResponse.fromJson(
            json['DeleteObject'] as Map<String, dynamic>),
    detachFromIndex: json['DetachFromIndex'] == null
        ? null
        : BatchDetachFromIndexResponse.fromJson(
            json['DetachFromIndex'] as Map<String, dynamic>),
    detachObject: json['DetachObject'] == null
        ? null
        : BatchDetachObjectResponse.fromJson(
            json['DetachObject'] as Map<String, dynamic>),
    detachPolicy: json['DetachPolicy'] == null
        ? null
        : BatchDetachPolicyResponse.fromJson(
            json['DetachPolicy'] as Map<String, dynamic>),
    detachTypedLink: json['DetachTypedLink'] == null
        ? null
        : BatchDetachTypedLinkResponse.fromJson(
            json['DetachTypedLink'] as Map<String, dynamic>),
    removeFacetFromObject: json['RemoveFacetFromObject'] == null
        ? null
        : BatchRemoveFacetFromObjectResponse.fromJson(
            json['RemoveFacetFromObject'] as Map<String, dynamic>),
    updateLinkAttributes: json['UpdateLinkAttributes'] == null
        ? null
        : BatchUpdateLinkAttributesResponse.fromJson(
            json['UpdateLinkAttributes'] as Map<String, dynamic>),
    updateObjectAttributes: json['UpdateObjectAttributes'] == null
        ? null
        : BatchUpdateObjectAttributesResponse.fromJson(
            json['UpdateObjectAttributes'] as Map<String, dynamic>),
  );
}

BatchWriteResponse _$BatchWriteResponseFromJson(Map<String, dynamic> json) {
  return BatchWriteResponse(
    responses: (json['Responses'] as List)
        ?.map((e) => e == null
            ? null
            : BatchWriteOperationResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateDirectoryResponse _$CreateDirectoryResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDirectoryResponse(
    appliedSchemaArn: json['AppliedSchemaArn'] as String,
    directoryArn: json['DirectoryArn'] as String,
    name: json['Name'] as String,
    objectIdentifier: json['ObjectIdentifier'] as String,
  );
}

CreateFacetResponse _$CreateFacetResponseFromJson(Map<String, dynamic> json) {
  return CreateFacetResponse();
}

CreateIndexResponse _$CreateIndexResponseFromJson(Map<String, dynamic> json) {
  return CreateIndexResponse(
    objectIdentifier: json['ObjectIdentifier'] as String,
  );
}

CreateObjectResponse _$CreateObjectResponseFromJson(Map<String, dynamic> json) {
  return CreateObjectResponse(
    objectIdentifier: json['ObjectIdentifier'] as String,
  );
}

CreateSchemaResponse _$CreateSchemaResponseFromJson(Map<String, dynamic> json) {
  return CreateSchemaResponse(
    schemaArn: json['SchemaArn'] as String,
  );
}

CreateTypedLinkFacetResponse _$CreateTypedLinkFacetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTypedLinkFacetResponse();
}

DeleteDirectoryResponse _$DeleteDirectoryResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDirectoryResponse(
    directoryArn: json['DirectoryArn'] as String,
  );
}

DeleteFacetResponse _$DeleteFacetResponseFromJson(Map<String, dynamic> json) {
  return DeleteFacetResponse();
}

DeleteObjectResponse _$DeleteObjectResponseFromJson(Map<String, dynamic> json) {
  return DeleteObjectResponse();
}

DeleteSchemaResponse _$DeleteSchemaResponseFromJson(Map<String, dynamic> json) {
  return DeleteSchemaResponse(
    schemaArn: json['SchemaArn'] as String,
  );
}

DeleteTypedLinkFacetResponse _$DeleteTypedLinkFacetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTypedLinkFacetResponse();
}

DetachFromIndexResponse _$DetachFromIndexResponseFromJson(
    Map<String, dynamic> json) {
  return DetachFromIndexResponse(
    detachedObjectIdentifier: json['DetachedObjectIdentifier'] as String,
  );
}

DetachObjectResponse _$DetachObjectResponseFromJson(Map<String, dynamic> json) {
  return DetachObjectResponse(
    detachedObjectIdentifier: json['DetachedObjectIdentifier'] as String,
  );
}

DetachPolicyResponse _$DetachPolicyResponseFromJson(Map<String, dynamic> json) {
  return DetachPolicyResponse();
}

Directory _$DirectoryFromJson(Map<String, dynamic> json) {
  return Directory(
    creationDateTime:
        const UnixDateTimeConverter().fromJson(json['CreationDateTime']),
    directoryArn: json['DirectoryArn'] as String,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$DirectoryStateEnumMap, json['State']),
  );
}

const _$DirectoryStateEnumMap = {
  DirectoryState.enabled: 'ENABLED',
  DirectoryState.disabled: 'DISABLED',
  DirectoryState.deleted: 'DELETED',
};

DisableDirectoryResponse _$DisableDirectoryResponseFromJson(
    Map<String, dynamic> json) {
  return DisableDirectoryResponse(
    directoryArn: json['DirectoryArn'] as String,
  );
}

EnableDirectoryResponse _$EnableDirectoryResponseFromJson(
    Map<String, dynamic> json) {
  return EnableDirectoryResponse(
    directoryArn: json['DirectoryArn'] as String,
  );
}

Facet _$FacetFromJson(Map<String, dynamic> json) {
  return Facet(
    facetStyle: _$enumDecodeNullable(_$FacetStyleEnumMap, json['FacetStyle']),
    name: json['Name'] as String,
    objectType: _$enumDecodeNullable(_$ObjectTypeEnumMap, json['ObjectType']),
  );
}

const _$FacetStyleEnumMap = {
  FacetStyle.static: 'STATIC',
  FacetStyle.dynamic: 'DYNAMIC',
};

const _$ObjectTypeEnumMap = {
  ObjectType.node: 'NODE',
  ObjectType.leafNode: 'LEAF_NODE',
  ObjectType.policy: 'POLICY',
  ObjectType.$index: 'INDEX',
};

FacetAttribute _$FacetAttributeFromJson(Map<String, dynamic> json) {
  return FacetAttribute(
    name: json['Name'] as String,
    attributeDefinition: json['AttributeDefinition'] == null
        ? null
        : FacetAttributeDefinition.fromJson(
            json['AttributeDefinition'] as Map<String, dynamic>),
    attributeReference: json['AttributeReference'] == null
        ? null
        : FacetAttributeReference.fromJson(
            json['AttributeReference'] as Map<String, dynamic>),
    requiredBehavior: _$enumDecodeNullable(
        _$RequiredAttributeBehaviorEnumMap, json['RequiredBehavior']),
  );
}

Map<String, dynamic> _$FacetAttributeToJson(FacetAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('AttributeDefinition', instance.attributeDefinition?.toJson());
  writeNotNull('AttributeReference', instance.attributeReference?.toJson());
  writeNotNull('RequiredBehavior',
      _$RequiredAttributeBehaviorEnumMap[instance.requiredBehavior]);
  return val;
}

const _$RequiredAttributeBehaviorEnumMap = {
  RequiredAttributeBehavior.requiredAlways: 'REQUIRED_ALWAYS',
  RequiredAttributeBehavior.notRequired: 'NOT_REQUIRED',
};

FacetAttributeDefinition _$FacetAttributeDefinitionFromJson(
    Map<String, dynamic> json) {
  return FacetAttributeDefinition(
    type: _$enumDecodeNullable(_$FacetAttributeTypeEnumMap, json['Type']),
    defaultValue: json['DefaultValue'] == null
        ? null
        : TypedAttributeValue.fromJson(
            json['DefaultValue'] as Map<String, dynamic>),
    isImmutable: json['IsImmutable'] as bool,
    rules: (json['Rules'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Rule.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$FacetAttributeDefinitionToJson(
    FacetAttributeDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$FacetAttributeTypeEnumMap[instance.type]);
  writeNotNull('DefaultValue', instance.defaultValue?.toJson());
  writeNotNull('IsImmutable', instance.isImmutable);
  writeNotNull(
      'Rules', instance.rules?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

const _$FacetAttributeTypeEnumMap = {
  FacetAttributeType.string: 'STRING',
  FacetAttributeType.binary: 'BINARY',
  FacetAttributeType.boolean: 'BOOLEAN',
  FacetAttributeType.number: 'NUMBER',
  FacetAttributeType.datetime: 'DATETIME',
  FacetAttributeType.variant: 'VARIANT',
};

FacetAttributeReference _$FacetAttributeReferenceFromJson(
    Map<String, dynamic> json) {
  return FacetAttributeReference(
    targetAttributeName: json['TargetAttributeName'] as String,
    targetFacetName: json['TargetFacetName'] as String,
  );
}

Map<String, dynamic> _$FacetAttributeReferenceToJson(
    FacetAttributeReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetAttributeName', instance.targetAttributeName);
  writeNotNull('TargetFacetName', instance.targetFacetName);
  return val;
}

Map<String, dynamic> _$FacetAttributeUpdateToJson(
    FacetAttributeUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$UpdateActionTypeEnumMap[instance.action]);
  writeNotNull('Attribute', instance.attribute?.toJson());
  return val;
}

const _$UpdateActionTypeEnumMap = {
  UpdateActionType.createOrUpdate: 'CREATE_OR_UPDATE',
  UpdateActionType.delete: 'DELETE',
};

GetAppliedSchemaVersionResponse _$GetAppliedSchemaVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppliedSchemaVersionResponse(
    appliedSchemaArn: json['AppliedSchemaArn'] as String,
  );
}

GetDirectoryResponse _$GetDirectoryResponseFromJson(Map<String, dynamic> json) {
  return GetDirectoryResponse(
    directory: json['Directory'] == null
        ? null
        : Directory.fromJson(json['Directory'] as Map<String, dynamic>),
  );
}

GetFacetResponse _$GetFacetResponseFromJson(Map<String, dynamic> json) {
  return GetFacetResponse(
    facet: json['Facet'] == null
        ? null
        : Facet.fromJson(json['Facet'] as Map<String, dynamic>),
  );
}

GetLinkAttributesResponse _$GetLinkAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return GetLinkAttributesResponse(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetObjectAttributesResponse _$GetObjectAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return GetObjectAttributesResponse(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetObjectInformationResponse _$GetObjectInformationResponseFromJson(
    Map<String, dynamic> json) {
  return GetObjectInformationResponse(
    objectIdentifier: json['ObjectIdentifier'] as String,
    schemaFacets: (json['SchemaFacets'] as List)
        ?.map((e) =>
            e == null ? null : SchemaFacet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetSchemaAsJsonResponse _$GetSchemaAsJsonResponseFromJson(
    Map<String, dynamic> json) {
  return GetSchemaAsJsonResponse(
    document: json['Document'] as String,
    name: json['Name'] as String,
  );
}

GetTypedLinkFacetInformationResponse
    _$GetTypedLinkFacetInformationResponseFromJson(Map<String, dynamic> json) {
  return GetTypedLinkFacetInformationResponse(
    identityAttributeOrder: (json['IdentityAttributeOrder'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

IndexAttachment _$IndexAttachmentFromJson(Map<String, dynamic> json) {
  return IndexAttachment(
    indexedAttributes: (json['IndexedAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    objectIdentifier: json['ObjectIdentifier'] as String,
  );
}

Map<String, dynamic> _$LinkAttributeActionToJson(LinkAttributeAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeActionType',
      _$UpdateActionTypeEnumMap[instance.attributeActionType]);
  writeNotNull('AttributeUpdateValue', instance.attributeUpdateValue?.toJson());
  return val;
}

Map<String, dynamic> _$LinkAttributeUpdateToJson(LinkAttributeUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeAction', instance.attributeAction?.toJson());
  writeNotNull('AttributeKey', instance.attributeKey?.toJson());
  return val;
}

ListAppliedSchemaArnsResponse _$ListAppliedSchemaArnsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAppliedSchemaArnsResponse(
    nextToken: json['NextToken'] as String,
    schemaArns: (json['SchemaArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListAttachedIndicesResponse _$ListAttachedIndicesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAttachedIndicesResponse(
    indexAttachments: (json['IndexAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : IndexAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDevelopmentSchemaArnsResponse _$ListDevelopmentSchemaArnsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDevelopmentSchemaArnsResponse(
    nextToken: json['NextToken'] as String,
    schemaArns: (json['SchemaArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListDirectoriesResponse _$ListDirectoriesResponseFromJson(
    Map<String, dynamic> json) {
  return ListDirectoriesResponse(
    directories: (json['Directories'] as List)
        ?.map((e) =>
            e == null ? null : Directory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListFacetAttributesResponse _$ListFacetAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return ListFacetAttributesResponse(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : FacetAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListFacetNamesResponse _$ListFacetNamesResponseFromJson(
    Map<String, dynamic> json) {
  return ListFacetNamesResponse(
    facetNames: (json['FacetNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListIncomingTypedLinksResponse _$ListIncomingTypedLinksResponseFromJson(
    Map<String, dynamic> json) {
  return ListIncomingTypedLinksResponse(
    linkSpecifiers: (json['LinkSpecifiers'] as List)
        ?.map((e) => e == null
            ? null
            : TypedLinkSpecifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListIndexResponse _$ListIndexResponseFromJson(Map<String, dynamic> json) {
  return ListIndexResponse(
    indexAttachments: (json['IndexAttachments'] as List)
        ?.map((e) => e == null
            ? null
            : IndexAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListManagedSchemaArnsResponse _$ListManagedSchemaArnsResponseFromJson(
    Map<String, dynamic> json) {
  return ListManagedSchemaArnsResponse(
    nextToken: json['NextToken'] as String,
    schemaArns: (json['SchemaArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListObjectAttributesResponse _$ListObjectAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return ListObjectAttributesResponse(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeKeyAndValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListObjectChildrenResponse _$ListObjectChildrenResponseFromJson(
    Map<String, dynamic> json) {
  return ListObjectChildrenResponse(
    children: (json['Children'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    nextToken: json['NextToken'] as String,
  );
}

ListObjectParentPathsResponse _$ListObjectParentPathsResponseFromJson(
    Map<String, dynamic> json) {
  return ListObjectParentPathsResponse(
    nextToken: json['NextToken'] as String,
    pathToObjectIdentifiersList: (json['PathToObjectIdentifiersList'] as List)
        ?.map((e) => e == null
            ? null
            : PathToObjectIdentifiers.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListObjectParentsResponse _$ListObjectParentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListObjectParentsResponse(
    nextToken: json['NextToken'] as String,
    parentLinks: (json['ParentLinks'] as List)
        ?.map((e) => e == null
            ? null
            : ObjectIdentifierAndLinkNameTuple.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    parents: (json['Parents'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListObjectPoliciesResponse _$ListObjectPoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return ListObjectPoliciesResponse(
    attachedPolicyIds:
        (json['AttachedPolicyIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListOutgoingTypedLinksResponse _$ListOutgoingTypedLinksResponseFromJson(
    Map<String, dynamic> json) {
  return ListOutgoingTypedLinksResponse(
    nextToken: json['NextToken'] as String,
    typedLinkSpecifiers: (json['TypedLinkSpecifiers'] as List)
        ?.map((e) => e == null
            ? null
            : TypedLinkSpecifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPolicyAttachmentsResponse _$ListPolicyAttachmentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPolicyAttachmentsResponse(
    nextToken: json['NextToken'] as String,
    objectIdentifiers:
        (json['ObjectIdentifiers'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListPublishedSchemaArnsResponse _$ListPublishedSchemaArnsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPublishedSchemaArnsResponse(
    nextToken: json['NextToken'] as String,
    schemaArns: (json['SchemaArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTypedLinkFacetAttributesResponse
    _$ListTypedLinkFacetAttributesResponseFromJson(Map<String, dynamic> json) {
  return ListTypedLinkFacetAttributesResponse(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : TypedLinkAttributeDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTypedLinkFacetNamesResponse _$ListTypedLinkFacetNamesResponseFromJson(
    Map<String, dynamic> json) {
  return ListTypedLinkFacetNamesResponse(
    facetNames: (json['FacetNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

LookupPolicyResponse _$LookupPolicyResponseFromJson(Map<String, dynamic> json) {
  return LookupPolicyResponse(
    nextToken: json['NextToken'] as String,
    policyToPathList: (json['PolicyToPathList'] as List)
        ?.map((e) =>
            e == null ? null : PolicyToPath.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ObjectAttributeActionToJson(
    ObjectAttributeAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ObjectAttributeActionType',
      _$UpdateActionTypeEnumMap[instance.objectAttributeActionType]);
  writeNotNull('ObjectAttributeUpdateValue',
      instance.objectAttributeUpdateValue?.toJson());
  return val;
}

Map<String, dynamic> _$ObjectAttributeRangeToJson(
    ObjectAttributeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeKey', instance.attributeKey?.toJson());
  writeNotNull('Range', instance.range?.toJson());
  return val;
}

Map<String, dynamic> _$ObjectAttributeUpdateToJson(
    ObjectAttributeUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ObjectAttributeAction', instance.objectAttributeAction?.toJson());
  writeNotNull('ObjectAttributeKey', instance.objectAttributeKey?.toJson());
  return val;
}

ObjectIdentifierAndLinkNameTuple _$ObjectIdentifierAndLinkNameTupleFromJson(
    Map<String, dynamic> json) {
  return ObjectIdentifierAndLinkNameTuple(
    linkName: json['LinkName'] as String,
    objectIdentifier: json['ObjectIdentifier'] as String,
  );
}

ObjectReference _$ObjectReferenceFromJson(Map<String, dynamic> json) {
  return ObjectReference(
    selector: json['Selector'] as String,
  );
}

Map<String, dynamic> _$ObjectReferenceToJson(ObjectReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Selector', instance.selector);
  return val;
}

PathToObjectIdentifiers _$PathToObjectIdentifiersFromJson(
    Map<String, dynamic> json) {
  return PathToObjectIdentifiers(
    objectIdentifiers:
        (json['ObjectIdentifiers'] as List)?.map((e) => e as String)?.toList(),
    path: json['Path'] as String,
  );
}

PolicyAttachment _$PolicyAttachmentFromJson(Map<String, dynamic> json) {
  return PolicyAttachment(
    objectIdentifier: json['ObjectIdentifier'] as String,
    policyId: json['PolicyId'] as String,
    policyType: json['PolicyType'] as String,
  );
}

PolicyToPath _$PolicyToPathFromJson(Map<String, dynamic> json) {
  return PolicyToPath(
    path: json['Path'] as String,
    policies: (json['Policies'] as List)
        ?.map((e) => e == null
            ? null
            : PolicyAttachment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PublishSchemaResponse _$PublishSchemaResponseFromJson(
    Map<String, dynamic> json) {
  return PublishSchemaResponse(
    publishedSchemaArn: json['PublishedSchemaArn'] as String,
  );
}

PutSchemaFromJsonResponse _$PutSchemaFromJsonResponseFromJson(
    Map<String, dynamic> json) {
  return PutSchemaFromJsonResponse(
    arn: json['Arn'] as String,
  );
}

RemoveFacetFromObjectResponse _$RemoveFacetFromObjectResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveFacetFromObjectResponse();
}

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$RuleTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$RuleToJson(Rule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Parameters', instance.parameters);
  writeNotNull('Type', _$RuleTypeEnumMap[instance.type]);
  return val;
}

const _$RuleTypeEnumMap = {
  RuleType.binaryLength: 'BINARY_LENGTH',
  RuleType.numberComparison: 'NUMBER_COMPARISON',
  RuleType.stringFromSet: 'STRING_FROM_SET',
  RuleType.stringLength: 'STRING_LENGTH',
};

SchemaFacet _$SchemaFacetFromJson(Map<String, dynamic> json) {
  return SchemaFacet(
    facetName: json['FacetName'] as String,
    schemaArn: json['SchemaArn'] as String,
  );
}

Map<String, dynamic> _$SchemaFacetToJson(SchemaFacet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FacetName', instance.facetName);
  writeNotNull('SchemaArn', instance.schemaArn);
  return val;
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TypedAttributeValue _$TypedAttributeValueFromJson(Map<String, dynamic> json) {
  return TypedAttributeValue(
    binaryValue:
        const Uint8ListConverter().fromJson(json['BinaryValue'] as String),
    booleanValue: json['BooleanValue'] as bool,
    datetimeValue:
        const UnixDateTimeConverter().fromJson(json['DatetimeValue']),
    numberValue: json['NumberValue'] as String,
    stringValue: json['StringValue'] as String,
  );
}

Map<String, dynamic> _$TypedAttributeValueToJson(TypedAttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'BinaryValue', const Uint8ListConverter().toJson(instance.binaryValue));
  writeNotNull('BooleanValue', instance.booleanValue);
  writeNotNull('DatetimeValue',
      const UnixDateTimeConverter().toJson(instance.datetimeValue));
  writeNotNull('NumberValue', instance.numberValue);
  writeNotNull('StringValue', instance.stringValue);
  return val;
}

Map<String, dynamic> _$TypedAttributeValueRangeToJson(
    TypedAttributeValueRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndMode', _$RangeModeEnumMap[instance.endMode]);
  writeNotNull('StartMode', _$RangeModeEnumMap[instance.startMode]);
  writeNotNull('EndValue', instance.endValue?.toJson());
  writeNotNull('StartValue', instance.startValue?.toJson());
  return val;
}

const _$RangeModeEnumMap = {
  RangeMode.first: 'FIRST',
  RangeMode.last: 'LAST',
  RangeMode.lastBeforeMissingValues: 'LAST_BEFORE_MISSING_VALUES',
  RangeMode.inclusive: 'INCLUSIVE',
  RangeMode.exclusive: 'EXCLUSIVE',
};

TypedLinkAttributeDefinition _$TypedLinkAttributeDefinitionFromJson(
    Map<String, dynamic> json) {
  return TypedLinkAttributeDefinition(
    name: json['Name'] as String,
    requiredBehavior: _$enumDecodeNullable(
        _$RequiredAttributeBehaviorEnumMap, json['RequiredBehavior']),
    type: _$enumDecodeNullable(_$FacetAttributeTypeEnumMap, json['Type']),
    defaultValue: json['DefaultValue'] == null
        ? null
        : TypedAttributeValue.fromJson(
            json['DefaultValue'] as Map<String, dynamic>),
    isImmutable: json['IsImmutable'] as bool,
    rules: (json['Rules'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Rule.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$TypedLinkAttributeDefinitionToJson(
    TypedLinkAttributeDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('RequiredBehavior',
      _$RequiredAttributeBehaviorEnumMap[instance.requiredBehavior]);
  writeNotNull('Type', _$FacetAttributeTypeEnumMap[instance.type]);
  writeNotNull('DefaultValue', instance.defaultValue?.toJson());
  writeNotNull('IsImmutable', instance.isImmutable);
  writeNotNull(
      'Rules', instance.rules?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

Map<String, dynamic> _$TypedLinkAttributeRangeToJson(
    TypedLinkAttributeRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Range', instance.range?.toJson());
  writeNotNull('AttributeName', instance.attributeName);
  return val;
}

Map<String, dynamic> _$TypedLinkFacetToJson(TypedLinkFacet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Attributes', instance.attributes?.map((e) => e?.toJson())?.toList());
  writeNotNull('IdentityAttributeOrder', instance.identityAttributeOrder);
  writeNotNull('Name', instance.name);
  return val;
}

Map<String, dynamic> _$TypedLinkFacetAttributeUpdateToJson(
    TypedLinkFacetAttributeUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$UpdateActionTypeEnumMap[instance.action]);
  writeNotNull('Attribute', instance.attribute?.toJson());
  return val;
}

TypedLinkSchemaAndFacetName _$TypedLinkSchemaAndFacetNameFromJson(
    Map<String, dynamic> json) {
  return TypedLinkSchemaAndFacetName(
    schemaArn: json['SchemaArn'] as String,
    typedLinkName: json['TypedLinkName'] as String,
  );
}

Map<String, dynamic> _$TypedLinkSchemaAndFacetNameToJson(
    TypedLinkSchemaAndFacetName instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SchemaArn', instance.schemaArn);
  writeNotNull('TypedLinkName', instance.typedLinkName);
  return val;
}

TypedLinkSpecifier _$TypedLinkSpecifierFromJson(Map<String, dynamic> json) {
  return TypedLinkSpecifier(
    identityAttributeValues: (json['IdentityAttributeValues'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeNameAndValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceObjectReference: json['SourceObjectReference'] == null
        ? null
        : ObjectReference.fromJson(
            json['SourceObjectReference'] as Map<String, dynamic>),
    targetObjectReference: json['TargetObjectReference'] == null
        ? null
        : ObjectReference.fromJson(
            json['TargetObjectReference'] as Map<String, dynamic>),
    typedLinkFacet: json['TypedLinkFacet'] == null
        ? null
        : TypedLinkSchemaAndFacetName.fromJson(
            json['TypedLinkFacet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TypedLinkSpecifierToJson(TypedLinkSpecifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdentityAttributeValues',
      instance.identityAttributeValues?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'SourceObjectReference', instance.sourceObjectReference?.toJson());
  writeNotNull(
      'TargetObjectReference', instance.targetObjectReference?.toJson());
  writeNotNull('TypedLinkFacet', instance.typedLinkFacet?.toJson());
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateFacetResponse _$UpdateFacetResponseFromJson(Map<String, dynamic> json) {
  return UpdateFacetResponse();
}

UpdateLinkAttributesResponse _$UpdateLinkAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateLinkAttributesResponse();
}

UpdateObjectAttributesResponse _$UpdateObjectAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateObjectAttributesResponse(
    objectIdentifier: json['ObjectIdentifier'] as String,
  );
}

UpdateSchemaResponse _$UpdateSchemaResponseFromJson(Map<String, dynamic> json) {
  return UpdateSchemaResponse(
    schemaArn: json['SchemaArn'] as String,
  );
}

UpdateTypedLinkFacetResponse _$UpdateTypedLinkFacetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTypedLinkFacetResponse();
}

UpgradeAppliedSchemaResponse _$UpgradeAppliedSchemaResponseFromJson(
    Map<String, dynamic> json) {
  return UpgradeAppliedSchemaResponse(
    directoryArn: json['DirectoryArn'] as String,
    upgradedSchemaArn: json['UpgradedSchemaArn'] as String,
  );
}

UpgradePublishedSchemaResponse _$UpgradePublishedSchemaResponseFromJson(
    Map<String, dynamic> json) {
  return UpgradePublishedSchemaResponse(
    upgradedSchemaArn: json['UpgradedSchemaArn'] as String,
  );
}
