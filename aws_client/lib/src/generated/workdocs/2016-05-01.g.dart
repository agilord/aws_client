// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-05-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivateUserResponse _$ActivateUserResponseFromJson(Map<String, dynamic> json) {
  return ActivateUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
    commentMetadata: json['CommentMetadata'] == null
        ? null
        : CommentMetadata.fromJson(
            json['CommentMetadata'] as Map<String, dynamic>),
    initiator: json['Initiator'] == null
        ? null
        : UserMetadata.fromJson(json['Initiator'] as Map<String, dynamic>),
    isIndirectActivity: json['IsIndirectActivity'] as bool,
    organizationId: json['OrganizationId'] as String,
    originalParent: json['OriginalParent'] == null
        ? null
        : ResourceMetadata.fromJson(
            json['OriginalParent'] as Map<String, dynamic>),
    participants: json['Participants'] == null
        ? null
        : Participants.fromJson(json['Participants'] as Map<String, dynamic>),
    resourceMetadata: json['ResourceMetadata'] == null
        ? null
        : ResourceMetadata.fromJson(
            json['ResourceMetadata'] as Map<String, dynamic>),
    timeStamp: const UnixDateTimeConverter().fromJson(json['TimeStamp']),
    type: _$enumDecodeNullable(_$ActivityTypeEnumMap, json['Type']),
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

const _$ActivityTypeEnumMap = {
  ActivityType.documentCheckedIn: 'DOCUMENT_CHECKED_IN',
  ActivityType.documentCheckedOut: 'DOCUMENT_CHECKED_OUT',
  ActivityType.documentRenamed: 'DOCUMENT_RENAMED',
  ActivityType.documentVersionUploaded: 'DOCUMENT_VERSION_UPLOADED',
  ActivityType.documentVersionDeleted: 'DOCUMENT_VERSION_DELETED',
  ActivityType.documentVersionViewed: 'DOCUMENT_VERSION_VIEWED',
  ActivityType.documentVersionDownloaded: 'DOCUMENT_VERSION_DOWNLOADED',
  ActivityType.documentRecycled: 'DOCUMENT_RECYCLED',
  ActivityType.documentRestored: 'DOCUMENT_RESTORED',
  ActivityType.documentReverted: 'DOCUMENT_REVERTED',
  ActivityType.documentShared: 'DOCUMENT_SHARED',
  ActivityType.documentUnshared: 'DOCUMENT_UNSHARED',
  ActivityType.documentSharePermissionChanged:
      'DOCUMENT_SHARE_PERMISSION_CHANGED',
  ActivityType.documentShareableLinkCreated: 'DOCUMENT_SHAREABLE_LINK_CREATED',
  ActivityType.documentShareableLinkRemoved: 'DOCUMENT_SHAREABLE_LINK_REMOVED',
  ActivityType.documentShareableLinkPermissionChanged:
      'DOCUMENT_SHAREABLE_LINK_PERMISSION_CHANGED',
  ActivityType.documentMoved: 'DOCUMENT_MOVED',
  ActivityType.documentCommentAdded: 'DOCUMENT_COMMENT_ADDED',
  ActivityType.documentCommentDeleted: 'DOCUMENT_COMMENT_DELETED',
  ActivityType.documentAnnotationAdded: 'DOCUMENT_ANNOTATION_ADDED',
  ActivityType.documentAnnotationDeleted: 'DOCUMENT_ANNOTATION_DELETED',
  ActivityType.folderCreated: 'FOLDER_CREATED',
  ActivityType.folderDeleted: 'FOLDER_DELETED',
  ActivityType.folderRenamed: 'FOLDER_RENAMED',
  ActivityType.folderRecycled: 'FOLDER_RECYCLED',
  ActivityType.folderRestored: 'FOLDER_RESTORED',
  ActivityType.folderShared: 'FOLDER_SHARED',
  ActivityType.folderUnshared: 'FOLDER_UNSHARED',
  ActivityType.folderSharePermissionChanged: 'FOLDER_SHARE_PERMISSION_CHANGED',
  ActivityType.folderShareableLinkCreated: 'FOLDER_SHAREABLE_LINK_CREATED',
  ActivityType.folderShareableLinkRemoved: 'FOLDER_SHAREABLE_LINK_REMOVED',
  ActivityType.folderShareableLinkPermissionChanged:
      'FOLDER_SHAREABLE_LINK_PERMISSION_CHANGED',
  ActivityType.folderMoved: 'FOLDER_MOVED',
};

