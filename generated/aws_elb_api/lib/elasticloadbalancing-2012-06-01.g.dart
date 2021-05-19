// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elasticloadbalancing-2012-06-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AccessLogToJson(AccessLog instance) {
  final val = <String, dynamic>{
    'Enabled': instance.enabled,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EmitInterval', instance.emitInterval);
  writeNotNull('S3BucketName', instance.s3BucketName);
  writeNotNull('S3BucketPrefix', instance.s3BucketPrefix);
  return val;
}

Map<String, dynamic> _$AdditionalAttributeToJson(AdditionalAttribute instance) {
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

Map<String, dynamic> _$ConnectionDrainingToJson(ConnectionDraining instance) {
  final val = <String, dynamic>{
    'Enabled': instance.enabled,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Timeout', instance.timeout);
  return val;
}

Map<String, dynamic> _$ConnectionSettingsToJson(ConnectionSettings instance) =>
    <String, dynamic>{
      'IdleTimeout': instance.idleTimeout,
    };

Map<String, dynamic> _$CrossZoneLoadBalancingToJson(
        CrossZoneLoadBalancing instance) =>
    <String, dynamic>{
      'Enabled': instance.enabled,
    };

Map<String, dynamic> _$HealthCheckToJson(HealthCheck instance) =>
    <String, dynamic>{
      'HealthyThreshold': instance.healthyThreshold,
      'Interval': instance.interval,
      'Target': instance.target,
      'Timeout': instance.timeout,
      'UnhealthyThreshold': instance.unhealthyThreshold,
    };

Map<String, dynamic> _$InstanceToJson(Instance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceId', instance.instanceId);
  return val;
}

Map<String, dynamic> _$ListenerToJson(Listener instance) {
  final val = <String, dynamic>{
    'InstancePort': instance.instancePort,
    'LoadBalancerPort': instance.loadBalancerPort,
    'Protocol': instance.protocol,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceProtocol', instance.instanceProtocol);
  writeNotNull('SSLCertificateId', instance.sSLCertificateId);
  return val;
}

Map<String, dynamic> _$LoadBalancerAttributesToJson(
    LoadBalancerAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessLog', instance.accessLog?.toJson());
  writeNotNull('AdditionalAttributes',
      instance.additionalAttributes?.map((e) => e.toJson()).toList());
  writeNotNull('ConnectionDraining', instance.connectionDraining?.toJson());
  writeNotNull('ConnectionSettings', instance.connectionSettings?.toJson());
  writeNotNull(
      'CrossZoneLoadBalancing', instance.crossZoneLoadBalancing?.toJson());
  return val;
}

Map<String, dynamic> _$PolicyAttributeToJson(PolicyAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('AttributeValue', instance.attributeValue);
  return val;
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{
    'Key': instance.key,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$TagKeyOnlyToJson(TagKeyOnly instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  return val;
}
