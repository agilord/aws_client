// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-12-03.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOutpostOutput _$CreateOutpostOutputFromJson(Map<String, dynamic> json) {
  return CreateOutpostOutput(
    outpost: json['Outpost'] == null
        ? null
        : Outpost.fromJson(json['Outpost'] as Map<String, dynamic>),
  );
}

DeleteOutpostOutput _$DeleteOutpostOutputFromJson(Map<String, dynamic> json) {
  return DeleteOutpostOutput();
}

DeleteSiteOutput _$DeleteSiteOutputFromJson(Map<String, dynamic> json) {
  return DeleteSiteOutput();
}

GetOutpostInstanceTypesOutput _$GetOutpostInstanceTypesOutputFromJson(
    Map<String, dynamic> json) {
  return GetOutpostInstanceTypesOutput(
    instanceTypes: (json['InstanceTypes'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceTypeItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    outpostArn: json['OutpostArn'] as String,
    outpostId: json['OutpostId'] as String,
  );
}

GetOutpostOutput _$GetOutpostOutputFromJson(Map<String, dynamic> json) {
  return GetOutpostOutput(
    outpost: json['Outpost'] == null
        ? null
        : Outpost.fromJson(json['Outpost'] as Map<String, dynamic>),
  );
}

InstanceTypeItem _$InstanceTypeItemFromJson(Map<String, dynamic> json) {
  return InstanceTypeItem(
    instanceType: json['InstanceType'] as String,
  );
}

ListOutpostsOutput _$ListOutpostsOutputFromJson(Map<String, dynamic> json) {
  return ListOutpostsOutput(
    nextToken: json['NextToken'] as String,
    outposts: (json['Outposts'] as List)
        ?.map((e) =>
            e == null ? null : Outpost.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSitesOutput _$ListSitesOutputFromJson(Map<String, dynamic> json) {
  return ListSitesOutput(
    nextToken: json['NextToken'] as String,
    sites: (json['Sites'] as List)
        ?.map(
            (e) => e == null ? null : Site.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

Outpost _$OutpostFromJson(Map<String, dynamic> json) {
  return Outpost(
    availabilityZone: json['AvailabilityZone'] as String,
    availabilityZoneId: json['AvailabilityZoneId'] as String,
    description: json['Description'] as String,
    lifeCycleStatus: json['LifeCycleStatus'] as String,
    name: json['Name'] as String,
    outpostArn: json['OutpostArn'] as String,
    outpostId: json['OutpostId'] as String,
    ownerId: json['OwnerId'] as String,
    siteId: json['SiteId'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Site _$SiteFromJson(Map<String, dynamic> json) {
  return Site(
    accountId: json['AccountId'] as String,
    description: json['Description'] as String,
    name: json['Name'] as String,
    siteId: json['SiteId'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
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
