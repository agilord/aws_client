// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-10-26.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AccountToJson(Account instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountId', instance.accountId);
  writeNotNull('EmailAddress', instance.emailAddress);
  return val;
}

CreateGraphResponse _$CreateGraphResponseFromJson(Map<String, dynamic> json) {
  return CreateGraphResponse(
    graphArn: json['GraphArn'] as String,
  );
}

CreateMembersResponse _$CreateMembersResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMembersResponse(
    members: (json['Members'] as List)
        ?.map((e) =>
            e == null ? null : MemberDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteMembersResponse _$DeleteMembersResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteMembersResponse(
    accountIds: (json['AccountIds'] as List)?.map((e) => e as String)?.toList(),
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetMembersResponse _$GetMembersResponseFromJson(Map<String, dynamic> json) {
  return GetMembersResponse(
    memberDetails: (json['MemberDetails'] as List)
        ?.map((e) =>
            e == null ? null : MemberDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedAccounts: (json['UnprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Graph _$GraphFromJson(Map<String, dynamic> json) {
  return Graph(
    arn: json['Arn'] as String,
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
  );
}

ListGraphsResponse _$ListGraphsResponseFromJson(Map<String, dynamic> json) {
  return ListGraphsResponse(
    graphList: (json['GraphList'] as List)
        ?.map(
            (e) => e == null ? null : Graph.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListInvitationsResponse _$ListInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListInvitationsResponse(
    invitations: (json['Invitations'] as List)
        ?.map((e) =>
            e == null ? null : MemberDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMembersResponse _$ListMembersResponseFromJson(Map<String, dynamic> json) {
  return ListMembersResponse(
    memberDetails: (json['MemberDetails'] as List)
        ?.map((e) =>
            e == null ? null : MemberDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

MemberDetail _$MemberDetailFromJson(Map<String, dynamic> json) {
  return MemberDetail(
    accountId: json['AccountId'] as String,
    disabledReason: _$enumDecodeNullable(
        _$MemberDisabledReasonEnumMap, json['DisabledReason']),
    emailAddress: json['EmailAddress'] as String,
    graphArn: json['GraphArn'] as String,
    invitedTime: const UnixDateTimeConverter().fromJson(json['InvitedTime']),
    masterId: json['MasterId'] as String,
    percentOfGraphUtilization:
        (json['PercentOfGraphUtilization'] as num)?.toDouble(),
    percentOfGraphUtilizationUpdatedTime: const UnixDateTimeConverter()
        .fromJson(json['PercentOfGraphUtilizationUpdatedTime']),
    status: _$enumDecodeNullable(_$MemberStatusEnumMap, json['Status']),
    updatedTime: const UnixDateTimeConverter().fromJson(json['UpdatedTime']),
  );
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
    accountId: json['AccountId'] as String,
    reason: json['Reason'] as String,
  );
}
