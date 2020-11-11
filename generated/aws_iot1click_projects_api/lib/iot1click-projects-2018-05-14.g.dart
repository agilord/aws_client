// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iot1click-projects-2018-05-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AssociateDeviceWithPlacementRequestToJson(
    AssociateDeviceWithPlacementRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deviceId', instance.deviceId);
  return val;
}

AssociateDeviceWithPlacementResponse
    _$AssociateDeviceWithPlacementResponseFromJson(Map<String, dynamic> json) {
  return AssociateDeviceWithPlacementResponse();
}

Map<String, dynamic> _$CreatePlacementRequestToJson(
    CreatePlacementRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('placementName', instance.placementName);
  writeNotNull('attributes', instance.attributes);
  return val;
}

CreatePlacementResponse _$CreatePlacementResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePlacementResponse();
}

Map<String, dynamic> _$CreateProjectRequestToJson(
    CreateProjectRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('projectName', instance.projectName);
  writeNotNull('description', instance.description);
  writeNotNull('placementTemplate', instance.placementTemplate?.toJson());
  writeNotNull('tags', instance.tags);
  return val;
}

CreateProjectResponse _$CreateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProjectResponse();
}

Map<String, dynamic> _$DeletePlacementRequestToJson(
        DeletePlacementRequest instance) =>
    <String, dynamic>{};

DeletePlacementResponse _$DeletePlacementResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePlacementResponse();
}

Map<String, dynamic> _$DeleteProjectRequestToJson(
        DeleteProjectRequest instance) =>
    <String, dynamic>{};

DeleteProjectResponse _$DeleteProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProjectResponse();
}

DescribePlacementResponse _$DescribePlacementResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePlacementResponse(
    placement: json['placement'] == null
        ? null
        : PlacementDescription.fromJson(
            json['placement'] as Map<String, dynamic>),
  );
}

DescribeProjectResponse _$DescribeProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProjectResponse(
    project: json['project'] == null
        ? null
        : ProjectDescription.fromJson(json['project'] as Map<String, dynamic>),
  );
}

DeviceTemplate _$DeviceTemplateFromJson(Map<String, dynamic> json) {
  return DeviceTemplate(
    callbackOverrides: (json['callbackOverrides'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    deviceType: json['deviceType'] as String,
  );
}

Map<String, dynamic> _$DeviceTemplateToJson(DeviceTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('callbackOverrides', instance.callbackOverrides);
  writeNotNull('deviceType', instance.deviceType);
  return val;
}

Map<String, dynamic> _$DisassociateDeviceFromPlacementRequestToJson(
        DisassociateDeviceFromPlacementRequest instance) =>
    <String, dynamic>{};

DisassociateDeviceFromPlacementResponse
    _$DisassociateDeviceFromPlacementResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateDeviceFromPlacementResponse();
}

GetDevicesInPlacementResponse _$GetDevicesInPlacementResponseFromJson(
    Map<String, dynamic> json) {
  return GetDevicesInPlacementResponse(
    devices: (json['devices'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListPlacementsResponse _$ListPlacementsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPlacementsResponse(
    placements: (json['placements'] as List)
        ?.map((e) => e == null
            ? null
            : PlacementSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListProjectsResponse _$ListProjectsResponseFromJson(Map<String, dynamic> json) {
  return ListProjectsResponse(
    projects: (json['projects'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

PlacementDescription _$PlacementDescriptionFromJson(Map<String, dynamic> json) {
  return PlacementDescription(
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    createdDate: unixTimestampFromJson(json['createdDate']),
    placementName: json['placementName'] as String,
    projectName: json['projectName'] as String,
    updatedDate: unixTimestampFromJson(json['updatedDate']),
  );
}

PlacementSummary _$PlacementSummaryFromJson(Map<String, dynamic> json) {
  return PlacementSummary(
    createdDate: unixTimestampFromJson(json['createdDate']),
    placementName: json['placementName'] as String,
    projectName: json['projectName'] as String,
    updatedDate: unixTimestampFromJson(json['updatedDate']),
  );
}

PlacementTemplate _$PlacementTemplateFromJson(Map<String, dynamic> json) {
  return PlacementTemplate(
    defaultAttributes: (json['defaultAttributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    deviceTemplates: (json['deviceTemplates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : DeviceTemplate.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$PlacementTemplateToJson(PlacementTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('defaultAttributes', instance.defaultAttributes);
  writeNotNull('deviceTemplates',
      instance.deviceTemplates?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

ProjectDescription _$ProjectDescriptionFromJson(Map<String, dynamic> json) {
  return ProjectDescription(
    createdDate: unixTimestampFromJson(json['createdDate']),
    projectName: json['projectName'] as String,
    updatedDate: unixTimestampFromJson(json['updatedDate']),
    arn: json['arn'] as String,
    description: json['description'] as String,
    placementTemplate: json['placementTemplate'] == null
        ? null
        : PlacementTemplate.fromJson(
            json['placementTemplate'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ProjectSummary _$ProjectSummaryFromJson(Map<String, dynamic> json) {
  return ProjectSummary(
    createdDate: unixTimestampFromJson(json['createdDate']),
    projectName: json['projectName'] as String,
    updatedDate: unixTimestampFromJson(json['updatedDate']),
    arn: json['arn'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', instance.tags);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$UntagResourceRequestToJson(
        UntagResourceRequest instance) =>
    <String, dynamic>{};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UpdatePlacementRequestToJson(
    UpdatePlacementRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributes', instance.attributes);
  return val;
}

UpdatePlacementResponse _$UpdatePlacementResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePlacementResponse();
}

Map<String, dynamic> _$UpdateProjectRequestToJson(
    UpdateProjectRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('placementTemplate', instance.placementTemplate?.toJson());
  return val;
}

UpdateProjectResponse _$UpdateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProjectResponse();
}
