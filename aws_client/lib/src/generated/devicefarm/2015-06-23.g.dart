// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-06-23.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSettings _$AccountSettingsFromJson(Map<String, dynamic> json) {
  return AccountSettings(
    awsAccountNumber: json['awsAccountNumber'] as String,
    defaultJobTimeoutMinutes: json['defaultJobTimeoutMinutes'] as int,
    maxJobTimeoutMinutes: json['maxJobTimeoutMinutes'] as int,
    maxSlots: (json['maxSlots'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
    skipAppResign: json['skipAppResign'] as bool,
    trialMinutes: json['trialMinutes'] == null
        ? null
        : TrialMinutes.fromJson(json['trialMinutes'] as Map<String, dynamic>),
    unmeteredDevices: (json['unmeteredDevices'] as Map<String, dynamic>)?.map(
      (k, e) =>
          MapEntry(_$enumDecodeNullable(_$DevicePlatformEnumMap, k), e as int),
    ),
    unmeteredRemoteAccessDevices:
        (json['unmeteredRemoteAccessDevices'] as Map<String, dynamic>)?.map(
      (k, e) =>
          MapEntry(_$enumDecodeNullable(_$DevicePlatformEnumMap, k), e as int),
    ),
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

const _$DevicePlatformEnumMap = {
  DevicePlatform.android: 'ANDROID',
  DevicePlatform.ios: 'IOS',
};

Artifact _$ArtifactFromJson(Map<String, dynamic> json) {
  return Artifact(
    arn: json['arn'] as String,
    extension: json['extension'] as String,
    name: json['name'] as String,
    type: _$enumDecodeNullable(_$ArtifactTypeEnumMap, json['type']),
    url: json['url'] as String,
  );
}

const _$ArtifactTypeEnumMap = {
  ArtifactType.unknown: 'UNKNOWN',
  ArtifactType.screenshot: 'SCREENSHOT',
  ArtifactType.deviceLog: 'DEVICE_LOG',
  ArtifactType.messageLog: 'MESSAGE_LOG',
  ArtifactType.videoLog: 'VIDEO_LOG',
  ArtifactType.resultLog: 'RESULT_LOG',
  ArtifactType.serviceLog: 'SERVICE_LOG',
  ArtifactType.webkitLog: 'WEBKIT_LOG',
  ArtifactType.instrumentationOutput: 'INSTRUMENTATION_OUTPUT',
  ArtifactType.exerciserMonkeyOutput: 'EXERCISER_MONKEY_OUTPUT',
  ArtifactType.calabashJsonOutput: 'CALABASH_JSON_OUTPUT',
  ArtifactType.calabashPrettyOutput: 'CALABASH_PRETTY_OUTPUT',
  ArtifactType.calabashStandardOutput: 'CALABASH_STANDARD_OUTPUT',
  ArtifactType.calabashJavaXmlOutput: 'CALABASH_JAVA_XML_OUTPUT',
  ArtifactType.automationOutput: 'AUTOMATION_OUTPUT',
  ArtifactType.appiumServerOutput: 'APPIUM_SERVER_OUTPUT',
  ArtifactType.appiumJavaOutput: 'APPIUM_JAVA_OUTPUT',
  ArtifactType.appiumJavaXmlOutput: 'APPIUM_JAVA_XML_OUTPUT',
  ArtifactType.appiumPythonOutput: 'APPIUM_PYTHON_OUTPUT',
  ArtifactType.appiumPythonXmlOutput: 'APPIUM_PYTHON_XML_OUTPUT',
  ArtifactType.explorerEventLog: 'EXPLORER_EVENT_LOG',
  ArtifactType.explorerSummaryLog: 'EXPLORER_SUMMARY_LOG',
  ArtifactType.applicationCrashReport: 'APPLICATION_CRASH_REPORT',
  ArtifactType.xctestLog: 'XCTEST_LOG',
  ArtifactType.video: 'VIDEO',
  ArtifactType.customerArtifact: 'CUSTOMER_ARTIFACT',
  ArtifactType.customerArtifactLog: 'CUSTOMER_ARTIFACT_LOG',
  ArtifactType.testspecOutput: 'TESTSPEC_OUTPUT',
};

CPU _$CPUFromJson(Map<String, dynamic> json) {
  return CPU(
    architecture: json['architecture'] as String,
    clock: (json['clock'] as num)?.toDouble(),
    frequency: json['frequency'] as String,
  );
}

Counters _$CountersFromJson(Map<String, dynamic> json) {
  return Counters(
    errored: json['errored'] as int,
    failed: json['failed'] as int,
    passed: json['passed'] as int,
    skipped: json['skipped'] as int,
    stopped: json['stopped'] as int,
    total: json['total'] as int,
    warned: json['warned'] as int,
  );
}

CreateDevicePoolResult _$CreateDevicePoolResultFromJson(
    Map<String, dynamic> json) {
  return CreateDevicePoolResult(
    devicePool: json['devicePool'] == null
        ? null
        : DevicePool.fromJson(json['devicePool'] as Map<String, dynamic>),
  );
}

CreateInstanceProfileResult _$CreateInstanceProfileResultFromJson(
    Map<String, dynamic> json) {
  return CreateInstanceProfileResult(
    instanceProfile: json['instanceProfile'] == null
        ? null
        : InstanceProfile.fromJson(
            json['instanceProfile'] as Map<String, dynamic>),
  );
}

CreateNetworkProfileResult _$CreateNetworkProfileResultFromJson(
    Map<String, dynamic> json) {
  return CreateNetworkProfileResult(
    networkProfile: json['networkProfile'] == null
        ? null
        : NetworkProfile.fromJson(
            json['networkProfile'] as Map<String, dynamic>),
  );
}

CreateProjectResult _$CreateProjectResultFromJson(Map<String, dynamic> json) {
  return CreateProjectResult(
    project: json['project'] == null
        ? null
        : Project.fromJson(json['project'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateRemoteAccessSessionConfigurationToJson(
    CreateRemoteAccessSessionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('billingMethod', _$BillingMethodEnumMap[instance.billingMethod]);
  writeNotNull('vpceConfigurationArns', instance.vpceConfigurationArns);
  return val;
}

const _$BillingMethodEnumMap = {
  BillingMethod.metered: 'METERED',
  BillingMethod.unmetered: 'UNMETERED',
};

CreateRemoteAccessSessionResult _$CreateRemoteAccessSessionResultFromJson(
    Map<String, dynamic> json) {
  return CreateRemoteAccessSessionResult(
    remoteAccessSession: json['remoteAccessSession'] == null
        ? null
        : RemoteAccessSession.fromJson(
            json['remoteAccessSession'] as Map<String, dynamic>),
  );
}

CreateTestGridProjectResult _$CreateTestGridProjectResultFromJson(
    Map<String, dynamic> json) {
  return CreateTestGridProjectResult(
    testGridProject: json['testGridProject'] == null
        ? null
        : TestGridProject.fromJson(
            json['testGridProject'] as Map<String, dynamic>),
  );
}

CreateTestGridUrlResult _$CreateTestGridUrlResultFromJson(
    Map<String, dynamic> json) {
  return CreateTestGridUrlResult(
    expires: const UnixDateTimeConverter().fromJson(json['expires']),
    url: json['url'] as String,
  );
}

CreateUploadResult _$CreateUploadResultFromJson(Map<String, dynamic> json) {
  return CreateUploadResult(
    upload: json['upload'] == null
        ? null
        : Upload.fromJson(json['upload'] as Map<String, dynamic>),
  );
}

CreateVPCEConfigurationResult _$CreateVPCEConfigurationResultFromJson(
    Map<String, dynamic> json) {
  return CreateVPCEConfigurationResult(
    vpceConfiguration: json['vpceConfiguration'] == null
        ? null
        : VPCEConfiguration.fromJson(
            json['vpceConfiguration'] as Map<String, dynamic>),
  );
}

CustomerArtifactPaths _$CustomerArtifactPathsFromJson(
    Map<String, dynamic> json) {
  return CustomerArtifactPaths(
    androidPaths:
        (json['androidPaths'] as List)?.map((e) => e as String)?.toList(),
    deviceHostPaths:
        (json['deviceHostPaths'] as List)?.map((e) => e as String)?.toList(),
    iosPaths: (json['iosPaths'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CustomerArtifactPathsToJson(
    CustomerArtifactPaths instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('androidPaths', instance.androidPaths);
  writeNotNull('deviceHostPaths', instance.deviceHostPaths);
  writeNotNull('iosPaths', instance.iosPaths);
  return val;
}

DeleteDevicePoolResult _$DeleteDevicePoolResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDevicePoolResult();
}

DeleteInstanceProfileResult _$DeleteInstanceProfileResultFromJson(
    Map<String, dynamic> json) {
  return DeleteInstanceProfileResult();
}

DeleteNetworkProfileResult _$DeleteNetworkProfileResultFromJson(
    Map<String, dynamic> json) {
  return DeleteNetworkProfileResult();
}

DeleteProjectResult _$DeleteProjectResultFromJson(Map<String, dynamic> json) {
  return DeleteProjectResult();
}

DeleteRemoteAccessSessionResult _$DeleteRemoteAccessSessionResultFromJson(
    Map<String, dynamic> json) {
  return DeleteRemoteAccessSessionResult();
}

DeleteRunResult _$DeleteRunResultFromJson(Map<String, dynamic> json) {
  return DeleteRunResult();
}

DeleteTestGridProjectResult _$DeleteTestGridProjectResultFromJson(
    Map<String, dynamic> json) {
  return DeleteTestGridProjectResult();
}

DeleteUploadResult _$DeleteUploadResultFromJson(Map<String, dynamic> json) {
  return DeleteUploadResult();
}

DeleteVPCEConfigurationResult _$DeleteVPCEConfigurationResultFromJson(
    Map<String, dynamic> json) {
  return DeleteVPCEConfigurationResult();
}

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    arn: json['arn'] as String,
    availability:
        _$enumDecodeNullable(_$DeviceAvailabilityEnumMap, json['availability']),
    carrier: json['carrier'] as String,
    cpu: json['cpu'] == null
        ? null
        : CPU.fromJson(json['cpu'] as Map<String, dynamic>),
    fleetName: json['fleetName'] as String,
    fleetType: json['fleetType'] as String,
    formFactor:
        _$enumDecodeNullable(_$DeviceFormFactorEnumMap, json['formFactor']),
    heapSize: json['heapSize'] as int,
    image: json['image'] as String,
    instances: (json['instances'] as List)
        ?.map((e) => e == null
            ? null
            : DeviceInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    manufacturer: json['manufacturer'] as String,
    memory: json['memory'] as int,
    model: json['model'] as String,
    modelId: json['modelId'] as String,
    name: json['name'] as String,
    os: json['os'] as String,
    platform: _$enumDecodeNullable(_$DevicePlatformEnumMap, json['platform']),
    radio: json['radio'] as String,
    remoteAccessEnabled: json['remoteAccessEnabled'] as bool,
    remoteDebugEnabled: json['remoteDebugEnabled'] as bool,
    resolution: json['resolution'] == null
        ? null
        : Resolution.fromJson(json['resolution'] as Map<String, dynamic>),
  );
}

const _$DeviceAvailabilityEnumMap = {
  DeviceAvailability.temporaryNotAvailable: 'TEMPORARY_NOT_AVAILABLE',
  DeviceAvailability.busy: 'BUSY',
  DeviceAvailability.available: 'AVAILABLE',
  DeviceAvailability.highlyAvailable: 'HIGHLY_AVAILABLE',
};

const _$DeviceFormFactorEnumMap = {
  DeviceFormFactor.phone: 'PHONE',
  DeviceFormFactor.tablet: 'TABLET',
};

DeviceFilter _$DeviceFilterFromJson(Map<String, dynamic> json) {
  return DeviceFilter(
    attribute:
        _$enumDecodeNullable(_$DeviceFilterAttributeEnumMap, json['attribute']),
    operator: _$enumDecodeNullable(_$RuleOperatorEnumMap, json['operator']),
    values: (json['values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DeviceFilterToJson(DeviceFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attribute', _$DeviceFilterAttributeEnumMap[instance.attribute]);
  writeNotNull('operator', _$RuleOperatorEnumMap[instance.operator]);
  writeNotNull('values', instance.values);
  return val;
}

const _$DeviceFilterAttributeEnumMap = {
  DeviceFilterAttribute.arn: 'ARN',
  DeviceFilterAttribute.platform: 'PLATFORM',
  DeviceFilterAttribute.osVersion: 'OS_VERSION',
  DeviceFilterAttribute.model: 'MODEL',
  DeviceFilterAttribute.availability: 'AVAILABILITY',
  DeviceFilterAttribute.formFactor: 'FORM_FACTOR',
  DeviceFilterAttribute.manufacturer: 'MANUFACTURER',
  DeviceFilterAttribute.remoteAccessEnabled: 'REMOTE_ACCESS_ENABLED',
  DeviceFilterAttribute.remoteDebugEnabled: 'REMOTE_DEBUG_ENABLED',
  DeviceFilterAttribute.instanceArn: 'INSTANCE_ARN',
  DeviceFilterAttribute.instanceLabels: 'INSTANCE_LABELS',
  DeviceFilterAttribute.fleetType: 'FLEET_TYPE',
};

const _$RuleOperatorEnumMap = {
  RuleOperator.equals: 'EQUALS',
  RuleOperator.lessThan: 'LESS_THAN',
  RuleOperator.lessThanOrEquals: 'LESS_THAN_OR_EQUALS',
  RuleOperator.greaterThan: 'GREATER_THAN',
  RuleOperator.greaterThanOrEquals: 'GREATER_THAN_OR_EQUALS',
  RuleOperator.$in: 'IN',
  RuleOperator.notIn: 'NOT_IN',
  RuleOperator.contains: 'CONTAINS',
};

DeviceInstance _$DeviceInstanceFromJson(Map<String, dynamic> json) {
  return DeviceInstance(
    arn: json['arn'] as String,
    deviceArn: json['deviceArn'] as String,
    instanceProfile: json['instanceProfile'] == null
        ? null
        : InstanceProfile.fromJson(
            json['instanceProfile'] as Map<String, dynamic>),
    labels: (json['labels'] as List)?.map((e) => e as String)?.toList(),
    status: _$enumDecodeNullable(_$InstanceStatusEnumMap, json['status']),
    udid: json['udid'] as String,
  );
}

const _$InstanceStatusEnumMap = {
  InstanceStatus.inUse: 'IN_USE',
  InstanceStatus.preparing: 'PREPARING',
  InstanceStatus.available: 'AVAILABLE',
  InstanceStatus.notAvailable: 'NOT_AVAILABLE',
};

DeviceMinutes _$DeviceMinutesFromJson(Map<String, dynamic> json) {
  return DeviceMinutes(
    metered: (json['metered'] as num)?.toDouble(),
    total: (json['total'] as num)?.toDouble(),
    unmetered: (json['unmetered'] as num)?.toDouble(),
  );
}

DevicePool _$DevicePoolFromJson(Map<String, dynamic> json) {
  return DevicePool(
    arn: json['arn'] as String,
    description: json['description'] as String,
    maxDevices: json['maxDevices'] as int,
    name: json['name'] as String,
    rules: (json['rules'] as List)
        ?.map(
            (e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$DevicePoolTypeEnumMap, json['type']),
  );
}

const _$DevicePoolTypeEnumMap = {
  DevicePoolType.curated: 'CURATED',
  DevicePoolType.private: 'PRIVATE',
};

DevicePoolCompatibilityResult _$DevicePoolCompatibilityResultFromJson(
    Map<String, dynamic> json) {
  return DevicePoolCompatibilityResult(
    compatible: json['compatible'] as bool,
    device: json['device'] == null
        ? null
        : Device.fromJson(json['device'] as Map<String, dynamic>),
    incompatibilityMessages: (json['incompatibilityMessages'] as List)
        ?.map((e) => e == null
            ? null
            : IncompatibilityMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DeviceSelectionConfigurationToJson(
    DeviceSelectionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('maxDevices', instance.maxDevices);
  return val;
}

DeviceSelectionResult _$DeviceSelectionResultFromJson(
    Map<String, dynamic> json) {
  return DeviceSelectionResult(
    filters: (json['filters'] as List)
        ?.map((e) =>
            e == null ? null : DeviceFilter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    matchedDevicesCount: json['matchedDevicesCount'] as int,
    maxDevices: json['maxDevices'] as int,
  );
}

Map<String, dynamic> _$ExecutionConfigurationToJson(
    ExecutionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountsCleanup', instance.accountsCleanup);
  writeNotNull('appPackagesCleanup', instance.appPackagesCleanup);
  writeNotNull('jobTimeoutMinutes', instance.jobTimeoutMinutes);
  writeNotNull('skipAppResign', instance.skipAppResign);
  writeNotNull('videoCapture', instance.videoCapture);
  return val;
}

GetAccountSettingsResult _$GetAccountSettingsResultFromJson(
    Map<String, dynamic> json) {
  return GetAccountSettingsResult(
    accountSettings: json['accountSettings'] == null
        ? null
        : AccountSettings.fromJson(
            json['accountSettings'] as Map<String, dynamic>),
  );
}

GetDeviceInstanceResult _$GetDeviceInstanceResultFromJson(
    Map<String, dynamic> json) {
  return GetDeviceInstanceResult(
    deviceInstance: json['deviceInstance'] == null
        ? null
        : DeviceInstance.fromJson(
            json['deviceInstance'] as Map<String, dynamic>),
  );
}

GetDevicePoolCompatibilityResult _$GetDevicePoolCompatibilityResultFromJson(
    Map<String, dynamic> json) {
  return GetDevicePoolCompatibilityResult(
    compatibleDevices: (json['compatibleDevices'] as List)
        ?.map((e) => e == null
            ? null
            : DevicePoolCompatibilityResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    incompatibleDevices: (json['incompatibleDevices'] as List)
        ?.map((e) => e == null
            ? null
            : DevicePoolCompatibilityResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetDevicePoolResult _$GetDevicePoolResultFromJson(Map<String, dynamic> json) {
  return GetDevicePoolResult(
    devicePool: json['devicePool'] == null
        ? null
        : DevicePool.fromJson(json['devicePool'] as Map<String, dynamic>),
  );
}

GetDeviceResult _$GetDeviceResultFromJson(Map<String, dynamic> json) {
  return GetDeviceResult(
    device: json['device'] == null
        ? null
        : Device.fromJson(json['device'] as Map<String, dynamic>),
  );
}

GetInstanceProfileResult _$GetInstanceProfileResultFromJson(
    Map<String, dynamic> json) {
  return GetInstanceProfileResult(
    instanceProfile: json['instanceProfile'] == null
        ? null
        : InstanceProfile.fromJson(
            json['instanceProfile'] as Map<String, dynamic>),
  );
}

GetJobResult _$GetJobResultFromJson(Map<String, dynamic> json) {
  return GetJobResult(
    job: json['job'] == null
        ? null
        : Job.fromJson(json['job'] as Map<String, dynamic>),
  );
}

GetNetworkProfileResult _$GetNetworkProfileResultFromJson(
    Map<String, dynamic> json) {
  return GetNetworkProfileResult(
    networkProfile: json['networkProfile'] == null
        ? null
        : NetworkProfile.fromJson(
            json['networkProfile'] as Map<String, dynamic>),
  );
}

GetOfferingStatusResult _$GetOfferingStatusResultFromJson(
    Map<String, dynamic> json) {
  return GetOfferingStatusResult(
    current: (json['current'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : OfferingStatus.fromJson(e as Map<String, dynamic>)),
    ),
    nextPeriod: (json['nextPeriod'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : OfferingStatus.fromJson(e as Map<String, dynamic>)),
    ),
    nextToken: json['nextToken'] as String,
  );
}

GetProjectResult _$GetProjectResultFromJson(Map<String, dynamic> json) {
  return GetProjectResult(
    project: json['project'] == null
        ? null
        : Project.fromJson(json['project'] as Map<String, dynamic>),
  );
}

GetRemoteAccessSessionResult _$GetRemoteAccessSessionResultFromJson(
    Map<String, dynamic> json) {
  return GetRemoteAccessSessionResult(
    remoteAccessSession: json['remoteAccessSession'] == null
        ? null
        : RemoteAccessSession.fromJson(
            json['remoteAccessSession'] as Map<String, dynamic>),
  );
}

GetRunResult _$GetRunResultFromJson(Map<String, dynamic> json) {
  return GetRunResult(
    run: json['run'] == null
        ? null
        : Run.fromJson(json['run'] as Map<String, dynamic>),
  );
}

GetSuiteResult _$GetSuiteResultFromJson(Map<String, dynamic> json) {
  return GetSuiteResult(
    suite: json['suite'] == null
        ? null
        : Suite.fromJson(json['suite'] as Map<String, dynamic>),
  );
}

GetTestGridProjectResult _$GetTestGridProjectResultFromJson(
    Map<String, dynamic> json) {
  return GetTestGridProjectResult(
    testGridProject: json['testGridProject'] == null
        ? null
        : TestGridProject.fromJson(
            json['testGridProject'] as Map<String, dynamic>),
  );
}

GetTestGridSessionResult _$GetTestGridSessionResultFromJson(
    Map<String, dynamic> json) {
  return GetTestGridSessionResult(
    testGridSession: json['testGridSession'] == null
        ? null
        : TestGridSession.fromJson(
            json['testGridSession'] as Map<String, dynamic>),
  );
}

GetTestResult _$GetTestResultFromJson(Map<String, dynamic> json) {
  return GetTestResult(
    test: json['test'] == null
        ? null
        : Test.fromJson(json['test'] as Map<String, dynamic>),
  );
}

GetUploadResult _$GetUploadResultFromJson(Map<String, dynamic> json) {
  return GetUploadResult(
    upload: json['upload'] == null
        ? null
        : Upload.fromJson(json['upload'] as Map<String, dynamic>),
  );
}

GetVPCEConfigurationResult _$GetVPCEConfigurationResultFromJson(
    Map<String, dynamic> json) {
  return GetVPCEConfigurationResult(
    vpceConfiguration: json['vpceConfiguration'] == null
        ? null
        : VPCEConfiguration.fromJson(
            json['vpceConfiguration'] as Map<String, dynamic>),
  );
}

IncompatibilityMessage _$IncompatibilityMessageFromJson(
    Map<String, dynamic> json) {
  return IncompatibilityMessage(
    message: json['message'] as String,
    type: _$enumDecodeNullable(_$DeviceAttributeEnumMap, json['type']),
  );
}

const _$DeviceAttributeEnumMap = {
  DeviceAttribute.arn: 'ARN',
  DeviceAttribute.platform: 'PLATFORM',
  DeviceAttribute.formFactor: 'FORM_FACTOR',
  DeviceAttribute.manufacturer: 'MANUFACTURER',
  DeviceAttribute.remoteAccessEnabled: 'REMOTE_ACCESS_ENABLED',
  DeviceAttribute.remoteDebugEnabled: 'REMOTE_DEBUG_ENABLED',
  DeviceAttribute.appiumVersion: 'APPIUM_VERSION',
  DeviceAttribute.instanceArn: 'INSTANCE_ARN',
  DeviceAttribute.instanceLabels: 'INSTANCE_LABELS',
  DeviceAttribute.fleetType: 'FLEET_TYPE',
  DeviceAttribute.osVersion: 'OS_VERSION',
  DeviceAttribute.model: 'MODEL',
  DeviceAttribute.availability: 'AVAILABILITY',
};

InstallToRemoteAccessSessionResult _$InstallToRemoteAccessSessionResultFromJson(
    Map<String, dynamic> json) {
  return InstallToRemoteAccessSessionResult(
    appUpload: json['appUpload'] == null
        ? null
        : Upload.fromJson(json['appUpload'] as Map<String, dynamic>),
  );
}

InstanceProfile _$InstanceProfileFromJson(Map<String, dynamic> json) {
  return InstanceProfile(
    arn: json['arn'] as String,
    description: json['description'] as String,
    excludeAppPackagesFromCleanup:
        (json['excludeAppPackagesFromCleanup'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    name: json['name'] as String,
    packageCleanup: json['packageCleanup'] as bool,
    rebootAfterUse: json['rebootAfterUse'] as bool,
  );
}

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    arn: json['arn'] as String,
    counters: json['counters'] == null
        ? null
        : Counters.fromJson(json['counters'] as Map<String, dynamic>),
    created: const UnixDateTimeConverter().fromJson(json['created']),
    device: json['device'] == null
        ? null
        : Device.fromJson(json['device'] as Map<String, dynamic>),
    deviceMinutes: json['deviceMinutes'] == null
        ? null
        : DeviceMinutes.fromJson(json['deviceMinutes'] as Map<String, dynamic>),
    instanceArn: json['instanceArn'] as String,
    message: json['message'] as String,
    name: json['name'] as String,
    result: _$enumDecodeNullable(_$ExecutionResultEnumMap, json['result']),
    started: const UnixDateTimeConverter().fromJson(json['started']),
    status: _$enumDecodeNullable(_$ExecutionStatusEnumMap, json['status']),
    stopped: const UnixDateTimeConverter().fromJson(json['stopped']),
    type: _$enumDecodeNullable(_$TestTypeEnumMap, json['type']),
    videoCapture: json['videoCapture'] as bool,
    videoEndpoint: json['videoEndpoint'] as String,
  );
}

const _$ExecutionResultEnumMap = {
  ExecutionResult.pending: 'PENDING',
  ExecutionResult.passed: 'PASSED',
  ExecutionResult.warned: 'WARNED',
  ExecutionResult.failed: 'FAILED',
  ExecutionResult.skipped: 'SKIPPED',
  ExecutionResult.errored: 'ERRORED',
  ExecutionResult.stopped: 'STOPPED',
};

const _$ExecutionStatusEnumMap = {
  ExecutionStatus.pending: 'PENDING',
  ExecutionStatus.pendingConcurrency: 'PENDING_CONCURRENCY',
  ExecutionStatus.pendingDevice: 'PENDING_DEVICE',
  ExecutionStatus.processing: 'PROCESSING',
  ExecutionStatus.scheduling: 'SCHEDULING',
  ExecutionStatus.preparing: 'PREPARING',
  ExecutionStatus.running: 'RUNNING',
  ExecutionStatus.completed: 'COMPLETED',
  ExecutionStatus.stopping: 'STOPPING',
};

const _$TestTypeEnumMap = {
  TestType.builtinFuzz: 'BUILTIN_FUZZ',
  TestType.builtinExplorer: 'BUILTIN_EXPLORER',
  TestType.webPerformanceProfile: 'WEB_PERFORMANCE_PROFILE',
  TestType.appiumJavaJunit: 'APPIUM_JAVA_JUNIT',
  TestType.appiumJavaTestng: 'APPIUM_JAVA_TESTNG',
  TestType.appiumPython: 'APPIUM_PYTHON',
  TestType.appiumNode: 'APPIUM_NODE',
  TestType.appiumRuby: 'APPIUM_RUBY',
  TestType.appiumWebJavaJunit: 'APPIUM_WEB_JAVA_JUNIT',
  TestType.appiumWebJavaTestng: 'APPIUM_WEB_JAVA_TESTNG',
  TestType.appiumWebPython: 'APPIUM_WEB_PYTHON',
  TestType.appiumWebNode: 'APPIUM_WEB_NODE',
  TestType.appiumWebRuby: 'APPIUM_WEB_RUBY',
  TestType.calabash: 'CALABASH',
  TestType.instrumentation: 'INSTRUMENTATION',
  TestType.uiautomation: 'UIAUTOMATION',
  TestType.uiautomator: 'UIAUTOMATOR',
  TestType.xctest: 'XCTEST',
  TestType.xctestUi: 'XCTEST_UI',
  TestType.remoteAccessRecord: 'REMOTE_ACCESS_RECORD',
  TestType.remoteAccessReplay: 'REMOTE_ACCESS_REPLAY',
};

ListArtifactsResult _$ListArtifactsResultFromJson(Map<String, dynamic> json) {
  return ListArtifactsResult(
    artifacts: (json['artifacts'] as List)
        ?.map((e) =>
            e == null ? null : Artifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDeviceInstancesResult _$ListDeviceInstancesResultFromJson(
    Map<String, dynamic> json) {
  return ListDeviceInstancesResult(
    deviceInstances: (json['deviceInstances'] as List)
        ?.map((e) => e == null
            ? null
            : DeviceInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDevicePoolsResult _$ListDevicePoolsResultFromJson(
    Map<String, dynamic> json) {
  return ListDevicePoolsResult(
    devicePools: (json['devicePools'] as List)
        ?.map((e) =>
            e == null ? null : DevicePool.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDevicesResult _$ListDevicesResultFromJson(Map<String, dynamic> json) {
  return ListDevicesResult(
    devices: (json['devices'] as List)
        ?.map((e) =>
            e == null ? null : Device.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListInstanceProfilesResult _$ListInstanceProfilesResultFromJson(
    Map<String, dynamic> json) {
  return ListInstanceProfilesResult(
    instanceProfiles: (json['instanceProfiles'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceProfile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListJobsResult _$ListJobsResultFromJson(Map<String, dynamic> json) {
  return ListJobsResult(
    jobs: (json['jobs'] as List)
        ?.map((e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListNetworkProfilesResult _$ListNetworkProfilesResultFromJson(
    Map<String, dynamic> json) {
  return ListNetworkProfilesResult(
    networkProfiles: (json['networkProfiles'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkProfile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListOfferingPromotionsResult _$ListOfferingPromotionsResultFromJson(
    Map<String, dynamic> json) {
  return ListOfferingPromotionsResult(
    nextToken: json['nextToken'] as String,
    offeringPromotions: (json['offeringPromotions'] as List)
        ?.map((e) => e == null
            ? null
            : OfferingPromotion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListOfferingTransactionsResult _$ListOfferingTransactionsResultFromJson(
    Map<String, dynamic> json) {
  return ListOfferingTransactionsResult(
    nextToken: json['nextToken'] as String,
    offeringTransactions: (json['offeringTransactions'] as List)
        ?.map((e) => e == null
            ? null
            : OfferingTransaction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListOfferingsResult _$ListOfferingsResultFromJson(Map<String, dynamic> json) {
  return ListOfferingsResult(
    nextToken: json['nextToken'] as String,
    offerings: (json['offerings'] as List)
        ?.map((e) =>
            e == null ? null : Offering.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListProjectsResult _$ListProjectsResultFromJson(Map<String, dynamic> json) {
  return ListProjectsResult(
    nextToken: json['nextToken'] as String,
    projects: (json['projects'] as List)
        ?.map((e) =>
            e == null ? null : Project.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRemoteAccessSessionsResult _$ListRemoteAccessSessionsResultFromJson(
    Map<String, dynamic> json) {
  return ListRemoteAccessSessionsResult(
    nextToken: json['nextToken'] as String,
    remoteAccessSessions: (json['remoteAccessSessions'] as List)
        ?.map((e) => e == null
            ? null
            : RemoteAccessSession.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRunsResult _$ListRunsResultFromJson(Map<String, dynamic> json) {
  return ListRunsResult(
    nextToken: json['nextToken'] as String,
    runs: (json['runs'] as List)
        ?.map((e) => e == null ? null : Run.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSamplesResult _$ListSamplesResultFromJson(Map<String, dynamic> json) {
  return ListSamplesResult(
    nextToken: json['nextToken'] as String,
    samples: (json['samples'] as List)
        ?.map((e) =>
            e == null ? null : Sample.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSuitesResult _$ListSuitesResultFromJson(Map<String, dynamic> json) {
  return ListSuitesResult(
    nextToken: json['nextToken'] as String,
    suites: (json['suites'] as List)
        ?.map(
            (e) => e == null ? null : Suite.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTestGridProjectsResult _$ListTestGridProjectsResultFromJson(
    Map<String, dynamic> json) {
  return ListTestGridProjectsResult(
    nextToken: json['nextToken'] as String,
    testGridProjects: (json['testGridProjects'] as List)
        ?.map((e) => e == null
            ? null
            : TestGridProject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTestGridSessionActionsResult _$ListTestGridSessionActionsResultFromJson(
    Map<String, dynamic> json) {
  return ListTestGridSessionActionsResult(
    actions: (json['actions'] as List)
        ?.map((e) => e == null
            ? null
            : TestGridSessionAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTestGridSessionArtifactsResult _$ListTestGridSessionArtifactsResultFromJson(
    Map<String, dynamic> json) {
  return ListTestGridSessionArtifactsResult(
    artifacts: (json['artifacts'] as List)
        ?.map((e) => e == null
            ? null
            : TestGridSessionArtifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTestGridSessionsResult _$ListTestGridSessionsResultFromJson(
    Map<String, dynamic> json) {
  return ListTestGridSessionsResult(
    nextToken: json['nextToken'] as String,
    testGridSessions: (json['testGridSessions'] as List)
        ?.map((e) => e == null
            ? null
            : TestGridSession.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTestsResult _$ListTestsResultFromJson(Map<String, dynamic> json) {
  return ListTestsResult(
    nextToken: json['nextToken'] as String,
    tests: (json['tests'] as List)
        ?.map(
            (e) => e == null ? null : Test.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListUniqueProblemsResult _$ListUniqueProblemsResultFromJson(
    Map<String, dynamic> json) {
  return ListUniqueProblemsResult(
    nextToken: json['nextToken'] as String,
    uniqueProblems: (json['uniqueProblems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          _$enumDecodeNullable(_$ExecutionResultEnumMap, k),
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : UniqueProblem.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
  );
}

ListUploadsResult _$ListUploadsResultFromJson(Map<String, dynamic> json) {
  return ListUploadsResult(
    nextToken: json['nextToken'] as String,
    uploads: (json['uploads'] as List)
        ?.map((e) =>
            e == null ? null : Upload.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListVPCEConfigurationsResult _$ListVPCEConfigurationsResultFromJson(
    Map<String, dynamic> json) {
  return ListVPCEConfigurationsResult(
    nextToken: json['nextToken'] as String,
    vpceConfigurations: (json['vpceConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : VPCEConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  return val;
}

MonetaryAmount _$MonetaryAmountFromJson(Map<String, dynamic> json) {
  return MonetaryAmount(
    amount: (json['amount'] as num)?.toDouble(),
    currencyCode:
        _$enumDecodeNullable(_$CurrencyCodeEnumMap, json['currencyCode']),
  );
}

const _$CurrencyCodeEnumMap = {
  CurrencyCode.usd: 'USD',
};

NetworkProfile _$NetworkProfileFromJson(Map<String, dynamic> json) {
  return NetworkProfile(
    arn: json['arn'] as String,
    description: json['description'] as String,
    downlinkBandwidthBits: json['downlinkBandwidthBits'] as int,
    downlinkDelayMs: json['downlinkDelayMs'] as int,
    downlinkJitterMs: json['downlinkJitterMs'] as int,
    downlinkLossPercent: json['downlinkLossPercent'] as int,
    name: json['name'] as String,
    type: _$enumDecodeNullable(_$NetworkProfileTypeEnumMap, json['type']),
    uplinkBandwidthBits: json['uplinkBandwidthBits'] as int,
    uplinkDelayMs: json['uplinkDelayMs'] as int,
    uplinkJitterMs: json['uplinkJitterMs'] as int,
    uplinkLossPercent: json['uplinkLossPercent'] as int,
  );
}

const _$NetworkProfileTypeEnumMap = {
  NetworkProfileType.curated: 'CURATED',
  NetworkProfileType.private: 'PRIVATE',
};

Offering _$OfferingFromJson(Map<String, dynamic> json) {
  return Offering(
    description: json['description'] as String,
    id: json['id'] as String,
    platform: _$enumDecodeNullable(_$DevicePlatformEnumMap, json['platform']),
    recurringCharges: (json['recurringCharges'] as List)
        ?.map((e) => e == null
            ? null
            : RecurringCharge.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: _$enumDecodeNullable(_$OfferingTypeEnumMap, json['type']),
  );
}

const _$OfferingTypeEnumMap = {
  OfferingType.recurring: 'RECURRING',
};

OfferingPromotion _$OfferingPromotionFromJson(Map<String, dynamic> json) {
  return OfferingPromotion(
    description: json['description'] as String,
    id: json['id'] as String,
  );
}

OfferingStatus _$OfferingStatusFromJson(Map<String, dynamic> json) {
  return OfferingStatus(
    effectiveOn: const UnixDateTimeConverter().fromJson(json['effectiveOn']),
    offering: json['offering'] == null
        ? null
        : Offering.fromJson(json['offering'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
    type: _$enumDecodeNullable(_$OfferingTransactionTypeEnumMap, json['type']),
  );
}

const _$OfferingTransactionTypeEnumMap = {
  OfferingTransactionType.purchase: 'PURCHASE',
  OfferingTransactionType.renew: 'RENEW',
  OfferingTransactionType.system: 'SYSTEM',
};

OfferingTransaction _$OfferingTransactionFromJson(Map<String, dynamic> json) {
  return OfferingTransaction(
    cost: json['cost'] == null
        ? null
        : MonetaryAmount.fromJson(json['cost'] as Map<String, dynamic>),
    createdOn: const UnixDateTimeConverter().fromJson(json['createdOn']),
    offeringPromotionId: json['offeringPromotionId'] as String,
    offeringStatus: json['offeringStatus'] == null
        ? null
        : OfferingStatus.fromJson(
            json['offeringStatus'] as Map<String, dynamic>),
    transactionId: json['transactionId'] as String,
  );
}

Problem _$ProblemFromJson(Map<String, dynamic> json) {
  return Problem(
    device: json['device'] == null
        ? null
        : Device.fromJson(json['device'] as Map<String, dynamic>),
    job: json['job'] == null
        ? null
        : ProblemDetail.fromJson(json['job'] as Map<String, dynamic>),
    message: json['message'] as String,
    result: _$enumDecodeNullable(_$ExecutionResultEnumMap, json['result']),
    run: json['run'] == null
        ? null
        : ProblemDetail.fromJson(json['run'] as Map<String, dynamic>),
    suite: json['suite'] == null
        ? null
        : ProblemDetail.fromJson(json['suite'] as Map<String, dynamic>),
    test: json['test'] == null
        ? null
        : ProblemDetail.fromJson(json['test'] as Map<String, dynamic>),
  );
}

ProblemDetail _$ProblemDetailFromJson(Map<String, dynamic> json) {
  return ProblemDetail(
    arn: json['arn'] as String,
    name: json['name'] as String,
  );
}

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
    arn: json['arn'] as String,
    created: const UnixDateTimeConverter().fromJson(json['created']),
    defaultJobTimeoutMinutes: json['defaultJobTimeoutMinutes'] as int,
    name: json['name'] as String,
  );
}

PurchaseOfferingResult _$PurchaseOfferingResultFromJson(
    Map<String, dynamic> json) {
  return PurchaseOfferingResult(
    offeringTransaction: json['offeringTransaction'] == null
        ? null
        : OfferingTransaction.fromJson(
            json['offeringTransaction'] as Map<String, dynamic>),
  );
}

Radios _$RadiosFromJson(Map<String, dynamic> json) {
  return Radios(
    bluetooth: json['bluetooth'] as bool,
    gps: json['gps'] as bool,
    nfc: json['nfc'] as bool,
    wifi: json['wifi'] as bool,
  );
}

Map<String, dynamic> _$RadiosToJson(Radios instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bluetooth', instance.bluetooth);
  writeNotNull('gps', instance.gps);
  writeNotNull('nfc', instance.nfc);
  writeNotNull('wifi', instance.wifi);
  return val;
}

RecurringCharge _$RecurringChargeFromJson(Map<String, dynamic> json) {
  return RecurringCharge(
    cost: json['cost'] == null
        ? null
        : MonetaryAmount.fromJson(json['cost'] as Map<String, dynamic>),
    frequency: _$enumDecodeNullable(
        _$RecurringChargeFrequencyEnumMap, json['frequency']),
  );
}

const _$RecurringChargeFrequencyEnumMap = {
  RecurringChargeFrequency.monthly: 'MONTHLY',
};

RemoteAccessSession _$RemoteAccessSessionFromJson(Map<String, dynamic> json) {
  return RemoteAccessSession(
    arn: json['arn'] as String,
    billingMethod:
        _$enumDecodeNullable(_$BillingMethodEnumMap, json['billingMethod']),
    clientId: json['clientId'] as String,
    created: const UnixDateTimeConverter().fromJson(json['created']),
    device: json['device'] == null
        ? null
        : Device.fromJson(json['device'] as Map<String, dynamic>),
    deviceMinutes: json['deviceMinutes'] == null
        ? null
        : DeviceMinutes.fromJson(json['deviceMinutes'] as Map<String, dynamic>),
    deviceUdid: json['deviceUdid'] as String,
    endpoint: json['endpoint'] as String,
    hostAddress: json['hostAddress'] as String,
    instanceArn: json['instanceArn'] as String,
    interactionMode:
        _$enumDecodeNullable(_$InteractionModeEnumMap, json['interactionMode']),
    message: json['message'] as String,
    name: json['name'] as String,
    remoteDebugEnabled: json['remoteDebugEnabled'] as bool,
    remoteRecordAppArn: json['remoteRecordAppArn'] as String,
    remoteRecordEnabled: json['remoteRecordEnabled'] as bool,
    result: _$enumDecodeNullable(_$ExecutionResultEnumMap, json['result']),
    skipAppResign: json['skipAppResign'] as bool,
    started: const UnixDateTimeConverter().fromJson(json['started']),
    status: _$enumDecodeNullable(_$ExecutionStatusEnumMap, json['status']),
    stopped: const UnixDateTimeConverter().fromJson(json['stopped']),
  );
}

const _$InteractionModeEnumMap = {
  InteractionMode.interactive: 'INTERACTIVE',
  InteractionMode.noVideo: 'NO_VIDEO',
  InteractionMode.videoOnly: 'VIDEO_ONLY',
};

RenewOfferingResult _$RenewOfferingResultFromJson(Map<String, dynamic> json) {
  return RenewOfferingResult(
    offeringTransaction: json['offeringTransaction'] == null
        ? null
        : OfferingTransaction.fromJson(
            json['offeringTransaction'] as Map<String, dynamic>),
  );
}

Resolution _$ResolutionFromJson(Map<String, dynamic> json) {
  return Resolution(
    height: json['height'] as int,
    width: json['width'] as int,
  );
}

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
    attribute:
        _$enumDecodeNullable(_$DeviceAttributeEnumMap, json['attribute']),
    operator: _$enumDecodeNullable(_$RuleOperatorEnumMap, json['operator']),
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$RuleToJson(Rule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attribute', _$DeviceAttributeEnumMap[instance.attribute]);
  writeNotNull('operator', _$RuleOperatorEnumMap[instance.operator]);
  writeNotNull('value', instance.value);
  return val;
}

Run _$RunFromJson(Map<String, dynamic> json) {
  return Run(
    appUpload: json['appUpload'] as String,
    arn: json['arn'] as String,
    billingMethod:
        _$enumDecodeNullable(_$BillingMethodEnumMap, json['billingMethod']),
    completedJobs: json['completedJobs'] as int,
    counters: json['counters'] == null
        ? null
        : Counters.fromJson(json['counters'] as Map<String, dynamic>),
    created: const UnixDateTimeConverter().fromJson(json['created']),
    customerArtifactPaths: json['customerArtifactPaths'] == null
        ? null
        : CustomerArtifactPaths.fromJson(
            json['customerArtifactPaths'] as Map<String, dynamic>),
    deviceMinutes: json['deviceMinutes'] == null
        ? null
        : DeviceMinutes.fromJson(json['deviceMinutes'] as Map<String, dynamic>),
    devicePoolArn: json['devicePoolArn'] as String,
    deviceSelectionResult: json['deviceSelectionResult'] == null
        ? null
        : DeviceSelectionResult.fromJson(
            json['deviceSelectionResult'] as Map<String, dynamic>),
    eventCount: json['eventCount'] as int,
    jobTimeoutMinutes: json['jobTimeoutMinutes'] as int,
    locale: json['locale'] as String,
    location: json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    message: json['message'] as String,
    name: json['name'] as String,
    networkProfile: json['networkProfile'] == null
        ? null
        : NetworkProfile.fromJson(
            json['networkProfile'] as Map<String, dynamic>),
    parsingResultUrl: json['parsingResultUrl'] as String,
    platform: _$enumDecodeNullable(_$DevicePlatformEnumMap, json['platform']),
    radios: json['radios'] == null
        ? null
        : Radios.fromJson(json['radios'] as Map<String, dynamic>),
    result: _$enumDecodeNullable(_$ExecutionResultEnumMap, json['result']),
    resultCode:
        _$enumDecodeNullable(_$ExecutionResultCodeEnumMap, json['resultCode']),
    seed: json['seed'] as int,
    skipAppResign: json['skipAppResign'] as bool,
    started: const UnixDateTimeConverter().fromJson(json['started']),
    status: _$enumDecodeNullable(_$ExecutionStatusEnumMap, json['status']),
    stopped: const UnixDateTimeConverter().fromJson(json['stopped']),
    testSpecArn: json['testSpecArn'] as String,
    totalJobs: json['totalJobs'] as int,
    type: _$enumDecodeNullable(_$TestTypeEnumMap, json['type']),
    webUrl: json['webUrl'] as String,
  );
}

const _$ExecutionResultCodeEnumMap = {
  ExecutionResultCode.parsingFailed: 'PARSING_FAILED',
  ExecutionResultCode.vpcEndpointSetupFailed: 'VPC_ENDPOINT_SETUP_FAILED',
};

Sample _$SampleFromJson(Map<String, dynamic> json) {
  return Sample(
    arn: json['arn'] as String,
    type: _$enumDecodeNullable(_$SampleTypeEnumMap, json['type']),
    url: json['url'] as String,
  );
}

const _$SampleTypeEnumMap = {
  SampleType.cpu: 'CPU',
  SampleType.memory: 'MEMORY',
  SampleType.threads: 'THREADS',
  SampleType.rxRate: 'RX_RATE',
  SampleType.txRate: 'TX_RATE',
  SampleType.rx: 'RX',
  SampleType.tx: 'TX',
  SampleType.nativeFrames: 'NATIVE_FRAMES',
  SampleType.nativeFps: 'NATIVE_FPS',
  SampleType.nativeMinDrawtime: 'NATIVE_MIN_DRAWTIME',
  SampleType.nativeAvgDrawtime: 'NATIVE_AVG_DRAWTIME',
  SampleType.nativeMaxDrawtime: 'NATIVE_MAX_DRAWTIME',
  SampleType.openglFrames: 'OPENGL_FRAMES',
  SampleType.openglFps: 'OPENGL_FPS',
  SampleType.openglMinDrawtime: 'OPENGL_MIN_DRAWTIME',
  SampleType.openglAvgDrawtime: 'OPENGL_AVG_DRAWTIME',
  SampleType.openglMaxDrawtime: 'OPENGL_MAX_DRAWTIME',
};

Map<String, dynamic> _$ScheduleRunConfigurationToJson(
    ScheduleRunConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('auxiliaryApps', instance.auxiliaryApps);
  writeNotNull('billingMethod', _$BillingMethodEnumMap[instance.billingMethod]);
  writeNotNull(
      'customerArtifactPaths', instance.customerArtifactPaths?.toJson());
  writeNotNull('extraDataPackageArn', instance.extraDataPackageArn);
  writeNotNull('locale', instance.locale);
  writeNotNull('location', instance.location?.toJson());
  writeNotNull('networkProfileArn', instance.networkProfileArn);
  writeNotNull('radios', instance.radios?.toJson());
  writeNotNull('vpceConfigurationArns', instance.vpceConfigurationArns);
  return val;
}

ScheduleRunResult _$ScheduleRunResultFromJson(Map<String, dynamic> json) {
  return ScheduleRunResult(
    run: json['run'] == null
        ? null
        : Run.fromJson(json['run'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScheduleRunTestToJson(ScheduleRunTest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$TestTypeEnumMap[instance.type]);
  writeNotNull('filter', instance.filter);
  writeNotNull('parameters', instance.parameters);
  writeNotNull('testPackageArn', instance.testPackageArn);
  writeNotNull('testSpecArn', instance.testSpecArn);
  return val;
}

StopJobResult _$StopJobResultFromJson(Map<String, dynamic> json) {
  return StopJobResult(
    job: json['job'] == null
        ? null
        : Job.fromJson(json['job'] as Map<String, dynamic>),
  );
}

StopRemoteAccessSessionResult _$StopRemoteAccessSessionResultFromJson(
    Map<String, dynamic> json) {
  return StopRemoteAccessSessionResult(
    remoteAccessSession: json['remoteAccessSession'] == null
        ? null
        : RemoteAccessSession.fromJson(
            json['remoteAccessSession'] as Map<String, dynamic>),
  );
}

StopRunResult _$StopRunResultFromJson(Map<String, dynamic> json) {
  return StopRunResult(
    run: json['run'] == null
        ? null
        : Run.fromJson(json['run'] as Map<String, dynamic>),
  );
}

Suite _$SuiteFromJson(Map<String, dynamic> json) {
  return Suite(
    arn: json['arn'] as String,
    counters: json['counters'] == null
        ? null
        : Counters.fromJson(json['counters'] as Map<String, dynamic>),
    created: const UnixDateTimeConverter().fromJson(json['created']),
    deviceMinutes: json['deviceMinutes'] == null
        ? null
        : DeviceMinutes.fromJson(json['deviceMinutes'] as Map<String, dynamic>),
    message: json['message'] as String,
    name: json['name'] as String,
    result: _$enumDecodeNullable(_$ExecutionResultEnumMap, json['result']),
    started: const UnixDateTimeConverter().fromJson(json['started']),
    status: _$enumDecodeNullable(_$ExecutionStatusEnumMap, json['status']),
    stopped: const UnixDateTimeConverter().fromJson(json['stopped']),
    type: _$enumDecodeNullable(_$TestTypeEnumMap, json['type']),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Test _$TestFromJson(Map<String, dynamic> json) {
  return Test(
    arn: json['arn'] as String,
    counters: json['counters'] == null
        ? null
        : Counters.fromJson(json['counters'] as Map<String, dynamic>),
    created: const UnixDateTimeConverter().fromJson(json['created']),
    deviceMinutes: json['deviceMinutes'] == null
        ? null
        : DeviceMinutes.fromJson(json['deviceMinutes'] as Map<String, dynamic>),
    message: json['message'] as String,
    name: json['name'] as String,
    result: _$enumDecodeNullable(_$ExecutionResultEnumMap, json['result']),
    started: const UnixDateTimeConverter().fromJson(json['started']),
    status: _$enumDecodeNullable(_$ExecutionStatusEnumMap, json['status']),
    stopped: const UnixDateTimeConverter().fromJson(json['stopped']),
    type: _$enumDecodeNullable(_$TestTypeEnumMap, json['type']),
  );
}

TestGridProject _$TestGridProjectFromJson(Map<String, dynamic> json) {
  return TestGridProject(
    arn: json['arn'] as String,
    created: const UnixDateTimeConverter().fromJson(json['created']),
    description: json['description'] as String,
    name: json['name'] as String,
  );
}

TestGridSession _$TestGridSessionFromJson(Map<String, dynamic> json) {
  return TestGridSession(
    arn: json['arn'] as String,
    billingMinutes: (json['billingMinutes'] as num)?.toDouble(),
    created: const UnixDateTimeConverter().fromJson(json['created']),
    ended: const UnixDateTimeConverter().fromJson(json['ended']),
    seleniumProperties: json['seleniumProperties'] as String,
    status:
        _$enumDecodeNullable(_$TestGridSessionStatusEnumMap, json['status']),
  );
}

const _$TestGridSessionStatusEnumMap = {
  TestGridSessionStatus.active: 'ACTIVE',
  TestGridSessionStatus.closed: 'CLOSED',
  TestGridSessionStatus.errored: 'ERRORED',
};

TestGridSessionAction _$TestGridSessionActionFromJson(
    Map<String, dynamic> json) {
  return TestGridSessionAction(
    action: json['action'] as String,
    duration: json['duration'] as int,
    requestMethod: json['requestMethod'] as String,
    started: const UnixDateTimeConverter().fromJson(json['started']),
    statusCode: json['statusCode'] as String,
  );
}

TestGridSessionArtifact _$TestGridSessionArtifactFromJson(
    Map<String, dynamic> json) {
  return TestGridSessionArtifact(
    filename: json['filename'] as String,
    type: _$enumDecodeNullable(
        _$TestGridSessionArtifactTypeEnumMap, json['type']),
    url: json['url'] as String,
  );
}

const _$TestGridSessionArtifactTypeEnumMap = {
  TestGridSessionArtifactType.unknown: 'UNKNOWN',
  TestGridSessionArtifactType.video: 'VIDEO',
  TestGridSessionArtifactType.seleniumLog: 'SELENIUM_LOG',
};

TrialMinutes _$TrialMinutesFromJson(Map<String, dynamic> json) {
  return TrialMinutes(
    remaining: (json['remaining'] as num)?.toDouble(),
    total: (json['total'] as num)?.toDouble(),
  );
}

UniqueProblem _$UniqueProblemFromJson(Map<String, dynamic> json) {
  return UniqueProblem(
    message: json['message'] as String,
    problems: (json['problems'] as List)
        ?.map((e) =>
            e == null ? null : Problem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateDeviceInstanceResult _$UpdateDeviceInstanceResultFromJson(
    Map<String, dynamic> json) {
  return UpdateDeviceInstanceResult(
    deviceInstance: json['deviceInstance'] == null
        ? null
        : DeviceInstance.fromJson(
            json['deviceInstance'] as Map<String, dynamic>),
  );
}

UpdateDevicePoolResult _$UpdateDevicePoolResultFromJson(
    Map<String, dynamic> json) {
  return UpdateDevicePoolResult(
    devicePool: json['devicePool'] == null
        ? null
        : DevicePool.fromJson(json['devicePool'] as Map<String, dynamic>),
  );
}

UpdateInstanceProfileResult _$UpdateInstanceProfileResultFromJson(
    Map<String, dynamic> json) {
  return UpdateInstanceProfileResult(
    instanceProfile: json['instanceProfile'] == null
        ? null
        : InstanceProfile.fromJson(
            json['instanceProfile'] as Map<String, dynamic>),
  );
}

UpdateNetworkProfileResult _$UpdateNetworkProfileResultFromJson(
    Map<String, dynamic> json) {
  return UpdateNetworkProfileResult(
    networkProfile: json['networkProfile'] == null
        ? null
        : NetworkProfile.fromJson(
            json['networkProfile'] as Map<String, dynamic>),
  );
}

UpdateProjectResult _$UpdateProjectResultFromJson(Map<String, dynamic> json) {
  return UpdateProjectResult(
    project: json['project'] == null
        ? null
        : Project.fromJson(json['project'] as Map<String, dynamic>),
  );
}

UpdateTestGridProjectResult _$UpdateTestGridProjectResultFromJson(
    Map<String, dynamic> json) {
  return UpdateTestGridProjectResult(
    testGridProject: json['testGridProject'] == null
        ? null
        : TestGridProject.fromJson(
            json['testGridProject'] as Map<String, dynamic>),
  );
}

UpdateUploadResult _$UpdateUploadResultFromJson(Map<String, dynamic> json) {
  return UpdateUploadResult(
    upload: json['upload'] == null
        ? null
        : Upload.fromJson(json['upload'] as Map<String, dynamic>),
  );
}

UpdateVPCEConfigurationResult _$UpdateVPCEConfigurationResultFromJson(
    Map<String, dynamic> json) {
  return UpdateVPCEConfigurationResult(
    vpceConfiguration: json['vpceConfiguration'] == null
        ? null
        : VPCEConfiguration.fromJson(
            json['vpceConfiguration'] as Map<String, dynamic>),
  );
}

Upload _$UploadFromJson(Map<String, dynamic> json) {
  return Upload(
    arn: json['arn'] as String,
    category: _$enumDecodeNullable(_$UploadCategoryEnumMap, json['category']),
    contentType: json['contentType'] as String,
    created: const UnixDateTimeConverter().fromJson(json['created']),
    message: json['message'] as String,
    metadata: json['metadata'] as String,
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$UploadStatusEnumMap, json['status']),
    type: _$enumDecodeNullable(_$UploadTypeEnumMap, json['type']),
    url: json['url'] as String,
  );
}

const _$UploadCategoryEnumMap = {
  UploadCategory.curated: 'CURATED',
  UploadCategory.private: 'PRIVATE',
};

const _$UploadStatusEnumMap = {
  UploadStatus.initialized: 'INITIALIZED',
  UploadStatus.processing: 'PROCESSING',
  UploadStatus.succeeded: 'SUCCEEDED',
  UploadStatus.failed: 'FAILED',
};

const _$UploadTypeEnumMap = {
  UploadType.androidApp: 'ANDROID_APP',
  UploadType.iosApp: 'IOS_APP',
  UploadType.webApp: 'WEB_APP',
  UploadType.externalData: 'EXTERNAL_DATA',
  UploadType.appiumJavaJunitTestPackage: 'APPIUM_JAVA_JUNIT_TEST_PACKAGE',
  UploadType.appiumJavaTestngTestPackage: 'APPIUM_JAVA_TESTNG_TEST_PACKAGE',
  UploadType.appiumPythonTestPackage: 'APPIUM_PYTHON_TEST_PACKAGE',
  UploadType.appiumNodeTestPackage: 'APPIUM_NODE_TEST_PACKAGE',
  UploadType.appiumRubyTestPackage: 'APPIUM_RUBY_TEST_PACKAGE',
  UploadType.appiumWebJavaJunitTestPackage:
      'APPIUM_WEB_JAVA_JUNIT_TEST_PACKAGE',
  UploadType.appiumWebJavaTestngTestPackage:
      'APPIUM_WEB_JAVA_TESTNG_TEST_PACKAGE',
  UploadType.appiumWebPythonTestPackage: 'APPIUM_WEB_PYTHON_TEST_PACKAGE',
  UploadType.appiumWebNodeTestPackage: 'APPIUM_WEB_NODE_TEST_PACKAGE',
  UploadType.appiumWebRubyTestPackage: 'APPIUM_WEB_RUBY_TEST_PACKAGE',
  UploadType.calabashTestPackage: 'CALABASH_TEST_PACKAGE',
  UploadType.instrumentationTestPackage: 'INSTRUMENTATION_TEST_PACKAGE',
  UploadType.uiautomationTestPackage: 'UIAUTOMATION_TEST_PACKAGE',
  UploadType.uiautomatorTestPackage: 'UIAUTOMATOR_TEST_PACKAGE',
  UploadType.xctestTestPackage: 'XCTEST_TEST_PACKAGE',
  UploadType.xctestUiTestPackage: 'XCTEST_UI_TEST_PACKAGE',
  UploadType.appiumJavaJunitTestSpec: 'APPIUM_JAVA_JUNIT_TEST_SPEC',
  UploadType.appiumJavaTestngTestSpec: 'APPIUM_JAVA_TESTNG_TEST_SPEC',
  UploadType.appiumPythonTestSpec: 'APPIUM_PYTHON_TEST_SPEC',
  UploadType.appiumNodeTestSpec: 'APPIUM_NODE_TEST_SPEC',
  UploadType.appiumRubyTestSpec: 'APPIUM_RUBY_TEST_SPEC',
  UploadType.appiumWebJavaJunitTestSpec: 'APPIUM_WEB_JAVA_JUNIT_TEST_SPEC',
  UploadType.appiumWebJavaTestngTestSpec: 'APPIUM_WEB_JAVA_TESTNG_TEST_SPEC',
  UploadType.appiumWebPythonTestSpec: 'APPIUM_WEB_PYTHON_TEST_SPEC',
  UploadType.appiumWebNodeTestSpec: 'APPIUM_WEB_NODE_TEST_SPEC',
  UploadType.appiumWebRubyTestSpec: 'APPIUM_WEB_RUBY_TEST_SPEC',
  UploadType.instrumentationTestSpec: 'INSTRUMENTATION_TEST_SPEC',
  UploadType.xctestUiTestSpec: 'XCTEST_UI_TEST_SPEC',
};

VPCEConfiguration _$VPCEConfigurationFromJson(Map<String, dynamic> json) {
  return VPCEConfiguration(
    arn: json['arn'] as String,
    serviceDnsName: json['serviceDnsName'] as String,
    vpceConfigurationDescription:
        json['vpceConfigurationDescription'] as String,
    vpceConfigurationName: json['vpceConfigurationName'] as String,
    vpceServiceName: json['vpceServiceName'] as String,
  );
}
