// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-04-19.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociateTeamMemberResult _$AssociateTeamMemberResultFromJson(
    Map<String, dynamic> json) {
  return AssociateTeamMemberResult(
    clientRequestToken: json['clientRequestToken'] as String,
  );
}

Map<String, dynamic> _$CodeToJson(Code instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('destination', instance.destination?.toJson());
  writeNotNull('source', instance.source?.toJson());
  return val;
}

Map<String, dynamic> _$CodeCommitCodeDestinationToJson(
    CodeCommitCodeDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  return val;
}

Map<String, dynamic> _$CodeDestinationToJson(CodeDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('codeCommit', instance.codeCommit?.toJson());
  writeNotNull('gitHub', instance.gitHub?.toJson());
  return val;
}

Map<String, dynamic> _$CodeSourceToJson(CodeSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3', instance.s3?.toJson());
  return val;
}

CreateProjectResult _$CreateProjectResultFromJson(Map<String, dynamic> json) {
  return CreateProjectResult(
    arn: json['arn'] as String,
    id: json['id'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    projectTemplateId: json['projectTemplateId'] as String,
  );
}

CreateUserProfileResult _$CreateUserProfileResultFromJson(
    Map<String, dynamic> json) {
  return CreateUserProfileResult(
    userArn: json['userArn'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['createdTimestamp']),
    displayName: json['displayName'] as String,
    emailAddress: json['emailAddress'] as String,
    lastModifiedTimestamp:
        const UnixDateTimeConverter().fromJson(json['lastModifiedTimestamp']),
    sshPublicKey: json['sshPublicKey'] as String,
  );
}

DeleteProjectResult _$DeleteProjectResultFromJson(Map<String, dynamic> json) {
  return DeleteProjectResult(
    projectArn: json['projectArn'] as String,
    stackId: json['stackId'] as String,
  );
}

DeleteUserProfileResult _$DeleteUserProfileResultFromJson(
    Map<String, dynamic> json) {
  return DeleteUserProfileResult(
    userArn: json['userArn'] as String,
  );
}

DescribeProjectResult _$DescribeProjectResultFromJson(
    Map<String, dynamic> json) {
  return DescribeProjectResult(
    arn: json['arn'] as String,
    clientRequestToken: json['clientRequestToken'] as String,
    createdTimeStamp:
        const UnixDateTimeConverter().fromJson(json['createdTimeStamp']),
    description: json['description'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    projectTemplateId: json['projectTemplateId'] as String,
    stackId: json['stackId'] as String,
    status: json['status'] == null
        ? null
        : ProjectStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

DescribeUserProfileResult _$DescribeUserProfileResultFromJson(
    Map<String, dynamic> json) {
  return DescribeUserProfileResult(
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['createdTimestamp']),
    lastModifiedTimestamp:
        const UnixDateTimeConverter().fromJson(json['lastModifiedTimestamp']),
    userArn: json['userArn'] as String,
    displayName: json['displayName'] as String,
    emailAddress: json['emailAddress'] as String,
    sshPublicKey: json['sshPublicKey'] as String,
  );
}

DisassociateTeamMemberResult _$DisassociateTeamMemberResultFromJson(
    Map<String, dynamic> json) {
  return DisassociateTeamMemberResult();
}

Map<String, dynamic> _$GitHubCodeDestinationToJson(
    GitHubCodeDestination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('issuesEnabled', instance.issuesEnabled);
  writeNotNull('name', instance.name);
  writeNotNull('owner', instance.owner);
  writeNotNull('privateRepository', instance.privateRepository);
  writeNotNull('token', instance.token);
  writeNotNull('type', instance.type);
  writeNotNull('description', instance.description);
  return val;
}

ListProjectsResult _$ListProjectsResultFromJson(Map<String, dynamic> json) {
  return ListProjectsResult(
    projects: (json['projects'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListResourcesResult _$ListResourcesResultFromJson(Map<String, dynamic> json) {
  return ListResourcesResult(
    nextToken: json['nextToken'] as String,
    resources: (json['resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForProjectResult _$ListTagsForProjectResultFromJson(
    Map<String, dynamic> json) {
  return ListTagsForProjectResult(
    nextToken: json['nextToken'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListTeamMembersResult _$ListTeamMembersResultFromJson(
    Map<String, dynamic> json) {
  return ListTeamMembersResult(
    teamMembers: (json['teamMembers'] as List)
        ?.map((e) =>
            e == null ? null : TeamMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListUserProfilesResult _$ListUserProfilesResultFromJson(
    Map<String, dynamic> json) {
  return ListUserProfilesResult(
    userProfiles: (json['userProfiles'] as List)
        ?.map((e) => e == null
            ? null
            : UserProfileSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ProjectStatus _$ProjectStatusFromJson(Map<String, dynamic> json) {
  return ProjectStatus(
    state: json['state'] as String,
    reason: json['reason'] as String,
  );
}

ProjectSummary _$ProjectSummaryFromJson(Map<String, dynamic> json) {
  return ProjectSummary(
    projectArn: json['projectArn'] as String,
    projectId: json['projectId'] as String,
  );
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$S3LocationToJson(S3Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketKey', instance.bucketKey);
  writeNotNull('bucketName', instance.bucketName);
  return val;
}

TagProjectResult _$TagProjectResultFromJson(Map<String, dynamic> json) {
  return TagProjectResult(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

TeamMember _$TeamMemberFromJson(Map<String, dynamic> json) {
  return TeamMember(
    projectRole: json['projectRole'] as String,
    userArn: json['userArn'] as String,
    remoteAccessAllowed: json['remoteAccessAllowed'] as bool,
  );
}

Map<String, dynamic> _$ToolchainToJson(Toolchain instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source?.toJson());
  writeNotNull('roleArn', instance.roleArn);
  writeNotNull('stackParameters', instance.stackParameters);
  return val;
}

Map<String, dynamic> _$ToolchainSourceToJson(ToolchainSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3', instance.s3?.toJson());
  return val;
}

UntagProjectResult _$UntagProjectResultFromJson(Map<String, dynamic> json) {
  return UntagProjectResult();
}

UpdateProjectResult _$UpdateProjectResultFromJson(Map<String, dynamic> json) {
  return UpdateProjectResult();
}

UpdateTeamMemberResult _$UpdateTeamMemberResultFromJson(
    Map<String, dynamic> json) {
  return UpdateTeamMemberResult(
    projectRole: json['projectRole'] as String,
    remoteAccessAllowed: json['remoteAccessAllowed'] as bool,
    userArn: json['userArn'] as String,
  );
}

UpdateUserProfileResult _$UpdateUserProfileResultFromJson(
    Map<String, dynamic> json) {
  return UpdateUserProfileResult(
    userArn: json['userArn'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['createdTimestamp']),
    displayName: json['displayName'] as String,
    emailAddress: json['emailAddress'] as String,
    lastModifiedTimestamp:
        const UnixDateTimeConverter().fromJson(json['lastModifiedTimestamp']),
    sshPublicKey: json['sshPublicKey'] as String,
  );
}

UserProfileSummary _$UserProfileSummaryFromJson(Map<String, dynamic> json) {
  return UserProfileSummary(
    displayName: json['displayName'] as String,
    emailAddress: json['emailAddress'] as String,
    sshPublicKey: json['sshPublicKey'] as String,
    userArn: json['userArn'] as String,
  );
}
