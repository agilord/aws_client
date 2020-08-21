// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'securityhub-2018-10-26.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptInvitationResponse _$AcceptInvitationResponseFromJson(
    Map<String, dynamic> json) {
  return AcceptInvitationResponse();
}

Map<String, dynamic> _$AccountDetailsToJson(AccountDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('Email', instance.email);
  return val;
}

ActionTarget _$ActionTargetFromJson(Map<String, dynamic> json) {
  return ActionTarget(
    actionTargetArn: json['ActionTargetArn'] as String,
    description: json['Description'] as String,
    name: json['Name'] as String,
  );
}

AvailabilityZone _$AvailabilityZoneFromJson(Map<String, dynamic> json) {
  return AvailabilityZone(
    subnetId: json['SubnetId'] as String,
    zoneName: json['ZoneName'] as String,
  );
}

Map<String, dynamic> _$AvailabilityZoneToJson(AvailabilityZone instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubnetId', instance.subnetId);
  writeNotNull('ZoneName', instance.zoneName);
  return val;
}

AwsCloudFrontDistributionDetails _$AwsCloudFrontDistributionDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsCloudFrontDistributionDetails(
    domainName: json['DomainName'] as String,
    eTag: json['ETag'] as String,
    lastModifiedTime: json['LastModifiedTime'] as String,
    logging: json['Logging'] == null
        ? null
        : AwsCloudFrontDistributionLogging.fromJson(
            json['Logging'] as Map<String, dynamic>),
    origins: json['Origins'] == null
        ? null
        : AwsCloudFrontDistributionOrigins.fromJson(
            json['Origins'] as Map<String, dynamic>),
    status: json['Status'] as String,
    webAclId: json['WebAclId'] as String,
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionDetailsToJson(
    AwsCloudFrontDistributionDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('ETag', instance.eTag);
  writeNotNull('LastModifiedTime', instance.lastModifiedTime);
  writeNotNull('Logging', instance.logging?.toJson());
  writeNotNull('Origins', instance.origins?.toJson());
  writeNotNull('Status', instance.status);
  writeNotNull('WebAclId', instance.webAclId);
  return val;
}

AwsCloudFrontDistributionLogging _$AwsCloudFrontDistributionLoggingFromJson(
    Map<String, dynamic> json) {
  return AwsCloudFrontDistributionLogging(
    bucket: json['Bucket'] as String,
    enabled: json['Enabled'] as bool,
    includeCookies: json['IncludeCookies'] as bool,
    prefix: json['Prefix'] as String,
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionLoggingToJson(
    AwsCloudFrontDistributionLogging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Enabled', instance.enabled);
  writeNotNull('IncludeCookies', instance.includeCookies);
  writeNotNull('Prefix', instance.prefix);
  return val;
}

AwsCloudFrontDistributionOriginItem
    _$AwsCloudFrontDistributionOriginItemFromJson(Map<String, dynamic> json) {
  return AwsCloudFrontDistributionOriginItem(
    domainName: json['DomainName'] as String,
    id: json['Id'] as String,
    originPath: json['OriginPath'] as String,
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionOriginItemToJson(
    AwsCloudFrontDistributionOriginItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('Id', instance.id);
  writeNotNull('OriginPath', instance.originPath);
  return val;
}

AwsCloudFrontDistributionOrigins _$AwsCloudFrontDistributionOriginsFromJson(
    Map<String, dynamic> json) {
  return AwsCloudFrontDistributionOrigins(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : AwsCloudFrontDistributionOriginItem.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsCloudFrontDistributionOriginsToJson(
    AwsCloudFrontDistributionOrigins instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Items', instance.items?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsCodeBuildProjectDetails _$AwsCodeBuildProjectDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsCodeBuildProjectDetails(
    encryptionKey: json['EncryptionKey'] as String,
    environment: json['Environment'] == null
        ? null
        : AwsCodeBuildProjectEnvironment.fromJson(
            json['Environment'] as Map<String, dynamic>),
    name: json['Name'] as String,
    serviceRole: json['ServiceRole'] as String,
    source: json['Source'] == null
        ? null
        : AwsCodeBuildProjectSource.fromJson(
            json['Source'] as Map<String, dynamic>),
    vpcConfig: json['VpcConfig'] == null
        ? null
        : AwsCodeBuildProjectVpcConfig.fromJson(
            json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsCodeBuildProjectDetailsToJson(
    AwsCodeBuildProjectDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EncryptionKey', instance.encryptionKey);
  writeNotNull('Environment', instance.environment?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('ServiceRole', instance.serviceRole);
  writeNotNull('Source', instance.source?.toJson());
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

AwsCodeBuildProjectEnvironment _$AwsCodeBuildProjectEnvironmentFromJson(
    Map<String, dynamic> json) {
  return AwsCodeBuildProjectEnvironment(
    certificate: json['Certificate'] as String,
    imagePullCredentialsType: json['ImagePullCredentialsType'] as String,
    registryCredential: json['RegistryCredential'] == null
        ? null
        : AwsCodeBuildProjectEnvironmentRegistryCredential.fromJson(
            json['RegistryCredential'] as Map<String, dynamic>),
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$AwsCodeBuildProjectEnvironmentToJson(
    AwsCodeBuildProjectEnvironment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Certificate', instance.certificate);
  writeNotNull('ImagePullCredentialsType', instance.imagePullCredentialsType);
  writeNotNull('RegistryCredential', instance.registryCredential?.toJson());
  writeNotNull('Type', instance.type);
  return val;
}

AwsCodeBuildProjectEnvironmentRegistryCredential
    _$AwsCodeBuildProjectEnvironmentRegistryCredentialFromJson(
        Map<String, dynamic> json) {
  return AwsCodeBuildProjectEnvironmentRegistryCredential(
    credential: json['Credential'] as String,
    credentialProvider: json['CredentialProvider'] as String,
  );
}

Map<String, dynamic> _$AwsCodeBuildProjectEnvironmentRegistryCredentialToJson(
    AwsCodeBuildProjectEnvironmentRegistryCredential instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Credential', instance.credential);
  writeNotNull('CredentialProvider', instance.credentialProvider);
  return val;
}

AwsCodeBuildProjectSource _$AwsCodeBuildProjectSourceFromJson(
    Map<String, dynamic> json) {
  return AwsCodeBuildProjectSource(
    gitCloneDepth: json['GitCloneDepth'] as int,
    insecureSsl: json['InsecureSsl'] as bool,
    location: json['Location'] as String,
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$AwsCodeBuildProjectSourceToJson(
    AwsCodeBuildProjectSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GitCloneDepth', instance.gitCloneDepth);
  writeNotNull('InsecureSsl', instance.insecureSsl);
  writeNotNull('Location', instance.location);
  writeNotNull('Type', instance.type);
  return val;
}

AwsCodeBuildProjectVpcConfig _$AwsCodeBuildProjectVpcConfigFromJson(
    Map<String, dynamic> json) {
  return AwsCodeBuildProjectVpcConfig(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnets: (json['Subnets'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsCodeBuildProjectVpcConfigToJson(
    AwsCodeBuildProjectVpcConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('Subnets', instance.subnets);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsEc2InstanceDetails _$AwsEc2InstanceDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsEc2InstanceDetails(
    iamInstanceProfileArn: json['IamInstanceProfileArn'] as String,
    imageId: json['ImageId'] as String,
    ipV4Addresses:
        (json['IpV4Addresses'] as List)?.map((e) => e as String)?.toList(),
    ipV6Addresses:
        (json['IpV6Addresses'] as List)?.map((e) => e as String)?.toList(),
    keyName: json['KeyName'] as String,
    launchedAt: json['LaunchedAt'] as String,
    subnetId: json['SubnetId'] as String,
    type: json['Type'] as String,
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsEc2InstanceDetailsToJson(
    AwsEc2InstanceDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IamInstanceProfileArn', instance.iamInstanceProfileArn);
  writeNotNull('ImageId', instance.imageId);
  writeNotNull('IpV4Addresses', instance.ipV4Addresses);
  writeNotNull('IpV6Addresses', instance.ipV6Addresses);
  writeNotNull('KeyName', instance.keyName);
  writeNotNull('LaunchedAt', instance.launchedAt);
  writeNotNull('SubnetId', instance.subnetId);
  writeNotNull('Type', instance.type);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsEc2NetworkInterfaceAttachment _$AwsEc2NetworkInterfaceAttachmentFromJson(
    Map<String, dynamic> json) {
  return AwsEc2NetworkInterfaceAttachment(
    attachTime: json['AttachTime'] as String,
    attachmentId: json['AttachmentId'] as String,
    deleteOnTermination: json['DeleteOnTermination'] as bool,
    deviceIndex: json['DeviceIndex'] as int,
    instanceId: json['InstanceId'] as String,
    instanceOwnerId: json['InstanceOwnerId'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsEc2NetworkInterfaceAttachmentToJson(
    AwsEc2NetworkInterfaceAttachment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttachTime', instance.attachTime);
  writeNotNull('AttachmentId', instance.attachmentId);
  writeNotNull('DeleteOnTermination', instance.deleteOnTermination);
  writeNotNull('DeviceIndex', instance.deviceIndex);
  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('InstanceOwnerId', instance.instanceOwnerId);
  writeNotNull('Status', instance.status);
  return val;
}

AwsEc2NetworkInterfaceDetails _$AwsEc2NetworkInterfaceDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsEc2NetworkInterfaceDetails(
    attachment: json['Attachment'] == null
        ? null
        : AwsEc2NetworkInterfaceAttachment.fromJson(
            json['Attachment'] as Map<String, dynamic>),
    networkInterfaceId: json['NetworkInterfaceId'] as String,
    securityGroups: (json['SecurityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2NetworkInterfaceSecurityGroup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    sourceDestCheck: json['SourceDestCheck'] as bool,
  );
}

Map<String, dynamic> _$AwsEc2NetworkInterfaceDetailsToJson(
    AwsEc2NetworkInterfaceDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Attachment', instance.attachment?.toJson());
  writeNotNull('NetworkInterfaceId', instance.networkInterfaceId);
  writeNotNull('SecurityGroups',
      instance.securityGroups?.map((e) => e?.toJson())?.toList());
  writeNotNull('SourceDestCheck', instance.sourceDestCheck);
  return val;
}

AwsEc2NetworkInterfaceSecurityGroup
    _$AwsEc2NetworkInterfaceSecurityGroupFromJson(Map<String, dynamic> json) {
  return AwsEc2NetworkInterfaceSecurityGroup(
    groupId: json['GroupId'] as String,
    groupName: json['GroupName'] as String,
  );
}

Map<String, dynamic> _$AwsEc2NetworkInterfaceSecurityGroupToJson(
    AwsEc2NetworkInterfaceSecurityGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupId', instance.groupId);
  writeNotNull('GroupName', instance.groupName);
  return val;
}

AwsEc2SecurityGroupDetails _$AwsEc2SecurityGroupDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupDetails(
    groupId: json['GroupId'] as String,
    groupName: json['GroupName'] as String,
    ipPermissions: (json['IpPermissions'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupIpPermission.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    ipPermissionsEgress: (json['IpPermissionsEgress'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupIpPermission.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    ownerId: json['OwnerId'] as String,
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupDetailsToJson(
    AwsEc2SecurityGroupDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupId', instance.groupId);
  writeNotNull('GroupName', instance.groupName);
  writeNotNull('IpPermissions',
      instance.ipPermissions?.map((e) => e?.toJson())?.toList());
  writeNotNull('IpPermissionsEgress',
      instance.ipPermissionsEgress?.map((e) => e?.toJson())?.toList());
  writeNotNull('OwnerId', instance.ownerId);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsEc2SecurityGroupIpPermission _$AwsEc2SecurityGroupIpPermissionFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupIpPermission(
    fromPort: json['FromPort'] as int,
    ipProtocol: json['IpProtocol'] as String,
    ipRanges: (json['IpRanges'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupIpRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ipv6Ranges: (json['Ipv6Ranges'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupIpv6Range.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    prefixListIds: (json['PrefixListIds'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupPrefixListId.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    toPort: json['ToPort'] as int,
    userIdGroupPairs: (json['UserIdGroupPairs'] as List)
        ?.map((e) => e == null
            ? null
            : AwsEc2SecurityGroupUserIdGroupPair.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupIpPermissionToJson(
    AwsEc2SecurityGroupIpPermission instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FromPort', instance.fromPort);
  writeNotNull('IpProtocol', instance.ipProtocol);
  writeNotNull(
      'IpRanges', instance.ipRanges?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Ipv6Ranges', instance.ipv6Ranges?.map((e) => e?.toJson())?.toList());
  writeNotNull('PrefixListIds',
      instance.prefixListIds?.map((e) => e?.toJson())?.toList());
  writeNotNull('ToPort', instance.toPort);
  writeNotNull('UserIdGroupPairs',
      instance.userIdGroupPairs?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsEc2SecurityGroupIpRange _$AwsEc2SecurityGroupIpRangeFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupIpRange(
    cidrIp: json['CidrIp'] as String,
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupIpRangeToJson(
    AwsEc2SecurityGroupIpRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CidrIp', instance.cidrIp);
  return val;
}

AwsEc2SecurityGroupIpv6Range _$AwsEc2SecurityGroupIpv6RangeFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupIpv6Range(
    cidrIpv6: json['CidrIpv6'] as String,
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupIpv6RangeToJson(
    AwsEc2SecurityGroupIpv6Range instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CidrIpv6', instance.cidrIpv6);
  return val;
}

AwsEc2SecurityGroupPrefixListId _$AwsEc2SecurityGroupPrefixListIdFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupPrefixListId(
    prefixListId: json['PrefixListId'] as String,
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupPrefixListIdToJson(
    AwsEc2SecurityGroupPrefixListId instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PrefixListId', instance.prefixListId);
  return val;
}

AwsEc2SecurityGroupUserIdGroupPair _$AwsEc2SecurityGroupUserIdGroupPairFromJson(
    Map<String, dynamic> json) {
  return AwsEc2SecurityGroupUserIdGroupPair(
    groupId: json['GroupId'] as String,
    groupName: json['GroupName'] as String,
    peeringStatus: json['PeeringStatus'] as String,
    userId: json['UserId'] as String,
    vpcId: json['VpcId'] as String,
    vpcPeeringConnectionId: json['VpcPeeringConnectionId'] as String,
  );
}

Map<String, dynamic> _$AwsEc2SecurityGroupUserIdGroupPairToJson(
    AwsEc2SecurityGroupUserIdGroupPair instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupId', instance.groupId);
  writeNotNull('GroupName', instance.groupName);
  writeNotNull('PeeringStatus', instance.peeringStatus);
  writeNotNull('UserId', instance.userId);
  writeNotNull('VpcId', instance.vpcId);
  writeNotNull('VpcPeeringConnectionId', instance.vpcPeeringConnectionId);
  return val;
}

AwsElasticsearchDomainDetails _$AwsElasticsearchDomainDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsElasticsearchDomainDetails(
    accessPolicies: json['AccessPolicies'] as String,
    domainEndpointOptions: json['DomainEndpointOptions'] == null
        ? null
        : AwsElasticsearchDomainDomainEndpointOptions.fromJson(
            json['DomainEndpointOptions'] as Map<String, dynamic>),
    domainId: json['DomainId'] as String,
    domainName: json['DomainName'] as String,
    elasticsearchVersion: json['ElasticsearchVersion'] as String,
    encryptionAtRestOptions: json['EncryptionAtRestOptions'] == null
        ? null
        : AwsElasticsearchDomainEncryptionAtRestOptions.fromJson(
            json['EncryptionAtRestOptions'] as Map<String, dynamic>),
    endpoint: json['Endpoint'] as String,
    endpoints: (json['Endpoints'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    nodeToNodeEncryptionOptions: json['NodeToNodeEncryptionOptions'] == null
        ? null
        : AwsElasticsearchDomainNodeToNodeEncryptionOptions.fromJson(
            json['NodeToNodeEncryptionOptions'] as Map<String, dynamic>),
    vPCOptions: json['VPCOptions'] == null
        ? null
        : AwsElasticsearchDomainVPCOptions.fromJson(
            json['VPCOptions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsElasticsearchDomainDetailsToJson(
    AwsElasticsearchDomainDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessPolicies', instance.accessPolicies);
  writeNotNull(
      'DomainEndpointOptions', instance.domainEndpointOptions?.toJson());
  writeNotNull('DomainId', instance.domainId);
  writeNotNull('DomainName', instance.domainName);
  writeNotNull('ElasticsearchVersion', instance.elasticsearchVersion);
  writeNotNull(
      'EncryptionAtRestOptions', instance.encryptionAtRestOptions?.toJson());
  writeNotNull('Endpoint', instance.endpoint);
  writeNotNull('Endpoints', instance.endpoints);
  writeNotNull('NodeToNodeEncryptionOptions',
      instance.nodeToNodeEncryptionOptions?.toJson());
  writeNotNull('VPCOptions', instance.vPCOptions?.toJson());
  return val;
}

AwsElasticsearchDomainDomainEndpointOptions
    _$AwsElasticsearchDomainDomainEndpointOptionsFromJson(
        Map<String, dynamic> json) {
  return AwsElasticsearchDomainDomainEndpointOptions(
    enforceHTTPS: json['EnforceHTTPS'] as bool,
    tLSSecurityPolicy: json['TLSSecurityPolicy'] as String,
  );
}

Map<String, dynamic> _$AwsElasticsearchDomainDomainEndpointOptionsToJson(
    AwsElasticsearchDomainDomainEndpointOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnforceHTTPS', instance.enforceHTTPS);
  writeNotNull('TLSSecurityPolicy', instance.tLSSecurityPolicy);
  return val;
}

AwsElasticsearchDomainEncryptionAtRestOptions
    _$AwsElasticsearchDomainEncryptionAtRestOptionsFromJson(
        Map<String, dynamic> json) {
  return AwsElasticsearchDomainEncryptionAtRestOptions(
    enabled: json['Enabled'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$AwsElasticsearchDomainEncryptionAtRestOptionsToJson(
    AwsElasticsearchDomainEncryptionAtRestOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

AwsElasticsearchDomainNodeToNodeEncryptionOptions
    _$AwsElasticsearchDomainNodeToNodeEncryptionOptionsFromJson(
        Map<String, dynamic> json) {
  return AwsElasticsearchDomainNodeToNodeEncryptionOptions(
    enabled: json['Enabled'] as bool,
  );
}

Map<String, dynamic> _$AwsElasticsearchDomainNodeToNodeEncryptionOptionsToJson(
    AwsElasticsearchDomainNodeToNodeEncryptionOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

AwsElasticsearchDomainVPCOptions _$AwsElasticsearchDomainVPCOptionsFromJson(
    Map<String, dynamic> json) {
  return AwsElasticsearchDomainVPCOptions(
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vPCId: json['VPCId'] as String,
  );
}

Map<String, dynamic> _$AwsElasticsearchDomainVPCOptionsToJson(
    AwsElasticsearchDomainVPCOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityZones', instance.availabilityZones);
  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  writeNotNull('VPCId', instance.vPCId);
  return val;
}

AwsElbv2LoadBalancerDetails _$AwsElbv2LoadBalancerDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsElbv2LoadBalancerDetails(
    availabilityZones: (json['AvailabilityZones'] as List)
        ?.map((e) => e == null
            ? null
            : AvailabilityZone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    canonicalHostedZoneId: json['CanonicalHostedZoneId'] as String,
    createdTime: json['CreatedTime'] as String,
    dNSName: json['DNSName'] as String,
    ipAddressType: json['IpAddressType'] as String,
    scheme: json['Scheme'] as String,
    securityGroups:
        (json['SecurityGroups'] as List)?.map((e) => e as String)?.toList(),
    state: json['State'] == null
        ? null
        : LoadBalancerState.fromJson(json['State'] as Map<String, dynamic>),
    type: json['Type'] as String,
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsElbv2LoadBalancerDetailsToJson(
    AwsElbv2LoadBalancerDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityZones',
      instance.availabilityZones?.map((e) => e?.toJson())?.toList());
  writeNotNull('CanonicalHostedZoneId', instance.canonicalHostedZoneId);
  writeNotNull('CreatedTime', instance.createdTime);
  writeNotNull('DNSName', instance.dNSName);
  writeNotNull('IpAddressType', instance.ipAddressType);
  writeNotNull('Scheme', instance.scheme);
  writeNotNull('SecurityGroups', instance.securityGroups);
  writeNotNull('State', instance.state?.toJson());
  writeNotNull('Type', instance.type);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsIamAccessKeyDetails _$AwsIamAccessKeyDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsIamAccessKeyDetails(
    createdAt: json['CreatedAt'] as String,
    principalId: json['PrincipalId'] as String,
    principalName: json['PrincipalName'] as String,
    principalType: json['PrincipalType'] as String,
    status:
        _$enumDecodeNullable(_$AwsIamAccessKeyStatusEnumMap, json['Status']),
    userName: json['UserName'] as String,
  );
}

Map<String, dynamic> _$AwsIamAccessKeyDetailsToJson(
    AwsIamAccessKeyDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatedAt', instance.createdAt);
  writeNotNull('PrincipalId', instance.principalId);
  writeNotNull('PrincipalName', instance.principalName);
  writeNotNull('PrincipalType', instance.principalType);
  writeNotNull('Status', _$AwsIamAccessKeyStatusEnumMap[instance.status]);
  writeNotNull('UserName', instance.userName);
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

const _$AwsIamAccessKeyStatusEnumMap = {
  AwsIamAccessKeyStatus.active: 'Active',
  AwsIamAccessKeyStatus.inactive: 'Inactive',
};

AwsIamRoleDetails _$AwsIamRoleDetailsFromJson(Map<String, dynamic> json) {
  return AwsIamRoleDetails(
    assumeRolePolicyDocument: json['AssumeRolePolicyDocument'] as String,
    createDate: json['CreateDate'] as String,
    maxSessionDuration: json['MaxSessionDuration'] as int,
    path: json['Path'] as String,
    roleId: json['RoleId'] as String,
    roleName: json['RoleName'] as String,
  );
}

Map<String, dynamic> _$AwsIamRoleDetailsToJson(AwsIamRoleDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssumeRolePolicyDocument', instance.assumeRolePolicyDocument);
  writeNotNull('CreateDate', instance.createDate);
  writeNotNull('MaxSessionDuration', instance.maxSessionDuration);
  writeNotNull('Path', instance.path);
  writeNotNull('RoleId', instance.roleId);
  writeNotNull('RoleName', instance.roleName);
  return val;
}

AwsKmsKeyDetails _$AwsKmsKeyDetailsFromJson(Map<String, dynamic> json) {
  return AwsKmsKeyDetails(
    awsAccountId: json['AWSAccountId'] as String,
    creationDate: (json['CreationDate'] as num)?.toDouble(),
    keyId: json['KeyId'] as String,
    keyManager: json['KeyManager'] as String,
    keyState: json['KeyState'] as String,
    origin: json['Origin'] as String,
  );
}

Map<String, dynamic> _$AwsKmsKeyDetailsToJson(AwsKmsKeyDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AWSAccountId', instance.awsAccountId);
  writeNotNull('CreationDate', instance.creationDate);
  writeNotNull('KeyId', instance.keyId);
  writeNotNull('KeyManager', instance.keyManager);
  writeNotNull('KeyState', instance.keyState);
  writeNotNull('Origin', instance.origin);
  return val;
}

AwsLambdaFunctionCode _$AwsLambdaFunctionCodeFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionCode(
    s3Bucket: json['S3Bucket'] as String,
    s3Key: json['S3Key'] as String,
    s3ObjectVersion: json['S3ObjectVersion'] as String,
    zipFile: json['ZipFile'] as String,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionCodeToJson(
    AwsLambdaFunctionCode instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Bucket', instance.s3Bucket);
  writeNotNull('S3Key', instance.s3Key);
  writeNotNull('S3ObjectVersion', instance.s3ObjectVersion);
  writeNotNull('ZipFile', instance.zipFile);
  return val;
}

AwsLambdaFunctionDeadLetterConfig _$AwsLambdaFunctionDeadLetterConfigFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionDeadLetterConfig(
    targetArn: json['TargetArn'] as String,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionDeadLetterConfigToJson(
    AwsLambdaFunctionDeadLetterConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetArn', instance.targetArn);
  return val;
}

AwsLambdaFunctionDetails _$AwsLambdaFunctionDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionDetails(
    code: json['Code'] == null
        ? null
        : AwsLambdaFunctionCode.fromJson(json['Code'] as Map<String, dynamic>),
    codeSha256: json['CodeSha256'] as String,
    deadLetterConfig: json['DeadLetterConfig'] == null
        ? null
        : AwsLambdaFunctionDeadLetterConfig.fromJson(
            json['DeadLetterConfig'] as Map<String, dynamic>),
    environment: json['Environment'] == null
        ? null
        : AwsLambdaFunctionEnvironment.fromJson(
            json['Environment'] as Map<String, dynamic>),
    functionName: json['FunctionName'] as String,
    handler: json['Handler'] as String,
    kmsKeyArn: json['KmsKeyArn'] as String,
    lastModified: json['LastModified'] as String,
    layers: (json['Layers'] as List)
        ?.map((e) => e == null
            ? null
            : AwsLambdaFunctionLayer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    masterArn: json['MasterArn'] as String,
    memorySize: json['MemorySize'] as int,
    revisionId: json['RevisionId'] as String,
    role: json['Role'] as String,
    runtime: json['Runtime'] as String,
    timeout: json['Timeout'] as int,
    tracingConfig: json['TracingConfig'] == null
        ? null
        : AwsLambdaFunctionTracingConfig.fromJson(
            json['TracingConfig'] as Map<String, dynamic>),
    version: json['Version'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : AwsLambdaFunctionVpcConfig.fromJson(
            json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsLambdaFunctionDetailsToJson(
    AwsLambdaFunctionDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Code', instance.code?.toJson());
  writeNotNull('CodeSha256', instance.codeSha256);
  writeNotNull('DeadLetterConfig', instance.deadLetterConfig?.toJson());
  writeNotNull('Environment', instance.environment?.toJson());
  writeNotNull('FunctionName', instance.functionName);
  writeNotNull('Handler', instance.handler);
  writeNotNull('KmsKeyArn', instance.kmsKeyArn);
  writeNotNull('LastModified', instance.lastModified);
  writeNotNull('Layers', instance.layers?.map((e) => e?.toJson())?.toList());
  writeNotNull('MasterArn', instance.masterArn);
  writeNotNull('MemorySize', instance.memorySize);
  writeNotNull('RevisionId', instance.revisionId);
  writeNotNull('Role', instance.role);
  writeNotNull('Runtime', instance.runtime);
  writeNotNull('Timeout', instance.timeout);
  writeNotNull('TracingConfig', instance.tracingConfig?.toJson());
  writeNotNull('Version', instance.version);
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

AwsLambdaFunctionEnvironment _$AwsLambdaFunctionEnvironmentFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionEnvironment(
    error: json['Error'] == null
        ? null
        : AwsLambdaFunctionEnvironmentError.fromJson(
            json['Error'] as Map<String, dynamic>),
    variables: (json['Variables'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$AwsLambdaFunctionEnvironmentToJson(
    AwsLambdaFunctionEnvironment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Error', instance.error?.toJson());
  writeNotNull('Variables', instance.variables);
  return val;
}

AwsLambdaFunctionEnvironmentError _$AwsLambdaFunctionEnvironmentErrorFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionEnvironmentError(
    errorCode: json['ErrorCode'] as String,
    message: json['Message'] as String,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionEnvironmentErrorToJson(
    AwsLambdaFunctionEnvironmentError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ErrorCode', instance.errorCode);
  writeNotNull('Message', instance.message);
  return val;
}

AwsLambdaFunctionLayer _$AwsLambdaFunctionLayerFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionLayer(
    arn: json['Arn'] as String,
    codeSize: json['CodeSize'] as int,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionLayerToJson(
    AwsLambdaFunctionLayer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('CodeSize', instance.codeSize);
  return val;
}

AwsLambdaFunctionTracingConfig _$AwsLambdaFunctionTracingConfigFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionTracingConfig(
    mode: json['Mode'] as String,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionTracingConfigToJson(
    AwsLambdaFunctionTracingConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Mode', instance.mode);
  return val;
}

AwsLambdaFunctionVpcConfig _$AwsLambdaFunctionVpcConfigFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaFunctionVpcConfig(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$AwsLambdaFunctionVpcConfigToJson(
    AwsLambdaFunctionVpcConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

AwsLambdaLayerVersionDetails _$AwsLambdaLayerVersionDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsLambdaLayerVersionDetails(
    compatibleRuntimes:
        (json['CompatibleRuntimes'] as List)?.map((e) => e as String)?.toList(),
    createdDate: json['CreatedDate'] as String,
    version: json['Version'] as int,
  );
}

Map<String, dynamic> _$AwsLambdaLayerVersionDetailsToJson(
    AwsLambdaLayerVersionDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CompatibleRuntimes', instance.compatibleRuntimes);
  writeNotNull('CreatedDate', instance.createdDate);
  writeNotNull('Version', instance.version);
  return val;
}

AwsRdsDbInstanceAssociatedRole _$AwsRdsDbInstanceAssociatedRoleFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbInstanceAssociatedRole(
    featureName: json['FeatureName'] as String,
    roleArn: json['RoleArn'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbInstanceAssociatedRoleToJson(
    AwsRdsDbInstanceAssociatedRole instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FeatureName', instance.featureName);
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('Status', instance.status);
  return val;
}

AwsRdsDbInstanceDetails _$AwsRdsDbInstanceDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbInstanceDetails(
    associatedRoles: (json['AssociatedRoles'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbInstanceAssociatedRole.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    cACertificateIdentifier: json['CACertificateIdentifier'] as String,
    dBClusterIdentifier: json['DBClusterIdentifier'] as String,
    dBInstanceClass: json['DBInstanceClass'] as String,
    dBInstanceIdentifier: json['DBInstanceIdentifier'] as String,
    dBName: json['DBName'] as String,
    dbInstancePort: json['DbInstancePort'] as int,
    dbiResourceId: json['DbiResourceId'] as String,
    deletionProtection: json['DeletionProtection'] as bool,
    endpoint: json['Endpoint'] == null
        ? null
        : AwsRdsDbInstanceEndpoint.fromJson(
            json['Endpoint'] as Map<String, dynamic>),
    engine: json['Engine'] as String,
    engineVersion: json['EngineVersion'] as String,
    iAMDatabaseAuthenticationEnabled:
        json['IAMDatabaseAuthenticationEnabled'] as bool,
    instanceCreateTime: json['InstanceCreateTime'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    publiclyAccessible: json['PubliclyAccessible'] as bool,
    storageEncrypted: json['StorageEncrypted'] as bool,
    tdeCredentialArn: json['TdeCredentialArn'] as String,
    vpcSecurityGroups: (json['VpcSecurityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : AwsRdsDbInstanceVpcSecurityGroup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsRdsDbInstanceDetailsToJson(
    AwsRdsDbInstanceDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AssociatedRoles',
      instance.associatedRoles?.map((e) => e?.toJson())?.toList());
  writeNotNull('CACertificateIdentifier', instance.cACertificateIdentifier);
  writeNotNull('DBClusterIdentifier', instance.dBClusterIdentifier);
  writeNotNull('DBInstanceClass', instance.dBInstanceClass);
  writeNotNull('DBInstanceIdentifier', instance.dBInstanceIdentifier);
  writeNotNull('DBName', instance.dBName);
  writeNotNull('DbInstancePort', instance.dbInstancePort);
  writeNotNull('DbiResourceId', instance.dbiResourceId);
  writeNotNull('DeletionProtection', instance.deletionProtection);
  writeNotNull('Endpoint', instance.endpoint?.toJson());
  writeNotNull('Engine', instance.engine);
  writeNotNull('EngineVersion', instance.engineVersion);
  writeNotNull('IAMDatabaseAuthenticationEnabled',
      instance.iAMDatabaseAuthenticationEnabled);
  writeNotNull('InstanceCreateTime', instance.instanceCreateTime);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('PubliclyAccessible', instance.publiclyAccessible);
  writeNotNull('StorageEncrypted', instance.storageEncrypted);
  writeNotNull('TdeCredentialArn', instance.tdeCredentialArn);
  writeNotNull('VpcSecurityGroups',
      instance.vpcSecurityGroups?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsRdsDbInstanceEndpoint _$AwsRdsDbInstanceEndpointFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbInstanceEndpoint(
    address: json['Address'] as String,
    hostedZoneId: json['HostedZoneId'] as String,
    port: json['Port'] as int,
  );
}

Map<String, dynamic> _$AwsRdsDbInstanceEndpointToJson(
    AwsRdsDbInstanceEndpoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  writeNotNull('HostedZoneId', instance.hostedZoneId);
  writeNotNull('Port', instance.port);
  return val;
}

AwsRdsDbInstanceVpcSecurityGroup _$AwsRdsDbInstanceVpcSecurityGroupFromJson(
    Map<String, dynamic> json) {
  return AwsRdsDbInstanceVpcSecurityGroup(
    status: json['Status'] as String,
    vpcSecurityGroupId: json['VpcSecurityGroupId'] as String,
  );
}

Map<String, dynamic> _$AwsRdsDbInstanceVpcSecurityGroupToJson(
    AwsRdsDbInstanceVpcSecurityGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', instance.status);
  writeNotNull('VpcSecurityGroupId', instance.vpcSecurityGroupId);
  return val;
}

AwsS3BucketDetails _$AwsS3BucketDetailsFromJson(Map<String, dynamic> json) {
  return AwsS3BucketDetails(
    createdAt: json['CreatedAt'] as String,
    ownerId: json['OwnerId'] as String,
    ownerName: json['OwnerName'] as String,
    serverSideEncryptionConfiguration:
        json['ServerSideEncryptionConfiguration'] == null
            ? null
            : AwsS3BucketServerSideEncryptionConfiguration.fromJson(
                json['ServerSideEncryptionConfiguration']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsS3BucketDetailsToJson(AwsS3BucketDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatedAt', instance.createdAt);
  writeNotNull('OwnerId', instance.ownerId);
  writeNotNull('OwnerName', instance.ownerName);
  writeNotNull('ServerSideEncryptionConfiguration',
      instance.serverSideEncryptionConfiguration?.toJson());
  return val;
}

AwsS3BucketServerSideEncryptionByDefault
    _$AwsS3BucketServerSideEncryptionByDefaultFromJson(
        Map<String, dynamic> json) {
  return AwsS3BucketServerSideEncryptionByDefault(
    kMSMasterKeyID: json['KMSMasterKeyID'] as String,
    sSEAlgorithm: json['SSEAlgorithm'] as String,
  );
}

Map<String, dynamic> _$AwsS3BucketServerSideEncryptionByDefaultToJson(
    AwsS3BucketServerSideEncryptionByDefault instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KMSMasterKeyID', instance.kMSMasterKeyID);
  writeNotNull('SSEAlgorithm', instance.sSEAlgorithm);
  return val;
}

AwsS3BucketServerSideEncryptionConfiguration
    _$AwsS3BucketServerSideEncryptionConfigurationFromJson(
        Map<String, dynamic> json) {
  return AwsS3BucketServerSideEncryptionConfiguration(
    rules: (json['Rules'] as List)
        ?.map((e) => e == null
            ? null
            : AwsS3BucketServerSideEncryptionRule.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsS3BucketServerSideEncryptionConfigurationToJson(
    AwsS3BucketServerSideEncryptionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsS3BucketServerSideEncryptionRule
    _$AwsS3BucketServerSideEncryptionRuleFromJson(Map<String, dynamic> json) {
  return AwsS3BucketServerSideEncryptionRule(
    applyServerSideEncryptionByDefault:
        json['ApplyServerSideEncryptionByDefault'] == null
            ? null
            : AwsS3BucketServerSideEncryptionByDefault.fromJson(
                json['ApplyServerSideEncryptionByDefault']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsS3BucketServerSideEncryptionRuleToJson(
    AwsS3BucketServerSideEncryptionRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplyServerSideEncryptionByDefault',
      instance.applyServerSideEncryptionByDefault?.toJson());
  return val;
}

AwsS3ObjectDetails _$AwsS3ObjectDetailsFromJson(Map<String, dynamic> json) {
  return AwsS3ObjectDetails(
    contentType: json['ContentType'] as String,
    eTag: json['ETag'] as String,
    lastModified: json['LastModified'] as String,
    sSEKMSKeyId: json['SSEKMSKeyId'] as String,
    serverSideEncryption: json['ServerSideEncryption'] as String,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$AwsS3ObjectDetailsToJson(AwsS3ObjectDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContentType', instance.contentType);
  writeNotNull('ETag', instance.eTag);
  writeNotNull('LastModified', instance.lastModified);
  writeNotNull('SSEKMSKeyId', instance.sSEKMSKeyId);
  writeNotNull('ServerSideEncryption', instance.serverSideEncryption);
  writeNotNull('VersionId', instance.versionId);
  return val;
}

AwsSecurityFinding _$AwsSecurityFindingFromJson(Map<String, dynamic> json) {
  return AwsSecurityFinding(
    awsAccountId: json['AwsAccountId'] as String,
    createdAt: json['CreatedAt'] as String,
    description: json['Description'] as String,
    generatorId: json['GeneratorId'] as String,
    id: json['Id'] as String,
    productArn: json['ProductArn'] as String,
    resources: (json['Resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    schemaVersion: json['SchemaVersion'] as String,
    severity: json['Severity'] == null
        ? null
        : Severity.fromJson(json['Severity'] as Map<String, dynamic>),
    title: json['Title'] as String,
    types: (json['Types'] as List)?.map((e) => e as String)?.toList(),
    updatedAt: json['UpdatedAt'] as String,
    compliance: json['Compliance'] == null
        ? null
        : Compliance.fromJson(json['Compliance'] as Map<String, dynamic>),
    confidence: json['Confidence'] as int,
    criticality: json['Criticality'] as int,
    firstObservedAt: json['FirstObservedAt'] as String,
    lastObservedAt: json['LastObservedAt'] as String,
    malware: (json['Malware'] as List)
        ?.map((e) =>
            e == null ? null : Malware.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    network: json['Network'] == null
        ? null
        : Network.fromJson(json['Network'] as Map<String, dynamic>),
    note: json['Note'] == null
        ? null
        : Note.fromJson(json['Note'] as Map<String, dynamic>),
    process: json['Process'] == null
        ? null
        : ProcessDetails.fromJson(json['Process'] as Map<String, dynamic>),
    productFields: (json['ProductFields'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    recordState:
        _$enumDecodeNullable(_$RecordStateEnumMap, json['RecordState']),
    relatedFindings: (json['RelatedFindings'] as List)
        ?.map((e) => e == null
            ? null
            : RelatedFinding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    remediation: json['Remediation'] == null
        ? null
        : Remediation.fromJson(json['Remediation'] as Map<String, dynamic>),
    sourceUrl: json['SourceUrl'] as String,
    threatIntelIndicators: (json['ThreatIntelIndicators'] as List)
        ?.map((e) => e == null
            ? null
            : ThreatIntelIndicator.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userDefinedFields: (json['UserDefinedFields'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    verificationState: _$enumDecodeNullable(
        _$VerificationStateEnumMap, json['VerificationState']),
    workflow: json['Workflow'] == null
        ? null
        : Workflow.fromJson(json['Workflow'] as Map<String, dynamic>),
    workflowState:
        _$enumDecodeNullable(_$WorkflowStateEnumMap, json['WorkflowState']),
  );
}

Map<String, dynamic> _$AwsSecurityFindingToJson(AwsSecurityFinding instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AwsAccountId', instance.awsAccountId);
  writeNotNull('CreatedAt', instance.createdAt);
  writeNotNull('Description', instance.description);
  writeNotNull('GeneratorId', instance.generatorId);
  writeNotNull('Id', instance.id);
  writeNotNull('ProductArn', instance.productArn);
  writeNotNull(
      'Resources', instance.resources?.map((e) => e?.toJson())?.toList());
  writeNotNull('SchemaVersion', instance.schemaVersion);
  writeNotNull('Severity', instance.severity?.toJson());
  writeNotNull('Title', instance.title);
  writeNotNull('Types', instance.types);
  writeNotNull('UpdatedAt', instance.updatedAt);
  writeNotNull('Compliance', instance.compliance?.toJson());
  writeNotNull('Confidence', instance.confidence);
  writeNotNull('Criticality', instance.criticality);
  writeNotNull('FirstObservedAt', instance.firstObservedAt);
  writeNotNull('LastObservedAt', instance.lastObservedAt);
  writeNotNull('Malware', instance.malware?.map((e) => e?.toJson())?.toList());
  writeNotNull('Network', instance.network?.toJson());
  writeNotNull('Note', instance.note?.toJson());
  writeNotNull('Process', instance.process?.toJson());
  writeNotNull('ProductFields', instance.productFields);
  writeNotNull('RecordState', _$RecordStateEnumMap[instance.recordState]);
  writeNotNull('RelatedFindings',
      instance.relatedFindings?.map((e) => e?.toJson())?.toList());
  writeNotNull('Remediation', instance.remediation?.toJson());
  writeNotNull('SourceUrl', instance.sourceUrl);
  writeNotNull('ThreatIntelIndicators',
      instance.threatIntelIndicators?.map((e) => e?.toJson())?.toList());
  writeNotNull('UserDefinedFields', instance.userDefinedFields);
  writeNotNull('VerificationState',
      _$VerificationStateEnumMap[instance.verificationState]);
  writeNotNull('Workflow', instance.workflow?.toJson());
  writeNotNull('WorkflowState', _$WorkflowStateEnumMap[instance.workflowState]);
  return val;
}

const _$RecordStateEnumMap = {
  RecordState.active: 'ACTIVE',
  RecordState.archived: 'ARCHIVED',
};

const _$VerificationStateEnumMap = {
  VerificationState.unknown: 'UNKNOWN',
  VerificationState.truePositive: 'TRUE_POSITIVE',
  VerificationState.falsePositive: 'FALSE_POSITIVE',
  VerificationState.benignPositive: 'BENIGN_POSITIVE',
};

const _$WorkflowStateEnumMap = {
  WorkflowState.$new: 'NEW',
  WorkflowState.assigned: 'ASSIGNED',
  WorkflowState.inProgress: 'IN_PROGRESS',
  WorkflowState.deferred: 'DEFERRED',
  WorkflowState.resolved: 'RESOLVED',
};

AwsSecurityFindingFilters _$AwsSecurityFindingFiltersFromJson(
    Map<String, dynamic> json) {
  return AwsSecurityFindingFilters(
    awsAccountId: (json['AwsAccountId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    companyName: (json['CompanyName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    complianceStatus: (json['ComplianceStatus'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    confidence: (json['Confidence'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: (json['CreatedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    criticality: (json['Criticality'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: (json['Description'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    firstObservedAt: (json['FirstObservedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    generatorId: (json['GeneratorId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: (json['Id'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    keyword: (json['Keyword'] as List)
        ?.map((e) => e == null
            ? null
            : KeywordFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastObservedAt: (json['LastObservedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    malwareName: (json['MalwareName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    malwarePath: (json['MalwarePath'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    malwareState: (json['MalwareState'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    malwareType: (json['MalwareType'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkDestinationDomain: (json['NetworkDestinationDomain'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkDestinationIpV4: (json['NetworkDestinationIpV4'] as List)
        ?.map((e) =>
            e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkDestinationIpV6: (json['NetworkDestinationIpV6'] as List)
        ?.map((e) =>
            e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkDestinationPort: (json['NetworkDestinationPort'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkDirection: (json['NetworkDirection'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkProtocol: (json['NetworkProtocol'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkSourceDomain: (json['NetworkSourceDomain'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkSourceIpV4: (json['NetworkSourceIpV4'] as List)
        ?.map((e) =>
            e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkSourceIpV6: (json['NetworkSourceIpV6'] as List)
        ?.map((e) =>
            e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkSourceMac: (json['NetworkSourceMac'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    networkSourcePort: (json['NetworkSourcePort'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    noteText: (json['NoteText'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    noteUpdatedAt: (json['NoteUpdatedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    noteUpdatedBy: (json['NoteUpdatedBy'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processLaunchedAt: (json['ProcessLaunchedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processName: (json['ProcessName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processParentPid: (json['ProcessParentPid'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processPath: (json['ProcessPath'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processPid: (json['ProcessPid'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processTerminatedAt: (json['ProcessTerminatedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productArn: (json['ProductArn'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productFields: (json['ProductFields'] as List)
        ?.map((e) =>
            e == null ? null : MapFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    productName: (json['ProductName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recommendationText: (json['RecommendationText'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recordState: (json['RecordState'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    relatedFindingsId: (json['RelatedFindingsId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    relatedFindingsProductArn: (json['RelatedFindingsProductArn'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceIamInstanceProfileArn:
        (json['ResourceAwsEc2InstanceIamInstanceProfileArn'] as List)
            ?.map((e) => e == null
                ? null
                : StringFilter.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    resourceAwsEc2InstanceImageId: (json['ResourceAwsEc2InstanceImageId']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceIpV4Addresses:
        (json['ResourceAwsEc2InstanceIpV4Addresses'] as List)
            ?.map((e) =>
                e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    resourceAwsEc2InstanceIpV6Addresses:
        (json['ResourceAwsEc2InstanceIpV6Addresses'] as List)
            ?.map((e) =>
                e == null ? null : IpFilter.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    resourceAwsEc2InstanceKeyName: (json['ResourceAwsEc2InstanceKeyName']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceLaunchedAt: (json['ResourceAwsEc2InstanceLaunchedAt']
            as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceSubnetId: (json['ResourceAwsEc2InstanceSubnetId']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceType: (json['ResourceAwsEc2InstanceType'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsEc2InstanceVpcId: (json['ResourceAwsEc2InstanceVpcId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsIamAccessKeyCreatedAt: (json['ResourceAwsIamAccessKeyCreatedAt']
            as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsIamAccessKeyStatus: (json['ResourceAwsIamAccessKeyStatus']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsIamAccessKeyUserName: (json['ResourceAwsIamAccessKeyUserName']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsS3BucketOwnerId: (json['ResourceAwsS3BucketOwnerId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceAwsS3BucketOwnerName: (json['ResourceAwsS3BucketOwnerName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceContainerImageId: (json['ResourceContainerImageId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceContainerImageName: (json['ResourceContainerImageName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceContainerLaunchedAt: (json['ResourceContainerLaunchedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceContainerName: (json['ResourceContainerName'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceDetailsOther: (json['ResourceDetailsOther'] as List)
        ?.map((e) =>
            e == null ? null : MapFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceId: (json['ResourceId'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourcePartition: (json['ResourcePartition'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceRegion: (json['ResourceRegion'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceTags: (json['ResourceTags'] as List)
        ?.map((e) =>
            e == null ? null : MapFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceType: (json['ResourceType'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    severityLabel: (json['SeverityLabel'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    severityNormalized: (json['SeverityNormalized'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    severityProduct: (json['SeverityProduct'] as List)
        ?.map((e) =>
            e == null ? null : NumberFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sourceUrl: (json['SourceUrl'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    threatIntelIndicatorCategory: (json['ThreatIntelIndicatorCategory'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    threatIntelIndicatorLastObservedAt:
        (json['ThreatIntelIndicatorLastObservedAt'] as List)
            ?.map((e) => e == null
                ? null
                : DateFilter.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    threatIntelIndicatorSource: (json['ThreatIntelIndicatorSource'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    threatIntelIndicatorSourceUrl: (json['ThreatIntelIndicatorSourceUrl']
            as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    threatIntelIndicatorType: (json['ThreatIntelIndicatorType'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    threatIntelIndicatorValue: (json['ThreatIntelIndicatorValue'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: (json['Title'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: (json['Type'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    updatedAt: (json['UpdatedAt'] as List)
        ?.map((e) =>
            e == null ? null : DateFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userDefinedFields: (json['UserDefinedFields'] as List)
        ?.map((e) =>
            e == null ? null : MapFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    verificationState: (json['VerificationState'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    workflowState: (json['WorkflowState'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    workflowStatus: (json['WorkflowStatus'] as List)
        ?.map((e) =>
            e == null ? null : StringFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AwsSecurityFindingFiltersToJson(
    AwsSecurityFindingFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AwsAccountId', instance.awsAccountId?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'CompanyName', instance.companyName?.map((e) => e?.toJson())?.toList());
  writeNotNull('ComplianceStatus',
      instance.complianceStatus?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Confidence', instance.confidence?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'CreatedAt', instance.createdAt?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Criticality', instance.criticality?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'Description', instance.description?.map((e) => e?.toJson())?.toList());
  writeNotNull('FirstObservedAt',
      instance.firstObservedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'GeneratorId', instance.generatorId?.map((e) => e?.toJson())?.toList());
  writeNotNull('Id', instance.id?.map((e) => e?.toJson())?.toList());
  writeNotNull('Keyword', instance.keyword?.map((e) => e?.toJson())?.toList());
  writeNotNull('LastObservedAt',
      instance.lastObservedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'MalwareName', instance.malwareName?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'MalwarePath', instance.malwarePath?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'MalwareState', instance.malwareState?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'MalwareType', instance.malwareType?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkDestinationDomain',
      instance.networkDestinationDomain?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkDestinationIpV4',
      instance.networkDestinationIpV4?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkDestinationIpV6',
      instance.networkDestinationIpV6?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkDestinationPort',
      instance.networkDestinationPort?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkDirection',
      instance.networkDirection?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkProtocol',
      instance.networkProtocol?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkSourceDomain',
      instance.networkSourceDomain?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkSourceIpV4',
      instance.networkSourceIpV4?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkSourceIpV6',
      instance.networkSourceIpV6?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkSourceMac',
      instance.networkSourceMac?.map((e) => e?.toJson())?.toList());
  writeNotNull('NetworkSourcePort',
      instance.networkSourcePort?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'NoteText', instance.noteText?.map((e) => e?.toJson())?.toList());
  writeNotNull('NoteUpdatedAt',
      instance.noteUpdatedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull('NoteUpdatedBy',
      instance.noteUpdatedBy?.map((e) => e?.toJson())?.toList());
  writeNotNull('ProcessLaunchedAt',
      instance.processLaunchedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProcessName', instance.processName?.map((e) => e?.toJson())?.toList());
  writeNotNull('ProcessParentPid',
      instance.processParentPid?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProcessPath', instance.processPath?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProcessPid', instance.processPid?.map((e) => e?.toJson())?.toList());
  writeNotNull('ProcessTerminatedAt',
      instance.processTerminatedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProductArn', instance.productArn?.map((e) => e?.toJson())?.toList());
  writeNotNull('ProductFields',
      instance.productFields?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ProductName', instance.productName?.map((e) => e?.toJson())?.toList());
  writeNotNull('RecommendationText',
      instance.recommendationText?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'RecordState', instance.recordState?.map((e) => e?.toJson())?.toList());
  writeNotNull('RelatedFindingsId',
      instance.relatedFindingsId?.map((e) => e?.toJson())?.toList());
  writeNotNull('RelatedFindingsProductArn',
      instance.relatedFindingsProductArn?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceIamInstanceProfileArn',
      instance.resourceAwsEc2InstanceIamInstanceProfileArn
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceImageId',
      instance.resourceAwsEc2InstanceImageId
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceIpV4Addresses',
      instance.resourceAwsEc2InstanceIpV4Addresses
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceIpV6Addresses',
      instance.resourceAwsEc2InstanceIpV6Addresses
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceKeyName',
      instance.resourceAwsEc2InstanceKeyName
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceLaunchedAt',
      instance.resourceAwsEc2InstanceLaunchedAt
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsEc2InstanceSubnetId',
      instance.resourceAwsEc2InstanceSubnetId
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('ResourceAwsEc2InstanceType',
      instance.resourceAwsEc2InstanceType?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceAwsEc2InstanceVpcId',
      instance.resourceAwsEc2InstanceVpcId?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ResourceAwsIamAccessKeyCreatedAt',
      instance.resourceAwsIamAccessKeyCreatedAt
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsIamAccessKeyStatus',
      instance.resourceAwsIamAccessKeyStatus
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ResourceAwsIamAccessKeyUserName',
      instance.resourceAwsIamAccessKeyUserName
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('ResourceAwsS3BucketOwnerId',
      instance.resourceAwsS3BucketOwnerId?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceAwsS3BucketOwnerName',
      instance.resourceAwsS3BucketOwnerName?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceContainerImageId',
      instance.resourceContainerImageId?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceContainerImageName',
      instance.resourceContainerImageName?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceContainerLaunchedAt',
      instance.resourceContainerLaunchedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceContainerName',
      instance.resourceContainerName?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceDetailsOther',
      instance.resourceDetailsOther?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ResourceId', instance.resourceId?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourcePartition',
      instance.resourcePartition?.map((e) => e?.toJson())?.toList());
  writeNotNull('ResourceRegion',
      instance.resourceRegion?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ResourceTags', instance.resourceTags?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ResourceType', instance.resourceType?.map((e) => e?.toJson())?.toList());
  writeNotNull('SeverityLabel',
      instance.severityLabel?.map((e) => e?.toJson())?.toList());
  writeNotNull('SeverityNormalized',
      instance.severityNormalized?.map((e) => e?.toJson())?.toList());
  writeNotNull('SeverityProduct',
      instance.severityProduct?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'SourceUrl', instance.sourceUrl?.map((e) => e?.toJson())?.toList());
  writeNotNull('ThreatIntelIndicatorCategory',
      instance.threatIntelIndicatorCategory?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ThreatIntelIndicatorLastObservedAt',
      instance.threatIntelIndicatorLastObservedAt
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('ThreatIntelIndicatorSource',
      instance.threatIntelIndicatorSource?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ThreatIntelIndicatorSourceUrl',
      instance.threatIntelIndicatorSourceUrl
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('ThreatIntelIndicatorType',
      instance.threatIntelIndicatorType?.map((e) => e?.toJson())?.toList());
  writeNotNull('ThreatIntelIndicatorValue',
      instance.threatIntelIndicatorValue?.map((e) => e?.toJson())?.toList());
  writeNotNull('Title', instance.title?.map((e) => e?.toJson())?.toList());
  writeNotNull('Type', instance.type?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'UpdatedAt', instance.updatedAt?.map((e) => e?.toJson())?.toList());
  writeNotNull('UserDefinedFields',
      instance.userDefinedFields?.map((e) => e?.toJson())?.toList());
  writeNotNull('VerificationState',
      instance.verificationState?.map((e) => e?.toJson())?.toList());
  writeNotNull('WorkflowState',
      instance.workflowState?.map((e) => e?.toJson())?.toList());
  writeNotNull('WorkflowStatus',
      instance.workflowStatus?.map((e) => e?.toJson())?.toList());
  return val;
}

AwsSecurityFindingIdentifier _$AwsSecurityFindingIdentifierFromJson(
    Map<String, dynamic> json) {
  return AwsSecurityFindingIdentifier(
    id: json['Id'] as String,
    productArn: json['ProductArn'] as String,
  );
}

Map<String, dynamic> _$AwsSecurityFindingIdentifierToJson(
    AwsSecurityFindingIdentifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('ProductArn', instance.productArn);
  return val;
}

AwsSnsTopicDetails _$AwsSnsTopicDetailsFromJson(Map<String, dynamic> json) {
  return AwsSnsTopicDetails(
    kmsMasterKeyId: json['KmsMasterKeyId'] as String,
    owner: json['Owner'] as String,
    subscription: (json['Subscription'] as List)
        ?.map((e) => e == null
            ? null
            : AwsSnsTopicSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    topicName: json['TopicName'] as String,
  );
}

Map<String, dynamic> _$AwsSnsTopicDetailsToJson(AwsSnsTopicDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsMasterKeyId', instance.kmsMasterKeyId);
  writeNotNull('Owner', instance.owner);
  writeNotNull(
      'Subscription', instance.subscription?.map((e) => e?.toJson())?.toList());
  writeNotNull('TopicName', instance.topicName);
  return val;
}

AwsSnsTopicSubscription _$AwsSnsTopicSubscriptionFromJson(
    Map<String, dynamic> json) {
  return AwsSnsTopicSubscription(
    endpoint: json['Endpoint'] as String,
    protocol: json['Protocol'] as String,
  );
}

Map<String, dynamic> _$AwsSnsTopicSubscriptionToJson(
    AwsSnsTopicSubscription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Endpoint', instance.endpoint);
  writeNotNull('Protocol', instance.protocol);
  return val;
}

AwsSqsQueueDetails _$AwsSqsQueueDetailsFromJson(Map<String, dynamic> json) {
  return AwsSqsQueueDetails(
    deadLetterTargetArn: json['DeadLetterTargetArn'] as String,
    kmsDataKeyReusePeriodSeconds: json['KmsDataKeyReusePeriodSeconds'] as int,
    kmsMasterKeyId: json['KmsMasterKeyId'] as String,
    queueName: json['QueueName'] as String,
  );
}

Map<String, dynamic> _$AwsSqsQueueDetailsToJson(AwsSqsQueueDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeadLetterTargetArn', instance.deadLetterTargetArn);
  writeNotNull(
      'KmsDataKeyReusePeriodSeconds', instance.kmsDataKeyReusePeriodSeconds);
  writeNotNull('KmsMasterKeyId', instance.kmsMasterKeyId);
  writeNotNull('QueueName', instance.queueName);
  return val;
}

AwsWafWebAclDetails _$AwsWafWebAclDetailsFromJson(Map<String, dynamic> json) {
  return AwsWafWebAclDetails(
    defaultAction: json['DefaultAction'] as String,
    name: json['Name'] as String,
    rules: (json['Rules'] as List)
        ?.map((e) => e == null
            ? null
            : AwsWafWebAclRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    webAclId: json['WebAclId'] as String,
  );
}

Map<String, dynamic> _$AwsWafWebAclDetailsToJson(AwsWafWebAclDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultAction', instance.defaultAction);
  writeNotNull('Name', instance.name);
  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  writeNotNull('WebAclId', instance.webAclId);
  return val;
}

AwsWafWebAclRule _$AwsWafWebAclRuleFromJson(Map<String, dynamic> json) {
  return AwsWafWebAclRule(
    action: json['Action'] == null
        ? null
        : WafAction.fromJson(json['Action'] as Map<String, dynamic>),
    excludedRules: (json['ExcludedRules'] as List)
        ?.map((e) => e == null
            ? null
            : WafExcludedRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    overrideAction: json['OverrideAction'] == null
        ? null
        : WafOverrideAction.fromJson(
            json['OverrideAction'] as Map<String, dynamic>),
    priority: json['Priority'] as int,
    ruleId: json['RuleId'] as String,
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$AwsWafWebAclRuleToJson(AwsWafWebAclRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', instance.action?.toJson());
  writeNotNull('ExcludedRules',
      instance.excludedRules?.map((e) => e?.toJson())?.toList());
  writeNotNull('OverrideAction', instance.overrideAction?.toJson());
  writeNotNull('Priority', instance.priority);
  writeNotNull('RuleId', instance.ruleId);
  writeNotNull('Type', instance.type);
  return val;
}

BatchDisableStandardsResponse _$BatchDisableStandardsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDisableStandardsResponse(
    standardsSubscriptions: (json['StandardsSubscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : StandardsSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchEnableStandardsResponse _$BatchEnableStandardsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchEnableStandardsResponse(
    standardsSubscriptions: (json['StandardsSubscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : StandardsSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchImportFindingsResponse _$BatchImportFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchImportFindingsResponse(
    failedCount: json['FailedCount'] as int,
    successCount: json['SuccessCount'] as int,
    failedFindings: (json['FailedFindings'] as List)
        ?.map((e) => e == null
            ? null
            : ImportFindingsError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchUpdateFindingsResponse _$BatchUpdateFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateFindingsResponse(
    processedFindings: (json['ProcessedFindings'] as List)
        ?.map((e) => e == null
            ? null
            : AwsSecurityFindingIdentifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedFindings: (json['UnprocessedFindings'] as List)
        ?.map((e) => e == null
            ? null
            : BatchUpdateFindingsUnprocessedFinding.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchUpdateFindingsUnprocessedFinding
    _$BatchUpdateFindingsUnprocessedFindingFromJson(Map<String, dynamic> json) {
  return BatchUpdateFindingsUnprocessedFinding(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    findingIdentifier: json['FindingIdentifier'] == null
        ? null
        : AwsSecurityFindingIdentifier.fromJson(
            json['FindingIdentifier'] as Map<String, dynamic>),
  );
}

Compliance _$ComplianceFromJson(Map<String, dynamic> json) {
  return Compliance(
    relatedRequirements: (json['RelatedRequirements'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    status: _$enumDecodeNullable(_$ComplianceStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$ComplianceToJson(Compliance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RelatedRequirements', instance.relatedRequirements);
  writeNotNull('Status', _$ComplianceStatusEnumMap[instance.status]);
  return val;
}

const _$ComplianceStatusEnumMap = {
  ComplianceStatus.passed: 'PASSED',
  ComplianceStatus.warning: 'WARNING',
  ComplianceStatus.failed: 'FAILED',
  ComplianceStatus.notAvailable: 'NOT_AVAILABLE',
};

ContainerDetails _$ContainerDetailsFromJson(Map<String, dynamic> json) {
  return ContainerDetails(
    imageId: json['ImageId'] as String,
    imageName: json['ImageName'] as String,
    launchedAt: json['LaunchedAt'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ContainerDetailsToJson(ContainerDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ImageId', instance.imageId);
  writeNotNull('ImageName', instance.imageName);
  writeNotNull('LaunchedAt', instance.launchedAt);
  writeNotNull('Name', instance.name);
  return val;
}

CreateActionTargetResponse _$CreateActionTargetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateActionTargetResponse(
    actionTargetArn: json['ActionTargetArn'] as String,
  );
}

CreateInsightResponse _$CreateInsightResponseFromJson(
    Map<String, dynamic> json) {
  return CreateInsightResponse(
    insightArn: json['InsightArn'] as String,
  );
}

CreateMembersResponse _$CreateMembersResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMembersResponse(
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DateFilter _$DateFilterFromJson(Map<String, dynamic> json) {
  return DateFilter(
    dateRange: json['DateRange'] == null
        ? null
        : DateRange.fromJson(json['DateRange'] as Map<String, dynamic>),
    end: json['End'] as String,
    start: json['Start'] as String,
  );
}

Map<String, dynamic> _$DateFilterToJson(DateFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DateRange', instance.dateRange?.toJson());
  writeNotNull('End', instance.end);
  writeNotNull('Start', instance.start);
  return val;
}

DateRange _$DateRangeFromJson(Map<String, dynamic> json) {
  return DateRange(
    unit: _$enumDecodeNullable(_$DateRangeUnitEnumMap, json['Unit']),
    value: json['Value'] as int,
  );
}

Map<String, dynamic> _$DateRangeToJson(DateRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Unit', _$DateRangeUnitEnumMap[instance.unit]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$DateRangeUnitEnumMap = {
  DateRangeUnit.days: 'DAYS',
};

DeclineInvitationsResponse _$DeclineInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return DeclineInvitationsResponse(
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteActionTargetResponse _$DeleteActionTargetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteActionTargetResponse(
    actionTargetArn: json['ActionTargetArn'] as String,
  );
}

DeleteInsightResponse _$DeleteInsightResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteInsightResponse(
    insightArn: json['InsightArn'] as String,
  );
}

DeleteInvitationsResponse _$DeleteInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteInvitationsResponse(
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteMembersResponse _$DeleteMembersResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteMembersResponse(
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeActionTargetsResponse _$DescribeActionTargetsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeActionTargetsResponse(
    actionTargets: (json['ActionTargets'] as List)
        ?.map((e) =>
            e == null ? null : ActionTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeHubResponse _$DescribeHubResponseFromJson(Map<String, dynamic> json) {
  return DescribeHubResponse(
    hubArn: json['HubArn'] as String,
    subscribedAt: json['SubscribedAt'] as String,
  );
}

DescribeProductsResponse _$DescribeProductsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProductsResponse(
    products: (json['Products'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeStandardsControlsResponse _$DescribeStandardsControlsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeStandardsControlsResponse(
    controls: (json['Controls'] as List)
        ?.map((e) => e == null
            ? null
            : StandardsControl.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

DescribeStandardsResponse _$DescribeStandardsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeStandardsResponse(
    nextToken: json['NextToken'] as String,
    standards: (json['Standards'] as List)
        ?.map((e) =>
            e == null ? null : Standard.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DisableImportFindingsForProductResponse
    _$DisableImportFindingsForProductResponseFromJson(
        Map<String, dynamic> json) {
  return DisableImportFindingsForProductResponse();
}

DisableSecurityHubResponse _$DisableSecurityHubResponseFromJson(
    Map<String, dynamic> json) {
  return DisableSecurityHubResponse();
}

DisassociateFromMasterAccountResponse
    _$DisassociateFromMasterAccountResponseFromJson(Map<String, dynamic> json) {
  return DisassociateFromMasterAccountResponse();
}

DisassociateMembersResponse _$DisassociateMembersResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateMembersResponse();
}

EnableImportFindingsForProductResponse
    _$EnableImportFindingsForProductResponseFromJson(
        Map<String, dynamic> json) {
  return EnableImportFindingsForProductResponse(
    productSubscriptionArn: json['ProductSubscriptionArn'] as String,
  );
}

EnableSecurityHubResponse _$EnableSecurityHubResponseFromJson(
    Map<String, dynamic> json) {
  return EnableSecurityHubResponse();
}

GetEnabledStandardsResponse _$GetEnabledStandardsResponseFromJson(
    Map<String, dynamic> json) {
  return GetEnabledStandardsResponse(
    nextToken: json['NextToken'] as String,
    standardsSubscriptions: (json['StandardsSubscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : StandardsSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetFindingsResponse _$GetFindingsResponseFromJson(Map<String, dynamic> json) {
  return GetFindingsResponse(
    findings: (json['Findings'] as List)
        ?.map((e) => e == null
            ? null
            : AwsSecurityFinding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetInsightResultsResponse _$GetInsightResultsResponseFromJson(
    Map<String, dynamic> json) {
  return GetInsightResultsResponse(
    insightResults: json['InsightResults'] == null
        ? null
        : InsightResults.fromJson(
            json['InsightResults'] as Map<String, dynamic>),
  );
}

GetInsightsResponse _$GetInsightsResponseFromJson(Map<String, dynamic> json) {
  return GetInsightsResponse(
    insights: (json['Insights'] as List)
        ?.map((e) =>
            e == null ? null : Insight.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetInvitationsCountResponse _$GetInvitationsCountResponseFromJson(
    Map<String, dynamic> json) {
  return GetInvitationsCountResponse(
    invitationsCount: json['InvitationsCount'] as int,
  );
}

GetMasterAccountResponse _$GetMasterAccountResponseFromJson(
    Map<String, dynamic> json) {
  return GetMasterAccountResponse(
    master: json['Master'] == null
        ? null
        : Invitation.fromJson(json['Master'] as Map<String, dynamic>),
  );
}

GetMembersResponse _$GetMembersResponseFromJson(Map<String, dynamic> json) {
  return GetMembersResponse(
    members: (json['Members'] as List)
        ?.map((e) =>
            e == null ? null : Member.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ImportFindingsError _$ImportFindingsErrorFromJson(Map<String, dynamic> json) {
  return ImportFindingsError(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    id: json['Id'] as String,
  );
}

Insight _$InsightFromJson(Map<String, dynamic> json) {
  return Insight(
    filters: json['Filters'] == null
        ? null
        : AwsSecurityFindingFilters.fromJson(
            json['Filters'] as Map<String, dynamic>),
    groupByAttribute: json['GroupByAttribute'] as String,
    insightArn: json['InsightArn'] as String,
    name: json['Name'] as String,
  );
}

InsightResultValue _$InsightResultValueFromJson(Map<String, dynamic> json) {
  return InsightResultValue(
    count: json['Count'] as int,
    groupByAttributeValue: json['GroupByAttributeValue'] as String,
  );
}

InsightResults _$InsightResultsFromJson(Map<String, dynamic> json) {
  return InsightResults(
    groupByAttribute: json['GroupByAttribute'] as String,
    insightArn: json['InsightArn'] as String,
    resultValues: (json['ResultValues'] as List)
        ?.map((e) => e == null
            ? null
            : InsightResultValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Invitation _$InvitationFromJson(Map<String, dynamic> json) {
  return Invitation(
    accountId: json['AccountId'] as String,
    invitationId: json['InvitationId'] as String,
    invitedAt: iso8601FromJson(json['InvitedAt'] as String),
    memberStatus: json['MemberStatus'] as String,
  );
}

InviteMembersResponse _$InviteMembersResponseFromJson(
    Map<String, dynamic> json) {
  return InviteMembersResponse(
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

IpFilter _$IpFilterFromJson(Map<String, dynamic> json) {
  return IpFilter(
    cidr: json['Cidr'] as String,
  );
}

Map<String, dynamic> _$IpFilterToJson(IpFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cidr', instance.cidr);
  return val;
}

KeywordFilter _$KeywordFilterFromJson(Map<String, dynamic> json) {
  return KeywordFilter(
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$KeywordFilterToJson(KeywordFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', instance.value);
  return val;
}

ListEnabledProductsForImportResponse
    _$ListEnabledProductsForImportResponseFromJson(Map<String, dynamic> json) {
  return ListEnabledProductsForImportResponse(
    nextToken: json['NextToken'] as String,
    productSubscriptions: (json['ProductSubscriptions'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

ListInvitationsResponse _$ListInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListInvitationsResponse(
    invitations: (json['Invitations'] as List)
        ?.map((e) =>
            e == null ? null : Invitation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMembersResponse _$ListMembersResponseFromJson(Map<String, dynamic> json) {
  return ListMembersResponse(
    members: (json['Members'] as List)
        ?.map((e) =>
            e == null ? null : Member.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

LoadBalancerState _$LoadBalancerStateFromJson(Map<String, dynamic> json) {
  return LoadBalancerState(
    code: json['Code'] as String,
    reason: json['Reason'] as String,
  );
}

Map<String, dynamic> _$LoadBalancerStateToJson(LoadBalancerState instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Code', instance.code);
  writeNotNull('Reason', instance.reason);
  return val;
}

Malware _$MalwareFromJson(Map<String, dynamic> json) {
  return Malware(
    name: json['Name'] as String,
    path: json['Path'] as String,
    state: _$enumDecodeNullable(_$MalwareStateEnumMap, json['State']),
    type: _$enumDecodeNullable(_$MalwareTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$MalwareToJson(Malware instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Path', instance.path);
  writeNotNull('State', _$MalwareStateEnumMap[instance.state]);
  writeNotNull('Type', _$MalwareTypeEnumMap[instance.type]);
  return val;
}

const _$MalwareStateEnumMap = {
  MalwareState.observed: 'OBSERVED',
  MalwareState.removalFailed: 'REMOVAL_FAILED',
  MalwareState.removed: 'REMOVED',
};

const _$MalwareTypeEnumMap = {
  MalwareType.adware: 'ADWARE',
  MalwareType.blendedThreat: 'BLENDED_THREAT',
  MalwareType.botnetAgent: 'BOTNET_AGENT',
  MalwareType.coinMiner: 'COIN_MINER',
  MalwareType.exploitKit: 'EXPLOIT_KIT',
  MalwareType.keylogger: 'KEYLOGGER',
  MalwareType.macro: 'MACRO',
  MalwareType.potentiallyUnwanted: 'POTENTIALLY_UNWANTED',
  MalwareType.spyware: 'SPYWARE',
  MalwareType.ransomware: 'RANSOMWARE',
  MalwareType.remoteAccess: 'REMOTE_ACCESS',
  MalwareType.rootkit: 'ROOTKIT',
  MalwareType.trojan: 'TROJAN',
  MalwareType.virus: 'VIRUS',
  MalwareType.worm: 'WORM',
};

MapFilter _$MapFilterFromJson(Map<String, dynamic> json) {
  return MapFilter(
    comparison:
        _$enumDecodeNullable(_$MapFilterComparisonEnumMap, json['Comparison']),
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$MapFilterToJson(MapFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Comparison', _$MapFilterComparisonEnumMap[instance.comparison]);
  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

const _$MapFilterComparisonEnumMap = {
  MapFilterComparison.equals: 'EQUALS',
};

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    accountId: json['AccountId'] as String,
    email: json['Email'] as String,
    invitedAt: iso8601FromJson(json['InvitedAt'] as String),
    masterId: json['MasterId'] as String,
    memberStatus: json['MemberStatus'] as String,
    updatedAt: iso8601FromJson(json['UpdatedAt'] as String),
  );
}

Network _$NetworkFromJson(Map<String, dynamic> json) {
  return Network(
    destinationDomain: json['DestinationDomain'] as String,
    destinationIpV4: json['DestinationIpV4'] as String,
    destinationIpV6: json['DestinationIpV6'] as String,
    destinationPort: json['DestinationPort'] as int,
    direction:
        _$enumDecodeNullable(_$NetworkDirectionEnumMap, json['Direction']),
    protocol: json['Protocol'] as String,
    sourceDomain: json['SourceDomain'] as String,
    sourceIpV4: json['SourceIpV4'] as String,
    sourceIpV6: json['SourceIpV6'] as String,
    sourceMac: json['SourceMac'] as String,
    sourcePort: json['SourcePort'] as int,
  );
}

Map<String, dynamic> _$NetworkToJson(Network instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationDomain', instance.destinationDomain);
  writeNotNull('DestinationIpV4', instance.destinationIpV4);
  writeNotNull('DestinationIpV6', instance.destinationIpV6);
  writeNotNull('DestinationPort', instance.destinationPort);
  writeNotNull('Direction', _$NetworkDirectionEnumMap[instance.direction]);
  writeNotNull('Protocol', instance.protocol);
  writeNotNull('SourceDomain', instance.sourceDomain);
  writeNotNull('SourceIpV4', instance.sourceIpV4);
  writeNotNull('SourceIpV6', instance.sourceIpV6);
  writeNotNull('SourceMac', instance.sourceMac);
  writeNotNull('SourcePort', instance.sourcePort);
  return val;
}

const _$NetworkDirectionEnumMap = {
  NetworkDirection.$in: 'IN',
  NetworkDirection.out: 'OUT',
};

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    text: json['Text'] as String,
    updatedAt: json['UpdatedAt'] as String,
    updatedBy: json['UpdatedBy'] as String,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Text', instance.text);
  writeNotNull('UpdatedAt', instance.updatedAt);
  writeNotNull('UpdatedBy', instance.updatedBy);
  return val;
}

Map<String, dynamic> _$NoteUpdateToJson(NoteUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Text', instance.text);
  writeNotNull('UpdatedBy', instance.updatedBy);
  return val;
}

NumberFilter _$NumberFilterFromJson(Map<String, dynamic> json) {
  return NumberFilter(
    eq: (json['Eq'] as num)?.toDouble(),
    gte: (json['Gte'] as num)?.toDouble(),
    lte: (json['Lte'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$NumberFilterToJson(NumberFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Eq', instance.eq);
  writeNotNull('Gte', instance.gte);
  writeNotNull('Lte', instance.lte);
  return val;
}

ProcessDetails _$ProcessDetailsFromJson(Map<String, dynamic> json) {
  return ProcessDetails(
    launchedAt: json['LaunchedAt'] as String,
    name: json['Name'] as String,
    parentPid: json['ParentPid'] as int,
    path: json['Path'] as String,
    pid: json['Pid'] as int,
    terminatedAt: json['TerminatedAt'] as String,
  );
}

Map<String, dynamic> _$ProcessDetailsToJson(ProcessDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LaunchedAt', instance.launchedAt);
  writeNotNull('Name', instance.name);
  writeNotNull('ParentPid', instance.parentPid);
  writeNotNull('Path', instance.path);
  writeNotNull('Pid', instance.pid);
  writeNotNull('TerminatedAt', instance.terminatedAt);
  return val;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    productArn: json['ProductArn'] as String,
    activationUrl: json['ActivationUrl'] as String,
    categories: (json['Categories'] as List)?.map((e) => e as String)?.toList(),
    companyName: json['CompanyName'] as String,
    description: json['Description'] as String,
    integrationTypes:
        (json['IntegrationTypes'] as List)?.map((e) => e as String)?.toList(),
    marketplaceUrl: json['MarketplaceUrl'] as String,
    productName: json['ProductName'] as String,
    productSubscriptionResourcePolicy:
        json['ProductSubscriptionResourcePolicy'] as String,
  );
}

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) {
  return Recommendation(
    text: json['Text'] as String,
    url: json['Url'] as String,
  );
}

Map<String, dynamic> _$RecommendationToJson(Recommendation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Text', instance.text);
  writeNotNull('Url', instance.url);
  return val;
}

RelatedFinding _$RelatedFindingFromJson(Map<String, dynamic> json) {
  return RelatedFinding(
    id: json['Id'] as String,
    productArn: json['ProductArn'] as String,
  );
}

Map<String, dynamic> _$RelatedFindingToJson(RelatedFinding instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('ProductArn', instance.productArn);
  return val;
}

Remediation _$RemediationFromJson(Map<String, dynamic> json) {
  return Remediation(
    recommendation: json['Recommendation'] == null
        ? null
        : Recommendation.fromJson(
            json['Recommendation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RemediationToJson(Remediation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Recommendation', instance.recommendation?.toJson());
  return val;
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    id: json['Id'] as String,
    type: json['Type'] as String,
    details: json['Details'] == null
        ? null
        : ResourceDetails.fromJson(json['Details'] as Map<String, dynamic>),
    partition: _$enumDecodeNullable(_$PartitionEnumMap, json['Partition']),
    region: json['Region'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  writeNotNull('Type', instance.type);
  writeNotNull('Details', instance.details?.toJson());
  writeNotNull('Partition', _$PartitionEnumMap[instance.partition]);
  writeNotNull('Region', instance.region);
  writeNotNull('Tags', instance.tags);
  return val;
}

const _$PartitionEnumMap = {
  Partition.aws: 'aws',
  Partition.awsCn: 'aws-cn',
  Partition.awsUsGov: 'aws-us-gov',
};

ResourceDetails _$ResourceDetailsFromJson(Map<String, dynamic> json) {
  return ResourceDetails(
    awsCloudFrontDistribution: json['AwsCloudFrontDistribution'] == null
        ? null
        : AwsCloudFrontDistributionDetails.fromJson(
            json['AwsCloudFrontDistribution'] as Map<String, dynamic>),
    awsCodeBuildProject: json['AwsCodeBuildProject'] == null
        ? null
        : AwsCodeBuildProjectDetails.fromJson(
            json['AwsCodeBuildProject'] as Map<String, dynamic>),
    awsEc2Instance: json['AwsEc2Instance'] == null
        ? null
        : AwsEc2InstanceDetails.fromJson(
            json['AwsEc2Instance'] as Map<String, dynamic>),
    awsEc2NetworkInterface: json['AwsEc2NetworkInterface'] == null
        ? null
        : AwsEc2NetworkInterfaceDetails.fromJson(
            json['AwsEc2NetworkInterface'] as Map<String, dynamic>),
    awsEc2SecurityGroup: json['AwsEc2SecurityGroup'] == null
        ? null
        : AwsEc2SecurityGroupDetails.fromJson(
            json['AwsEc2SecurityGroup'] as Map<String, dynamic>),
    awsElasticsearchDomain: json['AwsElasticsearchDomain'] == null
        ? null
        : AwsElasticsearchDomainDetails.fromJson(
            json['AwsElasticsearchDomain'] as Map<String, dynamic>),
    awsElbv2LoadBalancer: json['AwsElbv2LoadBalancer'] == null
        ? null
        : AwsElbv2LoadBalancerDetails.fromJson(
            json['AwsElbv2LoadBalancer'] as Map<String, dynamic>),
    awsIamAccessKey: json['AwsIamAccessKey'] == null
        ? null
        : AwsIamAccessKeyDetails.fromJson(
            json['AwsIamAccessKey'] as Map<String, dynamic>),
    awsIamRole: json['AwsIamRole'] == null
        ? null
        : AwsIamRoleDetails.fromJson(
            json['AwsIamRole'] as Map<String, dynamic>),
    awsKmsKey: json['AwsKmsKey'] == null
        ? null
        : AwsKmsKeyDetails.fromJson(json['AwsKmsKey'] as Map<String, dynamic>),
    awsLambdaFunction: json['AwsLambdaFunction'] == null
        ? null
        : AwsLambdaFunctionDetails.fromJson(
            json['AwsLambdaFunction'] as Map<String, dynamic>),
    awsLambdaLayerVersion: json['AwsLambdaLayerVersion'] == null
        ? null
        : AwsLambdaLayerVersionDetails.fromJson(
            json['AwsLambdaLayerVersion'] as Map<String, dynamic>),
    awsRdsDbInstance: json['AwsRdsDbInstance'] == null
        ? null
        : AwsRdsDbInstanceDetails.fromJson(
            json['AwsRdsDbInstance'] as Map<String, dynamic>),
    awsS3Bucket: json['AwsS3Bucket'] == null
        ? null
        : AwsS3BucketDetails.fromJson(
            json['AwsS3Bucket'] as Map<String, dynamic>),
    awsS3Object: json['AwsS3Object'] == null
        ? null
        : AwsS3ObjectDetails.fromJson(
            json['AwsS3Object'] as Map<String, dynamic>),
    awsSnsTopic: json['AwsSnsTopic'] == null
        ? null
        : AwsSnsTopicDetails.fromJson(
            json['AwsSnsTopic'] as Map<String, dynamic>),
    awsSqsQueue: json['AwsSqsQueue'] == null
        ? null
        : AwsSqsQueueDetails.fromJson(
            json['AwsSqsQueue'] as Map<String, dynamic>),
    awsWafWebAcl: json['AwsWafWebAcl'] == null
        ? null
        : AwsWafWebAclDetails.fromJson(
            json['AwsWafWebAcl'] as Map<String, dynamic>),
    container: json['Container'] == null
        ? null
        : ContainerDetails.fromJson(json['Container'] as Map<String, dynamic>),
    other: (json['Other'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ResourceDetailsToJson(ResourceDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AwsCloudFrontDistribution',
      instance.awsCloudFrontDistribution?.toJson());
  writeNotNull('AwsCodeBuildProject', instance.awsCodeBuildProject?.toJson());
  writeNotNull('AwsEc2Instance', instance.awsEc2Instance?.toJson());
  writeNotNull(
      'AwsEc2NetworkInterface', instance.awsEc2NetworkInterface?.toJson());
  writeNotNull('AwsEc2SecurityGroup', instance.awsEc2SecurityGroup?.toJson());
  writeNotNull(
      'AwsElasticsearchDomain', instance.awsElasticsearchDomain?.toJson());
  writeNotNull('AwsElbv2LoadBalancer', instance.awsElbv2LoadBalancer?.toJson());
  writeNotNull('AwsIamAccessKey', instance.awsIamAccessKey?.toJson());
  writeNotNull('AwsIamRole', instance.awsIamRole?.toJson());
  writeNotNull('AwsKmsKey', instance.awsKmsKey?.toJson());
  writeNotNull('AwsLambdaFunction', instance.awsLambdaFunction?.toJson());
  writeNotNull(
      'AwsLambdaLayerVersion', instance.awsLambdaLayerVersion?.toJson());
  writeNotNull('AwsRdsDbInstance', instance.awsRdsDbInstance?.toJson());
  writeNotNull('AwsS3Bucket', instance.awsS3Bucket?.toJson());
  writeNotNull('AwsS3Object', instance.awsS3Object?.toJson());
  writeNotNull('AwsSnsTopic', instance.awsSnsTopic?.toJson());
  writeNotNull('AwsSqsQueue', instance.awsSqsQueue?.toJson());
  writeNotNull('AwsWafWebAcl', instance.awsWafWebAcl?.toJson());
  writeNotNull('Container', instance.container?.toJson());
  writeNotNull('Other', instance.other);
  return val;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    accountId: json['AccountId'] as String,
    processingResult: json['ProcessingResult'] as String,
  );
}

Severity _$SeverityFromJson(Map<String, dynamic> json) {
  return Severity(
    label: _$enumDecodeNullable(_$SeverityLabelEnumMap, json['Label']),
    normalized: json['Normalized'] as int,
    product: (json['Product'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SeverityToJson(Severity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Label', _$SeverityLabelEnumMap[instance.label]);
  writeNotNull('Normalized', instance.normalized);
  writeNotNull('Product', instance.product);
  return val;
}

const _$SeverityLabelEnumMap = {
  SeverityLabel.informational: 'INFORMATIONAL',
  SeverityLabel.low: 'LOW',
  SeverityLabel.medium: 'MEDIUM',
  SeverityLabel.high: 'HIGH',
  SeverityLabel.critical: 'CRITICAL',
};

Map<String, dynamic> _$SeverityUpdateToJson(SeverityUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Label', _$SeverityLabelEnumMap[instance.label]);
  writeNotNull('Normalized', instance.normalized);
  writeNotNull('Product', instance.product);
  return val;
}

Map<String, dynamic> _$SortCriterionToJson(SortCriterion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Field', instance.field);
  writeNotNull('SortOrder', _$SortOrderEnumMap[instance.sortOrder]);
  return val;
}

const _$SortOrderEnumMap = {
  SortOrder.asc: 'asc',
  SortOrder.desc: 'desc',
};

Standard _$StandardFromJson(Map<String, dynamic> json) {
  return Standard(
    description: json['Description'] as String,
    enabledByDefault: json['EnabledByDefault'] as bool,
    name: json['Name'] as String,
    standardsArn: json['StandardsArn'] as String,
  );
}

StandardsControl _$StandardsControlFromJson(Map<String, dynamic> json) {
  return StandardsControl(
    controlId: json['ControlId'] as String,
    controlStatus:
        _$enumDecodeNullable(_$ControlStatusEnumMap, json['ControlStatus']),
    controlStatusUpdatedAt:
        iso8601FromJson(json['ControlStatusUpdatedAt'] as String),
    description: json['Description'] as String,
    disabledReason: json['DisabledReason'] as String,
    relatedRequirements: (json['RelatedRequirements'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    remediationUrl: json['RemediationUrl'] as String,
    severityRating:
        _$enumDecodeNullable(_$SeverityRatingEnumMap, json['SeverityRating']),
    standardsControlArn: json['StandardsControlArn'] as String,
    title: json['Title'] as String,
  );
}

const _$ControlStatusEnumMap = {
  ControlStatus.enabled: 'ENABLED',
  ControlStatus.disabled: 'DISABLED',
};

const _$SeverityRatingEnumMap = {
  SeverityRating.low: 'LOW',
  SeverityRating.medium: 'MEDIUM',
  SeverityRating.high: 'HIGH',
  SeverityRating.critical: 'CRITICAL',
};

StandardsSubscription _$StandardsSubscriptionFromJson(
    Map<String, dynamic> json) {
  return StandardsSubscription(
    standardsArn: json['StandardsArn'] as String,
    standardsInput: (json['StandardsInput'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    standardsStatus:
        _$enumDecodeNullable(_$StandardsStatusEnumMap, json['StandardsStatus']),
    standardsSubscriptionArn: json['StandardsSubscriptionArn'] as String,
  );
}

const _$StandardsStatusEnumMap = {
  StandardsStatus.pending: 'PENDING',
  StandardsStatus.ready: 'READY',
  StandardsStatus.failed: 'FAILED',
  StandardsStatus.deleting: 'DELETING',
  StandardsStatus.incomplete: 'INCOMPLETE',
};

Map<String, dynamic> _$StandardsSubscriptionRequestToJson(
    StandardsSubscriptionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StandardsArn', instance.standardsArn);
  writeNotNull('StandardsInput', instance.standardsInput);
  return val;
}

StringFilter _$StringFilterFromJson(Map<String, dynamic> json) {
  return StringFilter(
    comparison: _$enumDecodeNullable(
        _$StringFilterComparisonEnumMap, json['Comparison']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$StringFilterToJson(StringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Comparison', _$StringFilterComparisonEnumMap[instance.comparison]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$StringFilterComparisonEnumMap = {
  StringFilterComparison.equals: 'EQUALS',
  StringFilterComparison.prefix: 'PREFIX',
};

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

ThreatIntelIndicator _$ThreatIntelIndicatorFromJson(Map<String, dynamic> json) {
  return ThreatIntelIndicator(
    category: _$enumDecodeNullable(
        _$ThreatIntelIndicatorCategoryEnumMap, json['Category']),
    lastObservedAt: json['LastObservedAt'] as String,
    source: json['Source'] as String,
    sourceUrl: json['SourceUrl'] as String,
    type: _$enumDecodeNullable(_$ThreatIntelIndicatorTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$ThreatIntelIndicatorToJson(
    ThreatIntelIndicator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Category', _$ThreatIntelIndicatorCategoryEnumMap[instance.category]);
  writeNotNull('LastObservedAt', instance.lastObservedAt);
  writeNotNull('Source', instance.source);
  writeNotNull('SourceUrl', instance.sourceUrl);
  writeNotNull('Type', _$ThreatIntelIndicatorTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$ThreatIntelIndicatorCategoryEnumMap = {
  ThreatIntelIndicatorCategory.backdoor: 'BACKDOOR',
  ThreatIntelIndicatorCategory.cardStealer: 'CARD_STEALER',
  ThreatIntelIndicatorCategory.commandAndControl: 'COMMAND_AND_CONTROL',
  ThreatIntelIndicatorCategory.dropSite: 'DROP_SITE',
  ThreatIntelIndicatorCategory.exploitSite: 'EXPLOIT_SITE',
  ThreatIntelIndicatorCategory.keylogger: 'KEYLOGGER',
};

const _$ThreatIntelIndicatorTypeEnumMap = {
  ThreatIntelIndicatorType.domain: 'DOMAIN',
  ThreatIntelIndicatorType.emailAddress: 'EMAIL_ADDRESS',
  ThreatIntelIndicatorType.hashMd5: 'HASH_MD5',
  ThreatIntelIndicatorType.hashSha1: 'HASH_SHA1',
  ThreatIntelIndicatorType.hashSha256: 'HASH_SHA256',
  ThreatIntelIndicatorType.hashSha512: 'HASH_SHA512',
  ThreatIntelIndicatorType.ipv4Address: 'IPV4_ADDRESS',
  ThreatIntelIndicatorType.ipv6Address: 'IPV6_ADDRESS',
  ThreatIntelIndicatorType.mutex: 'MUTEX',
  ThreatIntelIndicatorType.process: 'PROCESS',
  ThreatIntelIndicatorType.url: 'URL',
};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateActionTargetResponse _$UpdateActionTargetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateActionTargetResponse();
}

UpdateFindingsResponse _$UpdateFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFindingsResponse();
}

UpdateInsightResponse _$UpdateInsightResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateInsightResponse();
}

UpdateStandardsControlResponse _$UpdateStandardsControlResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateStandardsControlResponse();
}

WafAction _$WafActionFromJson(Map<String, dynamic> json) {
  return WafAction(
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$WafActionToJson(WafAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', instance.type);
  return val;
}

WafExcludedRule _$WafExcludedRuleFromJson(Map<String, dynamic> json) {
  return WafExcludedRule(
    ruleId: json['RuleId'] as String,
  );
}

Map<String, dynamic> _$WafExcludedRuleToJson(WafExcludedRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RuleId', instance.ruleId);
  return val;
}

WafOverrideAction _$WafOverrideActionFromJson(Map<String, dynamic> json) {
  return WafOverrideAction(
    type: json['Type'] as String,
  );
}

Map<String, dynamic> _$WafOverrideActionToJson(WafOverrideAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', instance.type);
  return val;
}

Workflow _$WorkflowFromJson(Map<String, dynamic> json) {
  return Workflow(
    status: _$enumDecodeNullable(_$WorkflowStatusEnumMap, json['Status']),
  );
}

Map<String, dynamic> _$WorkflowToJson(Workflow instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', _$WorkflowStatusEnumMap[instance.status]);
  return val;
}

const _$WorkflowStatusEnumMap = {
  WorkflowStatus.$new: 'NEW',
  WorkflowStatus.notified: 'NOTIFIED',
  WorkflowStatus.resolved: 'RESOLVED',
  WorkflowStatus.suppressed: 'SUPPRESSED',
};

Map<String, dynamic> _$WorkflowUpdateToJson(WorkflowUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', _$WorkflowStatusEnumMap[instance.status]);
  return val;
}
