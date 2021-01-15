// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-06-10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) {
  return AccountInfo(
    accountId: json['accountId'] as String,
    accountName: json['accountName'] as String,
    emailAddress: json['emailAddress'] as String,
  );
}

GetRoleCredentialsResponse _$GetRoleCredentialsResponseFromJson(
    Map<String, dynamic> json) {
  return GetRoleCredentialsResponse(
    roleCredentials: json['roleCredentials'] == null
        ? null
        : RoleCredentials.fromJson(
            json['roleCredentials'] as Map<String, dynamic>),
  );
}

ListAccountRolesResponse _$ListAccountRolesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAccountRolesResponse(
    nextToken: json['nextToken'] as String,
    roleList: (json['roleList'] as List)
        ?.map((e) =>
            e == null ? null : RoleInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListAccountsResponse _$ListAccountsResponseFromJson(Map<String, dynamic> json) {
  return ListAccountsResponse(
    accountList: (json['accountList'] as List)
        ?.map((e) =>
            e == null ? null : AccountInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

RoleCredentials _$RoleCredentialsFromJson(Map<String, dynamic> json) {
  return RoleCredentials(
    accessKeyId: json['accessKeyId'] as String,
    expiration: json['expiration'] as int,
    secretAccessKey: json['secretAccessKey'] as String,
    sessionToken: json['sessionToken'] as String,
  );
}

RoleInfo _$RoleInfoFromJson(Map<String, dynamic> json) {
  return RoleInfo(
    accountId: json['accountId'] as String,
    roleName: json['roleName'] as String,
  );
}
