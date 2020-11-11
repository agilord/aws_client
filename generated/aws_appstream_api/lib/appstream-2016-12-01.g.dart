// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appstream-2016-12-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessEndpoint _$AccessEndpointFromJson(Map<String, dynamic> json) {
  return AccessEndpoint(
    endpointType:
        _$enumDecodeNullable(_$AccessEndpointTypeEnumMap, json['EndpointType']),
    vpceId: json['VpceId'] as String,
  );
}

Map<String, dynamic> _$AccessEndpointToJson(AccessEndpoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EndpointType', _$AccessEndpointTypeEnumMap[instance.endpointType]);
  writeNotNull('VpceId', instance.vpceId);
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

const _$AccessEndpointTypeEnumMap = {
  AccessEndpointType.streaming: 'STREAMING',
};

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    displayName: json['DisplayName'] as String,
    enabled: json['Enabled'] as bool,
    iconURL: json['IconURL'] as String,
    launchParameters: json['LaunchParameters'] as String,
    launchPath: json['LaunchPath'] as String,
    metadata: (json['Metadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ApplicationSettingsToJson(ApplicationSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('SettingsGroup', instance.settingsGroup);
  return val;
}

ApplicationSettingsResponse _$ApplicationSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return ApplicationSettingsResponse(
    enabled: json['Enabled'] as bool,
    s3BucketName: json['S3BucketName'] as String,
    settingsGroup: json['SettingsGroup'] as String,
  );
}

Map<String, dynamic> _$AssociateFleetRequestToJson(
    AssociateFleetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetName', instance.fleetName);
  writeNotNull('StackName', instance.stackName);
  return val;
}

AssociateFleetResult _$AssociateFleetResultFromJson(Map<String, dynamic> json) {
  return AssociateFleetResult();
}

Map<String, dynamic> _$BatchAssociateUserStackRequestToJson(
    BatchAssociateUserStackRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserStackAssociations',
      instance.userStackAssociations?.map((e) => e?.toJson())?.toList());
  return val;
}

