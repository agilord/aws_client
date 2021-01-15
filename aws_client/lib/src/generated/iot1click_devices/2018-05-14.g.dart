// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-05-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attributes _$AttributesFromJson(Map<String, dynamic> json) {
  return Attributes();
}

ClaimDevicesByClaimCodeResponse _$ClaimDevicesByClaimCodeResponseFromJson(
    Map<String, dynamic> json) {
  return ClaimDevicesByClaimCodeResponse(
    claimCode: json['claimCode'] as String,
    total: json['total'] as int,
  );
}

DescribeDeviceResponse _$DescribeDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDeviceResponse(
    deviceDescription: json['deviceDescription'] == null
        ? null
        : DeviceDescription.fromJson(
            json['deviceDescription'] as Map<String, dynamic>),
  );
}

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    attributes: json['attributes'] == null
        ? null
        : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    deviceId: json['deviceId'] as String,
    type: json['type'] as String,
  );
}

DeviceDescription _$DeviceDescriptionFromJson(Map<String, dynamic> json) {
  return DeviceDescription(
    arn: json['arn'] as String,
    attributes: (json['attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    deviceId: json['deviceId'] as String,
    enabled: json['enabled'] as bool,
    remainingLife: (json['remainingLife'] as num)?.toDouble(),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: json['type'] as String,
  );
}

DeviceEvent _$DeviceEventFromJson(Map<String, dynamic> json) {
  return DeviceEvent(
    device: json['device'] == null
        ? null
        : Device.fromJson(json['device'] as Map<String, dynamic>),
    stdEvent: json['stdEvent'] as String,
  );
}

DeviceMethod _$DeviceMethodFromJson(Map<String, dynamic> json) {
  return DeviceMethod(
    deviceType: json['deviceType'] as String,
    methodName: json['methodName'] as String,
  );
}

Map<String, dynamic> _$DeviceMethodToJson(DeviceMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deviceType', instance.deviceType);
  writeNotNull('methodName', instance.methodName);
  return val;
}

FinalizeDeviceClaimResponse _$FinalizeDeviceClaimResponseFromJson(
    Map<String, dynamic> json) {
  return FinalizeDeviceClaimResponse(
    state: json['state'] as String,
  );
}

GetDeviceMethodsResponse _$GetDeviceMethodsResponseFromJson(
    Map<String, dynamic> json) {
  return GetDeviceMethodsResponse(
    deviceMethods: (json['deviceMethods'] as List)
        ?.map((e) =>
            e == null ? null : DeviceMethod.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

InitiateDeviceClaimResponse _$InitiateDeviceClaimResponseFromJson(
    Map<String, dynamic> json) {
  return InitiateDeviceClaimResponse(
    state: json['state'] as String,
  );
}

InvokeDeviceMethodResponse _$InvokeDeviceMethodResponseFromJson(
    Map<String, dynamic> json) {
  return InvokeDeviceMethodResponse(
    deviceMethodResponse: json['deviceMethodResponse'] as String,
  );
}

ListDeviceEventsResponse _$ListDeviceEventsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDeviceEventsResponse(
    events: (json['events'] as List)
        ?.map((e) =>
            e == null ? null : DeviceEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDevicesResponse _$ListDevicesResponseFromJson(Map<String, dynamic> json) {
  return ListDevicesResponse(
    devices: (json['devices'] as List)
        ?.map((e) => e == null
            ? null
            : DeviceDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
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

UnclaimDeviceResponse _$UnclaimDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return UnclaimDeviceResponse(
    state: json['state'] as String,
  );
}

UpdateDeviceStateResponse _$UpdateDeviceStateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDeviceStateResponse();
}
