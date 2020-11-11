// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ec2-instance-connect-2018-04-02.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SendSSHPublicKeyRequestToJson(
    SendSSHPublicKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AvailabilityZone', instance.availabilityZone);
  writeNotNull('InstanceId', instance.instanceId);
  writeNotNull('InstanceOSUser', instance.instanceOSUser);
  writeNotNull('SSHPublicKey', instance.sSHPublicKey);
  return val;
}

SendSSHPublicKeyResponse _$SendSSHPublicKeyResponseFromJson(
    Map<String, dynamic> json) {
  return SendSSHPublicKeyResponse(
    requestId: json['RequestId'] as String,
    success: json['Success'] as bool,
  );
}