BatchAssociateUserStackResult _$BatchAssociateUserStackResultFromJson(
    Map<String, dynamic> json) {
  return BatchAssociateUserStackResult(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : UserStackAssociationError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchDisassociateUserStackRequestToJson(
    BatchDisassociateUserStackRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserStackAssociations',
      instance.userStackAssociations?.map((e) => e?.toJson())?.toList());
  return val;
}

BatchDisassociateUserStackResult _$BatchDisassociateUserStackResultFromJson(
    Map<String, dynamic> json) {
  return BatchDisassociateUserStackResult(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : UserStackAssociationError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ComputeCapacityToJson(ComputeCapacity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DesiredInstances', instance.desiredInstances);
  return val;
}

ComputeCapacityStatus _$ComputeCapacityStatusFromJson(
    Map<String, dynamic> json) {
  return ComputeCapacityStatus(
    desired: json['Desired'] as int,
    available: json['Available'] as int,
    inUse: json['InUse'] as int,
    running: json['Running'] as int,
  );
}

Map<String, dynamic> _$CopyImageRequestToJson(CopyImageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationImageName', instance.destinationImageName);
  writeNotNull('DestinationRegion', instance.destinationRegion);
  writeNotNull('SourceImageName', instance.sourceImageName);
  writeNotNull(
      'DestinationImageDescription', instance.destinationImageDescription);
  return val;
}

CopyImageResponse _$CopyImageResponseFromJson(Map<String, dynamic> json) {
  return CopyImageResponse(
    destinationImageName: json['DestinationImageName'] as String,
  );
}

Map<String, dynamic> _$CreateDirectoryConfigRequestToJson(
    CreateDirectoryConfigRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryName', instance.directoryName);
  writeNotNull('OrganizationalUnitDistinguishedNames',
      instance.organizationalUnitDistinguishedNames);
  writeNotNull('ServiceAccountCredentials',
      instance.serviceAccountCredentials?.toJson());
  return val;
}

CreateDirectoryConfigResult _$CreateDirectoryConfigResultFromJson(
    Map<String, dynamic> json) {
  return CreateDirectoryConfigResult(
    directoryConfig: json['DirectoryConfig'] == null
        ? null
        : DirectoryConfig.fromJson(
            json['DirectoryConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateFleetRequestToJson(CreateFleetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComputeCapacity', instance.computeCapacity?.toJson());
  writeNotNull('InstanceType', instance.instanceType);
  writeNotNull('Name', instance.name);
  writeNotNull('Description', instance.description);
  writeNotNull(
      'DisconnectTimeoutInSeconds', instance.disconnectTimeoutInSeconds);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('DomainJoinInfo', instance.domainJoinInfo?.toJson());
  writeNotNull(
      'EnableDefaultInternetAccess', instance.enableDefaultInternetAccess);
  writeNotNull('FleetType', _$FleetTypeEnumMap[instance.fleetType]);
  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('IdleDisconnectTimeoutInSeconds',
      instance.idleDisconnectTimeoutInSeconds);
  writeNotNull('ImageArn', instance.imageArn);
  writeNotNull('ImageName', instance.imageName);
  writeNotNull('MaxUserDurationInSeconds', instance.maxUserDurationInSeconds);
  writeNotNull('Tags', instance.tags);
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

const _$FleetTypeEnumMap = {
  FleetType.alwaysOn: 'ALWAYS_ON',
  FleetType.onDemand: 'ON_DEMAND',
};

CreateFleetResult _$CreateFleetResultFromJson(Map<String, dynamic> json) {
  return CreateFleetResult(
    fleet: json['Fleet'] == null
        ? null
        : Fleet.fromJson(json['Fleet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateImageBuilderRequestToJson(
    CreateImageBuilderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceType', instance.instanceType);
  writeNotNull('Name', instance.name);
  writeNotNull('AccessEndpoints',
      instance.accessEndpoints?.map((e) => e?.toJson())?.toList());
  writeNotNull('AppstreamAgentVersion', instance.appstreamAgentVersion);
  writeNotNull('Description', instance.description);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('DomainJoinInfo', instance.domainJoinInfo?.toJson());
  writeNotNull(
      'EnableDefaultInternetAccess', instance.enableDefaultInternetAccess);
  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('ImageArn', instance.imageArn);
  writeNotNull('ImageName', instance.imageName);
  writeNotNull('Tags', instance.tags);
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

CreateImageBuilderResult _$CreateImageBuilderResultFromJson(
    Map<String, dynamic> json) {
  return CreateImageBuilderResult(
    imageBuilder: json['ImageBuilder'] == null
        ? null
        : ImageBuilder.fromJson(json['ImageBuilder'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateImageBuilderStreamingURLRequestToJson(
    CreateImageBuilderStreamingURLRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Validity', instance.validity);
  return val;
}

CreateImageBuilderStreamingURLResult
    _$CreateImageBuilderStreamingURLResultFromJson(Map<String, dynamic> json) {
  return CreateImageBuilderStreamingURLResult(
    expires: unixTimestampFromJson(json['Expires']),
    streamingURL: json['StreamingURL'] as String,
  );
}

Map<String, dynamic> _$CreateStackRequestToJson(CreateStackRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('AccessEndpoints',
      instance.accessEndpoints?.map((e) => e?.toJson())?.toList());
  writeNotNull('ApplicationSettings', instance.applicationSettings?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('EmbedHostDomains', instance.embedHostDomains);
  writeNotNull('FeedbackURL', instance.feedbackURL);
  writeNotNull('RedirectURL', instance.redirectURL);
  writeNotNull('StorageConnectors',
      instance.storageConnectors?.map((e) => e?.toJson())?.toList());
  writeNotNull('Tags', instance.tags);
  writeNotNull(
      'UserSettings', instance.userSettings?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateStackResult _$CreateStackResultFromJson(Map<String, dynamic> json) {
  return CreateStackResult(
    stack: json['Stack'] == null
        ? null
        : Stack.fromJson(json['Stack'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateStreamingURLRequestToJson(
    CreateStreamingURLRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetName', instance.fleetName);
  writeNotNull('StackName', instance.stackName);
  writeNotNull('UserId', instance.userId);
  writeNotNull('ApplicationId', instance.applicationId);
  writeNotNull('SessionContext', instance.sessionContext);
  writeNotNull('Validity', instance.validity);
  return val;
}

CreateStreamingURLResult _$CreateStreamingURLResultFromJson(
    Map<String, dynamic> json) {
  return CreateStreamingURLResult(
    expires: unixTimestampFromJson(json['Expires']),
    streamingURL: json['StreamingURL'] as String,
  );
}

CreateUsageReportSubscriptionResult
    _$CreateUsageReportSubscriptionResultFromJson(Map<String, dynamic> json) {
  return CreateUsageReportSubscriptionResult(
    s3BucketName: json['S3BucketName'] as String,
    schedule:
        _$enumDecodeNullable(_$UsageReportScheduleEnumMap, json['Schedule']),
  );
}

const _$UsageReportScheduleEnumMap = {
  UsageReportSchedule.daily: 'DAILY',
};

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('UserName', instance.userName);
  writeNotNull('FirstName', instance.firstName);
  writeNotNull('LastName', instance.lastName);
  writeNotNull('MessageAction', _$MessageActionEnumMap[instance.messageAction]);
  return val;
}

const _$AuthenticationTypeEnumMap = {
  AuthenticationType.api: 'API',
  AuthenticationType.saml: 'SAML',
  AuthenticationType.userpool: 'USERPOOL',
};

const _$MessageActionEnumMap = {
  MessageAction.suppress: 'SUPPRESS',
  MessageAction.resend: 'RESEND',
};

CreateUserResult _$CreateUserResultFromJson(Map<String, dynamic> json) {
  return CreateUserResult();
}

Map<String, dynamic> _$DeleteDirectoryConfigRequestToJson(
    DeleteDirectoryConfigRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryName', instance.directoryName);
  return val;
}

DeleteDirectoryConfigResult _$DeleteDirectoryConfigResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDirectoryConfigResult();
}

Map<String, dynamic> _$DeleteFleetRequestToJson(DeleteFleetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DeleteFleetResult _$DeleteFleetResultFromJson(Map<String, dynamic> json) {
  return DeleteFleetResult();
}

Map<String, dynamic> _$DeleteImageBuilderRequestToJson(
    DeleteImageBuilderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DeleteImageBuilderResult _$DeleteImageBuilderResultFromJson(
    Map<String, dynamic> json) {
  return DeleteImageBuilderResult(
    imageBuilder: json['ImageBuilder'] == null
        ? null
        : ImageBuilder.fromJson(json['ImageBuilder'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteImagePermissionsRequestToJson(
    DeleteImagePermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('SharedAccountId', instance.sharedAccountId);
  return val;
}

DeleteImagePermissionsResult _$DeleteImagePermissionsResultFromJson(
    Map<String, dynamic> json) {
  return DeleteImagePermissionsResult();
}

Map<String, dynamic> _$DeleteImageRequestToJson(DeleteImageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DeleteImageResult _$DeleteImageResultFromJson(Map<String, dynamic> json) {
  return DeleteImageResult(
    image: json['Image'] == null
        ? null
        : Image.fromJson(json['Image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteStackRequestToJson(DeleteStackRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DeleteStackResult _$DeleteStackResultFromJson(Map<String, dynamic> json) {
  return DeleteStackResult();
}

DeleteUsageReportSubscriptionResult
    _$DeleteUsageReportSubscriptionResultFromJson(Map<String, dynamic> json) {
  return DeleteUsageReportSubscriptionResult();
}

Map<String, dynamic> _$DeleteUserRequestToJson(DeleteUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('UserName', instance.userName);
  return val;
}

DeleteUserResult _$DeleteUserResultFromJson(Map<String, dynamic> json) {
  return DeleteUserResult();
}

Map<String, dynamic> _$DescribeDirectoryConfigsRequestToJson(
    DescribeDirectoryConfigsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryNames', instance.directoryNames);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeDirectoryConfigsResult _$DescribeDirectoryConfigsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeDirectoryConfigsResult(
    directoryConfigs: (json['DirectoryConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : DirectoryConfig.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeFleetsRequestToJson(
    DescribeFleetsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Names', instance.names);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeFleetsResult _$DescribeFleetsResultFromJson(Map<String, dynamic> json) {
  return DescribeFleetsResult(
    fleets: (json['Fleets'] as List)
        ?.map(
            (e) => e == null ? null : Fleet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeImageBuildersRequestToJson(
    DescribeImageBuildersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('Names', instance.names);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeImageBuildersResult _$DescribeImageBuildersResultFromJson(
    Map<String, dynamic> json) {
  return DescribeImageBuildersResult(
    imageBuilders: (json['ImageBuilders'] as List)
        ?.map((e) =>
            e == null ? null : ImageBuilder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeImagePermissionsRequestToJson(
    DescribeImagePermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('SharedAwsAccountIds', instance.sharedAwsAccountIds);
  return val;
}

DescribeImagePermissionsResult _$DescribeImagePermissionsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeImagePermissionsResult(
    name: json['Name'] as String,
    nextToken: json['NextToken'] as String,
    sharedImagePermissionsList: (json['SharedImagePermissionsList'] as List)
        ?.map((e) => e == null
            ? null
            : SharedImagePermissions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeImagesRequestToJson(
    DescribeImagesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arns', instance.arns);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('Names', instance.names);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('Type', _$VisibilityTypeEnumMap[instance.type]);
  return val;
}

const _$VisibilityTypeEnumMap = {
  VisibilityType.public: 'PUBLIC',
  VisibilityType.private: 'PRIVATE',
  VisibilityType.shared: 'SHARED',
};

DescribeImagesResult _$DescribeImagesResultFromJson(Map<String, dynamic> json) {
  return DescribeImagesResult(
    images: (json['Images'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeSessionsRequestToJson(
    DescribeSessionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetName', instance.fleetName);
  writeNotNull('StackName', instance.stackName);
  writeNotNull('AuthenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('Limit', instance.limit);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('UserId', instance.userId);
  return val;
}

DescribeSessionsResult _$DescribeSessionsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeSessionsResult(
    nextToken: json['NextToken'] as String,
    sessions: (json['Sessions'] as List)
        ?.map((e) =>
            e == null ? null : Session.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeStacksRequestToJson(
    DescribeStacksRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Names', instance.names);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeStacksResult _$DescribeStacksResultFromJson(Map<String, dynamic> json) {
  return DescribeStacksResult(
    nextToken: json['NextToken'] as String,
    stacks: (json['Stacks'] as List)
        ?.map(
            (e) => e == null ? null : Stack.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeUsageReportSubscriptionsRequestToJson(
    DescribeUsageReportSubscriptionsRequest instance) {
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

DescribeUsageReportSubscriptionsResult
    _$DescribeUsageReportSubscriptionsResultFromJson(
        Map<String, dynamic> json) {
  return DescribeUsageReportSubscriptionsResult(
    nextToken: json['NextToken'] as String,
    usageReportSubscriptions: (json['UsageReportSubscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : UsageReportSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeUserStackAssociationsRequestToJson(
    DescribeUserStackAssociationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StackName', instance.stackName);
  writeNotNull('UserName', instance.userName);
  return val;
}

DescribeUserStackAssociationsResult
    _$DescribeUserStackAssociationsResultFromJson(Map<String, dynamic> json) {
  return DescribeUserStackAssociationsResult(
    nextToken: json['NextToken'] as String,
    userStackAssociations: (json['UserStackAssociations'] as List)
        ?.map((e) => e == null
            ? null
            : UserStackAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeUsersRequestToJson(
    DescribeUsersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

DescribeUsersResult _$DescribeUsersResultFromJson(Map<String, dynamic> json) {
  return DescribeUsersResult(
    nextToken: json['NextToken'] as String,
    users: (json['Users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DirectoryConfig _$DirectoryConfigFromJson(Map<String, dynamic> json) {
  return DirectoryConfig(
    directoryName: json['DirectoryName'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    organizationalUnitDistinguishedNames:
        (json['OrganizationalUnitDistinguishedNames'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    serviceAccountCredentials: json['ServiceAccountCredentials'] == null
        ? null
        : ServiceAccountCredentials.fromJson(
            json['ServiceAccountCredentials'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DisableUserRequestToJson(DisableUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('UserName', instance.userName);
  return val;
}

DisableUserResult _$DisableUserResultFromJson(Map<String, dynamic> json) {
  return DisableUserResult();
}

Map<String, dynamic> _$DisassociateFleetRequestToJson(
    DisassociateFleetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetName', instance.fleetName);
  writeNotNull('StackName', instance.stackName);
  return val;
}

DisassociateFleetResult _$DisassociateFleetResultFromJson(
    Map<String, dynamic> json) {
  return DisassociateFleetResult();
}

DomainJoinInfo _$DomainJoinInfoFromJson(Map<String, dynamic> json) {
  return DomainJoinInfo(
    directoryName: json['DirectoryName'] as String,
    organizationalUnitDistinguishedName:
        json['OrganizationalUnitDistinguishedName'] as String,
  );
}

Map<String, dynamic> _$DomainJoinInfoToJson(DomainJoinInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryName', instance.directoryName);
  writeNotNull('OrganizationalUnitDistinguishedName',
      instance.organizationalUnitDistinguishedName);
  return val;
}

Map<String, dynamic> _$EnableUserRequestToJson(EnableUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('UserName', instance.userName);
  return val;
}

EnableUserResult _$EnableUserResultFromJson(Map<String, dynamic> json) {
  return EnableUserResult();
}

Map<String, dynamic> _$ExpireSessionRequestToJson(
    ExpireSessionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SessionId', instance.sessionId);
  return val;
}

ExpireSessionResult _$ExpireSessionResultFromJson(Map<String, dynamic> json) {
  return ExpireSessionResult();
}

Fleet _$FleetFromJson(Map<String, dynamic> json) {
  return Fleet(
    arn: json['Arn'] as String,
    computeCapacityStatus: json['ComputeCapacityStatus'] == null
        ? null
        : ComputeCapacityStatus.fromJson(
            json['ComputeCapacityStatus'] as Map<String, dynamic>),
    instanceType: json['InstanceType'] as String,
    name: json['Name'] as String,
    state: _$enumDecodeNullable(_$FleetStateEnumMap, json['State']),
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    disconnectTimeoutInSeconds: json['DisconnectTimeoutInSeconds'] as int,
    displayName: json['DisplayName'] as String,
    domainJoinInfo: json['DomainJoinInfo'] == null
        ? null
        : DomainJoinInfo.fromJson(
            json['DomainJoinInfo'] as Map<String, dynamic>),
    enableDefaultInternetAccess: json['EnableDefaultInternetAccess'] as bool,
    fleetErrors: (json['FleetErrors'] as List)
        ?.map((e) =>
            e == null ? null : FleetError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    fleetType: _$enumDecodeNullable(_$FleetTypeEnumMap, json['FleetType']),
    iamRoleArn: json['IamRoleArn'] as String,
    idleDisconnectTimeoutInSeconds:
        json['IdleDisconnectTimeoutInSeconds'] as int,
    imageArn: json['ImageArn'] as String,
    imageName: json['ImageName'] as String,
    maxUserDurationInSeconds: json['MaxUserDurationInSeconds'] as int,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

const _$FleetStateEnumMap = {
  FleetState.starting: 'STARTING',
  FleetState.running: 'RUNNING',
  FleetState.stopping: 'STOPPING',
  FleetState.stopped: 'STOPPED',
};

FleetError _$FleetErrorFromJson(Map<String, dynamic> json) {
  return FleetError(
    errorCode: _$enumDecodeNullable(_$FleetErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
  );
}

const _$FleetErrorCodeEnumMap = {
  FleetErrorCode.iamServiceRoleMissingEniDescribeAction:
      'IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION',
  FleetErrorCode.iamServiceRoleMissingEniCreateAction:
      'IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION',
  FleetErrorCode.iamServiceRoleMissingEniDeleteAction:
      'IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION',
  FleetErrorCode.networkInterfaceLimitExceeded:
      'NETWORK_INTERFACE_LIMIT_EXCEEDED',
  FleetErrorCode.internalServiceError: 'INTERNAL_SERVICE_ERROR',
  FleetErrorCode.iamServiceRoleIsMissing: 'IAM_SERVICE_ROLE_IS_MISSING',
  FleetErrorCode.machineRoleIsMissing: 'MACHINE_ROLE_IS_MISSING',
  FleetErrorCode.stsDisabledInRegion: 'STS_DISABLED_IN_REGION',
  FleetErrorCode.subnetHasInsufficientIpAddresses:
      'SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES',
  FleetErrorCode.iamServiceRoleMissingDescribeSubnetAction:
      'IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION',
  FleetErrorCode.subnetNotFound: 'SUBNET_NOT_FOUND',
  FleetErrorCode.imageNotFound: 'IMAGE_NOT_FOUND',
  FleetErrorCode.invalidSubnetConfiguration: 'INVALID_SUBNET_CONFIGURATION',
  FleetErrorCode.securityGroupsNotFound: 'SECURITY_GROUPS_NOT_FOUND',
  FleetErrorCode.igwNotAttached: 'IGW_NOT_ATTACHED',
  FleetErrorCode.iamServiceRoleMissingDescribeSecurityGroupsAction:
      'IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION',
  FleetErrorCode.domainJoinErrorFileNotFound:
      'DOMAIN_JOIN_ERROR_FILE_NOT_FOUND',
  FleetErrorCode.domainJoinErrorAccessDenied: 'DOMAIN_JOIN_ERROR_ACCESS_DENIED',
  FleetErrorCode.domainJoinErrorLogonFailure: 'DOMAIN_JOIN_ERROR_LOGON_FAILURE',
  FleetErrorCode.domainJoinErrorInvalidParameter:
      'DOMAIN_JOIN_ERROR_INVALID_PARAMETER',
  FleetErrorCode.domainJoinErrorMoreData: 'DOMAIN_JOIN_ERROR_MORE_DATA',
  FleetErrorCode.domainJoinErrorNoSuchDomain:
      'DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN',
  FleetErrorCode.domainJoinErrorNotSupported: 'DOMAIN_JOIN_ERROR_NOT_SUPPORTED',
  FleetErrorCode.domainJoinNerrInvalidWorkgroupName:
      'DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME',
  FleetErrorCode.domainJoinNerrWorkstationNotStarted:
      'DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED',
  FleetErrorCode.domainJoinErrorDsMachineAccountQuotaExceeded:
      'DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED',
  FleetErrorCode.domainJoinNerrPasswordExpired:
      'DOMAIN_JOIN_NERR_PASSWORD_EXPIRED',
  FleetErrorCode.domainJoinInternalServiceError:
      'DOMAIN_JOIN_INTERNAL_SERVICE_ERROR',
};

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    name: json['Name'] as String,
    applications: (json['Applications'] as List)
        ?.map((e) =>
            e == null ? null : Application.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    appstreamAgentVersion: json['AppstreamAgentVersion'] as String,
    arn: json['Arn'] as String,
    baseImageArn: json['BaseImageArn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    displayName: json['DisplayName'] as String,
    imageBuilderName: json['ImageBuilderName'] as String,
    imageBuilderSupported: json['ImageBuilderSupported'] as bool,
    imagePermissions: json['ImagePermissions'] == null
        ? null
        : ImagePermissions.fromJson(
            json['ImagePermissions'] as Map<String, dynamic>),
    platform: _$enumDecodeNullable(_$PlatformTypeEnumMap, json['Platform']),
    publicBaseImageReleasedDate:
        unixTimestampFromJson(json['PublicBaseImageReleasedDate']),
    state: _$enumDecodeNullable(_$ImageStateEnumMap, json['State']),
    stateChangeReason: json['StateChangeReason'] == null
        ? null
        : ImageStateChangeReason.fromJson(
            json['StateChangeReason'] as Map<String, dynamic>),
    visibility:
        _$enumDecodeNullable(_$VisibilityTypeEnumMap, json['Visibility']),
  );
}

const _$PlatformTypeEnumMap = {
  PlatformType.windows: 'WINDOWS',
  PlatformType.windowsServer_2016: 'WINDOWS_SERVER_2016',
  PlatformType.windowsServer_2019: 'WINDOWS_SERVER_2019',
};

const _$ImageStateEnumMap = {
  ImageState.pending: 'PENDING',
  ImageState.available: 'AVAILABLE',
  ImageState.failed: 'FAILED',
  ImageState.copying: 'COPYING',
  ImageState.deleting: 'DELETING',
};

ImageBuilder _$ImageBuilderFromJson(Map<String, dynamic> json) {
  return ImageBuilder(
    name: json['Name'] as String,
    accessEndpoints: (json['AccessEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : AccessEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    appstreamAgentVersion: json['AppstreamAgentVersion'] as String,
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    displayName: json['DisplayName'] as String,
    domainJoinInfo: json['DomainJoinInfo'] == null
        ? null
        : DomainJoinInfo.fromJson(
            json['DomainJoinInfo'] as Map<String, dynamic>),
    enableDefaultInternetAccess: json['EnableDefaultInternetAccess'] as bool,
    iamRoleArn: json['IamRoleArn'] as String,
    imageArn: json['ImageArn'] as String,
    imageBuilderErrors: (json['ImageBuilderErrors'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    instanceType: json['InstanceType'] as String,
    networkAccessConfiguration: json['NetworkAccessConfiguration'] == null
        ? null
        : NetworkAccessConfiguration.fromJson(
            json['NetworkAccessConfiguration'] as Map<String, dynamic>),
    platform: _$enumDecodeNullable(_$PlatformTypeEnumMap, json['Platform']),
    state: _$enumDecodeNullable(_$ImageBuilderStateEnumMap, json['State']),
    stateChangeReason: json['StateChangeReason'] == null
        ? null
        : ImageBuilderStateChangeReason.fromJson(
            json['StateChangeReason'] as Map<String, dynamic>),
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

const _$ImageBuilderStateEnumMap = {
  ImageBuilderState.pending: 'PENDING',
  ImageBuilderState.updatingAgent: 'UPDATING_AGENT',
  ImageBuilderState.running: 'RUNNING',
  ImageBuilderState.stopping: 'STOPPING',
  ImageBuilderState.stopped: 'STOPPED',
  ImageBuilderState.rebooting: 'REBOOTING',
  ImageBuilderState.snapshotting: 'SNAPSHOTTING',
  ImageBuilderState.deleting: 'DELETING',
  ImageBuilderState.failed: 'FAILED',
};

ImageBuilderStateChangeReason _$ImageBuilderStateChangeReasonFromJson(
    Map<String, dynamic> json) {
  return ImageBuilderStateChangeReason(
    code: _$enumDecodeNullable(
        _$ImageBuilderStateChangeReasonCodeEnumMap, json['Code']),
    message: json['Message'] as String,
  );
}

const _$ImageBuilderStateChangeReasonCodeEnumMap = {
  ImageBuilderStateChangeReasonCode.internalError: 'INTERNAL_ERROR',
  ImageBuilderStateChangeReasonCode.imageUnavailable: 'IMAGE_UNAVAILABLE',
};

ImagePermissions _$ImagePermissionsFromJson(Map<String, dynamic> json) {
  return ImagePermissions(
    allowFleet: json['allowFleet'] as bool,
    allowImageBuilder: json['allowImageBuilder'] as bool,
  );
}

Map<String, dynamic> _$ImagePermissionsToJson(ImagePermissions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allowFleet', instance.allowFleet);
  writeNotNull('allowImageBuilder', instance.allowImageBuilder);
  return val;
}

ImageStateChangeReason _$ImageStateChangeReasonFromJson(
    Map<String, dynamic> json) {
  return ImageStateChangeReason(
    code:
        _$enumDecodeNullable(_$ImageStateChangeReasonCodeEnumMap, json['Code']),
    message: json['Message'] as String,
  );
}

const _$ImageStateChangeReasonCodeEnumMap = {
  ImageStateChangeReasonCode.internalError: 'INTERNAL_ERROR',
  ImageStateChangeReasonCode.imageBuilderNotAvailable:
      'IMAGE_BUILDER_NOT_AVAILABLE',
  ImageStateChangeReasonCode.imageCopyFailure: 'IMAGE_COPY_FAILURE',
};

LastReportGenerationExecutionError _$LastReportGenerationExecutionErrorFromJson(
    Map<String, dynamic> json) {
  return LastReportGenerationExecutionError(
    errorCode: _$enumDecodeNullable(
        _$UsageReportExecutionErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
  );
}

const _$UsageReportExecutionErrorCodeEnumMap = {
  UsageReportExecutionErrorCode.resourceNotFound: 'RESOURCE_NOT_FOUND',
  UsageReportExecutionErrorCode.accessDenied: 'ACCESS_DENIED',
  UsageReportExecutionErrorCode.internalServiceError: 'INTERNAL_SERVICE_ERROR',
};

Map<String, dynamic> _$ListAssociatedFleetsRequestToJson(
    ListAssociatedFleetsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StackName', instance.stackName);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListAssociatedFleetsResult _$ListAssociatedFleetsResultFromJson(
    Map<String, dynamic> json) {
  return ListAssociatedFleetsResult(
    names: (json['Names'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListAssociatedStacksRequestToJson(
    ListAssociatedStacksRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FleetName', instance.fleetName);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListAssociatedStacksResult _$ListAssociatedStacksResultFromJson(
    Map<String, dynamic> json) {
  return ListAssociatedStacksResult(
    names: (json['Names'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListTagsForResourceRequestToJson(
    ListTagsForResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

NetworkAccessConfiguration _$NetworkAccessConfigurationFromJson(
    Map<String, dynamic> json) {
  return NetworkAccessConfiguration(
    eniId: json['EniId'] as String,
    eniPrivateIpAddress: json['EniPrivateIpAddress'] as String,
  );
}

ResourceError _$ResourceErrorFromJson(Map<String, dynamic> json) {
  return ResourceError(
    errorCode: _$enumDecodeNullable(_$FleetErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    errorTimestamp: unixTimestampFromJson(json['ErrorTimestamp']),
  );
}

ServiceAccountCredentials _$ServiceAccountCredentialsFromJson(
    Map<String, dynamic> json) {
  return ServiceAccountCredentials(
    accountName: json['AccountName'] as String,
    accountPassword: json['AccountPassword'] as String,
  );
}

Map<String, dynamic> _$ServiceAccountCredentialsToJson(
    ServiceAccountCredentials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountName', instance.accountName);
  writeNotNull('AccountPassword', instance.accountPassword);
  return val;
}

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
    fleetName: json['FleetName'] as String,
    id: json['Id'] as String,
    stackName: json['StackName'] as String,
    state: _$enumDecodeNullable(_$SessionStateEnumMap, json['State']),
    userId: json['UserId'] as String,
    authenticationType: _$enumDecodeNullable(
        _$AuthenticationTypeEnumMap, json['AuthenticationType']),
    connectionState: _$enumDecodeNullable(
        _$SessionConnectionStateEnumMap, json['ConnectionState']),
    maxExpirationTime: unixTimestampFromJson(json['MaxExpirationTime']),
    networkAccessConfiguration: json['NetworkAccessConfiguration'] == null
        ? null
        : NetworkAccessConfiguration.fromJson(
            json['NetworkAccessConfiguration'] as Map<String, dynamic>),
    startTime: unixTimestampFromJson(json['StartTime']),
  );
}

const _$SessionStateEnumMap = {
  SessionState.active: 'ACTIVE',
  SessionState.pending: 'PENDING',
  SessionState.expired: 'EXPIRED',
};

const _$SessionConnectionStateEnumMap = {
  SessionConnectionState.connected: 'CONNECTED',
  SessionConnectionState.notConnected: 'NOT_CONNECTED',
};

SharedImagePermissions _$SharedImagePermissionsFromJson(
    Map<String, dynamic> json) {
  return SharedImagePermissions(
    imagePermissions: json['imagePermissions'] == null
        ? null
        : ImagePermissions.fromJson(
            json['imagePermissions'] as Map<String, dynamic>),
    sharedAccountId: json['sharedAccountId'] as String,
  );
}

Stack _$StackFromJson(Map<String, dynamic> json) {
  return Stack(
    name: json['Name'] as String,
    accessEndpoints: (json['AccessEndpoints'] as List)
        ?.map((e) => e == null
            ? null
            : AccessEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    applicationSettings: json['ApplicationSettings'] == null
        ? null
        : ApplicationSettingsResponse.fromJson(
            json['ApplicationSettings'] as Map<String, dynamic>),
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    description: json['Description'] as String,
    displayName: json['DisplayName'] as String,
    embedHostDomains:
        (json['EmbedHostDomains'] as List)?.map((e) => e as String)?.toList(),
    feedbackURL: json['FeedbackURL'] as String,
    redirectURL: json['RedirectURL'] as String,
    stackErrors: (json['StackErrors'] as List)
        ?.map((e) =>
            e == null ? null : StackError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    storageConnectors: (json['StorageConnectors'] as List)
        ?.map((e) => e == null
            ? null
            : StorageConnector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userSettings: (json['UserSettings'] as List)
        ?.map((e) =>
            e == null ? null : UserSetting.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StackError _$StackErrorFromJson(Map<String, dynamic> json) {
  return StackError(
    errorCode: _$enumDecodeNullable(_$StackErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
  );
}

const _$StackErrorCodeEnumMap = {
  StackErrorCode.storageConnectorError: 'STORAGE_CONNECTOR_ERROR',
  StackErrorCode.internalServiceError: 'INTERNAL_SERVICE_ERROR',
};

Map<String, dynamic> _$StartFleetRequestToJson(StartFleetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

StartFleetResult _$StartFleetResultFromJson(Map<String, dynamic> json) {
  return StartFleetResult();
}

Map<String, dynamic> _$StartImageBuilderRequestToJson(
    StartImageBuilderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('AppstreamAgentVersion', instance.appstreamAgentVersion);
  return val;
}

StartImageBuilderResult _$StartImageBuilderResultFromJson(
    Map<String, dynamic> json) {
  return StartImageBuilderResult(
    imageBuilder: json['ImageBuilder'] == null
        ? null
        : ImageBuilder.fromJson(json['ImageBuilder'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StopFleetRequestToJson(StopFleetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

StopFleetResult _$StopFleetResultFromJson(Map<String, dynamic> json) {
  return StopFleetResult();
}

Map<String, dynamic> _$StopImageBuilderRequestToJson(
    StopImageBuilderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

StopImageBuilderResult _$StopImageBuilderResultFromJson(
    Map<String, dynamic> json) {
  return StopImageBuilderResult(
    imageBuilder: json['ImageBuilder'] == null
        ? null
        : ImageBuilder.fromJson(json['ImageBuilder'] as Map<String, dynamic>),
  );
}

StorageConnector _$StorageConnectorFromJson(Map<String, dynamic> json) {
  return StorageConnector(
    connectorType: _$enumDecodeNullable(
        _$StorageConnectorTypeEnumMap, json['ConnectorType']),
    domains: (json['Domains'] as List)?.map((e) => e as String)?.toList(),
    resourceIdentifier: json['ResourceIdentifier'] as String,
  );
}

Map<String, dynamic> _$StorageConnectorToJson(StorageConnector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ConnectorType', _$StorageConnectorTypeEnumMap[instance.connectorType]);
  writeNotNull('Domains', instance.domains);
  writeNotNull('ResourceIdentifier', instance.resourceIdentifier);
  return val;
}

const _$StorageConnectorTypeEnumMap = {
  StorageConnectorType.homefolders: 'HOMEFOLDERS',
  StorageConnectorType.googleDrive: 'GOOGLE_DRIVE',
  StorageConnectorType.oneDrive: 'ONE_DRIVE',
};

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('Tags', instance.tags);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UpdateDirectoryConfigRequestToJson(
    UpdateDirectoryConfigRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryName', instance.directoryName);
  writeNotNull('OrganizationalUnitDistinguishedNames',
      instance.organizationalUnitDistinguishedNames);
  writeNotNull('ServiceAccountCredentials',
      instance.serviceAccountCredentials?.toJson());
  return val;
}

UpdateDirectoryConfigResult _$UpdateDirectoryConfigResultFromJson(
    Map<String, dynamic> json) {
  return UpdateDirectoryConfigResult(
    directoryConfig: json['DirectoryConfig'] == null
        ? null
        : DirectoryConfig.fromJson(
            json['DirectoryConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateFleetRequestToJson(UpdateFleetRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributesToDelete', instance.attributesToDelete);
  writeNotNull('ComputeCapacity', instance.computeCapacity?.toJson());
  writeNotNull('DeleteVpcConfig', instance.deleteVpcConfig);
  writeNotNull('Description', instance.description);
  writeNotNull(
      'DisconnectTimeoutInSeconds', instance.disconnectTimeoutInSeconds);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('DomainJoinInfo', instance.domainJoinInfo?.toJson());
  writeNotNull(
      'EnableDefaultInternetAccess', instance.enableDefaultInternetAccess);
  writeNotNull('IamRoleArn', instance.iamRoleArn);
  writeNotNull('IdleDisconnectTimeoutInSeconds',
      instance.idleDisconnectTimeoutInSeconds);
  writeNotNull('ImageArn', instance.imageArn);
  writeNotNull('ImageName', instance.imageName);
  writeNotNull('InstanceType', instance.instanceType);
  writeNotNull('MaxUserDurationInSeconds', instance.maxUserDurationInSeconds);
  writeNotNull('Name', instance.name);
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

UpdateFleetResult _$UpdateFleetResultFromJson(Map<String, dynamic> json) {
  return UpdateFleetResult(
    fleet: json['Fleet'] == null
        ? null
        : Fleet.fromJson(json['Fleet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateImagePermissionsRequestToJson(
    UpdateImagePermissionsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ImagePermissions', instance.imagePermissions?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('SharedAccountId', instance.sharedAccountId);
  return val;
}

UpdateImagePermissionsResult _$UpdateImagePermissionsResultFromJson(
    Map<String, dynamic> json) {
  return UpdateImagePermissionsResult();
}

Map<String, dynamic> _$UpdateStackRequestToJson(UpdateStackRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('AccessEndpoints',
      instance.accessEndpoints?.map((e) => e?.toJson())?.toList());
  writeNotNull('ApplicationSettings', instance.applicationSettings?.toJson());
  writeNotNull('AttributesToDelete', instance.attributesToDelete);
  writeNotNull('DeleteStorageConnectors', instance.deleteStorageConnectors);
  writeNotNull('Description', instance.description);
  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('EmbedHostDomains', instance.embedHostDomains);
  writeNotNull('FeedbackURL', instance.feedbackURL);
  writeNotNull('RedirectURL', instance.redirectURL);
  writeNotNull('StorageConnectors',
      instance.storageConnectors?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'UserSettings', instance.userSettings?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateStackResult _$UpdateStackResultFromJson(Map<String, dynamic> json) {
  return UpdateStackResult(
    stack: json['Stack'] == null
        ? null
        : Stack.fromJson(json['Stack'] as Map<String, dynamic>),
  );
}

UsageReportSubscription _$UsageReportSubscriptionFromJson(
    Map<String, dynamic> json) {
  return UsageReportSubscription(
    lastGeneratedReportDate:
        unixTimestampFromJson(json['LastGeneratedReportDate']),
    s3BucketName: json['S3BucketName'] as String,
    schedule:
        _$enumDecodeNullable(_$UsageReportScheduleEnumMap, json['Schedule']),
    subscriptionErrors: (json['SubscriptionErrors'] as List)
        ?.map((e) => e == null
            ? null
            : LastReportGenerationExecutionError.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    authenticationType: _$enumDecodeNullable(
        _$AuthenticationTypeEnumMap, json['AuthenticationType']),
    arn: json['Arn'] as String,
    createdTime: unixTimestampFromJson(json['CreatedTime']),
    enabled: json['Enabled'] as bool,
    firstName: json['FirstName'] as String,
    lastName: json['LastName'] as String,
    status: json['Status'] as String,
    userName: json['UserName'] as String,
  );
}

UserSetting _$UserSettingFromJson(Map<String, dynamic> json) {
  return UserSetting(
    action: _$enumDecodeNullable(_$ActionEnumMap, json['Action']),
    permission: _$enumDecodeNullable(_$PermissionEnumMap, json['Permission']),
  );
}

Map<String, dynamic> _$UserSettingToJson(UserSetting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ActionEnumMap[instance.action]);
  writeNotNull('Permission', _$PermissionEnumMap[instance.permission]);
  return val;
}

const _$ActionEnumMap = {
  Action.clipboardCopyFromLocalDevice: 'CLIPBOARD_COPY_FROM_LOCAL_DEVICE',
  Action.clipboardCopyToLocalDevice: 'CLIPBOARD_COPY_TO_LOCAL_DEVICE',
  Action.fileUpload: 'FILE_UPLOAD',
  Action.fileDownload: 'FILE_DOWNLOAD',
  Action.printingToLocalDevice: 'PRINTING_TO_LOCAL_DEVICE',
};

const _$PermissionEnumMap = {
  Permission.enabled: 'ENABLED',
  Permission.disabled: 'DISABLED',
};

UserStackAssociation _$UserStackAssociationFromJson(Map<String, dynamic> json) {
  return UserStackAssociation(
    authenticationType: _$enumDecodeNullable(
        _$AuthenticationTypeEnumMap, json['AuthenticationType']),
    stackName: json['StackName'] as String,
    userName: json['UserName'] as String,
    sendEmailNotification: json['SendEmailNotification'] as bool,
  );
}

Map<String, dynamic> _$UserStackAssociationToJson(
    UserStackAssociation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AuthenticationType',
      _$AuthenticationTypeEnumMap[instance.authenticationType]);
  writeNotNull('StackName', instance.stackName);
  writeNotNull('UserName', instance.userName);
  writeNotNull('SendEmailNotification', instance.sendEmailNotification);
  return val;
}

UserStackAssociationError _$UserStackAssociationErrorFromJson(
    Map<String, dynamic> json) {
  return UserStackAssociationError(
    errorCode: _$enumDecodeNullable(
        _$UserStackAssociationErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    userStackAssociation: json['UserStackAssociation'] == null
        ? null
        : UserStackAssociation.fromJson(
            json['UserStackAssociation'] as Map<String, dynamic>),
  );
}

const _$UserStackAssociationErrorCodeEnumMap = {
  UserStackAssociationErrorCode.stackNotFound: 'STACK_NOT_FOUND',
  UserStackAssociationErrorCode.userNameNotFound: 'USER_NAME_NOT_FOUND',
  UserStackAssociationErrorCode.internalError: 'INTERNAL_ERROR',
};

VpcConfig _$VpcConfigFromJson(Map<String, dynamic> json) {
  return VpcConfig(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$VpcConfigToJson(VpcConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  return val;
}
