// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outposts-2019-12-03.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateOutpostInputToJson(CreateOutpostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SiteId', instance.siteId);
  writeNotNull('AvailabilityZone', instance.availabilityZone);
  writeNotNull('AvailabilityZoneId', instance.availabilityZoneId);
  writeNotNull('Description', instance.description);
  writeNotNull('Name', instance.name);
  return val;
}

CreateOutpostOutput _$CreateOutpostOutputFromJson(Map<String, dynamic> json) {
  return CreateOutpostOutput(
    outpost: json['Outpost'] == null
        ? null
        : Outpost.fromJson(json['Outpost'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteOutpostInputToJson(DeleteOutpostInput instance) =>
    <String, dynamic>{};

DeleteOutpostOutput _$DeleteOutpostOutputFromJson(Map<String, dynamic> json) {
  return DeleteOutpostOutput();
}

Map<String, dynamic> _$DeleteSiteInputToJson(DeleteSiteInput instance) =>
    <String, dynamic>{};

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
  );
}

Site _$SiteFromJson(Map<String, dynamic> json) {
  return Site(
    accountId: json['AccountId'] as String,
    description: json['Description'] as String,
    name: json['Name'] as String,
    siteId: json['SiteId'] as String,
  );
}
