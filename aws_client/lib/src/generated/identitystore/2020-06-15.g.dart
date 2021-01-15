// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-06-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DescribeGroupResponse _$DescribeGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeGroupResponse(
    displayName: json['DisplayName'] as String,
    groupId: json['GroupId'] as String,
  );
}

DescribeUserResponse _$DescribeUserResponseFromJson(Map<String, dynamic> json) {
  return DescribeUserResponse(
    userId: json['UserId'] as String,
    userName: json['UserName'] as String,
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributePath', instance.attributePath);
  writeNotNull('AttributeValue', instance.attributeValue);
  return val;
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    displayName: json['DisplayName'] as String,
    groupId: json['GroupId'] as String,
  );
}

ListGroupsResponse _$ListGroupsResponseFromJson(Map<String, dynamic> json) {
  return ListGroupsResponse(
    groups: (json['Groups'] as List)
        ?.map(
            (e) => e == null ? null : Group.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) {
  return ListUsersResponse(
    users: (json['Users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userId: json['UserId'] as String,
    userName: json['UserName'] as String,
  );
}