AddResourcePermissionsResponse _$AddResourcePermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return AddResourcePermissionsResponse(
    shareResults: (json['ShareResults'] as List)
        ?.map((e) =>
            e == null ? null : ShareResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    commentId: json['CommentId'] as String,
    contributor: json['Contributor'] == null
        ? null
        : User.fromJson(json['Contributor'] as Map<String, dynamic>),
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    parentId: json['ParentId'] as String,
    recipientId: json['RecipientId'] as String,
    status: _$enumDecodeNullable(_$CommentStatusTypeEnumMap, json['Status']),
    text: json['Text'] as String,
    threadId: json['ThreadId'] as String,
    visibility: _$enumDecodeNullable(
        _$CommentVisibilityTypeEnumMap, json['Visibility']),
  );
}

const _$CommentStatusTypeEnumMap = {
  CommentStatusType.draft: 'DRAFT',
  CommentStatusType.published: 'PUBLISHED',
  CommentStatusType.deleted: 'DELETED',
};

const _$CommentVisibilityTypeEnumMap = {
  CommentVisibilityType.public: 'PUBLIC',
  CommentVisibilityType.private: 'PRIVATE',
};

CommentMetadata _$CommentMetadataFromJson(Map<String, dynamic> json) {
  return CommentMetadata(
    commentId: json['CommentId'] as String,
    commentStatus:
        _$enumDecodeNullable(_$CommentStatusTypeEnumMap, json['CommentStatus']),
    contributor: json['Contributor'] == null
        ? null
        : User.fromJson(json['Contributor'] as Map<String, dynamic>),
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    recipientId: json['RecipientId'] as String,
  );
}

CreateCommentResponse _$CreateCommentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCommentResponse(
    comment: json['Comment'] == null
        ? null
        : Comment.fromJson(json['Comment'] as Map<String, dynamic>),
  );
}

CreateCustomMetadataResponse _$CreateCustomMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCustomMetadataResponse();
}

CreateFolderResponse _$CreateFolderResponseFromJson(Map<String, dynamic> json) {
  return CreateFolderResponse(
    metadata: json['Metadata'] == null
        ? null
        : FolderMetadata.fromJson(json['Metadata'] as Map<String, dynamic>),
  );
}

CreateLabelsResponse _$CreateLabelsResponseFromJson(Map<String, dynamic> json) {
  return CreateLabelsResponse();
}

CreateNotificationSubscriptionResponse
    _$CreateNotificationSubscriptionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateNotificationSubscriptionResponse(
    subscription: json['Subscription'] == null
        ? null
        : Subscription.fromJson(json['Subscription'] as Map<String, dynamic>),
  );
}

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

DeleteCustomMetadataResponse _$DeleteCustomMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCustomMetadataResponse();
}

DeleteLabelsResponse _$DeleteLabelsResponseFromJson(Map<String, dynamic> json) {
  return DeleteLabelsResponse();
}

