// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-09-18.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSuiteDefinitionResponse _$CreateSuiteDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSuiteDefinitionResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    suiteDefinitionArn: json['suiteDefinitionArn'] as String,
    suiteDefinitionId: json['suiteDefinitionId'] as String,
    suiteDefinitionName: json['suiteDefinitionName'] as String,
  );
}

DeleteSuiteDefinitionResponse _$DeleteSuiteDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSuiteDefinitionResponse();
}

DeviceUnderTest _$DeviceUnderTestFromJson(Map<String, dynamic> json) {
  return DeviceUnderTest(
    certificateArn: json['certificateArn'] as String,
    thingArn: json['thingArn'] as String,
  );
}

Map<String, dynamic> _$DeviceUnderTestToJson(DeviceUnderTest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificateArn', instance.certificateArn);
  writeNotNull('thingArn', instance.thingArn);
  return val;
}

GetSuiteDefinitionResponse _$GetSuiteDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return GetSuiteDefinitionResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    lastModifiedAt:
        const UnixDateTimeConverter().fromJson(json['lastModifiedAt']),
    latestVersion: json['latestVersion'] as String,
    suiteDefinitionArn: json['suiteDefinitionArn'] as String,
    suiteDefinitionConfiguration: json['suiteDefinitionConfiguration'] == null
        ? null
        : SuiteDefinitionConfiguration.fromJson(
            json['suiteDefinitionConfiguration'] as Map<String, dynamic>),
    suiteDefinitionId: json['suiteDefinitionId'] as String,
    suiteDefinitionVersion: json['suiteDefinitionVersion'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetSuiteRunReportResponse _$GetSuiteRunReportResponseFromJson(
    Map<String, dynamic> json) {
  return GetSuiteRunReportResponse(
    qualificationReportDownloadUrl:
        json['qualificationReportDownloadUrl'] as String,
  );
}

GetSuiteRunResponse _$GetSuiteRunResponseFromJson(Map<String, dynamic> json) {
  return GetSuiteRunResponse(
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    errorReason: json['errorReason'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    status: _$enumDecodeNullable(_$SuiteRunStatusEnumMap, json['status']),
    suiteDefinitionId: json['suiteDefinitionId'] as String,
    suiteDefinitionVersion: json['suiteDefinitionVersion'] as String,
    suiteRunArn: json['suiteRunArn'] as String,
    suiteRunConfiguration: json['suiteRunConfiguration'] == null
        ? null
        : SuiteRunConfiguration.fromJson(
            json['suiteRunConfiguration'] as Map<String, dynamic>),
    suiteRunId: json['suiteRunId'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    testResult: json['testResult'] == null
        ? null
        : TestResult.fromJson(json['testResult'] as Map<String, dynamic>),
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

const _$SuiteRunStatusEnumMap = {
  SuiteRunStatus.pass: 'PASS',
  SuiteRunStatus.fail: 'FAIL',
  SuiteRunStatus.canceled: 'CANCELED',
  SuiteRunStatus.pending: 'PENDING',
  SuiteRunStatus.running: 'RUNNING',
  SuiteRunStatus.passWithWarnings: 'PASS_WITH_WARNINGS',
  SuiteRunStatus.error: 'ERROR',
};

GroupResult _$GroupResultFromJson(Map<String, dynamic> json) {
  return GroupResult(
    groupId: json['groupId'] as String,
    groupName: json['groupName'] as String,
    tests: (json['tests'] as List)
        ?.map((e) =>
            e == null ? null : TestCaseRun.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSuiteDefinitionsResponse _$ListSuiteDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSuiteDefinitionsResponse(
    nextToken: json['nextToken'] as String,
    suiteDefinitionInformationList: (json['suiteDefinitionInformationList']
            as List)
        ?.map((e) => e == null
            ? null
            : SuiteDefinitionInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSuiteRunsResponse _$ListSuiteRunsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSuiteRunsResponse(
    nextToken: json['nextToken'] as String,
    suiteRunsList: (json['suiteRunsList'] as List)
        ?.map((e) => e == null
            ? null
            : SuiteRunInformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

ListTestCasesResponse _$ListTestCasesResponseFromJson(
    Map<String, dynamic> json) {
  return ListTestCasesResponse(
    categories: (json['categories'] as List)
        ?.map((e) => e == null
            ? null
            : TestCaseCategory.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    groupConfiguration:
        (json['groupConfiguration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    nextToken: json['nextToken'] as String,
    rootGroupConfiguration:
        (json['rootGroupConfiguration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

StartSuiteRunResponse _$StartSuiteRunResponseFromJson(
    Map<String, dynamic> json) {
  return StartSuiteRunResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    suiteRunArn: json['suiteRunArn'] as String,
    suiteRunId: json['suiteRunId'] as String,
  );
}

SuiteDefinitionConfiguration _$SuiteDefinitionConfigurationFromJson(
    Map<String, dynamic> json) {
  return SuiteDefinitionConfiguration(
    devicePermissionRoleArn: json['devicePermissionRoleArn'] as String,
    devices: (json['devices'] as List)
        ?.map((e) => e == null
            ? null
            : DeviceUnderTest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    intendedForQualification: json['intendedForQualification'] as bool,
    rootGroup: json['rootGroup'] as String,
    suiteDefinitionName: json['suiteDefinitionName'] as String,
  );
}

Map<String, dynamic> _$SuiteDefinitionConfigurationToJson(
    SuiteDefinitionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('devicePermissionRoleArn', instance.devicePermissionRoleArn);
  writeNotNull('devices', instance.devices?.map((e) => e?.toJson())?.toList());
  writeNotNull('intendedForQualification', instance.intendedForQualification);
  writeNotNull('rootGroup', instance.rootGroup);
  writeNotNull('suiteDefinitionName', instance.suiteDefinitionName);
  return val;
}

SuiteDefinitionInformation _$SuiteDefinitionInformationFromJson(
    Map<String, dynamic> json) {
  return SuiteDefinitionInformation(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    defaultDevices: (json['defaultDevices'] as List)
        ?.map((e) => e == null
            ? null
            : DeviceUnderTest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    intendedForQualification: json['intendedForQualification'] as bool,
    suiteDefinitionId: json['suiteDefinitionId'] as String,
    suiteDefinitionName: json['suiteDefinitionName'] as String,
  );
}

SuiteRunConfiguration _$SuiteRunConfigurationFromJson(
    Map<String, dynamic> json) {
  return SuiteRunConfiguration(
    primaryDevice: json['primaryDevice'] == null
        ? null
        : DeviceUnderTest.fromJson(
            json['primaryDevice'] as Map<String, dynamic>),
    secondaryDevice: json['secondaryDevice'] == null
        ? null
        : DeviceUnderTest.fromJson(
            json['secondaryDevice'] as Map<String, dynamic>),
    selectedTestList:
        (json['selectedTestList'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SuiteRunConfigurationToJson(
    SuiteRunConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('primaryDevice', instance.primaryDevice?.toJson());
  writeNotNull('secondaryDevice', instance.secondaryDevice?.toJson());
  writeNotNull('selectedTestList', instance.selectedTestList);
  return val;
}

SuiteRunInformation _$SuiteRunInformationFromJson(Map<String, dynamic> json) {
  return SuiteRunInformation(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    endAt: const UnixDateTimeConverter().fromJson(json['endAt']),
    failed: json['failed'] as int,
    passed: json['passed'] as int,
    startedAt: const UnixDateTimeConverter().fromJson(json['startedAt']),
    status: _$enumDecodeNullable(_$SuiteRunStatusEnumMap, json['status']),
    suiteDefinitionId: json['suiteDefinitionId'] as String,
    suiteDefinitionName: json['suiteDefinitionName'] as String,
    suiteDefinitionVersion: json['suiteDefinitionVersion'] as String,
    suiteRunId: json['suiteRunId'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TestCase _$TestCaseFromJson(Map<String, dynamic> json) {
  return TestCase(
    configuration: (json['configuration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    name: json['name'] as String,
    test: json['test'] == null
        ? null
        : TestCaseDefinition.fromJson(json['test'] as Map<String, dynamic>),
  );
}

TestCaseCategory _$TestCaseCategoryFromJson(Map<String, dynamic> json) {
  return TestCaseCategory(
    name: json['name'] as String,
    tests: (json['tests'] as List)
        ?.map((e) =>
            e == null ? null : TestCase.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

TestCaseDefinition _$TestCaseDefinitionFromJson(Map<String, dynamic> json) {
  return TestCaseDefinition(
    id: json['id'] as String,
    testCaseVersion: json['testCaseVersion'] as String,
  );
}

TestCaseRun _$TestCaseRunFromJson(Map<String, dynamic> json) {
  return TestCaseRun(
    endTime: const UnixDateTimeConverter().fromJson(json['endTime']),
    failure: json['failure'] as String,
    logUrl: json['logUrl'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    testCaseDefinitionId: json['testCaseDefinitionId'] as String,
    testCaseDefinitionName: json['testCaseDefinitionName'] as String,
    testCaseRunId: json['testCaseRunId'] as String,
    warnings: json['warnings'] as String,
  );
}

const _$StatusEnumMap = {
  Status.pass: 'PASS',
  Status.fail: 'FAIL',
  Status.canceled: 'CANCELED',
  Status.pending: 'PENDING',
  Status.running: 'RUNNING',
  Status.passWithWarnings: 'PASS_WITH_WARNINGS',
  Status.error: 'ERROR',
};

TestResult _$TestResultFromJson(Map<String, dynamic> json) {
  return TestResult(
    groups: (json['groups'] as List)
        ?.map((e) =>
            e == null ? null : GroupResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateSuiteDefinitionResponse _$UpdateSuiteDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSuiteDefinitionResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    suiteDefinitionArn: json['suiteDefinitionArn'] as String,
    suiteDefinitionId: json['suiteDefinitionId'] as String,
    suiteDefinitionName: json['suiteDefinitionName'] as String,
    suiteDefinitionVersion: json['suiteDefinitionVersion'] as String,
  );
}
