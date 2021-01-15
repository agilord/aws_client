// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2012-06-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AccessLogToJson(AccessLog instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('Timeout', instance.timeout);
  return val;
}

Map<String, dynamic> _$ConnectionSettingsToJson(ConnectionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IdleTimeout', instance.idleTimeout);
  return val;
}

Map<String, dynamic> _$CrossZoneLoadBalancingToJson(
    CrossZoneLoadBalancing instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

Map<String, dynamic> _$HealthCheckToJson(HealthCheck instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HealthyThreshold', instance.healthyThreshold);
  writeNotNull('Interval', instance.interval);
  writeNotNull('Target', instance.target);
  writeNotNull('Timeout', instance.timeout);
  writeNotNull('UnhealthyThreshold', instance.unhealthyThreshold);
  return val;
}

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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstancePort', instance.instancePort);
  writeNotNull('LoadBalancerPort', instance.loadBalancerPort);
  writeNotNull('Protocol', instance.protocol);
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
      instance.additionalAttributes?.map((e) => e?.toJson())?.toList());
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
