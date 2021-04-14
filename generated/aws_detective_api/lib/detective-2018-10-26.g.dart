// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detective-2018-10-26.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'AccountId': instance.accountId,
      'EmailAddress': instance.emailAddress,
    };

CreateGraphResponse _$CreateGraphResponseFromJson(Map<String, dynamic> json) {
  return CreateGraphResponse(
    graphArn: json['GraphArn'] as String?,
  );
}

CreateMembersResponse _$CreateMembersResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMembersResponse(
    members: (json['Members'] as List<dynamic>?)
        ?.map((e) => MemberDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    unprocessedAccounts: (json['UnprocessedAccounts'] as List<dynamic>?)
        ?.map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DeleteMembersResponse _$DeleteMembersResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteMembersResponse(
    accountIds: (json['AccountIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    unprocessedAccounts: (json['UnprocessedAccounts'] as List<dynamic>?)
        ?.map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

GetMembersResponse _$GetMembersResponseFromJson(Map<String, dynamic> json) {
  return GetMembersResponse(
    memberDetails: (json['MemberDetails'] as List<dynamic>?)
        ?.map((e) => MemberDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    unprocessedAccounts: (json['UnprocessedAccounts'] as List<dynamic>?)
        ?.map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Graph _$GraphFromJson(Map<String, dynamic> json) {
  return Graph(
    arn: json['Arn'] as String?,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
  );
}

ListGraphsResponse _$ListGraphsResponseFromJson(Map<String, dynamic> json) {
  return ListGraphsResponse(
    graphList: (json['GraphList'] as List<dynamic>?)
        ?.map((e) => Graph.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListInvitationsResponse _$ListInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListInvitationsResponse(
    invitations: (json['Invitations'] as List<dynamic>?)
        ?.map((e) => MemberDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListMembersResponse _$ListMembersResponseFromJson(Map<String, dynamic> json) {
  return ListMembersResponse(
    memberDetails: (json['MemberDetails'] as List<dynamic>?)
        ?.map((e) => MemberDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

MemberDetail _$MemberDetailFromJson(Map<String, dynamic> json) {
  return MemberDetail(
    accountId: json['AccountId'] as String?,
    disabledReason: _$enumDecodeNullable(
        _$MemberDisabledReasonEnumMap, json['DisabledReason']),
    emailAddress: json['EmailAddress'] as String?,
    graphArn: json['GraphArn'] as String?,
    invitedTime: const UnixDateTimeConverter().fromJson(json['InvitedTime']),
    masterId: json['MasterId'] as String?,
    percentOfGraphUtilization:
        (json['PercentOfGraphUtilization'] as num?)?.toDouble(),
    percentOfGraphUtilizationUpdatedTime: const UnixDateTimeConverter()
        .fromJson(json['PercentOfGraphUtilizationUpdatedTime']),
    status: _$enumDecodeNullable(_$MemberStatusEnumMap, json['Status']),
    updatedTime: const UnixDateTimeConverter().fromJson(json['UpdatedTime']),
  );
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$MemberDisabledReasonEnumMap = {
  MemberDisabledReason.volumeTooHigh: 'VOLUME_TOO_HIGH',
  MemberDisabledReason.volumeUnknown: 'VOLUME_UNKNOWN',
};

const _$MemberStatusEnumMap = {
  MemberStatus.invited: 'INVITED',
  MemberStatus.verificationInProgress: 'VERIFICATION_IN_PROGRESS',
  MemberStatus.verificationFailed: 'VERIFICATION_FAILED',
  MemberStatus.enabled: 'ENABLED',
  MemberStatus.acceptedButDisabled: 'ACCEPTED_BUT_DISABLED',
};

UnprocessedAccount _$UnprocessedAccountFromJson(Map<String, dynamic> json) {
  return UnprocessedAccount(
    accountId: json['AccountId'] as String?,
    reason: json['Reason'] as String?,
  );
}
