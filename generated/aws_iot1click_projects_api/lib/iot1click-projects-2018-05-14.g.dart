// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iot1click-projects-2018-05-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociateDeviceWithPlacementResponse
    _$AssociateDeviceWithPlacementResponseFromJson(Map<String, dynamic> json) {
  return AssociateDeviceWithPlacementResponse();
}

CreatePlacementResponse _$CreatePlacementResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePlacementResponse();
}

CreateProjectResponse _$CreateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProjectResponse();
}

DeletePlacementResponse _$DeletePlacementResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePlacementResponse();
}

DeleteProjectResponse _$DeleteProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProjectResponse();
}

DescribePlacementResponse _$DescribePlacementResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePlacementResponse(
    placement: PlacementDescription.fromJson(
        json['placement'] as Map<String, dynamic>),
  );
}

DescribeProjectResponse _$DescribeProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProjectResponse(
    project:
        ProjectDescription.fromJson(json['project'] as Map<String, dynamic>),
  );
}

DeviceTemplate _$DeviceTemplateFromJson(Map<String, dynamic> json) {
  return DeviceTemplate(
    callbackOverrides:
        (json['callbackOverrides'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    deviceType: json['deviceType'] as String?,
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

DisassociateDeviceFromPlacementResponse
    _$DisassociateDeviceFromPlacementResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateDeviceFromPlacementResponse();
}

GetDevicesInPlacementResponse _$GetDevicesInPlacementResponseFromJson(
    Map<String, dynamic> json) {
  return GetDevicesInPlacementResponse(
    devices: Map<String, String>.from(json['devices'] as Map),
  );
}

ListPlacementsResponse _$ListPlacementsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPlacementsResponse(
    placements: (json['placements'] as List<dynamic>)
        .map((e) => PlacementSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListProjectsResponse _$ListProjectsResponseFromJson(Map<String, dynamic> json) {
  return ListProjectsResponse(
    projects: (json['projects'] as List<dynamic>)
        .map((e) => ProjectSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

PlacementDescription _$PlacementDescriptionFromJson(Map<String, dynamic> json) {
  return PlacementDescription(
    attributes: Map<String, String>.from(json['attributes'] as Map),
    createdDate: DateTime.parse(json['createdDate'] as String),
    placementName: json['placementName'] as String,
    projectName: json['projectName'] as String,
    updatedDate: DateTime.parse(json['updatedDate'] as String),
  );
}

PlacementSummary _$PlacementSummaryFromJson(Map<String, dynamic> json) {
  return PlacementSummary(
    createdDate: DateTime.parse(json['createdDate'] as String),
    placementName: json['placementName'] as String,
    projectName: json['projectName'] as String,
    updatedDate: DateTime.parse(json['updatedDate'] as String),
  );
}

PlacementTemplate _$PlacementTemplateFromJson(Map<String, dynamic> json) {
  return PlacementTemplate(
    defaultAttributes:
        (json['defaultAttributes'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    deviceTemplates: (json['deviceTemplates'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, DeviceTemplate.fromJson(e as Map<String, dynamic>)),
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
      instance.deviceTemplates?.map((k, e) => MapEntry(k, e.toJson())));
  return val;
}

ProjectDescription _$ProjectDescriptionFromJson(Map<String, dynamic> json) {
  return ProjectDescription(
    createdDate: DateTime.parse(json['createdDate'] as String),
    projectName: json['projectName'] as String,
    updatedDate: DateTime.parse(json['updatedDate'] as String),
    arn: json['arn'] as String?,
    description: json['description'] as String?,
    placementTemplate: json['placementTemplate'] == null
        ? null
        : PlacementTemplate.fromJson(
            json['placementTemplate'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ProjectSummary _$ProjectSummaryFromJson(Map<String, dynamic> json) {
  return ProjectSummary(
    createdDate: DateTime.parse(json['createdDate'] as String),
    projectName: json['projectName'] as String,
    updatedDate: DateTime.parse(json['updatedDate'] as String),
    arn: json['arn'] as String?,
    tags: (json['tags'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdatePlacementResponse _$UpdatePlacementResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePlacementResponse();
}

UpdateProjectResponse _$UpdateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProjectResponse();
}
