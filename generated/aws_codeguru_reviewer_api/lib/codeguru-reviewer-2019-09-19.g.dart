// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codeguru-reviewer-2019-09-19.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AssociateRepositoryRequestToJson(
    AssociateRepositoryRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Repository', instance.repository?.toJson());
  writeNotNull('ClientRequestToken', instance.clientRequestToken);
  return val;
}

AssociateRepositoryResponse _$AssociateRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateRepositoryResponse(
    repositoryAssociation: json['RepositoryAssociation'] == null
        ? null
        : RepositoryAssociation.fromJson(
            json['RepositoryAssociation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CodeCommitRepositoryToJson(
    CodeCommitRepository instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

DescribeRepositoryAssociationResponse
    _$DescribeRepositoryAssociationResponseFromJson(Map<String, dynamic> json) {
  return DescribeRepositoryAssociationResponse(
    repositoryAssociation: json['RepositoryAssociation'] == null
        ? null
        : RepositoryAssociation.fromJson(
            json['RepositoryAssociation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DisassociateRepositoryRequestToJson(
        DisassociateRepositoryRequest instance) =>
    <String, dynamic>{};

DisassociateRepositoryResponse _$DisassociateRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateRepositoryResponse(
    repositoryAssociation: json['RepositoryAssociation'] == null
        ? null
        : RepositoryAssociation.fromJson(
            json['RepositoryAssociation'] as Map<String, dynamic>),
  );
}

ListRepositoryAssociationsResponse _$ListRepositoryAssociationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRepositoryAssociationsResponse(
    nextToken: json['NextToken'] as String,
    repositoryAssociationSummaries: (json['RepositoryAssociationSummaries']
            as List)
        ?.map((e) => e == null
            ? null
            : RepositoryAssociationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RepositoryToJson(Repository instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CodeCommit', instance.codeCommit?.toJson());
  return val;
}

RepositoryAssociation _$RepositoryAssociationFromJson(
    Map<String, dynamic> json) {
  return RepositoryAssociation(
    associationArn: json['AssociationArn'] as String,
    associationId: json['AssociationId'] as String,
    createdTimeStamp: unixTimestampFromJson(json['CreatedTimeStamp']),
    lastUpdatedTimeStamp: unixTimestampFromJson(json['LastUpdatedTimeStamp']),
    name: json['Name'] as String,
    owner: json['Owner'] as String,
    providerType:
        _$enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
    state: _$enumDecodeNullable(
        _$RepositoryAssociationStateEnumMap, json['State']),
    stateReason: json['StateReason'] as String,
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

const _$ProviderTypeEnumMap = {
  ProviderType.codeCommit: 'CodeCommit',
  ProviderType.gitHub: 'GitHub',
};

const _$RepositoryAssociationStateEnumMap = {
  RepositoryAssociationState.associated: 'Associated',
  RepositoryAssociationState.associating: 'Associating',
  RepositoryAssociationState.failed: 'Failed',
  RepositoryAssociationState.disassociating: 'Disassociating',
};

RepositoryAssociationSummary _$RepositoryAssociationSummaryFromJson(
    Map<String, dynamic> json) {
  return RepositoryAssociationSummary(
    associationArn: json['AssociationArn'] as String,
    associationId: json['AssociationId'] as String,
    lastUpdatedTimeStamp: unixTimestampFromJson(json['LastUpdatedTimeStamp']),
    name: json['Name'] as String,
    owner: json['Owner'] as String,
    providerType:
        _$enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
    state: _$enumDecodeNullable(
        _$RepositoryAssociationStateEnumMap, json['State']),
  );
}