DescribeActivitiesResponse _$DescribeActivitiesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeActivitiesResponse(
    marker: json['Marker'] as String,
    userActivities: (json['UserActivities'] as List)
        ?.map((e) =>
            e == null ? null : Activity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeCommentsResponse _$DescribeCommentsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCommentsResponse(
    comments: (json['Comments'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

DescribeDocumentVersionsResponse _$DescribeDocumentVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDocumentVersionsResponse(
    documentVersions: (json['DocumentVersions'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentVersionMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

DescribeFolderContentsResponse _$DescribeFolderContentsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFolderContentsResponse(
    documents: (json['Documents'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    folders: (json['Folders'] as List)
        ?.map((e) => e == null
            ? null
            : FolderMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

DescribeGroupsResponse _$DescribeGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeGroupsResponse(
    groups: (json['Groups'] as List)
        ?.map((e) => e == null
            ? null
            : GroupMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

DescribeNotificationSubscriptionsResponse
    _$DescribeNotificationSubscriptionsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeNotificationSubscriptionsResponse(
    marker: json['Marker'] as String,
    subscriptions: (json['Subscriptions'] as List)
        ?.map((e) =>
            e == null ? null : Subscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeResourcePermissionsResponse
    _$DescribeResourcePermissionsResponseFromJson(Map<String, dynamic> json) {
  return DescribeResourcePermissionsResponse(
    marker: json['Marker'] as String,
    principals: (json['Principals'] as List)
        ?.map((e) =>
            e == null ? null : Principal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeRootFoldersResponse _$DescribeRootFoldersResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRootFoldersResponse(
    folders: (json['Folders'] as List)
        ?.map((e) => e == null
            ? null
            : FolderMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

DescribeUsersResponse _$DescribeUsersResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeUsersResponse(
    marker: json['Marker'] as String,
    totalNumberOfUsers: json['TotalNumberOfUsers'] as int,
    users: (json['Users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DocumentMetadata _$DocumentMetadataFromJson(Map<String, dynamic> json) {
  return DocumentMetadata(
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    creatorId: json['CreatorId'] as String,
    id: json['Id'] as String,
    labels: (json['Labels'] as List)?.map((e) => e as String)?.toList(),
    latestVersionMetadata: json['LatestVersionMetadata'] == null
        ? null
        : DocumentVersionMetadata.fromJson(
            json['LatestVersionMetadata'] as Map<String, dynamic>),
    modifiedTimestamp:
        const UnixDateTimeConverter().fromJson(json['ModifiedTimestamp']),
    parentFolderId: json['ParentFolderId'] as String,
    resourceState:
        _$enumDecodeNullable(_$ResourceStateTypeEnumMap, json['ResourceState']),
  );
}

const _$ResourceStateTypeEnumMap = {
  ResourceStateType.active: 'ACTIVE',
  ResourceStateType.restoring: 'RESTORING',
  ResourceStateType.recycling: 'RECYCLING',
  ResourceStateType.recycled: 'RECYCLED',
};

DocumentVersionMetadata _$DocumentVersionMetadataFromJson(
    Map<String, dynamic> json) {
  return DocumentVersionMetadata(
    contentCreatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['ContentCreatedTimestamp']),
    contentModifiedTimestamp: const UnixDateTimeConverter()
        .fromJson(json['ContentModifiedTimestamp']),
    contentType: json['ContentType'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    creatorId: json['CreatorId'] as String,
    id: json['Id'] as String,
    modifiedTimestamp:
        const UnixDateTimeConverter().fromJson(json['ModifiedTimestamp']),
    name: json['Name'] as String,
    signature: json['Signature'] as String,
    size: json['Size'] as int,
    source: (json['Source'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$DocumentSourceTypeEnumMap, k), e as String),
    ),
    status: _$enumDecodeNullable(_$DocumentStatusTypeEnumMap, json['Status']),
    thumbnail: (json['Thumbnail'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$DocumentThumbnailTypeEnumMap, k), e as String),
    ),
  );
}

const _$DocumentSourceTypeEnumMap = {
  DocumentSourceType.original: 'ORIGINAL',
  DocumentSourceType.withComments: 'WITH_COMMENTS',
};

const _$DocumentStatusTypeEnumMap = {
  DocumentStatusType.initialized: 'INITIALIZED',
  DocumentStatusType.active: 'ACTIVE',
};

const _$DocumentThumbnailTypeEnumMap = {
  DocumentThumbnailType.small: 'SMALL',
  DocumentThumbnailType.smallHq: 'SMALL_HQ',
  DocumentThumbnailType.large: 'LARGE',
};

FolderMetadata _$FolderMetadataFromJson(Map<String, dynamic> json) {
  return FolderMetadata(
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    creatorId: json['CreatorId'] as String,
    id: json['Id'] as String,
    labels: (json['Labels'] as List)?.map((e) => e as String)?.toList(),
    latestVersionSize: json['LatestVersionSize'] as int,
    modifiedTimestamp:
        const UnixDateTimeConverter().fromJson(json['ModifiedTimestamp']),
    name: json['Name'] as String,
    parentFolderId: json['ParentFolderId'] as String,
    resourceState:
        _$enumDecodeNullable(_$ResourceStateTypeEnumMap, json['ResourceState']),
    signature: json['Signature'] as String,
    size: json['Size'] as int,
  );
}

GetCurrentUserResponse _$GetCurrentUserResponseFromJson(
    Map<String, dynamic> json) {
  return GetCurrentUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

GetDocumentPathResponse _$GetDocumentPathResponseFromJson(
    Map<String, dynamic> json) {
  return GetDocumentPathResponse(
    path: json['Path'] == null
        ? null
        : ResourcePath.fromJson(json['Path'] as Map<String, dynamic>),
  );
}

GetDocumentResponse _$GetDocumentResponseFromJson(Map<String, dynamic> json) {
  return GetDocumentResponse(
    customMetadata: (json['CustomMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    metadata: json['Metadata'] == null
        ? null
        : DocumentMetadata.fromJson(json['Metadata'] as Map<String, dynamic>),
  );
}

GetDocumentVersionResponse _$GetDocumentVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetDocumentVersionResponse(
    customMetadata: (json['CustomMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    metadata: json['Metadata'] == null
        ? null
        : DocumentVersionMetadata.fromJson(
            json['Metadata'] as Map<String, dynamic>),
  );
}

GetFolderPathResponse _$GetFolderPathResponseFromJson(
    Map<String, dynamic> json) {
  return GetFolderPathResponse(
    path: json['Path'] == null
        ? null
        : ResourcePath.fromJson(json['Path'] as Map<String, dynamic>),
  );
}

GetFolderResponse _$GetFolderResponseFromJson(Map<String, dynamic> json) {
  return GetFolderResponse(
    customMetadata: (json['CustomMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    metadata: json['Metadata'] == null
        ? null
        : FolderMetadata.fromJson(json['Metadata'] as Map<String, dynamic>),
  );
}

GetResourcesResponse _$GetResourcesResponseFromJson(Map<String, dynamic> json) {
  return GetResourcesResponse(
    documents: (json['Documents'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    folders: (json['Folders'] as List)
        ?.map((e) => e == null
            ? null
            : FolderMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

GroupMetadata _$GroupMetadataFromJson(Map<String, dynamic> json) {
  return GroupMetadata(
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

InitiateDocumentVersionUploadResponse
    _$InitiateDocumentVersionUploadResponseFromJson(Map<String, dynamic> json) {
  return InitiateDocumentVersionUploadResponse(
    metadata: json['Metadata'] == null
        ? null
        : DocumentMetadata.fromJson(json['Metadata'] as Map<String, dynamic>),
    uploadMetadata: json['UploadMetadata'] == null
        ? null
        : UploadMetadata.fromJson(
            json['UploadMetadata'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NotificationOptionsToJson(NotificationOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EmailMessage', instance.emailMessage);
  writeNotNull('SendEmail', instance.sendEmail);
  return val;
}

Participants _$ParticipantsFromJson(Map<String, dynamic> json) {
  return Participants(
    groups: (json['Groups'] as List)
        ?.map((e) => e == null
            ? null
            : GroupMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    users: (json['Users'] as List)
        ?.map((e) =>
            e == null ? null : UserMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PermissionInfo _$PermissionInfoFromJson(Map<String, dynamic> json) {
  return PermissionInfo(
    role: _$enumDecodeNullable(_$RoleTypeEnumMap, json['Role']),
    type: _$enumDecodeNullable(_$RolePermissionTypeEnumMap, json['Type']),
  );
}

const _$RoleTypeEnumMap = {
  RoleType.viewer: 'VIEWER',
  RoleType.contributor: 'CONTRIBUTOR',
  RoleType.owner: 'OWNER',
  RoleType.coowner: 'COOWNER',
};

const _$RolePermissionTypeEnumMap = {
  RolePermissionType.direct: 'DIRECT',
  RolePermissionType.inherited: 'INHERITED',
};

Principal _$PrincipalFromJson(Map<String, dynamic> json) {
  return Principal(
    id: json['Id'] as String,
    roles: (json['Roles'] as List)
        ?.map((e) => e == null
            ? null
            : PermissionInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$PrincipalTypeEnumMap, json['Type']),
  );
}

const _$PrincipalTypeEnumMap = {
  PrincipalType.user: 'USER',
  PrincipalType.group: 'GROUP',
  PrincipalType.invite: 'INVITE',
  PrincipalType.anonymous: 'ANONYMOUS',
  PrincipalType.organization: 'ORGANIZATION',
};

ResourceMetadata _$ResourceMetadataFromJson(Map<String, dynamic> json) {
  return ResourceMetadata(
    id: json['Id'] as String,
    name: json['Name'] as String,
    originalName: json['OriginalName'] as String,
    owner: json['Owner'] == null
        ? null
        : UserMetadata.fromJson(json['Owner'] as Map<String, dynamic>),
    parentId: json['ParentId'] as String,
    type: _$enumDecodeNullable(_$ResourceTypeEnumMap, json['Type']),
    versionId: json['VersionId'] as String,
  );
}

const _$ResourceTypeEnumMap = {
  ResourceType.folder: 'FOLDER',
  ResourceType.document: 'DOCUMENT',
};

ResourcePath _$ResourcePathFromJson(Map<String, dynamic> json) {
  return ResourcePath(
    components: (json['Components'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePathComponent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ResourcePathComponent _$ResourcePathComponentFromJson(
    Map<String, dynamic> json) {
  return ResourcePathComponent(
    id: json['Id'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$SharePrincipalToJson(SharePrincipal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Role', _$RoleTypeEnumMap[instance.role]);
  writeNotNull('Type', _$PrincipalTypeEnumMap[instance.type]);
  return val;
}

ShareResult _$ShareResultFromJson(Map<String, dynamic> json) {
  return ShareResult(
    inviteePrincipalId: json['InviteePrincipalId'] as String,
    principalId: json['PrincipalId'] as String,
    role: _$enumDecodeNullable(_$RoleTypeEnumMap, json['Role']),
    shareId: json['ShareId'] as String,
    status: _$enumDecodeNullable(_$ShareStatusTypeEnumMap, json['Status']),
    statusMessage: json['StatusMessage'] as String,
  );
}

const _$ShareStatusTypeEnumMap = {
  ShareStatusType.success: 'SUCCESS',
  ShareStatusType.failure: 'FAILURE',
};

StorageRuleType _$StorageRuleTypeFromJson(Map<String, dynamic> json) {
  return StorageRuleType(
    storageAllocatedInBytes: json['StorageAllocatedInBytes'] as int,
    storageType:
        _$enumDecodeNullable(_$StorageTypeEnumMap, json['StorageType']),
  );
}

Map<String, dynamic> _$StorageRuleTypeToJson(StorageRuleType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StorageAllocatedInBytes', instance.storageAllocatedInBytes);
  writeNotNull('StorageType', _$StorageTypeEnumMap[instance.storageType]);
  return val;
}

const _$StorageTypeEnumMap = {
  StorageType.unlimited: 'UNLIMITED',
  StorageType.quota: 'QUOTA',
};

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
    endPoint: json['EndPoint'] as String,
    protocol: _$enumDecodeNullable(
        _$SubscriptionProtocolTypeEnumMap, json['Protocol']),
    subscriptionId: json['SubscriptionId'] as String,
  );
}

const _$SubscriptionProtocolTypeEnumMap = {
  SubscriptionProtocolType.https: 'HTTPS',
};

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) {
  return UpdateUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

UploadMetadata _$UploadMetadataFromJson(Map<String, dynamic> json) {
  return UploadMetadata(
    signedHeaders: (json['SignedHeaders'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    uploadUrl: json['UploadUrl'] as String,
  );
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    emailAddress: json['EmailAddress'] as String,
    givenName: json['GivenName'] as String,
    id: json['Id'] as String,
    locale: _$enumDecodeNullable(_$LocaleTypeEnumMap, json['Locale']),
    modifiedTimestamp:
        const UnixDateTimeConverter().fromJson(json['ModifiedTimestamp']),
    organizationId: json['OrganizationId'] as String,
    recycleBinFolderId: json['RecycleBinFolderId'] as String,
    rootFolderId: json['RootFolderId'] as String,
    status: _$enumDecodeNullable(_$UserStatusTypeEnumMap, json['Status']),
    storage: json['Storage'] == null
        ? null
        : UserStorageMetadata.fromJson(json['Storage'] as Map<String, dynamic>),
    surname: json['Surname'] as String,
    timeZoneId: json['TimeZoneId'] as String,
    type: _$enumDecodeNullable(_$UserTypeEnumMap, json['Type']),
    username: json['Username'] as String,
  );
}

const _$LocaleTypeEnumMap = {
  LocaleType.en: 'en',
  LocaleType.fr: 'fr',
  LocaleType.ko: 'ko',
  LocaleType.de: 'de',
  LocaleType.es: 'es',
  LocaleType.ja: 'ja',
  LocaleType.ru: 'ru',
  LocaleType.zhCn: 'zh_CN',
  LocaleType.zhTw: 'zh_TW',
  LocaleType.ptBr: 'pt_BR',
  LocaleType.$default: 'default',
};

const _$UserStatusTypeEnumMap = {
  UserStatusType.active: 'ACTIVE',
  UserStatusType.inactive: 'INACTIVE',
  UserStatusType.pending: 'PENDING',
};

const _$UserTypeEnumMap = {
  UserType.user: 'USER',
  UserType.admin: 'ADMIN',
  UserType.poweruser: 'POWERUSER',
  UserType.minimaluser: 'MINIMALUSER',
  UserType.workspacesuser: 'WORKSPACESUSER',
};

UserMetadata _$UserMetadataFromJson(Map<String, dynamic> json) {
  return UserMetadata(
    emailAddress: json['EmailAddress'] as String,
    givenName: json['GivenName'] as String,
    id: json['Id'] as String,
    surname: json['Surname'] as String,
    username: json['Username'] as String,
  );
}

UserStorageMetadata _$UserStorageMetadataFromJson(Map<String, dynamic> json) {
  return UserStorageMetadata(
    storageRule: json['StorageRule'] == null
        ? null
        : StorageRuleType.fromJson(json['StorageRule'] as Map<String, dynamic>),
    storageUtilizedInBytes: json['StorageUtilizedInBytes'] as int,
  );
}
